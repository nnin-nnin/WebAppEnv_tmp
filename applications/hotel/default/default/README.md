# Hotel (FreeeBird/hotel) 安全评测环境

## 1. 环境概览
- **应用名称**: `hotel` (`FreeeBird/hotel`)
- **技术栈**: Java 8 + Spring Boot 2.0.5 + MyBatis + MariaDB 10.5
- **访问地址**: `http://127.0.0.1:18089/ho-api`
- **镜像**: `yorem/hotel:default` (`linux/amd64`)

## 2. 预置 2x2 双层双主体账号矩阵

| 用户名 | 密码 | 角色层级 | 维度标识 | 说明 |
| :--- | :--- | :--- | :--- | :--- |
| `admin` | `AdminPassword123!` | `administrator` | `vertical_admin` | 主系统管理员 (`worker_id=1`, `role=admin`) |
| `admin2` | `AdminPassword123!` | `administrator` | `horizontal_admin` | 次管理员 (`worker_id=11`, `role=admin`) |
| `user1` | `UserPassword123!` | `standard_user` | `horizontal_user` | 普通业务用户 A (`user_id=13`, 绑定独立订单 `order_id=1`) |
| `user2` | `UserPassword123!` | `standard_user` | `horizontal_user` | 普通业务用户 B (`user_id=14`, 绑定独立订单 `order_id=2`) |

## 3. 生命周期指令
```bash
# 启动并等待就绪
./environment/scripts/up.sh

# 健康检查
./environment/scripts/healthcheck.sh

# 4 账号矩阵登录验证
./environment/resources/login.sh

# 销毁重置
./environment/scripts/reset.sh
```
