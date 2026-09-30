<?php
/**
 * Cotonti Configuration File
 */
defined('COT_CODE') or die('Wrong URL');

$cfg['mysqlhost'] = 'db';
$cfg['mysqlport'] = '';
$cfg['mysqluser'] = 'cotonti';
$cfg['mysqlpassword'] = 'benchmark-only';
$cfg['mysqldb'] = 'cotonti';
$cfg['mysqlcharset'] = 'utf8mb4';
$cfg['mysqlcollate'] = 'utf8mb4_unicode_ci';

$cfg['mainurl'] = 'http://localhost:18809';
$cfg['force_https'] = false;
$cfg['site_id'] = 'cotonti_site_id_benchmark';
$cfg['secret_key'] = 'cotonti_secret_key_benchmark_12345';
$cfg['multihost'] = true;

$cfg['defaulttheme'] = 'nemesis';
$cfg['defaultscheme'] = 'default';
$cfg['defaulticons'] = 'default';
$cfg['defaultlang'] = 'en';
$cfg['enablecustomhf'] = false;
$cfg['admintheme'] = '';

$cfg['cache'] = false;
$cfg['cache_drv'] = '';
$cfg['cache_drv_host'] = 'localhost';
$cfg['cache_drv_port'] = '';
$cfg['xtpl_cache'] = false;
$cfg['html_cleanup'] = false;
$cfg['cache_index'] = false;
$cfg['cache_page'] = false;
$cfg['cache_forums'] = false;

$cfg['check_updates'] = false;
$cfg['display_errors'] = false;
$cfg['redirmode'] = false;
$cfg['xmlclient'] = false;
$cfg['ipcheck'] = false;
$cfg['authcache'] = true;
$cfg['customfuncs'] = false;
$cfg['new_install'] = false;
$cfg['useremailduplicate'] = false;

$cfg['avatars_dir'] = 'datas/avatars';
$cfg['cache_dir'] = 'datas/cache';
$cfg['lang_dir'] = 'lang';
$cfg['modules_dir'] = 'modules';
$cfg['pfs_dir'] = 'datas/users';
$cfg['photos_dir'] = 'datas/photos';
$cfg['plugins_dir'] = 'plugins';
$cfg['system_dir'] = 'system';
$cfg['thumbs_dir'] = 'datas/thumbs';
$cfg['themes_dir'] = 'themes';
$cfg['extrafield_files_dir'] = 'datas/exflds';
$cfg['icons_dir'] = 'images/icons';

$cfg['dir_perms'] = 0775;
$cfg['file_perms'] = 0664;
$cfg['debug_mode'] = false;
$cfg['debug_logpath'] = 'datas/tmp';
$cfg['shield_force'] = false;
$cfg['legacyMode'] = false;

$db_x = 'cot_';
