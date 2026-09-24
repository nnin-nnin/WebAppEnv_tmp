# 环境验证报告 (Verification Report) ✅

- **目标应用**: mahara (v21.04.0)
- **目标目录**: `applications/mahara/21.04.0/default`
- **验证结论**: **`PASSED`**
- **验证时间**: 2026-09-24T01:02:15+08:00
- **统计摘要**: 通过 `7` | 失败 `0` | 警告 `0` | 跳过 `0` / 共 `7` 项

## 检查项详情

| 阶段 | 检查项 ID | 名称 | 状态 | 耗时 | 详情说明 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 静态检查 | `static.structure.required_paths` | 交付目录与规范文件完整性 | ✅ 通过 | 0.05ms | 所有标准规范文件均已就绪 (manifest, compose, image.json, source, scripts, resources, README) |
| 静态检查 | `static.manifest.contract` | manifest.yaml 契约规范性 | ✅ 通过 | 0.52ms | manifest.yaml 格式合法且正确声明 native_compose 与 DOCKERHUB 交付方式 |
| 静态检查 | `static.compose.specs` | docker/compose.yaml 规范性 | ✅ 通过 | 0.25ms | compose 规范合法，锁定 yorem/mahara:21.04.0@sha256:a80ae49437d1abc59ace4c0c9802eb02c51ff8ab2bf543c3ebc7c45c156ebe35，符合 linux/amd64 标准且端口映射为 18621:80 |
| 静态检查 | `static.scripts.syntax` | Shell 脚本权限与语法校验 (bash -n) | ✅ 通过 | 8.5ms | 全部 4 个 Shell 脚本均具备可执行权限且语法正确 |
| 静态检查 | `static.host_path.leak` | 宿主机绝对路径脱敏排查 | ✅ 通过 | 0.42ms | 所有交付文本文件均已干净脱敏，无宿主机路径泄漏 |
| 静态检查 | `static.ruby.validator` | 权威 Ruby 验证器 (validate_compose_delivery.rb) | ✅ 通过 | 48.0ms | 通过 Web应用环境仓库 官方权威验证器校验 (PASS) |
| 动态检查 | `dynamic.runtime_verify` | 动态实机全流程验证 (up -> healthcheck -> login -> reset) | ✅ 通过 | 33.34s | 实机动态验证 PASS，端口 18621 正常工作，全流程验证成功 |
