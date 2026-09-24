/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rconfig
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
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `attribute_changes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attribute_changes`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `events_ids` varchar(255) DEFAULT NULL,
  `connection_category` varchar(255) DEFAULT NULL,
  `connection_ids` text DEFAULT NULL,
  `class` text DEFAULT NULL,
  `function` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log_archives`
--

DROP TABLE IF EXISTS `activity_log_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log_archives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_id` int(10) unsigned NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `attribute_changes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attribute_changes`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `events_ids` varchar(255) DEFAULT NULL,
  `connection_category` varchar(255) DEFAULT NULL,
  `connection_ids` text DEFAULT NULL,
  `class` text DEFAULT NULL,
  `function` text DEFAULT NULL,
  `original_created_at` timestamp NULL DEFAULT NULL,
  `original_updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_archives_original_id_index` (`original_id`),
  KEY `activity_log_archives_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log_archives`
--

LOCK TABLES `activity_log_archives` WRITE;
/*!40000 ALTER TABLE `activity_log_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(191) NOT NULL,
  `categoryDescription` text DEFAULT NULL,
  `badgeColor` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoryName` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Routers',NULL,'badge-primary','2018-06-06 22:20:44',NULL),(2,'Switches',NULL,'bg-danger','2018-06-06 22:20:52',NULL),(3,'Firewalls',NULL,'badge-warning','2018-06-06 21:21:04',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_command`
--

