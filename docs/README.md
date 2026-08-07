# Web 应用环境构建

## 1. 背景

本项目面向 Web 安全研究，收集论文或研究任务中使用的真实 Web 应用，并将指定版本构造成固定、可验证的运行环境。

每个应用版本都对应一个独立目录。目录中同时保存固定版本源码、Docker 构建文件、初始账号和数据、验证脚本，以及已经构建好的 all-in-one Docker 镜像。

交付后的使用方式是：接收者从 Docker Hub 拉取镜像，或从 `image/` 导入镜像，然后直接运行一个容器，访问真实 Web 应用并完成登录验证。

## 2. 目标产物

每个应用版本的目录结构如下：

```text
<application>_<version>/
├── README.md
├── manifest.yaml
├── source/
├── resources/
├── docker/
├── scripts/
└── image/
```

| 路径 | 内容 |
| --- | --- |
| `README.md` | 应用版本、启动命令、访问地址、账号和验证方式 |
| `manifest.yaml` | 源码版本、运行时、镜像、资源和脚本索引 |
| `source/` | GitHub 仓库链接和固定 commit 哈希（`source/source.yaml`）；不保存源码快照 |
| `resources/` | 初始数据、用户、角色、登录和注册脚本 |
| `docker/` | Dockerfile 和用于调试或追溯的 Compose 配置 |
| `scripts/` | 构建、容器入口、健康检查和重置脚本 |
| `image/` | 最终 all-in-one 镜像 tar、元数据和校验和 |

目标产物是一个可直接运行的最终镜像。镜像内部已经包含应用运行所需的运行时、源码、依赖、数据库或缓存、初始数据和入口程序。接收者不需要重新构建源码、配置外部数据库或执行 Web Installer。

## 3. 如何使用 `code/` 中的两个代码文件

### `codex_environment_runner.py`

这是环境构建运行器。它读取并参数化 `prompts/application-environment-all-in-one.md`，调用本机已经登录的 Codex CLI，让 Codex 在指定目录中完成应用检查、文件构建、Docker 镜像构建和验收。

运行记录保存在 `applications/code/runs/`，包括开始时间、结束时间、耗时、事件日志、最终回复和 token 用量。

运行前先登录 Codex，并进入 `applications/` 目录：

```bash
codex login
cd applications
export CODEX_ADMIN_PASSWORD='benchmark-only'
```

以 EspoCRM 8.2.5 为例：

```bash
python3 code/codex_environment_runner.py \
  --application EspoCRM \
  --version 8.2.5 \
  --source-repository https://github.com/espocrm/espocrm \
  --commit 06be47c3488c7c369ee879b920ec4c3fc4acbb5d \
  --image-name nnin/sop-espocrm \
  --host-port 18092 \
  --workdir .
```

运行其他应用时，替换应用名称、版本、源码仓库、commit、镜像名和端口即可。

### `test_codex_environment_runner.py`

这是运行器的单元测试，不会构建 Docker 镜像。它主要检查：

- prompt 参数是否正确替换；
- 未替换的占位符是否能够被发现；
- Codex 事件中的 token 用量是否能够正确统计。

执行测试：

```bash
cd applications
python3 code/test_codex_environment_runner.py
```

只检查参数、prompt 和命令构造，不启动 Codex：

```bash
python3 code/codex_environment_runner.py \
  --application Example \
  --version 1.0 \
  --source-repository https://example.test/source \
  --commit 0000000 \
  --image-name example \
  --host-port 18080 \
  --admin-password placeholder \
  --validate-only
```

## 4. 如何验证

应用构建完成后，需要人工打开应用目录并完成一次真实运行验证。`test_codex_environment_runner.py` 和 `--validate-only` 只能验证运行器本身，不能证明应用可以使用。

### 4.1 检查应用目录

进入生成的应用目录，确认以下内容存在：

```text
<application>_<version>/
├── README.md
├── manifest.yaml
├── source/
├── resources/
├── docker/
├── scripts/
└── image/
```

然后人工查看：

- `README.md` 是否写明版本、启动命令、访问地址和账号；
- `manifest.yaml` 中的版本、源码 commit、镜像名和端口是否与目录内容一致；
- `source/source.yaml` 是否记录固定版本的 GitHub 仓库和 commit 哈希；
- `resources/` 是否有初始数据、账号和角色信息；
- `scripts/` 是否有健康检查和重置脚本；
- `image/` 是否有最终镜像 tar、元数据和 `SHA256SUMS`。

### 4.2 启动应用

先按照 README 中的命令启动。随目录交付镜像 tar 时：

