/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: humhub
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-ubu2204

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  `module` varchar(100) DEFAULT '',
  `object_model` varchar(100) DEFAULT '',
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment-created_by` (`created_by`),
  KEY `idx_comment_target` (`object_id`,`object_model`),
  CONSTRAINT `fk_comment-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `stream_channel` varchar(15) DEFAULT 'default',
  `stream_sort_date` datetime DEFAULT NULL,
  `visibility` tinyint(3) NOT NULL DEFAULT 0,
  `state` tinyint(3) NOT NULL DEFAULT 1,
  `was_published` tinyint(1) NOT NULL DEFAULT 0,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `locked_comments` tinyint(1) NOT NULL DEFAULT 0,
  `scheduled_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_object_model` (`object_model`,`object_id`),
  UNIQUE KEY `index_guid` (`guid`),
  KEY `fk-contentcontainer` (`contentcontainer_id`),
  KEY `fk-create-user` (`created_by`),
  KEY `fk-update-user` (`updated_by`),
  KEY `stream_channe` (`stream_channel`),
  KEY `idx_stream_created` (`created_at`),
  KEY `idx_stream_updated` (`stream_sort_date`),
  CONSTRAINT `fk-contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk-create-user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk-update-user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_fulltext`
--

DROP TABLE IF EXISTS `content_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_fulltext` (
  `content_id` int(11) NOT NULL,
  `contents` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `files` text DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  FULLTEXT KEY `ftx` (`contents`,`comments`,`files`),
  CONSTRAINT `fk_content_fulltext` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_fulltext`
--

LOCK TABLES `content_fulltext` WRITE;
/*!40000 ALTER TABLE `content_fulltext` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_fulltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tag`
--

DROP TABLE IF EXISTS `content_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `module_id` varchar(100) NOT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx-content-tag` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-content-tag-container-id` (`contentcontainer_id`),
  KEY `fk-content-tag-parent-id` (`parent_id`),
  CONSTRAINT `fk-content-tag-container-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-parent-id` FOREIGN KEY (`parent_id`) REFERENCES `content_tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tag`
--

LOCK TABLES `content_tag` WRITE;
/*!40000 ALTER TABLE `content_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tag_relation`
--

DROP TABLE IF EXISTS `content_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tag_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-content-tag-rel-content-id` (`content_id`),
  KEY `fk-content-tag-rel-tag-id` (`tag_id`),
  CONSTRAINT `fk-content-tag-rel-content-id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `content_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tag_relation`
--

LOCK TABLES `content_tag_relation` WRITE;
/*!40000 ALTER TABLE `content_tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer`
--

DROP TABLE IF EXISTS `contentcontainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` char(36) NOT NULL,
  `class` char(60) NOT NULL,
  `pk` int(11) DEFAULT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  `tags_cached` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_guid` (`guid`),
  UNIQUE KEY `unique_target` (`class`,`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer`
--

LOCK TABLES `contentcontainer` WRITE;
/*!40000 ALTER TABLE `contentcontainer` DISABLE KEYS */;
INSERT INTO `contentcontainer` VALUES
(1,'8bf32292-280d-4dd3-a7bb-9ec02b8a2908','humhub\\modules\\user\\models\\User',1,1,NULL);
/*!40000 ALTER TABLE `contentcontainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_blocked_users`
--

DROP TABLE IF EXISTS `contentcontainer_blocked_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_blocked_users` (
  `contentcontainer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`contentcontainer_id`,`user_id`),
  KEY `fk-contentcontainer-blocked-users-rel-user-id` (`user_id`),
  CONSTRAINT `fk-contentcontainer-blocked-users-rel-contentcontainer-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-contentcontainer-blocked-users-rel-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_blocked_users`
--

LOCK TABLES `contentcontainer_blocked_users` WRITE;
/*!40000 ALTER TABLE `contentcontainer_blocked_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_blocked_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_default_permission`
--

DROP TABLE IF EXISTS `contentcontainer_default_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_default_permission` (
  `permission_id` varchar(150) NOT NULL,
  `contentcontainer_class` char(60) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_default_permission`
--

LOCK TABLES `contentcontainer_default_permission` WRITE;
/*!40000 ALTER TABLE `contentcontainer_default_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_default_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_module`
--

DROP TABLE IF EXISTS `contentcontainer_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_module` (
  `contentcontainer_id` int(11) NOT NULL,
  `module_id` char(100) NOT NULL,
  `module_state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`contentcontainer_id`,`module_id`),
  CONSTRAINT `fk_contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_module`
--

LOCK TABLES `contentcontainer_module` WRITE;
/*!40000 ALTER TABLE `contentcontainer_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_permission`
--

DROP TABLE IF EXISTS `contentcontainer_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_permission` (
  `permission_id` varchar(150) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_permission`
--

LOCK TABLES `contentcontainer_permission` WRITE;
/*!40000 ALTER TABLE `contentcontainer_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_setting`
--

DROP TABLE IF EXISTS `contentcontainer_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(50) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings-unique` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-contentcontainerx` (`contentcontainer_id`),
  CONSTRAINT `fk-contentcontainerx` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_setting`
--

LOCK TABLES `contentcontainer_setting` WRITE;
/*!40000 ALTER TABLE `contentcontainer_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_tag`
--

DROP TABLE IF EXISTS `contentcontainer_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contentcontainer_class` char(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-contentcontainer-tag` (`contentcontainer_class`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_tag`
--

LOCK TABLES `contentcontainer_tag` WRITE;
/*!40000 ALTER TABLE `contentcontainer_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_tag_relation`
--

DROP TABLE IF EXISTS `contentcontainer_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_tag_relation` (
  `contentcontainer_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`contentcontainer_id`,`tag_id`),
  KEY `fk-contentcontainer-tag-rel-tag-id` (`tag_id`),
  CONSTRAINT `fk-contentcontainer-tag-rel-contentcontainer-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-contentcontainer-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `contentcontainer_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_tag_relation`
--

LOCK TABLES `contentcontainer_tag_relation` WRITE;
/*!40000 ALTER TABLE `contentcontainer_tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `state` tinyint(3) NOT NULL DEFAULT 1,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `standalone` tinyint(1) NOT NULL DEFAULT 0,
  `category` int(11) unsigned NOT NULL DEFAULT 0,
  `object_model` varchar(100) DEFAULT '',
  `object_id` varchar(100) DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `content_id` int(11) unsigned DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mime_type` varchar(150) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `metadata` varchar(4000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `show_in_stream` tinyint(1) DEFAULT 1,
  `hash_sha1` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux-file-guid` (`guid`),
  KEY `fk_file-created_by` (`created_by`),
  KEY `ix-file-object` (`object_model`,`object_id`,`sort_order`),
  KEY `ix-file-category` (`category`,`object_model`,`object_id`),
  CONSTRAINT `fk_file-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_history`
--

DROP TABLE IF EXISTS `file_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `size` bigint(20) NOT NULL,
  `hash_sha1` varchar(40) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_history` (`file_id`),
  KEY `fk_file_history_user` (`created_by`),
  CONSTRAINT `fk_file_history` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_file_history_user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_history`
--

LOCK TABLES `file_history` WRITE;
/*!40000 ALTER TABLE `file_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `parent_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `is_admin_group` tinyint(1) NOT NULL DEFAULT 0,
  `is_default_group` tinyint(1) NOT NULL DEFAULT 0,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `show_at_registration` tinyint(1) NOT NULL DEFAULT 1,
  `show_at_directory` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `notify_users` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx-group-parent_group_id` (`parent_group_id`),
  CONSTRAINT `fk-group-parent_group_id` FOREIGN KEY (`parent_group_id`) REFERENCES `group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES
(1,'Administrators','Default group for administrators of this HumHub Installation',NULL,'2026-09-23 12:28:42',NULL,NULL,NULL,NULL,1,0,0,0,0,100,0),
(2,'Users','Default group for all newly registered users of the network',NULL,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,0,1,0,1,0,100,0);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_permission`
--

DROP TABLE IF EXISTS `group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_permission` (
  `permission_id` varchar(150) NOT NULL,
  `group_id` int(11) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`),
  KEY `fk_group_permission-group_id` (`group_id`),
  CONSTRAINT `fk_group_permission-group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_permission`
--

LOCK TABLES `group_permission` WRITE;
/*!40000 ALTER TABLE `group_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_space`
--

DROP TABLE IF EXISTS `group_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-group_space` (`space_id`,`group_id`),
  KEY `fk-group_space-group` (`group_id`),
  CONSTRAINT `fk-group_space-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-group_space-space` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_space`
--

LOCK TABLES `group_space` WRITE;
/*!40000 ALTER TABLE `group_space` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_group_manager` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-group_user` (`user_id`,`group_id`),
  KEY `fk-group-group` (`group_id`),
  CONSTRAINT `fk-group-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-user-group` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES
(1,1,2,0,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL),
(2,1,1,0,'2026-09-23 12:28:45',NULL,'2026-09-23 12:28:45',NULL);
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_user_id` int(11) DEFAULT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-object-user` (`object_model`,`object_id`,`created_by`),
  KEY `index_object` (`object_model`,`object_id`),
  KEY `fk_like-created_by` (`created_by`),
  KEY `fk_like-target_user_id` (`target_user_id`),
  CONSTRAINT `fk_like-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_like-target_user_id` FOREIGN KEY (`target_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live`
--

DROP TABLE IF EXISTS `live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `visibility` int(1) DEFAULT NULL,
  `serialized_data` text NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentcontainer` (`contentcontainer_id`),
  CONSTRAINT `contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live`
--

LOCK TABLES `live` WRITE;
/*!40000 ALTER TABLE `live` DISABLE KEYS */;
/*!40000 ALTER TABLE `live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES
('m000000_000000_base',1790166520),
('m131023_164513_initial',1790166520),
('m131023_165411_initial',1790166520),
('m131023_165625_initial',1790166520),
('m131023_165755_initial',1790166520),
('m131023_165835_initial',1790166520),
('m131023_170033_initial',1790166520),
('m131023_170135_initial',1790166520),
('m131023_170159_initial',1790166520),
('m131023_170253_initial',1790166520),
('m131023_170339_initial',1790166520),
('m131203_110444_oembed',1790166520),
('m131213_165552_user_optimize',1790166520),
('m140226_111945_ldap',1790166520),
('m140303_125031_password',1790166520),
('m140304_142711_memberautoadd',1790166520),
('m140321_000917_content',1790166520),
('m140324_170617_membership',1790166520),
('m140507_150421_create_settings_table',1790166520),
('m140507_171527_create_settings_table',1790166520),
('m140512_141414_i18n_profilefields',1790166520),
('m140513_180317_createlogging',1790166520),
('m140701_000611_profile_genderfield',1790166520),
('m140701_074404_protect_default_profilefields',1790166520),
('m140702_143912_notify_notification_unify',1790166520),
('m140703_104527_profile_birthdayfield',1790166520),
('m140704_080659_installationid',1790166520),
('m140705_065525_emailing_settings',1790166521),
('m140706_135210_lastlogin',1790166521),
('m140829_122906_delete',1790166521),
('m140830_145504_following',1790166521),
('m140901_080147_indizies',1790166521),
('m140901_080432_indices',1790166521),
('m140901_112246_addState',1790166521),
('m140901_153403_addState',1790166521),
('m140901_170329_group_create_space',1790166521),
('m140902_091234_session_key_length',1790166521),
('m140907_140822_zip_field_to_text',1790166521),
('m140930_205511_fix_default',1790166521),
('m140930_205859_fix_default',1790166521),
('m140930_210142_fix_default',1790166521),
('m140930_210635_fix_default',1790166521),
('m140930_212528_fix_default',1790166521),
('m141015_173305_follow_notifications',1790166521),
('m141019_093319_mentioning',1790166521),
('m141020_162639_fix_default',1790166521),
('m141020_193920_rm_alsocreated',1790166521),
('m141020_193931_rm_alsoliked',1790166521),
('m141021_162639_oembed_setting',1790166521),
('m141022_094635_addDefaults',1790166521),
('m141106_185632_log_init',1790166521),
('m150204_103433_html5_notified',1790166521),
('m150210_190006_user_invite_lang',1790166521),
('m150302_114347_add_visibility',1790166521),
('m150322_194403_remove_type_field',1790166521),
('m150322_195619_allowedExt2Text',1790166521),
('m150429_223856_optimize',1790166521),
('m150629_220311_change',1790166521),
('m150703_012735_typelength',1790166521),
('m150703_024635_activityTypes',1790166521),
('m150703_033650_namespace',1790166521),
('m150703_130157_migrate',1790166521),
('m150704_005338_namespace',1790166521),
('m150704_005418_namespace',1790166521),
('m150704_005434_namespace',1790166521),
('m150704_005452_namespace',1790166521),
('m150704_005504_namespace',1790166521),
('m150713_054441_timezone',1790166521),
('m150714_093525_activity',1790166521),
('m150714_100355_cleanup',1790166521),
('m150831_061628_notifications',1790166521),
('m150910_223305_fix_user_follow',1790166521),
('m150924_133344_update_notification_fix',1790166521),
('m150924_154635_user_invite_add_first_lastname',1790166521),
('m150927_190830_create_contentcontainer',1790166521),
('m150928_103711_permissions',1790166521),
('m150928_134934_groups',1790166521),
('m150928_140718_setColorVariables',1790166521),
('m151010_124437_group_permissions',1790166521),
('m151010_175000_default_visibility',1790166521),
('m151013_223814_include_dashboard',1790166521),
('m151022_131128_module_fix',1790166521),
('m151106_090948_addColor',1790166521),
('m151223_171310_fix_notifications',1790166521),
('m151226_164234_authclient',1790166521),
('m160125_053702_stored_filename',1790166521),
('m160205_203840_foreign_keys',1790166521),
('m160205_203913_foreign_keys',1790166521),
('m160205_203939_foreign_keys',1790166521),
('m160205_203955_foreign_keys',1790166521),
('m160205_204000_foreign_keys',1790166522),
('m160205_204010_foreign_keys',1790166522),
('m160205_205540_foreign_keys',1790166522),
('m160216_160119_initial',1790166522),
('m160217_161220_addCanLeaveFlag',1790166522),
('m160220_013525_contentcontainer_id',1790166522),
('m160221_222312_public_permission_change',1790166522),
('m160225_180229_remove_website',1790166522),
('m160227_073020_birthday_date',1790166522),
('m160229_162959_multiusergroups',1790166522),
('m160309_141222_longerUserName',1790166522),
('m160408_100725_rename_groupadmin_to_manager',1790166522),
('m160415_180332_wall_remove',1790166522),
('m160501_220850_activity_pk_int',1790166522),
('m160507_202611_settings',1790166522),
('m160508_005740_settings_cleanup',1790166522),
('m160509_214811_spaceurl',1790166522),
('m160517_132535_group',1790166522),
('m160523_105732_profile_searchable',1790166522),
('m160714_142827_remove_space_id',1790166522),
('m161031_161947_file_directories',1790166522),
('m170110_151419_membership_notifications',1790166522),
('m170110_152425_space_follow_reset_send_notification',1790166522),
('m170111_190400_disable_web_notifications',1790166522),
('m170112_115052_settings',1790166522),
('m170118_162332_streamchannel',1790166522),
('m170119_160740_initial',1790166522),
('m170123_125622_pinned',1790166522),
('m170211_105743_show_in_stream',1790166522),
('m170224_100937_fix_default_modules',1790166522),
('m170723_133337_content_tag',1790166522),
('m170723_133338_content_tag_sort_order',1790166522),
('m170805_211208_authclient_id',1790166522),
('m170810_220543_group_sort',1790166522),
('m171015_155102_contentcontainer_module',1790166522),
('m171025_142030_queue_update',1790166522),
('m171025_200312_utf8mb4_fixes',1790166522),
('m171027_220519_exclusive_jobs',1790166522),
('m180305_084435_membership_pk',1790166522),
('m180315_112748_fix_email_length',1790166522),
('m181029_160453_collation',1790166523),
('m190211_133045_channel_length',1790166523),
('m190309_201944_rename_settings',1790166523),
('m190920_142605_fix_language_codes',1790166523),
('m200217_122108_profile_translation_fix',1790166523),
('m200218_122109_profile_translation_fix2',1790166523),
('m200323_162006_fix_visibility',1790166523),
('m200604_204445_remove_post_field',1790166523),
('m200715_171721_defaultOption',1790166523),
('m200715_184207_commentIndex',1790166523),
('m200729_080349_commentIndex_fix_order',1790166523),
('m200930_151639_add_about',1790166523),
('m201020_130431_fix_default_file_setting_value',1790166523),
('m201025_095247_spaces_of_users_group',1790166523),
('m201115_083832_add_notify_users_to_group',1790166523),
('m201130_073907_default_permissions',1790166523),
('m201130_073908_disable_legacy_richtextparser',1790166523),
('m201217_081828_fix_oembed_setting',1790166523),
('m201228_064513_default_group',1790166523),
('m210111_105355_hash',1790166523),
('m210203_122333_profilePermissions',1790166523),
('m210204_054203_fix_settings_unique_index',1790166523),
('m210211_051243_container_tag',1790166523),
('m210217_055359_protected_group',1790166523),
('m210310_103412_fix_hash',1790166523),
('m210331_115144_default_timezone',1790166523),
('m210506_060737_profile_field_directory_filter',1790166523),
('m210721_055137_content_locked_comments',1790166523),
('m210727_102150_follow_friend',1790166523),
('m210924_114847_container_blocked_users',1790166523),
('m210928_162609_stream_sort_idx',1790166523),
('m211022_152413_file_history',1790166523),
('m211124_180441_admin_group_label',1790166523),
('m220121_193617_oembed_setting_update',1790166523),
('m220207_183901_add_payload_column_to_notification_table',1790166523),
('m220302_135158_add_content_id',1790166523),
('m220606_205507_mailer_settings',1790166523),
('m220608_125539_displaysubformat',1790166523),
('m220919_104234_auth_key',1790166523),
('m221111_100450_rename_profile_url',1790166523),
('m221117_214310_rename_setting',1790166523),
('m230127_195245_content_state',1790166523),
('m230130_140944_rename_auth_invite_setting',1790166523),
('m230217_112400_content_scheduled_at',1790166523),
('m230217_175411_content_hidden',1790166523),
('m230419_102455_add_sort_order_column_to_space_table',1790166523),
('m230618_135508_file_add_sorting_column',1790166523),
('m230618_135509_file_add_category_column',1790166523),
('m230618_135510_file_add_metadata_column',1790166523),
('m230618_135511_file_add_state_column',1790166523),
('m230618_135512_file_add_guid_unique_index',1790166523),
('m231024_062218_content_was_published',1790166523),
('m240203_112155_search',1790166523),
('m240419_095931_fix_user_profile_country_code',1790166523),
('m240422_162959_new_is_untouched_settings',1790166523),
('m240423_170311_profile_checkbox_list_field',1790166523),
('m240425_144905_unique_index',1790166523),
('m240523_081438_fix_null_password',1790166523),
('m240622_082606_fix_captcha_in_registration',1790166523),
('m240715_150726_fulltext_index',1790166523),
('m240807_230603_add_permissions_to_existing_user_groups',1790166523),
('m240916_150536_extend_language',1790166523),
('m241004_093044_server_timezone',1790166523),
('m241022_084028_delete_desktop_notified',1790166523),
('m250226_125226_rename_mailer_vars',1790166523),
('m250405_072758_1_18_switch_to_humhub_theme_and_disable_themes',1790166523),
('m250514_125129_reduce_dynamic_config',1790166523),
('m250715_070647_group_name_length',1790166523),
('m250807_194741_remove_cache_settings',1790166523),
('m250829_135404_parent_group',1790166523),
('m250913_221050_drop_logging_table',1790166523),
('m251007_133345_fulltext_index_primary_key',1790166523),
('m251201_073817_rename_proxy_settings',1790166523),
('m251209_212949_update_checkboxlist_config_directory_filter',1790166523),
('m251215_120928_alter_checkboxlist_columns_to_profile_table',1790166523),
('m260716_100000_file_add_public_standalone_columns',1790166523),
('m260915_101543_user_follow_unique_index',1790166523);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_enabled`
--

DROP TABLE IF EXISTS `module_enabled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_enabled` (
  `module_id` varchar(100) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_enabled`
--

LOCK TABLES `module_enabled` WRITE;
/*!40000 ALTER TABLE `module_enabled` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_enabled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `source_class` varchar(100) DEFAULT NULL,
  `source_pk` int(11) DEFAULT NULL,
  `space_id` int(11) DEFAULT NULL,
  `emailed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `originator_user_id` int(11) DEFAULT NULL,
  `module` varchar(100) DEFAULT '',
  `group_key` varchar(75) DEFAULT NULL,
  `send_web_notifications` tinyint(1) DEFAULT 1,
  `payload` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_seen` (`seen`),
  KEY `index_desktop_emailed` (`emailed`),
  KEY `index_groupuser` (`user_id`,`class`,`group_key`),
  CONSTRAINT `fk_notification-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `birthday_hide_year` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `about` text DEFAULT NULL,
  `phone_private` varchar(255) DEFAULT NULL,
  `phone_work` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `im_xmpp` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_facebook` varchar(255) DEFAULT NULL,
  `url_linkedin` varchar(255) DEFAULT NULL,
  `url_instagram` varchar(255) DEFAULT NULL,
  `url_xing` varchar(255) DEFAULT NULL,
  `url_youtube` varchar(255) DEFAULT NULL,
  `url_vimeo` varchar(255) DEFAULT NULL,
  `url_tiktok` varchar(255) DEFAULT NULL,
  `url_twitter` varchar(255) DEFAULT NULL,
  `url_mastodon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profile-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES
(1,'Sys','Admin','System Administration',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_field`
--

DROP TABLE IF EXISTS `profile_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_field_category_id` int(11) NOT NULL,
  `module_id` varchar(255) DEFAULT NULL,
  `field_type_class` varchar(255) NOT NULL,
  `field_type_config` text DEFAULT NULL,
  `internal_name` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `required` tinyint(4) DEFAULT NULL,
  `show_at_registration` tinyint(4) DEFAULT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT 1,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_attribute` varchar(255) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT 1,
  `directory_filter` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_profile_field_category` (`profile_field_category_id`),
  KEY `index_directory_filter` (`directory_filter`),
  CONSTRAINT `fk_profile_field-profile_field_category_id` FOREIGN KEY (`profile_field_category_id`) REFERENCES `profile_field_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_field`
--

LOCK TABLES `profile_field` WRITE;
/*!40000 ALTER TABLE `profile_field` DISABLE KEYS */;
INSERT INTO `profile_field` VALUES
(1,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":20,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','firstname','First name',NULL,100,1,1,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,'givenName',NULL,1,1,0),
(2,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":30,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','lastname','Last name',NULL,200,1,1,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,'sn',NULL,1,1,0),
(3,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":50,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','title','Title',NULL,300,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,'title',NULL,1,1,0),
(4,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Select','{\"type\":\"dropdownlist\",\"options\":\"male=>Male\\nfemale=>Female\\ndiverse=>Diverse\",\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','gender','Gender',NULL,300,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(5,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":150,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','street','Street',NULL,400,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(6,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":10,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','zip','Zip',NULL,500,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(7,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','city','City',NULL,600,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(8,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\CountrySelect','{\"type\":\"dropdownlist\",\"options\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','country','Country',NULL,700,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(9,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','state','State',NULL,800,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(10,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Birthday','{\"type\":\"datetime\",\"defaultHideAge\":\"0\",\"fieldTypes\":[],\"isVirtual\":false,\"canBeDirectoryFilter\":false}','birthday','Birthday',NULL,900,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(11,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\TextArea','{\"type\":\"textarea\",\"fieldTypes\":[],\"isVirtual\":false,\"canBeDirectoryFilter\":false}','about','About',NULL,900,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(12,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','phone_private','Phone Private',NULL,100,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(13,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','phone_work','Phone Work',NULL,200,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(14,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','mobile','Mobile',NULL,300,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(15,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\UserEmail','{\"type\":\"hidden\",\"isVirtual\":true,\"fieldTypes\":[],\"canBeDirectoryFilter\":false}','email_virtual','E-Mail',NULL,350,0,0,0,0,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,NULL,0,0),
(16,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','fax','Fax',NULL,400,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(17,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"email\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','im_xmpp','XMPP Jabber Address',NULL,800,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(18,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url','Website URL',NULL,100,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(19,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url_facebook','Facebook URL',NULL,200,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(20,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url_linkedin','LinkedIn URL',NULL,300,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(21,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url_instagram','Instagram URL',NULL,350,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(22,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url_xing','Xing URL',NULL,400,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(23,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url_youtube','Youtube URL',NULL,500,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(24,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url_vimeo','Vimeo URL',NULL,600,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(25,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url_tiktok','TikTok URL',NULL,700,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(26,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url_twitter','Twitter URL',NULL,800,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0),
(27,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"type\":\"text\",\"fieldTypes\":[],\"isVirtual\":false}','url_mastodon','Mastodon URL',NULL,900,NULL,NULL,1,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,NULL,1,1,0);
/*!40000 ALTER TABLE `profile_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_field_category`
--

DROP TABLE IF EXISTS `profile_field_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_field_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `module_id` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_field_category`
--

LOCK TABLES `profile_field_category` WRITE;
/*!40000 ALTER TABLE `profile_field_category` DISABLE KEYS */;
INSERT INTO `profile_field_category` VALUES
(1,'General','',100,NULL,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,1),
(2,'Communication','',200,NULL,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,1),
(3,'Social bookmarks','',300,NULL,1,'2026-09-23 12:28:44',NULL,'2026-09-23 12:28:44',NULL,NULL,1);
/*!40000 ALTER TABLE `profile_field_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(50) NOT NULL,
  `job` blob NOT NULL,
  `pushed_at` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `reserved_at` int(11) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `done_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `reserved_at` (`reserved_at`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
INSERT INTO `queue` VALUES
(1,'queue','O:46:\"humhub\\modules\\content\\jobs\\SearchRebuildIndex\":0:{}',1790166523,3600,0,1024,NULL,NULL,NULL);
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_exclusive`
--

DROP TABLE IF EXISTS `queue_exclusive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_exclusive` (
  `id` varchar(50) NOT NULL,
  `job_message_id` varchar(50) DEFAULT NULL,
  `job_status` smallint(6) DEFAULT 2,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_exclusive`
--

LOCK TABLES `queue_exclusive` WRITE;
/*!40000 ALTER TABLE `queue_exclusive` DISABLE KEYS */;
INSERT INTO `queue_exclusive` VALUES
('content-search.rebuild-index','1',2,NULL);
/*!40000 ALTER TABLE `queue_exclusive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  `module_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-setting` (`name`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES
(1,'oembedProviders','{\"Facebook Video\":{\"pattern\":\"/facebook\\\\.com\\\\/(.*)(video)/\",\"endpoint\":\"https://graph.facebook.com/v12.0/oembed_video?url=%url%&access_token=\"},\"Facebook Post\":{\"pattern\":\"/facebook\\\\.com\\\\/(.*)(post|activity|photo|permalink|media|question|note)/\",\"endpoint\":\"https://graph.facebook.com/v12.0/oembed_post?url=%url%&access_token=\"},\"Facebook Page\":{\"pattern\":\"/^(https\\\\:\\\\/\\\\/)*(www\\\\.)*facebook\\\\.com\\\\/((?!video|post|activity|photo|permalink|media|question|note).)*$/\",\"endpoint\":\"https://graph.facebook.com/v12.0/oembed_post?url=%url%&access_token=\"},\"Instagram\":{\"pattern\":\"/instagram\\\\.com/\",\"endpoint\":\"https://graph.facebook.com/v12.0/instagram_oembed?url=%url%&access_token=\"},\"Twitter\":{\"pattern\":\"/twitter\\\\.com/\",\"endpoint\":\"https://publish.twitter.com/oembed?url=%url%&maxwidth=450\"},\"YouTube\":{\"pattern\":\"/youtube\\\\.com|youtu.be/\",\"endpoint\":\"https://www.youtube.com/oembed?scheme=https&url=%url%&format=json&maxwidth=450\"},\"Soundcloud\":{\"pattern\":\"/soundcloud\\\\.com/\",\"endpoint\":\"https://soundcloud.com/oembed?url=%url%&format=json&maxwidth=450\"},\"Vimeo\":{\"pattern\":\"/vimeo\\\\.com/\",\"endpoint\":\"https://vimeo.com/api/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450\"},\"SlideShare\":{\"pattern\":\"/slideshare\\\\.net/\",\"endpoint\":\"https://www.slideshare.net/api/oembed/2?url=%url%&format=json&maxwidth=450\"},\"Reddit\":{\"pattern\":\"/reddit\\\\.com/\",\"endpoint\":\"https://www.reddit.com/oembed?format=json&url=%url%\"}}','base'),
(2,'defaultVisibility','1','space'),
(3,'defaultJoinPolicy','1','space'),
(4,'includeCommunityModules','1','marketplace'),
(5,'richtextCompatMode','0','content'),
(6,'auth.showRegistrationUserGroup','1','user'),
(7,'displayNameSubFormat','title','base'),
(8,'serverTimeZone','UTC','base'),
(9,'humhub\\components\\InstallationState','3','base'),
(10,'baseUrl','http://localhost:18564','base'),
(11,'paginationSize','10','base'),
(12,'displayNameFormat','{profile.firstname} {profile.lastname}','base'),
(13,'cronLastDailyRun','1790166524','base'),
(14,'auth.needApproval','0','user'),
(15,'auth.anonymousRegistration','1','user'),
(16,'auth.internalUsersCanInviteByEmail','1','user'),
(17,'auth.internalUsersCanInviteByLink','1','user'),
(18,'mailerTransportType','php','base'),
(19,'mailerSystemEmailAddress','social@example.com','base'),
(20,'mailerSystemEmailName','admin@example.com','base'),
(21,'mailSummaryInterval','2','activity'),
(22,'maxFileSize','2097152','file'),
(23,'excludeMediaFilesPreview','1','file'),
(24,'cacheClass','yii\\caching\\FileCache','base'),
(25,'cacheExpireTime','3600','base'),
(26,'installationId','3b03fe018caf385131a83135423095f7','admin'),
(27,'spaceOrder','0','space'),
(28,'enable','1','tour'),
(29,'cronLastRun','1790166524','base'),
(30,'name','HumHub','base'),
(31,'secret','741fc255-3ab8-4835-b7b5-d4e2998f4af9','base');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space`
--

DROP TABLE IF EXISTS `space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` text DEFAULT NULL,
  `about` text DEFAULT NULL,
  `join_policy` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `auto_add_new_members` int(4) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `default_content_visibility` tinyint(1) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `members_can_leave` int(11) DEFAULT 1,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url-unique` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space`
--

LOCK TABLES `space` WRITE;
/*!40000 ALTER TABLE `space` DISABLE KEYS */;
/*!40000 ALTER TABLE `space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_membership`
--

DROP TABLE IF EXISTS `space_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_membership` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `request_message` text DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT 'member',
  `show_at_dashboard` tinyint(1) DEFAULT 1,
  `can_cancel_membership` int(11) DEFAULT 1,
  `send_notifications` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `index_status` (`status`),
  KEY `fk_space_membership-space_id` (`space_id`),
  KEY `fk_space_membership-user_id` (`user_id`),
  CONSTRAINT `fk_space_membership-space_id` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_space_membership-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_membership`
--

LOCK TABLES `space_membership` WRITE;
/*!40000 ALTER TABLE `space_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `space_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_oembed`
--

DROP TABLE IF EXISTS `url_oembed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_oembed` (
  `url` varchar(180) NOT NULL,
  `preview` text NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_oembed`
--

LOCK TABLES `url_oembed` WRITE;
/*!40000 ALTER TABLE `url_oembed` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_oembed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` char(150) DEFAULT NULL,
  `auth_mode` varchar(10) NOT NULL,
  `language` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `visibility` int(1) DEFAULT 1,
  `time_zone` varchar(100) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `authclient_id` varchar(60) DEFAULT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_username` (`username`),
  UNIQUE KEY `unique_guid` (`guid`),
  UNIQUE KEY `unique_authclient_id` (`authclient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'8bf32292-280d-4dd3-a7bb-9ec02b8a2908',1,'admin','admin@example.com','local','','2026-09-23 12:28:44',NULL,'2026-09-23 12:28:45',NULL,NULL,1,NULL,1,NULL,'Bzh9nwQv2IMyCBIIVw-Z-4L_hyW-zsfx');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follow`
--

DROP TABLE IF EXISTS `user_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_notifications` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-object-user` (`object_model`,`object_id`,`user_id`),
  KEY `index_user` (`user_id`),
  KEY `index_object` (`object_model`,`object_id`),
  CONSTRAINT `fk_user_follow-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follow`
--

LOCK TABLES `user_follow` WRITE;
/*!40000 ALTER TABLE `user_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friendship`
--

DROP TABLE IF EXISTS `user_friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-friends` (`user_id`,`friend_user_id`),
  KEY `fk-friend` (`friend_user_id`),
  CONSTRAINT `fk-friend` FOREIGN KEY (`friend_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friendship`
--

LOCK TABLES `user_friendship` WRITE;
/*!40000 ALTER TABLE `user_friendship` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_http_session`
--

DROP TABLE IF EXISTS `user_http_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_http_session` (
  `id` char(64) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_http_session-user_id` (`user_id`),
  CONSTRAINT `fk_user_http_session-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_http_session`
--

LOCK TABLES `user_http_session` WRITE;
/*!40000 ALTER TABLE `user_http_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_http_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invite`
--

DROP TABLE IF EXISTS `user_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_originator_id` int(11) DEFAULT NULL,
  `space_invite_id` int(11) DEFAULT NULL,
  `email` char(150) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invite`
--

LOCK TABLES `user_invite` WRITE;
/*!40000 ALTER TABLE `user_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mentioning`
--

DROP TABLE IF EXISTS `user_mentioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_mentioning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_user` (`user_id`),
  KEY `i_object` (`object_model`,`object_id`),
  CONSTRAINT `fk_user_mentioning-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mentioning`
--

LOCK TABLES `user_mentioning` WRITE;
/*!40000 ALTER TABLE `user_mentioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mentioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_password`
--

DROP TABLE IF EXISTS `user_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `algorithm` varchar(20) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `salt` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `fk_user_password-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_password`
--

LOCK TABLES `user_password` WRITE;
/*!40000 ALTER TABLE `user_password` DISABLE KEYS */;
INSERT INTO `user_password` VALUES
(1,1,'bcrypt','$2y$12$mPQ.cEB/v79iZWjKZQPOYucWitLPWhKakMtQQC6JzriuQshpg55lG','cfab39c4-ab43-4e3d-b810-7894598a6bb1','2026-09-23 12:28:45');
/*!40000 ALTER TABLE `user_password` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23 12:28:52
