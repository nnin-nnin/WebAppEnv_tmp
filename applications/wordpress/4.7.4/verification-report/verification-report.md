# 环境验证报告 (Verification Report) ❌

- **目标应用**: WordPress (v4.7.4)
- **目标目录**: `/Users/min/SecSys/Web应用环境仓库/environments/applications/wordpress/4.7.4`
- **验证结论**: **`FAILED`**
- **验证时间**: 2026-09-14T05:32:18.736051+00:00
- **统计摘要**: 通过 `3` | 失败 `3` | 警告 `0` | 跳过 `1` / 共 `7` 项

## 检查项详情

| 阶段 | 检查项 ID | 名称 | 状态 | 耗时 | 详情说明 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 静态检查 | `static.structure.required_paths` | 交付目录与规范文件完整性 | ❌ 失败 | 2.2ms | 缺少必需文件: source/SHA256SUMS |
| 静态检查 | `static.manifest.contract` | manifest.yaml 契约规范性 | ❌ 失败 | 3.0ms | manifest.yaml 未声明 native_compose 部署模式 |
| 静态检查 | `static.compose.specs` | docker/compose.yaml 规范性 | ✅ 通过 | 0.5ms | compose 规范合法，定义了 1 个符合 linux/amd64 标准的服务 |
| 静态检查 | `static.scripts.syntax` | Shell 脚本权限与语法校验 (bash -n) | ✅ 通过 | 17.9ms | 全部 7 个 Shell 脚本均具备可执行权限且语法正确 |
| 静态检查 | `static.host_path.leak` | 宿主机绝对路径脱敏排查 | ✅ 通过 | 1.7ms | 所有交付文本文件均已干净脱敏，无宿主机路径泄漏 |
| 静态检查 | `static.ruby.validator` | 权威 Ruby 验证器 (validate_compose_delivery.rb) | ❌ 失败 | 54.1ms | 官方验证器发现违规: FAIL: 5 contract violations and 0 blocked applications across 1 applications; .: manifest must declare native_compose; ./image.json[0]: missing service |
| 动态检查 | `dynamic.skipped` | 动态实机检查 | ⚪ 跳过 | 0.0ms | 用户指定 --skip-dynamic 跳过动态实机检查 |

