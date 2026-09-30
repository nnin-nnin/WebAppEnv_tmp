<?php
/**
 * phpwcms content management system
 * Pre-configured configuration for automated evaluation
 */

// database values
$phpwcms['db_host']              = getenv('PHPWCMS_DB_HOST') ?: 'db';
$phpwcms['db_port']              = (int)(getenv('PHPWCMS_DB_PORT') ?: 3306);
$phpwcms['db_user']              = getenv('PHPWCMS_DB_USER') ?: 'phpwcms';
$phpwcms['db_pass']              = getenv('PHPWCMS_DB_PASSWORD') ?: 'AdminPassword123!';
$phpwcms['db_table']             = getenv('PHPWCMS_DB_NAME') ?: 'phpwcms';
$phpwcms['db_prepend']           = '';
$phpwcms['db_pers']              = 0;
$phpwcms['db_charset']           = 'utf8mb4';
$phpwcms['db_collation']         = 'utf8mb4_general_ci';
$phpwcms['db_version']           = '';
$phpwcms['db_timezone']          = '';
$phpwcms['db_sql_mode']          = 'NO_ENGINE_SUBSTITUTION';
$phpwcms['db_errorlog']          = false;

// site values
$phpwcms['site']                 = '';
$phpwcms['site_ssl_mode']        = 0;
$phpwcms['site_ssl_url']         = '';
$phpwcms['site_ssl_port']        = 443;

$phpwcms['admin_name']           = 'Administrator';
$phpwcms['admin_user']           = 'admin';
$phpwcms['admin_pass']           = '$2y$10$BbuzJz3tBT3I6mzfc9D7GOfz2XlwLmMDg6RcNFs1vE2hE5iwsk2ea';
$phpwcms['admin_email']          = 'admin@localhost';

// paths
$phpwcms['DOC_ROOT']             = empty($_SERVER['DOCUMENT_ROOT']) ? dirname(__FILE__, 3) : $_SERVER['DOCUMENT_ROOT'];
$phpwcms['root']                 = '';
$phpwcms['file_path']            = 'filearchive';
$phpwcms['templates']            = 'template';
$phpwcms['content_path']         = 'content';
$phpwcms['cimage_path']          = 'images';
$phpwcms['ftp_path']             = 'upload';
$phpwcms['ads_path']             = 'marketing';

// content values
$phpwcms['file_maxsize']         = 52428800;
$phpwcms['content_width']        = 978;
$phpwcms['img_list_width']       = 100;
$phpwcms['img_list_height']      = 75;
$phpwcms['img_prev_width']       = 978;
$phpwcms['img_prev_height']      = 734;
$phpwcms['max_time']             = 1800;
$phpwcms['responsive']           = 1;
$phpwcms['preserve_image_name']  = 1;

