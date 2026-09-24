# 备用运行 Dockerfile：先 docker load 最终归档，再以最终 all-in-one 镜像作为唯一父镜像。
FROM yorem/phpmyadmin:4.7.9
