#!/usr/bin/env php
<?php

declare(strict_types=1);

require_once '/var/www/html/wp-load.php';

function require_environment(string $name): string
{
    $value = getenv($name);
    if ($value === false || $value === '') {
        fwrite(STDERR, "Missing required environment variable: {$name}\n");
        exit(1);
    }

    return $value;
}

update_option('siteurl', require_environment('WORDPRESS_SITE_URL'));
update_option('home', require_environment('WORDPRESS_SITE_URL'));
update_option('users_can_register', 1);

$benchmark_users = array(
    array('editor', 'benchmark-only', 'editor@example.test', 'editor'),
    array('subscriber', 'benchmark-only', 'subscriber@example.test', 'subscriber'),
);

foreach ($benchmark_users as $benchmark_user) {
    list($username, $password, $email, $role) = $benchmark_user;
    $user = get_user_by('login', $username);

    if (!$user) {
        $user_id = wp_create_user($username, $password, $email);
        if (is_wp_error($user_id)) {
            fwrite(STDERR, "Cannot create {$username}: " . $user_id->get_error_message() . "\n");
            exit(1);
        }
        $user = get_user_by('id', $user_id);
    }

    $user->set_role($role);
}

echo "WordPress bootstrap completed\n";
