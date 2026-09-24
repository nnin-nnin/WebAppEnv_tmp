FROM registry.hub.docker.com/library/php@sha256:0970c7c14b21003bce8178af2985b491a65b71e800ff5366053de544306ed2a1

# Install dependencies, git and PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    mariadb-client \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip curl xml opcache \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# PHP's JIT/OPcache combination is unstable for this amd64 image under
# Colima's Rosetta translation and can terminate Apache workers on requests.
RUN printf 'opcache.enable=0\nopcache.jit=0\n' > /usr/local/etc/php/conf.d/zz-disable-opcache.ini

# Clone AbanteCart 1.4.4 source code at exact commit
RUN git clone https://github.com/abantecart/abantecart-src.git /tmp/src \
    && cd /tmp/src \
    && git checkout 051a50f373fad8c8955800f881e08f2f7620600e \
    && cp -r public_html/* /var/www/html/ \
    && rm -rf /tmp/src

# Set working directory
WORKDIR /var/www/html

# Copy entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