```text
(cd image && sha256sum -c SHA256SUMS)
docker load -i image/<application>-<version>-<platform>.tar
docker run -d -p <host-port>:80 <image-name>:<tag>
```

使用 Docker Hub 镜像时，直接执行应用 README 中的 `docker run` 命令即可，Docker 会自动拉取镜像。

执行后查看容器状态，确认容器没有立即退出：

```bash
docker ps
docker logs <container-name-or-id>
```

### 4.3 浏览器人工验证

在浏览器中打开 README 中记录的访问地址，人工确认：

1. 页面显示真实应用的登录页面，而不是空白页、安装页、Apache 默认页或错误页；
2. 使用 README 中的初始用户名和密码登录；
3. 登录成功后进入应用的真实业务首页；
4. 页面中的菜单、主要资源或最小业务操作可以正常显示；
5. 如果应用包含多个角色，分别使用管理员和普通用户账号登录，确认角色配置生效。

### 4.4 重启后再次验证

登录成功后重启容器：

```bash
docker restart <container-name-or-id>
```

等待应用恢复，再次打开访问地址并登录。确认数据库、账号、角色和必要的应用状态没有因为重启丢失。

容器启动后至少确认：

- 容器处于运行状态；
- Web 首页可以访问；
- 初始账号可以登录；
- 登录后能够进入真实业务页面；
- 重启容器后应用和账号仍然可用。

健康检查脚本和登录脚本可以作为辅助检查，但不能代替浏览器人工验证。最终要确认的是：别人拿到这个应用目录后，能够按照 README 启动应用并完成登录。

### 4.5 示例：人工验证 EspoCRM 8.2.5

#### 1. 检查应用目录

进入应用目录：

```bash
cd applications/espocrm_8.2.5
```

先看目录是否完整：

```bash
ls -la
find source docker resources scripts image -maxdepth 2 -type f | sort
```

然后逐个打开关键文件：

```bash
sed -n '1,160p' README.md
sed -n '1,220p' manifest.yaml
cat resources/users.yaml
```

重点确认：

- `README.md` 中的版本是 EspoCRM 8.2.5；
- `manifest.yaml` 中的源码 commit、镜像名和端口与 README 一致；
- `source/source.yaml` 中存在固定版本的 GitHub 仓库和 commit 哈希；
- `resources/users.yaml` 中存在 `admin` 账号；
- `scripts/healthcheck.sh` 和 `resources/login.sh` 存在；
- `image/` 中存在最终镜像和校验文件。

#### 2. 拉取并运行镜像

先拉取 Docker Hub 镜像：

```bash
docker pull nnin/sop-espocrm:8.2.5
```

启动容器：

```bash
docker run -d \
  --platform linux/amd64 \
  --name espocrm-8.2.5 \
  -p 18092:80 \
  nnin/sop-espocrm:8.2.5
```

查看容器是否正常运行：

```bash
docker ps
docker logs espocrm-8.2.5
```

如果使用目录中交付的镜像 tar，则先执行：

```bash
(cd image && sha256sum -c SHA256SUMS)
docker load -i image/espocrm-8.2.5-linux-amd64.tar
```

之后仍然使用上面的 `docker run` 命令启动。

#### 3. 运行脚本验证

在应用目录执行：

```bash
./scripts/healthcheck.sh
```

脚本会检查：

- `http://localhost:18092` 是否返回正常页面；
- 使用 `admin / benchmark-only` 是否能够访问 EspoCRM API；
- 登录脚本是否执行成功。

脚本通过后，再进行浏览器验证。脚本通过不能代替浏览器验证。

#### 4. 浏览器登录验证

在浏览器中打开：

```text
http://localhost:18092
```

打开后人工确认：

1. 页面显示 EspoCRM 的登录页面；
2. 页面不是空白页、Apache 默认页、安装页或错误页；
3. 页面中有用户名输入框、密码输入框和登录按钮；
4. 在用户名输入框填写 `admin`；
5. 在密码输入框填写 `benchmark-only`；
6. 点击登录按钮；
7. 登录成功后进入 EspoCRM 的主页面或后台首页，并能看到应用导航、菜单或仪表盘内容；
8. 页面没有提示账号密码错误，也没有跳回登录页。

#### 5. 重启后再次登录

登录成功后重启容器：

```bash
docker restart espocrm-8.2.5
```

等待几秒后重新访问 `http://localhost:18092`，再次使用 `admin / benchmark-only` 登录。登录仍然成功，说明容器内部的 MariaDB、Apache、应用配置和初始账号可以在重启后继续工作。

以上步骤全部通过后，才能将 EspoCRM 8.2.5 标记为人工验证通过。
