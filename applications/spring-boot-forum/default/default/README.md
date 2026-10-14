# Spring-Boot-Forum (weiqingwen/spring-boot-forum) 安全评测环境

## 1. 环境概览
- **应用名称**: `spring-boot-forum` (`weiqingwen/spring-boot-forum`)
- **技术栈**: Java 8 + Spring Boot 2.0.4 + Spring Security + MyBatis + Thymeleaf + MariaDB 10.5
- **访问地址**: `http://127.0.0.1:18090`
- **镜像**: `yorem/spring-boot-forum:default` (`linux/amd64`)

## 2. 预置 2x2 双层双主体账号矩阵

| 用户名 | 密码 | 角色层级 | 维度标识 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `admin` | `AdminPassword123!` | `administrator` | `vertical_admin` | 主系统管理员 (`id=1`, `roles=ADMIN,USER`) |
| `admin2` | `AdminPassword123!` | `administrator` | `horizontal_admin` | 次管理员 (`id=3`, `roles=ADMIN,USER`) |
| `user1` | `UserPassword123!` | `standard_user` | `horizontal_user` | 普通业务用户 A (`id=4`, `roles=USER`) |
| `user2` | `UserPassword123!` | `standard_user` | `horizontal_user` | 普通业务用户 B (`id=5`, `roles=USER`) |

## 3. 生命周期指令
```bash
./environment/scripts/up.sh
./environment/scripts/healthcheck.sh
./environment/resources/login.sh
./environment/scripts/reset.sh
```
