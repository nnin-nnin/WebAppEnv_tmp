# 应用环境 all-in-one 产物提示词

这份提示词用于逐个构建 YuraScanner、Atropos、NAVEX 或其他应用的标准化应用环境目录。

## 主提示词

```text
你是一个负责构建应用运行环境的高级工程师。

请在当前工作目录中，为指定应用构建一个可交付的应用环境目录。

本轮只处理一个应用，不要同时处理其他应用。

应用信息：
- 应用名称：[APPLICATION]
- 应用版本：[VERSION]
- 源码仓库：[SOURCE_REPOSITORY]
- 固定源码 commit：[COMMIT]
- 目标平台：linux/amd64
- 镜像名称：[IMAGE_NAME]:[VERSION]
- 对外端口：[HOST_PORT]
- 初始管理员账号：[ADMIN_USERNAME]
- 初始管理员密码：[ADMIN_PASSWORD]

最终交付目标是一个真正的 all-in-one Docker 镜像。

交付给其他人的最简启动流程必须是：

docker load -i image/[APPLICATION]-[VERSION]-linux-amd64.tar
docker run -d -p [HOST_PORT]:80 [IMAGE_NAME]:[VERSION]

启动时不得要求用户执行以下任何操作：
- docker compose
- build.sh
- bootstrap.sh
- install.sh
- 数据库初始化脚本
- 单独启动数据库容器
- 手动创建 Docker 网络
- 手动导入 SQL
- 配置 OrbStack
- 配置本机代理
- 修改宿主机环境变量

一、先检查当前目录

开始修改前，先检查：

1. 当前目录结构；
2. AGENTS.md 或其他本地开发约束；
3. 当前是否存在用户未提交的修改；
4. 是否已有该应用的源码、Docker 文件、资源文件、镜像文件；
5. 当前 Docker 引擎、架构和可用镜像；
6. 应用实际需要的运行时、数据库、Web 服务器和初始化流程。

必须保留用户已有的、与当前任务相关的修改。
不要执行 git reset --hard、git checkout -- 或其他破坏性恢复操作。
搜索文件优先使用 rg 和 rg --files。

二、目录组织要求

应用目录使用通用格式：

[application]_[version]/
├── README.md
├── manifest.yaml
├── source/
│   ├── [fixed-source-directory]/
│   ├── source.json
│   └── SHA256SUMS
├── resources/
│   ├── users.yaml
│   ├── roles.yaml
│   ├── login.sh
│   ├── register.sh
│   └── initial-data/
│       ├── application-data/
│       └── database-seed.sql
├── docker/
│   ├── Dockerfile
│   ├── standalone.Dockerfile
│   └── compose.yaml
├── scripts/
│   ├── build.sh
│   ├── entrypoint.sh
│   ├── up.sh
│   ├── healthcheck.sh
│   └── reset.sh
└── image/
    ├── [application]-[version]-linux-amd64.tar
    ├── image.json
    └── SHA256SUMS

不要创建以下目录或文件，除非应用实际确实需要：
- evidence.md
- accounts/
- overlay/
- extensions/

用户、角色、登录和注册相关内容统一放在 resources/。
所有可执行脚本统一放在 scripts/。
docker/ 只放 Dockerfile 和 Docker Compose 配置。
入口脚本虽然由 Docker 使用，但文件本身也放在 scripts/ 中。

README.md 是必需交付文件，位于应用目录根目录，使用中文并至少包含以下章节：

1. 应用名称、固定版本和 all-in-one `linux/amd64` 镜像说明；
2. “启动”：从仓库根目录进入应用目录、校验 `image/SHA256SUMS`、`docker load` 和最终 `docker run` 命令；
3. “访问和账号”：应用地址、初始用户名、密码和角色；
4. “验证”：`scripts/healthcheck.sh`、`resources/login.sh` 和 `resources/register.sh` 的实际命令；
5. “重置”：`scripts/reset.sh` 及重置后的恢复方式；
6. “文件说明”：`manifest.yaml`、`source/`、`docker/`、`resources/`、`scripts/` 和 `image/` 的职责。

README 的启动章节必须明确：接收者只需要 `docker load` 和 `docker run`；镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本或 Web Installer。

三、源码要求

1. 获取指定仓库中固定 commit 的源码；
2. 不使用浮动分支、latest、当前主分支或未记录版本；
3. 将源码保存到 source/；
4. 记录仓库、版本、commit、获取时间、源码路径和校验值；
5. 生成 source/SHA256SUMS；
6. 应用运行所需的依赖应在构建镜像时安装完成；
7. 容器运行时不得联网下载依赖、源码或初始化组件；
8. 不要将本机路径写入构建文件或 manifest。

四、all-in-one 镜像要求

最终镜像必须是单个镜像、单个容器。

最终容器必须在内部包含：
- 应用源码和运行依赖；
- 应用所需的 Web 服务器；
- 应用所需的语言运行时；
- 应用所需的数据库服务；
- 应用初始数据；
- 数据库初始化 SQL 或已经初始化的数据库；
- 应用配置；
- 初始管理员账号；
- 启动所需的内部入口程序。

数据库必须在同一个容器内运行，应用连接地址应改为容器内部地址，例如：

127.0.0.1

不得使用：
- app 容器 + db 容器；
- 独立数据库镜像；
- Docker Compose 中的 db service；
- 通过容器名称 db 连接数据库；
- 运行时依赖宿主机上的数据库。

如果应用和数据库需要同时启动，应通过 scripts/entrypoint.sh 或等效的内部进程管理方式：

1. 初始化数据库目录；
2. 启动数据库；
3. 等待数据库可用；
4. 创建数据库、数据库用户和权限；
5. 自动导入初始数据库；
6. 启动 Web 服务；
7. 捕获终止信号并正确关闭两个进程；
8. 当任一核心进程异常退出时，使容器正确退出。

这些步骤必须由镜像内部自动完成，用户不能手动执行。

数据库初始化必须具备幂等性：
- 第一次启动时初始化；
- 已有数据时不得重复导入；
- 容器重启后可以正常恢复；
- 应用数据和数据库数据可以通过 Docker volume 持久化。

五、镜像构建要求

构建过程可以使用基础镜像和中间镜像，但最终 image/ 目录只能导出最终 all-in-one 镜像。

build.sh 应完成：

1. 构建应用基础镜像；
2. 构建最终 all-in-one 镜像；
3. 将最终镜像固定命名为 [IMAGE_NAME]:[VERSION]；
4. 使用 linux/amd64 构建；
5. 只执行：

docker save --output image/[application]-[version]-linux-amd64.tar [IMAGE_NAME]:[VERSION]

6. 生成：

image/image.json
image/SHA256SUMS

最终 tar 中不得包含基础镜像 tag、独立数据库镜像、旧版本镜像或其他应用镜像。

不得加入 OrbStack 专用配置。
不得加入 HTTP_PROXY、HTTPS_PROXY、ALL_PROXY 等本机特殊配置。
不得把本机网络、代理、路径或 Docker 实例名称写入交付目录。

六、Compose 要求

Compose 只是可选的辅助运行方式，不是最终交付的必要条件。

docker/compose.yaml 只能定义一个应用服务，例如：

services:
  application:
    image: [IMAGE_NAME]:[VERSION]
    ports:
      - "[HOST_PORT]:80"
    volumes:
      - application-data:/var/www/html/data
      - application-db:/var/lib/mysql

禁止在 Compose 中定义独立 db 服务。
禁止使用 depends_on 等待数据库容器。
Compose 使用的镜像必须与 image/ 目录中导出的最终镜像完全一致。

七、resources 要求

根据应用实际接口和数据格式生成：

resources/users.yaml
- 初始账号；
- 用户名；
- 密码或密码说明；
- 用户类型；
- 是否启用；
- 用户用途。

resources/roles.yaml
- 角色名称；
- 权限；
- 角色用途；
- 与初始账号的关系。

resources/login.sh
- 使用应用真实的登录接口；
- 使用环境变量覆盖默认地址和账号；
- 登录失败时返回非零退出码；
- 登录成功时输出明确结果；
- 不依赖 Docker Compose。

resources/register.sh
- 使用应用真实的注册或创建用户接口；
- 参数不满足要求时返回非零退出码；
- 不要假设所有应用的注册 API 都相同；
- 先检查应用接口和认证方式，再编写脚本。

resources/initial-data/
- 放应用初始文件数据；
- 放数据库 seed；
- 不要把运行时临时文件放入这里；
- 不要把宿主机路径写入数据文件。

八、manifest 要求

manifest.yaml 必须记录：
- 应用名称和版本；
- 源码仓库；
- 固定 commit；
- 源码校验文件；
- 目标平台；
- 运行时版本；
- Web 服务器；
- 数据库版本；
- 对外端口；
- all-in-one 镜像名称；
- 镜像内部包含的组件；
- 镜像归档路径；
- 镜像元数据路径；
- 镜像校验文件；
- resources 文件；
- build、start、healthcheck、reset 脚本路径；
- 最终推荐的 docker run 命令。

manifest 中必须明确说明：
该镜像是单镜像、单容器、内部包含应用服务和数据库服务的 all-in-one 环境。

九、验收要求

完成构建后必须实际执行，不得只检查文件是否存在。

必须验证：

1. 构建脚本语法：

bash -n scripts/*.sh

2. 镜像归档：

docker load -i image/[application]-[version]-linux-amd64.tar

3. 镜像清单只包含一个最终镜像；
4. 使用最终命令启动：

docker run -d -p [HOST_PORT]:80 [IMAGE_NAME]:[VERSION]

5. 检查应用首页返回 HTTP 200；
6. 使用初始管理员账号检查登录或认证 API；
7. 检查应用服务和数据库服务都运行在同一个容器内；
8. 检查容器日志中没有致命错误；
9. 检查容器重启后仍能正常运行；
10. 检查 image/SHA256SUMS；
11. 检查 Compose 只有一个 service；
12. 检查最终交付目录中没有旧的双镜像引用。
13. 检查根目录 README.md 存在，且启动、账号、验证、重置和文件说明与实际产物一致。

在 ARM64 本机运行 linux/amd64 镜像时，Docker 可能显示平台不匹配警告。
只要容器可以正常启动并通过 HTTP/API 验证，这个警告不视为构建失败。
不要因此向应用目录加入本机专用配置。

十、完成标准

不要在只完成设计或只完成部分构建时结束。

完成后必须给出：
1. 实际创建或修改的文件；
2. 最终目录结构；
3. 最终镜像名称；
4. 镜像 tar 路径；
5. 用户可以直接执行的 docker load 和 docker run 命令；
6. 初始登录账号；
7. 验收结果；
8. 未完成事项或剩余风险。
9. README.md 中的直接启动命令。

如果遇到构建超时或网络问题，先定位是基础镜像拉取、包管理器下载、源码依赖下载、容器启动、数据库初始化还是 HTTP 服务访问。
不要直接加入本机代理配置。
优先使用已有缓存、固定版本依赖和可重复的构建方式。
```

