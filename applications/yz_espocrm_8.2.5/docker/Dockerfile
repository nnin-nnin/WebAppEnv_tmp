FROM php:8.3-apache@sha256:973e11c67c1c81e7811077a0efa0f910cf903af0ba972cab6ba0c0e15913c771
ENV DEBIAN_FRONTEND=noninteractive APACHE_DOCUMENT_ROOT=/var/www/html/public ESPOCRM_DB_NAME=espocrm ESPOCRM_DB_USER=espocrm ESPOCRM_DB_PASSWORD=espocrm-internal
RUN apt-get update && apt-get install -y --no-install-recommends mariadb-server mariadb-client git unzip curl ca-certificates nodejs npm libicu-dev libzip-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev libxml2-dev libonig-dev libcurl4-openssl-dev libldap2-dev libssl-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j"$(nproc)" gd intl mbstring mysqli pdo_mysql zip exif \
 && a2enmod rewrite headers expires && rm -rf /var/lib/apt/lists/*
COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer
COPY source/espocrm/ /var/www/html/
WORKDIR /var/www/html
# package-lock.json 把 9 个前端依赖钉在 git+ssh://git@github.com/...，直接构建需要 GitHub SSH
# 凭据，在没有部署密钥的机器上会以 "git dep preparation failed" 失败。这里把 SSH 形式改写为
# 匿名 HTTPS（对公开仓库等价，且不引入任何宿主机专用配置），构建结束后删除该 git 配置。
RUN git config --global --add url."https://github.com/".insteadOf "ssh://git@github.com/" \
 && git config --global --add url."https://github.com/".insteadOf "git@github.com:" \
 && export GIT_TERMINAL_PROMPT=0 \
 && composer install --no-dev --prefer-dist --no-interaction --optimize-autoloader \
 && npm ci --no-audit --no-fund && npx grunt offline \
 && rm -rf node_modules .git && rm -f /root/.gitconfig \
 && mkdir -p data custom /var/lib/mysql \
 && chown -R www-data:www-data /var/www/html && chmod -R ug+rwX data custom
COPY scripts/entrypoint.sh /usr/local/bin/espocrm-entrypoint
COPY scripts/healthcheck.sh /usr/local/bin/espocrm-healthcheck
RUN chmod +x /usr/local/bin/espocrm-entrypoint /usr/local/bin/espocrm-healthcheck \
 && sed -ri 's!^[[:space:]]*DocumentRoot .*!\tDocumentRoot /var/www/html!' /etc/apache2/sites-available/000-default.conf \
 && sed -ri 's/@@version/8.2.5/g' /var/www/html/application/Espo/Resources/defaults/config.php \
 && printf '<Directory /var/www/html>\n    AllowOverride All\n    Require all granted\n</Directory>\n<Directory /var/www/html/public>\n    AllowOverride All\n    Require all granted\n</Directory>\n' > /etc/apache2/conf-available/espocrm.conf && a2enconf espocrm
VOLUME ["/var/lib/mysql", "/var/www/html/data", "/var/www/html/custom"]
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=12 CMD /usr/local/bin/espocrm-healthcheck
ENTRYPOINT ["/usr/local/bin/espocrm-entrypoint"]
