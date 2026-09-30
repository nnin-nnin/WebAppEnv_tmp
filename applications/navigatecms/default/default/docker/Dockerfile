FROM php:7.4-apache

# Configure Debian archive sources for Bullseye
RUN echo "deb http://archive.debian.org/debian bullseye main" > /etc/apt/sources.list

# Install system dependencies, mysql client and PHP development libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    default-mysql-client \
    unzip \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql mbstring zip xml curl \
    && a2enmod rewrite headers \
    && rm -rf /var/lib/apt/lists/*

# Suppress PHP deprecation notices, disable opcache (ARM64 emulation safety), set memory and upload limits
RUN echo "opcache.enable = 0" > /usr/local/etc/php/conf.d/disable-opcache.ini \
    && echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE & ~E_WARNING" > /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "display_errors = Off" >> /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "upload_max_filesize = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/uploads.ini

# Apache directory permissions and AllowOverride All
RUN echo '<Directory /var/www/html>' > /etc/apache2/conf-available/navigatecms.conf \
    && echo '    Options FollowSymLinks' >> /etc/apache2/conf-available/navigatecms.conf \
    && echo '    AllowOverride All' >> /etc/apache2/conf-available/navigatecms.conf \
    && echo '    Require all granted' >> /etc/apache2/conf-available/navigatecms.conf \
    && echo '</Directory>' >> /etc/apache2/conf-available/navigatecms.conf \
    && a2enconf navigatecms

# Clone NavigateCMS source code at immutable commit 1b30d869a162462dbc635693a7fd1293e55d0652
RUN git clone https://github.com/NavigateCMS/Navigate-CMS.git /tmp/src \
    && cd /tmp/src \
    && git checkout 1b30d869a162462dbc635693a7fd1293e55d0652 \
    && cp -r . /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git \
    && php -r '$f = "/var/www/html/lib/core/core.php"; $c = file_get_contents($f); $c = preg_replace("/(function\s+core_define_navigate_url[^{]*\{)/s", "$1\n    if(defined(\"NAVIGATE_URL\")) { return; }", $c); file_put_contents($f, $c);' \
    && sed -i 's/\$port = (\$_SERVER\["SERVER_PORT"\] == "80")/\$port = (strpos(\$_SERVER["HTTP_HOST"], ":") !== false || \$_SERVER["SERVER_PORT"] == "80")/' /var/www/html/web/nvweb_routes.php \
    && chown -R www-data:www-data /var/www/html

# Copy entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