## 参数示例

以 EspoCRM 8.2.5 为例：

```text
应用名称：EspoCRM
应用版本：8.2.5
源代码仓库：https://github.com/espocrm/espocrm
固定 commit：06be47c3488c7c369ee879b920ec4c3fc4acbb5d
目标平台：linux/amd64
镜像名称：espocrm:8.2.5
对外端口：18092
初始管理员账号：admin
初始管理员密码：benchmark-only
```

## 最终验收提示词

```text
请对当前应用环境目录进行最终交付验收，不要只做静态代码检查。

重点检查：

1. image/ 下的 tar 是否只包含一个最终镜像；
2. 是否可以执行：

docker load -i image/[application]-[version]-linux-amd64.tar
docker run -d -p [port]:80 [image]:[version]

3. 启动时是否不需要 docker compose、bootstrap.sh 或其他外部脚本；
4. 应用和数据库是否运行在同一个容器；
5. 首页是否返回 HTTP 200；
6. 初始管理员账号是否可以登录；
7. 数据库是否已经自动初始化；
8. 容器重启后数据是否仍然可用；
9. docker/ 下是否只有 Dockerfile 和 Compose 配置；
10. scripts/ 下是否包含所有可执行脚本；
11. resources/ 下是否包含用户、角色、登录、注册和初始数据；
12. 是否保留 manifest.yaml；
13. 是否错误保留了独立数据库镜像；
14. 是否存在 OrbStack、代理、本机路径等特殊配置；
15. SHA256SUMS 是否校验通过。
16. 根目录 README.md 是否存在，且是否给出了准确的直接启动、账号、验证和重置说明。

如果发现问题，直接修复并重新构建镜像，不要只给出问题列表。

最终报告必须包含：
- 修复内容；
- 实际执行的验证命令；
- 验证结果；
- 用户最终可以执行的最简启动命令。
```
