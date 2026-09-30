/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: resourcespace
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
-- Current Database: `resourcespace`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `resourcespace` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `resourcespace`;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `logged` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `log_code` char(5) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `value_old` text DEFAULT NULL,
  `value_new` text DEFAULT NULL,
  `value_diff` text DEFAULT NULL,
  `remote_table` varchar(100) DEFAULT NULL,
  `remote_column` varchar(100) DEFAULT NULL,
  `remote_ref` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annotation`
--

DROP TABLE IF EXISTS `annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `annotation` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `resource` int(11) DEFAULT NULL,
  `resource_type_field` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `x` decimal(17,16) DEFAULT NULL,
  `y` decimal(17,16) DEFAULT NULL,
  `width` decimal(17,16) DEFAULT NULL,
  `height` decimal(17,16) DEFAULT NULL,
  `page` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation`
--

LOCK TABLES `annotation` WRITE;
/*!40000 ALTER TABLE `annotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annotation_node`
--

DROP TABLE IF EXISTS `annotation_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `annotation_node` (
  `annotation` int(11) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  KEY `annotation_node` (`annotation`,`node`),
  KEY `annotation` (`annotation`),
  KEY `node` (`node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation_node`
--

LOCK TABLES `annotation_node` WRITE;
/*!40000 ALTER TABLE `annotation_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotation_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_log`
--

DROP TABLE IF EXISTS `api_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_log` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `logged` datetime DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `logged` (`logged`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_log`
--

LOCK TABLES `api_log` WRITE;
/*!40000 ALTER TABLE `api_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_states`
--

DROP TABLE IF EXISTS `archive_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive_states` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `notify_group` int(11) DEFAULT NULL,
  `more_notes_flag` tinyint(4) DEFAULT NULL,
  `notify_user_flag` tinyint(4) DEFAULT NULL,
  `email_from` varchar(100) DEFAULT NULL,
  `bcc_admin` tinyint(4) DEFAULT NULL,
  `simple_search_flag` tinyint(1) DEFAULT 0,
  `icon` tinytext DEFAULT NULL,
  `skip_required_fields` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_states`
--

LOCK TABLES `archive_states` WRITE;
/*!40000 ALTER TABLE `archive_states` DISABLE KEYS */;
INSERT INTO `archive_states` VALUES (1,-2,'Pending submission',0,0,0,'',0,0,'clock-arrow-up',0),(2,-1,'Pending review',0,0,0,'',0,0,'clock-fading',0),(3,0,'Active',0,0,0,'',0,1,'check',0),(4,1,'Waiting to be archived',0,0,0,'',0,0,'file-clock',0),(5,2,'Archived',0,0,0,'',0,0,'file-archive',0),(6,3,'Deleted',0,0,0,'',0,0,'file-x',0);
/*!40000 ALTER TABLE `archive_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_guidelines_content`
--

DROP TABLE IF EXISTS `brand_guidelines_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_guidelines_content` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `page` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  `content` mediumtext DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `page` (`page`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_guidelines_content`
--

LOCK TABLES `brand_guidelines_content` WRITE;
/*!40000 ALTER TABLE `brand_guidelines_content` DISABLE KEYS */;
INSERT INTO `brand_guidelines_content` VALUES (1,3,0,'{\"richtext\":\"<p>The Brand Guidelines helps our design team generate consistent &nbsp;brand-related materials.<\\/p>\\r\\n<p>Use the \\\"<strong>Add new content<\\/strong>\\\" button &nbsp;to add text, colours or resource content to a page.<\\/p>\\r\\n<p>Create new guideline sections or pages so you can focus guidelines to a specific area (e.g. Colours).<\\/p>\"}',10),(2,4,0,'{\"richtext\":\"<p>Branding colours are a carefully selected and standardized set of hues that represent a brand\'s identity, evoke specific emotions, and create visual harmony across all brand-related materials.<\\/p>\"}',10),(3,4,0,'{\"richtext\":\"<h2>ResourceSpace logo colours<\\/h2>\"}',30),(4,4,2,'{\"name\":\"Light green\",\"hex\":\"79bc41\",\"rgb\":\"121,188,65\",\"cmyk\":\"36,0,65,26\"}',40),(5,4,2,'{\"name\":\"Dark green\",\"hex\":\"4f8c1d\",\"rgb\":\"79,140,29\",\"cmyk\":\"44,0,79,45\"}',50),(6,4,2,'{\"name\":\"Black\",\"hex\":\"000\",\"rgb\":\"0,0,0\",\"cmyk\":\"0,0,0,100\"}',60);
/*!40000 ALTER TABLE `brand_guidelines_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_guidelines_pages`
--

DROP TABLE IF EXISTS `brand_guidelines_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_guidelines_pages` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `order_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_guidelines_pages`
--

LOCK TABLES `brand_guidelines_pages` WRITE;
/*!40000 ALTER TABLE `brand_guidelines_pages` DISABLE KEYS */;
INSERT INTO `brand_guidelines_pages` VALUES (1,'Introduction',0,10),(2,'Brand guidelines',0,20),(3,'Overview',1,10),(4,'Colours',2,10);
/*!40000 ALTER TABLE `brand_guidelines_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `public` int(11) DEFAULT 0,
  `allow_changes` int(11) DEFAULT 0,
  `cant_delete` int(11) DEFAULT 0,
  `keywords` text DEFAULT NULL,
  `savedsearch` int(11) DEFAULT NULL,
  `home_page_publish` int(11) DEFAULT NULL,
  `home_page_text` text DEFAULT NULL,
  `home_page_image` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  `parent` int(11) DEFAULT NULL,
  `thumbnail_selection_method` int(11) DEFAULT NULL,
  `bg_img_resource_ref` int(11) DEFAULT NULL,
  `order_by` int(11) DEFAULT 0,
  PRIMARY KEY (`ref`),
  KEY `public` (`public`),
  KEY `user` (`user`),
  KEY `type` (`type`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,'Default Collection',1,'2008-01-01 10:00:00',0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(2,'Selection Collection (for batch edit)',1,'2026-09-30 13:19:25',0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_keyword`
--

DROP TABLE IF EXISTS `collection_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_keyword` (
  `collection` int(11) DEFAULT NULL,
  `keyword` int(11) DEFAULT NULL,
  KEY `collection` (`collection`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_keyword`
--

LOCK TABLES `collection_keyword` WRITE;
/*!40000 ALTER TABLE `collection_keyword` DISABLE KEYS */;
INSERT INTO `collection_keyword` VALUES (2,1),(2,434),(2,435),(2,436),(2,437),(2,438),(2,439);
/*!40000 ALTER TABLE `collection_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_log`
--

DROP TABLE IF EXISTS `collection_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_log` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `type` char(5) DEFAULT NULL,
  `resource` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `user` (`user`),
  KEY `collection` (`collection`),
  KEY `resource` (`resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_log`
--

LOCK TABLES `collection_log` WRITE;
/*!40000 ALTER TABLE `collection_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_resource`
--

DROP TABLE IF EXISTS `collection_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_resource` (
  `collection` int(11) DEFAULT NULL,
  `resource` int(11) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `comment` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `use_as_theme_thumbnail` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  KEY `collection` (`collection`),
  KEY `resource_collection` (`collection`,`resource`),
  KEY `resource` (`resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_resource`
--

LOCK TABLES `collection_resource` WRITE;
/*!40000 ALTER TABLE `collection_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_savedsearch`
--

DROP TABLE IF EXISTS `collection_savedsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_savedsearch` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `collection` int(11) DEFAULT NULL,
  `search` text DEFAULT NULL,
  `restypes` text DEFAULT NULL,
  `starsearch` int(11) DEFAULT NULL,
  `archive` varchar(50) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `result_limit` int(11) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_savedsearch`
--

LOCK TABLES `collection_savedsearch` WRITE;
/*!40000 ALTER TABLE `collection_savedsearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_savedsearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `ref_parent` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `hide` int(1) DEFAULT 0,
  `collection_ref` int(11) DEFAULT NULL,
  `resource_ref` int(11) DEFAULT NULL,
  `user_ref` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website_url` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `annotation` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `ref_parent` (`ref_parent`),
  KEY `collection_ref` (`collection_ref`),
  KEY `resource_ref` (`resource_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent`
--

DROP TABLE IF EXISTS `consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `consent` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `parent_guardian_name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `consent_usage` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `date_of_consent` date DEFAULT NULL,
  `expires` date DEFAULT NULL,
  `expiration_notice_sent` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent`
--

LOCK TABLES `consent` WRITE;
/*!40000 ALTER TABLE `consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_stat`
--

DROP TABLE IF EXISTS `daily_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_stat` (
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `usergroup` int(11) DEFAULT 0,
  `activity_type` varchar(50) DEFAULT NULL,
  `object_ref` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT 0,
  `external` tinyint(1) DEFAULT 0,
  KEY `stat_day` (`year`,`month`,`day`),
  KEY `stat_month` (`year`,`month`),
  KEY `stat_usergroup` (`usergroup`),
  KEY `stat_day_activity` (`year`,`month`,`day`,`activity_type`),
  KEY `stat_day_activity_ref` (`year`,`month`,`day`,`activity_type`,`object_ref`),
  KEY `activity_type` (`activity_type`),
  KEY `idx_activity_year_month_day_count` (`activity_type`,`year`,`month`,`day`,`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_stat`
--

LOCK TABLES `daily_stat` WRITE;
/*!40000 ALTER TABLE `daily_stat` DISABLE KEYS */;
INSERT INTO `daily_stat` VALUES (2026,9,30,3,'User session',1,2,0);
/*!40000 ALTER TABLE `daily_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dash_tile`
--

DROP TABLE IF EXISTS `dash_tile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dash_tile` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `txt` text DEFAULT NULL,
  `all_users` int(1) DEFAULT NULL,
  `default_order_by` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `reload_interval_secs` int(11) DEFAULT NULL,
  `resource_count` int(1) DEFAULT NULL,
  `allow_delete` int(1) DEFAULT 1,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dash_tile`
--

LOCK TABLES `dash_tile` WRITE;
/*!40000 ALTER TABLE `dash_tile` DISABLE KEYS */;
/*!40000 ALTER TABLE `dash_tile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_access_keys`
--

DROP TABLE IF EXISTS `external_access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_access_keys` (
  `resource` int(11) DEFAULT NULL,
  `access_key` char(10) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `usergroup` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `request_feedback` int(11) DEFAULT 0,
  `email` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `lastused` datetime DEFAULT NULL,
  `access` int(11) DEFAULT -1,
  `expires` datetime DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `upload` int(11) DEFAULT 0,
  KEY `resource` (`resource`),
  KEY `resource_key` (`resource`,`access_key`),
  KEY `access_key` (`access_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_access_keys`
--

LOCK TABLES `external_access_keys` WRITE;
/*!40000 ALTER TABLE `external_access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `filter_condition` int(11) DEFAULT 1,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter`
--

LOCK TABLES `filter` WRITE;
/*!40000 ALTER TABLE `filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_rule`
--

DROP TABLE IF EXISTS `filter_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_rule` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `filter` int(11) NOT NULL,
  PRIMARY KEY (`ref`,`filter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_rule`
--

LOCK TABLES `filter_rule` WRITE;
/*!40000 ALTER TABLE `filter_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_rule_node`
--

DROP TABLE IF EXISTS `filter_rule_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_rule_node` (
  `filter_rule` int(11) DEFAULT NULL,
  `node_condition` int(11) DEFAULT NULL,
  `node` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_rule_node`
--

LOCK TABLES `filter_rule_node` WRITE;
/*!40000 ALTER TABLE `filter_rule_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_rule_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_lockout`
--

DROP TABLE IF EXISTS `ip_lockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_lockout` (
  `ip` varchar(40) NOT NULL,
  `tries` int(11) DEFAULT 0,
  `last_try` datetime DEFAULT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_lockout`
--

LOCK TABLES `ip_lockout` WRITE;
/*!40000 ALTER TABLE `ip_lockout` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_lockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_queue` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `job_data` longtext DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `success_text` varchar(250) DEFAULT NULL,
  `failure_text` varchar(250) DEFAULT NULL,
  `job_code` varchar(100) DEFAULT NULL,
  `priority` tinyint(1) DEFAULT 2,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyword` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `soundex` varchar(50) DEFAULT NULL,
  `hit_count` int(11) DEFAULT 0,
  PRIMARY KEY (`ref`),
  KEY `keyword` (`keyword`),
  KEY `keyword_hit_count` (`hit_count`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
INSERT INTO `keyword` VALUES (1,'2','0000',0),(2,'my collection','M242',0),(3,'joe smith','J253',0),(4,'my','M000',0),(5,'collection','C423',0),(6,'joe','J000',1),(7,'smith','S530',1),(8,'woman','W550',1),(9,'man','M500',15),(10,'child','C430',1),(11,'building','B435',1),(12,'vehicle','V240',1),(13,'animal','A554',3),(14,'elderly','E436',1),(15,'baby','B100',1),(16,'boy','B000',1),(17,'girl','G640',1),(18,'exhibition','E213',1),(19,'meeting','M352',1),(20,'concert','C526',3),(21,'festival','F231',1),(22,'party','P630',1),(23,'conference','C516',1),(24,'photo','P300',8),(25,'shoot','S300',1),(26,'happy','H100',1),(27,'sad','S300',1),(28,'inspirational','I521',1),(29,'eye','E000',3),(30,'contact','C532',3),(31,'thoughtful','T231',1),(32,'family','F540',1),(33,'group','G610',1),(34,'product','P632',1),(35,'employee','E514',1),(36,'customer','C235',1),(37,'test','T230',2),(38,'eye contact','E253',2),(39,'2016','0000',2),(40,'2016-06','0000',2),(41,'2016-06-16 10:56','0000',2),(42,'17','0000',0),(43,'3','0000',0),(44,'upload 20160616105637','U143',0),(45,'upload','U143',0),(46,'20160616105637','0000',0),(47,'montala','M534',1),(48,'support','S163',1),(49,'1','0000',1),(50,'poster','P236',1),(51,'png','P520',1),(52,NULL,NULL,0),(53,'fundraising','F536',1),(54,'!last1000','L230',0),(55,'afghanistan','A125',14),(56,'aland','A453',14),(57,'island','I245',386),(58,'albania','A415',14),(59,'algeria','A426',14),(60,'american','A562',14),(61,'samoa','S500',28),(62,'andorra','A536',14),(63,'angola','A524',14),(64,'anguilla','A524',14),(65,'antarctica','A536',14),(66,'antigua','A532',14),(67,'barbuda','B613',14),(68,'argentina','A625',14),(69,'armenia','A655',14),(70,'aruba','A610',14),(71,'australia','A236',14),(72,'austria','A236',14),(73,'azerbaijan','A261',14),(74,'bahama','B500',22),(75,'bahrain','B650',14),(76,'bangladesh','B524',14),(77,'barbado','B613',22),(78,'belaru','B460',22),(79,'belgium','B425',14),(80,'beliz','B420',22),(81,'benin','B550',14),(82,'bermuda','B653',14),(83,'bhutan','B350',14),(84,'bolivia','B410',14),(85,'bosnia','B250',14),(86,'herzegovina','H622',14),(87,'botswana','B325',14),(88,'bouvet','B130',14),(89,'brazil','B624',14),(90,'british','B632',28),(91,'indian','I535',14),(92,'ocean','O250',14),(93,'territori','T636',66),(94,'brunei','B650',14),(95,'darussalam','D624',14),(96,'bulgaria','B426',14),(97,'burkina','B625',14),(98,'faso','F200',14),(99,'burundi','B653',14),(100,'cambodia','C513',14),(101,'cameroon','C565',14),(102,'canada','C530',14),(103,'cape','C100',14),(104,'verd','V630',22),(105,'cayman','C550',14),(106,'central','C536',14),(107,'african','A162',14),(108,'republ','R114',286),(109,'chad','C300',14),(110,'chile','C400',14),(111,'china','C500',28),(112,'christma','C623',22),(113,'coco','C200',22),(114,'keel','K400',22),(115,'colombia','C451',14),(116,'comoro','C560',22),(117,'congo','C520',28),(118,'democrat','D526',66),(119,'cook','C200',14),(120,'costa','C230',14),(121,'rica','R200',14),(122,'côte','C300',14),(123,'d','D000',14),(124,'ivoir','I160',22),(125,'croatia','C630',14),(126,'cuba','C100',14),(127,'cypru','C160',22),(128,'czech','C200',14),(129,'denmark','D562',14),(130,'djibouti','D213',14),(131,'dominica','D552',14),(132,'dominican','D552',14),(133,'ecuador','E236',14),(134,'egypt','E213',14),(135,'el','E400',14),(136,'salvador','S413',14),(137,'equatori','E236',22),(138,'guinea','G500',56),(139,'eritrea','E636',14),(140,'estonia','E235',14),(141,'ethiopia','E310',14),(142,'falkland','F424',14),(143,'malvina','M415',22),(144,'faro','F600',22),(145,'fiji','F200',14),(146,'finland','F545',14),(147,'franc','F652',22),(148,'french','F652',42),(149,'guiana','G500',14),(150,'polynesia','P452',14),(151,'southern','S365',14),(152,'gabon','G150',14),(153,'gambia','G510',14),(154,'georgia','G620',28),(155,'germani','G655',22),(156,'ghana','G500',14),(157,'gibraltar','G164',14),(158,'greec','G620',22),(159,'greenland','G654',14),(160,'grenada','G653',14),(161,'guadeloup','G341',22),(162,'guam','G500',14),(163,'guatemala','G354',14),(164,'guernsei','G652',22),(165,'bissau','B200',14),(166,'guyana','G500',14),(167,'haiti','H300',14),(168,'heard','H630',14),(169,'mcdonald','M235',14),(170,'holi','H400',22),(171,'see','S000',14),(172,'vatican','V325',14),(173,'citi','C300',22),(174,'state','S330',80),(175,'hondura','H536',22),(176,'hong','H520',14),(177,'kong','K520',14),(178,'hungari','H526',22),(179,'iceland','I245',14),(180,'india','I530',14),(181,'indonesia','I535',14),(182,'iran','I650',14),(183,'islam','I245',22),(184,'iraq','I620',14),(185,'ireland','I645',14),(186,'isl','I240',22),(187,'israel','I264',14),(188,'itali','I340',22),(189,'jamaica','J520',14),(190,'japan','J150',14),(191,'jersei','J620',22),(192,'jordan','J635',14),(193,'kazakhstan','K222',14),(194,'kenya','K500',14),(195,'kiribati','K613',14),(196,'korea','K600',28),(197,'peopl','P140',44),(198,'s','S000',42),(199,'kuwait','K300',14),(200,'kyrgyzstan','K622',14),(201,'lao','L000',14),(202,'latvia','L310',14),(203,'lebanon','L155',14),(204,'lesotho','L230',14),(205,'liberia','L160',14),(206,'libyan','L150',14),(207,'arab','A610',42),(208,'jamahiriya','J560',14),(209,'liechtenstein','L235',14),(210,'lithuania','L350',14),(211,'luxembourg','L251',14),(212,'macao','M200',14),(213,'macedonia','M235',14),(214,'former','F656',14),(215,'yugoslav','Y224',14),(216,'madagascar','M322',14),(217,'malawi','M400',14),(218,'malaysia','M420',14),(219,'maldiv','M431',22),(220,'mali','M400',14),(221,'malta','M430',14),(222,'marshal','M624',22),(223,'martiniqu','M635',22),(224,'mauritania','M635',14),(225,'mauritiu','M630',22),(226,'mayott','M300',22),(227,'mexico','M220',14),(228,'micronesia','M265',14),(229,'feder','F360',44),(230,'moldova','M431',14),(231,'monaco','M520',14),(232,'mongolia','M524',14),(233,'montenegro','M535',14),(234,'montserrat','M532',14),(235,'morocco','M620',14),(236,'mozambiqu','M251',22),(237,'myanmar','M560',14),(238,'namibia','N510',14),(239,'nauru','N600',14),(240,'nepal','N140',14),(241,'netherland','N364',44),(242,'antil','A534',22),(243,'new','N000',42),(244,'caledonia','C435',14),(245,'zealand','Z453',14),(246,'nicaragua','N262',14),(247,'niger','N260',14),(248,'nigeria','N260',14),(249,'niue','N000',14),(250,'norfolk','N614',14),(251,'northern','N636',14),(252,'mariana','M650',14),(253,'norwai','N600',22),(254,'oman','O550',14),(255,'pakistan','P223',14),(256,'palau','P400',14),(257,'palestinian','P423',14),(258,'occupi','O210',22),(259,'panama','P550',14),(260,'papua','P100',14),(261,'paraguai','P620',22),(262,'peru','P600',14),(263,'philippin','P415',22),(264,'pitcairn','P326',14),(265,'poland','P453',14),(266,'portug','P632',22),(267,'puerto','P630',14),(268,'rico','R200',14),(269,'qatar','Q360',14),(270,'réunion','R550',14),(271,'romania','R550',14),(272,'russian','R250',14),(273,'rwanda','R530',14),(274,'saint','S530',98),(275,'barthélemi','B634',22),(276,'helena','H450',14),(277,'kitt','K300',22),(278,'nevi','N100',22),(279,'lucia','L200',14),(280,'martin','M635',14),(281,'pierr','P600',22),(282,'miquelon','M245',14),(283,'vincent','V525',14),(284,'grenadin','G653',22),(285,'san','S500',14),(286,'marino','M650',14),(287,'sao','S000',14),(288,'tome','T500',14),(289,'princip','P652',22),(290,'saudi','S300',14),(291,'arabia','A610',14),(292,'seneg','S520',22),(293,'serbia','S610',14),(294,'seychel','S240',22),(295,'sierra','S600',14),(296,'leon','L500',22),(297,'singapor','S521',22),(298,'slovakia','S412',14),(299,'slovenia','S415',14),(300,'solomon','S455',14),(301,'somalia','S540',14),(302,'south','S300',42),(303,'africa','A162',14),(304,'sandwich','S532',14),(305,'spain','S150',14),(306,'sri','S600',14),(307,'lanka','L520',14),(308,'sudan','S350',14),(309,'surinam','S655',22),(310,'svalbard','S141',14),(311,'jan','J500',14),(312,'mayen','M500',14),(313,'swaziland','S245',14),(314,'sweden','S350',14),(315,'switzerland','S326',14),(316,'syrian','S650',14),(317,'taiwan','T500',14),(318,'provinc','P615',22),(319,'tajikistan','T222',14),(320,'tanzania','T525',14),(321,'unit','U530',110),(322,'thailand','T453',14),(323,'timor','T560',14),(324,'lest','L230',22),(325,'togo','T200',14),(326,'tokelau','T240',14),(327,'tonga','T520',14),(328,'trinidad','T653',14),(329,'tobago','T120',14),(330,'tunisia','T520',14),(331,'turkei','T620',22),(332,'turkmenistan','T625',14),(333,'turk','T620',22),(334,'caico','C200',22),(335,'tuvalu','T140',14),(336,'uganda','U253',14),(337,'ukrain','U265',22),(338,'emir','E560',22),(339,'kingdom','K523',14),(340,'minor','M560',14),(341,'outli','O340',22),(342,'uruguai','U620',22),(343,'uzbekistan','U212',14),(344,'vanuatu','V530',14),(345,'venezuela','V524',14),(346,'bolivarian','B416',14),(347,'viet','V300',14),(348,'nam','N500',14),(349,'virgin','V625',28),(350,'u','U000',14),(351,'walli','W400',22),(352,'futuna','F350',14),(353,'western','W236',14),(354,'sahara','S600',14),(355,'yemen','Y550',14),(356,'zambia','Z510',14),(357,'zimbabw','Z511',22),(358,'digit','D230',2),(359,'camera','C560',2),(360,'scan','S500',4),(361,'neg','N200',2),(362,'islands','I245',15),(363,'bahamas','B520',1),(364,'barbados','B613',1),(365,'belarus','B462',1),(366,'belize','B420',1),(367,'territory','T636',2),(368,'verde','V630',1),(369,'republic','R114',13),(370,'christmas','C623',1),(371,'cocos','C220',1),(372,'keeling','K452',1),(373,'comoros','C562',1),(374,'democratic','D526',3),(375,'ivoire','I160',1),(376,'cyprus','C162',1),(377,'equatorial','E236',1),(378,'malvinas','M415',1),(379,'faroe','F600',1),(380,'france','F652',1),(381,'territories','T636',1),(382,'germany','G655',1),(383,'greece','G620',1),(384,'guadeloupe','G341',1),(385,'guernsey','G652',1),(386,'holy','H400',1),(387,'city','C300',1),(388,'honduras','H536',1),(389,'hungary','H526',1),(390,'islamic','I245',1),(391,'isle','I240',1),(392,'italy','I340',1),(393,'jersey','J620',1),(394,'people','P140',2),(395,'maldives','M431',1),(396,'marshall','M624',1),(397,'martinique','M635',1),(398,'mauritius','M632',1),(399,'mayotte','M300',1),(400,'federated','F363',1),(401,'states','S332',3),(402,'mozambique','M251',1),(403,'netherlands','N364',2),(404,'antilles','A534',1),(405,'norway','N600',1),(406,'occupied','O213',1),(407,'paraguay','P620',1),(408,'philippines','P415',1),(409,'portugal','P632',1),(410,'federation','F363',1),(411,'barthélemy','B634',1),(412,'kitts','K320',1),(413,'nevis','N120',1),(414,'pierre','P600',1),(415,'grenadines','G653',1),(416,'principe','P652',1),(417,'senegal','S524',1),(418,'seychelles','S242',1),(419,'leone','L500',1),(420,'singapore','S521',1),(421,'suriname','S655',1),(422,'province','P615',1),(423,'united','U533',5),(424,'leste','L230',1),(425,'turkey','T620',1),(426,'turks','T620',1),(427,'caicos','C220',1),(428,'ukraine','U265',1),(429,'emirates','E563',1),(430,'outlying','O345',1),(431,'uruguay','U620',1),(432,'wallis','W420',1),(433,'zimbabwe','Z511',1),(434,'select','S423',0),(435,'collect','C423',0),(436,'for','F600',0),(437,'batch','B320',0),(438,'edit','E330',0),(439,'administr','A355',0);
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword_related`
--

DROP TABLE IF EXISTS `keyword_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyword_related` (
  `keyword` int(11) DEFAULT NULL,
  `related` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword_related`
--

LOCK TABLES `keyword_related` WRITE;
/*!40000 ALTER TABLE `keyword_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `license` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `outbound` int(11) DEFAULT NULL,
  `holder` text DEFAULT NULL,
  `license_usage` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `expires` date DEFAULT NULL,
  `expiration_notice_sent` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_log`
--

DROP TABLE IF EXISTS `mail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_log` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `mail_to` varchar(255) DEFAULT NULL,
  `mail_from` int(11) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `sender_email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_log`
--

LOCK TABLES `mail_log` WRITE;
/*!40000 ALTER TABLE `mail_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `url` text DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `related_activity` int(11) DEFAULT NULL,
  `related_ref` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `node` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type_field` int(11) DEFAULT NULL,
  `name` mediumtext DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`ref`),
  KEY `resource_type_field` (`resource_type_field`,`ref`,`parent`,`order_by`),
  KEY `name` (`name`(20)),
  FULLTEXT KEY `name_full` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,3,'Afghanistan',NULL,10,1),(2,3,'Aland Islands',NULL,20,1),(3,3,'Albania',NULL,30,1),(4,3,'Algeria',NULL,40,1),(5,3,'American Samoa',NULL,50,1),(6,3,'Andorra',NULL,60,1),(7,3,'Angola',NULL,70,1),(8,3,'Anguilla',NULL,80,1),(9,3,'Antarctica',NULL,90,1),(10,3,'Antigua And Barbuda',NULL,100,1),(11,3,'Argentina',NULL,110,1),(12,3,'Armenia',NULL,120,1),(13,3,'Aruba',NULL,130,1),(14,3,'Australia',NULL,140,1),(15,3,'Austria',NULL,150,1),(16,3,'Azerbaijan',NULL,160,1),(17,3,'Bahamas',NULL,170,1),(18,3,'Bahrain',NULL,180,1),(19,3,'Bangladesh',NULL,190,1),(20,3,'Barbados',NULL,200,1),(21,3,'Belarus',NULL,210,1),(22,3,'Belgium',NULL,220,1),(23,3,'Belize',NULL,230,1),(24,3,'Benin',NULL,240,1),(25,3,'Bermuda',NULL,250,1),(26,3,'Bhutan',NULL,260,1),(27,3,'Bolivia',NULL,270,1),(28,3,'Bosnia And Herzegovina',NULL,280,1),(29,3,'Botswana',NULL,290,1),(30,3,'Bouvet Island',NULL,300,1),(31,3,'Brazil',NULL,310,1),(32,3,'British Indian Ocean Territory',NULL,320,1),(33,3,'Brunei Darussalam',NULL,330,1),(34,3,'Bulgaria',NULL,340,1),(35,3,'Burkina Faso',NULL,350,1),(36,3,'Burundi',NULL,360,1),(37,3,'Cambodia',NULL,370,1),(38,3,'Cameroon',NULL,380,1),(39,3,'Canada',NULL,390,1),(40,3,'Cape Verde',NULL,400,1),(41,3,'Cayman Islands',NULL,410,1),(42,3,'Central African Republic',NULL,420,1),(43,3,'Chad',NULL,430,1),(44,3,'Chile',NULL,440,1),(45,3,'China',NULL,450,1),(46,3,'Christmas Island',NULL,460,1),(47,3,'Cocos (Keeling) Islands',NULL,470,1),(48,3,'Colombia',NULL,480,1),(49,3,'Comoros',NULL,490,1),(50,3,'Congo',NULL,500,1),(51,3,'Congo - The Democratic Republic Of The',NULL,510,1),(52,3,'Cook Islands',NULL,520,1),(53,3,'Costa Rica',NULL,530,1),(54,3,'Côte D\'ivoire',NULL,540,1),(55,3,'Croatia',NULL,550,1),(56,3,'Cuba',NULL,560,1),(57,3,'Cyprus',NULL,570,1),(58,3,'Czech Republic',NULL,580,1),(59,3,'Denmark',NULL,590,1),(60,3,'Djibouti',NULL,600,1),(61,3,'Dominica',NULL,610,1),(62,3,'Dominican Republic',NULL,620,1),(63,3,'Ecuador',NULL,630,1),(64,3,'Egypt',NULL,640,1),(65,3,'El Salvador',NULL,650,1),(66,3,'Equatorial Guinea',NULL,660,1),(67,3,'Eritrea',NULL,670,1),(68,3,'Estonia',NULL,680,1),(69,3,'Ethiopia',NULL,690,1),(70,3,'Falkland Islands (Malvinas)',NULL,700,1),(71,3,'Faroe Islands',NULL,710,1),(72,3,'Fiji',NULL,720,1),(73,3,'Finland',NULL,730,1),(74,3,'France',NULL,740,1),(75,3,'French Guiana',NULL,750,1),(76,3,'French Polynesia',NULL,760,1),(77,3,'French Southern Territories',NULL,770,1),(78,3,'Gabon',NULL,780,1),(79,3,'Gambia',NULL,790,1),(80,3,'Georgia',NULL,800,1),(81,3,'Germany',NULL,810,1),(82,3,'Ghana',NULL,820,1),(83,3,'Gibraltar',NULL,830,1),(84,3,'Greece',NULL,840,1),(85,3,'Greenland',NULL,850,1),(86,3,'Grenada',NULL,860,1),(87,3,'Guadeloupe',NULL,870,1),(88,3,'Guam',NULL,880,1),(89,3,'Guatemala',NULL,890,1),(90,3,'Guernsey',NULL,900,1),(91,3,'Guinea',NULL,910,1),(92,3,'Guinea-Bissau',NULL,920,1),(93,3,'Guyana',NULL,930,1),(94,3,'Haiti',NULL,940,1),(95,3,'Heard Island And Mcdonald Islands',NULL,950,1),(96,3,'Holy See (Vatican City State)',NULL,960,1),(97,3,'Honduras',NULL,970,1),(98,3,'Hong Kong',NULL,980,1),(99,3,'Hungary',NULL,990,1),(100,3,'Iceland',NULL,1000,1),(101,3,'India',NULL,1010,1),(102,3,'Indonesia',NULL,1020,1),(103,3,'Iran - Islamic Republic Of',NULL,1030,1),(104,3,'Iraq',NULL,1040,1),(105,3,'Ireland',NULL,1050,1),(106,3,'Isle Of Man',NULL,1060,1),(107,3,'Israel',NULL,1070,1),(108,3,'Italy',NULL,1080,1),(109,3,'Jamaica',NULL,1090,1),(110,3,'Japan',NULL,1100,1),(111,3,'Jersey',NULL,1110,1),(112,3,'Jordan',NULL,1120,1),(113,3,'Kazakhstan',NULL,1130,1),(114,3,'Kenya',NULL,1140,1),(115,3,'Kiribati',NULL,1150,1),(116,3,'Korea - Democratic People\'s Republic Of',NULL,1160,1),(117,3,'Korea - Republic Of',NULL,1170,1),(118,3,'Kuwait',NULL,1180,1),(119,3,'Kyrgyzstan',NULL,1190,1),(120,3,'Lao People\'s Democratic Republic',NULL,1200,1),(121,3,'Latvia',NULL,1210,1),(122,3,'Lebanon',NULL,1220,1),(123,3,'Lesotho',NULL,1230,1),(124,3,'Liberia',NULL,1240,1),(125,3,'Libyan Arab Jamahiriya',NULL,1250,1),(126,3,'Liechtenstein',NULL,1260,1),(127,3,'Lithuania',NULL,1270,1),(128,3,'Luxembourg',NULL,1280,1),(129,3,'Macao',NULL,1290,1),(130,3,'Macedonia - The Former Yugoslav Republic Of',NULL,1300,1),(131,3,'Madagascar',NULL,1310,1),(132,3,'Malawi',NULL,1320,1),(133,3,'Malaysia',NULL,1330,1),(134,3,'Maldives',NULL,1340,1),(135,3,'Mali',NULL,1350,1),(136,3,'Malta',NULL,1360,1),(137,3,'Marshall Islands',NULL,1370,1),(138,3,'Martinique',NULL,1380,1),(139,3,'Mauritania',NULL,1390,1),(140,3,'Mauritius',NULL,1400,1),(141,3,'Mayotte',NULL,1410,1),(142,3,'Mexico',NULL,1420,1),(143,3,'Micronesia - Federated States Of',NULL,1430,1),(144,3,'Moldova - Republic Of',NULL,1440,1),(145,3,'Monaco',NULL,1450,1),(146,3,'Mongolia',NULL,1460,1),(147,3,'Montenegro',NULL,1470,1),(148,3,'Montserrat',NULL,1480,1),(149,3,'Morocco',NULL,1490,1),(150,3,'Mozambique',NULL,1500,1),(151,3,'Myanmar',NULL,1510,1),(152,3,'Namibia',NULL,1520,1),(153,3,'Nauru',NULL,1530,1),(154,3,'Nepal',NULL,1540,1),(155,3,'Netherlands',NULL,1550,1),(156,3,'Netherlands Antilles',NULL,1560,1),(157,3,'New Caledonia',NULL,1570,1),(158,3,'New Zealand',NULL,1580,1),(159,3,'Nicaragua',NULL,1590,1),(160,3,'Niger',NULL,1600,1),(161,3,'Nigeria',NULL,1610,1),(162,3,'Niue',NULL,1620,1),(163,3,'Norfolk Island',NULL,1630,1),(164,3,'Northern Mariana Islands',NULL,1640,1),(165,3,'Norway',NULL,1650,1),(166,3,'Oman',NULL,1660,1),(167,3,'Pakistan',NULL,1670,1),(168,3,'Palau',NULL,1680,1),(169,3,'Palestinian Territory - Occupied',NULL,1690,1),(170,3,'Panama',NULL,1700,1),(171,3,'Papua New Guinea',NULL,1710,1),(172,3,'Paraguay',NULL,1720,1),(173,3,'Peru',NULL,1730,1),(174,3,'Philippines',NULL,1740,1),(175,3,'Pitcairn',NULL,1750,1),(176,3,'Poland',NULL,1760,1),(177,3,'Portugal',NULL,1770,1),(178,3,'Puerto Rico',NULL,1780,1),(179,3,'Qatar',NULL,1790,1),(180,3,'Réunion',NULL,1800,1),(181,3,'Romania',NULL,1810,1),(182,3,'Russian Federation',NULL,1820,1),(183,3,'Rwanda',NULL,1830,1),(184,3,'Saint Barthélemy',NULL,1840,1),(185,3,'Saint Helena',NULL,1850,1),(186,3,'Saint Kitts And Nevis',NULL,1860,1),(187,3,'Saint Lucia',NULL,1870,1),(188,3,'Saint Martin',NULL,1880,1),(189,3,'Saint Pierre And Miquelon',NULL,1890,1),(190,3,'Saint Vincent And The Grenadines',NULL,1900,1),(191,3,'Samoa',NULL,1910,1),(192,3,'San Marino',NULL,1920,1),(193,3,'Sao Tome And Principe',NULL,1930,1),(194,3,'Saudi Arabia',NULL,1940,1),(195,3,'Senegal',NULL,1950,1),(196,3,'Serbia',NULL,1960,1),(197,3,'Seychelles',NULL,1970,1),(198,3,'Sierra Leone',NULL,1980,1),(199,3,'Singapore',NULL,1990,1),(200,3,'Slovakia',NULL,2000,1),(201,3,'Slovenia',NULL,2010,1),(202,3,'Solomon Islands',NULL,2020,1),(203,3,'Somalia',NULL,2030,1),(204,3,'South Africa',NULL,2040,1),(205,3,'South Georgia And The South Sandwich Islands',NULL,2050,1),(206,3,'Spain',NULL,2060,1),(207,3,'Sri Lanka',NULL,2070,1),(208,3,'Sudan',NULL,2080,1),(209,3,'Suriname',NULL,2090,1),(210,3,'Svalbard And Jan Mayen',NULL,2100,1),(211,3,'Swaziland',NULL,2110,1),(212,3,'Sweden',NULL,2120,1),(213,3,'Switzerland',NULL,2130,1),(214,3,'Syrian Arab Republic',NULL,2140,1),(215,3,'Taiwan - Province Of China',NULL,2150,1),(216,3,'Tajikistan',NULL,2160,1),(217,3,'Tanzania - United Republic Of',NULL,2170,1),(218,3,'Thailand',NULL,2180,1),(219,3,'Timor-Leste',NULL,2190,1),(220,3,'Togo',NULL,2200,1),(221,3,'Tokelau',NULL,2210,1),(222,3,'Tonga',NULL,2220,1),(223,3,'Trinidad And Tobago',NULL,2230,1),(224,3,'Tunisia',NULL,2240,1),(225,3,'Turkey',NULL,2250,1),(226,3,'Turkmenistan',NULL,2260,1),(227,3,'Turks And Caicos Islands',NULL,2270,1),(228,3,'Tuvalu',NULL,2280,1),(229,3,'Uganda',NULL,2290,1),(230,3,'Ukraine',NULL,2300,1),(231,3,'United Arab Emirates',NULL,2310,1),(232,3,'United Kingdom',NULL,2320,1),(233,3,'United States',NULL,2330,1),(234,3,'United States Minor Outlying Islands',NULL,2340,1),(235,3,'Uruguay',NULL,2350,1),(236,3,'Uzbekistan',NULL,2360,1),(237,3,'Vanuatu',NULL,2370,1),(238,3,'Venezuela - Bolivarian Republic Of',NULL,2380,1),(239,3,'Viet Nam',NULL,2390,1),(240,3,'Virgin Islands - British',NULL,2400,1),(241,3,'Virgin Islands - U.S.',NULL,2410,1),(242,3,'Wallis And Futuna',NULL,2420,1),(243,3,'Western Sahara',NULL,2430,1),(244,3,'Yemen',NULL,2440,1),(245,3,'Zambia',NULL,2450,1),(246,3,'Zimbabwe',NULL,2460,1),(247,54,'Digital Camera',NULL,20,1),(248,54,'Scanned Negative',NULL,30,1),(249,54,'Scanned Photo',NULL,40,1),(250,73,'Woman',NULL,10,1),(251,73,'Man',NULL,20,1),(252,73,'Child',NULL,30,1),(253,73,'Building',NULL,140,1),(254,73,'Vehicle',NULL,130,1),(255,73,'Animal',NULL,80,1),(256,73,'Elderly',NULL,70,1),(257,73,'Baby',NULL,60,1),(258,73,'Boy',NULL,40,1),(259,73,'Girl',NULL,50,1),(260,74,'Exhibition',NULL,10,1),(261,74,'Meeting',NULL,20,1),(262,74,'Concert',NULL,30,1),(263,74,'Festival',NULL,40,1),(264,74,'Party',NULL,50,1),(265,74,'Conference',NULL,60,1),(266,74,'Photo shoot',NULL,80,1),(267,75,'Happy',NULL,10,1),(268,75,'Sad',NULL,20,1),(269,75,'Inspirational',NULL,30,1),(270,75,'Eye contact',NULL,40,1),(271,75,'Thoughtful',NULL,50,1),(272,73,'Family',NULL,90,1),(273,73,'Group',NULL,100,1),(274,73,'Product',NULL,150,1),(275,73,'Employee',NULL,110,1),(276,73,'Customer',NULL,120,1),(277,74,'Fundraising',NULL,70,1);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_keyword`
--

DROP TABLE IF EXISTS `node_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `node_keyword` (
  `node` int(11) DEFAULT NULL,
  `keyword` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  KEY `node_keyword` (`node`,`keyword`),
  KEY `node` (`node`),
  KEY `keyword` (`keyword`),
  KEY `keyword_node` (`keyword`,`node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_keyword`
--

LOCK TABLES `node_keyword` WRITE;
/*!40000 ALTER TABLE `node_keyword` DISABLE KEYS */;
INSERT INTO `node_keyword` VALUES (250,8,0),(251,9,0),(252,10,0),(253,11,0),(254,12,0),(255,13,0),(256,14,0),(257,15,0),(258,16,0),(259,17,0),(260,18,0),(261,19,0),(262,20,0),(263,21,0),(264,22,0),(265,23,0),(266,24,0),(266,25,1),(267,26,0),(268,27,0),(269,28,0),(270,29,0),(270,30,1),(271,31,0),(272,32,0),(273,33,0),(274,34,0),(275,35,0),(276,36,0),(277,53,0),(1,55,0),(2,56,0),(2,362,1),(2,57,1),(3,58,0),(4,59,0),(5,60,0),(5,61,1),(6,62,0),(7,63,0),(8,64,0),(9,65,0),(10,66,0),(10,67,2),(11,68,0),(12,69,0),(13,70,0),(14,71,0),(15,72,0),(16,73,0),(17,363,0),(17,74,0),(18,75,0),(19,76,0),(20,364,0),(20,77,0),(21,365,0),(21,78,0),(22,79,0),(23,366,0),(23,80,0),(24,81,0),(25,82,0),(26,83,0),(27,84,0),(28,85,0),(28,86,2),(29,87,0),(30,88,0),(30,57,1),(31,89,0),(32,90,0),(32,91,1),(32,92,2),(32,367,3),(32,93,3),(33,94,0),(33,95,1),(34,96,0),(35,97,0),(35,98,1),(36,99,0),(37,100,0),(38,101,0),(39,102,0),(40,103,0),(40,368,1),(40,104,1),(41,105,0),(41,362,1),(41,57,1),(42,106,0),(42,107,1),(42,369,2),(42,108,2),(43,109,0),(44,110,0),(45,111,0),(46,370,0),(46,112,0),(46,57,1),(47,371,0),(47,113,0),(47,372,1),(47,114,1),(47,362,2),(47,57,2),(48,115,0),(49,373,0),(49,116,0),(50,117,0),(51,117,0),(51,374,2),(51,118,2),(51,369,3),(51,108,3),(52,119,0),(52,362,1),(52,57,1),(53,120,0),(53,121,1),(54,122,0),(54,123,1),(54,375,2),(54,124,2),(55,125,0),(56,126,0),(57,376,0),(57,127,0),(58,128,0),(58,369,1),(58,108,1),(59,129,0),(60,130,0),(61,131,0),(62,132,0),(62,369,1),(62,108,1),(63,133,0),(64,134,0),(65,135,0),(65,136,1),(66,377,0),(66,137,0),(66,138,1),(67,139,0),(68,140,0),(69,141,0),(70,142,0),(70,362,1),(70,57,1),(70,378,2),(70,143,2),(71,379,0),(71,144,0),(71,362,1),(71,57,1),(72,145,0),(73,146,0),(74,380,0),(74,147,0),(75,148,0),(75,149,1),(76,148,0),(76,150,1),(77,148,0),(77,151,1),(77,381,2),(77,93,2),(78,152,0),(79,153,0),(80,154,0),(81,382,0),(81,155,0),(82,156,0),(83,157,0),(84,383,0),(84,158,0),(85,159,0),(86,160,0),(87,384,0),(87,161,0),(88,162,0),(89,163,0),(90,385,0),(90,164,0),(91,138,0),(92,138,0),(92,165,1),(93,166,0),(94,167,0),(95,168,0),(95,57,1),(95,169,3),(95,362,4),(95,57,4),(96,386,0),(96,170,0),(96,171,1),(96,172,2),(96,387,3),(96,173,3),(96,174,4),(97,388,0),(97,175,0),(98,176,0),(98,177,1),(99,389,0),(99,178,0),(100,179,0),(101,180,0),(102,181,0),(103,182,0),(103,390,1),(103,183,1),(103,369,2),(103,108,2),(104,184,0),(105,185,0),(106,391,0),(106,186,0),(106,9,2),(107,187,0),(108,392,0),(108,188,0),(109,189,0),(110,190,0),(111,393,0),(111,191,0),(112,192,0),(113,193,0),(114,194,0),(115,195,0),(116,196,0),(116,374,1),(116,118,1),(116,394,2),(116,197,2),(116,198,3),(116,369,4),(116,108,4),(117,196,0),(117,369,1),(117,108,1),(118,199,0),(119,200,0),(120,201,0),(120,394,1),(120,197,1),(120,198,2),(120,374,3),(120,118,3),(120,369,4),(120,108,4),(121,202,0),(122,203,0),(123,204,0),(124,205,0),(125,206,0),(125,207,1),(125,208,2),(126,209,0),(127,210,0),(128,211,0),(129,212,0),(130,213,0),(130,214,2),(130,215,3),(130,369,4),(130,108,4),(131,216,0),(132,217,0),(133,218,0),(134,395,0),(134,219,0),(135,220,0),(136,221,0),(137,396,0),(137,222,0),(137,362,1),(137,57,1),(138,397,0),(138,223,0),(139,224,0),(140,398,0),(140,225,0),(141,399,0),(141,226,0),(142,227,0),(143,228,0),(143,400,1),(143,229,1),(143,401,2),(143,174,2),(144,230,0),(144,369,1),(144,108,1),(145,231,0),(146,232,0),(147,233,0),(148,234,0),(149,235,0),(150,402,0),(150,236,0),(151,237,0),(152,238,0),(153,239,0),(154,240,0),(155,403,0),(155,241,0),(156,403,0),(156,241,0),(156,404,1),(156,242,1),(157,243,0),(157,244,1),(158,243,0),(158,245,1),(159,246,0),(160,247,0),(161,248,0),(162,249,0),(163,250,0),(163,57,1),(164,251,0),(164,252,1),(164,362,2),(164,57,2),(165,405,0),(165,253,0),(166,254,0),(167,255,0),(168,256,0),(169,257,0),(169,367,1),(169,93,1),(169,406,2),(169,258,2),(170,259,0),(171,260,0),(171,243,1),(171,138,2),(172,407,0),(172,261,0),(173,262,0),(174,408,0),(174,263,0),(175,264,0),(176,265,0),(177,409,0),(177,266,0),(178,267,0),(178,268,1),(179,269,0),(180,270,0),(181,271,0),(182,272,0),(182,410,1),(182,229,1),(183,273,0),(184,274,0),(184,411,1),(184,275,1),(185,274,0),(185,276,1),(186,274,0),(186,412,1),(186,277,1),(186,413,3),(186,278,3),(187,274,0),(187,279,1),(188,274,0),(188,280,1),(189,274,0),(189,414,1),(189,281,1),(189,282,3),(190,274,0),(190,283,1),(190,415,4),(190,284,4),(191,61,0),(192,285,0),(192,286,1),(193,287,0),(193,288,1),(193,416,3),(193,289,3),(194,290,0),(194,291,1),(195,417,0),(195,292,0),(196,293,0),(197,418,0),(197,294,0),(198,295,0),(198,419,1),(198,296,1),(199,420,0),(199,297,0),(200,298,0),(201,299,0),(202,300,0),(202,362,1),(202,57,1),(203,301,0),(204,302,0),(204,303,1),(205,302,0),(205,154,1),(205,302,4),(205,304,5),(205,362,6),(205,57,6),(206,305,0),(207,306,0),(207,307,1),(208,308,0),(209,421,0),(209,309,0),(210,310,0),(210,311,2),(210,312,3),(211,313,0),(212,314,0),(213,315,0),(214,316,0),(214,207,1),(214,369,2),(214,108,2),(215,317,0),(215,422,1),(215,318,1),(215,111,3),(216,319,0),(217,320,0),(217,423,1),(217,321,1),(217,369,2),(217,108,2),(218,322,0),(219,323,0),(219,424,1),(219,324,1),(220,325,0),(221,326,0),(222,327,0),(223,328,0),(223,329,2),(224,330,0),(225,425,0),(225,331,0),(226,332,0),(227,426,0),(227,333,0),(227,427,2),(227,334,2),(227,362,3),(227,57,3),(228,335,0),(229,336,0),(230,428,0),(230,337,0),(231,423,0),(231,321,0),(231,207,1),(231,429,2),(231,338,2),(232,423,0),(232,321,0),(232,339,1),(233,423,0),(233,321,0),(233,401,1),(233,174,1),(234,423,0),(234,321,0),(234,401,1),(234,174,1),(234,340,2),(234,430,3),(234,341,3),(234,362,4),(234,57,4),(235,431,0),(235,342,0),(236,343,0),(237,344,0),(238,345,0),(238,346,1),(238,369,2),(238,108,2),(239,347,0),(239,348,1),(240,349,0),(240,362,1),(240,57,1),(240,90,2),(241,349,0),(241,362,1),(241,57,1),(241,350,2),(241,198,3),(242,432,0),(242,351,0),(242,352,2),(243,353,0),(243,354,1),(244,355,0),(245,356,0),(246,433,0),(246,357,0);
/*!40000 ALTER TABLE `node_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `name` varchar(50) NOT NULL,
  `descrip` text DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `update_url` varchar(100) DEFAULT NULL,
  `info_url` varchar(100) DEFAULT NULL,
  `inst_version` float DEFAULT NULL,
  `config` longblob DEFAULT NULL,
  `config_json` mediumtext DEFAULT NULL,
  `config_url` varchar(100) DEFAULT NULL,
  `enabled_groups` varchar(1000) DEFAULT NULL,
  `priority` int(11) DEFAULT 999,
  `disable_group_select` int(11) DEFAULT 0,
  `title` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES ('brand_guidelines','Create a brand guidelines area with custom content, resources links and colours.','Montala Limited','','https://www.resourcespace.com/knowledge-base/plugins/brand-guidelines',1,NULL,NULL,'plugins/brand_guidelines/pages/setup.php',NULL,999,1,'Brand Guidelines','list'),('consentmanager','Adds the capability to manage consent given by subjects featured within your media files.','Montala Limited','','https://www.resourcespace.com/knowledge-base/plugins/consent-manager',1,NULL,NULL,'plugins/consentmanager/pages/setup.php',NULL,999,0,'Consent Manager','user-check'),('licensemanager','Manage resource licensing.','Montala Limited','','https://www.resourcespace.com/knowledge-base/plugins/license-manager',1,NULL,NULL,'plugins/licensemanager/pages/setup.php',NULL,999,0,'License Manager','id-card'),('lightbox_preview','Use lightbox to preview the image in view.php rather than preview.php.','Axel Dörfler / Montala Ltd.','','',2,NULL,NULL,'',NULL,999,0,'Lightbox Preview','image-upscale'),('rse_search_notifications','Notify user when changes occur to a saved search.','Montala Limited','','https://www.resourcespace.com/knowledge-base/plugins/search-notifications',1,NULL,NULL,'plugins/rse_search_notifications/pages/setup.php',NULL,100,0,'Search Notifications','bell'),('rse_version','Track and restore metadata and file changes.','Montala Limited','','https://www.resourcespace.com/knowledge-base/user/version-control',2,NULL,NULL,'plugins/rse_version/pages/setup.php',NULL,100,1,'Version Control','history'),('rse_workflow','Configure custom workflow states and actions beyond the defaults.','Montala Limited','','https://www.resourcespace.com/knowledge-base/plugins/workflow',1,NULL,NULL,'plugins/rse_workflow/pages/setup.php',NULL,100,1,'Advanced Workflow','workflow'),('transform','Enables creation of cropped and scaled alternative images.','David Dwiggins/Montala Limited','','',1.4,NULL,NULL,'plugins/transform/pages/setup.php',NULL,998,0,'Image Tools (transform)','crop');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preview_size`
--

DROP TABLE IF EXISTS `preview_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `preview_size` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `id` char(3) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `padtosize` int(11) DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `internal` int(11) DEFAULT 0,
  `allow_preview` int(11) DEFAULT 0,
  `allow_restricted` int(11) DEFAULT 0,
  `quality` int(3) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preview_size`
--

LOCK TABLES `preview_size` WRITE;
/*!40000 ALTER TABLE `preview_size` DISABLE KEYS */;
INSERT INTO `preview_size` VALUES (1,'thm',200,200,0,'Thumbnail',1,0,0,0),(2,'pre',900,540,0,'Preview',1,0,1,0),(3,'scr',1400,800,0,'Screen',0,1,0,0),(4,'lpr',2000,2000,0,'Low resolution print',0,0,0,0),(5,'hpr',999999,999999,0,'High resolution print',0,0,0,0),(6,'col',140,140,0,'Collection',1,0,0,0);
/*!40000 ALTER TABLE `preview_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `query` text DEFAULT NULL,
  `support_non_correlated_sql` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`ref`),
  KEY `support_non_correlated_sql` (`support_non_correlated_sql`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'Values used in resource edits','SELECT \nTRIM( RIGHT ( diff, LENGTH ( diff ) - LOCATE ( \'\\n+\', diff ) - 2 ) ) AS `Value`, \ncount(*) AS `Count` \nFROM resource_log WHERE type = \'e\' \n\n# --- date ranges\n# Make sure date is greater than FROM date\nand date > DATE(\'[from-y]-[from-m]-[from-d]\')\n# Make sure date is less than TO date\nand date > DATE(\'[to-y]-[to-m]-[to-d]\')\n\ngroup by 1 order by 2 desc limit 5000;\n',0),(2,'Keywords used in searches','select k.keyword \'Keyword\',sum(count) Searches from keyword k,daily_stat d where k.ref=d.object_ref and d.activity_type=\'Keyword usage\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\n\ngroup by k.ref order by Searches desc\n',0),(3,'Resource download summary','\nselect r.ref \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) AS \'Title\', \ncount(*) Downloads \nfrom resource_log rl\njoin resource r on rl.resource=r.ref\nwhere rl.type=\'d\'\n  and rl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\ngroup by r.ref order by `Downloads` desc\n',0),(4,'Resource views','\nselect r.ref \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) \'Title\',sum(count) Views from resource r,daily_stat d where r.ref=d.object_ref and d.activity_type=\'Resource view\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\n\ngroup by r.ref order by Views desc;\n',0),(5,'Resources sent via e-mail','\nselect r.ref \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) \'Title\',sum(count) Sent from resource r,daily_stat d where r.ref=d.object_ref and d.activity_type=\'E-mailed resource\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\n\ngroup by r.ref order by Sent desc;\n',0),(6,'Resources added to collection','\nselect cl.resource \'Resource\',\n( SELECT n.name\nFROM resource_node rn, node n\nWHERE rn.resource = cl.resource AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) \'Title\',\ncount(*) \'Collection Add Count\'\nfrom collection_log cl\nwhere BINARY cl.type=\'a\'\nand cl.date>=date(\'[from-y]-[from-m]-[from-d]\')\nand cl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\ngroup by resource\norder by resource;\n',0),(7,'Resources created','\n\nselect\nrl.date \'Date / Time\',\nconcat(u.username,\' (\',u.fullname,\' )\') \'Created By User\',\ng.name \'User Group\',\nr.ref \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) \'Resource Title\'\n\nfrom\nresource_log rl\njoin resource r on r.ref=rl.resource\nleft outer join user u on rl.user=u.ref\nleft outer join usergroup g on u.usergroup=g.ref\nwhere\nrl.type=\'c\'\nand\nrl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\norder by rl.date\n',0),(8,'Resources with zero downloads','\nselect ref \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = resource.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) \'Title\' from resource where ref > 0 and ref not in \n\n(\nselect object_ref from daily_stat\nWHERE activity_type=\'Resource download\'\nAND\n(\nyear>[from-y]\nor \n(year=[from-y] and month>[from-m])\nor\n(year=[from-y] and month=[from-m] and day>=[from-d])\n)\nAND\n(\nyear<[to-y]\nor \n(year=[to-y] and month<[to-m])\nor\n(year=[to-y] and month=[to-m] and day<=[to-d])\n)\ngroup by object_ref\n)\n\nAND\nDATE_FORMAT(creation_date, \'%Y-%m-%d\')<=date(\'[to-y]-[to-m]-[to-d]\')\n\nAND\nref>0\n',0),(9,'Resources with zero views','\nselect ref \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = resource.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) \'Title\' from resource where ref not in \n\n(\nSELECT object_ref FROM daily_stat d\n\nWHERE d.activity_type=\'Resource view\'\n\nAND \n(\nyear>[from-y]\nor \n(year=[from-y] and month>[from-m])\nor\n(year=[from-y] and month=[from-m] and day>=[from-d])\n)\n\nAND\n(\nyear<[to-y]\nor \n(year=[to-y] and month<[to-m])\nor\n(year=[to-y] and month=[to-m] and day<=[to-d])\n)\n\ngroup by object_ref\n)\n\nAND\nDATE_FORMAT(creation_date, \'%Y-%m-%d\')<=date(\'[to-y]-[to-m]-[to-d]\')\n\nAND\nref>0\n',0),(10,'Resource downloads by group','\nselect\ng.name \'Group Name\',\ncount(rl.resource) \'Resource Downloads\'\n\nfrom\nresource_log rl\njoin resource r on r.ref=rl.resource\nleft outer join user u on rl.user=u.ref\nleft outer join usergroup g on u.usergroup=g.ref\nwhere\nrl.type=\'d\'\nand rl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\ngroup by g.ref order by `Resource Downloads` desc\n',0),(11,'Resource download detail','\nselect\nrl.date \'Date / Time\',\nconcat(u.username,\' (\',u.fullname,\' )\') \'Downloaded By User\',\ng.name \'User Group\',\nr.ref \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) \'Resource Title\',\nrt.name \'Resource Type\'\n\nfrom\nresource_log rl\njoin resource r on r.ref=rl.resource\nleft outer join user u on rl.user=u.ref\nleft outer join usergroup g on u.usergroup=g.ref\nleft outer join resource_type rt on r.resource_type=rt.ref\nwhere\nrl.type=\'d\'\nand\nrl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\norder by rl.date\n',0),(12,'User details including group allocation','select \nu.username \'Username\',\nu.email \'E-mail address\',\nu.fullname \'Full Name\',\nu.created \'Created\',\nu.last_active \'Last Seen\',\ng.name \'Group name\'\n\nfrom user u join usergroup g on u.usergroup=g.ref\n\norder by username;\n',0),(13,'Expired Resources','\nselect distinct resource.ref \'Resource ID\',resource.field8 \'Resource Title\',node.name \'Expires\' \nfrom resource \njoin resource_node on resource.ref=resource_node.resource \njoin node on node.ref=resource_node.node \njoin resource_type_field on node.resource_type_field=resource_type_field.ref \nwhere resource_type_field.type=6 and node.name>=date(\'[from-y]-[from-m]-[from-d]\') and node.name<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1) and length(node.name)>0 and resource.ref>0 order by resource.ref;\n',0),(14,'Resources created - with thumbnails','\nselect\nr.ref \'thumbnail\',\nrl.date \'Date / Time\',\nconcat(u.username,\' (\',u.fullname,\' )\') \'Created By User\',\ng.name \'User Group\',\nr.ref \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) \'Resource Title\'\n\nfrom\nresource_log rl\njoin resource r on r.ref=rl.resource\nleft outer join user u on rl.user=u.ref\nleft outer join usergroup g on u.usergroup=g.ref\nwhere\nrl.type=\'c\'\nand\nrl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\norder by rl.date;\n',0),(16,'Database statistics','\n\nselect \n(select count(*) from resource) as \'Total resources\',\n(select count(*) from keyword) \'Total keywords\',\n(select count(*) from node) as \'Total nodes (field options)\',\n(select count(*) from resource_node) as \'Resource - node (field option) relationships\',\n(select count(*) from collection) as \'Total collections\',\n(select count(*) from collection_resource) as \'Collection resource relationships\',\n(select count(*) from user) as \'Total users\';\n',0),(17,'Mail Log','\nSELECT \n  ml.ref, \n  date, \n  mail_to \'TO\', \n  IFNULL(u.username, \'SYSTEM\') \'FROM\', \n  subject,\n  sender_email\nFROM mail_log ml\nLEFT JOIN user u ON u.ref=ml.mail_from \nWHERE\n  date>=date(\'[from-y]-[from-m]-[from-d]\') and \n  date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\nORDER BY ml.ref DESC\n',0),(18,'Resource comments','\nSELECT  c.ref \'Ref\', c.created \'Date\', c.resource_ref \'Resource ID\', c.resource_ref \'thumbnail\', c.body \'Comment\', \nifnull(concat(u.username,\' (\',u.fullname,\')\'),concat(\'ANONYMOUS: \',c.fullname,\' (\',c.website_url,\')\')) \'User\', ifnull(c.email,u.email) Email\n\nFROM comment c LEFT JOIN user u ON u.ref=c.user_ref\n\nWHERE \n\nc.created>=date(\'[from-y]-[from-m]-[from-d]\') and c.created<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\norder by c.created DESC;',0),(19,'File integrity check report','\nSELECT * FROM \n(SELECT \'Oldest\' AS State, ref \'Resource\', ifnull(last_verified, \'NEVER\') \'Verified\' FROM resource WHERE ref > 0 AND integrity_fail = 0 AND no_file != 1 ORDER BY last_verified ASC LIMIT 1) AS a \nUNION ALL \nSELECT * FROM \n(SELECT \'Newest\' AS State, ref \'Resource\', ifnull(last_verified, \'NEVER\') \'Verified\' FROM resource WHERE ref > 0 AND integrity_fail = 0 AND no_file != 1 ORDER BY last_verified DESC LIMIT 1) AS b;',0),(20,'Request details','\nSELECT\n    cres.resource \'Resource ID\',\n    typ.name \'Resource Type\',\n    usreq.username \'User\',\n    req.comments \'Comments\',\n    req.created \'Date requested\',\n    req.reasonapproved \'Reason approved\',\n    CASE\n        WHEN req.status = 0 THEN \'Pending\'\n        WHEN req.status = 1 THEN \'Approved\'\n        WHEN req.status = 2 THEN \'Declined\'\n        ELSE \'UNDEFINED\'\n    END \'Outcome\',\n    usapp.username \'Approved / Declined by\'\n\nFROM request req\n\nJOIN collection_resource cres ON req.collection=cres.collection\n\nJOIN resource res ON cres.resource = res.ref\n\nJOIN resource_type typ ON res.resource_type = typ.ref\n\nJOIN user usreq ON req.user = usreq.ref\n\nLEFT OUTER JOIN user usapp ON req.approved_declined_by = usapp.ref\n\nWHERE req.created>=date(\'[from-y]-[from-m]-[from-d]\') AND req.created<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\n\nORDER BY req.created desc;',0),(21,'Searches with no results','\n  SELECT logged, `user`, search_string, resource_types, archive_states, result_count\n    FROM search_log AS sl\n   WHERE sl.result_count = 0\n     AND sl.logged >= date(\'[from-y]-[from-m]-[from-d]\')\n     AND sl.logged <= adddate(date(\'[to-y]-[to-m]-[to-d]\'), 1)\nORDER BY ref DESC;',0),(22,'Resource download detail (search results)','\n         SELECT rl.date AS \'Date / Time\',\n                concat(u.username,\' (\',u.fullname,\' )\') AS \'Downloaded By User\',\n                g.name AS \'User Group\',\n                r.ref AS \'Resource ID\',\n                ( SELECT n.name \n                FROM resource_node rn, node n \n                WHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\n                LIMIT 1 ) AS \'Resource Title\',\n                rt.name AS \'Resource Type\'\n\n           FROM resource_log rl\n           JOIN resource r ON r.ref = rl.resource\nLEFT OUTER JOIN user u ON rl.user = u.ref\nLEFT OUTER JOIN usergroup g ON u.usergroup = g.ref\nLEFT OUTER JOIN resource_type rt ON r.resource_type = rt.ref\n\n          WHERE rl.type = \'d\'\n            AND rl.date >= date(\'[from-y]-[from-m]-[from-d]\') AND rl.date <= adddate(date(\'[to-y]-[to-m]-[to-d]\'), 1)\n            AND r.ref IN [non_correlated_sql]\n       ORDER BY rl.date;',1),(23,'Resource download summary (search results)','\n  SELECT r.ref AS \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) AS \'Title\', \n         count(*) AS \'Downloads\' \n    FROM resource_log rl\n    JOIN resource r on rl.resource = r.ref\n   WHERE rl.type = \'d\'\n     AND rl.date >= date(\'[from-y]-[from-m]-[from-d]\') AND rl.date <= adddate(date(\'[to-y]-[to-m]-[to-d]\'), 1)\n     AND r.ref IN [non_correlated_sql]\nGROUP BY r.ref\nORDER BY `Downloads` DESC;',1),(24,'Resources created - with thumbnails (search results)','\n         SELECT r.ref AS \'thumbnail\',\n                rl.date AS \'Date / Time\',\n                concat(u.username,\' (\',u.fullname,\' )\') AS \'Created By User\',\n                g.name AS \'User Group\',\n                r.ref AS \'Resource ID\',\n                ( SELECT n.name \n                FROM resource_node rn, node n \n                WHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\n                LIMIT 1 ) AS \'Resource Title\'\n\n           FROM resource_log AS rl\n           JOIN resource AS r ON r.ref = rl.resource\nLEFT OUTER JOIN user AS u ON rl.user  =  u.ref\nLEFT OUTER JOIN usergroup AS g ON u.usergroup = g.ref\n\n          WHERE rl.type = \'c\'\n            AND rl.date >= date(\'[from-y]-[from-m]-[from-d]\') AND rl.date <= adddate(date(\'[to-y]-[to-m]-[to-d]\'), 1)\n            AND r.ref IN [non_correlated_sql]\n       ORDER BY rl.date;',1),(25,'Resource download detail (search results)','\n         SELECT rl.date AS \'Date / Time\',\n                concat(u.username,\' (\',u.fullname,\' )\') AS \'Downloaded By User\',\n                g.name AS \'User Group\',\n                r.ref AS \'Resource ID\',\n                ( SELECT n.name \n                FROM resource_node rn, node n \n                WHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\n                LIMIT 1 ) AS \'Resource Title\',\n                rt.name AS \'Resource Type\'\n\n           FROM resource_log rl\n           JOIN resource r ON r.ref = rl.resource\nLEFT OUTER JOIN user u ON rl.user = u.ref\nLEFT OUTER JOIN usergroup g ON u.usergroup = g.ref\nLEFT OUTER JOIN resource_type rt ON r.resource_type = rt.ref\n\n          WHERE rl.type = \'d\'\n            AND rl.date >= date(\'[from-y]-[from-m]-[from-d]\') AND rl.date <= adddate(date(\'[to-y]-[to-m]-[to-d]\'), 1)\n            AND r.ref IN [non_correlated_sql]\n       ORDER BY rl.date;',1),(26,'Resource download summary (search results)','\n  SELECT r.ref AS \'Resource ID\',\n( SELECT n.name \nFROM resource_node rn, node n \nWHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\nLIMIT 1 ) AS \'Title\', \n         count(*) AS \'Downloads\' \n    FROM resource_log rl\n    JOIN resource r on rl.resource = r.ref\n   WHERE rl.type = \'d\'\n     AND rl.date >= date(\'[from-y]-[from-m]-[from-d]\') AND rl.date <= adddate(date(\'[to-y]-[to-m]-[to-d]\'), 1)\n     AND r.ref IN [non_correlated_sql]\nGROUP BY r.ref\nORDER BY `Downloads` DESC;',1),(27,'Resources created - with thumbnails (search results)','\n         SELECT r.ref AS \'thumbnail\',\n                rl.date AS \'Date / Time\',\n                concat(u.username,\' (\',u.fullname,\' )\') AS \'Created By User\',\n                g.name AS \'User Group\',\n                r.ref AS \'Resource ID\',\n                ( SELECT n.name \n                FROM resource_node rn, node n \n                WHERE rn.resource = r.ref AND n.ref = rn.node and n.resource_type_field = [title_field]\n                LIMIT 1 ) AS \'Resource Title\'\n\n           FROM resource_log AS rl\n           JOIN resource AS r ON r.ref = rl.resource\nLEFT OUTER JOIN user AS u ON rl.user  =  u.ref\nLEFT OUTER JOIN usergroup AS g ON u.usergroup = g.ref\n\n          WHERE rl.type = \'c\'\n            AND rl.date >= date(\'[from-y]-[from-m]-[from-d]\') AND rl.date <= adddate(date(\'[to-y]-[to-m]-[to-d]\'), 1)\n            AND r.ref IN [non_correlated_sql]\n       ORDER BY rl.date;',1);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_periodic_emails`
--

DROP TABLE IF EXISTS `report_periodic_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_periodic_emails` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `send_all_users` int(11) DEFAULT NULL,
  `user_groups` varchar(255) DEFAULT NULL,
  `report` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `email_days` int(11) DEFAULT NULL,
  `last_sent` datetime DEFAULT NULL,
  `search_params` text DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_periodic_emails`
--

LOCK TABLES `report_periodic_emails` WRITE;
/*!40000 ALTER TABLE `report_periodic_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_periodic_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_periodic_emails_unsubscribe`
--

DROP TABLE IF EXISTS `report_periodic_emails_unsubscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_periodic_emails_unsubscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `periodic_email_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_periodic_emails_unsubscribe`
--

LOCK TABLES `report_periodic_emails_unsubscribe` WRITE;
/*!40000 ALTER TABLE `report_periodic_emails_unsubscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_periodic_emails_unsubscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `request_mode` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 0,
  `comments` text DEFAULT NULL,
  `expires` date DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `reasonapproved` text DEFAULT NULL,
  `approved_declined_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_request`
--

DROP TABLE IF EXISTS `research_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_request` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `finaluse` text DEFAULT NULL,
  `resource_types` varchar(50) DEFAULT NULL,
  `noresources` int(11) DEFAULT NULL,
  `shape` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `collection` int(11) DEFAULT NULL,
  `custom_fields_json` longtext DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `research_collections` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_request`
--

LOCK TABLES `research_request` WRITE;
/*!40000 ALTER TABLE `research_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `research_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `resource_type` int(11) DEFAULT NULL,
  `has_image` int(11) DEFAULT 0,
  `is_transcoding` int(11) DEFAULT 0,
  `hit_count` int(11) DEFAULT 0,
  `new_hit_count` int(11) DEFAULT 0,
  `creation_date` datetime DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `user_rating` int(11) DEFAULT NULL,
  `user_rating_count` int(11) DEFAULT NULL,
  `user_rating_total` int(11) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `preview_extension` varchar(10) DEFAULT NULL,
  `image_red` int(11) DEFAULT NULL,
  `image_green` int(11) DEFAULT NULL,
  `image_blue` int(11) DEFAULT NULL,
  `thumb_width` int(11) DEFAULT NULL,
  `thumb_height` int(11) DEFAULT NULL,
  `archive` int(11) DEFAULT 0,
  `access` int(11) DEFAULT 0,
  `colour_key` varchar(5) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `file_modified` datetime DEFAULT NULL,
  `file_checksum` varchar(32) DEFAULT NULL,
  `request_count` int(11) DEFAULT 0,
  `expiry_notification_sent` int(11) DEFAULT 0,
  `preview_tweaks` varchar(50) DEFAULT NULL,
  `geo_lat` double DEFAULT NULL,
  `geo_long` double DEFAULT NULL,
  `mapzoom` int(11) DEFAULT NULL,
  `disk_usage` bigint(20) DEFAULT NULL,
  `disk_usage_last_updated` datetime DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `preview_attempts` int(11) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_verified` datetime DEFAULT NULL,
  `integrity_fail` tinyint(1) DEFAULT 0,
  `lock_user` int(11) DEFAULT NULL,
  `no_file` tinyint(1) DEFAULT 0,
  `field12` varchar(200) DEFAULT NULL,
  `field8` varchar(200) DEFAULT NULL,
  `field3` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `hit_count` (`hit_count`),
  KEY `resource_archive` (`archive`),
  KEY `resource_access` (`access`),
  KEY `resource_type` (`resource_type`),
  KEY `resource_creation_date` (`creation_date`),
  KEY `rating` (`rating`),
  KEY `colour_key` (`colour_key`),
  KEY `has_image` (`has_image`),
  KEY `file_checksum` (`file_checksum`),
  KEY `geo_lat` (`geo_lat`),
  KEY `geo_long` (`geo_long`),
  KEY `disk_usage` (`disk_usage`),
  KEY `created_by` (`created_by`),
  KEY `no_file` (`no_file`),
  KEY `file_size` (`file_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_alt_files`
--

DROP TABLE IF EXISTS `resource_alt_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_alt_files` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `resource` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT 0,
  `creation_date` datetime DEFAULT NULL,
  `unoconv` int(11) DEFAULT NULL,
  `alt_type` varchar(100) DEFAULT NULL,
  `page_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_alt_files`
--

LOCK TABLES `resource_alt_files` WRITE;
/*!40000 ALTER TABLE `resource_alt_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_alt_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_consent`
--

DROP TABLE IF EXISTS `resource_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_consent` (
  `resource` int(11) DEFAULT NULL,
  `consent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_consent`
--

LOCK TABLES `resource_consent` WRITE;
/*!40000 ALTER TABLE `resource_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_custom_access`
--

DROP TABLE IF EXISTS `resource_custom_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_custom_access` (
  `resource` int(11) DEFAULT NULL,
  `usergroup` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `user_expires` date DEFAULT NULL,
  KEY `resource` (`resource`),
  KEY `usergroup` (`usergroup`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_custom_access`
--

LOCK TABLES `resource_custom_access` WRITE;
/*!40000 ALTER TABLE `resource_custom_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_custom_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_dimensions`
--

DROP TABLE IF EXISTS `resource_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_dimensions` (
  `resource` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT 0,
  `height` int(11) DEFAULT 0,
  `file_size` bigint(20) DEFAULT 0,
  `resolution` int(11) DEFAULT 0,
  `unit` varchar(11) DEFAULT '0',
  `page_count` int(11) DEFAULT NULL,
  KEY `resource` (`resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_dimensions`
--

LOCK TABLES `resource_dimensions` WRITE;
/*!40000 ALTER TABLE `resource_dimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_keyword`
--

DROP TABLE IF EXISTS `resource_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_keyword` (
  `resource` int(11) DEFAULT NULL,
  `keyword` int(11) DEFAULT NULL,
  `hit_count` int(11) DEFAULT 0,
  `position` int(11) DEFAULT 0,
  `resource_type_field` int(11) DEFAULT 0,
  `new_hit_count` int(11) DEFAULT 0,
  KEY `resource_keyword` (`resource`,`keyword`),
  KEY `resource` (`resource`),
  KEY `keyword` (`keyword`),
  KEY `resource_type_field` (`resource_type_field`),
  KEY `rk_all` (`resource`,`keyword`,`resource_type_field`,`hit_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_keyword`
--

LOCK TABLES `resource_keyword` WRITE;
/*!40000 ALTER TABLE `resource_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_license`
--

DROP TABLE IF EXISTS `resource_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_license` (
  `resource` int(11) DEFAULT NULL,
  `license` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_license`
--

LOCK TABLES `resource_license` WRITE;
/*!40000 ALTER TABLE `resource_license` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_log`
--

DROP TABLE IF EXISTS `resource_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_log` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `resource` int(11) DEFAULT NULL,
  `type` char(5) DEFAULT NULL,
  `resource_type_field` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `diff` mediumtext DEFAULT NULL,
  `usageoption` int(11) DEFAULT NULL,
  `access_key` char(50) DEFAULT NULL,
  `previous_value` longtext DEFAULT NULL,
  `alt_ref` int(11) DEFAULT NULL,
  `previous_file_alt_ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `resource` (`resource`),
  KEY `type` (`type`),
  KEY `user` (`user`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_log`
--

LOCK TABLES `resource_log` WRITE;
/*!40000 ALTER TABLE `resource_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_node`
--

DROP TABLE IF EXISTS `resource_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_node` (
  `resource` int(11) NOT NULL,
  `node` int(11) NOT NULL,
  `hit_count` int(11) DEFAULT 0,
  `new_hit_count` int(11) DEFAULT 0,
  PRIMARY KEY (`resource`,`node`),
  KEY `resource` (`resource`),
  KEY `node` (`node`),
  KEY `hit_count` (`hit_count`),
  KEY `node_resource_hit_count` (`node`,`resource`,`hit_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_node`
--

LOCK TABLES `resource_node` WRITE;
/*!40000 ALTER TABLE `resource_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_related`
--

DROP TABLE IF EXISTS `resource_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_related` (
  `resource` int(11) DEFAULT NULL,
  `related` int(11) DEFAULT NULL,
  KEY `resource_related` (`resource`),
  KEY `related` (`related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_related`
--

LOCK TABLES `resource_related` WRITE;
/*!40000 ALTER TABLE `resource_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type`
--

DROP TABLE IF EXISTS `resource_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_type` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `allowed_extensions` text DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  `config_options` text DEFAULT NULL,
  `push_metadata` int(11) DEFAULT NULL,
  `colour` smallint(6) DEFAULT NULL,
  `icon` tinytext DEFAULT NULL,
  `tab` int(11) DEFAULT NULL,
  `pull_images` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type`
--

LOCK TABLES `resource_type` WRITE;
/*!40000 ALTER TABLE `resource_type` DISABLE KEYS */;
INSERT INTO `resource_type` VALUES (1,'Photo',NULL,NULL,NULL,NULL,NULL,'image',NULL,NULL),(2,'Document',NULL,NULL,NULL,NULL,NULL,'file-text',NULL,NULL),(3,'Video',NULL,NULL,NULL,NULL,NULL,'video',NULL,NULL),(4,'Audio',NULL,NULL,NULL,NULL,NULL,'music',NULL,NULL);
/*!40000 ALTER TABLE `resource_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type_field`
--

DROP TABLE IF EXISTS `resource_type_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_type_field` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(400) DEFAULT NULL,
  `field_constraint` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT 1,
  `order_by` int(11) DEFAULT 0,
  `keywords_index` int(11) DEFAULT 0,
  `partial_index` int(11) DEFAULT 0,
  `global` tinyint(1) DEFAULT 1,
  `resource_column` varchar(50) DEFAULT NULL,
  `display_field` int(11) DEFAULT 1,
  `iptc_equiv` varchar(20) DEFAULT NULL,
  `display_template` text DEFAULT NULL,
  `required` int(11) DEFAULT 0,
  `smart_theme_name` varchar(200) DEFAULT NULL,
  `exiftool_field` varchar(200) DEFAULT NULL,
  `advanced_search` int(11) DEFAULT 1,
  `simple_search` int(11) DEFAULT 0,
  `help_text` text DEFAULT NULL,
  `display_as_dropdown` int(11) DEFAULT 0,
  `external_user_access` int(11) DEFAULT 1,
  `autocomplete_macro` text DEFAULT NULL,
  `hide_when_uploading` int(11) DEFAULT 0,
  `hide_when_restricted` int(11) DEFAULT 0,
  `value_filter` text DEFAULT NULL,
  `exiftool_filter` text DEFAULT NULL,
  `omit_when_copying` int(11) DEFAULT 0,
  `tooltip_text` text DEFAULT NULL,
  `regexp_filter` varchar(400) DEFAULT NULL,
  `display_condition` varchar(400) DEFAULT NULL,
  `onchange_macro` text DEFAULT NULL,
  `linked_data_field` text DEFAULT NULL,
  `automatic_nodes_ordering` tinyint(1) DEFAULT 0,
  `fits_field` varchar(255) DEFAULT NULL,
  `personal_data` tinyint(1) DEFAULT 0,
  `include_in_csv_export` tinyint(1) DEFAULT 1,
  `read_only` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `full_width` tinyint(1) DEFAULT 0,
  `tab` int(11) DEFAULT NULL,
  `complete_index` int(11) DEFAULT 0,
  `sort_method` int(11) DEFAULT 0,
  `geomapping` int(11) DEFAULT 0,
  PRIMARY KEY (`ref`),
  KEY `gloal` (`global`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type_field`
--

LOCK TABLES `resource_type_field` WRITE;
/*!40000 ALTER TABLE `resource_type_field` DISABLE KEYS */;
INSERT INTO `resource_type_field` VALUES (1,'keywords','Keywords - Other',NULL,9,60,1,0,1,NULL,1,'2#025',NULL,0,NULL,'IPTC:Keywords,Subject,XMP:Keywords',1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(3,'country','Country',NULL,9,80,1,0,1,'country',1,'2#101',NULL,0,NULL,'IPTC:Country-PrimaryLocationName,XMP:Country',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(8,'title','Title',NULL,0,10,1,0,1,'title',0,'2#005',NULL,1,NULL,'IPTC:ObjectName,XMP:title',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,0,0,0,NULL),(9,'extract','Document extract',NULL,1,7,0,0,0,NULL,1,NULL,'<div class=\"RecordStory\">\n  <h1>[title]</h1>\n\n  <p>[value]</p>\n\n</div>',0,NULL,NULL,1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(10,'credit','Credit',NULL,0,120,1,0,1,NULL,1,'2#080',NULL,0,NULL,'IPTC:Credit,XMP:Credit',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,0,0,0,NULL),(12,'date','Date',NULL,4,90,1,0,1,'creation_date',1,'2#055',NULL,0,NULL,'DateTimeOriginal,IPTC:DateCreated,XMP:DateCreated',0,0,NULL,0,1,NULL,0,0,'//SIG72c81721f04f50b06b7ad39d6cb8a3d7df62319215006054f2559b0c52adc136\nif ($value!=\'\'){$value=nicedate($value,false);}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(18,'caption','Caption',NULL,1,20,1,0,1,NULL,1,'2#120','<div class=\"item\"><h3>[title]</h3><p>[value]</p></div>\n\n<div class=\"clearerleft\"> </div>',0,NULL,'IPTC:Caption-Abstract,XMP:Description',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(25,'notes','Notes',NULL,1,130,0,0,1,NULL,1,'2#103','<div class=\"RecordStory\">\n\n  <h1>[title]</h1>\n\n  <p>[value]</p>\n\n</div>',0,NULL,'JobID',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(29,'person','Named person(s)',NULL,9,70,1,0,1,NULL,1,NULL,NULL,0,NULL,'XMP:PersonInImage,XMP:People',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,0,0,0,NULL),(51,'originalfilename','Original filename',NULL,0,100,1,0,1,'file_path',1,NULL,NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(52,'camera','Camera make / model',NULL,0,1600,0,0,0,NULL,1,NULL,NULL,0,NULL,'Model',1,0,NULL,0,1,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(54,'source','Source',NULL,3,1601,0,0,0,NULL,1,NULL,NULL,0,NULL,'XMP:FileSource',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(72,'text','Extracted text',NULL,5,110,0,0,1,NULL,0,NULL,'<div class=\"item\"><h3>[title]</h3><p>[value]</p></div><div class=\"clearerleft\"> </div>',0,NULL,NULL,1,0,NULL,0,1,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(73,'subject','Keywords - Subject',NULL,2,30,1,0,1,NULL,1,NULL,NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,0,0,0,NULL),(74,'event','Keywords - Event',NULL,2,50,1,0,1,NULL,1,NULL,NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(75,'emotion','Keywords - Emotion',NULL,2,40,1,0,1,NULL,1,NULL,NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(76,'framerate','Frame Rate',NULL,0,0,1,0,0,NULL,1,NULL,NULL,0,NULL,'framerate',1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(77,'videobitrate','Video Bitrate',NULL,0,0,1,0,0,NULL,1,NULL,NULL,0,NULL,'videobitrate',1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(78,'aspectratio','Aspect Ratio',NULL,0,0,1,0,0,NULL,1,NULL,NULL,0,NULL,'aspectratio',1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(79,'videosize','Video Size',NULL,0,0,0,0,0,NULL,1,NULL,NULL,0,NULL,'imagesize',1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(80,'duration','Duration',NULL,0,0,0,0,0,NULL,1,NULL,NULL,0,NULL,'duration',1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(81,'channelmode','Channel Mode',NULL,0,0,1,0,0,NULL,1,NULL,NULL,0,NULL,'channelmode',1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(82,'samplerate','Sample Rate',NULL,0,0,0,0,0,NULL,1,NULL,NULL,0,NULL,'samplerate',1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(83,'audiobitrate','Audio Bitrate',NULL,0,0,1,0,0,NULL,1,NULL,NULL,0,NULL,'audiobitrate',1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL),(84,'recognised','Keywords - Recognised',0,9,0,1,0,0,NULL,1,NULL,NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,1,1,0,0,0,0,NULL),(85,'landmark','Keywords - Landmark',0,9,0,1,0,0,NULL,1,NULL,NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,1,1,0,0,0,0,NULL),(86,'accessibilityalttext','Accessibility - Alt Text',0,0,0,0,0,0,NULL,1,NULL,NULL,0,NULL,'AltTextAccessibility',1,0,'Enter text describing the appearance of the image from a visual perspective, focusing on details that are relevant to the purpose and meaning of the image.\n\nA maximum of 250 characters can be entered.',0,1,NULL,0,0,NULL,NULL,0,NULL,'^.{0,250}$',NULL,NULL,NULL,NULL,'0',NULL,0,1,1,0,0,0,0,NULL),(87,'accessibilityextend','Accessibility - Extended Description',NULL,1,0,0,0,0,NULL,1,NULL,NULL,0,NULL,'ExtDescrAccessibility',1,0,'Enter the text describing the appearance of an image from a visual perspective, focusing on relevant details that further describe the meaning and purpose of the image.',0,1,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,1,1,0,0,0,0,NULL);
/*!40000 ALTER TABLE `resource_type_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type_field_resource_type`
--

DROP TABLE IF EXISTS `resource_type_field_resource_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_type_field_resource_type` (
  `resource_type_field` int(11) NOT NULL,
  `resource_type` int(11) NOT NULL,
  PRIMARY KEY (`resource_type_field`,`resource_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type_field_resource_type`
--

LOCK TABLES `resource_type_field_resource_type` WRITE;
/*!40000 ALTER TABLE `resource_type_field_resource_type` DISABLE KEYS */;
INSERT INTO `resource_type_field_resource_type` VALUES (9,2),(52,1),(54,1),(76,3),(77,3),(78,3),(79,3),(80,4),(81,4),(82,4),(83,4),(84,1),(85,1),(86,1),(87,1);
/*!40000 ALTER TABLE `resource_type_field_resource_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_log`
--

DROP TABLE IF EXISTS `search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_log` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `search_string` mediumtext DEFAULT NULL,
  `resource_types` mediumtext DEFAULT NULL,
  `archive_states` mediumtext DEFAULT NULL,
  `logged` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` int(11) DEFAULT NULL,
  `result_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `idx_result_count` (`result_count`),
  KEY `idx_logged` (`logged`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_log`
--

LOCK TABLES `search_log` WRITE;
/*!40000 ALTER TABLE `search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_saved`
--

DROP TABLE IF EXISTS `search_saved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_saved` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `search` text DEFAULT NULL,
  `restypes` text DEFAULT NULL,
  `archive` varchar(100) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `checksum` varchar(100) DEFAULT NULL,
  `checksum_when` datetime DEFAULT NULL,
  `checksum_matches` int(11) DEFAULT NULL,
  `checksum_data` longtext DEFAULT NULL,
  `checksum_data_previous` longtext DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_saved`
--

LOCK TABLES `search_saved` WRITE;
/*!40000 ALTER TABLE `search_saved` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_saved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_text`
--

DROP TABLE IF EXISTS `site_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_text` (
  `page` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `specific_to_group` int(11) DEFAULT NULL,
  `custom` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_text`
--

LOCK TABLES `site_text` WRITE;
/*!40000 ALTER TABLE `site_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow`
--

DROP TABLE IF EXISTS `slideshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slideshow` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `resource_ref` int(11) DEFAULT NULL,
  `homepage_show` tinyint(1) DEFAULT 1,
  `login_show` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow`
--

LOCK TABLES `slideshow` WRITE;
/*!40000 ALTER TABLE `slideshow` DISABLE KEYS */;
INSERT INTO `slideshow` VALUES (1,NULL,1,1);
/*!40000 ALTER TABLE `slideshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysvars`
--

DROP TABLE IF EXISTS `sysvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysvars` (
  `name` varchar(50) DEFAULT NULL,
  `value` text DEFAULT NULL,
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysvars`
--

LOCK TABLES `sysvars` WRITE;
/*!40000 ALTER TABLE `sysvars` DISABLE KEYS */;
INSERT INTO `sysvars` VALUES ('SEARCH_FILTER_MIGRATION','1'),('EDIT_FILTER_MIGRATION','1'),('fixed_list_revert_enabled','2026-09-30 13:18:36'),('upgrade_progress_script','Completed'),('upgrade_system_level','30'),('upgrade_progress_overall','Completed');
/*!40000 ALTER TABLE `sysvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab`
--

DROP TABLE IF EXISTS `tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tab` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab`
--

LOCK TABLES `tab` WRITE;
/*!40000 ALTER TABLE `tab` DISABLE KEYS */;
INSERT INTO `tab` VALUES (1,'Default',10);
/*!40000 ALTER TABLE `tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `usergroup` int(11) DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `logged_in` int(11) DEFAULT NULL,
  `last_browser` text DEFAULT NULL,
  `last_ip` varchar(100) DEFAULT NULL,
  `current_collection` int(11) DEFAULT NULL,
  `accepted_terms` int(11) DEFAULT 0,
  `account_expires` datetime DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `session` varchar(50) DEFAULT NULL,
  `ip_restrict` text DEFAULT NULL,
  `search_filter_override` text DEFAULT NULL,
  `password_last_change` datetime DEFAULT NULL,
  `login_tries` int(11) DEFAULT 0,
  `login_last_try` datetime DEFAULT NULL,
  `approved` int(11) DEFAULT 1,
  `lang` varchar(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `hidden_collections` text DEFAULT NULL,
  `password_reset_hash` varchar(100) DEFAULT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `unique_hash` varchar(50) DEFAULT NULL,
  `csrf_token` varchar(255) DEFAULT NULL,
  `search_filter_o_id` int(11) DEFAULT NULL,
  `profile_image` text DEFAULT NULL,
  `profile_text` varchar(500) DEFAULT NULL,
  `email_invalid` int(1) DEFAULT 0,
  `email_rate_limit_active` int(1) DEFAULT 0,
  `processing_messages` text DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `session` (`session`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$argon2id$v=19$m=131072,t=4,p=2$cEovdkhNMlR4NERTcEZsQQ$26yRU+dSNGkre76ME0D1Yii5DH9yMKqdfvrB8lNcJnc','Administrator','admin@example.com',3,NULL,0,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,'en','2026-09-30 13:18:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_collection`
--

DROP TABLE IF EXISTS `user_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_collection` (
  `user` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `request_feedback` int(11) DEFAULT 0,
  KEY `collection` (`collection`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collection`
--

LOCK TABLES `user_collection` WRITE;
/*!40000 ALTER TABLE `user_collection` DISABLE KEYS */;
INSERT INTO `user_collection` VALUES (1,1,0);
/*!40000 ALTER TABLE `user_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dash_tile`
--

DROP TABLE IF EXISTS `user_dash_tile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dash_tile` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `dash_tile` int(11) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dash_tile`
--

LOCK TABLES `user_dash_tile` WRITE;
/*!40000 ALTER TABLE `user_dash_tile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_dash_tile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_message` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ref`,`user`,`message`,`seen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `parameter` varchar(150) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `usergroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,NULL,'download_filename_format','RS%resource_%filename%size.%extension',NULL);
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rating` (
  `user` int(11) DEFAULT 0,
  `rating` int(11) DEFAULT 0,
  `ref` int(11) DEFAULT 0,
  KEY `ref` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_report`
--

DROP TABLE IF EXISTS `user_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_report` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `params` text DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_report`
--

LOCK TABLES `user_report` WRITE;
/*!40000 ALTER TABLE `user_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userlist`
--

DROP TABLE IF EXISTS `user_userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_userlist` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `userlist_name` varchar(50) DEFAULT NULL,
  `userlist_string` text DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userlist`
--

LOCK TABLES `user_userlist` WRITE;
/*!40000 ALTER TABLE `user_userlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroup` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `parent` varchar(50) DEFAULT NULL,
  `search_filter` text DEFAULT NULL,
  `edit_filter` text DEFAULT NULL,
  `derestrict_filter` text DEFAULT NULL,
  `ip_restrict` text DEFAULT NULL,
  `resource_defaults` text DEFAULT NULL,
  `config_options` text DEFAULT NULL,
  `welcome_message` text DEFAULT NULL,
  `request_mode` int(11) DEFAULT 0,
  `allow_registration_selection` int(11) DEFAULT 0,
  `group_specific_logo` text DEFAULT NULL,
  `inherit_flags` text DEFAULT NULL,
  `search_filter_id` int(11) DEFAULT NULL,
  `download_limit` smallint(6) DEFAULT 0,
  `download_log_days` smallint(6) DEFAULT 0,
  `edit_filter_id` int(11) DEFAULT NULL,
  `derestrict_filter_id` int(11) DEFAULT NULL,
  `group_specific_logo_dark` text DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` VALUES (1,'Administrators','s,g,c,t,h,r,u,i,e-2,e-1,e0,e1,e3,v,o,m,q,f*,j*,k,R,Ra,Rb,x,hdta,lm,cm','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'General Users','s,e-1,e-2,g,d,q,f*,j*,z1,z2,z3','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Super Admin','s,g,c,a,t,h,hdt_ug,u,r,i,e-2,e-1,e0,e1,e2,e3,o,m,g,v,q,f*,j*,k,R,Ra,x,ex','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Archivists','s,g,c,t,h,r,u,i,e1,e2,e3,v,q,f*,j*','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Restricted User - Requests Emailed (manual fulfilment)','s,f*,j*,q,dtu,z1,z2,z3','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Restricted User - Requests Managed','s,f*,j*,q,dtu,z1,z2,z3','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_collection`
--

DROP TABLE IF EXISTS `usergroup_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroup_collection` (
  `usergroup` int(11) NOT NULL DEFAULT 0,
  `collection` int(11) NOT NULL DEFAULT 0,
  `request_feedback` int(11) DEFAULT 0,
  PRIMARY KEY (`usergroup`,`collection`),
  KEY `usergroup` (`usergroup`),
  KEY `collection` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_collection`
--

LOCK TABLES `usergroup_collection` WRITE;
/*!40000 ALTER TABLE `usergroup_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_dash_tile`
--

DROP TABLE IF EXISTS `usergroup_dash_tile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroup_dash_tile` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup` int(11) DEFAULT NULL,
  `dash_tile` int(11) DEFAULT NULL,
  `default_order_by` int(11) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_dash_tile`
--

LOCK TABLES `usergroup_dash_tile` WRITE;
/*!40000 ALTER TABLE `usergroup_dash_tile` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_dash_tile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_actions`
--

DROP TABLE IF EXISTS `workflow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_actions` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `buttontext` varchar(255) DEFAULT NULL,
  `statusfrom` varchar(255) DEFAULT NULL,
  `statusto` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_actions`
--

LOCK TABLES `workflow_actions` WRITE;
/*!40000 ALTER TABLE `workflow_actions` DISABLE KEYS */;
INSERT INTO `workflow_actions` VALUES (1,'Publish','Make this resource active','Publish','-2,-1',0),(2,'Return to review','Return to review','Return to review','0',-1),(3,'Return to user review','Return to user review','Return to user review','0,-1',-2),(4,'Archive','Archive','Archive','-2,-1,0,1',2);
/*!40000 ALTER TABLE `workflow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'resourcespace'
--

--
-- Dumping routines for database 'resourcespace'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 13:20:48