// other stuff
$phpwcms['image_library']        = 'GD2';
$phpwcms['library_path']         = '';
$phpwcms['rewrite_url']          = 0;
$phpwcms['rewrite_ext']          = '.html';
$phpwcms['alias_allow_slash']    = 1;
$phpwcms['alias_allow_utf8']     = 1;
$phpwcms['wysiwyg_editor']       = 2;
$phpwcms['default_lang']         = 'en';
$phpwcms['DOCTYPE_LANG']         = '';
$phpwcms['allowed_lang']         = array('en', 'de', 'fr', 'es');
$phpwcms['use_content_lang']     = false;
$phpwcms['be_lang_parse']        = false;
$phpwcms['charset']              = 'utf-8';
$phpwcms['php_charset']          = false;
$phpwcms['allow_remote_URL']     = 0;
$phpwcms['jpg_quality']          = 85;
$phpwcms['webp_enable']          = 1;
$phpwcms['webp_quality']         = 85;
$phpwcms['resize_animated_gif']  = true;
$phpwcms['sharpen_level']        = 1;
$phpwcms['allow_ext_init']       = 1;
$phpwcms['allow_ext_render']     = 1;
$phpwcms['cache_enabled']        = 0;
$phpwcms['cache_timeout']        = 0;
$phpwcms['imgext_disabled']      = '';
$phpwcms['multimedia_ext']       = 'aif,aiff,mov,movie,mp3,mpeg,mpeg4,mpeg2,wav,swf,swc,ram,ra,wma,wmv,avi,au,midi,moov,rm,rpm,mid,midi';
$phpwcms['recipient_count']      = 0;
$phpwcms['inline_download']      = 1;
$phpwcms['sanitize_dlname']      = 0;
$phpwcms['form_tracking']        = 1;
$phpwcms['formmailer_set']       = array('allow_send_copy' => 0, 'global_recipient_email' => 'mail@example.com');
$phpwcms['allow_cntPHP_rt']      = 0;
$phpwcms['BOTS']                 = array('googlebot', 'msnbot', 'bingbot', 'baiduspider', 'yandex', 'sosospider', 'ia_archiver', 'altavista', 'slurp', 'yahoo', 'jeeves', 'teoma', 'lycos', 'crawler');
$phpwcms['mode_XHTML']           = 3;
$phpwcms['header_XML']           = 0;
$phpwcms['IE7-js']               = 0;
$phpwcms['php_timezone']         = '';
$phpwcms['wysiwyg_template']     = array();
$phpwcms['GET_pageinfo']         = 0;
$phpwcms['version_check']        = 0;
$phpwcms['SESSION_FEinit']       = 0;
$phpwcms['Login_IPcheck']        = 0;
$phpwcms['frontend_edit']        = 0;
$phpwcms['gd_memcheck_off']      = 0;
$phpwcms['enable_chat']          = 0;
$phpwcms['enable_messages']      = 0;
$phpwcms['enable_seolog']        = 0;
$phpwcms['i18n_parse']           = 1;
$phpwcms['i18n_complex']         = 0;
$phpwcms['FCK_FileBrowser']      = 1;
$phpwcms['feuser_regkey']        = 'FEUSER';
$phpwcms['login.php']            = 'login.php';
$phpwcms['js_lib']               = array();
$phpwcms['video-js']             = '';
$phpwcms['render_device']        = 0;
$phpwcms['detect_pixelratio']    = 0;
$phpwcms['im_fix_colorspace']    = 'RGB';
$phpwcms['wkhtmltopdf_path']     = '';
$phpwcms['render_clean_html']    = 0;
$phpwcms['browser_check']        = array('fe' => false, 'be' => false, 'vs' => '', 'insecure' => true, 'required' => '');
$phpwcms['usergroup_support']    = false;
$phpwcms['force301_id2alias']    = false;
$phpwcms['force301_2struct']     = false;
$phpwcms['allow_empty_alias']    = false;
$phpwcms['reserved_alias']       = array();
$phpwcms['enable_deprecated']    = false;
$phpwcms['canonical_off']        = false;
$phpwcms['viewport']             = 'width=device-width, initial-scale=1';
$phpwcms['X-UA-Compatible']      = '';
$phpwcms['base_href']            = true;
$phpwcms['cp_default']           = 0;
$phpwcms['js_in_body']           = 0;
$phpwcms['set_article_active']   = 1;
$phpwcms['set_category_active']  = 1;
$phpwcms['set_file_active']      = 1;
$phpwcms['set_news_active']      = 1;
$phpwcms['log_404error']         = false;
$phpwcms['set_sociallink']       = array('article' => false, 'articlecat' => false, 'news' => false, 'shop' => false, 'render' => true);
$phpwcms['header_comment']       = '';
$phpwcms['cnt_sort']             = 'a-z';
$phpwcms['cmsimage_redirect']    = false;
$phpwcms['disable_next_prev']    = false;
$phpwcms['allowed_upload_ext']   = 'jpg,jpeg,png,webp,gif,tif,tiff,bmp,pic,psd,eps,ai,svg,pdf,ps,doc,docx,xls,xlsx,ppt,pptx,odt,odm,odg,ods,odp,odf,odc,odb,sxw,sxc,sxi,csv,txt,rtf,html,xml,ini,sql,db,zip,rar,7z,s7z,dmg,bz2,gz,tar,tgz,mkv,webm,vob,ogg,ogv,mov,qt,wmv,mpg,mpeg,mp3,mp4,m4p,flv,f4v,f4p,f4a,f4b';
$phpwcms['enable_inline_php']    = false;
$phpwcms['parse_html_mode']      = 'before';
$phpwcms['trash_delete_files']   = false;
$phpwcms['cmsimage_settings']    = array();
$phpwcms['opengraph_imagesize']  = '1200x630x0';
$phpwcms['unregister_getVar']    = array();
$phpwcms['preserve_getVar']      = array();
$phpwcms['enable_GDPR']          = true;
$phpwcms['login_autocomplete']   = true;
$phpwcms['lazy_loading']         = 'lazy';
$phpwcms['disable_generator']    = false;
$phpwcms['disable_processed_in'] = false;
$phpwcms['session.cookie_httponly.off'] = false;
$phpwcms['session.cookie_samesite'] = 'Lax';
$phpwcms['remove_empty_get_vars'] = true;

// Email specific settings
$phpwcms['SMTP_FROM_EMAIL']      = 'admin@localhost';
$phpwcms['SMTP_FROM_NAME']       = 'Administrator';
$phpwcms['SMTP_HOST']            = 'localhost';
$phpwcms['SMTP_PORT']            = 25;
$phpwcms['SMTP_MAILER']          = 'mail';
$phpwcms['SMTP_USER']            = '';
$phpwcms['SMTP_PASS']            = '';
$phpwcms['SMTP_SECURE']          = '';
$phpwcms['SMTP_AUTH']            = 0;
$phpwcms['SMTP_AUTH_TYPE']       = '';
$phpwcms['SMTP_XOAUTH_PROVIDER'] = '';
$phpwcms['SMTP_CLIENT_ID']       = '';
$phpwcms['SMTP_CLIENT_SECRET']   = '';
$phpwcms['SMTP_TENANT_ID']       = '';
$phpwcms['SMTP_REFRESH_TOKEN']   = '';
$phpwcms['SMTP_DEBUG']           = 0;

define('PHPWCMS_INCLUDE_CHECK', true);