DROP TABLE IF EXISTS `category_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_command` (
  `category_id` int(11) DEFAULT NULL,
  `command_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_command`
--

LOCK TABLES `category_command` WRITE;
/*!40000 ALTER TABLE `category_command` DISABLE KEYS */;
INSERT INTO `category_command` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `category_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_device`
--

DROP TABLE IF EXISTS `category_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_device` (
  `category_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_device`
--

LOCK TABLES `category_device` WRITE;
/*!40000 ALTER TABLE `category_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_task`
--

DROP TABLE IF EXISTS `category_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_task` (
  `category_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_task`
--

LOCK TABLES `category_task` WRITE;
/*!40000 ALTER TABLE `category_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES (1,'show clock','An Example command','2019-07-16 05:51:44','2019-07-16 05:51:44'),(2,'show version','An Example command','2019-07-16 05:51:44','2019-07-16 05:51:44'),(3,'show run','An Example command','2019-07-16 05:51:44','2019-07-16 05:51:44');
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_changes`
--

DROP TABLE IF EXISTS `config_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_changes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `current_config_id` bigint(20) unsigned NOT NULL,
  `previous_config_id` bigint(20) unsigned NOT NULL,
  `config_version` int(11) NOT NULL,
  `config_change_type` varchar(255) NOT NULL,
  `config_diff` longtext NOT NULL,
  `compare_exclusion_settings` longtext DEFAULT NULL,
  `change_trigger` varchar(255) NOT NULL DEFAULT 'pull',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_changes_date_type` (`created_at`,`config_change_type`),
  KEY `idx_changes_config_date` (`current_config_id`,`created_at`),
  KEY `config_changes_current_config_id_index` (`current_config_id`),
  KEY `config_changes_previous_config_id_index` (`previous_config_id`),
  FULLTEXT KEY `idx_config_diff_fulltext` (`config_diff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_changes`
--

LOCK TABLES `config_changes` WRITE;
/*!40000 ALTER TABLE `config_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_summaries`
--

DROP TABLE IF EXISTS `config_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_summaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `download_status_0_count` int(11) NOT NULL DEFAULT 0,
  `download_status_1_count` int(11) NOT NULL DEFAULT 0,
  `download_status_2_count` int(11) NOT NULL DEFAULT 0,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `total_file_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_summaries`
--

LOCK TABLES `config_summaries` WRITE;
/*!40000 ALTER TABLE `config_summaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_category` varchar(255) DEFAULT NULL,
  `command` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `download_status` int(11) DEFAULT NULL,
  `report_id` varchar(255) DEFAULT NULL,
  `config_location` varchar(255) DEFAULT NULL,
  `config_filename` varchar(255) DEFAULT NULL,
  `config_filesize` bigint(20) DEFAULT NULL,
  `config_hash` longtext DEFAULT NULL,
  `config_version` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `latest_version` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `configs_device_id_device_name_command_report_id_index` (`device_id`,`device_name`,`command`,`report_id`),
  KEY `idx_configs_device_command_date` (`device_id`,`command`,`created_at`),
  KEY `idx_configs_device_latest` (`device_id`,`latest_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_comments`
--

DROP TABLE IF EXISTS `device_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_comments`
--

LOCK TABLES `device_comments` WRITE;
/*!40000 ALTER TABLE `device_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_credentials`
--

DROP TABLE IF EXISTS `device_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_credentials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cred_name` varchar(255) NOT NULL,
  `cred_description` text DEFAULT NULL,
  `cred_username` varchar(255) NOT NULL,
  `cred_password` varchar(255) NOT NULL,
  `cred_enable_password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_credentials`
--

LOCK TABLES `device_credentials` WRITE;
/*!40000 ALTER TABLE `device_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_models`
--

DROP TABLE IF EXISTS `device_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_models`
--

LOCK TABLES `device_models` WRITE;
/*!40000 ALTER TABLE `device_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tag`
--

DROP TABLE IF EXISTS `device_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tag` (
  `device_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tag`
--

LOCK TABLES `device_tag` WRITE;
/*!40000 ALTER TABLE `device_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_task`
--

DROP TABLE IF EXISTS `device_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_task` (
  `device_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_task`
--

LOCK TABLES `device_task` WRITE;
/*!40000 ALTER TABLE `device_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_template`
--

DROP TABLE IF EXISTS `device_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_template` (
  `device_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_template`
--

LOCK TABLES `device_template` WRITE;
/*!40000 ALTER TABLE `device_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_vendor`
--

DROP TABLE IF EXISTS `device_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_vendor` (
  `device_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_vendor`
--

LOCK TABLES `device_vendor` WRITE;
/*!40000 ALTER TABLE `device_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(191) DEFAULT NULL,
  `device_ip` varchar(191) DEFAULT NULL,
  `device_port_override` varchar(255) DEFAULT NULL,
  `device_default_creds_on` int(11) DEFAULT NULL,
  `device_cred_id` int(11) DEFAULT 0,
  `device_username` varchar(191) DEFAULT NULL,
  `device_password` text DEFAULT NULL,
  `device_enable_password` text DEFAULT NULL,
  `ssh_key_id` varchar(255) DEFAULT NULL,
  `device_main_prompt` varchar(255) DEFAULT NULL,
  `device_enable_prompt` varchar(191) DEFAULT NULL,
  `device_category_id` int(11) DEFAULT NULL,
  `device_template` int(11) DEFAULT NULL,
  `device_model` varchar(191) DEFAULT NULL,
  `device_version` varchar(191) DEFAULT NULL,
  `device_added_by` varchar(191) DEFAULT '-',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `last_seen` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_device_name_index` (`device_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_check_result_history_items`
--

DROP TABLE IF EXISTS `health_check_result_history_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_check_result_history_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `check_name` varchar(255) NOT NULL,
  `check_label` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `notification_message` text DEFAULT NULL,
  `short_summary` varchar(255) DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`meta`)),
  `ended_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `batch` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_check_result_history_items`
--

LOCK TABLES `health_check_result_history_items` WRITE;
/*!40000 ALTER TABLE `health_check_result_history_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_check_result_history_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration_configureds`
--

DROP TABLE IF EXISTS `integration_configureds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_configureds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `integration_option_id` int(11) NOT NULL,
  `integration_id` int(11) NOT NULL,
  `config_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration_configureds`
--

LOCK TABLES `integration_configureds` WRITE;
/*!40000 ALTER TABLE `integration_configureds` DISABLE KEYS */;
/*!40000 ALTER TABLE `integration_configureds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration_options`
--

DROP TABLE IF EXISTS `integration_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `action_text` varchar(255) DEFAULT NULL,
  `config_url` varchar(255) DEFAULT NULL,
  `external_url` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration_options`
--

LOCK TABLES `integration_options` WRITE;
/*!40000 ALTER TABLE `integration_options` DISABLE KEYS */;
INSERT INTO `integration_options` VALUES (1,'MSLogo','Microsoft SSO','SSO','Single sign-on with Microsoft','Configure','https://docs.rconfig.com/integrations/sso/sso-ms/',1,'Active',NULL,NULL),(2,'OktaLogo','Okta SSO','SSO','Single sign-on with Okta','Configure','https://docs.rconfig.com/integrations/sso/sso-okta/',1,'Active',NULL,NULL),(3,'PassboltLogo','Passbolt','Device Credentials','Use Passbolt for device credentials','Request','https://rconfig.com/support-center',1,'Disabled',NULL,NULL),(5,'GoogleLogo','Google SSO','SSO','Single sign-on with Google','Configure','https://docs.rconfig.com/integrations/sso/sso-google/',1,'Active',NULL,NULL);
/*!40000 ALTER TABLE `integration_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` text DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` text NOT NULL,
  `attempts` tinyint(1) NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_07_29_062256_create_activity_log_table',1),(2,'2019_07_29_062256_create_categories_table',1),(3,'2019_07_29_062256_create_category_command_table',1),(4,'2019_07_29_062256_create_category_device_table',1),(5,'2019_07_29_062256_create_category_task_table',1),(6,'2019_07_29_062256_create_commands_table',1),(7,'2019_07_29_062256_create_configs_table',1),(8,'2019_07_29_062256_create_device_tag_table',1),(9,'2019_07_29_062256_create_device_task_table',1),(10,'2019_07_29_062256_create_device_template_table',1),(11,'2019_07_29_062256_create_device_vendor_table',1),(12,'2019_07_29_062256_create_devices_table',1),(13,'2019_07_29_062256_create_failed_jobs_table',1),(14,'2019_07_29_062256_create_jobs_table',1),(15,'2019_07_29_062256_create_password_resets_table',1),(16,'2019_07_29_062256_create_settings_table',1),(17,'2019_07_29_062256_create_tag_task_table',1),(18,'2019_07_29_062256_create_tags_table',1),(19,'2019_07_29_062256_create_taskdownloadreports_table',1),(20,'2019_07_29_062256_create_tasks_table',1),(21,'2019_07_29_062256_create_templates_table',1),(22,'2019_07_29_062256_create_users_table',1),(23,'2019_07_29_062256_create_vendors_table',1),(24,'2019_12_14_000001_create_personal_access_tokens_table',1),(25,'2020_03_11_215000_create_notifications_table',1),(26,'2020_03_14_043618_create_sessions_table',1),(27,'2020_07_23_181117_change_devices_passwords_field_types_to_text',1),(28,'2020_09_06_003948_add_last_login_field_to_users_table',1),(29,'2020_09_06_105623_update_role_field_default_value',1),(30,'2020_09_23_100648_create_activity_log_archives_table',1),(31,'2021_01_11_211810_add_filesize_to_configs',1),(32,'2021_02_07_130831_create_job_batches_table',1),(33,'2021_08_30_003948_add_ssh_key_field_to_devices_table',1),(34,'2021_12_27_105623_update_default_passwords_field_type',1),(35,'2021_12_27_105623_update_mail_password_field_type',1),(36,'2022_02_12_162838_create_health_tables',1),(37,'2022_04_13_090632_add_batch_uuid_column_to_activity_log_table',1),(38,'2022_04_15_063417_change_settings_mail_host_default_value',1),(39,'2022_04_18_083107_add_indexes_to_configs_table',1),(40,'2022_04_18_083108_add_indexes_to_devices_table',1),(41,'2022_05_17_063418_add_device_cred_id_field_to_devices_table',1),(42,'2022_05_26_213709_create_schedule_monitor_tables',1),(43,'2022_05_28_151810_create_tracked_jobs_table',1),(44,'2022_09_10_063418_add_username_field_to_users_table',1),(45,'2022_11_23_152242_modify_monitored_scheduled_task_log_items_meta_column_to_varchar',1),(46,'2023_10_25_060208_add_device_port_override_col_to_devices_table',1),(47,'2024_10_09_163147_add_external_links_to_users_table',1),(48,'2024_10_16_052054_change_cats_table_badge_color_type',1),(49,'2024_10_20_090550_create_device_credentials_table',1),(50,'2024_10_22_222252_create_device_models_table',1),(51,'2024_10_25_032309_create_device_comments_table',1),(52,'2024_11_17_151044_add_onboarding_status_to_users_table',1),(53,'2024_11_30_041900_add_latest_version_field_to_configs_table',1),(54,'2024_12_10_083259_add_pause_task_field_to_tasks_table',1),(55,'2025_11_17_163227_create_integration_options_table',1),(56,'2025_11_17_163313_create_integration_configureds_table',1),(57,'2025_11_17_163728_add_microsoft_social_fields_to_users_table',1),(58,'2025_11_17_164445_add_socialite_approved_and_is_socialite_columns_to_users_table',1),(59,'2025_11_20_121637_create_config_summaries_table',1),(60,'2025_11_21_144344_create_notifications_defaults_table',1),(61,'2025_11_21_145137_create_notifications_user_preferences_table',1),(62,'2025_12_06_140927_add_locale_to_users_table',1),(63,'2025_12_06_153901_add_get_notifications_flag_to_users_table',1),(64,'2026_01_19_092844_add_report_name_column',1),(65,'2026_05_29_100000_add_mail_transport_security_flags_to_settings_table',1),(66,'2026_05_29_200130_add_attribute_changes_column_to_activity_log_tables',1),(67,'2026_06_26_140206_add_config_hash_and_config_version_to_configs_table',1),(68,'2026_06_26_140207_add_compare_options_to_settings_table',1),(69,'2026_06_26_140207_create_config_changes_table',1),(70,'2026_06_26_172428_create_rest_api_tokens_table',1),(71,'2026_08_01_070306_update_users_role_default_to_user',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitored_scheduled_task_log_items`
--

DROP TABLE IF EXISTS `monitored_scheduled_task_log_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitored_scheduled_task_log_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `monitored_scheduled_task_id` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_scheduled_task_id` (`monitored_scheduled_task_id`),
  CONSTRAINT `fk_scheduled_task_id` FOREIGN KEY (`monitored_scheduled_task_id`) REFERENCES `monitored_scheduled_tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitored_scheduled_task_log_items`
--

LOCK TABLES `monitored_scheduled_task_log_items` WRITE;
/*!40000 ALTER TABLE `monitored_scheduled_task_log_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitored_scheduled_task_log_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitored_scheduled_tasks`
--

DROP TABLE IF EXISTS `monitored_scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitored_scheduled_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `cron_expression` varchar(255) NOT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `ping_url` varchar(255) DEFAULT NULL,
  `last_started_at` datetime DEFAULT NULL,
  `last_finished_at` datetime DEFAULT NULL,
  `last_failed_at` datetime DEFAULT NULL,
  `last_skipped_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitored_scheduled_tasks`
--

LOCK TABLES `monitored_scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `monitored_scheduled_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitored_scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_defaults`
--

DROP TABLE IF EXISTS `notifications_defaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_defaults` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `default_db` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Boolean: 0=false, 1=true',
  `default_mail` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Boolean: 0=false, 1=true',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notifications_defaults_notification_type_unique` (`notification_type`),
  KEY `notifications_defaults_category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_defaults`
--

LOCK TABLES `notifications_defaults` WRITE;
/*!40000 ALTER TABLE `notifications_defaults` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_defaults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_user_preferences`
--

DROP TABLE IF EXISTS `notifications_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_user_preferences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `notification_type` varchar(255) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_notification_unique` (`user_id`,`notification_type`,`channel`),
  KEY `notifications_user_preferences_user_id_enabled_index` (`user_id`,`enabled`),
  KEY `notif_pref_type_channel_enabled_idx` (`notification_type`,`channel`,`enabled`),
  CONSTRAINT `notifications_user_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `check_channel` CHECK (`channel` in ('db','mail'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_user_preferences`
--

LOCK TABLES `notifications_user_preferences` WRITE;
/*!40000 ALTER TABLE `notifications_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rest_api_tokens`
--

DROP TABLE IF EXISTS `rest_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rest_api_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `api_token` longtext DEFAULT NULL,
  `api_token_name` varchar(191) DEFAULT NULL,
  `api_token_status` int(11) DEFAULT NULL,
  `api_token_expire_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rest_api_tokens`
--

LOCK TABLES `rest_api_tokens` WRITE;
/*!40000 ALTER TABLE `rest_api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `rest_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_banner` text DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `mail_host` varchar(255) NOT NULL DEFAULT 'default',
  `mail_port` int(11) DEFAULT NULL,
  `mail_from_email` varchar(255) DEFAULT NULL,
  `mail_to_email` text DEFAULT NULL,
  `mail_authcheck` int(11) DEFAULT NULL,
  `mail_username` varchar(255) DEFAULT NULL,
  `mail_password` text NOT NULL,
  `mail_driver` varchar(255) DEFAULT NULL,
  `mail_encryption` varchar(255) DEFAULT NULL,
  `defaultDeviceUsername` varchar(255) DEFAULT NULL,
  `defaultDevicePassword` text NOT NULL,
  `defaultEnablePassword` text NOT NULL,
  `passwordEncryption` int(11) DEFAULT 0 COMMENT '0 - no encryption, 1 = encryption',
  `deviceDebugging` int(11) DEFAULT NULL,
  `phpDebugging` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mail_verify_peer` tinyint(4) DEFAULT 0,
  `mail_auto_tls` tinyint(4) DEFAULT 0,
  `config_compare_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config_compare_settings`)),
  `config_compare_exclusion_file` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Authorization message - You must be an authorized user to login and use this system.','Europe/Dublin','devmailer.rconfig.com',1025,'admin@domain.com','user@domain.com',0,NULL,'','smtp',NULL,NULL,'','',1,0,1,'2019-07-15 18:38:03','2019-07-15 18:38:23',0,0,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_task`
--

DROP TABLE IF EXISTS `tag_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_task` (
  `task_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_task`
--

LOCK TABLES `tag_task` WRITE;
/*!40000 ALTER TABLE `tag_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(50) NOT NULL,
  `tagDescription` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Routers','A Tag for Routers','2019-07-16 05:51:44','2019-07-16 05:51:44'),(2,'Switches','A Tag for Switches','2019-07-16 05:51:44','2019-07-16 05:51:44');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskdownloadreports`
--

DROP TABLE IF EXISTS `taskdownloadreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskdownloadreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` varchar(50) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `task_desc` varchar(255) DEFAULT NULL,
  `task_type` varchar(255) NOT NULL DEFAULT '',
  `file_name` varchar(255) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `report_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskdownloadreports`
--

LOCK TABLES `taskdownloadreports` WRITE;
/*!40000 ALTER TABLE `taskdownloadreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskdownloadreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) DEFAULT NULL,
  `task_desc` varchar(255) DEFAULT NULL,
  `task_command` varchar(255) DEFAULT NULL,
  `task_categories` int(11) DEFAULT NULL,
  `task_devices` int(11) DEFAULT NULL,
  `task_tags` int(11) DEFAULT NULL,
  `task_snippet` int(11) DEFAULT NULL,
  `task_cron` varchar(255) DEFAULT NULL,
  `task_email_notify` int(11) DEFAULT NULL,
  `download_report_notify` int(11) DEFAULT NULL,
  `verbose_download_report_notify` int(11) DEFAULT NULL,
  `is_system` int(11) DEFAULT 0,
  `is_paused` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(191) DEFAULT NULL,
  `templateName` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'/app/rconfig/templates/ios-telnet-noenable.yml','Cisco IOS - TELNET - No Enable','Cisco IOS TELNET based connection without enable mode','2018-02-27 12:09:44',NULL),(2,'/app/rconfig/templates/ios-telnet-enable.yml','Cisco IOS - TELNET - Enable','Cisco IOS TELNET based connection with enable mode','2018-02-27 12:09:44',NULL),(3,'/app/rconfig/templates/ios-ssh-noenable.yml','Cisco IOS - SSH - No Enable','Cisco IOS SSH based connection without enable mode','2018-02-27 12:09:44',NULL),(4,'/app/rconfig/templates/ios-ssh-enable.yml','Cisco IOS - SSH - Enable','Cisco IOS SSH based connection with enable mode','2018-02-27 12:09:44',NULL);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracked_jobs`
--

DROP TABLE IF EXISTS `tracked_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracked_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trackable_id` varchar(255) NOT NULL,
  `trackable_type` varchar(255) NOT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'queued',
  `payload` longtext DEFAULT NULL,
  `command` longtext DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `output` longtext DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tracked_jobs_trackable_id_index` (`trackable_id`),
  KEY `tracked_jobs_trackable_type_index` (`trackable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracked_jobs`
--

LOCK TABLES `tracked_jobs` WRITE;
/*!40000 ALTER TABLE `tracked_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracked_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'User',
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `external_links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`external_links`)),
  `onboarding_status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`onboarding_status`)),
  `microsoft_id` varchar(255) DEFAULT NULL,
  `microsoft_token` longtext DEFAULT NULL,
  `microsoft_refresh_token` longtext DEFAULT NULL,
  `is_socialite_approved` tinyint(1) NOT NULL DEFAULT 0,
  `is_socialite` tinyint(1) NOT NULL DEFAULT 0,
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `timestyle` varchar(20) NOT NULL DEFAULT 'short',
  `datestyle` varchar(20) NOT NULL DEFAULT 'short',
  `get_notifications` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@domain.com',NULL,'$2y$12$7oSrkjbeBl9Y2l5ECkECaes14Fjldqj1PKD84mgNYKXnouyhULbSW',NULL,'Admin',NULL,'2019-07-15 14:25:26','2019-07-15 14:25:26','{\"devices_view\":\"display1\"}',NULL,NULL,NULL,NULL,NULL,0,0,'en_US','short','short',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'Aruba','2018-06-07 13:42:08','2018-06-07 13:42:08'),(2,'Brocade','2018-06-07 13:42:08','2018-06-07 13:42:08'),(3,'Checkpoint','2018-06-07 13:42:08','2018-06-07 13:42:08'),(4,'Cisco','2018-06-07 13:42:08','2018-06-07 13:42:08'),(5,'Dell','2018-06-07 13:42:08','2018-06-07 13:42:08'),(6,'Extreme','2018-06-07 13:42:08','2018-06-07 13:42:08'),(7,'Fortinet','2018-06-07 13:42:08','2018-06-07 13:42:08');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rconfig'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23 11:55:22
