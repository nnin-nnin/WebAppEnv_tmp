/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: akeneo_pim
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
-- Table structure for table `acl_classes`
--

DROP TABLE IF EXISTS `acl_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_classes`
--

LOCK TABLES `acl_classes` WRITE;
/*!40000 ALTER TABLE `acl_classes` DISABLE KEYS */;
INSERT INTO `acl_classes` VALUES (1,'(root)');
/*!40000 ALTER TABLE `acl_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_entries`
--

DROP TABLE IF EXISTS `acl_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  KEY `IDX_46C8B806EA000B10` (`class_id`),
  KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  KEY `IDX_46C8B806DF9183C9` (`security_identity_id`),
  CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_entries`
--

LOCK TABLES `acl_entries` WRITE;
/*!40000 ALTER TABLE `acl_entries` DISABLE KEYS */;
INSERT INTO `acl_entries` VALUES (1,1,1,1,NULL,2,1,1,'all',0,0),(2,1,2,1,NULL,2,1056964608,1,'all',0,0),(3,1,1,2,NULL,1,1,1,'all',0,0),(4,1,2,2,NULL,1,1056964608,1,'all',0,0),(5,1,1,3,NULL,0,1,1,'all',0,0),(6,1,2,3,NULL,0,1056964608,1,'all',0,0);
/*!40000 ALTER TABLE `acl_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identities`
--

DROP TABLE IF EXISTS `acl_object_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_object_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`),
  CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identities`
--

LOCK TABLES `acl_object_identities` WRITE;
/*!40000 ALTER TABLE `acl_object_identities` DISABLE KEYS */;
INSERT INTO `acl_object_identities` VALUES (1,NULL,1,'action',1),(2,NULL,1,'entity',1);
/*!40000 ALTER TABLE `acl_object_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identity_ancestors`
--

DROP TABLE IF EXISTS `acl_object_identity_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  KEY `IDX_825DE299C671CEA1` (`ancestor_id`),
  CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identity_ancestors`
--

LOCK TABLES `acl_object_identity_ancestors` WRITE;
/*!40000 ALTER TABLE `acl_object_identity_ancestors` DISABLE KEYS */;
INSERT INTO `acl_object_identity_ancestors` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `acl_object_identity_ancestors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_security_identities`
--

DROP TABLE IF EXISTS `acl_security_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_security_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) NOT NULL,
  `username` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_security_identities`
--

