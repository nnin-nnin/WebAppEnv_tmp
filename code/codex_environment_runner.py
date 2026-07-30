#!/usr/bin/env python3
"""Run the all-in-one application prompt through Codex and record execution usage."""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import signal
import subprocess
import sys
import time
from collections import Counter
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Iterable, Mapping


RUNNER_VERSION = "1.0"
PLACEHOLDERS = {
    "APPLICATION": "application",
    "VERSION": "version",
    "SOURCE_REPOSITORY": "source_repository",
    "COMMIT": "commit",
    "IMAGE_NAME": "image_name",
    "HOST_PORT": "host_port",
    "ADMIN_USERNAME": "admin_username",
    "ADMIN_PASSWORD": "admin_password",
}


class RunnerError(RuntimeError):
    """Raised when the runner cannot prepare or execute a Codex run."""


def local_timestamp() -> str:
    return datetime.now().astimezone().isoformat(timespec="milliseconds")


def resolve_path(value: str | Path, base_dir: Path) -> Path:
    path = Path(value).expanduser()
    return path if path.is_absolute() else (base_dir / path).resolve()


def first_int(mapping: Mapping[str, Any], *keys: str) -> int:
    for key in keys:
        value = mapping.get(key)
        if isinstance(value, bool):
            continue
        if isinstance(value, (int, float)):
            return int(value)
    return 0


@dataclass
class TokenUsage:
    input_tokens: int = 0
    cached_input_tokens: int = 0
    output_tokens: int = 0
    reasoning_output_tokens: int = 0
    total_tokens: int = 0

    @classmethod
    def from_mapping(cls, value: Any) -> "TokenUsage | None":
        if not isinstance(value, Mapping):
            return None

        input_details = value.get("input_tokens_details")
        output_details = value.get("output_tokens_details")
        cached = first_int(value, "cached_input_tokens", "cache_read_input_tokens")
        reasoning = first_int(value, "reasoning_output_tokens")
        if isinstance(input_details, Mapping):
            cached = cached or first_int(input_details, "cached_tokens", "cache_read_tokens")
        if isinstance(output_details, Mapping):
            reasoning = reasoning or first_int(output_details, "reasoning_tokens")

        usage = cls(
            input_tokens=first_int(value, "input_tokens", "prompt_tokens"),
            cached_input_tokens=cached,
            output_tokens=first_int(value, "output_tokens", "completion_tokens"),
            reasoning_output_tokens=reasoning,
            total_tokens=first_int(value, "total_tokens"),
        )
        if not any(
            (
                usage.input_tokens,
                usage.cached_input_tokens,
                usage.output_tokens,
                usage.reasoning_output_tokens,
                usage.total_tokens,
            )
        ):
            return None
        if usage.total_tokens == 0:
            usage.total_tokens = usage.input_tokens + usage.output_tokens
        return usage

    def add(self, other: "TokenUsage") -> None:
        self.input_tokens += other.input_tokens
        self.cached_input_tokens += other.cached_input_tokens
        self.output_tokens += other.output_tokens
        self.reasoning_output_tokens += other.reasoning_output_tokens
        self.total_tokens += other.total_tokens

    def as_dict(self) -> dict[str, int]:
        return {
            "input_tokens": self.input_tokens,
            "cached_input_tokens": self.cached_input_tokens,
            "output_tokens": self.output_tokens,
            "reasoning_output_tokens": self.reasoning_output_tokens,
            "total_tokens": self.total_tokens,
        }


@dataclass
class UsageCollector:
    """Handle both current Codex turn events and older token_count events."""

    event_counts: Counter[str] = field(default_factory=Counter)
    turn_usages: list[TokenUsage] = field(default_factory=list)
    latest_total_usage: TokenUsage | None = None
    latest_last_usage: TokenUsage | None = None
    thread_id: str | None = None

    def consume(self, event: Mapping[str, Any]) -> None:
        event_type = event.get("type")
        if isinstance(event_type, str):
            self.event_counts[event_type] += 1
        if event_type == "thread.started":
            thread_id = event.get("thread_id")
            if isinstance(thread_id, str):
                self.thread_id = thread_id

        if event_type in {"turn.completed", "response.completed"}:
            usage = TokenUsage.from_mapping(event.get("usage"))
            if usage is not None:
                self.turn_usages.append(usage)
            return

        if event_type != "event_msg":
            return
        payload = event.get("payload")
        if not isinstance(payload, Mapping) or payload.get("type") != "token_count":
            return
        info = payload.get("info")
        if not isinstance(info, Mapping):
            return
        total = TokenUsage.from_mapping(info.get("total_token_usage"))
        last = TokenUsage.from_mapping(info.get("last_token_usage"))
        if total is not None:
            self.latest_total_usage = total
        if last is not None:
            self.latest_last_usage = last

    def final_usage(self) -> tuple[TokenUsage, str]:
        if self.turn_usages:
            result = TokenUsage()
            for usage in self.turn_usages:
                result.add(usage)
            return result, "turn.completed"
        if self.latest_total_usage is not None:
            return self.latest_total_usage, "event_msg.token_count.total_token_usage"
        if self.latest_last_usage is not None:
            return self.latest_last_usage, "event_msg.token_count.last_token_usage"
        return TokenUsage(), "unavailable"


