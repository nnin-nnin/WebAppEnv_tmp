/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: zurmo
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
-- Current Database: `zurmo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zurmo` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `zurmo`;

--
-- Table structure for table `__role_children_cache`
--

DROP TABLE IF EXISTS `__role_children_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `__role_children_cache` (
  `permitable_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`permitable_id`,`role_id`),
  UNIQUE KEY `permitable_id` (`permitable_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__role_children_cache`
--

LOCK TABLES `__role_children_cache` WRITE;
/*!40000 ALTER TABLE `__role_children_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `__role_children_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_group`
--

DROP TABLE IF EXISTS `_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `_group_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_f97279e76d95d98f7433ff400fab94e189ee6052` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_group`
--

LOCK TABLES `_group` WRITE;
/*!40000 ALTER TABLE `_group` DISABLE KEYS */;
INSERT INTO `_group` VALUES (1,2,'Super Administrators',NULL),(3,6,'Everyone',NULL);
/*!40000 ALTER TABLE `_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_group__user`
--

DROP TABLE IF EXISTS `_group__user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_group__user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `_group_id` int(11) unsigned DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_8b7b9c47c851f14d46de32b2c5dd3ffd490b9319` (`_group_id`,`_user_id`),
  KEY `index_for__group__user__group_id` (`_group_id`),
  KEY `index_for__group__user__user_id` (`_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_group__user`
--

LOCK TABLES `_group__user` WRITE;
/*!40000 ALTER TABLE `_group__user` DISABLE KEYS */;
INSERT INTO `_group__user` VALUES (1,1,1),(2,1,2),(5,1,4);
/*!40000 ALTER TABLE `_group__user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_right`
--

DROP TABLE IF EXISTS `_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_right` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  `modulename` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_right`
--

LOCK TABLES `_right` WRITE;
/*!40000 ALTER TABLE `_right` DISABLE KEYS */;
INSERT INTO `_right` VALUES (2,6,'UsersModule','Login Via Web',1),(3,6,'UsersModule','Login Via Mobile',1),(4,6,'UsersModule','Login Via Web API',1),(5,6,'AccountsModule','Access Accounts Tab',1),(6,6,'AccountsModule','Create Accounts',1),(7,6,'AccountsModule','Delete Accounts',1),(8,6,'CampaignsModule','Access Campaigns Tab',1),(9,6,'CampaignsModule','Create Campaigns',1),(10,6,'CampaignsModule','Delete Campaigns',1),(11,6,'ContactsModule','Access Contacts Tab',1),(12,6,'ContactsModule','Create Contacts',1),(13,6,'ContactsModule','Delete Contacts',1),(14,6,'ConversationsModule','Access Conversations Tab',1),(15,6,'ConversationsModule','Create Conversations',1),(16,6,'ConversationsModule','Delete Conversations',1),(17,6,'EmailMessagesModule','Access Emails Tab',1),(18,6,'EmailMessagesModule','Create Emails',1),(19,6,'EmailMessagesModule','Delete Emails',1),(20,6,'EmailTemplatesModule','Access Email Templates Tab',1),(21,6,'EmailTemplatesModule','Create Email Templates',1),(22,6,'EmailTemplatesModule','Delete Email Templates',1),(23,6,'LeadsModule','Access Leads Tab',1),(24,6,'LeadsModule','Create Leads',1),(25,6,'LeadsModule','Delete Leads',1),(26,6,'LeadsModule','Convert Leads',1),(27,6,'OpportunitiesModule','Access Opportunities Tab',1),(28,6,'OpportunitiesModule','Create Opportunities',1),(29,6,'OpportunitiesModule','Delete Opportunities',1),(30,6,'MarketingModule','Access Marketing Tab',1),(31,6,'MarketingListsModule','Access Marketing Lists Tab',1),(32,6,'MarketingListsModule','Create Marketing Lists',1),(33,6,'MarketingListsModule','Delete Marketing Lists',1),(34,6,'MeetingsModule','Access Meetings',1),(35,6,'MeetingsModule','Create Meetings',1),(36,6,'MeetingsModule','Delete Meetings',1),(37,6,'MissionsModule','Access Missions Tab',1),(38,6,'MissionsModule','Create Missions',1),(39,6,'MissionsModule','Delete Missions',1),(40,6,'NotesModule','Access Notes',1),(41,6,'NotesModule','Create Notes',1),(42,6,'NotesModule','Delete Notes',1),(43,6,'ReportsModule','Access Reports Tab',1),(44,6,'ReportsModule','Create Reports',1),(45,6,'ReportsModule','Delete Reports',1),(46,6,'TasksModule','Access Tasks',1),(47,6,'TasksModule','Create Tasks',1),(48,6,'TasksModule','Delete Tasks',1),(49,6,'HomeModule','Access Dashboards',1),(50,6,'HomeModule','Create Dashboards',1),(51,6,'HomeModule','Delete Dashboards',1),(52,6,'ExportModule','Access Export Tool',1),(53,6,'SocialItemsModule','Access Social Items',1),(54,6,'ProductsModule','Access Products Tab',1),(55,6,'ProductsModule','Create Products',1),(56,6,'ProductsModule','Delete Products',1),(57,6,'ProductTemplatesModule','Access Catalog Items Tab',1),(58,6,'ProductTemplatesModule','Create Catalog Items',1),(59,6,'ProductTemplatesModule','Delete Catalog Items',1),(60,7,'UsersModule','Login Via Mobile',2),(61,7,'UsersModule','Login Via Web',2),(62,7,'UsersModule','Login Via Web API',2);
/*!40000 ALTER TABLE `_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_user`
--

DROP TABLE IF EXISTS `_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(11) unsigned DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `serializedavatardata` text DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  `isrootuser` tinyint(1) DEFAULT NULL,
  `hidefromselecting` tinyint(1) DEFAULT NULL,
  `issystemuser` tinyint(1) DEFAULT NULL,
  `hidefromleaderboard` tinyint(1) DEFAULT NULL,
  `lastlogindatetime` datetime DEFAULT NULL,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  `currency_id` int(11) unsigned DEFAULT NULL,
  `manager__user_id` int(11) unsigned DEFAULT NULL,
  `role_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_2f9f20ae60de87f7bdd974b52941c30e287c6eef` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user`
--

LOCK TABLES `_user` WRITE;
/*!40000 ALTER TABLE `_user` DISABLE KEYS */;
INSERT INTO `_user` VALUES (1,1,'1c269c612413b6c46a21cfd70e50bfb3',NULL,NULL,'America/Chicago','super',NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(2,2,'1c269c612413b6c46a21cfd70e50bfb3',NULL,NULL,'America/Chicago','admin',NULL,1,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL),(4,5,'d6cbf4b161e001977b0ab9099d01fd77',NULL,NULL,'America/Chicago','backendjoboractionuser',NULL,0,NULL,1,1,1,NULL,7,NULL,NULL,NULL);
/*!40000 ALTER TABLE `_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `industry_customfield_id` int(11) unsigned DEFAULT NULL,
  `type_customfield_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `officephone` varchar(24) DEFAULT NULL,
  `officefax` varchar(24) DEFAULT NULL,
  `annualrevenue` double DEFAULT NULL,
  `employees` int(11) unsigned DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `billingaddress_address_id` int(11) unsigned DEFAULT NULL,
  `primaryemail_email_id` int(11) unsigned DEFAULT NULL,
  `secondaryemail_email_id` int(11) unsigned DEFAULT NULL,
  `shippingaddress_address_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_read`
--

DROP TABLE IF EXISTS `account_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_account_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_read`
--

LOCK TABLES `account_read` WRITE;
/*!40000 ALTER TABLE `account_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_read_subscription`
--

DROP TABLE IF EXISTS `account_read_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_read_subscription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `subscriptiontype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_read_subscription`
--

LOCK TABLES `account_read_subscription` WRITE;
/*!40000 ALTER TABLE `account_read_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_read_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_starred`
--

DROP TABLE IF EXISTS `account_starred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_starred` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `model_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_starred`
--

LOCK TABLES `account_starred` WRITE;
/*!40000 ALTER TABLE `account_starred` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_starred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activelanguage`
--

DROP TABLE IF EXISTS `activelanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activelanguage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(16) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `nativename` varchar(64) DEFAULT NULL,
  `activationdatetime` datetime DEFAULT NULL,
  `lastupdatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activelanguage`
--

LOCK TABLES `activelanguage` WRITE;
/*!40000 ALTER TABLE `activelanguage` DISABLE KEYS */;
/*!40000 ALTER TABLE `activelanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `latestdatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_item`
--

DROP TABLE IF EXISTS `activity_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_3072cf7f6632136338312839309d6fb046214edc` (`activity_id`,`item_id`),
  KEY `index_for_activity_item_activity_id` (`activity_id`),
  KEY `index_for_activity_item_item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_item`
--

LOCK TABLES `activity_item` WRITE;
/*!40000 ALTER TABLE `activity_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `invalid` tinyint(1) DEFAULT NULL,
  `postalcode` varchar(16) DEFAULT NULL,
  `street1` varchar(128) DEFAULT NULL,
  `street2` varchar(128) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditevent`
--

DROP TABLE IF EXISTS `auditevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditevent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` int(11) unsigned DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `eventname` varchar(64) DEFAULT NULL,
  `modulename` varchar(64) DEFAULT NULL,
  `modelclassname` varchar(64) DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditevent`
--

LOCK TABLES `auditevent` WRITE;
/*!40000 ALTER TABLE `auditevent` DISABLE KEYS */;
INSERT INTO `auditevent` VALUES (1,1,1,'2026-09-30 14:15:15','Item Created','ZurmoModule','User','s:10:\"Super User\";'),(2,1,1,'2026-09-30 14:15:15','User Password Changed','UsersModule','User','s:5:\"super\";'),(3,1,1,'2026-09-30 14:15:15','Item Created','ZurmoModule','Group','s:20:\"Super Administrators\";'),(4,2,1,'2026-09-30 14:15:15','Item Created','ZurmoModule','User','s:10:\"Super User\";'),(5,2,1,'2026-09-30 14:15:15','User Password Changed','UsersModule','User','s:5:\"admin\";'),(111,3,1,'2026-09-30 14:15:23','Item Created','ZurmoModule','Group','s:8:\"Everyone\";'),(112,4,1,'2026-09-30 14:15:23','Item Created','ZurmoModule','User','s:11:\"System User\";'),(113,4,1,'2026-09-30 14:15:23','User Password Changed','UsersModule','User','s:22:\"backendjoboractionuser\";'),(114,2,1,'2026-09-30 14:15:23','Item Created','ZurmoModule','NotificationMessage','s:6:\"(None)\";'),(115,2,1,'2026-09-30 14:15:23','Item Created','ZurmoModule','Notification','s:52:\"Remove the api test entry script for production use.\";'),(116,3,1,'2026-09-30 14:15:23','Item Created','ZurmoModule','Notification','s:52:\"Remove the api test entry script for production use.\";'),(117,4,1,'2026-09-30 14:15:23','Item Created','ZurmoModule','Notification','s:52:\"Remove the api test entry script for production use.\";'),(118,NULL,2,'2026-09-30 14:17:10','User Logged In','UsersModule',NULL,'N;'),(119,2,2,'2026-09-30 14:17:10','Item Created','ZurmoModule','GameScore','s:9:\"LoginUser\";'),(120,2,2,'2026-09-30 14:17:15','Item Created','ZurmoModule','GamePoint','s:12:\"UserAdoption\";'),(121,2,2,'2026-09-30 14:17:15','Item Created','ZurmoModule','GameBadge','s:11:\"LoginUser 1\";'),(122,NULL,2,'2026-09-30 14:17:25','User Logged In','UsersModule',NULL,'N;'),(123,NULL,1,'2026-09-30 14:17:35','User Logged In','UsersModule',NULL,'N;'),(124,3,1,'2026-09-30 14:17:35','Item Created','ZurmoModule','GameScore','s:9:\"LoginUser\";'),(125,3,1,'2026-09-30 14:17:35','Item Created','ZurmoModule','GamePoint','s:12:\"UserAdoption\";'),(126,3,1,'2026-09-30 14:17:35','Item Created','ZurmoModule','GameBadge','s:11:\"LoginUser 1\";');
/*!40000 ALTER TABLE `auditevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoresponder`
--

DROP TABLE IF EXISTS `autoresponder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoresponder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `subject` varchar(64) DEFAULT NULL,
  `htmlcontent` text DEFAULT NULL,
  `textcontent` text DEFAULT NULL,
  `fromoperationdurationtype` text DEFAULT NULL,
  `enabletracking` tinyint(3) unsigned DEFAULT NULL,
  `fromoperationdurationinterval` int(11) unsigned DEFAULT NULL,
  `operationtype` int(11) unsigned DEFAULT NULL,
  `marketinglist_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoresponder`
--

LOCK TABLES `autoresponder` WRITE;
/*!40000 ALTER TABLE `autoresponder` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoresponder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoresponderitem`
--

DROP TABLE IF EXISTS `autoresponderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoresponderitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `emailmessage_id` int(11) unsigned DEFAULT NULL,
  `processdatetime` datetime DEFAULT NULL,
  `processed` tinyint(3) unsigned DEFAULT NULL,
  `autoresponder_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoresponderitem`
--

LOCK TABLES `autoresponderitem` WRITE;
/*!40000 ALTER TABLE `autoresponderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoresponderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoresponderitemactivity`
--

DROP TABLE IF EXISTS `autoresponderitemactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoresponderitemactivity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emailmessageactivity_id` int(11) unsigned DEFAULT NULL,
  `autoresponderitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoresponderitemactivity`
--

LOCK TABLES `autoresponderitemactivity` WRITE;
/*!40000 ALTER TABLE `autoresponderitemactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoresponderitemactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basecustomfield`
--

DROP TABLE IF EXISTS `basecustomfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `basecustomfield` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data_customfielddata_id` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basecustomfield`
--

LOCK TABLES `basecustomfield` WRITE;
/*!40000 ALTER TABLE `basecustomfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `basecustomfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bytimeworkflowinqueue`
--

DROP TABLE IF EXISTS `bytimeworkflowinqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bytimeworkflowinqueue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `modelitem_item_id` int(11) unsigned DEFAULT NULL,
  `savedworkflow_id` int(11) unsigned DEFAULT NULL,
  `modelclassname` varchar(64) DEFAULT NULL,
  `processdatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bytimeworkflowinqueue`
--

LOCK TABLES `bytimeworkflowinqueue` WRITE;
/*!40000 ALTER TABLE `bytimeworkflowinqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `bytimeworkflowinqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculatedderivedattributemetadata`
--

DROP TABLE IF EXISTS `calculatedderivedattributemetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculatedderivedattributemetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `derivedattributemetadata_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculatedderivedattributemetadata`
--

LOCK TABLES `calculatedderivedattributemetadata` WRITE;
/*!40000 ALTER TABLE `calculatedderivedattributemetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `calculatedderivedattributemetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `supportsrichtext` tinyint(1) DEFAULT NULL,
  `sendondatetime` datetime DEFAULT NULL,
  `fromname` varchar(64) DEFAULT NULL,
  `fromaddress` varchar(64) DEFAULT NULL,
  `subject` varchar(64) DEFAULT NULL,
  `htmlcontent` text DEFAULT NULL,
  `textcontent` text DEFAULT NULL,
  `enabletracking` tinyint(3) unsigned DEFAULT NULL,
  `status` int(11) unsigned DEFAULT NULL,
  `marketinglist_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_read`
--

DROP TABLE IF EXISTS `campaign_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_campaign_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_read`
--

LOCK TABLES `campaign_read` WRITE;
/*!40000 ALTER TABLE `campaign_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaignitem`
--

DROP TABLE IF EXISTS `campaignitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaignitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `emailmessage_id` int(11) unsigned DEFAULT NULL,
  `processed` tinyint(3) unsigned DEFAULT NULL,
  `campaign_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaignitem`
--

LOCK TABLES `campaignitem` WRITE;
/*!40000 ALTER TABLE `campaignitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaignitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaignitemactivity`
--

DROP TABLE IF EXISTS `campaignitemactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaignitemactivity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emailmessageactivity_id` int(11) unsigned DEFAULT NULL,
  `campaignitem_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaignitemactivity`
--

LOCK TABLES `campaignitemactivity` WRITE;
/*!40000 ALTER TABLE `campaignitemactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaignitemactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `relatedmodel_id` int(11) unsigned DEFAULT NULL,
  `relatedmodel_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(11) unsigned DEFAULT NULL,
  `industry_customfield_id` int(11) unsigned DEFAULT NULL,
  `source_customfield_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  `companyname` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `googlewebtrackingid` text DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `secondaryaddress_address_id` int(11) unsigned DEFAULT NULL,
  `secondaryemail_email_id` int(11) unsigned DEFAULT NULL,
  `state_contactstate_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_opportunity`
--

DROP TABLE IF EXISTS `contact_opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_opportunity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `opportunity_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_49ec3f900018477a710f404b661c83de848a2192` (`contact_id`,`opportunity_id`),
  KEY `index_for_contact_opportunity_contact_id` (`contact_id`),
  KEY `index_for_contact_opportunity_opportunity_id` (`opportunity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_opportunity`
--

LOCK TABLES `contact_opportunity` WRITE;
/*!40000 ALTER TABLE `contact_opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_read`
--

DROP TABLE IF EXISTS `contact_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_contact_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_read`
--

LOCK TABLES `contact_read` WRITE;
/*!40000 ALTER TABLE `contact_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_read_subscription`
--

DROP TABLE IF EXISTS `contact_read_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_read_subscription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `subscriptiontype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_read_subscription`
--

LOCK TABLES `contact_read_subscription` WRITE;
/*!40000 ALTER TABLE `contact_read_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_read_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_starred`
--

DROP TABLE IF EXISTS `contact_starred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_starred` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `model_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_starred`
--

LOCK TABLES `contact_starred` WRITE;
/*!40000 ALTER TABLE `contact_starred` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_starred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactstate`
--

DROP TABLE IF EXISTS `contactstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactstate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `serializedlabels` text DEFAULT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactstate`
--

LOCK TABLES `contactstate` WRITE;
/*!40000 ALTER TABLE `contactstate` DISABLE KEYS */;
INSERT INTO `contactstate` VALUES (2,'New',NULL,0),(3,'In Progress',NULL,1),(4,'Recycled',NULL,2),(5,'Dead',NULL,3),(6,'Qualified',NULL,4),(7,'Customer',NULL,5);
/*!40000 ALTER TABLE `contactstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactwebform`
--

DROP TABLE IF EXISTS `contactwebform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactwebform` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `defaultstate_contactstate_id` int(11) unsigned DEFAULT NULL,
  `name` text DEFAULT NULL,
  `submitbuttonlabel` text DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `excludestyles` tinyint(3) unsigned DEFAULT NULL,
  `redirecturl` varchar(255) DEFAULT NULL,
  `defaultowner__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactwebform`
--

LOCK TABLES `contactwebform` WRITE;
/*!40000 ALTER TABLE `contactwebform` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactwebform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactwebform_read`
--

DROP TABLE IF EXISTS `contactwebform_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactwebform_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_contactwebform_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactwebform_read`
--

LOCK TABLES `contactwebform_read` WRITE;
/*!40000 ALTER TABLE `contactwebform_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactwebform_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactwebformentry`
--

DROP TABLE IF EXISTS `contactwebformentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactwebformentry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `contactwebform_id` int(11) unsigned DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `hashindex` text DEFAULT NULL,
  `status` int(11) unsigned DEFAULT NULL,
  `entries_contactwebform_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactwebformentry`
--

LOCK TABLES `contactwebformentry` WRITE;
/*!40000 ALTER TABLE `contactwebformentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactwebformentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `latestdatetime` datetime DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `ownerhasreadlatest` tinyint(1) DEFAULT NULL,
  `isclosed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_item`
--

DROP TABLE IF EXISTS `conversation_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) unsigned DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_f9926d7fcbce985516b367d10bb523785fbab2d7` (`conversation_id`,`item_id`),
  KEY `index_for_conversation_item_conversation_id` (`conversation_id`),
  KEY `index_for_conversation_item_item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_item`
--

LOCK TABLES `conversation_item` WRITE;
/*!40000 ALTER TABLE `conversation_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_read`
--

DROP TABLE IF EXISTS `conversation_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_conversation_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_read`
--

LOCK TABLES `conversation_read` WRITE;
/*!40000 ALTER TABLE `conversation_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_starred`
--

DROP TABLE IF EXISTS `conversation_starred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_starred` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `model_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_starred`
--

LOCK TABLES `conversation_starred` WRITE;
/*!40000 ALTER TABLE `conversation_starred` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_starred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversationparticipant`
--

DROP TABLE IF EXISTS `conversationparticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversationparticipant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  `hasreadlatest` tinyint(1) DEFAULT NULL,
  `conversation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversationparticipant`
--

LOCK TABLES `conversationparticipant` WRITE;
/*!40000 ALTER TABLE `conversationparticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversationparticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `ratetobase` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_4f5a32b86618fd9d6a870ffe890cf77a88669783` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,1,'USD',1);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencyvalue`
--

DROP TABLE IF EXISTS `currencyvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencyvalue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) unsigned DEFAULT NULL,
  `value` double DEFAULT NULL,
  `ratetobase` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencyvalue`
--

LOCK TABLES `currencyvalue` WRITE;
/*!40000 ALTER TABLE `currencyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfield`
--

DROP TABLE IF EXISTS `customfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customfield` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `basecustomfield_id` int(11) unsigned DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfield`
--

LOCK TABLES `customfield` WRITE;
/*!40000 ALTER TABLE `customfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfielddata`
--

DROP TABLE IF EXISTS `customfielddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customfielddata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `defaultvalue` text DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  `serializedlabels` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_f97279e76d95d98f7433ff400fab94e189ee6052` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfielddata`
--

LOCK TABLES `customfielddata` WRITE;
/*!40000 ALTER TABLE `customfielddata` DISABLE KEYS */;
INSERT INTO `customfielddata` VALUES (2,'Industries',NULL,'a:9:{i:0;s:10:\"Automotive\";i:1;s:7:\"Banking\";i:2;s:17:\"Business Services\";i:3;s:6:\"Energy\";i:4;s:18:\"Financial Services\";i:5;s:9:\"Insurance\";i:6;s:13:\"Manufacturing\";i:7;s:6:\"Retail\";i:8;s:10:\"Technology\";}',NULL),(3,'AccountTypes',NULL,'a:3:{i:0;s:8:\"Prospect\";i:1;s:8:\"Customer\";i:2;s:6:\"Vendor\";}',NULL),(4,'LeadSources',NULL,'a:4:{i:0;s:14:\"Self-Generated\";i:1;s:12:\"Inbound Call\";i:2;s:9:\"Tradeshow\";i:3;s:13:\"Word of Mouth\";}',NULL),(5,'MeetingCategories','Meeting','a:2:{i:0;s:7:\"Meeting\";i:1;s:4:\"Call\";}',NULL),(6,'SalesStages','Prospecting','a:6:{i:0;s:11:\"Prospecting\";i:1;s:13:\"Qualification\";i:2;s:11:\"Negotiating\";i:3;s:6:\"Verbal\";i:4;s:10:\"Closed Won\";i:5;s:11:\"Closed Lost\";}',NULL),(7,'ProductStages',NULL,'a:3:{i:0;s:4:\"Open\";i:1;s:4:\"Lost\";i:2;s:3:\"Won\";}',NULL),(8,'Titles',NULL,'a:4:{i:0;s:3:\"Mr.\";i:1;s:4:\"Mrs.\";i:2;s:3:\"Ms.\";i:3;s:3:\"Dr.\";}',NULL);
/*!40000 ALTER TABLE `customfielddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `isdefault` tinyint(1) DEFAULT NULL,
  `layouttype` varchar(10) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `layoutid` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `derivedattributemetadata`
--

DROP TABLE IF EXISTS `derivedattributemetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `derivedattributemetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `modelclassname` varchar(64) DEFAULT NULL,
  `serializedmetadata` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `derivedattributemetadata`
--

LOCK TABLES `derivedattributemetadata` WRITE;
/*!40000 ALTER TABLE `derivedattributemetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `derivedattributemetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdowndependencyderivedattributemetadata`
--

DROP TABLE IF EXISTS `dropdowndependencyderivedattributemetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dropdowndependencyderivedattributemetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `derivedattributemetadata_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdowndependencyderivedattributemetadata`
--

LOCK TABLES `dropdowndependencyderivedattributemetadata` WRITE;
/*!40000 ALTER TABLE `dropdowndependencyderivedattributemetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdowndependencyderivedattributemetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isinvalid` tinyint(1) DEFAULT NULL,
  `optout` tinyint(1) DEFAULT NULL,
  `emailaddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailaccount`
--

DROP TABLE IF EXISTS `emailaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailaccount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `name` text DEFAULT NULL,
  `fromname` varchar(64) DEFAULT NULL,
  `replytoname` varchar(64) DEFAULT NULL,
  `outboundhost` varchar(64) DEFAULT NULL,
  `outboundusername` varchar(64) DEFAULT NULL,
  `outboundpassword` text DEFAULT NULL,
  `outboundsecurity` varchar(3) DEFAULT NULL,
  `outboundtype` varchar(4) DEFAULT NULL,
  `usecustomoutboundsettings` tinyint(1) DEFAULT NULL,
  `fromaddress` varchar(255) DEFAULT NULL,
  `replytoaddress` varchar(255) DEFAULT NULL,
  `outboundport` int(11) unsigned DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailaccount`
--

LOCK TABLES `emailaccount` WRITE;
/*!40000 ALTER TABLE `emailaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailbox`
--

DROP TABLE IF EXISTS `emailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailbox`
--

LOCK TABLES `emailbox` WRITE;
/*!40000 ALTER TABLE `emailbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailfolder`
--

DROP TABLE IF EXISTS `emailfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailfolder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `emailbox_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailfolder`
--

LOCK TABLES `emailfolder` WRITE;
/*!40000 ALTER TABLE `emailfolder` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailmessage`
--

DROP TABLE IF EXISTS `emailmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailmessage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `folder_emailfolder_id` int(11) unsigned DEFAULT NULL,
  `content_emailmessagecontent_id` int(11) unsigned DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `sentdatetime` datetime DEFAULT NULL,
  `sendondatetime` datetime DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `sendattempts` int(11) unsigned DEFAULT NULL,
  `sender_emailmessagesender_id` int(11) unsigned DEFAULT NULL,
  `error_emailmessagesenderror_id` int(11) unsigned DEFAULT NULL,
  `account_emailaccount_id` tinyint(1) DEFAULT NULL,
  `emailaccount_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailmessage`
--

LOCK TABLES `emailmessage` WRITE;
/*!40000 ALTER TABLE `emailmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailmessage_read`
--

DROP TABLE IF EXISTS `emailmessage_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailmessage_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_emailmessage_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailmessage_read`
--

LOCK TABLES `emailmessage_read` WRITE;
/*!40000 ALTER TABLE `emailmessage_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailmessage_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailmessageactivity`
--

DROP TABLE IF EXISTS `emailmessageactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailmessageactivity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `latestdatetime` datetime DEFAULT NULL,
  `latestsourceip` text DEFAULT NULL,
  `type` int(11) unsigned DEFAULT NULL,
  `quantity` int(11) unsigned DEFAULT NULL,
  `person_id` int(11) unsigned DEFAULT NULL,
  `emailmessageurl_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailmessageactivity`
--

LOCK TABLES `emailmessageactivity` WRITE;
/*!40000 ALTER TABLE `emailmessageactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailmessageactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailmessagecontent`
--

DROP TABLE IF EXISTS `emailmessagecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailmessagecontent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `htmlcontent` text DEFAULT NULL,
  `textcontent` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailmessagecontent`
--

LOCK TABLES `emailmessagecontent` WRITE;
/*!40000 ALTER TABLE `emailmessagecontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailmessagecontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailmessagerecipient`
--

DROP TABLE IF EXISTS `emailmessagerecipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailmessagerecipient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `personoraccount_item_id` int(11) unsigned DEFAULT NULL,
  `toname` varchar(64) DEFAULT NULL,
  `toaddress` varchar(255) DEFAULT NULL,
  `type` int(11) unsigned DEFAULT NULL,
  `emailmessage_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remailmessage_Index` (`emailmessage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailmessagerecipient`
--

LOCK TABLES `emailmessagerecipient` WRITE;
/*!40000 ALTER TABLE `emailmessagerecipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailmessagerecipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailmessagesender`
--

DROP TABLE IF EXISTS `emailmessagesender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailmessagesender` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `personoraccount_item_id` int(11) unsigned DEFAULT NULL,
  `fromname` varchar(64) DEFAULT NULL,
  `fromaddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailmessagesender`
--

LOCK TABLES `emailmessagesender` WRITE;
/*!40000 ALTER TABLE `emailmessagesender` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailmessagesender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailmessagesenderror`
--

DROP TABLE IF EXISTS `emailmessagesenderror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailmessagesenderror` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createddatetime` datetime DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailmessagesenderror`
--

LOCK TABLES `emailmessagesenderror` WRITE;
/*!40000 ALTER TABLE `emailmessagesenderror` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailmessagesenderror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailmessageurl`
--

DROP TABLE IF EXISTS `emailmessageurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailmessageurl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `emailmessageactivity_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailmessageurl`
--

LOCK TABLES `emailmessageurl` WRITE;
/*!40000 ALTER TABLE `emailmessageurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailmessageurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailsignature`
--

DROP TABLE IF EXISTS `emailsignature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailsignature` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `_user_id` int(11) unsigned DEFAULT NULL,
  `textcontent` text DEFAULT NULL,
  `htmlcontent` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailsignature`
--

LOCK TABLES `emailsignature` WRITE;
/*!40000 ALTER TABLE `emailsignature` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailsignature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailtemplate`
--

DROP TABLE IF EXISTS `emailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailtemplate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `modelclassname` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `subject` varchar(64) DEFAULT NULL,
  `language` varchar(2) DEFAULT NULL,
  `htmlcontent` text DEFAULT NULL,
  `textcontent` text DEFAULT NULL,
  `type` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailtemplate`
--

LOCK TABLES `emailtemplate` WRITE;
/*!40000 ALTER TABLE `emailtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailtemplate_read`
--

DROP TABLE IF EXISTS `emailtemplate_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailtemplate_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_emailtemplate_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailtemplate_read`
--

LOCK TABLES `emailtemplate_read` WRITE;
/*!40000 ALTER TABLE `emailtemplate_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailtemplate_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exportfilemodel`
--

DROP TABLE IF EXISTS `exportfilemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exportfilemodel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filemodel_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exportfilemodel`
--

LOCK TABLES `exportfilemodel` WRITE;
/*!40000 ALTER TABLE `exportfilemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `exportfilemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exportitem`
--

DROP TABLE IF EXISTS `exportitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exportitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `exportfilemodel_id` int(11) unsigned DEFAULT NULL,
  `iscompleted` tinyint(1) DEFAULT NULL,
  `exportfiletype` text DEFAULT NULL,
  `exportfilename` text DEFAULT NULL,
  `modelclassname` text DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  `processoffset` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exportitem`
--

LOCK TABLES `exportitem` WRITE;
/*!40000 ALTER TABLE `exportitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `exportitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filecontent`
--

DROP TABLE IF EXISTS `filecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filecontent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filecontent`
--

LOCK TABLES `filecontent` WRITE;
/*!40000 ALTER TABLE `filecontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `filecontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filemodel`
--

DROP TABLE IF EXISTS `filemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filemodel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `filecontent_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `relatedmodel_id` int(11) unsigned DEFAULT NULL,
  `relatedmodel_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filemodel`
--

LOCK TABLES `filemodel` WRITE;
/*!40000 ALTER TABLE `filemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `filemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamebadge`
--

DROP TABLE IF EXISTS `gamebadge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamebadge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `grade` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamebadge`
--

LOCK TABLES `gamebadge` WRITE;
/*!40000 ALTER TABLE `gamebadge` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamebadge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamelevel`
--

DROP TABLE IF EXISTS `gamelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamelevel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `value` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamelevel`
--

LOCK TABLES `gamelevel` WRITE;
/*!40000 ALTER TABLE `gamelevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamelevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamenotification`
--

DROP TABLE IF EXISTS `gamenotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamenotification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `_user_id` int(11) unsigned DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamenotification`
--

LOCK TABLES `gamenotification` WRITE;
/*!40000 ALTER TABLE `gamenotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamenotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamepoint`
--

DROP TABLE IF EXISTS `gamepoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamepoint` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `value` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamepoint`
--

LOCK TABLES `gamepoint` WRITE;
/*!40000 ALTER TABLE `gamepoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamepoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamepointtransaction`
--

DROP TABLE IF EXISTS `gamepointtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamepointtransaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createddatetime` datetime DEFAULT NULL,
  `value` int(11) unsigned DEFAULT NULL,
  `gamepoint_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamepointtransaction`
--

LOCK TABLES `gamepointtransaction` WRITE;
/*!40000 ALTER TABLE `gamepointtransaction` DISABLE KEYS */;
INSERT INTO `gamepointtransaction` VALUES (2,'2026-09-30 14:17:15',10,2),(3,'2026-09-30 14:17:15',50,2),(4,'2026-09-30 14:17:25',10,2),(5,'2026-09-30 14:17:35',10,3),(6,'2026-09-30 14:17:35',50,3);
/*!40000 ALTER TABLE `gamepointtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamescore`
--

DROP TABLE IF EXISTS `gamescore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamescore` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `value` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamescore`
--

LOCK TABLES `gamescore` WRITE;
/*!40000 ALTER TABLE `gamescore` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamescore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalmetadata`
--

DROP TABLE IF EXISTS `globalmetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalmetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(64) DEFAULT NULL,
  `serializedmetadata` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_6950932d5c0020179c0a175933c8d60ccab633ae` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalmetadata`
--

LOCK TABLES `globalmetadata` WRITE;
/*!40000 ALTER TABLE `globalmetadata` DISABLE KEYS */;
INSERT INTO `globalmetadata` VALUES (1,'ZurmoModule','a:7:{s:18:\"configureMenuItems\";a:6:{i:0;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:52:\"eval:Zurmo::t(\'ZurmoModule\', \'Global Configuration\')\";s:16:\"descriptionLabel\";s:59:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Global Configuration\')\";s:5:\"route\";s:32:\"/zurmo/default/configurationEdit\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:1;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:54:\"eval:Zurmo::t(\'ZurmoModule\', \'Currency Configuration\')\";s:16:\"descriptionLabel\";s:61:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Currency Configuration\')\";s:5:\"route\";s:33:\"/zurmo/currency/configurationList\";s:5:\"right\";s:29:\"Access Currency Configuration\";}i:2;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:41:\"eval:Zurmo::t(\'ZurmoModule\', \'Languages\')\";s:16:\"descriptionLabel\";s:55:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Active Languages\')\";s:5:\"route\";s:33:\"/zurmo/language/configurationList\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:3;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:47:\"eval:Zurmo::t(\'ZurmoModule\', \'Developer Tools\')\";s:16:\"descriptionLabel\";s:54:\"eval:Zurmo::t(\'ZurmoModule\', \'Access Developer Tools\')\";s:5:\"route\";s:19:\"/zurmo/development/\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:4;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:60:\"eval:Zurmo::t(\'ZurmoModule\', \'Authentication Configuration\')\";s:16:\"descriptionLabel\";s:67:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Authentication Configuration\')\";s:5:\"route\";s:39:\"/zurmo/authentication/configurationEdit\";s:5:\"right\";s:27:\"Access Global Configuration\";}i:5;a:5:{s:8:\"category\";i:1;s:10:\"titleLabel\";s:39:\"eval:Zurmo::t(\'ZurmoModule\', \'Plugins\')\";s:16:\"descriptionLabel\";s:63:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage Plugins and Integrations\')\";s:5:\"route\";s:32:\"/zurmo/plugins/configurationEdit\";s:5:\"right\";s:27:\"Access Global Configuration\";}}s:15:\"headerMenuItems\";a:3:{i:0;a:5:{s:5:\"label\";s:40:\"eval:Zurmo::t(\'ZurmoModule\', \'Settings\')\";s:3:\"url\";a:1:{i:0;s:14:\"/configuration\";}s:5:\"right\";s:25:\"Access Administration Tab\";s:5:\"order\";i:6;s:6:\"mobile\";b:0;}i:1;a:4:{s:5:\"label\";s:45:\"eval:Zurmo::t(\'ZurmoModule\', \'Need Support?\')\";s:3:\"url\";s:36:\"http://www.zurmo.com/needSupport.php\";s:5:\"order\";i:9;s:6:\"mobile\";b:1;}i:2;a:4:{s:5:\"label\";s:43:\"eval:Zurmo::t(\'ZurmoModule\', \'About Zurmo\')\";s:3:\"url\";a:1:{i:0;s:20:\"/zurmo/default/about\";}s:5:\"order\";i:10;s:6:\"mobile\";b:1;}}s:21:\"configureSubMenuItems\";a:1:{i:0;a:5:{s:8:\"category\";i:2;s:10:\"titleLabel\";s:50:\"eval:Zurmo::t(\'ZurmoModule\', \'LDAP Configuration\')\";s:16:\"descriptionLabel\";s:58:\"eval:Zurmo::t(\'ZurmoModule\', \'Manage LDAP Authentication\')\";s:5:\"route\";s:33:\"/zurmo/ldap/configurationEditLdap\";s:5:\"right\";s:27:\"Access Global Configuration\";}}s:31:\"adminTabMenuItemsModuleOrdering\";a:9:{i:0;s:4:\"home\";i:1;s:13:\"configuration\";i:2;s:8:\"designer\";i:3;s:6:\"import\";i:4;s:6:\"groups\";i:5;s:5:\"users\";i:6;s:5:\"roles\";i:7;s:9:\"workflows\";i:8;s:15:\"contactWebForms\";}s:26:\"tabMenuItemsModuleOrdering\";a:9:{i:0;s:4:\"home\";i:1;s:13:\"mashableInbox\";i:2;s:8:\"accounts\";i:3;s:5:\"leads\";i:4;s:8:\"contacts\";i:5;s:13:\"opportunities\";i:6;s:9:\"marketing\";i:7;s:7:\"reports\";i:8;s:8:\"products\";}s:11:\"globalState\";s:40:\"a:1:{s:14:\"autoBuildState\";s:5:\"valid\";}\";s:32:\"lastAttemptedInfoUpdateTimeStamp\";i:1790777835;}'),(3,'ContactsModule','a:6:{s:17:\"designerMenuItems\";a:4:{s:14:\"showFieldsLink\";b:1;s:15:\"showGeneralLink\";b:1;s:15:\"showLayoutsLink\";b:1;s:13:\"showMenusLink\";b:1;}s:26:\"globalSearchAttributeNames\";a:4:{i:0;s:8:\"fullName\";i:1;s:8:\"anyEmail\";i:2;s:11:\"officePhone\";i:3;s:11:\"mobilePhone\";}s:13:\"startingState\";i:1;s:12:\"tabMenuItems\";a:1:{i:0;a:4:{s:5:\"label\";s:80:\"eval:Zurmo::t(\'ContactsModule\', \'ContactsModulePluralLabel\', $translationParams)\";s:3:\"url\";a:1:{i:0;s:17:\"/contacts/default\";}s:5:\"right\";s:19:\"Access Contacts Tab\";s:6:\"mobile\";b:1;}}s:24:\"shortcutsCreateMenuItems\";a:1:{i:0;a:4:{s:5:\"label\";s:82:\"eval:Zurmo::t(\'ContactsModule\', \'ContactsModuleSingularLabel\', $translationParams)\";s:3:\"url\";a:1:{i:0;s:24:\"/contacts/default/create\";}s:5:\"right\";s:15:\"Create Contacts\";s:6:\"mobile\";b:1;}}s:15:\"startingStateId\";i:6;}'),(4,'Currency','a:3:{s:7:\"members\";a:3:{i:0;s:6:\"active\";i:1;s:4:\"code\";i:2;s:10:\"rateToBase\";}s:5:\"rules\";a:9:{i:0;a:2:{i:0;s:6:\"active\";i:1;s:7:\"boolean\";}i:1;a:3:{i:0;s:6:\"active\";i:1;s:7:\"default\";s:5:\"value\";b:1;}i:2;a:2:{i:0;s:4:\"code\";i:1;s:8:\"required\";}i:3;a:2:{i:0;s:4:\"code\";i:1;s:6:\"unique\";}i:4;a:3:{i:0;s:4:\"code\";i:1;s:4:\"type\";s:4:\"type\";s:6:\"string\";}i:5;a:4:{i:0;s:4:\"code\";i:1;s:6:\"length\";s:3:\"min\";i:3;s:3:\"max\";i:3;}i:6;a:4:{i:0;s:4:\"code\";i:1;s:5:\"match\";s:7:\"pattern\";s:19:\"/^[A-Z][A-Z][A-Z]$/\";s:7:\"message\";s:35:\"Code must be a valid currency code.\";}i:7;a:2:{i:0;s:10:\"rateToBase\";i:1;s:8:\"required\";}i:8;a:3:{i:0;s:10:\"rateToBase\";i:1;s:4:\"type\";s:4:\"type\";s:5:\"float\";}}s:32:\"lastAttemptedRateUpdateTimeStamp\";i:1790777787;}');
/*!40000 ALTER TABLE `globalmetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import`
--

DROP TABLE IF EXISTS `import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `import` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import`
--

LOCK TABLES `import` WRITE;
/*!40000 ALTER TABLE `import` DISABLE KEYS */;
/*!40000 ALTER TABLE `import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createddatetime` datetime DEFAULT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `createdbyuser__user_id` int(11) unsigned DEFAULT NULL,
  `modifiedbyuser__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'2026-09-30 14:15:15','2026-09-30 14:15:15',NULL,NULL),(2,'2026-09-30 14:15:15','2026-09-30 14:15:15',1,NULL),(3,'2026-09-30 14:15:15','2026-09-30 14:15:15',1,1),(53,'2026-09-30 14:15:22','2026-09-30 14:15:22',1,1),(54,'2026-09-30 14:15:23','2026-09-30 14:15:23',1,1),(55,'2026-09-30 14:15:23','2026-09-30 14:15:23',1,1),(56,'2026-09-30 14:15:23','2026-09-30 14:15:23',1,1),(57,'2026-09-30 14:15:23','2026-09-30 14:15:23',1,1),(58,'2026-09-30 14:15:23','2026-09-30 14:15:23',1,1),(59,'2026-09-30 14:17:10','2026-09-30 14:17:25',2,2),(60,'2026-09-30 14:17:15','2026-09-30 14:17:25',2,2),(61,'2026-09-30 14:17:15','2026-09-30 14:17:15',2,2),(62,'2026-09-30 14:17:35','2026-09-30 14:17:35',1,1),(63,'2026-09-30 14:17:35','2026-09-30 14:17:35',1,1),(64,'2026-09-30 14:17:35','2026-09-30 14:17:35',1,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobinprocess`
--

DROP TABLE IF EXISTS `jobinprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobinprocess` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobinprocess`
--

LOCK TABLES `jobinprocess` WRITE;
/*!40000 ALTER TABLE `jobinprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobinprocess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joblog`
--

DROP TABLE IF EXISTS `joblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `joblog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `enddatetime` datetime DEFAULT NULL,
  `isprocessed` tinyint(1) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `startdatetime` datetime DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `status` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joblog`
--

LOCK TABLES `joblog` WRITE;
/*!40000 ALTER TABLE `joblog` DISABLE KEYS */;
/*!40000 ALTER TABLE `joblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketinglist`
--

DROP TABLE IF EXISTS `marketinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketinglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fromname` varchar(64) DEFAULT NULL,
  `fromaddress` varchar(64) DEFAULT NULL,
  `anyonecansubscribe` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketinglist`
--

LOCK TABLES `marketinglist` WRITE;
/*!40000 ALTER TABLE `marketinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketinglist_read`
--

DROP TABLE IF EXISTS `marketinglist_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketinglist_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_marketinglist_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketinglist_read`
--

LOCK TABLES `marketinglist_read` WRITE;
/*!40000 ALTER TABLE `marketinglist_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketinglist_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketinglistmember`
--

DROP TABLE IF EXISTS `marketinglistmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketinglistmember` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `marketinglist_id` int(11) unsigned DEFAULT NULL,
  `createddatetime` datetime DEFAULT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `unsubscribed` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketinglistmember`
--

LOCK TABLES `marketinglistmember` WRITE;
/*!40000 ALTER TABLE `marketinglistmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketinglistmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `category_customfield_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `enddatetime` datetime DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `startdatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_read`
--

DROP TABLE IF EXISTS `meeting_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_meeting_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_read`
--

LOCK TABLES `meeting_read` WRITE;
/*!40000 ALTER TABLE `meeting_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_read_subscription`
--

DROP TABLE IF EXISTS `meeting_read_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_read_subscription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `subscriptiontype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_read_subscription`
--

LOCK TABLES `meeting_read_subscription` WRITE;
/*!40000 ALTER TABLE `meeting_read_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_read_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messagesource`
--

DROP TABLE IF EXISTS `messagesource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messagesource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(30) DEFAULT NULL,
  `source` blob DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_category_Index` (`category`,`source`(767))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagesource`
--

LOCK TABLES `messagesource` WRITE;
/*!40000 ALTER TABLE `messagesource` DISABLE KEYS */;
/*!40000 ALTER TABLE `messagesource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messagetranslation`
--

DROP TABLE IF EXISTS `messagetranslation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messagetranslation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `messagesource_id` int(11) unsigned DEFAULT NULL,
  `translation` blob DEFAULT NULL,
  `language` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_language_translation_Index` (`messagesource_id`,`language`,`translation`(767))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagetranslation`
--

LOCK TABLES `messagetranslation` WRITE;
/*!40000 ALTER TABLE `messagetranslation` DISABLE KEYS */;
/*!40000 ALTER TABLE `messagetranslation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission`
--

DROP TABLE IF EXISTS `mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duedatetime` datetime DEFAULT NULL,
  `latestdatetime` datetime DEFAULT NULL,
  `reward` text DEFAULT NULL,
  `status` int(11) unsigned DEFAULT NULL,
  `takenbyuser__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_read`
--

DROP TABLE IF EXISTS `mission_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_mission_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_read`
--

LOCK TABLES `mission_read` WRITE;
/*!40000 ALTER TABLE `mission_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelcreationapisync`
--

DROP TABLE IF EXISTS `modelcreationapisync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelcreationapisync` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `servicename` varchar(50) NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modelclassname` varchar(50) NOT NULL,
  `createddatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelcreationapisync`
--

LOCK TABLES `modelcreationapisync` WRITE;
/*!40000 ALTER TABLE `modelcreationapisync` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelcreationapisync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `namedsecurableitem`
--

DROP TABLE IF EXISTS `namedsecurableitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `namedsecurableitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_f97279e76d95d98f7433ff400fab94e189ee6052` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `namedsecurableitem`
--

LOCK TABLES `namedsecurableitem` WRITE;
/*!40000 ALTER TABLE `namedsecurableitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `namedsecurableitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `occurredondatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_read`
--

DROP TABLE IF EXISTS `note_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `note_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_note_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_read`
--

LOCK TABLES `note_read` WRITE;
/*!40000 ALTER TABLE `note_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `note_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `notificationmessage_id` int(11) unsigned DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `ownerhasreadlatest` tinyint(1) DEFAULT NULL,
  `owner__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (2,55,2,'RemoveApiTestEntryScriptFile',NULL,2),(3,57,2,'RemoveApiTestEntryScriptFile',NULL,4),(4,58,2,'RemoveApiTestEntryScriptFile',NULL,1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationmessage`
--

DROP TABLE IF EXISTS `notificationmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificationmessage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `htmlcontent` text DEFAULT NULL,
  `textcontent` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationmessage`
--

LOCK TABLES `notificationmessage` WRITE;
/*!40000 ALTER TABLE `notificationmessage` DISABLE KEYS */;
INSERT INTO `notificationmessage` VALUES (2,56,NULL,'If this website is in production mode, please remove the app/test.php file.');
/*!40000 ALTER TABLE `notificationmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunity`
--

DROP TABLE IF EXISTS `opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `closedate` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `probability` tinyint(3) unsigned DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `stage_customfield_id` int(11) unsigned DEFAULT NULL,
  `source_customfield_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  `amount_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunity`
--

LOCK TABLES `opportunity` WRITE;
/*!40000 ALTER TABLE `opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunity_read`
--

DROP TABLE IF EXISTS `opportunity_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunity_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_opportunity_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunity_read`
--

LOCK TABLES `opportunity_read` WRITE;
/*!40000 ALTER TABLE `opportunity_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunity_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunity_starred`
--

DROP TABLE IF EXISTS `opportunity_starred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunity_starred` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `model_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunity_starred`
--

LOCK TABLES `opportunity_starred` WRITE;
/*!40000 ALTER TABLE `opportunity_starred` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunity_starred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ownedsecurableitem`
--

DROP TABLE IF EXISTS `ownedsecurableitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ownedsecurableitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `securableitem_id` int(11) unsigned DEFAULT NULL,
  `owner__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ownedsecurableitem`
--

LOCK TABLES `ownedsecurableitem` WRITE;
/*!40000 ALTER TABLE `ownedsecurableitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ownedsecurableitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  `securableitem_id` int(11) unsigned DEFAULT NULL,
  `permissions` tinyint(3) unsigned DEFAULT NULL,
  `type` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permitable`
--

DROP TABLE IF EXISTS `permitable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permitable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permitable`
--

LOCK TABLES `permitable` WRITE;
/*!40000 ALTER TABLE `permitable` DISABLE KEYS */;
INSERT INTO `permitable` VALUES (1,1),(2,2),(3,3),(6,53),(7,54);
/*!40000 ALTER TABLE `permitable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(64) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `jobtitle` varchar(64) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `mobilephone` varchar(24) DEFAULT NULL,
  `officephone` varchar(24) DEFAULT NULL,
  `officefax` varchar(24) DEFAULT NULL,
  `title_customfield_id` int(11) unsigned DEFAULT NULL,
  `primaryemail_email_id` int(11) unsigned DEFAULT NULL,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `primaryaddress_address_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,NULL,'Super',NULL,'User',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,'Super',NULL,'User',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,'System',NULL,'User',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personwhohavenotreadlatest`
--

DROP TABLE IF EXISTS `personwhohavenotreadlatest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personwhohavenotreadlatest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_item_id` int(11) unsigned DEFAULT NULL,
  `mission_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personwhohavenotreadlatest`
--

LOCK TABLES `personwhohavenotreadlatest` WRITE;
/*!40000 ALTER TABLE `personwhohavenotreadlatest` DISABLE KEYS */;
/*!40000 ALTER TABLE `personwhohavenotreadlatest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perusermetadata`
--

DROP TABLE IF EXISTS `perusermetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `perusermetadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `_user_id` int(11) unsigned DEFAULT NULL,
  `classname` varchar(64) DEFAULT NULL,
  `serializedmetadata` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perusermetadata`
--

LOCK TABLES `perusermetadata` WRITE;
/*!40000 ALTER TABLE `perusermetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `perusermetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permitable_id` int(11) unsigned DEFAULT NULL,
  `modulename` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet`
--

DROP TABLE IF EXISTS `portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portlet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `_user_id` int(11) unsigned DEFAULT NULL,
  `layoutid` varchar(100) DEFAULT NULL,
  `viewtype` text DEFAULT NULL,
  `serializedviewdata` text DEFAULT NULL,
  `collapsed` tinyint(1) DEFAULT NULL,
  `column` int(11) unsigned DEFAULT NULL,
  `position` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet`
--

LOCK TABLES `portlet` WRITE;
/*!40000 ALTER TABLE `portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `stage_customfield_id` int(11) unsigned DEFAULT NULL,
  `sellprice_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  `account_id` int(11) unsigned DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) unsigned DEFAULT NULL,
  `pricefrequency` int(11) unsigned DEFAULT NULL,
  `type` int(11) unsigned DEFAULT NULL,
  `opportunity_id` int(11) unsigned DEFAULT NULL,
  `producttemplate_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_productcategory`
--

DROP TABLE IF EXISTS `product_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_productcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned DEFAULT NULL,
  `productcategory_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_1847df0f79503c223534c3058299bc8e4db1c51e` (`product_id`,`productcategory_id`),
  KEY `index_for_product_productcategory_product_id` (`product_id`),
  KEY `index_for_product_productcategory_productcategory_id` (`productcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productcategory`
--

LOCK TABLES `product_productcategory` WRITE;
/*!40000 ALTER TABLE `product_productcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_read`
--

DROP TABLE IF EXISTS `product_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_product_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_read`
--

LOCK TABLES `product_read` WRITE;
/*!40000 ALTER TABLE `product_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcatalog`
--

DROP TABLE IF EXISTS `productcatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcatalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcatalog`
--

LOCK TABLES `productcatalog` WRITE;
/*!40000 ALTER TABLE `productcatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcatalog_productcategory`
--

DROP TABLE IF EXISTS `productcatalog_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcatalog_productcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productcategory_id` int(11) unsigned DEFAULT NULL,
  `productcatalog_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_f6568fb4a89ba252a0046e46ae78caab1cf7b128` (`productcatalog_id`,`productcategory_id`),
  KEY `index_for_productcatalog_productcategory_productcategory_id` (`productcategory_id`),
  KEY `index_for_productcatalog_productcategory_productcatalog_id` (`productcatalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcatalog_productcategory`
--

LOCK TABLES `productcatalog_productcategory` WRITE;
/*!40000 ALTER TABLE `productcatalog_productcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcatalog_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `item_id` int(11) unsigned DEFAULT NULL,
  `productcategory_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory_producttemplate`
--

DROP TABLE IF EXISTS `productcategory_producttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory_producttemplate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `producttemplate_id` int(11) unsigned DEFAULT NULL,
  `productcategory_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_ddf85331d64908459ca387f73c4133bee1cbab07` (`productcategory_id`,`producttemplate_id`),
  KEY `index_for_productcategory_producttemplate_producttemplate_id` (`producttemplate_id`),
  KEY `index_for_productcategory_producttemplate_productcategory_id` (`productcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory_producttemplate`
--

LOCK TABLES `productcategory_producttemplate` WRITE;
/*!40000 ALTER TABLE `productcategory_producttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcategory_producttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttemplate`
--

DROP TABLE IF EXISTS `producttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `producttemplate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `sellprice_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  `cost_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  `listprice_currencyvalue_id` int(11) unsigned DEFAULT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pricefrequency` int(11) unsigned DEFAULT NULL,
  `status` int(11) unsigned DEFAULT NULL,
  `type` int(11) unsigned DEFAULT NULL,
  `sellpriceformula_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttemplate`
--

LOCK TABLES `producttemplate` WRITE;
/*!40000 ALTER TABLE `producttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `producttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `role_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_f97279e76d95d98f7433ff400fab94e189ee6052` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savedreport`
--

DROP TABLE IF EXISTS `savedreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `savedreport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `moduleclassname` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savedreport`
--

LOCK TABLES `savedreport` WRITE;
/*!40000 ALTER TABLE `savedreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `savedreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savedreport_read`
--

DROP TABLE IF EXISTS `savedreport_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `savedreport_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_savedreport_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savedreport_read`
--

LOCK TABLES `savedreport_read` WRITE;
/*!40000 ALTER TABLE `savedreport_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `savedreport_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savedsearch`
--

DROP TABLE IF EXISTS `savedsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `savedsearch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  `viewclassname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savedsearch`
--

LOCK TABLES `savedsearch` WRITE;
/*!40000 ALTER TABLE `savedsearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `savedsearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savedworkflow`
--

DROP TABLE IF EXISTS `savedworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `savedworkflow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  `moduleclassname` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `triggeron` varchar(15) DEFAULT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savedworkflow`
--

LOCK TABLES `savedworkflow` WRITE;
/*!40000 ALTER TABLE `savedworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `savedworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securableitem`
--

DROP TABLE IF EXISTS `securableitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `securableitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securableitem`
--

LOCK TABLES `securableitem` WRITE;
/*!40000 ALTER TABLE `securableitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `securableitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellpriceformula`
--

DROP TABLE IF EXISTS `sellpriceformula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellpriceformula` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `producttemplate_id` int(11) unsigned DEFAULT NULL,
  `type` int(11) unsigned DEFAULT NULL,
  `discountormarkuppercentage` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellpriceformula`
--

LOCK TABLES `sellpriceformula` WRITE;
/*!40000 ALTER TABLE `sellpriceformula` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellpriceformula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialitem`
--

DROP TABLE IF EXISTS `socialitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialitem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownedsecurableitem_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `latestdatetime` datetime DEFAULT NULL,
  `note_id` int(11) unsigned DEFAULT NULL,
  `touser__user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialitem`
--

LOCK TABLES `socialitem` WRITE;
/*!40000 ALTER TABLE `socialitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialitem_read`
--

DROP TABLE IF EXISTS `socialitem_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialitem_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_socialitem_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialitem_read`
--

LOCK TABLES `socialitem_read` WRITE;
/*!40000 ALTER TABLE `socialitem_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialitem_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `completeddatetime` datetime DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `duedatetime` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_read`
--

DROP TABLE IF EXISTS `task_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_read` (
  `securableitem_id` int(11) unsigned NOT NULL,
  `munge_id` varchar(12) NOT NULL,
  `count` int(8) unsigned NOT NULL,
  PRIMARY KEY (`securableitem_id`,`munge_id`),
  KEY `index_task_read_securable_item_id` (`securableitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_read`
--

LOCK TABLES `task_read` WRITE;
/*!40000 ALTER TABLE `task_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_read_subscription`
--

DROP TABLE IF EXISTS `task_read_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_read_subscription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `modelid` int(11) unsigned NOT NULL,
  `modifieddatetime` datetime DEFAULT NULL,
  `subscriptiontype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_read_subscription`
--

LOCK TABLES `task_read_subscription` WRITE;
/*!40000 ALTER TABLE `task_read_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_read_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowmessageinqueue`
--

DROP TABLE IF EXISTS `workflowmessageinqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflowmessageinqueue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned DEFAULT NULL,
  `modelitem_item_id` int(11) unsigned DEFAULT NULL,
  `savedworkflow_id` int(11) unsigned DEFAULT NULL,
  `triggeredbyuser__user_id` int(11) unsigned DEFAULT NULL,
  `modelclassname` varchar(64) DEFAULT NULL,
  `processdatetime` datetime DEFAULT NULL,
  `serializeddata` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowmessageinqueue`
--

LOCK TABLES `workflowmessageinqueue` WRITE;
/*!40000 ALTER TABLE `workflowmessageinqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowmessageinqueue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 14:18:06
