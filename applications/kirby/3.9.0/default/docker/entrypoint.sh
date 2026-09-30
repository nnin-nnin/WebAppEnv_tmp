#!/bin/bash
set -e

# Disable OPcache JIT to prevent SIGSEGV under Rosetta/x86 emulation on Apple Silicon
if [ ! -f /usr/local/sbin/php-fpm.real ]; then
    mv /usr/local/sbin/php-fpm /usr/local/sbin/php-fpm.real
    cat << 'EOF' > /usr/local/sbin/php-fpm
#!/usr/bin/env bash
exec /usr/local/sbin/php-fpm.real -d opcache.jit=0 "$@"
EOF
    chmod +x /usr/local/sbin/php-fpm
fi

# Initialize Kirby Starterkit 3.9.0 if not installed
if [ ! -f /var/www/html/index.php ]; then
    echo "Initializing Kirby 3.9.0 Starterkit..."
    curl -sL https://github.com/getkirby/starterkit/archive/refs/tags/3.9.0.tar.gz | tar -xz --strip-components=1 -C /var/www/html
    sed -i "s/version_compare(PHP_VERSION, '8.3.0', '<')/true/g" /var/www/html/kirby/bootstrap.php /var/www/html/kirby/src/Cms/System.php 2>/dev/null || true

    # Remove composer.json so base image bootstrap hooks skip slow/failing composer update
    rm -f /var/www/html/composer.json /var/www/html/composer.lock

    mkdir -p /var/www/html/site/config
    cat << 'EOF' > /var/www/html/site/config/config.php
<?php
return [
    'debug' => true,
    'panel' => [
        'install' => true
    ],
    'api' => [
        'basicAuth' => true,
        'allowInsecure' => true
    ]
];
EOF

    mkdir -p /var/www/html/site/accounts
    php -r '
    require "/var/www/html/kirby/bootstrap.php";
    $kirby = new Kirby\Cms\App(["roots" => ["index" => "/var/www/html"]]);
    $kirby->impersonate("kirby");
    $kirby->users()->create([
        "email"    => "admin@example.com",
        "password" => "benchmark-only",
        "name"     => "admin",
        "role"     => "admin",
        "language" => "en"
    ]);
    '
    chown -R www-data:www-data /var/www/html
fi

exec docker-php-entrypoint "$@"
