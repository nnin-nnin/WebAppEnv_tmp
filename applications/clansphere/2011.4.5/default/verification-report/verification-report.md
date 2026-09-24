# 环境验证报告 (Verification Report) ✅

- **目标应用**: ClanSphere (v2011.4.5)
- **目标目录**: `applications/clansphere/2011.4.5/default`
- **验证结论**: **`PASSED`**
- **验证时间**: 2026-09-23T18:36:13+08:00
- **统计摘要**: 通过 `6` | 失败 `0` | 警告 `0` | 跳过 `0` / 共 `6` 项

## 检查项详情

| 阶段 | 检查项 ID | 名称 | 状态 | 耗时 | 详情说明 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 静态检查 | `static.structure.required_paths` | 交付目录与规范文件完整性 | ✅ 通过 | 0.06ms | 所有标准规范文件均已就绪 (manifest, compose, source, scripts, resources) |
| 静态检查 | `static.manifest.contract` | manifest.yaml 契约规范性 | ✅ 通过 | 0.95ms | manifest.yaml 格式合法且正确声明 native_compose |
| 静态检查 | `static.compose.specs` | docker/compose.yaml 规范性 | ✅ 通过 | 0.43ms | compose 规范合法，定义了 1 个符合 linux/amd64 标准的服务 |
| 静态检查 | `static.scripts.syntax` | Shell 脚本权限与语法校验 (bash -n) | ✅ 通过 | 17.06ms | 全部 4 个 Shell 脚本均具备可执行权限且语法正确 |
| 静态检查 | `static.host_path.leak` | 宿主机绝对路径脱敏排查 | ✅ 通过 | 1.77ms | 所有交付文本文件均已干净脱敏，无宿主机路径泄漏 |
| 动态检查 | `dynamic.runtime_verify` | 动态实机全流程验证 (up -> healthcheck -> login -> reset) | ✅ 通过 | 10.68s | 实机动态验证 PASS，端口 18531 正常工作 |
