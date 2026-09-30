FROM php:7.4-apache

# Use Debian Bullseye archive mirror and install dependencies
RUN echo "deb http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list \
    && apt-get update -o Acquire::Check-Valid-Until=false \
    && apt-get install -y --no-install-recommends \
       git \
       mariadb-client \
       libpng-dev \
       libjpeg-dev \
       libfreetype6-dev \
       libonig-dev \
       libzip-dev \
       libxml2-dev \
       gettext \
       curl \
       ca-certificates \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql mbstring xml gettext zip \
    && a2enmod rewrite headers \
    && rm -rf /var/lib/apt/lists/*

# Suppress PHP deprecation notices and configure PHP settings
RUN echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" > /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "display_errors = Off" >> /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "upload_max_filesize = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "date.timezone = UTC" >> /usr/local/etc/php/conf.d/timezone.ini

# Clone Horde upstream repository at immutable commit d6e0a0a539af2cf2a3dd0092849fc134a9af2cf8
# and install framework packages and base horde web application
RUN git clone --depth 1 -b master https://github.com/horde/horde.git /tmp/horde \
    && cd /tmp/horde \
    && git checkout d6e0a0a539af2cf2a3dd0092849fc134a9af2cf8 \
    && php /tmp/horde/framework/bin/install_framework --horde /var/www/html --dest /usr/local/lib/php --copy --src /tmp/horde/framework \
    && cp -r /tmp/horde/horde/* /var/www/html/ \
    && rm -rf /tmp/horde /var/www/html/.git

# Patch Horde Translation Autodetect to prevent gettext crashes on missing locale directories,
# pre-create data locale directories, and substitute @data_dir@ placeholder
RUN php -r ' \
    $file = "/usr/local/lib/php/Horde/Translation/Autodetect.php"; \
    $c = file_get_contents($file); \
    $old = "throw new Horde_Translation_Exception(sprintf(\x27Could not found find any locale directory for %s domain.\x27, static::\$_domain));"; \
    $new = "\$directory = \x27/usr/local/lib/php/data/\x27 . static::\$_domain . \x27/locale\x27; @mkdir(\$directory, 0777, true);"; \
    $c = str_replace($old, $new, $c); \
    file_put_contents($file, $c); \
    ' \
    && sed -i "s|@data_dir@|/usr/local/lib/php/data|g" /usr/local/lib/php/Horde/*/Translation.php 2>/dev/null || true \
    && sed -i "s|@data_dir@|/usr/local/lib/php/data|g" /usr/local/lib/php/Horde/*/*/Translation.php 2>/dev/null || true \
    && mkdir -p /usr/local/lib/php/data \
    && for d in Horde_Core Horde_Prefs Horde_Auth Horde_Mime Horde_View Horde_Util Horde_Date Horde_Db Horde_Browser Horde_Perms Horde_Group Horde_Alarm Horde_Image Horde_LoginTasks Horde_Mail Horde_Nls Horde_Rpc Horde_Serialize Horde_Support Horde_Text_Diff Horde_Text_Filter Horde_Token Horde_Tree Horde_Url Horde_Vfs; do \
         mkdir -p "/usr/local/lib/php/data/${d}/locale"; \
       done \
    && chmod -R 777 /usr/local/lib/php/data

# Copy schema and entrypoint script
RUN mkdir -p /var/www/html/scripts/sql
COPY resources/schema.sql /var/www/html/scripts/sql/schema.sql
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
