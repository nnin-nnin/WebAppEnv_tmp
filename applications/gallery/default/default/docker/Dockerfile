FROM alpine/git:latest AS source
RUN git clone https://github.com/gallery/gallery3.git /src \
    && cd /src \
    && git checkout c7c18b125662f3e2f10ed5eb41fe21b69c2d4d82 \
    && rm -rf .git

FROM --platform=linux/amd64 php:5.6-apache

# Configure Debian archive sources for Stretch
RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list \
    && echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check-valid-until \
    && echo "Acquire::AllowInsecureRepositories true;" >> /etc/apt/apt.conf.d/99no-check-valid-until \
    && apt-get update -qq \
    && apt-get install -y --no-install-recommends --allow-unauthenticated \
       libpng-dev \
       libjpeg62-turbo-dev \
       libfreetype6-dev \
       unzip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd mysql mysqli pdo_mysql \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Apache & PHP configuration
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
    && { \
        echo 'short_open_tag = On'; \
        echo 'memory_limit = 256M'; \
        echo 'post_max_size = 64M'; \
        echo 'upload_max_filesize = 64M'; \
        echo 'date.timezone = UTC'; \
    } > /usr/local/etc/php/conf.d/gallery.ini

WORKDIR /var/www/html

# Copy application source
COPY --from=source /src/ /var/www/html/

# Create var directory structure, security htaccess files, and set permissions
RUN mkdir -p /var/www/html/var/albums \
             /var/www/html/var/logs \
             /var/www/html/var/modules \
             /var/www/html/var/resizes \
             /var/www/html/var/thumbs \
             /var/www/html/var/tmp \
             /var/www/html/var/uploads \
    && printf "DirectoryIndex .htaccess\nSetHandler Gallery_Security_Do_Not_Remove\nOptions None\n<IfModule mod_rewrite.c>\nRewriteEngine off\n</IfModule>\nOrder allow,deny\nDeny from all\n" > /var/www/html/var/logs/.htaccess \
    && printf "DirectoryIndex .htaccess\nSetHandler Gallery_Security_Do_Not_Remove\nOptions None\n<IfModule mod_rewrite.c>\nRewriteEngine off\n</IfModule>\nOrder allow,deny\nDeny from all\n" > /var/www/html/var/tmp/.htaccess \
    && printf "DirectoryIndex .htaccess\nSetHandler Gallery_Security_Do_Not_Remove\nOptions None\n<IfModule mod_rewrite.c>\nRewriteEngine off\n</IfModule>\nOrder allow,deny\nDeny from all\n" > /var/www/html/var/uploads/.htaccess \
    && sed -i 's/# <IfModule mod_rewrite.c>/<IfModule mod_rewrite.c>/g' /var/www/html/.htaccess \
    && sed -i 's/#   Options +FollowSymLinks/  Options +FollowSymLinks/g' /var/www/html/.htaccess \
    && sed -i 's/#   RewriteEngine On/  RewriteEngine On/g' /var/www/html/.htaccess \
    && sed -i 's/#   RewriteBase \//  RewriteBase \//g' /var/www/html/.htaccess \
    && sed -i 's/#   RewriteCond %{REQUEST_FILENAME} !-f/  RewriteCond %{REQUEST_FILENAME} !-f/g' /var/www/html/.htaccess \
    && sed -i 's/#   RewriteCond %{REQUEST_FILENAME} !-d/  RewriteCond %{REQUEST_FILENAME} !-d/g' /var/www/html/.htaccess \
    && sed -i 's/#   RewriteRule \^(.*)\$ index.php?kohana_uri=\$1 \[QSA,PT,L\]/  RewriteRule ^(.*)$ index.php?kohana_uri=$1 [QSA,PT,L]/g' /var/www/html/.htaccess \
    && sed -i 's/#   RewriteRule \^\$ index.php?kohana_uri=\$1 \[QSA,PT,L\]/  RewriteRule ^$ index.php?kohana_uri=$1 [QSA,PT,L]/g' /var/www/html/.htaccess \
    && sed -i '/mod_rewrite\.c/,/<\/IfModule>/ s/# <\/IfModule>/<\/IfModule>/' /var/www/html/.htaccess \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/var

COPY database.php /var/www/html/var/database.php
RUN chown www-data:www-data /var/www/html/var/database.php && chmod 666 /var/www/html/var/database.php

EXPOSE 80
