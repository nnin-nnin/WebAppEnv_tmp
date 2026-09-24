# Codex Environment Runner

`codex_environment_runner.py` parameterizes `code/prompts/application-environment-all-in-one.md` and delegates execution to the locally installed Codex CLI. It leverages the machine-readable event stream from `codex exec --json` to inspect files, configure environment dependencies, build Docker images, and execute live verification within a specified workspace; the Python driver records execution duration, raw events, and token consumption metrics.

No standalone Codex Python SDK is required. This script invokes the pre-installed `codex` binary via the standard Python library; it does not require `openai` or external Python dependencies, nor does it persist API keys to disk. Ensure the Codex CLI is authenticated locally prior to running:

```bash
codex login
```

## Usage Example

Execute from the repository root. Pass administrator credentials via environment variables so secrets are omitted from execution logs:

```bash
export CODEX_ADMIN_PASSWORD='benchmark-only'

python3 code/codex_environment_runner.py \
  --application EspoCRM \
  --version 8.2.5 \
  --source-repository https://github.com/espocrm/espocrm \
  --commit 06be47c3488c7c369ee879b920ec4c3fc4acbb5d \
  --image-name yorem/espocrm \
  --host-port 18092 \
  --workdir .
```

The script defaults to the currently configured model in Codex, using the `workspace-write` sandbox and `never` approval policy. If Docker daemon builds require host-level execution permissions:

```bash
python3 code/codex_environment_runner.py \
  --application EspoCRM \
  --version 8.2.5 \
  --source-repository https://github.com/espocrm/espocrm \
  --commit 06be47c3488c7c369ee879b920ec4c3fc4acbb5d \
  --image-name yorem/espocrm \
  --host-port 18092 \
  --sandbox danger-full-access \
  --workdir .
```

`danger-full-access` expands access permissions across the current workspace and host commands. Use only when prompt templates and targets are fully trusted.

## Run Logs & Artifacts

Each invocation produces three operational logs under `code/runs/`:

- `<run-id>.json`: Run status, timestamps, latency, event types, thread ID, and token usage metrics.
- `<run-id>.events.log`: Raw Codex JSONL event stream for diagnosing build and verification faults.
- `<run-id>.last-message.md`: Final completion summary from Codex.

`token_usage` extraction prioritizes the `turn.completed` event schema. If tokens cannot be extracted from the event stream, `source: unavailable` is explicitly recorded without heuristics.

Admin credentials are never written to JSON logs, commands, or execution traces.

## Offline Validation & Unit Tests

Validate prompt substitution, parameters, and command formatting without launching Codex:

```bash
python3 code/codex_environment_runner.py \
  --application Example \
  --version 1.0 \
  --source-repository https://example.test/source \
  --commit 0000000 \
  --image-name example \
  --host-port 18080 \
  --admin-password placeholder \
  --validate-only
```

Run test suite:

```bash
python3 code/test_codex_environment_runner.py
```
