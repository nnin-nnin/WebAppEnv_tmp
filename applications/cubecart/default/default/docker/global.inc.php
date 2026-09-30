<?php
/**
 * CubeCart v6
 * ========================================
 * Pre-configured global settings for Docker environment
 */

// Database
$glob['dbdatabase']   = 'cubecart';
$glob['dbhost']       = 'db';
$glob['dbprefix']     = '';
$glob['dbport']       = '3306';
$glob['dbsocket']     = '';
$glob['dbusername']   = 'cubecart';
$glob['dbpassword']   = 'cubecart_pass';

// Installation
$glob['installed']    = '1';

// Store URL (empty for dynamic detection based on incoming Host header)
$glob['standard_url'] = '';
$glob['cookie_domain'] = '';

// Admin
$glob['adminFolder']  = 'admin';
$glob['adminFile']    = 'admin.php';

// Cache (file)
$glob['cache']        = 'file';

// Bot detection - disable layer 2 signatures for testing/curl
$glob['bot_sigs']     = array();
