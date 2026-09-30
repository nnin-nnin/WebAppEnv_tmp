# 应用验证报告: pimcore (default)

- **环境目录**: `applications/pimcore/default/default`
- **验证时间**: 2026-09-30T21:25:00+08:00
- **最终结论**: PASSED (7/7 checks passed)

## 检查清单项
1. **交付目录与规范文件完整性**: PASSED
2. **manifest.yaml 契约规范性**: PASSED
3. **docker/compose.yaml 规范性**: PASSED
4. **Shell 脚本权限与语法校验**: PASSED
5. **宿主机绝对路径脱敏排查**: PASSED
6. **权威 Ruby 验证器 (validate_compose_delivery.rb)**: PASSED
7. **动态实机全流程验证 (up -> healthcheck -> login -> reset)**: PASSED (14.2s)
