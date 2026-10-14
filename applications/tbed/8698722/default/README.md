# Tbed 安全评测环境 (2x2 双层双主体账号矩阵)

## 1. 环境概览
- **应用名称**: `Tbed`
- **上游仓库**: `https://github.com/Hello-hao/Tbed` (`86987221123931366efbf79b9b029180ddcf52e4`)
- **镜像名称**: `yorem/tbed:default` (`linux/amd64`)
- **对外访问地址**: `http://127.0.0.1:18093`

## 2. 预置账号清单 (2x2 矩阵)
| 用户名 | 密码 | 角色层级 | 评测维度 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `admin` | `AdminPassword123!` | `administrator` | `vertical_admin` | 主系统管理员 |
| `admin2` | `AdminPassword123!` | `administrator` | `horizontal_admin` | 次系统管理员 (同级横向隔离对照) |
| `user1` | `UserPassword123!` | `standard_user` | `horizontal_user` | 普通业务用户 A (拥有独立业务数据) |
| `user2` | `UserPassword123!` | `standard_user` | `horizontal_user` | 普通业务用户 B (用于 IDOR 水平越权对照) |

## 3. 生命周期指令
```bash
cd environment
./scripts/up.sh
./scripts/healthcheck.sh
./resources/login.sh
./scripts/reset.sh
```
