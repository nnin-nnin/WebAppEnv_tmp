<?php

$_CONFIG = true;

/* database settings */
$CFG_SERVER = getenv('DB_HOST') ?: "db";
$CFG_USER = getenv('DB_USER') ?: "webchess";
$CFG_PASSWORD = getenv('DB_PASSWORD') ?: "webchess_password";
$CFG_DATABASE = getenv('DB_NAME') ?: "webchess";

/* server settings */
$CFG_SESSIONTIMEOUT = "900";
$CFG_EXPIREGAME = "14";
$CFG_MINAUTORELOAD = "10";
$CFG_USEEMAILNOTIFICATION = false;
$CFG_MAILADDRESS = "webchess@example.com";
$CFG_MAINPAGE = "http://localhost:18874";
$CFG_MAXUSERS = "50";
$CFG_MAXACTIVEGAMES = "50";
$CFG_NICKCHANGEALLOWED = false;
$CFG_NEW_USERS_ALLOWED = true;
$CFG_BOARDSQUARESIZE = "50";
$CFG_IMAGE_EXT = "png";

/* Application constants */
define('APP_NAME', 'PHP7-Webchess');
define('APP_VERSION', '1.1.0');

/* I18N constants */
define('I18N_GETTEXT_SUPPORT', false);
define('I18N_LOCALE', 'en_US');

/* mysql table names */
define('communication', 'communication');
define('history', 'history');
define('games', 'games');
define('messages', 'messages');
define('pieces', 'pieces');
define('preferences', 'preferences');
define('players', 'players');

$CFG_TABLE['communication'] = "communication";
$CFG_TABLE['games'] = "games";
$CFG_TABLE['history'] = "history";
$CFG_TABLE['messages'] = "messages";
$CFG_TABLE['pieces'] = "pieces";
$CFG_TABLE['players'] = "players";
$CFG_TABLE['preferences'] = "preferences";

$CFG_TABLE[communication] = "communication";
$CFG_TABLE[games] = "games";
$CFG_TABLE[history] = "history";
$CFG_TABLE[messages] = "messages";
$CFG_TABLE[pieces] = "pieces";
$CFG_TABLE[players] = "players";
$CFG_TABLE[preferences] = "preferences";

?>
