#!/usr/bin/env php
<?php

declare(strict_types=1);

use Drupal\Core\DrupalKernel;
use Symfony\Component\HttpFoundation\Request;

function required_user_environment(string $name): string {
  $value = getenv($name);
  if ($value === FALSE || $value === '') {
    throw new RuntimeException("Required environment variable is missing: {$name}");
  }
  return $value;
}

try {
  $username = required_user_environment('NEW_USERNAME');
  $password = required_user_environment('NEW_PASSWORD');
  $email = required_user_environment('NEW_EMAIL');

  if (strlen($password) < 8) {
    throw new RuntimeException('The password must contain at least 8 characters.');
  }
  if (filter_var($email, FILTER_VALIDATE_EMAIL) === FALSE) {
    throw new RuntimeException('The email address is invalid.');
  }

  chdir('/var/www/html');
  $class_loader = require '/var/www/html/autoload.php';
  $request = Request::create('http://localhost/');
  $kernel = DrupalKernel::createFromRequest($request, $class_loader, 'prod', FALSE);
  $kernel->boot();
  $kernel->prepareLegacyRequest($request);

  $storage = \Drupal::entityTypeManager()->getStorage('user');
  $existing = $storage->getQuery()
    ->condition('name', $username)
    ->range(0, 1)
    ->execute();
  if ($existing) {
    throw new RuntimeException("User already exists: {$username}");
  }

  $account = $storage->create([
    'name' => $username,
    'mail' => $email,
    'pass' => $password,
    'status' => 1,
  ]);
  $account->save();

  fwrite(STDOUT, "Created active Drupal user {$username} with uid {$account->id()}.\n");
}
catch (Throwable $error) {
  fwrite(STDERR, "User creation failed: {$error->getMessage()}\n");
  exit(1);
}
