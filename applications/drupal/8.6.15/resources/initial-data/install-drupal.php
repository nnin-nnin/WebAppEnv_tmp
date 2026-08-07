#!/usr/bin/env php
<?php

declare(strict_types=1);

function required_environment(string $name): string {
  $value = getenv($name);
  if ($value === FALSE || $value === '') {
    throw new RuntimeException("Required environment variable is missing: {$name}");
  }
  return $value;
}

function connect_database(string $host, string $port, string $database, string $username, string $password): PDO {
  $dsn = "pgsql:host={$host};port={$port};dbname={$database}";
  $last_error = NULL;

  for ($attempt = 1; $attempt <= 60; $attempt++) {
    try {
      return new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      ]);
    }
    catch (PDOException $error) {
      $last_error = $error;
      fwrite(STDOUT, "Database is not ready (attempt {$attempt}/60).\n");
      sleep(2);
    }
  }

  throw new RuntimeException('Database connection timed out.', 0, $last_error);
}

function database_is_installed(PDO $database): bool {
  $statement = $database->query("SELECT to_regclass('public.users_field_data')");
  return $statement->fetchColumn() !== NULL;
}

function make_public_files_writable(string $path): void {
  if (!is_dir($path) && !mkdir($path, 0775, TRUE) && !is_dir($path)) {
    throw new RuntimeException("Unable to create public files directory: {$path}");
  }

  $paths = [new SplFileInfo($path)];
  $iterator = new RecursiveIteratorIterator(
    new RecursiveDirectoryIterator($path, FilesystemIterator::SKIP_DOTS),
    RecursiveIteratorIterator::SELF_FIRST
  );
  foreach ($iterator as $item) {
    $paths[] = $item;
  }

  foreach ($paths as $item) {
    $item_path = $item->getPathname();
    @chown($item_path, 'www-data');
    @chgrp($item_path, 'www-data');
    @chmod($item_path, $item->isDir() ? 0775 : 0664);
  }
}

try {
  $database_name = required_environment('DRUPAL_DB_NAME');
  $database_user = required_environment('DRUPAL_DB_USER');
  $database_password = required_environment('DRUPAL_DB_PASSWORD');
  $database_host = required_environment('DRUPAL_DB_HOST');
  $database_port = required_environment('DRUPAL_DB_PORT');
  $site_name = required_environment('DRUPAL_SITE_NAME');
  $site_mail = required_environment('DRUPAL_SITE_MAIL');
  $admin_name = required_environment('DRUPAL_ADMIN_NAME');
  $admin_password = required_environment('DRUPAL_ADMIN_PASSWORD');
  $admin_mail = required_environment('DRUPAL_ADMIN_MAIL');

  chdir('/var/www/html');
  $site_path = 'sites/default';
  $settings_path = $site_path . '/settings.php';
  $database = connect_database($database_host, $database_port, $database_name, $database_user, $database_password);
  $database_installed = database_is_installed($database);

  if ($database_installed && file_exists($settings_path)) {
    fwrite(STDOUT, "Drupal is already installed; no initialization is needed.\n");
    make_public_files_writable($site_path . '/files');
    exit(0);
  }

  if ($database_installed && !file_exists($settings_path)) {
    throw new RuntimeException('The database is initialized but settings.php is missing. Reset both project volumes together.');
  }

  if (file_exists($settings_path) && !unlink($settings_path)) {
    throw new RuntimeException('The database is empty but the stale settings.php file could not be removed.');
  }

  if (!copy($site_path . '/default.settings.php', $settings_path)) {
    throw new RuntimeException('Unable to create sites/default/settings.php.');
  }
  chmod($site_path, 0775);
  chmod($settings_path, 0666);

  $class_loader = require '/var/www/html/autoload.php';
  require_once '/var/www/html/core/includes/install.core.inc';

  $parameters = [
    'interactive' => FALSE,
    'site_path' => $site_path,
    'parameters' => [
      'profile' => 'standard',
      'langcode' => 'en',
    ],
    'forms' => [
      'install_settings_form' => [
        'driver' => 'pgsql',
        'pgsql' => [
          'database' => $database_name,
          'username' => $database_user,
          'password' => $database_password,
          'host' => $database_host,
          'port' => $database_port,
          'prefix' => '',
        ],
      ],
      'install_configure_form' => [
        'site_name' => $site_name,
        'site_mail' => $site_mail,
        'account' => [
          'name' => $admin_name,
          'mail' => $admin_mail,
          'pass' => [
            'pass1' => $admin_password,
            'pass2' => $admin_password,
          ],
        ],
        'enable_update_status_module' => NULL,
        'enable_update_status_emails' => NULL,
      ],
    ],
  ];

  fwrite(STDOUT, "Installing Drupal 8.6.15 with the standard profile.\n");
  install_drupal($class_loader, $parameters);

  if (!file_exists($settings_path) || !database_is_installed($database)) {
    throw new RuntimeException('Drupal installer returned without creating a usable site.');
  }

  make_public_files_writable($site_path . '/files');
  fwrite(STDOUT, "Drupal installation completed successfully.\n");
}
catch (Throwable $error) {
  fwrite(STDERR, "Drupal installation failed: {$error->getMessage()}\n");
  exit(1);
}
