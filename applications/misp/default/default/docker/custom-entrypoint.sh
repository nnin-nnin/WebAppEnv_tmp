#!/bin/bash
set -e

echo "[Custom Entrypoint] Initializing MISP permissions and settings..."

# Fix config permissions so www-data can read them
chown -R www-data:www-data /var/www/MISP/app/Config
chmod 644 /var/www/MISP/app/Config/*.php 2>/dev/null || true

# Ensure admin password is reset to AdminPassword123! with forced password change disabled
su -s /bin/bash www-data -c "/var/www/MISP/app/Console/cake Password admin@admin.test AdminPassword123! -o" 2>/dev/null || true

# Apply runtime settings as www-data
su -s /bin/bash www-data -c "/var/www/MISP/app/Console/cake Admin setSetting 'MISP.baseurl' '${BASEURL:-http://127.0.0.1:18843}'" 2>/dev/null || true
su -s /bin/bash www-data -c "/var/www/MISP/app/Console/cake Admin setSetting 'MISP.live' 1" 2>/dev/null || true
su -s /bin/bash www-data -c "/var/www/MISP/app/Console/cake Admin setSetting 'Security.disable_instance_locking' 1" 2>/dev/null || true
su -s /bin/bash www-data -c "/var/www/MISP/app/Console/cake Admin setSetting 'Security.check_sec_fetch_site_header' false" 2>/dev/null || true

# Re-enforce config permissions
chown -R www-data:www-data /var/www/MISP/app/Config
chmod 644 /var/www/MISP/app/Config/*.php 2>/dev/null || true

echo "[Custom Entrypoint] Initialization completed successfully."
