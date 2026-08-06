FROM php:7.2-apache@sha256:4dc0f0115acf8c2f0df69295ae822e49f5ad5fe849725847f15aa0e5802b55f8

ENV DEBIAN_FRONTEND=noninteractive \
    APACHE_DOCUMENT_ROOT=/var/www/html \
    FLUXBB_BASE_URL=http://localhost:18311

RUN sed -i -E 's#deb.debian.org/debian-security#archive.debian.org/debian-security#g; s#deb.debian.org/debian#archive.debian.org/debian#g; s#security.debian.org/debian-security#archive.debian.org/debian-security#g' /etc/apt/sources.list \
    && printf 'Acquire::Check-Valid-Until "false";\n' > /etc/apt/apt.conf.d/99archive \
    && apt-get update \
    && apt-get install -y --no-install-recommends mariadb-server mariadb-client curl ca-certificates \
    && docker-php-ext-install mysqli \
    && rm -rf /var/lib/apt/lists/*

COPY source/fluxbb/ /var/www/html/
COPY scripts/ /opt/fluxbb-scripts/

RUN chmod 0755 /opt/fluxbb-scripts/*.sh \
    && mkdir -p /var/lib/fluxbb /var/www/html/cache /var/www/html/img/avatars /run/mysqld /var/log/mysql \
    && rm -f /var/www/html/config.php \
    && ln -s /var/lib/fluxbb/config.php /var/www/html/config.php \
    && chown -R www-data:www-data /var/www/html/cache /var/www/html/img/avatars /var/lib/fluxbb \
    && chown -R mysql:mysql /var/lib/mysql /run/mysqld /var/log/mysql

RUN /opt/fluxbb-scripts/build-initial-data.sh \
    && rm -f /run/mysqld/mysqld.sock /run/mysqld/mysqld.pid /var/log/mysql/mysqld.log /var/log/fluxbb-install.log \
    && rm -f /var/www/html/cache/cache_*.php

EXPOSE 80
VOLUME ["/var/lib/fluxbb", "/var/lib/mysql"]
# 容器内应用监听 80，healthcheck.sh 的默认地址是宿主机侧的 18311，这里显式覆盖。
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=12 \
    CMD FLUXBB_URL=http://127.0.0.1/ /opt/fluxbb-scripts/healthcheck.sh >/dev/null
ENTRYPOINT ["/opt/fluxbb-scripts/entrypoint.sh"]
