/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: impresscms
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
-- Table structure for table `icms_avatar`
--

DROP TABLE IF EXISTS `icms_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_avatar` (
  `avatar_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `avatar_file` varchar(30) NOT NULL DEFAULT '',
  `avatar_name` varchar(100) NOT NULL DEFAULT '',
  `avatar_mimetype` varchar(30) NOT NULL DEFAULT '',
  `avatar_created` int(10) NOT NULL DEFAULT 0,
  `avatar_display` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `avatar_weight` smallint(5) unsigned NOT NULL DEFAULT 0,
  `avatar_type` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`avatar_id`),
  KEY `avatar_type` (`avatar_type`,`avatar_display`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_avatar`
--

LOCK TABLES `icms_avatar` WRITE;
/*!40000 ALTER TABLE `icms_avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_avatar_user_link`
--

DROP TABLE IF EXISTS `icms_avatar_user_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_avatar_user_link` (
  `avatar_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  KEY `avatar_user_id` (`avatar_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_avatar_user_link`
--

LOCK TABLES `icms_avatar_user_link` WRITE;
/*!40000 ALTER TABLE `icms_avatar_user_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_avatar_user_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_block_module_link`
--

DROP TABLE IF EXISTS `icms_block_module_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_block_module_link` (
  `block_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `module_id` smallint(5) NOT NULL DEFAULT 0,
  `page_id` smallint(5) NOT NULL DEFAULT 0,
  KEY `module_id` (`module_id`),
  KEY `block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_block_module_link`
--

LOCK TABLES `icms_block_module_link` WRITE;
/*!40000 ALTER TABLE `icms_block_module_link` DISABLE KEYS */;
INSERT INTO `icms_block_module_link` VALUES (1,0,0),(2,0,0),(3,0,0),(4,1,2),(5,0,0),(6,0,0),(7,1,2),(8,1,2),(9,1,2),(10,0,0),(11,0,0),(12,0,0),(13,0,0),(14,0,0),(15,1,2),(16,1,2),(17,1,2),(18,0,0),(19,0,0),(20,0,1),(21,0,1);
/*!40000 ALTER TABLE `icms_block_module_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_block_positions`
--

DROP TABLE IF EXISTS `icms_block_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_block_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(30) DEFAULT '',
  `title` varchar(90) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `block_default` int(1) NOT NULL DEFAULT 0,
  `block_type` varchar(1) NOT NULL DEFAULT 'L',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_block_positions`
--

LOCK TABLES `icms_block_positions` WRITE;
/*!40000 ALTER TABLE `icms_block_positions` DISABLE KEYS */;
INSERT INTO `icms_block_positions` VALUES (1,'canvas_left','_AM_SBLEFT',NULL,1,'L'),(2,'canvas_right','_AM_SBRIGHT',NULL,1,'L'),(3,'page_topleft','_AM_CBLEFT',NULL,1,'C'),(4,'page_topcenter','_AM_CBCENTER',NULL,1,'C'),(5,'page_topright','_AM_CBRIGHT',NULL,1,'C'),(6,'page_bottomleft','_AM_CBBOTTOMLEFT',NULL,1,'C'),(7,'page_bottomcenter','_AM_CBBOTTOM',NULL,1,'C'),(8,'page_bottomright','_AM_CBBOTTOMRIGHT',NULL,1,'C'),(9,'canvas_left_admin','_AM_SBLEFT_ADMIN',NULL,1,'L'),(10,'canvas_right_admin','_AM_SBRIGHT_ADMIN',NULL,1,'L'),(11,'page_topleft_admin','_AM_CBLEFT_ADMIN',NULL,1,'C'),(12,'page_topcenter_admin','_AM_CBCENTER_ADMIN',NULL,1,'C'),(13,'page_topright_admin','_AM_CBRIGHT_ADMIN',NULL,1,'C'),(14,'page_bottomleft_admin','_AM_CBBOTTOMLEFT_ADMIN',NULL,1,'C'),(15,'page_bottomcenter_admin','_AM_CBBOTTOM_ADMIN',NULL,1,'C'),(16,'page_bottomright_admin','_AM_CBBOTTOMRIGHT_ADMIN',NULL,1,'C');
/*!40000 ALTER TABLE `icms_block_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_config`
--

DROP TABLE IF EXISTS `icms_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_config` (
  `conf_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `conf_modid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `conf_catid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `conf_name` varchar(75) NOT NULL DEFAULT '',
  `conf_title` varchar(255) NOT NULL DEFAULT '',
  `conf_value` text NOT NULL,
  `conf_desc` varchar(255) NOT NULL DEFAULT '',
  `conf_formtype` varchar(15) NOT NULL DEFAULT '',
  `conf_valuetype` varchar(10) NOT NULL DEFAULT '',
  `conf_order` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`conf_id`),
  KEY `mod_cat_order` (`conf_modid`,`conf_catid`,`conf_order`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_config`
--

LOCK TABLES `icms_config` WRITE;
/*!40000 ALTER TABLE `icms_config` DISABLE KEYS */;
INSERT INTO `icms_config` VALUES (1,0,1,'sitename','_MD_AM_SITENAME','ImpressCMS','_MD_AM_SITENAMEDSC','textbox','text',0),(2,0,1,'slogan','_MD_AM_SLOGAN','Make a lasting impression ','_MD_AM_SLOGANDSC','textbox','text',1),(3,0,1,'adminmail','_MD_AM_ADMINML','admin@impresscms.local','_MD_AM_ADMINMLDSC','textbox','text',2),(4,0,1,'language','_MD_AM_LANGUAGE','english','_MD_AM_LANGUAGEDSC','language','other',3),(5,0,1,'startpage','_MD_AM_STARTPAGE','a:3:{i:1;s:2:\"--\";i:2;s:2:\"--\";i:3;s:2:\"--\";}','_MD_AM_STARTPAGEDSC','startpage','array',4),(6,0,1,'server_TZ','_MD_AM_SERVERTZ','0','_MD_AM_SERVERTZDSC','timezone','float',5),(7,0,1,'default_TZ','_MD_AM_DEFAULTTZ','0','_MD_AM_DEFAULTTZDSC','timezone','float',6),(8,0,1,'use_ext_date','_MD_AM_EXT_DATE','0','_MD_AM_EXT_DATEDSC','yesno','int',7),(9,0,1,'theme_set','_MD_AM_DTHEME','iTheme','_MD_AM_DTHEMEDSC','theme','other',8),(10,0,1,'theme_admin_set','_MD_AM_ADMIN_DTHEME','iTheme','_MD_AM_ADMIN_DTHEME_DESC','theme_admin','other',9),(11,0,1,'theme_fromfile','_MD_AM_THEMEFILE','0','_MD_AM_THEMEFILEDSC','yesno','int',10),(12,0,1,'theme_set_allowed','_MD_AM_THEMEOK','a:1:{i:0;s:6:\"iTheme\";}','_MD_AM_THEMEOKDSC','theme_multi','array',11),(13,0,1,'template_set','_MD_AM_DTPLSET','default','_MD_AM_DTPLSETDSC','tplset','other',12),(14,0,1,'editor_default','_MD_AM_EDITOR_DEFAULT','dhtmltextarea','_MD_AM_EDITOR_DEFAULT_DESC','editor','text',13),(15,0,1,'editor_enabled_list','_MD_AM_EDITOR_ENABLED_LIST','a:3:{i:0;s:13:\"dhtmltextarea\";i:1;s:9:\"FCKeditor\";i:2;s:7:\"tinymce\";}','_MD_AM_EDITOR_ENABLED_LIST_DESC','editor_multi','array',14),(16,0,1,'sourceeditor_default','_MD_AM_SRCEDITOR_DEFAULT','editarea','_MD_AM_SRCEDITOR_DEFAULT_DESC','editor_source','text',15),(17,0,1,'anonymous','_MD_AM_ANONNAME','Anonymous','_MD_AM_ANONNAMEDSC','textbox','text',16),(18,0,1,'gzip_compression','_MD_AM_USEGZIP','0','_MD_AM_USEGZIPDSC','yesno','int',17),(19,0,1,'usercookie','_MD_AM_USERCOOKIE','icms_user','_MD_AM_USERCOOKIEDSC','textbox','text',18),(20,0,1,'use_mysession','_MD_AM_USEMYSESS','0','_MD_AM_USEMYSESSDSC','yesno','int',19),(21,0,1,'session_name','_MD_AM_SESSNAME','icms_session','_MD_AM_SESSNAMEDSC','textbox','text',20),(22,0,1,'session_expire','_MD_AM_SESSEXPIRE','15','_MD_AM_SESSEXPIREDSC','textbox','int',21),(23,0,1,'debug_mode','_MD_AM_DEBUGMODE','0','_MD_AM_DEBUGMODEDSC','select','int',22),(24,0,1,'closesite','_MD_AM_CLOSESITE','0','_MD_AM_CLOSESITEDSC','yesno','int',23),(25,0,1,'closesite_okgrp','_MD_AM_CLOSESITEOK','a:1:{i:0;s:1:\"1\";}','_MD_AM_CLOSESITEOKDSC','group_multi','array',24),(26,0,1,'closesite_text','_MD_AM_CLOSESITETXT','The site is currently closed for maintenance. Please come back later.','_MD_AM_CLOSESITETXTDSC','textsarea','text',25),(27,0,1,'my_ip','_MD_AM_MYIP','127.0.0.1','_MD_AM_MYIPDSC','textbox','text',26),(28,0,1,'use_ssl','_MD_AM_USESSL','0','_MD_AM_USESSLDSC','yesno','int',27),(29,0,1,'sslpost_name','_MD_AM_SSLPOST','icms_ssl','_MD_AM_SSLPOSTDSC','textbox','text',28),(30,0,1,'sslloginlink','_MD_AM_SSLLINK','https://','_MD_AM_SSLLINKDSC','textbox','text',29),(31,0,1,'com_mode','_MD_AM_COMMODE','nest','_MD_AM_COMMODEDSC','select','text',30),(32,0,1,'com_order','_MD_AM_COMORDER','0','_MD_AM_COMORDERDSC','select','int',31),(33,0,1,'use_captchaf','_MD_AM_USECAPTCHAFORM','1','_MD_AM_USECAPTCHAFORMDSC','yesno','int',32),(34,0,1,'enable_badips','_MD_AM_DOBADIPS','0','_MD_AM_DOBADIPSDSC','yesno','int',33),(35,0,1,'bad_ips','_MD_AM_BADIPS','a:1:{i:0;s:9:\"127.0.0.1\";}','_MD_AM_BADIPSDSC','textsarea','array',34),(36,0,1,'module_cache','_MD_AM_MODCACHE','','_MD_AM_MODCACHEDSC','module_cache','array',35),(37,0,2,'allow_register','_MD_AM_ALLOWREG','1','_MD_AM_ALLOWREGDSC','yesno','int',0),(38,0,2,'minpass','_MD_AM_MINPASS','5','_MD_AM_MINPASSDSC','textbox','int',1),(39,0,2,'pass_level','_MD_AM_PASSLEVEL','40','_MD_AM_PASSLEVEL_DESC','select','int',2),(40,0,2,'minuname','_MD_AM_MINUNAME','3','_MD_AM_MINUNAMEDSC','textbox','int',3),(41,0,2,'maxuname','_MD_AM_MAXUNAME','20','_MD_AM_MAXUNAMEDSC','textbox','int',4),(42,0,2,'delusers','_MD_AM_DELUSRES','30','_MD_AM_DELUSRESDSC','textbox','int',5),(43,0,2,'use_captcha','_MD_AM_USECAPTCHA','1','_MD_AM_USECAPTCHADSC','yesno','int',6),(44,0,2,'welcome_msg','_MD_AM_WELCOMEMSG','0','_MD_AM_WELCOMEMSGDSC','yesno','int',7),(45,0,2,'welcome_msg_content','_MD_AM_WELCOMEMSG_CONTENT','Welcome {UNAME},\n\nYour account has been successfully activated on {X_SITENAME}. As a member of our site, you will benefit from all the features reserved to registered members !\n\nOnce again, welcome to our site. Visit us often !\n\nIf you did not registered to our site, please contact us at the following address {X_ADMINMAIL}, and we will fix the situation.\n\n-----------\nYours truly,\n{X_SITENAME}\n\n{X_SITEURL}','_MD_AM_WELCOMEMSG_CONTENTDSC','textsarea','text',8),(46,0,2,'allow_chgmail','_MD_AM_ALLWCHGMAIL','0','_MD_AM_ALLWCHGMAILDSC','yesno','int',9),(47,0,2,'allow_chguname','_MD_AM_ALLWCHGUNAME','0','_MD_AM_ALLWCHGUNAMEDSC','yesno','int',10),(48,0,2,'allwshow_sig','_MD_AM_ALLWSHOWSIG','1','_MD_AM_ALLWSHOWSIGDSC','yesno','int',11),(49,0,2,'allow_htsig','_MD_AM_ALLWHTSIG','1','_MD_AM_ALLWHTSIGDSC','yesno','int',12),(50,0,2,'sig_max_length','_MD_AM_SIGMAXLENGTH','255','_MD_AM_SIGMAXLENGTHDSC','textbox','int',13),(51,0,2,'new_user_notify','_MD_AM_NEWUNOTIFY','1','_MD_AM_NEWUNOTIFYDSC','yesno','int',14),(52,0,2,'new_user_notify_group','_MD_AM_NOTIFYTO','1','_MD_AM_NOTIFYTODSC','group','int',15),(53,0,2,'activation_type','_MD_AM_ACTVTYPE','0','_MD_AM_ACTVTYPEDSC','select','int',16),(54,0,2,'activation_group','_MD_AM_ACTVGROUP','1','_MD_AM_ACTVGROUPDSC','group','int',17),(55,0,2,'uname_test_level','_MD_AM_UNAMELVL','0','_MD_AM_UNAMELVLDSC','select','int',18),(56,0,2,'avatar_allow_upload','_MD_AM_AVATARALLOW','0','_MD_AM_AVATARALWDSC','yesno','int',19),(57,0,2,'avatar_allow_gravatar','_MD_AM_GRAVATARALLOW','1','_MD_AM_GRAVATARALWDSC','yesno','int',20),(58,0,2,'avatar_minposts','_MD_AM_AVATARMP','0','_MD_AM_AVATARMPDSC','textbox','int',21),(59,0,2,'avatar_width','_MD_AM_AVATARW','80','_MD_AM_AVATARWDSC','textbox','int',22),(60,0,2,'avatar_height','_MD_AM_AVATARH','80','_MD_AM_AVATARHDSC','textbox','int',23),(61,0,2,'avatar_maxsize','_MD_AM_AVATARMAX','35000','_MD_AM_AVATARMAXDSC','textbox','int',24),(62,0,2,'self_delete','_MD_AM_SELFDELETE','0','_MD_AM_SELFDELETEDSC','yesno','int',25),(63,0,2,'rank_width','_MD_AM_RANKW','120','_MD_AM_RANKWDSC','textbox','int',26),(64,0,2,'rank_height','_MD_AM_RANKH','120','_MD_AM_RANKHDSC','textbox','int',27),(65,0,2,'rank_maxsize','_MD_AM_RANKMAX','35000','_MD_AM_RANKMAXDSC','textbox','int',28),(66,0,2,'bad_unames','_MD_AM_BADUNAMES','a:3:{i:0;s:9:\"webmaster\";i:1;s:11:\"^impresscms\";i:2;s:6:\"^admin\";}','_MD_AM_BADUNAMESDSC','textsarea','array',29),(67,0,2,'bad_emails','_MD_AM_BADEMAILS','a:1:{i:0;s:15:\"impresscms.org$\";}','_MD_AM_BADEMAILSDSC','textsarea','array',30),(68,0,2,'remember_me','_MD_AM_REMEMBERME','0','_MD_AM_REMEMBERMEDSC','yesno','int',31),(69,0,2,'reg_dispdsclmr','_MD_AM_DSPDSCLMR','1','_MD_AM_DSPDSCLMRDSC','yesno','int',32),(70,0,2,'reg_disclaimer','_MD_AM_REGDSCLMR','While the administrators and moderators of this site will attempt to remove or edit any generally objectionable material as quickly as possible, it is impossible to review every message. Therefore you acknowledge that all posts made to this site express the views and opinions of the author and not the administrators, moderators or webmaster (except for posts by these people) and hence will not be held liable.\n\nYou agree not to post any abusive, obscene, vulgar, slanderous, hateful, threatening, sexually-orientated or any other material that may violate any applicable laws. Doing so may lead to you being immediately and permanently banned (and your service provider being informed). The IP address of all posts is recorded to aid in enforcing these conditions. Creating multiple accounts for a single user is not allowed. You agree that the webmaster, administrator and moderators of this site have the right to remove, edit, move or close any topic at any time should they see fit. As a user you agree to any information you have entered above being stored in a database. While this information will not be disclosed to any third party without your consent the webmaster, administrator and moderators cannot be held responsible for any hacking attempt that may lead to the data being compromised.\n\nThis site system uses cookies to store information on your local computer. These cookies do not contain any of the information you have entered above, they serve only to improve your viewing pleasure. The email address is used only for confirming your registration details and password (and for sending new passwords should you forget your current one).\n\nBy clicking Register below you agree to be bound by these conditions.','_MD_AM_REGDSCLMRDSC','textsarea','text',33),(71,0,2,'priv_dpolicy','_MD_AM_PRIVDPOLICY','0','_MD_AM_PRIVDPOLICYDSC','yesno','int',34),(72,0,2,'priv_policy','_MD_AM_PRIVPOLICY','<p>This privacy policy sets out how {X_SITENAME} uses and protects any information that you provide when you use this website. {X_SITENAME} is committed to ensuring that your privacy is protected. Should we ask you to provide certain information by which you can be identified when using this website, then you can be assured that it will only be used in accordance with this privacy statement. {X_SITENAME} may change this policy from time to time by updating this page. You should check this page from time to time to ensure that you are happy with any changes.\n</p><p>\nThis policy is effective from [date].\n</p>\n<h2>What we collect</h2>\n<p>\nWe may collect the following information:\n<ul>\n<li>name and job title</li>\n<li>contact information including email address</li>\n<li>demographic information such as postcode, preferences and interests</li>\n<li>other information relevant to customer surveys and/or offers</li></ul>\n</p>\n<h2>What we do with the information we gather</h2>\n<p>\nWe require this information to understand your needs and provide you with a better service, and in particular for the following reasons:\n<ul>\n<li>Internal record keeping.</li>\n<li>We may use the information to improve our products and services.</li>\n<li>We may periodically send promotional email about new products, special offers or other information which we think you may find interesting using the email address which you have provided.</li>\n<li>From time to time, we may also use your information to contact you for market research purposes. We may contact you by email.</li>\n<li>We may use the information to customise the website according to your interests.</li></ul>\n</p>\n<h2>Security</h2>\n<p>\nWe are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure we have put in place suitable physical, electronic and managerial procedures to safeguard and secure the information we collect online.\n</p>\n<h2>How we use cookies</h2>\n<p>\nA cookie is a small file which asks permission to be placed on your computer\'s hard drive. Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit a particular site. Cookies allow web applications to respond to you as an individual. The web application can tailor its operations to your needs, likes and dislikes by gathering and remembering information about your preferences.\n</p><p>\nWe use traffic log cookies to identify which pages are being used & for authenticating you as a registered member. This helps us analyse data about web page traffic and improve our website in order to tailor it to customer needs. We only use this information for statistical analysis purposes and then the data is removed from the system. Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful and which you do not. A cookie in no way gives us access to your computer or any information about you, other than the data you choose to share with us.\n</p><p>\nYou can choose to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. This may prevent you from taking full advantage of the website including registration and logging in.\n</p>\n<h2>Links to other websites</h2>\n<p>\nOur website may contain links to enable you to visit other websites of interest easily. However, once you have used these links to leave our site, you should note that we do not have any control over that other website. Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst visiting such sites and such sites are not governed by this privacy statement. You should exercise caution and look at the privacy statement applicable to the website in question.\n</p>\n<h2>Controlling your personal information</h2>\n<p>\nYou may choose to restrict the collection or use of your personal information in the following ways:\n<ul>\n<li>whenever you are asked to fill in a form on the website, look for the box that you can click to indicate that you do not want the information to be used by anybody for direct marketing purposes</li>\n<li>if you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time by writing to or emailing us at [email address]</li></ul>\n</p><p>\nWe will not sell, distribute or lease your personal information to third parties unless we have your permission or are required by law to do so. We may use your personal information to send you promotional information about third parties which we think you may find interesting if you tell us that you wish this to happen. You may request details of personal information which we hold about you under the Data Protection Act 1998. A small fee will be payable. If you would like a copy of the information held on you please write to [address].\n</p><p>\nIf you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible, at the above address. We will promptly correct any information found to be incorrect.\n</p>','_MD_AM_PRIVPOLICYDSC','textsarea','text',35),(73,0,2,'allow_annon_view_prof','_MD_AM_ALLOW_ANONYMOUS_VIEW_PROFILE','0','_MD_AM_ALLOW_ANONYMOUS_VIEW_PROFILE_DESC','yesno','int',36),(74,0,2,'enc_type','_MD_AM_ENC_TYPE','23','_MD_AM_ENC_TYPEDSC','select','int',37),(75,0,3,'meta_keywords','_MD_AM_METAKEY','community management system, CMS, content management, social networking, community, blog, support, modules, add-ons, themes','_MD_AM_METAKEYDSC','textsarea','text',0),(76,0,3,'meta_description','_MD_AM_METADESC','ImpressCMS is a dynamic Object Oriented based open source portal script written in PHP.','_MD_AM_METADESCDSC','textsarea','text',1),(77,0,3,'meta_robots','_MD_AM_METAROBOTS','index,follow','_MD_AM_METAROBOTSDSC','select','text',2),(78,0,3,'meta_rating','_MD_AM_METARATING','general','_MD_AM_METARATINGDSC','select','text',3),(79,0,3,'meta_author','_MD_AM_METAAUTHOR','ImpressCMS','_MD_AM_METAAUTHORDSC','textbox','text',4),(80,0,3,'meta_copyright','_MD_AM_METACOPYR','Copyright &copy; 2007-2026','_MD_AM_METACOPYRDSC','textbox','text',5),(81,0,3,'google_meta','_MD_AM_METAGOOGLE','','_MD_AM_METAGOOGLE_DESC','textbox','text',6),(82,0,3,'footer','_MD_AM_FOOTER','Powered by ImpressCMS &copy; 2007-2026 <a href=\"https://www.impresscms.org/\" rel=\"external\">The ImpressCMS Project</a>','_MD_AM_FOOTERDSC','textsarea','text',7),(83,0,3,'use_google_analytics','_MD_AM_USE_GOOGLE_ANA','0','_MD_AM_USE_GOOGLE_ANA_DESC','yesno','int',8),(84,0,3,'google_analytics','_MD_AM_GOOGLE_ANA','','_MD_AM_GOOGLE_ANA_DESC','textbox','text',9),(85,0,3,'footadm','_MD_AM_FOOTADM','Powered by ImpressCMS &copy; 2007-2026 <a href=\"https://www.impresscms.org/\" rel=\"external\">The ImpressCMS Project</a>','_MD_AM_FOOTADM_DESC','textsarea','text',10),(86,0,4,'censor_enable','_MD_AM_DOCENSOR','0','_MD_AM_DOCENSORDSC','yesno','int',0),(87,0,4,'censor_words','_MD_AM_CENSORWRD','a:5:{i:0;s:4:\"fuck\";i:1;s:4:\"shit\";i:2;s:4:\"cunt\";i:3;s:6:\"wanker\";i:4;s:7:\"bastard\";}','_MD_AM_CENSORWRDDSC','textsarea','array',1),(88,0,4,'censor_replace','_MD_AM_CENSORRPLC','#OOPS#','_MD_AM_CENSORRPLCDSC','textbox','text',2),(89,0,5,'enable_search','_MD_AM_DOSEARCH','1','_MD_AM_DOSEARCHDSC','yesno','int',0),(90,0,5,'enable_deep_search','_MD_AM_DODEEPSEARCH','1','_MD_AM_DODEEPSEARCHDSC','yesno','int',1),(91,0,5,'num_shallow_search','_MD_AM_NUMINITSRCHRSLTS','5','_MD_AM_NUMINITSRCHRSLTSDSC','textbox','int',2),(92,0,5,'keyword_min','_MD_AM_MINSEARCH','3','_MD_AM_MINSEARCHDSC','textbox','int',3),(93,0,5,'search_user_date','_MD_AM_SEARCH_USERDATE','1','_MD_AM_SEARCH_USERDATE','yesno','int',4),(94,0,5,'search_no_res_mod','_MD_AM_SEARCH_NO_RES_MOD','1','_MD_AM_SEARCH_NO_RES_MODDSC','yesno','int',5),(95,0,5,'search_per_page','_MD_AM_SEARCH_PER_PAGE','20','_MD_AM_SEARCH_PER_PAGEDSC','textbox','int',6),(96,0,6,'from','_MD_AM_MAILFROM','','_MD_AM_MAILFROMDESC','textbox','text',0),(97,0,6,'fromname','_MD_AM_MAILFROMNAME','','_MD_AM_MAILFROMNAMEDESC','textbox','text',1),(98,0,6,'fromuid','_MD_AM_MAILFROMUID','1','_MD_AM_MAILFROMUIDDESC','user','int',2),(99,0,6,'mailmethod','_MD_AM_MAILERMETHOD','mail','_MD_AM_MAILERMETHODDESC','select','text',3),(100,0,6,'smtphost','_MD_AM_SMTPHOST','a:1:{i:0;s:0:\"\";}','_MD_AM_SMTPHOSTDESC','textsarea','array',4),(101,0,6,'smtpuser','_MD_AM_SMTPUSER','','_MD_AM_SMTPUSERDESC','textbox','text',5),(102,0,6,'smtppass','_MD_AM_SMTPPASS','','_MD_AM_SMTPPASSDESC','password','text',6),(103,0,6,'smtpsecure','_MD_AM_SMTPSECURE','ssl','_MD_AM_SMTPSECUREDESC','select','text',7),(104,0,6,'smtpauthport','_MD_AM_SMTPAUTHPORT','465','_MD_AM_SMTPAUTHPORTDESC','textbox','int',8),(105,0,6,'sendmailpath','_MD_AM_SENDMAILPATH','/usr/sbin/sendmail','_MD_AM_SENDMAILPATHDESC','textbox','text',9),(106,0,7,'auth_method','_MD_AM_AUTHMETHOD','xoops','_MD_AM_AUTHMETHODDESC','select','text',0),(107,0,7,'ldap_port','_MD_AM_LDAP_PORT','389','_MD_AM_LDAP_PORT','textbox','int',1),(108,0,7,'ldap_server','_MD_AM_LDAP_SERVER','your directory server','_MD_AM_LDAP_SERVER_DESC','textbox','text',2),(109,0,7,'ldap_base_dn','_MD_AM_LDAP_BASE_DN','dc=icms,dc=org','_MD_AM_LDAP_BASE_DN_DESC','textbox','text',3),(110,0,7,'ldap_manager_dn','_MD_AM_LDAP_MANAGER_DN','manager_dn','_MD_AM_LDAP_MANAGER_DN_DESC','textbox','text',4),(111,0,7,'ldap_manager_pass','_MD_AM_LDAP_MANAGER_PASS','manager_pass','_MD_AM_LDAP_MANAGER_PASS_DESC','password','text',5),(112,0,7,'ldap_version','_MD_AM_LDAP_VERSION','3','_MD_AM_LDAP_VERSION_DESC','textbox','text',6),(113,0,7,'ldap_users_bypass','_MD_AM_LDAP_USERS_BYPASS','a:1:{i:0;s:5:\"admin\";}','_MD_AM_LDAP_USERS_BYPASS_DESC','textsarea','array',7),(114,0,7,'ldap_loginname_asdn','_MD_AM_LDAP_LOGINNAME_ASDN','uid_asdn','_MD_AM_LDAP_LOGINNAME_ASDN_D','yesno','int',8),(115,0,7,'ldap_loginldap_attr','_MD_AM_LDAP_LOGINLDAP_ATTR','uid','_MD_AM_LDAP_LOGINLDAP_ATTR_D','textbox','text',9),(116,0,7,'ldap_filter_person','_MD_AM_LDAP_FILTER_PERSON','','_MD_AM_LDAP_FILTER_PERSON_DESC','textbox','text',10),(117,0,7,'ldap_domain_name','_MD_AM_LDAP_DOMAIN_NAME','mydomain','_MD_AM_LDAP_DOMAIN_NAME_DESC','textbox','text',11),(118,0,7,'ldap_provisionning','_MD_AM_LDAP_PROVIS','0','_MD_AM_LDAP_PROVIS_DESC','yesno','int',12),(119,0,7,'ldap_provisionning_group','_MD_AM_LDAP_PROVIS_GROUP','a:1:{i:0;s:1:\"2\";}','_MD_AM_LDAP_PROVIS_GROUP_DSC','group_multi','array',13),(120,0,7,'ldap_mail_attr','_MD_AM_LDAP_MAIL_ATTR','mail','_MD_AM_LDAP_MAIL_ATTR_DESC','textbox','text',14),(121,0,7,'ldap_givenname_attr','_MD_AM_LDAP_GIVENNAME_ATTR','givenname','_MD_AM_LDAP_GIVENNAME_ATTR_DSC','textbox','text',15),(122,0,7,'ldap_surname_attr','_MD_AM_LDAP_SURNAME_ATTR','sn','_MD_AM_LDAP_SURNAME_ATTR_DESC','textbox','text',16),(123,0,7,'ldap_field_mapping','_MD_AM_LDAP_FIELD_MAPPING_ATTR','email=mail|name=displayname','_MD_AM_LDAP_FIELD_MAPPING_DESC','textsarea','text',17),(124,0,7,'ldap_provisionning_upd','_MD_AM_LDAP_PROVIS_UPD','1','_MD_AM_LDAP_PROVIS_UPD_DESC','yesno','int',18),(125,0,7,'ldap_use_TLS','_MD_AM_LDAP_USETLS','0','_MD_AM_LDAP_USETLS_DESC','yesno','int',19),(126,0,8,'ml_enable','_MD_AM_ML_ENABLE','0','_MD_AM_ML_ENABLEDEC','yesno','int',0),(127,0,8,'ml_autoselect_enabled','_MD_AM_ML_AUTOSELECT_ENABLED','0','_MD_AM_ML_AUTOSELECT_ENABLED_DESC','yesno','int',1),(128,0,8,'ml_tags','_MD_AM_ML_TAGS','en,fr,it,nl','_MD_AM_ML_TAGSDSC','textbox','text',2),(129,0,8,'ml_names','_MD_AM_ML_NAMES','english,french,italian,dutch','_MD_AM_ML_NAMESDSC','textbox','text',3),(130,0,8,'ml_captions','_MD_AM_ML_CAPTIONS','English,français,Italiano,Nederlands','_MD_AM_ML_CAPTIONSDSC','textbox','text',4),(131,0,8,'ml_charset','_MD_AM_ML_CHARSET','UTF-8,UTF-8','_MD_AM_ML_CHARSETDSC','textbox','text',5),(132,0,10,'adm_left_logo','_MD_AM_LLOGOADM','/uploads/imagemanager/logos/img482278e29e81c.png','_MD_AM_LLOGOADM_DESC','select_image','text',0),(133,0,10,'adm_left_logo_url','_MD_AM_LLOGOADM_URL','http://127.0.0.1:18831/','_MD_AM_LLOGOADM_URL_DESC','textbox','text',1),(134,0,10,'adm_left_logo_alt','_MD_AM_LLOGOADM_ALT','ImpressCMS','_MD_AM_LLOGOADM_ALT_DESC','textbox','text',2),(135,0,10,'adm_right_logo','_MD_AM_RLOGOADM','','_MD_AM_RLOGOADM_DESC','select_image','text',3),(136,0,10,'adm_right_logo_url','_MD_AM_RLOGOADM_URL','','_MD_AM_RLOGOADM_URL_DESC','textbox','text',4),(137,0,10,'adm_right_logo_alt','_MD_AM_RLOGOADM_ALT','','_MD_AM_RLOGOADM_ALT_DESC','textbox','text',5),(138,0,10,'rss_local','_MD_AM_RSSLOCAL','https://www.impresscms.org/modules/news/rss.php','_MD_AM_RSSLOCAL_DESC','textbox','text',6),(139,0,10,'editre_block','_MD_AM_EDITREMOVEBLOCK','1','_MD_AM_EDITREMOVEBLOCKDSC','yesno','int',7),(140,0,10,'use_custom_redirection','_MD_AM_CUSTOMRED','1','_MD_AM_CUSTOMREDDSC','yesno','int',8),(141,0,10,'multi_login','_MD_AM_MULTLOGINPREVENT','0','_MD_AM_MULTLOGINPREVENTDSC','yesno','int',9),(142,0,10,'email_protect','_MD_AM_EMAILPROTECT','0','_MD_AM_EMAILPROTECTDSC','select','text',10),(143,0,10,'email_font','_MD_AM_EMAILTTF','arial.ttf','_MD_AM_EMAILTTF_DESC','select_font','text',11),(144,0,10,'email_font_len','_MD_AM_EMAILLEN','10','_MD_AM_EMAILLEN_DESC','textbox','int',12),(145,0,10,'email_cor','_MD_AM_EMAILCOLOR','#000000','_MD_AM_EMAILCOLOR_DESC','color','text',13),(146,0,10,'email_shadow','_MD_AM_EMAILSHADOW','#cccccc','_MD_AM_EMAILSHADOW_DESC','color','text',14),(147,0,10,'shadow_x','_MD_AM_SHADOWX','2','_MD_AM_SHADOWX_DESC','textbox','int',15),(148,0,10,'shadow_y','_MD_AM_SHADOWY','2','_MD_AM_SHADOWY_DESC','textbox','int',16),(149,0,10,'recprvkey','_MD_AM_RECPRVKEY','','_MD_AM_RECPRVKEY_DESC','textbox','text',17),(150,0,10,'recpubkey','_MD_AM_RECPUBKEY','','_MD_AM_RECPUBKEY_DESC','textbox','text',18),(151,0,10,'shorten_url','_MD_AM_SHORTURL','0','_MD_AM_SHORTURLDSC','yesno','int',19),(152,0,10,'max_url_long','_MD_AM_URLLEN','50','_MD_AM_URLLEN_DESC','textbox','int',20),(153,0,10,'pre_chars_left','_MD_AM_PRECHARS','35','_MD_AM_PRECHARS_DESC','textbox','int',21),(154,0,10,'last_chars_left','_MD_AM_LASTCHARS','10','_MD_AM_LASTCHARS_DESC','textbox','int',22),(155,0,10,'show_impresscms_menu','_MD_AM_SHOW_ICMSMENU','1','_MD_AM_SHOW_ICMSMENU_DESC','yesno','int',23),(156,0,10,'use_jsjalali','_MD_AM_JALALICAL','0','_MD_AM_JALALICALDSC','yesno','int',24),(157,0,10,'pagstyle','_MD_AM_PAGISTYLE','default','_MD_AM_PAGISTYLE_DESC','select_paginati','text',25),(158,0,11,'captcha_mode','_MD_AM_CAPTCHA_MODE','image','_MD_AM_CAPTCHA_MODEDSC','select','text',0),(159,0,11,'captcha_skipmember','_MD_AM_CAPTCHA_SKIPMEMBER','a:1:{i:0;s:1:\"2\";}','_MD_AM_CAPTCHA_SKIPMEMBERDSC','group_multi','array',1),(160,0,11,'captcha_casesensitive','_MD_AM_CAPTCHA_CASESENS','0','_MD_AM_CAPTCHA_CASESENSDSC','yesno','int',2),(161,0,11,'captcha_skip_characters','_MD_AM_CAPTCHA_SKIPCHAR','a:5:{i:0;s:1:\"o\";i:1;s:1:\"0\";i:2;s:1:\"i\";i:3;s:1:\"l\";i:4;s:1:\"1\";}','_MD_AM_CAPTCHA_SKIPCHARDSC','textsarea','array',3),(162,0,11,'captcha_maxattempt','_MD_AM_CAPTCHA_MAXATTEMP','8','_MD_AM_CAPTCHA_MAXATTEMPDSC','textbox','int',4),(163,0,11,'captcha_num_chars','_MD_AM_CAPTCHA_NUMCHARS','4','_MD_AM_CAPTCHA_NUMCHARSDSC','textbox','int',5),(164,0,11,'captcha_fontsize_min','_MD_AM_CAPTCHA_FONTMIN','10','_MD_AM_CAPTCHA_FONTMINDSC','textbox','int',6),(165,0,11,'captcha_fontsize_max','_MD_AM_CAPTCHA_FONTMAX','12','_MD_AM_CAPTCHA_FONTMAXDSC','textbox','int',7),(166,0,11,'captcha_background_type','_MD_AM_CAPTCHA_BGTYPE','100','_MD_AM_CAPTCHA_BGTYPEDSC','select','text',8),(167,0,11,'captcha_background_num','_MD_AM_CAPTCHA_BGNUM','50','_MD_AM_CAPTCHA_BGNUMDSC','textbox','int',9),(168,0,11,'captcha_polygon_point','_MD_AM_CAPTCHA_POLPNT','3','_MD_AM_CAPTCHA_POLPNTDSC','textbox','int',10),(169,0,12,'sanitizer_plugins','_MD_AM_SELECTSPLUGINS','a:2:{i:0;s:18:\"syntaxhighlightphp\";i:1;s:13:\"hiddencontent\";}','_MD_AM_SELECTSPLUGINS_DESC','select_plugin','array',0),(170,0,12,'code_sanitizer','_MD_AM_SELECTSHIGHLIGHT','none','_MD_AM_SELECTSHIGHLIGHT_DESC','select','text',1),(171,0,12,'geshi_default','_MD_AM_GESHI_DEFAULT','php','_MD_AM_GESHI_DEFAULT_DESC','select_geshi','text',2),(172,0,13,'autotasks_system','_MD_AM_AUTOTASKS_SYSTEM','internal','_MD_AM_AUTOTASKS_SYSTEMDSC','autotasksystem','text',0),(173,0,13,'autotasks_helper','_MD_AM_AUTOTASKS_HELPER','wget %url%','_MD_AM_AUTOTASKS_HELPERDSC','select','text',1),(174,0,13,'autotasks_helper_path','_MD_AM_AUTOTASKS_HELPER_PATH','/usr/bin/','_MD_AM_AUTOTASKS_HELPER_PATHDSC','text','text',2),(175,0,13,'autotasks_user','_MD_AM_AUTOTASKS_USER','','_MD_AM_AUTOTASKS_USERDSC','text','text',3),(176,0,14,'enable_purifier','_MD_AM_PURIFIER_ENABLE','1','_MD_AM_PURIFIER_ENABLEDSC','yesno','int',0),(177,0,14,'purifier_URI_DefinitionID','_MD_AM_PURIFIER_URI_DEFID','system','_MD_AM_PURIFIER_URI_DEFIDDSC','textbox','text',1),(178,0,14,'purifier_URI_DefinitionRev','_MD_AM_PURIFIER_URI_DEFREV','1','_MD_AM_PURIFIER_URI_DEFREVDSC','textbox','int',2),(179,0,14,'purifier_URI_Host','_MD_AM_PURIFIER_URI_HOST','127.0.0.1','_MD_AM_PURIFIER_URI_HOSTDSC','textbox','text',3),(180,0,14,'purifier_URI_Base','_MD_AM_PURIFIER_URI_BASE','127.0.0.1','_MD_AM_PURIFIER_URI_BASEDSC','textbox','text',4),(181,0,14,'purifier_URI_Disable','_MD_AM_PURIFIER_URI_DISABLE','0','_MD_AM_PURIFIER_URI_DISABLEDSC','yesno','int',5),(182,0,14,'purifier_URI_DisableExternal','_MD_AM_PURIFIER_URI_DISABLEEXT','0','_MD_AM_PURIFIER_URI_DISABLEEXTDSC','yesno','int',6),(183,0,14,'purifier_URI_DisableExternalResources','_MD_AM_PURIFIER_URI_DISABLEEXTRES','0','_MD_AM_PURIFIER_URI_DISABLEEXTRESDSC','yesno','int',7),(184,0,14,'purifier_URI_DisableResources','_MD_AM_PURIFIER_URI_DISABLERES','0','_MD_AM_PURIFIER_URI_DISABLERESDSC','yesno','int',8),(185,0,14,'purifier_URI_MakeAbsolute','_MD_AM_PURIFIER_URI_MAKEABS','0','_MD_AM_PURIFIER_URI_MAKEABSDSC','yesno','int',9),(186,0,14,'purifier_URI_HostBlacklist','_MD_AM_PURIFIER_URI_BLACKLIST','','_MD_AM_PURIFIER_URI_BLACKLISTDSC','textsarea','array',10),(187,0,14,'purifier_URI_AllowedSchemes','_MD_AM_PURIFIER_URI_ALLOWSCHEME','a:6:{i:0;s:4:\"http\";i:1;s:5:\"https\";i:2;s:6:\"mailto\";i:3;s:3:\"ftp\";i:4;s:4:\"nntp\";i:5;s:4:\"news\";}','_MD_AM_PURIFIER_URI_ALLOWSCHEMEDSC','textsarea','array',11),(188,0,14,'purifier_HTML_DefinitionID','_MD_AM_PURIFIER_HTML_DEFID','system','_MD_AM_PURIFIER_HTML_DEFIDDSC','textbox','text',12),(189,0,14,'purifier_HTML_DefinitionRev','_MD_AM_PURIFIER_HTML_DEFREV','1','_MD_AM_PURIFIER_HTML_DEFREVDSC','textbox','int',13),(190,0,14,'purifier_HTML_Doctype','_MD_AM_PURIFIER_HTML_DOCTYPE','XHTML 1.0 Transitional','_MD_AM_PURIFIER_HTML_DOCTYPEDSC','select','text',14),(191,0,14,'purifier_HTML_TidyLevel','_MD_AM_PURIFIER_HTML_TIDYLEVEL','medium','_MD_AM_PURIFIER_HTML_TIDYLEVELDSC','select','text',15),(192,0,14,'purifier_HTML_AllowedElements','_MD_AM_PURIFIER_HTML_ALLOWELE','a:48:{i:0;s:1:\"a\";i:1;s:4:\"abbr\";i:2;s:7:\"acronym\";i:3;s:1:\"b\";i:4;s:10:\"blockquote\";i:5;s:2:\"br\";i:6;s:7:\"caption\";i:7;s:4:\"cite\";i:8;s:4:\"code\";i:9;s:2:\"dd\";i:10;s:3:\"del\";i:11;s:3:\"dfn\";i:12;s:3:\"div\";i:13;s:2:\"dl\";i:14;s:2:\"dt\";i:15;s:2:\"em\";i:16;s:4:\"font\";i:17;s:2:\"h1\";i:18;s:2:\"h2\";i:19;s:2:\"h3\";i:20;s:2:\"h4\";i:21;s:2:\"h5\";i:22;s:2:\"h6\";i:23;s:1:\"i\";i:24;s:3:\"img\";i:25;s:3:\"ins\";i:26;s:3:\"kbd\";i:27;s:2:\"li\";i:28;s:2:\"ol\";i:29;s:1:\"p\";i:30;s:3:\"pre\";i:31;s:1:\"s\";i:32;s:4:\"span\";i:33;s:6:\"strike\";i:34;s:6:\"strong\";i:35;s:3:\"sub\";i:36;s:3:\"sup\";i:37;s:5:\"table\";i:38;s:5:\"tbody\";i:39;s:2:\"td\";i:40;s:5:\"tfoot\";i:41;s:2:\"th\";i:42;s:5:\"thead\";i:43;s:2:\"tr\";i:44;s:2:\"tt\";i:45;s:1:\"u\";i:46;s:2:\"ul\";i:47;s:3:\"var\";}','_MD_AM_PURIFIER_HTML_ALLOWELEDSC','textsarea','array',16),(193,0,14,'purifier_HTML_AllowedAttributes','_MD_AM_PURIFIER_HTML_ALLOWATTR','a:67:{i:0;s:7:\"a.class\";i:1;s:6:\"a.href\";i:2;s:4:\"a.id\";i:3;s:6:\"a.name\";i:4;s:5:\"a.rev\";i:5;s:7:\"a.style\";i:6;s:7:\"a.title\";i:7;s:8:\"a.target\";i:8;s:5:\"a.rel\";i:9;s:10:\"abbr.title\";i:10;s:13:\"acronym.title\";i:11;s:15:\"blockquote.cite\";i:12;s:9:\"div.align\";i:13;s:9:\"div.style\";i:14;s:9:\"div.class\";i:15;s:6:\"div.id\";i:16;s:9:\"font.size\";i:17;s:10:\"font.color\";i:18;s:8:\"h1.style\";i:19;s:8:\"h2.style\";i:20;s:8:\"h3.style\";i:21;s:8:\"h4.style\";i:22;s:8:\"h5.style\";i:23;s:8:\"h6.style\";i:24;s:7:\"img.src\";i:25;s:7:\"img.alt\";i:26;s:9:\"img.title\";i:27;s:9:\"img.class\";i:28;s:9:\"img.align\";i:29;s:9:\"img.style\";i:30;s:10:\"img.height\";i:31;s:9:\"img.width\";i:32;s:8:\"li.style\";i:33;s:8:\"ol.style\";i:34;s:7:\"p.style\";i:35;s:10:\"span.style\";i:36;s:10:\"span.class\";i:37;s:7:\"span.id\";i:38;s:11:\"table.class\";i:39;s:8:\"table.id\";i:40;s:12:\"table.border\";i:41;s:17:\"table.cellpadding\";i:42;s:17:\"table.cellspacing\";i:43;s:11:\"table.style\";i:44;s:11:\"table.width\";i:45;s:7:\"td.abbr\";i:46;s:8:\"td.align\";i:47;s:8:\"td.class\";i:48;s:5:\"td.id\";i:49;s:10:\"td.colspan\";i:50;s:10:\"td.rowspan\";i:51;s:8:\"td.style\";i:52;s:9:\"td.valign\";i:53;s:8:\"tr.align\";i:54;s:8:\"tr.class\";i:55;s:5:\"tr.id\";i:56;s:8:\"tr.style\";i:57;s:9:\"tr.valign\";i:58;s:7:\"th.abbr\";i:59;s:8:\"th.align\";i:60;s:8:\"th.class\";i:61;s:5:\"th.id\";i:62;s:10:\"th.colspan\";i:63;s:10:\"th.rowspan\";i:64;s:8:\"th.style\";i:65;s:9:\"th.valign\";i:66;s:8:\"ul.style\";}','_MD_AM_PURIFIER_HTML_ALLOWATTRDSC','textsarea','array',17),(194,0,14,'purifier_HTML_ForbiddenElements','_MD_AM_PURIFIER_HTML_FORBIDELE','','_MD_AM_PURIFIER_HTML_FORBIDELEDSC','textsarea','array',18),(195,0,14,'purifier_HTML_ForbiddenAttributes','_MD_AM_PURIFIER_HTML_FORBIDATTR','','_MD_AM_PURIFIER_HTML_FORBIDATTRDSC','textsarea','array',19),(196,0,14,'purifier_HTML_MaxImgLength','_MD_AM_PURIFIER_HTML_MAXIMGLENGTH','1200','_MD_AM_PURIFIER_HTML_MAXIMGLENGTHDSC','textbox','int',20),(197,0,14,'purifier_HTML_SafeEmbed','_MD_AM_PURIFIER_HTML_SAFEEMBED','0','_MD_AM_PURIFIER_HTML_SAFEEMBEDDSC','yesno','int',21),(198,0,14,'purifier_HTML_SafeObject','_MD_AM_PURIFIER_HTML_SAFEOBJECT','0','_MD_AM_PURIFIER_HTML_SAFEOBJECTDSC','yesno','int',22),(199,0,14,'purifier_HTML_AttrNameUseCDATA','_MD_AM_PURIFIER_HTML_ATTRNAMEUSECDATA','0','_MD_AM_PURIFIER_HTML_ATTRNAMEUSECDATADSC','yesno','int',23),(200,0,14,'purifier_Filter_ExtractStyleBlocks','_MD_AM_PURIFIER_FILTER_EXTRACTSTYLEBLK','1','_MD_AM_PURIFIER_FILTER_EXTRACTSTYLEBLKDSC','yesno','int',24),(201,0,14,'purifier_Filter_ExtractStyleBlocks_Escaping','_MD_AM_PURIFIER_FILTER_EXTRACTSTYLEESC','1','_MD_AM_PURIFIER_FILTER_EXTRACTSTYLEESCDSC','yesno','int',25),(202,0,14,'purifier_Filter_ExtractStyleBlocks_Scope','_MD_AM_PURIFIER_FILTER_EXTRACTSTYLEBLKSCOPE','','_MD_AM_PURIFIER_FILTER_EXTRACTSTYLEBLKSCOPEDSC','textsarea','text',26),(203,0,14,'purifier_Filter_YouTube','_MD_AM_PURIFIER_FILTER_ENABLEYOUTUBE','1','_MD_AM_PURIFIER_FILTER_ENABLEYOUTUBEDSC','yesno','int',27),(204,0,14,'purifier_Core_EscapeNonASCIICharacters','_MD_AM_PURIFIER_CORE_ESCNONASCIICHARS','1','_MD_AM_PURIFIER_CORE_ESCNONASCIICHARSDSC','yesno','int',28),(205,0,14,'purifier_Core_HiddenElements','_MD_AM_PURIFIER_CORE_HIDDENELE','a:2:{i:0;s:6:\"script\";i:1;s:5:\"style\";}','_MD_AM_PURIFIER_CORE_HIDDENELEDSC','textsarea','array',29),(206,0,14,'purifier_Core_RemoveInvalidImg','_MD_AM_PURIFIER_CORE_REMINVIMG','1','_MD_AM_PURIFIER_CORE_REMINVIMGDSC','yesno','int',30),(207,0,14,'purifier_AutoFormat_AutoParagraph','_MD_AM_PURIFIER_AUTO_AUTOPARA','0','_MD_AM_PURIFIER_AUTO_AUTOPARADSC','yesno','int',31),(208,0,14,'purifier_AutoFormat_DisplayLinkURI','_MD_AM_PURIFIER_AUTO_DISPLINKURI','0','_MD_AM_PURIFIER_AUTO_DISPLINKURIDSC','yesno','int',32),(209,0,14,'purifier_AutoFormat_Linkify','_MD_AM_PURIFIER_AUTO_LINKIFY','1','_MD_AM_PURIFIER_AUTO_LINKIFYDSC','yesno','int',33),(210,0,14,'purifier_AutoFormat_PurifierLinkify','_MD_AM_PURIFIER_AUTO_PURILINKIFY','0','_MD_AM_PURIFIER_AUTO_PURILINKIFYDSC','yesno','int',34),(211,0,14,'purifier_AutoFormat_Custom','_MD_AM_PURIFIER_AUTO_CUSTOM','','_MD_AM_PURIFIER_AUTO_CUSTOMDSC','textsarea','array',35),(212,0,14,'purifier_AutoFormat_RemoveEmpty','_MD_AM_PURIFIER_AUTO_REMOVEEMPTY','0','_MD_AM_PURIFIER_AUTO_REMOVEEMPTYDSC','yesno','int',36),(213,0,14,'purifier_AutoFormat_RemoveEmptyNbsp','_MD_AM_PURIFIER_AUTO_REMOVEEMPTYNBSP','0','_MD_AM_PURIFIER_AUTO_REMOVEEMPTYNBSPDSC','yesno','int',37),(214,0,14,'purifier_AutoFormat_RemoveEmptyNbspExceptions','_MD_AM_PURIFIER_AUTO_REMOVEEMPTYNBSPEXCEPT','a:2:{i:0;s:2:\"td\";i:1;s:2:\"th\";}','_MD_AM_PURIFIER_AUTO_REMOVEEMPTYNBSPEXCEPTDSC','textsarea','array',38),(215,0,14,'purifier_Attr_AllowedFrameTargets','_MD_AM_PURIFIER_ATTR_ALLOWFRAMETARGET','a:4:{i:0;s:6:\"_blank\";i:1;s:7:\"_parent\";i:2;s:5:\"_self\";i:3;s:4:\"_top\";}','_MD_AM_PURIFIER_ATTR_ALLOWFRAMETARGETDSC','textsarea','array',39),(216,0,14,'purifier_Attr_AllowedRel','_MD_AM_PURIFIER_ATTR_ALLOWREL','a:4:{i:0;s:8:\"external\";i:1;s:8:\"nofollow\";i:2;s:17:\"external nofollow\";i:3;s:8:\"lightbox\";}','_MD_AM_PURIFIER_ATTR_ALLOWRELDSC','textsarea','array',40),(217,0,14,'purifier_Attr_AllowedClasses','_MD_AM_PURIFIER_ATTR_ALLOWCLASSES','','_MD_AM_PURIFIER_ATTR_ALLOWCLASSESDSC','textsarea','array',41),(218,0,14,'purifier_Attr_ForbiddenClasses','_MD_AM_PURIFIER_ATTR_FORBIDDENCLASSES','','_MD_AM_PURIFIER_ATTR_FORBIDDENCLASSESDSC','textsarea','array',42),(219,0,14,'purifier_Attr_DefaultInvalidImage','_MD_AM_PURIFIER_ATTR_DEFINVIMG','','_MD_AM_PURIFIER_ATTR_DEFINVIMGDSC','textbox','text',43),(220,0,14,'purifier_Attr_DefaultInvalidImageAlt','_MD_AM_PURIFIER_ATTR_DEFINVIMGALT','','_MD_AM_PURIFIER_ATTR_DEFINVIMGALTDSC','textbox','text',44),(221,0,14,'purifier_Attr_DefaultImageAlt','_MD_AM_PURIFIER_ATTR_DEFIMGALT','','_MD_AM_PURIFIER_ATTR_DEFIMGALTDSC','textbox','text',45),(222,0,14,'purifier_Attr_ClassUseCDATA','_MD_AM_PURIFIER_ATTR_CLASSUSECDATA','1','_MD_AM_PURIFIER_ATTR_CLASSUSECDATADSC','yesno','int',46),(223,0,14,'purifier_Attr_EnableID','_MD_AM_PURIFIER_ATTR_ENABLEID','1','_MD_AM_PURIFIER_ATTR_ENABLEIDDSC','yesno','int',47),(224,0,14,'purifier_Attr_IDPrefix','_MD_AM_PURIFIER_ATTR_IDPREFIX','','_MD_AM_PURIFIER_ATTR_IDPREFIXDSC','textbox','text',48),(225,0,14,'purifier_Attr_IDPrefixLocal','_MD_AM_PURIFIER_ATTR_IDPREFIXLOCAL','','_MD_AM_PURIFIER_ATTR_IDPREFIXLOCALDSC','textbox','text',49),(226,0,14,'purifier_Attr_IDBlacklist','_MD_AM_PURIFIER_ATTR_IDBLACKLIST','','_MD_AM_PURIFIER_ATTR_IDBLACKLISTDSC','textsarea','array',50),(227,0,14,'purifier_CSS_DefinitionRev','_MD_AM_PURIFIER_CSS_DEFREV','1','_MD_AM_PURIFIER_CSS_DEFREVDSC','textbox','int',51),(228,0,14,'purifier_CSS_AllowImportant','_MD_AM_PURIFIER_CSS_ALLOWIMPORTANT','1','_MD_AM_PURIFIER_CSS_ALLOWIMPORTANTDSC','yesno','int',52),(229,0,14,'purifier_CSS_AllowTricky','_MD_AM_PURIFIER_CSS_ALLOWTRICKY','1','_MD_AM_PURIFIER_CSS_ALLOWTRICKYDSC','yesno','int',53),(230,0,14,'purifier_CSS_AllowedProperties','_MD_AM_PURIFIER_CSS_ALLOWPROP','','_MD_AM_PURIFIER_CSS_ALLOWPROPDSC','textsarea','array',54),(231,0,14,'purifier_CSS_MaxImgLength','_MD_AM_PURIFIER_CSS_MAXIMGLEN','1200px','_MD_AM_PURIFIER_CSS_MAXIMGLENDSC','textbox','text',55),(232,0,14,'purifier_CSS_Proprietary','_MD_AM_PURIFIER_CSS_PROPRIETARY','1','_MD_AM_PURIFIER_CSS_PROPRIETARYDSC','yesno','int',56);
/*!40000 ALTER TABLE `icms_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_configcategory`
--

DROP TABLE IF EXISTS `icms_configcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_configcategory` (
  `confcat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `confcat_name` varchar(255) NOT NULL DEFAULT '',
  `confcat_order` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`confcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_configcategory`
--

LOCK TABLES `icms_configcategory` WRITE;
/*!40000 ALTER TABLE `icms_configcategory` DISABLE KEYS */;
INSERT INTO `icms_configcategory` VALUES (1,'_MD_AM_GENERAL',0),(2,'_MD_AM_USERSETTINGS',0),(3,'_MD_AM_METAFOOTER',0),(4,'_MD_AM_CENSOR',0),(5,'_MD_AM_SEARCH',0),(6,'_MD_AM_MAILER',0),(7,'_MD_AM_AUTHENTICATION',0),(8,'_MD_AM_MULTILANGUAGE',0),(10,'_MD_AM_PERSON',0),(11,'_MD_AM_CAPTCHA',0),(12,'_MD_AM_PLUGINS',0),(13,'_MD_AM_AUTOTASKS',0),(14,'_MD_AM_PURIFIER',0);
/*!40000 ALTER TABLE `icms_configcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_configoption`
--

DROP TABLE IF EXISTS `icms_configoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_configoption` (
  `confop_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `confop_name` varchar(255) NOT NULL DEFAULT '',
  `confop_value` varchar(255) NOT NULL DEFAULT '',
  `conf_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`confop_id`),
  KEY `conf_id` (`conf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_configoption`
--

LOCK TABLES `icms_configoption` WRITE;
/*!40000 ALTER TABLE `icms_configoption` DISABLE KEYS */;
INSERT INTO `icms_configoption` VALUES (1,'_MD_AM_DEBUGMODE0','0',23),(2,'_MD_AM_DEBUGMODE1','1',23),(3,'_MD_AM_DEBUGMODE2','2',23),(4,'_MD_AM_DEBUGMODE3','3',23),(5,'_NESTED','nest',31),(6,'_FLAT','flat',31),(7,'_THREADED','thread',31),(8,'_OLDESTFIRST','0',32),(9,'_NEWESTFIRST','1',32),(10,'_MD_AM_PASSLEVEL1','20',39),(11,'_MD_AM_PASSLEVEL2','40',39),(12,'_MD_AM_PASSLEVEL3','60',39),(13,'_MD_AM_PASSLEVEL4','80',39),(14,'_MD_AM_PASSLEVEL5','95',39),(15,'_MD_AM_USERACTV','0',53),(16,'_MD_AM_AUTOACTV','1',53),(17,'_MD_AM_ADMINACTV','2',53),(18,'_MD_AM_REGINVITE','3',53),(19,'_MD_AM_STRICT','0',55),(20,'_MD_AM_MEDIUM','1',55),(21,'_MD_AM_LIGHT','2',55),(22,'_MD_AM_ENC_MD5','20',74),(23,'_MD_AM_ENC_SHA256','21',74),(24,'_MD_AM_ENC_SHA384','22',74),(25,'_MD_AM_ENC_SHA512','23',74),(26,'_MD_AM_ENC_RIPEMD128','24',74),(27,'_MD_AM_ENC_RIPEMD160','25',74),(28,'_MD_AM_ENC_WHIRLPOOL','26',74),(29,'_MD_AM_ENC_HAVAL1284','27',74),(30,'_MD_AM_ENC_HAVAL1604','28',74),(31,'_MD_AM_ENC_HAVAL1924','29',74),(32,'_MD_AM_ENC_HAVAL2244','30',74),(33,'_MD_AM_ENC_HAVAL2564','31',74),(34,'_MD_AM_ENC_HAVAL1285','32',74),(35,'_MD_AM_ENC_HAVAL1605','33',74),(36,'_MD_AM_ENC_HAVAL1925','34',74),(37,'_MD_AM_ENC_HAVAL2245','35',74),(38,'_MD_AM_ENC_HAVAL2565','36',74),(39,'_MD_AM_INDEXFOLLOW','index,follow',77),(40,'_MD_AM_NOINDEXFOLLOW','noindex,follow',77),(41,'_MD_AM_INDEXNOFOLLOW','index,nofollow',77),(42,'_MD_AM_NOINDEXNOFOLLOW','noindex,nofollow',77),(43,'_MD_AM_METAOGEN','general',78),(44,'_MD_AM_METAO14YRS','14 years',78),(45,'_MD_AM_METAOREST','restricted',78),(46,'_MD_AM_METAOMAT','mature',78),(47,'PHP mail()','mail',99),(48,'sendmail','sendmail',99),(49,'SMTP','smtp',99),(50,'SMTPAuth','smtpauth',99),(51,'None','',103),(52,'SSL','ssl',103),(53,'TLS','tls',103),(54,'_MD_AM_AUTH_CONFOPTION_XOOPS','xoops',106),(55,'_MD_AM_AUTH_CONFOPTION_LDAP','ldap',106),(56,'_MD_AM_AUTH_CONFOPTION_AD','ads',106),(57,'_MD_AM_NOMAILPROTECT','0',142),(58,'_MD_AM_GDMAILPROTECT','1',142),(59,'_MD_AM_REMAILPROTECT','2',142),(60,'_MD_AM_CAPTCHA_OFF','none',158),(61,'_MD_AM_CAPTCHA_IMG','image',158),(62,'_MD_AM_CAPTCHA_TXT','text',158),(63,'_MD_AM_BAR','0',166),(64,'_MD_AM_CIRCLE','1',166),(65,'_MD_AM_LINE','2',166),(66,'_MD_AM_RECTANGLE','3',166),(67,'_MD_AM_ELLIPSE','4',166),(68,'_MD_AM_POLYGON','5',166),(69,'_MD_AM_RANDOM','100',166),(70,'_MD_AM_HIGHLIGHTER_OFF','none',170),(71,'_MD_AM_HIGHLIGHTER_PHP','php',170),(72,'_MD_AM_HIGHLIGHTER_GESHI','geshi',170),(73,'PHP-CGI','php -f %path%',173),(74,'wget','wget %url%',173),(75,'Lynx','lynx --dump %url%',173),(76,'_MD_AM_PURIFIER_401T','HTML 4.01 Transitional',190),(77,'_MD_AM_PURIFIER_401S','HTML 4.01 Strict',190),(78,'_MD_AM_PURIFIER_X10T','XHTML 1.0 Transitional',190),(79,'_MD_AM_PURIFIER_X10S','XHTML 1.0 Strict',190),(80,'_MD_AM_PURIFIER_X11','XHTML 1.1',190),(81,'_MD_AM_PURIFIER_NONE','none',191),(82,'_MD_AM_PURIFIER_LIGHT','light',191),(83,'_MD_AM_PURIFIER_MEDIUM','medium',191),(84,'_MD_AM_PURIFIER_HEAVY','heavy',191);
/*!40000 ALTER TABLE `icms_configoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_group_permission`
--

DROP TABLE IF EXISTS `icms_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_group_permission` (
  `gperm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gperm_groupid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `gperm_itemid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `gperm_modid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `gperm_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`gperm_id`),
  KEY `name_mod_group` (`gperm_name`(10),`gperm_modid`,`gperm_groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_group_permission`
--

LOCK TABLES `icms_group_permission` WRITE;
/*!40000 ALTER TABLE `icms_group_permission` DISABLE KEYS */;
INSERT INTO `icms_group_permission` VALUES (1,2,20,1,'use_extension'),(2,1,20,1,'use_extension'),(3,2,19,1,'use_extension'),(4,1,19,1,'use_extension'),(5,2,76,1,'use_extension'),(6,1,76,1,'use_extension'),(7,2,77,1,'use_extension'),(8,1,77,1,'use_extension'),(9,2,82,1,'use_extension'),(10,1,82,1,'use_extension'),(11,2,79,1,'use_extension'),(12,1,79,1,'use_extension'),(13,2,80,1,'use_extension'),(14,1,80,1,'use_extension'),(15,2,81,1,'use_extension'),(16,1,81,1,'use_extension'),(17,2,83,1,'use_extension'),(18,1,83,1,'use_extension'),(19,2,84,1,'use_extension'),(20,1,84,1,'use_extension'),(21,2,100,1,'use_extension'),(22,1,100,1,'use_extension'),(23,2,101,1,'use_extension'),(24,1,101,1,'use_extension'),(25,1,1,1,'module_admin'),(26,1,1,1,'module_read'),(27,2,1,1,'module_read'),(28,3,1,1,'module_read'),(29,1,1,1,'system_admin'),(30,1,2,1,'system_admin'),(31,1,3,1,'system_admin'),(32,1,4,1,'system_admin'),(33,1,5,1,'system_admin'),(34,1,6,1,'system_admin'),(35,1,7,1,'system_admin'),(36,1,8,1,'system_admin'),(37,1,9,1,'system_admin'),(38,1,10,1,'system_admin'),(39,1,11,1,'system_admin'),(40,1,12,1,'system_admin'),(41,1,13,1,'system_admin'),(42,1,14,1,'system_admin'),(43,1,15,1,'system_admin'),(44,1,16,1,'system_admin'),(45,1,17,1,'system_admin'),(46,1,18,1,'system_admin'),(47,1,19,1,'system_admin'),(48,1,20,1,'system_admin'),(49,1,1,1,'group_manager'),(50,1,2,1,'group_manager'),(51,1,3,1,'group_manager'),(52,1,1,1,'content_read'),(53,2,1,1,'content_read'),(54,3,1,1,'content_read'),(55,1,1,1,'content_admin'),(56,1,1,1,'use_wysiwygeditor'),(57,1,1,1,'imgcat_write'),(58,1,1,1,'imgcat_read'),(59,1,1,1,'block_read'),(60,2,1,1,'block_read'),(61,3,1,1,'block_read'),(62,1,2,1,'block_read'),(63,2,2,1,'block_read'),(64,3,2,1,'block_read'),(65,1,3,1,'block_read'),(66,2,3,1,'block_read'),(67,3,3,1,'block_read'),(68,1,4,1,'block_read'),(69,2,4,1,'block_read'),(70,3,4,1,'block_read'),(71,1,5,1,'block_read'),(72,2,5,1,'block_read'),(73,3,5,1,'block_read'),(74,1,6,1,'block_read'),(75,2,6,1,'block_read'),(76,3,6,1,'block_read'),(77,1,7,1,'block_read'),(78,2,7,1,'block_read'),(79,3,7,1,'block_read'),(80,1,8,1,'block_read'),(81,2,8,1,'block_read'),(82,3,8,1,'block_read'),(83,1,9,1,'block_read'),(84,2,9,1,'block_read'),(85,3,9,1,'block_read'),(86,1,10,1,'block_read'),(87,2,10,1,'block_read'),(88,3,10,1,'block_read'),(89,1,11,1,'block_read'),(90,2,11,1,'block_read'),(91,3,11,1,'block_read'),(92,1,12,1,'block_read'),(93,2,12,1,'block_read'),(94,3,12,1,'block_read'),(95,1,13,1,'block_read'),(96,2,13,1,'block_read'),(97,3,13,1,'block_read'),(98,1,14,1,'block_read'),(99,2,14,1,'block_read'),(100,3,14,1,'block_read'),(101,1,15,1,'block_read'),(102,2,15,1,'block_read'),(103,3,15,1,'block_read'),(104,1,16,1,'block_read'),(105,2,16,1,'block_read'),(106,3,16,1,'block_read'),(107,1,17,1,'block_read'),(108,2,17,1,'block_read'),(109,3,17,1,'block_read'),(110,1,18,1,'block_read'),(111,2,18,1,'block_read'),(112,3,18,1,'block_read'),(113,1,19,1,'block_read'),(114,2,19,1,'block_read'),(115,3,19,1,'block_read'),(116,1,20,1,'block_read'),(117,3,21,1,'block_read');
/*!40000 ALTER TABLE `icms_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_groups`
--

DROP TABLE IF EXISTS `icms_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_groups` (
  `groupid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `group_type` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupid`),
  KEY `group_type` (`group_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_groups`
--

LOCK TABLES `icms_groups` WRITE;
/*!40000 ALTER TABLE `icms_groups` DISABLE KEYS */;
INSERT INTO `icms_groups` VALUES (1,'Webmasters','Webmasters of this site','Admin'),(2,'Registered Users','Registered Users Group','User'),(3,'Anonymous Users','Anonymous Users Group','Anonymous');
/*!40000 ALTER TABLE `icms_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_groups_users_link`
--

DROP TABLE IF EXISTS `icms_groups_users_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_groups_users_link` (
  `linkid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`linkid`),
  KEY `groupid_uid` (`groupid`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_groups_users_link`
--

LOCK TABLES `icms_groups_users_link` WRITE;
/*!40000 ALTER TABLE `icms_groups_users_link` DISABLE KEYS */;
INSERT INTO `icms_groups_users_link` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `icms_groups_users_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_icms_data_file`
--

DROP TABLE IF EXISTS `icms_icms_data_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_icms_data_file` (
  `fileid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL,
  `caption` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`fileid`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_icms_data_file`
--

LOCK TABLES `icms_icms_data_file` WRITE;
/*!40000 ALTER TABLE `icms_icms_data_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_icms_data_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_icms_data_urllink`
--

DROP TABLE IF EXISTS `icms_icms_data_urllink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_icms_data_urllink` (
  `urllinkid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL,
  `caption` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(6) NOT NULL,
  PRIMARY KEY (`urllinkid`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_icms_data_urllink`
--

LOCK TABLES `icms_icms_data_urllink` WRITE;
/*!40000 ALTER TABLE `icms_icms_data_urllink` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_icms_data_urllink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_icmspage`
--

DROP TABLE IF EXISTS `icms_icmspage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_icmspage` (
  `page_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `page_moduleid` mediumint(8) unsigned NOT NULL DEFAULT 1,
  `page_title` varchar(255) NOT NULL DEFAULT '',
  `page_url` varchar(255) NOT NULL DEFAULT '',
  `page_status` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_icmspage`
--

LOCK TABLES `icms_icmspage` WRITE;
/*!40000 ALTER TABLE `icms_icmspage` DISABLE KEYS */;
INSERT INTO `icms_icmspage` VALUES (2,1,'Admin Control Panel','admin.php',1),(3,1,'Avatars','modules/system/admin.php?fct=avatars*',1),(5,1,'Blocks Admin','modules/system/admin.php?fct=blocksadmin*',1),(6,1,'Block Positions','modules/system/admin.php?fct=blockspadmin*',1),(7,1,'Comments','modules/system/admin.php?fct=comments*',1),(9,1,'Find Users','modules/system/admin.php?fct=findusers*',1),(10,1,'Custom Tag','modules/system/admin.php?fct=customtag*',1),(11,1,'Groups','modules/system/admin.php?fct=groups*',1),(12,1,'Image Manager','modules/system/admin.php?fct=images*',1),(13,1,'Mail Users','modules/system/admin.php?fct=mailusers*',1),(14,1,'Modules Admin','modules/system/admin.php?fct=modulesadmin*',1),(15,1,'Symlink Manager','modules/system/admin.php?fct=pages*',1),(16,1,'Preferences','modules/system/admin.php?fct=preferences*',1),(17,1,'Smilies','modules/system/admin.php?fct=smilies*',1),(18,1,'Templates','modules/system/admin.php?fct=tplsets*',1),(19,1,'User Ranks','modules/system/admin.php?fct=userrank*',1),(20,1,'User Edit','modules/system/admin.php?fct=users*',1),(21,1,'Version Checker','modules/system/admin.php?fct=version*',1);
/*!40000 ALTER TABLE `icms_icmspage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_image`
--

DROP TABLE IF EXISTS `icms_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_image` (
  `image_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `image_name` varchar(30) NOT NULL DEFAULT '',
  `image_nicename` varchar(255) NOT NULL DEFAULT '',
  `image_mimetype` varchar(30) NOT NULL DEFAULT '',
  `image_created` int(10) unsigned NOT NULL DEFAULT 0,
  `image_display` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `image_weight` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imgcat_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`image_id`),
  KEY `imgcat_id` (`imgcat_id`),
  KEY `image_display` (`image_display`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_image`
--

LOCK TABLES `icms_image` WRITE;
/*!40000 ALTER TABLE `icms_image` DISABLE KEYS */;
INSERT INTO `icms_image` VALUES (1,'img482278e29e81c.png','ImpressCMS','image/png',1790763743,1,0,1);
/*!40000 ALTER TABLE `icms_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_imagebody`
--

DROP TABLE IF EXISTS `icms_imagebody`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_imagebody` (
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `image_body` mediumblob DEFAULT NULL,
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_imagebody`
--

LOCK TABLES `icms_imagebody` WRITE;
/*!40000 ALTER TABLE `icms_imagebody` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_imagebody` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_imagecategory`
--

DROP TABLE IF EXISTS `icms_imagecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_imagecategory` (
  `imgcat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `imgcat_pid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imgcat_name` varchar(100) NOT NULL DEFAULT '',
  `imgcat_maxsize` int(8) unsigned NOT NULL DEFAULT 0,
  `imgcat_maxwidth` smallint(3) unsigned NOT NULL DEFAULT 0,
  `imgcat_maxheight` smallint(3) unsigned NOT NULL DEFAULT 0,
  `imgcat_display` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `imgcat_weight` smallint(3) unsigned NOT NULL DEFAULT 0,
  `imgcat_type` char(1) NOT NULL DEFAULT '',
  `imgcat_storetype` varchar(5) NOT NULL DEFAULT '',
  `imgcat_foldername` varchar(100) DEFAULT '',
  PRIMARY KEY (`imgcat_id`),
  KEY `imgcat_display` (`imgcat_display`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_imagecategory`
--

LOCK TABLES `icms_imagecategory` WRITE;
/*!40000 ALTER TABLE `icms_imagecategory` DISABLE KEYS */;
INSERT INTO `icms_imagecategory` VALUES (1,0,'Logos',358400,350,80,1,0,'C','file','logos');
/*!40000 ALTER TABLE `icms_imagecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_imgset`
--

DROP TABLE IF EXISTS `icms_imgset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_imgset` (
  `imgset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `imgset_name` varchar(50) NOT NULL DEFAULT '',
  `imgset_refid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`imgset_id`),
  KEY `imgset_refid` (`imgset_refid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_imgset`
--

LOCK TABLES `icms_imgset` WRITE;
/*!40000 ALTER TABLE `icms_imgset` DISABLE KEYS */;
INSERT INTO `icms_imgset` VALUES (1,'default',0);
/*!40000 ALTER TABLE `icms_imgset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_imgset_tplset_link`
--

DROP TABLE IF EXISTS `icms_imgset_tplset_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_imgset_tplset_link` (
  `imgset_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `tplset_name` varchar(50) NOT NULL DEFAULT '',
  KEY `tplset_name` (`tplset_name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_imgset_tplset_link`
--

LOCK TABLES `icms_imgset_tplset_link` WRITE;
/*!40000 ALTER TABLE `icms_imgset_tplset_link` DISABLE KEYS */;
INSERT INTO `icms_imgset_tplset_link` VALUES (1,'default');
/*!40000 ALTER TABLE `icms_imgset_tplset_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_imgsetimg`
--

DROP TABLE IF EXISTS `icms_imgsetimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_imgsetimg` (
  `imgsetimg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `imgsetimg_file` varchar(50) NOT NULL DEFAULT '',
  `imgsetimg_body` blob NOT NULL,
  `imgsetimg_imgset` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`imgsetimg_id`),
  KEY `imgsetimg_imgset` (`imgsetimg_imgset`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_imgsetimg`
--

LOCK TABLES `icms_imgsetimg` WRITE;
/*!40000 ALTER TABLE `icms_imgsetimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_imgsetimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_invites`
--

DROP TABLE IF EXISTS `icms_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_invites` (
  `invite_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `invite_to` varchar(255) NOT NULL DEFAULT '',
  `invite_code` varchar(8) NOT NULL DEFAULT '',
  `invite_date` int(10) unsigned NOT NULL DEFAULT 0,
  `view_date` int(10) unsigned NOT NULL DEFAULT 0,
  `register_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `extra_info` text NOT NULL,
  PRIMARY KEY (`invite_id`),
  KEY `invite_code` (`invite_code`),
  KEY `register_id` (`register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_invites`
--

LOCK TABLES `icms_invites` WRITE;
/*!40000 ALTER TABLE `icms_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_modules`
--

DROP TABLE IF EXISTS `icms_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_modules` (
  `mid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '00.00.00',
  `last_update` int(10) unsigned NOT NULL DEFAULT 0,
  `weight` smallint(3) unsigned NOT NULL DEFAULT 0,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `dirname` varchar(25) NOT NULL DEFAULT '',
  `hasmain` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `hasadmin` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `hassearch` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `hasconfig` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `hascomments` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `hasnotification` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `dbversion` int(11) unsigned NOT NULL DEFAULT 1,
  `modname` varchar(25) NOT NULL DEFAULT '',
  `ipf` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`mid`),
  KEY `dirname` (`dirname`(5)),
  KEY `active_main_weight` (`isactive`,`hasmain`,`weight`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_modules`
--

LOCK TABLES `icms_modules` WRITE;
/*!40000 ALTER TABLE `icms_modules` DISABLE KEYS */;
INSERT INTO `icms_modules` VALUES (1,'System','2.0.3',1790763743,0,1,'system',0,1,0,0,0,0,40,'system',0);
/*!40000 ALTER TABLE `icms_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_newblocks`
--

DROP TABLE IF EXISTS `icms_newblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_newblocks` (
  `bid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `func_num` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `options` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `side` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `weight` smallint(5) unsigned NOT NULL DEFAULT 0,
  `visible` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `block_type` char(1) NOT NULL DEFAULT '',
  `c_type` char(1) NOT NULL DEFAULT '',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `dirname` varchar(50) NOT NULL DEFAULT '',
  `func_file` varchar(50) NOT NULL DEFAULT '',
  `show_func` varchar(50) NOT NULL DEFAULT '',
  `edit_func` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(50) NOT NULL DEFAULT '',
  `bcachetime` int(10) unsigned NOT NULL DEFAULT 0,
  `last_modified` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`bid`),
  KEY `mid` (`mid`),
  KEY `visible` (`visible`),
  KEY `isactive_visible_mid` (`isactive`,`visible`,`mid`),
  KEY `mid_funcnum` (`mid`,`func_num`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_newblocks`
--

LOCK TABLES `icms_newblocks` WRITE;
/*!40000 ALTER TABLE `icms_newblocks` DISABLE KEYS */;
INSERT INTO `icms_newblocks` VALUES (1,1,1,'','User Menu','User Menu','',1,0,1,'S','H',1,'system','system_blocks.php','b_system_user_show','','system_block_user.html',0,1790763743),(2,1,2,'','Login','Login','',1,0,1,'S','H',1,'system','system_blocks.php','b_system_login_show','','system_block_login.html',0,1790763743),(3,1,3,'','Search','Search','',2,0,1,'S','H',1,'system','system_blocks.php','b_system_search_show','','system_block_search.html',0,1790763743),(4,1,4,'1|5','Waiting Contents','Waiting Contents','',9,0,1,'S','H',1,'system','system_waiting.php','b_system_waiting_show','b_system_waiting_edit','system_block_waiting.html',0,1790763743),(5,1,5,'','Main Menu','Main Menu','',1,0,1,'S','H',1,'system','system_blocks.php','b_system_main_show','','system_block_mainmenu.html',0,1790763743),(6,1,6,'320|190|s_poweredby.gif|1','Site Info','Site Info','',1,0,0,'S','H',1,'system','system_blocks.php','b_system_info_show','b_system_info_edit','system_block_siteinfo.html',0,1790763743),(7,1,7,'','Who\'s Online','Who\'s Online','',9,0,1,'S','H',1,'system','system_blocks.php','b_system_online_show','','system_block_online.html',0,1790763743),(8,1,8,'10|1','Top Posters','Top Posters','',10,0,1,'S','H',1,'system','system_blocks.php','b_system_topposters_show','b_system_topposters_edit','system_block_topusers.html',0,1790763743),(9,1,9,'10|1|1','New Members','New Members','',10,0,1,'S','H',1,'system','system_blocks.php','b_system_newmembers_show','b_system_newmembers_edit','system_block_newusers.html',0,1790763743),(10,1,10,'10','Recent Comments','Recent Comments','',1,0,0,'S','H',1,'system','system_blocks.php','b_system_comments_show','b_system_comments_edit','system_block_comments.html',0,1790763743),(11,1,11,'','Notification Options','Notification Options','',1,0,0,'S','H',1,'system','system_blocks.php','b_system_notification_show','','system_block_notification.html',0,1790763743),(12,1,12,'0|80','Themes','Themes','',1,0,1,'S','H',1,'system','system_blocks.php','b_system_themes_show','b_system_themes_edit','system_block_themes.html',0,1790763743),(13,1,13,'','Language Selection','Language Selection','',1,0,0,'S','H',1,'system','system_blocks.php','b_system_multilanguage_show','','system_block_multilanguage.html',0,1790763743),(14,1,14,'1|1|1|1|1|1|1','Share this page!','Share this page!','',7,0,1,'S','H',1,'system','system_blocks.php','b_system_social_show','b_system_social_edit','system_block_socialbookmark.html',0,1790763743),(15,1,15,'','System Warnings','System Warnings','',12,0,1,'S','H',1,'system','system_admin_blocks.php','b_system_admin_warnings_show','','system_admin_block_warnings.html',0,1790763743),(16,1,16,'','Control Panel','Control Panel','',11,0,1,'S','H',1,'system','system_admin_blocks.php','b_system_admin_cp_show','','system_admin_block_cp.html',0,1790763743),(17,1,17,'','Installed Modules','Installed Modules','',13,0,1,'S','H',1,'system','system_admin_blocks.php','b_system_admin_modules_show','','system_admin_block_modules.html',0,1790763743),(18,1,18,'','My Bookmarks','My Bookmarks','',1,0,0,'S','H',1,'system','system_blocks.php','b_system_bookmarks_show','','system_block_bookmarks.html',0,1790763743),(19,1,19,'','New Control Panel','New Control Panel','',1,0,0,'S','H',1,'system','system_admin_blocks.php','b_system_admin_cp_new_show','','system_admin_block_cp_new.html',0,1790763743),(20,0,0,'','Custom Block (Auto Format + smilies)','Welcome Webmaster !','Welcome to your new ImpressCMS powered website. If you haven\'t already, please delete the [b]install[/b] folder from the server and ensure that [b]mainfile.php[/b] is not writeable (chmod 444).\n\nTo begin administering your new ImpressCMS powered website you can click the [b]Administration[/b] Menu link located on the left of this page.\n\nYou may want to begin by editing your website [b]Preferences[/b]: In the admin panel, hover over the [b]System[/b] dropdown and select [b]Preferences.[/b]\n\nAfterwards you can begin adding [b]Modules[/b] and [b]Themes[/b].\nMany of the available modules and themes for ImpressCMS, are available at the [url=https://www.impresscms.org/modules/downloads]Addons[/url] section of the [url=https://www.impresscms.org]projects website[/url].\n\nYou will also need to begin using [b]Blocks[/b]. You can begin by removing this block. You can do this by navigating to System Admin > Blocks, and the selecting \"Webmasters\" in the [b]Groups[/b] select box. You will then be able to see the blocks available for the Webmasters group, which this block is!\n\nFor more information about working with ImpressCMS, please use the links below.\n<ul><li>[url=https://www.impresscms.org/modules/simplywiki/index.php?page=English#Using_ImpressCMS]Using ImpressCMS[/url]</li><li>[url=https://www.impresscms.org/modules/simplywiki/index.php?page=English#Customizing_ImpressCMS]Customizing ImpressCMS[/url]</li><li>[url=https://www.impresscms.org/modules/simplywiki/index.php?page=English#Developing_for_ImpressCMS]Developing for ImpressCMS[/url]</li></ul>\nWe warmly invite you to join [url=https://www.impresscms.org/modules/iforum/]The ImpressCMS Community[/url] - Where you can make contributions, get help, help others, etc...',4,0,1,'C','S',1,'','','','','',0,1790763743),(21,0,0,'','Custom Block (Auto Format + smilies)','Welcome to an ImpressCMS powered website !','This is sample text for a block. If you are the administrator please log in to view more information.\n\nLearn more about ImpressCMS:\n<ul><li>[url=http://www.impresscms.org]Project Home[/url]</li><li>[url=https://www.impresscms.org/modules/iforum/]ImpressCMS Community[/url]</li><li>[url=https://www.impresscms.org/modules/downloads/index.php]ImpressCMS Addons[/url]</li><li>[url=https://www.impresscms.org/modules/simplywiki/]ImpressCMS Wiki[/url]</li><li>[url=https://www.impresscms.org/modules/news/]ImpressCMS Blog[/url]</li></ul>',4,0,1,'C','S',1,'','','','','',0,1790763743);
/*!40000 ALTER TABLE `icms_newblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_online`
--

DROP TABLE IF EXISTS `icms_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_online` (
  `online_uid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `online_uname` varchar(25) NOT NULL DEFAULT '',
  `online_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `online_module` smallint(5) unsigned NOT NULL DEFAULT 0,
  `online_ip` varchar(15) NOT NULL DEFAULT '',
  KEY `online_module` (`online_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_online`
--

LOCK TABLES `icms_online` WRITE;
/*!40000 ALTER TABLE `icms_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_priv_msgs`
--

DROP TABLE IF EXISTS `icms_priv_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_priv_msgs` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `msg_image` varchar(100) DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `from_userid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `to_userid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `msg_time` int(10) unsigned NOT NULL DEFAULT 0,
  `msg_text` text NOT NULL,
  `read_msg` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`msg_id`),
  KEY `touseridreadmsg` (`to_userid`,`read_msg`),
  KEY `msgidfromuserid` (`msg_id`,`from_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_priv_msgs`
--

LOCK TABLES `icms_priv_msgs` WRITE;
/*!40000 ALTER TABLE `icms_priv_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_priv_msgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_ranks`
--

DROP TABLE IF EXISTS `icms_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_ranks` (
  `rank_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(50) NOT NULL DEFAULT '',
  `rank_min` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `rank_max` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `rank_special` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `rank_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rank_id`),
  KEY `rank_max` (`rank_max`),
  KEY `rankminrankmaxranspecial` (`rank_min`,`rank_max`,`rank_special`),
  KEY `rankspecial` (`rank_special`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_ranks`
--

LOCK TABLES `icms_ranks` WRITE;
/*!40000 ALTER TABLE `icms_ranks` DISABLE KEYS */;
INSERT INTO `icms_ranks` VALUES (1,'Just popping in',0,20,0,'rank3e632f95e81ca.gif'),(2,'Not too shy to talk',21,40,0,'rank3dbf8e94a6f72.gif'),(3,'Quite a regular',41,70,0,'rank3dbf8e9e7d88d.gif'),(4,'Just can not stay away',71,150,0,'rank3dbf8ea81e642.gif'),(5,'Home away from home',151,10000,0,'rank3dbf8eb1a72e7.gif'),(6,'Moderator',0,0,1,'rank3dbf8edf15093.gif'),(7,'Webmaster',0,0,1,'rank3dbf8ee8681cd.gif');
/*!40000 ALTER TABLE `icms_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_session`
--

DROP TABLE IF EXISTS `icms_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_session` (
  `sess_id` varchar(32) NOT NULL DEFAULT '',
  `sess_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `sess_ip` varchar(64) NOT NULL DEFAULT '',
  `sess_data` text NOT NULL,
  PRIMARY KEY (`sess_id`),
  KEY `updated` (`sess_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_session`
--

LOCK TABLES `icms_session` WRITE;
/*!40000 ALTER TABLE `icms_session` DISABLE KEYS */;
INSERT INTO `icms_session` VALUES ('189f29a64ed812c7956683205ead4bc4',1790764349,'172.23.0.1','XOOPS_TOKEN_SESSION|a:1:{i:0;a:2:{s:2:\"id\";s:32:\"20c4dc6a2156e60c33f88c98d6d62edd\";s:6:\"expire\";i:1790765249;}}ad_sess_regen|b:0;icms_fprint|s:64:\"c00248f656cb71bb21f1c190bf2d1de8781fe93cc92ddb6f13ba3515bc6c57e3\";'),('428c931146a70ccb67597f66d861c8c2',1790764343,'172.23.0.1','ad_sess_regen|b:0;icms_fprint|s:64:\"c00248f656cb71bb21f1c190bf2d1de8781fe93cc92ddb6f13ba3515bc6c57e3\";'),('4e7cf97c79d18d9ef030d8849a4290e8',1790764339,'172.23.0.1','ad_sess_regen|b:0;icms_fprint|s:64:\"c00248f656cb71bb21f1c190bf2d1de8781fe93cc92ddb6f13ba3515bc6c57e3\";'),('e867b944600f8d8c82317d6ed3360e19',1790764377,'172.23.0.1','xoopsUserId|s:1:\"1\";xoopsUserGroups|a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}xoopsUserLastLogin|i:1790764356;UserLanguage|s:7:\"english\";ad_sess_regen|b:0;icms_fprint|s:64:\"c00248f656cb71bb21f1c190bf2d1de8781fe93cc92ddb6f13ba3515bc6c57e3\";XOOPS_TOKEN_SESSION|a:1:{i:0;a:2:{s:2:\"id\";s:32:\"83a87e49ee0111c8f443f0261bb825a9\";s:6:\"expire\";i:1790765277;}}');
/*!40000 ALTER TABLE `icms_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_smiles`
--

DROP TABLE IF EXISTS `icms_smiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_smiles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `smile_url` varchar(100) NOT NULL DEFAULT '',
  `emotion` varchar(75) NOT NULL DEFAULT '',
  `display` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_smiles`
--

LOCK TABLES `icms_smiles` WRITE;
/*!40000 ALTER TABLE `icms_smiles` DISABLE KEYS */;
INSERT INTO `icms_smiles` VALUES (1,':-D','smil3dbd4d4e4c4f2.gif','Very Happy',1),(2,':-)','smil3dbd4d6422f04.gif','Smile',1),(3,':-(','smil3dbd4d75edb5e.gif','Sad',1),(4,':-o','smil3dbd4d8676346.gif','Surprised',1),(5,':-?','smil3dbd4d99c6eaa.gif','Confused',1),(6,'8-)','smil3dbd4daabd491.gif','Cool',1),(7,':lol:','smil3dbd4dbc14f3f.gif','Laughing',1),(8,':-x','smil3dbd4dcd7b9f4.gif','Mad',1),(9,':-P','smil3dbd4ddd6835f.gif','Razz',1),(10,':oops:','smil3dbd4df1944ee.gif','Embarrassed',0),(11,':cry:','smil3dbd4e02c5440.gif','Crying (very sad)',0),(12,':evil:','smil3dbd4e1748cc9.gif','Evil or Very Mad',0),(13,':roll:','smil3dbd4e29bbcc7.gif','Rolling Eyes',0),(14,';-)','smil3dbd4e398ff7b.gif','Wink',0),(15,':pint:','smil3dbd4e4c2e742.gif','Another pint of beer',0),(16,':hammer:','smil3dbd4e5e7563a.gif','ToolTimes at work',0),(17,':idea:','smil3dbd4e7853679.gif','I have an idea',0);
/*!40000 ALTER TABLE `icms_smiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_system_adsense`
--

DROP TABLE IF EXISTS `icms_system_adsense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_system_adsense` (
  `adsenseid` int(11) NOT NULL AUTO_INCREMENT,
  `format` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `style` text NOT NULL,
  `color_border` varchar(6) NOT NULL DEFAULT '',
  `color_background` varchar(6) NOT NULL DEFAULT '',
  `color_link` varchar(6) NOT NULL DEFAULT '',
  `color_url` varchar(6) NOT NULL DEFAULT '',
  `color_text` varchar(6) NOT NULL DEFAULT '',
  `client_id` varchar(100) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '',
  `slot` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`adsenseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_system_adsense`
--

LOCK TABLES `icms_system_adsense` WRITE;
/*!40000 ALTER TABLE `icms_system_adsense` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_system_adsense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_system_autotasks`
--

DROP TABLE IF EXISTS `icms_system_autotasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_system_autotasks` (
  `sat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sat_name` varchar(255) NOT NULL,
  `sat_code` text NOT NULL,
  `sat_repeat` int(11) NOT NULL,
  `sat_interval` int(11) NOT NULL,
  `sat_onfinish` smallint(2) NOT NULL,
  `sat_enabled` int(1) NOT NULL,
  `sat_lastruntime` int(15) unsigned NOT NULL,
  `sat_type` varchar(100) NOT NULL DEFAULT 'custom',
  `sat_addon_id` int(2) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`sat_id`),
  KEY `sat_interval` (`sat_interval`),
  KEY `sat_lastruntime` (`sat_lastruntime`),
  KEY `sat_type` (`sat_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_system_autotasks`
--

LOCK TABLES `icms_system_autotasks` WRITE;
/*!40000 ALTER TABLE `icms_system_autotasks` DISABLE KEYS */;
INSERT INTO `icms_system_autotasks` VALUES (1,'Inactivating users','autotask.php',0,1440,0,1,1790763743,'addon/system',00);
/*!40000 ALTER TABLE `icms_system_autotasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_system_customtag`
--

DROP TABLE IF EXISTS `icms_system_customtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_system_customtag` (
  `customtagid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `customtag_content` text NOT NULL,
  `language` varchar(100) NOT NULL DEFAULT '',
  `customtag_type` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`customtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_system_customtag`
--

LOCK TABLES `icms_system_customtag` WRITE;
/*!40000 ALTER TABLE `icms_system_customtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_system_customtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_system_mimetype`
--

DROP TABLE IF EXISTS `icms_system_mimetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_system_mimetype` (
  `mimetypeid` int(11) NOT NULL AUTO_INCREMENT,
  `extension` varchar(60) NOT NULL DEFAULT '',
  `types` text NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `dirname` varchar(255) NOT NULL,
  KEY `mimetypeid` (`mimetypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_system_mimetype`
--

LOCK TABLES `icms_system_mimetype` WRITE;
/*!40000 ALTER TABLE `icms_system_mimetype` DISABLE KEYS */;
INSERT INTO `icms_system_mimetype` VALUES (1,'bin','application/octet-stream','Binary File/Linux Executable',''),(2,'dms','application/octet-stream','Amiga DISKMASHER Compressed Archive',''),(3,'class','application/octet-stream','Java Bytecode',''),(4,'so','application/octet-stream','UNIX Shared Library Function',''),(5,'dll','application/octet-stream','Dynamic Link Library',''),(6,'hqx','application/binhex application/mac-binhex application/mac-binhex40','Macintosh BinHex 4 Compressed Archive',''),(7,'cpt','application/mac-compactpro application/compact_pro','Compact Pro Archive',''),(8,'lha','application/lha application/x-lha application/octet-stream application/x-compress application/x-compressed application/maclha','Compressed Archive File',''),(9,'lzh','application/lzh application/x-lzh application/x-lha application/x-compress application/x-compressed application/x-lzh-archive zz-application/zz-winassoc-lzh application/maclha application/octet-stream','Compressed Archive File',''),(10,'sh','application/x-shar','UNIX shar Archive File',''),(11,'shar','application/x-shar','UNIX shar Archive File',''),(12,'tar','application/tar application/x-tar applicaton/x-gtar multipart/x-tar application/x-compress application/x-compressed','Tape Archive File',''),(13,'gtar','application/x-gtar','GNU tar Compressed File Archive',''),(14,'ustar','application/x-ustar multipart/x-ustar','POSIX tar Compressed Archive',''),(15,'zip','application/zip application/x-zip application/x-zip-compressed application/octet-stream application/x-compress application/x-compressed multipart/x-zip','Compressed Archive File',''),(16,'exe','application/exe application/x-exe application/dos-exe application/x-winexe application/msdos-windows application/x-msdos-program','Executable File',''),(17,'wmz','application/x-ms-wmz','Windows Media Compressed Skin File',''),(18,'wmd','application/x-ms-wmd','Windows Media Download File',''),(19,'doc','application/msword application/doc appl/text application/vnd.msword application/vnd.ms-word application/winword application/word application/x-msw6 application/x-msword','Word Document','system'),(20,'pdf','application/pdf application/acrobat application/x-pdf applications/vnd.pdf text/pdf','Acrobat Portable Document Format','system'),(21,'eps','application/eps application/postscript application/x-eps image/eps image/x-eps','Encapsulated PostScript',''),(22,'ps','application/postscript application/ps application/x-postscript application/x-ps text/postscript','PostScript',''),(23,'smi','application/smil','SMIL Multimedia',''),(24,'smil','application/smil','Synchronized Multimedia Integration Language',''),(25,'wmlc','application/vnd.wap.wmlc ','Compiled WML Document',''),(26,'wmlsc','application/vnd.wap.wmlscriptc','Compiled WML Script',''),(27,'vcd','application/x-cdlink','Virtual CD-ROM CD Image File',''),(28,'pgn','application/formstore','Picatinny Arsenal Electronic Formstore Form in TIFF Format',''),(29,'cpio','application/x-cpio','UNIX CPIO Archive',''),(30,'csh','application/x-csh','Csh Script',''),(31,'dcr','application/x-director','Shockwave Movie',''),(32,'dir','application/x-director','Macromedia Director Movie',''),(33,'dxr','application/x-director application/vnd.dxr','Macromedia Director Protected Movie File',''),(34,'dvi','application/x-dvi','TeX Device Independent Document',''),(35,'spl','application/x-futuresplash','Macromedia FutureSplash File',''),(36,'hdf','application/x-hdf','Hierarchical Data Format File',''),(37,'js','application/x-javascript text/javascript','JavaScript Source Code',''),(38,'skp','application/x-koan application/vnd-koan koan/x-skm application/vnd.koan','SSEYO Koan Play File',''),(39,'skd','application/x-koan application/vnd-koan koan/x-skm application/vnd.koan','SSEYO Koan Design File',''),(40,'skt','application/x-koan application/vnd-koan koan/x-skm application/vnd.koan','SSEYO Koan Template File',''),(41,'skm','application/x-koan application/vnd-koan koan/x-skm application/vnd.koan','SSEYO Koan Mix File',''),(42,'latex','application/x-latex text/x-latex','LaTeX Source Document',''),(43,'nc','application/x-netcdf text/x-cdf','Unidata netCDF Graphics',''),(44,'cdf','application/cdf application/x-cdf application/netcdf application/x-netcdf text/cdf text/x-cdf','Channel Definition Format',''),(45,'swf','application/x-shockwave-flash application/x-shockwave-flash2-preview application/futuresplash image/vnd.rn-realflash','Macromedia Flash Format File',''),(46,'sit','application/stuffit application/x-stuffit application/x-sit','StuffIt Compressed Archive File',''),(47,'tcl','application/x-tcl','TCL/TK Language Script',''),(48,'tex','application/x-tex','LaTeX Source',''),(49,'texinfo','application/x-texinfo','TeX',''),(50,'texi','application/x-texinfo','TeX',''),(51,'t','application/x-troff','TAR Tape Archive Without Compression',''),(52,'tr','application/x-troff','Unix Tape Archive = TAR without compression (tar)',''),(53,'src','application/x-wais-source','Sourcecode',''),(54,'xhtml','application/xhtml+xml','Extensible HyperText Markup Language File',''),(55,'xht','application/xhtml+xml','Extensible HyperText Markup Language File',''),(56,'au','audio/basic audio/x-basic audio/au audio/x-au audio/x-pn-au audio/rmf audio/x-rmf audio/x-ulaw audio/vnd.qcelp audio/x-gsm audio/snd','ULaw/AU Audio File',''),(57,'XM','audio/xm audio/x-xm audio/module-xm audio/mod audio/x-mod','Fast Tracker 2 Extended Module',''),(58,'snd','audio/basic','Macintosh Sound Resource',''),(59,'mid','audio/mid audio/m audio/midi audio/x-midi application/x-midi audio/soundtrack','Musical Instrument Digital Interface MIDI-sequention Sound',''),(60,'midi','audio/mid audio/m audio/midi audio/x-midi application/x-midi','Musical Instrument Digital Interface MIDI-sequention Sound',''),(61,'kar','audio/midi audio/x-midi audio/mid x-music/x-midi','Karaoke MIDI File',''),(62,'mpga','audio/mpeg audio/mp3 audio/mgp audio/m-mpeg audio/x-mp3 audio/x-mpeg audio/x-mpg video/mpeg','Mpeg-1 Layer3 Audio Stream',''),(63,'mp2','video/mpeg audio/mpeg','MPEG Audio Stream, Layer II',''),(64,'mp3','audio/mpeg audio/x-mpeg audio/mp3 audio/x-mp3 audio/mpeg3 audio/x-mpeg3 audio/mpg audio/x-mpg audio/x-mpegaudio','MPEG Audio Stream, Layer III',''),(65,'aif','audio/aiff audio/x-aiff sound/aiff audio/rmf audio/x-rmf audio/x-pn-aiff audio/x-gsm audio/x-midi audio/vnd.qcelp','Audio Interchange File',''),(66,'aiff','audio/aiff audio/x-aiff sound/aiff audio/rmf audio/x-rmf audio/x-pn-aiff audio/x-gsm audio/mid audio/x-midi audio/vnd.qcelp','Audio Interchange File',''),(67,'aifc','audio/aiff audio/x-aiff audio/x-aifc sound/aiff audio/rmf audio/x-rmf audio/x-pn-aiff audio/x-gsm audio/x-midi audio/mid audio/vnd.qcelp','Audio Interchange File',''),(68,'m3u','audio/x-mpegurl audio/mpeg-url application/x-winamp-playlist audio/scpls audio/x-scpls','MP3 Playlist File',''),(69,'ram','audio/x-pn-realaudio audio/vnd.rn-realaudio audio/x-pm-realaudio-plugin audio/x-pn-realvideo audio/x-realaudio video/x-pn-realvideo text/plain','RealMedia Metafile',''),(70,'rm','application/vnd.rn-realmedia audio/vnd.rn-realaudio audio/x-pn-realaudio audio/x-realaudio audio/x-pm-realaudio-plugin','RealMedia Streaming Media',''),(71,'rpm','audio/x-pn-realaudio audio/x-pn-realaudio-plugin audio/x-pnrealaudio-plugin video/x-pn-realvideo-plugin audio/x-mpegurl application/octet-stream','RealMedia Player Plug-in',''),(72,'ra','audio/vnd.rn-realaudio audio/x-pn-realaudio audio/x-realaudio audio/x-pm-realaudio-plugin video/x-pn-realvideo','RealMedia Streaming Media',''),(73,'wav','audio/wav audio/x-wav audio/wave audio/x-pn-wav','Waveform Audio',''),(74,'wax',' audio/x-ms-wax','Windows Media Audio Redirector',''),(75,'wma','audio/x-ms-wma video/x-ms-asf','Windows Media Audio File',''),(76,'bmp','image/bmp image/x-bmp image/x-bitmap image/x-xbitmap image/x-win-bitmap image/x-windows-bmp image/ms-bmp image/x-ms-bmp application/bmp application/x-bmp application/x-win-bitmap application/preview','Windows OS/2 Bitmap Graphics','system'),(77,'gif','image/gif image/x-xbitmap image/gi_','Graphic Interchange Format','system'),(78,'ief','image/ief','Image File - Bitmap graphics',''),(79,'jpeg','image/jpeg image/jpg image/jpe_ image/pjpeg image/vnd.swiftview-jpeg','JPEG/JIFF Image','system'),(80,'jpg','image/jpeg image/jpg image/jp_ application/jpg application/x-jpg image/pjpeg image/pipeg image/vnd.swiftview-jpeg image/x-xbitmap','JPEG/JIFF Image','system'),(81,'jpe','image/jpeg','JPEG/JIFF Image','system'),(82,'png','image/png application/png application/x-png','Portable (Public) Network Graphic','system'),(83,'tiff','image/tiff','Tagged Image Format File','system'),(84,'tif','image/tif image/x-tif image/tiff image/x-tiff application/tif application/x-tif application/tiff application/x-tiff','Tagged Image Format File','system'),(85,'ico','image/ico image/x-icon application/ico application/x-ico application/x-win-bitmap image/x-win-bitmap application/octet-stream','Windows Icon',''),(86,'wbmp','image/vnd.wap.wbmp','Wireless Bitmap File Format',''),(87,'ras','application/ras application/x-ras image/ras','Sun Raster Graphic',''),(88,'pnm','image/x-portable-anymap','PBM Portable Any Map Graphic Bitmap',''),(89,'pbm','image/portable bitmap image/x-portable-bitmap image/pbm image/x-pbm','UNIX Portable Bitmap Graphic',''),(90,'pgm','image/x-portable-graymap image/x-pgm','Portable Graymap Graphic',''),(91,'ppm','image/x-portable-pixmap application/ppm application/x-ppm image/x-p image/x-ppm','PBM Portable Pixelmap Graphic',''),(92,'rgb','image/rgb image/x-rgb','Silicon Graphics RGB Bitmap',''),(93,'xbm','image/x-xpixmap image/x-xbitmap image/xpm image/x-xpm','X Bitmap Graphic',''),(94,'xpm','image/x-xpixmap','BMC Software Patrol UNIX Icon File',''),(95,'xwd','image/x-xwindowdump image/xwd image/x-xwd application/xwd application/x-xwd','X Windows Dump',''),(96,'igs','model/iges application/iges application/x-iges application/igs application/x-igs drawing/x-igs image/x-igs','Initial Graphics Exchange Specification Format',''),(97,'css','application/css-stylesheet text/css','Hypertext Cascading Style Sheet',''),(98,'html','text/html text/plain','Hypertext Markup Language',''),(99,'htm','text/html','Hypertext Markup Language',''),(100,'txt','text/plain application/txt browser/internal','Text File','system'),(101,'rtf','application/rtf application/x-rtf text/rtf text/richtext application/msword application/doc application/x-soffice','Rich Text Format File','system'),(102,'wml','text/vnd.wap.wml text/wml','Website META Language File',''),(103,'wmls','text/vnd.wap.wmlscript','WML Script',''),(104,'etx','text/x-setext','SetText Structure Enhanced Text',''),(105,'xml','text/xml application/xml application/x-xml','Extensible Markup Language File',''),(106,'xsl','text/xml','XML Stylesheet',''),(107,'php','text/php application/x-httpd-php application/php magnus-internal/shellcgi application/x-php','PHP Script',''),(108,'php3','text/php3 application/x-httpd-php','PHP Script',''),(109,'mpeg','video/mpeg','MPEG Movie',''),(110,'mpg','video/mpeg video/mpg video/x-mpg video/mpeg2 application/x-pn-mpg video/x-mpeg video/x-mpeg2a audio/mpeg audio/x-mpeg image/mpg','MPEG 1 System Stream',''),(111,'mpe','video/mpeg','MPEG Movie Clip',''),(112,'qt','video/quicktime audio/aiff audio/x-wav video/flc','QuickTime Movie',''),(113,'mov','video/quicktime video/x-quicktime image/mov audio/aiff audio/x-midi audio/x-wav video/avi','QuickTime Video Clip',''),(114,'avi','video/avi video/msvideo video/x-msvideo image/avi video/xmpg2 application/x-troff-msvideo audio/aiff audio/avi','Audio Video Interleave File',''),(115,'movie','video/sgi-movie video/x-sgi-movie','QuickTime Movie',''),(116,'asf','audio/asf application/asx video/x-ms-asf-plugin application/x-mplayer2 video/x-ms-asf application/vnd.ms-asf video/x-ms-asf-plugin video/x-ms-wm video/x-ms-wmx','Advanced Streaming Format',''),(117,'asx','video/asx application/asx video/x-ms-asf-plugin application/x-mplayer2 video/x-ms-asf application/vnd.ms-asf video/x-ms-asf-plugin video/x-ms-wm video/x-ms-wmx video/x-la-asf','Advanced Stream Redirector File',''),(118,'wmv','video/x-ms-wmv','Windows Media File',''),(119,'wvx','video/x-ms-wvx','Windows Media Redirector',''),(120,'wm','video/x-ms-wm','Windows Media A/V File',''),(121,'wmx','video/x-ms-wmx','Windows Media Player A/V Shortcut',''),(122,'ice','x-conference-xcooltalk','Cooltalk Audio',''),(123,'rar','application/octet-stream','WinRAR Compressed Archive','');
/*!40000 ALTER TABLE `icms_system_mimetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_system_rating`
--

DROP TABLE IF EXISTS `icms_system_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_system_rating` (
  `ratingid` int(11) NOT NULL AUTO_INCREMENT,
  `dirname` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `itemid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `rate` int(1) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`ratingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_system_rating`
--

LOCK TABLES `icms_system_rating` WRITE;
/*!40000 ALTER TABLE `icms_system_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_system_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_tplfile`
--

DROP TABLE IF EXISTS `icms_tplfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_tplfile` (
  `tpl_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_refid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `tpl_module` varchar(25) NOT NULL DEFAULT '',
  `tpl_tplset` varchar(50) NOT NULL DEFAULT '',
  `tpl_file` varchar(50) NOT NULL DEFAULT '',
  `tpl_desc` varchar(255) NOT NULL DEFAULT '',
  `tpl_lastmodified` int(10) unsigned NOT NULL DEFAULT 0,
  `tpl_lastimported` int(10) unsigned NOT NULL DEFAULT 0,
  `tpl_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`tpl_id`),
  KEY `tpl_refid` (`tpl_refid`,`tpl_type`),
  KEY `tpl_tplset` (`tpl_tplset`,`tpl_file`(10))
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_tplfile`
--

LOCK TABLES `icms_tplfile` WRITE;
/*!40000 ALTER TABLE `icms_tplfile` DISABLE KEYS */;
INSERT INTO `icms_tplfile` VALUES (1,1,'system','default','system_userinfo.html','',1790763743,1790763743,'module'),(2,1,'system','default','system_userform.html','',1790763743,1790763743,'module'),(3,1,'system','default','system_rss.html','',1790763743,1790763743,'module'),(4,1,'system','default','system_comment.html','',1790763743,1790763743,'module'),(5,1,'system','default','system_comments_flat.html','',1790763743,1790763743,'module'),(6,1,'system','default','system_comments_thread.html','',1790763743,1790763743,'module'),(7,1,'system','default','system_comments_nest.html','',1790763743,1790763743,'module'),(8,1,'system','default','system_siteclosed.html','',1790763743,1790763743,'module'),(9,1,'system','default','system_redirect.html','',1790763743,1790763743,'module'),(10,1,'system','default','system_dummy.html','',1790763743,1790763743,'module'),(11,1,'system','default','system_notification_list.html','',1790763743,1790763743,'module'),(12,1,'system','default','system_notification_select.html','',1790763743,1790763743,'module'),(13,1,'system','default','system_block_dummy.html','',1790763743,1790763743,'module'),(14,1,'system','default','system_privpolicy.html','',1790763743,1790763743,'module'),(15,1,'system','default','system_error.html','',1790763743,1790763743,'module'),(16,1,'system','default','system_adm_blockspadmin.html','',1790763743,1790763743,'module'),(17,1,'system','default','system_adm_pagemanager_index.html','',1790763743,1790763743,'module'),(18,1,'system','default','system_adm_blocksadmin.html','',1790763743,1790763743,'module'),(19,1,'system','default','system_adm_modulesadmin.html','',1790763743,1790763743,'module'),(20,1,'system','default','system_common_form.html','',1790763743,1790763743,'module'),(21,1,'system','default','system_persistabletable_display.html','',1790763743,1790763743,'module'),(22,1,'system','default','system_adm_customtag.html','',1790763743,1790763743,'module'),(23,1,'system','default','system_default_form.html','',1790763743,1790763743,'module'),(24,1,'system','default','system_adm_imagemanager.html','',1790763743,1790763743,'module'),(25,1,'system','default','system_adm_imagemanager_imglist.html','',1790763743,1790763743,'module'),(26,1,'system','default','system_adm_imagemanager_img.html','',1790763743,1790763743,'module'),(27,1,'system','default','system_adm_imagemanager_editimg.html','',1790763743,1790763743,'module'),(28,1,'system','default','system_adm_imagemanager_cloneimg.html','',1790763743,1790763743,'module'),(29,1,'system','default','system_adm_rss.html','',1790763743,1790763743,'module'),(30,1,'system','default','system_search.html','',1790763743,1790763743,'module'),(31,1,'system','default','system_persistable_singleview.html','',1790763743,1790763743,'module'),(32,1,'system','default','system_breadcrumb.html','',1790763743,1790763743,'module'),(33,1,'system','default','system_adm_adsense.html','',1790763743,1790763743,'module'),(34,1,'system','default','system_print.html','',1790763743,1790763743,'module'),(35,1,'system','default','system_adm_rating.html','',1790763743,1790763743,'module'),(36,1,'system','default','system_adm_modulemenu.html','',1790763743,1790763743,'module'),(37,1,'system','default','system_rating_form.html','',1790763743,1790763743,'module'),(38,1,'system','default','system_adm_mimetype.html','',1790763743,1790763743,'module'),(39,1,'system','default','system_adm_userrank.html','',1790763743,1790763743,'module'),(40,1,'system','default','system_adm_version.html','Version information template',1790763743,1790763743,'module'),(41,1,'system','default','system_adm_autotasks.html','',1790763743,1790763743,'module'),(42,1,'system','default','system_adm_moduleabout.html','',1790763743,1790763743,'module'),(43,1,'system','default','system_popup_imagemanager_cloneimg.html','',1790763743,1790763743,'module'),(44,1,'system','default','system_popup_imagemanager_editimg.html','',1790763743,1790763743,'module'),(45,1,'system','default','system_popup_imagemanager_img.html','',1790763743,1790763743,'module'),(46,1,'system','default','system_popup_imagemanager_imglist.html','',1790763743,1790763743,'module'),(47,1,'system','default','system_popup_imagemanager.html','',1790763743,1790763743,'module'),(48,1,'system','default','icms_form_elements_button_display.html','Display template for a button',1790763743,1790763743,'module'),(49,1,'system','default','icms_form_elements_checkbox_display.html','Display template for a checkbox',1790763743,1790763743,'module'),(50,1,'system','default','icms_form_elements_text_display.html','Display template for a text',1790763743,1790763743,'module'),(51,1,'system','default','icms_form_elements_password_display.html','Display template for a password field',1790763743,1790763743,'module'),(52,1,'system','default','icms_form_elements_passwordtray_display.html','Display template for a passwordtray',1790763743,1790763743,'module'),(53,1,'system','default','system_block_user.html','',1790763743,1790763743,'block'),(54,2,'system','default','system_block_login.html','',1790763743,1790763743,'block'),(55,3,'system','default','system_block_search.html','',1790763743,1790763743,'block'),(56,4,'system','default','system_block_waiting.html','',1790763743,1790763743,'block'),(57,5,'system','default','system_block_mainmenu.html','',1790763743,1790763743,'block'),(58,6,'system','default','system_block_siteinfo.html','',1790763743,1790763743,'block'),(59,7,'system','default','system_block_online.html','',1790763743,1790763743,'block'),(60,8,'system','default','system_block_topusers.html','',1790763743,1790763743,'block'),(61,9,'system','default','system_block_newusers.html','',1790763743,1790763743,'block'),(62,10,'system','default','system_block_comments.html','',1790763743,1790763743,'block'),(63,11,'system','default','system_block_notification.html','',1790763743,1790763743,'block'),(64,12,'system','default','system_block_themes.html','',1790763743,1790763743,'block'),(65,13,'system','default','system_block_multilanguage.html','',1790763743,1790763743,'block'),(66,14,'system','default','system_block_socialbookmark.html','',1790763743,1790763743,'block'),(67,15,'system','default','system_admin_block_warnings.html','',1790763743,1790763743,'block'),(68,16,'system','default','system_admin_block_cp.html','',1790763743,1790763743,'block'),(69,17,'system','default','system_admin_block_modules.html','',1790763743,1790763743,'block'),(70,18,'system','default','system_block_bookmarks.html','Things I have bookmarked',1790763743,1790763743,'block'),(71,19,'system','default','system_admin_block_cp_new.html','',1790763743,1790763743,'block');
/*!40000 ALTER TABLE `icms_tplfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_tplset`
--

DROP TABLE IF EXISTS `icms_tplset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_tplset` (
  `tplset_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `tplset_name` varchar(50) NOT NULL DEFAULT '',
  `tplset_desc` varchar(255) NOT NULL DEFAULT '',
  `tplset_credits` text NOT NULL,
  `tplset_created` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`tplset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_tplset`
--

LOCK TABLES `icms_tplset` WRITE;
/*!40000 ALTER TABLE `icms_tplset` DISABLE KEYS */;
INSERT INTO `icms_tplset` VALUES (1,'default','ImpressCMS Default Template Set','',1790763743);
/*!40000 ALTER TABLE `icms_tplset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_tplsource`
--

DROP TABLE IF EXISTS `icms_tplsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_tplsource` (
  `tpl_id` mediumint(7) unsigned NOT NULL DEFAULT 0,
  `tpl_source` mediumtext NOT NULL,
  KEY `tpl_id` (`tpl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_tplsource`
--

LOCK TABLES `icms_tplsource` WRITE;
/*!40000 ALTER TABLE `icms_tplsource` DISABLE KEYS */;
INSERT INTO `icms_tplsource` VALUES (1,'<{if $user_ownpage == true}>\n\n<form id=\"usernav\" action=\"user.php\" method=\"post\">\n\n<table width=\"70%\" style=\"margin: 0 auto;\" border=\"0\">\n  <tr align=\"center\">\n    <td><input type=\"button\" value=\"<{$lang_editprofile}>\" onclick=\"location=\'edituser.php\'\" />\n    <input type=\"button\" value=\"<{$lang_avatar}>\" onclick=\"location=\'edituser.php?op=avatarform\'\" />\n    <input type=\"button\" value=\"<{$lang_notifications}>\" onclick=\"location=\'notifications.php\'\" />\n    <input type=\"button\" value=\"<{$lang_inbox}><{xoInboxCount assign=pmcount}><{if $pmcount}> (<{$pmcount}>) <{/if}>\" onclick=\"location=\'viewpmsg.php\'\" />\n\n    <{if $user_candelete == true}>\n    <input type=\"button\" value=\"<{$lang_deleteaccount}>\" onclick=\"location=\'user.php?op=delete\'\" />\n    <{/if}>\n\n    <input type=\"button\" value=\"<{$lang_logout}>\" onclick=\"location=\'user.php?op=logout\'\" /></td>\n  </tr>\n</table>\n</form>\n\n<{elseif $xoops_isadmin != false}>\n\n\n<table width=\"70%\" style=\"margin: 0 auto;\" border=\"0\">\n  <tr align=\"center\">\n    <td><input type=\"button\" value=\"<{$lang_editprofile}>\" onclick=\"location=\'<{$xoops_url}>/modules/system/admin.php?fct=users&uid=<{$user_uid}>&op=modifyUser\'\" />\n    <input type=\"button\" value=\"<{$lang_deleteaccount}>\" onclick=\"location=\'<{$xoops_url}>/modules/system/admin.php?fct=users&op=delUser&uid=<{$user_uid}>\'\" />\n    </td>\n  </tr>\n</table>\n\n<{/if}>\n\n<table width=\"100%\" border=\"0\" cellspacing=\"5px\">\n  <tr valign=\"top\">\n    <td style=\"width: 50%;\">\n      <table class=\"outer\" cellpadding=\"4px\" cellspacing=\"1px\" width=\"100%\">\n        <tr>\n          <th colspan=\"2\" align=\"center\"><{$lang_allaboutuser}></th>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_avatar}></td>\n          <td align=\"center\" class=\"even\"><img src=\"<{$user_avatarurl}>\" alt=\"Avatar\" /></td>\n        </tr>\n        <tr>\n          <td class=\"head\"><{$lang_realname}></td>\n          <td align=\"center\" class=\"odd\"><{$user_realname}></td>\n        </tr>\n        <tr>\n          <td class=\"head\"><{$lang_website}></td>\n          <td class=\"even\"><{$user_websiteurl}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_email}></td>\n          <td class=\"odd\"><{$user_email}></td>\n        </tr>\n	<tr valign=\"top\">\n          <td class=\"head\"><{$lang_privmsg}></td>\n          <td class=\"even\"><{$user_pmlink}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_icq}></td>\n          <td class=\"odd\"><{$user_icq}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_aim}></td>\n          <td class=\"even\"><{$user_aim}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_yim}></td>\n          <td class=\"odd\"><{$user_yim}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_msnm}></td>\n          <td class=\"even\"><{$user_msnm}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_location}></td>\n          <td class=\"odd\"><{$user_location}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_occupation}></td>\n          <td class=\"even\"><{$user_occupation}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_interest}></td>\n          <td class=\"odd\"><{$user_interest}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_extrainfo}></td>\n          <td class=\"even\"><{$user_extrainfo}></td>\n        </tr>\n      </table>\n    </td>\n    <td style=\"width: 50%;\">\n      <table class=\"outer\" cellpadding=\"4px\" cellspacing=\"1px\" width=\"100%\">\n        <tr valign=\"top\">\n          <th colspan=\"2\" align=\"center\"><{$lang_statistics}></th>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_membersince}></td>\n          <td align=\"center\" class=\"even\"><{$user_joindate}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_rank}></td>\n          <td align=\"center\" class=\"odd\"><{if $user_rankimage}><{$user_rankimage}><br /><{/if}><{$user_ranktitle}></td>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"head\"><{$lang_posts}></td>\n          <td align=\"center\" class=\"even\"><{$user_posts}></td>\n        </tr>\n	<tr valign=\"top\">\n          <td class=\"head\"><{$lang_lastlogin}></td>\n          <td align=\"center\" class=\"odd\"><{$user_lastlogin}></td>\n        </tr>\n      </table>\n      <br />\n    <{if $user_showsignature == true}>\n      <table class=\"outer\" cellpadding=\"4px\" cellspacing=\"1px\" width=\"100%\">\n        <tr valign=\"top\">\n          <th colspan=\"2\" align=\"center\"><{$lang_signature}></th>\n        </tr>\n        <tr valign=\"top\">\n          <td class=\"even\"><{$user_signature}></td>\n        </tr>\n      </table>\n    <{/if}>\n    </td>\n  </tr>\n</table>\n\n<!-- start module search results loop -->\n<{foreach item=module from=$modules}>\n\n<h4><{$module.name}></h4>\n<p>\n  <!-- start results item loop -->\n  <{foreach item=result from=$module.results}>\n\n  <img src=\"<{$result.image}>\" alt=\"<{$module.name}>\" /><b><a href=\"<{$result.link}>\" title=\"<{$result.title}>\"><{$result.title}></a></b><br /><small>(<{$result.time}>)</small><br />\n\n  <{/foreach}>\n  <!-- end results item loop -->\n\n<{$module.showall_link}>\n</p>\n\n<{/foreach}>\n<!-- end module search results loop -->\n'),(2,'<{if $lang_reset !== 1}>\n<div style=\"position: relative;\">\n	<div>\n		<fieldset style=\"padding: 10px;\">\n			<legend style=\"font-weight: bold;\"><{$lang_login}></legend>\n<div id=\"icms_block_login_form\">\n			<form action=\"user.php\" method=\"post\">\n		    	<div><{$lang_username}><input type=\"text\" class=\"uname\" name=\"uname\" size=\"21\" maxlength=\"25\" value=\"<{$usercookie}>\" />\n		    	<br />\n			    <br /></div>\n		    	<div><{$lang_password}><input type=\"password\" name=\"pass\" size=\"21\" maxlength=\"32\" /><br /></div>\n			    <{if $rememberme }>\n			    	<div><input type=\"checkbox\" name=\"rememberme\" value=\"On\" /><{$lang_rememberme}><br /></div>\n			    <{/if}>\n			    <div><input type=\"hidden\" name=\"op\" value=\"login\" /></div>\n		    	<div><input type=\"hidden\" name=\"xoops_redirect\" value=\"<{$icms_requesturi}>\"/>\n			    <br />\n		    	<input type=\"submit\" value=\"<{$lang_login}>\" /></div>\n			</form>\n</div>\n			<a name=\"lost\"></a>\n			<{if $allow_registration }>\n				<div style=\"text-align: <{$smarty.const._GLOBAL_RIGHT}>;\"><{$lang_notregister}><br /></div>\n			<{/if}>\n		</fieldset>\n	</div>\n\n	<div>\n		<fieldset style=\"padding: 10px;\">\n			<legend style=\"font-weight: bold;\"><{$lang_lostpassword}></legend>\n			<div>\n				<{$lang_noproblem}>\n			</div>\n			<form action=\"lostpass.php\" method=\"post\">\n				<div><br /><{$lang_youremail}> <input type=\"text\" name=\"email\" size=\"26\" maxlength=\"60\" />&nbsp;&nbsp;<input type=\"hidden\" name=\"op\" value=\"mailpasswd\" /><input type=\"hidden\" name=\"t\" value=\"<{$mailpasswd_token}>\" />\n		    	<br />\n		    	<br />\n		     	<input type=\"submit\" value=\"<{$lang_sendpassword}>\" /></div>\n			</form>\n		</fieldset>\n	</div>\n</div>\n<{else}>\n<div style=\"position: relative;height: 250px;\">\n	<div style=\"float: <{$smarty.const._GLOBAL_LEFT}>; width: 80% \">\n		<fieldset style=\"padding: 10px;\">\n			<legend style=\"font-weight: bold;\"><{$smarty.const._US_RESETPASSWORD}></legend>\n			<h1><{$smarty.const._US_RESETPASSTITLE}></h1>\n			<div><{$smarty.const._US_RESETPASSINFO}></div>\n			<br />\n			<form action=\"resetpass.php\" method=\"post\">\n				<{$lang_currentpass}> <input type=\"password\" name=\"c_password\" size=\"26\" maxlength=\"255\" /><br />\n				<{$lang_newpass}> <input type=\"password\" name=\"password\" size=\"26\" maxlength=\"32\" /><br />\n				<{$lang_newpass2}> <input type=\"password\" name=\"password2\" size=\"26\" maxlength=\"32\" />&nbsp;&nbsp;<input type=\"hidden\" name=\"op\" value=\"resetpass\" /><input type=\"hidden\" name=\"t\" value=\"<{$resetpassword_token}>\" />\n		    	<br />\n		    	<br />\n		     	<input type=\"submit\" value=\"<{$smarty.const._US_RESETPASSWORD}>\" />\n			</form>\n		</fieldset>\n	</div>\n</div>\n<{/if}>\n'),(3,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<rss version=\"2.0\">\r\n  <channel>\r\n    <title><{$channel_title}></title>\r\n    <link><{$channel_link}></link>\r\n    <description><{$channel_desc}></description>\r\n	<copyright><{$channel_copyright}></copyright>\r\n    <lastBuildDate><{$channel_lastbuild}></lastBuildDate>\r\n    <docs>http://backend.userland.com/rss/</docs>\r\n    <generator><{$channel_generator}></generator>\r\n    <category><{$channel_category}></category>\r\n    <managingEditor><{$channel_editor}></managingEditor>\r\n    <webMaster><{$channel_webmaster}></webMaster>\r\n	<ttl><{$channel_ttl}></ttl>\r\n    <language><{$channel_language}></language>\r\n    <{if $image_url != \"\"}>\r\n    <image>\r\n      <title><{$channel_title}></title>\r\n      <url><{$image_url}></url>\r\n      <link><{$channel_link}></link>\r\n      <width><{$channel_width}></width>\r\n      <height><{$channel_height}></height>\r\n    </image>\r\n    <{/if}>\r\n    <{foreach item=item from=$items}>\r\n    <item>\r\n      <title><{$item.title}></title>\r\n      <link><{$item.link}></link>\r\n      <description><{$item.description}></description>\r\n      <pubDate><{$item.pubdate}></pubDate>\r\n      <guid><{$item.guid}></guid>\r\n	  <category><{$item.category}></category>\r\n	  <author><{$item.author}></author>\r\n    </item>\r\n    <{/foreach}>\r\n  </channel>\r\n</rss>'),(4,'<!-- start comment post -->\r\n        <tr>\r\n          <td class=\"head\"><a id=\"comment<{$comment.id}>\"></a> <{$comment.poster.uname}></td>\r\n          <td class=\"head\"><div class=\"comDate\"><span class=\"comDateCaption\"><{$lang_posted}>:</span> <{$comment.date_posted}>&nbsp;&nbsp;<span class=\"comDateCaption\"><{$lang_updated}>:</span> <{$comment.date_modified}></div></td>\r\n        </tr>\r\n        <tr>\r\n\r\n          <{if $comment.poster.id != 0}>\r\n\r\n          <td class=\"odd\"><div class=\"comUserRank\"><div class=\"comUserRankText\"><{$comment.poster.rank_title}></div><img class=\"comUserRankImg\" src=\"<{$comment.poster.rank_image}>\" alt=\"\" /></div><img class=\"comUserImg\" src=\"<{$comment.poster.avatar}>\" alt=\"\" /><div class=\"comUserStat\"><span class=\"comUserStatCaption\"><{$lang_joined}>:</span> <{$comment.poster.regdate}></div><div class=\"comUserStat\"><span class=\"comUserStatCaption\"><{$lang_from}>:</span> <{$comment.poster.from}></div><div class=\"comUserStat\"><span class=\"comUserStatCaption\"><{$lang_posts}>:</span> <{$comment.poster.postnum}></div><div class=\"comUserStatus\"><{$comment.poster.status}></div></td>\r\n\r\n          <{else}>\r\n\r\n          <td class=\"odd\"> </td>\r\n\r\n          <{/if}>\r\n\r\n          <td class=\"odd\">\r\n            <div class=\"comTitle\"><{$comment.image}><{$comment.title}></div><div class=\"comText\"><{$comment.text}></div>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"even\"></td>\r\n\r\n          <{if $xoops_iscommentadmin == true}>\r\n\r\n          <td class=\"even\" align=\"<{$smarty.const._GLOBAL_RIGHT}>\">\r\n            <a href=\"<{$editcomment_link}>&amp;com_id=<{$comment.id}>\" title=\"<{$lang_edit}>\"><img src=\"<{$xoops_url}>/images/icons/<{$icms_langname}>/edit.gif\" alt=\"<{$lang_edit}>\" /></a><a href=\"<{$deletecomment_link}>&amp;com_id=<{$comment.id}>\" title=\"<{$lang_delete}>\"><img src=\"<{$xoops_url}>/images/icons/<{$icms_langname}>/delete.gif\" alt=\"<{$lang_delete}>\" /></a><a href=\"<{$replycomment_link}>&amp;com_id=<{$comment.id}>\" title=\"<{$lang_reply}>\"><img src=\"<{$xoops_url}>/images/icons/<{$icms_langname}>/reply.gif\" alt=\"<{$lang_reply}>\" /></a>\r\n          </td>\r\n\r\n          <{elseif $xoops_isuser == true && $xoops_userid == $comment.poster.id}>\r\n\r\n          <td class=\"even\" align=\"<{$smarty.const._GLOBAL_RIGHT}>\">\r\n            <a href=\"<{$editcomment_link}>&amp;com_id=<{$comment.id}>\" title=\"<{$lang_edit}>\"><img src=\"<{$xoops_url}>/images/icons/<{$icms_langname}>/edit.gif\" alt=\"<{$lang_edit}>\" /></a><a href=\"<{$replycomment_link}>&amp;com_id=<{$comment.id}>\" title=\"<{$lang_reply}>\"><img src=\"<{$xoops_url}>/images/icons/<{$icms_langname}>/reply.gif\" alt=\"<{$lang_reply}>\" /></a>\r\n          </td>\r\n\r\n          <{elseif $xoops_isuser == true || $anon_canpost == true}>\r\n\r\n          <td class=\"even\" align=\"<{$smarty.const._GLOBAL_RIGHT}>\">\r\n            <a href=\"<{$replycomment_link}>&amp;com_id=<{$comment.id}>\" title=\"<{$lang_reply}>\"><img src=\"<{$xoops_url}>/images/icons/<{$icms_langname}>/reply.gif\" alt=\"<{$lang_reply}>\" /></a>\r\n          </td>\r\n\r\n          <{else}>\r\n\r\n          <td class=\"even\"> </td>\r\n\r\n          <{/if}>\r\n\r\n        </tr>\r\n<!-- end comment post -->'),(5,'<table class=\"outer\" cellpadding=\"5px\" cellspacing=\"1px\">\r\n  <tr>\r\n    <th width=\"20%\"><{$lang_poster}></th>\r\n    <th><{$lang_thread}></th>\r\n  </tr>\r\n  <{foreach item=comment from=$comments}>\r\n    <{include file=\"db:system_comment.html\" comment=$comment}>\r\n  <{/foreach}>\r\n</table>'),(6,'<{section name=i loop=$comments}>\r\n<br />\r\n<table cellspacing=\"1px\" class=\"outer\">\r\n  <tr>\r\n    <th width=\"20%\"><{$lang_poster}></th>\r\n    <th><{$lang_thread}></th>\r\n  </tr>\r\n  <{include file=\"db:system_comment.html\" comment=$comments[i]}>\r\n</table>\r\n\r\n<{if $show_threadnav == true}>\r\n<div style=\"text-align:<{$smarty.const._GLOBAL_LEFT}>; margin:3px; padding: 5px;\">\r\n<a href=\"<{$comment_url}>\" title=\"<{$lang_top}>\"><{$lang_top}></a> | <a href=\"<{$comment_url}>&amp;com_id=<{$comments[i].pid}>&amp;com_rootid=<{$comments[i].rootid}>#newscomment<{$comments[i].pid}>\" title=\"<{$lang_parent}>\"><{$lang_parent}></a>\r\n</div>\r\n<{/if}>\r\n\r\n<{if $comments[i].show_replies == true}>\r\n<!-- start comment tree -->\r\n<br />\r\n<table cellspacing=\"1px\" class=\"outer\">\r\n  <tr>\r\n    <th width=\"50%\"><{$lang_subject}></th>\r\n    <th width=\"20%\" align=\"center\"><{$lang_poster}></th>\r\n    <th align=\"<{$smarty.const._GLOBAL_RIGHT}>\"><{$lang_posted}></th>\r\n  </tr>\r\n  <{foreach item=reply from=$comments[i].replies}>\r\n  <tr>\r\n    <td class=\"even\"><{$reply.prefix}> <a href=\"<{$comment_url}>&amp;com_id=<{$reply.id}>&amp;com_rootid=<{$reply.root_id}>\" title=\"<{$reply.simple_title}>\"><{$reply.title}></a></td>\r\n    <td class=\"odd\" align=\"center\"><{$reply.poster.uname}></td>\r\n    <td class=\"even\" align=\"<{$smarty.const._GLOBAL_RIGHT}>\"><{$reply.date_posted}></td>\r\n  </tr>\r\n  <{/foreach}>\r\n</table>\r\n<!-- end comment tree -->\r\n<{/if}>\r\n\r\n<{/section}>'),(7,'<{section name=i loop=$comments}>\r\n<br />\r\n<table cellspacing=\"1px\" class=\"outer\">\r\n  <tr>\r\n    <th width=\"20%\"><{$lang_poster}></th>\r\n    <th><{$lang_thread}></th>\r\n  </tr>\r\n  <{include file=\"db:system_comment.html\" comment=$comments[i]}>\r\n</table>\r\n\r\n<!-- start comment replies -->\r\n<{foreach item=reply from=$comments[i].replies}>\r\n<br />\r\n<table cellspacing=\"0\" border=\"0\">\r\n  <tr>\r\n    <td width=\"<{$reply.prefix}>\"></td>\r\n    <td>\r\n      <table class=\"outer\" cellspacing=\"1px\">\r\n        <tr>\r\n          <th width=\"20%\"><{$lang_poster}></th>\r\n          <th><{$lang_thread}></th>\r\n        </tr>\r\n        <{include file=\"db:system_comment.html\" comment=$reply}>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n<{/foreach}>\r\n<!-- end comment tree -->\r\n<{/section}>'),(8,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"<{$xoops_langcode}>\" lang=\"<{$xoops_langcode}>\">\r\n<head>\r\n<meta http-equiv=\"content-type\" content=\"text/html; charset=<{$xoops_charset}>\" />\r\n<meta http-equiv=\"content-language\" content=\"<{$xoops_langcode}>\" />\r\n<title><{$xoops_sitename}></title>\r\n<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"<{$icms_style}>\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"<{$icms_themecss}>\" />\r\n\r\n</head>\r\n<body>\r\n<div id=\"xo-canvas\"<{if $columns_layout}> class=\"<{$columns_layout}>\"<{/if}>>\r\n  <!-- Start header -->\r\n    <div id=\"xo-header\">\r\n	    <div id=\"xo-headerlogo\"></div>\r\n    </div>  \r\n  <!-- End header -->\r\n  \r\n<!-- Start Main Content Area -->\r\n<div id=\"xo-canvas-content\">\r\n<center>\r\n<br />\r\n<div style=\"width: 85%;background-color: #f7e6bd; color: #222222; text-align: center; border-top: 1px solid #DDDDFF; border-left: 1px solid #DDDDFF; border-right: 1px solid #DDDDFF; border-bottom: 1px solid #DDDDFF; font-weight: bold; padding: 10px;\"><{$lang_siteclosemsg}>\r\n</div>\r\n<br />\r\n  <br />\r\n  <br />\r\n    <div style=\"width: 270px;border:1px solid #DDDDFF\">\r\n <div style=\"background-color: #f3ac03;font-weight: bold;font-size: 1.2em; color: white;height: 24px\"><{$lang_login}></div>\r\n    <br />\r\n   <form action=\"<{$xoops_url}>/user.php\" method=\"post\">\r\n   <{$lang_username}><input type=\"text\" name=\"uname\" size=\"21\" maxlength=\"25\" value=\"\" /><br />\r\n    <div>\r\n    <{$lang_password}><input type=\"password\" name=\"pass\" size=\"21\" maxlength=\"32\" /><br />\r\n        	<input type=\"hidden\" name=\"xoops_redirect\" value=\"<{$xoops_requesturi}>\" />\r\n        	<input type=\"hidden\" name=\"xoops_login\" value=\"1\" />\r\n        <br />\r\n        	<input type=\"submit\" value=\"<{$lang_login}>\" />\r\n</div> \r\n </form>\r\n<br />\r\n</div>\r\n</center>\r\n</div><!-- Start footer -->\r\n<br class=\"clear\" />\r\n<div id=\"xo-footer-close\">\r\n</div>\r\n<!-- end Footer -->\r\n</div>\r\n  </body>\r\n</html>'),(9,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"<{$xoops_langcode}>\" lang=\"<{$xoops_langcode}>\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=<{$xoops_charset}>\" />\r\n<meta http-equiv=\"Refresh\" content=\"<{$time}>; url=<{$url}>\" />\r\n<title><{$xoops_sitename}></title>\r\n<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"<{$icms_themecss}>\" />\r\n</head>\r\n<body>\r\n<div style=\"text-align:center; background-color: #EBEBEB; border-top: 1px solid #FFFFFF; border-left: 1px solid #FFFFFF; border-right: 1px solid #AAAAAA; border-bottom: 1px solid #AAAAAA; font-weight: bold;\">\r\n  <h4><{$message}></h4>\r\n  <p><{$lang_ifnotreload}></p>\r\n</div>\r\n<div id=\"icms-footer\">\r\n		<{$xoops_footer}>\r\n</div>\r\n<{if $xoops_logdump != \'\'}><div><{$xoops_logdump}></div><{/if}>\r\n</body>\r\n</html>\r\n'),(10,'<{$dummy_content}>'),(11,'<h4><{$lang_activenotifications}></h4>\r\n\r\n<p><a href=\"<{$icms_url}>/userinfo.php?uid=<{$user.uid}>\" title=\"<{$user.name}>\"><{$smarty.const._PROFILE}></a>&nbsp;<span style=\"font-weight:bold;\">&raquo;&raquo;</span>&nbsp;<{$smarty.const._MB_SYSTEM_NOTIF}> </p>\r\n<form id=\"notificationlist\" action=\"notifications.php\" method=\"post\">\r\n<table class=\"outer\">\r\n  <tr>\r\n	<th><input name=\"allbox\" id=\"allbox\" onclick=\"xoopsCheckAll(\'notificationlist\', \'allbox\');\" type=\"checkbox\" value=\"<{$lang_checkall}>\" /></th>\r\n    <th><{$lang_event}></th>\r\n    <th><{$lang_category}></th>\r\n    <th><{$lang_itemid}></th>\r\n    <th><{$lang_itemname}></th>\r\n  </tr>\r\n  <{foreach item=module from=$modules}>\r\n  <tr>\r\n    <td class=\"head\"><input name=\"del_mod[<{$module.id}>]\" id=\"del_mod[]\" onclick=\"xoopsCheckGroup(\'notificationlist\', \'del_mod[<{$module.id}>]\', \'del_not[<{$module.id}>][]\');\" type=\"checkbox\" value=\"<{$module.id}>\" /></td>\r\n    <td class=\"head\" colspan=\"4\"><{$lang_module}>: <{$module.name}></td>\r\n  </tr>\r\n  <{foreach item=category from=$module.categories}>\r\n  <{foreach item=item from=$category.items}>\r\n  <{foreach item=notification from=$item.notifications}>\r\n  <tr>\r\n    <{cycle values=odd,even assign=class}>\r\n    <td class=\"<{$class}>\"><input type=\"checkbox\" name=\"del_not[<{$module.id}>][]\" id=\"del_not[<{$module.id}>][]\" value=\"<{$notification.id}>\" /></td>\r\n    <td class=\"<{$class}>\"><{$notification.event_title}></td>\r\n    <td class=\"<{$class}>\"><{$notification.category_title}></td>\r\n    <td class=\"<{$class}>\"><{if $item.id != 0}><{$item.id}><{/if}></td>\r\n    <td class=\"<{$class}>\"><{if $item.id != 0}><{if $item.url != \'\'}><a href=\"<{$item.url}>\" title=\"<{$item.name}>\"><{/if}><{$item.name}><{if $item.url != \'\'}></a><{/if}><{/if}></td>\r\n  </tr>\r\n  <{/foreach}>\r\n  <{/foreach}>\r\n  <{/foreach}>\r\n  <{/foreach}>\r\n  <tr>\r\n    <td class=\"foot\" colspan=\"5\">\r\n      <input type=\"submit\" name=\"delete_cancel\" value=\"<{$lang_cancel}>\" />\r\n      <input type=\"reset\" name=\"delete_reset\" value=\"<{$lang_clear}>\" />\r\n      <input type=\"submit\" name=\"delete\" value=\"<{$lang_delete}>\" />\r\n      <input type=\"hidden\" name=\"XOOPS_TOKEN_REQUEST\" value=\"<{$notification_token}>\" />\r\n    </td>\r\n  </tr>\r\n</table>\r\n</form>\r\n'),(12,'<{if $xoops_notification.show}>\r\n<form id=\"notification_select\" action=\"<{$xoops_notification.target_page}>\" method=\"post\">\r\n<div>\r\n<h4 style=\"text-align:center;\"><{$lang_activenotifications}></h4>\r\n<input type=\"hidden\" name=\"not_redirect\" value=\"<{$xoops_notification.redirect_script}>\" />\r\n<input type=\"hidden\" name=\"XOOPS_TOKEN_REQUEST\" value=\"<{php}>echo icms::$security->createToken();<{/php}>\" />\r\n<table class=\"outer\">\r\n  <tr><th colspan=\"3\"><{$lang_notificationoptions}></th></tr>\r\n  <tr>\r\n    <td class=\"head\"><{$lang_category}></td>\r\n    <td class=\"head\"><input name=\"allbox\" id=\"allbox\" onclick=\"xoopsCheckAll(\'notification_select\',\'allbox\');\" type=\"checkbox\" value=\"<{$lang_checkall}>\" /></td>\r\n    <td class=\"head\"><{$lang_events}></td>\r\n  </tr>\r\n  <{foreach name=outer item=category from=$xoops_notification.categories}>\r\n  <{foreach name=inner item=event from=$category.events}>\r\n  <tr>\r\n    <{if $smarty.foreach.inner.first}>\r\n    <td class=\"even\" rowspan=\"<{$smarty.foreach.inner.total}>\"><{$category.title}></td>\r\n    <{/if}>\r\n    <td class=\"odd\">\r\n    <{counter assign=index}>\r\n    <input type=\"hidden\" name=\"not_list[<{$index}>][params]\" value=\"<{$category.name}>,<{$category.itemid}>,<{$event.name}>\" />\r\n    <input type=\"checkbox\" id=\"not_list[]\" name=\"not_list[<{$index}>][status]\" value=\"1\" <{if $event.subscribed}>checked=\"checked\"<{/if}> />\r\n    </td>\r\n    <td class=\"odd\"><{$event.caption}></td>\r\n  </tr>\r\n  <{/foreach}>\r\n  <{/foreach}>\r\n  <tr>\r\n    <td class=\"foot\" colspan=\"3\" align=\"center\"><input type=\"submit\" name=\"not_submit\" value=\"<{$lang_updatenow}>\" /></td>\r\n  </tr>\r\n</table>\r\n<div style=\"text-align: center;\">\r\n<{$lang_notificationmethodis}>:&nbsp;<{$user_method}>&nbsp;&nbsp;[<a href=\"<{$editprofile_url}>\" title=\"<{$lang_change}>\"><{$lang_change}></a>]\r\n</div>\r\n</div>\r\n</form>\r\n<{/if}>'),(13,'<{$block.content}>'),(14,'<{if $priv_poltype == \'page\'}>\r\n\r\n	<div class=\"privacy_policy\">\r\n		<div style=\"text-align: center;\"><h1><{$xoops_sitename}>: <{$lang_privacy_policy}></h1></div>\r\n		<div><{$priv_policy}></div>\r\n	</div>\r\n<{/if}>\r\n'),(15,'<div id=\"notfound\">\r\n	<h1><{$lang_error_title}></h1>\r\n	<{if $lang_error_desc && $lang_error_desc != \'\'}>\r\n		<div id=\"http_error_text\"><{$lang_error_desc}></div>\r\n	<{/if}>\r\n	<br />\r\n	<ul>\r\n		<li><{$lang_search_our_site}><br />\r\n			<form id=\"http_error_searchform\" style=\"vertical-align: middle;\" action=\"<{$xoops_url}>/search.php\" method=\"get\">\r\n				<input name=\"query\" size=\"14\" style=\"vertical-align: middle;\" type=\"text\" />\r\n				<input name=\"action\" value=\"results\" type=\"hidden\" />\r\n				<input src=\"<{$xoops_url}>/images/search2.gif\" style=\"vertical-align: middle;\" alt=\"<{$lang_search}>\" onclick=\"this.form.submit()\" type=\"image\" />\r\n				&nbsp;&nbsp;<a href=\"<{$xoops_url}>/search.php\"><{$lang_advanced_search}></a>\r\n			</form>\r\n		</li>\r\n		<li><{$lang_start_again}></li>\r\n		<li><{$lang_found_contact}></li>\r\n	</ul>\r\n</div>'),(16,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/blockspadmin/images/blockspadmin_big.png)\"><{$lang_badmin}></div><br />\n<{if $icms_blockposition_title}>\n	<h1><{$icms_blockposition_title}></h1>\n<{/if}>\n<{if $icms_blockposition_info}>\n	<p><{$icms_blockposition_info}></p>\n<{/if}>\n\n<{if $icms_blockposition_table}>\n	<{$icms_blockposition_table}>\n<{/if}>\n\n<{if $addblockposition}>\n	<{includeq file=\'db:system_common_form.html\' form=$addblockposition}>\n<{/if}>'),(17,'<{if $icms_page_title}>\n	<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/pages/images/pages_big.png)\"><{$icms_page_title}></div><br />\n<{/if}>\n<{if $icms_page_info}>\n	<p><{$icms_page_info}></p>\n<{/if}>\n\n<{if $icms_page_table}>\n	<{$icms_page_table}>\n<{/if}>\n\n<{if $addpage}>\n	<{includeq file=\'db:system_common_form.html\' form=$addpage}>\n<{/if}>'),(18,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/blocksadmin/images/blocksadmin_big.png)\"><{$smarty.const._AM_BADMIN}></div><br />\n<{if $icms_block_title}>\n	<h1><{$icms_block_title}></h1>\n<{/if}>\n<{if $icms_block_info}>\n	<p><{$icms_block_info}></p>\n<{/if}>\n\n<{if $icms_block_table}>\n	<{$icms_block_table}>\n<{/if}>\n\n<{if $addblock}>\n	<{includeq file=\'db:system_common_form.html\' form=$addblock}>\n<{/if}>'),(19,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/modulesadmin/images/modulesadmin_big.png)\"><{$lang_madmin}></div><br />\n<h2><{$lang_installed}></h2>\n<form action=\'admin.php\' method=\'post\' name=\'moduleadmin\' id=\'moduleadmin\'>\n<table width=\"100%\" cellpadding=\"4\" cellspacing=\"1\" border=\"0\" class=\"outer\">\n  <tr align=\'center\' valign=\'middle\'>\n    <th width=\"40%\"><{$lang_module}></th>\n    <th><{$lang_version}></th>\n    <th><{$lang_modstatus}></th>\n    <th><{$lang_lastup}></th>\n    <th><{$lang_active}></th>\n    <th><{$lang_order}><br /><small><{$lang_order0}></small></th>\n    <th width=\'130px\'><{$lang_action}></th>\n  </tr>\n  <{foreach item=module from=$modules}>\n    <tr valign=\'middle\'class=\"<{cycle values=\"even,odd\"}>\">\n      <td align=\"<{$smarty.const._GLOBAL_LEFT}>\" valign=\"middle\">\n        <div id=\"modlogo\" style=\"float: <{$smarty.const._GLOBAL_LEFT}>; padding: 2px;\">\n          <{if $module.hasadmin == 1 && $module.isactive == \'1\'}>\n            <a href=\"<{$xoops_url}>/modules/<{$module.dirname}>/<{$module.adminindex}>\">\n              <img src=\"<{$xoops_url}>/modules/<{$module.dirname}>/<{$module.image}>\" alt=\"<{$module.name}>\" title=\"<{$module.name}>\" border=\"0\" />\n            </a>\n          <{else}>\n            <img src=\"<{$xoops_url}>/modules/<{$module.dirname}>/<{$module.image}>\" alt=\"<{$module.name}>\" title=\"<{$module.name}>\" border=\"0\" />\n          <{/if}>&nbsp;\n        </div>\n        <div id=\"modlogo\" style=\"float: <{$smarty.const._GLOBAL_LEFT}>; padding-top: 2px;\">\n          <b><{$lang_modulename}>: </b><{$module.name}><br />\n          <b><{$lang_moduletitle}>: </b><input type=\"text\" name=\"newname[<{$module.mid}>]\" value=\"<{$module.title}>\" maxlength=\"150\" size=\"30\" />\n        </div>\n        <input type=\"hidden\" name=\"oldname[<{$module.mid}>]\" value=\"<{$module.title}>\" />\n      </td>\n      <td align=\'center\' valign=\"middle\"><{$module.version}></td>\n      <td align=\'center\' valign=\"middle\"><{$module.status}></td>\n      <td align=\'center\' valign=\"middle\"><{$module.last_update}></td>\n      <td align=\'center\' valign=\"middle\">\n        <{if $module.dirname == \'system\'}>\n          <input type=\"hidden\" name=\"newstatus[<{$module.mid}>]\" value=\"1\" />\n          <input type=\"hidden\" name=\"oldstatus[<{$module.mid}>]\" value=\"1\" />\n        <{else}>\n          <{if $module.isactive == \'1\'}>\n            <input type=\"checkbox\" name=\"newstatus[<{$module.mid}>]\" value=\"1\" checked=\"checked\" />\n            <input type=\"hidden\" name=\"oldstatus[<{$module.mid}>]\" value=\"1\" />\n          <{else}>\n            <input type=\"checkbox\" name=\"newstatus[<{$module.mid}>]\" value=\"1\" />\n            <input type=\"hidden\" name=\"oldstatus[<{$module.mid}>]\" value=\"0\" />\n          <{/if}>\n        <{/if}>\n      </td>\n      <td align=\'center\' valign=\"middle\">\n        <{if $module.hasmain == \'1\'}>\n          <input type=\"hidden\" name=\"oldweight[<{$module.mid}>]\" value=\"<{$module.weight}>\" />\n          <input type=\"text\" name=\"weight[<{$module.mid}>]\" size=\"3\" maxlength=\"5\" value=\"<{$module.weight}>\" />\n        <{else}>\n          <input type=\"hidden\" name=\"oldweight[<{$module.mid}>]\" value=\"0\" />\n          <input type=\"hidden\" name=\"weight[<{$module.mid}>]\" value=\"0\" />\n        <{/if}>\n      </td>\n      <td align=\'center\' valign=\"middle\">\n        <{if $module.support_site_url != \'\' &&  $module.isactive == \'1\'}>\n          <a href=\"<{$module.support_site_url}>\" rel=\"external\"><img src=\"<{$xoops_url}>/modules/system/images/support.png\" alt=\"<{$lang_support}>\" title=\"<{$lang_support}>\"/></a>\n        <{/if}>\n        <a href=\"<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=update&amp;module=<{$module.dirname}>\"><img src=\"<{$xoops_url}>/modules/system/images/update.png\" alt=\"<{$lang_update}>\" title=\"<{$lang_update}>\"/></a>\n        <{if $module.isactive != \'1\'}>\n          <a href=\"<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=uninstall&amp;module=<{$module.dirname}>\"><img src=\"<{$xoops_url}>/modules/system/images/uninstall.png\" alt=\"<{$lang_unistall}>\" title=\"<{$lang_unistall}>\" /></a>\n        <{/if}>  \n        <a href=\'javascript:openWithSelfMain(\"<{$xoops_url}>/modules/system/admin.php?fct=version&amp;mid=<{$module.mid}>\",\"Info\",300,230);\'><img src=\"<{$xoops_url}>/modules/system/images/info.png\" alt=\"<{$lang_info}>\" title=\"<{$lang_info}>\" /></a>\n        <input type=\"hidden\" name=\"module[]\" value=\"<{$module.mid}>\" />\n      </td>\n    </tr>\n  <{/foreach}>\n  <tr class=\'foot\'>\n    <td colspan=\'7\' align=\'center\'>\n      <input type=\'hidden\' name=\'fct\' value=\'modulesadmin\' />\n      <input type=\'hidden\' name=\'op\' value=\'confirm\' />\n      <input type=\'submit\' name=\'submit\' value=\'<{$lang_submit}>\' />\n    </td>\n  </tr>\n</table>\n</form>\n<br />\n<h2><{$lang_noninstall}></h2>\n<table width=\'100%\' border=\'0\' class=\'outer\' cellpadding=\'4\' cellspacing=\'1\'>\n  <tr align=\'center\'>\n    <th><{$lang_module}></th>\n    <th><{$lang_version}></th>\n    <th><{$lang_modstatus}></th>\n    <th width=\'130px\'><{$lang_action}></th>\n  </tr>\n  <{foreach item=module from=$avmodules}>\n    <tr valign=\'middle\'class=\"<{cycle values=\"even,odd\"}>\">\n      <td>\n        <div id=\"modlogo\" style=\"padding: 2px;\"><img src=\"<{$xoops_url}>/modules/<{$module.dirname}>/<{$module.image}>\" alt=\"<{$module.name}>\" alt=\"<{$module.name}>\" border=\"0\" />&nbsp;</div>\n	    <div id=\"modlogo\" style=\"padding-top: 10px;\"> <b><{$lang_modulename}>: </b><{$module.name}><br /> </div>\n      </td>\n      <td align=\'center\'><{$module.version}></td>\n      <td align=\'center\'><{$module.status}></td>\n      <td width=\'130px\' align=\'center\'>\n        <a href=\"<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&op=install&module=<{$module.dirname}>\"><img src=\"<{$xoops_url}>/modules/system/images/install.png\" alt=\"<{$lang_install}>\" title=\"<{$lang_install}>\" /></a>\n        <a href=\'javascript:openWithSelfMain(\"<{$xoops_url}>/modules/system/admin.php?fct=version&mid=<{$module.dirname}>\",\"Info\",300,230);\'><img src=\"<{$xoops_url}>/modules/system/images/info.png\" alt=\"<{$lang_info}>\" title=\"<{$lang_info}>\" /></a>\n      </td>\n    </tr>\n  <{/foreach}>\n</table>'),(20,'<{$form.javascript}>\n<form id=\"<{$form.name}>\" action=\"<{$form.action}>\" method=\"<{$form.method}>\" <{$form.extra}>>\n  <table style=\"width: 100%\" class=\"outer\" cellspacing=\"1\">\n    <{if $form.title}><tr><th colspan=\"2\"><{$form.title}></th></tr><{/if}>\n    <!-- start of form elements loop -->\n    <{foreach item=element from=$form.elements}>\n      <{if $element.section == true}>\n      <tr><th colspan=\"2\"><{$element.body}></th></tr>\n      <{elseif $element.section_close == true}>\n      <tr><td class=\"even\" colspan=\"2\">&nbsp;</td></tr>\n      <{elseif $element.hidden != true}>\n      <tr id=\"<{$element.name}>_row\">\n        <td class=\"head\">\n        <label for=\'<{$element.name}>\'><{$element.caption}> <{if $element.required}> <span style=\'color:#f00\'>*</span><{/if}>\n        <{if $element.description}>\n        	<img class=\"helptip\" style=\"float:<{$smarty.const._GLOBAL_RIGHT}>;padding-top: 2px;\" title=\"<{$smarty.const._MD_AM_HELP_TIP}>\" alt=\"<{$smarty.const._MD_AM_HELP_TIP}>\" src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/acp_help.png\" alt=\"<{$smarty.const._MD_AM_HELP_TIP}>\">\n        	<span class=\"helptext\" style=\"display: none;\"><{$element.description}> commonform</span>\n        <{/if}>\n        </label>\n        </td>\n        <td class=\"<{cycle values=\"even,odd\"}>\"><{$element.body}></td>\n      </tr>\n      <{else}>\n      <{$element.body}>\n      <{/if}>\n    <{/foreach}>\n    <!-- end of form elements loop -->\n  </table>\n</form>'),(21,'<style type=\"text/css\">\r\n	img {vertical-align: middle;}\r\n</style>\r\n<!--\r\n<style type=\"text/css\">\r\n.bg3 a{color: #fff;}\r\n</style>\r\n//-->\r\n<div id=\"<{$icms_id}>\">\r\n\r\n<{if $icms_table_header}>\r\n	<{$icms_table_header}>\r\n<{/if}>\r\n\r\n<div style=\"margin-bottom: 12px;\">\r\n	<{if $icms_introButtons}>\r\n		<div style=\"float: <{$smarty.const._GLOBAL_LEFT}>;\">\r\n			<form action =\'\'>\r\n				<{foreach from=$icms_introButtons item=introButton}>\r\n					<input type=\"button\" name=\"<{$introButton.name}>\" onclick=\"location=\'<{$introButton.location}>\'\" value=\"<{$introButton.value}>\" />\r\n				<{/foreach}>\r\n			</form>\r\n		</div>\r\n	<{/if}>\r\n\r\n<{if $icms_showFilterAndLimit || $icms_quicksearch}>\r\n<form id=\"pick\" action=\"<{$icms_optionssel_action}>\" method=\"post\" style=\"margin: 0;\">\r\n	<{if $icms_quicksearch}>\r\n		<div style=\"vertical-align: middle; float: <{$smarty.const._GLOBAL_RIGHT}>; border: 2px solid #C2CDD6; padding: 5px; background-color: #E6E6E6;\">\r\n			<strong><{$icms_quicksearch}> :</strong> <input style=\"min-width: 10px; vertical-align: middle;\" type=\"text\" id=\"quicksearch_<{$icms_id}>\" name=\"quicksearch_<{$icms_id}>\" size=\"15\" maxlength=\"255\"/>\r\n			<input style=\"vertical-align: middle;\" type=\"submit\" name=\"button_quicksearch_<{$icms_id}>\" value=\"<{$smarty.const._SEARCH}>\" />\r\n		</div>\r\n	<{/if}>\r\n</div>\r\n\r\n<!-- Why this If Else... ?? Let\'s comment it for now //-->\r\n<div style=\"clear:both; padding-top:10px;\"></div>\r\n<!--\r\n<{if !$icms_user_side}>\r\n	<div style=\"clear:both; padding-top:10px;\"></div>\r\n<{else}>\r\n	<div style=\"padding-top:45px;\"> </div>\r\n<{/if}>\r\n//-->\r\n<!-- Why this If Else... ?? //-->\r\n\r\n\r\n<{if $icms_showFilterAndLimit}>\r\n<{if $icms_pagenav}>\r\n	<div style=\"text-align:<{$smarty.const._GLOBAL_RIGHT}>; padding-bottom: 3px;\"><{$icms_pagenav}></div>\r\n<{/if}>\r\n\r\n	<table width=\"100%\" cellspacing=\"1\" cellpadding=\"2\" border=\"0\" style=\"border-left: 1px solid silver; border-top: 1px solid silver; border-right: 1px solid silver;\">\r\n		<tr>\r\n			<td>\r\n				<{if $icms_optionssel_filtersArray}>\r\n					<span style=\"font-weight: bold; font-size: 12px;\"><{$smarty.const._CO_ICMS_FILTER}> : </span>\r\n					<select name=\'filtersel\' onchange=\'submit()\'>\r\n						<{foreach from=$icms_optionssel_filtersArray key=key item=field}>\r\n							<option value=\'<{$key}>\' <{$field.selected}> > <{$field.caption}></option>\r\n						<{/foreach}>\r\n					</select>\r\n					<{if $icms_optionssel_filters2Array}>\r\n						<select name=\'filtersel2\' onchange=\'submit()\'>\r\n							<{foreach from=$icms_optionssel_filters2Array key=key item=field}>\r\n								<option value=\'<{$key}>\' <{$field.selected}> > <{$field.caption}></option>\r\n							<{/foreach}>\r\n						</select>\r\n					<{/if}>\r\n				<{/if}>\r\n			</td>\r\n			<td align=\'<{$smarty.const._GLOBAL_RIGHT}>\'>\r\n<!--				<span style=\"font-weight: bold; font-size: 12px;\"><{$smarty.const._CO_ICMS_SORT_BY}> : </span>\r\n				<select name=\'sortsel\' onchange=\'submit()\'>\r\n					<{foreach from=$icms_optionssel_fieldsForSorting key=key item=field}>\r\n						<option value=\'<{$key}>\' <{$field.selected}> > <{$field.caption}></option>\r\n					<{/foreach}>\r\n				</select>\r\n				<select name=\'ordersel\' onchange=\'submit()\'>\r\n					<{foreach from=$icms_optionssel_ordersArray key=key item=field}>\r\n						<option value=\'<{$key}>\' <{$field.selected}> > <{$field.caption}></option>\r\n					<{/foreach}>\r\n				</select>\r\n//-->\r\n				<{if !$icms_isTree}>\r\n					<{$smarty.const._CO_ICMS_SHOW_ONLY}> <select name=\'limitsel\' onchange=\'submit()\'>\r\n						<{foreach from=$icms_optionssel_limitsArray key=key item=field}>\r\n							<option value= \'<{$key}>\' <{$field.selected}> > <{$field.caption}></option>\r\n						<{/foreach}>\r\n					</select>\r\n				<{/if}>\r\n			</td>\r\n		</tr>\r\n	</table>\r\n\r\n<{/if}>\r\n</form>\r\n<{/if}>\r\n\r\n<{if $icms_actionButtons || $icms_withSelectedActions}>\r\n	<form id=\"form_<{$icms_id}>\" method=\"post\">\r\n<{/if}>\r\n<table width=\'100%\' cellspacing=\'1\' cellpadding=\'3\' border=\'0\' class=\'outer\'>\r\n	<tr>\r\n	 <{foreach from=$icms_columns item=column}>\r\n	 	<th width=\"<{$column.width}>\" align=\'<{$column.align}>\'><strong><{$column.caption}></strong></th>\r\n	 <{/foreach}>\r\n	 <{if $icms_has_actions}>\r\n	 	<th width=\'<{$icms_actions_column_width}>\' align=\'center\'>\r\n	 		<{if $icms_show_action_column_title}>\r\n	 			<strong><{$smarty.const._CO_ICMS_ACTIONS}></strong>\r\n	 		<{/if}>\r\n	 	</th>\r\n	 <{/if}>\r\n	</tr>\r\n\r\n	<{if $icms_persistable_objects}>\r\n		<{foreach from=$icms_persistable_objects item=icms_object}>\r\n			<{if $icms_actionButtons}>\r\n				<input type=\'hidden\' name=\'<{$icms_id}>_objects[]\' id=\'listed_objects\' value=\'<{$icms_object.id}>\' />\r\n			<{/if}>\r\n			<tr>\r\n				<{foreach from=$icms_object.columns item=column}>\r\n					<td class=\"<{$column.keyname}> <{$icms_object.class}>\" width=\"<{$column.width}>\" align=\"<{$column.align}>\"><{$column.value}></td>\r\n				<{/foreach}>\r\n				<{if $icms_object.actions}>\r\n					<td class=\"<{$icms_object.class}>\" align=\'center\'>\r\n						<{foreach from=$icms_object.actions item=action}>\r\n							<{$action}>\r\n						<{/foreach}>\r\n					</td>\r\n				<{/if}>\r\n			</tr>\r\n		<{/foreach}>\r\n	<{else}>\r\n		<tr>\r\n			<td class=\'head\' style=\'text-align: center; font-weight: bold;\' colspan=\"<{$icms_colspan}>\"><{$smarty.const._CO_ICMS_NO_OBJECT}></td>\r\n		</tr>\r\n	<{/if}>\r\n</table>\r\n<{if  $icms_actionButtons || $icms_withSelectedActions}>\r\n	<input type=\'hidden\' name=\'op\' id=\'op\' value=\'\' />\r\n	<{if $icms_withSelectedActions}>\r\n		<div style=\"padding: 5px;text-align: <{$smarty.const._GLOBAL_LEFT}>; border-left: 1px solid silver; border-bottom: 1px solid silver; border-right: 1px solid silver;\">\r\n		<{$smarty.const._CO_ICMS_WITH_SELECTED}>\r\n		<select name=\'selected_action\'>\r\n			<option value = \'\'>---</option>\r\n			<{foreach from=$icms_withSelectedActions key=key item=action}>\r\n				<option value = \'<{$key}>\'><{$action}></option>\r\n			<{/foreach}>\r\n		</select>\r\n		<input type=\"submit\" name=\"<{$actionButton.op}>\" onclick=\"this.form.elements.op.value=\'with_selected_actions\'\" value=\"<{$smarty.const._CO_ICMS_SUBMIT}>\" />\r\n		</div>\r\n	<{/if}>\r\n	<{if $icms_actionButtons}>\r\n		<div style=\"padding: 5px;text-align: <{$smarty.const._GLOBAL_RIGHT}>; border-left: 1px solid silver; border-bottom: 1px solid silver; border-right: 1px solid silver;\">\r\n			<{foreach from=$icms_actionButtons item=actionButton}>\r\n				<input type=\"submit\" name=\"<{$actionButton.op}>\" onclick=\"this.form.elements.op.value=\'<{$actionButton.op}>\'\" value=\"<{$actionButton.text}>\" />\r\n			<{/foreach}>\r\n		</div>\r\n	<{/if}>\r\n</form>\r\n<{/if}>\r\n<{if $icms_pagenav}>\r\n	<div style=\"text-align:<{$smarty.const._GLOBAL_RIGHT}>; padding-top: 3px;\"><{$icms_pagenav}></div>\r\n<{/if}>\r\n\r\n<{if $icms_introButtons}>\r\n	<div style=\"padding-top:15px; padding-bottom: 5px;\">\r\n		<form action=\'\'>\r\n			<{foreach from=$icms_introButtons item=introButton}>\r\n				<input type=\"button\" name=\"<{$introButton.name}>\" onclick=\"location=\'<{$introButton.location}>\'\" value=\"<{$introButton.value}>\" />\r\n			<{/foreach}>\r\n		</form>\r\n	</div>\r\n<{/if}>\r\n\r\n<{if $icms_table_footer}>\r\n	<{$icms_table_footer}>\r\n<{/if}>\r\n\r\n</div>\r\n\r\n<br />\r\n\r\n<{if $icms_printer_friendly_page}>\r\n	<a href=\"javascript:openWithSelfMain(\'<{$icms_printer_friendly_page}>\', \'smartpopup\', 700, 519);\"><img  src=\"<{$xoops_url}>/modules/icms/images/actions/fileprint.png\" alt=\"\" /></a>\r\n<{/if}>\r\n\r\n\r\n\r\n<!--\r\n<script language=\"javascript\">\r\nfunction Clickheretoprint()\r\n{\r\n  var disp_setting=\"toolbar=yes,location=no,directories=yes,menubar=yes,\";\r\n      disp_setting+=\"scrollbars=yes,width=650, height=600, <{$smarty.const._GLOBAL_LEFT}>=100, top=25\";\r\n  var content_value = document.getElementById(\"<{$icms_id}>\").innerHTML;\r\n\r\n  var docprint=window.open(\"\",\"\",disp_setting);\r\n   docprint.document.open();\r\n   docprint.document.write(\'<html><head><title>Inel Power System</title>\');\r\n   docprint.document.write(\'<link rel=\"stylesheet\" media=\"print\" href=\"<{$xoops_url}>/modules/icms/print.css\" type=\"text/css\">\');\r\n   docprint.document.write(\'<link rel=\"stylesheet\" media=\"all\" href=\"<{$xoops_url}>/modules/system/style.css\" type=\"text/css\">\');\r\n   docprint.document.write(\'</head><body onLoad=\"self.print()\">\');\r\n   docprint.document.write(\'<h2>Title</h2>\');\r\n   docprint.document.write(\'<h3>SubTitle</h3>\');\r\n   docprint.document.write(content_value);\r\n   docprint.document.write(\'<div style=\"text-align: center;\"><a href=\"javascript:window.close();\">Close this window</a></div>\');\r\n   docprint.document.write(\'</body></html>\');\r\n   docprint.document.close();\r\n   docprint.focus();\r\n}\r\n</script>\r\n<br />\r\n<a href=\"javascript:Clickheretoprint();\"><img  src=\"<{$xoops_url}>/modules/icms/images/actions/fileprint.png\" alt=\"\" /></a>\r\n//-->'),(22,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/customtag/images/customtag_big.png)\"><{$smarty.const._CO_ICMS_CUSTOMTAGS}></div><br />\n\n<{if $icms_custom_tag_explain}>\n	<h1><{$smarty.const._CO_ICMS_CUSTOMTAGS_EXPLAIN_TITLE}></h1>\n	<p><{$smarty.const._CO_ICMS_CUSTOMTAGS_EXPLAIN}></p>\n<{/if}>\n\n<p><{$icms_custom_tag_title}></p>\n\n<{if $icms_customtag_table}>\n	<{$icms_customtag_table}>\n<{/if}>\n\n<{if $addcustomtag}>\n	<{includeq file=\'db:system_common_form.html\' form=$addcustomtag}>\n<{/if}>'),(23,'<{$form.javascript}>\r\n<form name=\"<{$form.name}>\" action=\"<{$form.action}>\" method=\"<{$form.method}>\" <{$form.extra}>>\r\n  <table style=\"width: 100%\" class=\"outer\" cellspacing=\"1\">\r\n    <tr>\r\n    <th colspan=\"2\"><{$form.title}></th>\r\n    </tr>\r\n    <!-- start of form elements loop -->\r\n    <{foreach item=element from=$form.elements}>\r\n      <{if $element.hidden != true}>\r\n      <tr id=\"<{$element.name}>_row\">\r\n        <td class=\"head\"><{$element.caption}>\r\n        <{if $element.description}>\r\n        	<div style=\"font-weight: normal\"><{$element.description}></div>\r\n        <{/if}>\r\n        </td>\r\n        <td class=\"<{cycle values=\"even,odd\"}>\"><{$element.body}></td>\r\n      </tr>\r\n      <{else}>\r\n      <{$element.body}>\r\n      <{/if}>\r\n    <{/foreach}>\r\n    <!-- end of form elements loop -->\r\n  </table>\r\n</form>'),(24,'<script type=\"text/javascript\" src=\"<{$xoops_url}>/modules/system/admin/images/js/imanager.js\"></script>\n<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/images/images/images_big.png)\"><{$lang_imanager_title}></div><br />\n<p style=\"margin-top:0;\"><{$admnav}></p>\n<{if $catcount > 0}>\n<form action=\"admin.php\" method=\"post\">\n  <table width=\"100%\" celpadding=\"0\" cellspacing=\"1\" class=\"outer\">\n    <tr>\n      <th align=\"center\" width=\"3%\"><{$lang_imanager_catid}></th>\n      <th align=\"center\" width=\"20%\"><{$lang_imanager_catname}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catmsize}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catmwidth}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catmheight}></th>\n      <th align=\"center\" width=\"8%\"><{$lang_imanager_catstype}></th>\n      <th align=\"center\" width=\"7%\"><{$lang_imanager_catdisp}></th>\n      <th align=\"center\" width=\"5%\"><{$lang_imanager_catweight}></th>\n      <th align=\"center\" width=\"5%\"><{$lang_imanager_catsubs}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catqtde}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catoptions}></th>\n    </tr>\n    <{section name=i loop=$imagecategorys}>\n      <tr class=\"<{cycle values=\"odd,even\"}><{if !$nwrite[i]}> blocked<{/if}>\" align=\"center\">\n        <td><{$imagecategorys[i]->getVar(\'imgcat_id\')}></td>\n        <td align=\"left\"><{$imagecategorys[i]->getVar(\'imgcat_name\')}></td>\n        <td><{$msize[i]}></td>\n        <td><{$imagecategorys[i]->getVar(\'imgcat_maxwidth\')}>px</td>\n        <td><{$imagecategorys[i]->getVar(\'imgcat_maxheight\')}>px</td>\n        <td><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/<{$imagecategorys[i]->getVar(\'imgcat_storetype\')}>.png\" title=\"<{$imagecategorys[i]->getVar(\'imgcat_storetype\')}>\" /></td>\n        <td><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/<{$imagecategorys[i]->getVar(\'imgcat_display\')}>.png\" /></td>\n        <td><input style=\"text-align:center;\" type=\"text\" name=\"imgcat_weight[<{$imagecategorys[i]->getVar(\'imgcat_id\')}>]\" value=\"<{$imagecategorys[i]->getVar(\'imgcat_weight\')}>\" size=\"3\" maxlength=\"4\" /></td>\n        <td>\n          <{if $subs[i] > 0}>\n            <{$subs[i]}> <a href=\"admin.php?fct=images&imgcat_id=<{$imagecategorys[i]->getVar(\'imgcat_id\')}>\" title=\"<{$smarty.const._MD_IMAGE_VIEWSUBS}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/filefind.png\" align=\"absmiddle\" alt=\"<{$smarty.const._MD_IMAGE_VIEWSUBS}>\" /></a>\n          <{else}>\n            <{$subs[i]}>\n          <{/if}>\n        </td>\n        <td><{$count[i]}><{if $scount[i] > 0}> (+<{$scount[i]}>)<{/if}></td>\n        <td>\n          <{if $count[i] > 0}>\n            <a href=\"admin.php?fct=images&amp;op=listimg&amp;imgcat_id=<{$imagecategorys[i]->getVar(\'imgcat_id\')}>\" title=\"<{$lang_imanager_cat_listimg}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/viewmag.png\" alt=\"<{$lang_imanager_cat_listimg}>\" /></a>\n          <{else}>\n            <img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/encrypted.png\" alt=\"\" />\n          <{/if}>\n          <a href=\"admin.php?fct=images&amp;op=editcat&amp;imgcat_id=<{$imagecategorys[i]->getVar(\'imgcat_id\')}>\" title=\"<{$lang_imanager_cat_edit}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/edit.png\" alt=\"<{$lang_imanager_cat_edit}>\" /></a>\n          <{if ($imagecategorys[i]->getVar(\'imgcat_type\') == \'C\')}>\n            <a href=\"admin.php?fct=images&amp;op=delcat&amp;imgcat_id=<{$imagecategorys[i]->getVar(\'imgcat_id\')}>\" title=\"<{$smarty.const._DELETE}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/editdelete.png\" alt=\"<{$smarty.const._DELETE}>\" /></a>\n          <{else}>\n            <img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/encrypted.png\" alt=\"\" />\n          <{/if}>\n        </td>\n      </tr>\n      <tr id=\"line<{$imagecategorys[i]->getVar(\'imgcat_id\')}>\" style=\"display:none;\">\n        <td class=\"head\" width=\"2%\"></td>\n        <td colspan=\"11\" style=\"padding:0; margin:0;\">\n          <div id=\"cat<{$imagecategorys[i]->getVar(\'imgcat_id\')}>\"></div>\n        </td>  \n      </tr>\n    <{/section}>\n    <tr>\n      <td class=\"head\" colspan=\"12\" align=\"right\">\n        <input type=\"submit\" name=\"submit\" value=\"<{$lang_imanager_cat_submit}>\" />\n        <{if $isAdmin}>\n          <input type=\"button\" onclick=\"showDiv(\'addcatform\'); document.anchors.item(\'addcatform\').scrollIntoView(); return false;\" value=\"<{$lang_imanager_cat_addnewcat}>\" />\n        <{/if}>\n        <{if $writecatcount > 0}>\n          <input type=\"button\" onclick=\"showDiv(\'addimgform\'); document.anchors.item(\'addimgform\').scrollIntoView(); return false;\" value=\"<{$lang_imanager_cat_addnewimg}>\" />\n        <{/if}>\n      </td>\n    </tr>\n  </table>\n  <input type=\"hidden\" name=\"op\" value=\"reordercateg\" />\n  <input type=\"hidden\" name=\"fct\" value=\"images\" />\n  <{$token}>\n</form>\n<{/if}>\n<{if $hasnwrite}>\n<div id=\"legend\">\n  <div class=\"imgcat_notwrite\"><span><{$lang_imanager_folder_not_writable}>: <{$hasnwrite}></span></div>\n</div>\n<{/if}>\n<div id=\"addimgform\" class=\"opt_divs\" style=\"display:none; margin:5px; padding:5px;\"><{$addimgform}></div>\n<a name=\"addimgform\"></a>\n<div id=\"addcatform\" class=\"opt_divs\" style=\"<{if $catcount > 0}>display:none;<{else}>display:block;<{/if}> margin:5px; padding:5px;\"><{$addcatform}></div>\n<a name=\"addcatform\"></a>'),(25,'<script type=\"text/javascript\" src=\"<{$xoops_url}>/modules/system/admin/images/js/imanager.js\"></script>\n<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/images/images/images_big.png)\"><{$lang_imanager_title}></div><br />\n<p style=\"margin-top:0;\"><{$admnav}></p>\n<table width=\"100%\" celpadding=\"0\" cellspacing=\"1\" class=\"outer\">\n  <tr>\n    <th align=\"center\"><{$lang_imanager_catmsize}></th>\n    <th align=\"center\"><{$lang_imanager_catmwidth}></th>\n    <th align=\"center\"><{$lang_imanager_catmheight}></th>\n    <th align=\"center\"><{$lang_imanager_catstype}></th>\n    <th align=\"center\"><{$lang_imanager_catdisp}></th>\n    <th align=\"center\" width=\"5%\"><{$lang_imanager_catsubs}></th>\n    <th align=\"center\"><{$lang_imanager_catqtde}></th>\n    <th align=\"center\"><{$lang_imanager_catoptions}></th>\n  </tr>\n  <tr class=\"odd\">\n    <td align=\"center\"><{$cat_maxsize}></td>\n    <td align=\"center\"><{$cat_maxwidth}>px</td>\n    <td align=\"center\"><{$cat_maxheight}>px</td>\n    <td align=\"center\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/<{$cat_storetype}>.png\" title=\"<{$cat_storetype}>\" alt=\"<{$cat_storetype}>\" /></td>\n    <td align=\"center\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/<{$cat_display}>.png\" title=\"<{$cat_display}>\" alt=\"<{$cat_display}>\" /></td>\n    <td align=\"center\">\n    <{if $cat_subs > 0}>\n      <{$cat_subs}> <a href=\"admin.php?fct=images&imgcat_id=<{$cat_id}>\" title=\"<{$smarty.const._MD_IMAGE_VIEWSUBS}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/filefind.png\" align=\"absmiddle\" alt=\"<{$smarty.const._MD_IMAGE_VIEWSUBS}>\" /></a>\n    <{else}>\n      <{$cat_subs}>\n    <{/if}>\n    </td>\n    <td align=\"center\"><{$imgcount}><{if $simgcount > 0}> (+<{$simgcount}>)<{/if}></td>\n    <td align=\"center\">\n      <a href=\"#\" onclick=\"showDiv(\'addimgform\',\'\'); document.anchors.item(\'addimgform\').scrollIntoView(); return false;\" title=\"<{$lang_imanager_cat_addimg}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/filenew2.png\" alt=\"<{$lang_imanager_cat_addimg}>\" /></a>\n      <a href=\"admin.php?fct=images&amp;op=editcat&amp;imgcat_id=<{$cat_id}>\" title=\"<{$lang_imanager_cat_edit}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/edit.png\" alt=\"<{$lang_imanager_cat_edit}>\" /></a>\n      <a href=\"admin.php?fct=images&amp;op=delcat&amp;imgcat_id=<{$cat_id}>\" title=\"<{$smarty.const._DELETE}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/editdelete.png\" alt=\"<{$smarty.const._DELETE}>\" /></a>\n    </td>\n  </tr>\n</table>\n<div style=\"border: 2px solid #C2CDD6; padding: 5px; vertical-align: middle; background-color: #E6E6E6; width:45%; float:right; margin-top:5px;\" align=\"right\">\n  <form action=\"admin.php?fct=images&op=listimg&imgcat_id=<{$cat_id}>\" method=\"POST\">\n    <b><{$lang_search_title}>:</b> \n    <input type=\"text\" name=\"query\" id=\"query\" size=\"20\" value=\"<{$query}>\" style=\"min-width:300px;\" />\n    <input type=\"submit\" name=\"btn\" value=\"<{$lang_search}>\" />\n    <input type=\"submit\" name=\"btn1\" value=\"<{$lang_cancel}>\" onclick=\"document.getElementById(\'query\').value=\'\';\" />\n  </form>\n</div>\n<br style=\"clear:right;\" />\n<{foreach from=$images item=image key=key}>\n  <{include file=\"db:system_adm_imagemanager_img.html\" image=$image i=$key}>\n<{/foreach}>\n<br style=\"clear:both;\" />\n<{foreach from=$images item=image key=key}>\n  <{include file=\"db:system_adm_imagemanager_editimg.html\" image=$image i=$key}>\n  <{include file=\"db:system_adm_imagemanager_cloneimg.html\" image=$image i=$key}>\n<{/foreach}>\n<div id=\"addimgform\" class=\"opt_divs\" style=\"display:none; padding:5px; margin:5px;\"><{$addimgform}></div>\n<a name=\"addimgform\"></a>\n<{$pag}>'),(26,'<div id=\"img<{$i}>\" class=\"imanager_image_box\">\n  <span class=\"imanager_image_img\"><img src=\"<{$image.src}>\" title=\"<{$image.nicename}>\" /></span>\n  <span class=\"imanager_image_label\"><{$image.display_nicename}></span>\n  <span class=\"imanager_image_info\">\n    <b><{$smarty.const.IMANAGER_FILE}>:</b> <{$image.name}><br />\n    <b><{$smarty.const.IMANAGER_SIZE}>:</b> <{$image.size}><br />\n    <b><{$smarty.const.IMANAGER_WIDTH}>:</b> <{$image.width}>px<br />\n    <b><{$smarty.const.IMANAGER_HEIGHT}>:</b> <{$image.height}>px\n  </span>\n  <span class=\"imanager_image_btns\">\n    <{$image.preview_link}>\n    <a href=\"#\" onclick=\"showDiv(\'edit_image\',<{$i}>); document.anchors.item(\'edit_image<{$i}>\').scrollIntoView(); return false;\" title=\"<{$lang_imanager_cat_edit}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/edit.png\" alt=\"<{$lang_imanager_cat_edit}>\" /></a>\n    <a href=\"#\" onclick=\"showDiv(\'clone_image\',<{$i}>); document.anchors.item(\'clone_image<{$i}>\').scrollIntoView(); return false;\" title=\"<{$lang_imanager_cat_clone}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/editcopy.png\" alt=\"<{$lang_imanager_cat_clone}>\" /></a>\n    <{if $image.hasextra_link}>\n      <a href=\"#\" onclick=\"<{$image.editor_link}>\" title=\"<{$lang_imanager_img_editor}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/edit_picture.png\" alt=\"<{$lang_imanager_img_editor}>\" /></a>\n    <{/if}>\n    <a href=\"admin.php?fct=images&amp;op=delfile&amp;image_id=<{$i}>&imgcat_id=<{$image.categ_id}>\" title=\"<{$smarty.const._DELETE}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/editdelete.png\" alt=\"<{$smarty.const._DELETE}>\" /></a>\n  </span>\n</div>'),(27,'<div id=\"edit_image<{$i}>\" class=\"opt_divs\" style=\"display:none; padding:5px; margin:5px;\">\n  <form action=\"admin.php\" method=\"post\">\n    <table width=\"100%\" cellspacing=\"1\" class=\"outer\">\n      <tr><th colspan=\"2\"><{$lang_imanager_cat_edit}></th></tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_name}></td>\n	    <td class=\"even\"><input type=\"text\" name=\"image_nicename[]\" id=\"name<{$i}>\" value=\"<{$image.nicename}>\" size=\"20\" maxlength=\"255\" /></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_mimetype}></td>\n	    <td class=\"odd\"><{$image.mimetype}></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_cat}></td>\n	    <td class=\"even\"><select name=\"imgcat_id[]\" size=\"1\"><{$image.ed_selcat_options}></select></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_weight}></td>\n	    <td class=\"odd\"><input type=\"text\" name=\"image_weight[]\" value=\"<{$image.weight}>\" size=\"3\" maxlength=\"4\" /></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_disp}></td>\n	    <td class=\"even\"><input type=\"checkbox\" name=\"image_display[]\" value=\"1\"<{if $image.display == 1}> checked=\"checked\"<{/if}> /></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\" colspan=\"2\" align=\"center\">\n	     <input type=\"submit\" name=\"submit\" value=\"<{$lang_submit}>\" /> \n	     <input type=\"button\" name=\"btn\" value=\"<{$lang_cancel}>\" onclick=\"document.getElementById(\'edit_image<{$i}>\').style.display=\'none\'; return false;\" />\n	    </td>\n	  </tr>\n    </table>\n	<input type=\"hidden\" name=\"image_id[]\" value=\"<{$i}>\" />\n	<input type=\"hidden\" name=\"op\" value=\"save\" />\n	<input type=\"hidden\" name=\"redir\" value=\"<{$cat_id}>\" />\n	<input type=\"hidden\" name=\"fct\" value=\"images\" />\n	<{$image.ed_token}>\n  </form>\n</div>\n<a name=\"edit_image<{$i}>\"></a>'),(28,'<div id=\"clone_image<{$i}>\" class=\"opt_divs\" style=\"display:none; padding:5px; margin:5px;\">\n  <form id=\"clone_form<{$i}>\" action=\"admin.php\" method=\"post\">\n    <table width=\"100%\" cellspacing=\"1\" class=\"outer\">\n      <tr><th colspan=\"2\"><{$lang_imanager_cat_clone}></th></tr>\n      <tr>\n	    <td class=\"head\"><{$lang_image_name}></td>\n	    <td class=\"odd\"><input type=\"text\" name=\"image_nicename\" id=\"name<{$i}>\" size=20 value=\"<{$lang_imanager_copyof}><{$image.nicename}>\"></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_weight}></td>\n	    <td class=\"odd\"><input type=\"text\" name=\"image_weight\" size=\"5\" value=\"0\"></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_disp}></td>\n	    <td class=\"odd\">\n	      <{$lang_yes}> <input type=\"radio\" name=\"image_display\" value=\"1\" checked /> \n	  	  <{$lang_no}> <input type=\"radio\" name=\"image_display\" value=\"0\" />\n  	    </td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\" colspan=\"2\" align=\"center\">\n	      <input type=\"submit\" name=\"submit\" value=\"<{$lang_submit}>\" /> \n	      <input type=\"button\" name=\"btn\" value=\"<{$lang_cancel}>\" onclick=\"document.getElementById(\'clone_image<{$i}>\').style.display = \'none\'; return false;\" />\n	    </td>\n      </tr>\n    </table>\n    <input type=\"hidden\" name=\"image_id\" value=\"<{$image.id}>\" />\n    <input type=\"hidden\" name=\"imgcat_id\" value=\"<{$image.categ_id}>\" />\n    <input type=\"hidden\" name=\"op\" value=\"cloneimg\" />\n    <input type=\"hidden\" name=\"fct\" value=\"images\" />\n    <{$image.clone_token}>\n  </form>\n</div>\n<a name=\"clone_image<{$i}>\"></a>'),(29,'<table class=\"outer\" width=\"100%\">\n	<{foreach item=feeditem from=$admin_rss_feeditems}>\n		<tr class=\"head\">\n			<td><a href=\"<{$feeditem.link}>\" rel=\"external\"><{$feeditem.title}></a> (<{$feeditem.date}>)</td>\n		</tr>\n		<{if $feeditem.description}>\n			<tr>\n				<td class=\"odd\">\n					<{$feeditem.description}>\n					<{if $feeditem.guid}>\n						<br />\n						<a href=\"<{$feeditem.guid}>\"><{$smarty.const._MORE}></a>\n					<{/if}>\n				</td>\n			</tr>\n		<{elseif $feeditem.guid}>\n			<tr>\n				<td class=\"even\" valign=\"top\">\n					<a href=\"<{$feeditem.guid}>\"><{$smarty.const._MORE}></a>\n				</td>\n			</tr>\n		<{/if}>\n	<{/foreach}>\n</table>'),(30,'<{if $basic_search == false && $search_results }>\r\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"height: 33px;\" border=\"0\">\r\n <tr style=\"height: 33px;\">\r\n  <td style=\"width:3px; background-image: url(images/search/header.<{$smarty.const._GLOBAL_LEFT}>.gif);\"></td>\r\n  <td style=\"background-image: url(images/search/header.background.gif); vertical-align: middle\">\r\n   <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n    <tr>\r\n     <td colspan=\"2\" style=\"font-family: sans-serif; font-weight: bold; padding-<{$smarty.const._GLOBAL_LEFT}>: 3px;\"><{$label_search_results}>: <{$showing}></td>\r\n    </tr>\r\n   </table>\r\n  </td>\r\n  <td style=\"width:3px; background-image: url(images/search/header.<{$smarty.const._GLOBAL_RIGHT}>.gif);\"></td>\r\n </tr>\r\n</table>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n<{foreach from=$module_sort_order key=sort_key item=sort_value}>\r\n<tr>\r\n <td style=\"background-image: url(images/search/bodyHeader.<{$smarty.const._GLOBAL_LEFT}>.gif);\"></td>\r\n <td style=\"background-image: url(images/search/bodyHeader.background.gif);\">\r\n 	<div style=\"padding-top: 5px; padding-bottom: 5px;\"><b><{$sort_key}></b>: (<{$sort_value}> <{$smarty.const._SR_HITSRETURNED}>)</div>\r\n<{if $search_results[$sort_key].search_more_url != \'\'}>\r\n	  <span style=\"margin: 10px; padding: 2px 0.5em 3px 0.5em; height:30px;\">\r\n	  <a href=\"<{$search_results[$sort_key].search_more_url}>\">\r\n	  <img style=\"vertical-align: middle;\" src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/find.png\" alt=\"<{$search_results[$sort_key].search_more_title}>\" /> <{$smarty.const._SR_SHOWALLR}>\r\n	  </a>\r\n	  </span>\r\n	<{/if}>\r\n\r\n	<{if $search_results[$sort_key].page_nav != \'\'}>\r\n		<div style=\"padding-bottom: 5px; text-align: <{$smarty.const._GLOBAL_RIGHT}>\"><{$search_results[$sort_key].page_nav}></div>\r\n	<{/if}>\r\n </td>\r\n <td style=\"background-image: url(images/search/bodyHeader.<{$smarty.const._GLOBAL_RIGHT}>.gif);\"></td>\r\n</tr>\r\n<tr style=\"background-color: #FDFDFD;\">\r\n <td style=\"width: 16px; background-image: url(images/search/body.<{$smarty.const._GLOBAL_LEFT}>.gif)\"></td>\r\n <td style=\"padding: 15px\">\r\n	<table class=\"outer\" cellpadding=\"4\" cellspacing=\"1\" width=\"100%\">\r\n		<{section name=cur_result loop=$search_results[$sort_key].results}>\r\n		<tr>\r\n			<td class=\"head\"><{math equation=\"x + y\" x=$smarty.section.cur_result.index y=$start}></td>\r\n			<td style=\"width: 100%;\" class=\"<{cycle values=\"even,odd\"}>\">\r\n				<img alt=\"<{$search_results[$sort_key].results[cur_result].processed_image_alt_text}>\" src=\"<{$search_results[$sort_key].results[cur_result].processed_image_url}>\" />\r\n				<{$search_results[$sort_key].results[cur_result].processed_image_tag}>&nbsp;\r\n				<b><a href=\"<{$search_results[$sort_key].results[cur_result].link}>\"><{$search_results[$sort_key].results[cur_result].processed_title}></a>						</b>\r\n				<br /><small>&nbsp;&nbsp;<a href=\"<{$search_results[$sort_key].results[cur_result].processed_user_url}>\"><{$search_results[$sort_key].results[cur_result].processed_user_name}></a> <{$search_results[$sort_key].results[cur_result].processed_time}></small>\r\n     			</td>\r\n    	</tr>\r\n		<{/section}>\r\n	</table>\r\n	<{if $search_results[$sort_key].page_nav != \'\'}>\r\n		<div style=\"padding-bottom: 5px; text-align: <{$smarty.const._GLOBAL_RIGHT}>\"><{$search_results[$sort_key].page_nav}></div>\r\n	<{/if}>\r\n </td>\r\n <td style=\"width: 19px; background-image: url(images/search/body.<{$smarty.const._GLOBAL_RIGHT}>.gif)\"></td>\r\n</tr>\r\n<{/foreach}>\r\n\r\n    <tr>\r\n     <td style=\"height:9px; background-image: url(images/search/footer.<{$smarty.const._GLOBAL_LEFT}>.gif);\"></td>\r\n     <td style=\"height:9px; background-image: url(images/search/footer.background.gif);\"></td>\r\n     <td style=\"height:9px; background-image: url(images/search/footer.<{$smarty.const._GLOBAL_RIGHT}>.gif);\"></td>\r\n    </tr>\r\n</table><br />\r\n<strong><{$label_search_type}> </strong><{$search_type}><br />\r\n<strong><{$label_keywords}> </strong>\r\n	<{* This section generates a space separated list of keywords that were searched. *}>\r\n	<{section name=cur_kw_searched loop=$searched_keywords}>\r\n	  	<{$searched_keywords[cur_kw_searched]}><{if $smarty.section.cur_kw_searched.index <> $smarty.section.cur_kw_searched.total}>&nbsp;<{/if}>\r\n	<{/section}><br />\r\n<{if $ignored_keywords}><{$label_ignored_keywords}>\r\n	<strong>\r\n	<{* This section generates a space separated list of keywords that were NOT searched. *}>\r\n	<{section name=cur_kw_not_searched loop=$ignored_keywords}>\r\n	  	<{$ignored_keywords[cur_kw_not_searched]}><{if $smarty.section.cur_kw_not_searched.index <> $smarty.section.cur_kw_not_searched.total}>&nbsp;<{/if}>\r\n	<{/section}>\r\n	</strong><br />\r\n<{/if}><br />\r\n<{/if}>\r\n<{$search_form}>'),(31,'<{if $icms_single_view_header_value && !$icms_header_as_row}>\r\n	<h1><{$icms_single_view_header_value}></h1>\r\n<{/if}>\r\n\r\n<table class=\"outer\" cellspacing=\"1\" width=\"100%\">\r\n	<{if $icms_single_view_header_value && $icms_header_as_row}>\r\n		<tr>\r\n			<th width=\"200\" style=\"text-align: <{$smarty.const._GLOBAL_LEFT}>;\"><{$icms_single_view_header_caption}></th>\r\n			<th style=\"text-align: <{$smarty.const._GLOBAL_LEFT}>;\"><{$icms_single_view_header_value}></th>\r\n		</tr>\r\n	<{/if}>\r\n	<{foreach from=$icms_object_array key=key item=field name=singleviewloop}>\r\n		<tr>\r\n			<td class=\"head\" width=\"200\"><{$field.caption}></td>\r\n			<td class=\"<{cycle values=\"even,odd\"}>\"><{$field.value}></td>\r\n		</tr>\r\n	<{/foreach}>\r\n</table>\r\n'),(32,'<div class=\"icms_breadcrumb\">\r\n	<{foreach item=breadcrumb_item from=$icms_breadcrumb_items name=loop}>\r\n		<{if $breadcrumb_item.link}>\r\n			<a href=\"<{$breadcrumb_item.link}>\"><{$breadcrumb_item.caption}></a>\r\n		<{else}>\r\n			<{$breadcrumb_item.caption}>\r\n		<{/if}>\r\n		<{if !$smarty.foreach.loop.last}>&nbsp;>&nbsp;<{/if}>\r\n	<{/foreach}>\r\n</div>'),(33,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/adsense/images/adsense_big.png)\"><{$smarty.const._CO_ICMS_ADSENSE}></div><br />\n\n<{if $icms_adsense_explain}>\n	<h1><{$smarty.const._CO_ICMS_ADSENSE_EXPLAIN_TITLE}></h1>\n	<p><{$smarty.const._CO_ICMS_ADSENSE_EXPLAIN}></p>\n<{/if}>\n\n<p><{$icms_adsense_title}></p>\n\n<{if $icms_adsense_table}>\n	<{$icms_adsense_table}>\n<{/if}>\n\n<{if $addadsense}>\n	<{includeq file=\'db:system_common_form.html\' form=$addadsense}>\n<{/if}>'),(34,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"content-type\" content=\"text/html; charset=<{$icms_charset}>\" />\r\n<meta http-equiv=\"content-language\" content=\"<{$icms_langcode}>\" />\r\n<meta name=\"robots\" content=\"<{$icms_meta_robots}>\" />\r\n<meta name=\"keywords\" content=\"<{$icms_meta_keywords}>\" />\r\n<meta name=\"description\" content=\"<{$icms_meta_description}>\" />\r\n<meta name=\"rating\" content=\"<{$icms_meta_rating}>\" />\r\n<meta name=\"author\" content=\"<{$icms_meta_author}>\" />\r\n<meta name=\"copyright\" content=\"<{$icms_meta_copyright}>\" />\r\n<meta name=\"generator\" content=\"IMPRESSCMS\" />\r\n<title><{$icms_print_pageTitle}></title>\r\n\r\n<link rel=\"stylesheet\" media=\"all\" href=\"<{$icms_url}>/modules/system/style<{if $icms_rtl}>_rtl<{/if}>.css\" type=\"text/css\">\r\n<link rel=\"stylesheet\" media=\"all\" href=\"<{$icms_url}>/modules/system/print<{if $icms_rtl}>_rtl<{/if}>.css\" type=\"text/css\">\r\n\r\n<style>\r\n	#container {width: <{$icms_print_width}>px; margin-left: auto; margin-right: auto;}\r\n</style>\r\n\r\n</head>\r\n\r\n<body onload=\"self.print();\">\r\n<div id=\"container\">\r\n	<{if $icms_print_title}>\r\n		<h2><{$icms_print_title}></h2>\r\n	<{/if}>\r\n	<{if $icms_print_dsc}>\r\n		<h3><{$icms_print_dsc}></h3>\r\n	<{/if}>\r\n	\r\n	<div id=\"icms_printer_friendly_content\"><{$icms_print_content}></div>\r\n	\r\n	<div id=\"print_close\"><a href=\"javascript:window.close();\">Close this window</a></div>\r\n</div>\r\n</body>\r\n</html>'),(35,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/rating/images/rating_big.png)\"><{$smarty.const._CO_ICMS_RATING}></div><br />\n\n<{if $icms_rating_explain}>\n	<h1><{$smarty.const._CO_ICMS_RATING_EXPLAIN_TITLE}></h1>\n	<p><{$smarty.const._CO_ICMS_RATING_EXPLAIN}></p>\n<{/if}>\n\n<p><{$icms_rating_title}></p>\n\n<{if $icms_rating_table}>\n	<{$icms_rating_table}>\n<{/if}>\n\n<{if $addrating}>\n	<{includeq file=\'db:system_common_form.html\' form=$addrating}>\n<{/if}>'),(36,'<style type=\'text/css\'>\n\n</style>\n\n<div id=\"wrap\">\n<div id=\"buttontop\">\n<div style=\"width: 100%; padding: 0;\" cellspacing=\"0\">\n	<div style=\"font-size: 10px; text-align: <{$smarty.const._GLOBAL_LEFT}>; color: #2F5376; padding: 0 6px; line-height: 18px;float:<{$smarty.const._GLOBAL_LEFT}>;\">\n	<{foreach from=$headermenu key=itemnum item=menuitem}>\n		<a class=\"nobutton\" href=\"<{$menuitem.link}>\"><{$menuitem.title}></a>\n		<{if ($itemnum + 1) <> $headermenucount}>\n		 |\n		<{/if}>\n	<{/foreach}>\n	</div>\n	<div style=\"font-size: 10px; text-align: <{$smarty.const._GLOBAL_RIGHT}>; color: #2F5376; padding: 0 6px; line-height: 18px;float:<{$smarty.const._GLOBAL_RIGHT}>;\">\n		<{$breadcrumb}>\n	</div>\n</div>\n</div>\n<div id=\"buttonbar\">\n	<ul>\n	<{foreach from=$adminmenu key=itemnum item=menuitem}>\n	<{if $itemnum==$current}>\n			<li id=\"current\">\n		<{else}>\n			<li>\n		<{/if}>\n		<a href=\"../<{$menuitem.link}>\"><span><{$menuitem.title}></span></a>\n		</li>\n	<{/foreach}>\n	</ul>\n</div>\n<{if $submenus}>\n	<div id=\"submenuswrap\">\n	<div id=\"submenus\">\n		<{foreach from=$submenus key=itemnum item=submenuitem}>\n			<{if $itemnum==$currentsub}>\n				<div id=\"currentsubitem\"><{$submenuitem.title}>\n			<{else}>\n				<div class=\"subitem\"><a href=\"<{$submenuitem.link}>\"><{$submenuitem.title}></a>\n			<{/if}>\n			<{if ($itemnum + 1) <> $submenuscount}>\n			 |\n			<{/if}>\n			</div>\n		<{/foreach}>\n	</div>\n	</div>\n<{/if}>\n</div> <!-- end wrap -->\n<br style=\"clear: both;\" />'),(37,'<div id=\"icms_rating_container\">\r\n	<div class=\"item\">\r\n		<{if $icms_rated}>\r\n			<div class=\"itemHead\"><b><{$smarty.const._CO_ICMS_RATING_ALREADY_RATED}><{$icms_user_rate}></b></div>\r\n		<{elseif $icms_user_can_rate}>\r\n			<div class=\"itemHead\"><{$smarty.const._CO_ICMS_RATING_RATE_THIS}></div>\r\n			<div class=\"odd\">\r\n				<form name=\'icms_rating_form\' id=\'icms_rating_form\' method=\'post\'>\r\n					<div style=\"float: <{$smarty.const._GLOBAL_LEFT}>;\">\r\n						<input name=\"icms_rating_value\" value=\"1\" type=\"radio\">1\r\n						<input name=\"icms_rating_value\" value=\"2\" type=\"radio\">2\r\n						<input name=\"icms_rating_value\" value=\"3\" type=\"radio\">3\r\n						<input name=\"icms_rating_value\" value=\"4\" type=\"radio\">4\r\n						<input name=\"icms_rating_value\" value=\"5\" type=\"radio\">5\r\n					</div>\r\n					<div style=\"float: <{$smarty.const._GLOBAL_RIGHT}>;\">\r\n						<input name=\"icms_rating_submit\" value=\"<{$smarty.const._CO_ICMS_RATING_RATE_IT}>\" type=\"submit\">\r\n					</div>\r\n				</form>\r\n				<br />\r\n			</div>\r\n\r\n		<{/if}>\r\n		<div class=\"odd\" style=\"display: block;\">\r\n			<div><b><{$smarty.const._CO_ICMS_RATING_VOTERS_TOTAL}></b><{$icms_rating_stats_total}></div>\r\n			<div><b><{$smarty.const._CO_ICMS_RATING_AVERAGE}></b><{$icms_rating_stats_average}></div>\r\n		</div>\r\n\r\n	</div>\r\n</div>'),(38,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/mimetype/images/mimetype_big.png)\"><{$smarty.const._CO_ICMS_MIMETYPES}></div><br />\n\n<{if $icms_mimetype_explain}>\n	<h1><{$smarty.const._CO_ICMS_MIMETYPES_EXPLAIN_TITLE}></h1>\n	<p><{$smarty.const._CO_ICMS_MIMETYPES_EXPLAIN}></p>\n<{/if}>\n\n<p><{$icms_mimetype_title}></p>\n\n<{if $icms_mimetype_table}>\n	<{$icms_mimetype_table}>\n<{/if}>\n\n<{if $addmimetype}>\n	<{includeq file=\'db:system_common_form.html\' form=$addmimetype}>\n<{/if}>'),(39,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/userrank/images/userrank_big.png)\"><{$smarty.const._CO_ICMS_USERRANK}></div><br />\n\n<{if $icms_userrank_explain}>\n	<h1><{$smarty.const._CO_ICMS_USERRANK_EXPLAIN_TITLE}></h1>\n	<p><{$smarty.const._CO_ICMS_USERRANK_EXPLAIN}></p>\n<{/if}>\n\n<p><{$icms_userrank_title}></p>\n\n<{if $icms_userrank_table}>\n	<{$icms_userrank_table}>\n<{/if}>\n\n<{if $adduserrank}>\n	<{includeq file=\'db:system_common_form.html\' form=$adduserrank}>\n<{/if}>'),(40,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$icms_url}>/modules/system/admin/version/images/version_big.png)\"><{$smarty.const._AM_VERSION_TITLE}></div><br />\n\n<div class=\"head\" style=\"padding: 2px; margin-bottom: 5px;\">\n	<strong><{$smarty.const._AM_VERSION_YOUR_VERSION}></strong> <{$installed.version_name}>\n	<strong>Latest Version</strong> <{$latest.version_name}>\n</div>\n\n<{if $update_available == \"1\"}>\n    <div class=\"even\">\n	    <div class=\"errorMsg\">\n	        <strong><{$smarty.const._AM_VERSION_UPDATE_NEEDED}></strong><br />\n	        <br />\n	        <{$smarty.const._AM_VERSION_MOREINFO}><br />\n	        <h2><a href=\"<{$latest.url}>\" rel=\"external\"><{$latest.version_name}></a></h2>\n		<{if $not_a_final_comment}>\n			<div><strong><{$smarty.const._AM_VERSION_WARNING}></strong>: <{$smarty.const._AM_VERSION_WARNING_NOT_A_FINAL}></div>\n		<{/if}>\n	    </div>\n    </div>\n\n    <div class=\"odd\">\n	    <h2><{$latest.version_name}> <{$smarty.const._AM_VERSION_CHANGELOG}></h2>\n   		<p><{$latest.changelog}></p>\n    </div>\n<{elseif $latest_installed == \"1\"}>\n<div class=\"even\">\n	<div class=\"errorMsg\">\n		<strong><{$smarty.const._AM_VERSION_LATEST_VERSION}></strong><br />\n	</div>\n</div>\n<{else}>\n	<div class=\"even\">\n		<{if $errors}>\n			<div class=\"errorMsg\">\n				<{$errors}>\n			</div>\n		<{else}>\n        	<div class=\"successMsg\"><strong><{$smarty.const._AM_VERSION_NO_UPDATE}></strong></div>\n        <{/if}>\n    </div>\n<{/if}>\n<a href=\"#\" onclick =\"jQuery(\'div#system_info\').slideToggle();\" name=\'show_info\'  id=\'show_info\' value=\'\'><{$smarty.const._AM_VERSION_SYSTEM_INFO}></a>\n<div class=\"system_info\" name=\"system_info\" id=\"system_info\" style=\"padding: 2px; margin-bottom: 5px; display: none;\">\n    <table>\n  <tbody>\n    <tr>\n      <td><{$smarty.const._AM_VERSION_PHP_SYSTEM}></td>\n      <td><{$sysinfo.php.version}></td>\n    </tr>\n    <tr>\n      <td><{$smarty.const._AM_VERSION_MYSQL_SYSTEM}></td>\n      <td><{$sysinfo.mysql.version}></td>\n    </tr>\n    <tr>\n      <td><{$smarty.const._AM_VERSION_API_SYSTEM}></td>\n      <td><{$sysinfo.php.api}></td>\n    </tr>\n    <tr>\n      <td><{$smarty.const._AM_VERSION_OP_SYSTEM}></td>\n      <td><{$sysinfo.os.version}></td>\n    </tr>\n    <tr>\n      <td>register_globals</td>\n      <td><{$sysinfo.php.register_globals}></td>\n    </tr>\n    <tr>\n      <td>allow_url_fopen</td>\n      <td><{$sysinfo.php.allow_url_fopen}></td>\n    </tr>\n    <tr>\n      <td>fsockopen</td>\n      <td><{$sysinfo.php.fsockopen}></td>\n    </tr>\n    <tr>\n      <td>allow_call_time_pass_reference</td>\n      <td><{$sysinfo.php.allow_call_time_pass_reference}></td>\n    </tr>\n    <tr>\n      <td>post_max_size</td>\n      <td><{$sysinfo.php.post_max_size}></td>\n    </tr>\n    <tr>\n      <td>max_input_time</td>\n      <td><{$sysinfo.php.max_input_time}></td>\n    </tr>\n    <tr>\n      <td>output_buffering</td>\n      <td><{$sysinfo.php.output_buffering}></td>\n    </tr>\n    <tr>\n      <td>max_execution_time</td>\n      <td><{$sysinfo.php.max_execution_time}></td>\n    </tr>\n    <tr>\n      <td>memory_limit</td>\n      <td><{$sysinfo.php.memory_limit}></td>\n    </tr>\n    <tr>\n      <td>file_uploads</td>\n      <td><{$sysinfo.php.file_uploads}></td>\n    </tr>\n    <tr>\n      <td>upload_max_filesize</td>\n      <td><{$sysinfo.php.upload_max_filesize}></td>\n    </tr>\n  </tbody>\n</table>\n</div>\n'),(41,'<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/autotasks/images/autotasks_big.png)\"><{$smarty.const._MD_AM_AUTOTASKS}></div><br />\n\n<{if $icms_autotasks_table}>\n	<{$icms_autotasks_table}>\n<{else}>\n	<{includeq file=\'db:system_common_form.html\' form=$addautotasks}>\n<{/if}>'),(42,'<script language=\"javascript\" src=\"<{$xoops_url}>/include/linkexternal.js\"></script>\n<img src=\'<{$module_url}><{$module_image}>\' alt=\'<{$module_name}>\' style=\'float: <{$smarty.const._GLOBAL_LEFT}>; margin-right: 10px;\'/></a>\n<div style=\'margin-top: 1px; color: #33538e; margin-bottom: 4px; font-size: 18px; line-height: 18px; font-weight: bold;\'>\n	<{$module_name}> version <{$module_version}><{if $module_status_version}> (<{$module_status_version}>)<{/if}>\n</div>\n\n<div style=\'line-height: 16px; font-weight: bold;\'>\n	<{$smarty.const._MODABOUT_BY}> <{$module_author_name}>\n</div>\n\n<div style = \'line-height: 16px; \'>\n	 <{$module_license}>\n</div>\n\n<{if $module_credits}>\n	<table width=\'100%\' cellspacing=\"1\" cellpadding=\"3\" border=\"0\" class=\"outer\" style=\"margin-top: 15px;\">\n		<tr>\n			<td class=\'bg3\'><b><{$smarty.const._MODABOUT_DEVELOPER_CREDITS}></b></td>\n		</tr>\n\n		<tr>\n			<td class=\'even\'><{$module_credits}></td>\n		</tr>\n	</table>\n<{/if}>\n\n<table width=\'100%\' cellspacing=\"1\" cellpadding=\"3\" border=\"0\" class=\"outer\" style=\"margin-top: 15px;\">\n	<tr>\n		<td colspan=\'2\' class=\'bg3\'>\n			<b><{$smarty.const._MODABOUT_AUTHOR_INFO}></b>\n		</td>\n	</tr>\n\n	<{if $module_developer_lead}>\n		<tr>\n			<td class=\'head\' width = \'150px\'><{$smarty.const._MODABOUT_DEVELOPER_LEAD}></td>\n			<td class=\'even\'><{$module_developer_lead}></td>\n		</tr>\n	<{/if}>\n\n	<{if $module_developer_contributor}>\n		<tr>\n			<td class=\'head\' width = \'150px\'><{$smarty.const._MODABOUT_DEVELOPER_CONTRIBUTOR}></td>\n			<td class=\'even\'><{$module_developer_contributor}></td>\n		</tr>\n	<{/if}>\n\n	<{if $module_people_developers}>\n		<tr>\n			<td class=\'head\' style=\"vertical-align: top;\" width = \'150px\'><{$smarty.const._MODABOUT_PEOPLE_DEVELOPERS}></td>\n			<td class=\'even\'>\n			    <{foreach item=person from=$module_people_developers}>\n			    	<div><{$person}></div>\n			    <{/foreach}>\n			</td>\n		</tr>\n	<{/if}>\n\n	<{if $module_people_testers}>\n		<tr>\n			<td class=\'head\' style=\"vertical-align: top;\" width = \'150px\'><{$smarty.const._MODABOUT_PEOPLE_TESTERS}></td>\n			<td class=\'even\'>\n			    <{foreach item=person from=$module_people_testers}>\n			    	<div><{$person}></div>\n			    <{/foreach}>\n			</td>\n		</tr>\n	<{/if}>\n\n	<{if $module_people_translators}>\n		<tr>\n			<td class=\'head\' style=\"vertical-align: top;\" width = \'150px\'><{$smarty.const._MODABOUT_PEOPLE_TRANSLATERS}></td>\n			<td class=\'even\'>\n			    <{foreach item=person from=$module_people_translators}>\n			    	<div><{$person}></div>\n			    <{/foreach}>\n			</td>\n		</tr>\n	<{/if}>\n\n	<{if $module_people_documenters}>\n		<tr>\n			<td class=\'head\' style=\"vertical-align: top;\" width = \'150px\'><{$smarty.const._MODABOUT_PEOPLE_DOCUMENTERS}></td>\n			<td class=\'even\'>\n			    <{foreach item=person from=$module_people_documenters}>\n			    	<div><{$person}></div>\n			    <{/foreach}>\n			</td>\n		</tr>\n	<{/if}>\n\n	<{if $module_people_other}>\n		<tr>\n			<td class=\'head\' style=\"vertical-align: top;\" width = \'150px\'><{$smarty.const._MODABOUT_PEOPLE_OTHER}></td>\n			<td class=\'even\'>\n			    <{foreach item=person from=$module_people_other}>\n			    	<div><{$person}></div>\n			    <{/foreach}>\n			</td>\n		</tr>\n	<{/if}>\n\n	<{if $module_developer_website_url}>\n		<tr>\n			<td class=\'head\' width = \'150px\'><{$smarty.const._MODABOUT_DEVELOPER_WEBSITE}></td>\n			<td class=\'even\'><a href=\"<{$module_developer_website_url}>\" rel=\"external\"><{$module_developer_website_name}></a></td>\n		</tr>\n	<{/if}>\n\n	<{if $module_developer_email}>\n		<tr>\n			<td class=\'head\' width = \'150px\'><{$smarty.const._MODABOUT_DEVELOPER_EMAIL}></td>\n			<td class=\'even\'><a href=\"mailto:<{$module_developer_email}>\" rel=\"external\"><{$module_developer_email}></a></td>\n		</tr>\n	<{/if}>\n</table>\n\n<table width=\'100%\' cellspacing=\"1\" cellpadding=\"3\" border=\"0\" class=\"outer\" style=\"margin-top: 15px;\">\n	<tr>\n		<td colspan=\'2\' class=\'bg3\'><b><{$smarty.const._MODABOUT_MODULE_INFO}></b></td>\n	</tr>\n\n	<tr>\n		<td class=\'head\' width = \'200px\'><{$smarty.const._MODABOUT_MODULE_RELEASE_DATE}></td>\n		<td class=\'even\'><{$module_date}></td>\n	</tr>\n\n	<tr>\n		<td class=\'head\' width = \'200px\'><{$smarty.const._MODABOUT_MODULE_STATUS}></td>\n		<td class=\'even\'><{$module_status}></td>\n	</tr>\n\n	<{if $module_demo_site_name}>\n		<tr>\n			<td class=\'head\' width = \'200px\'><{$smarty.const._MODABOUT_MODULE_DEMO}></td>\n			<td class=\'even\'><a href=\"<{$module_developer_demo_site_url}>\" rel=\"external\"><{$module_demo_site_name}></a></td>\n		</tr>\n	<{/if}>\n\n	<{if $module_support_site_name}>\n		<tr>\n			<td class=\'head\' width = \'200px\'><{$smarty.const._MODABOUT_MODULE_SUPPORT}></td>\n			<td class=\'even\'><a href=\"<{$module_support_site_url}>\" rel=\"external\"><{$module_support_site_name}></a></td>\n		</tr>\n	<{/if}>\n\n	<{if $module_submit_bug}>\n		<tr>\n			<td class=\'head\' width = \'200px\'><{$smarty.const._MODABOUT_MODULE_BUG}></td>\n			<td class=\'even\'><a href=\"<{$module_submit_bug}>\" rel=\"external\"><{$smarty.const._MODABOUT_MODULE_SUBMIT_BUG}></a></td>\n		</tr>\n	<{/if}>\n\n	<{if $module_submit_feature}>\n		<tr>\n			<td class=\'head\' width = \'200px\'><{$smarty.const._MODABOUT_MODULE_FEATURE}></td>\n			<td class=\'even\'><a href=\"<{$module_submit_feature}>\" rel=\"external\"><{$smarty.const._MODABOUT_MODULE_SUBMIT_FEATURE}></a></td>\n		</tr>\n	<{/if}>\n</table>\n\n<{if $module_manual}>\n<table width=\'100%\' cellspacing=\"1\" cellpadding=\"3\" border=\"0\" class=\"outer\" style=\"margin-top: 15px;\">\n	<tr>\n		<td colspan=\'2\' class=\'bg3\'><b><{$smarty.const._MODABOUT_MANUAL}></b></td>\n	</tr>\n		<tr>\n			<td class=\'head\' style=\"vertical-align: top;\" width = \'150px\'><{$smarty.const._MODABOUT_MANUAL_WIKI}></td>\n			<td class=\'even\'>\n				<{foreach item=manual from=$module_manual}>\n					<div><{$manual}></div>\n				<{/foreach}>\n			</td>\n		</tr>	\n</table>\n<{/if}>\n\n<{if $module_warning}>\n	<table width=\'100%\' cellspacing=\"1\" cellpadding=\"3\" border=\"0\" class=\"outer\" style=\"margin-top: 15px;\">\n		<tr>\n			<td class=\'bg3\'><b><{$smarty.const._MODABOUT_MODULE_DISCLAIMER}></b></td>\n		</tr>\n\n		<tr>\n			<td class=\'even\'><{$module_warning}></td>\n		</tr>\n	</table>\n<{/if}>\n\n<{if $module_author_word}>\n	<table width=\'100%\' cellspacing=\"1\" cellpadding=\"3\" border=\"0\" class=\"outer\" style=\"margin-top: 15px;\">\n		<tr>\n			<td class=\'bg3\'><b><{$smarty.const._MODABOUT_AUTHOR_WORD}></b></td>\n		</tr>\n\n		<tr>\n			<td class=\'even\'><{$module_author_word}></td>\n		</tr>\n	</table>\n<{/if}>\n\n<{if $module_version_history}>\n	<table width=\'100%\' cellspacing=\"1\" cellpadding=\"3\" border=\"0\" class=\"outer\" style=\"margin-top: 15px;\">\n		<tr>\n			<td class=\'bg3\'><b><{$smarty.const._MODABOUT_VERSION_HISTORY}></b></td>\n		</tr>\n\n		<tr>\n			<td class=\'even\'>\n				<div style=\'overflow-y: auto; height: 250px; line-height: 18px;\'><{$module_version_history}></div>\n			</td>\n		</tr>\n	</table>\n<{/if}>\n\n<{if $module_license_txt}>\n<table width=\'100%\' cellspacing=\"1\" cellpadding=\"3\" border=\"0\" class=\"outer\" style=\"margin-top: 15px;\">\n	<tr>\n		<td class=\'bg3\'><b><{$smarty.const._MODABOUT_MODULE_LICENSE}></b></td>\n	</tr>\n\n	<tr>\n		<td class=\'even\'>\n			<div style=\'overflow-y: auto; height: 250px; line-height: 18px;\'><{$module_license_txt}></div>\n		</td>\n	</tr>\n</table>\n<{/if}>\n'),(43,'<div id=\"clone_image<{$i}>\" class=\"opt_divs\" style=\"display:none; padding:5px; margin:5px;\">\n  <form id=\"clone_form<{$i}>\" action=\"<{if $type == \"tiny\"}>xoopsimagebrowser.php<{else}>browser.php<{/if}>\" method=\"post\">\n    <table width=\"100%\" cellspacing=\"1\" class=\"outer\">\n      <tr><th colspan=\"2\"><{$lang_imanager_cat_clone}></th></tr>\n      <tr>\n	    <td class=\"head\"><{$lang_image_name}></td>\n	    <td class=\"odd\"><input type=\"text\" name=\"image_nicename\" id=\"name<{$i}>\" size=20 value=\"<{$smarty.const._MD_IMAGE_COPYOF}><{$image.nicename}>\"></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_weight}></td>\n	    <td class=\"odd\"><input type=\"text\" name=\"image_weight\" size=\"5\" value=\"0\"></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_disp}></td>\n	    <td class=\"odd\">\n	      <{$lang_yes}> <input type=\"radio\" name=\"image_display\" value=\"1\" checked /> \n	  	  <{$lang_no}> <input type=\"radio\" name=\"image_display\" value=\"0\" />\n  	    </td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\" colspan=\"2\" align=\"center\">\n	      <input type=\"submit\" name=\"submit\" value=\"<{$lang_submit}>\" /> \n	      <input type=\"button\" name=\"btn\" value=\"<{$lang_cancel}>\" onclick=\"document.getElementById(\'clone_image<{$i}>\').style.display = \'none\'; return false;\" />\n	    </td>\n      </tr>\n    </table>\n    <input type=\"hidden\" name=\"image_id\" value=\"<{$image.id}>\" />\n    <input type=\"hidden\" name=\"imgcat_id\" value=\"<{$image.categ_id}>\" />\n    <input type=\"hidden\" name=\"op\" value=\"cloneimg\" />\n    <input type=\"hidden\" name=\"target\" value=\"<{$target}>\" />\n    <input type=\"hidden\" name=\"type\" value=\"<{$type}>\" />\n    <{$image.clone_token}>\n  </form>\n</div>\n<a name=\"clone_image<{$i}>\"></a>'),(44,'<div id=\"edit_image<{$i}>\" class=\"opt_divs\" style=\"display:none; padding:5px; margin:5px;\">\n  <form action=\"<{if $type == \"tiny\"}>xoopsimagebrowser.php<{else}>browser.php<{/if}>\" method=\"post\">\n    <table width=\"100%\" cellspacing=\"1\" class=\"outer\">\n      <tr><th colspan=\"2\"><{$lang_imanager_cat_edit}></th></tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_name}></td>\n	    <td class=\"even\"><input type=\"text\" name=\"image_nicename[]\" id=\"name<{$i}>\" value=\"<{$image.nicename}>\" size=\"20\" maxlength=\"255\" /></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_mimetype}></td>\n	    <td class=\"odd\"><{$image.mimetype}></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_cat}></td>\n	    <td class=\"even\"><select name=\"imgcat_id[]\" size=\"1\"><{$image.ed_selcat_options}></select></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_weight}></td>\n	    <td class=\"odd\"><input type=\"text\" name=\"image_weight[]\" value=\"<{$image.weight}>\" size=\"3\" maxlength=\"4\" /></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\"><{$lang_image_disp}></td>\n	    <td class=\"even\"><input type=\"checkbox\" name=\"image_display[]\" value=\"1\"<{if $image.display == 1}> checked=\"checked\"<{/if}> /></td>\n	  </tr>\n	  <tr>\n	    <td class=\"head\" colspan=\"2\" align=\"center\">\n	     <input type=\"submit\" name=\"submit\" value=\"<{$lang_submit}>\" /> \n	     <input type=\"button\" name=\"btn\" value=\"<{$lang_cancel}>\" onclick=\"document.getElementById(\'edit_image<{$i}>\').style.display=\'none\'; return false;\" />\n	    </td>\n	  </tr>\n    </table>\n	<input type=\"hidden\" name=\"image_id[]\" value=\"<{$i}>\" />\n	<input type=\"hidden\" name=\"op\" value=\"save\" />\n	<input type=\"hidden\" name=\"redir\" value=\"<{$cat_id}>\" />\n	<input type=\"hidden\" name=\"target\" value=\"<{$target}>\" />\n	<input type=\"hidden\" name=\"type\" value=\"<{$type}>\" />\n	<{$image.ed_token}>\n  </form>\n</div>\n<a name=\"edit_image<{$i}>\"></a>'),(45,'<div id=\"img<{$i}>\" class=\"imanager_image_box\">\n  <span class=\"imanager_image_img\"><img src=\"<{$image.src}>\" title=\"<{$image.nicename}>\" /></span>\n  <span class=\"imanager_image_label\"><{$image.display_nicename}></span>\n  <span class=\"imanager_image_info\">\n    <b><{$smarty.const.IMANAGER_FILE}>:</b> <{$image.name}><br />\n    <b><{$smarty.const.IMANAGER_SIZE}>:</b> <{$image.size}><br />\n    <b><{$smarty.const.IMANAGER_WIDTH}>:</b> <{$image.width}>px<br />\n    <b><{$smarty.const.IMANAGER_HEIGHT}>:</b> <{$image.height}>px\n  </span>\n  <span class=\"imanager_image_btns\">\n    <{$image.preview_link}>\n    <a href=\"#\" onclick=\"showDiv(\'edit_image\',<{$i}>); document.anchors.item(\'edit_image<{$i}>\').scrollIntoView(); return false;\" title=\"<{$lang_imanager_cat_edit}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/edit.png\" alt=\"<{$lang_imanager_cat_edit}>\" /></a>\n    <a href=\"#\" onclick=\"showDiv(\'clone_image\',<{$i}>); document.anchors.item(\'clone_image<{$i}>\').scrollIntoView(); return false;\" title=\"<{$lang_imanager_cat_clone}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/editcopy.png\" alt=\"<{$lang_imanager_cat_clone}>\" /></a>\n    <{if $image.hasextra_link}>\n      <a href=\"#\" onclick=\"<{$image.editor_link}>\" title=\"<{$lang_imanager_img_editor}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/edit_picture.png\" alt=\"<{$lang_imanager_img_editor}>\"/></a>\n    <{/if}>\n    <a href=\"?op=delfile&amp;image_id=<{$i}>&imgcat_id=<{$image.categ_id}>&target=<{$target}>&type=<{$type}>\" title=\"<{$smarty.const._DELETE}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/editdelete.png\" alt=\"<{$smarty.const._DELETE}>\" /></a>\n    <{if $type == \"ibrow\"}>\n      <a href=\"javascript:void(0)\" onclick=\"addItem(\'<{$image.url_src}>\', \'<{$image.nicename}>\', \'<{$target}>\', \'<{$image.categ_id}>\', \'<{$xoops_url}>\')\" title=\"<{$lang_select}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/wizard.png\" alt=\"<{$lang_select}>\" /></a>\n    <{elseif $type == \"iman\"}>\n      <a href=\"javascript:void(0)\" onclick=\"changeDisplay(\'selimage_<{$i}>\'); return false;\" title=\"<{$lang_select}>\">\n        <img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/wizard.png\" alt=\"<{$lang_select}>\" />\n        <div id=\"selimage_<{$i}>\" class=\"ed_block_box\" align=\"center\" style=\"width:72px;\">\n          <a href=\"#\" onclick=\"javascript:appendCode(\'<{$image.lcode}>\',\'<{$target}>\');\"><img src=\"<{$xoops_url}>/images/alignleft.gif\" alt=\"Left\" /></a>\n          <a href=\"#\" onclick=\"javascript:appendCode(\'<{$image.code}>\',\'<{$target}>\');\"><img src=\"<{$xoops_url}>/images/aligncenter.gif\" alt=\"Center\" /></a>\n          <a href=\"#\" onclick=\"javascript:appendCode(\'<{$image.rcode}>\',\'<{$target}>\');\"><img src=\"<{$xoops_url}>/images/alignright.gif\" alt=\"Right\" /></a>\n        </div>\n      </a>\n    <{elseif $type == \"tiny\"}>\n      <a href=\"javascript:void(0)\" onclick=\"addItem(\'<{$image.src}>\', \'<{$image.nicename}>\', \'<{$target}>\', \'<{$image.categ_id}>\', \'<{$xoops_url}>\', \'tiny\')\" title=\"<{$lang_select}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/wizard.png\" alt=\"<{$lang_select}>\" /></a>\n    <{/if}>\n  </span>\n</div>'),(46,'<script type=\"text/javascript\" src=\"<{$xoops_url}>/modules/system/admin/images/js/imanager.js\"></script>\n<script type=\"text/javascript\">\n  var Filters=new Array();\n  <{foreach from=$filters item=filter key=key}>\n    var filter = new Array();\n    filter[\'title\'] = \'<{$filter.title}>\';\n    filter[\'value\'] = \'<{$filter.value}>\';\n    filter[\'descr\'] = \'<{$filter.descr}>\';\n    var args = new Array();\n    <{foreach from=$filter.args item=arg key=key1}>\n      var arg = new Array();\n      arg[\'title\'] = \'<{$arg.title}>\';\n      arg[\'value\'] = \'<{$arg.value}>\';\n      arg[\'descr\'] = \'<{$arg.descr}>\';\n      args[<{$key1}>] = arg;\n    <{/foreach}>\n    filter[\'args\'] = args;\n    Filters[<{$key}>] = filter;\n  <{/foreach}>\n</script>\n<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/images/images/images_big.png)\"><{$lang_imanager_title}></div><br />\n<p style=\"margin-top:0;\"><{$admnav}></p>\n<table width=\"100%\" celpadding=\"0\" cellspacing=\"1\" class=\"outer\">\n  <tr>\n    <th align=\"center\"><{$lang_imanager_catmsize}></th>\n    <th align=\"center\"><{$lang_imanager_catmwidth}></th>\n    <th align=\"center\"><{$lang_imanager_catmheight}></th>\n    <th align=\"center\" width=\"5%\"><{$lang_imanager_catsubs}></th>\n    <th align=\"center\"><{$lang_imanager_catqtde}></th>\n    <th align=\"center\"><{$lang_imanager_catoptions}></th>\n  </tr>\n  <tr class=\"odd\">\n    <td align=\"center\"><{$cat_maxsize}></td>\n    <td align=\"center\"><{$cat_maxwidth}>px</td>\n    <td align=\"center\"><{$cat_maxheight}>px</td>\n    <td align=\"center\">\n    <{if $cat_subs > 0}>\n      <{$cat_subs}> <a href=\"?op=list&imgcat_id=<{$cat_id}>&target=<{$target}>&type=<{$type}>\" title=\"<{$smarty.const._MD_IMAGE_VIEWSUBS}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/filefind.png\" align=\"absmiddle\" alt=\"<{$smarty.const._MD_IMAGE_VIEWSUBS}>\" /></a>\n    <{else}>\n      <{$cat_subs}>\n    <{/if}>\n    </td>\n    <td align=\"center\"><{$imgcount}><{if $simgcount > 0}> (+<{$simgcount}>)<{/if}></td>\n    <td align=\"center\">\n      <a href=\"#\" onclick=\"showDiv(\'addimgform\',\'\'); document.anchors.item(\'addimgform\').scrollIntoView(); return false;\" title=\"<{$lang_imanager_cat_addimg}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/filenew2.png\" alt=\"<{$lang_imanager_cat_addimg}>\" /></a>\n    </td>\n  </tr>\n</table>\n<div style=\"border: 2px solid #C2CDD6; padding: 5px; vertical-align: middle; background-color: #E6E6E6; width:55%; float:right; margin-top:5px;\" align=\"right\">\n    <form action=\"<{if $type == \"tiny\"}>xoopsimagebrowser.php<{else}>browser.php<{/if}>?op=listimg&imgcat_id=<{$cat_id}>&target=<{$target}>&type=<{$type}>\" method=\"POST\">\n    <b><{$lang_search_title}>:</b>\n    <input type=\"text\" name=\"query\" id=\"query\" size=\"20\" value=\"<{$query}>\" style=\"min-width:280px;\" />\n    <input type=\"submit\" name=\"btn\" value=\"<{$lang_search}>\" />\n    <input type=\"submit\" name=\"btn1\" value=\"<{$lang_cancel}>\" onclick=\"document.getElementById(\'query\').value=\'\';\" />\n  </form>\n</div>\n<br style=\"clear:right;\" />\n<{foreach from=$images item=image key=key}>\n  <{include file=\"$icms_root_path/modules/system/templates/system_popup_imagemanager_img.html\" image=$image i=$key}>\n<{/foreach}>\n<br style=\"clear:both;\" />\n<{foreach from=$images item=image key=key}>\n  <{include file=\"$icms_root_path/modules/system/templates/system_popup_imagemanager_editimg.html\" image=$image i=$key}>\n  <{include file=\"$icms_root_path/modules/system/templates/system_popup_imagemanager_cloneimg.html\" image=$image i=$key}>\n<{/foreach}>\n<div id=\"addimgform\" class=\"opt_divs\" style=\"display:none; padding:5px; margin:5px;\"><{$addimgform}></div>\n<a name=\"addimgform\"></a>\n<{$pag}>'),(47,'<script type=\"text/javascript\" src=\"<{$xoops_url}>/modules/system/admin/images/js/imanager.js\"></script>\n<script type=\"text/javascript\">window.moveTo(screen.availWidth/2-492,screen.availHeight/2-235);</script>\n<div class=\"CPbigTitle\" style=\"background-image: url(<{$xoops_url}>/modules/system/admin/images/images/images_big.png)\"><{$lang_imanager_title}></div><br />\n<p style=\"margin-top:0;\"><{$admnav}></p>\n<{if $catcount > 0}>\n<div align=\"right\">\n  <{if $isAdmin}>\n    <input type=\"button\" onclick=\"showDiv(\'addcatform\'); document.anchors.item(\'addcatform\').scrollIntoView(); return false;\" value=\"<{$lang_imanager_cat_addnewcat}>\" />\n  <{/if}>\n  <{if $writecatcount > 0}>\n    <input type=\"button\" onclick=\"showDiv(\'addimgform\'); document.anchors.item(\'addimgform\').scrollIntoView(); return false;\" value=\"<{$lang_imanager_cat_addnewimg}>\" />\n  <{/if}>\n</div>\n<form method=\"post\">\n  <table width=\"100%\" celpadding=\"0\" cellspacing=\"1\" class=\"outer\">\n    <tr>\n      <th align=\"center\" width=\"20%\"><{$lang_imanager_catname}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catmsize}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catmwidth}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catmheight}></th>\n      <th align=\"center\" width=\"5%\"><{$lang_imanager_catsubs}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catqtde}></th>\n      <th align=\"center\" width=\"10%\"><{$lang_imanager_catoptions}></th>\n    </tr>\n    <{section name=i loop=$imagecategorys}>\n      <tr class=\"<{cycle values=\"odd,even\"}>\" align=\"center\">\n        <td align=\"left\"><{$imagecategorys[i]->getVar(\'imgcat_name\')}></td>\n        <td><{$msize[i]}></td>\n        <td><{$imagecategorys[i]->getVar(\'imgcat_maxwidth\')}>px</td>\n        <td><{$imagecategorys[i]->getVar(\'imgcat_maxheight\')}>px</td>\n        <td>\n          <{if $subs[i] > 0}>\n            <{$subs[i]}> <a href=\"?op=list&imgcat_id=<{$imagecategorys[i]->getVar(\'imgcat_id\')}>&target=<{$target}>&type=<{$type}>\" title=\"<{$smarty.const._MD_IMAGE_VIEWSUBS}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/filefind.png\" align=\"absmiddle\" alt=\"<{$smarty.const._MD_IMAGE_VIEWSUBS}>\" /></a>\n          <{else}>\n            <{$subs[i]}>\n          <{/if}>\n        </td>\n        <td><{$count[i]}><{if $scount[i] > 0}> (+<{$scount[i]}>)<{/if}></td>\n        <td>\n          <{if $count[i] > 0}>\n            <a href=\"?op=listimg&amp;imgcat_id=<{$imagecategorys[i]->getVar(\'imgcat_id\')}>&target=<{$target}>&type=<{$type}>\" title=\"<{$lang_imanager_cat_listimg}>\"><img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/viewmag.png\" alt=\"<{$lang_imanager_cat_listimg}>\" /></a>\n          <{else}>\n            <img src=\"<{$smarty.const.ICMS_IMAGES_SET_URL}>/actions/encrypted.png\" alt=\"\" />\n          <{/if}>\n        </td>\n      </tr>\n      <tr id=\"line<{$imagecategorys[i]->getVar(\'imgcat_id\')}>\" style=\"display:none;\">\n        <td class=\"head\" width=\"2%\"></td>\n        <td colspan=\"7\" style=\"padding:0; margin:0;\">\n          <div id=\"cat<{$imagecategorys[i]->getVar(\'imgcat_id\')}>\"></div>\n        </td>  \n      </tr>\n    <{/section}>\n  </table>\n  <input type=\"hidden\" name=\"op\" value=\"reordercateg\" />\n  <{$token}>\n</form>\n<div align=\"right\">\n  <{if $isAdmin}>\n    <input type=\"button\" onclick=\"showDiv(\'addcatform\'); document.anchors.item(\'addcatform\').scrollIntoView(); return false;\" value=\"<{$lang_imanager_cat_addnewcat}>\" />\n  <{/if}>\n  <{if $writecatcount > 0}>\n    <input type=\"button\" onclick=\"showDiv(\'addimgform\'); document.anchors.item(\'addimgform\').scrollIntoView(); return false;\" value=\"<{$lang_imanager_cat_addnewimg}>\" />\n  <{/if}>\n</div>\n<{/if}>\n<div id=\"addimgform\" class=\"opt_divs\" style=\"display:none; margin:5px; padding:5px;\"><{$addimgform}></div>\n<a name=\"addimgform\"></a>\n<div id=\"addcatform\" class=\"opt_divs\" style=\"<{if $catcount > 0}>display:none;<{else}>display:block;<{/if}> margin:5px; padding:5px;\"><{$addcatform}></div>\n<a name=\"addcatform\"></a>'),(48,'<input type=\'<{$type}>\' class=\'formButton\' name=\'<{$name}>\'  id=\'<{$name}>\' value=\'<{$value}>\' <{$extra}> />'),(49,'<div class=\"grouped\">\n	<{if $ele_checkbox_options}>\n		<{* Use the new unified structure if available *}>\n		<{foreach from=$ele_checkbox_options item=option name=checkbox}>\n		<span class=\"icms_checkboxoption\">\n			<input type=\"checkbox\" name=\"<{$ele_name}>\" id=\"<{$ele_id}>_<{$option.value}>\" value=\"<{$option.value}>\" <{if $option.checked}>checked=\"checked\"<{/if}> <{$ele_extra}> />\n			<label for=\"<{$ele_id}>_<{$option.value}>\"><{$option.label}></label>\n		</span>\n		<{if !$smarty.foreach.checkbox.last}><{$ele_delimeter}><{/if}>\n		<{/foreach}>\n	<{else}>\n		<{* Fallback to legacy structure for backward compatibility *}>\n		<{foreach from=$ele_options key=value item=label name=checkbox}>\n		<span class=\"icms_checkboxoption\">\n			<input type=\"checkbox\" name=\"<{$ele_name}>\" id=\"<{$ele_id}>_<{$value}>\" value=\"<{$value}>\" <{if $ele_value && in_array($value, $ele_value)}>checked=\"checked\"<{/if}> <{$ele_extra}> />\n			<label for=\"<{$ele_id}>_<{$value}>\"><{$label}></label>\n		</span>\n		<{if !$smarty.foreach.checkbox.last}><{$ele_delimeter}><{/if}>\n		<{/foreach}>\n	<{/if}>\n\n	<{* Check All functionality - show if more than one option *}>\n	<{assign var=\"option_count\" value=0}>\n	<{if $ele_checkbox_options}>\n		<{assign var=\"option_count\" value=$ele_checkbox_options|@count}>\n	<{elseif $ele_options}>\n		<{assign var=\"option_count\" value=$ele_options|@count}>\n	<{/if}>\n	<{if $option_count gt 1}>\n	<div class=\'icms_checkboxoption\'>\n		<input type=\'checkbox\' id=\'<{$ele_name}>_checkemall\' class=\'checkemall\' />\n		<label for=\'<{$ele_name}>_checkemall\'><{$smarty.const._CHECKALL}></label>\n	</div>\n	<{/if}>\n</div>'),(50,'<input type=\"text\" name=\"<{$ele_name}>\" id=\"<{$ele_name}>\" size=\"<{$ele_size}>\" maxlength=\"<{$ele_maxlength}>\" value=\"<{$ele_value}>\" <{$ele_extra}> />\n'),(51,'<input type=\"password\" name=\"<{$ele_name}>\"  id=\"<{$ele_name}>\" size=\"<{$ele_size}>\" maxlength=\"<{$ele_maxlength}>\" value=\"<{$ele_value}>\" <{$ele_extra}> <{if $ele_autocomplete != \"\"}><{$ele_autocomplete}><{/if}> />'),(52,'<{* Template for IPF password tray form element display *}>\n<{* This template creates dual password fields for password confirmation *}>\n\n<div class=\"password-tray\">\n    <{* First password field (from tray elements) *}>\n    <{if $tray_elements}>\n        <{foreach from=$tray_elements item=element}>\n            <{$element}>\n            <{if !$smarty.foreach.default.last}><{$tray_delimeter}><{/if}>\n        <{/foreach}>\n    <{/if}>\n    \n    <{* Second password field (confirmation) *}>\n    <{if $second_password_field}>\n        <{$tray_delimeter}>\n        <{$second_password_field}>\n    <{/if}>\n</div>\n'),(53,'<div id=\"usermenu\">\r\n      <{if $xoops_isadmin}>\r\n        <a class=\"menuTop\" href=\"<{$xoops_url}>/admin.php\" title=\"<{$block.lang_adminmenu}>\"><{$block.lang_adminmenu}></a>\r\n	    <a href=\"<{$xoops_url}>/user.php\" title=\"<{$block.lang_youraccount}>\"><{$block.lang_youraccount}></a>\r\n      <{else}>\r\n		<a class=\"menuTop\" href=\"<{$xoops_url}>/user.php\"title=\"<{$block.lang_youraccount}>\"><{$block.lang_youraccount}></a>\r\n      <{/if}>\r\n      <a href=\"<{$xoops_url}>/notifications.php\" title=\"<{$block.lang_notifications}>\"><{$block.lang_notifications}></a>\r\n      <{if $block.new_messages > 0}>\r\n        <a class=\"highlight\" href=\"<{$xoops_url}>/viewpmsg.php\" title=\"<{$block.lang_inbox}>\"><{$block.lang_inbox}> (<span style=\"color:#ff0000; font-weight: bold;\"><{$block.new_messages}></span>)</a>\r\n      <{else}>\r\n        <a href=\"<{$xoops_url}>/viewpmsg.php\" title=\"<{$block.lang_inbox}>\"><{$block.lang_inbox}></a>\r\n      <{/if}>\r\n      <a href=\"<{$xoops_url}>/user.php?op=logout\" title=\"<{$block.lang_logout}>\"><{$block.lang_logout}></a>\r\n</div>\r\n'),(54,'<div id=\"block_login_form\">\n  <form style=\"margin-top: 0px;\" action=\"<{$xoops_url}>/user.php\" method=\"post\">\n    <p><{$block.lang_username}></p>\n    <div><input type=\"text\" class=\"uname\" name=\"uname\" size=\"12\" value=\"<{$block.unamevalue}>\" maxlength=\"25\" /><br /></div>\n    <p><{$block.lang_password}></p>\n    <div><input type=\"password\" name=\"pass\" size=\"12\" maxlength=\"32\" /><br /></div>\n    <{if $block.rememberme }>\n    <div><input type=\"checkbox\" name=\"rememberme\" value=\"On\" /><{$block.lang_rememberme}><br /></div>\n    <{/if}>\n    <div><input type=\"hidden\" name=\"xoops_redirect\" value=\"<{$xoops_requesturi}>\" /></div>\n    <div><input type=\"hidden\" name=\"op\" value=\"login\" /></div>\n    <div><input type=\"submit\" value=\"<{$block.lang_login}>\" /><br /></div>\n    <{$block.sslloginlink}>\n  </form>\n</div>\n<br />\n<a href=\"<{$xoops_url}>/user.php#lost\" title=\"<{$block.lang_lostpass}>\"><{$block.lang_lostpass}></a>\n<{if $block.registration }>\n<br />\n<a href=\"<{$xoops_url}>/register.php\" title=\"<{$block.lang_registernow}>\"><{$block.lang_registernow}></a>\n<{/if}>\n'),(55,'<form style=\"margin-top: 0px;\" action=\"<{$xoops_url}>/search.php\" method=\"get\">\r\n  <div><input type=\"text\" name=\"query\" size=\"14\" /><input type=\"hidden\" name=\"action\" value=\"results\" /><br /><input type=\"submit\" value=\"<{$block.lang_search}>\" /></div>\r\n</form>\r\n<a href=\"<{$xoops_url}>/search.php\" title=\"<{$block.lang_advsearch}>\"><{$block.lang_advsearch}></a>'),(56,'<{foreach item=module from=$block.modules}>\r\n<strong><{$module.name}></strong>\r\n<ul>\r\n  <{foreach item=pending from=$module.pending}>\r\n  <li>\r\n    <a href=\"<{$pending.adminlink}>\"><{$pending.lang_linkname}></a>:\r\n\r\n    <{if $pending.pendingnum}>\r\n      <span style=\'font-weight:bold;color:#ff0000;\'><{$pending.pendingnum}></span>\r\n    <{else}>\r\n      <{$pending.pendingnum}>\r\n    <{/if}>\r\n  </li>\r\n  <{/foreach}>\r\n</ul>\r\n<{/foreach}>\r\n'),(57,'<div id=\"mainmenu\">\r\n      <a class=\"menuTop<{if $xoops_dirname==\'system\'}> actlink<{/if}>\" href=\"<{$xoops_url}>/\" title=\"<{$block.lang_home}>\"><{$block.lang_home}></a>\r\n      <!-- start module menu loop -->\r\n      <{foreach item=module from=$block.modules}>\r\n      <a class=\"menuMain<{if $xoops_dirname==$module.directory}> actlink<{/if}>\" href=\"<{$xoops_url}>/modules/<{$module.directory}>/\" title=\"<{$module.name}>\"><{$module.name}></a>\r\n        <{foreach item=sublink from=$module.sublinks}>\r\n          <a class=\"menuSub\" href=\"<{$sublink.url}>\" title=\"<{$sublink.name}>\"><{$sublink.name}></a>\r\n        <{/foreach}>\r\n      <{/foreach}>\r\n      <!-- end module menu loop -->\r\n	  <{if $block.priv_enabled == true}>\r\n		  <a class=\"menuMain<{if $xoops_dirname==\'system\'}> actlink<{/if}>\" href=\"<{$xoops_url}>/privpolicy.php\" title=\"<{$block.lang_privpolicy}>\"><{$block.lang_privpolicy}></a>\r\n	  <{/if}>\r\n</div>'),(58,'  <{if $block.showgroups == true}>\r\n    <div class=\"outer\">\r\n  <!-- start group loop -->\r\n  <{foreach item=group from=$block.groups}>\r\n  <div style=\"text-align:center;\"><strong><{$group.name}></strong></div>\r\n  <div class=\"clear\"></div>\r\n\r\n  <!-- start group member loop -->\r\n  <{foreach item=user from=$group.users}>\r\n  <div class=\"<{cycle values=\"even,odd\"}>\" style=\"margin: 0 auto; text-align:center;\"><img src=\"<{$user.avatar}>\" alt=\"<{$user.name}>\'s avatar\" width=\"32px\" /><br /><a href=\"<{$xoops_url}>/userinfo.php?uid=<{$user.id}>\" title=\"<{$user.name}>\"><{$user.name}></a>&nbsp;<{$user.msglink}></div>\r\n   <div class=\"clear\"></div>\r\n  <{/foreach}>\r\n  <!-- end group member loop -->\r\n\r\n  <{/foreach}>\r\n  <!-- end group loop -->\r\n</div>\r\n<{/if}>\r\n  <div class=\"clear\"></div>\r\n\r\n<div style=\"margin: 3px; text-align:center;\">\r\n  <img src=\"<{$block.logourl}>\" alt=\"<{$xoops_sitename}>\" /><br /><{$block.recommendlink}>\r\n</div>\r\n'),(59,'<{$block.online_total}><br /><br /><{$block.lang_members}>: <{$block.online_members}><br /><{$block.lang_guests}>: <{$block.online_guests}><br /><br /><{$block.online_names}> <a href=\"javascript:openWithSelfMain(\'<{$xoops_url}>/misc.php?action=showpopups&amp;type=online\',\'Online\',420,350);\" title=\"<{$block.lang_more}>\"><{$block.lang_more}></a>'),(60,'<table cellspacing=\"1px\" class=\"outer\">\r\n  <{foreach item=user from=$block.users}>\r\n  <tr class=\"<{cycle values=\"even,odd\"}>\" valign=\"middle\">\r\n    <td align=\"center\">\r\n      <{if $user.avatar != \"\"}>\r\n      <img src=\"<{$user.avatar}>\" alt=\"<{$user.name}>\'s avatar\" width=\"32px\" /><br />\r\n      <{/if}>\r\n      <a href=\"<{$xoops_url}>/userinfo.php?uid=<{$user.id}>\" title=\"<{$user.name}>\"><{$user.name}></a>\r\n    </td>\r\n    <td align=\"center\"><{$user.posts}></td>\r\n  </tr>\r\n  <{/foreach}>\r\n</table>\r\n'),(61,'<table cellspacing=\"1px\" class=\"outer\">\r\n  <{foreach item=user from=$block.users}>\r\n  <tr class=\"<{cycle values=\"even,odd\"}>\" valign=\"middle\">\r\n    <td align=\"center\">\r\n      <{if $user.avatar != \"\"}>\r\n      <img src=\"<{$user.avatar}>\" alt=\"<{$user.name}>\'s avatar\" width=\"32px\" /><br />\r\n      <{/if}>\r\n      <a href=\"<{$xoops_url}>/userinfo.php?uid=<{$user.id}>\" title=\"<{$user.name}>\"><{$user.name}></a>\r\n      <{if $xoops_isadmin}><br />(<{$user.login_name}>)<{/if}>\r\n      <br /><{$user.joindate}>\r\n    </td>\r\n  </tr>\r\n  <{/foreach}>\r\n</table>\r\n<{if $block.index_enabled == true}>\r\n<{$block.lang_activeusers}>: <{$block.active}><br />\r\n<{$block.lang_inactiveusers}>: <{$block.inactive}><br />\r\n<{$block.lang_totalusers}>: <{$block.registered}><br />\r\n<{/if}>'),(62,'<table width=\"100%\" cellspacing=\"1px\" class=\"outer\">\r\n  <{foreach item=comment from=$block.comments}>\r\n  <tr class=\"<{cycle values=\"even,odd\"}>\">\r\n    <td align=\"center\"><img src=\"<{$xoops_url}>/images/subject/<{$comment.icon}>\" alt=\"\" /></td>\r\n    <td><{$comment.title}></td>\r\n    <td align=\"center\"><{$comment.module}></td>\r\n    <td align=\"center\"><{$comment.poster}></td>\r\n    <td align=\"<{$smarty.const._GLOBAL_RIGHT}>\"><{$comment.time}></td>\r\n  </tr>\r\n  <{/foreach}>\r\n</table>'),(63,'<form action=\"<{$block.target_page}>\" method=\"post\">\r\n<table class=\"outer\">\r\n  <{foreach item=category from=$block.categories}>\r\n  <{foreach name=inner item=event from=$category.events}>\r\n  <{if $smarty.foreach.inner.first}>\r\n  <tr>\r\n    <td class=\"head\" colspan=\"2\"><{$category.title}></td>\r\n  </tr>\r\n  <{/if}>\r\n  <tr>\r\n    <td class=\"odd\"><{counter assign=index}><input type=\"hidden\" name=\"not_list[<{$index}>][params]\" value=\"<{$category.name}>,<{$category.itemid}>,<{$event.name}>\" /><input type=\"checkbox\" name=\"not_list[<{$index}>][status]\" value=\"1\" <{if $event.subscribed}>checked=\"checked\"<{/if}> /></td>\r\n    <td class=\"odd\"><{$event.caption}></td>\r\n  </tr>\r\n  <{/foreach}>\r\n  <{/foreach}>\r\n  <tr>\r\n    <td class=\"foot\" colspan=\"2\"><input type=\"hidden\" name=\"not_redirect\" value=\"<{$block.redirect_script}>\" /><input type=\"hidden\" value=\"<{$block.notification_token}>\" name=\"XOOPS_TOKEN_REQUEST\" /><input type=\"submit\" name=\"not_submit\" value=\"<{$block.submit_button}>\" /></td>\r\n  </tr>\r\n</table>\r\n</form>'),(64,'<div style=\"text-align: center;\">\r\n<form action=\"index.php\" method=\"post\">\r\n<div>\r\n	<{if $block.theme_select|@count > 1}>\r\n	<select name=\"theme_select\" onchange=\"submit();\" size=\"3\">\r\n	<{foreach item=theme from=$block.theme_select}>\r\n	<option value=\"<{$theme.folder}>\"> <{if $theme.option>0}><img src=\"<{$theme.image}>\"><br/><{/if}><{$theme.name}></option>\r\n	<{/foreach}>\r\n	</select>\r\n	<{/if}>\r\n</div>\r\n</form>\r\n\r\n</div>\r\n'),(65,'<div style=\"margin-left: auto; margin-right: auto; text-align: center;\">\r\n	<{foreach item=language from=$block.ml_tag}>\r\n	<a href=\"?lang=<{$language.tag}>\">\r\n		<img src=\'<{$language.image}>\' alt=\"<{$language.name}>\"></a>\r\n	<{/foreach}>\r\n</div>'),(66,'<{foreach item=provider from=$block.provider}>\r\n<a href=\"#\" onclick=\"window.open(<{$provider.link}>);return false;\" rel=\"nofollow\" title=\"<{$provider.title}>\"><img src=\"<{$block.imagepath}><{$provider.image}>\" alt=\"<{$provider.title}>\"/></a>\r\n<{/foreach}>'),(67,'<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n	<{foreach item=item from=$block.msg}>\r\n		<{$item}>\r\n	<{/foreach}>\r\n</table>'),(68,'<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  	<tr>\r\n  		<div class=\"CPindexOptions\" align=\"center\">\r\n	  		<div class=\"cpicon\" align=\"center\">\r\n	  			<{foreach item=mod from=$block.sysmod}>\r\n	  				<a href=\"<{$mod.link}>\" title=\"<{$mod.title}>\"><img src=\"<{if $mod.image != \'\'}><{$mod.image}><{else}><{$xoops_url}>/modules/system/images/modules.png<{/if}>\" alt=\"<{$mod.title}>\" />\r\n	  					<span><{$mod.title}></span></a>\n	  			<{/foreach}>\n	  		</div>\r\n	  	</div>\r\n	</tr>\r\n</table>'),(69,'<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  	<tr>\r\n		<td width=\"100%\" class=\"CPindexOptions\">\r\n			<div class=\"cpicon\">\r\n				<{foreach item=mod from=$block.mods}>\r\n			 			<a href=\"<{$mod.link}>\" title=\"<{$mod.title}>\"><img src=\"<{if $mod.iconbig != \'\'}><{$mod.iconbig}><{else}><{$xoops_url}>/modules/system/images/modules.png<{/if}>\" alt=\"<{$mod.title}>\" />\r\n			 			<span><{$mod.title}></span></a>\r\n				<{/foreach}>\r\n			</div>\r\n		</td>\r\n	</tr>\r\n</table>'),(70,'<div class=\"bookmarks\">\r\n<{foreach item=module key=key from=$block}>\r\n<strong><{$key}></strong>\r\n	<ul>\r\n	<{foreach item=bookmark from=$module}>\r\n		<li>\r\n	        <a href=\"<{$bookmark.url}>\" title=\"<{$key}> &raquo; <{$bookmark.name}>\"><{$bookmark.name}></a>\r\n		</li>\r\n	<{/foreach}>\r\n	</ul>\r\n<{/foreach}>\r\n</div>'),(71,'<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n  	<tr>\n  		<div class=\"CPindexOptions\" align=\"center\">\n	  		<div class=\"cpicon\" align=\"center\">\n		  		<{foreach item=group key=key from=$block}>\n		  			<span><{$key}></span>\n		  			<{foreach item=mod from=$group}>\n		  				<a href=\"<{$mod.link}>\" title=\"<{$mod.title}>\"><img src=\"<{if $mod.image != \'\'}><{$mod.image}><{else}><{$xoops_url}>/modules/system/images/modules.png<{/if}>\" alt=\"<{$mod.title}>\" />\n		  				<span><{$mod.title}></span></a>\n		  			<{/foreach}>\n		  			<br />\n				<{/foreach}>\n	  		</div>\n	  	</div>\n	</tr>\n</table>');
/*!40000 ALTER TABLE `icms_tplsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_users`
--

DROP TABLE IF EXISTS `icms_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_users` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `uname` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `user_avatar` varchar(30) NOT NULL DEFAULT 'blank.gif',
  `user_regdate` int(10) unsigned NOT NULL DEFAULT 0,
  `user_icq` varchar(15) NOT NULL DEFAULT '',
  `user_from` varchar(100) NOT NULL DEFAULT '',
  `user_sig` text NOT NULL,
  `user_viewemail` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `actkey` varchar(8) NOT NULL DEFAULT '',
  `user_aim` varchar(18) NOT NULL DEFAULT '',
  `user_yim` varchar(25) NOT NULL DEFAULT '',
  `user_msnm` varchar(100) NOT NULL DEFAULT '',
  `pass` varchar(255) NOT NULL DEFAULT '',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `attachsig` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `rank` smallint(5) unsigned NOT NULL DEFAULT 0,
  `level` varchar(3) NOT NULL DEFAULT '1',
  `theme` varchar(100) NOT NULL DEFAULT '',
  `timezone_offset` float(3,1) NOT NULL DEFAULT 0.0,
  `last_login` int(10) unsigned NOT NULL DEFAULT 0,
  `umode` varchar(10) NOT NULL DEFAULT '',
  `uorder` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `notify_method` tinyint(1) NOT NULL DEFAULT 1,
  `notify_mode` tinyint(1) NOT NULL DEFAULT 0,
  `user_occ` varchar(100) NOT NULL DEFAULT '',
  `bio` tinytext NOT NULL,
  `user_intrest` varchar(150) NOT NULL DEFAULT '',
  `user_mailok` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `language` varchar(100) NOT NULL DEFAULT '',
  `salt` varchar(255) NOT NULL DEFAULT '',
  `pass_expired` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `enc_type` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `login_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `login_name` (`login_name`(10)),
  KEY `uname` (`uname`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_users`
--

LOCK TABLES `icms_users` WRITE;
/*!40000 ALTER TABLE `icms_users` DISABLE KEYS */;
INSERT INTO `icms_users` VALUES (1,'','admin','admin@impresscms.local','http://127.0.0.1:18831/','blank.gif',1790763743,'','','',0,'','','','','$23$5000$fu9xjOKjTL4GkAC7LmjPoOfU1kxOhqbLisFZi9LRKj79AdYwJFXBBotuoetsA2XsS-25133b0852197e25597468b2ab001faabf459608ebf417969a3f780da4791d95858f78ef63c2e91cdf4a4117390375c3fa37715866791bd3d7674c96a29d2c63',0,0,7,'5','iTheme',0.0,1790763743,'thread',0,1,0,'','','',0,'english','0',0,1,'admin');
/*!40000 ALTER TABLE `icms_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_xoopscomments`
--

DROP TABLE IF EXISTS `icms_xoopscomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_xoopscomments` (
  `com_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `com_pid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `com_rootid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `com_modid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `com_itemid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `com_icon` varchar(25) NOT NULL DEFAULT '',
  `com_created` int(10) unsigned NOT NULL DEFAULT 0,
  `com_modified` int(10) unsigned NOT NULL DEFAULT 0,
  `com_uid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `com_ip` varchar(15) NOT NULL DEFAULT '',
  `com_title` varchar(255) NOT NULL DEFAULT '',
  `com_text` text NOT NULL,
  `com_sig` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `com_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `com_exparams` varchar(255) NOT NULL DEFAULT '',
  `dohtml` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `dosmiley` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `doxcode` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `doimage` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `dobr` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`com_id`),
  KEY `com_pid` (`com_pid`),
  KEY `com_itemid` (`com_itemid`),
  KEY `com_uid` (`com_uid`),
  KEY `com_title` (`com_title`(40))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_xoopscomments`
--

LOCK TABLES `icms_xoopscomments` WRITE;
/*!40000 ALTER TABLE `icms_xoopscomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_xoopscomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icms_xoopsnotifications`
--

DROP TABLE IF EXISTS `icms_xoopsnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `icms_xoopsnotifications` (
  `not_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `not_modid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `not_itemid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `not_category` varchar(30) NOT NULL DEFAULT '',
  `not_event` varchar(30) NOT NULL DEFAULT '',
  `not_uid` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `not_mode` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`not_id`),
  KEY `not_modid` (`not_modid`),
  KEY `not_itemid` (`not_itemid`),
  KEY `not_class` (`not_category`),
  KEY `not_uid` (`not_uid`),
  KEY `not_event` (`not_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icms_xoopsnotifications`
--

LOCK TABLES `icms_xoopsnotifications` WRITE;
/*!40000 ALTER TABLE `icms_xoopsnotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `icms_xoopsnotifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 10:33:04
