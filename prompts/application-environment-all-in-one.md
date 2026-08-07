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
- 预期应用类型：[完整 Web 应用 / API-only]
- 独立前端仓库（如有）：[FRONTEND_REPOSITORY]
- 独立前端固定 commit（如有）：[FRONTEND_COMMIT]
- 目标平台：linux/amd64
- 镜像名称：[IMAGE_NAME]:[VERSION]
- 对外端口：[HOST_PORT]
- 初始管理员账号：[ADMIN_USERNAME]
- 初始管理员密码：[ADMIN_PASSWORD]

最终交付目标是一个真正的 all-in-one Docker 镜像。

如果目标应用是 Web 应用，交付目标是“浏览器可以直接使用的完整应用环境”，必须同时包含实际需要的前端、后端、运行时、数据库和初始化数据。只有后端 API、Swagger 或运行状态页的镜像，不得标记为完整 Web 应用环境。

如果目标应用明确是 API-only，必须在 README.md 和 manifest.yaml 中明确标记 API-only，并将 API 验收作为主要验收方式；不能通过添加一个占位 index.html 来伪装成 Web 应用。

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
7. 应用是否包含用户可见的 Web 前端；阅读官方 README、构建文件和部署文档，检查是否引用独立的前端仓库。
8. 如果存在独立前端，确认前端仓库、固定 commit、构建命令、静态资源目录和后端 API 地址。

必须保留用户已有的、与当前任务相关的修改。
不要执行 git reset --hard、git checkout -- 或其他破坏性恢复操作。
搜索文件优先使用 rg 和 rg --files。

二、目录组织要求

应用目录使用通用格式：

[application]_[version]/
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
scripts/ 保存构建、启动、入口、健康检查和重置等运维脚本。
resources/ 保存用户、角色、登录和注册相关的应用辅助脚本及初始数据；login.sh 和 register.sh 必须放在 resources/ 中。
docker/ 只放 Dockerfile 和 Docker Compose 配置。
入口脚本虽然由 Docker 使用，但文件本身也放在 scripts/ 中。

README.md 是必需交付文件，位于应用目录根目录，使用中文并至少包含以下章节：

1. 应用名称、固定版本和 all-in-one `linux/amd64` 镜像说明；
2. “启动”：从仓库根目录进入应用目录、校验 `image/SHA256SUMS`、`docker load` 和最终 `docker run` 命令；
3. “访问和账号”：浏览器应用地址（如有）、API 地址、初始用户名、密码和角色；
4. “验证”：`scripts/healthcheck.sh`、`resources/login.sh` 和 `resources/register.sh` 的实际命令；
5. “重置”：`scripts/reset.sh` 及重置后的恢复方式；
6. “文件说明”：`manifest.yaml`、`source/`、`docker/`、`resources/`、`scripts/` 和 `image/` 的职责。

README 的启动章节必须明确：接收者只需要 `docker load` 和 `docker run`；镜像内部已经包含应用、数据库、初始化和启动逻辑，不需要执行 `build.sh`、Compose、bootstrap 脚本或 Web Installer。

如果是完整 Web 应用，README 必须说明浏览器入口和登录后的预期页面；如果是 API-only，README 必须明确说明没有浏览器管理界面，不能把状态页写成应用首页。

三、源码要求

1. 确定指定仓库中固定 commit 的 GitHub 链接和哈希；
2. 不使用浮动分支、latest、当前主分支或未记录版本；
3. 将 GitHub 仓库链接和固定 commit 写入 `source/source.yaml`；
4. 不将源码快照或逐文件校验清单提交到交付仓库；
5. 应用运行所需的依赖应在已发布镜像中准备完成；
7. 容器运行时不得联网下载依赖、源码或初始化组件；
8. 不要将本机路径写入构建文件或 manifest。

如果官方项目将前端放在独立仓库：

1. 必须为前端选择并记录固定 GitHub 仓库和 commit；
2. 不将前端源码快照提交到 `source/`；
3. 必须在构建阶段生成前端静态资源；
4. 必须把前端静态资源放入最终镜像，并配置 Web 服务器提供服务；
5. 必须将前端 API 地址配置为当前 all-in-one 容器中的后端地址；
6. 前端源码、构建产物和运行配置都不得依赖宿主机路径或运行时联网下载。

四、all-in-one 镜像要求

最终镜像必须是单个镜像、单个容器。

最终容器必须在内部包含：
- 应用源码和运行依赖；
- 如果是完整 Web 应用，包含可直接访问的前端静态资源；
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

对于完整 Web 应用，容器还必须自动提供前端页面，并保证：

1. 浏览器访问 README 中指定的入口可以加载真实前端页面；
2. 前端静态资源不依赖宿主机开发服务器；
3. 前端请求可以访问同一容器内的后端 API；
4. 登录后可以进入真实的应用页面，而不是只显示服务状态信息。

不得使用以下内容替代真实前端并据此判定 Web 应用完成：

- “service is running” 或类似状态页；
- 只有 Swagger/API 文档的页面；
- 只有 API 登录脚本而没有浏览器登录页面；
- 一个与原应用无关的占位 `index.html`。

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

构建缓存只能用于加速，不能替代失败的构建步骤。
如果源码、依赖或最终镜像构建失败，默认必须让构建失败，不得静默复用本机不明来源的中间镜像。
如果确实复用已经验证的固定中间产物，必须记录其镜像 digest、来源和对应源码 commit，并在最终报告中明确说明没有重新构建该部分。

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
- 先检查应用接口和认证方式，再编写脚本；
- 如果应用没有公开注册接口，必须使用已经验证过的应用支持方式创建普通用户，并在 README 中说明实际方式；不能伪造一个不存在的通用注册 API。