def render_prompt(template: str, values: Mapping[str, str]) -> str:
    rendered = template
    for placeholder, value_key in PLACEHOLDERS.items():
        rendered = rendered.replace(f"[{placeholder}]", values[value_key])

    unresolved = sorted(set(re.findall(r"\[(?:APPLICATION|VERSION|SOURCE_REPOSITORY|COMMIT|IMAGE_NAME|HOST_PORT|ADMIN_USERNAME|ADMIN_PASSWORD)\]", rendered)))
    if unresolved:
        raise RunnerError(f"Prompt contains unresolved placeholders: {', '.join(unresolved)}")
    return rendered


def normalize_output(value: str | bytes | None) -> str:
    if value is None:
        return ""
    if isinstance(value, bytes):
        return value.decode("utf-8", errors="replace")
    return value


def terminate_process(process: subprocess.Popen[str]) -> None:
    if process.poll() is not None:
        return
    if os.name == "posix":
        try:
            os.killpg(process.pid, signal.SIGTERM)
            return
        except ProcessLookupError:
            return
    process.terminate()


def parse_events(output: str, collector: UsageCollector, event_log: Path) -> int:
    parsed = 0
    with event_log.open("w", encoding="utf-8") as handle:
        handle.write(output)
    for line in output.splitlines():
        try:
            event = json.loads(line)
        except json.JSONDecodeError:
            continue
        if isinstance(event, Mapping):
            collector.consume(event)
            parsed += 1
    return parsed


def make_parser(repo_root: Path) -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Run the all-in-one application prompt through Codex and record time/token usage."
    )
    parser.add_argument("--application", required=True, help="Application name, for example EspoCRM")
    parser.add_argument("--version", required=True, help="Fixed application version or commit label")
    parser.add_argument("--source-repository", required=True, help="Immutable source repository URL")
    parser.add_argument("--commit", required=True, help="Fixed source commit")
    parser.add_argument("--image-name", required=True, help="Final image name without the tag")
    parser.add_argument("--host-port", required=True, help="Host port exposed by the application")
    parser.add_argument("--admin-username", default="admin")
    parser.add_argument("--admin-password", default=os.environ.get("CODEX_ADMIN_PASSWORD"))
    parser.add_argument(
        "--prompt-file",
        type=Path,
        default=repo_root / "prompts/application-environment-all-in-one.md",
    )
    parser.add_argument("--workdir", type=Path, default=repo_root)
    parser.add_argument("--record-dir", type=Path, default=repo_root / "code/runs")
    parser.add_argument("--codex-bin", default=os.environ.get("CODEX_BIN", "codex"))
    parser.add_argument("--model", default=os.environ.get("CODEX_MODEL"))
    parser.add_argument(
        "--sandbox",
        choices=("read-only", "workspace-write", "danger-full-access"),
        default=os.environ.get("CODEX_SANDBOX", "workspace-write"),
    )
    parser.add_argument(
        "--approval",
        choices=("untrusted", "on-request", "never"),
        default=os.environ.get("CODEX_APPROVAL", "never"),
        help="Approval policy. Use never for unattended execution.",
    )
    parser.add_argument(
        "--timeout-seconds",
        type=float,
        default=6 * 60 * 60,
        help="Maximum run time; use 0 to disable the timeout.",
    )
    parser.add_argument("--validate-only", action="store_true", help="Validate inputs without starting Codex")
    return parser


def require_admin_password(args: argparse.Namespace) -> str:
    if args.admin_password:
        return args.admin_password
    if sys.stdin.isatty():
        import getpass

        password = getpass.getpass("Initial administrator password: ")
        if password:
            return password
    raise RunnerError("Provide --admin-password or CODEX_ADMIN_PASSWORD without storing it in the script.")


def build_command(args: argparse.Namespace, workdir: Path, last_message: Path) -> list[str]:
    command = [
        args.codex_bin,
        "--ask-for-approval",
        args.approval,
        "exec",
        "--json",
        "--cd",
        str(workdir),
        "--sandbox",
        args.sandbox,
        "--output-last-message",
        str(last_message),
    ]
    if args.model:
        command.extend(["--model", args.model])
    command.append("-")
    return command


