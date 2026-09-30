#!/bin/bash
set -e

# Wait for DB to be reachable
echo "[*] Waiting for database connection at ${DB_HOST:-db}:3306..."
until php -r '
$host = getenv("DB_HOST") ?: "db";
$user = getenv("DB_USER") ?: "dotplant2";
$pass = getenv("DB_PASSWORD") ?: "dotplant2password";
$name = getenv("DB_NAME") ?: "dotplant2";
try {
    $pdo = new PDO("mysql:host=$host;dbname=$name;charset=utf8", $user, $pass);
    exit(0);
} catch (Exception $e) {
    exit(1);
}
'; do
    sleep 1
done
echo "[+] Database is reachable."

# Check if configurables need to be updated
if [ ! -f /app/config/common-configurables.php ]; then
    echo "[*] Initializing dotplant2 configurables..."
    php -r '
    define("YII_CONSOLE", true);
    require "/app/vendor/autoload.php";
    require "/app/vendor/yiisoft/yii2/Yii.php";
    $config = require "/app/config/installer.php";
    $config["components"]["db"] = require "/app/config/db-local.php";
    $app = new yii\console\Application($config);
    Yii::setAlias("@webroot", "/app/web");
    $conf = \app\modules\config\models\Configurable::find()->all();
    \app\modules\config\helpers\ConfigurationUpdater::updateConfiguration($conf, false);
    ' || true
    echo "[+] Configurables initialized."
fi

# Ensure permissions
chown -R www-data:www-data /app/runtime /app/web/assets /app/config /app/installed.mark /app/web/upload 2>/dev/null || true
chmod -R 777 /app/runtime /app/web/assets /app/config /app/installed.mark /app/web/upload 2>/dev/null || true

exec "$@"
