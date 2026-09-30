/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dotplant2
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
-- Current Database: `dotplant2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dotplant2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `dotplant2`;

--
-- Table structure for table `addon`
--

DROP TABLE IF EXISTS `addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `currency_id` int(11) NOT NULL DEFAULT 0,
  `price_is_multiplier` tinyint(1) NOT NULL DEFAULT 0,
  `add_to_order` tinyint(1) NOT NULL DEFAULT 0,
  `addon_category_id` int(11) NOT NULL,
  `can_change_quantity` tinyint(1) NOT NULL DEFAULT 0,
  `measure_id` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `by_category` (`addon_category_id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon`
--

LOCK TABLES `addon` WRITE;
/*!40000 ALTER TABLE `addon` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_bindings`
--

DROP TABLE IF EXISTS `addon_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_bindings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) NOT NULL,
  `appliance_object_id` int(11) NOT NULL,
  `object_model_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `addons4object` (`appliance_object_id`,`object_model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_bindings`
--

LOCK TABLES `addon_bindings` WRITE;
/*!40000 ALTER TABLE `addon_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_category`
--

DROP TABLE IF EXISTS `addon_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_category`
--

LOCK TABLES `addon_category` WRITE;
/*!40000 ALTER TABLE `addon_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_service`
--

DROP TABLE IF EXISTS `api_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_service` (
  `service_id` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `token_type` varchar(255) NOT NULL,
  `expires_in` int(10) unsigned NOT NULL,
  `create_ts` int(10) unsigned NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_service`
--

LOCK TABLES `api_service` WRITE;
/*!40000 ALTER TABLE `api_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `rule_name` (`rule_name`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('admin','1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('admin',1,'Administrator',NULL,NULL,NULL,NULL),('administrate',2,'Administrate panel',NULL,NULL,NULL,NULL),('api manage',2,'API management',NULL,NULL,NULL,NULL),('cache manage',2,'Cache management',NULL,NULL,NULL,NULL),('category manage',2,'Category management',NULL,NULL,NULL,NULL),('content manage',2,'Content management',NULL,NULL,NULL,NULL),('data manage',2,'Data management',NULL,NULL,NULL,NULL),('form manage',2,'Form management',NULL,NULL,NULL,NULL),('manager',1,'Manager',NULL,NULL,NULL,NULL),('media manage',2,'Media management',NULL,NULL,NULL,NULL),('monitoring manage',2,'Monitoring management',NULL,NULL,NULL,NULL),('navigation manage',2,'Navigation management',NULL,NULL,NULL,NULL),('order manage',2,'Order management',NULL,NULL,NULL,NULL),('order status manage',2,'Order status management',NULL,NULL,NULL,NULL),('payment manage',2,'Payment type management',NULL,NULL,NULL,NULL),('product manage',2,'Product management',NULL,NULL,NULL,NULL),('property manage',2,'Property management',NULL,NULL,NULL,NULL),('review manage',2,'Review management',NULL,NULL,NULL,NULL),('seo manage',2,'SEO management',NULL,NULL,NULL,NULL),('setting manage',2,'Setting management',NULL,NULL,NULL,NULL),('shipping manage',2,'Shipping option management',NULL,NULL,NULL,NULL),('shop manage',2,'Shop management',NULL,NULL,NULL,NULL),('task manage',2,'Task management',NULL,NULL,NULL,NULL),('user manage',2,'User management',NULL,NULL,NULL,NULL),('view manage',2,'View management',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('admin','administrate'),('admin','api manage'),('admin','cache manage'),('admin','category manage'),('admin','content manage'),('admin','data manage'),('admin','form manage'),('admin','media manage'),('admin','monitoring manage'),('admin','navigation manage'),('admin','order manage'),('admin','order status manage'),('admin','payment manage'),('admin','product manage'),('admin','property manage'),('admin','review manage'),('admin','seo manage'),('admin','setting manage'),('admin','shipping manage'),('admin','shop manage'),('admin','task manage'),('admin','user manage'),('admin','view manage'),('manager','administrate'),('manager','category manage'),('manager','content manage'),('manager','form manage'),('manager','media manage'),('manager','navigation manage'),('manager','order manage'),('manager','product manage'),('manager','property manage'),('manager','review manage'),('manager','shop manage'),('manager','view manage'),('shop manage','category manage'),('shop manage','order manage'),('shop manage','product manage');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_menu`
--

DROP TABLE IF EXISTS `backend_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort_order` int(10) unsigned DEFAULT 0,
  `added_by_ext` varchar(255) DEFAULT NULL,
  `rbac_check` varchar(64) DEFAULT NULL,
  `css_class` varchar(255) DEFAULT NULL,
  `translation_category` varchar(120) NOT NULL DEFAULT 'app',
  PRIMARY KEY (`id`),
  KEY `ix-backendmenu-parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_menu`
--

LOCK TABLES `backend_menu` WRITE;
/*!40000 ALTER TABLE `backend_menu` DISABLE KEYS */;
INSERT INTO `backend_menu` VALUES (1,0,'Root','/backend/',NULL,0,'core',NULL,NULL,'app'),(2,1,'Dashboard','backend/dashboard/index','dashboard',0,'core','administrate',NULL,'app'),(3,1,'Pages','page/backend/index','file-o',0,'core','content manage',NULL,'app'),(4,1,'Shop','','shopping-cart',0,'core','shop manage',NULL,'app'),(5,4,'Categories','shop/backend-category/index','tree',0,'core','category manage',NULL,'app'),(6,4,'Products','shop/backend-product/index','list',0,'core','product manage',NULL,'app'),(7,4,'Orders','','list-alt',0,'core','order manage',NULL,'app'),(8,4,'Stages','shop/backend-stage/index','sitemap',0,'core','order status manage',NULL,'app'),(9,4,'Payment types','shop/backend-payment-type/index','info-circle',0,'core','payment manage',NULL,'app'),(10,4,'Filter sets','shop/backend-filter-sets/index','filter',0,'core','category manage',NULL,'app'),(11,4,'Shipping options','shop/backend-shipping-option/index','truck',0,'core','shipping manage',NULL,'app'),(12,4,'Categories groups','shop/backend-category-group/index','folder-o',0,'core','category manage',NULL,'app'),(13,4,'Prefiltered pages','shop/backend-prefiltered-pages/index','tag',0,'core','shop manage',NULL,'app'),(14,4,'Currencies','shop/backend-currencies/index','usd',0,'core','shop manage',NULL,'app'),(15,4,'Measures','shop/backend-measure/index','calculator',0,'core','shop manage',NULL,'app'),(16,4,'Discounts','shop/backend-discount/index','shekel',0,'core','shop manage',NULL,'app'),(17,4,'Warehouse','shop/backend-warehouse/index','cubes',0,'core','shop manage',NULL,'app'),(18,1,'Properties','','cogs',0,'core','property manage',NULL,'app'),(19,18,'Properties','backend/properties/index','cogs',0,'core','property manage',NULL,'app'),(20,18,'Views','backend/view/index','desktop',0,'core','view manage',NULL,'app'),(21,1,'Reviews','review/backend-review/index','comment',0,'core','review manage',NULL,'app'),(22,1,'Rating groups','review/backend-rating/index','star-half-o',0,'core','review manage',NULL,'app'),(23,1,'Navigation','backend/navigation/index','navicon',0,'core','navigation manage',NULL,'app'),(24,1,'Forms','backend/form/index','list-ul',0,'core','form manage',NULL,'app'),(25,1,'Dynamic content','backend/dynamic-content/index','puzzle-piece',0,'core','content manage',NULL,'app'),(26,1,'Content Blocks','core/backend-chunk/index','file-code-o',0,'core','content manage',NULL,'app'),(27,1,'Sliders','backend/slider/index','arrows-h',0,'core','content manage',NULL,'app'),(28,1,'Users','user/backend-user/index','users',0,'core','user manage',NULL,'app'),(29,1,'Rbac','user/rbac/index','lock',0,'core','user manage',NULL,'app'),(30,1,'Seo','seo/manage/index','search',0,'core','seo manage',NULL,'app'),(31,1,'Images','','picture-o',0,'core','content manage',NULL,'app'),(32,31,'Thumbnails sizes','image/backend-thumbnail-size/index',NULL,0,'core','content manage',NULL,'app'),(33,31,'Create thumbnails','image/backend-thumbnail/index',NULL,0,'core','content manage',NULL,'app'),(34,31,'Watermarks','image/backend-watermark/index',NULL,0,'core','content manage',NULL,'app'),(35,31,'Broken images','image/backend-error-images/index',NULL,0,'core','content manage',NULL,'app'),(36,1,'Error monitoring','backend/error-monitor/index','flash',0,'core','monitoring manage',NULL,'app'),(37,1,'Settings','','gears',0,'core','setting manage',NULL,'app'),(38,37,'Tasks','background/manage/index','tasks',0,'core','task manage',NULL,'app'),(39,37,'Config','config/backend/index','gear',0,'core','setting manage',NULL,'app'),(40,37,'I18n','backend/i18n/index','language',0,'core','setting manage',NULL,'app'),(41,37,'Spam Form Checker','backend/spam-checker/index','send-o',0,'core','setting manage',NULL,'app'),(42,37,'Backend menu','backend/backend-menu/index','list-alt',0,'core','setting manage',NULL,'app'),(43,37,'Data','data/file/index','database',0,'core','data manage',NULL,'app'),(44,37,'YML','shop/backend-yml/settings','code',0,'core','content manage',NULL,'app'),(45,37,'Api','backend/api/index','exchange',0,'core','api manage',NULL,'app'),(46,7,'Orders','shop/backend-order/index','list-alt',0,'shop','order manage','','app'),(47,7,'Customers','shop/backend-customer/index','user',1,'shop','order manage','','app'),(48,7,'Contragents','shop/backend-contragent/index','user',2,'shop','order manage','','app'),(49,37,'Extensions','core/backend-extensions/index','puzzle-piece',0,'core','setting manage','','app'),(50,4,'Addons','shop/backend-addons/index','cart-plus',0,'core','product manage','','app'),(51,37,'Google Merchants','/shop/backend-google-feed/settings','google',0,'core','content manage',NULL,'app'),(52,37,'Wysiwyg editors','/core/backend-wysiwyg/index','pencil-square-o',0,'core','content manage',NULL,'app');
/*!40000 ALTER TABLE `backend_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backgroundtasks_notify_message`
--

DROP TABLE IF EXISTS `backgroundtasks_notify_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backgroundtasks_notify_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `result_status` enum('SUCCESS','FAULT') NOT NULL DEFAULT 'SUCCESS',
  `result` text DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backgroundtasks_notify_message`
--

LOCK TABLES `backgroundtasks_notify_message` WRITE;
/*!40000 ALTER TABLE `backgroundtasks_notify_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `backgroundtasks_notify_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backgroundtasks_task`
--

DROP TABLE IF EXISTS `backgroundtasks_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backgroundtasks_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `type` enum('EVENT','REPEAT') NOT NULL DEFAULT 'EVENT',
  `initiator` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `params` text DEFAULT NULL,
  `init_event` varchar(255) DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','STOPPED','RUNNING','FAILED','COMPLETED','PROCESS') NOT NULL DEFAULT 'ACTIVE',
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fail_counter` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backgroundtasks_task`
--

LOCK TABLES `backgroundtasks_task` WRITE;
/*!40000 ALTER TABLE `backgroundtasks_task` DISABLE KEYS */;
INSERT INTO `backgroundtasks_task` VALUES (1,'seo/sitemap/generate-sitemap','REPEAT',1,'sitemap',NULL,NULL,NULL,'0-59/15 * * * *','ACTIVE','2026-09-30 09:43:51',0,NULL),(2,'errornotifier/notify','REPEAT',1,'ErrorMonitor notifier',NULL,NULL,NULL,'*/1 * * * *','ACTIVE','2026-09-30 09:43:51',0,NULL),(3,'currency/update','REPEAT',1,'Currency update',NULL,NULL,NULL,'0 0 * * *','ACTIVE','2026-09-30 09:43:51',0,NULL),(4,'background/tasks/clear-old-notifications','REPEAT',1,'Clear old notify messages',NULL,NULL,NULL,'*/1 * * * *','ACTIVE','2026-09-30 09:43:51',0,'[]'),(5,'submissions/mark-spam','REPEAT',1,'Mark spam submissions as deleted',NULL,NULL,NULL,'* * */1 * *','ACTIVE','2026-09-30 09:43:51',0,'[]'),(6,'submissions/clear-deleted','REPEAT',1,'Clear deleted submissions',NULL,NULL,NULL,'* * */3 * *','ACTIVE','2026-09-30 09:43:51',0,'[]'),(7,'images/check-broken','REPEAT',1,'Check broken images',NULL,NULL,NULL,'* */1 * * *','ACTIVE','2026-09-30 09:43:51',0,NULL),(8,'submissions/send-new','REPEAT',1,'Send new submissions',NULL,NULL,NULL,'*/5 * * * *','ACTIVE','2026-09-30 09:43:51',0,NULL);
/*!40000 ALTER TABLE `backgroundtasks_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_group_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `breadcrumbs_label` varchar(255) DEFAULT NULL,
  `slug` varchar(80) DEFAULT '',
  `slug_compiled` varchar(180) DEFAULT '',
  `slug_absolute` tinyint(4) DEFAULT 0,
  `content` text DEFAULT NULL,
  `announce` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `title_append` varchar(255) DEFAULT NULL,
  `active` tinyint(3) unsigned DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-category-category_group_id` (`category_group_id`,`parent_id`),
  KEY `ix-category-parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,0,'Catalog','Catalog','Catalog','Catalog','Catalog','catalog','catalog',0,NULL,NULL,0,NULL,1,'2026-09-30 09:43:51',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_discount`
--

DROP TABLE IF EXISTS `category_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_discount`
--

LOCK TABLES `category_discount` WRITE;
/*!40000 ALTER TABLE `category_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_eav`
--

DROP TABLE IF EXISTS `category_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_eav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_model_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `object_model_id` (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_eav`
--

LOCK TABLES `category_eav` WRITE;
/*!40000 ALTER TABLE `category_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_group`
--

DROP TABLE IF EXISTS `category_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_group`
--

LOCK TABLES `category_group` WRITE;
/*!40000 ALTER TABLE `category_group` DISABLE KEYS */;
INSERT INTO `category_group` VALUES (1,'Shop');
/*!40000 ALTER TABLE `category_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_group_route_templates`
--

DROP TABLE IF EXISTS `category_group_route_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_group_route_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_group_id` int(11) unsigned NOT NULL,
  `route_id` int(10) unsigned NOT NULL,
  `template_json` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-category-group-route-templates-category_group_id-route_id` (`category_group_id`,`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_group_route_templates`
--

LOCK TABLES `category_group_route_templates` WRITE;
/*!40000 ALTER TABLE `category_group_route_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_group_route_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_property`
--

DROP TABLE IF EXISTS `category_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_property` (
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_property`
--

LOCK TABLES `category_property` WRITE;
/*!40000 ALTER TABLE `category_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Москва',0,'moscow',1),(2,'Санкт-Петербург',0,'spb',1),(3,'New York',0,'ny',2);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerceml_guid`
--

DROP TABLE IF EXISTS `commerceml_guid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerceml_guid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL,
  `type` enum('PRODUCT','CATEGORY','PROPERTY') DEFAULT 'PRODUCT',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerceml_guid`
--

LOCK TABLES `commerceml_guid` WRITE;
/*!40000 ALTER TABLE `commerceml_guid` DISABLE KEYS */;
/*!40000 ALTER TABLE `commerceml_guid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurable`
--

DROP TABLE IF EXISTS `configurable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `configurable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `section_name` varchar(255) NOT NULL,
  `display_in_config` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurable`
--

LOCK TABLES `configurable` WRITE;
/*!40000 ALTER TABLE `configurable` DISABLE KEYS */;
INSERT INTO `configurable` VALUES (1,'core',1,'Core',1),(2,'DefaultTheme',2,'Default Theme',1),(3,'shop',3,'Shop',1),(4,'user',4,'Users & Roles',1),(5,'page',5,'Pages',1),(6,'image',6,'Images',1),(7,'seo',7,'SEO',1),(8,'backend',8,'Backend',1),(9,'review',9,'Reviews',1),(10,'data',10,'Data import/export',1),(11,'background',17,'Background tasks',1);
/*!40000 ALTER TABLE `configurable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_block`
--

DROP TABLE IF EXISTS `content_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` text DEFAULT NULL,
  `preload` tinyint(4) DEFAULT 0,
  `group_id` int(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_block`
--

LOCK TABLES `content_block` WRITE;
/*!40000 ALTER TABLE `content_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_block_group`
--

DROP TABLE IF EXISTS `content_block_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_block_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT 1,
  `name` varchar(250) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_block_group`
--

LOCK TABLES `content_block_group` WRITE;
/*!40000 ALTER TABLE `content_block_group` DISABLE KEYS */;
INSERT INTO `content_block_group` VALUES (1,0,'root',0);
/*!40000 ALTER TABLE `content_block_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_decorators`
--

DROP TABLE IF EXISTS `content_decorators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_decorators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_by_ext` varchar(255) NOT NULL,
  `post_decorator` tinyint(1) NOT NULL DEFAULT 0,
  `class_name` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_decorators`
--

LOCK TABLES `content_decorators` WRITE;
/*!40000 ALTER TABLE `content_decorators` DISABLE KEYS */;
INSERT INTO `content_decorators` VALUES (1,'core',0,'app\\modules\\core\\decorators\\ContentBlock',0);
/*!40000 ALTER TABLE `content_decorators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contragent`
--

DROP TABLE IF EXISTS `contragent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contragent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `type` enum('Individual','Self-employed','Legal entity') NOT NULL DEFAULT 'Individual',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contragent`
--

LOCK TABLES `contragent` WRITE;
/*!40000 ALTER TABLE `contragent` DISABLE KEYS */;
/*!40000 ALTER TABLE `contragent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contragent_eav`
--

DROP TABLE IF EXISTS `contragent_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contragent_eav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model_id` int(11) unsigned NOT NULL,
  `property_group_id` int(11) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contragent_eav`
--

LOCK TABLES `contragent_eav` WRITE;
/*!40000 ALTER TABLE `contragent_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `contragent_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `iso_code` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Россия','RUS',0,'rossiya'),(2,'USA','USA',1,'usa');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `iso_code` varchar(255) DEFAULT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT 0,
  `convert_nominal` float NOT NULL DEFAULT 1,
  `convert_rate` float NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `intl_formatting` tinyint(1) NOT NULL DEFAULT 1,
  `min_fraction_digits` int(11) NOT NULL DEFAULT 0,
  `max_fraction_digits` int(11) NOT NULL DEFAULT 2,
  `dec_point` varchar(255) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(255) NOT NULL DEFAULT ' ',
  `format_string` varchar(255) DEFAULT NULL,
  `additional_rate` float NOT NULL DEFAULT 0,
  `additional_nominal` float NOT NULL DEFAULT 0,
  `currency_rate_provider_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'Ruble','RUB',1,1,1,0,0,0,2,'.',' ','# руб.',0,0,0),(2,'US Dollar','USD',0,1,62.8353,1,1,0,2,',','.','$ #',0,0,0),(3,'Euro','EUR',0,1,71.3243,0,1,0,2,'.',' ','&euro; #',0,0,0);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_rate_provider`
--

DROP TABLE IF EXISTS `currency_rate_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_rate_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `params` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_rate_provider`
--

LOCK TABLES `currency_rate_provider` WRITE;
/*!40000 ALTER TABLE `currency_rate_provider` DISABLE KEYS */;
INSERT INTO `currency_rate_provider` VALUES (1,'Google Finance','Swap\\Provider\\GoogleFinanceProvider',NULL),(2,'Cbr Finance','app\\components\\swap\\provider\\CbrFinanceProvider',NULL),(3,'Currency rate multi provider','app\\components\\swap\\provider\\CurrencyRateMultiProvider','{\"mainProvider\":1,\"secondProvider\":2,\"criticalDifference\":20}');
/*!40000 ALTER TABLE `currency_rate_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT 0,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav`
--

DROP TABLE IF EXISTS `customer_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_eav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model_id` int(11) unsigned NOT NULL,
  `property_group_id` int(11) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav`
--

LOCK TABLES `customer_eav` WRITE;
/*!40000 ALTER TABLE `customer_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_export`
--

DROP TABLE IF EXISTS `data_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_export` (
  `user_id` int(11) unsigned NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `status` enum('complete','failed','process') NOT NULL DEFAULT 'process',
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_export`
--

LOCK TABLES `data_export` WRITE;
/*!40000 ALTER TABLE `data_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_import`
--

DROP TABLE IF EXISTS `data_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_import` (
  `user_id` int(11) unsigned NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `status` enum('complete','failed','process') NOT NULL DEFAULT 'process',
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_import`
--

LOCK TABLES `data_import` WRITE;
/*!40000 ALTER TABLE `data_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_information`
--

DROP TABLE IF EXISTS `delivery_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contragent_id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT 0,
  `city_id` int(11) DEFAULT 0,
  `zip_code` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_information`
--

LOCK TABLES `delivery_information` WRITE;
/*!40000 ALTER TABLE `delivery_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `appliance` enum('order_without_delivery','order_with_delivery','products','product_categories','delivery') NOT NULL,
  `value` float NOT NULL,
  `value_in_percent` tinyint(1) NOT NULL DEFAULT 1,
  `apply_order_price_lg` float NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_code`
--

DROP TABLE IF EXISTS `discount_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_till` timestamp NULL DEFAULT NULL,
  `maximum_uses` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_code`
--

LOCK TABLES `discount_code` WRITE;
/*!40000 ALTER TABLE `discount_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_type`
--

DROP TABLE IF EXISTS `discount_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `checking_class` enum('Order','OrderItem') NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `add_view` varchar(255) DEFAULT NULL,
  `custom_view` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_type`
--

LOCK TABLES `discount_type` WRITE;
/*!40000 ALTER TABLE `discount_type` DISABLE KEYS */;
INSERT INTO `discount_type` VALUES (1,'Discount Code','app\\modules\\shop\\models\\DiscountCode',1,'Order',0,'@app/modules/shop/views/backend-discount/_discount_code',NULL),(2,'Category Discount','app\\modules\\shop\\models\\CategoryDiscount',1,'OrderItem',0,'@app/modules/shop/views/backend-discount/_category_discount',NULL),(3,'User Discount','app\\modules\\shop\\models\\UserDiscount',1,'Order',0,'@app/modules/shop/views/backend-discount/_user_discount',NULL),(4,'Order Discount','app\\modules\\shop\\models\\OrderDiscount',1,'Order',0,'@app/modules/shop/views/backend-discount/_order_discount',NULL),(5,'Product Discount','app\\modules\\shop\\models\\ProductDiscount',1,'OrderItem',0,'@app/modules/shop/views/backend-discount/_product_discount',NULL),(6,'Shipping Discount','app\\modules\\shop\\models\\ShippingDiscount',1,'Order',0,'@app/modules/shop/views/backend-discount/_shipping_discount',NULL);
/*!40000 ALTER TABLE `discount_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynagrid`
--

DROP TABLE IF EXISTS `dynagrid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynagrid` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `filter_id` varchar(100) DEFAULT NULL,
  `sort_id` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynagrid`
--

LOCK TABLES `dynagrid` WRITE;
/*!40000 ALTER TABLE `dynagrid` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynagrid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynagrid_dtl`
--

DROP TABLE IF EXISTS `dynagrid_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynagrid_dtl` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `category` varchar(10) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `dynagrid_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_dtl` (`name`,`category`,`dynagrid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynagrid_dtl`
--

LOCK TABLES `dynagrid_dtl` WRITE;
/*!40000 ALTER TABLE `dynagrid_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynagrid_dtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_content`
--

DROP TABLE IF EXISTS `dynamic_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `route` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content_block_name` varchar(80) DEFAULT 'content',
  `announce` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `h1` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `apply_if_last_category_id` int(11) DEFAULT NULL,
  `apply_if_params` text DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_route` (`object_id`,`route`(80))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_content`
--

LOCK TABLES `dynamic_content` WRITE;
/*!40000 ALTER TABLE `dynamic_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_image`
--

DROP TABLE IF EXISTS `error_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_id` int(10) unsigned NOT NULL,
  `class_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_image`
--

LOCK TABLES `error_image` WRITE;
/*!40000 ALTER TABLE `error_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log`
--

DROP TABLE IF EXISTS `error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url_id` int(10) unsigned NOT NULL,
  `http_code` smallint(6) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `info` text DEFAULT NULL,
  `server_vars` text DEFAULT NULL,
  `request_vars` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log`
--

LOCK TABLES `error_log` WRITE;
/*!40000 ALTER TABLE `error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_url`
--

DROP TABLE IF EXISTS `error_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_url` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` text DEFAULT NULL,
  `immediate_notify_count` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_url`
--

LOCK TABLES `error_url` WRITE;
/*!40000 ALTER TABLE `error_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_handlers`
--

DROP TABLE IF EXISTS `event_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_handlers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `handler_class_name` varchar(255) NOT NULL,
  `handler_function_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `non_deletable` tinyint(1) NOT NULL DEFAULT 0,
  `triggering_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `by_event_active` (`event_id`,`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_handlers`
--

LOCK TABLES `event_handlers` WRITE;
/*!40000 ALTER TABLE `event_handlers` DISABLE KEYS */;
INSERT INTO `event_handlers` VALUES (1,1,1,'app\\modules\\shop\\helpers\\LastViewedProducts','handleProductShowed',1,1,'application_trigger'),(2,4,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handleStageCustomer',1,0,'application_trigger'),(3,5,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handleStageDelivery',1,0,'application_trigger'),(4,6,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handleStagePayment',1,0,'application_trigger'),(5,7,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handleStagePaymentPay',1,0,'application_trigger'),(6,8,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handleCustomer',1,0,'application_trigger'),(7,9,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handlePayment',1,0,'application_trigger'),(8,10,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handleDelivery',1,0,'application_trigger'),(9,11,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handlePaymentPay',1,0,'application_trigger'),(10,12,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handleManagerProcess',1,0,'application_trigger'),(11,13,0,'app\\modules\\shop\\helpers\\PriceHandlers','handleSaveDiscounts',1,0,'application_trigger'),(12,13,-5,'app\\modules\\shop\\helpers\\PriceHandlers','handleSaveDelivery',1,0,'application_trigger'),(13,14,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handleStageFinal',1,1,'application_trigger'),(14,15,0,'app\\modules\\shop\\helpers\\BaseOrderStageHandlers','handleFinal',1,1,'application_trigger');
/*!40000 ALTER TABLE `event_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_class_name` varchar(255) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_class_name` varchar(255) NOT NULL,
  `selector_prefix` varchar(255) NOT NULL DEFAULT '',
  `event_description` text NOT NULL,
  `documentation_link` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_class_name` (`event_class_name`(50))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'app\\modules\\shop\\ShopModule','product_page_showed','app\\modules\\shop\\events\\ProductPageShowed','','Product page is showed to user',''),(2,'app\\modules\\shop\\ShopModule','product_showed_in_list','app\\modules\\shop\\events\\ProductShowedInList','','Product is showed in product listing(shop/product/list)',''),(3,'app\\modules\\shop\\ShopModule','product_category_listed','app\\modules\\shop\\events\\ProductCategoryListed','','Category is listed by shop/product/list as last_category_id.',''),(4,'app\\modules\\shop\\ShopModule','order_stage_customer','app\\modules\\shop\\events\\StageCustomer','','',''),(5,'app\\modules\\shop\\ShopModule','order_stage_delivery','app\\modules\\shop\\events\\StageDelivery','','',''),(6,'app\\modules\\shop\\ShopModule','order_stage_payment','app\\modules\\shop\\events\\StagePayment','','',''),(7,'app\\modules\\shop\\ShopModule','order_stage_payment_pay','app\\modules\\shop\\events\\StagePaymentPay','','',''),(8,'app\\modules\\shop\\ShopModule','order_stageleaf_customer','app\\modules\\shop\\events\\StageLeafCustomer','','',''),(9,'app\\modules\\shop\\ShopModule','order_stageleaf_payment_choose','app\\modules\\shop\\events\\StageLeafPayment','','',''),(10,'app\\modules\\shop\\ShopModule','order_stageleaf_delivery_choose','app\\modules\\shop\\events\\StageLeafDelivery','','',''),(11,'app\\modules\\shop\\ShopModule','order_stageleaf_payment_pay','app\\modules\\shop\\events\\StageLeafPaymentPay','','',''),(12,'app\\modules\\shop\\ShopModule','order_stageleaf_manager_process','app\\modules\\shop\\events\\StageLeafManagerProcess','','',''),(13,'app\\modules\\shop\\ShopModule','order_calculate','app\\modules\\shop\\events\\OrderCalculateEvent','','',''),(14,'app\\modules\\shop\\ShopModule','order_stage_final','app\\modules\\shop\\events\\StageFinal','','',''),(15,'app\\modules\\shop\\ShopModule','order_stage_leaf_final','app\\modules\\shop\\events\\StageLeafFinal','','','');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extension_types`
--

DROP TABLE IF EXISTS `extension_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extension_types`
--

LOCK TABLES `extension_types` WRITE;
/*!40000 ALTER TABLE `extension_types` DISABLE KEYS */;
INSERT INTO `extension_types` VALUES (1,'Theme'),(2,'Module'),(3,'Frontend widget'),(4,'Dashboard widget'),(5,'Backend input widget');
/*!40000 ALTER TABLE `extension_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `force_version` varchar(255) NOT NULL DEFAULT 'dev-master',
  `type` int(11) NOT NULL DEFAULT 0,
  `latest_version` varchar(255) NOT NULL DEFAULT '',
  `current_package_version_timestamp` timestamp NULL DEFAULT NULL,
  `latest_package_version_timestamp` timestamp NULL DEFAULT NULL,
  `homepage` varchar(255) NOT NULL DEFAULT '',
  `namespace_prefix` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensions`
--

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_sets`
--

DROP TABLE IF EXISTS `filter_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `property_id` int(11) NOT NULL DEFAULT 0,
  `is_filter_by_price` tinyint(1) NOT NULL DEFAULT 0,
  `delegate_to_children` tinyint(1) NOT NULL DEFAULT 1,
  `is_range_slider` tinyint(1) NOT NULL DEFAULT 0,
  `multiple` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_sets`
--

LOCK TABLES `filter_sets` WRITE;
/*!40000 ALTER TABLE `filter_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `form_view` varchar(255) DEFAULT NULL,
  `form_success_view` varchar(255) DEFAULT NULL,
  `email_notification_addresses` text NOT NULL,
  `email_notification_view` varchar(255) DEFAULT NULL,
  `form_open_analytics_action_id` int(10) unsigned DEFAULT NULL,
  `form_submit_analytics_action_id` int(10) unsigned DEFAULT NULL,
  `subject_template` varchar(255) NOT NULL DEFAULT '{form_name} #{id}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (1,'Review form',NULL,NULL,'','@app/modules/review/views/review-email-template.php',NULL,NULL,'{form_name} #{id}');
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_eav`
--

DROP TABLE IF EXISTS `form_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_eav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_model_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `object_model_id` (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_eav`
--

LOCK TABLES `form_eav` WRITE;
/*!40000 ALTER TABLE `form_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_property`
--

DROP TABLE IF EXISTS `form_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_property` (
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_property`
--

LOCK TABLES `form_property` WRITE;
/*!40000 ALTER TABLE `form_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `image_title` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `image_alt` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-image-object_id-object_model_id` (`object_id`,`object_model_id`),
  KEY `ix-image-filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout`
--

LOCK TABLES `layout` WRITE;
/*!40000 ALTER TABLE `layout` DISABLE KEYS */;
INSERT INTO `layout` VALUES (1,'Default','\\\\layouts\\main'),(2,'Main page','\\\\layouts\\main-page'),(3,'Page without sidebar','\\\\layouts\\no-sidebar');
/*!40000 ALTER TABLE `layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_anchor`
--

DROP TABLE IF EXISTS `link_anchor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_anchor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_name` varchar(60) NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `anchor` text NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_anchor`
--

LOCK TABLES `link_anchor` WRITE;
/*!40000 ALTER TABLE `link_anchor` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_anchor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_anchor_binding`
--

DROP TABLE IF EXISTS `link_anchor_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_anchor_binding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_anchor_id` int(10) unsigned NOT NULL,
  `view_file` varchar(255) NOT NULL,
  `params_hash` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) NOT NULL,
  `model_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-link_anchor_id` (`link_anchor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_anchor_binding`
--

LOCK TABLES `link_anchor_binding` WRITE;
/*!40000 ALTER TABLE `link_anchor_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_anchor_binding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `nominal` float NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'Pieces','pcs',1,0);
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1790761431),('m150531_084444_new_init',1790761431),('m150608_070448_new_theme_widgets',1790761431),('m150608_081952_sample_nav_and_pages',1790761431),('m150609_064330_backend_menu',1790761431),('m150610_120338_backend_menu_fix',1790761431),('m150611_082506_DatePicker_submission',1790761431),('m150614_153629_larger_image_description',1790761431),('m150615_105848_navigation_widget',1790761431),('m150622_090046_filterSetSlider',1790761431),('m150629_104621_dynamic_content_announce',1790761431),('m150716_091156_qualityThumbnail',1790761431),('m150716_122316_multiple_filters',1790761431),('m150717_123227_selectable_wysiwyg',1790761431),('m150720_100330_wysiwyg_conf_view',1790761431),('m150722_072209_alt_for_images',1790761431),('m150722_122030_reviews_tree',1790761431),('m150723_094753_extensions_backend_menu',1790761431),('m150723_095512_backend_menu_fixes',1790761431),('m150724_114757_quality_fix',1790761431),('m150727_093721_reviews_root',1790761431),('m150730_080036_object_static_values_index',1790761431),('m150815_143352_navigation_object',1790761431),('m150819_083548_variation_omit_get',1790761431),('m150820_063318_measure_sort_order',1790761431),('m150824_073350_password_reset_token_length',1790761431),('m150825_073943_masked_input',1790761431),('m150827_075105_product_addons',1790761431),('m150827_113408_product_relation_property',1790761431),('m150831_132548_LastViewedProducts_widget',1790761431),('m150907_062636_background_form_sending',1790761431),('m150911_112257_child_view',1790761431),('m150923_101638_date_modified',1790761431),('m150930_112734_related_products_sort',1790761431),('m151014_104524_addon_sorts',1790761431),('m151021_140934_paypal',1790761431),('m151102_110139_yandex_spam_checker_remove',1790761431),('m151103_105905_shipping_discount',1790761431),('m151112_114139_config_fix',1790761431),('m151123_122215_multi_provider',1790761431),('m151207_103155_google_merchants',1790761431),('m151215_101221_aceWidget',1790761431),('m151215_114531_content_block_groups',1790761431),('m151217_065513_formSubjectTemplate',1790761431),('m151217_080426_TextareaWidget',1790761431),('m151217_104446_wysiwygEditorsMenu',1790761431),('m151218_203419_property_title_prepend',1790761431),('m160316_102050_create_wish_table',1790761431),('m160407_120856_add_text_to_slides',1790761431),('m160411_141737_resize_images',1790761431),('m160517_150022_delete_product_from_addon',1790761431),('m160620_112036_config_fix_parent_only',1790761431),('m160714_114125_warning_set_unique_static_value_key',1790761432),('m160812_065055_fix_dynamic_content',1790761432),('m161221_195847_ability_to_disable_navigation_elements',1790761432),('m161222_193732_json_editor_property_handler',1790761432),('m170127_063746_add_position_to_counter',1790761432),('m170408_060716_disctype_add_customview',1790761432);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_anchor_index`
--

DROP TABLE IF EXISTS `model_anchor_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_anchor_index` (
  `model_name` varchar(255) NOT NULL,
  `model_id` varchar(255) NOT NULL,
  `next_index` int(10) unsigned NOT NULL,
  PRIMARY KEY (`model_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_anchor_index`
--

LOCK TABLES `model_anchor_index` WRITE;
/*!40000 ALTER TABLE `model_anchor_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_anchor_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation`
--

DROP TABLE IF EXISTS `navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `route_params` text DEFAULT NULL,
  `advanced_css_class` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `ix-navigation-parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT INTO `navigation` VALUES (1,0,'Main menu',NULL,NULL,'{}',NULL,0,1),(2,1,'Catalog','/catalog',NULL,NULL,NULL,0,1),(3,1,'About us',NULL,'/page/page/show','{\"id\":\"2\"}',NULL,0,1),(4,1,'Delivery',NULL,'/page/page/show','{\"id\":\"3\"}',NULL,0,1),(5,1,'Payment',NULL,'/page/page/show','{\"id\":\"4\"}',NULL,0,1);
/*!40000 ALTER TABLE `navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('default','primary','success','info','warning','danger') DEFAULT 'default',
  `label` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `viewed` tinyint(3) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object`
--

DROP TABLE IF EXISTS `object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `object` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `object_class` varchar(255) NOT NULL,
  `object_table_name` varchar(255) NOT NULL,
  `column_properties_table_name` varchar(255) NOT NULL,
  `eav_table_name` varchar(255) NOT NULL,
  `categories_table_name` varchar(255) NOT NULL,
  `link_slug_category` varchar(255) NOT NULL,
  `link_slug_static_value` varchar(255) NOT NULL,
  `object_slug_attribute` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-object-object_class` (`object_class`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object`
--

LOCK TABLES `object` WRITE;
/*!40000 ALTER TABLE `object` DISABLE KEYS */;
INSERT INTO `object` VALUES (1,'Page','app\\modules\\page\\models\\Page','page','page_property','page_eav','page_category','page_category_full_slug','page_static_value_category','slug'),(2,'Category','app\\modules\\shop\\models\\Category','category','category_property','category_eav','category_category','category_category_full_slug','category_static_value_category','slug'),(3,'Product','app\\modules\\shop\\models\\Product','product','product_property','product_eav','product_category','product_category_full_slug','product_static_value_category','slug'),(4,'Order','app\\modules\\shop\\models\\Order','order','order_property','order_eav','order_category','order_category_full_slug','order_static_value_full_slug','slug'),(5,'Form','app\\models\\Form','form','form_property','form_eav','form_category','form_category_full_slug','form_static_value_full_sluug','slug'),(6,'Submission','app\\models\\Submission','submission','submission_property','submission_eav','submission_category','submission_category_full_slug','submission_static_value_full_slug','slug'),(7,'User','app\\modules\\user\\models\\User','user','user_property','user_eav','user_category','user_category_full_slug','user_static_value_full_slug','slug'),(8,'Property','app\\models\\Property','property','property_property','property_eav','property_category','property_category_full_slug','property_static_value_category','slug'),(9,'PropertyStaticValues','app\\models\\PropertyStaticValues','property_static_values','property_static_values_properties','property_static_values_eav','property_static_values_category','property_static_values_category_full_slug','property_static_values_static_value_category','slug'),(10,'Customer','app\\modules\\shop\\models\\Customer','customer','customer_property','customer_eav','customer_category','customer_category_slug','customer_slug_static','slug'),(11,'Contragent','app\\modules\\shop\\models\\Contragent','contragent','contragent_property','contragent_eav','contragent_category','contragent_category_slug','contragent_slug_static','slug'),(12,'OrderDeliveryInformation','app\\modules\\shop\\models\\OrderDeliveryInformation','order_delivery_information','order_delivery_information_property','order_delivery_information_eav','order_delivery_information_category','order_delivery_information_category_slug','order_delivery_information_slug_static','slug'),(13,'Navigation','app\\widgets\\navigation\\models\\Navigation','navigation','navigation_property','navigation_eav','navigation_category','navigation_category_full_slug','navigation_static_value_category','slug'),(14,'Addon','app\\modules\\shop\\models\\Addon','addon','addon_property','addon_eav','addon_category','addon_category_full_slug','addon_static_value_category','slug');
/*!40000 ALTER TABLE `object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_property_group`
--

DROP TABLE IF EXISTS `object_property_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_property_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-object_property_group-object_id-object_model_id` (`object_id`,`object_model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_property_group`
--

LOCK TABLES `object_property_group` WRITE;
/*!40000 ALTER TABLE `object_property_group` DISABLE KEYS */;
INSERT INTO `object_property_group` VALUES (1,5,1,3);
/*!40000 ALTER TABLE `object_property_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_static_values`
--

DROP TABLE IF EXISTS `object_static_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_static_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  `property_static_value_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-object-static-values-object_id-object_model_id` (`object_id`,`object_model_id`),
  KEY `ix-object_static_values-property_static_value_id` (`property_static_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_static_values`
--

LOCK TABLES `object_static_values` WRITE;
/*!40000 ALTER TABLE `object_static_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_static_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `manager_id` int(10) unsigned DEFAULT 0,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `cart_forming_time` int(11) DEFAULT 0,
  `order_stage_id` int(10) unsigned NOT NULL,
  `payment_type_id` int(10) unsigned DEFAULT 0,
  `assigned_id` int(10) unsigned DEFAULT NULL,
  `tax_id` int(10) unsigned DEFAULT NULL,
  `external_id` varchar(38) DEFAULT NULL,
  `items_count` float unsigned DEFAULT NULL,
  `total_price` float DEFAULT 0,
  `total_payed` float DEFAULT 0,
  `hash` char(32) NOT NULL,
  `is_deleted` tinyint(3) unsigned DEFAULT 0,
  `temporary` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `show_price_changed_notification` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0,
  `contragent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `in_cart` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq-order-hash` (`hash`),
  KEY `ix-order-user_id` (`user_id`),
  KEY `ix-order-manager_id` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_category`
--

DROP TABLE IF EXISTS `order_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_category`
--

LOCK TABLES `order_category` WRITE;
/*!40000 ALTER TABLE `order_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_chat`
--

DROP TABLE IF EXISTS `order_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `message` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-order_chat-order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_chat`
--

LOCK TABLES `order_chat` WRITE;
/*!40000 ALTER TABLE `order_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_code`
--

DROP TABLE IF EXISTS `order_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `discount_code_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_code`
--

LOCK TABLES `order_code` WRITE;
/*!40000 ALTER TABLE `order_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery_information`
--

DROP TABLE IF EXISTS `order_delivery_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `shipping_option_id` int(11) NOT NULL,
  `shipping_price` float NOT NULL DEFAULT 0,
  `shipping_price_total` float NOT NULL DEFAULT 0,
  `planned_delivery_date` date DEFAULT NULL,
  `planned_delivery_time` time DEFAULT NULL,
  `planned_delivery_time_range` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_information`
--

LOCK TABLES `order_delivery_information` WRITE;
/*!40000 ALTER TABLE `order_delivery_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_delivery_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery_information_eav`
--

DROP TABLE IF EXISTS `order_delivery_information_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery_information_eav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model_id` int(11) unsigned NOT NULL,
  `property_group_id` int(11) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_information_eav`
--

LOCK TABLES `order_delivery_information_eav` WRITE;
/*!40000 ALTER TABLE `order_delivery_information_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_delivery_information_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_discount`
--

DROP TABLE IF EXISTS `order_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `applied_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_discount`
--

LOCK TABLES `order_discount` WRITE;
/*!40000 ALTER TABLE `order_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_eav`
--

DROP TABLE IF EXISTS `order_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_eav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_model_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `object_model_id` (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_eav`
--

LOCK TABLES `order_eav` WRITE;
/*!40000 ALTER TABLE `order_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `order_id` int(10) unsigned DEFAULT 0,
  `product_id` int(10) unsigned NOT NULL,
  `custom_name` varchar(255) DEFAULT NULL,
  `quantity` float NOT NULL DEFAULT 1,
  `price_per_pcs` float NOT NULL DEFAULT 0,
  `total_price_without_discount` float NOT NULL DEFAULT 0,
  `lock_product_price` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `discount_amount` float NOT NULL DEFAULT 0,
  `total_price` float NOT NULL DEFAULT 0,
  `addon_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ix-order_item-order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_property`
--

DROP TABLE IF EXISTS `order_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_property` (
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_property`
--

LOCK TABLES `order_property` WRITE;
/*!40000 ALTER TABLE `order_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_stage`
--

DROP TABLE IF EXISTS `order_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_stage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_frontend` varchar(255) DEFAULT NULL,
  `name_short` varchar(255) DEFAULT NULL,
  `is_initial` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `is_buyer_stage` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `become_non_temporary` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `is_in_cart` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `immutable_by_user` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `immutable_by_manager` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `immutable_by_assigned` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `reach_goal_ym` varchar(255) DEFAULT NULL,
  `reach_goal_ga` varchar(255) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_stage`
--

LOCK TABLES `order_stage` WRITE;
/*!40000 ALTER TABLE `order_stage` DISABLE KEYS */;
INSERT INTO `order_stage` VALUES (1,'customer','Your information','customer',1,1,0,1,0,0,0,'','','order_stage_customer','@app/modules/shop/views/cart/stages/name.php'),(2,'delivery','Delivery','delivery',0,1,0,1,0,0,0,'','','order_stage_delivery','@app/modules/shop/views/cart/stages/delivery.php'),(3,'payment','Payment method selection','payment',0,1,0,1,0,0,0,'','','order_stage_payment','@app/modules/shop/views/cart/stages/payment.php'),(4,'payment pay','Payment','payment pay',0,0,1,0,0,0,0,'','','order_stage_payment_pay','@app/modules/shop/views/cart/stages/pay.php'),(5,'final','Order complete','final',0,0,0,0,1,1,1,'','','order_stage_final','');
/*!40000 ALTER TABLE `order_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_stage_leaf`
--

DROP TABLE IF EXISTS `order_stage_leaf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_stage_leaf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stage_from_id` int(10) unsigned NOT NULL,
  `stage_to_id` int(10) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `button_label` varchar(255) NOT NULL,
  `button_css_class` varchar(255) DEFAULT NULL,
  `notify_buyer` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `buyer_notification_view` varchar(255) DEFAULT NULL,
  `notify_manager` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `manager_notification_view` varchar(255) DEFAULT NULL,
  `assign_to_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `assign_to_role` varchar(255) DEFAULT NULL,
  `notify_new_assigned_user` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `role_assignment_policy` enum('random','fair_distribution','last_picked_from_role') DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_stage_leaf`
--

LOCK TABLES `order_stage_leaf` WRITE;
/*!40000 ALTER TABLE `order_stage_leaf` DISABLE KEYS */;
INSERT INTO `order_stage_leaf` VALUES (1,1,2,0,'Delivery method selection','btn btn-primary',0,NULL,0,NULL,0,NULL,0,'random','order_stageleaf_customer'),(2,2,3,0,'Payment method selection','btn btn-primary',0,NULL,0,NULL,0,NULL,0,'random','order_stageleaf_delivery_choose'),(3,3,4,0,'Go to payment','btn btn-success',0,NULL,1,NULL,0,NULL,0,'random','order_stageleaf_payment_choose'),(4,5,4,0,'Order complete','btn btn-primary',0,NULL,0,NULL,0,NULL,0,'random','order_stage_leaf_final');
/*!40000 ALTER TABLE `order_stage_leaf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transaction`
--

DROP TABLE IF EXISTS `order_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `payment_type_id` int(10) unsigned NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `total_sum` decimal(10,2) NOT NULL,
  `params` text DEFAULT NULL,
  `result_data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-order_transaction-order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transaction`
--

LOCK TABLES `order_transaction` WRITE;
/*!40000 ALTER TABLE `order_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `slug` varchar(80) NOT NULL,
  `slug_compiled` varchar(180) NOT NULL DEFAULT '',
  `slug_absolute` tinyint(1) unsigned DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `show_type` enum('show','list') DEFAULT 'show',
  `published` tinyint(1) unsigned DEFAULT 1,
  `searchable` tinyint(1) unsigned DEFAULT 1,
  `robots` tinyint(3) unsigned DEFAULT 3,
  `name` varchar(255) DEFAULT NULL,
  `title` text NOT NULL,
  `h1` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `breadcrumbs_label` text DEFAULT NULL,
  `announce` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NULL DEFAULT NULL,
  `subdomain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-page-slug_compiled-published` (`slug_compiled`,`published`),
  KEY `ix-page-parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,':mainpage:','',0,'This is main page!','show',1,1,3,NULL,'Main page',NULL,NULL,NULL,NULL,0,'2026-09-30 09:43:51',NULL,NULL),(2,1,'about','about',0,'This is a sample about page','show',1,1,3,'About us','About us','About us','Example META for About us','About us',NULL,0,'2026-09-30 09:43:51',NULL,NULL),(3,1,'delivery','delivery',0,'Place your delivery information here','show',1,1,3,'Delivery','Delivery','Delivery','Example META for Delivery','Delivery',NULL,0,'2026-09-30 09:43:51',NULL,NULL),(4,1,'payment','payment',0,'Place your PAYMENT information here','show',1,1,3,'Payment','Payment','Payment','Example META for Payment','Payment',NULL,0,'2026-09-30 09:43:51',NULL,NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_category`
--

DROP TABLE IF EXISTS `page_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_category`
--

LOCK TABLES `page_category` WRITE;
/*!40000 ALTER TABLE `page_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_eav`
--

DROP TABLE IF EXISTS `page_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_eav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_model_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `object_model_id` (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_eav`
--

LOCK TABLES `page_eav` WRITE;
/*!40000 ALTER TABLE `page_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_property`
--

DROP TABLE IF EXISTS `page_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_property` (
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_property`
--

LOCK TABLES `page_property` WRITE;
/*!40000 ALTER TABLE `page_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `params` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `commission` float DEFAULT 0,
  `active` tinyint(4) DEFAULT 0,
  `payment_available` tinyint(4) DEFAULT 1,
  `sort` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `ix-payment_type-active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'Cash','app\\components\\payment\\CashPayment','[]',NULL,0,1,1,1),(2,'Robokassa','app\\components\\payment\\RobokassaPayment','{\"merchantLogin\":\"\",\"merchantPass1\":\"\",\"merchantPass2\":\"\",\"merchantUrl\":\"\"}',NULL,0,1,1,2),(3,'PayU','app\\components\\payment\\PayUPayment','{\"merchantName\":\"\",\"secretKey\":\"\"}',NULL,0,0,1,3),(4,'RBK Money','app\\components\\payment\\RBKMoneyPayment','{\"eshopId\":\"\",\"currency\":\"RUR\",\"language\":\"ru\",\"secretKey\":\"\",\"serviceName\":\"\"}',NULL,0,0,1,4),(5,'IntellectMoney','app\\components\\payment\\IntellectMoneyPayment','{\"eshopId\":\"\",\"currency\":\"RUR\",\"language\":\"ru\",\"secretKey\":\"\",\"serviceName\":\"\"}',NULL,0,0,1,5),(6,'Interkassa','app\\components\\payment\\InterkassaPayment','{\"checkoutId\":\"\",\"currency\":\"RUB\",\"locale\":\"ru\",\"secretKey\":\"\"}',NULL,0,0,1,6),(7,'Futubank','app\\components\\payment\\FutubankPayment','{\"testing\":\"1\",\"merchant\":\"\",\"currency\":\"RUB\",\"secretKey\":\"\"}',NULL,0,0,1,7),(8,'Pay2Pay','app\\components\\payment\\Pay2PayPayment','{\"hiddenKey\":\"\",\"currency\":\"RUB\",\"language\":\"ru\",\"merchantId\":\"\",\"secretKey\":\"\",\"testMode\":0}',NULL,0,0,1,8),(9,'SpryPay','app\\components\\payment\\SpryPayPayment','{\"currency\":\"rur\",\"language\":\"ru\",\"shopId\":\"\",\"secretKey\":\"\"}',NULL,0,0,1,9),(10,'WalletOne','app\\components\\payment\\WalletOnePayment','{\"currency\":643,\"locale\":\"ru-RU\",\"merchantId\":\"\",\"secretKey\":\"\"}',NULL,0,0,1,10),(11,'PayOnline','app\\components\\payment\\PayOnlinePayment','{\"currency\":\"RUB\",\"language\":\"ru\",\"merchantId\":\"\",\"privateKey\":\"\"}',NULL,0,0,1,11),(12,'LiqPay','app\\components\\payment\\LiqPayPayment','{\"currency\":\"RUB\",\"language\":\"ru\",\"privateKey\":\"\",\"publicKey\":\"\"}',NULL,0,0,1,12),(13,'Platron','{{%payment_type}}','{\"merchantId\":\"\",\"secretKey\":\"\",\"strCurrency\":\"RUR\",\"merchantUrl\":\"www.platron.ru\",\"merchantScriptName\":\"payment.php\"}',NULL,0,0,1,13),(14,'PayPal','app\\components\\payment\\PayPalPayment','{\"clientId\":\"\",\"clientSecret\":\"\",\"currency\":\"\",\"transactionDescription\":\"\",\"sandbox\":false}','',0,0,0,0);
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefiltered_pages`
--

DROP TABLE IF EXISTS `prefiltered_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prefiltered_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `last_category_id` int(10) unsigned NOT NULL DEFAULT 0,
  `params` text DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `announce` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `h1` varchar(255) NOT NULL DEFAULT '',
  `meta_description` varchar(255) NOT NULL DEFAULT '',
  `breadcrumbs_label` varchar(255) NOT NULL DEFAULT '',
  `view_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefiltered_pages`
--

LOCK TABLES `prefiltered_pages` WRITE;
/*!40000 ALTER TABLE `prefiltered_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `prefiltered_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `main_category_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT 0,
  `option_generate` text DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `h1` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `breadcrumbs_label` varchar(255) DEFAULT NULL,
  `slug` varchar(80) DEFAULT '',
  `slug_compiled` varchar(180) DEFAULT '',
  `slug_absolute` tinyint(4) DEFAULT 0,
  `content` text DEFAULT NULL,
  `announce` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `active` tinyint(4) DEFAULT 1,
  `price` float unsigned DEFAULT 0,
  `old_price` float unsigned DEFAULT 0,
  `sku` varchar(70) NOT NULL DEFAULT '',
  `unlimited_count` tinyint(4) NOT NULL DEFAULT 1,
  `currency_id` int(10) unsigned NOT NULL DEFAULT 1,
  `measure_id` int(10) unsigned NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-product-active-slug` (`active`,`slug`),
  KEY `ix-product-parent_id` (`parent_id`),
  KEY `sku` (`sku`),
  KEY `parent_active` (`parent_id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cat_omid` (`category_id`,`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_full_slug`
--

DROP TABLE IF EXISTS `product_category_full_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_full_slug` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `full_slug_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_full_slug`
--

LOCK TABLES `product_category_full_slug` WRITE;
/*!40000 ALTER TABLE `product_category_full_slug` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category_full_slug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_discount`
--

DROP TABLE IF EXISTS `product_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_discount`
--

LOCK TABLES `product_discount` WRITE;
/*!40000 ALTER TABLE `product_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_eav`
--

DROP TABLE IF EXISTS `product_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_eav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_model_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `object_model_id` (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_eav`
--

LOCK TABLES `product_eav` WRITE;
/*!40000 ALTER TABLE `product_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_listing_sort`
--

DROP TABLE IF EXISTS `product_listing_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_listing_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort_field` varchar(255) NOT NULL,
  `asc_desc` enum('asc','desc') NOT NULL DEFAULT 'asc',
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `sort_order` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_listing_sort`
--

LOCK TABLES `product_listing_sort` WRITE;
/*!40000 ALTER TABLE `product_listing_sort` DISABLE KEYS */;
INSERT INTO `product_listing_sort` VALUES (1,'Popularity','product.sort_order','asc',1,0),(2,'Price 0-9','product.price','asc',1,1),(3,'Price 9-0','product.price','desc',1,2),(4,'Name','product.name','asc',1,3),(5,'Name','product.name','desc',1,4);
/*!40000 ALTER TABLE `product_listing_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_property`
--

DROP TABLE IF EXISTS `product_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_property` (
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_property`
--

LOCK TABLES `product_property` WRITE;
/*!40000 ALTER TABLE `product_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_static_value_full_slug`
--

DROP TABLE IF EXISTS `product_static_value_full_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_static_value_full_slug` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_slug_id` int(10) unsigned NOT NULL,
  `property_static_value_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_static_value_id` (`property_static_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_static_value_full_slug`
--

LOCK TABLES `product_static_value_full_slug` WRITE;
/*!40000 ALTER TABLE `product_static_value_full_slug` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_static_value_full_slug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_group_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `key` varchar(20) DEFAULT '',
  `value_type` enum('STRING','NUMBER') DEFAULT 'STRING',
  `property_handler_id` int(10) unsigned NOT NULL,
  `has_static_values` tinyint(4) DEFAULT 0,
  `has_slugs_in_values` tinyint(4) DEFAULT 0,
  `is_eav` tinyint(4) DEFAULT 0,
  `is_column_type_stored` tinyint(4) DEFAULT 0,
  `multiple` tinyint(4) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  `handler_additional_params` text NOT NULL,
  `display_only_on_depended_property_selected` tinyint(4) DEFAULT 0,
  `depends_on_property_id` int(11) DEFAULT 0,
  `depended_property_values` text DEFAULT NULL,
  `depends_on_category_group_id` int(11) DEFAULT 0,
  `hide_other_values_if_selected` tinyint(4) DEFAULT 0,
  `dont_filter` tinyint(1) NOT NULL DEFAULT 0,
  `mask` varchar(255) DEFAULT NULL,
  `alias` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-property-property_group_id` (`property_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,1,'Name','name','STRING',1,0,0,1,0,0,0,'{\"rules\":[\"required\"]}',0,0,NULL,0,0,0,NULL,NULL),(2,1,'Phone','phone','STRING',1,0,0,1,0,0,0,'{\"rules\":[\"required\"]}',0,0,NULL,0,0,0,NULL,NULL),(3,1,'E-mail','email','STRING',1,0,0,1,0,0,0,'{\"rules\":[\"required\"]}',0,0,NULL,0,0,0,NULL,NULL),(4,1,'Address','address','STRING',1,0,0,1,0,0,0,'{\"rules\":[\"required\"]}',0,0,NULL,0,0,0,NULL,NULL),(5,3,'Name','name','STRING',1,0,0,1,0,0,0,'{\"interpret_as\":null,\"rules\":[]}',0,0,NULL,0,0,0,NULL,NULL),(6,3,'Phone','phone','STRING',1,0,0,1,0,0,0,'{\"interpret_as\":null,\"rules\":[]}',0,0,NULL,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_category`
--

DROP TABLE IF EXISTS `property_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_category` (
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_category`
--

LOCK TABLES `property_category` WRITE;
/*!40000 ALTER TABLE `property_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_group`
--

DROP TABLE IF EXISTS `property_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_internal` tinyint(4) DEFAULT 0,
  `hidden_group_title` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ix-property_group-object_id` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_group`
--

LOCK TABLES `property_group` WRITE;
/*!40000 ALTER TABLE `property_group` DISABLE KEYS */;
INSERT INTO `property_group` VALUES (1,4,'Order form',0,0,1),(2,7,'User form',0,0,0),(3,5,'Review form additional properties',0,0,1);
/*!40000 ALTER TABLE `property_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_handler`
--

DROP TABLE IF EXISTS `property_handler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_handler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `frontend_render_view` varchar(255) NOT NULL,
  `frontend_edit_view` varchar(255) NOT NULL,
  `backend_render_view` varchar(255) NOT NULL,
  `backend_edit_view` varchar(255) NOT NULL,
  `handler_class_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_handler`
--

LOCK TABLES `property_handler` WRITE;
/*!40000 ALTER TABLE `property_handler` DISABLE KEYS */;
INSERT INTO `property_handler` VALUES (1,'Text','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\text\\TextProperty'),(2,'Select','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\select\\SelectProperty'),(3,'Checkbox','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\checkbox\\CheckboxProperty'),(4,'Text area','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\textArea\\TextAreaProperty'),(5,'File','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\fileInput\\FileInputProperty'),(6,'Hidden','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\hidden\\HiddenProperty'),(7,'Redactor','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\redactor\\RedactorProperty'),(8,'DatePicker','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\datepicker\\DatepickerProperty'),(9,'MaskedInput','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\maskedinput\\MaskedinputProperty'),(10,'Product relation','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\productRelation\\ProductRelationProperty'),(11,'Json editor','frontend-render','frontend-edit','backend-render','backend-edit','app\\properties\\handlers\\json\\JsonProperty');
/*!40000 ALTER TABLE `property_handler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_static_values`
--

DROP TABLE IF EXISTS `property_static_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_static_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `title_append` varchar(255) DEFAULT NULL,
  `dont_filter` tinyint(1) NOT NULL DEFAULT 0,
  `title_prepend` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ix-property_static_values-property_id` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_static_values`
--

LOCK TABLES `property_static_values` WRITE;
/*!40000 ALTER TABLE `property_static_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_static_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_item`
--

DROP TABLE IF EXISTS `rating_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rating_group` varchar(255) NOT NULL,
  `min_value` int(11) NOT NULL DEFAULT 0,
  `max_value` int(11) NOT NULL DEFAULT 5,
  `step_value` int(11) NOT NULL DEFAULT 1,
  `require_review` tinyint(1) DEFAULT 0,
  `allow_guest` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_item`
--

LOCK TABLES `rating_item` WRITE;
/*!40000 ALTER TABLE `rating_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_values`
--

DROP TABLE IF EXISTS `rating_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  `rating_item_id` int(10) unsigned NOT NULL,
  `value` int(11) NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-rating_values-rating_id` (`rating_id`),
  KEY `ix-rating_values-object_id-object_model_id` (`object_id`,`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_values`
--

LOCK TABLES `rating_values` WRITE;
/*!40000 ALTER TABLE `rating_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_product`
--

DROP TABLE IF EXISTS `related_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `related_product` (
  `product_id` int(10) unsigned NOT NULL,
  `related_product_id` int(10) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`,`related_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_product`
--

LOCK TABLES `related_product` WRITE;
/*!40000 ALTER TABLE `related_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `related_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned DEFAULT 0,
  `object_model_id` int(10) unsigned NOT NULL,
  `author_email` varchar(255) DEFAULT NULL,
  `review_text` text DEFAULT NULL,
  `status` enum('NEW','APPROVED','NOT APPROVED') DEFAULT 'NEW',
  `rating_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `submission_id` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `root_id` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ix-review-object_id-object_model_id-status` (`object_id`,`object_model_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `route` varchar(255) NOT NULL,
  `url_template` text DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'shop/product/list','[{\"class\":\"app\\\\properties\\\\url\\\\StaticPart\",\"static_part\":\"catalog\",\"parameters\":{\"category_group_id\":1}},{\"class\":\"app\\\\properties\\\\url\\\\PartialCategoryPathPart\",\"category_group_id\":1}]',3,''),(2,'shop/product/show','[{\"class\":\"app\\\\properties\\\\url\\\\StaticPart\",\"static_part\":\"catalog\",\"parameters\":{\"category_group_id\":1}},{\"class\":\"app\\\\properties\\\\url\\\\FullCategoryPathPart\",\"category_group_id\":1},{\"class\":\"app\\\\properties\\\\url\\\\ObjectSlugPart\"}]',3,'');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_config`
--

DROP TABLE IF EXISTS `seo_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_config` (
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_config`
--

LOCK TABLES `seo_config` WRITE;
/*!40000 ALTER TABLE `seo_config` DISABLE KEYS */;
INSERT INTO `seo_config` VALUES ('robots.txt','User-agent: *\nDisallow: /cabinet\n');
/*!40000 ALTER TABLE `seo_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_counter`
--

DROP TABLE IF EXISTS `seo_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_counter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `code` text NOT NULL,
  `position` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_counter`
--

LOCK TABLES `seo_counter` WRITE;
/*!40000 ALTER TABLE `seo_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_meta`
--

DROP TABLE IF EXISTS `seo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_meta` (
  `key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_meta`
--

LOCK TABLES `seo_meta` WRITE;
/*!40000 ALTER TABLE `seo_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_redirect`
--

DROP TABLE IF EXISTS `seo_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_redirect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('STATIC','PREG') NOT NULL DEFAULT 'STATIC',
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_redirect`
--

LOCK TABLES `seo_redirect` WRITE;
/*!40000 ALTER TABLE `seo_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` char(40) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_discount`
--

DROP TABLE IF EXISTS `shipping_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_option_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_discount`
--

LOCK TABLES `shipping_discount` WRITE;
/*!40000 ALTER TABLE `shipping_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_option`
--

DROP TABLE IF EXISTS `shipping_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price_from` float DEFAULT 0,
  `price_to` float DEFAULT 0,
  `cost` float DEFAULT 0,
  `sort` int(11) DEFAULT 0,
  `active` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ix-shipping_option-active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_option`
--

LOCK TABLES `shipping_option` WRITE;
/*!40000 ALTER TABLE `shipping_option` DISABLE KEYS */;
INSERT INTO `shipping_option` VALUES (1,'Self-pickup','',0,0,0,1,1),(2,'Delivery of mail','',0,0,100,2,1);
/*!40000 ALTER TABLE `shipping_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitemap` (
  `uid` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap`
--

LOCK TABLES `sitemap` WRITE;
/*!40000 ALTER TABLE `sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slide`
--

DROP TABLE IF EXISTS `slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned DEFAULT 0,
  `sort_order` int(10) unsigned DEFAULT 0,
  `image` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `custom_view_file` varchar(255) NOT NULL DEFAULT '',
  `css_class` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `text` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slide`
--

LOCK TABLES `slide` WRITE;
/*!40000 ALTER TABLE `slide` DISABLE KEYS */;
INSERT INTO `slide` VALUES (1,1,1,'http://st-1.dotplant.ru/img/dotplant-slider-demo/slide-1.jpg','#1','','',1,NULL),(2,1,2,'http://st-1.dotplant.ru/img/dotplant-slider-demo/slide-2.jpg','#2','','',1,NULL),(3,1,3,'http://st-1.dotplant.ru/img/dotplant-slider-demo/slide-3.jpg','#3','','',1,NULL);
/*!40000 ALTER TABLE `slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `slider_handler_id` int(10) unsigned DEFAULT 0,
  `image_width` int(10) unsigned DEFAULT 300,
  `image_height` int(10) unsigned DEFAULT 300,
  `resize_big_images` tinyint(1) NOT NULL DEFAULT 1,
  `resize_small_images` tinyint(1) NOT NULL DEFAULT 0,
  `css_class` varchar(255) NOT NULL DEFAULT '',
  `params` longtext DEFAULT NULL,
  `custom_slider_view_file` varchar(255) NOT NULL DEFAULT '',
  `custom_slide_view_file` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (1,'Example carousel',1,900,350,1,0,'',NULL,'','');
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider_handler`
--

DROP TABLE IF EXISTS `slider_handler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider_handler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `slider_widget` varchar(255) NOT NULL DEFAULT '',
  `slider_edit_view_file` varchar(255) NOT NULL DEFAULT '',
  `edit_model` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider_handler`
--

LOCK TABLES `slider_handler` WRITE;
/*!40000 ALTER TABLE `slider_handler` DISABLE KEYS */;
INSERT INTO `slider_handler` VALUES (1,'Bootstrap 3 carousel','app\\slider\\sliders\\bootstrap3\\Bootstrap3CarouselWidget','@app/slider/sliders/bootstrap3/views/edit','app\\slider\\sliders\\bootstrap3\\models\\EditModel'),(2,'Slick','app\\slider\\sliders\\slick\\SlickCarouselWidget','@app/slider/sliders/slick/views/edit','app\\slider\\sliders\\slick\\models\\EditModel');
/*!40000 ALTER TABLE `slider_handler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spam_checker`
--

DROP TABLE IF EXISTS `spam_checker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spam_checker` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `behavior` varchar(255) NOT NULL,
  `api_key` varchar(90) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `author_field` varchar(50) DEFAULT NULL,
  `content_field` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spam_checker`
--

LOCK TABLES `spam_checker` WRITE;
/*!40000 ALTER TABLE `spam_checker` DISABLE KEYS */;
INSERT INTO `spam_checker` VALUES (1,'app\\behaviors\\spamchecker\\AkismetSpamChecker',NULL,'Akismet','comment_author','comment_content');
/*!40000 ALTER TABLE `spam_checker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_price_list`
--

DROP TABLE IF EXISTS `special_price_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_price_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` smallint(6) NOT NULL,
  `class` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `params` text DEFAULT NULL,
  `type` enum('core','discount','delivery','tax','project') DEFAULT 'project',
  `handler` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_price_list`
--

LOCK TABLES `special_price_list` WRITE;
/*!40000 ALTER TABLE `special_price_list` DISABLE KEYS */;
INSERT INTO `special_price_list` VALUES (1,3,'app\\modules\\shop\\helpers\\PriceHandlers',1,5,NULL,'core','getCurrencyPriceProduct'),(2,4,'app\\modules\\shop\\helpers\\PriceHandlers',1,10,NULL,'delivery','getDeliveryPriceOrder'),(3,3,'app\\modules\\shop\\helpers\\PriceHandlers',1,15,NULL,'discount','getDiscountPriceProduct'),(4,4,'app\\modules\\shop\\helpers\\PriceHandlers',1,20,NULL,'discount','getDiscountPriceOrder');
/*!40000 ALTER TABLE `special_price_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_price_object`
--

DROP TABLE IF EXISTS `special_price_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_price_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `special_price_list_id` int(11) NOT NULL,
  `object_model_id` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_price_object`
--

LOCK TABLES `special_price_object` WRITE;
/*!40000 ALTER TABLE `special_price_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_price_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL,
  `date_received` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `piwik_visitor_id` varchar(255) DEFAULT NULL,
  `additional_information` longtext DEFAULT NULL,
  `date_viewed` datetime DEFAULT NULL,
  `date_processed` datetime DEFAULT NULL,
  `processed_by_user_id` int(10) unsigned DEFAULT NULL,
  `processed` tinyint(1) DEFAULT 0,
  `internal_comment` text DEFAULT NULL,
  `submission_referrer` varchar(255) DEFAULT NULL,
  `visitor_referrer` varchar(255) DEFAULT NULL,
  `visitor_landing` varchar(255) DEFAULT NULL,
  `visit_start_date` datetime DEFAULT NULL,
  `form_fill_time` int(11) DEFAULT NULL,
  `spam` tinyint(1) unsigned DEFAULT 0,
  `is_deleted` tinyint(3) unsigned DEFAULT 0,
  `sending_status` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `submission-form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_category`
--

DROP TABLE IF EXISTS `submission_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_category`
--

LOCK TABLES `submission_category` WRITE;
/*!40000 ALTER TABLE `submission_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_eav`
--

DROP TABLE IF EXISTS `submission_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_eav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_model_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `object_model_id` (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_eav`
--

LOCK TABLES `submission_eav` WRITE;
/*!40000 ALTER TABLE `submission_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_property`
--

DROP TABLE IF EXISTS `submission_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_property` (
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_property`
--

LOCK TABLES `submission_property` WRITE;
/*!40000 ALTER TABLE `submission_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe_email`
--

DROP TABLE IF EXISTS `subscribe_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribe_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 0,
  `last_notify` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe_email`
--

LOCK TABLES `subscribe_email` WRITE;
/*!40000 ALTER TABLE `subscribe_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_active_widgets`
--

DROP TABLE IF EXISTS `theme_active_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_active_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `variation_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `configuration_json` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation` (`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_active_widgets`
--

LOCK TABLES `theme_active_widgets` WRITE;
/*!40000 ALTER TABLE `theme_active_widgets` DISABLE KEYS */;
INSERT INTO `theme_active_widgets` VALUES (1,2,1,2,0,NULL),(2,2,1,1,0,NULL),(3,4,3,1,0,NULL),(4,6,3,3,0,NULL),(5,10,8,1,0,NULL),(6,10,8,2,0,NULL),(7,5,4,2,0,NULL);
/*!40000 ALTER TABLE `theme_active_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_parts`
--

DROP TABLE IF EXISTS `theme_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `global_visibility` tinyint(1) NOT NULL DEFAULT 1,
  `multiple_widgets` tinyint(1) NOT NULL DEFAULT 1,
  `is_cacheable` tinyint(1) NOT NULL DEFAULT 1,
  `cache_lifetime` int(11) NOT NULL DEFAULT 0,
  `cache_tags` text DEFAULT NULL,
  `cache_vary_by_session` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_parts`
--

LOCK TABLES `theme_parts` WRITE;
/*!40000 ALTER TABLE `theme_parts` DISABLE KEYS */;
INSERT INTO `theme_parts` VALUES (1,'Pre-Header','pre-header',1,1,1,86400,'\\app\\widgets\\navigation\\models\\Navigation',0),(2,'Header','header',1,0,0,0,'\\app\\widgets\\navigation\\models\\Navigation',0),(3,'Post-Header','post-header',1,1,1,86400,'\\app\\widgets\\navigation\\models\\Navigation',0),(4,'Before content','before-content',1,1,1,0,NULL,0),(5,'Left sidebar','left-sidebar',1,1,0,0,NULL,0),(6,'Before inner-content','before-inner-content',1,1,0,0,NULL,0),(7,'After inner-content','after-inner-content',1,1,0,0,NULL,0),(8,'Right sidebar','right-sidebar',1,1,0,0,NULL,0),(9,'Pre-footer','pre-footer',1,1,1,86400,NULL,0),(10,'Footer','footer',1,1,1,86400,NULL,0),(11,'Post-footer','post-footer',1,1,1,86400,NULL,0);
/*!40000 ALTER TABLE `theme_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_variation`
--

DROP TABLE IF EXISTS `theme_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_variation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `by_url` varchar(255) DEFAULT NULL,
  `by_route` varchar(255) DEFAULT NULL,
  `matcher_class_name` varchar(255) DEFAULT NULL,
  `exclusive` tinyint(1) NOT NULL DEFAULT 0,
  `omit_get_params` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_variation`
--

LOCK TABLES `theme_variation` WRITE;
/*!40000 ALTER TABLE `theme_variation` DISABLE KEYS */;
INSERT INTO `theme_variation` VALUES (1,'Main page','/',NULL,NULL,0,0),(2,'Non main page','/*',NULL,NULL,0,0),(3,'Product listing',NULL,'shop/product/list',NULL,0,0),(4,'Product page(show)',NULL,'shop/product/show',NULL,0,0),(5,'Content page listing',NULL,'page/page/list',NULL,0,0),(6,'Content page(show)',NULL,'page/page/show',NULL,0,0);
/*!40000 ALTER TABLE `theme_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_widget_applying`
--

DROP TABLE IF EXISTS `theme_widget_applying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_widget_applying` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widget_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widget_part` (`widget_id`,`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_widget_applying`
--

LOCK TABLES `theme_widget_applying` WRITE;
/*!40000 ALTER TABLE `theme_widget_applying` DISABLE KEYS */;
INSERT INTO `theme_widget_applying` VALUES (1,1,2),(2,2,2),(3,3,4),(4,3,6),(5,4,5),(6,4,8),(7,5,5),(8,5,8),(9,6,5),(10,6,8),(11,7,5),(12,7,8),(13,8,9),(14,8,10),(15,8,11),(16,9,5),(17,9,8),(18,10,7),(19,10,9);
/*!40000 ALTER TABLE `theme_widget_applying` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_widgets`
--

DROP TABLE IF EXISTS `theme_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `widget` varchar(255) DEFAULT NULL,
  `preview_image` varchar(255) DEFAULT NULL,
  `configuration_model` varchar(255) DEFAULT NULL,
  `configuration_view` varchar(255) DEFAULT NULL,
  `configuration_json` text DEFAULT NULL,
  `is_cacheable` tinyint(1) NOT NULL DEFAULT 1,
  `cache_lifetime` int(11) NOT NULL DEFAULT 0,
  `cache_tags` text DEFAULT NULL,
  `cache_vary_by_session` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_widgets`
--

LOCK TABLES `theme_widgets` WRITE;
/*!40000 ALTER TABLE `theme_widgets` DISABLE KEYS */;
INSERT INTO `theme_widgets` VALUES (1,'1-row header with logo, nav and popup cart','app\\extensions\\DefaultTheme\\widgets\\OneRowHeaderWithCart\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\OneRowHeaderWithCart\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/OneRowHeaderWithCart/views/_config.php','{}',1,86400,NULL,1),(2,'1-row header with logo, nav','app\\extensions\\DefaultTheme\\widgets\\OneRowHeader\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\OneRowHeader\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/OneRowHeader/views/_config.php','{}',1,86400,NULL,0),(3,'Slider','app\\extensions\\DefaultTheme\\widgets\\Slider\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\Slider\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/Slider/views/_config.php','{}',1,86400,NULL,0),(4,'Categories list','app\\extensions\\DefaultTheme\\widgets\\CategoriesList\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\CategoriesList\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/CategoriesList/views/_config.php','{}',0,0,'app\\modules\\shop\\models\\Category',0),(5,'Filter widget','app\\extensions\\DefaultTheme\\widgets\\FilterSets\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\FilterSets\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/FilterSets/views/_config.php','{}',0,0,'',0),(6,'Pages list','app\\extensions\\DefaultTheme\\widgets\\PagesList\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\PagesList\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/PagesList/views/_config.php','{}',1,86400,'app\\modules\\page\\models\\Page',0),(7,'Content block','app\\extensions\\DefaultTheme\\widgets\\ContentBlock\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\ContentBlock\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/ContentBlock/views/_config.php','{}',1,86400,'app\\modules\\page\\models\\Page',0),(8,'Footer','app\\extensions\\DefaultTheme\\widgets\\Footer\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\Footer\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/Footer/views/_config.php','{}',1,0,'',0),(9,'Navigation','app\\extensions\\DefaultTheme\\widgets\\Navigation\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\Navigation\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/Navigation/views/_config.php','{}',1,0,'',0),(10,'Last Viewed Products','app\\extensions\\DefaultTheme\\widgets\\LastViewedProducts\\Widget',NULL,'app\\extensions\\DefaultTheme\\widgets\\LastViewedProducts\\ConfigurationModel','@app/extensions/DefaultTheme/widgets/LastViewedProducts/views/_config.php','{}',0,0,'',0);
/*!40000 ALTER TABLE `theme_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail`
--

DROP TABLE IF EXISTS `thumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `thumbnail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_id` int(10) unsigned NOT NULL,
  `thumb_path` varchar(255) NOT NULL,
  `size_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail`
--

LOCK TABLES `thumbnail` WRITE;
/*!40000 ALTER TABLE `thumbnail` DISABLE KEYS */;
/*!40000 ALTER TABLE `thumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_size`
--

DROP TABLE IF EXISTS `thumbnail_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `thumbnail_size` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `default_watermark_id` int(10) unsigned DEFAULT NULL,
  `resize_mode` enum('inset','outbound','resize') DEFAULT 'inset',
  `quality` tinyint(1) unsigned DEFAULT 90,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_size`
--

LOCK TABLES `thumbnail_size` WRITE;
/*!40000 ALTER TABLE `thumbnail_size` DISABLE KEYS */;
INSERT INTO `thumbnail_size` VALUES (1,80,80,NULL,'inset',90);
/*!40000 ALTER TABLE `thumbnail_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_watermark`
--

DROP TABLE IF EXISTS `thumbnail_watermark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `thumbnail_watermark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thumb_id` int(10) unsigned NOT NULL,
  `water_id` int(10) unsigned NOT NULL,
  `compiled_src` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_watermark`
--

LOCK TABLES `thumbnail_watermark` WRITE;
/*!40000 ALTER TABLE `thumbnail_watermark` DISABLE KEYS */;
/*!40000 ALTER TABLE `thumbnail_watermark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varbinary(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` binary(43) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned DEFAULT 10,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username_is_temporary` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq-user-username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','w3jHEi5EgJW10XPDzNx94BPiiUy1Yqhx','$2y$13$bWx2.YFgg7Pr4fCJvgmlxuqtLGDLvlv.BqrzKSR5KiumgixBu485S',NULL,'admin@example.com',10,1790761449,1790761449,NULL,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_category`
--

DROP TABLE IF EXISTS `user_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_category`
--

LOCK TABLES `user_category` WRITE;
/*!40000 ALTER TABLE `user_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_discount`
--

DROP TABLE IF EXISTS `user_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_discount`
--

LOCK TABLES `user_discount` WRITE;
/*!40000 ALTER TABLE `user_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_eav`
--

DROP TABLE IF EXISTS `user_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_eav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_model_id` int(10) unsigned NOT NULL,
  `property_group_id` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `object_model_id` (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_eav`
--

LOCK TABLES `user_eav` WRITE;
/*!40000 ALTER TABLE `user_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_property`
--

DROP TABLE IF EXISTS `user_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_property` (
  `object_model_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_property`
--

LOCK TABLES `user_property` WRITE;
/*!40000 ALTER TABLE `user_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_service`
--

DROP TABLE IF EXISTS `user_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `service_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq-user-service-service_type-service_id` (`service_type`,`service_id`),
  KEY `ix-user_service-user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_service`
--

LOCK TABLES `user_service` WRITE;
/*!40000 ALTER TABLE `user_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view`
--

DROP TABLE IF EXISTS `view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `view` text NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `internal_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix-view-internal_name-category` (`internal_name`,`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view`
--

LOCK TABLES `view` WRITE;
/*!40000 ALTER TABLE `view` DISABLE KEYS */;
INSERT INTO `view` VALUES (1,'Default','default','app','default');
/*!40000 ALTER TABLE `view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_object`
--

DROP TABLE IF EXISTS `view_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_object` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `object_model_id` int(10) unsigned NOT NULL,
  `view_id` int(10) unsigned NOT NULL,
  `child_view_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq-view_object-object_id-object_model_id` (`object_id`,`object_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_object`
--

LOCK TABLES `view_object` WRITE;
/*!40000 ALTER TABLE `view_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `country_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `map_latitude` varchar(255) NOT NULL DEFAULT '',
  `map_longitude` varchar(255) NOT NULL DEFAULT '',
  `shipping_center` tinyint(1) NOT NULL DEFAULT 1,
  `issuing_center` tinyint(1) NOT NULL DEFAULT 1,
  `xml_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `wh_country` (`country_id`),
  KEY `wh_city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Main warehouse',1,1,1,'Kremlin',NULL,0,'','',1,1,''),(2,'Second warehouse',1,2,3,'The WallStreet hidden warehouse',NULL,0,'','',1,1,'');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_email`
--

DROP TABLE IF EXISTS `warehouse_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wh_email` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_email`
--

LOCK TABLES `warehouse_email` WRITE;
/*!40000 ALTER TABLE `warehouse_email` DISABLE KEYS */;
INSERT INTO `warehouse_email` VALUES (1,1,0,'moscow@example.com','Sales'),(2,2,0,'nyc@example.com','Sales');
/*!40000 ALTER TABLE `warehouse_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_openinghours`
--

DROP TABLE IF EXISTS `warehouse_openinghours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_openinghours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `monday` tinyint(1) NOT NULL DEFAULT 0,
  `tuesday` tinyint(1) NOT NULL DEFAULT 0,
  `wednesday` tinyint(1) NOT NULL DEFAULT 0,
  `thursday` tinyint(1) NOT NULL DEFAULT 0,
  `friday` tinyint(1) NOT NULL DEFAULT 0,
  `saturday` tinyint(1) NOT NULL DEFAULT 0,
  `sunday` tinyint(1) NOT NULL DEFAULT 0,
  `all_day` tinyint(1) NOT NULL DEFAULT 0,
  `opens` varchar(255) DEFAULT NULL,
  `closes` varchar(255) DEFAULT NULL,
  `break_from` varchar(255) DEFAULT NULL,
  `break_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wh_hours` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_openinghours`
--

LOCK TABLES `warehouse_openinghours` WRITE;
/*!40000 ALTER TABLE `warehouse_openinghours` DISABLE KEYS */;
INSERT INTO `warehouse_openinghours` VALUES (1,1,0,1,1,1,1,1,1,1,1,'','','12:00','13:00'),(2,2,0,1,1,1,1,0,0,1,0,'9:00','22:00','','');
/*!40000 ALTER TABLE `warehouse_openinghours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_phone`
--

DROP TABLE IF EXISTS `warehouse_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wh_phone` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_phone`
--

LOCK TABLES `warehouse_phone` WRITE;
/*!40000 ALTER TABLE `warehouse_phone` DISABLE KEYS */;
INSERT INTO `warehouse_phone` VALUES (1,1,0,'+7 (495) 123-45-67','Sales'),(2,2,0,'+1 800 1-WAREHOUSE-1','Sales');
/*!40000 ALTER TABLE `warehouse_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_product`
--

DROP TABLE IF EXISTS `warehouse_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `in_warehouse` float NOT NULL DEFAULT 0,
  `reserved_count` float NOT NULL DEFAULT 0,
  `sku` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wh_pr` (`warehouse_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_product`
--

LOCK TABLES `warehouse_product` WRITE;
/*!40000 ALTER TABLE `warehouse_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watermark`
--

DROP TABLE IF EXISTS `watermark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `watermark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `watermark_path` varchar(255) NOT NULL,
  `position` enum('TOP LEFT','TOP RIGHT','BOTTOM LEFT','BOTTOM RIGHT','CENTER') NOT NULL DEFAULT 'TOP LEFT',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watermark`
--

LOCK TABLES `watermark` WRITE;
/*!40000 ALTER TABLE `watermark` DISABLE KEYS */;
/*!40000 ALTER TABLE `watermark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_product`
--

DROP TABLE IF EXISTS `wishlist_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wishlist_id` int(11) NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix-wishlist_id-product_id` (`wishlist_id`,`product_id`),
  KEY `wishlist_product_product_id` (`product_id`),
  CONSTRAINT `wishlist_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_wishlist_id` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_product`
--

LOCK TABLES `wishlist_product` WRITE;
/*!40000 ALTER TABLE `wishlist_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wysiwyg`
--

DROP TABLE IF EXISTS `wysiwyg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wysiwyg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `params` text DEFAULT NULL,
  `configuration_model` varchar(255) DEFAULT NULL,
  `configuration_view` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wysiwyg`
--

LOCK TABLES `wysiwyg` WRITE;
/*!40000 ALTER TABLE `wysiwyg` DISABLE KEYS */;
INSERT INTO `wysiwyg` VALUES (1,'Imperavi','vova07\\imperavi\\Widget','{\"settings\":{\"replaceDivs\":false,\"minHeight\":200,\"paragraphize\":false,\"pastePlainText\":true,\"buttonSource\":true,\"imageManagerJson\":\"/backend/dashboard/imperavi-images-get\",\"plugins\":[\"table\",\"fontsize\",\"fontfamily\",\"fontcolor\",\"video\",\"imagemanager\"],\"replaceStyles\":[],\"replaceTags\":[],\"deniedTags\":[],\"removeEmpty\":[],\"imageUpload\":\"/backend/dashboard/imperavi-image-upload\"}}','app\\modules\\core\\models\\WysiwygConfiguration\\Imperavi','@app/modules/core/wysiwyg/imperavi-config.php'),(2,'Ace','devgroup\\ace\\Ace','{\"mode\":\"html\",\"theme\":\"chrome\",\"jsOptions\":{\"wrap\":true},\"htmlOptions\":{\"width\":\"100%\",\"height\":\"200px\"}}',NULL,NULL),(3,'Textarea','app\\widgets\\TextareaWidget','{\"htmlOptions\":{\"class\":\"form-control\",\"style\":\"height: 200px;\"}}',NULL,NULL);
/*!40000 ALTER TABLE `wysiwyg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30  9:47:24
