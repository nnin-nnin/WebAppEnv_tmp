# Forum (fanchaoo/forum) 安全评测环境

## 1. 环境概览
- **应用名称**: `forum` (`fanchaoo/forum`)
- **技术栈**: Java 8 + Spring MVC + MyBatis + Tomcat 8.5 + MariaDB 10.5 + Redis 7
- **访问地址**: `http://127.0.0.1:18091/toIndex.do`
- **镜像**: `yorem/forum:default` (`linux/amd64`)

## 2. 预置 2x2 双层双主体账号矩阵

| 用户名 (`email`) | 密码 | 角色层级 | 维度标识 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `admin` | `AdminPassword123!` | `administrator` | `vertical_admin` | 主系统管理员 (`uid=13`) |
| `admin2` | `AdminPassword123!` | `administrator` | `horizontal_admin` | 次管理员 (`uid=14`) |
| `user1` | `UserPassword123!` | `standard_user` | `horizontal_user` | 普通业务用户 A (`uid=15`, 独立发帖 `pid=24`) |
| `user2` | `UserPassword123!` | `standard_user` | `horizontal_user` | 普通业务用户 B (`uid=16`, 独立发帖 `pid=25`) |

## 3. 生命周期指令
```bash
./environment/scripts/up.sh
./environment/scripts/healthcheck.sh
./environment/resources/login.sh
./environment/scripts/reset.sh
```
