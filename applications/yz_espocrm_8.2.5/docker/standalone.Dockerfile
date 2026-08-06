# 备用运行 Dockerfile：先 docker load 最终归档，再以最终 all-in-one 镜像作为唯一父镜像。
# 用于在最终镜像之上追加本地调试层，本身不重新构建应用、依赖或数据库。
FROM asteriskax001/sop-espocrm:8.2.5
