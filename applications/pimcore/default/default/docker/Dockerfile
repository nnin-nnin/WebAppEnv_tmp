FROM pimcore/pimcore:php8.2-latest

# Install Apache2 and required proxy modules
RUN apt-get update && apt-get install -y --no-install-recommends \
        apache2 \
    && a2enmod proxy proxy_fcgi rewrite headers env dir mime \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Disable opcache for ARM64 emulation safety and set PHP runtime limits
RUN echo "opcache.enable = 0" > /usr/local/etc/php/conf.d/99-disable-opcache.ini \
    && echo "opcache.enable_cli = 0" >> /usr/local/etc/php/conf.d/99-disable-opcache.ini \
    && echo "memory_limit = 512M" >> /usr/local/etc/php/conf.d/99-disable-opcache.ini \
    && echo "upload_max_filesize = 100M" >> /usr/local/etc/php/conf.d/99-disable-opcache.ini \
    && echo "post_max_size = 100M" >> /usr/local/etc/php/conf.d/99-disable-opcache.ini \
    && echo "date.timezone = UTC" >> /usr/local/etc/php/conf.d/99-disable-opcache.ini

# Copy Apache VirtualHost configuration
COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf

# Copy entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apachectl", "-D", "FOREGROUND"]
