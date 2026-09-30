FROM php:8.2-apache

# Install required system packages, mariadb-client and PHP development libraries
RUN apt-get update && apt-get install -y \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    mariadb-client \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql mbstring zip opcache \
    && a2enmod rewrite headers expires deflate mime \
    && rm -rf /var/lib/apt/lists/*

# Suppress PHP deprecation notices
RUN echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" > /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "display_errors = Off" >> /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "upload_max_filesize = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 32M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/uploads.ini

# Apache directory permissions and AllowOverride All
RUN echo '<Directory /var/www/html>' > /etc/apache2/conf-available/bigtree.conf \
    && echo '    Options FollowSymLinks' >> /etc/apache2/conf-available/bigtree.conf \
    && echo '    AllowOverride All' >> /etc/apache2/conf-available/bigtree.conf \
    && echo '    Require all granted' >> /etc/apache2/conf-available/bigtree.conf \
    && echo '</Directory>' >> /etc/apache2/conf-available/bigtree.conf \
    && a2enconf bigtree

# Disable SSL requirement for mariadb client
RUN mkdir -p /etc/mysql/conf.d && printf "[client]\nssl=0\n" > /etc/mysql/conf.d/disable-ssl.cnf

# Copy entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Clone BigTree-CMS source at immutable commit 4a641e01d41121179ea3a7709fa14e2a94c36e31
RUN git clone https://github.com/bigtreecms/BigTree-CMS.git /tmp/src \
    && cd /tmp/src \
    && git checkout 4a641e01d41121179ea3a7709fa14e2a94c36e31 \
    && cp -r . /var/www/html/ \
    && rm -rf /tmp/src /var/www/html/.git

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
