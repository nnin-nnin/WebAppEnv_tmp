<?php
declare(strict_types=1);

$base = '/var/www/html';
$oscBase = $base . '/includes/OSC';
$dbName = getenv('APP_DB_NAME') ?: 'oscommerce';
$dbUser = getenv('APP_DB_USER') ?: 'oscommerce';
$dbPassword = getenv('APP_DB_PASSWORD') ?: 'oscommerce-internal';
$publicUrl = rtrim(getenv('APP_PUBLIC_URL') ?: 'http://127.0.0.1:18402', '/');
$timeZone = getenv('TZ') ?: 'Asia/Shanghai';

function write_config(string $oscBase, string $dbName, string $dbUser, string $dbPassword, string $publicUrl, string $timeZone): void
{
    @mkdir($oscBase . '/Conf', 0775, true);
    @mkdir($oscBase . '/Sites/Shop', 0775, true);
    @mkdir($oscBase . '/Sites/Admin', 0775, true);

    $global = <<<'PHP'
<?php
$ini = <<<EOD
db_server = "127.0.0.1"
db_server_username = "__DB_USER__"
db_server_password = "__DB_PASSWORD__"
db_database = "__DB_NAME__"
db_table_prefix = ""
store_sessions = "MySQL"
time_zone = "__TIME_ZONE__"
EOD;
PHP;
    $global = strtr($global, [
        '__DB_USER__' => addslashes($dbUser),
        '__DB_PASSWORD__' => addslashes($dbPassword),
        '__DB_NAME__' => addslashes($dbName),
        '__TIME_ZONE__' => addslashes($timeZone),
    ]) . "\n";
    file_put_contents($oscBase . '/Conf/global.php', $global, LOCK_EX);

    $site = static function (string $path, string $root, string $httpPath) use ($publicUrl): void {
        $contents = <<<'PHP'
<?php
$ini = <<<EOD
dir_root = "__ROOT__"
http_server = "__SERVER__"
http_path = "__PATH__"
http_images_path = "images/"
http_cookie_domain = ""
http_cookie_path = "__PATH__"
EOD;
PHP;
        $contents = strtr($contents, [
            '__ROOT__' => addslashes($root),
            '__SERVER__' => addslashes($publicUrl),
            '__PATH__' => addslashes($httpPath),
        ]) . "\n";
        file_put_contents($path, $contents, LOCK_EX);
    };

    $site($oscBase . '/Sites/Shop/site_conf.php', $oscBase . '/../../', '/');
    $site($oscBase . '/Sites/Admin/site_conf.php', $oscBase . '/../../admin/', '/admin/');
}

write_config($oscBase, $dbName, $dbUser, $dbPassword, $publicUrl, $timeZone);

define('OSCOM_BASE_DIR', $oscBase . '/');
require OSCOM_BASE_DIR . 'OM/OSCOM.php';
spl_autoload_register('OSC\\OM\\OSCOM::autoload');

use OSC\OM\Db;
use OSC\OM\OSCOM;
use OSC\OM\Registry;

OSCOM::initialize();
$db = Db::initialize();
$db->setTablePrefix('');

$adminCount = 0;
try {
    $adminCount = (int)$db->query('SELECT COUNT(*) FROM administrators')->fetchColumn();
} catch (Throwable $ignored) {
    $adminCount = 0;
}

if ($adminCount > 0) {
    fwrite(STDOUT, "osCommerce database already initialized\n");
    exit(0);
}

$schemaDir = '/opt/oscommerce/bootstrap/Schema';
$db->exec('SET FOREIGN_KEY_CHECKS = 0');
foreach (glob($schemaDir . '/*.txt') as $schemaFile) {
    $table = basename($schemaFile, '.txt');
    $db->exec('DROP TABLE IF EXISTS ' . $table);
    $schema = Db::getSchemaFromFile($schemaFile);
    $db->exec(Db::getSqlFromSchema($schema));
}
$db->importSQL('/opt/oscommerce/bootstrap/oscommerce.sql', '');
$db->exec('SET FOREIGN_KEY_CHECKS = 1');

Registry::set('Db', $db);

$_POST = [
    'DB_SERVER' => '127.0.0.1',
    'DB_SERVER_USERNAME' => $dbUser,
    'DB_SERVER_PASSWORD' => $dbPassword,
    'DB_DATABASE' => $dbName,
    'DB_TABLE_PREFIX' => '',
    'CFG_STORE_NAME' => 'osCommerce Benchmark Store',
    'CFG_STORE_OWNER_NAME' => 'Benchmark Store Owner',
    'CFG_STORE_OWNER_EMAIL_ADDRESS' => 'root@localhost',
    'CFG_ADMINISTRATOR_USERNAME' => 'admin',
    'CFG_ADMINISTRATOR_PASSWORD' => 'benchmark-only',
    'CFG_ADMIN_DIRECTORY' => 'admin',
    'DIR_FS_DOCUMENT_ROOT' => $base . '/',
    'HTTP_WWW_ADDRESS' => $publicUrl . '/',
    'TIME_ZONE' => $timeZone,
];

ob_start();
require $base . '/install/templates/pages/install_4.php';
ob_end_clean();

if (!is_file($oscBase . '/Conf/global.php') || !is_file($oscBase . '/Sites/Shop/site_conf.php')) {
    throw new RuntimeException('osCommerce configuration files were not generated');
}

file_put_contents('/var/lib/oscommerce/initialized', gmdate('c') . "\n", LOCK_EX);
fwrite(STDOUT, "osCommerce database initialized with administrator admin\n");

