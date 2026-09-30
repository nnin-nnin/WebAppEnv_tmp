/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: subrion
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
-- Current Database: `subrion`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `subrion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `subrion`;

--
-- Table structure for table `ia_acl_objects`
--

DROP TABLE IF EXISTS `ia_acl_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_acl_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pre_object` char(40) NOT NULL,
  `object` char(30) NOT NULL,
  `action` char(15) NOT NULL DEFAULT 'read',
  `access` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `module` char(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_acl_objects`
--

LOCK TABLES `ia_acl_objects` WRITE;
/*!40000 ALTER TABLE `ia_acl_objects` DISABLE KEYS */;
INSERT INTO `ia_acl_objects` VALUES (1,'admin_access','admin_access','read',0,''),(2,'admin_page','blocks','smarty',1,''),(3,'admin_page','blocks','plain',1,''),(4,'admin_page','blocks','php',1,''),(5,'admin_page','blocks','html',1,''),(6,'admin_page','blocks','edit',1,''),(7,'admin_page','blocks','visual',0,''),(8,'admin_page','blocks','order',0,''),(9,'admin_page','configuration','edit',0,''),(10,'admin_page','database','sql',1,''),(11,'admin_page','database','export',0,''),(12,'admin_page','database','import',0,''),(13,'admin_page','database','consistency',1,''),(14,'admin_page','database','reset',1,''),(15,'admin_page','fields','members',0,''),(16,'admin_page','index','cache',1,''),(17,'admin_page','index','debugmode',0,''),(18,'admin_page','index','phpinfo',0,''),(19,'admin_page','index','sitemap',1,''),(20,'admin_page','members','add',1,''),(21,'admin_page','members','edit',0,''),(22,'admin_page','members','password',0,''),(23,'admin_page','members','usergroup',0,''),(24,'admin_page','menus','add',1,''),(25,'admin_page','menus','edit',1,''),(26,'admin_page','packages','activate',0,''),(27,'admin_page','packages','set_default',0,''),(28,'admin_page','packages','uninstall',0,''),(29,'admin_page','packages','install',0,''),(30,'admin_page','packages','upgrade',0,''),(31,'admin_page','pages','add',1,''),(32,'admin_page','pages','edit',1,''),(33,'admin_page','pages','home',0,''),(34,'admin_page','plans','add',1,''),(35,'admin_page','plans','edit',1,''),(36,'admin_page','plans','delete',1,''),(37,'admin_page','plugins','install',1,''),(38,'admin_page','plugins','uninstall',0,''),(39,'admin_page','plugins','reinstall',0,''),(40,'admin_page','plugins','update',0,''),(41,'admin_page','blog','read',1,'blog'),(42,'admin_page','blog','add',1,'blog'),(43,'admin_page','blog','edit',1,'blog'),(44,'admin_page','blog','delete',1,'blog'),(45,'page','blog','read',1,'blog'),(46,'page','blog','add',0,'blog'),(47,'page','blog','edit',0,'blog'),(48,'page','blog','delete',0,'blog');
/*!40000 ALTER TABLE `ia_acl_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_acl_privileges`
--

DROP TABLE IF EXISTS `ia_acl_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_acl_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('user','group','plan') NOT NULL DEFAULT 'group',
  `type_id` mediumint(8) unsigned NOT NULL,
  `access` tinyint(1) unsigned NOT NULL,
  `action` varchar(15) NOT NULL DEFAULT 'read',
  `object` varchar(50) NOT NULL,
  `object_id` varchar(150) NOT NULL DEFAULT '0',
  `module` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`type`,`type_id`,`action`,`object`,`object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_acl_privileges`
--

LOCK TABLES `ia_acl_privileges` WRITE;
/*!40000 ALTER TABLE `ia_acl_privileges` DISABLE KEYS */;
INSERT INTO `ia_acl_privileges` VALUES (1,'group',4,0,'read','page','member_funds',''),(2,'group',4,0,'read','page','profile',''),(3,'group',8,1,'read','page','profile','');
/*!40000 ALTER TABLE `ia_acl_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_admin_actions`
--

DROP TABLE IF EXISTS `ia_admin_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_admin_actions` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `attributes` tinytext NOT NULL,
  `module` varchar(40) NOT NULL,
  `pages` tinytext NOT NULL,
  `text` varchar(50) DEFAULT NULL,
  `type` enum('regular','dashboard') DEFAULT 'regular',
  `order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TYPE` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_admin_actions`
--

LOCK TABLES `ia_admin_actions` WRITE;
/*!40000 ALTER TABLE `ia_admin_actions` DISABLE KEYS */;
INSERT INTO `ia_admin_actions` VALUES (1,'members','members/','list','','','members:add,members:edit,usergroups:read','','regular',1),(2,'add_member','members/add/','user','','','members:read,members:edit,usergroups','','regular',2),(3,'usergroups','usergroups/','grid','','','members,usergroups:add','','regular',3),(4,'add_usergroup','usergroups/add/','users','','','usergroups:read','','regular',4),(5,'fields','fields/members/','signup','','','members,usergroups','','regular',5),(6,'delete','javascript:;','remove','id=\"js-delete-block\"','','blocks:edit','','regular',1),(7,'blocks','blocks/','grid','','','blocks:add,blocks:edit','','regular',2),(8,'add_block','blocks/create/','plus-alt','','','blocks','','regular',3),(9,'sql_management','database/sql/','database','','','database','','regular',1),(10,'reset','database/reset/','loop','','','database','','regular',2),(11,'consistency','database/consistency/','spinner','','','database','','regular',3),(12,'export','database/export/','box-remove','','','database','','regular',5),(13,'import','database/import/','box-add','','','database','','regular',6),(14,'fields','fields/','list','','','fields:edit,members_fields','','regular',1),(15,'add_field','fields/add/','plus-alt','','','fields,members_fields','','regular',2),(16,'field_groups','fieldgroups/','list-2','','','fieldgroups,members_fields','','regular',3),(17,'add_fieldgroup','fieldgroups/add/','folder-plus','','','fieldgroups,members_fields','','regular',4),(18,'image_types','image-types/','list','','','imagetypes:edit','','regular',1),(19,'add_image_type','image-types/add/','plus-alt','','','imagetypes','','regular',2),(20,'add_invoice','invoices/add/','plus-alt','','','invoices,invoices:edit','','regular',1),(21,'languages','languages/','list','','','languages','','regular',1),(22,'new_language','languages/add/','copy','','','languages','','regular',2),(23,'download','languages/download/','box-remove','','','languages','','regular',3),(24,'add_phrase','javascript:;','plus-alt','id=\"js-add-phrase-cmd\"','','languages,phrases','','regular',4),(25,'languages_comparison','languages/comparison/','link-2','','','languages','','regular',5),(26,'menus','menus/','list','','','menus:add,menus:edit','','regular',3),(27,'add_menu','menus/add/','plus-alt','','','menus','','regular',4),(28,'delete','javascript:;','remove','id=\"js-delete-page\"','','pages:edit','','regular',1),(29,'pages','pages/','list','','','pages:add,pages:edit','','regular',2),(30,'add_page','pages/add/','plus-alt','','','pages','','regular',3),(31,'plans','plans/','list','','','plans:add,plans:edit','','regular',3),(32,'add_plan','plans/add/','plus-alt','','','plans','','regular',4),(33,'print_invoice','invoices/printable/:id/','file','target=\"_blank\"','','invoices:edit','','regular',2),(34,'add_transaction','javascript:;','plus','id=\"js-add-transaction-cmd\"','','transactions','','regular',1),(35,'tags','javascript:;','eye','id=\"js-view-tags\"','','email_templates','','regular',1),(36,'blocks','blocks/','grid','','','','','dashboard',0),(37,'add_page','pages/add/','copy','','','','','dashboard',0),(38,'blogposts','blog/','list','','blog','blog:add,blog:edit','','regular',7),(39,'add_blog_entry','blog/add/','plus','','blog','blog:read,blog:edit','','regular',8),(40,'dashboard_blogpost_add','blog/add/','quill','','blog','','','dashboard',9);
/*!40000 ALTER TABLE `ia_admin_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_admin_pages`
--

DROP TABLE IF EXISTS `ia_admin_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_admin_pages` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group` smallint(4) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `alias` varchar(150) NOT NULL,
  `module` varchar(40) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `attr` varchar(150) DEFAULT NULL,
  `menus` set('menu','header') NOT NULL DEFAULT 'menu',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `action` char(15) NOT NULL DEFAULT 'read',
  `parent` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `NAME` (`name`),
  KEY `ALIAS` (`alias`),
  KEY `GROUP` (`group`),
  KEY `MENUS` (`menus`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_admin_pages`
--

LOCK TABLES `ia_admin_pages` WRITE;
/*!40000 ALTER TABLE `ia_admin_pages` DISABLE KEYS */;
INSERT INTO `ia_admin_pages` VALUES (1,0,'index',0,'','','index',NULL,'menu','active',0,'read',''),(2,0,'actions',0,'actions/','','actions',NULL,'','active',1,'read',''),(3,0,'',20,'','','',NULL,'header','active',0,'',''),(4,0,'adminer',25,'adminer/','','adminer',NULL,'header','active',0,'read',''),(5,0,'',30,'','','',NULL,'header','active',0,'',''),(6,0,'visual_mode',0,'visual-mode/','','visual','target=\"_blank\"','','active',1,'visual','blocks'),(7,1,'',0,'','','','sys_mgmt','menu','active',0,'',''),(8,1,'configuration',5,'configuration/','','configuration',NULL,'header','active',0,'read',''),(9,1,'database',10,'database/','','database',NULL,'menu,header','active',0,'read',''),(10,1,'languages',15,'languages/','','languages',NULL,'menu','active',0,'read',''),(11,1,'hooks',20,'hooks/','','hooks',NULL,'menu','active',0,'read',''),(12,1,'scheduled_tasks',22,'scheduled-tasks/','','scheduled-tasks',NULL,'menu','active',0,'read',''),(13,1,'',25,'','','','sys_email','menu','active',0,'',''),(14,1,'email_templates',30,'email-templates/','','email-templates',NULL,'menu','active',0,'read',''),(15,1,'',35,'','','','sys_extra','menu','active',0,'',''),(16,1,'clear_cache',37,'clear/cache/','','index',NULL,'menu,header','active',0,'cache','index'),(17,1,'phpinfo',40,'phpinfo/','','index',NULL,'menu,header','active',0,'phpinfo','index'),(18,1,'debugmode',41,'debug-mode/','','index',NULL,'','active',0,'debugmode','index'),(19,1,'sitemap',45,'sitemap/','','index',NULL,'menu,header','active',0,'sitemap','index'),(20,2,'pages',5,'pages/','','pages',NULL,'menu','active',0,'read',''),(21,2,'menus',10,'menus/','','menus',NULL,'menu','active',0,'read',''),(22,2,'blocks',15,'blocks/','','blocks',NULL,'menu','active',0,'read',''),(23,2,'phrases',20,'languages/phrases/','','languages',NULL,'menu','active',0,'read',''),(24,2,'uploads',25,'uploads/','','uploads',NULL,'menu','active',0,'read',''),(25,2,'',25,'','','','ctnt_ext','menu','active',0,'',''),(26,2,'fieldgroups',30,'fieldgroups/','','fieldgroups',NULL,'menu','active',0,'read',''),(27,2,'fields',35,'fields/','','fields',NULL,'menu','active',0,'read',''),(28,2,'imagetypes',40,'image-types/','','image-types',NULL,'menu','active',0,'read',''),(29,2,'',45,'','','','ctnt_xtns','menu','active',0,'',''),(30,3,'members',5,'members/','','members',NULL,'menu','active',0,'read',''),(31,3,'usergroups',10,'usergroups/','','usergroups',NULL,'menu,header','active',0,'read',''),(32,3,'',15,'','','','mbr_ext','menu','active',0,'',''),(33,3,'permissions',20,'permissions/','','permissions',NULL,'menu','active',0,'read','index'),(34,3,'members_fields',25,'fields/members/','','fields',NULL,'menu','active',0,'members','fields'),(35,4,'plans',5,'plans/','','plans',NULL,'menu','active',0,'read',''),(36,4,'subscriptions',10,'subscriptions/','','subscriptions',NULL,'menu','active',0,'read',''),(37,4,'transactions',15,'transactions/','','transactions',NULL,'menu','active',0,'read',''),(38,4,'invoices',20,'invoices/','','invoices',NULL,'menu','active',0,'read',''),(39,5,'templates',5,'modules/templates/','','modules',NULL,'menu','active',0,'read',''),(40,5,'plugins',10,'modules/plugins/','','modules',NULL,'menu','active',0,'read',''),(41,5,'packages',15,'modules/packages/','','modules',NULL,'menu','active',0,'read',''),(42,5,'',20,'','','','xtns_empt','menu','active',0,'',''),(43,2,'blog',50,'blog/','blog','',NULL,'menu','active',0,'read','');
/*!40000 ALTER TABLE `ia_admin_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_admin_pages_groups`
--

DROP TABLE IF EXISTS `ia_admin_pages_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_admin_pages_groups` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `order` smallint(4) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_admin_pages_groups`
--

LOCK TABLES `ia_admin_pages_groups` WRITE;
/*!40000 ALTER TABLE `ia_admin_pages_groups` DISABLE KEYS */;
INSERT INTO `ia_admin_pages_groups` VALUES (1,0,'system',''),(2,0,'content',''),(3,0,'members',''),(4,0,'financial',''),(5,0,'extensions','');
/*!40000 ALTER TABLE `ia_admin_pages_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_api_tokens`
--

DROP TABLE IF EXISTS `ia_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_api_tokens` (
  `key` char(32) NOT NULL,
  `member_id` int(11) unsigned DEFAULT NULL,
  `expires` datetime NOT NULL,
  `ip` bigint(12) NOT NULL,
  `session` char(32) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_api_tokens`
--

LOCK TABLES `ia_api_tokens` WRITE;
/*!40000 ALTER TABLE `ia_api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_blocks`
--

DROP TABLE IF EXISTS `ia_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_blocks` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contents` text DEFAULT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `position` varchar(30) NOT NULL DEFAULT 'left',
  `type` enum('plain','smarty','php','html','menu') NOT NULL DEFAULT 'plain',
  `module` varchar(40) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `header` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `collapsible` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `collapsed` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `sticky` tinyint(1) unsigned NOT NULL,
  `rss` tinytext NOT NULL,
  `tpl` varchar(64) NOT NULL DEFAULT '',
  `external` tinyint(1) NOT NULL DEFAULT 0,
  `filename` text DEFAULT NULL,
  `removable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `subpages` text DEFAULT NULL,
  `classname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`name`,`module`),
  KEY `STATUS` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_blocks`
--

LOCK TABLES `ia_blocks` WRITE;
/*!40000 ALTER TABLE `ia_blocks` DISABLE KEYS */;
INSERT INTO `ia_blocks` VALUES (2,'inventory','',0,'inventory','menu','','active',0,0,0,1,'','render-menu.tpl',0,'',0,'',''),(3,'main','',0,'mainmenu','menu','','active',0,0,0,1,'','render-menu.tpl',0,'',0,'',''),(4,'account','',0,'account','menu','','active',0,0,0,1,'','render-menu.tpl',0,'',0,'',''),(5,'bottom','',0,'copyright','menu','','active',0,0,0,1,'','render-menu.tpl',0,'',0,'',''),(6,'common_statistics','',1,'right','smarty','','active',1,0,0,0,'','',1,'block.common-statistics.tpl',0,'','box--border'),(7,'filters','$iaView = &$iaCore->iaView;\r\n\r\nif (($itemName = $iaView->get(\'filtersItemName\'))\r\n	|| (($itemName = str_replace(\'search_\', \'\', $iaView->name())) && $itemName != $iaView->name()))\r\n{\r\n	$iaView->iaSmarty->assign(\'filters\', $iaCore->factory(\'search\', iaCore::FRONT)->getFilters($itemName));\r\n\r\n	echo $iaView->iaSmarty->fetch(\'block.filters.tpl\');\r\n}',1,'left','php','','active',1,1,0,1,'','',0,'',1,'','box--border'),(8,'header',NULL,2,'teaser','html','kickstart','active',0,0,0,0,'','',0,'',1,NULL,''),(9,'landing_what_is_this','<p class=\"lead text-center\">This is your Subrion CMS. Start editing your content right away!</p>\n<div class=\"row text-center m-t-md\">\n	<div class=\"col-md-4\">\n		<img src=\"{$img}icon-monitor.png\" width=\"100\" alt=\"\"/>\n		<h3>Landing page</h3>\n		<p class=\"text-fade-50\">This is a starting page for your website. You can change it (switch off) to display content and blocks. This can be done on Template configuration page in Admin Dashboard.</p>\n	</div>\n	<div class=\"col-md-4\">\n		<img src=\"{$img}icon-sliders.png\" width=\"100\" alt=\"\"/>\n		<h3>Configuration options</h3>\n		<p class=\"text-fade-50\"><b>Kickstart</b> template has many configuration options to play with. Go to admin panel and try to change, for example, background of header block.</p>\n	</div>\n	<div class=\"col-md-4\">\n		<img src=\"{$img}icon-browser.png\" width=\"100\" alt=\"\"/>\n		<h3>Blocks management</h3>\n		<p class=\"text-fade-50\">Each section on this page can be changed in Admin Dashboard in Blocks section, as well as all other blocks on all pages. Go give it a try!</p>\n	</div>\n</div>\n<div class=\"text-center m-t\">\n	<a class=\"btn btn-primary text-uppercase\" href=\"{$smarty.const.IA_ADMIN_URL}\">Go to admin dashboard</a>\n</div>',3,'landing','smarty','kickstart','active',1,0,0,0,'','',0,'',1,NULL,'section section-what'),(10,'landing_features',NULL,4,'landing','html','kickstart','active',1,0,0,0,'','',0,'',1,NULL,'section section-features'),(11,'landing_mobile','<div class=\"row\">\n	<div class=\"col-md-4 col-md-offset-2\">\n		<div class=\"section-mobile__text\">\n			<h2>{$block.title}</h2>\n			<p class=\"lead\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga ipsa distinctio vel aspernatur, reiciendis excepturi.</p>\n			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At animi corporis laboriosam. Maiores voluptatibus dicta ea, quo repellendus eum officiis enim non? Porro aut harum pariatur sit adipisci accusantium rem!\n			</p>\n			<p class=\"m-t\"><a href=\"#\" class=\"btn btn-warning text-uppercase\">Learn more</a> <a href=\"#\" class=\"btn btn-link\">Contact us</a></p>\n		</div>\n	</div>\n	<div class=\"col-md-4\">\n		<div class=\"section-mobile__image\">\n			<img class=\"img-responsive center-block\" src=\"{$img}section-mobile.png\" alt=\"\"/>\n		</div>\n	</div>\n</div>',5,'landing','smarty','kickstart','active',0,0,0,0,'','',0,'',1,NULL,'section section-mobile'),(12,'top',NULL,6,'top','html','kickstart','active',1,1,0,0,'','',0,'',1,NULL,''),(13,'bottom_block',NULL,7,'bottom','html','kickstart','active',1,1,0,0,'','',0,'',1,NULL,''),(14,'html_block1',NULL,8,'left','html','kickstart','active',1,1,0,1,'','',0,'',1,NULL,'box--border'),(15,'footer1',NULL,9,'footer1','html','kickstart','active',1,0,0,1,'','',0,'',1,NULL,''),(16,'footer2',NULL,10,'footer2','html','kickstart','active',1,0,0,1,'','',0,'',1,NULL,''),(17,'footer3',NULL,11,'footer3','html','kickstart','active',1,0,0,1,'','',0,'',1,NULL,''),(18,'footer4',NULL,12,'footer4','html','kickstart','active',1,0,0,1,'','',0,'',1,NULL,''),(19,'blogroll','',13,'verybottom','smarty','blog','active',1,0,0,0,'','',1,'extra:blog/block.blogroll',1,NULL,''),(20,'new_blog_posts','',14,'left','smarty','blog','active',1,0,0,1,'','',1,'extra:blog/block.new-posts',1,NULL,''),(21,'blogs_archive','',15,'left','smarty','blog','active',1,0,0,1,'','',1,'extra:blog/block.blogs-archive',1,NULL,'');
/*!40000 ALTER TABLE `ia_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_blog_entries`
--

DROP TABLE IF EXISTS `ia_blog_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_blog_entries` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `title` tinytext NOT NULL,
  `alias` varchar(155) NOT NULL,
  `body` text NOT NULL,
  `date_added` datetime NOT NULL,
  `image` tinytext NOT NULL,
  `status` enum('inactive','active') NOT NULL DEFAULT 'inactive',
  `lang` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `LANGUAGE` (`lang`),
  FULLTEXT KEY `SEARCH` (`title`,`body`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_blog_entries`
--

LOCK TABLES `ia_blog_entries` WRITE;
/*!40000 ALTER TABLE `ia_blog_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_blog_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_blog_entries_tags`
--

DROP TABLE IF EXISTS `ia_blog_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_blog_entries_tags` (
  `blog_id` mediumint(8) unsigned NOT NULL,
  `tag_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `UNIQUE` (`tag_id`,`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_blog_entries_tags`
--

LOCK TABLES `ia_blog_entries_tags` WRITE;
/*!40000 ALTER TABLE `ia_blog_entries_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_blog_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_blog_tags`
--

DROP TABLE IF EXISTS `ia_blog_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_blog_tags` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_blog_tags`
--

LOCK TABLES `ia_blog_tags` WRITE;
/*!40000 ALTER TABLE `ia_blog_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_blog_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_config`
--

DROP TABLE IF EXISTS `ia_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_config` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `config_group` varchar(50) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` text DEFAULT NULL,
  `multiple_values` text DEFAULT NULL,
  `type` enum('text','textarea','checkbox','radio','select','combo','divider','hidden','password','image','itemscheckbox','tpl','colorpicker') NOT NULL DEFAULT 'text',
  `order` smallint(5) unsigned NOT NULL,
  `module` varchar(40) NOT NULL,
  `private` tinyint(1) unsigned NOT NULL,
  `custom` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TYPE` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_config`
--

LOCK TABLES `ia_config` WRITE;
/*!40000 ALTER TABLE `ia_config` DISABLE KEYS */;
INSERT INTO `ia_config` VALUES (1,'','debug_pass','',NULL,'hidden',0,'',1,0,NULL),(2,'','tmpl','kickstart',NULL,'hidden',0,'',0,0,NULL),(3,'','baseurl','http://127.0.0.1:18643/',NULL,'hidden',0,'',0,0,NULL),(4,'','backup','backup/',NULL,'hidden',0,'',1,0,NULL),(5,'','version','4.1.0',NULL,'hidden',0,'',1,0,NULL),(6,'','cron','1',NULL,'hidden',0,'',1,0,NULL),(7,'','admin_tmpl','default',NULL,'hidden',0,'',1,0,NULL),(8,'','default_package','',NULL,'hidden',0,'',1,0,NULL),(9,'','home_page','index',NULL,'hidden',0,'',1,0,NULL),(10,'','tmpl_rollback_data','',NULL,'hidden',0,'',1,0,NULL),(11,'','tmpl_layout_data','a:2:{s:7:\"content\";a:3:{s:4:\"left\";a:2:{s:5:\"width\";i:3;s:5:\"fixed\";b:1;}s:6:\"center\";a:2:{s:5:\"width\";i:6;s:5:\"fixed\";b:0;}s:5:\"right\";a:2:{s:5:\"width\";i:3;s:5:\"fixed\";b:1;}}s:13:\"footer-blocks\";a:4:{s:7:\"footer1\";a:2:{s:5:\"width\";i:3;s:5:\"fixed\";b:0;}s:7:\"footer2\";a:2:{s:5:\"width\";i:3;s:5:\"fixed\";b:0;}s:7:\"footer3\";a:2:{s:5:\"width\";i:3;s:5:\"fixed\";b:0;}s:7:\"footer4\";a:2:{s:5:\"width\";i:3;s:5:\"fixed\";b:0;}}}',NULL,'hidden',0,'',1,0,NULL),(12,'general','','General','1','divider',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(13,'general','site','{:en:}Subrion CMS','1','text',2,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":true}'),(14,'general','bc_home','{:en:}Home',NULL,'text',3,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":true}'),(15,'general','suffix','{:en:}:: Powered by Subrion 4.1','1','text',9,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":true}'),(16,'general','site_logo','','','image',12,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(17,'general','site_favicon','','','image',13,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(18,'general','','Regional','1','divider',20,'',1,1,'{\"wysiwyg\":\"30\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(19,'general','lang','en','1','select',33,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(20,'general','language_switch','1','\'1\',\'0\'','radio',36,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(21,'general','timezone','America/New_York','','select',45,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(22,'members','','General','1','divider',1,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(23,'members','members_enabled','1','\'1\',\'0\'','radio',2,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(24,'members','members_autoapproval','1','\'1\',\'0\'','radio',3,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"members_enabled|1\",\"multilingual\":false}'),(25,'members','','HybridAuth','1','divider',5,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(26,'members','hybrid_enabled','0','\'1\',\'0\'','radio',6,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(27,'members','hybrid_debug_mode','0','\'1\',\'0\'','radio',7,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"hybrid_enabled|1\",\"multilingual\":false}'),(28,'members','','Gravatar','1','divider',10,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(29,'members','gravatar_enabled','1','\'1\',\'0\'','radio',11,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(30,'members','gravatar_size','100','1','text',12,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"gravatar_enabled|1\",\"multilingual\":false}'),(31,'members','gravatar_type','mm','\'mm\',\'identicon\',\'monsterid\',\'wavatar\',\'retro\'','select',13,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"gravatar_enabled|1\",\"multilingual\":false}'),(32,'members','gravatar_rating','g','\'g\',\'pg\',\'r\',\'x\'','select',14,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"gravatar_enabled|1\",\"multilingual\":false}'),(33,'members','gravatar_default_image','','','image',16,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"gravatar_enabled|1\",\"multilingual\":false}'),(34,'mail','','Addresses','','divider',1,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(35,'mail','site_email','info@test.com','1','text',3,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(36,'mail','bcc_email','','1','text',6,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(37,'mail','','General','1','divider',9,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(38,'mail','site_from_name','{:en:}Subrion CMS','1','text',12,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":true}'),(39,'mail','default_email_signature','{:en:}<p>______________________________</p>\r\n<p>Thank you,<br>\r\n{%SITE_NAME%} Team<br>\r\n{%SITE_URL%}</p>','1','textarea',15,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":true}'),(40,'mail','mail_function','php mail','\'php mail\',\'sendmail\',\'smtp\'','select',18,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(41,'mail','mail_test','','admin/templates/default/configuration-test-email-btn.tpl','tpl',21,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(42,'mail','','SMTP Settings','','divider',24,'',9,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|smtp\",\"multilingual\":false}'),(43,'mail','smtp_debug','0','\'1\',\'0\'','radio',26,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|smtp\",\"multilingual\":false}'),(44,'mail','smtp_auth','1','\'1\',\'0\'','radio',27,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|smtp\",\"multilingual\":false}'),(45,'mail','smtp_server','smtp.example.org','','text',30,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|smtp\",\"multilingual\":false}'),(46,'mail','smtp_port','','','text',33,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|smtp\",\"multilingual\":false}'),(47,'mail','smtp_secure','TLS','\'TLS\',\'SSL\'','select',36,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|smtp\",\"multilingual\":false}'),(48,'mail','smtp_user','','','text',39,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|smtp\",\"multilingual\":false}'),(49,'mail','smtp_password','','','password',42,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|smtp\",\"multilingual\":false}'),(50,'mail','','Sendmail Settings','','divider',45,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|sendmail\",\"multilingual\":false}'),(51,'mail','sendmail_path','/usr/bin/sendmail','','text',48,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"mail_function|sendmail\",\"multilingual\":false}'),(52,'mail','mimetype','1','\'1\',\'0\'','radio',51,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(53,'system','','Setup','1','divider',0,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(54,'system','admin_page','panel',NULL,'text',0,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(55,'system','https','0','\'1\',\'0\'','radio',1,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(56,'system','frontend','1','\'1\',\'0\'','radio',2,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(57,'system','underconstruction','We are sorry. Our site is under construction.','','textarea',3,'',1,1,'{\"wysiwyg\":\"1\",\"code_editor\":\"0\",\"show\":\"frontend|0\",\"multilingual\":false}'),(58,'system','','Admin Panel Settings','1','divider',10,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(59,'system','display_feedbacks','1','\'1\',\'0\'','radio',11,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(60,'system','display_changelog','1','\'1\',\'0\'','radio',12,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(61,'system','display_twitter','1','\'1\',\'0\'','hidden',13,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(62,'system','check_for_updates','1','\'1\',\'0\'','radio',14,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(63,'system','auto_apply_critical_upgrades','1','\'1\',\'0\'','radio',15,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"check_for_updates|1\",\"multilingual\":false}'),(64,'system','allow_remote_templates','1','\'1\',\'0\'','radio',16,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(65,'system','sap_style','default','calmy,darkness,default,gebeus-waterfall,radiant-orchid,roseus','select',17,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(66,'system','','System configuration','1','divider',20,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(67,'system','alias_urlencode','0','\'1\',\'0\'','radio',21,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(68,'system','redirect_time','4000','','text',22,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(69,'system','prevent_csrf','1','\'1\',\'0\'','radio',23,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(70,'system','caching','0','\'1\',\'0\'','hidden',24,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(71,'system','smarty_cache','0','\'1\',\'0\'','radio',25,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(72,'system','compress_js','0','\'1\',\'0\'','radio',26,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(73,'pictures','thumb_w','150','','hidden',9,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(74,'pictures','thumb_h','150','','hidden',12,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(75,'pictures','','Watermark','1','divider',13,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(76,'pictures','watermark','0','\'1\',\'0\'','radio',14,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(77,'pictures','watermark_position','bottom_right','\'top_left\',\'top_center\',\'top_right\',\'middle_left\',\'middle_center\',\'middle_right\',\'bottom_left\',\'bottom_center\',\'bottom_right\'','select',15,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"watermark|1\",\"multilingual\":false}'),(78,'pictures','watermark_opacity','75','','text',19,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"watermark|1\",\"multilingual\":false}'),(79,'pictures','watermark_type','text','\'text\',\'image\'','select',16,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(80,'pictures','watermark_text','@ Your Website','','text',17,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"watermark_type|text\",\"multilingual\":false}'),(81,'pictures','watermark_text_color','FFFFFF','','text',18,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"watermark_type|text\",\"multilingual\":false}'),(82,'pictures','watermark_text_size','20','','text',19,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"watermark_type|text\",\"multilingual\":false}'),(83,'pictures','watermark_image','','','image',20,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"watermark_type|image\",\"multilingual\":false}'),(84,'pictures','lightbox','Lightbox','','divider',21,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(85,'pictures','lightbox_name','fancybox','fancybox,fancybox,fancybox','select',24,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(86,'miscellaneous','','Frontend code integration','','divider',1,'',1,1,''),(87,'miscellaneous','frontend_header_code','','','textarea',2,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\"'),(88,'miscellaneous','frontend_footer_code','','','textarea',3,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\"'),(89,'miscellaneous','','Open Graph','','divider',4,'',1,1,''),(90,'miscellaneous','opengraph_description','{:en:}','','textarea',5,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":true}'),(91,'miscellaneous','opengraph_image','','','image',6,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(92,'miscellaneous','','CKeditor','','divider',7,'',1,1,''),(93,'miscellaneous','ckeditor_skin','moono-lisa','\'moono-lisa\',\'moonocolor\'','select',8,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(94,'miscellaneous','','Captcha','','divider',9,'',1,1,''),(95,'miscellaneous','captcha','1','\'1\',\'0\'','radio',10,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(96,'miscellaneous','captcha_name','kcaptcha','kcaptcha,kcaptcha,kcaptcha','select',11,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"captcha|1\",\"multilingual\":false}'),(97,'miscellaneous','captcha_preview','','','text',12,'',0,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"captcha|1\",\"multilingual\":false}'),(98,'miscellaneous','','Search','','divider',13,'',1,1,''),(99,'miscellaneous','search_instant','1','\'1\',\'0\'','radio',14,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(100,'financial','','General','1','divider',1,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(101,'financial','currency','USD','','text',1,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(102,'financial','funds_min_deposit','20','','text',2,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(103,'financial','funds_max_deposit','300','','text',3,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(104,'financial','funds_max','1000','','text',4,'',0,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(105,'api','','General','1','divider',1,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(106,'api','api_enabled','0','\'1\',\'0\'','radio',1,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(107,'api','api_push_access_key','','','text',2,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"api_enabled|1\",\"multilingual\":false}'),(108,'api','api_token','','','password',3,'',1,0,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"api_enabled|1\",\"multilingual\":false}'),(109,'email_templates','member_templates','','','divider',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(110,'email_templates','member_approved','1','\'1\',\'0\'','radio',1,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(111,'email_templates','member_approved_subject','Member was approved at {%SITE_NAME%}',NULL,'text',17,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(112,'email_templates','member_approved_body','<p>Dear {%FULLNAME%},</p>\r\n<p>Your membership was approved in {%SITE_NAME%}. Now you can log in.</p>','fullname|User','textarea',18,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(113,'email_templates','member_disapproved','1','\'1\',\'0\'','radio',2,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(114,'email_templates','member_disapproved_subject','Member was disapproved at {%SITE_NAME%}',NULL,'text',21,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(115,'email_templates','member_disapproved_body','<p>Dear {%FULLNAME%},</p>\r\n<p>Your membership was disapproved in {%SITE_NAME%}.</p>','fullname|User','textarea',22,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(116,'email_templates','member_registration','1','\'1\',\'0\'','radio',3,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(117,'email_templates','member_registration_subject','Thanks for registration at {%SITE_NAME%}',NULL,'text',3,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(118,'email_templates','member_registration_body','<p>Dear {%FULLNAME%},</p> <p>Thanks for your registration at <a href=\"{%SITE_URL%}\" target=\"_blank\">{%SITE_URL%}</a>. Here is information you should use in order to login:</p> <p>Your username: {%USERNAME%}<br /> Your password: {%PASSWORD%}</p> <p>To activate your account, please, <a href=\"{%LINK%}\" target=\"_blank\">follow this link</a>. <br /> You may change your password later by editing your personal attributes in your member area.</p>','fullname|User,email|Email,username|Username,password|Password,link|Confirmation link','textarea',3,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(119,'email_templates','member_registration_notification','1','\'1\',\'0\'','radio',3,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(120,'email_templates','member_registration_notification_subject','Member has been created {%SITE_NAME%}',NULL,'text',4,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(121,'email_templates','member_registration_notification_body','<p>Greetings {%FULLNAME%},</p> <p>Administrator has just created an account for you at {%SITE_URL%}. Here is information you should use in order to login:</p> <p>Your email: <b>{%EMAIL%}</b><br /> Your password: <b>{%PASSWORD%}</b></p>','fullname|User,email|Email,password|Password','textarea',4,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(122,'email_templates','member_registration_admin','1','\'1\',\'0\'','radio',3,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(123,'email_templates','member_registration_admin_subject','New member registered at {%SITE_NAME%}',NULL,'text',4,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(124,'email_templates','member_registration_admin_body','<p>Greetings,</p><p>New member registered at {%SITE_URL%}. Detailed information is below:</p> <p>ID: <b>{%ID%}</b><br>Name: <b>{%FULLNAME%}</b> ({%USERNAME%})<br>Email: <b>{%EMAIL%}</b></p>','id|ID,fullname|User,username|Username,email|User email','textarea',4,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(125,'email_templates','member_removal','1','\'1\',\'0\'','radio',4,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(126,'email_templates','member_removal_subject','Member deleted at {%SITE_NAME%}',NULL,'text',5,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(127,'email_templates','member_removal_body','<p>Dear {%FULLNAME%},</p>\r\n<p>Your membership was removed from  {%SITE_URL%}.</p>','fullname|User','textarea',8,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(128,'email_templates','password_restoration','1','\'1\',\'0\'','radio',6,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(129,'email_templates','password_restoration_subject','Password restoration request at {%SITE_NAME%}',NULL,'text',10,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(130,'email_templates','password_restoration_body','<p>Dear {%FULLNAME%},</p>\r\n<p>Please follow this link if you wish to change the password at {%SITE_URL%}:<br />\r\n{%URL%}\r\n</p>\r\n<p>\r\nOr use confirmation code on page: <a href=\"{%SITE_URL%}forgot/?code\">{%SITE_URL%}forgot/?code</a><br />\r\nE-mail: {%EMAIL%}<br />\r\nCode: {%CODE%}\r\n</p>','fullname|User,email|Email,code|Restoration code','textarea',11,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(131,'email_templates','password_changement','1','\'1\',\'0\'','radio',7,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(132,'email_templates','password_changement_subject','Password change request at {%SITE_NAME%}',NULL,'text',13,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(133,'email_templates','password_changement_body','<p>Dear {%FULLNAME%},</p>\r\n\r\n<p>You requested a password change in {%SITE_NAME%}. Now you should use the following credentials to log in as member:</p>\r\n\r\n<p>Username: {%USERNAME%}<br />\r\nPassword: {%PASSWORD%}</p>','fullname|User,username|Username,password|New password','textarea',14,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(134,'email_templates','financial_templates','','','divider',50,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(135,'email_templates','plan_activated','1','\'1\',\'0\'','radio',55,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(136,'email_templates','plan_activated_subject','Plan activated at {%SITE_NAME%}',NULL,'text',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(137,'email_templates','plan_activated_body','<p>Dear {%FULLNAME%},</p>\r\n<p>Your listing has been activated.</p>\r\n\r\n<ul>\r\n	<li><b>Plan:</b> {%PLAN%}</li>\r\n	<li><b>Cost:</b> {%CURRENCY%} {%COST%}</li>\r\n	<li><b>Duration:</b> {%DURATION%} {%UNIT%}(s)</li>\r\n</ul>','plan|Plan name,cost|Plan\'s cost,duration|Plan\'s duration,unit|Duration unit,fullname|User,currency|Currency code','textarea',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(138,'email_templates','plan_expired','1','\'1\',\'0\'','radio',60,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(139,'email_templates','plan_expired_subject','Plan expired at {%SITE_NAME%}',NULL,'text',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(140,'email_templates','plan_expired_body','<p>Dear {%FULLNAME%},</p>\r\n<p>Your paid listing submission expired.</p>\r\n\r\n<ul>\r\n	<li><b>Plan:</b> {%PLAN%}</li>\r\n	<li><b>Cost:</b> {%CURRENCY%} {%COST%}</li>\r\n	<li><b>Duration:</b> {%DURATION%} {%UNIT%}(s)</li>\r\n</ul>\r\n\r\n<p>It may always be renewed through the site.</p>','plan|Plan name,cost|Plan\'s cost,duration|Plan\'s duration,unit|Duration unit,fullname|User,currency|Currency code','textarea',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(141,'email_templates','transaction_paid','1','\'1\',\'0\'','radio',65,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(142,'email_templates','transaction_paid_subject','Payment received at {%SITE_NAME%}',NULL,'text',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(143,'email_templates','transaction_paid_body','<p>Dear {%FULLNAME%},</p>\r\n<p>Your payment has been successfully received.</p>\r\n\r\n<p>Order Number: <strong>{%REFERENCE_ID%}</strong></p>\r\n\r\n<p>Payment details are below:</p>\r\n\r\n<ul>\r\n	<li><b>Operation:</b> {%OPERATION%}</li>\r\n	<li><b>Amount:</b> {%CURRENCY%} {%AMOUNT%}</li>\r\n	<li><b>Item:</b> {%ITEM%} #{%ITEM_ID%}</li>\r\n	<li><b>Date:</b> {%DATE_PAID%}</li>\r\n</ul>\r\n\r\n<p>All your transactions could always be seen on the <a href=\"{%SITE_URL%}profile/funds/\" target=\"_blank\">Funds</a> page.</p>','email|Email,username|Username,fullname|Fullname,operation|Operation name,amount|Amount,reference_id|Reference ID,currency|Currency,item|Item,item_id|Item ID,date_created|Creation Date,date_paid|Payment Date','textarea',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(144,'email_templates','transaction_paid_admin','1','\'1\',\'0\'','radio',70,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(145,'email_templates','transaction_paid_admin_subject','Payment completed at {%SITE_NAME%}',NULL,'text',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(146,'email_templates','transaction_paid_admin_body','<p>Dear Administrator,</p>\r\n<p>A payment has been completed on your site. Here is the information on the payment:</p><ul><li><b>Username:</b> {%USERNAME%}</li><li><b>Amount:</b>{%CURRENCY%} {%AMOUNT%}</li><li><b>Operation:</b> {%OPERATION%}</li></ul>','username|User,amount|Amount of transaction,operation|Operation name,currency|Currency','textarea',8,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(147,'email_templates','invoice_created','1','\'1\',\'0\'','radio',75,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(148,'email_templates','invoice_created_subject','Customer Invoice',NULL,'text',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(149,'email_templates','invoice_created_body','<p>Dear {%FULLNAME%},</p>\r\n<p>This is a notice that an invoice has been generated on {%DATE%}</p>\r\n\r\n<p>Your payment method is: {%GATEWAY%}</p>\r\n\r\n<p>Invoice #{%INVOICE%},<br>\r\nAmount Due: {%CURRENCY%} {%AMOUNT%}\r\n</p>\r\n\r\n<p>All your invoices could always be seen on the <a href=\"{%SITE_URL%}profile/funds/\" target=\"_blank\">Funds</a> page.</p>','invoice|Invoice ID,gateway|Gateway,date|Invoice creation date,fullname|User,amount|Amount,currency|Currency','textarea',0,'',1,1,'{\"wysiwyg\":\"0\",\"code_editor\":\"0\",\"show\":\"\",\"multilingual\":false}'),(150,'template_kickstart','','General','','divider',76,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(151,'template_kickstart','enable_landing','1','1,0','radio',77,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(152,'template_kickstart','custom_colors','0','1,0','radio',78,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(153,'template_kickstart','custom_color_body_bg','#fff','','colorpicker',79,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(154,'template_kickstart','custom_color_text','#333333','','colorpicker',80,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(155,'template_kickstart','custom_color_headings','#333333','','colorpicker',81,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(156,'template_kickstart','custom_color_link','#38b7ea','','colorpicker',82,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(157,'template_kickstart','custom_color_link_hover','#1490c1','','colorpicker',83,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(158,'template_kickstart','','Inventory bar','','divider',84,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(159,'template_kickstart','search_inventory','0','1,0','radio',85,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(160,'template_kickstart','custom_color_inventory_bg','#323232','','colorpicker',86,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(161,'template_kickstart','custom_color_inventory_link','rgba(255,255,255,0.45)','','colorpicker',87,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(162,'template_kickstart','custom_color_inventory_link_hover','rgba(255,255,255,0.5)','','colorpicker',88,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(163,'template_kickstart','custom_color_inventory_link_active','rgba(255,255,255,0.7)','','colorpicker',89,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(164,'template_kickstart','','Navbar / Mainmenu','','divider',90,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(165,'template_kickstart','max_top_menu_items','6','','text',91,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(166,'template_kickstart','enable_text_logo','0','1,0','radio',92,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(167,'template_kickstart','logo_text','Kickstart','','text',93,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"enable_text_logo|1\",\"multilingual\":false}'),(168,'template_kickstart','navbar_sticky','1','1,0','radio',94,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(169,'template_kickstart','search_navbar','1','1,0','radio',95,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(170,'template_kickstart','custom_color_navbar_bg','#ffffff','','colorpicker',96,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(171,'template_kickstart','custom_color_navbar_link','rgba(50,50,50,0.6)','','colorpicker',97,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(172,'template_kickstart','custom_color_navbar_link_hover','rgba(50,50,50,0.8)','','colorpicker',98,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(173,'template_kickstart','custom_color_navbar_link_active','#38b7ea','','colorpicker',99,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(174,'template_kickstart','','Header / Teaser','','divider',100,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(175,'template_kickstart','bg_header','','','image',101,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(176,'template_kickstart','bg_header_use_color','0','1,0','radio',102,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(177,'template_kickstart','bg_header_color','#6b3561','','colorpicker',103,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"bg_header_use_color|1\",\"multilingual\":false}'),(178,'template_kickstart','','Features section','','divider',104,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(179,'template_kickstart','bg_features','','','image',105,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(180,'template_kickstart','bg_features_use_color','0','1,0','radio',106,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(181,'template_kickstart','bg_features_color','#6b3561','','colorpicker',107,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"bg_features_use_color|1\",\"multilingual\":false}'),(182,'template_kickstart','','Footer','','divider',108,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(183,'template_kickstart','footer_bg','#323232','','colorpicker',109,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(184,'template_kickstart','footer_blocks_bg','#444444','','colorpicker',110,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(185,'template_kickstart','footer_link','rgba(255,255,255,0.45)','','colorpicker',111,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(186,'template_kickstart','footer_link_hover','rgba(255,255,255,0.5)','','colorpicker',112,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(187,'template_kickstart','footer_link_active','rgba(255,255,255,0.7)','','colorpicker',113,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(188,'template_kickstart','','Social links','','divider',114,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(189,'template_kickstart','website_social','1','1,0','radio',115,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(190,'template_kickstart','website_social_t','https://twitter.com/IntelliantsLLC','','text',116,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"website_social|1\",\"multilingual\":false}'),(191,'template_kickstart','website_social_f','https://www.facebook.com/Intelliants','','text',117,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"website_social|1\",\"multilingual\":false}'),(192,'template_kickstart','website_social_g','https://plus.google.com/102500660503219569194/posts','','text',118,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"website_social|1\",\"multilingual\":false}'),(193,'template_kickstart','website_social_i','#','','text',119,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"website_social|1\",\"multilingual\":false}'),(194,'template_kickstart','ckeditor_css','ckeditor.css','','hidden',120,'kickstart',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(195,'blog','blog_plugin','General','','divider',121,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(196,'blog','blog_number_block','4','','text',122,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(197,'blog','blog_number_new_block','3','','text',123,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(198,'blog','blog_max_block','200','','text',124,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(199,'blog','blog_number','5','','text',125,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(200,'blog','blog_max','500','','text',126,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(201,'blog','blog_order','date','alphabetic,date','select',127,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(202,'blog','blog_tag_number','10','','text',128,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(203,'blog','blog_image_resize','crop','crop,fit','select',129,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(204,'blog','blog_image_width','1280','','text',130,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(205,'blog','blog_image_height','720','','text',131,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(206,'blog','blog_thumb_width','250','','text',132,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(207,'blog','blog_thumb_height','250','','text',133,'blog',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(208,'miscellaneous','kcaptcha_divider','KCAPTCHA','','divider',134,'kcaptcha',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(209,'miscellaneous','kcaptcha_case_sensitive','1','1,0','radio',135,'kcaptcha',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(210,'miscellaneous','kcaptcha_num_chars','5','','text',136,'kcaptcha',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(211,'pictures','fancybox_divider','fancyBox','','divider',137,'fancybox',1,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(212,'pictures','fancybox_slide_transition','elastic','elastic,fade','select',138,'fancybox',0,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(213,'pictures','fancybox_open_transition','fade','elastic,fade','select',139,'fancybox',0,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(214,'pictures','fancybox_slide_speed','fast','fast,slow,normal','select',140,'fancybox',0,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(215,'pictures','fancybox_open_speed','fast','fast,slow,normal','select',141,'fancybox',0,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(216,'pictures','fancybox_padding','15','','text',142,'fancybox',0,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(217,'pictures','fancybox_arrows','1','1,0','radio',143,'fancybox',0,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(218,'pictures','fancybox_closeBtn','1','1,0','radio',144,'fancybox',0,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}'),(219,'pictures','fancybox_closeClick','0','1,0','radio',145,'fancybox',0,1,'{\"wysiwyg\":false,\"code_editor\":false,\"show\":\"\",\"multilingual\":false}');
/*!40000 ALTER TABLE `ia_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_config_custom`
--

DROP TABLE IF EXISTS `ia_config_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_config_custom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `type` enum('user','group','plan') NOT NULL DEFAULT 'group',
  `type_id` mediumint(8) unsigned NOT NULL,
  `module` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `NAME` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_config_custom`
--

LOCK TABLES `ia_config_custom` WRITE;
/*!40000 ALTER TABLE `ia_config_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_config_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_config_groups`
--

DROP TABLE IF EXISTS `ia_config_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_config_groups` (
  `name` varchar(50) NOT NULL,
  `order` smallint(4) unsigned NOT NULL,
  `module` varchar(40) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `EXTRAS` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_config_groups`
--

LOCK TABLES `ia_config_groups` WRITE;
/*!40000 ALTER TABLE `ia_config_groups` DISABLE KEYS */;
INSERT INTO `ia_config_groups` VALUES ('general',1,''),('members',2,''),('mail',3,''),('email_templates',4,''),('system',5,''),('pictures',6,''),('miscellaneous',7,''),('financial',8,''),('api',9,''),('template_kickstart',10,'kickstart'),('blog',11,'blog');
/*!40000 ALTER TABLE `ia_config_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_cron`
--

DROP TABLE IF EXISTS `ia_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_cron` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` tinytext NOT NULL,
  `date_prev_launch` int(10) unsigned NOT NULL,
  `date_next_launch` int(10) unsigned NOT NULL,
  `data` tinytext NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `module` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACTIVE` (`active`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_cron`
--

LOCK TABLES `ia_cron` WRITE;
/*!40000 ALTER TABLE `ia_cron` DISABLE KEYS */;
INSERT INTO `ia_cron` VALUES (1,'Sitemap creation and update','Updates (or generates) the sitemap.xml file',1790211478,1790226060,'1 1,12 * * * includes/cron/sitemap.php',1,''),(2,'System cleanup','Cleans up temporary DB entries',1790211478,1790222700,'5 0 * * * includes/cron/cleanup.php',1,''),(3,'Check for expiration of sponsored items','Marks expired sponsored items',1790211478,1790212800,'20 * * * * includes/cron/sponsored-expiration.php',1,''),(4,'Check for expiration of featured items','Marks expired featured items',1790211478,1790222400,'0 0 * * * includes/cron/featured-expiration.php',1,'');
/*!40000 ALTER TABLE `ia_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_favorites`
--

DROP TABLE IF EXISTS `ia_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_favorites` (
  `id` int(10) unsigned NOT NULL,
  `member_id` int(11) unsigned NOT NULL,
  `item` varchar(50) NOT NULL,
  UNIQUE KEY `UNIQUE` (`id`,`member_id`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_favorites`
--

LOCK TABLES `ia_favorites` WRITE;
/*!40000 ALTER TABLE `ia_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_fields`
--

DROP TABLE IF EXISTS `ia_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_fields` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group` smallint(5) unsigned NOT NULL DEFAULT 1,
  `module` varchar(40) NOT NULL,
  `name` varchar(60) NOT NULL,
  `item` varchar(50) NOT NULL DEFAULT 'members',
  `fieldgroup_id` smallint(5) unsigned NOT NULL,
  `type` enum('text','url','number','date','textarea','combo','radio','checkbox','storage','image','pictures','tree','iconpicker') NOT NULL DEFAULT 'text',
  `length` mediumint(7) unsigned NOT NULL,
  `values` text DEFAULT NULL,
  `default` tinytext NOT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `editable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `multilingual` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `required` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `required_checks` text NOT NULL,
  `extra_actions` text NOT NULL,
  `adminonly` tinyint(1) unsigned NOT NULL,
  `searchable` tinyint(1) unsigned NOT NULL,
  `sort_order` enum('asc','desc') NOT NULL DEFAULT 'asc',
  `show_as` enum('combo','radio','checkbox') NOT NULL DEFAULT 'combo',
  `for_plan` tinyint(1) unsigned NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `image_width` smallint(5) unsigned NOT NULL,
  `image_height` smallint(5) unsigned NOT NULL,
  `thumb_width` smallint(5) unsigned NOT NULL,
  `thumb_height` smallint(5) unsigned NOT NULL,
  `resize_mode` enum('crop','fit') NOT NULL DEFAULT 'crop',
  `file_prefix` varchar(50) NOT NULL,
  `file_types` text NOT NULL,
  `use_editor` tinyint(1) unsigned NOT NULL,
  `plans` varchar(250) NOT NULL,
  `timepicker` tinyint(1) unsigned NOT NULL,
  `url_nofollow` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `empty_field` tinytext NOT NULL,
  `relation` enum('regular','parent','dependent') NOT NULL DEFAULT 'regular',
  `allow_null` tinyint(1) unsigned NOT NULL,
  `folder_name` varchar(150) NOT NULL,
  `imagetype_primary` varchar(20) NOT NULL,
  `imagetype_thumbnail` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`name`,`item`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_fields`
--

LOCK TABLES `ia_fields` WRITE;
/*!40000 ALTER TABLE `ia_fields` DISABLE KEYS */;
INSERT INTO `ia_fields` VALUES (1,1,'','username','members',1,'text',50,NULL,'',0,0,0,1,'','if ($_POST[$fieldName] && !iaValidate::isUsername($_POST[$fieldName]))\r\n{\r\n	$error = true;\r\n	$messages[] = iaLanguage::get(\'username_incorrect\');\r\n	$invalidFields[] = $fieldName;\r\n}',0,1,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(2,1,'','fullname','members',1,'text',50,NULL,'',5,0,0,1,'','',0,1,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(3,1,'','email','members',1,'text',250,NULL,'',10,0,0,1,'','if ($_POST[$fieldName])\r\n{\r\n	if (!iaValidate::isEmail($_POST[$fieldName]))\r\n	{\r\n		$error = true;\r\n		$messages[] = iaLanguage::get(\'error_email_incorrect\');\r\n		$invalidFields[] = $fieldName;\r\n	}\r\n	else\r\n	{\r\n		$_POST[$fieldName] = strtolower($_POST[$fieldName]);\r\n	}\r\n}',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(4,1,'','avatar','members',1,'image',1,NULL,'',15,1,0,0,'','',0,1,'asc','combo',0,'active',300,300,200,200,'crop','avat_','',1,'',0,1,'','regular',0,'','large','thumbnail'),(5,1,'','website','members',1,'text',255,NULL,'',20,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(6,1,'','phone','members',1,'text',100,NULL,'',25,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(7,1,'','biography','members',1,'textarea',500,NULL,'',30,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(8,1,'','facebook','members',2,'text',150,NULL,'',35,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(9,1,'','twitter','members',2,'text',150,NULL,'',40,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(10,1,'','gplus','members',2,'text',150,NULL,'',45,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(11,1,'','linkedin','members',2,'text',150,NULL,'',50,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(12,1,'','api_push_token','members',3,'textarea',255,NULL,'',55,1,0,0,'','',1,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(13,1,'','api_push_receive','members',3,'radio',0,'yes,no','yes',60,1,0,0,'','',1,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(14,1,'','member_id','transactions',0,'text',100,NULL,'',0,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(15,1,'','reference_id','transactions',0,'text',100,NULL,'',5,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(16,1,'','date_created','transactions',0,'date',0,NULL,'',10,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',1,1,'','regular',0,'','',''),(17,1,'','date_paid','transactions',0,'date',0,NULL,'',15,8,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',1,1,'','regular',0,'','',''),(18,1,'','amount','transactions',0,'number',8,NULL,'',20,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(19,1,'','operation','transactions',0,'text',100,NULL,'',25,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(20,1,'','gateway','transactions',0,'text',100,NULL,'',30,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(21,1,'','currency','transactions',0,'text',10,NULL,'',35,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','',''),(22,1,'','sec_key','transactions',0,'text',250,NULL,'',40,1,0,0,'','',0,0,'asc','combo',0,'active',0,0,0,0,'crop','','',0,'',0,1,'','regular',0,'','','');
/*!40000 ALTER TABLE `ia_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_fields_groups`
--

DROP TABLE IF EXISTS `ia_fields_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_fields_groups` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL DEFAULT 'members',
  `order` smallint(5) unsigned NOT NULL,
  `module` varchar(40) NOT NULL,
  `collapsible` tinyint(1) unsigned NOT NULL,
  `collapsed` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `tabview` tinyint(1) unsigned NOT NULL,
  `tabcontainer` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`name`,`item`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_fields_groups`
--

LOCK TABLES `ia_fields_groups` WRITE;
/*!40000 ALTER TABLE `ia_fields_groups` DISABLE KEYS */;
INSERT INTO `ia_fields_groups` VALUES (1,'general','members',1,'',0,0,0,''),(2,'social','members',2,'',0,0,0,''),(3,'api','members',3,'',0,0,0,'');
/*!40000 ALTER TABLE `ia_fields_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_fields_image_types`
--

DROP TABLE IF EXISTS `ia_fields_image_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_fields_image_types` (
  `field_id` smallint(5) unsigned NOT NULL,
  `image_type_id` int(9) unsigned NOT NULL,
  UNIQUE KEY `UNIQUE` (`field_id`,`image_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_fields_image_types`
--

LOCK TABLES `ia_fields_image_types` WRITE;
/*!40000 ALTER TABLE `ia_fields_image_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_fields_image_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_fields_pages`
--

DROP TABLE IF EXISTS `ia_fields_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_fields_pages` (
  `field_id` smallint(5) unsigned NOT NULL,
  `page_name` varchar(50) NOT NULL,
  UNIQUE KEY `UNIQUE` (`field_id`,`page_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_fields_pages`
--

LOCK TABLES `ia_fields_pages` WRITE;
/*!40000 ALTER TABLE `ia_fields_pages` DISABLE KEYS */;
INSERT INTO `ia_fields_pages` VALUES (1,'favorites'),(1,'members'),(1,'member_registration'),(2,'favorites'),(2,'members'),(2,'member_registration'),(2,'profile'),(2,'view_member'),(3,'member_registration'),(3,'profile'),(4,'favorites'),(4,'members'),(4,'profile'),(4,'view_member'),(5,'favorites'),(5,'members'),(5,'profile'),(5,'view_member'),(6,'favorites'),(6,'members'),(6,'profile'),(6,'view_member'),(7,'profile'),(7,'view_member'),(8,'favorites'),(8,'members'),(8,'profile'),(8,'view_member'),(9,'favorites'),(9,'members'),(9,'profile'),(9,'view_member'),(10,'favorites'),(10,'members'),(10,'profile'),(10,'view_member'),(11,'favorites'),(11,'members'),(11,'profile'),(11,'view_member');
/*!40000 ALTER TABLE `ia_fields_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_fields_relations`
--

DROP TABLE IF EXISTS `ia_fields_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_fields_relations` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` smallint(5) unsigned NOT NULL,
  `element` varchar(50) NOT NULL,
  `child` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FIELD` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_fields_relations`
--

LOCK TABLES `ia_fields_relations` WRITE;
/*!40000 ALTER TABLE `ia_fields_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_fields_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_fields_tree_nodes`
--

DROP TABLE IF EXISTS `ia_fields_tree_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_fields_tree_nodes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `item` varchar(30) NOT NULL,
  `module` varchar(40) NOT NULL,
  `node_id` varchar(30) NOT NULL,
  `parent_node_id` varchar(30) NOT NULL,
  `alias` varchar(150) NOT NULL,
  `num_listings` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ITEMNAME` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_fields_tree_nodes`
--

LOCK TABLES `ia_fields_tree_nodes` WRITE;
/*!40000 ALTER TABLE `ia_fields_tree_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_fields_tree_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_file_types`
--

DROP TABLE IF EXISTS `ia_file_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_file_types` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(10) NOT NULL DEFAULT '',
  `maxsize` int(11) unsigned NOT NULL DEFAULT 0,
  `image` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `EXTENSION` (`extension`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_file_types`
--

LOCK TABLES `ia_file_types` WRITE;
/*!40000 ALTER TABLE `ia_file_types` DISABLE KEYS */;
INSERT INTO `ia_file_types` VALUES (1,'swf',0,0),(2,'wav',0,0),(3,'mov',0,0),(5,'mpeg',0,0),(6,'mpg',0,0),(7,'mp3',0,0),(8,'png',0,1),(9,'jpg',0,1),(10,'gif',0,1),(11,'jpeg',0,1),(12,'ico',0,0),(13,'htm',0,0),(14,'html',0,0),(15,'txt',0,0),(16,'pdf',0,0),(17,'rtf',0,0),(18,'zip',0,0),(19,'gz',0,0),(20,'tar',0,0),(21,'rar',0,0),(22,'bz',0,0),(23,'bz2',0,0),(24,'doc',0,0),(25,'docx',0,0),(26,'xls',0,0),(27,'xlsx',0,0),(28,'ppt',0,0),(29,'pptx',0,0);
/*!40000 ALTER TABLE `ia_file_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_hooks`
--

DROP TABLE IF EXISTS `ia_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_hooks` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `order` smallint(5) unsigned NOT NULL,
  `pages` tinytext NOT NULL,
  `type` enum('php','html','smarty','plain') NOT NULL DEFAULT 'php',
  `page_type` enum('admin','front','both') NOT NULL DEFAULT 'both',
  `filename` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`name`,`module`),
  KEY `STATUS` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_hooks`
--

LOCK TABLES `ia_hooks` WRITE;
/*!40000 ALTER TABLE `ia_hooks` DISABLE KEYS */;
INSERT INTO `ia_hooks` VALUES (1,'','smartyFrontAfterHeadSection','','active',1,'','smarty','front','templates/_common/hook.header-code.tpl'),(2,'','smartyFrontFinalize','{$core.config.frontend_footer_code}','active',2,'','smarty','front',''),(3,'','editItemSetSystemDefaults','if (isset($item[\'featured\']) && $item[\'featured\'])\r\n{\r\n	$item[\'featured_end\'] = date(iaDb::DATETIME_SHORT_FORMAT, strtotime($item[\'featured_end\']));\r\n}\r\nelse\r\n{\r\n	$date = getdate();\r\n	$date = mktime($date[\'hours\'], $date[\'minutes\'] + 1,0,$date[\'mon\'] + 1,$date[\'mday\'], $date[\'year\']);\r\n	$item[\'featured_end\'] = date(iaDb::DATETIME_SHORT_FORMAT, $date);\r\n}\r\n\r\nif (isset($item[\'sponsored\']) && $item[\'sponsored\'])\r\n{\r\n	$item[\'sponsored_end\'] = date(iaDb::DATETIME_SHORT_FORMAT, strtotime($item[\'sponsored_end\']));\r\n}\r\n\r\nif (isset($item[\'member_id\']))\r\n{\r\n	$item[\'owner\'] = \'\';\r\n	if ($item[\'member_id\'] > 0)\r\n	{\r\n		$iaUsers = $iaCore->factory(\'users\');\r\n		if ($ownerInfo = $iaUsers->getInfo((int)$item[\'member_id\']))\r\n		{\r\n			$item[\'owner\'] = $ownerInfo[\'fullname\'] . \' (\' . $ownerInfo[\'email\'] . \')\';\r\n		}\r\n	}\r\n}','active',1,'','php','admin',''),(4,'','smartyFrontSearchSortingMembers','','active',1,'','smarty','front','search.members.sorting-header.tpl'),(5,'blog','phpCoreBeforePageDisplay','','active',0,'','php','front','modules/blog/includes/hook.blocks-load.php'),(6,'blog','adminDashboardStatistics','$items[\'blog\'] = \'plugin\';','active',0,'index','php','admin',''),(7,'blog','sitemapGeneration','$items[] = \'blog:blog\';','active',0,'index,sitemap','php','admin',''),(8,'fancybox','smartyFrontAfterHeadSection','{if \'fancybox\' == $core.config.lightbox_name}\n	{ia_add_media files=\'css:_IA_URL_modules/fancybox/js/jquery.fancybox, js:_IA_URL_modules/fancybox/js/jquery.fancybox.pack\'}\n	{ia_add_js}\n$(function()\n{\n	$(\'a[rel^=\"ia_lightbox\"]\').fancybox(\n	{\n		nextEffect: \'{$core.config.fancybox_slide_transition}\',\n		prevEffect: \'{$core.config.fancybox_slide_transition}\',\n		openEffect: \'{$core.config.fancybox_open_transition}\',\n		closeEffect: \'{$core.config.fancybox_open_transition}\',\n		nextSpeed: \'{$core.config.fancybox_slide_speed}\',\n		prevSpeed: \'{$core.config.fancybox_slide_speed}\',\n		openSpeed: \'{$core.config.fancybox_open_speed}\',\n		closeSpeed: \'{$core.config.fancybox_open_speed}\',\n		padding: {$core.config.fancybox_padding},\n		arrows: {$core.config.fancybox_arrows},\n		closeBtn: {$core.config.fancybox_closeBtn},\n		closeClick: {$core.config.fancybox_closeClick},\n		helpers: {\n			overlay: {\n				locked: false\n			}\n		}\n	});\n});\n	{/ia_add_js}\n{/if}','active',0,'','smarty','both',''),(9,'fancybox','smartyAdminAfterHeadSection','{if \'fancybox\' == $core.config.lightbox_name}\n	{ia_add_media files=\'css:_IA_URL_modules/fancybox/js/jquery.fancybox, js:_IA_URL_modules/fancybox/js/jquery.fancybox.pack\'}\n	{ia_add_js}\n$(function()\n{\n	$(\'a[rel^=\"ia_lightbox\"]\').fancybox(\n	{\n		nextEffect: \'{$core.config.fancybox_slide_transition}\',\n		prevEffect: \'{$core.config.fancybox_slide_transition}\',\n		openEffect: \'{$core.config.fancybox_open_transition}\',\n		closeEffect: \'{$core.config.fancybox_open_transition}\',\n		nextSpeed: \'{$core.config.fancybox_slide_speed}\',\n		prevSpeed: \'{$core.config.fancybox_slide_speed}\',\n		openSpeed: \'{$core.config.fancybox_open_speed}\',\n		closeSpeed: \'{$core.config.fancybox_open_speed}\',\n		padding: {$core.config.fancybox_padding},\n		arrows: {$core.config.fancybox_arrows},\n		closeBtn: {$core.config.fancybox_closeBtn},\n		closeClick: {$core.config.fancybox_closeClick},\n		helpers: {\n			overlay: {\n				locked: false\n			}\n		}\n	});\n});\n	{/ia_add_js}\n{/if}','active',0,'','smarty','both','');
/*!40000 ALTER TABLE `ia_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_image_types`
--

DROP TABLE IF EXISTS `ia_image_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_image_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `width` int(11) unsigned NOT NULL,
  `height` int(11) unsigned NOT NULL,
  `resize_mode` enum('crop','fit') NOT NULL DEFAULT 'crop',
  `cropper` tinyint(1) NOT NULL DEFAULT 0,
  `module` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_image_types`
--

LOCK TABLES `ia_image_types` WRITE;
/*!40000 ALTER TABLE `ia_image_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_image_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_image_types_filetypes`
--

DROP TABLE IF EXISTS `ia_image_types_filetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_image_types_filetypes` (
  `image_type_id` smallint(5) unsigned NOT NULL,
  `file_type_id` int(9) unsigned NOT NULL,
  UNIQUE KEY `UNIQUE` (`image_type_id`,`file_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_image_types_filetypes`
--

LOCK TABLES `ia_image_types_filetypes` WRITE;
/*!40000 ALTER TABLE `ia_image_types_filetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_image_types_filetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_invoices`
--

DROP TABLE IF EXISTS `ia_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_invoices` (
  `id` bigint(12) unsigned NOT NULL,
  `transaction_id` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_due` datetime DEFAULT NULL,
  `fullname` varchar(200) NOT NULL,
  `member_id` int(11) unsigned NOT NULL,
  `address1` tinytext NOT NULL,
  `address2` tinytext NOT NULL,
  `zip` varchar(12) NOT NULL,
  `country` varchar(32) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TRANSACTION` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_invoices`
--

LOCK TABLES `ia_invoices` WRITE;
/*!40000 ALTER TABLE `ia_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_invoices_items`
--

DROP TABLE IF EXISTS `ia_invoices_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_invoices_items` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(12) unsigned NOT NULL,
  `title` tinytext NOT NULL,
  `price` decimal(11,2) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  `tax` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INVOICE` (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_invoices_items`
--

LOCK TABLES `ia_invoices_items` WRITE;
/*!40000 ALTER TABLE `ia_invoices_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_invoices_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_items`
--

DROP TABLE IF EXISTS `ia_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_items` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `payable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `item` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `pages` tinytext NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ITEM` (`item`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_items`
--

LOCK TABLES `ia_items` WRITE;
/*!40000 ALTER TABLE `ia_items` DISABLE KEYS */;
INSERT INTO `ia_items` VALUES (1,1,'members','core','profile,view_member','',''),(2,0,'transactions','core','','','');
/*!40000 ALTER TABLE `ia_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_items_pages`
--

DROP TABLE IF EXISTS `ia_items_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_items_pages` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `page_name` varchar(50) NOT NULL,
  `item` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`page_name`,`item`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_items_pages`
--

LOCK TABLES `ia_items_pages` WRITE;
/*!40000 ALTER TABLE `ia_items_pages` DISABLE KEYS */;
INSERT INTO `ia_items_pages` VALUES (1,'profile','members'),(2,'view_member','members'),(3,'favorites','members'),(4,'member_registration','members');
/*!40000 ALTER TABLE `ia_items_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_language`
--

DROP TABLE IF EXISTS `ia_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `original` text NOT NULL,
  `value` text NOT NULL,
  `category` enum('admin','frontend','common','page','tooltip') NOT NULL DEFAULT 'frontend',
  `code` char(2) NOT NULL,
  `module` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`key`,`category`,`code`,`module`),
  KEY `LANG` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=1474 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_language`
--

LOCK TABLES `ia_language` WRITE;
/*!40000 ALTER TABLE `ia_language` DISABLE KEYS */;
INSERT INTO `ia_language` VALUES (1,'_action_','- Action -','- Action -','admin','en',''),(2,'_do_not_change_','&lt;Do not change&gt;','&lt;Do not change&gt;','admin','en',''),(3,'_no_parent_page_','- no parent page -','- no parent page -','admin','en',''),(4,'_page_removed_','-page removed-','-page removed-','admin','en',''),(5,'access_denied','Access denied','Access denied','admin','en',''),(6,'action-add','Add action on \":page\"','Add action on \":page\"','admin','en',''),(7,'action-config','Configuration on \":page\"','Configuration on \":page\"','admin','en',''),(8,'action-delete','Delete action on \":page\"','Delete action on \":page\"','admin','en',''),(9,'action-edit','Edit action on \":page\"','Edit action on \":page\"','admin','en',''),(10,'action-read','Allow to view \":page\"','Allow to view \":page\"','admin','en',''),(11,'action_not_allowed_since_you_only_admin','This action is not allowed since currently you are the only active administrator.','This action is not allowed since currently you are the only active administrator.','admin','en',''),(12,'activate','Activate package','Activate package','admin','en',''),(13,'add_another_one','Add another one','Add another one','admin','en',''),(14,'add_block','Add Block','Add Block','admin','en',''),(15,'add_drop_table','Add DROP TABLE','Add DROP TABLE','admin','en',''),(16,'add_field','Add Field','Add Field','admin','en',''),(17,'add_fieldgroup','Add Field Group','Add Field Group','admin','en',''),(18,'add_image_type','Add Image Type','Add Image Type','admin','en',''),(19,'add_invoice','Add Invoice','Add Invoice','admin','en',''),(20,'add_item_value','Add Item Value','Add Item Value','admin','en',''),(21,'add_line','Add line','Add line','admin','en',''),(22,'add_member','Add Member','Add Member','admin','en',''),(23,'add_menu','Add Menu','Add Menu','admin','en',''),(24,'add_new_phrase','Add New Phrase','Add New Phrase','admin','en',''),(25,'add_new_transaction','Do you want to add another transaction?','Do you want to add another transaction?','admin','en',''),(26,'add_one_more_phrase','Do you want to add one more phrase?','Do you want to add one more phrase?','admin','en',''),(27,'add_page','Add Page','Add Page','admin','en',''),(28,'add_phrase','Add Phrase','Add Phrase','admin','en',''),(29,'add_plan','Add Plan','Add Plan','admin','en',''),(30,'add_transaction','Add Transaction','Add Transaction','admin','en',''),(31,'add_usergroup','Add Usergroup','Add Usergroup','admin','en',''),(32,'add_quick_link','Add quick link','Add quick link','admin','en',''),(33,'added_date_is_incorrect','Added date is incorrect.','Added date is incorrect.','admin','en',''),(34,'admin_check_new_password','Please check your email for a confirmation link.','Please check your email for a confirmation link.','admin','en',''),(35,'admin_access--read','Allow Access to Admin Panel','Allow Access to Admin Panel','admin','en',''),(36,'admin_pages','Admin Panel Pages','Admin Panel Pages','admin','en',''),(37,'admin_page-adminer--read','Allow to access Adminer script','Allow to access Adminer script','admin','en',''),(38,'admin_page-blocks--edit','Allow to edit blocks','Allow to edit blocks','admin','en',''),(39,'admin_page-blocks--html','Allow to create HTML blocks','Allow to create HTML blocks','admin','en',''),(40,'admin_page-blocks--order','Allow to change blocks order','Allow to change blocks order','admin','en',''),(41,'admin_page-blocks--php','Allow to create PHP blocks','Allow to create PHP blocks','admin','en',''),(42,'admin_page-blocks--plain','Allow to create plain text blocks','Allow to create plain text blocks','admin','en',''),(43,'admin_page-blocks--smarty','Allow to create Smarty blocks','Allow to create Smarty blocks','admin','en',''),(44,'admin_page-blocks--visual','Allow to use Visual Mode','Allow to use Visual Mode','admin','en',''),(45,'admin_page-configuration--edit','Allow to modify configuration','Allow to modify configuration','admin','en',''),(46,'admin_page-configuration--read','Allow access to Configuration page','Allow access to Configuration page','admin','en',''),(47,'admin_page-database--consistency','Allow access to Consistency page','Allow access to Consistency page','admin','en',''),(48,'admin_page-database--export','Allow to export SQL dump','Allow to export SQL dump','admin','en',''),(49,'admin_page-database--import','Allow to import dumps','Allow to import dumps','admin','en',''),(50,'admin_page-database--reset','Allow to reset site data','Allow to reset site data','admin','en',''),(51,'admin_page-database--sql','Allow to run SQL queries','Allow to run SQL queries','admin','en',''),(52,'admin_page-fields--members','Allow to manage member fields','Allow to manage member fields','admin','en',''),(53,'admin_page-hooks--read','Allow to view hooks list','Allow to view hooks list','admin','en',''),(54,'admin_page-hooks--edit','Allow to edit a hook','Allow to edit a hook','admin','en',''),(55,'admin_page-hooks--delete','Allow to delete a hook','Allow to delete a hook','admin','en',''),(56,'admin_page-index--cache','Allow to drop script\'s cache files','Allow to drop script\'s cache files','admin','en',''),(57,'admin_page-index--debugmode','Allow to debugmode information','Allow to debugmode information','admin','en',''),(58,'admin_page-index--phpinfo','Allow to view phpinfo() information','Allow to view phpinfo() information','admin','en',''),(59,'admin_page-index--sitemap','Allow to rebuild sitemap.xml file','Allow to rebuild sitemap.xml file','admin','en',''),(60,'admin_page-members--read','Allow to view members list','Allow to view members list','admin','en',''),(61,'admin_page-members--add','Allow to add new members','Allow to add new members','admin','en',''),(62,'admin_page-members--edit','Allow to edit existing members','Allow to edit existing members','admin','en',''),(63,'admin_page-members--password','Allow to change member password','Allow to change member password','admin','en',''),(64,'admin_page-members--usergroup','Allow to change member usergroup','Allow to change member usergroup','admin','en',''),(65,'admin_page-menus--add','Allow to add new menus','Allow to add new menus','admin','en',''),(66,'admin_page-menus--edit','Allow to edit existing menus','Allow to edit existing menus','admin','en',''),(67,'admin_page-packages--activate','Allow to activate package','Allow to activate package','admin','en',''),(68,'admin_page-packages--install','Allow to install package','Allow to install package','admin','en',''),(69,'admin_page-packages--set_default','Allow to set/reset default package','Allow to set/reset default package','admin','en',''),(70,'admin_page-packages--uninstall','Allow to uninstall package','Allow to uninstall package','admin','en',''),(71,'admin_page-packages--upgrade','Allow to upgrade package','Allow to upgrade package','admin','en',''),(72,'admin_page-pages--add','Allow to add new page','Allow to add new page','admin','en',''),(73,'admin_page-pages--delete','Allow to delete a page','Allow to delete a page','admin','en',''),(74,'admin_page-pages--edit','Allow to modify a page','Allow to modify a page','admin','en',''),(75,'admin_page-pages--home','Allow to change the Home page','Allow to change the Home page','admin','en',''),(76,'admin_page-pages--read','Allow to view pages list','Allow to view pages list','admin','en',''),(77,'admin_page-plans--add','Allow to add new plan','Allow to add new plan','admin','en',''),(78,'admin_page-plans--delete','Allow to delete a plan','Allow to delete a plan','admin','en',''),(79,'admin_page-plans--edit','Allow to modify a plan','Allow to modify a plan','admin','en',''),(80,'admin_page-plans--read','Allow to view plans list','Allow to view plans list','admin','en',''),(81,'admin_page-plugins--install','Allow to install plugin','Allow to install plugin','admin','en',''),(82,'admin_page-plugins--reinstall','Allow to reinstall plugin','Allow to reinstall plugin','admin','en',''),(83,'admin_page-plugins--uninstall','Allow to uninstall plugin','Allow to uninstall plugin','admin','en',''),(84,'admin_page-plugins--update','Allow to update plugin','Allow to update plugin','admin','en',''),(85,'administrator_added','New administrator member created.','New administrator member created.','admin','en',''),(86,'add_plugin','Add plugin','Add plugin','admin','en',''),(87,'all_members','All Members','All Members','admin','en',''),(88,'allowed','Allowed','Allowed','admin','en',''),(89,'allowed_file_types','Allowed file types','Allowed file types','admin','en',''),(90,'already_home_page','This page has been set as your homepage. You may not turn it off.','This page has been set as your homepage. You may not turn it off.','admin','en',''),(91,'and_then','And then','And then','admin','en',''),(92,'are_you_sure_install_module','Are you sure you wish to install this module?','Are you sure you wish to install this module?','admin','en',''),(93,'are_you_sure_reinstall_module','Are you sure you wish to reinstall this module? All data will be lost. You need to start from the scratch.','Are you sure you wish to reinstall this module? All data will be lost. You need to start from the scratch.','admin','en',''),(94,'are_you_sure_resend_registration_email','This will permanently reset the current password of this member. Are you sure you want to re-send registration email?','This will permanently reset the current password of this member. Are you sure you want to re-send registration email?','admin','en',''),(95,'are_you_sure_to_delete_field','Are you sure to delete current field? All added information for this field will be lost.','Are you sure to delete current field? All added information for this field will be lost.','admin','en',''),(96,'are_you_sure_to_delete_fieldgroup','Are you sure to delete selected fields group?','Are you sure to delete selected fields group?','admin','en',''),(97,'are_you_sure_to_delete_selected_items','Are you sure you want to delete selected items?','Are you sure you want to delete selected items?','admin','en',''),(98,'are_you_sure_to_delete_selected_language','Are you sure you want to delete selected language? Note: All phrases will be permanently lost!','Are you sure you want to delete selected language? Note: All phrases will be permanently lost!','admin','en',''),(99,'are_you_sure_to_delete_selected_members','Are you sure you want to delete selected members?','Are you sure you want to delete selected members?','admin','en',''),(100,'are_you_sure_to_delete_selected_menus','Are you sure you want to delete selected menus?','Are you sure you want to delete selected menus?','admin','en',''),(101,'are_you_sure_to_delete_selected_pages','Are you sure you want to delete selected pages?','Are you sure you want to delete selected pages?','admin','en',''),(102,'are_you_sure_to_delete_selected_phrases','Are you sure you want to delete selected phrases?','Are you sure you want to delete selected phrases?','admin','en',''),(103,'are_you_sure_to_delete_this_block','Are you sure you want to delete this block?','Are you sure you want to delete this block?','admin','en',''),(104,'are_you_sure_to_delete_this_item','Are you sure you want to delete this item?','Are you sure you want to delete this item?','admin','en',''),(105,'are_you_sure_to_delete_this_member','Are you sure you want to delete this member?','Are you sure you want to delete this member?','admin','en',''),(106,'are_you_sure_to_delete_this_menu','Are you sure you want to delete this menu?','Are you sure you want to delete this menu?','admin','en',''),(107,'are_you_sure_to_delete_this_page','Are you sure you want to delete this page?','Are you sure you want to delete this page?','admin','en',''),(108,'are_you_sure_to_delete_this_plan','Are you sure you want to delete this plan?','Are you sure you want to delete this plan?','admin','en',''),(109,'are_you_sure_to_delete_this_transaction','Are you sure you want to delete this transaction?','Are you sure you want to delete this transaction?','admin','en',''),(110,'are_you_sure_to_delete_this_usergroup','Are you sure you want to delete this usergroup? All the users of this usergroup will be assigned to the Registered usergroup.','Are you sure you want to delete this usergroup? All the users of this usergroup will be assigned to the Registered usergroup.','admin','en',''),(111,'are_you_sure_to_delete_transactions','Are you sure you want to delete transactions?','Are you sure you want to delete transactions?','admin','en',''),(112,'are_you_sure_to_uninstall_selected_plugin','Are you sure you wish to uninstall this plugin? Please take a note that all plugin data will be lost. This action cannot be reverted.','Are you sure you wish to uninstall this plugin? Please take a note that all plugin data will be lost. This action cannot be reverted.','admin','en',''),(113,'are_you_sure_to_uninstall_selected_package','Are you sure you wish to uninstall this package? Please take a note that all package data will be lost. This action cannot be reverted.','Are you sure you wish to uninstall this package? Please take a note that all package data will be lost. This action cannot be reverted.','admin','en',''),(114,'ascii_required','Only alphanumeric characters are allowed','Only alphanumeric characters are allowed','admin','en',''),(115,'assignable','Assignable','Assignable','admin','en',''),(116,'at_least_one_item_should_be_checked','At least one item should be selected.','At least one item should be selected.','admin','en',''),(117,'available_dump_files','Available Dump Files','Available Dump Files','admin','en',''),(118,'available_patterns','Available patterns','Available patterns','admin','en',''),(119,'available_plugins','Available Plugins','Available Plugins','admin','en',''),(120,'back_to_homepage','Back to homepage','Back to homepage','admin','en',''),(121,'bad_iso_code','Bad country-ISO code.','Bad country-ISO code.','admin','en',''),(122,'banned','Banned','Banned','admin','en',''),(123,'body','Body','Body','admin','en',''),(124,'body_incorrect','Message body or subject is empty.','Message body or subject is empty.','admin','en',''),(125,'block_contents','Contents','Contents','admin','en',''),(126,'block_created','Block created.','Block created.','admin','en',''),(127,'block_type_tip_html','HTML type is used for formatted HTML display. You can use WYSIWYG editor for your block content. This block can be also used for JavaScript code, but you <span style=\"color: red;\">need to paste it in SOURCE mode</span>','HTML type is used for formatted HTML display. You can use WYSIWYG editor for your block content. This block can be also used for JavaScript code, but you <span style=\"color: red;\">need to paste it in SOURCE mode</span>','admin','en',''),(128,'block_type_tip_php','PHP is used to have php code in your block content.','PHP is used to have php code in your block content.','admin','en',''),(129,'block_type_tip_plain','Plain type is used when you wish to display simple information. It will be displayed as is with escaping HTML tags.','Plain type is used when you wish to display simple information. It will be displayed as is with escaping HTML tags.','admin','en',''),(130,'block_type_tip_smarty','Smarty type block is used for smarty code. You can get more information about Smarty template engine here: <a target=\"_blank\" href=\"http://www.smarty.net\">http://www.smarty.net</a>','Smarty type block is used for smarty code. You can get more information about Smarty template engine here: <a target=\"_blank\" href=\"http://www.smarty.net\">http://www.smarty.net</a>','admin','en',''),(131,'block_visible_everywhere','Visible everywhere','Visible everywhere','admin','en',''),(132,'block_visibility_exceptions_visible','Choose where block will be explicitly <b>visible</b>','Choose where block will be explicitly <b>visible</b>','admin','en',''),(133,'block_visibility_exceptions_hidden','Choose where block will be explicitly <b>hidden</b>','Choose where block will be explicitly <b>hidden</b>','admin','en',''),(134,'blocks','Blocks','Blocks','admin','en',''),(135,'bug_report','Bug Report','Bug Report','admin','en',''),(136,'buy','Buy','Buy','admin','en',''),(137,'buy_before_install','You need to purchase this plugin in order to install it.','You need to purchase this plugin in order to install it.','admin','en',''),(138,'cache_dropped','Cache has been dropped.','Cache has been dropped.','admin','en',''),(139,'cant_open_incorrect_format','Could not open file with SQL instructions: :filename. Only .sql files are allowed.','Could not open file with SQL instructions: :filename. Only .sql files are allowed.','admin','en',''),(140,'cant_open_sql','Could not open file with SQL instructions: :filename','Could not open file with SQL instructions: :filename','admin','en',''),(141,'cant_write_sql','Could not write to file :filename.','Could not write to file :filename.','admin','en',''),(142,'calendar_dow','S,M,T,W,T,F,S','S,M,T,W,T,F,S','admin','en',''),(143,'calendar_ml','January,February,March,April,May,June,July,August,September,October,November,December','January,February,March,April,May,June,July,August,September,October,November,December','admin','en',''),(144,'calendar_ms','Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec','Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec','admin','en',''),(145,'change_status_to','On expiration change status to','On expiration change status to','admin','en',''),(146,'change_usergroup_to','Change usergroup to ... after plan change','Change usergroup to ... after plan change','admin','en',''),(147,'changelog','Changelog','Changelog','admin','en',''),(148,'changelog_added','New Features','New Features','admin','en',''),(149,'changelog_bugfixes','Bugfixes','Bugfixes','admin','en',''),(150,'changelog_modified','Improvements','Improvements','admin','en',''),(151,'changelog_other','Other Changes','Other Changes','admin','en',''),(152,'chars_left','characters left','characters left','admin','en',''),(153,'checkboxes','Checkboxes','Checkboxes','admin','en',''),(154,'consistency','Consistency','Consistency','admin','en',''),(155,'choose_import_file','Please choose a file to be imported.','Please choose a file to be imported.','admin','en',''),(156,'choose_item','Choose item','Choose item','admin','en',''),(157,'clear','Clear','Clear','admin','en',''),(158,'clear_confirm','Are you sure you want to clear your form?','Are you sure you want to clear your form?','admin','en',''),(159,'clear_default','Clear default value','Clear default value','admin','en',''),(160,'clear_reset','Are you sure you wish to clear all your data? Note this operation is irreversible and all your items data will be lost.','Are you sure you wish to clear all your data? Note this operation is irreversible and all your items data will be lost.','admin','en',''),(161,'closing_window_with_unsaved_changes','You are closing a window that has unsaved changes. Would you like to save your changes?','You are closing a window that has unsaved changes. Would you like to save your changes?','admin','en',''),(162,'collapsible','Collapsible','Collapsible','admin','en',''),(163,'config_debug_pass','Debug password','Debug password','admin','en',''),(164,'config_tmpl','Frontend theme','Frontend theme','admin','en',''),(165,'config_backup','Directory for database backups','Directory for database backups','admin','en',''),(166,'config_cron','Cron','Cron','admin','en',''),(167,'config_admin_tmpl','Admin Panel theme','Admin Panel theme','admin','en',''),(168,'config_default_package','Default package','Default package','admin','en',''),(169,'config_tmpl_rollback_data','Previous template restoration data','Previous template restoration data','admin','en',''),(170,'config_tmpl_layout_data','Template layout information','Template layout information','admin','en',''),(171,'config_site','Site title','Site title','admin','en',''),(172,'config_bc_home','Breadcrumb first element','Breadcrumb first element','admin','en',''),(173,'config_suffix','Suffix for page titles','Suffix for page titles','admin','en',''),(174,'config_site_logo','Website logo','Website logo','admin','en',''),(175,'config_site_favicon','Website favicon','Website favicon','admin','en',''),(176,'config_lang','Default language','Default language','admin','en',''),(177,'config_language_switch','Language switching','Language switching','admin','en',''),(178,'config_timezone','Default timezone','Default timezone','admin','en',''),(179,'config_members_enabled','Members functionality','Members functionality','admin','en',''),(180,'config_members_autoapproval','Members auto-approval','Members auto-approval','admin','en',''),(181,'config_hybrid_enabled','Enable HybridAuth','Enable HybridAuth','admin','en',''),(182,'config_hybrid_debug_mode','Debug mode','Debug mode','admin','en',''),(183,'config_gravatar_enabled','Enable Gravatars','Enable Gravatars','admin','en',''),(184,'config_gravatar_size','Size','Size','admin','en',''),(185,'config_gravatar_type','Image type','Image type','admin','en',''),(186,'config_gravatar_rating','Rating','Rating','admin','en',''),(187,'config_gravatar_default_image','Default image','Default image','admin','en',''),(188,'config_site_email','Default site email','Default site email','admin','en',''),(189,'config_bcc_email','BCC auto emails to','BCC auto emails to','admin','en',''),(190,'config_site_from_name','Default mail name','Default mail name','admin','en',''),(191,'config_default_email_signature','Default mail signature','Default mail signature','admin','en',''),(192,'config_mail_function','Mail method','Mail method','admin','en',''),(193,'config_mail_test','Send test email','Send test email','admin','en',''),(194,'config_smtp_debug','SMTP Debug','SMTP Debug','admin','en',''),(195,'config_smtp_auth','SMTP Authentication','SMTP Authentication','admin','en',''),(196,'config_smtp_server','SMTP Server','SMTP Server','admin','en',''),(197,'config_smtp_port','SMTP Port','SMTP Port','admin','en',''),(198,'config_smtp_secure','SMTP Secure','SMTP Secure','admin','en',''),(199,'config_smtp_user','SMTP Server Username','SMTP Server Username','admin','en',''),(200,'config_smtp_password','SMTP Server Password','SMTP Server Password','admin','en',''),(201,'config_sendmail_path','Path to sendmail ','Path to sendmail ','admin','en',''),(202,'config_mimetype','Send HTML mime-type emails instead of plain text','Send HTML mime-type emails instead of plain text','admin','en',''),(203,'config_admin_page','Admin Dashboard URL','Admin Dashboard URL','admin','en',''),(204,'config_https','HTTPS','HTTPS','admin','en',''),(205,'config_frontend','Display frontend','Display frontend','admin','en',''),(206,'config_underconstruction','Under construction message','Under construction message','admin','en',''),(207,'config_display_feedbacks','Feedbacks panel display','Feedbacks panel display','admin','en',''),(208,'config_display_changelog','Changelog panel display','Changelog panel display','admin','en',''),(209,'config_display_twitter','Twitter in Dashboard','Twitter in Dashboard','admin','en',''),(210,'config_check_for_updates','Check for updates','Check for updates','admin','en',''),(211,'config_auto_apply_critical_upgrades','Automatically apply critical upgrades','Automatically apply critical upgrades','admin','en',''),(212,'config_allow_remote_templates','Allow remote templates','Allow remote templates','admin','en',''),(213,'config_sap_style','Default colors scheme','Default colors scheme','admin','en',''),(214,'config_alias_urlencode','Encode non-Latin symbols in URL','Encode non-Latin symbols in URL','admin','en',''),(215,'config_redirect_time','Redirect time (ms)','Redirect time (ms)','admin','en',''),(216,'config_prevent_csrf','Prevent CSRF attack','Prevent CSRF attack','admin','en',''),(217,'config_caching','Caching','Caching','admin','en',''),(218,'config_smarty_cache','Smarty force compile','Smarty force compile','admin','en',''),(219,'config_compress_js','Compress Javascript','Compress Javascript','admin','en',''),(220,'config_thumb_w','Thumbnails default width','Thumbnails default width','admin','en',''),(221,'config_thumb_h','Thumbnails default height','Thumbnails default height','admin','en',''),(222,'config_watermark','Enable','Enable','admin','en',''),(223,'config_watermark_position','Position','Position','admin','en',''),(224,'config_watermark_opacity','Opacity','Opacity','admin','en',''),(225,'config_watermark_type','Type','Type','admin','en',''),(226,'config_watermark_text','Text','Text','admin','en',''),(227,'config_watermark_text_color','Text RGB color','Text RGB color','admin','en',''),(228,'config_watermark_text_size','Text size','Text size','admin','en',''),(229,'config_watermark_image','Image','Image','admin','en',''),(230,'config_lightbox','Lightbox','Lightbox','admin','en',''),(231,'config_lightbox_name','Lightbox name','Lightbox name','admin','en',''),(232,'config_','Frontend code integration','Frontend code integration','admin','en',''),(233,'config_frontend_header_code','Code before closing HEAD tag','Code before closing HEAD tag','admin','en',''),(234,'config_frontend_footer_code','Code before closing BODY tag','Code before closing BODY tag','admin','en',''),(235,'config_opengraph_description','OG default description','OG default description','admin','en',''),(236,'config_opengraph_image','OG default image','OG default image','admin','en',''),(237,'config_ckeditor_skin','Skin','Skin','admin','en',''),(238,'config_captcha','Captcha','Captcha','admin','en',''),(239,'config_captcha_name','Captcha name','Captcha name','admin','en',''),(240,'config_captcha_preview','Captcha preview','Captcha preview','admin','en',''),(241,'config_search_instant','Instant search','Instant search','admin','en',''),(242,'config_currency','Currency','Currency','admin','en',''),(243,'config_funds_min_deposit','Minimum deposit','Minimum deposit','admin','en',''),(244,'config_funds_max_deposit','Maximum deposit','Maximum deposit','admin','en',''),(245,'config_funds_max','Maximum balance','Maximum balance','admin','en',''),(246,'config_api_enabled','API enabled','API enabled','admin','en',''),(247,'config_api_push_access_key','GCM access key','GCM access key','admin','en',''),(248,'config_api_token','Permanent API token','Permanent API token','admin','en',''),(249,'config_member_templates','Member templates','Member templates','admin','en',''),(250,'config_member_approved','Member approval','Member approval','admin','en',''),(251,'config_member_disapproved','Member cancellation','Member cancellation','admin','en',''),(252,'config_member_registration','Member registration','Member registration','admin','en',''),(253,'config_member_registration_notification','Member created by admin','Member created by admin','admin','en',''),(254,'config_member_registration_admin','Administrator\'s notification on member registration','Administrator\'s notification on member registration','admin','en',''),(255,'config_member_removal','Member removal','Member removal','admin','en',''),(256,'config_password_restoration','Member password restoration','Member password restoration','admin','en',''),(257,'config_password_changement','Member password change','Member password change','admin','en',''),(258,'config_financial_templates','Financial templates','Financial templates','admin','en',''),(259,'config_plan_activated','Item paid and activated','Item paid and activated','admin','en',''),(260,'config_plan_expired','Paid item expired','Paid item expired','admin','en',''),(261,'config_transaction_paid','Transaction passed','Transaction passed','admin','en',''),(262,'config_transaction_paid_admin','Administrator\'s notification on payment completion','Administrator\'s notification on payment completion','admin','en',''),(263,'config_invoice_created','Invoice created','Invoice created','admin','en',''),(264,'config_empty_password','-empty password-','-empty password-','admin','en',''),(265,'config_empty_value','-empty value-','-empty value-','admin','en',''),(266,'config_groups','Configuration Groups','Configuration Groups','admin','en',''),(267,'config_group_api','API','API','admin','en',''),(268,'config_group_financial','Financial','Financial','admin','en',''),(269,'config_group_general','General','General','admin','en',''),(270,'config_group_mail','Mail','Mail','admin','en',''),(271,'config_group_members','Members','Members','admin','en',''),(272,'config_group_miscellaneous','Miscellaneous','Miscellaneous','admin','en',''),(273,'config_group_pictures','Pictures','Pictures','admin','en',''),(274,'config_group_system','System','System','admin','en',''),(275,'config_set_custom','Set custom value','Set custom value','admin','en',''),(276,'config_set_default','Set default value','Set default value','admin','en',''),(277,'configuration','Configuration','Configuration','admin','en',''),(278,'contents','Contents','Contents','admin','en',''),(279,'compare','Compare','Compare','admin','en',''),(280,'compatibility','Min core','Min core','admin','en',''),(281,'complete_inserts','Complete Inserts','Complete Inserts','admin','en',''),(282,'copy_master_language_to','Copy master language [<b>:lang</b>] to ','Copy master language [<b>:lang</b>] to ','admin','en',''),(283,'copy_language','Copy Language','Copy Language','admin','en',''),(284,'copy_privileges_from','Copy Privileges From','Copy Privileges From','admin','en',''),(285,'core_and_db_versions_mismatch','DB and core files versions mismatch.','DB and core files versions mismatch.','admin','en',''),(286,'cost','Cost','Cost','admin','en',''),(287,'created','Created.','Created.','admin','en',''),(288,'created_date','Created date','Created date','admin','en',''),(289,'crop','Crop','Crop','admin','en',''),(290,'crop_tip','The mod will attempt to fit the image inside the &quot;frame&quot; created by the width and height arguments.','The mod will attempt to fit the image inside the &quot;frame&quot; created by the width and height arguments.','admin','en',''),(291,'css_class_name','CSS class name','CSS class name','admin','en',''),(292,'csv_format','CSV format','CSV format','admin','en',''),(293,'current_home_page','Current homepage','Current homepage','admin','en',''),(294,'custom','Custom','Custom','admin','en',''),(295,'custom_configuration_title',':settings configuration for :type \":title\"',':settings configuration for :type \":title\"','admin','en',''),(296,'custom_modification','Custom Modification','Custom Modification','admin','en',''),(297,'custom_template','Use custom tpl','Use custom tpl','admin','en',''),(298,'custom_template_filename','Template filename','Template filename','admin','en',''),(299,'custom_perm','Custom Permissions','Custom Permissions','admin','en',''),(300,'custom_url','Custom URL','Custom URL','admin','en',''),(301,'customize','Customize','Customize','admin','en',''),(302,'customization_mode_alert','You are in customization mode. Do not forget to save your changes.','You are in customization mode. Do not forget to save your changes.','admin','en',''),(303,'cycles','cycles','cycles','admin','en',''),(304,'dashboard','Dashboard','Dashboard','admin','en',''),(305,'date_added','Date Added','Date Added','admin','en',''),(306,'date_created','Date Created','Date Created','admin','en',''),(307,'date_due','Date Due','Date Due','admin','en',''),(308,'date_modified','Date Modified','Date Modified','admin','en',''),(309,'day','day','day','admin','en',''),(310,'days','days','days','admin','en',''),(311,'days_ago',':days days ago',':days days ago','admin','en',''),(312,'deactivate','Deactivate package','Deactivate package','admin','en',''),(313,'deactivated','Deactivated','Deactivated','admin','en',''),(314,'debug_mode','Debug Mode','Debug Mode','admin','en',''),(315,'debug_mode_activated','Debug mode activated for you.','Debug mode activated for you.','admin','en',''),(316,'default_language','Default Language','Default Language','admin','en',''),(317,'digits_only','digits only (1-255), default is 255','digits only (1-255), default is 255','admin','en',''),(318,'directory_not_writable','Directory \":directory\" is not writable. You could not save to server.','Directory \":directory\" is not writable. You could not save to server.','admin','en',''),(319,'display','Display','Display','admin','en',''),(320,'do','Do','Do','admin','en',''),(321,'documentation','Documentation','Documentation','admin','en',''),(322,'documentation_not_available','Data for this module is not available.','Data for this module is not available.','admin','en',''),(323,'drag_to_reorder','Drag to re-order','Drag to re-order','admin','en',''),(324,'dropdown','Dropdown','Dropdown','admin','en',''),(325,'duration','Duration','Duration','admin','en',''),(326,'edit_block','Edit Block','Edit Block','admin','en',''),(327,'edit_field','Edit Field \":field\"','Edit Field \":field\"','admin','en',''),(328,'edit_fieldgroup','Edit Field Group','Edit Field Group','admin','en',''),(329,'edit_image_type','Edit Image Type','Edit Image Type','admin','en',''),(330,'edit_invoice','Edit Invoice','Edit Invoice','admin','en',''),(331,'edit_language','Edit Language','Edit Language','admin','en',''),(332,'edit_member','Edit Member','Edit Member','admin','en',''),(333,'edit_menu','Edit Menu','Edit Menu','admin','en',''),(334,'edit_page','Edit Page','Edit Page','admin','en',''),(335,'edit_page_title','Edit page title','Edit page title','admin','en',''),(336,'edit_plan','Edit Plan','Edit Plan','admin','en',''),(337,'edit_phrases','edit phrases','edit phrases','admin','en',''),(338,'email_templates','Email Templates','Email Templates','admin','en',''),(339,'email_templates_tags','Email Template Tags','Email Template Tags','admin','en',''),(340,'email_templates_tags_info','You can use these tags in your email templates. They will be changed to real information while sending email templates. Click will paste it to template body.','You can use these tags in your email templates. They will be changed to real information while sending email templates. Click will paste it to template body.','admin','en',''),(341,'empty','-empty-','-empty-','admin','en',''),(342,'empty_field','Empty field text','Empty field text','admin','en',''),(343,'enable_no_follow','Enable No-Follow','Enable No-Follow','admin','en',''),(344,'enable_template_sending','Enable sending','Enable sending','admin','en',''),(345,'enter_external_url','Enter External URL','Enter External URL','admin','en',''),(346,'error_block_name','Please input correct block name. It should be alpha numeric.','Please input correct block name. It should be alpha numeric.','admin','en',''),(347,'error_block_name_duplicate','Please change block name. There is a block with the same name in the database.','Please change block name. There is a block with the same name in the database.','admin','en',''),(348,'error_compare_same_languages','No way to compare same languages.','No way to compare same languages.','admin','en',''),(349,'error_contents','Content field is empty.','Content field is empty.','admin','en',''),(350,'error_filename','Filename field is empty.','Filename field is empty.','admin','en',''),(351,'error_incorrect_dimensions','Set correct image dimensions.','Set correct image dimensions.','admin','en',''),(352,'error_incorrect_format_from_subrion','The module files are in the incorrect format. Please contact the Subrion team.','The module files are in the incorrect format. Please contact the Subrion team.','admin','en',''),(353,'error_file_type','You need to set allowed file extensions.','You need to set allowed file extensions.','admin','en',''),(354,'error_incorrect_response_from_subrion','No response from subrion.org website. Please try again later or contact the Subrion team.','No response from subrion.org website. Please try again later or contact the Subrion team.','admin','en',''),(355,'error_install_plugin','There is a problem while installing :plugin plugin. Please contact support team.','There is a problem while installing :plugin plugin. Please contact support team.','admin','en',''),(356,'error_lang_contents','Content is empty for \":lang\" language. Please input correct content.','Content is empty for \":lang\" language. Please input correct content.','admin','en',''),(357,'error_lang_description','Description is empty for \":lang\" language. Please input correct description.','Description is empty for \":lang\" language. Please input correct description.','admin','en',''),(358,'error_lang_title','Title is empty for \":lang\" language. Please input correct title.','Title is empty for \":lang\" language. Please input correct title.','admin','en',''),(359,'error_plan_not_exists','Plan does not exist.','Plan does not exist.','admin','en',''),(360,'error_plan_duration','Please set correct duration for this plan.','Please set correct duration for this plan.','admin','en',''),(361,'error_usergroup_incorrect','Name is incorrect. Please input correct name for the usergroup.','Name is incorrect. Please input correct name for the usergroup.','admin','en',''),(362,'error_usergroup_exists','This group already exists. Please input different usergroup title.','This group already exists. Please input different usergroup title.','admin','en',''),(363,'error_while_doc_tabs','Unknown error while fetching documentation tabs.','Unknown error while fetching documentation tabs.','admin','en',''),(364,'external_url','External URL','External URL','admin','en',''),(365,'export','Export','Export','admin','en',''),(366,'external_file','External File','External File','admin','en',''),(367,'export_language','Export Language','Export Language','admin','en',''),(368,'export_not_checked','You have not chosen what to export.','You have not chosen what to export.','admin','en',''),(369,'export_tables_incorrect','Incorrect export tables.','Incorrect export tables.','admin','en',''),(370,'export_to_excel','Export to Excel','Export to Excel','admin','en',''),(371,'extra_actions','Extra actions','Extra actions','admin','en',''),(372,'module_changelog','Changelog','Changelog','admin','en',''),(373,'module_description','Description','Description','admin','en',''),(374,'module_documentation','Documentation','Documentation','admin','en',''),(375,'module_installation','Installation','Installation','admin','en',''),(376,'module_screenshots','Screenshots','Screenshots','admin','en',''),(377,'feature_request','New Feature Request','New Feature Request','admin','en',''),(378,'featured_end','Featured end','Featured end','admin','en',''),(379,'fee_based','Fee based','Fee based','admin','en',''),(380,'feedback_terms','If you have any ideas how to improve our software, found a bug or want to request custom modification you are welcome to use this feedback form. We will log all your requests in our database.','If you have any ideas how to improve our software, found a bug or want to request custom modification you are welcome to use this feedback form. We will log all your requests in our database.','admin','en',''),(381,'field_added','Field added.','Field added.','admin','en',''),(382,'field_tooltip','Field Tooltip','Field Tooltip','admin','en',''),(383,'field_default','Field default value','Field default value','admin','en',''),(384,'field_deleted','Field deleted.','Field deleted.','admin','en',''),(385,'field_element_children','Configure item fields for this value','Configure item fields for this value','admin','en',''),(386,'field_exists','Field already exists.','Field already exists.','admin','en',''),(387,'field_length','Field length','Field length','admin','en',''),(388,'field_name_exists','This name can not be chosen for selected item.','This name can not be chosen for selected item.','admin','en',''),(389,'field_name_invalid','Field name should consist of letters and numbers only. Length 2-60.','Field name should consist of letters and numbers only. Length 2-60.','admin','en',''),(390,'field_relation','Field relation','Field relation','admin','en',''),(391,'field_relation_dependent','Dependent field','Dependent field','admin','en',''),(392,'field_relation_parent','Parent field','Parent field','admin','en',''),(393,'field_relation_regular','Regular field','Regular field','admin','en',''),(394,'field_required','<span class=\"text-danger\">*</span>','<span class=\"text-danger\">*</span>','admin','en',''),(395,'field_values','Field values','Field values','admin','en',''),(396,'fieldgroup_added','Field group added.','Field group added.','admin','en',''),(397,'fieldgroup_deleted','Field group deleted.','Field group deleted.','admin','en',''),(398,'field_group','Field group','Field group','admin','en',''),(399,'field_groups','Field Groups','Field Groups','admin','en',''),(400,'field_type','Field type','Field type','admin','en',''),(401,'field_type_checkbox','Checkboxes Set','Checkboxes Set','admin','en',''),(402,'field_type_combo','Dropdown List','Dropdown List','admin','en',''),(403,'field_type_date','Date Input Field','Date Input Field','admin','en',''),(404,'field_type_iconpicker','Iconpicker','Iconpicker','admin','en',''),(405,'field_type_image','Single Image Upload','Single Image Upload','admin','en',''),(406,'field_type_number','Number Input','Number Input','admin','en',''),(407,'field_type_pictures','Multiple Images Upload','Multiple Images Upload','admin','en',''),(408,'field_type_radio','Radio Buttons Set','Radio Buttons Set','admin','en',''),(409,'field_type_storage','Upload Attachment','Upload Attachment','admin','en',''),(410,'field_type_text','Single Line Text Input','Single Line Text Input','admin','en',''),(411,'field_type_textarea','Multiline Textarea','Multiline Textarea','admin','en',''),(412,'field_type_url','URL Text Input','URL Text Input','admin','en',''),(413,'field_type_tree','Tree','Tree','admin','en',''),(414,'field_type_tip_checkbox','This field allows multiple values selection.','This field allows multiple values selection.','admin','en',''),(415,'field_type_tip_combo','This field will be displayed as dropdown select box.','This field will be displayed as dropdown select box.','admin','en',''),(416,'field_type_tip_date','This field adds calendar control to set the date.','This field adds calendar control to set the date.','admin','en',''),(417,'field_type_tip_iconpicker','Allows to assign icon from Font Awesome.','Allows to assign icon from Font Awesome.','admin','en',''),(418,'field_type_tip_image','This field value will be displayed as an image.','This field value will be displayed as an image.','admin','en',''),(419,'field_type_tip_number','This field can be searched by interval on Advanced Search page. Two inputs are created to set start and end values.','This field can be searched by interval on Advanced Search page. Two inputs are created to set start and end values.','admin','en',''),(420,'field_type_tip_pictures','This field is displayed as a gallery of images. Lightbox display is used on View Item page.','This field is displayed as a gallery of images. Lightbox display is used on View Item page.','admin','en',''),(421,'field_type_tip_radio','This field is displayed as multiple radio buttons.','This field is displayed as multiple radio buttons.','admin','en',''),(422,'field_type_tip_storage','This field is displayed as upload input.','This field is displayed as upload input.','admin','en',''),(423,'field_type_tip_text','This field is displayed as one line text field.','This field is displayed as one line text field.','admin','en',''),(424,'field_type_tip_textarea','This field is displayed as multiline text box.','This field is displayed as multiline text box.','admin','en',''),(425,'field_type_tip_url','This field value will be displayed as a hyperlink.','This field value will be displayed as a hyperlink.','admin','en',''),(426,'field_type_invalid','Field type is invalid.','Field type is invalid.','admin','en',''),(427,'fields','Fields','Fields','admin','en',''),(428,'fields_for_plans','Fields for plans only','Fields for plans only','admin','en',''),(429,'fields_item','Fields item','Fields item','admin','en',''),(430,'fields_item_filter','Fields item filter','Fields item filter','admin','en',''),(431,'file_doesnt_exist','File does not exist.','File does not exist.','admin','en',''),(432,'file_format','File format','File format','admin','en',''),(433,'file_prefix','File Prefix','File Prefix','admin','en',''),(434,'filename_notification','<b>For templates:</b> type a name of your TPL file and place this file in your active template folder.<br />Example: <code>block.teaser.tpl</code><br><b>For plugins:</b> TPL file should be placed in plugins\' templates folder.<br />Example: <code>extra/plugin_name:block_file</code> (without extension)<br><b>For packages:</b> TPL file should be placed in packages\' templates folder.<br />Example: <code>extra/package_name:block_file</code> (without extension)','<b>For templates:</b> type a name of your TPL file and place this file in your active template folder.<br />Example: <code>block.teaser.tpl</code><br><b>For plugins:</b> TPL file should be placed in plugins\' templates folder.<br />Example: <code>extra/plugin_name:block_file</code> (without extension)<br><b>For packages:</b> TPL file should be placed in packages\' templates folder.<br />Example: <code>extra/package_name:block_file</code> (without extension)','admin','en',''),(435,'fit','Fit','Fit','admin','en',''),(436,'fit_tip','This mode attempts to resize an image proportionally in case it does not fit inner frame dimensions set by the administrator. If it fits the dimensions, an image will not be resized at all.','This mode attempts to resize an image proportionally in case it does not fit inner frame dimensions set by the administrator. If it fits the dimensions, an image will not be resized at all.','admin','en',''),(437,'for_plan_only','For plans only','For plans only','admin','en',''),(438,'force_replacement','Force Replacement','Force Replacement','admin','en',''),(439,'free_plan_added','Free plan added.','Free plan added.','admin','en',''),(440,'future_date_specified_for_added_date','The date in future specified for &quot;Added Date&quot; field.','The date in future specified for &quot;Added Date&quot; field.','admin','en',''),(441,'global','Global','Global','admin','en',''),(442,'go_to_config','View settings','View settings','admin','en',''),(443,'go_to_list','Go to list','Go to list','admin','en',''),(444,'hide','Hide','Hide','admin','en',''),(445,'hour','hour','hour','admin','en',''),(446,'hours_ago',':hours hours ago',':hours hours ago','admin','en',''),(447,'host_fields','Host Fields','Host Fields','admin','en',''),(448,'html','HTML','HTML','admin','en',''),(449,'id','ID','ID','admin','en',''),(450,'ie_update_warning','Warning! Your version of Internet Explorer is too old. It may cause malfunctions of the script. Please update the browser to the 8 or higher version.','Warning! Your version of Internet Explorer is too old. It may cause malfunctions of the script. Please update the browser to the 8 or higher version.','admin','en',''),(451,'image_dimensions','Image dimensions','Image dimensions','admin','en',''),(452,'image_height','Image Height','Image Height','admin','en',''),(453,'image_types','Image types','Image types','admin','en',''),(454,'import','Import','Import','admin','en',''),(455,'import_from_pc','Import the language file from PC','Import the language file from PC','admin','en',''),(456,'import_from_server','Import the language file from your server','Import the language file from your server','admin','en',''),(457,'inactive','Inactive','Inactive','admin','en',''),(458,'incompatible','Incompatible','Incompatible','admin','en',''),(459,'incorrect_file_format','Incorrect file format.','Incorrect file format.','admin','en',''),(460,'incorrect_item','Please, choose a valid item','Please, choose a valid item','admin','en',''),(461,'incorrect_key','Phrase key is incorrect.','Phrase key is incorrect.','admin','en',''),(462,'incorrect_menu_name','Incorrect menu name.','Incorrect menu name.','admin','en',''),(463,'incorrect_name_url','Incorrect name. Please fill in the URL field.','Incorrect name. Please fill in the URL field.','admin','en',''),(464,'incorrect_owner_specified','Incorrect owner specified.','Incorrect owner specified.','admin','en',''),(465,'incorrect_text_field','Text field is incorrect.','Text field is incorrect.','admin','en',''),(466,'incorrect_username','Incorrect username.','Incorrect username.','admin','en',''),(467,'incorrect_value','Please enter the value of the key.','Please enter the value of the key.','admin','en',''),(468,'image_uploaded','Image :name is successfully uploaded.','Image :name is successfully uploaded.','admin','en',''),(469,'impossible_to_compare_single_language','You need to have two or more languages to start comparing them.','You need to have two or more languages to start comparing them.','admin','en',''),(470,'input_title','Please input title','Please input title','admin','en',''),(471,'insert','Insert','Insert','admin','en',''),(472,'installed_plugins','Installed plugins','Installed plugins','admin','en',''),(473,'install','Install','Install','admin','en',''),(474,'installed','Installed','Installed','admin','en',''),(475,'install_not_deleted','Warning! For safety purposes, please remove the file :file','Warning! For safety purposes, please remove the file :file','admin','en',''),(476,'install_upgrade','Install or upgrade','Install or upgrade','admin','en',''),(477,'installation_module_requirement_doesnot_exist','The currently installed :type &ldquo;:module&rdquo; is not compatible with the module.','The currently installed :type &ldquo;:module&rdquo; is not compatible with the module.','admin','en',''),(478,'installation_module_requirement_exist','Requires the &ldquo;:module&rdquo; :type to be installed.','Requires the &ldquo;:module&rdquo; :type to be installed.','admin','en',''),(479,'installation_module_requirement_incorrect','Invalid dependencies specified. Ignored.','Invalid dependencies specified. Ignored.','admin','en',''),(480,'installation_impossible','Installation is currently impossible.','Installation is currently impossible.','admin','en',''),(481,'interval','Interval','Interval','admin','en',''),(482,'invalid_image_file','Unable to process image, invalid image file.','Unable to process image, invalid image file.','admin','en',''),(483,'invalid_plugin_dependencies','Invalid plugin dependencies','Invalid plugin dependencies','admin','en',''),(484,'invoice_id','Invoice ID','Invoice ID','admin','en',''),(485,'items_fields','Fields','Fields','admin','en',''),(486,'invert','Invert','Invert','admin','en',''),(487,'iso_code','ISO Code','ISO Code','admin','en',''),(488,'item_down','DOWN','DOWN','admin','en',''),(489,'item_id','Item ID','Item ID','admin','en',''),(490,'item_up','UP','UP','admin','en',''),(491,'item_value','Item Value','Item Value','admin','en',''),(492,'items_deleted',':num items deleted.',':num items deleted.','admin','en',''),(493,'items_deleted_of',':num of :total items deleted.',':num of :total items deleted.','admin','en',''),(494,'items_per_page','Items per page','Items per page','admin','en',''),(495,'items_updated_of',':num of :total items updated.',':num of :total items updated.','admin','en',''),(496,'just_now','just now','just now','admin','en',''),(497,'key_exists','The phrase with similar key already exists.','The phrase with similar key already exists.','admin','en',''),(498,'key_not_valid','Key is invalid. Only alphanumeric and underscore characters allowed.','Key is invalid. Only alphanumeric and underscore characters allowed.','admin','en',''),(499,'lang_incorrect','Please choose correct language.','Please choose correct language.','admin','en',''),(500,'language_iso_code','Iso','Iso','admin','en',''),(501,'language_locale','Locale','Locale','admin','en',''),(502,'language_date_format','Date format','Date format','admin','en',''),(503,'language_direction','Direction','Direction','admin','en',''),(504,'language_direction_ltr','Left to right (LTR)','Left to right (LTR)','admin','en',''),(505,'language_direction_rtl','Right to left (RTL)','Right to left (RTL)','admin','en',''),(506,'language_already_exists','Language already exists.','Language already exists.','admin','en',''),(507,'language_date_format_incorrect','Date format is incorrect.','Date format is incorrect.','admin','en',''),(508,'language_locale_incorrect','Language locale is incorrect.','Language locale is incorrect.','admin','en',''),(509,'language_copied','New language created (:count phrases copied).','New language created (:count phrases copied).','admin','en',''),(510,'language_deleted','Selected language has been deleted.','Selected language has been deleted.','admin','en',''),(511,'languages_comparison','Comparison','Comparison','admin','en',''),(512,'last_updated','Last updated','Last updated','admin','en',''),(513,'launch_manually','Launch manually','Launch manually','admin','en',''),(514,'legend','Legend','Legend','admin','en',''),(515,'listings_limit','Listings limit','Listings limit','admin','en',''),(516,'loading_widgets','Loading widgets...','Loading widgets...','admin','en',''),(517,'local','Local','Local','admin','en',''),(518,'login_to_text','Enter the login name into \"Login\" and password into the \"Password\" fields.\r\nThen click \"Login\".','Enter the login name into \"Login\" and password into the \"Password\" fields.\r\nThen click \"Login\".','admin','en',''),(519,'location_sql_file','Location of MySQL upgrade file','Location of MySQL upgrade file','admin','en',''),(520,'mailer','Mailer','Mailer','admin','en',''),(521,'manage','Manage','Manage','admin','en',''),(522,'manage_entries','Manage entries','Manage entries','admin','en',''),(523,'master','Master','Master','admin','en',''),(524,'max_files','Max number of files','Max number of files','admin','en',''),(525,'max_num_images','Max Images','Max Images','admin','en',''),(526,'member_add','Add a Member','Add a Member','admin','en',''),(527,'member_added','Member added.','Member added.','admin','en',''),(528,'member_deleted','Member deleted.','Member deleted.','admin','en',''),(529,'member_edit','Edit Member','Edit Member','admin','en',''),(530,'members_with_custom_perms','Members <small>with custom permissions</small>','Members <small>with custom permissions</small>','admin','en',''),(531,'menu_configuration','Menu configuration','Menu configuration','admin','en',''),(532,'menu_doesnot_exists','Menu does not exist.','Menu does not exist.','admin','en',''),(533,'menu_deleted','Menu removed.','Menu removed.','admin','en',''),(534,'menu_exists','Menu with this name is already present. Please set another name.','Menu with this name is already present. Please set another name.','admin','en',''),(535,'menu_visible_everywhere','Visible everywhere','Visible everywhere','admin','en',''),(536,'menu_visibility_exceptions_visible','Choose where menu will be explicitly <b>visible</b>','Choose where menu will be explicitly <b>visible</b>','admin','en',''),(537,'menu_visibility_exceptions_hidden','Choose where menu will be explicitly <b>hidden</b>','Choose where menu will be explicitly <b>hidden</b>','admin','en',''),(538,'menus','Menus','Menus','admin','en',''),(539,'menus_deleted','Menus deleted.','Menus deleted.','admin','en',''),(540,'message_body','Message Body','Message Body','admin','en',''),(541,'meta_description','Meta-description','Meta-description','admin','en',''),(542,'meta_keywords','Meta-keywords','Meta-keywords','admin','en',''),(543,'migrations','Migrations','Migrations','admin','en',''),(544,'migration_already_applied','Migration has been applied.','Migration has been applied.','admin','en',''),(545,'migrations_not_applied','Non-applied migrations','Non-applied migrations','admin','en',''),(546,'minutes_ago',':minutes minutes ago',':minutes minutes ago','admin','en',''),(547,'mode','Mode','Mode','admin','en',''),(548,'module_downloaded','\":name\" downloaded.','\":name\" downloaded.','admin','en',''),(549,'moved','Moved.','Moved.','admin','en',''),(550,'multilingual','Multilingual','Multilingual','admin','en',''),(551,'multiple_selection','Multiple selection','Multiple selection','admin','en',''),(552,'mysql_options','MySQL Options','MySQL Options','admin','en',''),(553,'na','n/a','n/a','admin','en',''),(554,'name','Name','Name','admin','en',''),(555,'name_is_incorrect','Name is incorrect.','Name is incorrect.','admin','en',''),(556,'new_language','New Language','New Language','admin','en',''),(557,'new_password','New password','New password','admin','en',''),(558,'next_launch','Next launch','Next launch','admin','en',''),(559,'next_payment_date','Next payment date','Next payment date','admin','en',''),(560,'no_blocks','There are no blocks.','There are no blocks.','admin','en',''),(561,'no_captcha_preview','No captcha preview.','No captcha preview.','admin','en',''),(562,'no_extension','No extension','No extension','admin','en',''),(563,'no_follow_url','No Follow URL','No Follow URL','admin','en',''),(564,'no_image_types','No image types added. Please, <a href=\":url\" target=\"_blank\">add them</a> first.','No image types added. Please, <a href=\":url\" target=\"_blank\">add them</a> first.','admin','en',''),(565,'no_implemented_packages','No implemented packages.','No implemented packages.','admin','en',''),(566,'no_members','- no members -','- no members -','admin','en',''),(567,'no_migrations','No migration files available.','No migration files available.','admin','en',''),(568,'no_modules','No modules. You can check <a href=\"https://subrion.org/\" target=\"_blank\">Subrion.org website</a> to get some modules for your website.','No modules. You can check <a href=\"https://subrion.org/\" target=\"_blank\">Subrion.org website</a> to get some modules for your website.','admin','en',''),(569,'no_parent_fields','No main fields for this item','No main fields for this item','admin','en',''),(570,'no_plans','No Plans','No Plans','admin','en',''),(571,'no_upgrades','No patches, migrations, or upgrades available.','No patches, migrations, or upgrades available.','admin','en',''),(572,'nodes','Nodes','Nodes','admin','en',''),(573,'notes','Notes','Notes','admin','en',''),(574,'not_allowed','Not allowed','Not allowed','admin','en',''),(575,'not_required','not required','not required','admin','en',''),(576,'nothing','Nothing','Nothing','admin','en',''),(577,'notification_resolve--resolve','Resolve issue','Resolve issue','admin','en',''),(578,'notification_resolve--working','Working...','Working...','admin','en',''),(579,'notification_resolve--resolved','Resolved!','Resolved!','admin','en',''),(580,'number_of_cycles','Number of cycles','Number of cycles','admin','en',''),(581,'one_day_ago','one day ago','one day ago','admin','en',''),(582,'one_hour_ago','one hour ago','one hour ago','admin','en',''),(583,'one_value','You have to add at least one value.','You have to add at least one value.','admin','en',''),(584,'optimize_complete','Tables optimizing complete.','Tables optimizing complete.','admin','en',''),(585,'optimize_tables','Optimize tables','Optimize tables','admin','en',''),(586,'optional','optional','optional','admin','en',''),(587,'options','Options','Options','admin','en',''),(588,'original','Original','Original','admin','en',''),(589,'other_can','Other can','Other can','admin','en',''),(590,'owner','Owner','Owner','admin','en',''),(591,'owner_can','Owner can','Owner can','admin','en',''),(592,'owner_is_not_specified','Owner is not specified.','Owner is not specified.','admin','en',''),(593,'page_added','Page added.','Page added.','admin','en',''),(594,'page_alias_exists','Page URL already exists.','Page URL already exists.','admin','en',''),(595,'page_content','Page Content','Page Content','admin','en',''),(596,'page_exists','Page with specified URL already exists. Please change URL.','Page with specified URL already exists. Please change URL.','admin','en',''),(597,'page_external_url','Page External URL','Page External URL','admin','en',''),(598,'page_incorrect_template_filename','Incorrect template name for page.','Incorrect template name for page.','admin','en',''),(599,'page_name_exists','Page with specified name already exists.','Page with specified name already exists.','admin','en',''),(600,'page_preview','Page in draft','Page in draft','admin','en',''),(601,'page_title','Page Title','Page Title','admin','en',''),(602,'page_title_incorrect','Please make sure you have added all page titles.','Please make sure you have added all page titles.','admin','en',''),(603,'pages','Frontend Pages','Frontend Pages','admin','en',''),(604,'pages_contains','Include pages','Include pages','admin','en',''),(605,'pages_group_content','Content','Content','admin','en',''),(606,'pages_group_extensions','Extensions','Extensions','admin','en',''),(607,'pages_group_financial','Financial','Financial','admin','en',''),(608,'pages_group_members','Members','Members','admin','en',''),(609,'pages_group_system','System','System','admin','en',''),(610,'package_activated','Package activated.','Package activated.','admin','en',''),(611,'package_deactivated','Package deactivated.','Package deactivated.','admin','en',''),(612,'package_error','You have to choose at least one package.','You have to choose at least one package.','admin','en',''),(613,'package_required','Package required','Package required','admin','en',''),(614,'package_updated','Package updated.','Package updated.','admin','en',''),(615,'package_version','Package Version','Package Version','admin','en',''),(616,'packages_avail','Available Packages','Available Packages','admin','en',''),(617,'package_installed','Package installed.','Package installed.','admin','en',''),(618,'package_uninstalled','Package uninstalled.','Package uninstalled.','admin','en',''),(619,'password_restore_description','If you see this page that means that you have received an email with\r\n\r\nthis URL.\r\n\r\nThis page is intended to set a new password for your administration\r\n\r\naccount.\r\n\r\n<div style=\"color:red;padding:10px;border:1px solid gray\"><p>It is assumed that you know your username (login)</p><p>There is only one attempt!!!</p><p>Otherwise you\'ll have to request restoration again (in login page)</p></div>','If you see this page that means that you have received an email with\r\n\r\nthis URL.\r\n\r\nThis page is intended to set a new password for your administration\r\n\r\naccount.\r\n\r\n<div style=\"color:red;padding:10px;border:1px solid gray\"><p>It is assumed that you know your username (login)</p><p>There is only one attempt!!!</p><p>Otherwise you\'ll have to request restoration again (in login page)</p></div>','admin','en',''),(620,'path','Path','Path','admin','en',''),(621,'permissions','Permissions','Permissions','admin','en',''),(622,'permissions_members','Member permissions :member','Member permissions :member','admin','en',''),(623,'permissions_usergroups','Usergroup permissions :usergroup','Usergroup permissions :usergroup','admin','en',''),(624,'phrase_added','Phrase added.','Phrase added.','admin','en',''),(625,'phrase_manager','Phrase Manager','Phrase Manager','admin','en',''),(626,'phrase_text','Phrase Text','Phrase Text','admin','en',''),(627,'place','Position in template','Position in template','admin','en',''),(628,'plan','Plan','Plan','admin','en',''),(629,'plan_add','Add Plan','Add Plan','admin','en',''),(630,'plan_deleted','Plan deleted.','Plan deleted.','admin','en',''),(631,'plan_edit','Edit Plan','Edit Plan','admin','en',''),(632,'plans','Plans','Plans','admin','en',''),(633,'plans_fields','Fields for plan','Fields for plan','admin','en',''),(634,'plugin','Plugin','Plugin','admin','en',''),(635,'plugin_files_physically_missed','Plugin files are missing. Probably folder name does not match plugin name.','Plugin files are missing. Probably folder name does not match plugin name.','admin','en',''),(636,'plugin_installed','\":name\" plugin installed.','\":name\" plugin installed.','admin','en',''),(637,'plugin_may_not_be_removed','Plugin may not be removed.','Plugin may not be removed.','admin','en',''),(638,'plugin_reinstalled','\":name\" plugin reinstalled.','\":name\" plugin reinstalled.','admin','en',''),(639,'plugin_status_may_not_be_changed','Status of this plugin may not be changed.','Status of this plugin may not be changed.','admin','en',''),(640,'plugin_updated','Plugin updated.','Plugin updated.','admin','en',''),(641,'plugin_uninstalled','Selected plugin uninstalled.','Selected plugin uninstalled.','admin','en',''),(642,'plugins','Plugins','Plugins','admin','en',''),(643,'plugins_left',':count more plugins left to be installed.',':count more plugins left to be installed.','admin','en',''),(644,'preview','Preview','Preview','admin','en',''),(645,'previous_launch','Previous launch','Previous launch','admin','en',''),(646,'price','Price','Price','admin','en',''),(647,'primary','Primary','Primary','admin','en',''),(648,'product_items','Product Items','Product Items','admin','en',''),(649,'quantity','Quantity','Quantity','admin','en',''),(650,'query_history','Queries History','Queries History','admin','en',''),(651,'quick_access','Quick Access','Quick Access','admin','en',''),(652,'radios','Radios','Radios','admin','en',''),(653,'recent_activity','Recent activity','Recent activity','admin','en',''),(654,'recent_package_activity','Recent :package activity','Recent :package activity','admin','en',''),(655,'recount','recount','recount','admin','en',''),(656,'recurring_options','Recurring Options','Recurring Options','admin','en',''),(657,'registration_email_resent','Registration email has been re-sent.','Registration email has been re-sent.','admin','en',''),(658,'regular_field','Regular field','Regular field','admin','en',''),(659,'reinstall','Reinstall','Reinstall','admin','en',''),(660,'reinstall_plugin','Reinstall plugin','Reinstall plugin','admin','en',''),(661,'remote','Remote','Remote','admin','en',''),(662,'removed','Removed.','Removed.','admin','en',''),(663,'repair','repair','repair','admin','en',''),(664,'repair_tables','Repair tables','Repair tables','admin','en',''),(665,'repair_complete','Tables repairing complete.','Tables repairing complete.','admin','en',''),(666,'resend_registration_email','Re-send registration email','Re-send registration email','admin','en',''),(667,'reset_all','Reset all','Reset all','admin','en',''),(668,'reset_backup_alert','Please backup your data before resetting your items.','Please backup your data before resetting your items.','admin','en',''),(669,'reset_choose_table','Choose entries to reset.','Choose entries to reset.','admin','en',''),(670,'reset_default','Reset default','Reset default','admin','en',''),(671,'reset_default_package','Your package URLs will be reset. Please choose the URL that will be used to access your directory package.','Your package URLs will be reset. Please choose the URL that will be used to access your directory package.','admin','en',''),(672,'reset_default_success','Your package URLs have been reset.','Your package URLs have been reset.','admin','en',''),(673,'reset_previous_default_success','Your previous default value has been reset.','Your previous default value has been reset.','admin','en',''),(674,'reset_success','Reset successfully completed.','Reset successfully completed.','admin','en',''),(675,'resize_mode','Resize mode','Resize mode','admin','en',''),(676,'restore_defaults','Restore defaults','Restore defaults','admin','en',''),(677,'result','Result','Result','admin','en',''),(678,'request_submitted','Thanks. Your request has been submitted.','Thanks. Your request has been submitted.','admin','en',''),(679,'required_checks','Validation PHP code','Validation PHP code','admin','en',''),(680,'required_module_error','The module you are trying to install requires the following :module to be installed: :name (:version)','The module you are trying to install requires the following :module to be installed: :name (:version)','admin','en',''),(681,'required_field','Required field','Required field','admin','en',''),(682,'required_fields','Required fields','Required fields','admin','en',''),(683,'required_template_error','The template you are trying to install requires the following :module to be installed: :name (:version)','The template you are trying to install requires the following :module to be installed: :name (:version)','admin','en',''),(684,'root_about','No additional prefixes will be added to package URL. This way is highly recommended for sites with one package installed. See more details in our <a href=\"https://subrion.org/forums/\">User Forums</a>.','No additional prefixes will be added to package URL. This way is highly recommended for sites with one package installed. See more details in our <a href=\"https://subrion.org/forums/\">User Forums</a>.','admin','en',''),(685,'root_title','Script Root Installation','Script Root Installation','admin','en',''),(686,'root_old','You currently have the \":name\" package installed in your Script Root location. You can not have two packages installed in root simultaneously. If you still want to install in Root location please set the URL value for the \":name\" package.','You currently have the \":name\" package installed in your Script Root location. You can not have two packages installed in root simultaneously. If you still want to install in Root location please set the URL value for the \":name\" package.','admin','en',''),(687,'run','Run','Run','admin','en',''),(688,'run_sql_queries','Run MySQL query/queries','Run MySQL query/queries','admin','en',''),(689,'save_as_file','Save as file','Save as file','admin','en',''),(690,'save_changes_to_send_test_email','Save your changes before sending a test email.','Save your changes before sending a test email.','admin','en',''),(691,'save_to_pc','Save to PC','Save to PC','admin','en',''),(692,'save_to_server','Save to server','Save to server','admin','en',''),(693,'scheduled_task_ran','Task launched.','Task launched.','admin','en',''),(694,'screenshot','Screenshot','Screenshot','admin','en',''),(695,'script_upgraded','Your script has been automatically upgraded to version :version.','Your script has been automatically upgraded to version :version.','admin','en',''),(696,'search_in_phrases','Search in Phrases','Search in Phrases','admin','en',''),(697,'section','Search section','Search section','admin','en',''),(698,'select_all','Select all','Select all','admin','en',''),(699,'select_all_in_tab','Select all in this tab','Select all in this tab','admin','en',''),(700,'select_none','Select None','Select None','admin','en',''),(701,'send_confirm','Are you sure you wish to send this feedback to the Subrion Team?','Are you sure you wish to send this feedback to the Subrion Team?','admin','en',''),(702,'send_test_email','Send test email','Send test email','admin','en',''),(703,'sending','Sending','Sending','admin','en',''),(704,'seo','SEO','SEO','admin','en',''),(705,'server_info','Server Info','Server Info','admin','en',''),(706,'set_as_default_value','Set as default value','Set as default value','admin','en',''),(707,'set_as_default_package','Set as default package','Set as default package','admin','en',''),(708,'set_as_default_template','Activate','Activate','admin','en',''),(709,'set_as_primary','Set as primary','Set as primary','admin','en',''),(710,'set_as_thumbnail','Set as thumbnail','Set as thumbnail','admin','en',''),(711,'set_default','Set Default','Set Default','admin','en',''),(712,'set_default_success','Changes saved. Your package is now available in root.','Changes saved. Your package is now available in root.','admin','en',''),(713,'set_all_to','set all to','set all to','admin','en',''),(714,'settings','Settings','Settings','admin','en',''),(715,'show','Show','Show','admin','en',''),(716,'show_header','Show header','Show header','admin','en',''),(717,'show_in_search_as','Show in search as','Show in search as','admin','en',''),(718,'show_menus','Show in Menus','Show in Menus','admin','en',''),(719,'show_query_again','Show this query again','Show this query again','admin','en',''),(720,'shown_on_pages','Shown on Pages','Shown on Pages','admin','en',''),(721,'site_home','Site Home','Site Home','admin','en',''),(722,'sitemap_error','Sitemap file creation error! The file was not saved.','Sitemap file creation error! The file was not saved.','admin','en',''),(723,'sitemap_regenerated','Sitemap file has been regenerated and is available at the following URL: <a href=\":url\" target=\"_blank\">:url</a>.','Sitemap file has been regenerated and is available at the following URL: <a href=\":url\" target=\"_blank\">:url</a>.','admin','en',''),(724,'sponsored_end','Sponsored End','Sponsored End','admin','en',''),(725,'sql_format','SQL format','SQL format','admin','en',''),(726,'sql_management','SQL Tool','SQL Tool','admin','en',''),(727,'stay_here','Stay here','Stay here','admin','en',''),(728,'start','Start','Start','admin','en',''),(729,'statistics','Statistics','Statistics','admin','en',''),(730,'status_change_not_allowed','Status change of readonly field not allowed.','Status change of readonly field not allowed.','admin','en',''),(731,'sticky','Sticky','Sticky','admin','en',''),(732,'structure','Structure','Structure','admin','en',''),(733,'subdirectory_about','Your package will be accessible in a subdirectory. We recommend to use this way on shared hostings when you have several packages installed. <br /> Ex.: domain.com/articles/, domain.com/links/, domain.com/autos/, etc.','Your package will be accessible in a subdirectory. We recommend to use this way on shared hostings when you have several packages installed. <br /> Ex.: domain.com/articles/, domain.com/links/, domain.com/autos/, etc.','admin','en',''),(734,'subdirectory_title','Subdirectory Installation','Subdirectory Installation','admin','en',''),(735,'subdomain_about','You can install the package as a subdomain. Note you should be able to modify your Apache config file to use package on a subdomain. More instructions can be found in our <a href=\"https://subrion.org/forums/\">User Forums.</a><br /> Ex.: articles.domain.com, links.domain.com, autos.domain.com, etc.','You can install the package as a subdomain. Note you should be able to modify your Apache config file to use package on a subdomain. More instructions can be found in our <a href=\"https://subrion.org/forums/\">User Forums.</a><br /> Ex.: articles.domain.com, links.domain.com, autos.domain.com, etc.','admin','en',''),(736,'subdomain_title','Subdomain Installation','Subdomain Installation','admin','en',''),(737,'submit_feedback','Submit Feedback to the Subrion Team','Submit Feedback to the Subrion Team','admin','en',''),(738,'subtotal','Subtotal','Subtotal','admin','en',''),(739,'sure_uninstall_package','Are you sure you want to uninstall this package? Please be informed that all your package data will be lost.','Are you sure you want to uninstall this package? Please be informed that all your package data will be lost.','admin','en',''),(740,'sync_multilingual_fields','Sync multilingual fields','Sync multilingual fields','admin','en',''),(741,'system_fields','System Fields','System Fields','admin','en',''),(742,'system_notifications','System Notifications','System Notifications','admin','en',''),(743,'tab_container','Tab container','Tab container','admin','en',''),(744,'table_dumped','Table :table dumped into file \":filename\".','Table :table dumped into file \":filename\".','admin','en',''),(745,'tables','Tables','Tables','admin','en',''),(746,'tables_fields','Tables/Fields','Tables/Fields','admin','en',''),(747,'tags','Tags','Tags','admin','en',''),(748,'task','Task','Task','admin','en',''),(749,'tax','Tax','Tax','admin','en',''),(750,'template_name_empty','Template name is empty or incorrect.','Template name is empty or incorrect.','admin','en',''),(751,'template_file_error','Template file cannot be found. Use this file: :file.','Template file cannot be found. Use this file: :file.','admin','en',''),(752,'template_folder_error','Template folder is undefined or incorrect.','Template folder is undefined or incorrect.','admin','en',''),(753,'template_installed','\":name\" template installed.','\":name\" template installed.','admin','en',''),(754,'test_email_sent','Test email has been received for delivery to :email.','Test email has been received for delivery to :email.','admin','en',''),(755,'text','Text','Text','admin','en',''),(756,'this_fields_displayed_only_for_plans','These fields are displayed for sponsored plans only.','These fields are displayed for sponsored plans only.','admin','en',''),(757,'thumb_dimensions','Thumb dimensions','Thumb dimensions','admin','en',''),(758,'thumb_width','Thumbnail width','Thumbnail width','admin','en',''),(759,'thumb_height','Thumbnail height','Thumbnail height','admin','en',''),(760,'thumbnail','Thumbnail','Thumbnail','admin','en',''),(761,'timepicker','Enable time selection','Enable time selection','admin','en',''),(762,'title_alias','Title Alias','Title Alias','admin','en',''),(763,'total','Total','Total','admin','en',''),(764,'total_income','total income','total income','admin','en',''),(765,'total_members','total members','total members','admin','en',''),(766,'tooltip','Tooltip','Tooltip','admin','en',''),(767,'tpl','Template filename','Template filename','admin','en',''),(768,'transaction_added','Transaction added.','Transaction added.','admin','en',''),(769,'transaction_deleted','Transaction deleted.','Transaction deleted.','admin','en',''),(770,'transaction_id','Transaction ID','Transaction ID','admin','en',''),(771,'translate','Translate','Translate','admin','en',''),(772,'twitter_news','Twitter News','Twitter News','admin','en',''),(773,'type','Type','Type','admin','en',''),(774,'type_here_to_search','Type here to search','Type here to search','admin','en',''),(775,'type_of_field','Field type','Field type','admin','en',''),(776,'unable_to_install','Unable to install','Unable to install','admin','en',''),(777,'uninstall','Uninstall','Uninstall','admin','en',''),(778,'unique_name','Name value should be unique. Only latin letters, underscores, and digits are allowed.','Name value should be unique. Only latin letters, underscores, and digits are allowed.','admin','en',''),(779,'update_available','Update available','Update available','admin','en',''),(780,'upgrade_completed','MySQL dump file has been imported.','MySQL dump file has been imported.','admin','en',''),(781,'upload_module_error',':module directory is not writable.',':module directory is not writable.','admin','en',''),(782,'upload_writable_permission','Upload folder has no writable permissions.','Upload folder has no writable permissions.','admin','en',''),(783,'use_real_prefix','Use real tables prefix','Use real tables prefix','admin','en',''),(784,'upgrade','Upgrade','Upgrade','admin','en',''),(785,'upgrades','Upgrades','Upgrades','admin','en',''),(786,'url_nofollow','Enable nofollow attribute','Enable nofollow attribute','admin','en',''),(787,'use_as_home_page','Use as the homepage','Use as the homepage','admin','en',''),(788,'use_custom_signature','Use custom signature','Use custom signature','admin','en',''),(789,'use_editor','Use WYSIWYG editor','Use WYSIWYG editor','admin','en',''),(790,'username_already_taken','Username already taken.','Username already taken.','admin','en',''),(791,'usergroup_added','Usergroup added.','Usergroup added.','admin','en',''),(792,'usergroup_deleted','Usergroup deleted.','Usergroup deleted.','admin','en',''),(793,'usergroup_disabled','You must have at least one administrator member.','You must have at least one administrator member.','admin','en',''),(794,'usergroup_management','Usergroup management','Usergroup management','admin','en',''),(795,'usergroups','Usergroups','Usergroups','admin','en',''),(796,'version','Version','Version','admin','en',''),(797,'view_as_tab','View as tab','View as tab','admin','en',''),(798,'view_roadmap','Development Roadmap','Development Roadmap','admin','en',''),(799,'visible','Visible','Visible','admin','en',''),(800,'visible_for_admin','Visible for admin only','Visible for admin only','admin','en',''),(801,'visible_on_members','Visible on Members page','Visible on Members page','admin','en',''),(802,'visual_mode','Visual Mode','Visual Mode','admin','en',''),(803,'warning_fields_become_for_plan_only','Warning! If you check these fields they will be displayed for sponsored plans only.','Warning! If you check these fields they will be displayed for sponsored plans only.','admin','en',''),(804,'week','week','week','admin','en',''),(805,'welcome_to_admin_board','Welcome to your administration board, cap\'n!','Welcome to your administration board, cap\'n!','admin','en',''),(806,'welcome_to_admin_panel','Welcome to<br>Subrion Admin Panel','Welcome to<br>Subrion Admin Panel','admin','en',''),(807,'without_title','Without title','Without title','admin','en',''),(808,'year','year','year','admin','en',''),(809,'_not_assigned_','&lt;not assigned&gt;','&lt;not assigned&gt;','common','en',''),(810,'_select_','-- select --','-- select --','common','en',''),(811,'_status_','- Status -','- Status -','common','en',''),(812,'401','You are not authorized to access this page.','You are not authorized to access this page.','common','en',''),(813,'403','Action is forbidden.','Action is forbidden.','common','en',''),(814,'404','Requested URL not found.','Requested URL not found.','common','en',''),(815,'active','Active','Active','common','en',''),(816,'add','Add','Add','common','en',''),(817,'add_funds','Add Funds','Add Funds','common','en',''),(818,'added','Added','Added','common','en',''),(819,'address','Address','Address','common','en',''),(820,'address_line','Address Line','Address Line','common','en',''),(821,'admin_panel','Admin Panel','Admin Panel','common','en',''),(822,'all','All','All','common','en',''),(823,'amount','Amount','Amount','common','en',''),(824,'any','Any','Any','common','en',''),(825,'apply','apply','apply','common','en',''),(826,'approval','Approval','Approval','common','en',''),(827,'asc','Ascending','Ascending','common','en',''),(828,'author','Author','Author','common','en',''),(829,'avatar','Avatar','Avatar','common','en',''),(830,'browse','Browse','Browse','common','en',''),(831,'by','by','by','common','en',''),(832,'cancel','Cancel','Cancel','common','en',''),(833,'cancel_upload_confirmation','Are you sure you want to cancel this upload?','Are you sure you want to cancel this upload?','common','en',''),(834,'category','Category','Category','common','en',''),(835,'change','change','change','common','en',''),(836,'change_password','Change Password','Change Password','common','en',''),(837,'choose_file','and choose file on your computer.','and choose file on your computer.','common','en',''),(838,'city','City','City','common','en',''),(839,'click','Click','Click','common','en',''),(840,'click_here','Click here','Click here','common','en',''),(841,'click_here_to_upload','Click here to upload...','Click here to upload...','common','en',''),(842,'close','Close','Close','common','en',''),(843,'close_all','Close all','Close all','common','en',''),(844,'create','Create','Create','common','en',''),(845,'code','Code','Code','common','en',''),(846,'collapsed','Collapsed','Collapsed','common','en',''),(847,'collapse_all','Collapse All','Collapse All','common','en',''),(848,'common','Common','Common','common','en',''),(849,'confirm','Confirm','Confirm','common','en',''),(850,'contributor','Contributor','Contributor','common','en',''),(851,'copy','Copy','Copy','common','en',''),(852,'country','Country','Country','common','en',''),(853,'currency','Currency','Currency','common','en',''),(854,'current','Current','Current','common','en',''),(855,'current_page','Current Page','Current Page','common','en',''),(856,'day1','Monday','Monday','common','en',''),(857,'day2','Tuesday','Tuesday','common','en',''),(858,'day3','Wednesday','Wednesday','common','en',''),(859,'day4','Thursday','Thursday','common','en',''),(860,'day5','Friday','Friday','common','en',''),(861,'day6','Saturday','Saturday','common','en',''),(862,'day7','Sunday','Sunday','common','en',''),(863,'date','Date','Date','common','en',''),(864,'db_error','Database error.','Database error.','common','en',''),(865,'delete','Delete','Delete','common','en',''),(866,'deleted','Deleted.','Deleted.','common','en',''),(867,'desc','Descending','Descending','common','en',''),(868,'description','Description','Description','common','en',''),(869,'default','Default','Default','common','en',''),(870,'details','Details','Details','common','en',''),(871,'disabled','Disabled','Disabled','common','en',''),(872,'discard','Discard','Discard','common','en',''),(873,'done','Done','Done','common','en',''),(874,'download','Download','Download','common','en',''),(875,'draft','Draft','Draft','common','en',''),(876,'drop_files_here','Drop images here or click to choose...','Drop images here or click to choose...','common','en',''),(877,'email','Email','Email','common','en',''),(878,'edit','Edit','Edit','common','en',''),(879,'edit_block','Edit block','Edit block','common','en',''),(880,'edit_position','Edit position','Edit position','common','en',''),(881,'enabled','Enabled','Enabled','common','en',''),(882,'exit','Exit','Exit','common','en',''),(883,'module','Extras','Extras','common','en',''),(884,'empty_login','Either login or password is empty.','Either login or password is empty.','common','en',''),(885,'err_message','Message cannot be empty.','Message cannot be empty.','common','en',''),(886,'error','Error','Error','common','en',''),(887,'error_directory_readonly','Upload directory is not writable.','Upload directory is not writable.','common','en',''),(888,'error_duplicate_email','Email is already taken for another member. Please input a different email address.','Email is already taken for another member. Please input a different email address.','common','en',''),(889,'error_email_incorrect','E-mail is incorrect.','E-mail is incorrect.','common','en',''),(890,'error_login','Either login or password is invalid.','Either login or password is invalid.','common','en',''),(891,'error_password_empty','Please input correct password.','Please input correct password.','common','en',''),(892,'error_password_match','Password does not match.','Password does not match.','common','en',''),(893,'error_phone_incorrect','Phone is incorrect.','Phone is incorrect.','common','en',''),(894,'error_tmp_directory_readonly','Temp directory is readonly. Please make it writable.','Temp directory is readonly. Please make it writable.','common','en',''),(895,'error_url','Site URL is incorrect.','Site URL is incorrect.','common','en',''),(896,'forgot_password','Forgot your password?','Forgot your password?','common','en',''),(897,'fullname','Full Name','Full Name','common','en',''),(898,'featured','Featured','Featured','common','en',''),(899,'failed','Failed','Failed','common','en',''),(900,'filter','Filter','Filter','common','en',''),(901,'from','from','from','common','en',''),(902,'featured_status_finished_date_is_empty','Listing has been marked as featured, but no finished date was specified.','Listing has been marked as featured, but no finished date was specified.','common','en',''),(903,'funds','Funds','Funds','common','en',''),(904,'field__tooltip','please upload only image files','please upload only image files','common','en',''),(905,'field_members_api_push_token','Push Token of your phone','Push Token of your phone','common','en',''),(906,'field_members_api_push_receive','Are you agree to receive push notifications to your phone?','Are you agree to receive push notifications to your phone?','common','en',''),(907,'field_members_api_push_receive+yes','Yes','Yes','common','en',''),(908,'field_members_api_push_receive+no','No','No','common','en',''),(909,'field_members_avatar','Avatar','Avatar','common','en',''),(910,'field_tooltip_members_avatar','Please upload image files only','Please upload image files only','common','en',''),(911,'field_members_biography','Biography','Biography','common','en',''),(912,'field_tooltip_members_category_id','Select a category from the list','Select a category from the list','common','en',''),(913,'field_members_email','Email','Email','common','en',''),(914,'field_members_facebook','Facebook','Facebook','common','en',''),(915,'field_tooltip_members_facebook','Full link to your profile page','Full link to your profile page','common','en',''),(916,'field_members_fullname','Full Name','Full Name','common','en',''),(917,'field_members_gplus','Google+','Google+','common','en',''),(918,'field_tooltip_members_gplus','Full link to your profile page','Full link to your profile page','common','en',''),(919,'field_members_linkedin','LinkedIn','LinkedIn','common','en',''),(920,'field_tooltip_members_linkedin','Full link to your profile page','Full link to your profile page','common','en',''),(921,'field_members_phone','Phone','Phone','common','en',''),(922,'field_members_twitter','Twitter','Twitter','common','en',''),(923,'field_tooltip_members_twitter','Full link to your profile page','Full link to your profile page','common','en',''),(924,'field_members_username','Username','Username','common','en',''),(925,'field_members_website','Website','Website','common','en',''),(926,'field_description','Description','Description','common','en',''),(927,'field_gallery','Pictures','Pictures','common','en',''),(928,'field_is_empty',':field is empty.',':field is empty.','common','en',''),(929,'field_is_not_selected',':field is not selected.',':field is not selected.','common','en',''),(930,'field_item','Item','Item','common','en',''),(931,'field_pictures','Pictures','Pictures','common','en',''),(932,'field_transactions_amount','Amount','Amount','common','en',''),(933,'field_transactions_currency','Currency code','Currency code','common','en',''),(934,'field_transactions_date_created','Date created','Date created','common','en',''),(935,'field_transactions_date_paid','Date paid','Date paid','common','en',''),(936,'field_transactions_gateway','Gateway','Gateway','common','en',''),(937,'field_transactions_member_id','Member username','Member username','common','en',''),(938,'field_transactions_operation','Operation','Operation','common','en',''),(939,'field_transactions_reference_id','Order number','Order number','common','en',''),(940,'field_transactions_sec_key','Secret key','Secret key','common','en',''),(941,'field_transactions_status','Status','Status','common','en',''),(942,'field_transactions_total','Total','Total','common','en',''),(943,'fieldgroup_members_api','API','API','common','en',''),(944,'fieldgroup_members_general','General','General','common','en',''),(945,'fieldgroup_members_social','Social','Social','common','en',''),(946,'fieldgroup_description_members_api','Subrion API related data','Subrion API related data','common','en',''),(947,'fieldgroup_description_members_general','','','common','en',''),(948,'fieldgroup_description_members_social','','','common','en',''),(949,'file_click_to_upload','Click Browse to upload file','Click Browse to upload file','common','en',''),(950,'file_type_error','Files with \":extension\" extension are only allowed.','Files with \":extension\" extension are only allowed.','common','en',''),(951,'file_types','Allowed file types (comma separated values (don\'t include point), example: pdf, doc, odf, mov)','Allowed file types (comma separated values (don\'t include point), example: pdf, doc, odf, mov)','common','en',''),(952,'filename','Filename','Filename','common','en',''),(953,'gateway','Gateway','Gateway','common','en',''),(954,'general','General','General','common','en',''),(955,'general_info','General Information','General Information','common','en',''),(956,'go','Go','Go','common','en',''),(957,'group','Group','Group','common','en',''),(958,'hours','hours','hours','common','en',''),(959,'hide_everywhere','Hide everywhere','Hide everywhere','common','en',''),(960,'image','Image','Image','common','en',''),(961,'image_click_to_upload','Click Browse to upload image','Click Browse to upload image','common','en',''),(962,'image_width','Image Width','Image Width','common','en',''),(963,'incorrect_fullname','Please input correct full name.','Please input correct full name.','common','en',''),(964,'invalid_parameters','Invalid parameters.','Invalid parameters.','common','en',''),(965,'ip_address','IP Address','IP Address','common','en',''),(966,'item','Item','Item','common','en',''),(967,'key','Key','Key','common','en',''),(968,'language','Language','Language','common','en',''),(969,'languages','Languages','Languages','common','en',''),(970,'last_login_date','Logged in','Logged in','common','en',''),(971,'listings','Listings','Listings','common','en',''),(972,'loading','Loading ...','Loading ...','common','en',''),(973,'locked','Locked','Locked','common','en',''),(974,'login','Login','Login','common','en',''),(975,'logout','Logout','Logout','common','en',''),(976,'main_page','Home','Home','common','en',''),(977,'mark_as','Mark As:','Mark As:','common','en',''),(978,'member','Member','Member','common','en',''),(979,'members','Members','Members','common','en',''),(980,'month','Month','Month','common','en',''),(981,'month1','January','January','common','en',''),(982,'month2','February','February','common','en',''),(983,'month3','March','March','common','en',''),(984,'month4','April','April','common','en',''),(985,'month5','May','May','common','en',''),(986,'month6','June','June','common','en',''),(987,'month7','July','July','common','en',''),(988,'month8','August','August','common','en',''),(989,'month9','September','September','common','en',''),(990,'month10','October','October','common','en',''),(991,'month11','November','November','common','en',''),(992,'month12','December','December','common','en',''),(993,'months','months','months','common','en',''),(994,'more','More','More','common','en',''),(995,'move','Move','Move','common','en',''),(996,'move_to','Move To:','Move To:','common','en',''),(997,'multilingual_field_is_empty',':field is empty for :lang.',':field is empty for :lang.','common','en',''),(998,'name','Name','Name','common','en',''),(999,'next','Next','Next','common','en',''),(1000,'no','No','No','common','en',''),(1001,'no_items','No items.','No items.','common','en',''),(1002,'no_more_files','You can not upload more files. Limit exceeded.','You can not upload more files. Limit exceeded.','common','en',''),(1003,'no_uploaded_files_processed','No uploaded files processed due to file extension restrictions.','No uploaded files processed due to file extension restrictions.','common','en',''),(1004,'nothing_found','Nothing found.','Nothing found.','common','en',''),(1005,'ok','Ok','Ok','common','en',''),(1006,'on','on','on','common','en',''),(1007,'online_members','Online Members','Online Members','common','en',''),(1008,'operation','Operation','Operation','common','en',''),(1009,'open_close','Show / Hide the tree','Show / Hide the tree','common','en',''),(1010,'open_in_new_tab','Open in new tab','Open in new tab','common','en',''),(1011,'order','Order','Order','common','en',''),(1012,'other','Other','Other','common','en',''),(1013,'page','Page','Page','common','en',''),(1014,'page_url_will_be','Page URL will be','Page URL will be','common','en',''),(1015,'pages','Pages','Pages','common','en',''),(1016,'parent','Parent','Parent','common','en',''),(1017,'passed','Passed','Passed','common','en',''),(1018,'password','Password','Password','common','en',''),(1019,'password_confirm','Password confirmation','Password confirmation','common','en',''),(1020,'password_incorrect','Password is incorrect.','Password is incorrect.','common','en',''),(1021,'payment_gateway','Payment gateway','Payment gateway','common','en',''),(1022,'pending','Pending','Pending','common','en',''),(1023,'phone','Phone','Phone','common','en',''),(1024,'plan_added','Plan added.','Plan added.','common','en',''),(1025,'plans','Plans','Plans','common','en',''),(1026,'position','Position','Position','common','en',''),(1027,'previous','Previous','Previous','common','en',''),(1028,'print_invoice','Print invoice','Print invoice','common','en',''),(1029,'profile','Profile','Profile','common','en',''),(1030,'rank','Rank','Rank','common','en',''),(1031,'read','Read','Read','common','en',''),(1032,'recurring','Recurring','Recurring','common','en',''),(1033,'reference_id','Reference ID','Reference ID','common','en',''),(1034,'refresh','Refresh','Refresh','common','en',''),(1035,'refunded','Refunded','Refunded','common','en',''),(1036,'regular','Regular','Regular','common','en',''),(1037,'remember_me','Remember me','Remember me','common','en',''),(1038,'remove','Remove','Remove','common','en',''),(1039,'reset','Reset','Reset','common','en',''),(1040,'restore_password','Restore Password','Restore Password','common','en',''),(1041,'rss','RSS','RSS','common','en',''),(1042,'save','Save','Save','common','en',''),(1043,'saved','Saved.','Saved.','common','en',''),(1044,'save_changes','Save Changes','Save Changes','common','en',''),(1045,'saving','Saving...','Saving...','common','en',''),(1046,'search','Search','Search','common','en',''),(1047,'searchable','Searchable','Searchable','common','en',''),(1048,'select_category_from_list','Select a category from the list','Select a category from the list','common','en',''),(1049,'send','Send','Send','common','en',''),(1050,'show_everywhere','Show everywhere','Show everywhere','common','en',''),(1051,'show_on_all_pages','Global visibility','Global visibility','common','en',''),(1052,'show_on_this_page','Show on this page','Show on this page','common','en',''),(1053,'sponsored','Sponsored','Sponsored','common','en',''),(1054,'start_typing_to_filter','Start typing to filter items','Start typing to filter items','common','en',''),(1055,'status','Status','Status','common','en',''),(1056,'subject','Subject','Subject','common','en',''),(1057,'submit','Submit','Submit','common','en',''),(1058,'subscription','Subscription','Subscription','common','en',''),(1059,'summary','Summary','Summary','common','en',''),(1060,'sure_rm_file','Are you sure want to remove the file?','Are you sure want to remove the file?','common','en',''),(1061,'suspended','Suspended','Suspended','common','en',''),(1062,'title','Title','Title','common','en',''),(1063,'title_incorrect','Title is incorrect.','Title is incorrect.','common','en',''),(1064,'title_is_empty','Title is empty.','Title is empty.','common','en',''),(1065,'templates','Templates','Templates','common','en',''),(1066,'time','Time','Time','common','en',''),(1067,'total','Total','Total','common','en',''),(1068,'transaction','Transaction ','Transaction ','common','en',''),(1069,'transactions','Transactions','Transactions','common','en',''),(1070,'tree','Tree','Tree','common','en',''),(1071,'type_email_here','Type your email here','Type your email here','common','en',''),(1072,'url','URL','URL','common','en',''),(1073,'unconfirmed','Unconfirmed','Unconfirmed','common','en',''),(1074,'upload','Upload','Upload','common','en',''),(1075,'upload_correct_permission','Couldn\'t copy uploaded image to the destination folder. Please make sure that the script has write permissions.','Couldn\'t copy uploaded image to the destination folder. Please make sure that the script has write permissions.','common','en',''),(1076,'upload_pictures','Upload Picture(s)','Upload Picture(s)','common','en',''),(1077,'upload_successful','Upload successfully completed','Upload successfully completed','common','en',''),(1078,'uploading_please_wait','Uploading, please wait...','Uploading, please wait...','common','en',''),(1079,'users','Users','Users','common','en',''),(1080,'usergroup','Usergroup','Usergroup','common','en',''),(1081,'username','Username','Username','common','en',''),(1082,'username_incorrect','Username is incorrect.','Username is incorrect.','common','en',''),(1083,'usergroup_administrators','Administrators','Administrators','common','en',''),(1084,'usergroup_moderators','Moderators','Moderators','common','en',''),(1085,'usergroup_guests','Guests','Guests','common','en',''),(1086,'usergroup_registered','Registered','Registered','common','en',''),(1087,'value','Value','Value','common','en',''),(1088,'view','View','View','common','en',''),(1089,'view_all','View All','View All','common','en',''),(1090,'views','Views','Views','common','en',''),(1091,'weeks','weeks','weeks','common','en',''),(1092,'write','Write','Write','common','en',''),(1093,'years','years','years','common','en',''),(1094,'yes','Yes','Yes','common','en',''),(1095,'zip','ZIP','ZIP','common','en',''),(1096,'active_users','Active Users','Active Users','frontend','en',''),(1097,'add_funds_text','Add funds to your account with us to avoid lots of small transactions and to automatically take care of any new invoices to generate.','Add funds to your account with us to avoid lots of small transactions and to automatically take care of any new invoices to generate.','frontend','en',''),(1098,'advanced','Advanced','Advanced','frontend','en',''),(1099,'alphabetical','Alphabetical','Alphabetical','frontend','en',''),(1100,'all_groups','All groups','All groups','frontend','en',''),(1101,'amount_incorrect','Please input correct amount. It should be within :min & :max :currency.','Please input correct amount. It should be within :min & :max :currency.','frontend','en',''),(1102,'amount_to_add','Amount to add','Amount to add','frontend','en',''),(1103,'min_deposit','Minimum deposit','Minimum deposit','frontend','en',''),(1104,'max_deposit','Maximum deposit','Maximum deposit','frontend','en',''),(1105,'max_balance','Maximum balance','Maximum balance','frontend','en',''),(1106,'and_more','and more','and more','frontend','en',''),(1107,'are_you_sure_to_cancel_invoice','Are you sure you want to cancel your invoice?','Are you sure you want to cancel your invoice?','frontend','en',''),(1108,'author_contact_request','Contact request regarding \":title\"','Contact request regarding \":title\"','frontend','en',''),(1109,'auto_generate_password','Auto generate password','Auto generate password','frontend','en',''),(1110,'back_to_gateway_list','{current_gateway} payment gateway, click <a href=\"javaScript:void(0);\" onclick=\"backToPaymentGatewayList()\">here</a> to choose another one','{current_gateway} payment gateway, click <a href=\"javaScript:void(0);\" onclick=\"backToPaymentGatewayList()\">here</a> to choose another one','frontend','en',''),(1111,'back_to_profile','Back to profile','Back to profile','frontend','en',''),(1112,'billing_address','Billing Address','Billing Address','frontend','en',''),(1113,'bots','Bots','Bots','frontend','en',''),(1114,'bots_visits','Visits last 24h (bots)','Visits last 24h (bots)','frontend','en',''),(1115,'by_fullname','full name','full name','frontend','en',''),(1116,'by_username','username','username','frontend','en',''),(1117,'by_name','By name','By name','frontend','en',''),(1118,'by_registration_date','By registration date','By registration date','frontend','en',''),(1119,'change_gateway','Change gateway','Change gateway','frontend','en',''),(1120,'chars_left','Chars left','Chars left','frontend','en',''),(1121,'choose_image_file','and choose image file on your computer.','and choose image file on your computer.','frontend','en',''),(1122,'confirmation_code_incorrect','Confirmation code is incorrect.','Confirmation code is incorrect.','frontend','en',''),(1123,'confirmation_key_incorrect','Confirmation key is incorrect.','Confirmation key is incorrect.','frontend','en',''),(1124,'current_assets','Current Assets','Current Assets','frontend','en',''),(1125,'current_password','Current Password','Current Password','frontend','en',''),(1126,'date_added','Date','Date','frontend','en',''),(1127,'delete_listing','Remove Listing','Remove Listing','frontend','en',''),(1128,'do_authorize_to_save_search','Please, authorize to be able to save your searches.','Please, authorize to be able to save your searches.','frontend','en',''),(1129,'dont_wait_redir','Click here if you do not want to wait.','Click here if you do not want to wait.','frontend','en',''),(1130,'edit_listing','Edit Listing','Edit Listing','frontend','en',''),(1131,'edit_subject','Edit subject','Edit subject','frontend','en',''),(1132,'edited_by','<i>Last edited by <a href=\"{%URL%}\">{%USER%}</a></i>','<i>Last edited by <a href=\"{%URL%}\">{%USER%}</a></i>','frontend','en',''),(1133,'empty_image_title','Empty','Empty','frontend','en',''),(1134,'enter_confirmation_code','Please enter confirmation code below','Please enter confirmation code below','frontend','en',''),(1135,'error_no_member_email','No members registered with this email.','No members registered with this email.','frontend','en',''),(1136,'favorites','Favorites','Favorites','frontend','en',''),(1137,'favorites_action_add','Add to favorites','Add to favorites','frontend','en',''),(1138,'favorites_action_added','Listing has been added to favorites.','Listing has been added to favorites.','frontend','en',''),(1139,'favorites_action_delete','Remove from favorites','Remove from favorites','frontend','en',''),(1140,'favorites_action_deleted','Listing has been deleted from favorites.','Listing has been deleted from favorites.','frontend','en',''),(1141,'field_required','<span class=\"note\">[Required]</span>','<span class=\"note\">[Required]</span>','frontend','en',''),(1142,'first','First','First','frontend','en',''),(1143,'forgot','Forgot password?','Forgot password?','frontend','en',''),(1144,'forgot_tooltip','Don\'t remember your login information? We all forget &mdash; no worries. Please enter your e-mail address below and we will send your login credentials.','Don\'t remember your login information? We all forget &mdash; no worries. Please enter your e-mail address below and we will send your login credentials.','frontend','en',''),(1145,'funds_in_your_account','You have :currency :sum in your account.','You have :currency :sum in your account.','frontend','en',''),(1146,'group_filter','Group filter','Group filter','frontend','en',''),(1147,'guest','Guest','Guest','frontend','en',''),(1148,'guests','Guests','Guests','frontend','en',''),(1149,'howmuch_funds','Please input the amount you want to add:','Please input the amount you want to add:','frontend','en',''),(1150,'invalid_addressee','Invalid addressee specified.','Invalid addressee specified.','frontend','en',''),(1151,'invoice_deleted','Invoice deleted.','Invoice deleted.','frontend','en',''),(1152,'last','Last','Last','frontend','en',''),(1153,'listing_successfully_removed','Listing data has been removed.','Listing data has been removed.','frontend','en',''),(1154,'listing_successfully_submitted','Listing has been successfully submitted.','Listing has been successfully submitted.','frontend','en',''),(1155,'listing_successfully_updated','Listing data has been successfully updated.','Listing data has been successfully updated.','frontend','en',''),(1156,'live_visits','Visits last 24h (live)','Visits last 24h (live)','frontend','en',''),(1157,'login_with_social_network','Login with social network','Login with social network','frontend','en',''),(1158,'mail_sent','Email sent.','Email sent.','frontend','en',''),(1159,'member_created','Member registered! Thank you!','Member registered! Thank you!','frontend','en',''),(1160,'member_doesnt_exist','The member does not exist anymore.','The member does not exist anymore.','frontend','en',''),(1161,'member_since','Member since','Member since','frontend','en',''),(1162,'msg','Message','Message','frontend','en',''),(1163,'my_saved_searches','My saved searches','My saved searches','frontend','en',''),(1164,'my_searches','My searches','My searches','frontend','en',''),(1165,'new_password','New Password','New Password','frontend','en',''),(1166,'new_password2','New Password [confirm]','New Password [confirm]','frontend','en',''),(1167,'new_password_sent','New password has been sent to your email.','New password has been sent to your email.','frontend','en',''),(1168,'no_funds','You have not added funds to your account.','You have not added funds to your account.','frontend','en',''),(1169,'no_favorites','You have not added any favorite items.','You have not added any favorite items.','frontend','en',''),(1170,'no_gateway','You have not installed any payment gateway plugin.','You have not installed any payment gateway plugin.','frontend','en',''),(1171,'no_members','No members found that match specified params.','No members found that match specified params.','frontend','en',''),(1172,'no_transaction','Sorry, no such transaction.','Sorry, no such transaction.','frontend','en',''),(1173,'no_transactions_records','You do not have any payment records in your history.','You do not have any payment records in your history.','frontend','en',''),(1174,'num_results_found','Results found: <strong id=\"js-search-results-num\">0</strong>','Results found: <strong id=\"js-search-results-num\">0</strong>','frontend','en',''),(1175,'online','Online','Online','frontend','en',''),(1176,'page_preview','This is how your page will look like once you save it in admin panel.','This is how your page will look like once you save it in admin panel.','frontend','en',''),(1177,'paid_subscription_will_cancel','In case you select this option, your already paid subscription will cancel.','In case you select this option, your already paid subscription will cancel.','frontend','en',''),(1178,'password_changed','Password has been changed.','Password has been changed.','frontend','en',''),(1179,'password_empty','You have not entered a new password.','You have not entered a new password.','frontend','en',''),(1180,'password_protected_page','You must input a password to view this page.','You must input a password to view this page.','frontend','en',''),(1181,'pay','Pay','Pay','frontend','en',''),(1182,'pay_using_account_funds','Pay using the funds available in your account.','Pay using the funds available in your account.','frontend','en',''),(1183,'pay_external','Pay via payment system.','Pay via payment system.','frontend','en',''),(1184,'pay_via_payment_gateways','You can pay via payment gateways.','You can pay via payment gateways.','frontend','en',''),(1185,'pay_reason','Reason','Reason','frontend','en',''),(1186,'payer_name','Payer name','Payer name','frontend','en',''),(1187,'payer_email','Payer email','Payer email','frontend','en',''),(1188,'payment','Payment','Payment','frontend','en',''),(1189,'payment_canceled','You have canceled the payment.','You have canceled the payment.','frontend','en',''),(1190,'payment_details','Payment details','Payment details','frontend','en',''),(1191,'payment_done','Thank you for your payment. Your transaction has been completed.','Thank you for your payment. Your transaction has been completed.','frontend','en',''),(1192,'payment_date','Payment Date','Payment Date','frontend','en',''),(1193,'payment_redirect_message','You will be automatically redirected to the item\'s page in :seconds. If you do not want to wait click the button below:','You will be automatically redirected to the item\'s page in :seconds. If you do not want to wait click the button below:','frontend','en',''),(1194,'payment_status','Payment status','Payment status','frontend','en',''),(1195,'pictures','Pictures','Pictures','frontend','en',''),(1196,'powered_by_subrion','Powered by <a href=\"https://subrion.org\" title=\"Open Source CMS\">Subrion CMS</a>','Powered by <a href=\"https://subrion.org\" title=\"Open Source CMS\">Subrion CMS</a>','frontend','en',''),(1197,'print_preview','Print Page','Print Page','frontend','en',''),(1198,'proceed_pay','Proceed to Payment','Proceed to Payment','frontend','en',''),(1199,'protected_page','Protected page','Protected page','frontend','en',''),(1200,'reg_confirm_adm_approve','Member confirmed. But it must be approved by administrator, usually it takes about 24 hours.','Member confirmed. But it must be approved by administrator, usually it takes about 24 hours.','frontend','en',''),(1201,'reg_confirmation','Registration Confirmation','Registration Confirmation','frontend','en',''),(1202,'reg_confirmed','Member confirmed. Please sign in.','Member confirmed. Please sign in.','frontend','en',''),(1203,'registration','Registration','Registration','frontend','en',''),(1204,'redirected_to_home','to be redirected to the home page.','to be redirected to the home page.','frontend','en',''),(1205,'register_login','Please Login or Register','Please Login or Register','frontend','en',''),(1206,'registration_tooltip','Registration is simple and takes just few seconds. Please fill in the form below.','Registration is simple and takes just few seconds. Please fill in the form below.','frontend','en',''),(1207,'restore_pass_confirm','We have sent confirmation code to your email. Please check it and follow the instructions.','We have sent confirmation code to your email. Please check it and follow the instructions.','frontend','en',''),(1208,'safety','Safety','Safety','frontend','en',''),(1209,'save_this_search','Save this search','Save this search','frontend','en',''),(1210,'search_for','Search for...','Search for...','frontend','en',''),(1211,'send_email','Send email','Send email','frontend','en',''),(1212,'send_message','Send message','Send message','frontend','en',''),(1213,'show_all_num_results','Show all :num results','Show all :num results','frontend','en',''),(1214,'slogan','Content Management Software','Content Management Software','frontend','en',''),(1215,'sort_by','Sort by','Sort by','frontend','en',''),(1216,'starts_with','starts with','starts with','frontend','en',''),(1217,'thank_text','to get back to index page.','to get back to index page.','frontend','en',''),(1218,'thanks','Thank you.','Thank you.','frontend','en',''),(1219,'thankyou_head','<p>Below is the information you submitted so far. You will be able to extend and edit this information via your member account.</p><p><span class=\"label label-danger\">Important</span> Your account password has been sent to the following email address:</p>','<p>Below is the information you submitted so far. You will be able to extend and edit this information via your member account.</p><p><span class=\"label label-danger\">Important</span> Your account password has been sent to the following email address:</p>','frontend','en',''),(1220,'thankyou_tail','<p>Please read our letter with further instructions.</p>','<p>Please read our letter with further instructions.</p>','frontend','en',''),(1221,'this_transaction_already_passed','We already have this payment in our database. Transaction passed successfully.','We already have this payment in our database. Transaction passed successfully.','frontend','en',''),(1222,'total_paid','Total Paid','Total Paid','frontend','en',''),(1223,'tools','Tools','Tools','frontend','en',''),(1224,'unable_to_send_email','Unable to send e-mail.','Unable to send e-mail.','frontend','en',''),(1225,'untitled','Untitled','Untitled','frontend','en',''),(1226,'usergroups','Usergroups','Usergroups','frontend','en',''),(1227,'username_already_exists','Username already taken. Please input different username.','Username already taken. Please input different username.','frontend','en',''),(1228,'username_empty','Make sure you have entered a valid username and your membership is active.','Make sure you have entered a valid username and your membership is active.','frontend','en',''),(1229,'username_or_email','Username or E-mail','Username or E-mail','frontend','en',''),(1230,'view_profile','View profile','View profile','frontend','en',''),(1231,'wait_for_gateway_answer','The payment is currently being processed by payment gateway. Please check it later. <a href=\":url\">Click here</a> to change payment gateway for this transaction.','The payment is currently being processed by payment gateway. Please check it later. <a href=\":url\">Click here</a> to change payment gateway for this transaction.','frontend','en',''),(1232,'wait_redirect','Please wait, you will be redirected shortly.','Please wait, you will be redirected shortly.','frontend','en',''),(1233,'welcome','Welcome','Welcome','frontend','en',''),(1234,'your_name','Your Full Name','Your Full Name','frontend','en',''),(1235,'your_email','Your email','Your email','frontend','en',''),(1236,'your_membership_is_inactive','Your membership is inactive. You may not use this feature.','Your membership is inactive. You may not use this feature.','frontend','en',''),(1237,'your_password','Your password','Your password','frontend','en',''),(1238,'your_password_confirm','Confirm your password','Confirm your password','frontend','en',''),(1239,'your_title_for_this_search','Your title for this search (optional)','Your title for this search (optional)','frontend','en',''),(1240,'your_username','Your username','Your username','frontend','en',''),(1241,'youre_admin_browsing_disabled_front','Frontend is disabled for regular members. It\'s only available for admin members.','Frontend is disabled for regular members. It\'s only available for admin members.','frontend','en',''),(1242,'youre_in_manage_mode','You are in manage mode. <a href=\"?manage_exit=y\">Exit</a>','You are in manage mode. <a href=\"?manage_exit=y\">Exit</a>','frontend','en',''),(1243,'youre_in_preview_mode','You are in preview mode. <a href=\"?preview_exit=y\">Exit</a>','You are in preview mode. <a href=\"?preview_exit=y\">Exit</a>','frontend','en',''),(1244,'block_title_2','Inventory Menu','Inventory Menu','frontend','en',''),(1245,'block_title_3','Main Menu','Main Menu','frontend','en',''),(1246,'block_title_4','Member Menu','Member Menu','frontend','en',''),(1247,'block_title_5','Bottom Menu','Bottom Menu','frontend','en',''),(1248,'block_title_6','Statistics','Statistics','frontend','en',''),(1249,'block_title_7','Refine Search','Refine Search','frontend','en',''),(1250,'page_title_adminer','DB Tools','DB Tools','admin','en',''),(1251,'page_title_blocks','Blocks','Blocks','admin','en',''),(1252,'page_title_clear_cache','Clear Cache','Clear Cache','admin','en',''),(1253,'page_title_configuration','Settings','Settings','admin','en',''),(1254,'page_title_database','Database','Database','admin','en',''),(1255,'page_title_debugmode','Debug Mode','Debug Mode','admin','en',''),(1256,'page_title_email_templates','E-mail Templates','E-mail Templates','admin','en',''),(1257,'page_title_fields','Fields','Fields','admin','en',''),(1258,'page_title_fieldgroups','Field Groups','Field Groups','admin','en',''),(1259,'page_title_imagetypes','Image Types','Image Types','admin','en',''),(1260,'page_title_hooks','Hooks','Hooks','admin','en',''),(1261,'page_title_index','Dashboard','Dashboard','admin','en',''),(1262,'page_title_invoices','Invoices','Invoices','admin','en',''),(1263,'page_title_languages','Languages','Languages','admin','en',''),(1264,'page_title_members','Members','Members','admin','en',''),(1265,'page_title_members_fields','Member Fields','Member Fields','admin','en',''),(1266,'page_title_menus','Menus','Menus','admin','en',''),(1267,'page_title_packages','Packages','Packages','admin','en',''),(1268,'page_title_pages','Pages','Pages','admin','en',''),(1269,'page_title_phpinfo','PHP Info','PHP Info','admin','en',''),(1270,'page_title_phrases','Phrases','Phrases','admin','en',''),(1271,'page_title_plans','Plans','Plans','admin','en',''),(1272,'page_title_plugins','Plugins','Plugins','admin','en',''),(1273,'page_title_scheduled_tasks','Scheduled Tasks','Scheduled Tasks','admin','en',''),(1274,'page_title_sitemap','Generate Sitemap','Generate Sitemap','admin','en',''),(1275,'page_title_subscriptions','Subscriptions','Subscriptions','admin','en',''),(1276,'page_title_templates','Templates','Templates','admin','en',''),(1277,'page_title_transactions','Transactions','Transactions','admin','en',''),(1278,'page_title_uploads','Uploads','Uploads','admin','en',''),(1279,'page_title_usergroups','Usergroups','Usergroups','admin','en',''),(1280,'page_title_permissions','Permissions','Permissions','admin','en',''),(1281,'page_title_sys_mgmt','Management','Management','admin','en',''),(1282,'page_title_sys_email','E-mail','E-mail','admin','en',''),(1283,'page_title_sys_extra','Extra','Extra','admin','en',''),(1284,'page_title_ctnt_ext','Extended','Extended','admin','en',''),(1285,'page_title_ctnt_xtns','Extensions','Extensions','admin','en',''),(1286,'page_title_mbr_ext','Extended','Extended','admin','en',''),(1287,'page_title_xtns_empt','','','admin','en',''),(1288,'page_content_about','<p>Page \'About Us\' content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','<p>Page \'About Us\' content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','page','en',''),(1289,'page_content_advertise','<p>Page \'Advertise Us\' content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','<p>Page \'Advertise Us\' content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','page','en',''),(1290,'page_content_help','<p>Help page content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','<p>Help page content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','page','en',''),(1291,'page_content_index','','','page','en',''),(1292,'page_content_policy','<p>Page \'Privacy Policy\' content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','<p>Page \'Privacy Policy\' content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','page','en',''),(1293,'page_content_terms','<p>Page \'Terms Of Use\' content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','<p>Page \'Terms Of Use\' content goes here. You can edit it in Admin Panel ->  Content -> Pages.</p>','page','en',''),(1294,'page_title_about','About Us','About Us','page','en',''),(1295,'page_title_members','Members','Members','page','en',''),(1296,'page_title_member_password_forgot','Forgot Password','Forgot Password','page','en',''),(1297,'page_title_advertise','Advertise Us','Advertise Us','page','en',''),(1298,'page_title_favorites','Favorites','Favorites','page','en',''),(1299,'page_title_index','Home','Home','page','en',''),(1300,'page_title_help','Help','Help','page','en',''),(1301,'page_title_login','Login','Login','page','en',''),(1302,'page_title_member_funds','Funds','Funds','page','en',''),(1303,'page_title_pay','Pay','Pay','page','en',''),(1304,'page_title_policy','Privacy Policy','Privacy Policy','page','en',''),(1305,'page_title_profile','My Profile','My Profile','page','en',''),(1306,'page_title_member_registration','Registration','Registration','page','en',''),(1307,'page_title_register_confirm','Registration Confirmation','Registration Confirmation','page','en',''),(1308,'page_title_redirect','Redirecting','Redirecting','page','en',''),(1309,'page_title_search','Search','Search','page','en',''),(1310,'page_title_terms','Terms of Use','Terms of Use','page','en',''),(1311,'page_title_view_member','Member Details','Member Details','page','en',''),(1312,'alias_urlencode','Non-Latin (non-utf8) characters are encoded into special entities instead of being romanized.','Non-Latin (non-utf8) characters are encoded into special entities instead of being romanized.','tooltip','en',''),(1313,'adminonly','The field will only be displayed in Admin Dashboard.','The field will only be displayed in Admin Dashboard.','tooltip','en',''),(1314,'api_push_access_key','Google Cloud Messaging (GCM) is a free service that enables developers to send messages between servers and client apps. This includes downstream messages from servers to client apps, and upstream messages from client apps to servers.','Google Cloud Messaging (GCM) is a free service that enables developers to send messages between servers and client apps. This includes downstream messages from servers to client apps, and upstream messages from client apps to servers.','tooltip','en',''),(1315,'backup','Folder name where your DB backups are saved.','Folder name where your DB backups are saved.','tooltip','en',''),(1316,'bcc_email','Email addresses to BCC all the outgoing messaging. To setup multiple emails, separate them by comma.','Email addresses to BCC all the outgoing messaging. To setup multiple emails, separate them by comma.','tooltip','en',''),(1317,'caching','If you use a slow shared hosting, this will cache your pages for faster loading.','If you use a slow shared hosting, this will cache your pages for faster loading.','tooltip','en',''),(1318,'empty_field','This text will be displayed on view item page if this field has an empty value.','This text will be displayed on view item page if this field has an empty value.','tooltip','en',''),(1319,'extra_actions','This code is executed every time on field change. It can be used for validation or any other operation.','This code is executed every time on field change. It can be used for validation or any other operation.','tooltip','en',''),(1320,'for_plan_only','Specifies if the field should be available only when plan chosen.','Specifies if the field should be available only when plan chosen.','tooltip','en',''),(1321,'frontend_header_code','This code is inserted before closing HEAD tag. HTML/JS code allowed.','This code is inserted before closing HEAD tag. HTML/JS code allowed.','tooltip','en',''),(1322,'frontend_footer_code','Injected before closing BODY tag. HTML/JS code allowed.','Injected before closing BODY tag. HTML/JS code allowed.','tooltip','en',''),(1323,'https','Use secure HTTPS protocol for your site. Before enabling this, please make sure you have properly configured your hosting account and/or webserver.','Use secure HTTPS protocol for your site. Before enabling this, please make sure you have properly configured your hosting account and/or webserver.','tooltip','en',''),(1324,'lang','Select the preferred language of your site.','Select the preferred language of your site.','tooltip','en',''),(1325,'language_switch','Allows users to choose a language on the frontend of your site.','Allows users to choose a language on the frontend of your site.','tooltip','en',''),(1326,'members_enabled','Enables members functionality for your Subrion CMS based website.','Enables members functionality for your Subrion CMS based website.','tooltip','en',''),(1327,'members_autoapproval','Members are activated automatically without any confirmation.','Members are activated automatically without any confirmation.','tooltip','en',''),(1328,'multilingual_field','Allows to have field value in different languages.','Allows to have field value in different languages.','tooltip','en',''),(1329,'multiple_selection','Allows to choose multiple nodes.','Allows to choose multiple nodes.','tooltip','en',''),(1330,'plan_cycles','Number of billing cycles for payment period.','Number of billing cycles for payment period.','tooltip','en',''),(1331,'plan_duration','Duration of plan (or each cycle if recurring)','Duration of plan (or each cycle if recurring)','tooltip','en',''),(1332,'regular_field','Specifies if the field is a host or dependent field.','Specifies if the field is a host or dependent field.','tooltip','en',''),(1333,'required_checks','This PHP code validates the field value when Required Field is ON. Please make sure you use correct code.','This PHP code validates the field value when Required Field is ON. Please make sure you use correct code.','tooltip','en',''),(1334,'search_instant','If enabled, the search will begin immediately once an option clicked.','If enabled, the search will begin immediately once an option clicked.','tooltip','en',''),(1335,'searchable','Specifies if the field is available to search by on Advanced Search page.','Specifies if the field is available to search by on Advanced Search page.','tooltip','en',''),(1336,'site','This will be your site name.','This will be your site name.','tooltip','en',''),(1337,'site_email','Email address you wish to get member changes and notifications sent to.','Email address you wish to get member changes and notifications sent to.','tooltip','en',''),(1338,'smarty_cache','Forces the template engine to rebuild the cache on every request. Increases the server load. It should only be used for debugging purposes.','Forces the template engine to rebuild the cache on every request. Increases the server load. It should only be used for debugging purposes.','tooltip','en',''),(1339,'smtp_password','Password for the username above.','Password for the username above.','tooltip','en',''),(1340,'smtp_server','That would be Ex. (smtp.yourdomain.com)','That would be Ex. (smtp.yourdomain.com)','tooltip','en',''),(1341,'smtp_user','Username is usually specified with your email/hosting provider.','Username is usually specified with your email/hosting provider.','tooltip','en',''),(1342,'suffix','This text is added to Title on every page.','This text is added to Title on every page.','tooltip','en',''),(1343,'timezone','Select your server timezone.','Select your server timezone.','tooltip','en',''),(1344,'slug_literal','Its recommended to start your slug with letters.','Its recommended to start your slug with letters.','tooltip','en',''),(1345,'underconstruction','This message is shown in case &quot;Display Frontend&quot; option is disabled.','This message is shown in case &quot;Display Frontend&quot; option is disabled.','tooltip','en',''),(1346,'upgrade_available','Upgrade patch to version :version is available. In order to upgrade please <a href=\":url\">follow this link</a>.','Upgrade patch to version :version is available. In order to upgrade please <a href=\":url\">follow this link</a>.','admin','en',''),(1347,'usergroup_assignable','Members are allowed to choose this group manually.','Members are allowed to choose this group manually.','tooltip','en',''),(1348,'usergroup_visible','Group members are displayed on Members page and filters.','Group members are displayed on Members page and filters.','tooltip','en',''),(1349,'login','Log in','Log in','frontend','en','kickstart'),(1350,'register','Sign up','Sign up','frontend','en','kickstart'),(1351,'back_to_top','Back to top','Back to top','frontend','en','kickstart'),(1352,'admin_dashboard','Admin Dashboard','Admin Dashboard','frontend','en','kickstart'),(1353,'config_group_template_kickstart','Template','Template','admin','en','kickstart'),(1354,'config_','','','admin','en','kickstart'),(1355,'config_enable_landing','Enable landing page','Enable landing page','admin','en','kickstart'),(1356,'config_custom_colors','Enable custom colors and backgrounds','Enable custom colors and backgrounds','admin','en','kickstart'),(1357,'config_custom_color_body_bg','Body background','Body background','admin','en','kickstart'),(1358,'config_custom_color_text','Text color','Text color','admin','en','kickstart'),(1359,'config_custom_color_headings','Headings color','Headings color','admin','en','kickstart'),(1360,'config_custom_color_link','Link color','Link color','admin','en','kickstart'),(1361,'config_custom_color_link_hover','Link hover color','Link hover color','admin','en','kickstart'),(1362,'config_search_inventory','Show search in inventory','Show search in inventory','admin','en','kickstart'),(1363,'config_custom_color_inventory_bg','Background','Background','admin','en','kickstart'),(1364,'config_custom_color_inventory_link','Link color','Link color','admin','en','kickstart'),(1365,'config_custom_color_inventory_link_hover','Link hover color','Link hover color','admin','en','kickstart'),(1366,'config_custom_color_inventory_link_active','Link active color','Link active color','admin','en','kickstart'),(1367,'config_max_top_menu_items','Max number of items in Main Menu','Max number of items in Main Menu','admin','en','kickstart'),(1368,'config_enable_text_logo','Enable Logo text','Enable Logo text','admin','en','kickstart'),(1369,'config_logo_text','Logo text','Logo text','admin','en','kickstart'),(1370,'config_navbar_sticky','Sticky navbar','Sticky navbar','admin','en','kickstart'),(1371,'config_search_navbar','Show search in navbar','Show search in navbar','admin','en','kickstart'),(1372,'config_custom_color_navbar_bg','Background','Background','admin','en','kickstart'),(1373,'config_custom_color_navbar_link','Link color','Link color','admin','en','kickstart'),(1374,'config_custom_color_navbar_link_hover','Link hover color','Link hover color','admin','en','kickstart'),(1375,'config_custom_color_navbar_link_active','Link active color','Link active color','admin','en','kickstart'),(1376,'config_bg_header','Background image','Background image','admin','en','kickstart'),(1377,'config_bg_header_use_color','Use color instead image','Use color instead image','admin','en','kickstart'),(1378,'config_bg_header_color','Background color','Background color','admin','en','kickstart'),(1379,'config_bg_features','Background image','Background image','admin','en','kickstart'),(1380,'config_bg_features_use_color','Use color instead image','Use color instead image','admin','en','kickstart'),(1381,'config_bg_features_color','Background color','Background color','admin','en','kickstart'),(1382,'config_footer_bg','Background','Background','admin','en','kickstart'),(1383,'config_footer_blocks_bg','Background of footer blocks','Background of footer blocks','admin','en','kickstart'),(1384,'config_footer_link','Link color','Link color','admin','en','kickstart'),(1385,'config_footer_link_hover','Link hover color','Link hover color','admin','en','kickstart'),(1386,'config_footer_link_active','Link active color','Link active color','admin','en','kickstart'),(1387,'config_website_social','Show links','Show links','admin','en','kickstart'),(1388,'config_website_social_t','Twitter Link','Twitter Link','admin','en','kickstart'),(1389,'config_website_social_f','Facebook Link','Facebook Link','admin','en','kickstart'),(1390,'config_website_social_g','Google+ Link','Google+ Link','admin','en','kickstart'),(1391,'config_website_social_i','LinkedIn Link','LinkedIn Link','admin','en','kickstart'),(1392,'config_ckeditor_css','CKEditor CSS','CKEditor CSS','admin','en','kickstart'),(1393,'block_title_8','Teaser block','Teaser block','frontend','en',''),(1394,'block_content_8','<div class=\"teaser\">\n	<div class=\"container\">\n		<h1>The greatest place<br>to <span class=\"text-warning\">kickstart anything</span></h1>\n		<h2>You will love how easy<br>it is to manage your content</h2>\n	</div>\n</div>','<div class=\"teaser\">\n	<div class=\"container\">\n		<h1>The greatest place<br>to <span class=\"text-warning\">kickstart anything</span></h1>\n		<h2>You will love how easy<br>it is to manage your content</h2>\n	</div>\n</div>','frontend','en',''),(1395,'block_title_9','What this all about?','What this all about?','frontend','en',''),(1396,'block_title_10','Features','Features','frontend','en',''),(1397,'block_content_10','<div class=\"row\">\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature b-feature--right\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-hand-peace-o\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Free & open source</h3>\n				<p>You don\'t need to pay a single penny to start using Subrion CMS. It\'s not encrypted in any way so you can customize it per your needs.</p>\n			</div>\n		</div>\n	</div>\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-rocket\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Extremely easy to extend</h3>\n				<p>Forget the hours of programming simple things. Use Subrion framework API to add extra stuff using hooks, plugins, & packages.</p>\n			</div>\n		</div>\n	</div>\n</div>\n<div class=\"row\">\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature b-feature--right\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-cloud-download\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Templates and plugins</h3>\n				<p>No need to search. Plugins and templates are available straight from your admin dashboard with one click installation process.</p>\n			</div>\n		</div>\n	</div>\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-cogs\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Powerful admin dashboard</h3>\n				<p>It\'s done to focus on the content management process. Start it hassle-free within just a few minutes and take care of the content. It\'s easy!</p>\n			</div>\n		</div>\n	</div>\n</div>\n<div class=\"row\">\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature b-feature--right\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-edit\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Blog in the box</h3>\n				<p>Bring your online presence to a whole new level with the extensive blog functionality that comes in the version by default.</p>\n			</div>\n		</div>\n	</div>\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-flag\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Multilingual CMS</h3>\n				<p>Use ready translation or translate the system into your language. It provides all the functionality to become a multilingual solution.</p>\n			</div>\n		</div>\n	</div>\n</div>','<div class=\"row\">\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature b-feature--right\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-hand-peace-o\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Free & open source</h3>\n				<p>You don\'t need to pay a single penny to start using Subrion CMS. It\'s not encrypted in any way so you can customize it per your needs.</p>\n			</div>\n		</div>\n	</div>\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-rocket\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Extremely easy to extend</h3>\n				<p>Forget the hours of programming simple things. Use Subrion framework API to add extra stuff using hooks, plugins, & packages.</p>\n			</div>\n		</div>\n	</div>\n</div>\n<div class=\"row\">\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature b-feature--right\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-cloud-download\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Templates and plugins</h3>\n				<p>No need to search. Plugins and templates are available straight from your admin dashboard with one click installation process.</p>\n			</div>\n		</div>\n	</div>\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-cogs\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Powerful admin dashboard</h3>\n				<p>It\'s done to focus on the content management process. Start it hassle-free within just a few minutes and take care of the content. It\'s easy!</p>\n			</div>\n		</div>\n	</div>\n</div>\n<div class=\"row\">\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature b-feature--right\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-edit\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Blog in the box</h3>\n				<p>Bring your online presence to a whole new level with the extensive blog functionality that comes in the version by default.</p>\n			</div>\n		</div>\n	</div>\n	<div class=\"col-sm-6\">\n		<div class=\"b-feature\">\n			<div class=\"b-feature__img\">\n				<span class=\"fa fa-flag\"></span>\n			</div>\n			<div class=\"b-feature__body\">\n				<h3>Multilingual CMS</h3>\n				<p>Use ready translation or translate the system into your language. It provides all the functionality to become a multilingual solution.</p>\n			</div>\n		</div>\n	</div>\n</div>','frontend','en',''),(1398,'block_title_11','Ready for mobile devices','Ready for mobile devices','frontend','en',''),(1399,'block_title_12','Top block position','Top block position','frontend','en',''),(1400,'block_content_12','<p>You can change this block in admin panel. Remember, if you change template, this block will be lost. We advise you to clone this block.</p>\n<p>Ne lorem percipit efficiantur mei, ius ut simul vidisse. An vel probatus explicari appellantur. Has et comprehensam interpretaris, quo no inimicus maluisset temporibus. Ea mea quod incorrupte, brute laoreet at pri, eam antiopam honestatis efficiantur ea. Velit atomorum voluptaria ad nam, hinc aperiam accumsan ne est, ut dictas dissentias his.</p>','<p>You can change this block in admin panel. Remember, if you change template, this block will be lost. We advise you to clone this block.</p>\n<p>Ne lorem percipit efficiantur mei, ius ut simul vidisse. An vel probatus explicari appellantur. Has et comprehensam interpretaris, quo no inimicus maluisset temporibus. Ea mea quod incorrupte, brute laoreet at pri, eam antiopam honestatis efficiantur ea. Velit atomorum voluptaria ad nam, hinc aperiam accumsan ne est, ut dictas dissentias his.</p>','frontend','en',''),(1401,'block_title_13','Bottom block position','Bottom block position','frontend','en',''),(1402,'block_content_13','<p>You can change this block in admin panel. Remember, if you change template, this block will be lost. We advise you to clone this block.</p>\n<p>Ne lorem percipit efficiantur mei, ius ut simul vidisse. An vel probatus explicari appellantur. Has et comprehensam interpretaris, quo no inimicus maluisset temporibus. Ea mea quod incorrupte, brute laoreet at pri, eam antiopam honestatis efficiantur ea. Velit atomorum voluptaria ad nam, hinc aperiam accumsan ne est, ut dictas dissentias his.</p>','<p>You can change this block in admin panel. Remember, if you change template, this block will be lost. We advise you to clone this block.</p>\n<p>Ne lorem percipit efficiantur mei, ius ut simul vidisse. An vel probatus explicari appellantur. Has et comprehensam interpretaris, quo no inimicus maluisset temporibus. Ea mea quod incorrupte, brute laoreet at pri, eam antiopam honestatis efficiantur ea. Velit atomorum voluptaria ad nam, hinc aperiam accumsan ne est, ut dictas dissentias his.</p>','frontend','en',''),(1403,'block_title_14','HTML block #1','HTML block #1','frontend','en',''),(1404,'block_content_14','<p>You can change this block in admin panel. Remember, if you change template, this block will be lost. We advise you to clone this block.</p>\n<p>Ne lorem percipit efficiantur mei, ius ut simul vidisse. An vel probatus explicari appellantur. Has et comprehensam interpretaris, quo no inimicus maluisset temporibus. Ea mea quod.</p>','<p>You can change this block in admin panel. Remember, if you change template, this block will be lost. We advise you to clone this block.</p>\n<p>Ne lorem percipit efficiantur mei, ius ut simul vidisse. An vel probatus explicari appellantur. Has et comprehensam interpretaris, quo no inimicus maluisset temporibus. Ea mea quod.</p>','frontend','en',''),(1405,'block_title_15','About CMS','About CMS','frontend','en',''),(1406,'block_content_15','<p>Subrion is a free open source content management system\nthat allows you to build websites for any purpose. Yes, from blog to corporate mega portal.</p>\n<ul class=\"list-unstyled hidden\">\n	<li><span class=\"fa fa-phone\"></span> 1-677-124-44227</li>\n	<li><span class=\"fa fa-map-pin\"></span> 437 S Olive St, Los Angeles</li>\n	<li><span class=\"fa fa-clock-o\"></span> Mon - Sat 8.00 - 18.00h</li>\n</ul>','<p>Subrion is a free open source content management system\nthat allows you to build websites for any purpose. Yes, from blog to corporate mega portal.</p>\n<ul class=\"list-unstyled hidden\">\n	<li><span class=\"fa fa-phone\"></span> 1-677-124-44227</li>\n	<li><span class=\"fa fa-map-pin\"></span> 437 S Olive St, Los Angeles</li>\n	<li><span class=\"fa fa-clock-o\"></span> Mon - Sat 8.00 - 18.00h</li>\n</ul>','frontend','en',''),(1407,'block_title_16','For users','For users','frontend','en',''),(1408,'block_content_16','<p>It\'s done to focus on the content management process. Start it hassle-free within just a few minutes and take care of the content. It\'s easy!</p>','<p>It\'s done to focus on the content management process. Start it hassle-free within just a few minutes and take care of the content. It\'s easy!</p>','frontend','en',''),(1409,'block_title_17','For developers','For developers','frontend','en',''),(1410,'block_content_17','<p>Forget the hours of programming simple things. Use Subrion framework API to add extra stuff using hooks, plugins, & packages.</p>','<p>Forget the hours of programming simple things. Use Subrion framework API to add extra stuff using hooks, plugins, & packages.</p>','frontend','en',''),(1411,'block_title_18','For designers','For designers','frontend','en',''),(1412,'block_content_18','<p>Simple templating engine and styles allows you to create any template you wish with just a few lines of code.</p>','<p>Simple templating engine and styles allows you to create any template you wish with just a few lines of code.</p>','frontend','en',''),(1413,'page_title_blog','Blog','Blog','admin','en','blog'),(1414,'dashboard_blogpost_add','Add Blog Entry','Add Blog Entry','admin','en','blog'),(1415,'add_blog_entry','Add Blog Entry','Add Blog Entry','common','en','blog'),(1416,'blog','Blog','Blog','common','en','blog'),(1417,'blogposts','Blogposts','Blogposts','common','en','blog'),(1418,'blog_entry_added','Blog entry added.','Blog entry added.','common','en','blog'),(1419,'blog_entry_deleted','Blog entry deleted.','Blog entry deleted.','common','en','blog'),(1420,'body','Body','Body','common','en','blog'),(1421,'edit_blog_entry','Edit Blog Entry','Edit Blog Entry','common','en','blog'),(1422,'separate_with_comma_or_enter','Use comma or press enter to separate tags','Use comma or press enter to separate tags','common','en','blog'),(1423,'tags','Tags','Tags','common','en','blog'),(1424,'title_alias','Title Alias','Title Alias','common','en','blog'),(1425,'blogroll','Blogroll','Blogroll','frontend','en','blog'),(1426,'no_blog_entries','No blogposts done yet. Be the first to post here.','No blogposts done yet. Be the first to post here.','frontend','en','blog'),(1427,'no_tags','No tags added.','No tags added.','frontend','en','blog'),(1428,'page_title_tag','Blog Tags','Blog Tags','frontend','en','blog'),(1429,'posted_on','Posted on','Posted on','frontend','en','blog'),(1430,'view_all_blog_entries','View all blog entries','View all blog entries','frontend','en','blog'),(1431,'blog_display_grid','This option allows you to display only images in Blogroll section. This display type suits best for portfolios.','This option allows you to display only images in Blogroll section. This display type suits best for portfolios.','tooltip','en','blog'),(1432,'config_group_blog','Blog','Blog','admin','en','blog'),(1433,'admin_page-blog--read','Allow to view blog entries','Allow to view blog entries','common','en','blog'),(1434,'admin_page-blog--add','Add blog entry','Add blog entry','common','en','blog'),(1435,'admin_page-blog--edit','Edit blog entry','Edit blog entry','common','en','blog'),(1436,'admin_page-blog--delete','Delete blog entry','Delete blog entry','common','en','blog'),(1437,'page-blog--read','View blog entries','View blog entries','common','en','blog'),(1438,'page-blog--add','Add blog entry','Add blog entry','common','en','blog'),(1439,'page-blog--edit','Edit blog entry','Edit blog entry','common','en','blog'),(1440,'page-blog--delete','Delete blog entry','Delete blog entry','common','en','blog'),(1441,'config_blog_plugin','','','admin','en','blog'),(1442,'config_blog_number_block','Number of displayed entries in Blogroll entries','Number of displayed entries in Blogroll entries','admin','en','blog'),(1443,'config_blog_number_new_block','Number of displayed entries in New Blog Posts block','Number of displayed entries in New Blog Posts block','admin','en','blog'),(1444,'config_blog_max_block','Number of chars in short description in Latest Blog entries','Number of chars in short description in Latest Blog entries','admin','en','blog'),(1445,'config_blog_number','Number of displayed entries','Number of displayed entries','admin','en','blog'),(1446,'config_blog_max','Number of chars in short description','Number of chars in short description','admin','en','blog'),(1447,'config_blog_order','Entries order by','Entries order by','admin','en','blog'),(1448,'config_blog_tag_number','Number of displayed tags','Number of displayed tags','admin','en','blog'),(1449,'config_blog_image_resize','Image/Thumbnail resize mod','Image/Thumbnail resize mod','admin','en','blog'),(1450,'config_blog_image_width','Image width','Image width','admin','en','blog'),(1451,'config_blog_image_height','Image height','Image height','admin','en','blog'),(1452,'config_blog_thumb_width','Thumbnail width','Thumbnail width','admin','en','blog'),(1453,'config_blog_thumb_height','Thumbnail height','Thumbnail height','admin','en','blog'),(1454,'page_title_blog','Blog','Blog','page','en','blog'),(1455,'page_title_tag','Tag','Tag','page','en','blog'),(1456,'page_title_blog_date','Blog Archive','Blog Archive','page','en','blog'),(1457,'block_title_19','Blogroll','Blogroll','frontend','en',''),(1458,'block_title_20','New blog posts','New blog posts','frontend','en',''),(1459,'block_title_21','Blogs Archive','Blogs Archive','frontend','en',''),(1460,'click_to_redraw','Click here to redraw','Click here to redraw','frontend','en','kcaptcha'),(1461,'captcha_tooltip','Please input letters you see on the image.<br />Click on image to redraw.','Please input letters you see on the image.<br />Click on image to redraw.','frontend','en','kcaptcha'),(1462,'config_kcaptcha_divider','KCAPTCHA','KCAPTCHA','admin','en','kcaptcha'),(1463,'config_kcaptcha_case_sensitive','Case sensitive','Case sensitive','admin','en','kcaptcha'),(1464,'config_kcaptcha_num_chars','Number of characters','Number of characters','admin','en','kcaptcha'),(1465,'config_fancybox_divider','','','admin','en','fancybox'),(1466,'config_fancybox_slide_transition','fancyBox slide effect','fancyBox slide effect','admin','en','fancybox'),(1467,'config_fancybox_open_transition','fancyBox open/close effect','fancyBox open/close effect','admin','en','fancybox'),(1468,'config_fancybox_slide_speed','fancyBox slide speed','fancyBox slide speed','admin','en','fancybox'),(1469,'config_fancybox_open_speed','fancyBox open/close speed','fancyBox open/close speed','admin','en','fancybox'),(1470,'config_fancybox_padding','fancyBox inner padding','fancyBox inner padding','admin','en','fancybox'),(1471,'config_fancybox_arrows','Display navigation arrows','Display navigation arrows','admin','en','fancybox'),(1472,'config_fancybox_closeBtn','Display close button','Display close button','admin','en','fancybox'),(1473,'config_fancybox_closeClick','If set, fancyBox will be closed when user clicks the content','If set, fancyBox will be closed when user clicks the content','admin','en','fancybox');
/*!40000 ALTER TABLE `ia_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_languages`
--

DROP TABLE IF EXISTS `ia_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_languages` (
  `id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL,
  `title` varchar(100) NOT NULL,
  `locale` varchar(30) NOT NULL,
  `date_format` varchar(50) NOT NULL,
  `author` varchar(100) NOT NULL,
  `direction` varchar(5) NOT NULL DEFAULT 'ltr',
  `master` tinyint(1) unsigned NOT NULL,
  `default` tinyint(1) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `flagicon` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CODE` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_languages`
--

LOCK TABLES `ia_languages` WRITE;
/*!40000 ALTER TABLE `ia_languages` DISABLE KEYS */;
INSERT INTO `ia_languages` VALUES (1,'en','English','en_US','%b %e, %Y','Intelliants LLC','ltr',1,1,1,'active','us.gif');
/*!40000 ALTER TABLE `ia_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_logs`
--

DROP TABLE IF EXISTS `ia_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_logs` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `action` tinyint(3) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `module` varchar(40) NOT NULL DEFAULT '',
  `params` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PLUGIN` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_logs`
--

LOCK TABLES `ia_logs` WRITE;
/*!40000 ALTER TABLE `ia_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_members`
--

DROP TABLE IF EXISTS `ia_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usergroup_id` smallint(5) unsigned NOT NULL DEFAULT 8,
  `username` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(200) NOT NULL,
  `sec_key` varchar(32) NOT NULL,
  `status` enum('approval','active','unconfirmed','suspended') NOT NULL DEFAULT 'active',
  `date_reg` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `date_logged` datetime DEFAULT NULL,
  `views_num` mediumint(8) unsigned NOT NULL,
  `fullname` tinytext NOT NULL,
  `avatar` tinytext NOT NULL,
  `website` tinytext NOT NULL,
  `phone` tinytext NOT NULL,
  `biography` text NOT NULL,
  `facebook` tinytext NOT NULL,
  `twitter` tinytext NOT NULL,
  `gplus` tinytext NOT NULL,
  `linkedin` tinytext NOT NULL,
  `funds` decimal(12,2) unsigned NOT NULL,
  `disable_fields` tinyint(1) unsigned NOT NULL,
  `admin_columns` text NOT NULL,
  `featured` tinyint(1) unsigned NOT NULL,
  `featured_start` datetime DEFAULT NULL,
  `featured_end` datetime DEFAULT NULL,
  `sponsored` tinyint(1) unsigned NOT NULL,
  `sponsored_start` datetime DEFAULT NULL,
  `sponsored_end` datetime DEFAULT NULL,
  `sponsored_plan_id` smallint(5) unsigned NOT NULL,
  `api_push_token` tinytext NOT NULL,
  `api_push_receive` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `USERNAME` (`username`),
  UNIQUE KEY `EMAIL` (`email`),
  KEY `STATUS` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_members`
--

LOCK TABLES `ia_members` WRITE;
/*!40000 ALTER TABLE `ia_members` DISABLE KEYS */;
INSERT INTO `ia_members` VALUES (1,1,'admin','58da61e35c8f1936300229cfff7aed52','admin@example.com','','active','2026-09-24 00:57:58','2026-09-24 00:57:58',NULL,0,'Administrator','','','','','','','','',0.00,0,'',0,NULL,NULL,0,NULL,NULL,0,'','yes');
/*!40000 ALTER TABLE `ia_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_members_auth_providers`
--

DROP TABLE IF EXISTS `ia_members_auth_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_members_auth_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_members_auth_providers`
--

LOCK TABLES `ia_members_auth_providers` WRITE;
/*!40000 ALTER TABLE `ia_members_auth_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_members_auth_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_menus`
--

DROP TABLE IF EXISTS `ia_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_menus` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` smallint(5) unsigned NOT NULL,
  `parent_id` varchar(10) NOT NULL,
  `el_id` varchar(10) NOT NULL,
  `page_name` varchar(100) NOT NULL DEFAULT 'none',
  `level` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MENU` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_menus`
--

LOCK TABLES `ia_menus` WRITE;
/*!40000 ALTER TABLE `ia_menus` DISABLE KEYS */;
INSERT INTO `ia_menus` VALUES (1,2,'0','1_001','index',0),(2,3,'0','1_002','index',0),(3,3,'0','9_003','members',0),(4,4,'0','13_004','profile',0),(5,4,'0','8_005','favorites',0),(6,4,'0','14_006','member_funds',0),(7,5,'0','19_007','about',0),(8,5,'0','20_008','policy',0),(9,5,'0','21_009','terms',0),(10,5,'0','23_010','advertise',0),(11,5,'0','22_011','help',0),(12,3,'0','25_3aee','blog',0),(13,5,'0','25_fcd6','blog',0);
/*!40000 ALTER TABLE `ia_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_migrations`
--

DROP TABLE IF EXISTS `ia_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_migrations` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `status` enum('incomplete','skipped','complete') NOT NULL DEFAULT 'complete',
  `data` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_migrations`
--

LOCK TABLES `ia_migrations` WRITE;
/*!40000 ALTER TABLE `ia_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_modules`
--

DROP TABLE IF EXISTS `ia_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_modules` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `type` enum('plugin','package','template','core') NOT NULL DEFAULT 'plugin',
  `author` varchar(75) NOT NULL,
  `contributor` varchar(75) NOT NULL,
  `title` varchar(150) NOT NULL,
  `items` text DEFAULT NULL,
  `url` varchar(50) NOT NULL DEFAULT '',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date` datetime NOT NULL,
  `version` varchar(15) NOT NULL,
  `summary` text DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `uninstall_code` text DEFAULT NULL,
  `uninstall_sql` text DEFAULT NULL,
  `removable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `rollback_data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_modules`
--

LOCK TABLES `ia_modules` WRITE;
/*!40000 ALTER TABLE `ia_modules` DISABLE KEYS */;
INSERT INTO `ia_modules` VALUES (1,'kickstart','template','Gleb Surinov','Intelliants LLC','Kickstart',NULL,'','active','2026-09-23 20:57:58','1.1.0','Bootstrap 3 developer template','',NULL,NULL,1,'a:1:{s:6:\"blocks\";a:3:{s:7:\"account\";a:2:{s:8:\"position\";s:5:\"right\";s:6:\"status\";s:6:\"active\";}s:17:\"common_statistics\";a:3:{s:6:\"status\";s:6:\"active\";s:9:\"classname\";s:0:\"\";s:8:\"position\";s:5:\"right\";}s:7:\"filters\";a:3:{s:6:\"status\";s:6:\"active\";s:9:\"classname\";s:0:\"\";s:8:\"position\";s:4:\"left\";}}}'),(2,'blog','plugin','Intelliants LLC','Intelliants LLC','Blog',NULL,'','active','2026-09-23 20:57:58','4.1.0','Adds blog functionality to Subrion powered website','',NULL,'a:1:{i:0;a:2:{s:5:\"query\";s:94:\"DROP TABLE IF EXISTS `{prefix}blog_entries`, `{prefix}blog_tags`, `{prefix}blog_entries_tags`;\";s:8:\"external\";b:0;}}',1,''),(3,'kcaptcha','plugin','Intelliants LLC','Intelliants LLC','KCaptcha',NULL,'','active','2026-09-23 20:57:58','4.1.0','Plugin adds the CAPTCHA to all pages where it is needed to prevents automatic bot form submission','captcha',NULL,NULL,0,''),(4,'fancybox','plugin','Intelliants LLC','Intelliants LLC','fancyBox',NULL,'','active','2026-09-23 20:57:58','4.1.0','Plugin will add lightbox effect to images based on Fancybox javascript library','lightbox',NULL,NULL,0,'');
/*!40000 ALTER TABLE `ia_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_objects_pages`
--

DROP TABLE IF EXISTS `ia_objects_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_objects_pages` (
  `object_type` varchar(50) NOT NULL,
  `page_name` varchar(50) NOT NULL,
  `object` varchar(100) NOT NULL,
  `access` tinyint(1) unsigned NOT NULL DEFAULT 1,
  UNIQUE KEY `unique` (`object_type`,`page_name`,`object`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_objects_pages`
--

LOCK TABLES `ia_objects_pages` WRITE;
/*!40000 ALTER TABLE `ia_objects_pages` DISABLE KEYS */;
INSERT INTO `ia_objects_pages` VALUES ('blocks','','6',0),('blocks','index','6',1),('blocks','','8',0),('blocks','index','8',1),('blocks','','9',0),('blocks','index','9',1),('blocks','','10',0),('blocks','index','10',1),('blocks','','11',0),('blocks','index','11',1),('blocks','','12',0),('blocks','index','12',1),('blocks','','13',0),('blocks','index','13',1),('blocks','','19',0),('blocks','index','19',1);
/*!40000 ALTER TABLE `ia_objects_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_online`
--

DROP TABLE IF EXISTS `ia_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_online` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_bot` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `session_id` char(32) NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('active','expired') NOT NULL DEFAULT 'active',
  `username` varchar(50) NOT NULL DEFAULT '',
  `fullname` tinytext NOT NULL,
  `page` varchar(150) NOT NULL,
  `ip` bigint(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SESSION` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_online`
--

LOCK TABLES `ia_online` WRITE;
/*!40000 ALTER TABLE `ia_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_pages`
--

DROP TABLE IF EXISTS `ia_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_pages` (
  `id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `group` smallint(5) unsigned NOT NULL DEFAULT 1,
  `name` varchar(50) NOT NULL,
  `service` tinyint(1) unsigned NOT NULL,
  `readonly` tinyint(1) unsigned NOT NULL,
  `status` enum('active','inactive','draft') NOT NULL DEFAULT 'draft',
  `last_updated` datetime NOT NULL,
  `order` mediumint(7) unsigned NOT NULL,
  `alias` varchar(150) NOT NULL,
  `nofollow` tinyint(1) unsigned NOT NULL,
  `new_window` tinyint(1) unsigned NOT NULL,
  `module` varchar(40) NOT NULL,
  `passw` char(32) NOT NULL DEFAULT '',
  `filename` varchar(50) NOT NULL,
  `custom_tpl` tinyint(1) NOT NULL,
  `template_filename` varchar(64) NOT NULL,
  `custom_url` tinytext NOT NULL,
  `menus` set('main','bottom','account','inventory') NOT NULL DEFAULT '',
  `action` varchar(10) NOT NULL DEFAULT 'read',
  `parent` varchar(50) NOT NULL,
  `suburl` varchar(150) NOT NULL,
  `fields_item` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NAME` (`name`),
  KEY `ALIAS` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_pages`
--

LOCK TABLES `ia_pages` WRITE;
/*!40000 ALTER TABLE `ia_pages` DISABLE KEYS */;
INSERT INTO `ia_pages` VALUES (1,2,'index',0,0,'active','2026-09-24 00:57:58',0,'',0,0,'','','page',0,'','','main,inventory','read','','',''),(2,1,'api',1,1,'active','2026-09-24 00:57:58',0,'api/',1,0,'','','api',0,'','','','read','','',''),(3,1,'redirect',1,1,'active','2026-09-24 00:57:58',0,'',0,0,'','','',0,'','','','read','','',''),(4,1,'search',0,1,'active','2026-09-24 00:57:58',0,'search/',1,0,'','','',0,'','','main','read','','',''),(5,1,'captcha',1,1,'active','2026-09-24 00:57:58',0,'captcha',1,0,'','','',0,'','','','read','','',''),(6,1,'cron',1,1,'active','2026-09-24 00:57:58',0,'',0,0,'','','',0,'','','','read','','',''),(7,1,'actions',1,1,'active','2026-09-24 00:57:58',0,'',0,0,'','','',0,'','','','read','','',''),(8,1,'pay',1,1,'active','2026-09-24 00:57:58',0,'pay/',0,0,'','','',0,'','','','read','','',''),(9,3,'favorites',0,1,'active','2026-09-24 00:57:58',0,'favorites/',1,0,'','','',0,'','','account','read','','',''),(10,3,'members',0,1,'active','2026-09-24 00:57:58',0,'members/',0,0,'','','',0,'','','main','read','','members',''),(11,3,'login',0,1,'active','2026-09-24 00:57:58',0,'login/',1,0,'','','',0,'','','','read','','',''),(12,3,'hybrid',1,1,'active','2026-09-24 00:57:58',0,'hybrid/',1,0,'','','login',0,'','','','read','','',''),(13,3,'view_member',0,1,'active','2026-09-24 00:57:58',0,'member/',1,0,'','','',0,'','','','read','members','members',''),(14,3,'profile',0,1,'active','2026-09-24 00:57:58',0,'profile/',1,0,'','','',0,'','','account','read','','',''),(15,3,'member_funds',0,1,'active','2026-09-24 00:57:58',0,'profile/funds/',1,0,'','','transactions',0,'','','account','read','profile','',''),(16,3,'member_registration',0,1,'active','2026-09-24 00:57:58',0,'registration/',1,0,'','','registration',0,'','','','read','','',''),(17,3,'register_confirm',1,1,'active','2026-09-24 00:57:58',0,'confirm/',1,0,'','','registration',0,'','','','read','','',''),(18,3,'member_password_forgot',1,1,'active','2026-09-24 00:57:58',0,'forgot/',1,0,'','','registration',0,'','','','read','','',''),(19,2,'page',1,1,'active','2026-09-24 00:57:58',0,'',0,0,'','','page',0,'','','','read','','',''),(20,2,'about',0,0,'active','2026-09-24 00:57:58',0,'about/',0,0,'','','page',0,'','','','read','','',''),(21,2,'policy',0,0,'active','2026-09-24 00:57:58',0,'policy/',0,0,'','','page',0,'','','','read','','',''),(22,2,'terms',0,0,'active','2026-09-24 00:57:58',0,'terms/',0,0,'','','page',0,'','','','read','','',''),(23,2,'help',0,0,'active','2026-09-24 00:57:58',0,'help/',0,0,'','','page',0,'','','','read','','',''),(24,2,'advertise',0,0,'active','2026-09-24 00:57:58',0,'advertise/',0,0,'','','page',0,'','','','read','','',''),(25,5,'blog',0,1,'active','2026-09-23 20:57:58',1,'blog/',0,0,'blog','','',0,'','','','read','','',''),(26,5,'tag',0,1,'active','2026-09-23 20:57:58',2,'tag/',0,0,'blog','','tag',0,'','','','read','','',''),(27,5,'blog_date',0,1,'active','2026-09-23 20:57:58',3,'blog/date/',0,0,'blog','','date',0,'','','','read','','','');
/*!40000 ALTER TABLE `ia_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_payment_gateways`
--

DROP TABLE IF EXISTS `ia_payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_payment_gateways` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NAME` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_payment_gateways`
--

LOCK TABLES `ia_payment_gateways` WRITE;
/*!40000 ALTER TABLE `ia_payment_gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_payment_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_payment_gateways_ipn_log`
--

DROP TABLE IF EXISTS `ia_payment_gateways_ipn_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_payment_gateways_ipn_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `gateway` varchar(50) NOT NULL,
  `data` text DEFAULT NULL,
  `result` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_payment_gateways_ipn_log`
--

LOCK TABLES `ia_payment_gateways_ipn_log` WRITE;
/*!40000 ALTER TABLE `ia_payment_gateways_ipn_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_payment_gateways_ipn_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_payment_plans`
--

DROP TABLE IF EXISTS `ia_payment_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_payment_plans` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cost` decimal(10,2) unsigned NOT NULL,
  `item` varchar(50) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `duration` int(10) unsigned NOT NULL COMMENT 'Duration of cycle in units',
  `unit` enum('hour','day','week','month','year') DEFAULT NULL COMMENT 'Unit of measure',
  `order` tinyint(3) unsigned NOT NULL,
  `status` enum('inactive','active') NOT NULL DEFAULT 'inactive',
  `email` varchar(128) NOT NULL,
  `usergroup` smallint(5) unsigned NOT NULL,
  `recurring` tinyint(1) unsigned NOT NULL COMMENT 'Is this plan recurring?',
  `cycles` smallint(5) NOT NULL DEFAULT 0 COMMENT 'Number of recurring cycles',
  `expiration_status` varchar(15) NOT NULL COMMENT 'Status which will be applied on plan expiration',
  `type` enum('fee','subscription') NOT NULL DEFAULT 'subscription',
  `listings_limit` int(7) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_payment_plans`
--

LOCK TABLES `ia_payment_plans` WRITE;
/*!40000 ALTER TABLE `ia_payment_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_payment_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_payment_plans_options`
--

DROP TABLE IF EXISTS `ia_payment_plans_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_payment_plans_options` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('bool','int','float','string') NOT NULL DEFAULT 'string',
  `chargeable` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `default_value` varchar(32) NOT NULL,
  `item` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_payment_plans_options`
--

LOCK TABLES `ia_payment_plans_options` WRITE;
/*!40000 ALTER TABLE `ia_payment_plans_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_payment_plans_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_payment_plans_options_values`
--

DROP TABLE IF EXISTS `ia_payment_plans_options_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_payment_plans_options_values` (
  `plan_id` smallint(5) unsigned NOT NULL,
  `option_id` smallint(5) unsigned NOT NULL,
  `price` decimal(8,2) unsigned DEFAULT NULL,
  `value` varchar(96) NOT NULL,
  UNIQUE KEY `UNIQUE` (`plan_id`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_payment_plans_options_values`
--

LOCK TABLES `ia_payment_plans_options_values` WRITE;
/*!40000 ALTER TABLE `ia_payment_plans_options_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_payment_plans_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_payment_subscriptions`
--

DROP TABLE IF EXISTS `ia_payment_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_payment_subscriptions` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime DEFAULT NULL,
  `date_next_payment` datetime DEFAULT NULL,
  `reference_id` varchar(64) DEFAULT NULL,
  `member_id` int(11) unsigned NOT NULL,
  `plan_id` smallint(5) unsigned NOT NULL,
  `item` varchar(30) DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `status` enum('active','pending','suspended','canceled','failed','completed') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `REFERENCE` (`reference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_payment_subscriptions`
--

LOCK TABLES `ia_payment_subscriptions` WRITE;
/*!40000 ALTER TABLE `ia_payment_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_payment_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_payment_transactions`
--

DROP TABLE IF EXISTS `ia_payment_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_payment_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `subscription_id` int(9) unsigned DEFAULT NULL,
  `plan_id` smallint(5) unsigned NOT NULL,
  `reference_id` varchar(64) NOT NULL,
  `item` varchar(30) NOT NULL,
  `item_id` int(11) unsigned NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_paid` datetime DEFAULT NULL,
  `amount` decimal(10,2) unsigned NOT NULL,
  `currency` varchar(3) NOT NULL,
  `status` enum('pending','passed','failed','refunded') NOT NULL DEFAULT 'pending',
  `operation` varchar(100) NOT NULL,
  `gateway` varchar(50) NOT NULL,
  `sec_key` varchar(14) NOT NULL,
  `return_url` tinytext NOT NULL,
  `notes` tinytext DEFAULT NULL,
  `demo` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_payment_transactions`
--

LOCK TABLES `ia_payment_transactions` WRITE;
/*!40000 ALTER TABLE `ia_payment_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_payment_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_positions`
--

DROP TABLE IF EXISTS `ia_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_positions` (
  `name` varchar(100) NOT NULL,
  `menu` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `movable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_positions`
--

LOCK TABLES `ia_positions` WRITE;
/*!40000 ALTER TABLE `ia_positions` DISABLE KEYS */;
INSERT INTO `ia_positions` VALUES ('account',1,0),('mainmenu',1,0),('inventory',0,1),('teaser',0,1),('verytop',0,1),('top',0,1),('bottom',0,1),('verybottom',0,1),('copyright',0,1),('landing',0,1),('left',0,1),('center',0,1),('right',0,1),('footer1',0,1),('footer2',0,1),('footer3',0,1),('footer4',0,1);
/*!40000 ALTER TABLE `ia_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_search`
--

DROP TABLE IF EXISTS `ia_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_search` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `item` varchar(16) NOT NULL,
  `params` varchar(400) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`member_id`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_search`
--

LOCK TABLES `ia_search` WRITE;
/*!40000 ALTER TABLE `ia_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_usergroups`
--

DROP TABLE IF EXISTS `ia_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_usergroups` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `module` varchar(40) NOT NULL,
  `system` tinyint(1) unsigned NOT NULL,
  `assignable` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `visible` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_usergroups`
--

LOCK TABLES `ia_usergroups` WRITE;
/*!40000 ALTER TABLE `ia_usergroups` DISABLE KEYS */;
INSERT INTO `ia_usergroups` VALUES (1,'administrators','',1,0,0),(2,'moderators','',1,0,0),(4,'guests','',1,0,0),(8,'registered','',1,0,1);
/*!40000 ALTER TABLE `ia_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ia_views_log`
--

DROP TABLE IF EXISTS `ia_views_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ia_views_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` char(16) NOT NULL,
  `item_id` int(11) unsigned NOT NULL,
  `ip` bigint(12) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`item`,`item_id`,`ip`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ia_views_log`
--

LOCK TABLES `ia_views_log` WRITE;
/*!40000 ALTER TABLE `ia_views_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ia_views_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-24  0:59:09
