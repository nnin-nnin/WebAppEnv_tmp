<?php
define('CLI_SCRIPT', true);
require('/var/www/html/config.php');
require_once($CFG->dirroot . '/user/lib.php');

$username = getenv('MOODLE_NEW_USERNAME');
$password = getenv('MOODLE_NEW_PASSWORD');
$email = getenv('MOODLE_NEW_EMAIL');
$firstname = getenv('MOODLE_NEW_FIRSTNAME') ?: 'Moodle';
$lastname = getenv('MOODLE_NEW_LASTNAME') ?: 'User';

if (!$username || !$password || !$email || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    fwrite(STDERR, "username, password and a valid email are required\n");
    exit(2);
}

$user = (object) [
    'username' => core_text::strtolower(trim($username)),
    'password' => $password,
    'firstname' => $firstname,
    'lastname' => $lastname,
    'email' => $email,
    'auth' => 'manual',
    'confirmed' => 1,
    'mnethostid' => $CFG->mnet_localhost_id,
    'maildisplay' => 2,
];

try {
    $existing = $DB->get_record('user', ['username' => $user->username, 'mnethostid' => $user->mnethostid]);
    if ($existing) {
        fwrite(STDERR, "user already exists\n");
        exit(3);
    }
    $id = user_create_user($user, true, true);
    echo "created user {$user->username} (id {$id})\n";
} catch (Throwable $exception) {
    fwrite(STDERR, "user creation failed: {$exception->getMessage()}\n");
    exit(1);
}
