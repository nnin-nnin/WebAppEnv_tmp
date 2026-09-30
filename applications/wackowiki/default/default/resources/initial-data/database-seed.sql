/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wackowiki
-- ------------------------------------------------------
-- Server version	10.5.29-MariaDB-ubu2004

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wacko_acl`
--

DROP TABLE IF EXISTS `wacko_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_acl` (
  `acl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `privilege` varchar(10) NOT NULL DEFAULT '',
  `list` text NOT NULL,
  PRIMARY KEY (`acl_id`),
  UNIQUE KEY `idx_page_id` (`page_id`,`privilege`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_acl`
--

LOCK TABLES `wacko_acl` WRITE;
/*!40000 ALTER TABLE `wacko_acl` DISABLE KEYS */;
INSERT INTO `wacko_acl` VALUES (1,1,'read','*'),(2,1,'write','Admins'),(3,1,'comment','$'),(4,1,'create','Admins'),(5,1,'upload',''),(6,2,'read','$'),(7,2,'write','Admins'),(8,2,'comment','$'),(9,2,'create','Admins'),(10,2,'upload',''),(11,3,'read','$'),(12,3,'write','Admins'),(13,3,'comment','$'),(14,3,'create','Admins'),(15,3,'upload',''),(16,4,'read','$'),(17,4,'write','Admins'),(18,4,'comment','$'),(19,4,'create','Admins'),(20,4,'upload',''),(21,5,'read','$'),(22,5,'write','Admins'),(23,5,'comment','$'),(24,5,'create','Admins'),(25,5,'upload',''),(26,6,'read','*'),(27,6,'write','Admins'),(28,6,'comment','$'),(29,6,'create','Admins'),(30,6,'upload',''),(31,7,'read','*'),(32,7,'write','Admins'),(33,7,'comment','$'),(34,7,'create','Admins'),(35,7,'upload',''),(36,8,'read','$'),(37,8,'write','Admins'),(38,8,'comment','$'),(39,8,'create','Admins'),(40,8,'upload',''),(41,9,'read','*'),(42,9,'write','Admins'),(43,9,'comment','$'),(44,9,'create','Admins'),(45,9,'upload',''),(46,10,'read','$'),(47,10,'write','Admins'),(48,10,'comment','$'),(49,10,'create','Admins'),(50,10,'upload',''),(51,11,'read','$'),(52,11,'write','Admins'),(53,11,'comment','$'),(54,11,'create','Admins'),(55,11,'upload',''),(56,12,'read','$'),(57,12,'write','Admins'),(58,12,'comment','$'),(59,12,'create','Admins'),(60,12,'upload',''),(61,13,'read','$'),(62,13,'write','Admins'),(63,13,'comment','$'),(64,13,'create','Admins'),(65,13,'upload',''),(66,14,'read','$'),(67,14,'write','Admins'),(68,14,'comment','$'),(69,14,'create','Admins'),(70,14,'upload','');
/*!40000 ALTER TABLE `wacko_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_auth_token`
--

DROP TABLE IF EXISTS `wacko_auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_auth_token` (
  `auth_token_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `selector` char(12) NOT NULL DEFAULT '',
  `token` char(64) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `token_expires` datetime DEFAULT NULL,
  PRIMARY KEY (`auth_token_id`),
  UNIQUE KEY `idx_selector` (`selector`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_auth_token`
--

LOCK TABLES `wacko_auth_token` WRITE;
/*!40000 ALTER TABLE `wacko_auth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_cache`
--

DROP TABLE IF EXISTS `wacko_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_cache` (
  `cache_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(40) NOT NULL DEFAULT '',
  `method` varchar(20) NOT NULL DEFAULT '',
  `query` varchar(255) NOT NULL DEFAULT '',
  `cache_lang` varchar(5) NOT NULL DEFAULT '',
  `cache_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cache_id`),
  KEY `idx_hash` (`hash`),
  KEY `idx_cache_time` (`cache_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_cache`
--

LOCK TABLES `wacko_cache` WRITE;
/*!40000 ALTER TABLE `wacko_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_category`
--

DROP TABLE IF EXISTS `wacko_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `category_lang` varchar(5) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT '',
  `category_description` text NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `idx_category` (`category_lang`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_category`
--

LOCK TABLES `wacko_category` WRITE;
/*!40000 ALTER TABLE `wacko_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_category_assignment`
--

DROP TABLE IF EXISTS `wacko_category_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_category_assignment` (
  `assignment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT 0,
  `object_type_id` int(10) unsigned NOT NULL DEFAULT 0,
  `object_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`assignment_id`),
  UNIQUE KEY `idx_assignment` (`category_id`,`object_type_id`,`object_id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_object_id` (`object_id`),
  KEY `idx_object_type_id` (`object_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_category_assignment`
--

LOCK TABLES `wacko_category_assignment` WRITE;
/*!40000 ALTER TABLE `wacko_category_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_category_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_config`
--

DROP TABLE IF EXISTS `wacko_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_config` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(100) NOT NULL DEFAULT '',
  `config_value` text DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `idx_config_name` (`config_name`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_config`
--

LOCK TABLES `wacko_config` WRITE;
/*!40000 ALTER TABLE `wacko_config` DISABLE KEYS */;
INSERT INTO `wacko_config` VALUES (1,'abuse_email','admin@example.com'),(2,'account_page','Settings'),(3,'acl_lock','0'),(4,'admin_email','admin@example.com'),(5,'admin_name','admin'),(6,'allow_email_reuse','0'),(7,'allow_intercom','0'),(8,'allow_license_per_page','0'),(9,'allow_massemail','0'),(10,'allow_persistent_cookie','1'),(11,'allow_rawhtml','1'),(12,'allow_registration','0'),(13,'allow_themes','0'),(14,'allow_themes_per_page','0'),(15,'allow_x11colors','0'),(16,'allowed_email_domains',''),(17,'allowed_languages','zh-tw'),(18,'american_date','1'),(19,'anonymize_ip','0'),(20,'ap_failed_login_count','0'),(21,'ap_max_login_attempts','4'),(22,'approve_new_user','0'),(23,'attachments_handler','2'),(24,'autosubscribe','1'),(25,'cache','1'),(26,'cache_sql','0'),(27,'cache_sql_ttl','600'),(28,'cache_ttl','600'),(29,'canonical','0'),(30,'captcha_edit_page','1'),(31,'captcha_new_comment','1'),(32,'captcha_new_page','1'),(33,'captcha_registration','1'),(34,'categories_handler','1'),(35,'category_page','Category'),(36,'changes_page','RecentChanges'),(37,'check_mimetype','1'),(38,'comments_count','10'),(39,'comment_delay','30'),(40,'comments_offset','0'),(41,'comments_page','RecentlyCommented'),(42,'create_thumbnail','0'),(43,'csp','1'),(44,'date_format','dd.MM.y'),(45,'debug','0'),(46,'debug_admin_only','0'),(47,'debug_sql_threshold','0'),(48,'default_comment_acl','$'),(49,'default_create_acl','$'),(50,'default_diff_mode','3'),(51,'default_read_acl','*'),(52,'default_rename_redirect','0'),(53,'default_upload_acl','Admins'),(54,'default_write_acl','$'),(55,'diff_modes','0,1,2,3,4,5'),(56,'disable_bracketslinks','0'),(57,'disable_formatters','0'),(58,'disable_safehtml','0'),(59,'disable_wikilinks','1'),(60,'disable_wikiname','1'),(61,'edit_summary','0'),(62,'email_confirmation','0'),(63,'email_from','WackoWiki'),(64,'email_priority','3'),(65,'email_subject_prefix',''),(66,'enable_captcha','1'),(67,'enable_comments','1'),(68,'enable_counters','1'),(69,'enable_email','1'),(70,'enable_email_notification','1'),(71,'enable_feeds','1'),(72,'enable_license','0'),(73,'enable_referrers','0'),(74,'enable_security_headers','1'),(75,'enable_system_message','1'),(76,'export_handler','2'),(77,'ext_bad_behaviour','0'),(78,'footer_comments','1'),(79,'footer_files','1'),(80,'footer_tags','1'),(81,'forbidden_email_domains',''),(82,'form_token_time','7200'),(83,'forum_cluster','Forum'),(84,'forum_topics','10'),(85,'groups_page','Groups'),(86,'help_page',''),(87,'hide_index','0'),(88,'hide_locked','1'),(89,'hide_revisions','0'),(90,'hide_toc','0'),(91,'index_page','PageIndex'),(92,'intercom_delay','30'),(93,'ip_login_limit_max','50'),(94,'jpeg_quality','80'),(95,'keep_deleted_time','0'),(96,'language','en'),(97,'license',''),(98,'link_target','0'),(99,'list_count','50'),(100,'log_default_show','1'),(101,'log_level','0'),(102,'log_purge_time','0'),(103,'login_notice','0'),(104,'login_page','Login'),(105,'site_logo','wacko_logo.png'),(106,'logo_display','0'),(107,'logo_height','50'),(108,'logo_width','108'),(109,'maint_last_cache','1790779672'),(110,'maint_last_delpages','1'),(111,'maint_last_log','1'),(112,'maint_last_oldpages','1'),(113,'maint_last_refs','1790862472'),(114,'maint_last_session','1791035272'),(115,'maint_last_xml_sitemap','1'),(116,'max_image_area','0'),(117,'max_image_width','0'),(118,'max_login_attempts','3'),(119,'max_page_size','2097152'),(120,'max_thumb_width','150'),(121,'menu_items','5'),(122,'minor_edit','0'),(123,'multilanguage','1'),(124,'name_date_macro','%s (%s)'),(125,'news_cluster','News'),(126,'news_levels',''),(127,'news_structure',''),(128,'nofollow','0'),(129,'noindex','0'),(130,'noreferrer','0'),(131,'noreply_email','admin@example.com'),(132,'notify_comment','1'),(133,'notify_diff_mode','2'),(134,'notify_minor_edit','1'),(135,'notify_new_user_account','1'),(136,'notify_page','2'),(137,'notify_upload','1'),(138,'numerate_links','0'),(139,'opensearch','0'),(140,'owners_can_remove_comments','1'),(141,'pages_purge_time','0'),(142,'paragrafica','1'),(143,'password_page','Password'),(144,'permissions_policy','1'),(145,'phpmailer_method','mail'),(146,'privacy_page',''),(147,'publish_anonymously','0'),(148,'pwd_admin_min_chars','15'),(149,'pwd_char_classes','0'),(150,'pwd_min_chars','10'),(151,'pwd_unlike_login','1'),(152,'random_page','RandomPage'),(153,'referrer_policy','7'),(154,'referrers_purge_time','1'),(155,'registration_delay','10'),(156,'registration_page','Registration'),(157,'remove_onlyadmins','0'),(158,'rename_global_acl','Admins'),(159,'reverse_proxy','0'),(160,'reverse_proxy_header',''),(161,'reverse_proxy_addresses',''),(162,'review','0'),(163,'rewrite_mode','1'),(164,'root_page','HomePage'),(165,'search_page','Search'),(166,'section_edit','1'),(167,'session_length','30'),(168,'session_notice','0'),(169,'session_store','1'),(170,'show_permalink','0'),(171,'show_spaces','1'),(172,'site_desc','Cover what you do best. Link to the rest.'),(173,'site_favicon',''),(174,'site_name','WackoWiki'),(175,'source_handler','1'),(176,'smtp_connection_mode',''),(177,'smtp_host','localhost'),(178,'smtp_password',''),(179,'smtp_port','587'),(180,'smtp_username',''),(181,'sorting_comments','0'),(182,'spam_filter','1'),(183,'standard_handlers','addcomment|admin\\.php|attachments|categories|claim|clone|diff|edit|export\\.xml|file|latex|moderate|new|permissions|purge|print|properties|rate|referrers|referrers_sites|remove|rename|review|revisions|revisions\\.xml|robots\\.txt|sitemap\\.xml|show|source|upload|watch|watchers|wordprocessor'),(184,'store_deleted_pages','1'),(185,'svg_sanitizer','1'),(186,'system_message',''),(187,'system_message_audience','1'),(188,'system_message_type',''),(189,'terms_page',''),(190,'theme','default'),(191,'theme_color',''),(192,'time_format','HH:mm'),(193,'time_format_seconds','HH:mm:ss'),(194,'timezone','UTC'),(195,'tls','0'),(196,'tls_implicit','0'),(197,'tree_level','1'),(198,'typografica','0'),(199,'upload','admins'),(200,'upload_allowed_exts',''),(201,'upload_banned_exts','asa, asax, ascx, ashx, asmx, asp, aspx, axd, bat, cdx, cer, cgi, cmd, com, config, cpl, csproj, cs, dll, exe, htm, html, htr, htw, ida, idc, idq, jhtml, js, jsb, jsp, licx, mht, mhtml, msi, phar, php, pht, phtm, phtml, pif, pl, printer, py, rem, resources, resx, scr, shtm, shtml, soap, ssi, stm, vb, vbproj, vbs, vdisco, vxd, webinfo, xap, xht, xhtm, xhtml'),(202,'upload_images_only','1'),(203,'upload_quota','0'),(204,'upload_quota_per_user','104857600'),(205,'upload_max_size','512000'),(206,'upload_translit','1'),(207,'upload_translit_lower','0'),(208,'urls_underscores','0'),(209,'username_chars_min','3'),(210,'username_chars_max','20'),(211,'user_can_delete_account','0'),(212,'users_page','Users'),(213,'xml_changes_link','1'),(214,'xml_sitemap','0'),(215,'xml_sitemap_gz','0'),(216,'xml_sitemap_time','1'),(217,'xml_sitemap_update',''),(218,'youarehere_text',''),(219,'maint_last_update','2026-09-30 13:43:20');
/*!40000 ALTER TABLE `wacko_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_external_link`
--

DROP TABLE IF EXISTS `wacko_external_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_external_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `link` text NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_external_link`
--

LOCK TABLES `wacko_external_link` WRITE;
/*!40000 ALTER TABLE `wacko_external_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_external_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_file`
--

DROP TABLE IF EXISTS `wacko_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_file` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_lang` varchar(5) NOT NULL DEFAULT '',
  `file_description` varchar(255) NOT NULL DEFAULT '',
  `caption` text DEFAULT NULL,
  `author` varchar(255) NOT NULL DEFAULT '',
  `source` varchar(255) NOT NULL DEFAULT '',
  `source_url` varchar(255) NOT NULL DEFAULT '',
  `license_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `file_size` int(10) unsigned NOT NULL DEFAULT 0,
  `picture_w` int(10) unsigned NOT NULL DEFAULT 0,
  `picture_h` int(10) unsigned NOT NULL DEFAULT 0,
  `file_ext` varchar(10) NOT NULL DEFAULT '',
  `mime_type` varchar(255) NOT NULL DEFAULT '',
  `file_hash` char(40) NOT NULL DEFAULT '',
  `deleted` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `idx_page_id` (`page_id`,`file_name`),
  KEY `idx_page_id_2` (`page_id`,`created`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_file_name` (`file_name`),
  KEY `idx_file_hash` (`file_hash`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_file`
--

LOCK TABLES `wacko_file` WRITE;
/*!40000 ALTER TABLE `wacko_file` DISABLE KEYS */;
INSERT INTO `wacko_file` VALUES (1,0,3,'wacko_logo.png','en','WackoWiki',NULL,'','','',0,'2026-09-30 13:43:20','2026-09-30 13:43:20',1625,108,50,'png','image/png','6d175f514bb3a0ac2cc67fce9d9f6cd10f758559',0);
/*!40000 ALTER TABLE `wacko_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_file_link`
--

DROP TABLE IF EXISTS `wacko_file_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_file_link` (
  `file_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `file_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`file_link_id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_file_link`
--

LOCK TABLES `wacko_file_link` WRITE;
/*!40000 ALTER TABLE `wacko_file_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_file_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_log`
--

DROP TABLE IF EXISTS `wacko_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` datetime DEFAULT NULL,
  `level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `idx_level` (`level`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_ip` (`ip`),
  KEY `idx_time` (`log_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_log`
--

LOCK TABLES `wacko_log` WRITE;
/*!40000 ALTER TABLE `wacko_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_menu`
--

DROP TABLE IF EXISTS `wacko_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_menu` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `menu_lang` varchar(5) NOT NULL DEFAULT '',
  `menu_title` varchar(255) NOT NULL DEFAULT '',
  `menu_position` smallint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `idx_menu` (`user_id`,`page_id`,`menu_lang`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_lang` (`menu_lang`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_menu`
--

LOCK TABLES `wacko_menu` WRITE;
/*!40000 ALTER TABLE `wacko_menu` DISABLE KEYS */;
INSERT INTO `wacko_menu` VALUES (1,1,11,'en','Changes',0),(2,1,12,'en','Comments',0),(3,1,13,'en','Index',0),(4,1,14,'en','Random',0),(5,1,11,'zh-tw','變動',0),(6,1,12,'zh-tw','回應',0),(7,1,13,'zh-tw','索引',0),(8,1,14,'zh-tw','隨機的',0);
/*!40000 ALTER TABLE `wacko_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_page`
--

DROP TABLE IF EXISTS `wacko_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version_id` int(10) unsigned NOT NULL DEFAULT 1,
  `owner_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `menu_tag` varchar(255) NOT NULL DEFAULT '',
  `depth` int(10) unsigned NOT NULL DEFAULT 0,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `body` mediumtext NOT NULL,
  `body_r` mediumtext NOT NULL,
  `body_toc` text NOT NULL,
  `formatting` varchar(20) NOT NULL DEFAULT 'wacko',
  `edit_note` varchar(255) NOT NULL DEFAULT '',
  `minor_edit` tinyint(1) unsigned DEFAULT 0,
  `page_size` int(10) unsigned NOT NULL DEFAULT 0,
  `license_id` int(10) unsigned NOT NULL DEFAULT 0,
  `reviewed` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `reviewed_time` datetime DEFAULT NULL,
  `reviewer_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `latest` tinyint(1) unsigned DEFAULT 1,
  `handler` varchar(30) NOT NULL DEFAULT 'page',
  `comment_on_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comments` int(4) unsigned NOT NULL DEFAULT 0,
  `files` int(4) unsigned NOT NULL DEFAULT 0,
  `revisions` int(10) unsigned NOT NULL DEFAULT 0,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `theme` varchar(20) DEFAULT NULL,
  `page_lang` varchar(5) NOT NULL DEFAULT '',
  `commented` datetime DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `footer_comments` tinyint(1) unsigned DEFAULT NULL,
  `footer_files` tinyint(1) unsigned DEFAULT NULL,
  `hide_toc` tinyint(1) unsigned DEFAULT NULL,
  `hide_index` tinyint(1) unsigned DEFAULT NULL,
  `tree_level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `show_menu_tag` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `allow_rawhtml` tinyint(1) unsigned DEFAULT NULL,
  `disable_safehtml` tinyint(1) unsigned DEFAULT NULL,
  `typografica` tinyint(1) unsigned DEFAULT NULL,
  `noindex` tinyint(1) unsigned DEFAULT 0,
  `deleted` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `idx_tag` (`tag`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_owner_id` (`owner_id`),
  KEY `idx_depth` (`depth`),
  KEY `idx_created` (`created`),
  KEY `idx_modified` (`modified`),
  KEY `idx_minor_edit` (`minor_edit`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_reviewed` (`reviewed`),
  KEY `idx_comment_on_id` (`comment_on_id`),
  KEY `idx_commented` (`commented`),
  KEY `idx_title` (`title`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_page`
--

LOCK TABLES `wacko_page` WRITE;
/*!40000 ALTER TABLE `wacko_page` DISABLE KEYS */;
INSERT INTO `wacko_page` VALUES (1,1,1,1,'HomePage','Home Page','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','file:/wacko_logo.png?right\n**Welcome to your ((WackoWiki:Doc/English WackoWiki)) site!**\n\nClick after you have ((/Login logged in)) on the \"Edit this page\" link at the bottom to get started.\n\nDocumentation can be found at WackoWiki:Doc/English.\nUseful pages: ((WackoWiki:Doc/English/Formatting Formatting)), ((/Search Search)).\n\n\n\n','\n<p id=\"p1-1\" class=\"auto\"><!--link:begin-->file:/wacko_logo.png?right ==<!--link:end--><br>\n<strong>Welcome to your <!--link:begin-->WackoWiki:Doc/English ==WackoWiki<!--link:end--> site!</strong></p>\n<br>\n<p id=\"p1-2\" class=\"auto\">\nClick after you have <!--link:begin-->/Login ==logged in<!--link:end--> on the \"Edit this page\" link at the bottom to get started.</p>\n<br>\n<p id=\"p1-3\" class=\"auto\">\nDocumentation can be found at <!--link:begin-->WackoWiki:Doc/English ==<!--link:end-->.<br>\nUseful pages: <!--link:begin-->WackoWiki:Doc/English/Formatting ==Formatting<!--link:end-->, <!--link:begin-->/Search ==Search<!--link:end-->.</p>\n<br>\n\n ','p1-1<h-item>(p)<h-item>77777<h-end>\np1-2<h-item>(p)<h-item>77777<h-end>\np1-3<h-item>(p)<h-item>77777<h-end>\n','wacko','',0,331,0,0,NULL,0,'',1,'page',0,0,0,0,6,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,0,0),(2,1,1,1,'Users/admin','admin','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','((user:admin admin))\n\n','','','wacko','',0,22,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,0,0),(3,1,1,1,'Category','Category','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{category}}','','','wacko','',0,12,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(4,1,1,1,'Groups','Groups','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{groups}}','','','wacko','',0,10,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(5,1,1,1,'Users','Users','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{users}}','','','wacko','',0,9,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(6,1,1,1,'Registration','Registration','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{registration}}','','','wacko','',0,16,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(7,1,1,1,'Password','Password','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{changepassword}}','','','wacko','',0,18,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(8,1,1,1,'Search','Search','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{search}}','','','wacko','',0,10,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(9,1,1,1,'Login','Login','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{login}}','','','wacko','',0,9,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(10,1,1,1,'Settings','Settings','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{usersettings}}','','','wacko','',0,16,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(11,1,1,1,'RecentChanges','Recent Changes','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{changes}}','','','wacko','',0,11,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(12,1,1,1,'RecentlyCommented','Recently Commented','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{commented}}','','','wacko','',0,13,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(13,1,1,1,'PageIndex','Page Index','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{pageindex}}','','','wacko','',0,13,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0),(14,1,1,1,'RandomPage','Random Page','',0,0,'2026-09-30 13:43:20','2026-09-30 13:43:20','{{randompage}}','','','wacko','',0,14,0,0,NULL,0,'',1,'page',0,0,0,0,0,NULL,'en',NULL,'','',0,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0);
/*!40000 ALTER TABLE `wacko_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_page_link`
--

DROP TABLE IF EXISTS `wacko_page_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_page_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `to_page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `to_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `idx_from_tag` (`from_page_id`,`to_tag`),
  KEY `idx_from_page_id` (`from_page_id`),
  KEY `idx_to` (`to_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_page_link`
--

LOCK TABLES `wacko_page_link` WRITE;
/*!40000 ALTER TABLE `wacko_page_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_page_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_referrer`
--

DROP TABLE IF EXISTS `wacko_referrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_referrer` (
  `referrer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `referrer` varchar(2083) NOT NULL DEFAULT '',
  `referrer_time` datetime DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `user_agent` text DEFAULT NULL,
  PRIMARY KEY (`referrer_id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_referrer_time` (`referrer_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_referrer`
--

LOCK TABLES `wacko_referrer` WRITE;
/*!40000 ALTER TABLE `wacko_referrer` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_referrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_revision`
--

DROP TABLE IF EXISTS `wacko_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_revision` (
  `revision_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `version_id` int(10) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `menu_tag` varchar(255) NOT NULL DEFAULT '',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `body` mediumtext NOT NULL,
  `body_r` mediumtext NOT NULL,
  `formatting` varchar(20) NOT NULL DEFAULT '',
  `edit_note` varchar(255) NOT NULL DEFAULT '',
  `minor_edit` tinyint(1) unsigned DEFAULT 0,
  `page_size` int(10) unsigned NOT NULL DEFAULT 0,
  `reviewed` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `reviewed_time` datetime DEFAULT NULL,
  `reviewer_id` int(10) unsigned NOT NULL DEFAULT 0,
  `latest` tinyint(1) unsigned DEFAULT 0,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `handler` varchar(30) NOT NULL DEFAULT 'page',
  `comment_on_id` int(10) unsigned NOT NULL DEFAULT 0,
  `page_lang` varchar(5) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `deleted` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`revision_id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_version_id` (`version_id`),
  KEY `idx_owner_id` (`owner_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_tag` (`tag`),
  KEY `idx_modified` (`modified`),
  KEY `idx_minor_edit` (`minor_edit`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_reviewed` (`reviewed`),
  KEY `idx_comment_on_id` (`comment_on_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_revision`
--

LOCK TABLES `wacko_revision` WRITE;
/*!40000 ALTER TABLE `wacko_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_user`
--

DROP TABLE IF EXISTS `wacko_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(80) NOT NULL DEFAULT '',
  `real_name` varchar(80) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `account_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `account_type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `signup_time` datetime DEFAULT NULL,
  `change_password` varchar(64) NOT NULL DEFAULT '',
  `user_ip` varchar(45) NOT NULL DEFAULT '',
  `email_confirm` varchar(64) NOT NULL DEFAULT '',
  `last_visit` datetime DEFAULT NULL,
  `last_mark` datetime DEFAULT NULL,
  `login_count` int(10) unsigned NOT NULL DEFAULT 0,
  `password_request_count` smallint(6) unsigned NOT NULL DEFAULT 0,
  `failed_login_count` smallint(6) unsigned NOT NULL DEFAULT 0,
  `total_pages` int(10) unsigned NOT NULL DEFAULT 0,
  `total_revisions` int(10) unsigned NOT NULL DEFAULT 0,
  `total_comments` int(10) unsigned NOT NULL DEFAULT 0,
  `total_uploads` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idx_user_name` (`user_name`),
  KEY `idx_account_type` (`account_type`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_signup_time` (`signup_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_user`
--

LOCK TABLES `wacko_user` WRITE;
/*!40000 ALTER TABLE `wacko_user` DISABLE KEYS */;
INSERT INTO `wacko_user` VALUES (1,'System','','','',0,1,1,'2026-09-30 13:43:20','','','',NULL,NULL,0,0,0,0,0,0,0),(2,'Deleted','','','',0,1,1,'2026-09-30 13:43:20','','','',NULL,NULL,0,0,0,0,0,0,0),(3,'admin','','$2y$10$9YWYZ/OnAz5R9wdkMPRZMOWHG3.5SPh/J4ROSO0Np9vw23tFBzDuS','admin@example.com',0,0,1,'2026-09-30 13:43:20','','','',NULL,NULL,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `wacko_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_user_setting`
--

DROP TABLE IF EXISTS `wacko_user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_user_setting` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `theme` varchar(20) DEFAULT NULL,
  `user_lang` varchar(5) NOT NULL DEFAULT '',
  `list_count` int(10) unsigned NOT NULL DEFAULT 50,
  `menu_items` int(2) unsigned NOT NULL DEFAULT 5,
  `dont_redirect` tinyint(1) unsigned DEFAULT NULL,
  `send_watchmail` tinyint(1) unsigned DEFAULT NULL,
  `show_files` tinyint(1) unsigned DEFAULT NULL,
  `show_comments` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `doubleclick_edit` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `show_spaces` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `autocomplete` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `numerate_links` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `diff_mode` tinyint(1) unsigned NOT NULL DEFAULT 3,
  `notify_minor_edit` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `notify_page` tinyint(1) unsigned NOT NULL DEFAULT 2,
  `notify_comment` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `allow_intercom` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `allow_massemail` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `hide_lastsession` tinyint(1) unsigned DEFAULT NULL,
  `validate_ip` tinyint(1) unsigned DEFAULT NULL,
  `noid_pubs` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `session_length` tinyint(3) unsigned DEFAULT NULL,
  `timezone` varchar(100) NOT NULL DEFAULT 'UTC',
  `date_preference` varchar(10) DEFAULT 'default',
  `sorting_comments` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `comments_offset` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  KEY `idx_send_watchmail` (`send_watchmail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_user_setting`
--

LOCK TABLES `wacko_user_setting` WRITE;
/*!40000 ALTER TABLE `wacko_user_setting` DISABLE KEYS */;
INSERT INTO `wacko_user_setting` VALUES (1,3,'default','en',50,5,NULL,NULL,NULL,1,1,1,0,1,3,1,2,1,0,0,NULL,NULL,0,NULL,'UTC','default',0,0);
/*!40000 ALTER TABLE `wacko_user_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_usergroup`
--

DROP TABLE IF EXISTS `wacko_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_usergroup` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `moderator_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `open` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `idx_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_usergroup`
--

LOCK TABLES `wacko_usergroup` WRITE;
/*!40000 ALTER TABLE `wacko_usergroup` DISABLE KEYS */;
INSERT INTO `wacko_usergroup` VALUES (1,'Admins','',3,'2026-09-30 13:43:20',1,0,1),(2,'Moderator','',3,'2026-09-30 13:43:20',1,0,1),(3,'Reviewer','',3,'2026-09-30 13:43:20',1,0,1);
/*!40000 ALTER TABLE `wacko_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_usergroup_member`
--

DROP TABLE IF EXISTS `wacko_usergroup_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_usergroup_member` (
  `group_member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_member_id`),
  UNIQUE KEY `idx_group_id` (`group_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_usergroup_member`
--

LOCK TABLES `wacko_usergroup_member` WRITE;
/*!40000 ALTER TABLE `wacko_usergroup_member` DISABLE KEYS */;
INSERT INTO `wacko_usergroup_member` VALUES (1,1,3);
/*!40000 ALTER TABLE `wacko_usergroup_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_watch`
--

DROP TABLE IF EXISTS `wacko_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_watch` (
  `watch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_id` int(10) unsigned NOT NULL DEFAULT 0,
  `pending` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `watch_time` datetime DEFAULT NULL,
  PRIMARY KEY (`watch_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_watch`
--

LOCK TABLES `wacko_watch` WRITE;
/*!40000 ALTER TABLE `wacko_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wacko_word`
--

DROP TABLE IF EXISTS `wacko_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wacko_word` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wacko_word`
--

LOCK TABLES `wacko_word` WRITE;
/*!40000 ALTER TABLE `wacko_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `wacko_word` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 13:49:14
