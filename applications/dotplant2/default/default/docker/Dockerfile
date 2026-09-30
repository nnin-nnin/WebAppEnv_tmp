FROM --platform=linux/amd64 yiisoftware/yii2-php:7.2-apache

# Set working directory
WORKDIR /app

# Clone dotplant2 repo at fixed commit fee86c7052c227762c7325eb5c2811d9323f8429
RUN git clone https://github.com/DevGroup-ru/dotplant2.git /tmp/repo \
    && cd /tmp/repo \
    && git checkout fee86c7052c227762c7325eb5c2811d9323f8429 \
    && cp -a /tmp/repo/application/. /app/ \
    && rm -rf /tmp/repo

# Fix SQL syntax typo in migration (INT UNSIGNED UNSIGNED -> INT UNSIGNED)
RUN sed -i 's/INT UNSIGNED UNSIGNED NOT NULL/INT UNSIGNED NOT NULL/g' \
    /app/migrations/m150531_084444_new_init.php \
    /app/extensions/migrations/alpha-beta/m141024_133439_background_tasks.php

# Set production debug mode off in web/index.php
RUN sed -i "s/define('YII_DEBUG', true);/define('YII_DEBUG', false);/" /app/web/index.php \
    && sed -i "s/define('YII_ENV', 'dev');/define('YII_ENV', 'prod');/" /app/web/index.php

# Install composer dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Copy default configurations and entrypoint
COPY db-local.php /app/config/db-local.php
COPY common-local.php /app/config/common-local.php
COPY entrypoint.sh /entrypoint.sh

# Mark installation complete and configure permissions
RUN echo -n "1" > /app/installed.mark \
    && chmod +x /entrypoint.sh \
    && chown -R www-data:www-data /app \
    && chmod -R 775 /app/runtime /app/web/assets /app/config /app/installed.mark /app/web/upload

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