resources/initial-data/
- 放应用初始文件数据；
- 放数据库 seed；
- 不要把运行时临时文件放入这里；
- 不要把宿主机路径写入数据文件。

最终镜像运行时不得依赖核心外部资源：
- 不得依赖远程 CDN 加载核心 JS、CSS 或编辑器；
- 不得依赖远程 API 作为默认后端地址；
- 不得依赖远程图片作为登录页或首页的必要资源；
- 不得在启动时下载 npm、Maven、Composer、Python 或其他依赖。

必须检查最终镜像中的运行时文件和前端 bundle 中的远程 URL。
发现远程 URL 时必须区分：核心启动依赖必须消除；用户主动点击的外部链接可以保留；非核心可选功能必须在最终报告中说明。

八、manifest 要求

manifest.yaml 必须记录：
- 应用名称和版本；
- 应用类型：完整 Web 应用或 API-only；
- 源码仓库；
- 固定 commit；
- 独立前端仓库及其固定 commit（如有）；
- 源码校验文件；
- 目标平台；
- 运行时版本；
- Web 服务器；
- 前端构建命令、静态资源目录和浏览器入口（如有）；
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
如果是完整 Web 应用，还必须明确说明镜像内包含前端静态资源以及前端到后端 API 的连接方式。

九、验收要求

完成构建后必须实际执行，不得只检查文件是否存在。

启动容器后不得立即判定失败，必须在 120 秒内轮询容器和应用状态。
必须区分“应用尚未启动完成”和“应用启动失败”。超时后应按数据库初始化、数据库连接、应用日志、Web 端口监听和容器退出顺序定位问题。

必须验证：

1. 构建脚本语法：

bash -n scripts/*.sh

2. 镜像归档：

docker load -i image/[application]-[version]-linux-amd64.tar

3. 镜像清单只包含一个最终镜像；
4. 使用最终命令启动：

docker run -d -p [HOST_PORT]:80 [IMAGE_NAME]:[VERSION]

5. 等待容器进入 running，等待应用健康检查或应用端口就绪；
6. 检查应用根路径返回 HTTP 200，并确认返回真实应用前端，而不是状态页、Swagger 或占位 HTML；
7. 使用浏览器打开根路径，确认真实登录页可以显示；
8. 使用初始管理员账号和密码完成浏览器登录；
9. 确认登录后进入真实业务首页，并显示应用菜单、导航或核心业务内容；
10. 检查前端引用的主要 JS、CSS、字体和图片资源没有 404；
11. 检查浏览器控制台没有阻断应用使用的 JavaScript 错误；
12. 使用初始管理员账号检查真实登录或认证 API；
13. 使用应用真实支持的方式创建普通用户，并验证创建结果；
14. 检查应用服务和数据库服务都运行在同一个容器内；
15. 检查容器日志中没有致命错误；
16. 检查容器重启后仍能正常运行，并验证已有账号或数据仍然可用；
17. 检查 image/SHA256SUMS；
18. 检查 Compose 只有一个 service；
19. 检查最终交付目录中没有旧的双镜像引用；
20. 检查最终镜像运行时文件中没有核心外部依赖或运行时下载；
21. 检查根目录 README.md 存在，且启动、账号、验证、重置和文件说明与实际产物一致。

如果目标是完整 Web 应用，还必须额外确认：

- 浏览器打开 README 中的应用入口，而不是只用 curl 检查状态码；
- 页面显示真实的应用登录界面或应用首页，不得是占位状态页；
- 主要前端静态资源已经加载，不能只返回一个空白页面或纯文本状态信息；
- 初始管理员账号可以在浏览器中完成登录；
- 登录成功后进入真实的后台或应用页面，并至少确认一个主要页面或核心功能可见；
- 如果前端来自独立仓库，前端 commit、构建产物和 API 配置都记录在 manifest.yaml 中。

如果目标是 API-only：

如果目标是 API-only，必须确认 README 和 manifest.yaml 都明确写明 API-only，且不得因为根路径有一个占位状态页就宣称完成了完整 Web 应用构建。

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
10. scripts/ 下是否包含构建、入口、健康检查和重置等运维脚本；
11. resources/ 下是否包含用户、角色、登录、注册和应用所需的初始数据；
12. 是否保留 manifest.yaml；
13. 是否错误保留了独立数据库镜像；
14. 是否存在 OrbStack、代理、本机路径等特殊配置；
15. SHA256SUMS 是否校验通过。
16. 根目录 README.md 是否存在，且是否给出了准确的直接启动、账号、验证和重置说明。

如果应用是完整 Web 应用，还必须检查：

17. 官方项目是否引用独立前端仓库；
18. 独立前端是否使用固定 commit 并保存到 source/；
19. 浏览器打开应用入口是否显示真实登录页或应用首页；
20. 是否可以使用初始管理员账号完成真实浏览器登录；
21. 登录后是否进入真实应用页面；
22. 主要前端静态资源是否没有 404，浏览器控制台是否没有阻断应用使用的 JavaScript 错误；
23. 是否错误地将状态页、Swagger 页面或纯 API 验证结果当成完整应用完成；
24. 最终镜像运行时是否依赖核心外部 URL 或运行时下载。

如果应用是 API-only，必须在最终结果中明确说明，不得使用“完整 Web 应用”表述。

如果发现问题，直接修复并重新构建镜像，不要只给出问题列表。

最终报告必须包含：
- 修复内容；
- 实际执行的验证命令；
- 验证结果；
- 用户最终可以执行的最简启动命令。
```
