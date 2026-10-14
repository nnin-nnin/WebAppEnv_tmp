# WebAppEnv (用于验证分支 — 21 个 2x2 账号矩阵靶标环境)

本分支专门收录 **21 个 Web 应用**通过 **2x2 精简双层双主体账号矩阵规范（2 管理员 + 2 普通用户）** 构建并完成 **100% 冷启动与多账号鉴权动态实测验收**的标准化评测靶标环境（不含其他应用）。

---

## 一、 评测靶标资产全景清单 (21 / 21 全部动态验收通过)

完整索引亦可见 [`index/all.md`](index/all.md)。

| # | 应用名称 | 环境目录 | 上游仓库 | 宿主机端口 | 核心架构与依赖栈 | 初始账号矩阵 (2 管理员 + 2 普通用户) |
|---|---|---|---|---|---|---|
| 1 | `ujcms` | [`applications/ujcms/default/default/`](applications/ujcms/default/default/) | `dromara/ujcms` | `18081:80` | Java 24 (Spring Boot 3) + MySQL 8.0 | `admin`, `admin2`, `user1`, `user2` |
| 2 | `gila-cms` | [`applications/gila-cms/default/default/`](applications/gila-cms/default/default/) | `GilaCMS/gila` | `18082:80` | PHP 8.1 Apache + MariaDB 10.6 | `admin@example.com`, `admin2`, `user1`, `user2` |
| 3 | `webchess` | [`applications/webchess/default/default/`](applications/webchess/default/default/) | `halojoy/PHP7-Webchess` | `18083:80` | PHP 7.4 Apache + MariaDB 10.5 | `admin`, `admin2`, `user1`, `user2` |
| 4 | `jsherp` | [`applications/jsherp/default/default/`](applications/jsherp/default/default/) | `jishenghua/jshERP` | `18084:80` | Spring Boot 2 + Vue + MariaDB 10.5 + Redis 7 | `admin`, `admin2`, `user1`, `user2` |
| 5 | `xmall` | [`applications/xmall/default/default/`](applications/xmall/default/default/) | `Exrick/xmall` | `18085:7777` | SSM + Dubbo + Zookeeper + MariaDB 10.5 + Redis | `admin`, `admin2`, `user1`, `user2` |
| 6 | `newbee-mall` | [`applications/newbee-mall/1.0.0/default/`](applications/newbee-mall/1.0.0/default/) | `newbee-ltd/newbee-mall` | `18086:28080` | Spring Boot 2 + Thymeleaf + MySQL 8.0 | `admin`, `admin2`, `user1`, `user2` |
| 7 | `litemall` | [`applications/litemall/default/default/`](applications/litemall/default/default/) | `linlinjava/litemall` | `18087:8080` | Spring Boot 2 + Shiro + JWT + MySQL 8.0 | `admin`, `admin2`, `user1`, `user2` |
| 8 | `mall-swarm` | [`applications/mall-swarm/default/default/`](applications/mall-swarm/default/default/) | `macrozheng/mall-swarm` | `18088:8080` | Spring Cloud + JWT + MySQL 8.0 + Redis | `admin`, `admin2`, `user1`, `user2` |
| 9 | `hotel` | [`applications/hotel/default/default/`](applications/hotel/default/default/) | `FreeeBird/hotel` | `18089:8080` | Spring Boot + MariaDB 10.5 | `admin`, `admin2`, `user1`, `user2` |
| 10 | `spring-boot-forum` | [`applications/spring-boot-forum/default/default/`](applications/spring-boot-forum/default/default/) | `weiqingwen/spring-boot-forum` | `18090:8080` | Spring Boot + Thymeleaf + MariaDB 10.5 | `admin`, `admin2`, `user1`, `user2` |
| 11 | `forum` | [`applications/forum/default/default/`](applications/forum/default/default/) | `fanchaoo/forum` | `18091:8080` | SSM + MariaDB 10.5 + Redis | `admin`, `admin2`, `user1`, `user2` |
| 12 | `ssm-demo` | [`applications/ssm-demo/default/default/`](applications/ssm-demo/default/default/) | `quan7u/ssm-demo` | `18092:8080` | SSM (Tomcat WAR) + MariaDB 10.5 | `admin`, `admin2`, `user1`, `user2` |
| 13 | `Tbed` | [`applications/Tbed/default/default/`](applications/Tbed/default/default/) | `Hello-hao/Tbed` | `18093:10088` | Spring Boot + MariaDB 10.5 + Redis | `admin`, `admin2`, `user1`, `user2` |
| 14 | `NBlog` | [`applications/NBlog/default/default/`](applications/NBlog/default/default/) | `Naccl/NBlog` | `18094:8090` | Spring Boot + JWT + MariaDB 10.5 + Redis | `admin`, `admin2`, `user1`, `user2` |
| 15 | `FlyCms` | [`applications/FlyCms/default/default/`](applications/FlyCms/default/default/) | `sunkaifei/FlyCms` | `18095:80` | Spring Boot + Shiro + FreeMarker + MySQL 8.0 | `admin`, `admin2`, `user1`, `user2` |
| 16 | `mall` | [`applications/mall/default/default/`](applications/mall/default/default/) | `macrozheng/mall` | `18096:8080` | Spring Boot + Spring Security JWT + MySQL 8.0 + Redis | `admin`, `admin2`, `user1`, `user2` |
| 17 | `yzsunlei-xmall` | [`applications/yzsunlei-xmall/default/default/`](applications/yzsunlei-xmall/default/default/) | `yzsunlei/xmall` | `18097:8080` | Spring Boot + Spring Security JWT + MariaDB 10.5 | `admin`, `admin2`, `user1`, `user2` |
| 18 | `SuperMarket` | [`applications/SuperMarket/default/default/`](applications/SuperMarket/default/default/) | `ZongXR/SuperMarket` | `18098:8080` | Spring Boot + MariaDB 10.5 + Redis | `admin`, `admin2`, `user1`, `user2` |
| 19 | `siam-cloud` | [`applications/siam-cloud/default/default/`](applications/siam-cloud/default/default/) | `siam1026/siam-cloud` | `18099:9200` | Spring Cloud (`user-provider`) + MariaDB 10.5 + Redis | `admin`, `admin2`, `user1`, `user2` |
| 20 | `weixin-shop-spring-cloud` | [`applications/weixin-shop-spring-cloud/default/default/`](applications/weixin-shop-spring-cloud/default/default/) | `chengzhx76/weixin-shop-spring-cloud` | `18100:8086` | Spring Cloud (`service-user`) + MariaDB 10.5 | `admin`, `admin2`, `user1`, `user2` |
| 21 | `caifeng` | [`applications/caifeng/default/default/`](applications/caifeng/default/default/) | `981011512/--` | `18101:8081` | Spring Cloud (`cf-ucenter`) + MariaDB 10.5 + Redis | `admin`, `admin2`, `user1`, `user2` |

---

## 二、 目录约定与快速启动

```text
applications/<app-name>/<version>/<variant>/
├── README.md               # 环境说明、端口与预置多账号清单
├── manifest.yaml           # 元数据清单 (commit、运行时、端口、镜像)
├── source/source.yaml      # 上游 Git 仓库地址与固定 commit
├── resources/              # 预置账号矩阵 (users.yaml, roles.yaml, login.sh 及种子数据)
├── docker/compose.yaml     # Docker Compose 编排文件
├── scripts/                # 生命周期脚本: up.sh, healthcheck.sh, reset.sh
├── image/image.json        # 锁定镜像元数据
└── verification-report/    # 自动化验证报告
```

```bash
# 进入任意目标环境目录 (以 siam-cloud 为例)
cd applications/siam-cloud/default/default

# 1. 一键冷启动容器并轮询等待服务就绪
./scripts/up.sh

# 2. 自动化健康检查
./scripts/healthcheck.sh

# 3. 2x2 四账号登录鉴权、角色权限区分与错误密码负向拒绝校验
./resources/login.sh

# 4. 彻底销毁容器、专用网络并释放持久化卷
./scripts/reset.sh
```
