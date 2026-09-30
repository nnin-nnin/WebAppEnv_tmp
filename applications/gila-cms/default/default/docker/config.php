<?php

$GLOBALS['config'] = array (
  'db' => 
  array (
    'host' => getenv('GILA_DB_HOST') ?: 'db',
    'user' => getenv('GILA_DB_USER') ?: 'gila',
    'pass' => getenv('GILA_DB_PASSWORD') ?: 'AdminPassword123!',
    'name' => getenv('GILA_DB_NAME') ?: 'gila',
  ),
  'permissions' => 
  array (
    1 => 
    array (
      0 => 'admin',
      1 => 'admin_user',
      2 => 'admin_userrole',
    ),
  ),
  'trusted_domains' => array(),
  'packages' => 
  array (
    0 => 'blog',
  ),
  'base' => getenv('GILA_BASE_URL') ?: 'http://localhost:18828/',
  'theme' => 'gila-blog',
  'title' => 'Gila CMS',
  'slogan' => 'An awesome website!',
  'default-controller' => 'blog',
  'timezone' => 'UTC',
  'env' => 'pro',
  'check4updates' => 0,
  'language' => 'en',
  'admin_email' => 'admin@example.com',
  'media_uploads' => 'data/uploads',
  'rewrite' => 1,
  'page-blocks' => true,
  'use_webp' => 0,
  'utk_level' => 10,
  'admin_theme' => 'default',
  'admin_logo' => 'assets/gila-logo.png',
  'favicon' => 'assets/favicon.png',
);
