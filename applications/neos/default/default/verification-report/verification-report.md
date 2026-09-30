# 环境验证报告 (Verification Report) ✅

- **目标应用**: Neos CMS (default / commit `e2a96a3990249da59586ff3ea2f1514f837d03dd`)
- **目标目录**: `applications/neos/default/default`
- **验证结论**: **`PASSED`**
- **验证时间**: 2026-09-30T19:26:00+08:00
- **统计摘要**: 通过 `7` | 失败 `0` | 警告 `0` | 跳过 `0` / 共 `7` 项

## 检查项详情

| 阶段 | 检查项 ID | 名称 | 状态 | 耗时 | 详情说明 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 静态检查 | `static.structure.required_paths` | 交付目录与规范文件完整性 | ✅ 通过 | 0.05ms | 所有标准规范文件均已就绪 (manifest, compose, image.json, source, scripts, resources) |
| 静态检查 | `static.manifest.contract` | manifest.yaml 契约规范性 | ✅ 通过 | 0.52ms | manifest.yaml 格式合法且正确声明 native_compose 与 DOCKERHUB |
| 静态检查 | `static.compose.specs` | docker/compose.yaml 规范性 | ✅ 通过 | 0.30ms | compose 规范合法，定义了 2 个符合 linux/amd64 标准的服务并锁定 digest (app, db) |
| 静态检查 | `static.scripts.syntax` | Shell 脚本权限与语法校验 (bash -n) | ✅ 通过 | 11.5ms | 全部 Shell 脚本均具备可执行权限且语法正确 |
| 静态检查 | `static.ruby.validator` | 官方权威 Ruby 验证器 (validate_compose_delivery.rb) | ✅ 通过 | 48.0ms | 通过 Web 应用环境仓库官方权威验证器校验 (PASS) |
| 动态检查 | `dynamic.startup_and_health` | 动态启动与端点可用性 (up.sh & healthcheck.sh) | ✅ 通过 | 13.2s | 实机动态启动正常，HTTP 200 端点就绪，无 OPcache 崩溃 |
| 动态检查 | `dynamic.admin_login` | 管理员登录接口验证 (resources/login.sh) | ✅ 通过 | 1.50s | 管理员凭据 (admin / AdminPassword123!) 认证通过，后端受控资源访问正常 |

## 自愈与定制记录

1. **规避 macOS QEMU linux/amd64 下 PHP OPcache 崩溃**:
   - 在 PHP 配置文件中增加 `opcache.enable=0` 与 `opcache.enable_cli=0`，避免了 Apache 子进程退出触发 `Segmentation fault (11)`。
2. **免向导即启即用初始化**:
   - 提取完整 Neos CMS 核心数据表至 `resources/initial-data/database-seed.sql`（包含 `Neos.Demo` 站点及初始化数据），预设初始管理员账号 `admin`（密码：`AdminPassword123!`），免除向导直接进入就绪状态。
3. **MariaDB Client SSL 兼容修复**:
   - 解决 Debian 13 环境下 `mariadb-client` 默认强制 SSL 连接而服务端未启用 SSL 导致的握手错误，配置 `[client] ssl = 0` 保证连接顺畅。
