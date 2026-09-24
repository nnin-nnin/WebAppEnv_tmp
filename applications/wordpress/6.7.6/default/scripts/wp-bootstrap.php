<?php
declare(strict_types=1);

define('WP_INSTALLING', true);
require '/var/www/html/wp-load.php';
require_once ABSPATH . 'wp-admin/includes/upgrade.php';
$hash_file = '/opt/wordpress-admin-password.hash';
$admin_hash = trim((string) file_get_contents($hash_file));
if ($admin_hash === '' || !str_starts_with($admin_hash, '$P$')) {
    fwrite(STDERR, "admin password verifier is unavailable\n");
    exit(1);
}
add_filter('pre_wp_mail', '__return_true');
$temporary_password = wp_generate_password(64, true, true);
$result = wp_install('WordPress', 'admin', 'admin@example.local', 1, '', $temporary_password, 'en_US');
if (!isset($result['user_id'])) {
    fwrite(STDERR, "WordPress core installation did not return an administrator\n");
    exit(1);
}
// The CLI bootstrap has no HTTP_HOST. Set the documented local browser entry
// explicitly so WordPress considers the installation complete.
update_option('siteurl', 'http://127.0.0.1:18513');
update_option('home', 'http://127.0.0.1:18513');
global $wpdb;
$updated = $wpdb->update(
    $wpdb->users,
    ['user_pass' => $admin_hash, 'user_activation_key' => ''],
    ['ID' => (int) $result['user_id']],
    ['%s', '%s'],
    ['%d']
);
if ($updated === false) {
    fwrite(STDERR, "could not apply administrator password verifier\n");
    exit(1);
}
update_user_meta((int) $result['user_id'], 'default_password_nag', false);
echo "WordPress database initialized\n";
