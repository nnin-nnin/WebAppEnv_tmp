#!/usr/bin/env php
<?php

declare(strict_types=1);

if ($argc !== 4) {
    fwrite(STDERR, "Usage: wordpress-user-create.php <username> <password> <email>\n");
    exit(2);
}

require_once '/var/www/html/wp-load.php';

list(, $username, $password, $email) = $argv;
if (get_user_by('login', $username)) {
    fwrite(STDERR, "WordPress user already exists: {$username}\n");
    exit(1);
}

$user_id = wp_create_user($username, $password, $email);
if (is_wp_error($user_id)) {
    fwrite(STDERR, "Cannot create WordPress user: " . $user_id->get_error_message() . "\n");
    exit(1);
}

$user = get_user_by('id', $user_id);
$user->set_role('subscriber');
echo "WordPress user created: {$username}\n";
