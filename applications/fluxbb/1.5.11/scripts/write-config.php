<?php
$config_dir = '/var/lib/fluxbb';
if (!is_dir($config_dir) && !mkdir($config_dir, 0775, true)) die("Unable to create config directory\n");
$base_url = getenv('FLUXBB_BASE_URL') ?: 'http://localhost:18311';
$config = "<?php\n\n".
    "\$db_type = 'mysqli_innodb';\n\$db_host = '127.0.0.1';\n\$db_name = 'fluxbb';\n".
    "\$db_username = 'fluxbb';\n\$db_password = 'benchmark-db-only';\n\$db_prefix = 'fluxbb_';\n".
    "\$p_connect = false;\n\n\$cookie_name = 'pun_cookie_fluxbb';\n\$cookie_domain = '';\n".
    "\$cookie_path = '/';\n\$cookie_secure = 0;\n\$cookie_seed = 'fluxbb-benchmark-cookie-seed';\n\ndefine('PUN', 1);\n";
if (file_put_contents($config_dir.'/config.php', $config, LOCK_EX) === false) die("Unable to write config\n");