def safe_parameters(args: argparse.Namespace, prompt_file: Path, workdir: Path) -> dict[str, Any]:
    return {
        "application": args.application,
        "version": args.version,
        "source_repository": args.source_repository,
        "commit": args.commit,
        "image_name": args.image_name,
        "host_port": args.host_port,
        "admin_username": args.admin_username,
        "admin_password_provided": bool(args.admin_password),
        "prompt_file": str(prompt_file),
        "workdir": str(workdir),
        "model": args.model or "Codex configuration default",
        "sandbox": args.sandbox,
        "approval": args.approval,
    }


def run(args: argparse.Namespace, repo_root: Path) -> int:
    password = require_admin_password(args)
    prompt_file = resolve_path(args.prompt_file, repo_root)
    workdir = resolve_path(args.workdir, repo_root)
    record_dir = resolve_path(args.record_dir, repo_root)
    if not prompt_file.is_file():
        raise RunnerError(f"Prompt file does not exist: {prompt_file}")
    if not workdir.is_dir():
        raise RunnerError(f"Working directory does not exist: {workdir}")

    values = {
        "application": args.application,
        "version": args.version,
        "source_repository": args.source_repository,
        "commit": args.commit,
        "image_name": args.image_name,
        "host_port": str(args.host_port),
        "admin_username": args.admin_username,
        "admin_password": password,
    }
    prompt = render_prompt(prompt_file.read_text(encoding="utf-8"), values)
    command = build_command(args, workdir, record_dir / "pending-last-message.md")
    if args.validate_only:
        print(f"Prompt: {prompt_file}")
        print(f"Working directory: {workdir}")
        print("Codex command: " + " ".join(command[:-1] + ["-"]))
        print("Validation passed; Codex was not started.")
        return 0

    record_dir.mkdir(parents=True, exist_ok=True)
    run_id = datetime.now().astimezone().strftime("%Y%m%d-%H%M%S-%f")
    event_log = record_dir / f"{run_id}.events.log"
    record_file = record_dir / f"{run_id}.json"
    last_message = record_dir / f"{run_id}.last-message.md"
    command = build_command(args, workdir, last_message)
    started_at = local_timestamp()
    started_clock = time.perf_counter()
    collector = UsageCollector()
    status = "failed"
    exit_code: int | None = None
    timed_out = False
    parsed_events = 0
    output = ""
    error_message: str | None = None

    executable = shutil.which(args.codex_bin) or (args.codex_bin if Path(args.codex_bin).exists() else None)
    if executable is None:
        error_message = f"Codex executable not found: {args.codex_bin}"
    else:
        command[0] = executable
        try:
            process = subprocess.Popen(
                command,
                cwd=workdir,
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                encoding="utf-8",
                errors="replace",
                start_new_session=(os.name == "posix"),
            )
            try:
                output, _ = process.communicate(
                    input=prompt,
                    timeout=args.timeout_seconds if args.timeout_seconds > 0 else None,
                )
                exit_code = process.returncode
            except subprocess.TimeoutExpired as exc:
                timed_out = True
                terminate_process(process)
                tail, _ = process.communicate()
                output = normalize_output(exc.output) + normalize_output(tail)
                exit_code = process.returncode
                error_message = f"Codex run exceeded {args.timeout_seconds:g} seconds."
        except OSError as exc:
            error_message = f"Could not start Codex: {exc}"

    parsed_events = parse_events(output, collector, event_log)
    finished_at = local_timestamp()
    duration = round(time.perf_counter() - started_clock, 3)
    usage, usage_source = collector.final_usage()
    if not timed_out and exit_code == 0 and error_message is None:
        status = "succeeded"
    record = {
        "schema_version": 1,
        "runner_version": RUNNER_VERSION,
        "status": status,
        "started_at": started_at,
        "finished_at": finished_at,
        "duration_seconds": duration,
        "exit_code": exit_code,
        "timed_out": timed_out,
        "error": error_message,
        "parameters": safe_parameters(args, prompt_file, workdir),
        "codex_command": command[:-1] + ["<prompt-from-stdin>"],
        "thread_id": collector.thread_id,
        "event_count": parsed_events,
        "event_types": dict(collector.event_counts),
        "token_usage": {**usage.as_dict(), "source": usage_source},
        "artifacts": {
            "events_log": str(event_log),
            "last_message": str(last_message) if last_message.exists() else None,
        },
    }
    record_file.write_text(json.dumps(record, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print(f"status={status}")
    print(f"duration_seconds={duration}")
    print(f"total_tokens={usage.total_tokens}")
    print(f"record={record_file}")
    print(f"events={event_log}")
    if error_message:
        print(f"error={error_message}", file=sys.stderr)
    return 0 if status == "succeeded" else (exit_code if exit_code not in (None, 0) else 1)


def main() -> int:
    repo_root = Path(__file__).resolve().parents[1]
    parser = make_parser(repo_root)
    args = parser.parse_args()
    try:
        return run(args, repo_root)
    except RunnerError as exc:
        parser.error(str(exc))
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
