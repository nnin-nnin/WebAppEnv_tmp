<?php
declare(strict_types=1);

if (PHP_SAPI !== 'cli' || $argc < 4) {
    fwrite(STDERR, "usage: wordpress-user-create USER PASSWORD EMAIL [NAME]\n");
    exit(2);
}
$username = $argv[1];
$password = $argv[2];
$email = $argv[3];
$name = $argv[4] ?? $username;
if (!preg_match('/^[A-Za-z0-9._-]{1,60}$/', $username) || strlen($password) < 8 || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    fwrite(STDERR, "invalid user arguments\n");
    exit(2);
}
require '/var/www/html/wp-load.php';
if (username_exists($username) || email_exists($email)) {
    fwrite(STDERR, "username or email already exists\n");
    exit(1);
}
$user_id = wp_insert_user([
    'user_login' => $username,
    'user_pass' => $password,
    'user_email' => $email,
    'display_name' => $name,
    'role' => 'subscriber',
]);
if (is_wp_error($user_id)) {
    fwrite(STDERR, $user_id->get_error_message() . "\n");
    exit(1);
}
echo "created:$username\n";

