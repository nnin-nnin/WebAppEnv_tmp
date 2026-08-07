# 原生 Docker Compose 应用环境产物提示词

这份提示词用于逐个构建保留官方多容器拓扑的应用环境。它与
`application-environment-all-in-one.md` 并列使用，适用于应用本身已经提供可用
Docker Compose 部署方式的场景。

## 适用边界

本提示词的目标不是把服务合并为一个容器，而是保留应用原本的服务边界，例如：

```text
应用服务 + 数据库服务 + Redis/搜索/消息队列服务
                    |
              Docker Compose
```

必须优先复用官方 Compose 拓扑和官方服务配置。不得为了追求单容器而重写数据库、
缓存、搜索服务或应用内部启动逻辑。

如果官方 Compose 无法固定版本、缺少关键服务、只能用于开发、依赖不可获得的外部
服务，或者经过验证无法稳定启动，必须记录原因，再评估是否切换到
`application-environment-all-in-one.md`。不能静默把失败的 Compose 改造成另一个
未验证的部署方式。

## 主提示词

```text
你是一个负责构建可复现应用运行环境的高级工程师。

请在当前工作目录中，为指定应用构建一个可交付的原生 Docker Compose 应用环境。

本轮只处理一个应用，不要同时处理其他应用。

应用信息：
- 应用名称：[APPLICATION]
- 应用版本：[VERSION]
- 后端源码仓库：[SOURCE_REPOSITORY]
- 后端固定 commit：[COMMIT]
- 独立前端仓库（如有）：开始检查后记录到 manifest.yaml
- 独立前端固定 commit（如有）：开始检查后记录到 manifest.yaml
- 官方 Compose 来源或文件：开始检查后记录到 manifest.yaml
- 目标平台：linux/amd64
- Compose 项目名称：根据应用名称和版本确定并记录到 manifest.yaml
- 应用服务名称：根据官方 Compose 确认并记录到 manifest.yaml
- 对外端口：[HOST_PORT]
- 初始管理员账号：[ADMIN_USERNAME]
- 初始管理员密码：[ADMIN_PASSWORD]
- 镜像交付方式：由实际产物选择 Docker Hub 或本地归档，并在 README 和 manifest.yaml 中明确
- Docker Hub 命名空间（如有）：由实际镜像来源确定并记录到 manifest.yaml

最终交付目标是一个可复现的、多容器 Docker Compose 应用环境。

接收者的标准启动流程必须写入 README.md，并根据镜像交付方式使用以下一种方式。

Docker Hub 方式：

docker compose -f docker/compose.yaml pull
docker compose -f docker/compose.yaml up -d

本地镜像归档方式：

docker load -i image/<service>-<version>-linux-amd64.tar
docker compose -f docker/compose.yaml up -d

如果有多个本地镜像归档，README 必须列出所有 docker load 命令，或者提供一个已验证
的加载脚本。接收者不需要执行源码构建、数据库手工安装、手工创建 Docker 网络、
手动导入 SQL 或修改宿主机环境变量。

一、先判断是否适合原生 Compose

开始修改前，先检查：

1. 当前目录结构；
2. AGENTS.md 或其他本地开发约束；
3. 当前是否存在用户未提交的修改；
4. 当前是否已经存在该应用的源码、Compose、Dockerfile、资源、脚本和镜像；
5. Docker Engine 和 Docker Compose v2 是否可用；
6. 当前主机架构和目标平台；
7. 应用官方 README、部署文档和仓库中的所有 Compose 文件；
8. Compose 中定义了哪些服务、服务之间如何连接、哪些服务是必需的；
9. 应用是否包含用户可见的 Web 前端；
10. 应用是否引用独立的前端仓库、构建命令和静态资源目录；
11. 数据库、Redis、搜索服务、消息队列和对象存储是否为应用运行所必需；
12. 数据库初始化、管理员创建和普通用户创建的真实方式。

必须先确认官方 Compose 是可运行的多容器部署方式，再开始整理交付目录。
如果官方 Compose 只是开发环境、测试环境或不完整示例，必须说明缺失内容，不能
直接把它当作生产或研究环境交付。

必须保留用户已有的、与当前任务相关的修改。
不要执行 git reset --hard、git checkout -- 或其他破坏性恢复操作。
搜索文件优先使用 rg 和 rg --files。

二、目录组织要求

应用目录使用通用格式：

<application>_<version>/
├── README.md
├── manifest.yaml
├── source/
│   └── source.yaml  # GitHub 仓库链接和固定 commit 哈希
├── resources/
│   ├── users.yaml
│   ├── roles.yaml
│   ├── login.sh
│   ├── register.sh
│   └── initial-data/
│       ├── application-data/（仅在应用确实需要时创建）
│       └── database-seed.sql（仅在应用确实需要时创建）
├── docker/
│   ├── compose.yaml
│   ├── Dockerfile                 # 仅在需要从源码构建应用镜像时创建
│   └── compose.build.yaml         # 仅在构建配置确实需要时创建
├── scripts/
│   ├── build.sh                   # 仅在需要本地构建镜像时创建
│   ├── up.sh
│   ├── healthcheck.sh
│   ├── reset.sh
│   └── load-images.sh              # 仅在使用本地镜像归档时创建
└── image/
    ├── <service>-<version>-linux-amd64.tar  # LOCAL_ARCHIVE 方式
    ├── image.json
    └── SHA256SUMS

不要创建以下目录或文件，除非应用实际确实需要：
- evidence.md
- accounts/
- overlay/
- extensions/

用户、角色、登录和注册相关内容统一放在 resources/。
scripts/ 保存构建、启动、健康检查、重置和镜像加载等运维脚本。
resources/ 保存用户、角色、登录、注册相关的应用辅助脚本及初始数据。
docker/ 保存最终 Compose 配置和应用镜像构建定义，不保存运行时数据库数据。
入口脚本和运维脚本放在 scripts/，login.sh 和 register.sh 必须放在 resources/。

三、README 要求

README.md 是必需交付文件，位于应用目录根目录，使用中文并至少包含：

1. 应用名称、固定版本和“原生多容器 Docker Compose”说明；
2. 前置条件：Docker Engine、Docker Compose v2、目标平台和网络要求；
3. 启动：Docker Hub 拉取方式或本地多镜像加载方式；
4. 访问和账号：浏览器入口、API 地址、初始用户名、密码和角色；
5. 服务说明：应用、数据库、缓存、搜索和其他服务分别是什么；
6. 验证：healthcheck、login 和 register 的实际命令；
7. 重置：只删除当前 Compose 项目的容器、网络和命名卷；
8. 文件说明：manifest.yaml、source/、docker/、resources/、scripts/ 和 image/；
9. 版本和镜像来源：每个服务的固定 image tag、digest 或本地归档；
10. 官方 Compose 与交付 Compose 的差异，以及每一处修改的原因。

README 必须明确：

- 本交付物是多容器 Compose 环境，不是 all-in-one 单容器环境；
- 应用、数据库和其他依赖服务分别运行在独立容器中；
- Compose 会创建项目网络，应用通过 Compose service name 连接其他服务；
- 接收者不需要手动创建 Docker 网络；
- 接收者不需要手动安装数据库或导入 SQL；
- 如果使用 Docker Hub，必须先 pull 固定版本镜像；
- 如果使用本地归档，必须先加载所有必需的服务镜像。

如果是完整 Web 应用，README 必须说明浏览器入口和登录后的预期页面。
如果是 API-only，README 和 manifest.yaml 必须明确说明没有浏览器管理界面。

四、源码和服务来源要求

1. 确定后端指定 commit 的 GitHub 仓库链接和哈希；
2. 不使用浮动分支、latest、当前主分支或未记录版本；
3. 将 GitHub 仓库链接和 immutable commit 写入 `source/source.yaml`；
4. 不将完整源码快照或逐文件校验清单提交到交付仓库；
5. 如果前端来自独立仓库，必须在 `source/source.yaml` 中记录前端固定仓库和 commit；
7. 如果应用依赖官方或第三方基础镜像，记录每个 image 的仓库、tag、digest、平台和用途；
8. 如果 Compose 直接使用官方数据库、Redis 或其他镜像，不能只记录 tag，必须记录
   digest 或可验证的固定版本信息；
9. 如果服务镜像由本地 Dockerfile 构建，记录 Dockerfile、构建上下文、源码 commit
   和构建参数；
10. 不要把本机路径、代理、OrbStack 配置或 Docker 实例名称写入交付目录。

如果官方项目将前端放在独立仓库：

1. 必须为前端选择并记录固定 GitHub 仓库和 commit；
2. 不将前端源码快照提交到 `source/`；
3. 必须在构建阶段生成前端静态资源，或者使用已验证的固定前端镜像；
4. 必须让最终 Compose 环境提供真实登录页和登录后的业务页面；
5. 前端 API 地址必须指向 Compose 网络中的应用服务，而不是宿主机临时地址；
6. 前端核心 JS、CSS、字体和图片不得依赖运行时 CDN 或宿主机开发服务器。

五、Compose 拓扑要求

docker/compose.yaml 是最终运行配置，必须是唯一明确的标准入口。不要让接收者
自行猜测应该组合哪些 Compose 文件。

整理官方多个 Compose 文件时，可以合并成一个最终 compose.yaml，也可以由 README
明确给出固定的 -f 顺序，但不能留下多个未说明的互相冲突的启动方式。

最终 Compose 必须满足：

1. 应用、数据库、缓存、搜索和消息队列等必需服务保持独立 service；
2. 不得把数据库、Redis 或其他依赖复制进应用镜像；
3. 不得把多个核心服务通过 supervisor 或自定义脚本塞进一个应用容器；
4. 应用通过 Compose service name 连接依赖服务，例如 db、redis；
5. 不要使用宿主机 localhost 作为容器间连接地址；
6. 使用 named volumes 保存数据库和应用状态；
7. 只有确实需要从宿主机访问的服务才映射端口；
8. 必需服务应配置 healthcheck；
9. 使用 `depends_on` 的健康条件表达启动依赖，但不能把它当成完整的可用性保证；
10. 应用自身仍必须在启动时重试依赖服务连接；
11. 不使用 `container_name`，避免不同 Compose 项目互相冲突；
12. 不使用 `latest` 或浮动 image tag；
13. 所有服务明确声明目标平台或记录多平台支持情况；
14. 不把密码、token 或宿主机绝对路径硬编码到 Compose 文件；
15. 不加入 HTTP_PROXY、HTTPS_PROXY、ALL_PROXY 或 OrbStack 专用设置；
16. 不依赖运行时下载 npm、Maven、Composer、Python 或其他依赖。

一个典型结构如下，必须按实际应用调整：

services:
  application:
    image: <APPLICATION_IMAGE>:<VERSION>
    platform: linux/amd64
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_healthy
    environment:
      DB_HOST: db
      REDIS_HOST: redis
    ports:
      - "[HOST_PORT]:80"
    volumes:
      - application-data:/var/lib/application/data
    restart: unless-stopped

  db:
    image: <DATABASE_IMAGE>:<FIXED_VERSION>
    platform: linux/amd64
    environment:
      MYSQL_DATABASE: <DATABASE_NAME>
      MYSQL_USER: <DATABASE_USER>
      MYSQL_PASSWORD: <DATABASE_PASSWORD>
      MYSQL_ROOT_PASSWORD: <DATABASE_ROOT_PASSWORD>
    volumes:
      - database-data:/var/lib/mysql
    healthcheck:
      test: ["CMD-SHELL", "<DATABASE_HEALTHCHECK>"]
      interval: 5s
      timeout: 5s
      retries: 30

  redis:
    image: <REDIS_IMAGE>:<FIXED_VERSION>
    platform: linux/amd64
    volumes:
      - redis-data:/data
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 5s
      timeout: 3s
      retries: 30

volumes:
  application-data:
  database-data:
  redis-data:

上面的服务和变量只是结构示例，不得未经验证直接套用到目标应用。

六、数据库和初始化要求

数据库必须使用官方支持的初始化方式，并且初始化过程必须幂等：

- 只在数据库数据卷为空时执行首次 schema 和 seed 初始化；
- 已有数据时不得重复覆盖数据库；
- 初始化失败时必须让服务状态可诊断，不能伪装为健康；
- 应用必须等待数据库健康后再开始正常提供服务；
- 容器重启后应用和数据库必须恢复；
- database-seed.sql 只能保存真实需要的 seed，不要把运行时数据库数据复制到仓库；
- 管理员账号必须通过应用真实支持的安装、seed、CLI 或管理 API 创建；
- 不要假设所有应用都支持相同的环境变量或 SQL 初始化字段。

数据库、Redis 或其他依赖服务不得使用宿主机服务替代 Compose service，除非交付
目标明确要求外部服务，并在 README 和 manifest.yaml 中记录地址、版本和残余风险。

七、镜像构建和交付要求

本方案允许最终交付包含多个服务镜像，不得把多个服务错误地合并成一个 all-in-one
镜像。

对于每个需要从源码构建的服务：

1. 使用固定源码和固定依赖；
2. 使用目标平台 linux/amd64 构建；
3. 生成固定的 image name 和 version tag；
4. 在构建失败时返回非零退出码；
5. 构建缓存只能加速，不能掩盖失败；
6. 如果复用固定中间镜像，记录 digest、来源和对应源码 commit。

Docker Hub 交付方式：

- Compose 使用已经发布的固定 image tag 和 digest；
- README 明确执行 `docker compose pull`；
- manifest.yaml 记录每个服务的镜像仓库、tag、digest、平台和用途；
- 不使用 `latest`，不依赖没有版本记录的远程镜像；
- 未经明确授权，不自动 push 镜像。

本地归档交付方式：

- image/ 为每个需要的服务保存一个或多个镜像归档；
- 每个归档只包含对应的固定服务镜像，不能混入旧版本或其他应用镜像；
- 生成 image/image.json，列出 service、image、tag、digest、platform 和 archive；
- 生成 image/SHA256SUMS；
- README 列出加载所有镜像的命令；
- 加载后使用 `docker compose up`，不需要重新构建源码或镜像。

不要因为数据库和 Redis 使用官方镜像，就把它们的镜像 tag 写成 latest。
不要把宿主机 Docker socket、源码目录或本机绝对路径挂载到最终 Compose 环境。

八、resources 要求

根据应用真实的数据格式生成：

resources/users.yaml
- 初始管理员账号；
- 用户名；
- 密码或密码说明；
- 用户类型；
- 是否启用；
- 用户用途；
- 账号创建方式。

resources/roles.yaml
- 角色名称；
- 权限；
- 角色用途；
- 与初始账号的关系。

resources/login.sh
- 使用应用真实登录接口；
- 默认使用 README 中记录的 Compose 应用地址；
- 支持通过 APP_URL、用户名和密码环境变量覆盖默认值；
- 登录失败返回非零退出码；
- 登录成功输出明确结果；
- 不依赖手工创建容器名称。

resources/register.sh
- 使用应用真实注册或创建用户接口；
- 参数不满足要求时返回非零退出码；
- 不假设所有应用的注册 API 都相同；
- 如果没有公开注册接口，使用已经验证的 CLI、管理 API 或后台创建方式；
- 在 README 中说明普通用户的真实创建方式；
- 不能伪造通用注册 API。

九、运行时外部依赖

最终 Compose 环境运行时不得依赖核心外部资源：

- 不得依赖远程 CDN 加载核心 JS、CSS 或编辑器；
- 不得依赖远程 API 作为默认后端地址；
- 不得依赖远程图片作为登录页或首页的必要资源；
- 不得在容器启动时下载 npm、Maven、Composer、Python 或其他依赖；
- Docker Hub 镜像拉取必须发生在 `docker compose pull` 阶段，而不是应用启动脚本中；
- 必须扫描前端 bundle、Compose 环境文件和容器启动脚本中的远程 URL；
- 核心启动依赖必须消除；用户主动点击的外部链接可以保留；可选外部功能必须记录。

十、scripts 要求

scripts/up.sh：
- 定位应用根目录和 `docker/compose.yaml`；
- 先执行 `docker compose config --quiet`；
- 根据交付方式执行固定镜像检查或 `docker compose pull`；
- 执行 `docker compose up -d`；
- 等待并报告必需服务健康状态；
- 失败时输出 `docker compose ps` 和相关日志摘要；
- 不要求用户手动创建网络、数据库或缓存容器。

scripts/healthcheck.sh：
- 检查 Compose 配置有效；
- 检查必需服务容器存在并处于 running；
- 检查数据库、缓存和应用健康状态；
- 检查 HTTP 入口和真实应用页面；
- 检查失败时返回非零退出码。

scripts/reset.sh：
- 只操作当前 Compose 项目；
- 停止并删除当前项目容器和网络；
- 按 README 明确说明是否删除命名卷；
- 不删除其他项目容器、镜像或宿主机目录；
- 重置后可以使用 README 中的标准 Compose 命令恢复。

scripts/load-images.sh（仅 LOCAL_ARCHIVE 方式）：
- 加载 image/ 中 manifest 列出的所有服务镜像；
- 加载前检查归档和 SHA256SUMS；
- 任一镜像加载失败必须返回非零退出码；
- 不加载未列入 manifest 的镜像。

十一、manifest 要求

manifest.yaml 必须记录：

- 应用名称和版本；
- 应用类型：完整 Web 应用或 API-only；
- 部署模式：native_compose；
- Compose 文件路径和项目名称；
- 官方 Compose 来源及其固定版本或 commit；
- 后端和前端源码仓库、固定 commit 和校验文件；
- 每个服务的 service name、职责、镜像、tag、digest、平台和来源；
- 每个服务的端口、依赖、健康检查和数据卷；
- 应用运行时、数据库、Redis、搜索和消息队列版本；
- Compose 启动、停止、健康检查和重置脚本；
- Docker Hub 或本地归档交付方式；
- image/image.json 和 image/SHA256SUMS 路径；
- resources 文件路径；
- 最终推荐的 Compose 启动命令；
- 官方 Compose 与交付 Compose 的差异；
- 已知限制和残余风险。

manifest 中必须明确说明：

该环境是原生多容器 Docker Compose 部署，不是 all-in-one 单容器部署。
应用、数据库和其他依赖服务分别运行在独立容器中，并通过 Compose 网络通信。

十二、验收要求

完成构建后必须实际执行，不得只检查文件是否存在。

启动服务后不得立即判定失败，必须在 180 秒内轮询 Compose 服务、健康检查和应用端口。
必须区分“服务尚未启动完成”和“服务启动失败”。超时后按以下顺序定位：

1. Compose 配置解析；
2. 镜像拉取或本地镜像加载；
3. 数据库初始化和数据库健康状态；
4. Redis、搜索或消息队列健康状态；
5. 应用服务日志和端口监听；
6. 应用 HTTP 入口；
7. 浏览器登录和前端资源。

必须验证：

1. `bash -n scripts/*.sh`；
2. `docker compose -f docker/compose.yaml config --quiet`；
3. 所有服务镜像的 tag、digest 和 platform 已记录；
4. Docker Hub 方式可以 pull 固定镜像，或本地归档方式可以加载所有镜像；
5. 只使用 README 中的 Compose 启动命令启动；
6. `docker compose ps` 显示所有必需服务健康；
7. 应用、数据库和其他依赖服务位于独立容器中；
8. 应用可以通过 Compose service name 连接依赖服务；
9. 数据库已经自动初始化，且没有要求手工导入 SQL；
10. 应用根路径返回 HTTP 200，并显示真实应用前端；
11. 浏览器打开 README 中的入口可以显示真实登录页；
12. 使用初始管理员账号和密码完成浏览器登录；
13. 登录后进入真实业务首页并显示菜单、导航或核心业务内容；
14. 主要 JS、CSS、字体和图片资源没有 404；
15. 浏览器控制台没有阻断应用使用的 JavaScript 错误；
16. 使用应用真实支持的方式创建并验证普通用户；
17. 重启 Compose 项目后应用和账号仍然可用；
18. 命名卷可以保留应用和数据库数据；
19. `scripts/reset.sh` 只影响当前 Compose 项目；
20. `image/SHA256SUMS` 校验通过，且 `source/source.yaml` 中的链接和 commit 哈希完整；
21. Compose 中没有 `latest`、未记录 digest 或本机绝对路径；
22. Compose 中没有 all-in-one 进程管理、独立数据库替换或外部宿主机数据库依赖；
23. 最终目录中没有旧的双镜像引用或无关应用镜像；
24. README、manifest、Compose 配置和实际服务名称一致。

在 ARM64 主机运行 linux/amd64 服务时，Docker 可能显示平台不匹配警告。
如果所有服务正常启动并通过验收，这个警告不视为构建失败。
不要因此加入 OrbStack 专用配置。

十三、完成标准

不要在只完成 Compose 设计或只完成部分服务时结束。

完成后必须给出：

1. 实际创建或修改的文件；
2. 最终目录结构；
3. Compose 项目名称和服务列表；
4. 每个服务的镜像名称、tag、digest 和平台；
5. Docker Hub pull 或本地镜像加载命令；
6. 用户最终可以直接执行的 Compose 启动命令；
7. 初始登录账号；
8. 实际执行的验收命令和结果；
9. 官方 Compose 与交付 Compose 的差异；
10. 未完成事项和残余风险。

如果遇到构建或启动问题，先定位是源码、镜像拉取、Compose 解析、网络、数据库、
缓存、应用启动、HTTP 或浏览器验收问题。不要直接把问题隐藏在 all-in-one 容器中，
也不要加入代理、OrbStack 或宿主机专用配置。
```

## 参数示例

以 mall 1.0.3 的原生 Compose 版本为例：

```text
应用名称：mall
应用版本：1.0.3
后端源码仓库：https://github.com/macrozheng/mall
后端固定 commit：dd617ac3fe89c8083af56bee3364b1e812cda3ed
独立前端仓库：https://github.com/macrozheng/mall-admin-web
独立前端固定 commit：2e4a79f10ed55bda7e5452026e76b6f85e87e053
目标平台：linux/amd64
Compose 项目名称：mall-1.0.3
应用服务名称：mall-admin
对外端口：18085
初始管理员账号：admin
初始管理员密码：123456
镜像交付方式：DOCKERHUB
Docker Hub 命名空间：nnin/sop
```

## 最终验收提示词

```text
请对当前应用环境目录进行最终 Docker Compose 交付验收，不要只做静态文件检查。

重点检查：

1. 是否明确标记为 native_compose，而不是 all-in-one；
2. docker/compose.yaml 是否是唯一明确的标准启动入口；
3. Compose 是否保留了应用、数据库、缓存、搜索和其他必需服务的独立容器；
4. 是否可以使用 README 中的 Docker Hub pull 或本地镜像加载方式获得所有镜像；
5. 所有镜像是否使用固定 tag、digest 和 platform；
6. 是否可以执行 `docker compose -f docker/compose.yaml config --quiet`；
7. 是否可以只使用 README 中的命令启动全部服务；
8. 是否在启动后等待服务健康，而不是过早把 Empty reply 或 HTTP 000 判定为失败；
9. 数据库和缓存是否通过 Compose service name 访问；
10. 数据库是否已经自动初始化，且不要求手工导入 SQL；
11. 浏览器打开应用入口是否显示真实登录页或应用首页；
12. 是否可以使用初始管理员账号完成真实浏览器登录；
13. 登录后是否进入真实业务页面并显示核心内容；
14. 前端主要静态资源是否没有 404，浏览器控制台是否没有阻断应用的 JavaScript 错误；
15. 普通用户是否通过应用真实支持的方式创建并验证；
16. 重启 Compose 项目后账号和数据是否仍然可用；
17. reset.sh 是否只删除当前 Compose 项目的资源；
18. 是否保留 manifest.yaml、source 校验和、服务镜像元数据和 image 校验和；
19. 是否错误使用 latest、未记录 digest、本机绝对路径、代理或 OrbStack 配置；
20. 是否错误地将多个服务合并成 all-in-one，或依赖宿主机数据库；
21. README、manifest 和 Compose 配置中的服务名、端口和账号是否一致。

如果发现问题，直接修复并重新执行 Compose 验收，不要只给出问题列表。

最终报告必须包含：
- 修复内容；
- Compose 服务清单；
- 每个服务的镜像和版本；
- 实际执行的启动、健康检查、登录和重置命令；
- 验收结果；
- 用户最终可以执行的最简 Compose 启动命令；
- 未完成事项和残余风险。
```
