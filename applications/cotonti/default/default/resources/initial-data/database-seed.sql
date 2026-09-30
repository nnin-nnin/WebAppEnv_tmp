/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: cotonti
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
-- Table structure for table `cot_auth`
--

DROP TABLE IF EXISTS `cot_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_auth` (
  `auth_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_groupid` mediumint(8) unsigned NOT NULL,
  `auth_code` varchar(255) NOT NULL,
  `auth_option` varchar(255) NOT NULL DEFAULT '',
  `auth_rights` tinyint(3) unsigned DEFAULT 0,
  `auth_rights_lock` tinyint(3) unsigned DEFAULT 0,
  `auth_setbyuserid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`auth_id`),
  KEY `auth_groupid` (`auth_groupid`),
  KEY `auth_code` (`auth_code`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_auth`
--

LOCK TABLES `cot_auth` WRITE;
/*!40000 ALTER TABLE `cot_auth` DISABLE KEYS */;
INSERT INTO `cot_auth` VALUES (1,1,'admin','a',0,255,1),(2,2,'admin','a',0,255,1),(3,3,'admin','a',0,255,1),(4,4,'admin','a',0,255,1),(5,5,'admin','a',255,255,1),(6,6,'admin','a',1,0,1),(7,1,'message','a',1,255,1),(8,2,'message','a',1,255,1),(9,3,'message','a',1,255,1),(10,4,'message','a',1,255,1),(11,5,'message','a',255,255,1),(12,6,'message','a',131,0,1),(13,1,'structure','a',0,255,1),(14,2,'structure','a',0,255,1),(15,3,'structure','a',0,255,1),(16,4,'structure','a',0,255,1),(17,5,'structure','a',255,255,1),(18,6,'structure','a',1,0,1),(19,5,'index','a',255,255,1),(20,6,'index','a',1,0,1),(21,2,'index','a',1,128,1),(22,3,'index','a',0,255,1),(23,4,'index','a',1,0,1),(24,1,'index','a',1,128,1),(25,5,'page','a',255,255,1),(26,6,'page','a',7,0,1),(27,2,'page','a',1,128,1),(28,3,'page','a',0,255,1),(29,4,'page','a',7,0,1),(30,1,'page','a',1,128,1),(31,1,'page','articles',5,250,1),(32,2,'page','articles',1,254,1),(33,3,'page','articles',0,255,1),(34,4,'page','articles',7,0,1),(35,5,'page','articles',255,255,1),(36,6,'page','articles',135,0,1),(37,1,'page','events',5,250,1),(38,2,'page','events',1,254,1),(39,3,'page','events',0,255,1),(40,4,'page','events',7,0,1),(41,5,'page','events',255,255,1),(42,6,'page','events',135,0,1),(43,1,'page','system',5,250,1),(44,2,'page','system',1,254,1),(45,3,'page','system',0,255,1),(46,4,'page','system',7,0,1),(47,5,'page','system',255,255,1),(48,6,'page','system',135,0,1),(49,1,'page','news',5,250,1),(50,2,'page','news',1,254,1),(51,3,'page','news',0,255,1),(52,4,'page','news',7,0,1),(53,5,'page','news',255,255,1),(54,6,'page','news',135,0,1),(55,5,'users','a',255,255,1),(56,6,'users','a',3,0,1),(57,2,'users','a',1,128,1),(58,3,'users','a',0,255,1),(59,4,'users','a',3,0,1),(60,1,'users','a',1,128,1),(61,5,'rss','a',255,255,1),(62,6,'rss','a',1,0,1),(63,2,'rss','a',1,128,1),(64,3,'rss','a',0,255,1),(65,4,'rss','a',1,0,1),(66,1,'rss','a',1,128,1),(67,5,'forums','a',255,255,1),(68,6,'forums','a',3,0,1),(69,2,'forums','a',1,128,1),(70,3,'forums','a',0,255,1),(71,4,'forums','a',3,0,1),(72,1,'forums','a',1,128,1),(73,1,'forums','pub',1,254,1),(74,2,'forums','pub',1,254,1),(75,3,'forums','pub',0,255,1),(76,4,'forums','pub',3,128,1),(77,5,'forums','pub',255,255,1),(78,6,'forums','pub',131,0,1),(79,1,'forums','general',1,254,1),(80,2,'forums','general',1,254,1),(81,3,'forums','general',0,255,1),(82,4,'forums','general',3,128,1),(83,5,'forums','general',255,255,1),(84,6,'forums','general',131,0,1),(85,1,'forums','offtopic',1,254,1),(86,2,'forums','offtopic',1,254,1),(87,3,'forums','offtopic',0,255,1),(88,4,'forums','offtopic',3,128,1),(89,5,'forums','offtopic',255,255,1),(90,6,'forums','offtopic',131,0,1),(91,5,'pfs','a',255,255,1),(92,6,'pfs','a',3,0,1),(93,2,'pfs','a',1,254,1),(94,3,'pfs','a',0,255,1),(95,4,'pfs','a',3,0,1),(96,1,'pfs','a',1,254,1),(97,5,'pm','a',255,255,1),(98,6,'pm','a',3,0,1),(99,2,'pm','a',0,254,1),(100,3,'pm','a',0,255,1),(101,4,'pm','a',3,0,1),(102,1,'pm','a',0,254,1),(103,5,'polls','a',255,255,1),(104,6,'polls','a',3,0,1),(105,2,'polls','a',3,128,1),(106,3,'polls','a',0,255,1),(107,4,'polls','a',3,0,1),(108,1,'polls','a',3,128,1),(109,5,'plug','ckeditor',255,255,1),(110,6,'plug','ckeditor',3,252,1),(111,2,'plug','ckeditor',1,252,1),(112,3,'plug','ckeditor',0,255,1),(113,4,'plug','ckeditor',3,252,1),(114,1,'plug','ckeditor',1,252,1),(115,5,'plug','cleaner',255,255,1),(116,6,'plug','cleaner',1,254,1),(117,2,'plug','cleaner',0,255,1),(118,3,'plug','cleaner',0,255,1),(119,4,'plug','cleaner',1,254,1),(120,1,'plug','cleaner',0,255,1),(121,5,'plug','html',255,255,1),(122,6,'plug','html',3,0,1),(123,2,'plug','html',1,252,1),(124,3,'plug','html',0,255,1),(125,4,'plug','html',3,0,1),(126,1,'plug','html',1,252,1),(127,5,'plug','htmlpurifier',255,255,1),(128,6,'plug','htmlpurifier',3,0,1),(129,2,'plug','htmlpurifier',3,252,1),(130,3,'plug','htmlpurifier',0,255,1),(131,4,'plug','htmlpurifier',3,0,1),(132,1,'plug','htmlpurifier',3,252,1),(133,5,'plug','ipsearch',255,255,1),(134,6,'plug','ipsearch',0,255,1),(135,2,'plug','ipsearch',0,255,1),(136,3,'plug','ipsearch',0,255,1),(137,4,'plug','ipsearch',0,255,1),(138,1,'plug','ipsearch',0,255,1),(139,5,'plug','mcaptcha',255,255,1),(140,6,'plug','mcaptcha',1,254,1),(141,2,'plug','mcaptcha',1,254,1),(142,3,'plug','mcaptcha',0,255,1),(143,4,'plug','mcaptcha',1,254,1),(144,1,'plug','mcaptcha',1,254,1),(145,5,'plug','indexnews',255,255,1),(146,6,'plug','indexnews',3,0,1),(147,2,'plug','indexnews',1,252,1),(148,3,'plug','indexnews',0,255,1),(149,4,'plug','indexnews',3,0,1),(150,1,'plug','indexnews',1,252,1),(151,5,'plug','search',255,255,1),(152,6,'plug','search',1,254,1),(153,2,'plug','search',1,254,1),(154,3,'plug','search',0,255,1),(155,4,'plug','search',1,254,1),(156,1,'plug','search',1,254,1),(157,5,'plug','tags',255,255,1),(158,6,'plug','tags',3,124,1),(159,2,'plug','tags',1,254,1),(160,3,'plug','tags',0,255,1),(161,4,'plug','tags',3,124,1),(162,1,'plug','tags',1,254,1),(163,5,'plug','ratings',255,255,1),(164,6,'plug','ratings',3,0,1),(165,2,'plug','ratings',1,252,1),(166,3,'plug','ratings',0,255,1),(167,4,'plug','ratings',3,0,1),(168,1,'plug','ratings',1,252,1),(169,5,'plug','comments',255,255,1),(170,6,'plug','comments',3,0,1),(171,2,'plug','comments',1,252,1),(172,3,'plug','comments',0,255,1),(173,4,'plug','comments',3,0,1),(174,1,'plug','comments',1,252,1),(175,5,'plug','urleditor',255,255,1),(176,6,'plug','urleditor',1,0,1),(177,2,'plug','urleditor',1,254,1),(178,3,'plug','urleditor',0,255,1),(179,4,'plug','urleditor',1,0,1),(180,1,'plug','urleditor',1,254,1);
/*!40000 ALTER TABLE `cot_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_cache`
--

DROP TABLE IF EXISTS `cot_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_cache` (
  `c_name` varchar(120) NOT NULL,
  `c_realm` varchar(64) NOT NULL DEFAULT 'cot',
  `c_expire` int(10) unsigned NOT NULL DEFAULT 0,
  `c_auto` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `c_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`c_name`,`c_realm`),
  KEY `c_realm` (`c_realm`),
  KEY `c_name` (`c_name`),
  KEY `c_expire` (`c_expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_cache`
--

LOCK TABLES `cot_cache` WRITE;
/*!40000 ALTER TABLE `cot_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_cache_bindings`
--

DROP TABLE IF EXISTS `cot_cache_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_cache_bindings` (
  `c_event` varchar(64) NOT NULL,
  `c_id` varchar(120) NOT NULL,
  `c_realm` varchar(64) NOT NULL DEFAULT 'cot',
  `c_type` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`c_event`,`c_id`,`c_realm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_cache_bindings`
--

LOCK TABLES `cot_cache_bindings` WRITE;
/*!40000 ALTER TABLE `cot_cache_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_cache_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_com`
--

DROP TABLE IF EXISTS `cot_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_com` (
  `com_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `com_area` varchar(64) NOT NULL,
  `com_code` varchar(255) NOT NULL,
  `com_author` varchar(100) NOT NULL DEFAULT '',
  `com_authorid` int(10) unsigned NOT NULL,
  `com_authorip` varchar(64) NOT NULL DEFAULT '',
  `com_text` text NOT NULL,
  `com_date` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`com_id`),
  KEY `com_area` (`com_area`,`com_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_com`
--

LOCK TABLES `cot_com` WRITE;
/*!40000 ALTER TABLE `cot_com` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_com` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_config`
--

DROP TABLE IF EXISTS `cot_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_config` (
  `config_owner` varchar(24) NOT NULL DEFAULT 'core',
  `config_cat` varchar(64) NOT NULL,
  `config_subcat` varchar(255) NOT NULL DEFAULT '',
  `config_order` char(3) NOT NULL DEFAULT '00',
  `config_name` varchar(64) NOT NULL,
  `config_type` tinyint(4) NOT NULL DEFAULT 0,
  `config_value` text NOT NULL,
  `config_default` varchar(255) NOT NULL DEFAULT '',
  `config_variants` varchar(255) NOT NULL DEFAULT '',
  `config_text` varchar(255) NOT NULL DEFAULT '',
  `config_donor` varchar(64) NOT NULL DEFAULT '',
  UNIQUE KEY `config_owner_cat_name_subcat_key` (`config_owner`,`config_cat`,`config_name`,`config_subcat`),
  KEY `config_owner` (`config_owner`,`config_cat`),
  KEY `config_owner_2` (`config_owner`,`config_cat`,`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_config`
--

LOCK TABLES `cot_config` WRITE;
/*!40000 ALTER TABLE `cot_config` DISABLE KEYS */;
INSERT INTO `cot_config` VALUES ('core','locale','','11','defaulttimezone',4,'UTC','UTC','cot_config_timezones()','',''),('core','locale','','01','forcedefaultlang',3,'0','0','','',''),('core','main','','01','adminemail',1,'admin@mysite.com','admin@mysite.com','','',''),('core','main','','02','clustermode',3,'0','0','','',''),('core','main','','07','confirmlinks',3,'1','1','','',''),('core','main','','91','default_show_installed',3,'0','0','','',''),('core','main','','06','easypagenav',3,'1','1','','',''),('core','main','','03','hostip',1,'999.999.999.999','999.999.999.999','','',''),('core','main','','11','loggerlevel',2,'sec+adm+ext','sec+adm+ext','none,sec,adm,ext,sec+adm,sec+ext,adm+ext,sec+adm+ext,all','',''),('core','main','','05','maxrowsperpage',8,'15','','cot_config_type_int(1)','',''),('core','main','','04','parser',4,'html','none','cot_get_parsers()','',''),('core','main','','09','serverEvents',2,'none','none','none,sse,ajax','',''),('core','menus','','02','banner',0,'','','','',''),('core','menus','','03','bottomline',0,'','','','',''),('core','menus','','21','freetext1',0,'','','','',''),('core','menus','','22','freetext2',0,'','','','',''),('core','menus','','23','freetext3',0,'','','','',''),('core','menus','','24','freetext4',0,'','','','',''),('core','menus','','25','freetext5',0,'','','','',''),('core','menus','','26','freetext6',0,'','','','',''),('core','menus','','27','freetext7',0,'','','','',''),('core','menus','','28','freetext8',0,'','','','',''),('core','menus','','29','freetext9',0,'','','','',''),('core','menus','','11','menu1',0,'<li><a href=\"index.php\">Home</a></li>\n<li><a href=\"index.php?e=forums\">Forums</a></li>\n<li><a href=\"index.php?e=page&c=articles\">Articles</a></li>\n<li><a href=\"index.php?e=search\">Search</a></li>','<li><a href=\"index.php\">Home</a></li>\n<li><a href=\"index.php?e=forums\">Forums</a></li>\n<li><a href=\"index.php?e=page&c=articles\">Articles</a></li>\n<li><a href=\"index.php?e=search\">Search</a></li>','','',''),('core','menus','','12','menu2',0,'','','','',''),('core','menus','','13','menu3',0,'','','','',''),('core','menus','','14','menu4',0,'','','','',''),('core','menus','','15','menu5',0,'','','','',''),('core','menus','','16','menu6',0,'','','','',''),('core','menus','','17','menu7',0,'','','','',''),('core','menus','','18','menu8',0,'','','','',''),('core','menus','','19','menu9',0,'','','','',''),('core','menus','','01','topline',0,'','','','',''),('core','performance','','01','gzip',3,'0','0','','',''),('core','performance','','02','headrc_consolidate',3,'0','0','','',''),('core','performance','','03','headrc_minify',3,'1','1','','',''),('core','performance','','05','jquery',3,'1','1','','',''),('core','performance','','04','jquery_cdn',1,'','','','',''),('core','performance','','06','turnajax',3,'1','1','','',''),('core','security','','31','captchamain',4,'mcaptcha','mcaptcha','cot_captcha_list()','',''),('core','security','','32','captcharandom',3,'0','0','','',''),('core','security','','97','devmode',3,'0','0','','',''),('core','security','','42','hashfunc',4,'sha256','sha256','cot_hash_funcs()','',''),('core','security','','40','logWrongInput',3,'0','0','','',''),('core','security','','98','maintenance',3,'0','0','','',''),('core','security','','99','maintenancereason',1,'','','','',''),('core','security','','41','referercheck',3,'0','1','','',''),('core','security','','21','shieldenabled',3,'0','0','','',''),('core','security','','22','shieldtadjust',2,'100','100','10,25,50,75,100,125,150,200,300,400,600,800','',''),('core','security','','23','shieldzhammer',2,'25','25','5,10,15,20,25,30,40,50,100','',''),('core','sessions','','01','cookiedomain',1,'','','','',''),('core','sessions','','03','cookielifetime',2,'5184000','5184000','1800,3600,7200,14400,28800,43200,86400,172800,259200,604800,1296000,2592000,5184000','',''),('core','sessions','','02','cookiepath',1,'','','','',''),('core','sessions','','04','forcerememberme',3,'0','0','','',''),('core','sessions','','06','redirbkonlogin',3,'1','1','','',''),('core','sessions','','07','redirbkonlogout',3,'0','0','','',''),('core','sessions','','05','timedout',2,'1200','1200','30,60,120,300,600,900,1200,1800,2400,3600','',''),('core','theme','','05','disablesysinfos',3,'0','0','','',''),('core','theme','','01','forcedefaulttheme',3,'0','0','','',''),('core','theme','','02','homebreadcrumb',3,'0','0','','',''),('core','theme','','06','keepcrbottom',3,'1','1','','',''),('core','theme','','08','msg_separate',3,'0','0','','Show messages separately for each source',''),('core','theme','','04','separator',1,'/','/','','',''),('core','theme','','07','showsqlstats',3,'0','0','','',''),('core','title','','99','body_mail',0,'{MAIL_BODY}\n\n{SITE_TITLE} - {SITE_URL}\n{SITE_DESCRIPTION}','{MAIL_BODY}\n\n{SITE_TITLE} - {SITE_URL}\n{SITE_DESCRIPTION}','','',''),('core','title','','01','maintitle',1,'Title of your site','Title of your site','','',''),('core','title','','03','metakeywords',1,'','','','',''),('core','title','','98','subject_mail',1,'{SITE_TITLE} - {MAIL_SUBJECT}','{SITE_TITLE} - {MAIL_SUBJECT}','','',''),('core','title','','02','subtitle',1,'Subtitle','Subtitle','','',''),('core','title','','18','title_header',1,'{SUBTITLE} - {MAINTITLE}','{SUBTITLE} - {MAINTITLE}','','',''),('core','title','','19','title_header_index',1,'{MAINTITLE} - {DESCRIPTION} {SUBTITLE}','{MAINTITLE} - {DESCRIPTION} {SUBTITLE}','','',''),('core','title','','14','title_users_details',1,'{USER}: {NAME}','{USER} - {NAME}','','',''),('module','forums','__default','02','allowbbcodes',3,'1','1','','',''),('module','forums','__default','08','allowpolls',3,'1','1','','',''),('module','forums','__default','05','allowprvtopics',3,'1','1','','',''),('module','forums','__default','04','allowsmilies',3,'1','1','','',''),('module','forums','__default','01','allowusertext',3,'1','1','','',''),('module','forums','__default','06','allowviewers',3,'1','1','','',''),('module','forums','','05','antibumpforums',3,'0','0','','',''),('module','forums','__default','09','autoprune',1,'0','0','','',''),('module','forums','__default','07','countposts',3,'1','1','','',''),('module','forums','__default','10','defstate',2,'1','1','0,1','',''),('module','forums','','15','edittimeout',2,'0','0','0,0.25,1,2,4,12,24,48,72,168','',''),('module','forums','','13','enablereplyform',3,'0','0','','',''),('module','forums','','02','hideprivateforums',3,'1','1','','',''),('module','forums','','03','hottopictrigger',2,'20','20','5,10,15,20,25,30,35,40,50','',''),('module','forums','__default','06','keywords',1,'','','','',''),('module','forums','','01','markup',3,'1','1','','',''),('module','forums','','11','maxPostLength',1,'','','','',''),('module','forums','','08','maxpostsperpage',1,'15','15','','',''),('module','forums','','04','maxtopicsperpage',1,'30','30','','',''),('module','forums','','06','mergeforumposts',3,'1','1','','',''),('module','forums','','07','mergetimeout',2,'0','0','0,1,2,3,6,12,24,36,48,72','',''),('module','forums','__default','08','metadesc',1,'','','','',''),('module','forums','__default','07','metatitle',1,'','','','',''),('module','forums','','33','minimaxieditor',2,'medieditor','medieditor','minieditor,medieditor,editor','',''),('module','forums','','10','minpostlength',1,'2','2','','',''),('module','forums','','09','mintitlelength',1,'5','5','','',''),('module','forums','','31','title_posts',1,'{TITLE} - {SECTION} - {FORUM}','{TITLE} - {SECTION} - {FORUM}','','',''),('module','forums','','32','title_topics',1,'{SECTION} - {FORUM}','{SECTION} - {FORUM}','','',''),('module','page','__default','05','allowemptytext',3,'0','0','','',''),('module','page','','04','autovalidate',3,'1','1','','',''),('module','page','','03','count_admin',3,'0','0','','',''),('module','page','__default','00','enable_comments',3,'1','1','','','comments'),('module','page','__default','00','enable_ratings',3,'1','1','','','ratings'),('module','page','__default','06','keywords',1,'','','','',''),('module','page','','01','markup',3,'1','1','','',''),('module','page','','06','maxlistsperpage',2,'30','30','5,10,15,20,25,30,40,50,60,70,100,200,500','',''),('module','page','__default','03','maxrowsperpage',1,'30','30','','',''),('module','page','__default','08','metadesc',1,'','','','',''),('module','page','__default','07','metatitle',1,'','','','',''),('module','page','__default','01','order',4,'title','title','cot_page_config_order()','',''),('module','page','','02','parser',4,'html','none','cot_get_parsers()','',''),('module','page','','07','title_page',1,'{TITLE} - {CATEGORY}','{TITLE} - {CATEGORY}','','',''),('module','page','__default','04','truncatetext',1,'0','0','','',''),('module','page','__default','02','way',2,'asc','asc','asc,desc','',''),('module','pfs','','06','maxpfsperpage',1,'15','15','','',''),('module','pfs','','03','pfsfilecheck',3,'1','1','','',''),('module','pfs','','05','pfsmaxuploads',1,'8','8','','',''),('module','pfs','','04','pfsnomimepass',3,'1','1','','',''),('module','pfs','','02','pfstimename',3,'0','0','','',''),('module','pfs','','01','pfsuserfolder',3,'0','0','','',''),('module','pfs','','07','pfs_winclose',3,'0','0','','',''),('module','pfs','','09','th_amode',2,'GD2','GD2','Disabled,GD1,GD2','',''),('module','pfs','','12','th_border',1,'4','4','','',''),('module','pfs','','16','th_colorbg',1,'000000','000000','','',''),('module','pfs','','17','th_colortext',1,'FFFFFF','FFFFFF','','',''),('module','pfs','','13','th_dimpriority',2,'Width','Width','Width,Height','',''),('module','pfs','','15','th_jpeg_quality',2,'85','85','0,5,10,20,30,40,50,60,70,75,80,85,90,95,100','',''),('module','pfs','','14','th_keepratio',3,'1','1','','',''),('module','pfs','','08','th_separator',6,'','','','',''),('module','pfs','','18','th_textsize',7,'1','1','0,5','',''),('module','pfs','','10','th_x',1,'112','112','','',''),('module','pfs','','11','th_y',1,'84','84','','',''),('module','pm','','03','allownotifications',3,'1','1','','',''),('module','pm','','04','allowPopUpNotifications',3,'1','1','','',''),('module','pm','','99','css',3,'1','1','','Enable module CSS',''),('module','pm','','01','markup',3,'1','1','','',''),('module','pm','','05','maxpmperpage',1,'15','15','','',''),('module','pm','','02','maxsize',2,'10000','10000','200,500,1000,2000,5000,10000,15000,20000,30000,50000,65000','',''),('module','pm','','06','showlast',1,'0','0','','',''),('module','pm','','98','turnajax',3,'0','0','','',''),('module','polls','','04','del_dup_options',3,'1','1','','',''),('module','polls','','00','enable_comments',3,'1','1','','','comments'),('module','polls','','02','ip_id_polls',2,'ip','ip','ip,id','',''),('module','polls','','01','markup',3,'1','1','','',''),('module','polls','','01','maxpolls',2,'1','1','1,2,3,4,5','',''),('module','polls','','03','max_options_polls',2,'100','100','5,10,20,50,100','',''),('module','polls','','02','mode',2,'Recent polls','Recent polls','Recent polls,Random polls','',''),('module','rss','','04','rss_charset',1,'UTF-8','UTF-8','','',''),('module','rss','','03','rss_maxitems',1,'40','40','','',''),('module','rss','','05','rss_pagemaxsymbols',1,'','','','',''),('module','rss','','06','rss_postmaxsymbols',1,'','','','',''),('module','rss','','02','rss_timetolive',2,'30','30','0,10,20,30,40,50,60,120,180,140,200','',''),('module','users','','01','disablereg',3,'0','0','','',''),('module','users','','05','filterFields',1,'','','','',''),('module','users','','13','inactive_login',3,'0','0','','',''),('module','users','','03','maxusersperpage',1,'50','50','','',''),('module','users','','11','register_auto_login',3,'0','0','','',''),('module','users','','09','regnoactivation',3,'0','0','','',''),('module','users','','07','regrequireadmin',3,'0','0','','',''),('module','users','','15','useremailchange',3,'0','0','','',''),('module','users','','21','usertextimg',3,'0','0','','',''),('module','users','','19','usertextmax',1,'300','300','','',''),('module','users','','17','user_email_noprotection',3,'0','0','','',''),('plug','cleaner','','06','logprune',2,'15','15','0,1,2,3,7,15,30,60','Delete the log entries older than * days (0 to disable).',''),('plug','cleaner','','06','pmnotarchived',2,'180','180','0,15,30,60,120,180,365','Delete the private messages older than * days and not archived (0 to disable).',''),('plug','cleaner','','05','pmnotread',2,'120','120','0,15,30,60,120,180,365','Delete the private messages older than * days and not read by the recipient (0 to disable).',''),('plug','cleaner','','07','pmold',2,'365','365','0,15,30,60,120,180,365','Delete ALL the private messages older than * days (0 to disable).',''),('plug','cleaner','','04','refprune',2,'30','30','0,15,30,60,120,180,365','Delete the referer entries older than * days (0 to disable).',''),('plug','cleaner','','05','userprune',2,'2','2','0,1,2,3,4,5,6,7','Delete the user accounts not activated within * days (0 to disable).',''),('plug','comments','','14','adminHomeCount',1,'5','5','','',''),('plug','comments','','10','commentsize',1,'0','0','','Max. size of comment, In bytes (zero for unlimited size). Default - 0',''),('plug','comments','','12','countcomments',3,'1','1','','Count comments, Display the count of comments near the icon',''),('plug','comments','','06','expand_comments',3,'1','1','','Expand comments, Show comments expanded by default',''),('plug','comments','','04','mail',3,'0','0','','Notify about new comments by email?',''),('plug','comments','','22','markup',3,'1','1','','Enable markup in comments',''),('plug','comments','','08','maxcommentsperpage',1,'15','15','','Max. comments on page',''),('plug','comments','','24','minsize',1,'2','2','','Min. comment size',''),('plug','comments','','26','order',2,'Recent','Recent','Chronological,Recent','Comment sorting order',''),('plug','comments','','28','rss_commentMaxSymbols',1,'','','','Comments. Cut element description longer than N symbols, Disabled by default',''),('plug','comments','','02','time',2,'10','10','1,2,3,4,5,6,7,8,9,10,15,30,60,90,120,180','Comments editable timeout for users, minutes',''),('plug','html','','01','editor',4,'ckeditor','ckeditor','cot_get_editors()','',''),('plug','htmlpurifier','','01','doctype',2,'HTML5','HTML5','XHTML 1.0 Transitional,XHTML 1.0 Strict,HTML 4.01 Transitional,HTML 4.01 Strict,XHTML 1.1,HTML5','Doctype',''),('plug','htmlpurifier','','03','rel2abs',3,'0','0','','Turn relative links into absolute',''),('plug','htmlpurifier','','02','tidylevel',2,'medium','medium','none,light,medium,heavy','Tidy level',''),('plug','htmlpurifier','','05','videoiframe',3,'0','0','','Allow video iframes from Youtube/Vimeo',''),('plug','indexnews','','03','cache_ttl',2,'0','0','0,60,180,300,600,1800,3600','Cache lifetime in seconds, 0 disables cache',''),('plug','indexnews','','01','category',4,'news','news','cot_pagecat_list()','News category codes, comma separated',''),('plug','indexnews','','02','maxpages',1,'10','10','','Recent pages displayed',''),('plug','mcaptcha','','02','attempts',1,'0','0','','Max captcha attempts per session (0 for unlimited)',''),('plug','mcaptcha','','01','delay',1,'3','3','','Anti-hammer delay in seconds',''),('plug','ratings','','99','css',3,'1','1','','Enable plugin CSS',''),('plug','ratings','','01','ratings_allowchange',3,'0','0','','Allow users to change their ratings',''),('plug','search','','09','addfields',1,'','','','Additional pages fields for search, separated by commas. Example \"page_extra1,page_extra2,page_key\"',''),('plug','search','','07','commentssearch',3,'1','1','','Enable comments search',''),('plug','search','','10','extrafilters',3,'1','1','','Show extrafilters on main search page',''),('plug','search','','06','forumsearch',3,'1','1','','Enable forums search',''),('plug','search','','04','maxitems',1,'50','50','','Maximum results lines for general search',''),('plug','search','','02','maxsigns',2,'40','40','20,30,40,50,60,70,80','Maximum signs in query',''),('plug','search','','01','maxwords',2,'5','5','3,5,8,10','Maximum search words',''),('plug','search','','03','minsigns',2,'3','3','2,3,4,5','Min. signs in query',''),('plug','search','','05','pagesearch',3,'1','1','','Enable pages search',''),('plug','search','','08','searchurl',2,'Normal','Normal','Normal,Single','Type of forum post link to use, Single uses a Single post view, while Normal uses the traditional thread/jump-to link',''),('plug','tags','','99','css',3,'1','1','','Enable plugin CSS',''),('plug','tags','','12','forums',3,'1','1','','Enable Tags for Forums',''),('plug','tags','','22','index',2,'pages','pages','pages,forums,all','Index page tag cloud area',''),('plug','tags','','16','limit',1,'0','0','','Max. tags per items, 0 is unlimited',''),('plug','tags','','18','lim_forums',1,'0','0','','Limit of tags in a cloud displayed in forums, 0 is unlimited',''),('plug','tags','','19','lim_index',1,'0','0','','Limit of tags in a cloud displayed on index, 0 is unlimited',''),('plug','tags','','17','lim_pages',1,'0','0','','Limit of tags in a cloud displayed for pages, 0 is unlimited',''),('plug','tags','','20','more',3,'1','1','','Show \'All tags\' link in tag clouds',''),('plug','tags','','23','noindex',3,'1','1','','Exclude from search engine index',''),('plug','tags','','15','order',2,'Alphabetical','Alphabetical','Alphabetical,Frequency,Random','Cloud output order - alphabetical, descending frequency or random',''),('plug','tags','','11','pages',3,'1','1','','Enable Tags for Pages',''),('plug','tags','','21','perpage',1,'0','0','','Tags displayed per page in standalone cloud, 0 is all at once',''),('plug','tags','','31','sort',2,'Date','Date','ID,Title,Date,Category','Default sorting column for tag search results',''),('plug','tags','','13','title',3,'1','1','','Capitalize first latters of keywords',''),('plug','tags','','14','translit',3,'0','0','','Transliterate Tags in URLs',''),('plug','urleditor','','01','preset',4,'none','none','cot_url_presets()','URL Preset','');
/*!40000 ALTER TABLE `cot_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_core`
--

DROP TABLE IF EXISTS `cot_core`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_core` (
  `ct_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ct_code` varchar(64) NOT NULL,
  `ct_title` varchar(64) NOT NULL,
  `ct_version` varchar(32) NOT NULL DEFAULT '',
  `ct_state` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `ct_lock` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ct_plug` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ct_id`),
  KEY `ct_code` (`ct_code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_core`
--

LOCK TABLES `cot_core` WRITE;
/*!40000 ALTER TABLE `cot_core` DISABLE KEYS */;
INSERT INTO `cot_core` VALUES (1,'index','Index','1.0.2',1,0,0),(2,'page','Pages','1.0.15',1,0,0),(3,'users','Users','1.4.14',1,0,0),(4,'rss','RSS','1.0.3',1,0,0),(5,'forums','Forums','1.1.13',1,0,0),(6,'pfs','PFS','1.0.13',1,0,0),(7,'pm','Private Messages','1.0.14',1,0,0),(8,'polls','Polls','1.1.0',1,0,0),(9,'ckeditor','CKEditor','2.0.0-5-46.0.3',1,0,1),(10,'cleaner','Cleaner','1.7.2',1,0,1),(11,'html','HTML Parser','1.1.0',1,0,1),(12,'htmlpurifier','HTML Purifier','1.2.2-4.15.0',1,0,1),(13,'ipsearch','IP search','1.7.1',1,0,1),(14,'mcaptcha','MathCaptcha','1.2.1',1,0,1),(15,'indexnews','Index News','1.0.1',1,0,1),(16,'search','Search','4.0.14',1,0,1),(17,'tags','Tags','1.1.0',1,0,1),(18,'ratings','Star Ratings','1.1.21',1,0,1),(19,'comments','Comments system','2.0.1',1,0,1),(20,'urleditor','URL Editor','1.2.2',1,0,1);
/*!40000 ALTER TABLE `cot_core` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_extra_fields`
--

DROP TABLE IF EXISTS `cot_extra_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_extra_fields` (
  `field_location` varchar(255) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_type` varchar(255) NOT NULL,
  `field_html` text DEFAULT NULL,
  `field_variants` text DEFAULT NULL,
  `field_params` text DEFAULT NULL,
  `field_default` text DEFAULT NULL,
  `field_required` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `field_enabled` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `field_parse` varchar(32) NOT NULL DEFAULT 'HTML',
  `field_description` text DEFAULT NULL,
  KEY `field_location` (`field_location`),
  KEY `field_name` (`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_extra_fields`
--

LOCK TABLES `cot_extra_fields` WRITE;
/*!40000 ALTER TABLE `cot_extra_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_extra_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_forum_posts`
--

DROP TABLE IF EXISTS `cot_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_forum_posts` (
  `fp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fp_topicid` mediumint(9) NOT NULL,
  `fp_cat` varchar(255) NOT NULL,
  `fp_posterid` int(10) unsigned NOT NULL,
  `fp_postername` varchar(100) NOT NULL,
  `fp_creation` int(10) unsigned NOT NULL DEFAULT 0,
  `fp_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `fp_updater` varchar(100) NOT NULL DEFAULT '',
  `fp_text` mediumtext NOT NULL,
  `fp_posterip` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`fp_id`),
  UNIQUE KEY `fp_topicid_id_idx` (`fp_topicid`,`fp_id`),
  KEY `fp_created_idx` (`fp_creation`),
  KEY `fp_updated_idx` (`fp_updated`),
  KEY `fp_posterid` (`fp_posterid`),
  KEY `fp_cat_idx` (`fp_cat`),
  KEY `fp_topicid_idx` (`fp_topicid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_forum_posts`
--

LOCK TABLES `cot_forum_posts` WRITE;
/*!40000 ALTER TABLE `cot_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_forum_stats`
--

DROP TABLE IF EXISTS `cot_forum_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_forum_stats` (
  `fs_cat` varchar(255) NOT NULL,
  `fs_lt_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fs_lt_title` varchar(255) NOT NULL DEFAULT '',
  `fs_lt_date` int(10) unsigned NOT NULL DEFAULT 0,
  `fs_lt_posterid` int(10) unsigned NOT NULL,
  `fs_lt_postername` varchar(100) NOT NULL,
  `fs_topiccount` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `fs_postcount` int(10) unsigned NOT NULL DEFAULT 0,
  `fs_viewcount` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`fs_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_forum_stats`
--

LOCK TABLES `cot_forum_stats` WRITE;
/*!40000 ALTER TABLE `cot_forum_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_forum_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_forum_topics`
--

DROP TABLE IF EXISTS `cot_forum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_forum_topics` (
  `ft_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ft_mode` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ft_state` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ft_sticky` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ft_tag` varchar(16) NOT NULL DEFAULT '',
  `ft_cat` varchar(255) NOT NULL,
  `ft_title` varchar(255) NOT NULL,
  `ft_desc` varchar(255) NOT NULL DEFAULT '',
  `ft_creationdate` int(10) unsigned NOT NULL,
  `ft_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `ft_postcount` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `ft_viewcount` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `ft_lastposterid` int(10) unsigned NOT NULL DEFAULT 0,
  `ft_lastpostername` varchar(100) NOT NULL DEFAULT '',
  `ft_firstposterid` int(10) unsigned NOT NULL,
  `ft_firstpostername` varchar(100) NOT NULL,
  `ft_poll` int(10) unsigned DEFAULT 0,
  `ft_movedto` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `ft_preview` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`ft_id`),
  KEY `ft_updated` (`ft_updated`),
  KEY `ft_mode` (`ft_mode`),
  KEY `ft_state` (`ft_state`),
  KEY `ft_sticky` (`ft_sticky`),
  KEY `ft_cat` (`ft_cat`),
  KEY `ft_movedto` (`ft_movedto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_forum_topics`
--

LOCK TABLES `cot_forum_topics` WRITE;
/*!40000 ALTER TABLE `cot_forum_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_forum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_groups`
--

DROP TABLE IF EXISTS `cot_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_groups` (
  `grp_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `grp_alias` varchar(32) NOT NULL,
  `grp_level` tinyint(4) NOT NULL DEFAULT 1,
  `grp_disabled` tinyint(4) NOT NULL DEFAULT 0,
  `grp_name` varchar(64) NOT NULL,
  `grp_title` varchar(64) NOT NULL DEFAULT '',
  `grp_desc` varchar(255) NOT NULL DEFAULT '',
  `grp_icon` varchar(128) NOT NULL DEFAULT '',
  `grp_ownerid` int(10) unsigned NOT NULL DEFAULT 0,
  `grp_maintenance` tinyint(4) NOT NULL DEFAULT 0,
  `grp_skiprights` tinyint(4) NOT NULL DEFAULT 0,
  `grp_pfs_maxfile` int(11) NOT NULL DEFAULT 0,
  `grp_pfs_maxtotal` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`grp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_groups`
--

LOCK TABLES `cot_groups` WRITE;
/*!40000 ALTER TABLE `cot_groups` DISABLE KEYS */;
INSERT INTO `cot_groups` VALUES (1,'guests',0,0,'Guests','Guest','','',1,0,0,0,0),(2,'inactive',1,0,'Inactive','Inactive','','',1,0,0,0,0),(3,'banned',1,0,'Banned','Banned','','',1,0,0,0,0),(4,'members',1,0,'Members','Member','','',1,0,0,100000,100000),(5,'administrators',99,0,'Administrators','Administrator','','',1,1,0,1000000,1000000),(6,'moderators',50,0,'Moderators','Moderator','','',1,1,0,0,0);
/*!40000 ALTER TABLE `cot_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_groups_users`
--

DROP TABLE IF EXISTS `cot_groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_groups_users` (
  `gru_userid` int(10) unsigned NOT NULL,
  `gru_groupid` mediumint(8) unsigned NOT NULL,
  `gru_state` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `gru_groupid` (`gru_groupid`,`gru_userid`),
  KEY `gru_userid` (`gru_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_groups_users`
--

LOCK TABLES `cot_groups_users` WRITE;
/*!40000 ALTER TABLE `cot_groups_users` DISABLE KEYS */;
INSERT INTO `cot_groups_users` VALUES (1,5,0);
/*!40000 ALTER TABLE `cot_groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_logger`
--

DROP TABLE IF EXISTS `cot_logger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_logger` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` int(10) unsigned NOT NULL,
  `log_ip` varchar(64) DEFAULT '',
  `log_uid` int(10) unsigned NOT NULL DEFAULT 0,
  `log_name` varchar(100) DEFAULT '',
  `log_uri` varchar(255) DEFAULT '',
  `log_group` varchar(64) DEFAULT 'adm',
  `log_type` varchar(32) DEFAULT '',
  `log_status` varchar(24) DEFAULT '',
  `log_text` varchar(255) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_logger`
--

LOCK TABLES `cot_logger` WRITE;
/*!40000 ALTER TABLE `cot_logger` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_logger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_pages`
--

DROP TABLE IF EXISTS `cot_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_pages` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_alias` varchar(255) NOT NULL DEFAULT '',
  `page_state` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `page_cat` varchar(255) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_desc` varchar(255) DEFAULT '',
  `page_keywords` varchar(255) DEFAULT '',
  `page_metatitle` varchar(255) DEFAULT '',
  `page_metadesc` varchar(255) DEFAULT '',
  `page_text` mediumtext DEFAULT NULL,
  `page_parser` varchar(64) DEFAULT '',
  `page_author` varchar(100) DEFAULT '',
  `page_ownerid` int(10) unsigned NOT NULL DEFAULT 0,
  `page_date` int(10) unsigned NOT NULL DEFAULT 0,
  `page_begin` int(10) unsigned NOT NULL DEFAULT 0,
  `page_expire` int(10) unsigned NOT NULL DEFAULT 0,
  `page_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `page_file` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `page_url` varchar(255) DEFAULT '',
  `page_size` int(10) unsigned NOT NULL DEFAULT 0,
  `page_count` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `page_filecount` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`page_id`),
  KEY `page_cat` (`page_cat`),
  KEY `page_alias` (`page_alias`),
  KEY `page_date` (`page_date`),
  KEY `page_ownerid` (`page_ownerid`),
  KEY `page_begin` (`page_begin`),
  KEY `page_expire` (`page_expire`),
  KEY `page_title` (`page_title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_pages`
--

LOCK TABLES `cot_pages` WRITE;
/*!40000 ALTER TABLE `cot_pages` DISABLE KEYS */;
INSERT INTO `cot_pages` VALUES (1,'',0,'news','Welcome!','','','','','Congratulations, Cotonti was successfully installed! You can now login with the user account you created during installation. Next step is to go to the Administration panel and change the settings for your website, such as the title, server settings, language, user groups and extensions. You can now safely remove or edit this post as needed.','','',1,1790760736,1790760736,0,0,0,'',0,0,0);
/*!40000 ALTER TABLE `cot_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_pfs`
--

DROP TABLE IF EXISTS `cot_pfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_pfs` (
  `pfs_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pfs_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `pfs_date` int(10) unsigned NOT NULL DEFAULT 0,
  `pfs_file` varchar(255) NOT NULL DEFAULT '',
  `pfs_extension` varchar(8) NOT NULL DEFAULT '',
  `pfs_folderid` int(10) unsigned NOT NULL DEFAULT 0,
  `pfs_desc` varchar(255) NOT NULL DEFAULT '',
  `pfs_size` int(10) unsigned NOT NULL DEFAULT 0,
  `pfs_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`pfs_id`),
  KEY `pfs_userid` (`pfs_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_pfs`
--

LOCK TABLES `cot_pfs` WRITE;
/*!40000 ALTER TABLE `cot_pfs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_pfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_pfs_folders`
--

DROP TABLE IF EXISTS `cot_pfs_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_pfs_folders` (
  `pff_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pff_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `pff_date` int(10) unsigned NOT NULL DEFAULT 0,
  `pff_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `pff_title` varchar(255) NOT NULL DEFAULT '',
  `pff_desc` varchar(255) NOT NULL DEFAULT '',
  `pff_ispublic` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `pff_isgallery` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `pff_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`pff_id`),
  KEY `pff_userid` (`pff_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_pfs_folders`
--

LOCK TABLES `cot_pfs_folders` WRITE;
/*!40000 ALTER TABLE `cot_pfs_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_pfs_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_plugins`
--

DROP TABLE IF EXISTS `cot_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_plugins` (
  `pl_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pl_hook` varchar(255) NOT NULL,
  `pl_code` varchar(255) NOT NULL,
  `pl_part` varchar(255) NOT NULL DEFAULT '',
  `pl_title` varchar(255) NOT NULL DEFAULT '',
  `pl_file` varchar(255) NOT NULL,
  `pl_order` tinyint(3) unsigned NOT NULL DEFAULT 10,
  `pl_active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `pl_module` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`pl_id`),
  KEY `plugins_active_idx` (`pl_active`),
  KEY `plugins_code_idx` (`pl_code`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_plugins`
--

LOCK TABLES `cot_plugins` WRITE;
/*!40000 ALTER TABLE `cot_plugins` DISABLE KEYS */;
INSERT INTO `cot_plugins` VALUES (1,'module','index','main','Index','index/index.php',10,1,1),(2,'admin.extrafields.first','page','extrafields','Pages','page/page.extrafields.php',10,1,1),(3,'admin','page','admin','Pages','page/page.admin.php',10,1,1),(4,'admin.home.sidepanel','page','admin.home','Pages','page/page.admin.home.php',10,1,1),(5,'item.getItems','page','item.getItems','Pages','page/page.item.getItems.php',10,1,1),(6,'structure.extensions','page','structure','Pages','page/page.structure.php',10,1,1),(7,'extension.getPublicUrl','page','extension.getPublicUrl','Pages','page/page.extension.getPublicUrl.php',10,1,1),(8,'module','page','main','Pages','page/page.php',10,1,1),(9,'header.main','page','header','Pages','page/page.header.php',10,1,1),(10,'trashcan.api','page','trashcan','Pages','page/page.trashcan.php',10,1,1),(11,'module','users','main','Users','users/users.php',10,1,1),(12,'item.getItems','users','item.getItems','Users','users/users.item.getItems.php',10,1,1),(13,'admin.home.sidepanel','users','admin.home','Users','users/users.admin.home.php',10,1,1),(14,'admin.extrafields.first','users','extrafields','Users','users/users.extrafields.php',10,1,1),(15,'module','rss','main','RSS','rss/rss.php',10,1,1),(16,'item.getItems','forums','posts.getItems','Forums','forums/forums.posts.getItems.php',10,1,1),(17,'structure.extensions','forums','structure','Forums','forums/forums.structure.php',10,1,1),(18,'admin.extrafields.first','forums','extrafields','Forums','forums/forums.extrafields.php',10,1,1),(19,'item.getItems','forums','topics.getItems','Forums','forums/forums.topics.getItems.php',10,1,1),(20,'structure.getUrl','forums','structure.getUrl','Forums','forums/forums.structure.getUrl.php',10,1,1),(21,'module','forums','main','Forums','forums/forums.php',10,1,1),(22,'admin','forums','admin','Forums','forums/forums.admin.php',10,1,1),(23,'trashcan.api','forums','trashcan','Forums','forums/forums.trashcan.php',10,1,1),(24,'admin.users.add.first','pfs','admin.users.add','PFS','pfs/pfs.admin.users.add.php',10,1,1),(25,'page.add.tags','pfs','page.tags','PFS','pfs/pfs.page.tags.php',10,1,1),(26,'page.edit.tags','pfs','page.tags','PFS','pfs/pfs.page.tags.php',10,1,1),(27,'admin.users.edit.tags','pfs','admin.users.edit.tags','PFS','pfs/pfs.admin.users.edit.tags.php',10,1,1),(28,'admin.users.update','pfs','admin.users.update','PFS','pfs/pfs.admin.users.update.php',10,1,1),(29,'forums.editpost.tags','pfs','forums.tags','PFS','pfs/pfs.forums.tags.php',10,1,1),(30,'forums.posts.newpost.tags','pfs','forums.tags','PFS','pfs/pfs.forums.tags.php',10,1,1),(31,'forums.newtopic.tags','pfs','forums.tags','PFS','pfs/pfs.forums.tags.php',10,1,1),(32,'module','pfs','main','PFS','pfs/pfs.php',10,1,1),(33,'pm.reply.tags','pfs','pm.tags','PFS','pfs/pfs.pm.tags.php',10,1,1),(34,'pm.send.tags','pfs','pm.tags','PFS','pfs/pfs.pm.tags.php',10,1,1),(35,'comments.newcomment.tags','pfs','comments.tags','PFS','pfs/pfs.comments.tags.php',10,1,1),(36,'comments.edit.tags','pfs','comments.tags','PFS','pfs/pfs.comments.tags.php',10,1,1),(37,'header.tags','pfs','header','PFS','pfs/pfs.header.php',10,1,1),(38,'admin','pfs','admin','PFS','pfs/pfs.admin.php',10,1,1),(39,'admin.users.add.tags','pfs','admin.users.add.tags','PFS','pfs/pfs.admin.users.add.tags.php',10,1,1),(40,'header.first','pm','header.first','Private Messages','pm/pm.header.first.php',10,1,1),(41,'usertags.main','pm','usertags','Private Messages','pm/pm.usertags.php',10,1,1),(42,'users.profile.update.first','pm','useredit.first','Private Messages','pm/pm.useredit.first.php',10,1,1),(43,'users.edit.update.first','pm','useredit.first','Private Messages','pm/pm.useredit.first.php',10,1,1),(44,'users.edit.tags','pm','useredit.tags','Private Messages','pm/pm.useredit.tags.php',10,1,1),(45,'users.profile.tags','pm','useredit.tags','Private Messages','pm/pm.useredit.tags.php',10,1,1),(46,'module','pm','main','Private Messages','pm/pm.php',10,1,1),(47,'header.main','pm','header','Private Messages','pm/pm.header.php',10,1,1),(48,'forums.newtopic.newtopic.first','polls','forums.newtopic.first','Polls','polls/polls.forums.newtopic.first.php',10,1,1),(49,'forums.newtopic.first','polls','forums.include','Polls','polls/polls.forums.include.php',10,1,1),(50,'forums.editpost.first','polls','forums.include','Polls','polls/polls.forums.include.php',10,1,1),(51,'forums.posts.first','polls','forums.include','Polls','polls/polls.forums.include.php',10,1,1),(52,'forums.topics.first','polls','forums.include','Polls','polls/polls.forums.include.php',10,1,1),(53,'forums.editpost.update.done','polls','forums.editpost.done','Polls','polls/polls.forums.editpost.done.php',10,1,1),(54,'module','polls','main','Polls','polls/polls.php',10,1,1),(55,'admin','polls','admin','Polls','polls/polls.admin.php',10,1,1),(56,'forums.topics.query','polls','forums.topics.query','Polls','polls/polls.forums.topics.query.php',10,1,1),(57,'forums.posts.tags','polls','forums.posts.tags','Polls','polls/polls.forums.posts.tags.php',10,1,1),(58,'item.getItems','polls','item.getItems','Polls','polls/polls.item.getItems.php',10,1,1),(59,'index.tags','polls','index','Polls','polls/polls.index.php',10,1,1),(60,'forums.topics.loop','polls','forums.topics.loop','Polls','polls/polls.forums.topics.loop.php',10,1,1),(61,'item.delete','polls','item.delete','Polls','polls/polls.item.delete.php',10,1,1),(62,'forums.editpost.update.first','polls','forums.editpost.first','Polls','polls/polls.forums.editpost.first.php',10,1,1),(63,'forums.editpost.tags','polls','forums.editpost.tags','Polls','polls/polls.forums.editpost.tags.php',10,1,1),(64,'forums.newtopic.newtopic.done','polls','forums.newtopic.done','Polls','polls/polls.forums.newtopic.done.php',10,1,1),(65,'forums.newtopic.tags','polls','forums.newtopic.tags','Polls','polls/polls.forums.newtopic.tags.php',10,1,1),(66,'parser.last','ckeditor','anchor','CKEditor','ckeditor/ckeditor.anchor.php',10,1,0),(67,'editor','ckeditor','editor','CKEditor','ckeditor/ckeditor.editor.php',10,1,0),(68,'pfs.first','ckeditor','pfs','CKEditor','ckeditor/ckeditor.pfs.php',10,1,0),(69,'admin.home','cleaner','main','Cleaner','cleaner/cleaner.php',10,1,0),(70,'forums.posts.first','html','forums','HTML Parser','html/html.forums.php',10,1,0),(71,'parser','html','parser','HTML Parser','html/html.parser.php',10,1,0),(72,'pfs.first','html','pfs','HTML Parser','html/html.pfs.php',10,1,0),(73,'global','htmlpurifier','main','HTML Purifier','htmlpurifier/htmlpurifier.php',10,1,0),(74,'tools','ipsearch','admin','IP search','ipsearch/ipsearch.admin.php',10,1,0),(75,'global','mcaptcha','global','MathCaptcha','mcaptcha/mcaptcha.global.php',10,1,0),(76,'users.register.add.first','mcaptcha','register.validate','MathCaptcha','mcaptcha/mcaptcha.register.validate.php',10,1,0),(77,'users.register.tags','mcaptcha','register.tags','MathCaptcha','mcaptcha/mcaptcha.register.tags.php',10,1,0),(78,'index.main','indexnews','index.main','Index News','indexnews/indexnews.index.main.php',10,1,0),(79,'index.tags','indexnews','index.tags','Index News','indexnews/indexnews.index.tags.php',10,1,0),(80,'standalone','search','main','Search','search/search.php',10,1,0),(81,'header.main','search','header','Search','search/search.header.php',10,1,0),(82,'page.first','search','page.first','Search','search/search.page.first.php',10,1,0),(83,'forums.posts.first','search','forums.posts.first','Search','search/search.forums.posts.first.php',10,1,0),(84,'rc','search','rc','Search','search/search.rc.php',10,1,0),(85,'index.tags','tags','index','Tags','tags/tags.index.php',10,1,0),(86,'page.list.loop','tags','list.loop','Tags','tags/tags.list.loop.php',10,1,0),(87,'page.add.add.error','tags','page.add.edit','Tags','tags/tags.page.add.edit.php',10,1,0),(88,'page.edit.update.error','tags','page.add.edit','Tags','tags/tags.page.add.edit.php',10,1,0),(89,'page.list.tags','tags','list','Tags','tags/tags.list.php',10,1,0),(90,'item.delete','tags','item.delete','Tags','tags/tags.item.delete.php',10,1,0),(91,'forums.topics.loop','tags','forums.topics','Tags','tags/tags.forums.topics.php',10,1,0),(92,'forums.posts.tags','tags','forums.posts','Tags','tags/tags.forums.posts.php',10,1,0),(93,'admin.page.loop','tags','admin.page.loop','Tags','tags/tags.admin.page.loop.php',10,1,0),(94,'forums.editpost.tags','tags','forums.editpost.tags','Tags','tags/tags.forums.editpost.tags.php',10,1,0),(95,'tools','tags','tools','Tags','tags/tags.tools.php',10,1,0),(96,'rc','tags','rc','Tags','tags/tags.rc.php',10,1,0),(97,'page.add.add.done','tags','page.add','Tags','tags/tags.page.add.php',10,1,0),(98,'i18n.page.add.done','tags','page.add','Tags','tags/tags.page.add.php',10,1,0),(99,'page.add.tags','tags','page.add.tags','Tags','tags/tags.page.add.tags.php',10,1,0),(100,'i18n.page.translate.tags','tags','page.add.tags','Tags','tags/tags.page.add.tags.php',10,1,0),(101,'page.tags','tags','page','Tags','tags/tags.page.php',10,1,0),(102,'forums.editpost.update.done','tags','forums.editpost','Tags','tags/tags.forums.editpost.php',10,1,0),(103,'page.edit.tags','tags','page.edit.tags','Tags','tags/tags.page.edit.tags.php',10,1,0),(104,'i18n.page.edit.tags','tags','page.edit.tags','Tags','tags/tags.page.edit.tags.php',10,1,0),(105,'page.main','tags','page.main','Tags','tags/tags.page.main.php',10,1,0),(106,'page.enum.loop','tags','page.enum.loop','Tags','tags/tags.page.enum.loop.php',10,1,0),(107,'standalone','tags','main','Tags','tags/tags.php',10,1,0),(108,'page.edit.update.done','tags','page.edit.update','Tags','tags/tags.page.edit.update.php',10,1,0),(109,'i18n.page.edit.update','tags','page.edit.update','Tags','tags/tags.page.edit.update.php',10,1,0),(110,'i18n.page.delete.done','tags','i18n.page.delete.done','Tags','tags/tags.i18n.page.delete.done.php',10,1,0),(111,'forums.newtopic.newtopic.done','tags','forums.newtopic','Tags','tags/tags.forums.newtopic.php',10,1,0),(112,'forums.newtopic.newtopic.first','tags','forums.editTopic.first','Tags','tags/tags.forums.editTopic.first.php',10,1,0),(113,'forums.editpost.update.first','tags','forums.editTopic.first','Tags','tags/tags.forums.editTopic.first.php',10,1,0),(114,'forums.sections.tags','tags','forums','Tags','tags/tags.forums.php',10,1,0),(115,'ajax','tags','ajax','Tags','tags/tags.ajax.php',10,1,0),(116,'forums.newtopic.tags','tags','forums.newtopic.tags','Tags','tags/tags.forums.newtopic.tags.php',10,1,0),(117,'forums.posts.main','tags','forums.posts.main','Tags','tags/tags.forums.posts.main.php',10,1,0),(118,'global','tags','global','Tags','tags/tags.global.php',10,1,0),(119,'page.tags','ratings','page.tags','Star Ratings','ratings/ratings.page.tags.php',10,1,0),(120,'tools','ratings','admin','Star Ratings','ratings/ratings.admin.php',10,1,0),(121,'admin.config.edit.main','ratings','admin.config','Star Ratings','ratings/ratings.admin.config.php',10,1,0),(122,'admin.structure.first','ratings','admin.config','Star Ratings','ratings/ratings.admin.config.php',10,1,0),(123,'page.list.loop','ratings','list.loop','Star Ratings','ratings/ratings.list.loop.php',10,1,0),(124,'rc','ratings','rc','Star Ratings','ratings/ratings.rc.php',10,1,0),(125,'ajax','ratings','ajax','Star Ratings','ratings/ratings.ajax.php',10,1,0),(126,'extension.install.done','ratings','extension.install.done','Star Ratings','ratings/ratings.extension.install.done.php',10,1,0),(127,'page.list.tags','ratings','list.tags','Star Ratings','ratings/ratings.list.tags.php',10,1,0),(128,'page.delete.done','ratings','page.delete.done','Star Ratings','ratings/ratings.page.delete.done.php',10,1,0),(129,'page.list.query','comments','list.query','Comments system','comments/comments.list.query.php',10,1,0),(130,'search.list','comments','search.list','Comments system','comments/comments.search.list.php',10,1,0),(131,'extension.install.done','comments','extension.install.done','Comments system','comments/comments.extension.install.done.php',10,1,0),(132,'item.delete','comments','item.delete','Comments system','comments/comments.item.delete.php',10,1,0),(133,'trashcan.api','comments','trashcan','Comments system','comments/comments.trashcan.php',10,1,0),(134,'rss.create','comments','rss.create','Comments system','comments/comments.rss.create.php',10,1,0),(135,'polls.index.tags','comments','polls.index.tags','Comments system','comments/comments.polls.index.tags.php',10,1,0),(136,'search.first','comments','search.first','Comments system','comments/comments.search.first.php',10,1,0),(137,'extension.getPublicUrl','comments','extension.getPublicUrl','Comments system','comments/comments.extension.getPublicUrl.php',10,1,0),(138,'item.getItems','comments','item.getItems','Comments system','comments/comments.item.getItems.php',10,1,0),(139,'statistics.user','comments','statistics.user','Comments system','comments/comments.statistics.user.php',10,1,0),(140,'statistics.tags','comments','statistics.tags','Comments system','comments/comments.statistics.tags.php',10,1,0),(141,'page.list.tags','comments','list.tags','Comments system','comments/comments.list.tags.php',10,1,0),(142,'recentitems.recentpages.query','comments','recentitems.recentpages.query','Comments system','comments/comments.recentitems.recentpages.query.php',10,1,0),(143,'page.tags','comments','page.tags','Comments system','comments/comments.page.tags.php',10,1,0),(144,'polls.view.tags','comments','polls.view.tags','Comments system','comments/comments.polls.view.tags.php',10,1,0),(145,'recentitems.recentpages.tags','comments','recentitems.recentpages.tags','Comments system','comments/comments.recentitems.recentpages.tags.php',10,1,0),(146,'page.list.loop','comments','list.loop','Comments system','comments/comments.list.loop.php',10,1,0),(147,'admin.config.edit.main','comments','admin.config','Comments system','comments/comments.admin.config.php',10,1,0),(148,'admin.structure.first','comments','admin.config','Comments system','comments/comments.admin.config.php',10,1,0),(149,'polls.viewall.tags','comments','polls.viewall.tags','Comments system','comments/comments.polls.viewall.tags.php',10,1,0),(150,'admin.extrafields.first','comments','extrafields','Comments system','comments/comments.extrafields.php',10,1,0),(151,'admin.home.mainpanel','comments','admin.home','Comments system','comments/comments.admin.home.php',10,1,0),(152,'input','urleditor','input','URL Editor','urleditor/urleditor.input.php',5,1,0),(153,'tools','urleditor','admin','URL Editor','urleditor/urleditor.admin.php',10,1,0);
/*!40000 ALTER TABLE `cot_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_pm`
--

DROP TABLE IF EXISTS `cot_pm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_pm` (
  `pm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pm_date` int(10) unsigned NOT NULL DEFAULT 0,
  `pm_fromuserid` int(10) unsigned NOT NULL,
  `pm_fromuser` varchar(100) NOT NULL DEFAULT '',
  `pm_touserid` int(10) unsigned NOT NULL DEFAULT 0,
  `pm_title` varchar(255) NOT NULL DEFAULT '',
  `pm_text` text NOT NULL,
  `pm_fromstate` tinyint(4) NOT NULL DEFAULT 0,
  `pm_tostate` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pm_id`),
  KEY `pm_fromuserid` (`pm_fromuserid`),
  KEY `pm_touserid` (`pm_touserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_pm`
--

LOCK TABLES `cot_pm` WRITE;
/*!40000 ALTER TABLE `cot_pm` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_pm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_polls`
--

DROP TABLE IF EXISTS `cot_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_polls` (
  `poll_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `poll_type` varchar(10) NOT NULL DEFAULT 'index',
  `poll_code` varchar(255) NOT NULL DEFAULT '',
  `poll_state` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `poll_creationdate` int(10) unsigned NOT NULL DEFAULT 0,
  `poll_text` varchar(255) NOT NULL,
  `poll_multiple` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`poll_id`),
  KEY `poll_type_idx` (`poll_type`),
  KEY `poll_creationdate` (`poll_creationdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_polls`
--

LOCK TABLES `cot_polls` WRITE;
/*!40000 ALTER TABLE `cot_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_polls_options`
--

DROP TABLE IF EXISTS `cot_polls_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_polls_options` (
  `po_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `po_pollid` mediumint(8) unsigned NOT NULL,
  `po_text` varchar(128) NOT NULL,
  `po_count` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`po_id`),
  KEY `po_pollid` (`po_pollid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_polls_options`
--

LOCK TABLES `cot_polls_options` WRITE;
/*!40000 ALTER TABLE `cot_polls_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_polls_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_polls_voters`
--

DROP TABLE IF EXISTS `cot_polls_voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_polls_voters` (
  `pv_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pv_pollid` mediumint(8) unsigned NOT NULL,
  `pv_userid` int(10) unsigned NOT NULL,
  `pv_userip` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`pv_id`),
  KEY `pv_pollid` (`pv_pollid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_polls_voters`
--

LOCK TABLES `cot_polls_voters` WRITE;
/*!40000 ALTER TABLE `cot_polls_voters` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_polls_voters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_rated`
--

DROP TABLE IF EXISTS `cot_rated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_rated` (
  `rated_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rated_code` varchar(255) DEFAULT NULL,
  `rated_area` varchar(64) NOT NULL DEFAULT '',
  `rated_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `rated_value` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rated_date` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`rated_id`),
  KEY `rated_area` (`rated_area`,`rated_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_rated`
--

LOCK TABLES `cot_rated` WRITE;
/*!40000 ALTER TABLE `cot_rated` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_rated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_ratings`
--

DROP TABLE IF EXISTS `cot_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_ratings` (
  `rating_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rating_code` varchar(255) NOT NULL DEFAULT '',
  `rating_area` varchar(64) NOT NULL DEFAULT '',
  `rating_state` tinyint(4) NOT NULL DEFAULT 0,
  `rating_average` decimal(5,2) NOT NULL DEFAULT 0.00,
  `rating_creationdate` int(10) unsigned NOT NULL DEFAULT 0,
  `rating_text` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`rating_id`),
  KEY `rating_area` (`rating_area`,`rating_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_ratings`
--

LOCK TABLES `cot_ratings` WRITE;
/*!40000 ALTER TABLE `cot_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_server_events`
--

DROP TABLE IF EXISTS `cot_server_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_server_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `event` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `server_events_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_server_events`
--

LOCK TABLES `cot_server_events` WRITE;
/*!40000 ALTER TABLE `cot_server_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_server_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_server_events_observers`
--

DROP TABLE IF EXISTS `cot_server_events_observers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_server_events_observers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `last_event_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `server_events_observers_user_id_idx` (`user_id`),
  KEY `server_events_observers_created_at_idx` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_server_events_observers`
--

LOCK TABLES `cot_server_events_observers` WRITE;
/*!40000 ALTER TABLE `cot_server_events_observers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_server_events_observers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_structure`
--

DROP TABLE IF EXISTS `cot_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_structure` (
  `structure_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `structure_area` varchar(64) NOT NULL,
  `structure_code` varchar(255) NOT NULL,
  `structure_path` varchar(255) NOT NULL,
  `structure_tpl` varchar(128) DEFAULT '',
  `structure_title` varchar(128) NOT NULL,
  `structure_desc` varchar(255) DEFAULT '',
  `structure_icon` varchar(128) DEFAULT '',
  `structure_locked` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `structure_count` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`structure_id`),
  KEY `structure_code` (`structure_code`),
  KEY `structure_path` (`structure_path`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_structure`
--

LOCK TABLES `cot_structure` WRITE;
/*!40000 ALTER TABLE `cot_structure` DISABLE KEYS */;
INSERT INTO `cot_structure` VALUES (1,'page','articles','001','','Articles','','',0,0),(2,'page','system','999','','System','','',0,0),(3,'page','events','002','','Events','','',0,0),(4,'page','news','003','','News','','',0,1),(5,'forums','pub','1','','Public','','images/icons/default/modules/forums/forum.png',0,0),(6,'forums','general','1.1','','General discussion','General discussion','images/icons/default/modules/forums/forum.png',0,0),(7,'forums','offtopic','1.2','','Off-topic','Various and off-topic','images/icons/default/modules/forums/forum.png',0,0);
/*!40000 ALTER TABLE `cot_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_tag_references`
--

DROP TABLE IF EXISTS `cot_tag_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_tag_references` (
  `tag` varchar(255) NOT NULL,
  `tag_item` int(10) unsigned NOT NULL,
  `tag_area` varchar(64) NOT NULL DEFAULT 'page',
  PRIMARY KEY (`tag`,`tag_area`,`tag_item`),
  KEY `tag_area` (`tag_area`),
  KEY `tag_area_item` (`tag_area`,`tag_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_tag_references`
--

LOCK TABLES `cot_tag_references` WRITE;
/*!40000 ALTER TABLE `cot_tag_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_tag_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_tags`
--

DROP TABLE IF EXISTS `cot_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_tags` (
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_tags`
--

LOCK TABLES `cot_tags` WRITE;
/*!40000 ALTER TABLE `cot_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cot_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_updates`
--

DROP TABLE IF EXISTS `cot_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_updates` (
  `upd_param` varchar(255) NOT NULL,
  `upd_value` varchar(255) NOT NULL,
  PRIMARY KEY (`upd_param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_updates`
--

LOCK TABLES `cot_updates` WRITE;
/*!40000 ALTER TABLE `cot_updates` DISABLE KEYS */;
INSERT INTO `cot_updates` VALUES ('branch','siena'),('revision','0.9.23');
/*!40000 ALTER TABLE `cot_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cot_users`
--

DROP TABLE IF EXISTS `cot_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cot_users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_banexpire` int(10) unsigned NOT NULL DEFAULT 0,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(224) NOT NULL DEFAULT '',
  `user_passfunc` varchar(32) NOT NULL DEFAULT 'sha256',
  `user_passsalt` varchar(16) NOT NULL DEFAULT '',
  `user_maingrp` mediumint(8) unsigned NOT NULL DEFAULT 4,
  `user_country` char(2) DEFAULT '',
  `user_timezone` varchar(32) NOT NULL DEFAULT 'UTC',
  `user_text` text DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_gender` char(1) DEFAULT 'U',
  `user_email` varchar(64) NOT NULL DEFAULT '',
  `user_hideemail` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `user_theme` varchar(32) DEFAULT '',
  `user_scheme` varchar(32) DEFAULT '',
  `user_lang` varchar(16) DEFAULT '',
  `user_regdate` int(10) unsigned NOT NULL DEFAULT 0,
  `user_lastlog` int(10) unsigned NOT NULL DEFAULT 0,
  `user_lastvisit` int(10) unsigned NOT NULL DEFAULT 0,
  `user_lastip` varchar(64) DEFAULT '',
  `user_logcount` int(10) unsigned NOT NULL DEFAULT 0,
  `user_sid` char(64) DEFAULT '',
  `user_sidtime` int(10) unsigned NOT NULL DEFAULT 0,
  `user_lostpass` char(32) DEFAULT '',
  `user_auth` mediumtext DEFAULT NULL,
  `user_token` char(16) DEFAULT '',
  `user_postcount` int(10) unsigned NOT NULL DEFAULT 0,
  `user_pmnotify` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `user_newpm` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  KEY `user_password` (`user_password`),
  KEY `user_regdate` (`user_regdate`),
  KEY `user_name` (`user_name`),
  KEY `user_maingrp` (`user_maingrp`),
  KEY `user_email` (`user_email`),
  KEY `user_sid` (`user_sid`),
  KEY `user_lostpass` (`user_lostpass`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cot_users`
--

LOCK TABLES `cot_users` WRITE;
/*!40000 ALTER TABLE `cot_users` DISABLE KEYS */;
INSERT INTO `cot_users` VALUES (1,0,'admin','40bf765b5ebca84410f2029b8e8685c536dcca6659ad2a0274be8e778a6ad1d9','sha256','1234567890abcdef',5,'','UTC',NULL,NULL,'U','admin@example.com',1,'nemesis','default','en',1790760710,0,0,'127.0.0.1',0,'',0,'',NULL,'',0,1,0);
/*!40000 ALTER TABLE `cot_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30  9:32:44
