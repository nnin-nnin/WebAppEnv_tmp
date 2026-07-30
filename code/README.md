# Codex 环境构建脚本

`codex_environment_runner.py` 将 `prompts/application-environment-all-in-one.md` 参数化后，交给本机已安装的 Codex CLI 执行。它使用 `codex exec --json` 的机器可读事件流，因此 Codex 可以在指定工作目录中检查文件、修改环境、构建 Docker 镜像并执行验收；Python 脚本负责记录执行时间、原始事件和 token 用量。

当前环境没有独立的 Codex Python 包。这个脚本使用 Python 标准库调用已经安装的 `codex` CLI；不需要安装 `openai` 或其他 Python 依赖，也不会把 API key 写入文件。运行前需要先在本机完成 Codex 登录：

```bash
codex login
```

## 示例

在 `applications/` 仓库根目录执行。管理员密码通过环境变量传入，脚本不会将它写入运行记录：

```bash
export CODEX_ADMIN_PASSWORD='benchmark-only'

python3 code/codex_environment_runner.py \
  --application EspoCRM \
  --version 8.2.5 \
  --source-repository https://github.com/espocrm/espocrm \
  --commit 06be47c3488c7c369ee879b920ec4c3fc4acbb5d \
  --image-name nnin/sop-espocrm \
  --host-port 18092 \
  --workdir .
```

脚本默认使用当前 Codex 配置中的模型、`workspace-write` 沙箱和 `never` 审批策略。Docker 构建若受到沙箱权限限制，需要显式选择本机允许的权限：

```bash
python3 code/codex_environment_runner.py \
  --application EspoCRM \
  --version 8.2.5 \
  --source-repository https://github.com/espocrm/espocrm \
  --commit 06be47c3488c7c369ee879b920ec4c3fc4acbb5d \
  --image-name nnin/sop-espocrm \
  --host-port 18092 \
  --sandbox danger-full-access \
  --workdir .
```

`danger-full-access` 会扩大 Codex 对当前工作区和本机命令的访问范围，只应在确认当前提示词和工作目录可信时使用。

## 运行记录

每次实际运行会在 `code/runs/` 生成三个文件：

- `<run-id>.json`：状态、开始时间、结束时间、耗时、事件类型、线程 ID 和 token 用量。
- `<run-id>.events.log`：Codex 的原始 JSONL 输出，便于排查构建或验收失败。
- `<run-id>.last-message.md`：Codex 最终回复。

记录中的 `token_usage` 优先读取 `turn.completed` 的 usage；如果 CLI 使用旧的 `event_msg/token_count` 格式，则读取其中的累计 usage。无法从事件流获得 token 时会明确记录 `source: unavailable`，不会猜测 token 数量。

管理员密码不会写入 JSON 记录、命令记录或运行命令行。运行日志可能包含 Codex 输出的工作路径和命令摘要，不应直接提交到公共仓库。

## 验证脚本

不启动 Codex 的情况下检查参数、提示词占位符和命令构造：

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

运行单元测试：

```bash
python3 code/test_codex_environment_runner.py
```
