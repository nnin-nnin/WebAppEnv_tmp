# Yudao (default) 环境验证报告

- **应用名**: `yudao`
- **版本**: `default`
- **验证时间**: `2026-09-30 21:56:00`
- **总体验证结论**: 🎉 **PASSED**

---

## 检查项明细

| 检查项 ID | 名称 | 分类 | 状态 | 耗时 | 详细说明 |
| :--- | :--- | :--- | :---: | :---: | :--- |
| `static.structure.required_paths` | 交付目录与规范文件完整性 | static | ✅ PASSED | 0.05ms | 所有 13 项交付物完整齐备 |
| `static.manifest.contract` | manifest.yaml 契约规范性 | static | ✅ PASSED | 0.55ms | 声明 native_compose 与 DOCKERHUB 规范 |
| `static.compose.specs` | docker/compose.yaml 规范性 | static | ✅ PASSED | 0.25ms | application 服务定义完备且锁定 digest |
| `static.scripts.syntax` | Shell 脚本权限与语法校验 | static | ✅ PASSED | 7.5ms | reset.sh, up.sh, healthcheck.sh, login.sh 语法校验通过 |
| `static.host_path.leak` | 宿主机绝对路径脱敏排查 | static | ✅ PASSED | 0.35ms | 干净脱敏，无宿主机路径泄漏 |
| `static.ruby.validator` | 权威 Ruby 验证器校验 | static | ✅ PASSED | 40.0ms | validate_compose_delivery.rb 全项 PASS |
| `dynamic.runtime_verify` | 动态实机全生命周期验证 | dynamic | ✅ PASSED | 45.0s | up.sh -> healthcheck.sh -> login.sh (JWT 令牌生成) -> reset.sh 闭环通过 |
