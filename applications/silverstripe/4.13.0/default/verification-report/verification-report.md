# 环境验证报告 (Verification Report) ✅

- **目标应用**: silverstripe (v4.13.0)
- **目标目录**: `applications/silverstripe/4.13.0/default`
- **验证结论**: **`PASSED`**
- **验证时间**: 2026-09-24T00:59:08+08:00
- **统计摘要**: 通过 `7` | 失败 `0` | 警告 `0` | 跳过 `0` / 共 `7` 项

## 检查项详情

| 阶段 | 检查项 ID | 名称 | 状态 | 耗时 | 详情说明 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 静态检查 | `static.structure.required_paths` | 交付目录与规范文件完整性 | ✅ 通过 | 0.05ms | 所有标准规范文件均已就绪 (manifest, compose, image.json, source, scripts, resources, README) |
| 静态检查 | `static.manifest.contract` | manifest.yaml 契约规范性 | ✅ 通过 | 0.52ms | manifest.yaml 格式合法且正确声明 native_compose 与 DOCKERHUB 交付方式 |
| 静态检查 | `static.compose.specs` | docker/compose.yaml 规范性 | ✅ 通过 | 0.28ms | compose 规范合法，锁定 yorem/silverstripe:4.13.0@sha256:747b9510af880e8f5799f240e096df6e63ce1b0972ff9c4051387222b14c0ef0，符合 linux/amd64 标准且端口映射为 18619:80 |
| 静态检查 | `static.scripts.syntax` | Shell 脚本权限与语法校验 (bash -n) | ✅ 通过 | 7.8ms | 全部 4 个 Shell 脚本均具备可执行权限且语法正确 |
| 静态检查 | `static.host_path.leak` | 宿主机绝对路径脱敏排查 | ✅ 通过 | 0.40ms | 所有交付文本文件均已干净脱敏，无宿主机路径泄漏 |
| 静态检查 | `static.ruby.validator` | 权威 Ruby 验证器 (validate_compose_delivery.rb) | ✅ 通过 | 42.1ms | 通过 Web应用环境仓库 官方权威验证器校验 (PASS) |
| 动态检查 | `dynamic.runtime_verify` | 动态实机全流程验证 (up -> healthcheck -> login -> reset) | ✅ 通过 | 70.2s | 实机动态验证 PASS，端口 18619 正常工作，全流程验证成功 |
