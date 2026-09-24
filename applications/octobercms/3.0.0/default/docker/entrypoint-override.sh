#!/bin/bash
set -e

# Disable opcache.enable_cli to prevent futex / SIGSEGV under Rosetta emulation
sed -i 's/opcache.enable_cli=1/opcache.enable_cli=0/' /usr/local/etc/php/conf.d/oc-opcache.ini 2>/dev/null || true

# Background worker to ensure default administrator exists after initial migration
(
  while ! mysqladmin ping -u root -proot --silent 2>/dev/null; do
    sleep 1
  done
  while [ ! -f /var/www/html/artisan ]; do
    sleep 1
  done
  sleep 3
  php -r '
    require "/var/www/html/bootstrap/autoload.php";
    $app = require_once "/var/www/html/bootstrap/app.php";
    $app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();
    if (\Backend\Models\User::count() == 0) {
        \Backend\Models\User::createDefaultAdmin([
            "first_name" => "Admin",
            "last_name" => "User",
            "email" => "admin@example.com",
            "login" => "admin",
            "password" => "admin",
            "password_confirmation" => "admin"
        ]);
        echo "Default admin user created successfully\n";
    }
  ' || true
) &

exec /usr/local/bin/entrypoint.sh
