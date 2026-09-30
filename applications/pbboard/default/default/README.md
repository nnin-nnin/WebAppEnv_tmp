# pbboard (default)

pbboard 论坛应用原生 Docker Compose 运行环境。

## 基本信息
- **应用名称**: pbboard
- **版本**: default
- **上游仓库**: https://github.com/pbboard/PBBoard-3.0.4
- **固定 Commit**: bfdb398a01a94f9519b303db088a989f4956d4b1
- **访问地址**: http://127.0.0.1:18852
- **后台地址**: http://127.0.0.1:18852/admincp/
- **管理员账号**: `admin`
- **管理员密码**: `AdminPassword123!`

## 启动环境
```bash
bash scripts/up.sh
```

## 健康检查
```bash
bash scripts/healthcheck.sh
```

## 登录鉴权测试
```bash
bash resources/login.sh
```

## 重置与清理环境
```bash
bash scripts/reset.sh
```
