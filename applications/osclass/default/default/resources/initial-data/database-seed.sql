/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: osclass
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
-- Current Database: `osclass`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `osclass` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `osclass`;

--
-- Table structure for table `oc_t_admin`
--

DROP TABLE IF EXISTS `oc_t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_admin` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(40) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_moderator` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pk_i_id`),
  UNIQUE KEY `s_username` (`s_username`),
  UNIQUE KEY `s_email` (`s_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_admin`
--

LOCK TABLES `oc_t_admin` WRITE;
/*!40000 ALTER TABLE `oc_t_admin` DISABLE KEYS */;
INSERT INTO `oc_t_admin` VALUES (1,'Administrator','admin','$2y$15$Nc/kviUMPGy2aRO7yGYE1uk4iS3a06q2cDsbBif0IvCYilkktFC0K','admin@example.com',NULL,0);
/*!40000 ALTER TABLE `oc_t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_alerts`
--

DROP TABLE IF EXISTS `oc_t_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_alerts` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_email` varchar(100) DEFAULT NULL,
  `fk_i_user_id` int(10) unsigned DEFAULT NULL,
  `s_search` longtext DEFAULT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT 0,
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `dt_date` datetime DEFAULT NULL,
  `dt_unsub_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_alerts`
--

LOCK TABLES `oc_t_alerts` WRITE;
/*!40000 ALTER TABLE `oc_t_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_alerts_sent`
--

DROP TABLE IF EXISTS `oc_t_alerts_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_alerts_sent` (
  `d_date` date NOT NULL,
  `i_num_alerts_sent` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`d_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_alerts_sent`
--

LOCK TABLES `oc_t_alerts_sent` WRITE;
/*!40000 ALTER TABLE `oc_t_alerts_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_alerts_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_ban_rule`
--

DROP TABLE IF EXISTS `oc_t_ban_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_ban_rule` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(250) NOT NULL DEFAULT '',
  `s_ip` varchar(50) NOT NULL DEFAULT '',
  `s_email` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_ban_rule`
--

LOCK TABLES `oc_t_ban_rule` WRITE;
/*!40000 ALTER TABLE `oc_t_ban_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_ban_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_category`
--

DROP TABLE IF EXISTS `oc_t_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_category` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_parent_id` int(10) unsigned DEFAULT NULL,
  `i_expiration_days` int(3) unsigned NOT NULL DEFAULT 0,
  `i_position` int(2) unsigned NOT NULL DEFAULT 0,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_price_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `s_icon` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_parent_id` (`fk_i_parent_id`),
  KEY `i_position` (`i_position`),
  CONSTRAINT `oc_t_category_ibfk_1` FOREIGN KEY (`fk_i_parent_id`) REFERENCES `oc_t_category` (`pk_i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_category`
--

LOCK TABLES `oc_t_category` WRITE;
/*!40000 ALTER TABLE `oc_t_category` DISABLE KEYS */;
INSERT INTO `oc_t_category` VALUES (1,NULL,0,1,1,1,NULL),(2,NULL,0,2,1,1,NULL),(3,NULL,0,3,1,1,NULL),(4,NULL,0,4,1,1,NULL),(5,NULL,0,5,1,1,NULL),(6,NULL,0,6,1,1,NULL),(7,NULL,0,7,1,1,NULL),(8,NULL,0,8,1,1,NULL),(9,1,0,1,1,1,NULL),(10,1,0,2,1,1,NULL),(11,1,0,3,1,1,NULL),(12,1,0,4,1,1,NULL),(13,1,0,5,1,1,NULL),(14,1,0,6,1,1,NULL),(15,1,0,7,1,1,NULL),(16,1,0,8,1,1,NULL),(17,1,0,9,1,1,NULL),(18,1,0,10,1,1,NULL),(19,1,0,11,1,1,NULL),(20,1,0,12,1,1,NULL),(21,1,0,13,1,1,NULL),(22,1,0,14,1,1,NULL),(23,1,0,15,1,1,NULL),(24,1,0,16,1,1,NULL),(25,1,0,17,1,1,NULL),(26,1,0,18,1,1,NULL),(27,1,0,19,1,1,NULL),(28,1,0,20,1,1,NULL),(29,1,0,21,1,1,NULL),(30,1,0,22,1,1,NULL),(31,2,0,1,1,1,NULL),(32,2,0,2,1,1,NULL),(33,2,0,3,1,1,NULL),(34,2,0,4,1,1,NULL),(35,2,0,5,1,1,NULL),(36,2,0,6,1,1,NULL),(37,2,0,7,1,1,NULL),(38,3,0,1,1,1,NULL),(39,3,0,2,1,1,NULL),(40,3,0,3,1,1,NULL),(41,3,0,4,1,1,NULL),(42,3,0,5,1,1,NULL),(43,4,0,1,1,1,NULL),(44,4,0,2,1,1,NULL),(45,4,0,3,1,1,NULL),(46,4,0,4,1,1,NULL),(47,4,0,5,1,1,NULL),(48,4,0,6,1,1,NULL),(49,4,0,7,1,1,NULL),(50,4,0,8,1,1,NULL),(51,4,0,9,1,1,NULL),(52,5,0,1,1,1,NULL),(53,5,0,2,1,1,NULL),(54,5,0,3,1,1,NULL),(55,5,0,4,1,1,NULL),(56,5,0,5,1,1,NULL),(57,5,0,6,1,1,NULL),(58,5,0,7,1,1,NULL),(59,5,0,8,1,1,NULL),(60,5,0,9,1,1,NULL),(61,5,0,10,1,1,NULL),(62,5,0,11,1,1,NULL),(63,6,0,1,1,1,NULL),(64,6,0,2,1,1,NULL),(65,6,0,3,1,1,NULL),(66,6,0,4,1,1,NULL),(67,6,0,5,1,1,NULL),(68,6,0,6,1,1,NULL),(69,7,0,1,1,1,NULL),(70,7,0,2,1,1,NULL),(71,7,0,3,1,1,NULL),(72,7,0,4,1,1,NULL),(73,7,0,5,1,1,NULL),(74,7,0,6,1,1,NULL),(75,8,0,1,1,1,NULL),(76,8,0,2,1,1,NULL),(77,8,0,3,1,1,NULL),(78,8,0,4,1,1,NULL),(79,8,0,5,1,1,NULL),(80,8,0,6,1,1,NULL),(81,8,0,7,1,1,NULL),(82,8,0,8,1,1,NULL),(83,8,0,9,1,1,NULL),(84,8,0,10,1,1,NULL),(85,8,0,11,1,1,NULL),(86,8,0,12,1,1,NULL),(87,8,0,13,1,1,NULL),(88,8,0,14,1,1,NULL),(89,8,0,15,1,1,NULL),(90,8,0,16,1,1,NULL),(91,8,0,17,1,1,NULL),(92,8,0,18,1,1,NULL),(93,8,0,19,1,1,NULL),(94,8,0,20,1,1,NULL),(95,8,0,21,1,1,NULL);
/*!40000 ALTER TABLE `oc_t_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_category_description`
--

DROP TABLE IF EXISTS `oc_t_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_category_description` (
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_description` text DEFAULT NULL,
  `s_slug` varchar(255) NOT NULL,
  PRIMARY KEY (`fk_i_category_id`,`fk_c_locale_code`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`),
  CONSTRAINT `oc_t_category_description_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  CONSTRAINT `oc_t_category_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_category_description`
--

LOCK TABLES `oc_t_category_description` WRITE;
/*!40000 ALTER TABLE `oc_t_category_description` DISABLE KEYS */;
INSERT INTO `oc_t_category_description` VALUES (1,'en_US','For sale',NULL,'for-sale'),(2,'en_US','Vehicles',NULL,'vehicles'),(3,'en_US','Classes',NULL,'classes'),(4,'en_US','Real estate',NULL,'real-estate'),(5,'en_US','Services',NULL,'services'),(6,'en_US','Community',NULL,'community'),(7,'en_US','Personals',NULL,'personals'),(8,'en_US','Jobs',NULL,'jobs'),(9,'en_US','Animals',NULL,'animals'),(10,'en_US','Art - Collectibles',NULL,'art-collectibles'),(11,'en_US','Barter',NULL,'barter'),(12,'en_US','Books - Magazines',NULL,'books-magazines'),(13,'en_US','Cameras - Camera Accessories',NULL,'cameras-camera-accessories'),(14,'en_US','CDs - Records',NULL,'cds-records'),(15,'en_US','Cell Phones - Accessories',NULL,'cell-phones-accessories'),(16,'en_US','Clothing',NULL,'clothing'),(17,'en_US','Computers - Hardware',NULL,'computers-hardware'),(18,'en_US','DVD',NULL,'dvd'),(19,'en_US','Electronics',NULL,'electronics'),(20,'en_US','For Babies - Infants',NULL,'for-babies-infants'),(21,'en_US','Garage Sale',NULL,'garage-sale'),(22,'en_US','Health - Beauty',NULL,'health-beauty'),(23,'en_US','Home - Furniture - Garden Supplies',NULL,'home-furniture-garden-supplies'),(24,'en_US','Jewelry - Watches',NULL,'jewelry-watches'),(25,'en_US','Musical Instruments',NULL,'musical-instruments'),(26,'en_US','Sporting Goods - Bicycles',NULL,'sporting-goods-bicycles'),(27,'en_US','Tickets',NULL,'tickets'),(28,'en_US','Toys - Games - Hobbies',NULL,'toys-games-hobbies'),(29,'en_US','Video Games - Consoles',NULL,'video-games-consoles'),(30,'en_US','Everything Else',NULL,'everything-else'),(31,'en_US','Cars',NULL,'cars'),(32,'en_US','Car Parts',NULL,'car-parts'),(33,'en_US','Motorcycles',NULL,'motorcycles'),(34,'en_US','Boats - Ships',NULL,'boats-ships'),(35,'en_US','RVs - Campers - Caravans',NULL,'rvs-campers-caravans'),(36,'en_US','Trucks - Commercial Vehicles',NULL,'trucks-commercial-vehicles'),(37,'en_US','Other Vehicles',NULL,'other-vehicles'),(38,'en_US','Computer - Multimedia Classes',NULL,'computer-multimedia-classes'),(39,'en_US','Language Classes',NULL,'language-classes'),(40,'en_US','Music - Theatre - Dance Classes',NULL,'music-theatre-dance-classes'),(41,'en_US','Tutoring - Private Lessons',NULL,'tutoring-private-lessons'),(42,'en_US','Other Classes',NULL,'other-classes'),(43,'en_US','Houses - Apartments for Sale',NULL,'houses-apartments-for-sale'),(44,'en_US','Houses - Apartments for Rent',NULL,'houses-apartments-for-rent'),(45,'en_US','Rooms for Rent - Shared',NULL,'rooms-for-rent-shared'),(46,'en_US','Housing Swap',NULL,'housing-swap'),(47,'en_US','Vacation Rentals',NULL,'vacation-rentals'),(48,'en_US','Parking Spots',NULL,'parking-spots'),(49,'en_US','Land',NULL,'land'),(50,'en_US','Office - Commercial Space',NULL,'office-commercial-space'),(51,'en_US','Shops for Rent - Sale',NULL,'shops-for-rent-sale'),(52,'en_US','Babysitter - Nanny',NULL,'babysitter-nanny'),(53,'en_US','Casting - Auditions',NULL,'casting-auditions'),(54,'en_US','Computer',NULL,'computer'),(55,'en_US','Event Services',NULL,'event-services'),(56,'en_US','Health - Beauty - Fitness',NULL,'health-beauty-fitness'),(57,'en_US','Horoscopes - Tarot',NULL,'horoscopes-tarot'),(58,'en_US','Household - Domestic Help',NULL,'household-domestic-help'),(59,'en_US','Moving - Storage',NULL,'moving-storage'),(60,'en_US','Repair',NULL,'repair'),(61,'en_US','Writing - Editing - Translating',NULL,'writing-editing-translating'),(62,'en_US','Other Services',NULL,'other-services'),(63,'en_US','Carpool',NULL,'carpool'),(64,'en_US','Community Activities',NULL,'community-activities'),(65,'en_US','Events',NULL,'events'),(66,'en_US','Musicians - Artists - Bands',NULL,'musicians-artists-bands'),(67,'en_US','Volunteers',NULL,'volunteers'),(68,'en_US','Lost And Found',NULL,'lost-and-found'),(69,'en_US','Women looking for Men',NULL,'women-looking-for-men'),(70,'en_US','Men looking for Women',NULL,'men-looking-for-women'),(71,'en_US','Men looking for Men',NULL,'men-looking-for-men'),(72,'en_US','Women looking for Women',NULL,'women-looking-for-women'),(73,'en_US','Friendship - Activity Partners',NULL,'friendship-activity-partners'),(74,'en_US','Missed Connections',NULL,'missed-connections'),(75,'en_US','Accounting - Finance',NULL,'accounting-finance'),(76,'en_US','Advertising - Public Relations',NULL,'advertising-public-relations'),(77,'en_US','Arts - Entertainment - Publishing',NULL,'arts-entertainment-publishing'),(78,'en_US','Clerical - Administrative',NULL,'clerical-administrative'),(79,'en_US','Customer Service',NULL,'customer-service'),(80,'en_US','Education - Training',NULL,'education-training'),(81,'en_US','Engineering - Architecture',NULL,'engineering-architecture'),(82,'en_US','Healthcare',NULL,'healthcare'),(83,'en_US','Human Resource',NULL,'human-resource'),(84,'en_US','Internet',NULL,'internet'),(85,'en_US','Legal',NULL,'legal'),(86,'en_US','Manual Labor',NULL,'manual-labor'),(87,'en_US','Manufacturing - Operations',NULL,'manufacturing-operations'),(88,'en_US','Marketing',NULL,'marketing'),(89,'en_US','Non-profit - Volunteer',NULL,'non-profit-volunteer'),(90,'en_US','Real Estate',NULL,'real-estate_1'),(91,'en_US','Restaurant - Food Service',NULL,'restaurant-food-service'),(92,'en_US','Retail',NULL,'retail'),(93,'en_US','Sales',NULL,'sales'),(94,'en_US','Technology',NULL,'technology'),(95,'en_US','Other Jobs',NULL,'other-jobs');
/*!40000 ALTER TABLE `oc_t_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_category_stats`
--

DROP TABLE IF EXISTS `oc_t_category_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_category_stats` (
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`fk_i_category_id`),
  CONSTRAINT `oc_t_category_stats_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_category_stats`
--

LOCK TABLES `oc_t_category_stats` WRITE;
/*!40000 ALTER TABLE `oc_t_category_stats` DISABLE KEYS */;
INSERT INTO `oc_t_category_stats` VALUES (1,1),(9,1);
/*!40000 ALTER TABLE `oc_t_category_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_city`
--

DROP TABLE IF EXISTS `oc_t_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_city` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_region_id` int(10) unsigned NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `fk_c_country_code` char(2) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_region_id` (`fk_i_region_id`),
  KEY `idx_s_name` (`s_name`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  CONSTRAINT `oc_t_city_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  CONSTRAINT `oc_t_city_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_city`
--

LOCK TABLES `oc_t_city` WRITE;
/*!40000 ALTER TABLE `oc_t_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_city_area`
--

DROP TABLE IF EXISTS `oc_t_city_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_city_area` (
  `pk_i_id` int(10) unsigned NOT NULL,
  `fk_i_city_id` int(10) unsigned NOT NULL,
  `s_name` varchar(255) NOT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `idx_s_name` (`s_name`),
  CONSTRAINT `oc_t_city_area_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_city_area`
--

LOCK TABLES `oc_t_city_area` WRITE;
/*!40000 ALTER TABLE `oc_t_city_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_city_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_city_stats`
--

DROP TABLE IF EXISTS `oc_t_city_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_city_stats` (
  `fk_i_city_id` int(10) unsigned NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`fk_i_city_id`),
  KEY `idx_num_items` (`i_num_items`),
  CONSTRAINT `oc_t_city_stats_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_city_stats`
--

LOCK TABLES `oc_t_city_stats` WRITE;
/*!40000 ALTER TABLE `oc_t_city_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_city_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_country`
--

DROP TABLE IF EXISTS `oc_t_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_country` (
  `pk_c_code` char(2) NOT NULL,
  `s_name` varchar(80) NOT NULL,
  `s_slug` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_c_code`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `idx_s_name` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_country`
--

LOCK TABLES `oc_t_country` WRITE;
/*!40000 ALTER TABLE `oc_t_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_country_stats`
--

DROP TABLE IF EXISTS `oc_t_country_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_country_stats` (
  `fk_c_country_code` char(2) NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`fk_c_country_code`),
  KEY `idx_num_items` (`i_num_items`),
  CONSTRAINT `oc_t_country_stats_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_country_stats`
--

LOCK TABLES `oc_t_country_stats` WRITE;
/*!40000 ALTER TABLE `oc_t_country_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_country_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_cron`
--

DROP TABLE IF EXISTS `oc_t_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_cron` (
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `d_last_exec` datetime NOT NULL,
  `d_next_exec` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_cron`
--

LOCK TABLES `oc_t_cron` WRITE;
/*!40000 ALTER TABLE `oc_t_cron` DISABLE KEYS */;
INSERT INTO `oc_t_cron` VALUES ('HOURLY','0000-00-00 00:00:00','0000-00-00 00:00:00'),('DAILY','0000-00-00 00:00:00','0000-00-00 00:00:00'),('WEEKLY','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `oc_t_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_currency`
--

DROP TABLE IF EXISTS `oc_t_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_currency` (
  `pk_c_code` char(3) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_description` varchar(80) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pk_c_code`),
  UNIQUE KEY `s_name` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_currency`
--

LOCK TABLES `oc_t_currency` WRITE;
/*!40000 ALTER TABLE `oc_t_currency` DISABLE KEYS */;
INSERT INTO `oc_t_currency` VALUES ('EUR','European Union euro','Euro €',1),('GBP','United Kingdom pound','Pound £',1),('USD','United States dollar','Dollar US$',1);
/*!40000 ALTER TABLE `oc_t_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_item`
--

DROP TABLE IF EXISTS `oc_t_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_item` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_user_id` int(10) unsigned DEFAULT NULL,
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `f_price` float DEFAULT NULL,
  `i_price` bigint(20) DEFAULT NULL,
  `fk_c_currency_code` char(3) DEFAULT NULL,
  `s_contact_name` varchar(100) DEFAULT NULL,
  `s_contact_email` varchar(140) NOT NULL,
  `s_ip` varchar(64) NOT NULL DEFAULT '',
  `b_premium` tinyint(1) NOT NULL DEFAULT 0,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_active` tinyint(1) NOT NULL DEFAULT 0,
  `b_spam` tinyint(1) NOT NULL DEFAULT 0,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_show_email` tinyint(1) DEFAULT NULL,
  `dt_expiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_user_id` (`fk_i_user_id`),
  KEY `idx_b_premium` (`b_premium`),
  KEY `idx_s_contact_email` (`s_contact_email`(10)),
  KEY `fk_i_category_id` (`fk_i_category_id`),
  KEY `fk_c_currency_code` (`fk_c_currency_code`),
  KEY `idx_pub_date` (`dt_pub_date`),
  KEY `idx_price` (`i_price`),
  CONSTRAINT `oc_t_item_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  CONSTRAINT `oc_t_item_ibfk_2` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  CONSTRAINT `oc_t_item_ibfk_3` FOREIGN KEY (`fk_c_currency_code`) REFERENCES `oc_t_currency` (`pk_c_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_item`
--

LOCK TABLES `oc_t_item` WRITE;
/*!40000 ALTER TABLE `oc_t_item` DISABLE KEYS */;
INSERT INTO `oc_t_item` VALUES (1,NULL,9,'2026-09-30 11:20:06',NULL,NULL,NULL,NULL,'Example author','osclass@example.com','',0,1,1,0,'1NW0Yx9m',0,'9999-12-31 23:59:59');
/*!40000 ALTER TABLE `oc_t_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_item_comment`
--

DROP TABLE IF EXISTS `oc_t_item_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_item_comment` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `s_title` varchar(200) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_email` varchar(100) NOT NULL,
  `s_body` text NOT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_active` tinyint(1) NOT NULL DEFAULT 0,
  `b_spam` tinyint(1) NOT NULL DEFAULT 0,
  `fk_i_user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_item_id` (`fk_i_item_id`),
  KEY `fk_i_user_id` (`fk_i_user_id`),
  CONSTRAINT `oc_t_item_comment_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  CONSTRAINT `oc_t_item_comment_ibfk_2` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_item_comment`
--

LOCK TABLES `oc_t_item_comment` WRITE;
/*!40000 ALTER TABLE `oc_t_item_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_item_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_item_description`
--

DROP TABLE IF EXISTS `oc_t_item_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_item_description` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(100) NOT NULL,
  `s_description` mediumtext NOT NULL,
  PRIMARY KEY (`fk_i_item_id`,`fk_c_locale_code`),
  FULLTEXT KEY `s_description` (`s_description`,`s_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_item_description`
--

LOCK TABLES `oc_t_item_description` WRITE;
/*!40000 ALTER TABLE `oc_t_item_description` DISABLE KEYS */;
INSERT INTO `oc_t_item_description` VALUES (1,'en_US','Example Ad','Description of the example ad. Insert here some usefull description of your ad.');
/*!40000 ALTER TABLE `oc_t_item_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_item_location`
--

DROP TABLE IF EXISTS `oc_t_item_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_item_location` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) unsigned DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) unsigned DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) unsigned DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`fk_i_item_id`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `fk_i_region_id` (`fk_i_region_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `fk_i_city_area_id` (`fk_i_city_area_id`),
  CONSTRAINT `oc_t_item_location_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  CONSTRAINT `oc_t_item_location_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  CONSTRAINT `oc_t_item_location_ibfk_3` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  CONSTRAINT `oc_t_item_location_ibfk_4` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  CONSTRAINT `oc_t_item_location_ibfk_5` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_item_location`
--

LOCK TABLES `oc_t_item_location` WRITE;
/*!40000 ALTER TABLE `oc_t_item_location` DISABLE KEYS */;
INSERT INTO `oc_t_item_location` VALUES (1,NULL,'Example country','',NULL,NULL,'Example region',NULL,'Example city',NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `oc_t_item_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_item_meta`
--

DROP TABLE IF EXISTS `oc_t_item_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_item_meta` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `fk_i_field_id` int(10) unsigned NOT NULL,
  `s_value` text DEFAULT NULL,
  `s_multi` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`fk_i_item_id`,`fk_i_field_id`,`s_multi`),
  KEY `s_value` (`s_value`(255)),
  KEY `fk_i_field_id` (`fk_i_field_id`),
  CONSTRAINT `oc_t_item_meta_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  CONSTRAINT `oc_t_item_meta_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_item_meta`
--

LOCK TABLES `oc_t_item_meta` WRITE;
/*!40000 ALTER TABLE `oc_t_item_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_item_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_item_resource`
--

DROP TABLE IF EXISTS `oc_t_item_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_item_resource` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `s_name` varchar(60) DEFAULT NULL,
  `s_extension` varchar(10) DEFAULT NULL,
  `s_content_type` varchar(40) DEFAULT NULL,
  `s_path` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_item_id` (`fk_i_item_id`),
  KEY `idx_s_content_type` (`pk_i_id`,`s_content_type`(10)),
  CONSTRAINT `oc_t_item_resource_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_item_resource`
--

LOCK TABLES `oc_t_item_resource` WRITE;
/*!40000 ALTER TABLE `oc_t_item_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_item_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_item_stats`
--

DROP TABLE IF EXISTS `oc_t_item_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_item_stats` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `i_num_views` int(10) unsigned NOT NULL DEFAULT 0,
  `i_num_spam` int(10) unsigned NOT NULL DEFAULT 0,
  `i_num_repeated` int(10) unsigned NOT NULL DEFAULT 0,
  `i_num_bad_classified` int(10) unsigned NOT NULL DEFAULT 0,
  `i_num_offensive` int(10) unsigned NOT NULL DEFAULT 0,
  `i_num_expired` int(10) unsigned NOT NULL DEFAULT 0,
  `i_num_premium_views` int(10) unsigned NOT NULL DEFAULT 0,
  `dt_date` date NOT NULL,
  PRIMARY KEY (`fk_i_item_id`,`dt_date`),
  KEY `dt_date_fk_i_item_id` (`dt_date`,`fk_i_item_id`),
  CONSTRAINT `oc_t_item_stats_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_item_stats`
--

LOCK TABLES `oc_t_item_stats` WRITE;
/*!40000 ALTER TABLE `oc_t_item_stats` DISABLE KEYS */;
INSERT INTO `oc_t_item_stats` VALUES (1,0,0,0,0,0,0,0,'2026-09-30');
/*!40000 ALTER TABLE `oc_t_item_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_keywords`
--

DROP TABLE IF EXISTS `oc_t_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_keywords` (
  `s_md5` varchar(32) NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_original_text` varchar(255) NOT NULL,
  `s_anchor_text` varchar(255) NOT NULL,
  `s_normalized_text` varchar(255) NOT NULL,
  `fk_i_category_id` int(10) unsigned DEFAULT NULL,
  `fk_i_city_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`s_md5`,`fk_c_locale_code`),
  KEY `fk_i_category_id` (`fk_i_category_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`),
  CONSTRAINT `oc_t_keywords_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  CONSTRAINT `oc_t_keywords_ibfk_2` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  CONSTRAINT `oc_t_keywords_ibfk_3` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_keywords`
--

LOCK TABLES `oc_t_keywords` WRITE;
/*!40000 ALTER TABLE `oc_t_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_latest_searches`
--

DROP TABLE IF EXISTS `oc_t_latest_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_latest_searches` (
  `d_date` datetime NOT NULL,
  `s_search` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_latest_searches`
--

LOCK TABLES `oc_t_latest_searches` WRITE;
/*!40000 ALTER TABLE `oc_t_latest_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_latest_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_locale`
--

DROP TABLE IF EXISTS `oc_t_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_locale` (
  `pk_c_code` char(5) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_short_name` varchar(40) NOT NULL,
  `s_description` varchar(100) NOT NULL,
  `s_version` varchar(20) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_url` varchar(100) NOT NULL,
  `s_currency_format` varchar(50) NOT NULL,
  `s_dec_point` varchar(2) DEFAULT '.',
  `s_thousands_sep` varchar(2) DEFAULT '',
  `i_num_dec` tinyint(4) DEFAULT 2,
  `s_date_format` varchar(20) NOT NULL,
  `s_stop_words` text DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_enabled_bo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pk_c_code`),
  UNIQUE KEY `s_short_name` (`s_short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_locale`
--

LOCK TABLES `oc_t_locale` WRITE;
/*!40000 ALTER TABLE `oc_t_locale` DISABLE KEYS */;
INSERT INTO `oc_t_locale` VALUES ('en_US','English (US)','English','American english translation','2.3','Osclass','http://osclass.org/','{NUMBER} {CURRENCY}','.','',2,'m/d/Y','i,a,about,an,are,as,at,be,by,com,for,from,how,in,is,it,of,on,or,that,the,this,to,was,what,when,where,who,will,with,the',1,1);
/*!40000 ALTER TABLE `oc_t_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_locations_tmp`
--

DROP TABLE IF EXISTS `oc_t_locations_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_locations_tmp` (
  `id_location` varchar(10) NOT NULL,
  `e_type` enum('COUNTRY','REGION','CITY') NOT NULL,
  PRIMARY KEY (`id_location`,`e_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_locations_tmp`
--

LOCK TABLES `oc_t_locations_tmp` WRITE;
/*!40000 ALTER TABLE `oc_t_locations_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_locations_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_log`
--

DROP TABLE IF EXISTS `oc_t_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_log` (
  `dt_date` datetime NOT NULL,
  `s_section` varchar(50) NOT NULL,
  `s_action` varchar(50) NOT NULL,
  `fk_i_id` int(10) unsigned NOT NULL,
  `s_data` varchar(250) NOT NULL,
  `s_ip` varchar(50) NOT NULL,
  `s_who` varchar(50) NOT NULL,
  `fk_i_who_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_log`
--

LOCK TABLES `oc_t_log` WRITE;
/*!40000 ALTER TABLE `oc_t_log` DISABLE KEYS */;
INSERT INTO `oc_t_log` VALUES ('2026-09-30 11:20:06','item','add',1,'Example Ad','','admin',0);
/*!40000 ALTER TABLE `oc_t_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_meta_categories`
--

DROP TABLE IF EXISTS `oc_t_meta_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_meta_categories` (
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `fk_i_field_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fk_i_category_id`,`fk_i_field_id`),
  KEY `fk_i_field_id` (`fk_i_field_id`),
  CONSTRAINT `oc_t_meta_categories_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  CONSTRAINT `oc_t_meta_categories_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_meta_categories`
--

LOCK TABLES `oc_t_meta_categories` WRITE;
/*!40000 ALTER TABLE `oc_t_meta_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_meta_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_meta_fields`
--

DROP TABLE IF EXISTS `oc_t_meta_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_meta_fields` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) NOT NULL,
  `s_slug` varchar(255) NOT NULL,
  `e_type` enum('TEXT','TEXTAREA','DROPDOWN','RADIO','CHECKBOX','URL','DATE','DATEINTERVAL') NOT NULL DEFAULT 'TEXT',
  `s_options` varchar(2048) DEFAULT NULL,
  `b_required` tinyint(1) NOT NULL DEFAULT 0,
  `b_searchable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_meta_fields`
--

LOCK TABLES `oc_t_meta_fields` WRITE;
/*!40000 ALTER TABLE `oc_t_meta_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_meta_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_pages`
--

DROP TABLE IF EXISTS `oc_t_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_pages` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_internal_name` varchar(50) DEFAULT NULL,
  `b_indelible` tinyint(1) NOT NULL DEFAULT 0,
  `b_link` tinyint(1) NOT NULL DEFAULT 1,
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `i_order` int(3) NOT NULL DEFAULT 0,
  `s_meta` text DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_pages`
--

LOCK TABLES `oc_t_pages` WRITE;
/*!40000 ALTER TABLE `oc_t_pages` DISABLE KEYS */;
INSERT INTO `oc_t_pages` VALUES (1,'email_item_inquiry',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(2,'email_user_validation',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(3,'email_user_registration',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(4,'email_send_friend',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(5,'alert_email_hourly',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(6,'alert_email_daily',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(7,'alert_email_weekly',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(8,'alert_email_instant',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(9,'email_new_comment_admin',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(10,'email_new_item_non_register_user',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(11,'email_item_validation',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(12,'email_admin_new_item',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(13,'email_user_forgot_password',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(14,'email_new_email',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(15,'email_alert_validation',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(16,'email_comment_validated',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(17,'email_item_validation_non_register_user',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(18,'email_admin_new_user',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(19,'email_contact_user',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(20,'email_new_comment_user',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(21,'email_new_admin',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(22,'email_warn_expiration',1,1,'2026-09-30 11:20:06',NULL,0,NULL),(23,'example_page',0,0,'2026-09-30 11:20:06','2026-09-30 11:20:06',1,'\"\"');
/*!40000 ALTER TABLE `oc_t_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_pages_description`
--

DROP TABLE IF EXISTS `oc_t_pages_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_pages_description` (
  `fk_i_pages_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(255) NOT NULL,
  `s_text` text DEFAULT NULL,
  PRIMARY KEY (`fk_i_pages_id`,`fk_c_locale_code`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`),
  CONSTRAINT `oc_t_pages_description_ibfk_1` FOREIGN KEY (`fk_i_pages_id`) REFERENCES `oc_t_pages` (`pk_i_id`),
  CONSTRAINT `oc_t_pages_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_pages_description`
--

LOCK TABLES `oc_t_pages_description` WRITE;
/*!40000 ALTER TABLE `oc_t_pages_description` DISABLE KEYS */;
INSERT INTO `oc_t_pages_description` VALUES (1,'en_US','{WEB_TITLE} - Someone has a question about your listing','<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message about your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),(2,'en_US','Please validate your {WEB_TITLE} account','<p>Hi {USER_NAME},</p><p>Please validate your registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),(3,'en_US','{WEB_TITLE} - Registration successful!','<p>Hi {USER_NAME},</p><p>You\'ve successfully registered for {WEB_LINK}.</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),(4,'en_US','Look at what I discovered on {WEB_TITLE}','<p>Hi {FRIEND_NAME},</p><p>Your friend {USER_NAME} wants to share this listing with you <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_TITLE}</p>'),(5,'en_US','{WEB_TITLE} - New listings in the last hour','<p>Hi {USER_NAME},</p><p>New listings have been published in the last hour. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),(6,'en_US','{WEB_TITLE} - New listings in the last day','<p>Hi {USER_NAME},</p><p>New listings have been published in the last day. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),(7,'en_US','{WEB_TITLE} - New listings in the last week','<p>Hi {USER_NAME},</p><p>New listings have been published in the last week. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),(8,'en_US','{WEB_TITLE} - New listings','<p>Hi {USER_NAME},</p><p>A new listing has been published, check it out!</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),(9,'en_US','{WEB_TITLE} - New comment','<p>Someone commented on the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),(10,'en_US','{WEB_TITLE} - Edit options for the listing {ITEM_TITLE}','<p>Hi {USER_NAME},</p><p>You\'re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),(11,'en_US','{WEB_TITLE} - Validate your listing','<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),(12,'en_US','{WEB_TITLE} - A new listing has been published','<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a listing has been published at {WEB_LINK}.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>You can edit this listing by clicking on the following link: {EDIT_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),(13,'en_US','{WEB_TITLE} - Recover your password','<p>Hi {USER_NAME},</p><p>We\'ve sent you this e-mail because you\'ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn\'t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),(14,'en_US','{WEB_TITLE} - You requested an email change','<p>Hi {USER_NAME}</p><p>You\'re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),(15,'en_US','{WEB_TITLE} - Please validate your alert','<p>Hi {USER_NAME},</p><p>Please validate your alert registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),(16,'en_US','{WEB_TITLE} - Your comment has been approved','<p>Hi {COMMENT_AUTHOR},</p><p>Your comment on <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> has been approved.</p><p>Regards,</p><p>{WEB_LINK}</p>'),(17,'en_US','{WEB_TITLE} - Validate your listing','<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you\'re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),(18,'en_US','{WEB_TITLE} - A new user has registered','<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),(19,'en_US','{WEB_TITLE} - Someone has a question for you','<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),(20,'en_US','{WEB_TITLE} - Someone has commented on your listing','<p>There\'s a new comment on the listing: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),(21,'en_US','{WEB_TITLE} - Success creating admin account!','<p>Hi {ADMIN_NAME},</p><p>The admin of {WEB_LINK} has created an account for you,</p><ul><li>Username: {USERNAME}</li><li>Password: {PASSWORD}</li></ul><p>You can access the admin panel here {WEB_ADMIN_LINK}.</p><p>Thank you!</p><p>Regards,</p>'),(22,'en_US','{WEB_TITLE} - Your ad is about to expire','<p>Hi {USER_NAME},</p><p>Your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> is about to expire at {WEB_LINK}.'),(23,'en_US','Example page title','This is an example page description. This is a good place to put your Terms of Service or any other help information.');
/*!40000 ALTER TABLE `oc_t_pages_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_plugin_category`
--

DROP TABLE IF EXISTS `oc_t_plugin_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_plugin_category` (
  `s_plugin_name` varchar(40) NOT NULL,
  `fk_i_category_id` int(10) unsigned NOT NULL,
  KEY `fk_i_category_id` (`fk_i_category_id`),
  CONSTRAINT `oc_t_plugin_category_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_plugin_category`
--

LOCK TABLES `oc_t_plugin_category` WRITE;
/*!40000 ALTER TABLE `oc_t_plugin_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_plugin_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_preference`
--

DROP TABLE IF EXISTS `oc_t_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_preference` (
  `s_section` varchar(128) NOT NULL,
  `s_name` varchar(128) NOT NULL,
  `s_value` longtext NOT NULL,
  `e_type` enum('STRING','INTEGER','BOOLEAN') NOT NULL,
  UNIQUE KEY `s_section` (`s_section`,`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_preference`
--

LOCK TABLES `oc_t_preference` WRITE;
/*!40000 ALTER TABLE `oc_t_preference` DISABLE KEYS */;
INSERT INTO `oc_t_preference` VALUES ('osclass','active_plugins','','STRING'),('osclass','admin_language','en_US','STRING'),('osclass','admin_theme','modern','STRING'),('osclass','akismetKey','','STRING'),('osclass','allowedExt','png,gif,jpg,jpeg','STRING'),('osclass','allow_report_osclass','0','BOOLEAN'),('osclass','auto_cron','1','BOOLEAN'),('osclass','auto_update','disabled','STRING'),('osclass','comments_per_page','10','INTEGER'),('osclass','contactEmail','admin@example.com','STRING'),('osclass','contact_attachment','0','BOOLEAN'),('osclass','csrf_name','CSRF1155175832','STRING'),('osclass','currency','USD','STRING'),('osclass','dateFormat','F j, Y','STRING'),('osclass','defaultOrderField@search','dt_pub_date','STRING'),('osclass','defaultOrderType@search','1','BOOLEAN'),('osclass','defaultResultsPerPage@search','12','INTEGER'),('osclass','defaultShowAs@search','list','STRING'),('osclass','description_character_length','5000','INTEGER'),('osclass','dimNormal','640x480','STRING'),('osclass','dimPreview','480x340','STRING'),('osclass','dimThumbnail','240x200','STRING'),('osclass','enabled_comments','1','BOOLEAN'),('osclass','enabled_recaptcha_items','0','BOOLEAN'),('osclass','enabled_users','1','BOOLEAN'),('osclass','enabled_user_registration','1','BOOLEAN'),('osclass','enabled_user_validation','1','BOOLEAN'),('osclass','enableField#f_price@items','1','BOOLEAN'),('osclass','enableField#images@items','1','BOOLEAN'),('osclass','force_aspect_image','0','BOOLEAN'),('osclass','installed_plugins','','STRING'),('osclass','items_wait_time','0','INTEGER'),('osclass','item_attachment','0','BOOLEAN'),('osclass','keep_original_image','1','BOOLEAN'),('osclass','language','en_US','STRING'),('osclass','last_version_check','','STRING'),('osclass','logged_user_item_validation','1','BOOLEAN'),('osclass','mailserver_auth','','BOOLEAN'),('osclass','mailserver_host','localhost','STRING'),('osclass','mailserver_mail_from','','STRING'),('osclass','mailserver_name_from','','STRING'),('osclass','mailserver_password','','STRING'),('osclass','mailserver_pop','','BOOLEAN'),('osclass','mailserver_port','','INTEGER'),('osclass','mailserver_ssl','','STRING'),('osclass','mailserver_type','custom','STRING'),('osclass','mailserver_username','','STRING'),('osclass','marketAllowExternalSources','0','BOOLEAN'),('osclass','marketAPIConnect','','STRING'),('osclass','marketCategories','','STRING'),('osclass','marketDataUpdate','0','INTEGER'),('osclass','marketURL','https://market.osclass.org/api/v3/','STRING'),('osclass','maxLatestItems@home','12','INTEGER'),('osclass','maxResultsPerPage@search','50','INTEGER'),('osclass','maxSizeKb','2048','INTEGER'),('osclass','moderate_comments','0','INTEGER'),('osclass','moderate_items','-1','INTEGER'),('osclass','mod_rewrite_loaded','0','BOOLEAN'),('osclass','notify_contact_friends','1','BOOLEAN'),('osclass','notify_contact_item','1','BOOLEAN'),('osclass','notify_new_comment','1','BOOLEAN'),('osclass','notify_new_comment_user','0','BOOLEAN'),('osclass','notify_new_item','1','BOOLEAN'),('osclass','notify_new_user','1','BOOLEAN'),('osclass','numImages@items','4','INTEGER'),('osclass','num_rss_items','50','INTEGER'),('osclass','osclass_installed','1','BOOLEAN'),('osclass','pageDesc','','STRING'),('osclass','pageTitle','Osclass','STRING'),('osclass','purge_latest_searches','1000','STRING'),('osclass','recaptchaPrivKey','','STRING'),('osclass','recaptchaPubKey','','STRING'),('osclass','recaptcha_version','2','STRING'),('osclass','reg_user_can_contact','0','BOOLEAN'),('osclass','reg_user_post','0','BOOLEAN'),('osclass','reg_user_post_comments','0','BOOLEAN'),('osclass','rewriteEnabled','0','BOOLEAN'),('osclass','rewrite_cat_url','{CATEGORIES}','STRING'),('osclass','rewrite_contact','contact','STRING'),('osclass','rewrite_feed','feed','STRING'),('osclass','rewrite_item_activate','item/activate','STRING'),('osclass','rewrite_item_contact','item/contact','STRING'),('osclass','rewrite_item_delete','item/delete','STRING'),('osclass','rewrite_item_edit','item/edit','STRING'),('osclass','rewrite_item_mark','item/mark','STRING'),('osclass','rewrite_item_new','item/new','STRING'),('osclass','rewrite_item_resource_delete','resource/delete','STRING'),('osclass','rewrite_item_send_friend','item/send-friend','STRING'),('osclass','rewrite_item_url','{CATEGORIES}/{ITEM_TITLE}_i{ITEM_ID}','STRING'),('osclass','rewrite_language','language','STRING'),('osclass','rewrite_page_url','{PAGE_SLUG}-p{PAGE_ID}','STRING'),('osclass','rewrite_rules','','STRING'),('osclass','rewrite_search_category','category','STRING'),('osclass','rewrite_search_city','city','STRING'),('osclass','rewrite_search_city_area','cityarea','STRING'),('osclass','rewrite_search_country','country','STRING'),('osclass','rewrite_search_pattern','pattern','STRING'),('osclass','rewrite_search_region','region','STRING'),('osclass','rewrite_search_url','search','STRING'),('osclass','rewrite_search_user','user','STRING'),('osclass','rewrite_user_activate','user/activate','STRING'),('osclass','rewrite_user_activate_alert','alert/confirm','STRING'),('osclass','rewrite_user_alerts','user/alerts','STRING'),('osclass','rewrite_user_change_email','email/change','STRING'),('osclass','rewrite_user_change_email_confirm','email/confirm','STRING'),('osclass','rewrite_user_change_password','password/change','STRING'),('osclass','rewrite_user_change_username','username/change','STRING'),('osclass','rewrite_user_dashboard','user/dashboard','STRING'),('osclass','rewrite_user_forgot','user/forgot','STRING'),('osclass','rewrite_user_items','user/items','STRING'),('osclass','rewrite_user_login','user/login','STRING'),('osclass','rewrite_user_logout','user/logout','STRING'),('osclass','rewrite_user_profile','user/profile','STRING'),('osclass','rewrite_user_recover','user/recover','STRING'),('osclass','rewrite_user_register','user/register','STRING'),('osclass','save_latest_searches','0','BOOLEAN'),('osclass','selectable_parent_categories','0','BOOLEAN'),('osclass','seo_url_search_prefix','','STRING'),('osclass','subdomain_host','','STRING'),('osclass','subdomain_type','','STRING'),('osclass','theme','bender','STRING'),('osclass','timeFormat','g:i a','STRING'),('osclass','timezone','Europe/Madrid','STRING'),('osclass','title_character_length','100','INTEGER'),('osclass','update_core_json','','STRING'),('osclass','username_blacklist','admin,user','STRING'),('osclass','use_imagick','0','BOOLEAN'),('osclass','version','375','INTEGER'),('osclass','warn_expiration','0','INTEGER'),('osclass','watermark_image','','STRING'),('osclass','watermark_place','centre','STRING'),('osclass','watermark_text','','STRING'),('osclass','watermark_text_color','','STRING'),('osclass','weekStart','0','STRING');
/*!40000 ALTER TABLE `oc_t_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_region`
--

DROP TABLE IF EXISTS `oc_t_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_region` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_c_country_code` char(2) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `idx_s_name` (`s_name`),
  KEY `idx_s_slug` (`s_slug`),
  CONSTRAINT `oc_t_region_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_region`
--

LOCK TABLES `oc_t_region` WRITE;
/*!40000 ALTER TABLE `oc_t_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_region_stats`
--

DROP TABLE IF EXISTS `oc_t_region_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_region_stats` (
  `fk_i_region_id` int(10) unsigned NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`fk_i_region_id`),
  KEY `idx_num_items` (`i_num_items`),
  CONSTRAINT `oc_t_region_stats_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_region_stats`
--

LOCK TABLES `oc_t_region_stats` WRITE;
/*!40000 ALTER TABLE `oc_t_region_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_region_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_user`
--

DROP TABLE IF EXISTS `oc_t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_user` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dt_reg_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(100) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `s_email` varchar(100) NOT NULL,
  `s_website` varchar(100) DEFAULT NULL,
  `s_phone_land` varchar(45) DEFAULT NULL,
  `s_phone_mobile` varchar(45) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_active` tinyint(1) NOT NULL DEFAULT 0,
  `s_pass_code` varchar(100) DEFAULT NULL,
  `s_pass_date` datetime DEFAULT NULL,
  `s_pass_ip` varchar(15) DEFAULT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) unsigned DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) unsigned DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) unsigned DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL,
  `b_company` tinyint(1) NOT NULL DEFAULT 0,
  `i_items` int(10) unsigned DEFAULT 0,
  `i_comments` int(10) unsigned DEFAULT 0,
  `dt_access_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `s_access_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_i_id`),
  UNIQUE KEY `s_email` (`s_email`),
  KEY `idx_s_name` (`s_name`(6)),
  KEY `idx_s_username` (`s_username`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `fk_i_region_id` (`fk_i_region_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `fk_i_city_area_id` (`fk_i_city_area_id`),
  CONSTRAINT `oc_t_user_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  CONSTRAINT `oc_t_user_ibfk_2` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  CONSTRAINT `oc_t_user_ibfk_3` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  CONSTRAINT `oc_t_user_ibfk_4` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_user`
--

LOCK TABLES `oc_t_user` WRITE;
/*!40000 ALTER TABLE `oc_t_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_user_description`
--

DROP TABLE IF EXISTS `oc_t_user_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_user_description` (
  `fk_i_user_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_info` text DEFAULT NULL,
  PRIMARY KEY (`fk_i_user_id`,`fk_c_locale_code`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`),
  CONSTRAINT `oc_t_user_description_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  CONSTRAINT `oc_t_user_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_user_description`
--

LOCK TABLES `oc_t_user_description` WRITE;
/*!40000 ALTER TABLE `oc_t_user_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_user_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_user_email_tmp`
--

DROP TABLE IF EXISTS `oc_t_user_email_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_user_email_tmp` (
  `fk_i_user_id` int(10) unsigned NOT NULL,
  `s_new_email` varchar(100) NOT NULL,
  `dt_date` datetime NOT NULL,
  PRIMARY KEY (`fk_i_user_id`),
  CONSTRAINT `oc_t_user_email_tmp_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_user_email_tmp`
--

LOCK TABLES `oc_t_user_email_tmp` WRITE;
/*!40000 ALTER TABLE `oc_t_user_email_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_user_email_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_t_widget`
--

DROP TABLE IF EXISTS `oc_t_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_t_widget` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_description` varchar(40) NOT NULL,
  `s_location` varchar(40) NOT NULL,
  `e_kind` enum('TEXT','HTML') NOT NULL,
  `s_content` mediumtext NOT NULL,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_t_widget`
--

LOCK TABLES `oc_t_widget` WRITE;
/*!40000 ALTER TABLE `oc_t_widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_widget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 11:20:29
