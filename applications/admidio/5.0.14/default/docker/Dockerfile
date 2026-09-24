FROM registry.hub.docker.com/alpine/git@sha256:16ad8e788e1d3b0c30f18da8dde5c0ace3b187445a62d8af893b003ca1e70592 AS src
WORKDIR /src
RUN git init . \
    && git remote add origin https://github.com/Admidio/admidio.git \
    && git fetch --depth 1 origin 0db5895d237c32708c2ea6ab057708d952e999ca \
    && git checkout --detach FETCH_HEAD

FROM registry.hub.docker.com/library/php@sha256:060ed9c0f6e4bbe4f8b25a34ca1ec596b96d8f4011cf7ee7eb6b7eecf01cb74f

ARG ADMIDIO_BUILD_DATE
ARG ADMIDIO_VCS_REF
ARG ADMIDIO_VERSION=5.0.14

ENV TZ="UTC"
ENV APACHE_DOCUMENT_ROOT="/var/www/html"

# Install required system dependencies & PHP extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        libicu-dev \
        libbz2-dev \
        libldap2-dev \
        rsync \
        cron \
        curl \
        && docker-php-ext-configure gd --with-freetype --with-jpeg \
        && docker-php-ext-install -j$(nproc) \
        mysqli \
        pdo \
        pdo_mysql \
        gd \
        zip \
        intl \
        bz2 \
        ldap \
        bcmath \
        && a2enmod rewrite \
        && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=src /src ${APACHE_DOCUMENT_ROOT}/
WORKDIR ${APACHE_DOCUMENT_ROOT}

RUN mkdir -p ${APACHE_DOCUMENT_ROOT}/provisioning && \
    cp -a ${APACHE_DOCUMENT_ROOT}/adm_my_files ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    cp -a ${APACHE_DOCUMENT_ROOT}/adm_plugins ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    cp -a ${APACHE_DOCUMENT_ROOT}/install ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    cp -a ${APACHE_DOCUMENT_ROOT}/languages ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    cp -a ${APACHE_DOCUMENT_ROOT}/libs ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    cp -a ${APACHE_DOCUMENT_ROOT}/modules ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    cp -a ${APACHE_DOCUMENT_ROOT}/rss ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    cp -a ${APACHE_DOCUMENT_ROOT}/src ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    cp -a ${APACHE_DOCUMENT_ROOT}/system ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    cp -a ${APACHE_DOCUMENT_ROOT}/themes ${APACHE_DOCUMENT_ROOT}/provisioning/ && \
    rm -rf ${APACHE_DOCUMENT_ROOT}/adm_my_files ${APACHE_DOCUMENT_ROOT}/adm_plugins ${APACHE_DOCUMENT_ROOT}/themes && \
    echo -n "5.0.14" > ${APACHE_DOCUMENT_ROOT}/.admidio_image_version

COPY --from=registry.hub.docker.com/composer/composer@sha256:536116acd18cd2d99d0351c1dfded22c83f34cef481d83f2747ff2cbca7587cd /composer /usr/bin/composer
RUN composer install --no-dev --optimize-autoloader

COPY --from=src /src/dockerscripts/startup.sh /usr/local/bin/entrypoint.sh
# The upstream script assumes the original image document root. This image
# deliberately serves from the PHP base image's /var/www/html path.
RUN sed -i 's#/opt/app-root/src#/var/www/html#g' /usr/local/bin/entrypoint.sh \
    && sed -i 's/8080/80/g' /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh

HEALTHCHECK --interval=10s --timeout=5s --retries=5 CMD curl -f http://localhost:80/adm_program/index.php || curl -f http://localhost:80/ || exit 1

EXPOSE 80
CMD ["/usr/local/bin/entrypoint.sh"]