LOCK TABLES `acl_security_identities` WRITE;
/*!40000 ALTER TABLE `acl_security_identities` DISABLE KEYS */;
INSERT INTO `acl_security_identities` VALUES (1,'ROLE_ADMINISTRATOR',0),(2,'ROLE_CATALOG_MANAGER',0),(3,'ROLE_USER',0);
/*!40000 ALTER TABLE `acl_security_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_batch_job_execution`
--

DROP TABLE IF EXISTS `akeneo_batch_job_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `akeneo_batch_job_execution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_instance_id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `exit_code` varchar(255) DEFAULT NULL,
  `exit_description` longtext DEFAULT NULL,
  `failure_exceptions` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `log_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_62738477593D6954` (`job_instance_id`),
  CONSTRAINT `FK_62738477593D6954` FOREIGN KEY (`job_instance_id`) REFERENCES `akeneo_batch_job_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_batch_job_execution`
--

LOCK TABLES `akeneo_batch_job_execution` WRITE;
/*!40000 ALTER TABLE `akeneo_batch_job_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_batch_job_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_batch_job_instance`
--

DROP TABLE IF EXISTS `akeneo_batch_job_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `akeneo_batch_job_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `job_name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `connector` varchar(255) NOT NULL,
  `raw_parameters` longtext NOT NULL COMMENT '(DC2Type:array)',
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_batch_job_instance`
--

LOCK TABLES `akeneo_batch_job_instance` WRITE;
/*!40000 ALTER TABLE `akeneo_batch_job_instance` DISABLE KEYS */;
INSERT INTO `akeneo_batch_job_instance` VALUES (18,'update_product_value','Mass update products','update_product_value',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(19,'add_product_value','Mass add products values','add_product_value',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(20,'remove_product_value','Mass remove products values','remove_product_value',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(21,'edit_common_attributes','Mass edit common product attributes','edit_common_attributes',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(22,'set_attribute_requirements','Set family attribute requirements','set_attribute_requirements',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(23,'add_to_variant_group','Mass add products to variant group','add_to_variant_group',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(24,'csv_product_quick_export','CSV product quick export','csv_product_quick_export',0,'Akeneo CSV Connector','a:10:{s:8:\"filePath\";s:52:\"/tmp/products_export_%locale%_%scope%_%datetime%.csv\";s:9:\"delimiter\";s:1:\";\";s:9:\"enclosure\";s:1:\"\"\";s:10:\"withHeader\";b:1;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;}','quick_export'),(25,'csv_product_grid_context_quick_export','CSV product quick export grid context','csv_product_grid_context_quick_export',0,'Akeneo CSV Connector','a:10:{s:8:\"filePath\";s:65:\"/tmp/products_export_grid_context_%locale%_%scope%_%datetime%.csv\";s:9:\"delimiter\";s:1:\";\";s:9:\"enclosure\";s:1:\"\"\";s:10:\"withHeader\";b:1;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;}','quick_export'),(26,'xlsx_product_quick_export','XLSX product quick export','xlsx_product_quick_export',0,'Akeneo XLSX Connector','a:9:{s:8:\"filePath\";s:53:\"/tmp/products_export_%locale%_%scope%_%datetime%.xlsx\";s:10:\"withHeader\";b:1;s:12:\"linesPerFile\";i:10000;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;}','quick_export'),(27,'xlsx_product_grid_context_quick_export','XLSX product quick export grid context','xlsx_product_grid_context_quick_export',0,'Akeneo XLSX Connector','a:9:{s:8:\"filePath\";s:66:\"/tmp/products_export_grid_context_%locale%_%scope%_%datetime%.xlsx\";s:10:\"withHeader\";b:1;s:12:\"linesPerFile\";i:10000;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;}','quick_export');
/*!40000 ALTER TABLE `akeneo_batch_job_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_batch_step_execution`
--

DROP TABLE IF EXISTS `akeneo_batch_step_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `akeneo_batch_step_execution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_execution_id` int(11) DEFAULT NULL,
  `step_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `read_count` int(11) NOT NULL,
  `write_count` int(11) NOT NULL,
  `filter_count` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `exit_code` varchar(255) DEFAULT NULL,
  `exit_description` longtext DEFAULT NULL,
  `terminate_only` tinyint(1) DEFAULT NULL,
  `failure_exceptions` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `errors` longtext NOT NULL COMMENT '(DC2Type:array)',
  `summary` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_BDE7D0925871C06B` (`job_execution_id`),
  CONSTRAINT `FK_BDE7D0925871C06B` FOREIGN KEY (`job_execution_id`) REFERENCES `akeneo_batch_job_execution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_batch_step_execution`
--

LOCK TABLES `akeneo_batch_step_execution` WRITE;
/*!40000 ALTER TABLE `akeneo_batch_step_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_batch_step_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_batch_warning`
--

DROP TABLE IF EXISTS `akeneo_batch_warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `akeneo_batch_warning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step_execution_id` int(11) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `reason_parameters` longtext NOT NULL COMMENT '(DC2Type:array)',
  `item` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_8EE0AE736C7DA296` (`step_execution_id`),
  CONSTRAINT `FK_8EE0AE736C7DA296` FOREIGN KEY (`step_execution_id`) REFERENCES `akeneo_batch_step_execution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_batch_warning`
--

LOCK TABLES `akeneo_batch_warning` WRITE;
/*!40000 ALTER TABLE `akeneo_batch_warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_batch_warning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_file_storage_file_info`
--

DROP TABLE IF EXISTS `akeneo_file_storage_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `akeneo_file_storage_file_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_key` varchar(255) NOT NULL,
  `original_filename` varchar(255) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `extension` varchar(10) NOT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `storage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F19B3719A5D32530` (`file_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_file_storage_file_info`
--

LOCK TABLES `akeneo_file_storage_file_info` WRITE;
/*!40000 ALTER TABLE `akeneo_file_storage_file_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_file_storage_file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_access_group`
--

DROP TABLE IF EXISTS `oro_access_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_access_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FEF9EDB75E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_access_group`
--

LOCK TABLES `oro_access_group` WRITE;
/*!40000 ALTER TABLE `oro_access_group` DISABLE KEYS */;
INSERT INTO `oro_access_group` VALUES (4,'All'),(1,'IT support'),(2,'Manager'),(3,'Redactor');
/*!40000 ALTER TABLE `oro_access_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_access_role`
--

DROP TABLE IF EXISTS `oro_access_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_access_role` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) NOT NULL,
  `label` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_673F65E757698A6A` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_access_role`
--

LOCK TABLES `oro_access_role` WRITE;
/*!40000 ALTER TABLE `oro_access_role` DISABLE KEYS */;
INSERT INTO `oro_access_role` VALUES (1,'ROLE_ADMINISTRATOR','Administrator'),(2,'ROLE_CATALOG_MANAGER','Catalog manager'),(3,'ROLE_USER','User');
/*!40000 ALTER TABLE `oro_access_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_config`
--

DROP TABLE IF EXISTS `oro_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(255) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CONFIG_UQ_ENTITY` (`entity`,`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_config`
--

LOCK TABLES `oro_config` WRITE;
/*!40000 ALTER TABLE `oro_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_config_value`
--

DROP TABLE IF EXISTS `oro_config_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_config_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `section` varchar(50) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CONFIG_VALUE_UQ_ENTITY` (`name`,`section`,`config_id`),
  KEY `IDX_DAF6DF5524DB0683` (`config_id`),
  CONSTRAINT `FK_DAF6DF5524DB0683` FOREIGN KEY (`config_id`) REFERENCES `oro_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_config_value`
--

LOCK TABLES `oro_config_value` WRITE;
/*!40000 ALTER TABLE `oro_config_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_config_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_history`
--

DROP TABLE IF EXISTS `oro_navigation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_navigation_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(1023) NOT NULL,
  `title` varchar(255) NOT NULL,
  `visited_at` datetime NOT NULL,
  `visit_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B20613B9A76ED395` (`user_id`),
  CONSTRAINT `FK_B20613B9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_history`
--

LOCK TABLES `oro_navigation_history` WRITE;
/*!40000 ALTER TABLE `oro_navigation_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_navigation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_item`
--

DROP TABLE IF EXISTS `oro_navigation_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_navigation_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `url` varchar(1023) NOT NULL,
  `title` varchar(255) NOT NULL,
  `position` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_323B0258A76ED395` (`user_id`),
  KEY `sorted_items_idx` (`user_id`,`position`),
  CONSTRAINT `FK_323B0258A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_item`
--

LOCK TABLES `oro_navigation_item` WRITE;
/*!40000 ALTER TABLE `oro_navigation_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_navigation_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_item_pinbar`
--

DROP TABLE IF EXISTS `oro_navigation_item_pinbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_navigation_item_pinbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `maximized` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_54973433126F525E` (`item_id`),
  CONSTRAINT `FK_54973433126F525E` FOREIGN KEY (`item_id`) REFERENCES `oro_navigation_item` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_item_pinbar`
--

LOCK TABLES `oro_navigation_item_pinbar` WRITE;
/*!40000 ALTER TABLE `oro_navigation_item_pinbar` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_navigation_item_pinbar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_pagestate`
--

DROP TABLE IF EXISTS `oro_navigation_pagestate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_navigation_pagestate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(4000) NOT NULL,
  `page_hash` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8B43985B567C7E62` (`page_hash`),
  KEY `IDX_8B43985BA76ED395` (`user_id`),
  CONSTRAINT `FK_8B43985BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_pagestate`
--

LOCK TABLES `oro_navigation_pagestate` WRITE;
/*!40000 ALTER TABLE `oro_navigation_pagestate` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_navigation_pagestate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_title`
--

DROP TABLE IF EXISTS `oro_navigation_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_navigation_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_title` varchar(255) NOT NULL,
  `is_system` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_route` (`route`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_title`
--

LOCK TABLES `oro_navigation_title` WRITE;
/*!40000 ALTER TABLE `oro_navigation_title` DISABLE KEYS */;
INSERT INTO `oro_navigation_title` VALUES (1,'pim_analytics_system_info_index','pim_analytics.system_info.title','pim_analytics.system_info.title',1),(2,'pim_enrich_attributegroup_index','pim_title.attribute_group.index','pim_title.attribute_group.index',1),(3,'pim_enrich_attributegroup_create','pim_title.attribute_group.create','pim_title.attribute_group.create',1),(4,'pim_enrich_attributegroup_edit','pim_title.attribute_group.edit','pim_title.attribute_group.edit',1),(5,'pim_enrich_channel_index','pim_title.channel.index','pim_title.channel.index',1),(6,'pim_enrich_channel_create','pim_title.channel.create','pim_title.channel.create',1),(7,'pim_enrich_channel_edit','pim_title.channel.edit','pim_title.channel.edit',1),(8,'pim_enrich_currency_index','pim_title.currency.index','pim_title.currency.index',1),(9,'pim_enrich_family_index','pim_title.family.index','pim_title.family.index',1),(10,'pim_enrich_family_edit','pim_title.family.edit','pim_title.family.edit',1),(11,'pim_enrich_locale_index','pim_title.locale.index','pim_title.locale.index',1),(12,'pim_enrich_attribute_index','pim_title.attribute.index','pim_title.attribute.index',1),(13,'pim_enrich_attribute_create','pim_title.attribute.create','pim_title.attribute.create',1),(14,'pim_enrich_attribute_edit','pim_title.attribute.edit','pim_title.attribute.edit',1),(15,'pim_enrich_categorytree_index','pim_title.category.index','pim_title.category.index',1),(16,'pim_enrich_categorytree_create','pim_title.category.create','pim_title.category.create',1),(17,'pim_enrich_categorytree_edit','pim_title.category.edit','pim_title.category.edit',1),(18,'pim_enrich_product_index','pim_title.product.index','pim_title.product.index',1),(19,'pim_enrich_product_edit','pim_title.product.edit','pim_title.product.edit',1),(20,'pim_enrich_mass_edit_product_action_choose','pim_title.mass_edit_product_action.choose','pim_title.mass_edit_product_action.choose',1),(21,'pim_enrich_mass_edit_product_action_configure','pim_title.mass_edit_product_action.configure','pim_title.mass_edit_product_action.configure',1),(22,'pim_enrich_mass_edit_product_action_perform','pim_title.mass_edit_product_action.configure','pim_title.mass_edit_product_action.configure',1),(23,'pim_enrich_mass_edit_family_action_choose','pim_title.mass_edit_family_action.choose','pim_title.mass_edit_family_action.choose',1),(24,'pim_enrich_mass_edit_family_action_configure','pim_title.mass_edit_family_action.configure','pim_title.mass_edit_family_action.configure',1),(25,'pim_enrich_mass_edit_family_action_perform','pim_title.mass_edit_family_action.configure','pim_title.mass_edit_family_action.configure',1),(26,'pim_enrich_variant_group_index','pim_title.variant_group.index','pim_title.variant_group.index',1),(27,'pim_enrich_variant_group_edit','pim_title.variant_group.edit','pim_title.variant_group.edit',1),(28,'pim_enrich_group_index','pim_title.group.index','pim_title.group.index',1),(29,'pim_enrich_group_edit','pim_title.group.edit','pim_title.group.edit',1),(30,'pim_enrich_associationtype_index','pim_title.association_type.index','pim_title.association_type.index',1),(31,'pim_enrich_associationtype_edit','pim_title.association_type.edit','pim_title.association_type.edit',1),(32,'pim_enrich_grouptype_index','pim_title.group_type.index','pim_title.group_type.index',1),(33,'pim_enrich_grouptype_edit','pim_title.group_type.edit','pim_title.group_type.edit',1),(34,'pim_enrich_job_tracker_index','pim_title.job_tracker.index','pim_title.job_tracker.index',1),(35,'pim_enrich_job_tracker_show','pim_title.job_tracker.show','pim_title.job_tracker.show',1),(36,'pim_importexport_export_profile_index','pim_title.export_profile.index','pim_title.export_profile.index',1),(37,'pim_importexport_export_profile_show','pim_title.export_profile.show','pim_title.export_profile.show',1),(38,'pim_importexport_export_profile_edit','pim_title.export_profile.edit','pim_title.export_profile.edit',1),(39,'pim_importexport_import_profile_index','pim_title.import_profile.index','pim_title.import_profile.index',1),(40,'pim_importexport_import_profile_show','pim_title.import_profile.show','pim_title.import_profile.show',1),(41,'pim_importexport_import_profile_edit','pim_title.import_profile.edit','pim_title.import_profile.edit',1),(42,'pim_importexport_import_execution_index','pim_title.import_execution.index','pim_title.import_execution.index',1),(43,'pim_importexport_import_execution_show','pim_title.import_execution.show','pim_title.import_execution.show',1),(44,'pim_importexport_export_execution_index','pim_title.export_execution.index','pim_title.export_execution.index',1),(45,'pim_importexport_export_execution_show','pim_title.export_execution.show','pim_title.export_execution.show',1),(46,'oro_default','pim_title.dashboard','pim_title.dashboard',1),(47,'oro_user_group_create','Create Group','Create Group',1),(48,'oro_user_group_update','%group% - Edit','%group% - Edit',1),(49,'oro_user_group_index','pim_title.user_group.index','pim_title.user_group.index',1),(50,'oro_user_reset_request','Forgot Password','Forgot Password',1),(51,'oro_user_reset_check_email','Password Reset - Check Email','Password Reset - Check Email',1),(52,'oro_user_reset_reset','Password Reset','Password Reset',1),(53,'oro_user_role_create','Create Role','Create Role',1),(54,'oro_user_role_update','%role% - Edit','%role% - Edit',1),(55,'oro_user_role_index','pim_title.user_role.index','pim_title.user_role.index',1),(56,'oro_user_security_login','Login','Login',1),(57,'oro_user_view','%username%','%username%',1),(58,'oro_user_profile_view','%username%','%username%',1),(59,'oro_user_profile_update','%username% - Edit','%username% - Edit',1),(60,'oro_user_create','Create User','Create User',1),(61,'oro_user_update','%username% - Edit','%username% - Edit',1),(62,'oro_user_index','pim_title.user.index','pim_title.user.index',1),(63,'oro_config_configuration_system','pim_title.system_configuration.index','pim_title.system_configuration.index',1),(64,'oro_pinbar_help','How To Use Pinbar','How To Use Pinbar',1);
/*!40000 ALTER TABLE `oro_navigation_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user`
--

DROP TABLE IF EXISTS `oro_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ui_locale_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name_prefix` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name_suffix` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `password_requested` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `login_count` int(10) unsigned NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `product_grid_filters` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `emailNotifications` tinyint(1) NOT NULL DEFAULT 0,
  `catalogLocale_id` int(11) DEFAULT NULL,
  `catalogScope_id` int(11) DEFAULT NULL,
  `defaultTree_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F82840BCF85E0677` (`username`),
  UNIQUE KEY `UNIQ_F82840BCE7927C74` (`email`),
  KEY `IDX_F82840BC7BBFC60C` (`catalogLocale_id`),
  KEY `IDX_F82840BCA7EA8E8C` (`ui_locale_id`),
  KEY `IDX_F82840BCEAA72736` (`catalogScope_id`),
  KEY `IDX_F82840BCD654B1EE` (`defaultTree_id`),
  CONSTRAINT `FK_F82840BC7BBFC60C` FOREIGN KEY (`catalogLocale_id`) REFERENCES `pim_catalog_locale` (`id`),
  CONSTRAINT `FK_F82840BCA7EA8E8C` FOREIGN KEY (`ui_locale_id`) REFERENCES `pim_catalog_locale` (`id`),
  CONSTRAINT `FK_F82840BCD654B1EE` FOREIGN KEY (`defaultTree_id`) REFERENCES `pim_catalog_category` (`id`),
  CONSTRAINT `FK_F82840BCEAA72736` FOREIGN KEY (`catalogScope_id`) REFERENCES `pim_catalog_channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user`
--

LOCK TABLES `oro_user` WRITE;
/*!40000 ALTER TABLE `oro_user` DISABLE KEYS */;
INSERT INTO `oro_user` VALUES (1,58,'admin','admin@example.com',NULL,'John',NULL,'Doe',NULL,NULL,NULL,1,'7is7rrnlnfgggsoss884gso0g80kgog','XaD5SbHV2/wdcxw26Fy/sPPmgc9dhTUXiNXYZIC4Dn+sJtcVO1apG77pg2TzUVpIpcR/XehZX5pPUBkArXg1Ag==',NULL,NULL,'2026-09-30 09:13:05',1,'2026-09-30 09:10:28','2026-09-30 09:13:05','[]',0,58,1,1);
/*!40000 ALTER TABLE `oro_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_access_group`
--

DROP TABLE IF EXISTS `oro_user_access_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_user_access_group` (
  `user_id` int(11) NOT NULL,
  `group_id` smallint(6) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_EC003EF3A76ED395` (`user_id`),
  KEY `IDX_EC003EF3FE54D947` (`group_id`),
  CONSTRAINT `FK_EC003EF3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EC003EF3FE54D947` FOREIGN KEY (`group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_access_group`
--

LOCK TABLES `oro_user_access_group` WRITE;
/*!40000 ALTER TABLE `oro_user_access_group` DISABLE KEYS */;
INSERT INTO `oro_user_access_group` VALUES (1,1),(1,4);
/*!40000 ALTER TABLE `oro_user_access_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_access_group_role`
--

DROP TABLE IF EXISTS `oro_user_access_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_user_access_group_role` (
  `group_id` smallint(6) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  PRIMARY KEY (`group_id`,`role_id`),
  KEY `IDX_E7E7E38EFE54D947` (`group_id`),
  KEY `IDX_E7E7E38ED60322AC` (`role_id`),
  CONSTRAINT `FK_E7E7E38ED60322AC` FOREIGN KEY (`role_id`) REFERENCES `oro_access_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E7E7E38EFE54D947` FOREIGN KEY (`group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_access_group_role`
--

LOCK TABLES `oro_user_access_group_role` WRITE;
/*!40000 ALTER TABLE `oro_user_access_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_access_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_access_role`
--

DROP TABLE IF EXISTS `oro_user_access_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oro_user_access_role` (
  `user_id` int(11) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_290571BEA76ED395` (`user_id`),
  KEY `IDX_290571BED60322AC` (`role_id`),
  CONSTRAINT `FK_290571BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_290571BED60322AC` FOREIGN KEY (`role_id`) REFERENCES `oro_access_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_access_role`
--

LOCK TABLES `oro_user_access_role` WRITE;
/*!40000 ALTER TABLE `oro_user_access_role` DISABLE KEYS */;
INSERT INTO `oro_user_access_role` VALUES (1,1);
/*!40000 ALTER TABLE `oro_user_access_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_api_access_token`
--

DROP TABLE IF EXISTS `pim_api_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_api_access_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BD5E40235F37A13B` (`token`),
  KEY `IDX_BD5E40238D93D649` (`user`),
  CONSTRAINT `FK_BD5E40238D93D649` FOREIGN KEY (`user`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_api_access_token`
--

LOCK TABLES `pim_api_access_token` WRITE;
/*!40000 ALTER TABLE `pim_api_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_api_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_api_auth_code`
--

DROP TABLE IF EXISTS `pim_api_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_api_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `redirect_uri` longtext NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AD5DC7C65F37A13B` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_api_auth_code`
--

LOCK TABLES `pim_api_auth_code` WRITE;
/*!40000 ALTER TABLE `pim_api_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_api_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_api_client`
--

DROP TABLE IF EXISTS `pim_api_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_api_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(255) NOT NULL,
  `redirect_uris` longtext NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) NOT NULL,
  `allowed_grant_types` longtext NOT NULL COMMENT '(DC2Type:array)',
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_api_client`
--

LOCK TABLES `pim_api_client` WRITE;
/*!40000 ALTER TABLE `pim_api_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_api_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_api_refresh_token`
--

DROP TABLE IF EXISTS `pim_api_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_api_refresh_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_264A45105F37A13B` (`token`),
  KEY `IDX_264A4510C7440455` (`client`),
  KEY `IDX_264A45108D93D649` (`user`),
  CONSTRAINT `FK_264A45108D93D649` FOREIGN KEY (`user`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_264A4510C7440455` FOREIGN KEY (`client`) REFERENCES `pim_api_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_api_refresh_token`
--

LOCK TABLES `pim_api_refresh_token` WRITE;
/*!40000 ALTER TABLE `pim_api_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_api_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association`
--

DROP TABLE IF EXISTS `pim_catalog_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `association_type_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`owner_id`,`association_type_id`),
  KEY `IDX_CC271001B1E1C39` (`association_type_id`),
  KEY `IDX_CC2710017E3C61F9` (`owner_id`),
  CONSTRAINT `FK_CC2710017E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CC271001B1E1C39` FOREIGN KEY (`association_type_id`) REFERENCES `pim_catalog_association_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association`
--

LOCK TABLES `pim_catalog_association` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_group`
--

DROP TABLE IF EXISTS `pim_catalog_association_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_association_group` (
  `association_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`group_id`),
  KEY `IDX_E91414DDEFB9C8A5` (`association_id`),
  KEY `IDX_E91414DDFE54D947` (`group_id`),
  CONSTRAINT `FK_E91414DDEFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pim_catalog_association` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E91414DDFE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_group`
--

LOCK TABLES `pim_catalog_association_group` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_product`
--

DROP TABLE IF EXISTS `pim_catalog_association_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_association_product` (
  `association_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`product_id`),
  KEY `IDX_3A3A49D4EFB9C8A5` (`association_id`),
  KEY `IDX_3A3A49D44584665A` (`product_id`),
  CONSTRAINT `FK_3A3A49D44584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3A3A49D4EFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pim_catalog_association` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_product`
--

LOCK TABLES `pim_catalog_association_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_type`
--

DROP TABLE IF EXISTS `pim_catalog_association_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_association_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E6CF913A77153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_type`
--

LOCK TABLES `pim_catalog_association_type` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_type` DISABLE KEYS */;
INSERT INTO `pim_catalog_association_type` VALUES (1,'X_SELL','2026-09-30 09:10:28','2026-09-30 09:10:28'),(2,'UPSELL','2026-09-30 09:10:28','2026-09-30 09:10:28'),(3,'SUBSTITUTION','2026-09-30 09:10:28','2026-09-30 09:10:28'),(4,'PACK','2026-09-30 09:10:28','2026-09-30 09:10:28');
/*!40000 ALTER TABLE `pim_catalog_association_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_type_translation`
--

DROP TABLE IF EXISTS `pim_catalog_association_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_association_type_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `locale` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_CCCBAA2D7E366551` (`foreign_key`),
  CONSTRAINT `FK_CCCBAA2D7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_association_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_type_translation`
--

LOCK TABLES `pim_catalog_association_type_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_type_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_association_type_translation` VALUES (1,1,'Cross sell','en_US'),(2,1,'Vente croisée','fr_FR'),(3,2,'Upsell','en_US'),(4,2,'Vente incitative','fr_FR'),(5,3,'Substitution','en_US'),(6,3,'Remplacement','fr_FR'),(7,4,'Pack','en_US'),(8,4,'Pack','fr_FR');
/*!40000 ALTER TABLE `pim_catalog_association_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute`
--

DROP TABLE IF EXISTS `pim_catalog_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `useable_as_grid_filter` tinyint(1) NOT NULL DEFAULT 0,
  `max_characters` smallint(6) DEFAULT NULL,
  `validation_rule` varchar(10) DEFAULT NULL,
  `validation_regexp` varchar(500) DEFAULT NULL,
  `wysiwyg_enabled` tinyint(1) DEFAULT NULL,
  `number_min` decimal(14,4) DEFAULT NULL,
  `number_max` decimal(14,4) DEFAULT NULL,
  `decimals_allowed` tinyint(1) DEFAULT NULL,
  `negative_allowed` tinyint(1) DEFAULT NULL,
  `date_min` datetime DEFAULT NULL,
  `date_max` datetime DEFAULT NULL,
  `metric_family` varchar(30) DEFAULT NULL,
  `default_metric_unit` varchar(30) DEFAULT NULL,
  `max_file_size` decimal(6,2) DEFAULT NULL,
  `allowed_extensions` varchar(255) DEFAULT NULL,
  `minimumInputLength` smallint(6) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_unique` tinyint(1) NOT NULL,
  `is_localizable` tinyint(1) NOT NULL,
  `is_scopable` tinyint(1) NOT NULL,
  `code` varchar(100) NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `attribute_type` varchar(255) NOT NULL,
  `backend_type` varchar(255) NOT NULL,
  `properties` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`code`,`entity_type`),
  KEY `IDX_492FD44FFE54D947` (`group_id`),
  KEY `searchcode_idx` (`code`),
  CONSTRAINT `FK_492FD44FFE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_attribute_group` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute`
--

LOCK TABLES `pim_catalog_attribute` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute` VALUES (1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,1,0,0,'sku','Pim\\Component\\Catalog\\Model\\Product','pim_catalog_identifier','varchar','a:1:{s:19:\"reference_data_name\";N;}','2026-09-30 09:10:28','2026-09-30 09:10:28');
/*!40000 ALTER TABLE `pim_catalog_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_group`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_attribute_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E299C05E77153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_group`
--

LOCK TABLES `pim_catalog_attribute_group` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_group` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute_group` VALUES (1,'other',100,'2026-09-30 09:10:28','2026-09-30 09:10:28');
/*!40000 ALTER TABLE `pim_catalog_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_group_translation`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_group_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_attribute_group_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `locale` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_B74958BD7E366551` (`foreign_key`),
  CONSTRAINT `FK_B74958BD7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_attribute_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_group_translation`
--

LOCK TABLES `pim_catalog_attribute_group_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_group_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute_group_translation` VALUES (1,1,'Other','en_US'),(2,1,'Autre','fr_FR');
/*!40000 ALTER TABLE `pim_catalog_attribute_group_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_locale`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_attribute_locale` (
  `attribute_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_id`,`locale_id`),
  KEY `IDX_26D2D5D0B6E62EFA` (`attribute_id`),
  KEY `IDX_26D2D5D0E559DFD1` (`locale_id`),
  CONSTRAINT `FK_26D2D5D0B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_26D2D5D0E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_locale`
--

LOCK TABLES `pim_catalog_attribute_locale` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_option`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_attribute_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`code`,`attribute_id`),
  KEY `IDX_3DD413F8B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_3DD413F8B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_option`
--

LOCK TABLES `pim_catalog_attribute_option` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_option_value`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_attribute_option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `locale_code` varchar(20) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`locale_code`,`option_id`),
  KEY `IDX_CC4B9A83A7C41D6F` (`option_id`),
  CONSTRAINT `FK_CC4B9A83A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `pim_catalog_attribute_option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_option_value`
--

LOCK TABLES `pim_catalog_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_requirement`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_attribute_requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`channel_id`,`family_id`,`attribute_id`),
  KEY `IDX_B494B917C35E566A` (`family_id`),
  KEY `IDX_B494B917B6E62EFA` (`attribute_id`),
  KEY `IDX_B494B91772F5A1AA` (`channel_id`),
  CONSTRAINT `FK_B494B91772F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B494B917B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B494B917C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_requirement`
--

LOCK TABLES `pim_catalog_attribute_requirement` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_translation`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_attribute_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `locale` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_DBC2A9287E366551` (`foreign_key`),
  CONSTRAINT `FK_DBC2A9287E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_translation`
--

LOCK TABLES `pim_catalog_attribute_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute_translation` VALUES (1,1,'SKU','en_US');
/*!40000 ALTER TABLE `pim_catalog_attribute_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category`
--

DROP TABLE IF EXISTS `pim_catalog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `root` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_350D833977153098` (`code`),
  KEY `IDX_350D8339727ACA70` (`parent_id`),
  CONSTRAINT `FK_350D8339727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `pim_catalog_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category`
--

LOCK TABLES `pim_catalog_category` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category` DISABLE KEYS */;
INSERT INTO `pim_catalog_category` VALUES (1,NULL,'master','2026-09-30 09:10:28',1,0,1,2);
/*!40000 ALTER TABLE `pim_catalog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category_product`
--

DROP TABLE IF EXISTS `pim_catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_category_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `IDX_512179C14584665A` (`product_id`),
  KEY `IDX_512179C112469DE2` (`category_id`),
  CONSTRAINT `FK_512179C112469DE2` FOREIGN KEY (`category_id`) REFERENCES `pim_catalog_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_512179C14584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category_product`
--

LOCK TABLES `pim_catalog_category_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category_translation`
--

DROP TABLE IF EXISTS `pim_catalog_category_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_category_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `locale` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_1C0FA6B77E366551` (`foreign_key`),
  CONSTRAINT `FK_1C0FA6B77E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category_translation`
--

LOCK TABLES `pim_catalog_category_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_category_translation` VALUES (1,1,'Master catalog','en_US');
/*!40000 ALTER TABLE `pim_catalog_category_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel`
--

DROP TABLE IF EXISTS `pim_catalog_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `conversionUnits` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E07E932A77153098` (`code`),
  KEY `IDX_E07E932A12469DE2` (`category_id`),
  CONSTRAINT `FK_E07E932A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `pim_catalog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel`
--

LOCK TABLES `pim_catalog_channel` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel` VALUES (1,1,'ecommerce','a:0:{}');
/*!40000 ALTER TABLE `pim_catalog_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel_currency`
--

DROP TABLE IF EXISTS `pim_catalog_channel_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_channel_currency` (
  `channel_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `IDX_5B55C68472F5A1AA` (`channel_id`),
  KEY `IDX_5B55C68438248176` (`currency_id`),
  CONSTRAINT `FK_5B55C68438248176` FOREIGN KEY (`currency_id`) REFERENCES `pim_catalog_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5B55C68472F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel_currency`
--

LOCK TABLES `pim_catalog_channel_currency` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel_currency` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel_currency` VALUES (1,1);
/*!40000 ALTER TABLE `pim_catalog_channel_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel_locale`
--

DROP TABLE IF EXISTS `pim_catalog_channel_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_channel_locale` (
  `channel_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `IDX_D8113CB272F5A1AA` (`channel_id`),
  KEY `IDX_D8113CB2E559DFD1` (`locale_id`),
  CONSTRAINT `FK_D8113CB272F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D8113CB2E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel_locale`
--

LOCK TABLES `pim_catalog_channel_locale` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel_locale` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel_locale` VALUES (1,58);
/*!40000 ALTER TABLE `pim_catalog_channel_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel_translation`
--

DROP TABLE IF EXISTS `pim_catalog_channel_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_channel_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `locale` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_8A91679D7E366551` (`foreign_key`),
  CONSTRAINT `FK_8A91679D7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel_translation`
--

LOCK TABLES `pim_catalog_channel_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel_translation` VALUES (1,1,'Default','en_US'),(2,1,'Standard','de_DE'),(3,1,'Défaut','fr_FR');
/*!40000 ALTER TABLE `pim_catalog_channel_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_completeness`
--

DROP TABLE IF EXISTS `pim_catalog_completeness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_completeness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ratio` int(11) NOT NULL,
  `missing_count` int(11) NOT NULL,
  `required_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`channel_id`,`locale_id`,`product_id`),
  KEY `IDX_113BA854E559DFD1` (`locale_id`),
  KEY `IDX_113BA85472F5A1AA` (`channel_id`),
  KEY `IDX_113BA8544584665A` (`product_id`),
  KEY `ratio_idx` (`ratio`),
  CONSTRAINT `FK_113BA8544584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_113BA85472F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_113BA854E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_completeness`
--

LOCK TABLES `pim_catalog_completeness` WRITE;
/*!40000 ALTER TABLE `pim_catalog_completeness` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_completeness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_currency`
--

DROP TABLE IF EXISTS `pim_catalog_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `is_activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5A1712C777153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_currency`
--

LOCK TABLES `pim_catalog_currency` WRITE;
/*!40000 ALTER TABLE `pim_catalog_currency` DISABLE KEYS */;
INSERT INTO `pim_catalog_currency` VALUES (1,'USD',1),(2,'EUR',1),(3,'ADP',0),(4,'AED',0),(5,'AFA',0),(6,'AFN',0),(7,'ALK',0),(8,'ALL',0),(9,'AMD',0),(10,'ANG',0),(11,'AOA',0),(12,'AOK',0),(13,'AON',0),(14,'AOR',0),(15,'ARA',0),(16,'ARL',0),(17,'ARM',0),(18,'ARP',0),(19,'ARS',0),(20,'ATS',0),(21,'AUD',0),(22,'AWG',0),(23,'AZM',0),(24,'AZN',0),(25,'BAD',0),(26,'BAM',0),(27,'BAN',0),(28,'BBD',0),(29,'BDT',0),(30,'BEC',0),(31,'BEF',0),(32,'BEL',0),(33,'BGL',0),(34,'BGM',0),(35,'BGN',0),(36,'BGO',0),(37,'BHD',0),(38,'BIF',0),(39,'BMD',0),(40,'BND',0),(41,'BOB',0),(42,'BOL',0),(43,'BOP',0),(44,'BOV',0),(45,'BRB',0),(46,'BRC',0),(47,'BRE',0),(48,'BRL',0),(49,'BRN',0),(50,'BRR',0),(51,'BRZ',0),(52,'BSD',0),(53,'BTN',0),(54,'BUK',0),(55,'BWP',0),(56,'BYB',0),(57,'BYR',0),(58,'BZD',0),(59,'CAD',0),(60,'CDF',0),(61,'CHE',0),(62,'CHF',0),(63,'CHW',0),(64,'CLE',0),(65,'CLF',0),(66,'CLP',0),(67,'CNX',0),(68,'CNY',0),(69,'COP',0),(70,'COU',0),(71,'CRC',0),(72,'CSD',0),(73,'CSK',0),(74,'CUC',0),(75,'CUP',0),(76,'CVE',0),(77,'CYP',0),(78,'CZK',0),(79,'DDM',0),(80,'DEM',0),(81,'DJF',0),(82,'DKK',0),(83,'DOP',0),(84,'DZD',0),(85,'ECS',0),(86,'ECV',0),(87,'EEK',0),(88,'EGP',0),(89,'ERN',0),(90,'ESA',0),(91,'ESB',0),(92,'ESP',0),(93,'ETB',0),(94,'FIM',0),(95,'FJD',0),(96,'FKP',0),(97,'FRF',0),(98,'GBP',0),(99,'GEK',0),(100,'GEL',0),(101,'GHC',0),(102,'GHS',0),(103,'GIP',0),(104,'GMD',0),(105,'GNF',0),(106,'GNS',0),(107,'GQE',0),(108,'GRD',0),(109,'GTQ',0),(110,'GWE',0),(111,'GWP',0),(112,'GYD',0),(113,'HKD',0),(114,'HNL',0),(115,'HRD',0),(116,'HRK',0),(117,'HTG',0),(118,'HUF',0),(119,'IDR',0),(120,'IEP',0),(121,'ILP',0),(122,'ILR',0),(123,'ILS',0),(124,'INR',0),(125,'IQD',0),(126,'IRR',0),(127,'ISJ',0),(128,'ISK',0),(129,'ITL',0),(130,'JMD',0),(131,'JOD',0),(132,'JPY',0),(133,'KES',0),(134,'KGS',0),(135,'KHR',0),(136,'KMF',0),(137,'KPW',0),(138,'KRH',0),(139,'KRO',0),(140,'KRW',0),(141,'KWD',0),(142,'KYD',0),(143,'KZT',0),(144,'LAK',0),(145,'LBP',0),(146,'LKR',0),(147,'LRD',0),(148,'LSL',0),(149,'LTL',0),(150,'LTT',0),(151,'LUC',0),(152,'LUF',0),(153,'LUL',0),(154,'LVL',0),(155,'LVR',0),(156,'LYD',0),(157,'MAD',0),(158,'MAF',0),(159,'MCF',0),(160,'MDC',0),(161,'MDL',0),(162,'MGA',0),(163,'MGF',0),(164,'MKD',0),(165,'MKN',0),(166,'MLF',0),(167,'MMK',0),(168,'MNT',0),(169,'MOP',0),(170,'MRO',0),(171,'MTL',0),(172,'MTP',0),(173,'MUR',0),(174,'MVP',0),(175,'MVR',0),(176,'MWK',0),(177,'MXN',0),(178,'MXP',0),(179,'MXV',0),(180,'MYR',0),(181,'MZE',0),(182,'MZM',0),(183,'MZN',0),(184,'NAD',0),(185,'NGN',0),(186,'NIC',0),(187,'NIO',0),(188,'NLG',0),(189,'NOK',0),(190,'NPR',0),(191,'NZD',0),(192,'OMR',0),(193,'PAB',0),(194,'PEI',0),(195,'PEN',0),(196,'PES',0),(197,'PGK',0),(198,'PHP',0),(199,'PKR',0),(200,'PLN',0),(201,'PLZ',0),(202,'PTE',0),(203,'PYG',0),(204,'QAR',0),(205,'RHD',0),(206,'ROL',0),(207,'RON',0),(208,'RSD',0),(209,'RUB',0),(210,'RUR',0),(211,'RWF',0),(212,'SAR',0),(213,'SBD',0),(214,'SCR',0),(215,'SDD',0),(216,'SDG',0),(217,'SDP',0),(218,'SEK',0),(219,'SGD',0),(220,'SHP',0),(221,'SIT',0),(222,'SKK',0),(223,'SLL',0),(224,'SOS',0),(225,'SRD',0),(226,'SRG',0),(227,'SSP',0),(228,'STD',0),(229,'SUR',0),(230,'SVC',0),(231,'SYP',0),(232,'SZL',0),(233,'THB',0),(234,'TJR',0),(235,'TJS',0),(236,'TMM',0),(237,'TMT',0),(238,'TND',0),(239,'TOP',0),(240,'TPE',0),(241,'TRL',0),(242,'TRY',0),(243,'TTD',0),(244,'TWD',0),(245,'TZS',0),(246,'UAH',0),(247,'UAK',0),(248,'UGS',0),(249,'UGX',0),(250,'USN',0),(251,'USS',0),(252,'UYI',0),(253,'UYP',0),(254,'UYU',0),(255,'UZS',0),(256,'VEB',0),(257,'VEF',0),(258,'VND',0),(259,'VNN',0),(260,'VUV',0),(261,'WST',0),(262,'XAF',0),(263,'XAU',0),(264,'XBA',0),(265,'XBB',0),(266,'XBC',0),(267,'XBD',0),(268,'XCD',0),(269,'XDR',0),(270,'XEU',0),(271,'XFO',0),(272,'XFU',0),(273,'XOF',0),(274,'XPD',0),(275,'XPF',0),(276,'XRE',0),(277,'XSU',0),(278,'XTS',0),(279,'XXX',0),(280,'YDD',0),(281,'YER',0),(282,'YUD',0),(283,'YUM',0),(284,'YUN',0),(285,'YUR',0),(286,'ZAL',0),(287,'ZAR',0),(288,'ZMK',0),(289,'ZMW',0),(290,'ZRN',0),(291,'ZRZ',0),(292,'ZWD',0),(293,'ZWL',0),(294,'ZWR',0);
/*!40000 ALTER TABLE `pim_catalog_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family`
--

DROP TABLE IF EXISTS `pim_catalog_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_attribute_id` int(11) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9063207277153098` (`code`),
  KEY `IDX_90632072E2D3A503` (`label_attribute_id`),
  CONSTRAINT `FK_90632072E2D3A503` FOREIGN KEY (`label_attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family`
--

LOCK TABLES `pim_catalog_family` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_attribute`
--

DROP TABLE IF EXISTS `pim_catalog_family_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_family_attribute` (
  `family_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`family_id`,`attribute_id`),
  KEY `IDX_76074884C35E566A` (`family_id`),
  KEY `IDX_76074884B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_76074884B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_76074884C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_attribute`
--

LOCK TABLES `pim_catalog_family_attribute` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_translation`
--

DROP TABLE IF EXISTS `pim_catalog_family_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_family_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `locale` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_547C9A607E366551` (`foreign_key`),
  CONSTRAINT `FK_547C9A607E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_family` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_translation`
--

LOCK TABLES `pim_catalog_family_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group`
--

DROP TABLE IF EXISTS `pim_catalog_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_template_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5D6997ED77153098` (`code`),
  UNIQUE KEY `UNIQ_5D6997EDA9F591A7` (`product_template_id`),
  KEY `IDX_5D6997EDC54C8C93` (`type_id`),
  CONSTRAINT `FK_5D6997EDA9F591A7` FOREIGN KEY (`product_template_id`) REFERENCES `pim_catalog_product_template` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_5D6997EDC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `pim_catalog_group_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group`
--

LOCK TABLES `pim_catalog_group` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group_attribute`
--

DROP TABLE IF EXISTS `pim_catalog_group_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_group_attribute` (
  `group_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`attribute_id`),
  KEY `IDX_56A8D437FE54D947` (`group_id`),
  KEY `IDX_56A8D437B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_56A8D437B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`),
  CONSTRAINT `FK_56A8D437FE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group_attribute`
--

LOCK TABLES `pim_catalog_group_attribute` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_group_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group_product`
--

DROP TABLE IF EXISTS `pim_catalog_group_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_group_product` (
  `product_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`group_id`),
  KEY `IDX_7AC0C83A4584665A` (`product_id`),
  KEY `IDX_7AC0C83AFE54D947` (`group_id`),
  CONSTRAINT `FK_7AC0C83A4584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7AC0C83AFE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group_product`
--

LOCK TABLES `pim_catalog_group_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_group_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group_translation`
--

DROP TABLE IF EXISTS `pim_catalog_group_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_group_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `locale` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_622D98DB7E366551` (`foreign_key`),
  CONSTRAINT `FK_622D98DB7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group_translation`
--

LOCK TABLES `pim_catalog_group_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_group_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group_type`
--

DROP TABLE IF EXISTS `pim_catalog_group_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `is_variant` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_693B2EF777153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group_type`
--

LOCK TABLES `pim_catalog_group_type` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group_type` DISABLE KEYS */;
INSERT INTO `pim_catalog_group_type` VALUES (1,'VARIANT',1),(2,'RELATED',0);
/*!40000 ALTER TABLE `pim_catalog_group_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group_type_translation`
--

DROP TABLE IF EXISTS `pim_catalog_group_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_group_type_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `locale` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_6EF81AEB7E366551` (`foreign_key`),
  CONSTRAINT `FK_6EF81AEB7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_group_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group_type_translation`
--

LOCK TABLES `pim_catalog_group_type_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group_type_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_group_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_locale`
--

DROP TABLE IF EXISTS `pim_catalog_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `is_activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7405C7B177153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_locale`
--

LOCK TABLES `pim_catalog_locale` WRITE;
/*!40000 ALTER TABLE `pim_catalog_locale` DISABLE KEYS */;
INSERT INTO `pim_catalog_locale` VALUES (1,'af_ZA',0),(2,'am_ET',0),(3,'ar_AE',0),(4,'ar_BH',0),(5,'ar_DZ',0),(6,'ar_EG',0),(7,'ar_IQ',0),(8,'ar_JO',0),(9,'ar_KW',0),(10,'ar_LB',0),(11,'ar_LY',0),(12,'ar_MA',0),(13,'arn_CL',0),(14,'ar_OM',0),(15,'ar_QA',0),(16,'ar_SA',0),(17,'ar_SY',0),(18,'ar_TN',0),(19,'ar_YE',0),(20,'as_IN',0),(21,'az_Cyrl_AZ',0),(22,'az_Latn_AZ',0),(23,'ba_RU',0),(24,'be_BY',0),(25,'bg_BG',0),(26,'bn_BD',0),(27,'bn_IN',0),(28,'bo_CN',0),(29,'br_FR',0),(30,'bs_Cyrl_BA',0),(31,'bs_Latn_BA',0),(32,'ca_ES',0),(33,'co_FR',0),(34,'cs_CZ',0),(35,'cy_GB',0),(36,'da_DK',0),(37,'de_AT',0),(38,'de_CH',0),(39,'de_DE',0),(40,'de_LI',0),(41,'de_LU',0),(42,'dsb_DE',0),(43,'dv_MV',0),(44,'el_GR',0),(45,'en_029',0),(46,'en_AU',0),(47,'en_BZ',0),(48,'en_CA',0),(49,'en_GB',0),(50,'en_IE',0),(51,'en_IN',0),(52,'en_JM',0),(53,'en_MY',0),(54,'en_NZ',0),(55,'en_PH',0),(56,'en_SG',0),(57,'en_TT',0),(58,'en_US',1),(59,'en_ZA',0),(60,'en_ZW',0),(61,'es_AR',0),(62,'es_BO',0),(63,'es_CL',0),(64,'es_CO',0),(65,'es_CR',0),(66,'es_DO',0),(67,'es_EC',0),(68,'es_ES',0),(69,'es_GT',0),(70,'es_HN',0),(71,'es_MX',0),(72,'es_NI',0),(73,'es_PA',0),(74,'es_PE',0),(75,'es_PR',0),(76,'es_PY',0),(77,'es_SV',0),(78,'es_US',0),(79,'es_UY',0),(80,'es_VE',0),(81,'et_EE',0),(82,'eu_ES',0),(83,'fa_IR',0),(84,'fi_FI',0),(85,'fil_PH',0),(86,'fo_FO',0),(87,'fr_BE',0),(88,'fr_CA',0),(89,'fr_CH',0),(90,'fr_FR',0),(91,'fr_LU',0),(92,'fr_MC',0),(93,'fy_NL',0),(94,'ga_IE',0),(95,'gd_GB',0),(96,'gl_ES',0),(97,'gsw_FR',0),(98,'gu_IN',0),(99,'ha_Latn_NG',0),(100,'he_IL',0),(101,'hi_IN',0),(102,'hr_BA',0),(103,'hr_HR',0),(104,'hsb_DE',0),(105,'hu_HU',0),(106,'hy_AM',0),(107,'id_ID',0),(108,'ig_NG',0),(109,'ii_CN',0),(110,'is_IS',0),(111,'it_CH',0),(112,'it_IT',0),(113,'iu_Cans_CA',0),(114,'iu_Latn_CA',0),(115,'ja_JP',0),(116,'ka_GE',0),(117,'kk_KZ',0),(118,'kl_GL',0),(119,'km_KH',0),(120,'kn_IN',0),(121,'kok_IN',0),(122,'ko_KR',0),(123,'ky_KG',0),(124,'lb_LU',0),(125,'lo_LA',0),(126,'lt_LT',0),(127,'lv_LV',0),(128,'mi_NZ',0),(129,'mk_MK',0),(130,'ml_IN',0),(131,'mn_MN',0),(132,'mn_Mong_CN',0),(133,'moh_CA',0),(134,'mr_IN',0),(135,'ms_BN',0),(136,'ms_MY',0),(137,'mt_MT',0),(138,'nb_NO',0),(139,'ne_NP',0),(140,'nl_BE',0),(141,'nl_NL',0),(142,'nn_NO',0),(143,'nso_ZA',0),(144,'oc_FR',0),(145,'or_IN',0),(146,'pa_IN',0),(147,'pl_PL',0),(148,'prs_AF',0),(149,'ps_AF',0),(150,'pt_BR',0),(151,'pt_PT',0),(152,'qut_GT',0),(153,'quz_BO',0),(154,'quz_EC',0),(155,'quz_PE',0),(156,'rm_CH',0),(157,'ro_RO',0),(158,'ru_RU',0),(159,'rw_RW',0),(160,'sah_RU',0),(161,'sa_IN',0),(162,'se_FI',0),(163,'se_NO',0),(164,'se_SE',0),(165,'si_LK',0),(166,'sk_SK',0),(167,'sl_SI',0),(168,'sma_NO',0),(169,'sma_SE',0),(170,'smj_NO',0),(171,'smj_SE',0),(172,'smn_FI',0),(173,'sms_FI',0),(174,'sq_AL',0),(175,'sr_Cyrl_BA',0),(176,'sr_Cyrl_CS',0),(177,'sr_Cyrl_ME',0),(178,'sr_Cyrl_RS',0),(179,'sr_Latn_BA',0),(180,'sr_Latn_CS',0),(181,'sr_Latn_ME',0),(182,'sr_Latn_RS',0),(183,'sv_FI',0),(184,'sv_SE',0),(185,'sw_KE',0),(186,'syr_SY',0),(187,'ta_IN',0),(188,'te_IN',0),(189,'tg_Cyrl_TJ',0),(190,'th_TH',0),(191,'tk_TM',0),(192,'tn_ZA',0),(193,'tr_TR',0),(194,'tt_RU',0),(195,'tzm_Latn_DZ',0),(196,'ug_CN',0),(197,'uk_UA',0),(198,'ur_PK',0),(199,'uz_Cyrl_UZ',0),(200,'uz_Latn_UZ',0),(201,'vi_VN',0),(202,'wo_SN',0),(203,'xh_ZA',0),(204,'yo_NG',0),(205,'zh_CN',0),(206,'zh_HK',0),(207,'zh_MO',0),(208,'zh_SG',0),(209,'zh_TW',0),(210,'zu_ZA',0);
/*!40000 ALTER TABLE `pim_catalog_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_metric`
--

DROP TABLE IF EXISTS `pim_catalog_metric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_metric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` decimal(24,12) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `base_data` decimal(24,12) DEFAULT NULL,
  `base_unit` varchar(20) DEFAULT NULL,
  `family` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_metric`
--

LOCK TABLES `pim_catalog_metric` WRITE;
/*!40000 ALTER TABLE `pim_catalog_metric` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_metric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product`
--

DROP TABLE IF EXISTS `pim_catalog_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_91CD19C0C35E566A` (`family_id`),
  CONSTRAINT `FK_91CD19C0C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product`
--

LOCK TABLES `pim_catalog_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product_template`
--

DROP TABLE IF EXISTS `pim_catalog_product_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_product_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valuesData` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product_template`
--

LOCK TABLES `pim_catalog_product_template` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product_value`
--

DROP TABLE IF EXISTS `pim_catalog_product_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_product_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `value_string` varchar(255) DEFAULT NULL,
  `value_integer` int(11) DEFAULT NULL,
  `value_decimal` decimal(14,4) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_text` longtext DEFAULT NULL,
  `value_date` date DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `locale_code` varchar(20) DEFAULT NULL,
  `scope_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_93A1BBF3A952D583` (`metric_id`),
  KEY `IDX_93A1BBF3B6E62EFA` (`attribute_id`),
  KEY `IDX_93A1BBF3A7C41D6F` (`option_id`),
  KEY `IDX_93A1BBF381257D5D` (`entity_id`),
  KEY `IDX_93A1BBF3EA9FDD75` (`media_id`),
  KEY `value_idx` (`attribute_id`,`locale_code`,`scope_code`),
  KEY `varchar_idx` (`value_string`),
  KEY `integer_idx` (`value_integer`),
  CONSTRAINT `FK_93A1BBF381257D5D` FOREIGN KEY (`entity_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_93A1BBF3A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `pim_catalog_attribute_option` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_93A1BBF3A952D583` FOREIGN KEY (`metric_id`) REFERENCES `pim_catalog_metric` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_93A1BBF3B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_93A1BBF3EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `akeneo_file_storage_file_info` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product_value`
--

LOCK TABLES `pim_catalog_product_value` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product_value_option`
--

DROP TABLE IF EXISTS `pim_catalog_product_value_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_product_value_option` (
  `value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`value_id`,`option_id`),
  KEY `IDX_649CDCADF920BBA2` (`value_id`),
  KEY `IDX_649CDCADA7C41D6F` (`option_id`),
  CONSTRAINT `FK_649CDCADA7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `pim_catalog_attribute_option` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_649CDCADF920BBA2` FOREIGN KEY (`value_id`) REFERENCES `pim_catalog_product_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product_value_option`
--

LOCK TABLES `pim_catalog_product_value_option` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product_value_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product_value_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product_value_price`
--

DROP TABLE IF EXISTS `pim_catalog_product_value_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_catalog_product_value_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_id` int(11) DEFAULT NULL,
  `data` decimal(10,2) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value_currency_idx` (`value_id`,`currency_code`),
  KEY `IDX_BE63E43EF920BBA2` (`value_id`),
  CONSTRAINT `FK_BE63E43EF920BBA2` FOREIGN KEY (`value_id`) REFERENCES `pim_catalog_product_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product_value_price`
--

LOCK TABLES `pim_catalog_product_value_price` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product_value_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product_value_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_comment_comment`
--

DROP TABLE IF EXISTS `pim_comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `resource_name` varchar(255) NOT NULL,
  `resource_id` varchar(24) NOT NULL,
  `body` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `replied_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2A32D03D727ACA70` (`parent_id`),
  KEY `IDX_2A32D03DF675F31B` (`author_id`),
  KEY `resource_name_resource_id_idx` (`resource_name`,`resource_id`),
  CONSTRAINT `FK_2A32D03D727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `pim_comment_comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2A32D03DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `oro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_comment_comment`
--

LOCK TABLES `pim_comment_comment` WRITE;
/*!40000 ALTER TABLE `pim_comment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_datagrid_view`
--

DROP TABLE IF EXISTS `pim_datagrid_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_datagrid_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `datagrid_alias` varchar(255) NOT NULL,
  `columns` longtext NOT NULL COMMENT '(DC2Type:array)',
  `filters` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B56B38F1EA750E8` (`label`),
  KEY `IDX_B56B38F17E3C61F9` (`owner_id`),
  CONSTRAINT `FK_B56B38F17E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_datagrid_view`
--

LOCK TABLES `pim_datagrid_view` WRITE;
/*!40000 ALTER TABLE `pim_datagrid_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_datagrid_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_enrich_sequential_edit`
--

DROP TABLE IF EXISTS `pim_enrich_sequential_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_enrich_sequential_edit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `object_set` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8B8F3DA5A76ED395` (`user_id`),
  CONSTRAINT `FK_8B8F3DA5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_enrich_sequential_edit`
--

LOCK TABLES `pim_enrich_sequential_edit` WRITE;
/*!40000 ALTER TABLE `pim_enrich_sequential_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_enrich_sequential_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_notification_notification`
--

DROP TABLE IF EXISTS `pim_notification_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_notification_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) DEFAULT NULL,
  `routeParams` longtext NOT NULL COMMENT '(DC2Type:array)',
  `message` varchar(255) NOT NULL,
  `messageParams` longtext NOT NULL COMMENT '(DC2Type:array)',
  `comment` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `context` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_notification_notification`
--

LOCK TABLES `pim_notification_notification` WRITE;
/*!40000 ALTER TABLE `pim_notification_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_notification_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_notification_user_notification`
--

DROP TABLE IF EXISTS `pim_notification_user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_notification_user_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `viewed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_342AA855BF5476CA` (`notification`),
  KEY `IDX_342AA8558D93D649` (`user`),
  CONSTRAINT `FK_342AA8558D93D649` FOREIGN KEY (`user`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_342AA855BF5476CA` FOREIGN KEY (`notification`) REFERENCES `pim_notification_notification` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_notification_user_notification`
--

LOCK TABLES `pim_notification_user_notification` WRITE;
/*!40000 ALTER TABLE `pim_notification_user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_notification_user_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_session`
--

DROP TABLE IF EXISTS `pim_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_session` (
  `sess_id` varbinary(128) NOT NULL,
  `sess_data` blob NOT NULL,
  `sess_time` int(10) unsigned NOT NULL,
  `sess_lifetime` mediumint(9) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_session`
--

LOCK TABLES `pim_session` WRITE;
/*!40000 ALTER TABLE `pim_session` DISABLE KEYS */;
INSERT INTO `pim_session` VALUES ('679bf1616466e5647c4ef123da46785b','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:23:\"http://127.0.0.1:18801/\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1790759524;s:1:\"c\";i:1790759524;s:1:\"l\";s:1:\"0\";}',1790759525,3600),('943f0a86adceb5e21a3804031251c0a3','_sf2_attributes|a:2:{s:10:\"dataLocale\";s:5:\"en_US\";s:18:\"_csrf/authenticate\";s:43:\"ikhqEHxf-WcIo5vqnlQv9pnss1IEWqv5602CHOOLEyg\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1790759530;s:1:\"c\";i:1790759530;s:1:\"l\";s:1:\"0\";}',1790759532,3600),('e404e21babe9a062fd55ea5b9614c6b6','_sf2_attributes|a:2:{s:10:\"dataLocale\";s:5:\"en_US\";s:18:\"_csrf/authenticate\";s:43:\"3_bkB9sQ1oz2xW0pwisQb8ccqGKXnQPlFOWrsFhoZ1E\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1790759575;s:1:\"c\";i:1790759575;s:1:\"l\";s:1:\"0\";}',1790759575,3600),('e74b792905a766b84153b162e8ab8091','_sf2_attributes|a:4:{s:18:\"_csrf/authenticate\";s:43:\"GDcoVycQJw8eu0hxaz34k7MhBlrHEK4t2M2ZKilmUAY\";s:7:\"_locale\";s:5:\"en_US\";s:14:\"_security_main\";s:598:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":510:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:470:\"a:4:{i:0;C:33:\"Pim\\Bundle\\UserBundle\\Entity\\User\":187:{a:6:{i:0;s:88:\"XaD5SbHV2/wdcxw26Fy/sPPmgc9dhTUXiNXYZIC4Dn+sJtcVO1apG77pg2TzUVpIpcR/XehZX5pPUBkArXg1Ag==\";i:1;s:31:\"7is7rrnlnfgggsoss884gso0g80kgog\";i:2;s:5:\"admin\";i:3;b:1;i:4;N;i:5;i:1;}}i:1;b:1;i:2;a:1:{i:0;O:33:\"Oro\\Bundle\\UserBundle\\Entity\\Role\":4:{s:5:\"\0*\0id\";i:1;s:7:\"\0*\0role\";s:18:\"ROLE_ADMINISTRATOR\";s:8:\"\0*\0label\";s:13:\"Administrator\";s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";N;}}i:3;a:0:{}}\";}}\";s:10:\"dataLocale\";s:5:\"en_US\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1790759585;s:1:\"c\";i:1790759585;s:1:\"l\";s:1:\"0\";}',1790759587,3600),('f80f807a7d20725a304bef08e25572e8','_sf2_attributes|a:2:{s:10:\"dataLocale\";s:5:\"en_US\";s:18:\"_csrf/authenticate\";s:43:\"LfI725UifYAIYSpgghGb0nyckMX0BmCzRuo-VMEzSX4\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1790759566;s:1:\"c\";i:1790759566;s:1:\"l\";s:1:\"0\";}',1790759566,3600);
/*!40000 ALTER TABLE `pim_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_user_default_datagrid_view`
--

DROP TABLE IF EXISTS `pim_user_default_datagrid_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_user_default_datagrid_view` (
  `user_id` int(11) NOT NULL,
  `view_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`view_id`),
  KEY `IDX_3CEEC2F2A76ED395` (`user_id`),
  KEY `IDX_3CEEC2F231518C7` (`view_id`),
  CONSTRAINT `FK_3CEEC2F231518C7` FOREIGN KEY (`view_id`) REFERENCES `pim_datagrid_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3CEEC2F2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_user_default_datagrid_view`
--

LOCK TABLES `pim_user_default_datagrid_view` WRITE;
/*!40000 ALTER TABLE `pim_user_default_datagrid_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_user_default_datagrid_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_versioning_version`
--

DROP TABLE IF EXISTS `pim_versioning_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pim_versioning_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `resource_name` varchar(255) NOT NULL,
  `resource_id` varchar(24) NOT NULL,
  `snapshot` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `changeset` longtext NOT NULL COMMENT '(DC2Type:array)',
  `context` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `logged_at` datetime NOT NULL,
  `pending` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_name_resource_id_idx` (`resource_name`,`resource_id`),
  KEY `resource_name_idx` (`resource_name`),
  KEY `pending_idx` (`pending`),
  KEY `version_idx` (`version`),
  KEY `logged_at_idx` (`logged_at`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_versioning_version`
--

LOCK TABLES `pim_versioning_version` WRITE;
/*!40000 ALTER TABLE `pim_versioning_version` DISABLE KEYS */;
INSERT INTO `pim_versioning_version` VALUES (1,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','1','a:5:{s:4:\"code\";s:21:\"fixtures_currency_csv\";s:5:\"label\";s:24:\"Currencies data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:259:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/currencies.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"fixtures_currency_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"Currencies data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:259:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/currencies.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(2,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','2','a:5:{s:4:\"code\";s:19:\"fixtures_locale_csv\";s:5:\"label\";s:21:\"Locales data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:256:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/locales.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"fixtures_locale_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Locales data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:256:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/locales.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(3,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','3','a:5:{s:4:\"code\";s:23:\"fixtures_user_group_csv\";s:5:\"label\";s:25:\"User groups data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:260:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/user_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:23:\"fixtures_user_group_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"User groups data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:260:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/user_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(4,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','4','a:5:{s:4:\"code\";s:23:\"fixtures_group_type_csv\";s:5:\"label\";s:25:\"Group types data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:260:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/group_types.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:23:\"fixtures_group_type_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"Group types data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:260:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/group_types.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(5,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','5','a:5:{s:4:\"code\";s:28:\"fixtures_attribute_group_csv\";s:5:\"label\";s:30:\"Attribute groups data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:265:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:28:\"fixtures_attribute_group_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"Attribute groups data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:265:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(6,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','6','a:5:{s:4:\"code\";s:21:\"fixtures_category_csv\";s:5:\"label\";s:24:\"Categories data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:259:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/categories.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"fixtures_category_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"Categories data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:259:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/categories.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(7,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','7','a:5:{s:4:\"code\";s:22:\"fixtures_attribute_csv\";s:5:\"label\";s:24:\"Attributes data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:259:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attributes.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"fixtures_attribute_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"Attributes data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:259:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attributes.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(8,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','8','a:5:{s:4:\"code\";s:29:\"fixtures_association_type_csv\";s:5:\"label\";s:26:\"Associations data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:266:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/association_types.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"fixtures_association_type_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Associations data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:266:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/association_types.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(9,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','9','a:5:{s:4:\"code\";s:20:\"fixtures_channel_csv\";s:5:\"label\";s:22:\"Channels data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:257:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/channels.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"fixtures_channel_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"Channels data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:257:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/channels.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(10,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','10','a:5:{s:4:\"code\";s:30:\"fixtures_attribute_options_csv\";s:5:\"label\";s:31:\"Attribute options data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:266:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_options.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"fixtures_attribute_options_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:31:\"Attribute options data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:266:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_options.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(11,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','11','a:5:{s:4:\"code\";s:19:\"fixtures_family_csv\";s:5:\"label\";s:22:\"Families data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:257:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/families.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"fixtures_family_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"Families data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:257:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/families.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(12,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','12','a:5:{s:4:\"code\";s:18:\"fixtures_group_csv\";s:5:\"label\";s:20:\"Groups data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:255:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"fixtures_group_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Groups data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:255:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(13,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','13','a:5:{s:4:\"code\";s:26:\"fixtures_variant_group_csv\";s:5:\"label\";s:28:\"Variant groups data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:325:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/variant_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"decimalSeparator\":\".\",\"dateFormat\":\"Y-m-d\",\"copyValues\":true}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"fixtures_variant_group_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:28:\"Variant groups data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:325:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/variant_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"decimalSeparator\":\".\",\"dateFormat\":\"Y-m-d\",\"copyValues\":true}\";}}',NULL,1,'2026-09-30 09:10:27',0),(14,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','14','a:5:{s:4:\"code\";s:22:\"fixtures_user_role_csv\";s:5:\"label\";s:24:\"User roles data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:259:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/user_roles.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"fixtures_user_role_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"User roles data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:259:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/user_roles.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(15,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','15','a:5:{s:4:\"code\";s:17:\"fixtures_user_csv\";s:5:\"label\";s:19:\"Users data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:254:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/users.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"fixtures_user_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"Users data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:254:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/users.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(16,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','16','a:5:{s:4:\"code\";s:20:\"fixtures_product_csv\";s:5:\"label\";s:21:\"Product data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:452:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/products.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"decimalSeparator\":\".\",\"dateFormat\":\"yyyy-MM-dd\",\"enabled\":true,\"categoriesColumn\":\"categories\",\"familyColumn\":\"family\",\"groupsColumn\":\"groups\",\"enabledComparison\":true,\"realTimeVersioning\":true}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"fixtures_product_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Product data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:452:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/products.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"decimalSeparator\":\".\",\"dateFormat\":\"yyyy-MM-dd\",\"enabled\":true,\"categoriesColumn\":\"categories\",\"familyColumn\":\"family\",\"groupsColumn\":\"groups\",\"enabledComparison\":true,\"realTimeVersioning\":true}\";}}',NULL,1,'2026-09-30 09:10:27',0),(17,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','17','a:5:{s:4:\"code\";s:16:\"fixtures_job_yml\";s:5:\"label\";s:18:\"Jobs data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:189:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/jobs.yml\",\"uploadAllowed\":true,\"invalid_items_file_format\":\"yaml\"}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:16:\"fixtures_job_yml\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"Jobs data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:189:\"{\"filePath\":\"\\/akeneo\\/vendor\\/akeneo\\/pim-community-dev\\/src\\/Pim\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/jobs.yml\",\"uploadAllowed\":true,\"invalid_items_file_format\":\"yaml\"}\";}}',NULL,1,'2026-09-30 09:10:27',0),(18,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','1','a:1:{s:4:\"code\";s:5:\"af_ZA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"af_ZA\";}}',NULL,1,'2026-09-30 09:10:27',0),(19,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','2','a:1:{s:4:\"code\";s:5:\"am_ET\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"am_ET\";}}',NULL,1,'2026-09-30 09:10:27',0),(20,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','3','a:1:{s:4:\"code\";s:5:\"ar_AE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_AE\";}}',NULL,1,'2026-09-30 09:10:27',0),(21,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','4','a:1:{s:4:\"code\";s:5:\"ar_BH\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_BH\";}}',NULL,1,'2026-09-30 09:10:27',0),(22,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','5','a:1:{s:4:\"code\";s:5:\"ar_DZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_DZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(23,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','6','a:1:{s:4:\"code\";s:5:\"ar_EG\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_EG\";}}',NULL,1,'2026-09-30 09:10:27',0),(24,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','7','a:1:{s:4:\"code\";s:5:\"ar_IQ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_IQ\";}}',NULL,1,'2026-09-30 09:10:27',0),(25,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','8','a:1:{s:4:\"code\";s:5:\"ar_JO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_JO\";}}',NULL,1,'2026-09-30 09:10:27',0),(26,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','9','a:1:{s:4:\"code\";s:5:\"ar_KW\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_KW\";}}',NULL,1,'2026-09-30 09:10:27',0),(27,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','10','a:1:{s:4:\"code\";s:5:\"ar_LB\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_LB\";}}',NULL,1,'2026-09-30 09:10:27',0),(28,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','11','a:1:{s:4:\"code\";s:5:\"ar_LY\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_LY\";}}',NULL,1,'2026-09-30 09:10:27',0),(29,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','12','a:1:{s:4:\"code\";s:5:\"ar_MA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_MA\";}}',NULL,1,'2026-09-30 09:10:27',0),(30,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','13','a:1:{s:4:\"code\";s:6:\"arn_CL\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"arn_CL\";}}',NULL,1,'2026-09-30 09:10:27',0),(31,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','14','a:1:{s:4:\"code\";s:5:\"ar_OM\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_OM\";}}',NULL,1,'2026-09-30 09:10:27',0),(32,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','15','a:1:{s:4:\"code\";s:5:\"ar_QA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_QA\";}}',NULL,1,'2026-09-30 09:10:27',0),(33,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','16','a:1:{s:4:\"code\";s:5:\"ar_SA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_SA\";}}',NULL,1,'2026-09-30 09:10:27',0),(34,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','17','a:1:{s:4:\"code\";s:5:\"ar_SY\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_SY\";}}',NULL,1,'2026-09-30 09:10:27',0),(35,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','18','a:1:{s:4:\"code\";s:5:\"ar_TN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_TN\";}}',NULL,1,'2026-09-30 09:10:27',0),(36,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','19','a:1:{s:4:\"code\";s:5:\"ar_YE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_YE\";}}',NULL,1,'2026-09-30 09:10:27',0),(37,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','20','a:1:{s:4:\"code\";s:5:\"as_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"as_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(38,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','21','a:1:{s:4:\"code\";s:10:\"az_Cyrl_AZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"az_Cyrl_AZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(39,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','22','a:1:{s:4:\"code\";s:10:\"az_Latn_AZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"az_Latn_AZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(40,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','23','a:1:{s:4:\"code\";s:5:\"ba_RU\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ba_RU\";}}',NULL,1,'2026-09-30 09:10:27',0),(41,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','24','a:1:{s:4:\"code\";s:5:\"be_BY\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"be_BY\";}}',NULL,1,'2026-09-30 09:10:27',0),(42,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','25','a:1:{s:4:\"code\";s:5:\"bg_BG\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"bg_BG\";}}',NULL,1,'2026-09-30 09:10:27',0),(43,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','26','a:1:{s:4:\"code\";s:5:\"bn_BD\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"bn_BD\";}}',NULL,1,'2026-09-30 09:10:27',0),(44,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','27','a:1:{s:4:\"code\";s:5:\"bn_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"bn_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(45,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','28','a:1:{s:4:\"code\";s:5:\"bo_CN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"bo_CN\";}}',NULL,1,'2026-09-30 09:10:27',0),(46,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','29','a:1:{s:4:\"code\";s:5:\"br_FR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"br_FR\";}}',NULL,1,'2026-09-30 09:10:27',0),(47,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','30','a:1:{s:4:\"code\";s:10:\"bs_Cyrl_BA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"bs_Cyrl_BA\";}}',NULL,1,'2026-09-30 09:10:27',0),(48,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','31','a:1:{s:4:\"code\";s:10:\"bs_Latn_BA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"bs_Latn_BA\";}}',NULL,1,'2026-09-30 09:10:27',0),(49,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','32','a:1:{s:4:\"code\";s:5:\"ca_ES\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ca_ES\";}}',NULL,1,'2026-09-30 09:10:27',0),(50,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','33','a:1:{s:4:\"code\";s:5:\"co_FR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"co_FR\";}}',NULL,1,'2026-09-30 09:10:27',0),(51,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','34','a:1:{s:4:\"code\";s:5:\"cs_CZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"cs_CZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(52,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','35','a:1:{s:4:\"code\";s:5:\"cy_GB\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"cy_GB\";}}',NULL,1,'2026-09-30 09:10:27',0),(53,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','36','a:1:{s:4:\"code\";s:5:\"da_DK\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"da_DK\";}}',NULL,1,'2026-09-30 09:10:27',0),(54,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','37','a:1:{s:4:\"code\";s:5:\"de_AT\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_AT\";}}',NULL,1,'2026-09-30 09:10:27',0),(55,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','38','a:1:{s:4:\"code\";s:5:\"de_CH\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_CH\";}}',NULL,1,'2026-09-30 09:10:27',0),(56,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','39','a:1:{s:4:\"code\";s:5:\"de_DE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_DE\";}}',NULL,1,'2026-09-30 09:10:27',0),(57,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','40','a:1:{s:4:\"code\";s:5:\"de_LI\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_LI\";}}',NULL,1,'2026-09-30 09:10:27',0),(58,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','41','a:1:{s:4:\"code\";s:5:\"de_LU\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_LU\";}}',NULL,1,'2026-09-30 09:10:27',0),(59,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','42','a:1:{s:4:\"code\";s:6:\"dsb_DE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"dsb_DE\";}}',NULL,1,'2026-09-30 09:10:27',0),(60,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','43','a:1:{s:4:\"code\";s:5:\"dv_MV\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"dv_MV\";}}',NULL,1,'2026-09-30 09:10:27',0),(61,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','44','a:1:{s:4:\"code\";s:5:\"el_GR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"el_GR\";}}',NULL,1,'2026-09-30 09:10:27',0),(62,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','45','a:1:{s:4:\"code\";s:6:\"en_029\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"en_029\";}}',NULL,1,'2026-09-30 09:10:27',0),(63,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','46','a:1:{s:4:\"code\";s:5:\"en_AU\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_AU\";}}',NULL,1,'2026-09-30 09:10:27',0),(64,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','47','a:1:{s:4:\"code\";s:5:\"en_BZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_BZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(65,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','48','a:1:{s:4:\"code\";s:5:\"en_CA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_CA\";}}',NULL,1,'2026-09-30 09:10:27',0),(66,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','49','a:1:{s:4:\"code\";s:5:\"en_GB\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_GB\";}}',NULL,1,'2026-09-30 09:10:27',0),(67,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','50','a:1:{s:4:\"code\";s:5:\"en_IE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_IE\";}}',NULL,1,'2026-09-30 09:10:27',0),(68,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','51','a:1:{s:4:\"code\";s:5:\"en_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(69,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','52','a:1:{s:4:\"code\";s:5:\"en_JM\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_JM\";}}',NULL,1,'2026-09-30 09:10:27',0),(70,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','53','a:1:{s:4:\"code\";s:5:\"en_MY\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_MY\";}}',NULL,1,'2026-09-30 09:10:27',0),(71,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','54','a:1:{s:4:\"code\";s:5:\"en_NZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_NZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(72,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','55','a:1:{s:4:\"code\";s:5:\"en_PH\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_PH\";}}',NULL,1,'2026-09-30 09:10:27',0),(73,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','56','a:1:{s:4:\"code\";s:5:\"en_SG\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_SG\";}}',NULL,1,'2026-09-30 09:10:27',0),(74,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','57','a:1:{s:4:\"code\";s:5:\"en_TT\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_TT\";}}',NULL,1,'2026-09-30 09:10:27',0),(75,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','58','a:1:{s:4:\"code\";s:5:\"en_US\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_US\";}}',NULL,1,'2026-09-30 09:10:27',0),(76,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','59','a:1:{s:4:\"code\";s:5:\"en_ZA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_ZA\";}}',NULL,1,'2026-09-30 09:10:27',0),(77,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','60','a:1:{s:4:\"code\";s:5:\"en_ZW\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_ZW\";}}',NULL,1,'2026-09-30 09:10:27',0),(78,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','61','a:1:{s:4:\"code\";s:5:\"es_AR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_AR\";}}',NULL,1,'2026-09-30 09:10:27',0),(79,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','62','a:1:{s:4:\"code\";s:5:\"es_BO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_BO\";}}',NULL,1,'2026-09-30 09:10:27',0),(80,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','63','a:1:{s:4:\"code\";s:5:\"es_CL\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_CL\";}}',NULL,1,'2026-09-30 09:10:27',0),(81,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','64','a:1:{s:4:\"code\";s:5:\"es_CO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_CO\";}}',NULL,1,'2026-09-30 09:10:27',0),(82,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','65','a:1:{s:4:\"code\";s:5:\"es_CR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_CR\";}}',NULL,1,'2026-09-30 09:10:27',0),(83,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','66','a:1:{s:4:\"code\";s:5:\"es_DO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_DO\";}}',NULL,1,'2026-09-30 09:10:27',0),(84,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','67','a:1:{s:4:\"code\";s:5:\"es_EC\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_EC\";}}',NULL,1,'2026-09-30 09:10:27',0),(85,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','68','a:1:{s:4:\"code\";s:5:\"es_ES\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_ES\";}}',NULL,1,'2026-09-30 09:10:27',0),(86,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','69','a:1:{s:4:\"code\";s:5:\"es_GT\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_GT\";}}',NULL,1,'2026-09-30 09:10:27',0),(87,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','70','a:1:{s:4:\"code\";s:5:\"es_HN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_HN\";}}',NULL,1,'2026-09-30 09:10:27',0),(88,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','71','a:1:{s:4:\"code\";s:5:\"es_MX\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_MX\";}}',NULL,1,'2026-09-30 09:10:27',0),(89,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','72','a:1:{s:4:\"code\";s:5:\"es_NI\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_NI\";}}',NULL,1,'2026-09-30 09:10:27',0),(90,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','73','a:1:{s:4:\"code\";s:5:\"es_PA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_PA\";}}',NULL,1,'2026-09-30 09:10:27',0),(91,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','74','a:1:{s:4:\"code\";s:5:\"es_PE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_PE\";}}',NULL,1,'2026-09-30 09:10:27',0),(92,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','75','a:1:{s:4:\"code\";s:5:\"es_PR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_PR\";}}',NULL,1,'2026-09-30 09:10:27',0),(93,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','76','a:1:{s:4:\"code\";s:5:\"es_PY\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_PY\";}}',NULL,1,'2026-09-30 09:10:27',0),(94,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','77','a:1:{s:4:\"code\";s:5:\"es_SV\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_SV\";}}',NULL,1,'2026-09-30 09:10:27',0),(95,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','78','a:1:{s:4:\"code\";s:5:\"es_US\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_US\";}}',NULL,1,'2026-09-30 09:10:27',0),(96,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','79','a:1:{s:4:\"code\";s:5:\"es_UY\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_UY\";}}',NULL,1,'2026-09-30 09:10:27',0),(97,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','80','a:1:{s:4:\"code\";s:5:\"es_VE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_VE\";}}',NULL,1,'2026-09-30 09:10:27',0),(98,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','81','a:1:{s:4:\"code\";s:5:\"et_EE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"et_EE\";}}',NULL,1,'2026-09-30 09:10:27',0),(99,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','82','a:1:{s:4:\"code\";s:5:\"eu_ES\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"eu_ES\";}}',NULL,1,'2026-09-30 09:10:27',0),(100,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','83','a:1:{s:4:\"code\";s:5:\"fa_IR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fa_IR\";}}',NULL,1,'2026-09-30 09:10:27',0),(101,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','84','a:1:{s:4:\"code\";s:5:\"fi_FI\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fi_FI\";}}',NULL,1,'2026-09-30 09:10:27',0),(102,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','85','a:1:{s:4:\"code\";s:6:\"fil_PH\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"fil_PH\";}}',NULL,1,'2026-09-30 09:10:27',0),(103,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','86','a:1:{s:4:\"code\";s:5:\"fo_FO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fo_FO\";}}',NULL,1,'2026-09-30 09:10:27',0),(104,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','87','a:1:{s:4:\"code\";s:5:\"fr_BE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_BE\";}}',NULL,1,'2026-09-30 09:10:27',0),(105,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','88','a:1:{s:4:\"code\";s:5:\"fr_CA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_CA\";}}',NULL,1,'2026-09-30 09:10:27',0),(106,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','89','a:1:{s:4:\"code\";s:5:\"fr_CH\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_CH\";}}',NULL,1,'2026-09-30 09:10:27',0),(107,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','90','a:1:{s:4:\"code\";s:5:\"fr_FR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_FR\";}}',NULL,1,'2026-09-30 09:10:27',0),(108,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','91','a:1:{s:4:\"code\";s:5:\"fr_LU\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_LU\";}}',NULL,1,'2026-09-30 09:10:27',0),(109,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','92','a:1:{s:4:\"code\";s:5:\"fr_MC\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_MC\";}}',NULL,1,'2026-09-30 09:10:27',0),(110,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','93','a:1:{s:4:\"code\";s:5:\"fy_NL\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fy_NL\";}}',NULL,1,'2026-09-30 09:10:27',0),(111,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','94','a:1:{s:4:\"code\";s:5:\"ga_IE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ga_IE\";}}',NULL,1,'2026-09-30 09:10:27',0),(112,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','95','a:1:{s:4:\"code\";s:5:\"gd_GB\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"gd_GB\";}}',NULL,1,'2026-09-30 09:10:27',0),(113,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','96','a:1:{s:4:\"code\";s:5:\"gl_ES\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"gl_ES\";}}',NULL,1,'2026-09-30 09:10:27',0),(114,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','97','a:1:{s:4:\"code\";s:6:\"gsw_FR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"gsw_FR\";}}',NULL,1,'2026-09-30 09:10:27',0),(115,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','98','a:1:{s:4:\"code\";s:5:\"gu_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"gu_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(116,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','99','a:1:{s:4:\"code\";s:10:\"ha_Latn_NG\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"ha_Latn_NG\";}}',NULL,1,'2026-09-30 09:10:27',0),(117,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','100','a:1:{s:4:\"code\";s:5:\"he_IL\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"he_IL\";}}',NULL,1,'2026-09-30 09:10:27',0),(118,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','101','a:1:{s:4:\"code\";s:5:\"hi_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hi_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(119,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','102','a:1:{s:4:\"code\";s:5:\"hr_BA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hr_BA\";}}',NULL,1,'2026-09-30 09:10:27',0),(120,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','103','a:1:{s:4:\"code\";s:5:\"hr_HR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hr_HR\";}}',NULL,1,'2026-09-30 09:10:27',0),(121,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','104','a:1:{s:4:\"code\";s:6:\"hsb_DE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"hsb_DE\";}}',NULL,1,'2026-09-30 09:10:27',0),(122,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','105','a:1:{s:4:\"code\";s:5:\"hu_HU\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hu_HU\";}}',NULL,1,'2026-09-30 09:10:27',0),(123,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','106','a:1:{s:4:\"code\";s:5:\"hy_AM\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hy_AM\";}}',NULL,1,'2026-09-30 09:10:27',0),(124,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','107','a:1:{s:4:\"code\";s:5:\"id_ID\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"id_ID\";}}',NULL,1,'2026-09-30 09:10:27',0),(125,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','108','a:1:{s:4:\"code\";s:5:\"ig_NG\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ig_NG\";}}',NULL,1,'2026-09-30 09:10:27',0),(126,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','109','a:1:{s:4:\"code\";s:5:\"ii_CN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ii_CN\";}}',NULL,1,'2026-09-30 09:10:27',0),(127,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','110','a:1:{s:4:\"code\";s:5:\"is_IS\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"is_IS\";}}',NULL,1,'2026-09-30 09:10:27',0),(128,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','111','a:1:{s:4:\"code\";s:5:\"it_CH\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"it_CH\";}}',NULL,1,'2026-09-30 09:10:27',0),(129,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','112','a:1:{s:4:\"code\";s:5:\"it_IT\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"it_IT\";}}',NULL,1,'2026-09-30 09:10:27',0),(130,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','113','a:1:{s:4:\"code\";s:10:\"iu_Cans_CA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"iu_Cans_CA\";}}',NULL,1,'2026-09-30 09:10:27',0),(131,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','114','a:1:{s:4:\"code\";s:10:\"iu_Latn_CA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"iu_Latn_CA\";}}',NULL,1,'2026-09-30 09:10:27',0),(132,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','115','a:1:{s:4:\"code\";s:5:\"ja_JP\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ja_JP\";}}',NULL,1,'2026-09-30 09:10:27',0),(133,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','116','a:1:{s:4:\"code\";s:5:\"ka_GE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ka_GE\";}}',NULL,1,'2026-09-30 09:10:27',0),(134,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','117','a:1:{s:4:\"code\";s:5:\"kk_KZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"kk_KZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(135,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','118','a:1:{s:4:\"code\";s:5:\"kl_GL\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"kl_GL\";}}',NULL,1,'2026-09-30 09:10:27',0),(136,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','119','a:1:{s:4:\"code\";s:5:\"km_KH\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"km_KH\";}}',NULL,1,'2026-09-30 09:10:27',0),(137,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','120','a:1:{s:4:\"code\";s:5:\"kn_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"kn_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(138,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','121','a:1:{s:4:\"code\";s:6:\"kok_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"kok_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(139,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','122','a:1:{s:4:\"code\";s:5:\"ko_KR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ko_KR\";}}',NULL,1,'2026-09-30 09:10:27',0),(140,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','123','a:1:{s:4:\"code\";s:5:\"ky_KG\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ky_KG\";}}',NULL,1,'2026-09-30 09:10:27',0),(141,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','124','a:1:{s:4:\"code\";s:5:\"lb_LU\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"lb_LU\";}}',NULL,1,'2026-09-30 09:10:27',0),(142,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','125','a:1:{s:4:\"code\";s:5:\"lo_LA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"lo_LA\";}}',NULL,1,'2026-09-30 09:10:27',0),(143,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','126','a:1:{s:4:\"code\";s:5:\"lt_LT\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"lt_LT\";}}',NULL,1,'2026-09-30 09:10:27',0),(144,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','127','a:1:{s:4:\"code\";s:5:\"lv_LV\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"lv_LV\";}}',NULL,1,'2026-09-30 09:10:27',0),(145,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','128','a:1:{s:4:\"code\";s:5:\"mi_NZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mi_NZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(146,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','129','a:1:{s:4:\"code\";s:5:\"mk_MK\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mk_MK\";}}',NULL,1,'2026-09-30 09:10:27',0),(147,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','130','a:1:{s:4:\"code\";s:5:\"ml_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ml_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(148,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','131','a:1:{s:4:\"code\";s:5:\"mn_MN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mn_MN\";}}',NULL,1,'2026-09-30 09:10:27',0),(149,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','132','a:1:{s:4:\"code\";s:10:\"mn_Mong_CN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"mn_Mong_CN\";}}',NULL,1,'2026-09-30 09:10:27',0),(150,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','133','a:1:{s:4:\"code\";s:6:\"moh_CA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"moh_CA\";}}',NULL,1,'2026-09-30 09:10:27',0),(151,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','134','a:1:{s:4:\"code\";s:5:\"mr_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mr_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(152,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','135','a:1:{s:4:\"code\";s:5:\"ms_BN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ms_BN\";}}',NULL,1,'2026-09-30 09:10:27',0),(153,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','136','a:1:{s:4:\"code\";s:5:\"ms_MY\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ms_MY\";}}',NULL,1,'2026-09-30 09:10:27',0),(154,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','137','a:1:{s:4:\"code\";s:5:\"mt_MT\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mt_MT\";}}',NULL,1,'2026-09-30 09:10:27',0),(155,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','138','a:1:{s:4:\"code\";s:5:\"nb_NO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"nb_NO\";}}',NULL,1,'2026-09-30 09:10:27',0),(156,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','139','a:1:{s:4:\"code\";s:5:\"ne_NP\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ne_NP\";}}',NULL,1,'2026-09-30 09:10:27',0),(157,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','140','a:1:{s:4:\"code\";s:5:\"nl_BE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"nl_BE\";}}',NULL,1,'2026-09-30 09:10:27',0),(158,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','141','a:1:{s:4:\"code\";s:5:\"nl_NL\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"nl_NL\";}}',NULL,1,'2026-09-30 09:10:27',0),(159,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','142','a:1:{s:4:\"code\";s:5:\"nn_NO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"nn_NO\";}}',NULL,1,'2026-09-30 09:10:27',0),(160,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','143','a:1:{s:4:\"code\";s:6:\"nso_ZA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"nso_ZA\";}}',NULL,1,'2026-09-30 09:10:27',0),(161,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','144','a:1:{s:4:\"code\";s:5:\"oc_FR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"oc_FR\";}}',NULL,1,'2026-09-30 09:10:27',0),(162,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','145','a:1:{s:4:\"code\";s:5:\"or_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"or_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(163,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','146','a:1:{s:4:\"code\";s:5:\"pa_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"pa_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(164,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','147','a:1:{s:4:\"code\";s:5:\"pl_PL\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"pl_PL\";}}',NULL,1,'2026-09-30 09:10:27',0),(165,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','148','a:1:{s:4:\"code\";s:6:\"prs_AF\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"prs_AF\";}}',NULL,1,'2026-09-30 09:10:27',0),(166,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','149','a:1:{s:4:\"code\";s:5:\"ps_AF\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ps_AF\";}}',NULL,1,'2026-09-30 09:10:27',0),(167,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','150','a:1:{s:4:\"code\";s:5:\"pt_BR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"pt_BR\";}}',NULL,1,'2026-09-30 09:10:27',0),(168,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','151','a:1:{s:4:\"code\";s:5:\"pt_PT\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"pt_PT\";}}',NULL,1,'2026-09-30 09:10:27',0),(169,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','152','a:1:{s:4:\"code\";s:6:\"qut_GT\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"qut_GT\";}}',NULL,1,'2026-09-30 09:10:27',0),(170,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','153','a:1:{s:4:\"code\";s:6:\"quz_BO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"quz_BO\";}}',NULL,1,'2026-09-30 09:10:27',0),(171,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','154','a:1:{s:4:\"code\";s:6:\"quz_EC\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"quz_EC\";}}',NULL,1,'2026-09-30 09:10:27',0),(172,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','155','a:1:{s:4:\"code\";s:6:\"quz_PE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"quz_PE\";}}',NULL,1,'2026-09-30 09:10:27',0),(173,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','156','a:1:{s:4:\"code\";s:5:\"rm_CH\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"rm_CH\";}}',NULL,1,'2026-09-30 09:10:27',0),(174,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','157','a:1:{s:4:\"code\";s:5:\"ro_RO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ro_RO\";}}',NULL,1,'2026-09-30 09:10:27',0),(175,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','158','a:1:{s:4:\"code\";s:5:\"ru_RU\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ru_RU\";}}',NULL,1,'2026-09-30 09:10:27',0),(176,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','159','a:1:{s:4:\"code\";s:5:\"rw_RW\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"rw_RW\";}}',NULL,1,'2026-09-30 09:10:27',0),(177,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','160','a:1:{s:4:\"code\";s:6:\"sah_RU\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"sah_RU\";}}',NULL,1,'2026-09-30 09:10:27',0),(178,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','161','a:1:{s:4:\"code\";s:5:\"sa_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sa_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(179,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','162','a:1:{s:4:\"code\";s:5:\"se_FI\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"se_FI\";}}',NULL,1,'2026-09-30 09:10:27',0),(180,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','163','a:1:{s:4:\"code\";s:5:\"se_NO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"se_NO\";}}',NULL,1,'2026-09-30 09:10:27',0),(181,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','164','a:1:{s:4:\"code\";s:5:\"se_SE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"se_SE\";}}',NULL,1,'2026-09-30 09:10:27',0),(182,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','165','a:1:{s:4:\"code\";s:5:\"si_LK\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"si_LK\";}}',NULL,1,'2026-09-30 09:10:27',0),(183,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','166','a:1:{s:4:\"code\";s:5:\"sk_SK\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sk_SK\";}}',NULL,1,'2026-09-30 09:10:27',0),(184,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','167','a:1:{s:4:\"code\";s:5:\"sl_SI\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sl_SI\";}}',NULL,1,'2026-09-30 09:10:27',0),(185,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','168','a:1:{s:4:\"code\";s:6:\"sma_NO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"sma_NO\";}}',NULL,1,'2026-09-30 09:10:27',0),(186,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','169','a:1:{s:4:\"code\";s:6:\"sma_SE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"sma_SE\";}}',NULL,1,'2026-09-30 09:10:27',0),(187,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','170','a:1:{s:4:\"code\";s:6:\"smj_NO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"smj_NO\";}}',NULL,1,'2026-09-30 09:10:27',0),(188,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','171','a:1:{s:4:\"code\";s:6:\"smj_SE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"smj_SE\";}}',NULL,1,'2026-09-30 09:10:27',0),(189,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','172','a:1:{s:4:\"code\";s:6:\"smn_FI\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"smn_FI\";}}',NULL,1,'2026-09-30 09:10:27',0),(190,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','173','a:1:{s:4:\"code\";s:6:\"sms_FI\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"sms_FI\";}}',NULL,1,'2026-09-30 09:10:27',0),(191,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','174','a:1:{s:4:\"code\";s:5:\"sq_AL\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sq_AL\";}}',NULL,1,'2026-09-30 09:10:27',0),(192,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','175','a:1:{s:4:\"code\";s:10:\"sr_Cyrl_BA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Cyrl_BA\";}}',NULL,1,'2026-09-30 09:10:27',0),(193,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','176','a:1:{s:4:\"code\";s:10:\"sr_Cyrl_CS\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Cyrl_CS\";}}',NULL,1,'2026-09-30 09:10:27',0),(194,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','177','a:1:{s:4:\"code\";s:10:\"sr_Cyrl_ME\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Cyrl_ME\";}}',NULL,1,'2026-09-30 09:10:27',0),(195,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','178','a:1:{s:4:\"code\";s:10:\"sr_Cyrl_RS\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Cyrl_RS\";}}',NULL,1,'2026-09-30 09:10:27',0),(196,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','179','a:1:{s:4:\"code\";s:10:\"sr_Latn_BA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Latn_BA\";}}',NULL,1,'2026-09-30 09:10:27',0),(197,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','180','a:1:{s:4:\"code\";s:10:\"sr_Latn_CS\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Latn_CS\";}}',NULL,1,'2026-09-30 09:10:27',0),(198,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','181','a:1:{s:4:\"code\";s:10:\"sr_Latn_ME\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Latn_ME\";}}',NULL,1,'2026-09-30 09:10:27',0),(199,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','182','a:1:{s:4:\"code\";s:10:\"sr_Latn_RS\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Latn_RS\";}}',NULL,1,'2026-09-30 09:10:27',0),(200,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','183','a:1:{s:4:\"code\";s:5:\"sv_FI\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sv_FI\";}}',NULL,1,'2026-09-30 09:10:27',0),(201,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','184','a:1:{s:4:\"code\";s:5:\"sv_SE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sv_SE\";}}',NULL,1,'2026-09-30 09:10:27',0),(202,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','185','a:1:{s:4:\"code\";s:5:\"sw_KE\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sw_KE\";}}',NULL,1,'2026-09-30 09:10:27',0),(203,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','186','a:1:{s:4:\"code\";s:6:\"syr_SY\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"syr_SY\";}}',NULL,1,'2026-09-30 09:10:27',0),(204,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','187','a:1:{s:4:\"code\";s:5:\"ta_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ta_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(205,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','188','a:1:{s:4:\"code\";s:5:\"te_IN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"te_IN\";}}',NULL,1,'2026-09-30 09:10:27',0),(206,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','189','a:1:{s:4:\"code\";s:10:\"tg_Cyrl_TJ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"tg_Cyrl_TJ\";}}',NULL,1,'2026-09-30 09:10:27',0),(207,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','190','a:1:{s:4:\"code\";s:5:\"th_TH\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"th_TH\";}}',NULL,1,'2026-09-30 09:10:27',0),(208,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','191','a:1:{s:4:\"code\";s:5:\"tk_TM\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"tk_TM\";}}',NULL,1,'2026-09-30 09:10:27',0),(209,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','192','a:1:{s:4:\"code\";s:5:\"tn_ZA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"tn_ZA\";}}',NULL,1,'2026-09-30 09:10:27',0),(210,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','193','a:1:{s:4:\"code\";s:5:\"tr_TR\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"tr_TR\";}}',NULL,1,'2026-09-30 09:10:27',0),(211,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','194','a:1:{s:4:\"code\";s:5:\"tt_RU\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"tt_RU\";}}',NULL,1,'2026-09-30 09:10:27',0),(212,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','195','a:1:{s:4:\"code\";s:11:\"tzm_Latn_DZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:11:\"tzm_Latn_DZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(213,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','196','a:1:{s:4:\"code\";s:5:\"ug_CN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ug_CN\";}}',NULL,1,'2026-09-30 09:10:27',0),(214,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','197','a:1:{s:4:\"code\";s:5:\"uk_UA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"uk_UA\";}}',NULL,1,'2026-09-30 09:10:27',0),(215,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','198','a:1:{s:4:\"code\";s:5:\"ur_PK\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ur_PK\";}}',NULL,1,'2026-09-30 09:10:27',0),(216,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','199','a:1:{s:4:\"code\";s:10:\"uz_Cyrl_UZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"uz_Cyrl_UZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(217,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','200','a:1:{s:4:\"code\";s:10:\"uz_Latn_UZ\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"uz_Latn_UZ\";}}',NULL,1,'2026-09-30 09:10:27',0),(218,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','201','a:1:{s:4:\"code\";s:5:\"vi_VN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"vi_VN\";}}',NULL,1,'2026-09-30 09:10:27',0),(219,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','202','a:1:{s:4:\"code\";s:5:\"wo_SN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"wo_SN\";}}',NULL,1,'2026-09-30 09:10:27',0),(220,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','203','a:1:{s:4:\"code\";s:5:\"xh_ZA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"xh_ZA\";}}',NULL,1,'2026-09-30 09:10:27',0),(221,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','204','a:1:{s:4:\"code\";s:5:\"yo_NG\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"yo_NG\";}}',NULL,1,'2026-09-30 09:10:27',0),(222,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','205','a:1:{s:4:\"code\";s:5:\"zh_CN\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_CN\";}}',NULL,1,'2026-09-30 09:10:27',0),(223,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','206','a:1:{s:4:\"code\";s:5:\"zh_HK\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_HK\";}}',NULL,1,'2026-09-30 09:10:27',0),(224,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','207','a:1:{s:4:\"code\";s:5:\"zh_MO\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_MO\";}}',NULL,1,'2026-09-30 09:10:27',0),(225,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','208','a:1:{s:4:\"code\";s:5:\"zh_SG\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_SG\";}}',NULL,1,'2026-09-30 09:10:27',0),(226,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','209','a:1:{s:4:\"code\";s:5:\"zh_TW\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_TW\";}}',NULL,1,'2026-09-30 09:10:27',0),(227,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Locale','210','a:1:{s:4:\"code\";s:5:\"zu_ZA\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zu_ZA\";}}',NULL,1,'2026-09-30 09:10:27',0),(228,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\AttributeGroup','1','a:5:{s:4:\"code\";s:5:\"other\";s:10:\"sort_order\";i:100;s:10:\"attributes\";s:0:\"\";s:11:\"label-en_US\";s:5:\"Other\";s:11:\"label-fr_FR\";s:5:\"Autre\";}','a:4:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"other\";}s:10:\"sort_order\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";i:100;}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"Other\";}s:11:\"label-fr_FR\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"Autre\";}}',NULL,1,'2026-09-30 09:10:28',0),(229,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Category','1','a:3:{s:4:\"code\";s:6:\"master\";s:6:\"parent\";N;s:11:\"label-en_US\";s:14:\"Master catalog\";}','a:2:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"master\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:14:\"Master catalog\";}}',NULL,1,'2026-09-30 09:10:28',0),(230,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Attribute','1','a:28:{s:4:\"code\";s:3:\"sku\";s:4:\"type\";s:22:\"pim_catalog_identifier\";s:5:\"group\";s:5:\"other\";s:6:\"unique\";b:1;s:22:\"useable_as_grid_filter\";b:1;s:18:\"allowed_extensions\";s:0:\"\";s:13:\"metric_family\";N;s:19:\"default_metric_unit\";N;s:19:\"reference_data_name\";N;s:17:\"available_locales\";s:0:\"\";s:14:\"max_characters\";N;s:15:\"validation_rule\";N;s:17:\"validation_regexp\";N;s:15:\"wysiwyg_enabled\";N;s:10:\"number_min\";N;s:10:\"number_max\";N;s:16:\"decimals_allowed\";N;s:16:\"negative_allowed\";N;s:8:\"date_min\";N;s:8:\"date_max\";N;s:13:\"max_file_size\";N;s:20:\"minimum_input_length\";N;s:10:\"sort_order\";i:0;s:11:\"localizable\";b:0;s:11:\"label-en_US\";s:3:\"SKU\";s:7:\"options\";N;s:5:\"scope\";s:6:\"Global\";s:8:\"required\";b:1;}','a:8:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"sku\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"pim_catalog_identifier\";}s:5:\"group\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"other\";}s:6:\"unique\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";b:1;}s:22:\"useable_as_grid_filter\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";b:1;}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"SKU\";}s:5:\"scope\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"Global\";}s:8:\"required\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";b:1;}}',NULL,1,'2026-09-30 09:10:28',0),(231,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\AttributeGroup','1','a:5:{s:4:\"code\";s:5:\"other\";s:10:\"sort_order\";i:100;s:10:\"attributes\";s:3:\"sku\";s:11:\"label-en_US\";s:5:\"Other\";s:11:\"label-fr_FR\";s:5:\"Autre\";}','a:1:{s:10:\"attributes\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"sku\";}}',NULL,2,'2026-09-30 09:10:28',0),(232,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\AssociationType','1','a:3:{s:4:\"code\";s:6:\"X_SELL\";s:11:\"label-en_US\";s:10:\"Cross sell\";s:11:\"label-fr_FR\";s:14:\"Vente croisée\";}','a:3:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"X_SELL\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"Cross sell\";}s:11:\"label-fr_FR\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:14:\"Vente croisée\";}}',NULL,1,'2026-09-30 09:10:28',0),(233,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\AssociationType','2','a:3:{s:4:\"code\";s:6:\"UPSELL\";s:11:\"label-en_US\";s:6:\"Upsell\";s:11:\"label-fr_FR\";s:16:\"Vente incitative\";}','a:3:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"UPSELL\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"Upsell\";}s:11:\"label-fr_FR\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:16:\"Vente incitative\";}}',NULL,1,'2026-09-30 09:10:28',0),(234,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\AssociationType','3','a:3:{s:4:\"code\";s:12:\"SUBSTITUTION\";s:11:\"label-en_US\";s:12:\"Substitution\";s:11:\"label-fr_FR\";s:12:\"Remplacement\";}','a:3:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"SUBSTITUTION\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"Substitution\";}s:11:\"label-fr_FR\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"Remplacement\";}}',NULL,1,'2026-09-30 09:10:28',0),(235,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\AssociationType','4','a:3:{s:4:\"code\";s:4:\"PACK\";s:11:\"label-en_US\";s:4:\"Pack\";s:11:\"label-fr_FR\";s:4:\"Pack\";}','a:3:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:4:\"PACK\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:4:\"Pack\";}s:11:\"label-fr_FR\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:4:\"Pack\";}}',NULL,1,'2026-09-30 09:10:28',0),(236,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\Channel','1','a:7:{s:4:\"code\";s:9:\"ecommerce\";s:10:\"currencies\";s:3:\"USD\";s:7:\"locales\";s:5:\"en_US\";s:11:\"label-en_US\";s:7:\"Default\";s:11:\"label-de_DE\";s:8:\"Standard\";s:11:\"label-fr_FR\";s:7:\"Défaut\";s:8:\"category\";s:6:\"master\";}','a:7:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"ecommerce\";}s:10:\"currencies\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"USD\";}s:7:\"locales\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_US\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:7:\"Default\";}s:11:\"label-de_DE\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"Standard\";}s:11:\"label-fr_FR\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:7:\"Défaut\";}s:8:\"category\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"master\";}}',NULL,1,'2026-09-30 09:10:28',0),(237,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','18','a:5:{s:4:\"code\";s:20:\"update_product_value\";s:5:\"label\";s:20:\"Mass update products\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"update_product_value\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Mass update products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2026-09-30 09:10:28',0),(238,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','19','a:5:{s:4:\"code\";s:17:\"add_product_value\";s:5:\"label\";s:24:\"Mass add products values\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"add_product_value\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"Mass add products values\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2026-09-30 09:10:28',0),(239,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','20','a:5:{s:4:\"code\";s:20:\"remove_product_value\";s:5:\"label\";s:27:\"Mass remove products values\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"remove_product_value\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Mass remove products values\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2026-09-30 09:10:28',0),(240,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','21','a:5:{s:4:\"code\";s:22:\"edit_common_attributes\";s:5:\"label\";s:35:\"Mass edit common product attributes\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"edit_common_attributes\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:35:\"Mass edit common product attributes\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2026-09-30 09:10:28',0),(241,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','22','a:5:{s:4:\"code\";s:26:\"set_attribute_requirements\";s:5:\"label\";s:33:\"Set family attribute requirements\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"set_attribute_requirements\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:33:\"Set family attribute requirements\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2026-09-30 09:10:28',0),(242,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','23','a:5:{s:4:\"code\";s:20:\"add_to_variant_group\";s:5:\"label\";s:34:\"Mass add products to variant group\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"add_to_variant_group\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"Mass add products to variant group\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2026-09-30 09:10:28',0),(243,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','24','a:5:{s:4:\"code\";s:24:\"csv_product_quick_export\";s:5:\"label\";s:24:\"CSV product quick export\";s:9:\"connector\";s:20:\"Akeneo CSV Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:224:\"{\"filePath\":\"\\/tmp\\/products_export_%locale%_%scope%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"csv_product_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"CSV product quick export\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Akeneo CSV Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:224:\"{\"filePath\":\"\\/tmp\\/products_export_%locale%_%scope%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}}',NULL,1,'2026-09-30 09:10:28',0),(244,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','25','a:5:{s:4:\"code\";s:37:\"csv_product_grid_context_quick_export\";s:5:\"label\";s:37:\"CSV product quick export grid context\";s:9:\"connector\";s:20:\"Akeneo CSV Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:237:\"{\"filePath\":\"\\/tmp\\/products_export_grid_context_%locale%_%scope%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:37:\"csv_product_grid_context_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:37:\"CSV product quick export grid context\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Akeneo CSV Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:237:\"{\"filePath\":\"\\/tmp\\/products_export_grid_context_%locale%_%scope%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}}',NULL,1,'2026-09-30 09:10:28',0),(245,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','26','a:5:{s:4:\"code\";s:25:\"xlsx_product_quick_export\";s:5:\"label\";s:25:\"XLSX product quick export\";s:9:\"connector\";s:21:\"Akeneo XLSX Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:213:\"{\"filePath\":\"\\/tmp\\/products_export_%locale%_%scope%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"xlsx_product_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"XLSX product quick export\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Akeneo XLSX Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:213:\"{\"filePath\":\"\\/tmp\\/products_export_%locale%_%scope%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}}',NULL,1,'2026-09-30 09:10:28',0),(246,'admin','Akeneo\\Component\\Batch\\Model\\JobInstance','27','a:5:{s:4:\"code\";s:38:\"xlsx_product_grid_context_quick_export\";s:5:\"label\";s:38:\"XLSX product quick export grid context\";s:9:\"connector\";s:21:\"Akeneo XLSX Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:226:\"{\"filePath\":\"\\/tmp\\/products_export_grid_context_%locale%_%scope%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"xlsx_product_grid_context_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"XLSX product quick export grid context\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Akeneo XLSX Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:226:\"{\"filePath\":\"\\/tmp\\/products_export_grid_context_%locale%_%scope%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}}',NULL,1,'2026-09-30 09:10:28',0);
/*!40000 ALTER TABLE `pim_versioning_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30  9:13:51
