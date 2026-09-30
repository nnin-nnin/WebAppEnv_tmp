/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: thelia
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
-- Table structure for table `accessory`
--

DROP TABLE IF EXISTS `accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `accessory` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_address_product_id` (`product_id`),
  KEY `idx_address_accessory` (`accessory`),
  CONSTRAINT `fk_accessory_accessory` FOREIGN KEY (`accessory`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_accessory_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessory`
--

LOCK TABLES `accessory` WRITE;
/*!40000 ALTER TABLE `accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `address3` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_address_customer_id` (`customer_id`),
  KEY `idx_address_customer_title_id` (`title_id`),
  KEY `idx_address_country_id` (`country_id`),
  KEY `fk_address_state_id_idx` (`state_id`),
  CONSTRAINT `fk_address_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `fk_address_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_address_customer_title_id` FOREIGN KEY (`title_id`) REFERENCES `customer_title` (`id`),
  CONSTRAINT `fk_address_state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `locale` varchar(45) NOT NULL,
  `algo` varchar(128) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `remember_me_token` varchar(255) DEFAULT NULL,
  `remember_me_serial` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password_renew_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `idx_admin_profile_id` (`profile_id`),
  CONSTRAINT `fk_admin_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,NULL,'Admin','Admin','admin','$2y$10$SW5qMLtzg7RT8u4VotDnE.MqBjLhw4wHWAOvU/6CC7QrbUsZLNAD6','en_US','PASSWORD_BCRYPT',NULL,NULL,'6abd13fb18e64','admin@example.com',NULL,'2026-09-30 13:51:55','2026-09-30 13:51:55');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_log`
--

DROP TABLE IF EXISTS `admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_login` varchar(255) DEFAULT NULL,
  `admin_firstname` varchar(255) DEFAULT NULL,
  `admin_lastname` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `request` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_log`
--

LOCK TABLES `admin_log` WRITE;
/*!40000 ALTER TABLE `admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api`
--

DROP TABLE IF EXISTS `api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `api_key` varchar(100) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_api_profile_id` (`profile_id`),
  CONSTRAINT `fk_api_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api`
--

LOCK TABLES `api` WRITE;
/*!40000 ALTER TABLE `api` DISABLE KEYS */;
/*!40000 ALTER TABLE `api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `postage` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'France',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,'A Zone',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,'B Zone',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,'C Zone',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,'France OM1',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,'France OM2',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,'Europe',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(8,'North America',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(9,'Asia',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(10,'Africa',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(11,'Oceania',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(12,'South America',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(13,'Europe (non-EU)',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(14,'Central America/Antilla',NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_delivery_module`
--

DROP TABLE IF EXISTS `area_delivery_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_delivery_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) NOT NULL,
  `delivery_module_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_id_delivery_module_id_UNIQUE` (`area_id`,`delivery_module_id`),
  KEY `idx_area_delivery_module_area_id` (`area_id`),
  KEY `idx_area_delivery_module_delivery_module_id_idx` (`delivery_module_id`),
  CONSTRAINT `fk_area_delivery_module_area_id` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE,
  CONSTRAINT `idx_area_delivery_module_delivery_module_id` FOREIGN KEY (`delivery_module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_delivery_module`
--

LOCK TABLES `area_delivery_module` WRITE;
/*!40000 ALTER TABLE `area_delivery_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_delivery_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_av`
--

DROP TABLE IF EXISTS `attribute_av`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_av` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute_av_attribute_id` (`attribute_id`),
  CONSTRAINT `fk_attribute_av_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_av`
--

LOCK TABLES `attribute_av` WRITE;
/*!40000 ALTER TABLE `attribute_av` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_av` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_av_i18n`
--

DROP TABLE IF EXISTS `attribute_av_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_av_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `attribute_av_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `attribute_av` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_av_i18n`
--

LOCK TABLES `attribute_av_i18n` WRITE;
/*!40000 ALTER TABLE `attribute_av_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_av_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_combination`
--

DROP TABLE IF EXISTS `attribute_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_combination` (
  `attribute_id` int(11) NOT NULL,
  `attribute_av_id` int(11) NOT NULL,
  `product_sale_elements_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_av_id`,`product_sale_elements_id`),
  KEY `idx_attribute_combination_attribute_id` (`attribute_id`),
  KEY `idx_attribute_combination_attribute_av_id` (`attribute_av_id`),
  KEY `idx_attribute_combination_product_sale_elements_id` (`product_sale_elements_id`),
  CONSTRAINT `fk_attribute_combination_attribute_av_id` FOREIGN KEY (`attribute_av_id`) REFERENCES `attribute_av` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_attribute_combination_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_attribute_combination_product_sale_elements_id` FOREIGN KEY (`product_sale_elements_id`) REFERENCES `product_sale_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_combination`
--

LOCK TABLES `attribute_combination` WRITE;
/*!40000 ALTER TABLE `attribute_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_i18n`
--

DROP TABLE IF EXISTS `attribute_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `attribute_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_i18n`
--

LOCK TABLES `attribute_i18n` WRITE;
/*!40000 ALTER TABLE `attribute_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_template`
--

DROP TABLE IF EXISTS `attribute_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attribute_template_id` (`attribute_id`),
  KEY `fk_attribute_template_idx` (`template_id`),
  CONSTRAINT `fk_attribute_template` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_attribute_template_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_template`
--

LOCK TABLES `attribute_template` WRITE;
/*!40000 ALTER TABLE `attribute_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visible` tinyint(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `logo_image_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brand_brand_image_idx` (`logo_image_id`),
  CONSTRAINT `fk_logo_image_id_brand_image` FOREIGN KEY (`logo_image_id`) REFERENCES `brand_image` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_document`
--

DROP TABLE IF EXISTS `brand_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_brand_document_brand_id` (`brand_id`),
  CONSTRAINT `fk_brand_document_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_document`
--

LOCK TABLES `brand_document` WRITE;
/*!40000 ALTER TABLE `brand_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_document_i18n`
--

DROP TABLE IF EXISTS `brand_document_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_document_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `brand_document_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `brand_document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_document_i18n`
--

LOCK TABLES `brand_document_i18n` WRITE;
/*!40000 ALTER TABLE `brand_document_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_document_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_i18n`
--

DROP TABLE IF EXISTS `brand_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `brand_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `brand` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_i18n`
--

LOCK TABLES `brand_i18n` WRITE;
/*!40000 ALTER TABLE `brand_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_image`
--

DROP TABLE IF EXISTS `brand_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_brand_image_brand_id` (`brand_id`),
  CONSTRAINT `fk_brand_image_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_image`
--

LOCK TABLES `brand_image` WRITE;
/*!40000 ALTER TABLE `brand_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_image_i18n`
--

DROP TABLE IF EXISTS `brand_image_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_image_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `brand_image_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `brand_image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_image_i18n`
--

LOCK TABLES `brand_image_i18n` WRITE;
/*!40000 ALTER TABLE `brand_image_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_image_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address_delivery_id` int(11) DEFAULT NULL,
  `address_invoice_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `discount` decimal(16,6) DEFAULT 0.000000,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`),
  KEY `idx_cart_customer_id` (`customer_id`),
  KEY `idx_cart_address_delivery_id` (`address_delivery_id`),
  KEY `idx_cart_address_invoice_id` (`address_invoice_id`),
  KEY `idx_cart_currency_id` (`currency_id`),
  CONSTRAINT `fk_cart_address_delivery_id` FOREIGN KEY (`address_delivery_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_cart_address_invoice_id` FOREIGN KEY (`address_invoice_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_cart_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float DEFAULT 1,
  `product_sale_elements_id` int(11) NOT NULL,
  `price` decimal(16,6) DEFAULT 0.000000,
  `promo_price` decimal(16,6) DEFAULT 0.000000,
  `price_end_of_life` datetime DEFAULT NULL,
  `promo` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cart_item_cart_id` (`cart_id`),
  KEY `idx_cart_item_product_id` (`product_id`),
  KEY `idx_cart_item_product_sale_elements_id` (`product_sale_elements_id`),
  CONSTRAINT `fk_cart_item_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_item_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_item_product_sale_elements_id` FOREIGN KEY (`product_sale_elements_id`) REFERENCES `product_sale_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL,
  `position` int(11) NOT NULL,
  `default_template_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_parent` (`parent`),
  KEY `idx_parent_position` (`parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_associated_content`
--

DROP TABLE IF EXISTS `category_associated_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_associated_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_associated_content_category_id` (`category_id`),
  KEY `idx_category_associated_content_content_id` (`content_id`),
  CONSTRAINT `fk_category_associated_content_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_category_associated_content_content_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_associated_content`
--

LOCK TABLES `category_associated_content` WRITE;
/*!40000 ALTER TABLE `category_associated_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_associated_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_document`
--

DROP TABLE IF EXISTS `category_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_document_category_id` (`category_id`),
  CONSTRAINT `fk_catgory_document_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_document`
--

LOCK TABLES `category_document` WRITE;
/*!40000 ALTER TABLE `category_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_document_i18n`
--

DROP TABLE IF EXISTS `category_document_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_document_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `category_document_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `category_document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_document_i18n`
--

LOCK TABLES `category_document_i18n` WRITE;
/*!40000 ALTER TABLE `category_document_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_document_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_i18n`
--

DROP TABLE IF EXISTS `category_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `category_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_i18n`
--

LOCK TABLES `category_i18n` WRITE;
/*!40000 ALTER TABLE `category_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_image`
--

DROP TABLE IF EXISTS `category_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_image_category_id` (`category_id`),
  KEY `idx_category_image_category_id_position` (`category_id`,`position`),
  CONSTRAINT `fk_category_image_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_image`
--

LOCK TABLES `category_image` WRITE;
/*!40000 ALTER TABLE `category_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_image_i18n`
--

DROP TABLE IF EXISTS `category_image_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_image_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `category_image_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `category_image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_image_i18n`
--

LOCK TABLES `category_image_i18n` WRITE;
/*!40000 ALTER TABLE `category_image_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_image_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_version`
--

DROP TABLE IF EXISTS `category_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_version` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL,
  `position` int(11) NOT NULL,
  `default_template_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  CONSTRAINT `category_version_FK_1` FOREIGN KEY (`id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_version`
--

LOCK TABLES `category_version` WRITE;
/*!40000 ALTER TABLE `category_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `secured` tinyint(4) NOT NULL DEFAULT 1,
  `hidden` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'check-available-stock','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,'active-front-template','default',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,'active-admin-template','default',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,'active-pdf-template','default',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,'active-mail-template','default',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,'rewriting_enable','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,'imagine_graphic_driver','gd',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(8,'default_images_quality_percent','90',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(9,'original_image_delivery_mode','symlink',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(10,'original_document_delivery_mode','symlink',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(11,'images_library_path','local/media/images',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(12,'documents_library_path','local/media/documents',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(13,'image_cache_dir_from_web_root','cache/images',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(14,'document_cache_dir_from_web_root','cache/documents',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(15,'page_not_found_view','404.html',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(16,'obsolete_rewriten_url_view','obsolete-rewritten-url',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(17,'use_tax_free_amounts','0',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(18,'process_assets','0',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(19,'thelia_admin_remember_me_cookie_name','tarmcn',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(20,'thelia_admin_remember_me_cookie_expiration','2592000',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(21,'thelia_customer_remember_me_cookie_name','tcrmcn',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(22,'thelia_customer_remember_me_cookie_expiration','31536000',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(23,'url_site','',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(24,'pdf_invoice_file','invoice',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(25,'pdf_delivery_file','delivery',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(26,'unknown-flag-path','assets/img/flags/unknown.png',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(27,'html_output_trim_level','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(28,'default_available_stock','100',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(29,'information_folder_id','',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(30,'terms_conditions_content_id','',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(31,'allow_negative_stock','0',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(32,'cart.use_persistent_cookie','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(33,'cart.cookie_name','thelia_cart',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(34,'cart.cookie_lifetime','31536060',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(35,'session_config.lifetime','0',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(36,'session_config.default','1',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(37,'default_lang_without_translation','1',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(38,'store_name','',0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(39,'store_description','',0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(40,'store_email','',0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(41,'store_notification_emails','',0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(42,'one_domain_foreach_lang','0',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(43,'thelia_version','2.5.4',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(44,'thelia_major_version','2',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(45,'thelia_minus_version','5',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(46,'thelia_release_version','4',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(47,'thelia_extra_version','',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(48,'front_cart_country_cookie_name','fcccn',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(49,'front_cart_country_cookie_expires','2592000',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(50,'sitemap_ttl','7200',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(51,'feed_ttl','7200',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(52,'form_firewall_bruteforce_time_to_wait','10',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(53,'form_firewall_time_to_wait','60',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(54,'form_firewall_bruteforce_attempts','10',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(55,'form_firewall_attempts','6',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(56,'form_firewall_active','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(57,'allow_slash_ended_uri','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(58,'error_message.show','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(59,'error_message.page_name','error.html',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(60,'customer_change_email','0',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(61,'customer_confirm_email','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(62,'form.secret','0d06ce550d240cbc133b8156ac0961cb',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(63,'minimum_admin_password_length','4',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(64,'enable_lost_admin_password_recovery','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(65,'notify_newsletter_subscription','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(66,'number_default_results_per_page.product_list','20',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(67,'number_default_results_per_page.order_list','20',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(68,'number_default_results_per_page.customer_list','20',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(69,'customer_email_confirmation','0',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(70,'number_default_results_per_page.coupon_list','20',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(71,'cdn.documents-base-url','',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(72,'cdn.assets-base-url','',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(73,'allow_module_zip_install','1',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_i18n`
--

DROP TABLE IF EXISTS `config_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `config_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `config` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_i18n`
--

LOCK TABLES `config_i18n` WRITE;
/*!40000 ALTER TABLE `config_i18n` DISABLE KEYS */;
INSERT INTO `config_i18n` VALUES (1,'cs_CZ',NULL,NULL,NULL,NULL),(1,'de_DE','Verfügbaren Lagerbestand prüfen (1) oder ignorieren (0) beim Anzeigen und Änderung der bestellte Menge',NULL,NULL,NULL),(1,'en_US','Check available product stock (1) or ignore it (0) when displaying and changing ordered quantity',NULL,NULL,NULL),(1,'es_ES','Comprobar disponibilidad de stock de producto (1) o ignorar (0) cuando se muestra o cambia cantidad en pedido',NULL,NULL,NULL),(1,'fr_FR','Vérifier la présence de produits en stock (1) ou l\'ignorer (0) lors de l\'affichage et la modification des quantités commandées',NULL,NULL,NULL),(1,'it_IT',NULL,NULL,NULL,NULL),(1,'ru_RU','Проверять доступный запас товара (1) или игнорировать его (0) при отображении и изменении количества в заказе',NULL,NULL,NULL),(2,'cs_CZ',NULL,NULL,NULL,NULL),(2,'de_DE','Name der aktiven Front Office Template',NULL,NULL,NULL),(2,'en_US','Name of the active front-office template',NULL,NULL,NULL),(2,'es_ES','Nombre de la plantilla activa de recepción',NULL,NULL,NULL),(2,'fr_FR','Nom du modèle de front-office actif',NULL,NULL,NULL),(2,'it_IT',NULL,NULL,NULL,NULL),(2,'ru_RU','Имя активного шаблона магазина',NULL,NULL,NULL),(3,'cs_CZ',NULL,NULL,NULL,NULL),(3,'de_DE','Name der aktiven Back Office Template',NULL,NULL,NULL),(3,'en_US','Name of the active back-office template',NULL,NULL,NULL),(3,'es_ES','Nombe de la plantilla del administrador activo',NULL,NULL,NULL),(3,'fr_FR','Nom du modèle de back-office actif',NULL,NULL,NULL),(3,'it_IT',NULL,NULL,NULL,NULL),(3,'ru_RU','Имя активного шаблона админки',NULL,NULL,NULL),(4,'cs_CZ',NULL,NULL,NULL,NULL),(4,'de_DE','Name der aktiven PDF Template',NULL,NULL,NULL),(4,'en_US','Name of the active PDF template',NULL,NULL,NULL),(4,'es_ES','Nombre de la plantilla PDF activa',NULL,NULL,NULL),(4,'fr_FR','Nom du modèle PDF actif',NULL,NULL,NULL),(4,'it_IT',NULL,NULL,NULL,NULL),(4,'ru_RU','Имя активного шаблона для PDF',NULL,NULL,NULL),(5,'cs_CZ',NULL,NULL,NULL,NULL),(5,'de_DE','Name der aktiven E-Mail Template',NULL,NULL,NULL),(5,'en_US','Name of the active mailing template',NULL,NULL,NULL),(5,'es_ES','Nombre de la plantilla de correo activa',NULL,NULL,NULL),(5,'fr_FR','Nom du modèle d\'e-mail actif',NULL,NULL,NULL),(5,'it_IT',NULL,NULL,NULL,NULL),(5,'ru_RU','Имя активного шаблона рассылок',NULL,NULL,NULL),(6,'cs_CZ',NULL,NULL,NULL,NULL),(6,'de_DE','Aktivieren (1) oder deaktivieren (0) URL Überschreibung',NULL,NULL,NULL),(6,'en_US','Enable (1) or disable (0) URL rewriting',NULL,NULL,NULL),(6,'es_ES','Activar(1) o desactivar(0) reescritura de URL',NULL,NULL,NULL),(6,'fr_FR','Activer (1) ou désactiver (0) la réécriture d\'URL',NULL,NULL,NULL),(6,'it_IT',NULL,NULL,NULL,NULL),(6,'ru_RU','Вкл (1) или Выкл (0) URL rewriting',NULL,NULL,NULL),(7,'cs_CZ',NULL,NULL,NULL,NULL),(7,'de_DE','Name des Grafik-Treibers, der von der Imagine-Bibliothek verwendet wird (siehe https://imagine.readthedocs.org)',NULL,NULL,NULL),(7,'en_US','Name of the graphic driver used by the Imagine library (see https://imagine.readthedocs.org)',NULL,NULL,NULL),(7,'es_ES','Nombre del controlador gráfico usado por la Librería Imagine (ver https://imagine.readthedocs.org)',NULL,NULL,NULL),(7,'fr_FR','Nom du pilote graphique utilisé par la bibliothèque Imagine (voir https://imagine.readthedocs.org)',NULL,NULL,NULL),(7,'it_IT',NULL,NULL,NULL,NULL),(7,'ru_RU','Имя графического драйвера используемого библиотекой Imagine (см. https://imagine.readthedocs.org)',NULL,NULL,NULL),(8,'cs_CZ',NULL,NULL,NULL,NULL),(8,'de_DE','Die Standardqualität (in%) der erzeugten Bilder',NULL,NULL,NULL),(8,'en_US','The default quality (in %) of the generated images',NULL,NULL,NULL),(8,'es_ES','La calidad por defecto (en %) de las imágenes generadas',NULL,NULL,NULL),(8,'fr_FR','La qualité par défaut (en %) dans les images générées',NULL,NULL,NULL),(8,'it_IT',NULL,NULL,NULL,NULL),(8,'ru_RU','Качество (в %) генерируемых изображений',NULL,NULL,NULL),(9,'cs_CZ',NULL,NULL,NULL,NULL),(9,'de_DE','Wie werden die Originalbilder (volle Auflösung) im Webspace ausgeliefert (symlink or copy)',NULL,NULL,NULL),(9,'en_US','How original (full resolution) images are delivered in the web space (symlink or copy)',NULL,NULL,NULL),(9,'es_ES','Cómo se entregan imágenes originales (resolución completa) en el espacio de la web (enlace o copia)',NULL,NULL,NULL),(9,'fr_FR','Comment les images originales (pleine résolution) sont-elles fournises dans l\'espace web (lien symbolique ou copie)',NULL,NULL,NULL),(9,'it_IT',NULL,NULL,NULL,NULL),(9,'ru_RU','Способ доставки оригинальных изображений в web директорию (symlink или copy)',NULL,NULL,NULL),(10,'cs_CZ',NULL,NULL,NULL,NULL),(10,'de_DE','Wie werden Dokumentdateien im Webspace (Symlink oder Kopie) ausgeliefert',NULL,NULL,NULL),(10,'en_US','How document files are delivered in the web space (symlink or copy)',NULL,NULL,NULL),(10,'es_ES','Cómo los documento son enviados en el espacio de la web (enlace o copia)',NULL,NULL,NULL),(10,'fr_FR','Comment les documents sont-ils fournis dans l\'espace web (lien symbolique ou copie)',NULL,NULL,NULL),(10,'it_IT',NULL,NULL,NULL,NULL),(10,'ru_RU','Способ доставки документов в web директорию (symlink или copy)',NULL,NULL,NULL),(11,'cs_CZ',NULL,NULL,NULL,NULL),(11,'de_DE','Pfad zu dem Verzeichnis, in dem Bilder gespeichert sind',NULL,NULL,NULL),(11,'en_US','Path to the directory where images are stored',NULL,NULL,NULL),(11,'es_ES','Ruta al directorio donde las imágenes estén guardadas',NULL,NULL,NULL),(11,'fr_FR','Chemin vers le répertoire où les images sont stockées',NULL,NULL,NULL),(11,'it_IT',NULL,NULL,NULL,NULL),(11,'ru_RU','Путь до директории где хранятся изображения',NULL,NULL,NULL),(12,'cs_CZ',NULL,NULL,NULL,NULL),(12,'de_DE','Pfad zu dem Verzeichnis, in dem Dokumente gespeichert sind',NULL,NULL,NULL),(12,'en_US','Path to the directory where documents are stored',NULL,NULL,NULL),(12,'es_ES','Ruta al directorio donde los documentos estén guardados',NULL,NULL,NULL),(12,'fr_FR','Chemin vers le répertoire où sont stockés les documents',NULL,NULL,NULL),(12,'it_IT',NULL,NULL,NULL,NULL),(12,'ru_RU','Путь до дериктории где хранятся документы',NULL,NULL,NULL),(13,'cs_CZ',NULL,NULL,NULL,NULL),(13,'de_DE','Der Pfad zum Bild-Cache-Verzeichnis in dem Web-Space',NULL,NULL,NULL),(13,'en_US','The path to the image cache directory in the web space',NULL,NULL,NULL),(13,'es_ES','La ruta de acceso para el directorio de caché de imagen en el espacio web',NULL,NULL,NULL),(13,'fr_FR','Chemin vers le répertoire de cache d\'images dans l\'espace web',NULL,NULL,NULL),(13,'it_IT',NULL,NULL,NULL,NULL),(13,'ru_RU','Путь до кеша изобрежений относительно web директории',NULL,NULL,NULL),(14,'cs_CZ',NULL,NULL,NULL,NULL),(14,'de_DE','Der Pfad zum Dokument-Cache-Verzeichnis in dem Web-Space',NULL,NULL,NULL),(14,'en_US','The path to the document cache directory in the web space',NULL,NULL,NULL),(14,'es_ES','La ruta al directorio de caché de documentos en el espacio web',NULL,NULL,NULL),(14,'fr_FR','Chemin d\'accès au répertoire de cache de documents dans l\'espace web',NULL,NULL,NULL),(14,'it_IT',NULL,NULL,NULL,NULL),(14,'ru_RU','Путь до кеша документов относительно web директории',NULL,NULL,NULL),(15,'cs_CZ',NULL,NULL,NULL,NULL),(15,'de_DE','Name der Seite 404 (unauffindbar) in dem aktuellen Modell (mit der Dateinamenerweiterung 404.html zum Beispiel)',NULL,NULL,NULL),(15,'en_US','File name of the 404 (not found) view in the current template (with extension, e.g. 404.html)',NULL,NULL,NULL),(15,'es_ES','Nombre de archivo de la vista 404 (no encontrado) en la plantilla actual (con la extensión, ej: 404.html)',NULL,NULL,NULL),(15,'fr_FR','Nom de la page 404 (introuvable) dans le modèle actuel (avec l\'extension, par exemple, 404.html)',NULL,NULL,NULL),(15,'it_IT',NULL,NULL,NULL,NULL),(15,'ru_RU','Имя файла страницы 404 (не найден) в текущем шаблоне (с расширением, например 404.html)',NULL,NULL,NULL),(16,'cs_CZ',NULL,NULL,NULL,NULL),(16,'de_DE','Name des Templates zurückgegeben, wenn eine veraltete (oder inaktive) Produkt-URL aufgerufen wird',NULL,NULL,NULL),(16,'en_US','Name of the template view returned when an obsolete (or inactive) product URL is invoked',NULL,NULL,NULL),(16,'es_ES','Nombre de la plantilla regresada cuando se llama una URL obsoleta (o inactiva) de un producto',NULL,NULL,NULL),(16,'fr_FR','Nom de la page du modèle retournée lorsqu\'une URL obsolète (ou inactive) est invoquée',NULL,NULL,NULL),(16,'it_IT',NULL,NULL,NULL,NULL),(16,'ru_RU','Имя страницы шаблона возвращаемой при вызове заброшеного (или не активного) URL товара',NULL,NULL,NULL),(17,'cs_CZ',NULL,NULL,NULL,NULL),(17,'de_DE','Anzeigt und verwendet Preise mit (0) oder ohne (1) Taxen',NULL,NULL,NULL),(17,'en_US','Display and process prices with (0) or without (1) taxes.',NULL,NULL,NULL),(17,'es_ES','Mostrar y procesar precios con (0) o sin (1) impuestos.',NULL,NULL,NULL),(17,'fr_FR','Affiche et traite les prix avec(0) ou sans (1) les taxes',NULL,NULL,NULL),(17,'it_IT',NULL,NULL,NULL,NULL),(17,'ru_RU','Отображать и обрабатывать цены с (0) или без (1) налогов.',NULL,NULL,NULL),(18,'cs_CZ',NULL,NULL,NULL,NULL),(18,'de_DE','Template Assets automatisch bei Codeänderungen kompilieren? (1 = ja, 0 = nein)',NULL,NULL,NULL),(18,'en_US','Compile templates assets automatically upon asset source change (1 = yes, 0 = no)',NULL,NULL,NULL),(18,'es_ES','Compilar las plantillas automáticamente en cada cambio de código fuente (1 = sí, 2 = no)',NULL,NULL,NULL),(18,'fr_FR','Compiler les resources du modèle actif à chaque changement (1 = oui, 2 = non)',NULL,NULL,NULL),(18,'it_IT',NULL,NULL,NULL,NULL),(18,'ru_RU','Компилировать assets автоматически при изменении источника asset (1 - Да, 0 - Нет)',NULL,NULL,NULL),(19,'cs_CZ',NULL,NULL,NULL,NULL),(19,'de_DE','Name des Cookies \"Remember me\" für die Administratoren',NULL,NULL,NULL),(19,'en_US','\"Remember me\" cookie name for administration users',NULL,NULL,NULL),(19,'es_ES','Nombre de la cookie \"Recordarme\" para los usuarios de administración',NULL,NULL,NULL),(19,'fr_FR','Nom du cookie \"Remember me\" pour les utilisateurs d\'administration',NULL,NULL,NULL),(19,'it_IT',NULL,NULL,NULL,NULL),(19,'ru_RU','Имя cookie \"Запомнить меня\" для админов',NULL,NULL,NULL),(20,'cs_CZ',NULL,NULL,NULL,NULL),(20,'de_DE','Ablaufzeit in Sekunden des Cookies \"Remember me\" für die Administratoren',NULL,NULL,NULL),(20,'en_US','\"Remember me\" cookie expiration time, in seconds, for administration users',NULL,NULL,NULL),(20,'es_ES','Fecha de caducidad de cookie \"recuerdame\", en segundos, para los usuarios de la administración',NULL,NULL,NULL),(20,'fr_FR','Délai d\'expiration du cookie \"Remember me\", en secondes, pour les utilisateurs d\'administration',NULL,NULL,NULL),(20,'it_IT',NULL,NULL,NULL,NULL),(20,'ru_RU','Время жизни cookie \"Запомнить меня\" в секундах, для админов',NULL,NULL,NULL),(21,'cs_CZ',NULL,NULL,NULL,NULL),(21,'de_DE','Name des Cookies \"Remember me\" für die Kunden',NULL,NULL,NULL),(21,'en_US','\"Remember me\" cookie name for customer users',NULL,NULL,NULL),(21,'es_ES','Nombre de la cookie \"Recordarme\" para los usuarios cliente',NULL,NULL,NULL),(21,'fr_FR','Nom du cookie \"Remember me\" pour les clients',NULL,NULL,NULL),(21,'it_IT',NULL,NULL,NULL,NULL),(21,'ru_RU','Имя cookie \"Запомнить меня\" для клинтов',NULL,NULL,NULL),(22,'cs_CZ',NULL,NULL,NULL,NULL),(22,'de_DE','Ablaufzeit in Sekunden des Cookies \"Remember me\" für die Kunden',NULL,NULL,NULL),(22,'en_US','\"Remember me\" cookie expiration time, in seconds, for customer users',NULL,NULL,NULL),(22,'es_ES','Fecha de caducidad de cookie \"Acuérdate de mi\", en segundos, para los usuarios cliente',NULL,NULL,NULL),(22,'fr_FR','Délai d\'expiration du cookie \"Remember me\", en secondes, pour les clients',NULL,NULL,NULL),(22,'it_IT',NULL,NULL,NULL,NULL),(22,'ru_RU','Время жизни cookie \"Запомнить меня\" в секундах, для клиентов',NULL,NULL,NULL),(23,'cs_CZ',NULL,NULL,NULL,NULL),(23,'de_DE','Shops Basis-URL (zum Beispiel http://www.yourshopdomain.com)',NULL,NULL,NULL),(23,'en_US','Base URL of the shop (e.g. http://www.yourshopdomain.com)',NULL,NULL,NULL),(23,'es_ES','Base URL de la tienda (por ejemplo http://www.yourshopdomain.com)',NULL,NULL,NULL),(23,'fr_FR','URL de base pour la boutique (par exemple http://www.yourshopdomain.com)',NULL,NULL,NULL),(23,'it_IT',NULL,NULL,NULL,NULL),(23,'ru_RU','Базовый URL магазина (например http://www.yourshopdomain.com)',NULL,NULL,NULL),(24,'cs_CZ',NULL,NULL,NULL,NULL),(24,'de_DE','Name der Rechnungsansicht in der aktuellen PDF-Vorlage (ohne Erweiterung)',NULL,NULL,NULL),(24,'en_US','Name of the invoice view in the current PDF template (without extension)',NULL,NULL,NULL),(24,'es_ES','Nombre de la vista para la factura en la plantilla PDF actual (sin extensión)',NULL,NULL,NULL),(24,'fr_FR','Nom de la vue de la facture dans le modèle PDF en cours (sans extension)',NULL,NULL,NULL),(24,'it_IT',NULL,NULL,NULL,NULL),(24,'ru_RU','Имя страницы текущего PDF шаблона для счет-фактуры (без расширения)',NULL,NULL,NULL),(25,'cs_CZ',NULL,NULL,NULL,NULL),(25,'de_DE','Name der Lieferung Sicht in der aktuellen PDF-Vorlage (ohne Erweiterung)',NULL,NULL,NULL),(25,'en_US','Name of the delivery view in the current PDF template (without extension)',NULL,NULL,NULL),(25,'es_ES','Nombre de la vista de entrega en la plantilla PDF actual (sin extensión)',NULL,NULL,NULL),(25,'fr_FR','Nom de la vue de la livraison dans le modèle PDF en cours (sans extension)',NULL,NULL,NULL),(25,'it_IT',NULL,NULL,NULL,NULL),(25,'ru_RU','Имя страницы текущего PDF шаблона для доставки (без расширения)',NULL,NULL,NULL),(26,'cs_CZ',NULL,NULL,NULL,NULL),(26,'de_DE','Der Pfad (relativ zu der Standard-Backoffice-Vorlage) zu dem verwendetes Bild wenn kein Flagge-Bild für ein Land gefunden werden kann',NULL,NULL,NULL),(26,'en_US','The path (relative to the default back-office template) to the image used when no flag image can be found for a country',NULL,NULL,NULL),(26,'es_ES','La ruta (relativa a la plantilla de back office por defecto) a la imagen que se utiliza cuando no se puede encontrar ninguna imagen de la bandera para un país',NULL,NULL,NULL),(26,'fr_FR','Le chemin (par rapport au modèle de back-office par défaut) vers l\'image utilisée lorsque aucune image de drapeau ne peut être trouvée pour un pays',NULL,NULL,NULL),(26,'it_IT',NULL,NULL,NULL,NULL),(26,'ru_RU','Путь (относительно стандартного шаблона админки) к изображению для флага страны, если изображение флага не найдено',NULL,NULL,NULL),(27,'cs_CZ',NULL,NULL,NULL,NULL),(27,'de_DE','Whitespace trim Ebene des generierten HTML-Codes (0 = aus, 1 = Mittel, 2 = Maximum)',NULL,NULL,NULL),(27,'en_US','Whitespace trim level of the generated HTML code (0 = none, 1 = medium, 2 = maximum)',NULL,NULL,NULL),(27,'es_ES','Espacio en blanco del ajuste nivel del código HTML generado (0 = ninguna, 1 = medio, 2 = máximo)',NULL,NULL,NULL),(27,'fr_FR','Niveau de découpe des espaces dans le code HTML généré (0 = aucun, 1 = moyen, 2 = maximum)',NULL,NULL,NULL),(27,'it_IT',NULL,NULL,NULL,NULL),(27,'ru_RU','Обрезание пробелов в генерируемом HTML (0 - нет, 1 - среднее, 2 - максимальное). Сильно влияет на производительность !',NULL,NULL,NULL),(28,'cs_CZ',NULL,NULL,NULL,NULL),(28,'de_DE','Standart verfügbaren Bestand wenn check-available-stock gleich 0.',NULL,NULL,NULL),(28,'en_US','Default available stock when check-available-stock is set to 0.',NULL,NULL,NULL),(28,'es_ES','Cuando check-available-stock es 0 stock disponible por defecto.',NULL,NULL,NULL),(28,'fr_FR','Stock disponible par défaut quand check-available-stock est à 0.',NULL,NULL,NULL),(28,'it_IT',NULL,NULL,NULL,NULL),(28,'ru_RU','Доступный остаток когда check-available-stock выставлен в 0',NULL,NULL,NULL),(29,'cs_CZ',NULL,NULL,NULL,NULL),(29,'de_DE','Die ID des Ordners mit Ihren Informations-Seiten: AGB, Impressum, ...',NULL,NULL,NULL),(29,'en_US','The ID of the folder containing your information pages : terms, imprint, ...',NULL,NULL,NULL),(29,'es_ES','El ID de la carpeta que contiene sus páginas de información: términos, impresión,...',NULL,NULL,NULL),(29,'fr_FR','L\'ID du dossier contenant vos pages d\'informations : CGV, mentions légales, ...',NULL,NULL,NULL),(29,'it_IT',NULL,NULL,NULL,NULL),(29,'ru_RU','ID папки содержащей информационные страницы : условия, выходные сведения, ...',NULL,NULL,NULL),(30,'cs_CZ',NULL,NULL,NULL,NULL),(30,'de_DE','Ihr \'Allgemeine Geschäftsbedingungen \' ID.',NULL,NULL,NULL),(30,'en_US','The ID of the \'Terms & Conditions\' content.',NULL,NULL,NULL),(30,'es_ES','El ID de los contenidos de \'Términos y condiciones\'.',NULL,NULL,NULL),(30,'fr_FR','L\'ID du contenu de vos \'CGV\'.',NULL,NULL,NULL),(30,'it_IT',NULL,NULL,NULL,NULL),(30,'ru_RU','ID  контента \'Условия использования\'',NULL,NULL,NULL),(31,'cs_CZ',NULL,NULL,NULL,NULL),(31,'de_DE','Negativen Lagerbestand erlauben (1) oder nicht (0)',NULL,NULL,NULL),(31,'en_US','Allow negative product stock (1) or not (0)',NULL,NULL,NULL),(31,'es_ES','Permitir valores negativos producto (1) o no (0)',NULL,NULL,NULL),(31,'fr_FR','Autoriser un stock négatif sur les produits (1) ou pas (0, défaut)',NULL,NULL,NULL),(31,'it_IT',NULL,NULL,NULL,NULL),(31,'ru_RU','Разрешить отрицательные остатки товара (1) или нет (0)',NULL,NULL,NULL),(32,'cs_CZ',NULL,NULL,NULL,NULL),(32,'de_DE','Ein dauerhaftes Cookie verwenden, um den Kundes-Warenkorb zu merken',NULL,NULL,NULL),(32,'en_US','Use a persistent cookie to keep track of customer cart',NULL,NULL,NULL),(32,'es_ES','Usa una \'cookie\' persistente para mantener el trayecto del carrito del cliente',NULL,NULL,NULL),(32,'fr_FR','Utiliser un cookie persistant pour mémoriser le panier du client',NULL,NULL,NULL),(32,'it_IT',NULL,NULL,NULL,NULL),(32,'ru_RU','Использовать cookie для отслеживания корзины клиента',NULL,NULL,NULL),(33,'cs_CZ',NULL,NULL,NULL,NULL),(33,'de_DE','Name der Warenkorb-Cookie',NULL,NULL,NULL),(33,'en_US','Name of the cart cookie',NULL,NULL,NULL),(33,'es_ES','Nombre de la cookie del carrito',NULL,NULL,NULL),(33,'fr_FR','Nom du cookie de stockage du panier',NULL,NULL,NULL),(33,'it_IT',NULL,NULL,NULL,NULL),(33,'ru_RU','Имя cookie корзины',NULL,NULL,NULL),(34,'cs_CZ',NULL,NULL,NULL,NULL),(34,'de_DE','Dauer der Warenkorb-Cookie in dem Kunden-Browser, in Sekunden',NULL,NULL,NULL),(34,'en_US','Life time of the cart cookie in the customer browser, in seconds',NULL,NULL,NULL),(34,'es_ES','Tiempo de vida de la cookie del carro en el navegador del cliente, en segundos',NULL,NULL,NULL),(34,'fr_FR','Durée de vie du cookie du panier dans le navigateur du client, en secondes',NULL,NULL,NULL),(34,'it_IT',NULL,NULL,NULL,NULL),(34,'ru_RU','Время жизни cookie корзины в секундах',NULL,NULL,NULL),(35,'cs_CZ',NULL,NULL,NULL,NULL),(35,'de_DE','Dauer der Session-Cookie in dem Kunden-Browser, in Sekunden',NULL,NULL,NULL),(35,'en_US','Life time of the session cookie in the customer browser, in seconds',NULL,NULL,NULL),(35,'es_ES','Tiempo de vida de la cookie de la sesión en el navegador del cliente, en segundos',NULL,NULL,NULL),(35,'fr_FR','Durée de vie du cookie de la session dans le navigateur du client, en secondes',NULL,NULL,NULL),(35,'it_IT',NULL,NULL,NULL,NULL),(35,'ru_RU','Время жизни cookie сессии клиента в секундах',NULL,NULL,NULL),(36,'cs_CZ',NULL,NULL,NULL,NULL),(36,'de_DE','Die Session Standartkonfiguration lassen',NULL,NULL,NULL),(36,'en_US','Leave the default configuration of session',NULL,NULL,NULL),(36,'es_ES','Abandonde la configuración predeterminada de la sesión',NULL,NULL,NULL),(36,'fr_FR','Laisser la configuration par défaut de la session',NULL,NULL,NULL),(36,'it_IT',NULL,NULL,NULL,NULL),(36,'ru_RU','Оставить настройки по умолчанию для сессии',NULL,NULL,NULL),(37,'cs_CZ',NULL,NULL,NULL,NULL),(37,'de_DE','Standartsprache ohne Übersetzung',NULL,NULL,NULL),(37,'en_US','Default lang without translation',NULL,NULL,NULL),(37,'es_ES','Lenguaje por defecto sin traducción',NULL,NULL,NULL),(37,'fr_FR','Langue par défaut sans traduction',NULL,NULL,NULL),(37,'it_IT',NULL,NULL,NULL,NULL),(37,'ru_RU','Язык по умолчанию без перевода',NULL,NULL,NULL),(52,'cs_CZ',NULL,NULL,NULL,NULL),(52,'de_DE','[Firewall/Bruteforce] Wartezeit zwischen X Versuche',NULL,NULL,NULL),(52,'en_US','[Firewall/Bruteforce] Time to wait between X attempts',NULL,NULL,NULL),(52,'es_ES','[Firewall/Bruteforce] Tiempo de espera entre X intentos',NULL,NULL,NULL),(52,'fr_FR','[Pare-feu/Bruteforce] Temps à attendre entre X essais',NULL,NULL,NULL),(52,'it_IT',NULL,NULL,NULL,NULL),(52,'ru_RU','[Firewall/Bruteforce] Время между Х попыток перебора',NULL,NULL,NULL),(53,'cs_CZ',NULL,NULL,NULL,NULL),(53,'de_DE','[Firewall] Wartezeit zwischen X Versuche',NULL,NULL,NULL),(53,'en_US','[Firewall] Time to wait between X attempts',NULL,NULL,NULL),(53,'es_ES','[Firewall] Tiempo de espera entre X intentos',NULL,NULL,NULL),(53,'fr_FR','[Pare-feu] Temps à attendre entre X essais',NULL,NULL,NULL),(53,'it_IT',NULL,NULL,NULL,NULL),(53,'ru_RU','[Firewall] Время между Х попытками',NULL,NULL,NULL),(54,'cs_CZ',NULL,NULL,NULL,NULL),(54,'de_DE','[Firewall/Bruteforce] Anzahl der erlaubten Versuche',NULL,NULL,NULL),(54,'en_US','[Firewall/Bruteforce] Number of allowed attemps',NULL,NULL,NULL),(54,'es_ES','[Firewall/Bruteforce] Número de intentos permitidos',NULL,NULL,NULL),(54,'fr_FR','[Pare-feu/Bruteforce] Nombre de tentatives autorisées',NULL,NULL,NULL),(54,'it_IT',NULL,NULL,NULL,NULL),(54,'ru_RU','[Firewall/Bruteforce] Количество возможных попыток перебора',NULL,NULL,NULL),(55,'cs_CZ',NULL,NULL,NULL,NULL),(55,'de_DE','[Firewall] Anzahl der erlaubten Versuche',NULL,NULL,NULL),(55,'en_US','[Firewall] Number of allowed attemps',NULL,NULL,NULL),(55,'es_ES','[Firewall] Número de intentos permitidos',NULL,NULL,NULL),(55,'fr_FR','[Pare-feu] Nombre de tentatives autorisées',NULL,NULL,NULL),(55,'it_IT',NULL,NULL,NULL,NULL),(55,'ru_RU','[Firewall] Количествно возможных попыток',NULL,NULL,NULL),(56,'cs_CZ',NULL,NULL,NULL,NULL),(56,'de_DE','[Firewall] Firewall aktivieren',NULL,NULL,NULL),(56,'en_US','[Firewall] Activate the firewall',NULL,NULL,NULL),(56,'es_ES','[Firewall] Activar el firewall',NULL,NULL,NULL),(56,'fr_FR','[Pare-feu] Activer le pare-feu',NULL,NULL,NULL),(56,'it_IT',NULL,NULL,NULL,NULL),(56,'ru_RU','[Firewall] Активация firewall',NULL,NULL,NULL),(57,'cs_CZ',NULL,NULL,NULL,NULL),(57,'de_DE','URI mit Slash beendet erlauben',NULL,NULL,NULL),(57,'en_US','Allow slash ended uri',NULL,NULL,NULL),(57,'es_ES','Permitir barra de fín de url',NULL,NULL,NULL),(57,'fr_FR','Autoriser les URI terminées par un slash',NULL,NULL,NULL),(57,'it_IT',NULL,NULL,NULL,NULL),(57,'ru_RU','Разрешить URI закрывающим слешем',NULL,NULL,NULL),(58,'cs_CZ',NULL,NULL,NULL,NULL),(58,'de_DE','Fehlermeldung zeigen anstatt einer weißen Seite im Falle eines eines Serverfehlers',NULL,NULL,NULL),(58,'en_US','Show error message instead of a white page on a server error',NULL,NULL,NULL),(58,'es_ES','Mostrar mensaje de error en lugar de una página en blanco cuando ocurre un error de servidor',NULL,NULL,NULL),(58,'fr_FR','Afficher un message d\'erreur à la place d\'une page blanche lors d\'une erreur serveur',NULL,NULL,NULL),(58,'it_IT',NULL,NULL,NULL,NULL),(58,'ru_RU','Показывать страницу ошибок вместо белой страницы при ошибке сервера',NULL,NULL,NULL),(59,'cs_CZ',NULL,NULL,NULL,NULL),(59,'de_DE','Dateiname der Fehlerseite',NULL,NULL,NULL),(59,'en_US','Filename of the error page',NULL,NULL,NULL),(59,'es_ES','Nombre de archivo de la página de error',NULL,NULL,NULL),(59,'fr_FR','Nom du fichier de la page d\'erreur',NULL,NULL,NULL),(59,'it_IT',NULL,NULL,NULL,NULL),(59,'ru_RU','Имя файла для страницы ошибок',NULL,NULL,NULL),(60,'cs_CZ',NULL,NULL,NULL,NULL),(60,'de_DE','Den Kunden erlauben ihre E-Mail-Adresse zu ändern. 1 für Ja, 0 für Nein',NULL,NULL,NULL),(60,'en_US','Allow customers to change their email. 1 for yes, 0 for no',NULL,NULL,NULL),(60,'es_ES','Permitir a los clientes cambiar su correo electrónico. 1 para sí, 0 para no',NULL,NULL,NULL),(60,'fr_FR','Permettre aux utilisateurs de changer leur email. 1 pour oui, 0 pour non',NULL,NULL,NULL),(60,'it_IT',NULL,NULL,NULL,NULL),(60,'ru_RU','Позволять клиентам менять email. 1 - Да, 0 - Нет',NULL,NULL,NULL),(61,'cs_CZ',NULL,NULL,NULL,NULL),(61,'de_DE',NULL,NULL,NULL,NULL),(61,'en_US','Ask the customers to confirm their email in customer creation form (1: yes, 0: no)',NULL,NULL,NULL),(61,'es_ES',NULL,NULL,NULL,NULL),(61,'fr_FR','Demander aux clients de confirmer leur adresse email dans le formulaire de création de compte (1: oui, 0: non)',NULL,NULL,NULL),(61,'it_IT',NULL,NULL,NULL,NULL),(61,'ru_RU',NULL,NULL,NULL,NULL),(62,'cs_CZ',NULL,NULL,NULL,NULL),(62,'de_DE','Geheimer Schlüssel für Formular CSRF-token',NULL,NULL,NULL),(62,'en_US','Secret key for form CSRF token',NULL,NULL,NULL),(62,'es_ES','Clave secreta para el token CSRF del formulario',NULL,NULL,NULL),(62,'fr_FR','Clé secrète pour le jeton CSRF des formulaires',NULL,NULL,NULL),(62,'it_IT',NULL,NULL,NULL,NULL),(62,'ru_RU','Секретный ключ для CSRF токена',NULL,NULL,NULL),(63,'cs_CZ',NULL,NULL,NULL,NULL),(63,'de_DE',NULL,NULL,NULL,NULL),(63,'en_US','The minimum length required for an administrator password',NULL,NULL,NULL),(63,'es_ES','La longitud mínima de la contraseña de administrador',NULL,NULL,NULL),(63,'fr_FR','La longueur minimale requise pour un mot de passe administrateur',NULL,NULL,NULL),(63,'it_IT',NULL,NULL,NULL,NULL),(63,'ru_RU','Минимальная длина пароля для админа',NULL,NULL,NULL),(64,'cs_CZ',NULL,NULL,NULL,NULL),(64,'de_DE',NULL,NULL,NULL,NULL),(64,'en_US','Allow an administrator to recreate a lost password (1 = yes, 0 = no)',NULL,NULL,NULL),(64,'es_ES','Permite a un administrador recrear una contraseña perdida (1 = sí, 0 = no)',NULL,NULL,NULL),(64,'fr_FR','Permettre à un administrateur de recréer un mot de passe perdu (1 = Oui, 0 = non)',NULL,NULL,NULL),(64,'it_IT',NULL,NULL,NULL,NULL),(64,'ru_RU','Позволять восстановление утеряного пароля админа (1 - Да, 0 - Нет)',NULL,NULL,NULL),(65,'cs_CZ',NULL,NULL,NULL,NULL),(65,'de_DE',NULL,NULL,NULL,NULL),(65,'en_US','Send a confirmation email to newsletter subscribers (1 = yes, 0 = no)',NULL,NULL,NULL),(65,'es_ES','Enviar un correo de confirmación a los suscriptores del boletín (1 = sí, 0 = no)',NULL,NULL,NULL),(65,'fr_FR','Envoyer un email de confirmation aux abonnés de la newsletter (1 = Oui, 0 = non)',NULL,NULL,NULL),(65,'it_IT',NULL,NULL,NULL,NULL),(65,'ru_RU','Посылать email подтверждения подписчикам рассылки',NULL,NULL,NULL),(66,'cs_CZ',NULL,NULL,NULL,NULL),(66,'de_DE',NULL,NULL,NULL,NULL),(66,'en_US','Default number of products on product list',NULL,NULL,NULL),(66,'es_ES','Número predeterminado de resultados por página para la lista de productos',NULL,NULL,NULL),(66,'fr_FR','Nombre par défaut de résultats par page pour la liste des produits',NULL,NULL,NULL),(66,'it_IT',NULL,NULL,NULL,NULL),(66,'ru_RU','Количество результатов по умолчанию для списка товаров',NULL,NULL,NULL),(67,'cs_CZ',NULL,NULL,NULL,NULL),(67,'de_DE',NULL,NULL,NULL,NULL),(67,'en_US','Default number of orders on order list',NULL,NULL,NULL),(67,'es_ES','Número predeterminado de resultados por página para la lista de pedidos',NULL,NULL,NULL),(67,'fr_FR','Nombre par défaut de résultats par page pour la liste des commandes',NULL,NULL,NULL),(67,'it_IT',NULL,NULL,NULL,NULL),(67,'ru_RU','Количество результатов по умолчанию для списка заказов',NULL,NULL,NULL),(68,'cs_CZ',NULL,NULL,NULL,NULL),(68,'de_DE',NULL,NULL,NULL,NULL),(68,'en_US','Default number of customers on customer list',NULL,NULL,NULL),(68,'es_ES','Número predeterminado de resultados por página para la lista de clientes',NULL,NULL,NULL),(68,'fr_FR','Nombre par défaut de résultats par page pour la liste des clients',NULL,NULL,NULL),(68,'it_IT',NULL,NULL,NULL,NULL),(68,'ru_RU','Количество результатов по умолчанию для списка клиентов',NULL,NULL,NULL),(69,'cs_CZ',NULL,NULL,NULL,NULL),(69,'de_DE',NULL,NULL,NULL,NULL),(69,'en_US','Customer account creation should be confirmed by email (1: yes, 0: no)',NULL,NULL,NULL),(69,'es_ES',NULL,NULL,NULL,NULL),(69,'fr_FR','La création d\'un compte client doit être confirmée par email (1: oui, 0: non)',NULL,NULL,NULL),(69,'it_IT',NULL,NULL,NULL,NULL),(69,'ru_RU',NULL,NULL,NULL,NULL),(70,'cs_CZ',NULL,NULL,NULL,NULL),(70,'de_DE',NULL,NULL,NULL,NULL),(70,'en_US','Default number of coupons per page on coupon list',NULL,NULL,NULL),(70,'es_ES',NULL,NULL,NULL,NULL),(70,'fr_FR','Nombre de coupons par page dans la liste des coupons',NULL,NULL,NULL),(70,'it_IT',NULL,NULL,NULL,NULL),(70,'ru_RU',NULL,NULL,NULL,NULL),(71,'cs_CZ',NULL,NULL,NULL,NULL),(71,'de_DE',NULL,NULL,NULL,NULL),(71,'en_US',NULL,NULL,NULL,NULL),(71,'es_ES',NULL,NULL,NULL,NULL),(71,'fr_FR',NULL,NULL,NULL,NULL),(71,'it_IT',NULL,NULL,NULL,NULL),(71,'ru_RU',NULL,NULL,NULL,NULL),(72,'cs_CZ',NULL,NULL,NULL,NULL),(72,'de_DE',NULL,NULL,NULL,NULL),(72,'en_US',NULL,NULL,NULL,NULL),(72,'es_ES',NULL,NULL,NULL,NULL),(72,'fr_FR',NULL,NULL,NULL,NULL),(72,'it_IT',NULL,NULL,NULL,NULL),(72,'ru_RU',NULL,NULL,NULL,NULL),(73,'cs_CZ',NULL,NULL,NULL,NULL),(73,'de_DE','Modulinstallation aus ZIP-Dateien zulassen.',NULL,NULL,NULL),(73,'en_US','Allow module installation from ZIP files.',NULL,NULL,NULL),(73,'es_ES','Permitir la instalación del módulo desde archivos ZIP.',NULL,NULL,NULL),(73,'fr_FR','Autoriser l\'installation des modules par fichier ZIP.',NULL,NULL,NULL),(73,'it_IT',NULL,NULL,NULL,NULL),(73,'ru_RU',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `config_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visible` tinyint(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_document`
--

DROP TABLE IF EXISTS `content_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content_document_content_id` (`content_id`),
  CONSTRAINT `fk_content_document_content_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_document`
--

LOCK TABLES `content_document` WRITE;
/*!40000 ALTER TABLE `content_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_document_i18n`
--

DROP TABLE IF EXISTS `content_document_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_document_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `content_document_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `content_document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_document_i18n`
--

LOCK TABLES `content_document_i18n` WRITE;
/*!40000 ALTER TABLE `content_document_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_document_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_folder`
--

DROP TABLE IF EXISTS `content_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_folder` (
  `content_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `default_folder` tinyint(1) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`content_id`,`folder_id`),
  KEY `idx_content_folder_content_id` (`content_id`),
  KEY `idx_content_folder_folder_id` (`folder_id`),
  KEY `idx_content_folder_default` (`default_folder`),
  CONSTRAINT `fk_content_folder_content_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_content_folder_folder_id` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_folder`
--

LOCK TABLES `content_folder` WRITE;
/*!40000 ALTER TABLE `content_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_i18n`
--

DROP TABLE IF EXISTS `content_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `content_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_i18n`
--

LOCK TABLES `content_i18n` WRITE;
/*!40000 ALTER TABLE `content_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_image`
--

DROP TABLE IF EXISTS `content_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content_image_content_id` (`content_id`),
  KEY `idx_content_image_content_id_position` (`content_id`,`position`),
  CONSTRAINT `fk_content_image_content_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_image`
--

LOCK TABLES `content_image` WRITE;
/*!40000 ALTER TABLE `content_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_image_i18n`
--

DROP TABLE IF EXISTS `content_image_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_image_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `content_image_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `content_image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_image_i18n`
--

LOCK TABLES `content_image_i18n` WRITE;
/*!40000 ALTER TABLE `content_image_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_image_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_version`
--

DROP TABLE IF EXISTS `content_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_version` (
  `id` int(11) NOT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  CONSTRAINT `content_version_FK_1` FOREIGN KEY (`id`) REFERENCES `content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_version`
--

LOCK TABLES `content_version` WRITE;
/*!40000 ALTER TABLE `content_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visible` tinyint(4) NOT NULL DEFAULT 0,
  `isocode` varchar(4) NOT NULL,
  `isoalpha2` varchar(2) DEFAULT NULL,
  `isoalpha3` varchar(4) DEFAULT NULL,
  `has_states` tinyint(4) DEFAULT 0,
  `need_zip_code` tinyint(4) DEFAULT 0,
  `zip_code_format` varchar(20) DEFAULT NULL,
  `by_default` tinyint(4) DEFAULT 0,
  `shop_country` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_country_by_default` (`by_default`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,1,'4','AF','AFG',0,0,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,1,'710','ZA','ZAF',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,1,'8','AL','ALB',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,1,'12','DZ','DZA',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,1,'276','DE','DEU',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,1,'20','AD','AND',0,1,'CNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,1,'24','AO','AGO',0,0,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(8,1,'28','AG','ATG',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(9,1,'682','SA','SAU',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(10,1,'32','AR','ARG',1,1,'LNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(11,1,'51','AM','ARM',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(12,1,'36','AU','AUS',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(13,1,'40','AT','AUT',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(14,1,'31','AZ','AZE',0,1,'CNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(15,1,'44','BS','BHS',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(16,1,'48','BH','BHR',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(17,1,'50','BD','BGD',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(18,1,'52','BB','BRB',0,1,'CNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(19,1,'585','PW','PLW',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(20,1,'56','BE','BEL',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(21,1,'84','BL','BLZ',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(22,1,'204','BJ','BEN',0,0,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(23,1,'64','BT','BTN',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(24,1,'112','BY','BLR',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(25,1,'104','MM','MMR',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(26,1,'68','BO','BOL',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(27,1,'70','BA','BIH',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(28,1,'72','BW','BWA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(29,1,'76','BR','BRA',0,1,'NNNNN-NNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(30,1,'96','BN','BRN',0,1,'LLNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(31,1,'100','BG','BGR',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(32,1,'854','BF','BFA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(33,1,'108','BI','BDI',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(34,1,'116','KH','KHM',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(35,1,'120','CM','CMR',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(37,1,'132','CV','CPV',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(38,1,'152','CL','CHL',0,1,'NNN-NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(39,1,'156','CN','CHN',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(40,1,'196','CY','CYP',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(41,1,'170','CO','COL',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(42,1,'174','KM','COM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(43,1,'178','CG','COG',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(44,1,'184','CK','COK',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(45,1,'408','KP','PRK',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(46,1,'410','KR','KOR',0,1,'NNN-NNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(47,1,'188','CR','CRI',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(48,1,'384','CI','CIV',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(49,1,'191','HR','HRV',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(50,1,'192','CU','CUB',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(51,1,'208','DK','DNK',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(52,1,'262','DJ','DJI',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(53,1,'212','DM','DMA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(54,1,'818','EG','EGY',0,0,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(55,1,'784','AE','ARE',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(56,1,'218','EC','ECU',0,1,'CNNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(57,1,'232','ER','ERI',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(58,1,'724','ES','ESP',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(59,1,'233','EE','EST',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(61,1,'231','ET','ETH',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(62,1,'242','FJ','FJI',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(63,1,'246','FI','FIN',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(64,1,'250','FR','FRA',0,1,'NNNNN',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(65,1,'266','GA','GAB',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(66,1,'270','GM','GMB',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(67,1,'268','GE','GEO',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(68,1,'288','GH','GHA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(69,1,'300','GR','GRC',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(70,1,'308','GD','GRD',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(71,1,'320','GT','GTM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(72,1,'324','GN','GIN',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(73,1,'624','GW','GNB',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(74,1,'226','GQ','GNQ',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(75,1,'328','GY','GUY',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(76,1,'332','HT','HTI',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(77,1,'340','HN','HND',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(78,1,'348','HU','HUN',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(79,1,'356','IN','IND',0,1,'NNN NNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(80,1,'360','ID','IDN',1,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(81,1,'364','IR','IRN',0,1,'NNNNN-NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(82,1,'368','IQ','IRQ',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(83,1,'372','IE','IRL',0,0,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(84,1,'352','IS','ISL',0,1,'NNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(85,1,'376','IL','ISR',0,1,'NNNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(86,1,'380','IT','ITA',1,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(87,1,'388','JM','JAM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(88,1,'392','JP','JPN',1,1,'NNN-NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(89,1,'400','JO','JOR',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(90,1,'398','KZ','KAZ',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(91,1,'404','KE','KEN',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(92,1,'417','KG','KGZ',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(93,1,'296','KI','KIR',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(94,1,'414','KW','KWT',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(95,1,'418','LA','LAO',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(96,1,'426','LS','LSO',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(97,1,'428','LV','LVA',0,1,'C-NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(98,1,'422','LB','LBN',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(99,1,'430','LR','LBR',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(100,1,'343','LY','LBY',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(101,1,'438','LI','LIE',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(102,1,'440','LT','LTU',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(103,1,'442','LU','LUX',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(104,1,'807','MK','MKD',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(105,1,'450','MG','MDG',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(106,1,'458','MY','MYS',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(107,1,'454','MW','MWI',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(108,1,'462','MV','MDV',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(109,1,'466','ML','MLI',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(110,1,'470','MT','MLT',0,1,'LLL NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(111,1,'504','MA','MAR',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(112,1,'584','MH','MHL',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(113,1,'480','MU','MUS',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(114,1,'478','MR','MRT',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(115,1,'484','MX','MEX',1,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(116,1,'583','FM','FSM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(117,1,'498','MD','MDA',0,1,'C-NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(118,1,'492','MC','MCO',0,1,'980NN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(119,1,'496','MN','MNG',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(120,1,'508','MZ','MOZ',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(121,1,'516','NA','NAM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(122,1,'520','NR','NRU',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(123,1,'524','NP','NPL',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(124,1,'558','NI','NIC',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(125,1,'562','NE','NER',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(126,1,'566','NG','NGA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(127,1,'570','NU','NIU',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(128,1,'578','NO','NOR',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(129,1,'554','NZ','NZL',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(130,1,'512','OM','OMN',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(131,1,'800','UG','UGA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(132,1,'860','UZ','UZB',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(133,1,'586','PK','PAK',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(134,1,'591','PA','PAN',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(135,1,'598','PG','PNG',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(136,1,'600','PY','PRY',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(137,1,'528','NL','NLD',0,1,'NNNN LL',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(138,1,'604','PE','PER',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(139,1,'608','PH','PHL',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(140,1,'616','PL','POL',0,1,'NN-NNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(141,1,'620','PT','PRT',0,1,'NNNN-NNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(142,1,'634','QA','QAT',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(143,1,'140','CF','CAF',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(144,1,'214','DO','DOM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(145,1,'203','CZ','CZE',0,1,'NNN NN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(146,1,'642','RO','ROU',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(147,1,'826','GB','GBR',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(148,1,'643','RU','RUS',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(149,1,'646','RW','RWA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(150,1,'659','KN','KNA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(151,1,'662','LC','LCA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(152,1,'674','SM','SMR',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(153,1,'670','VC','VCT',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(154,1,'90','SB','SLB',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(155,1,'222','SV','SLV',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(156,1,'882','WS','WSM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(157,1,'678','ST','STP',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(158,1,'686','SN','SEN',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(159,1,'690','SC','SYC',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(160,1,'694','SL','SLE',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(161,1,'702','SG','SGP',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(162,1,'703','SK','SVK',0,1,'NNN NN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(163,1,'705','SI','SVN',0,1,'C-NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(164,1,'706','SO','SOM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(165,1,'729','SD','SDN',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(166,1,'144','LK','LKA',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(167,1,'752','SE','SWE',0,1,'NNN NN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(168,1,'756','CH','CHE',0,1,'NNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(169,1,'740','SR','SUR',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(170,1,'748','SZ','SWZ',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(171,1,'760','SY','SYR',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(172,1,'762','TJ','TJK',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(173,1,'834','TZ','TZA',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(174,1,'148','TD','TCD',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(175,1,'764','TH','THA',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(176,1,'768','TG','TGO',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(177,1,'776','TO','TON',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(178,1,'780','TT','TTO',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(179,1,'788','TN','TUN',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(180,1,'795','TM','TKM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(181,1,'792','TR','TUR',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(182,1,'798','TV','TUV',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(183,1,'804','UA','UKR',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(184,1,'858','UY','URY',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(185,1,'336','VA','VAT',0,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(186,1,'548','VU','VUT',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(187,1,'862','VE','VEN',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(188,1,'704','VN','VNM',0,1,'NNNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(189,1,'887','YE','YEM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(191,1,'180','CD','COD',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(192,1,'894','ZM','ZMB',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(193,1,'716','ZW','ZWE',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(196,1,'840','US','USA',1,1,'NNNNN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(246,1,'124','CA','CAN',1,1,'LNL NLN',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(259,1,'312','GP','GLP',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(260,1,'254','GF','GUF',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(261,1,'474','MQ','MTQ',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(262,1,'175','YT','MYT',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(263,1,'638','RE','REU',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(264,1,'666','PM','SPM',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(265,1,'540','NC','NCL',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(266,1,'258','PF','PYF',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(267,1,'876','WF','WLF',0,1,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(269,1,'344','HK','HKG',0,0,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(270,1,'652','BL','BLM',0,0,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(271,1,'663','MF','MAF',0,0,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(272,1,'260','TF','ATF',0,0,'',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_area`
--

DROP TABLE IF EXISTS `country_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_area_area_id_idx` (`area_id`),
  KEY `fk_country_area_country_id_idx` (`country_id`),
  KEY `fk_country_area_state_id_idx` (`state_id`),
  CONSTRAINT `fk_country_area_area_id` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_country_area_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_area`
--

LOCK TABLES `country_area` WRITE;
/*!40000 ALTER TABLE `country_area` DISABLE KEYS */;
INSERT INTO `country_area` VALUES (1,1,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,2,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,3,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,4,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,5,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,6,NULL,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,7,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(8,8,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(9,9,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(10,10,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(11,11,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(12,12,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(13,13,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(14,14,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(15,15,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(16,16,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(17,17,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(18,18,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(19,19,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(20,20,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(21,21,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(22,22,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(23,24,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(24,25,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(25,26,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(26,27,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(27,28,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(28,29,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(29,30,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(30,31,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(31,32,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(32,33,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(33,34,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(34,35,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(35,37,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(36,38,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(37,39,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(38,40,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(39,41,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(40,42,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(41,43,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(42,44,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(43,45,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(44,46,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(45,47,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(46,48,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(47,49,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(48,50,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(49,51,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(50,52,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(51,53,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(52,54,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(53,55,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(54,56,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(55,57,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(56,58,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(57,59,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(58,61,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(59,62,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(60,63,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(61,64,NULL,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(62,65,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(63,66,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(64,67,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(65,68,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(66,69,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(67,70,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(68,71,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(69,72,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(70,73,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(71,74,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(72,75,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(73,76,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(74,77,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(75,78,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(76,79,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(77,80,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(78,81,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(79,82,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(80,83,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(81,84,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(82,85,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(83,86,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(84,87,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(85,88,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(86,89,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(87,90,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(88,91,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(89,92,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(90,93,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(91,94,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(92,95,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(93,96,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(94,97,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(95,98,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(96,99,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(97,100,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(98,101,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(99,102,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(100,103,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(101,104,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(102,105,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(103,106,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(104,107,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(105,108,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(106,109,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(107,110,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(108,111,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(109,112,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(110,113,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(111,114,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(112,115,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(113,117,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(114,118,NULL,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(115,119,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(116,120,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(117,121,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(118,122,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(119,123,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(120,124,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(121,125,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(122,126,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(123,128,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(124,129,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(125,130,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(126,131,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(127,132,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(128,133,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(129,134,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(130,135,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(131,136,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(132,137,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(133,138,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(134,139,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(135,140,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(136,141,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(137,142,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(138,143,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(139,144,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(140,145,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(141,146,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(142,147,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(143,148,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(144,149,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(145,150,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(146,151,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(147,152,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(148,153,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(149,154,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(150,156,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(151,157,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(152,158,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(153,159,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(154,160,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(155,161,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(156,162,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(157,163,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(158,164,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(159,165,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(160,166,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(161,167,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(162,168,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(163,169,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(164,170,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(165,171,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(166,172,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(167,173,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(168,174,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(169,175,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(170,176,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(171,177,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(172,178,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(173,179,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(174,180,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(175,181,NULL,3,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(176,182,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(177,183,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(178,184,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(179,185,NULL,2,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(180,186,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(181,187,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(182,188,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(183,189,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(184,191,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(185,192,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(186,193,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(187,196,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(188,246,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(189,259,NULL,5,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(190,260,NULL,5,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(191,261,NULL,5,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(192,262,NULL,5,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(193,263,NULL,5,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(194,264,NULL,5,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(195,265,NULL,6,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(196,266,NULL,6,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(197,267,NULL,6,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(198,269,NULL,4,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(199,270,NULL,5,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(200,271,NULL,5,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(201,272,NULL,6,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(202,1,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(203,2,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(204,3,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(205,4,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(206,5,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(207,6,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(208,7,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(209,8,NULL,8,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(210,9,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(211,10,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(212,11,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(213,12,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(214,13,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(215,14,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(216,15,NULL,8,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(217,16,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(218,17,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(219,18,NULL,8,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(220,19,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(221,20,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(222,21,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(223,22,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(224,23,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(225,24,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(226,25,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(227,26,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(228,27,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(229,28,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(230,29,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(231,30,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(232,31,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(233,32,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(234,33,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(235,34,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(236,35,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(237,37,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(238,38,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(239,39,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(240,40,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(241,41,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(242,42,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(243,43,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(244,44,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(245,45,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(246,46,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(247,47,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(248,48,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(249,49,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(250,50,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(251,51,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(252,52,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(253,53,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(254,54,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(255,55,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(256,56,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(257,57,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(258,58,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(259,59,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(260,61,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(261,62,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(262,63,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(263,64,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(264,65,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(265,66,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(266,67,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(267,68,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(268,69,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(269,70,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(270,71,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(271,72,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(272,73,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(273,74,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(274,75,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(275,76,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(276,77,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(277,78,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(278,79,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(279,80,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(280,81,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(281,82,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(282,83,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(283,84,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(284,85,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(285,86,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(286,87,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(287,88,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(288,89,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(289,90,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(290,91,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(291,92,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(292,93,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(293,94,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(294,95,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(295,96,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(296,97,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(297,98,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(298,99,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(299,100,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(300,101,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(301,102,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(302,103,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(303,104,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(304,105,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(305,106,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(306,107,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(307,108,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(308,109,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(309,110,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(310,111,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(311,112,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(312,113,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(313,114,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(314,115,NULL,8,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(315,116,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(316,117,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(317,118,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(318,119,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(319,120,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(320,121,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(321,122,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(322,123,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(323,124,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(324,125,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(325,126,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(326,127,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(327,128,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(328,129,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(329,130,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(330,131,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(331,132,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(332,133,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(333,134,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(334,135,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(335,136,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(336,137,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(337,138,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(338,139,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(339,140,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(340,141,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(341,142,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(342,143,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(343,144,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(344,145,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(345,146,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(346,147,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(347,148,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(348,149,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(349,150,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(350,151,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(351,152,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(352,153,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(353,154,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(354,155,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(355,156,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(356,157,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(357,158,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(358,159,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(359,160,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(360,161,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(361,162,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(362,163,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(363,164,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(364,165,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(365,166,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(366,167,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(367,168,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(368,169,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(369,170,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(370,171,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(371,172,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(372,173,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(373,174,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(374,175,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(375,176,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(376,177,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(377,178,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(378,179,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(379,180,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(380,181,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(381,182,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(382,183,NULL,7,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(383,184,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(384,185,NULL,13,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(385,186,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(386,187,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(387,188,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(388,189,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(389,191,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(390,192,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(391,193,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(392,196,NULL,8,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(393,246,NULL,8,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(394,259,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(395,260,NULL,12,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(396,261,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(397,262,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(398,263,NULL,10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(399,264,NULL,14,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(400,265,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(401,266,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(402,267,NULL,11,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(403,269,NULL,9,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `country_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_i18n`
--

DROP TABLE IF EXISTS `country_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `country_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_i18n`
--

LOCK TABLES `country_i18n` WRITE;
/*!40000 ALTER TABLE `country_i18n` DISABLE KEYS */;
INSERT INTO `country_i18n` VALUES (1,'cs_CZ',NULL,NULL,NULL,NULL),(1,'de_DE','Afghanistan',NULL,NULL,NULL),(1,'en_US','Afghanistan',NULL,NULL,NULL),(1,'es_ES','Afganistán',NULL,NULL,NULL),(1,'fr_FR','Afghanistan',NULL,NULL,NULL),(1,'it_IT',NULL,NULL,NULL,NULL),(1,'ru_RU','Афганистан',NULL,NULL,NULL),(2,'cs_CZ',NULL,NULL,NULL,NULL),(2,'de_DE','Südafrika',NULL,NULL,NULL),(2,'en_US','South Africa',NULL,NULL,NULL),(2,'es_ES','Sudáfrica',NULL,NULL,NULL),(2,'fr_FR','Afrique du Sud',NULL,NULL,NULL),(2,'it_IT',NULL,NULL,NULL,NULL),(2,'ru_RU','Южная Африка',NULL,NULL,NULL),(3,'cs_CZ',NULL,NULL,NULL,NULL),(3,'de_DE','Albanien',NULL,NULL,NULL),(3,'en_US','Albania',NULL,NULL,NULL),(3,'es_ES','Albania',NULL,NULL,NULL),(3,'fr_FR','Albanie',NULL,NULL,NULL),(3,'it_IT',NULL,NULL,NULL,NULL),(3,'ru_RU','Албания',NULL,NULL,NULL),(4,'cs_CZ',NULL,NULL,NULL,NULL),(4,'de_DE','Algerien',NULL,NULL,NULL),(4,'en_US','Algeria',NULL,NULL,NULL),(4,'es_ES','Argelia',NULL,NULL,NULL),(4,'fr_FR','Algérie',NULL,NULL,NULL),(4,'it_IT',NULL,NULL,NULL,NULL),(4,'ru_RU','Алжир',NULL,NULL,NULL),(5,'cs_CZ',NULL,NULL,NULL,NULL),(5,'de_DE','Deutschland',NULL,NULL,NULL),(5,'en_US','Germany',NULL,NULL,NULL),(5,'es_ES','Alemania',NULL,NULL,NULL),(5,'fr_FR','Allemagne',NULL,NULL,NULL),(5,'it_IT',NULL,NULL,NULL,NULL),(5,'ru_RU','Германия',NULL,NULL,NULL),(6,'cs_CZ',NULL,NULL,NULL,NULL),(6,'de_DE','Andorra',NULL,NULL,NULL),(6,'en_US','Andorra',NULL,NULL,NULL),(6,'es_ES','Andorra',NULL,NULL,NULL),(6,'fr_FR','Andorre',NULL,NULL,NULL),(6,'it_IT',NULL,NULL,NULL,NULL),(6,'ru_RU','Андорра',NULL,NULL,NULL),(7,'cs_CZ',NULL,NULL,NULL,NULL),(7,'de_DE','Angola',NULL,NULL,NULL),(7,'en_US','Angola',NULL,NULL,NULL),(7,'es_ES','Angola',NULL,NULL,NULL),(7,'fr_FR','Angola',NULL,NULL,NULL),(7,'it_IT',NULL,NULL,NULL,NULL),(7,'ru_RU','Ангола',NULL,NULL,NULL),(8,'cs_CZ',NULL,NULL,NULL,NULL),(8,'de_DE','Antigua und Barbuda',NULL,NULL,NULL),(8,'en_US','Antigua and Barbuda',NULL,NULL,NULL),(8,'es_ES','Antigua y Barbuda',NULL,NULL,NULL),(8,'fr_FR','Antigua-et-Barbuda',NULL,NULL,NULL),(8,'it_IT',NULL,NULL,NULL,NULL),(8,'ru_RU','Антигуа и Барбуда',NULL,NULL,NULL),(9,'cs_CZ',NULL,NULL,NULL,NULL),(9,'de_DE','Saudi-Arabien',NULL,NULL,NULL),(9,'en_US','Saudi Arabia',NULL,NULL,NULL),(9,'es_ES','Arabia Saudita',NULL,NULL,NULL),(9,'fr_FR','Arabie saoudite',NULL,NULL,NULL),(9,'it_IT',NULL,NULL,NULL,NULL),(9,'ru_RU','Саудовская Аравия',NULL,NULL,NULL),(10,'cs_CZ',NULL,NULL,NULL,NULL),(10,'de_DE','Argentinien',NULL,NULL,NULL),(10,'en_US','Argentina',NULL,NULL,NULL),(10,'es_ES','Argentina',NULL,NULL,NULL),(10,'fr_FR','Argentine',NULL,NULL,NULL),(10,'it_IT',NULL,NULL,NULL,NULL),(10,'ru_RU','Аргентина',NULL,NULL,NULL),(11,'cs_CZ',NULL,NULL,NULL,NULL),(11,'de_DE','Armenien',NULL,NULL,NULL),(11,'en_US','Armenia',NULL,NULL,NULL),(11,'es_ES','Armenia',NULL,NULL,NULL),(11,'fr_FR','Arménie',NULL,NULL,NULL),(11,'it_IT',NULL,NULL,NULL,NULL),(11,'ru_RU','Армения',NULL,NULL,NULL),(12,'cs_CZ',NULL,NULL,NULL,NULL),(12,'de_DE','Australien',NULL,NULL,NULL),(12,'en_US','Australia',NULL,NULL,NULL),(12,'es_ES','Australia',NULL,NULL,NULL),(12,'fr_FR','Australie',NULL,NULL,NULL),(12,'it_IT',NULL,NULL,NULL,NULL),(12,'ru_RU','Австралия',NULL,NULL,NULL),(13,'cs_CZ',NULL,NULL,NULL,NULL),(13,'de_DE','Österreich',NULL,NULL,NULL),(13,'en_US','Austria',NULL,NULL,NULL),(13,'es_ES','Austria',NULL,NULL,NULL),(13,'fr_FR','Autriche',NULL,NULL,NULL),(13,'it_IT',NULL,NULL,NULL,NULL),(13,'ru_RU','Австрия',NULL,NULL,NULL),(14,'cs_CZ',NULL,NULL,NULL,NULL),(14,'de_DE','Aserbaidschan',NULL,NULL,NULL),(14,'en_US','Azerbaijan',NULL,NULL,NULL),(14,'es_ES','Azerbaiyán',NULL,NULL,NULL),(14,'fr_FR','Azerbaïdjan',NULL,NULL,NULL),(14,'it_IT',NULL,NULL,NULL,NULL),(14,'ru_RU','Азербайджан',NULL,NULL,NULL),(15,'cs_CZ',NULL,NULL,NULL,NULL),(15,'de_DE','Bahamas',NULL,NULL,NULL),(15,'en_US','Bahamas',NULL,NULL,NULL),(15,'es_ES','Bahamas',NULL,NULL,NULL),(15,'fr_FR','Bahamas',NULL,NULL,NULL),(15,'it_IT',NULL,NULL,NULL,NULL),(15,'ru_RU','Багамские о-ва',NULL,NULL,NULL),(16,'cs_CZ',NULL,NULL,NULL,NULL),(16,'de_DE','Bahrein',NULL,NULL,NULL),(16,'en_US','Bahrain',NULL,NULL,NULL),(16,'es_ES','Bahrein',NULL,NULL,NULL),(16,'fr_FR','Bahreïn',NULL,NULL,NULL),(16,'it_IT',NULL,NULL,NULL,NULL),(16,'ru_RU','Бахрейн',NULL,NULL,NULL),(17,'cs_CZ',NULL,NULL,NULL,NULL),(17,'de_DE','Bangladesch',NULL,NULL,NULL),(17,'en_US','Bangladesh',NULL,NULL,NULL),(17,'es_ES','Bangladesh',NULL,NULL,NULL),(17,'fr_FR','Bangladesh',NULL,NULL,NULL),(17,'it_IT',NULL,NULL,NULL,NULL),(17,'ru_RU','Бангладеш',NULL,NULL,NULL),(18,'cs_CZ',NULL,NULL,NULL,NULL),(18,'de_DE','Barbados',NULL,NULL,NULL),(18,'en_US','Barbados',NULL,NULL,NULL),(18,'es_ES','Barbados',NULL,NULL,NULL),(18,'fr_FR','Barbade',NULL,NULL,NULL),(18,'it_IT',NULL,NULL,NULL,NULL),(18,'ru_RU','Barbados',NULL,NULL,NULL),(19,'cs_CZ',NULL,NULL,NULL,NULL),(19,'de_DE','Weißrussland',NULL,NULL,NULL),(19,'en_US','Belarus',NULL,NULL,NULL),(19,'es_ES','Belarús',NULL,NULL,NULL),(19,'fr_FR','Belarus',NULL,NULL,NULL),(19,'it_IT',NULL,NULL,NULL,NULL),(19,'ru_RU','Беларусь',NULL,NULL,NULL),(20,'cs_CZ',NULL,NULL,NULL,NULL),(20,'de_DE','Belgien',NULL,NULL,NULL),(20,'en_US','Belgium',NULL,NULL,NULL),(20,'es_ES','Bélgica',NULL,NULL,NULL),(20,'fr_FR','Belgique',NULL,NULL,NULL),(20,'it_IT',NULL,NULL,NULL,NULL),(20,'ru_RU','Бельгия',NULL,NULL,NULL),(21,'cs_CZ',NULL,NULL,NULL,NULL),(21,'de_DE','Belize',NULL,NULL,NULL),(21,'en_US','Belize',NULL,NULL,NULL),(21,'es_ES','Belice',NULL,NULL,NULL),(21,'fr_FR','Belize',NULL,NULL,NULL),(21,'it_IT',NULL,NULL,NULL,NULL),(21,'ru_RU','Белиз',NULL,NULL,NULL),(22,'cs_CZ',NULL,NULL,NULL,NULL),(22,'de_DE','Bénin',NULL,NULL,NULL),(22,'en_US','Benin',NULL,NULL,NULL),(22,'es_ES','Benin',NULL,NULL,NULL),(22,'fr_FR','Bénin',NULL,NULL,NULL),(22,'it_IT',NULL,NULL,NULL,NULL),(22,'ru_RU','Бенин',NULL,NULL,NULL),(23,'cs_CZ',NULL,NULL,NULL,NULL),(23,'de_DE','Bhutan',NULL,NULL,NULL),(23,'en_US','Bhutan',NULL,NULL,NULL),(23,'es_ES','Bhután',NULL,NULL,NULL),(23,'fr_FR','Bhoutan',NULL,NULL,NULL),(23,'it_IT',NULL,NULL,NULL,NULL),(23,'ru_RU','Бутан',NULL,NULL,NULL),(24,'cs_CZ',NULL,NULL,NULL,NULL),(24,'de_DE','Weißrussland',NULL,NULL,NULL),(24,'en_US','Bielorussia',NULL,NULL,NULL),(24,'es_ES','Bielorusia',NULL,NULL,NULL),(24,'fr_FR','Biélorussie',NULL,NULL,NULL),(24,'it_IT',NULL,NULL,NULL,NULL),(24,'ru_RU','Белорусь',NULL,NULL,NULL),(25,'cs_CZ',NULL,NULL,NULL,NULL),(25,'de_DE','Birma',NULL,NULL,NULL),(25,'en_US','Burma',NULL,NULL,NULL),(25,'es_ES','Birmania',NULL,NULL,NULL),(25,'fr_FR','Birmanie',NULL,NULL,NULL),(25,'it_IT',NULL,NULL,NULL,NULL),(25,'ru_RU','Бирма',NULL,NULL,NULL),(26,'cs_CZ',NULL,NULL,NULL,NULL),(26,'de_DE','Bolivien',NULL,NULL,NULL),(26,'en_US','Bolivia',NULL,NULL,NULL),(26,'es_ES','Bolivia',NULL,NULL,NULL),(26,'fr_FR','Bolivie',NULL,NULL,NULL),(26,'it_IT',NULL,NULL,NULL,NULL),(26,'ru_RU','Боливия',NULL,NULL,NULL),(27,'cs_CZ',NULL,NULL,NULL,NULL),(27,'de_DE','Bosnien Herzegovina',NULL,NULL,NULL),(27,'en_US','Bosnia and Herzegovina',NULL,NULL,NULL),(27,'es_ES','Bosnia y Herzegovina',NULL,NULL,NULL),(27,'fr_FR','Bosnie-Herzégovine',NULL,NULL,NULL),(27,'it_IT',NULL,NULL,NULL,NULL),(27,'ru_RU','Босния и Герцеговина',NULL,NULL,NULL),(28,'cs_CZ',NULL,NULL,NULL,NULL),(28,'de_DE','Botswana',NULL,NULL,NULL),(28,'en_US','Botswana',NULL,NULL,NULL),(28,'es_ES','Botswana',NULL,NULL,NULL),(28,'fr_FR','Botswana',NULL,NULL,NULL),(28,'it_IT',NULL,NULL,NULL,NULL),(28,'ru_RU','Ботсвана',NULL,NULL,NULL),(29,'cs_CZ',NULL,NULL,NULL,NULL),(29,'de_DE','Brasilien',NULL,NULL,NULL),(29,'en_US','Brazil',NULL,NULL,NULL),(29,'es_ES','Brasil',NULL,NULL,NULL),(29,'fr_FR','Brésil',NULL,NULL,NULL),(29,'it_IT',NULL,NULL,NULL,NULL),(29,'ru_RU','Бразилия',NULL,NULL,NULL),(30,'cs_CZ',NULL,NULL,NULL,NULL),(30,'de_DE','Brunei',NULL,NULL,NULL),(30,'en_US','Brunei',NULL,NULL,NULL),(30,'es_ES','Brunei',NULL,NULL,NULL),(30,'fr_FR','Brunei',NULL,NULL,NULL),(30,'it_IT',NULL,NULL,NULL,NULL),(30,'ru_RU','Бруней',NULL,NULL,NULL),(31,'cs_CZ',NULL,NULL,NULL,NULL),(31,'de_DE','Bulgarien',NULL,NULL,NULL),(31,'en_US','Bulgaria',NULL,NULL,NULL),(31,'es_ES','Bulgaria',NULL,NULL,NULL),(31,'fr_FR','Bulgarie',NULL,NULL,NULL),(31,'it_IT',NULL,NULL,NULL,NULL),(31,'ru_RU','Болгария',NULL,NULL,NULL),(32,'cs_CZ',NULL,NULL,NULL,NULL),(32,'de_DE','Burkina Faso',NULL,NULL,NULL),(32,'en_US','Burkina',NULL,NULL,NULL),(32,'es_ES','Burkina',NULL,NULL,NULL),(32,'fr_FR','Burkina',NULL,NULL,NULL),(32,'it_IT',NULL,NULL,NULL,NULL),(32,'ru_RU','Буркина',NULL,NULL,NULL),(33,'cs_CZ',NULL,NULL,NULL,NULL),(33,'de_DE','Burundi',NULL,NULL,NULL),(33,'en_US','Burundi',NULL,NULL,NULL),(33,'es_ES','Burundi',NULL,NULL,NULL),(33,'fr_FR','Burundi',NULL,NULL,NULL),(33,'it_IT',NULL,NULL,NULL,NULL),(33,'ru_RU','Бурунди',NULL,NULL,NULL),(34,'cs_CZ',NULL,NULL,NULL,NULL),(34,'de_DE','Kambodscha',NULL,NULL,NULL),(34,'en_US','Cambodia',NULL,NULL,NULL),(34,'es_ES','Camboya',NULL,NULL,NULL),(34,'fr_FR','Cambodge',NULL,NULL,NULL),(34,'it_IT',NULL,NULL,NULL,NULL),(34,'ru_RU','Камбоджа',NULL,NULL,NULL),(35,'cs_CZ',NULL,NULL,NULL,NULL),(35,'de_DE','Kamerun',NULL,NULL,NULL),(35,'en_US','Cameroon',NULL,NULL,NULL),(35,'es_ES','Camerún',NULL,NULL,NULL),(35,'fr_FR','Cameroun',NULL,NULL,NULL),(35,'it_IT',NULL,NULL,NULL,NULL),(35,'ru_RU','Камерун',NULL,NULL,NULL),(37,'cs_CZ',NULL,NULL,NULL,NULL),(37,'de_DE','Kap Verde',NULL,NULL,NULL),(37,'en_US','Cape Verde',NULL,NULL,NULL),(37,'es_ES','Cabo Verde',NULL,NULL,NULL),(37,'fr_FR','Cap-Vert',NULL,NULL,NULL),(37,'it_IT',NULL,NULL,NULL,NULL),(37,'ru_RU','Кабо-Верде',NULL,NULL,NULL),(38,'cs_CZ',NULL,NULL,NULL,NULL),(38,'de_DE','Chile',NULL,NULL,NULL),(38,'en_US','Chile',NULL,NULL,NULL),(38,'es_ES','Chile',NULL,NULL,NULL),(38,'fr_FR','Chili',NULL,NULL,NULL),(38,'it_IT',NULL,NULL,NULL,NULL),(38,'ru_RU','Чили',NULL,NULL,NULL),(39,'cs_CZ',NULL,NULL,NULL,NULL),(39,'de_DE','China',NULL,NULL,NULL),(39,'en_US','China',NULL,NULL,NULL),(39,'es_ES','China',NULL,NULL,NULL),(39,'fr_FR','Chine',NULL,NULL,NULL),(39,'it_IT',NULL,NULL,NULL,NULL),(39,'ru_RU','Китай',NULL,NULL,NULL),(40,'cs_CZ',NULL,NULL,NULL,NULL),(40,'de_DE','Zypern',NULL,NULL,NULL),(40,'en_US','Cyprus',NULL,NULL,NULL),(40,'es_ES','Chipre',NULL,NULL,NULL),(40,'fr_FR','Chypre',NULL,NULL,NULL),(40,'it_IT',NULL,NULL,NULL,NULL),(40,'ru_RU','Кипр',NULL,NULL,NULL),(41,'cs_CZ',NULL,NULL,NULL,NULL),(41,'de_DE','Kolumbien',NULL,NULL,NULL),(41,'en_US','Colombia',NULL,NULL,NULL),(41,'es_ES','Colombia',NULL,NULL,NULL),(41,'fr_FR','Colombie',NULL,NULL,NULL),(41,'it_IT',NULL,NULL,NULL,NULL),(41,'ru_RU','Колумбия',NULL,NULL,NULL),(42,'cs_CZ',NULL,NULL,NULL,NULL),(42,'de_DE','Komoren',NULL,NULL,NULL),(42,'en_US','Comoros',NULL,NULL,NULL),(42,'es_ES','Comoras',NULL,NULL,NULL),(42,'fr_FR','Comores',NULL,NULL,NULL),(42,'it_IT',NULL,NULL,NULL,NULL),(42,'ru_RU','Коморские',NULL,NULL,NULL),(43,'cs_CZ',NULL,NULL,NULL,NULL),(43,'de_DE','Kongo',NULL,NULL,NULL),(43,'en_US','Congo',NULL,NULL,NULL),(43,'es_ES','Congo',NULL,NULL,NULL),(43,'fr_FR','Congo',NULL,NULL,NULL),(43,'it_IT',NULL,NULL,NULL,NULL),(43,'ru_RU','Конго',NULL,NULL,NULL),(44,'cs_CZ',NULL,NULL,NULL,NULL),(44,'de_DE','Cookinseln',NULL,NULL,NULL),(44,'en_US','Cook Islands',NULL,NULL,NULL),(44,'es_ES','Cook',NULL,NULL,NULL),(44,'fr_FR','Cook',NULL,NULL,NULL),(44,'it_IT',NULL,NULL,NULL,NULL),(44,'ru_RU','Острова Кука',NULL,NULL,NULL),(45,'cs_CZ',NULL,NULL,NULL,NULL),(45,'de_DE','Nordkorea',NULL,NULL,NULL),(45,'en_US','North Korea',NULL,NULL,NULL),(45,'es_ES','Corea del Norte',NULL,NULL,NULL),(45,'fr_FR','Corée du Nord',NULL,NULL,NULL),(45,'it_IT',NULL,NULL,NULL,NULL),(45,'ru_RU','Северная Корея',NULL,NULL,NULL),(46,'cs_CZ',NULL,NULL,NULL,NULL),(46,'de_DE','Südkorea',NULL,NULL,NULL),(46,'en_US','South Korea',NULL,NULL,NULL),(46,'es_ES','Corea del Sur',NULL,NULL,NULL),(46,'fr_FR','Corée du Sud',NULL,NULL,NULL),(46,'it_IT',NULL,NULL,NULL,NULL),(46,'ru_RU','Южная Корея',NULL,NULL,NULL),(47,'cs_CZ',NULL,NULL,NULL,NULL),(47,'de_DE','Costa Rica',NULL,NULL,NULL),(47,'en_US','Costa Rica',NULL,NULL,NULL),(47,'es_ES','Costa Rica',NULL,NULL,NULL),(47,'fr_FR','Costa Rica',NULL,NULL,NULL),(47,'it_IT',NULL,NULL,NULL,NULL),(47,'ru_RU','Коста-Рика',NULL,NULL,NULL),(48,'cs_CZ',NULL,NULL,NULL,NULL),(48,'de_DE','Elfenbeinküste',NULL,NULL,NULL),(48,'en_US','Ivory Coast',NULL,NULL,NULL),(48,'es_ES','Costa de Marfil',NULL,NULL,NULL),(48,'fr_FR','Côte dIvoire',NULL,NULL,NULL),(48,'it_IT',NULL,NULL,NULL,NULL),(48,'ru_RU','Кот-д\'Ивуар',NULL,NULL,NULL),(49,'cs_CZ',NULL,NULL,NULL,NULL),(49,'de_DE','Kroatien',NULL,NULL,NULL),(49,'en_US','Croatia',NULL,NULL,NULL),(49,'es_ES','Croacia',NULL,NULL,NULL),(49,'fr_FR','Croatie',NULL,NULL,NULL),(49,'it_IT',NULL,NULL,NULL,NULL),(49,'ru_RU','Хорватия',NULL,NULL,NULL),(50,'cs_CZ',NULL,NULL,NULL,NULL),(50,'de_DE','Kuba',NULL,NULL,NULL),(50,'en_US','Cuba',NULL,NULL,NULL),(50,'es_ES','Cuba',NULL,NULL,NULL),(50,'fr_FR','Cuba',NULL,NULL,NULL),(50,'it_IT',NULL,NULL,NULL,NULL),(50,'ru_RU','Куба',NULL,NULL,NULL),(51,'cs_CZ',NULL,NULL,NULL,NULL),(51,'de_DE','Dänemark',NULL,NULL,NULL),(51,'en_US','Denmark',NULL,NULL,NULL),(51,'es_ES','Dinamarca',NULL,NULL,NULL),(51,'fr_FR','Danemark',NULL,NULL,NULL),(51,'it_IT',NULL,NULL,NULL,NULL),(51,'ru_RU','Дания',NULL,NULL,NULL),(52,'cs_CZ',NULL,NULL,NULL,NULL),(52,'de_DE','Djibuti',NULL,NULL,NULL),(52,'en_US','Djibouti',NULL,NULL,NULL),(52,'es_ES','Djibouti',NULL,NULL,NULL),(52,'fr_FR','Djibouti',NULL,NULL,NULL),(52,'it_IT',NULL,NULL,NULL,NULL),(52,'ru_RU','Джибути',NULL,NULL,NULL),(53,'cs_CZ',NULL,NULL,NULL,NULL),(53,'de_DE','Dominikanische Republik',NULL,NULL,NULL),(53,'en_US','Dominica',NULL,NULL,NULL),(53,'es_ES','Dominica',NULL,NULL,NULL),(53,'fr_FR','Dominique',NULL,NULL,NULL),(53,'it_IT',NULL,NULL,NULL,NULL),(53,'ru_RU','Доминика',NULL,NULL,NULL),(54,'cs_CZ',NULL,NULL,NULL,NULL),(54,'de_DE','Ägypten',NULL,NULL,NULL),(54,'en_US','Egypt',NULL,NULL,NULL),(54,'es_ES','Egipto',NULL,NULL,NULL),(54,'fr_FR','Égypte',NULL,NULL,NULL),(54,'it_IT',NULL,NULL,NULL,NULL),(54,'ru_RU','Египет',NULL,NULL,NULL),(55,'cs_CZ',NULL,NULL,NULL,NULL),(55,'de_DE','Vereinigte Arabische Emirate',NULL,NULL,NULL),(55,'en_US','United Arab Emirates',NULL,NULL,NULL),(55,'es_ES','Emiratos Árabes Unidos',NULL,NULL,NULL),(55,'fr_FR','Émirats arabes unis',NULL,NULL,NULL),(55,'it_IT',NULL,NULL,NULL,NULL),(55,'ru_RU','Объединенные Арабские Эмираты',NULL,NULL,NULL),(56,'cs_CZ',NULL,NULL,NULL,NULL),(56,'de_DE','Ecuador',NULL,NULL,NULL),(56,'en_US','Ecuador',NULL,NULL,NULL),(56,'es_ES','Ecuador',NULL,NULL,NULL),(56,'fr_FR','Équateur',NULL,NULL,NULL),(56,'it_IT',NULL,NULL,NULL,NULL),(56,'ru_RU','Эквадор',NULL,NULL,NULL),(57,'cs_CZ',NULL,NULL,NULL,NULL),(57,'de_DE','Eritrea',NULL,NULL,NULL),(57,'en_US','Eritrea',NULL,NULL,NULL),(57,'es_ES','Eritrea',NULL,NULL,NULL),(57,'fr_FR','Érythrée',NULL,NULL,NULL),(57,'it_IT',NULL,NULL,NULL,NULL),(57,'ru_RU','Эритрея',NULL,NULL,NULL),(58,'cs_CZ',NULL,NULL,NULL,NULL),(58,'de_DE','Spanien',NULL,NULL,NULL),(58,'en_US','Spain',NULL,NULL,NULL),(58,'es_ES','España',NULL,NULL,NULL),(58,'fr_FR','Espagne',NULL,NULL,NULL),(58,'it_IT',NULL,NULL,NULL,NULL),(58,'ru_RU','Испания',NULL,NULL,NULL),(59,'cs_CZ',NULL,NULL,NULL,NULL),(59,'de_DE','Estland',NULL,NULL,NULL),(59,'en_US','Estonia',NULL,NULL,NULL),(59,'es_ES','Estonia',NULL,NULL,NULL),(59,'fr_FR','Estonie',NULL,NULL,NULL),(59,'it_IT',NULL,NULL,NULL,NULL),(59,'ru_RU','Эстония',NULL,NULL,NULL),(61,'cs_CZ',NULL,NULL,NULL,NULL),(61,'de_DE','Äthiopien',NULL,NULL,NULL),(61,'en_US','Ethiopia',NULL,NULL,NULL),(61,'es_ES','Etiopía',NULL,NULL,NULL),(61,'fr_FR','Éthiopie',NULL,NULL,NULL),(61,'it_IT',NULL,NULL,NULL,NULL),(61,'ru_RU','Эфиопия',NULL,NULL,NULL),(62,'cs_CZ',NULL,NULL,NULL,NULL),(62,'de_DE','Fiji',NULL,NULL,NULL),(62,'en_US','Fiji',NULL,NULL,NULL),(62,'es_ES','Fiji',NULL,NULL,NULL),(62,'fr_FR','Fidji',NULL,NULL,NULL),(62,'it_IT',NULL,NULL,NULL,NULL),(62,'ru_RU','Фиджи',NULL,NULL,NULL),(63,'cs_CZ',NULL,NULL,NULL,NULL),(63,'de_DE','Finnland',NULL,NULL,NULL),(63,'en_US','Finland',NULL,NULL,NULL),(63,'es_ES','Finlandia',NULL,NULL,NULL),(63,'fr_FR','Finlande',NULL,NULL,NULL),(63,'it_IT',NULL,NULL,NULL,NULL),(63,'ru_RU','Финляндия',NULL,NULL,NULL),(64,'cs_CZ',NULL,NULL,NULL,NULL),(64,'de_DE','Frankreich',NULL,NULL,NULL),(64,'en_US','France metropolitan',NULL,NULL,NULL),(64,'es_ES','Francia',NULL,NULL,NULL),(64,'fr_FR','France métropolitaine',NULL,NULL,NULL),(64,'it_IT',NULL,NULL,NULL,NULL),(64,'ru_RU','Франция столичная',NULL,NULL,NULL),(65,'cs_CZ',NULL,NULL,NULL,NULL),(65,'de_DE','Gabun',NULL,NULL,NULL),(65,'en_US','Gabon',NULL,NULL,NULL),(65,'es_ES','Gabón',NULL,NULL,NULL),(65,'fr_FR','Gabon',NULL,NULL,NULL),(65,'it_IT',NULL,NULL,NULL,NULL),(65,'ru_RU','Габон',NULL,NULL,NULL),(66,'cs_CZ',NULL,NULL,NULL,NULL),(66,'de_DE','Gambie',NULL,NULL,NULL),(66,'en_US','Gambia',NULL,NULL,NULL),(66,'es_ES','Gambia',NULL,NULL,NULL),(66,'fr_FR','Gambie',NULL,NULL,NULL),(66,'it_IT',NULL,NULL,NULL,NULL),(66,'ru_RU','Гамбия',NULL,NULL,NULL),(67,'cs_CZ',NULL,NULL,NULL,NULL),(67,'de_DE','Georgien',NULL,NULL,NULL),(67,'en_US','Georgia',NULL,NULL,NULL),(67,'es_ES','Georgia',NULL,NULL,NULL),(67,'fr_FR','Géorgie',NULL,NULL,NULL),(67,'it_IT',NULL,NULL,NULL,NULL),(67,'ru_RU','Джорджия',NULL,NULL,NULL),(68,'cs_CZ',NULL,NULL,NULL,NULL),(68,'de_DE','Ghana',NULL,NULL,NULL),(68,'en_US','Ghana',NULL,NULL,NULL),(68,'es_ES','Ghana',NULL,NULL,NULL),(68,'fr_FR','Ghana',NULL,NULL,NULL),(68,'it_IT',NULL,NULL,NULL,NULL),(68,'ru_RU','Гана',NULL,NULL,NULL),(69,'cs_CZ',NULL,NULL,NULL,NULL),(69,'de_DE','Griechenland',NULL,NULL,NULL),(69,'en_US','Greece',NULL,NULL,NULL),(69,'es_ES','Grecia',NULL,NULL,NULL),(69,'fr_FR','Grèce',NULL,NULL,NULL),(69,'it_IT',NULL,NULL,NULL,NULL),(69,'ru_RU','Греция',NULL,NULL,NULL),(70,'cs_CZ',NULL,NULL,NULL,NULL),(70,'de_DE','Grenada',NULL,NULL,NULL),(70,'en_US','Grenada',NULL,NULL,NULL),(70,'es_ES','Granada',NULL,NULL,NULL),(70,'fr_FR','Grenade',NULL,NULL,NULL),(70,'it_IT',NULL,NULL,NULL,NULL),(70,'ru_RU','Гренада',NULL,NULL,NULL),(71,'cs_CZ',NULL,NULL,NULL,NULL),(71,'de_DE','Guatemala',NULL,NULL,NULL),(71,'en_US','Guatemala',NULL,NULL,NULL),(71,'es_ES','Guatemala',NULL,NULL,NULL),(71,'fr_FR','Guatemala',NULL,NULL,NULL),(71,'it_IT',NULL,NULL,NULL,NULL),(71,'ru_RU','Гватемала',NULL,NULL,NULL),(72,'cs_CZ',NULL,NULL,NULL,NULL),(72,'de_DE','Guinea',NULL,NULL,NULL),(72,'en_US','Guinea',NULL,NULL,NULL),(72,'es_ES','Guinea',NULL,NULL,NULL),(72,'fr_FR','Guinée',NULL,NULL,NULL),(72,'it_IT',NULL,NULL,NULL,NULL),(72,'ru_RU','Гвинея',NULL,NULL,NULL),(73,'cs_CZ',NULL,NULL,NULL,NULL),(73,'de_DE','Guinea-Bissau',NULL,NULL,NULL),(73,'en_US','Guinea-Bissau',NULL,NULL,NULL),(73,'es_ES','Guinea-Bissau',NULL,NULL,NULL),(73,'fr_FR','Guinée-Bissao',NULL,NULL,NULL),(73,'it_IT',NULL,NULL,NULL,NULL),(73,'ru_RU','Гвинея-Бисау',NULL,NULL,NULL),(74,'cs_CZ',NULL,NULL,NULL,NULL),(74,'de_DE','Äquatorialguinea',NULL,NULL,NULL),(74,'en_US','Equatorial Guinea',NULL,NULL,NULL),(74,'es_ES','Guinea Ecuatorial',NULL,NULL,NULL),(74,'fr_FR','Guinée équatoriale',NULL,NULL,NULL),(74,'it_IT',NULL,NULL,NULL,NULL),(74,'ru_RU','Экваториальная Гвинея',NULL,NULL,NULL),(75,'cs_CZ',NULL,NULL,NULL,NULL),(75,'de_DE','Guyana',NULL,NULL,NULL),(75,'en_US','Guyana',NULL,NULL,NULL),(75,'es_ES','Guyana',NULL,NULL,NULL),(75,'fr_FR','Guyane',NULL,NULL,NULL),(75,'it_IT',NULL,NULL,NULL,NULL),(75,'ru_RU','Гайана',NULL,NULL,NULL),(76,'cs_CZ',NULL,NULL,NULL,NULL),(76,'de_DE','Haiti',NULL,NULL,NULL),(76,'en_US','Haiti',NULL,NULL,NULL),(76,'es_ES','Haití',NULL,NULL,NULL),(76,'fr_FR','Haïti',NULL,NULL,NULL),(76,'it_IT',NULL,NULL,NULL,NULL),(76,'ru_RU','Гаити',NULL,NULL,NULL),(77,'cs_CZ',NULL,NULL,NULL,NULL),(77,'de_DE','Honduras',NULL,NULL,NULL),(77,'en_US','Honduras',NULL,NULL,NULL),(77,'es_ES','Honduras',NULL,NULL,NULL),(77,'fr_FR','Honduras',NULL,NULL,NULL),(77,'it_IT',NULL,NULL,NULL,NULL),(77,'ru_RU','Гондурас',NULL,NULL,NULL),(78,'cs_CZ',NULL,NULL,NULL,NULL),(78,'de_DE','Ungarn',NULL,NULL,NULL),(78,'en_US','Hungary',NULL,NULL,NULL),(78,'es_ES','Hungría',NULL,NULL,NULL),(78,'fr_FR','Hongrie',NULL,NULL,NULL),(78,'it_IT',NULL,NULL,NULL,NULL),(78,'ru_RU','Венгрия',NULL,NULL,NULL),(79,'cs_CZ',NULL,NULL,NULL,NULL),(79,'de_DE','Indien',NULL,NULL,NULL),(79,'en_US','India',NULL,NULL,NULL),(79,'es_ES','India',NULL,NULL,NULL),(79,'fr_FR','Inde',NULL,NULL,NULL),(79,'it_IT',NULL,NULL,NULL,NULL),(79,'ru_RU','Индия',NULL,NULL,NULL),(80,'cs_CZ',NULL,NULL,NULL,NULL),(80,'de_DE','Indonesien',NULL,NULL,NULL),(80,'en_US','Indonesia',NULL,NULL,NULL),(80,'es_ES','Indonesia',NULL,NULL,NULL),(80,'fr_FR','Indonésie',NULL,NULL,NULL),(80,'it_IT',NULL,NULL,NULL,NULL),(80,'ru_RU','Индонезия',NULL,NULL,NULL),(81,'cs_CZ',NULL,NULL,NULL,NULL),(81,'de_DE','Iran',NULL,NULL,NULL),(81,'en_US','Iran',NULL,NULL,NULL),(81,'es_ES','Irán',NULL,NULL,NULL),(81,'fr_FR','Iran',NULL,NULL,NULL),(81,'it_IT',NULL,NULL,NULL,NULL),(81,'ru_RU','Иран',NULL,NULL,NULL),(82,'cs_CZ',NULL,NULL,NULL,NULL),(82,'de_DE','Irak',NULL,NULL,NULL),(82,'en_US','Iraq',NULL,NULL,NULL),(82,'es_ES','Iraq',NULL,NULL,NULL),(82,'fr_FR','Iraq',NULL,NULL,NULL),(82,'it_IT',NULL,NULL,NULL,NULL),(82,'ru_RU','Ирак',NULL,NULL,NULL),(83,'cs_CZ',NULL,NULL,NULL,NULL),(83,'de_DE','Irland',NULL,NULL,NULL),(83,'en_US','Ireland',NULL,NULL,NULL),(83,'es_ES','Irlanda',NULL,NULL,NULL),(83,'fr_FR','Irlande',NULL,NULL,NULL),(83,'it_IT',NULL,NULL,NULL,NULL),(83,'ru_RU','Ирландия',NULL,NULL,NULL),(84,'cs_CZ',NULL,NULL,NULL,NULL),(84,'de_DE','Island',NULL,NULL,NULL),(84,'en_US','Iceland',NULL,NULL,NULL),(84,'es_ES','Islandia',NULL,NULL,NULL),(84,'fr_FR','Islande',NULL,NULL,NULL),(84,'it_IT',NULL,NULL,NULL,NULL),(84,'ru_RU','Исландия',NULL,NULL,NULL),(85,'cs_CZ',NULL,NULL,NULL,NULL),(85,'de_DE','Israel',NULL,NULL,NULL),(85,'en_US','Israel',NULL,NULL,NULL),(85,'es_ES','Israel',NULL,NULL,NULL),(85,'fr_FR','Israël',NULL,NULL,NULL),(85,'it_IT',NULL,NULL,NULL,NULL),(85,'ru_RU','Израиль',NULL,NULL,NULL),(86,'cs_CZ',NULL,NULL,NULL,NULL),(86,'de_DE','Italien',NULL,NULL,NULL),(86,'en_US','Italy',NULL,NULL,NULL),(86,'es_ES','Italia',NULL,NULL,NULL),(86,'fr_FR','Italie',NULL,NULL,NULL),(86,'it_IT',NULL,NULL,NULL,NULL),(86,'ru_RU','Италия',NULL,NULL,NULL),(87,'cs_CZ',NULL,NULL,NULL,NULL),(87,'de_DE','Jamaika',NULL,NULL,NULL),(87,'en_US','Jamaica',NULL,NULL,NULL),(87,'es_ES','Jamaica',NULL,NULL,NULL),(87,'fr_FR','Jamaïque',NULL,NULL,NULL),(87,'it_IT',NULL,NULL,NULL,NULL),(87,'ru_RU','Ямайка',NULL,NULL,NULL),(88,'cs_CZ',NULL,NULL,NULL,NULL),(88,'de_DE','Japan',NULL,NULL,NULL),(88,'en_US','Japan',NULL,NULL,NULL),(88,'es_ES','Japón',NULL,NULL,NULL),(88,'fr_FR','Japon',NULL,NULL,NULL),(88,'it_IT',NULL,NULL,NULL,NULL),(88,'ru_RU','Япония',NULL,NULL,NULL),(89,'cs_CZ',NULL,NULL,NULL,NULL),(89,'de_DE','Jordanien',NULL,NULL,NULL),(89,'en_US','Jordan',NULL,NULL,NULL),(89,'es_ES','Jordania',NULL,NULL,NULL),(89,'fr_FR','Jordanie',NULL,NULL,NULL),(89,'it_IT',NULL,NULL,NULL,NULL),(89,'ru_RU','Иордания',NULL,NULL,NULL),(90,'cs_CZ',NULL,NULL,NULL,NULL),(90,'de_DE','Kasachstan',NULL,NULL,NULL),(90,'en_US','Kazakhstan',NULL,NULL,NULL),(90,'es_ES','Kazajstán',NULL,NULL,NULL),(90,'fr_FR','Kazakhstan',NULL,NULL,NULL),(90,'it_IT',NULL,NULL,NULL,NULL),(90,'ru_RU','Казахстан',NULL,NULL,NULL),(91,'cs_CZ',NULL,NULL,NULL,NULL),(91,'de_DE','Kenia',NULL,NULL,NULL),(91,'en_US','Kenya',NULL,NULL,NULL),(91,'es_ES','Kenia',NULL,NULL,NULL),(91,'fr_FR','Kenya',NULL,NULL,NULL),(91,'it_IT',NULL,NULL,NULL,NULL),(91,'ru_RU','Кения',NULL,NULL,NULL),(92,'cs_CZ',NULL,NULL,NULL,NULL),(92,'de_DE','Kirgisistan',NULL,NULL,NULL),(92,'en_US','Kyrgyzstan',NULL,NULL,NULL),(92,'es_ES','Kirguistán',NULL,NULL,NULL),(92,'fr_FR','Kirghizistan',NULL,NULL,NULL),(92,'it_IT',NULL,NULL,NULL,NULL),(92,'ru_RU','Кыргызстан',NULL,NULL,NULL),(93,'cs_CZ',NULL,NULL,NULL,NULL),(93,'de_DE','Kiribati',NULL,NULL,NULL),(93,'en_US','Kiribati',NULL,NULL,NULL),(93,'es_ES','Kiribati',NULL,NULL,NULL),(93,'fr_FR','Kiribati',NULL,NULL,NULL),(93,'it_IT',NULL,NULL,NULL,NULL),(93,'ru_RU','Кирибати',NULL,NULL,NULL),(94,'cs_CZ',NULL,NULL,NULL,NULL),(94,'de_DE','Kuwait',NULL,NULL,NULL),(94,'en_US','Kuwait',NULL,NULL,NULL),(94,'es_ES','Kuwait',NULL,NULL,NULL),(94,'fr_FR','Koweït',NULL,NULL,NULL),(94,'it_IT',NULL,NULL,NULL,NULL),(94,'ru_RU','Кувейт',NULL,NULL,NULL),(95,'cs_CZ',NULL,NULL,NULL,NULL),(95,'de_DE','Laos',NULL,NULL,NULL),(95,'en_US','Laos',NULL,NULL,NULL),(95,'es_ES','Laos',NULL,NULL,NULL),(95,'fr_FR','Laos',NULL,NULL,NULL),(95,'it_IT',NULL,NULL,NULL,NULL),(95,'ru_RU','Лаос',NULL,NULL,NULL),(96,'cs_CZ',NULL,NULL,NULL,NULL),(96,'de_DE','Lesotho',NULL,NULL,NULL),(96,'en_US','Lesotho',NULL,NULL,NULL),(96,'es_ES','Lesoto',NULL,NULL,NULL),(96,'fr_FR','Lesotho',NULL,NULL,NULL),(96,'it_IT',NULL,NULL,NULL,NULL),(96,'ru_RU','Лесото',NULL,NULL,NULL),(97,'cs_CZ',NULL,NULL,NULL,NULL),(97,'de_DE','Lettland',NULL,NULL,NULL),(97,'en_US','Latvia',NULL,NULL,NULL),(97,'es_ES','Letonia',NULL,NULL,NULL),(97,'fr_FR','Lettonie',NULL,NULL,NULL),(97,'it_IT',NULL,NULL,NULL,NULL),(97,'ru_RU','Латвия',NULL,NULL,NULL),(98,'cs_CZ',NULL,NULL,NULL,NULL),(98,'de_DE','Libanon',NULL,NULL,NULL),(98,'en_US','Lebanon',NULL,NULL,NULL),(98,'es_ES','Líbano',NULL,NULL,NULL),(98,'fr_FR','Liban',NULL,NULL,NULL),(98,'it_IT',NULL,NULL,NULL,NULL),(98,'ru_RU','Ливан',NULL,NULL,NULL),(99,'cs_CZ',NULL,NULL,NULL,NULL),(99,'de_DE','Liberia',NULL,NULL,NULL),(99,'en_US','Liberia',NULL,NULL,NULL),(99,'es_ES','Liberia',NULL,NULL,NULL),(99,'fr_FR','Liberia',NULL,NULL,NULL),(99,'it_IT',NULL,NULL,NULL,NULL),(99,'ru_RU','Либерия',NULL,NULL,NULL),(100,'cs_CZ',NULL,NULL,NULL,NULL),(100,'de_DE','Libyen',NULL,NULL,NULL),(100,'en_US','Libya',NULL,NULL,NULL),(100,'es_ES','Libia',NULL,NULL,NULL),(100,'fr_FR','Libye',NULL,NULL,NULL),(100,'it_IT',NULL,NULL,NULL,NULL),(100,'ru_RU','Ливия',NULL,NULL,NULL),(101,'cs_CZ',NULL,NULL,NULL,NULL),(101,'de_DE','Liechtenstein',NULL,NULL,NULL),(101,'en_US','Liechtenstein',NULL,NULL,NULL),(101,'es_ES','Liechtenstein',NULL,NULL,NULL),(101,'fr_FR','Liechtenstein',NULL,NULL,NULL),(101,'it_IT',NULL,NULL,NULL,NULL),(101,'ru_RU','Лихтенштейн',NULL,NULL,NULL),(102,'cs_CZ',NULL,NULL,NULL,NULL),(102,'de_DE','Litauen',NULL,NULL,NULL),(102,'en_US','Lithuania',NULL,NULL,NULL),(102,'es_ES','Lituania',NULL,NULL,NULL),(102,'fr_FR','Lituanie',NULL,NULL,NULL),(102,'it_IT',NULL,NULL,NULL,NULL),(102,'ru_RU','Литва',NULL,NULL,NULL),(103,'cs_CZ',NULL,NULL,NULL,NULL),(103,'de_DE','Luxemburg',NULL,NULL,NULL),(103,'en_US','Luxembourg',NULL,NULL,NULL),(103,'es_ES','Luxemburgo',NULL,NULL,NULL),(103,'fr_FR','Luxembourg',NULL,NULL,NULL),(103,'it_IT',NULL,NULL,NULL,NULL),(103,'ru_RU','Люксембург',NULL,NULL,NULL),(104,'cs_CZ',NULL,NULL,NULL,NULL),(104,'de_DE','Mazedonien',NULL,NULL,NULL),(104,'en_US','Macedonia',NULL,NULL,NULL),(104,'es_ES','Macedonia',NULL,NULL,NULL),(104,'fr_FR','Macédoine',NULL,NULL,NULL),(104,'it_IT',NULL,NULL,NULL,NULL),(104,'ru_RU','Македония',NULL,NULL,NULL),(105,'cs_CZ',NULL,NULL,NULL,NULL),(105,'de_DE','Madagaskar',NULL,NULL,NULL),(105,'en_US','Madagascar',NULL,NULL,NULL),(105,'es_ES','Madagascar',NULL,NULL,NULL),(105,'fr_FR','Madagascar',NULL,NULL,NULL),(105,'it_IT',NULL,NULL,NULL,NULL),(105,'ru_RU','Мадагаскар',NULL,NULL,NULL),(106,'cs_CZ',NULL,NULL,NULL,NULL),(106,'de_DE','Malaysien',NULL,NULL,NULL),(106,'en_US','Malaysia',NULL,NULL,NULL),(106,'es_ES','Malasia',NULL,NULL,NULL),(106,'fr_FR','Malaisie',NULL,NULL,NULL),(106,'it_IT',NULL,NULL,NULL,NULL),(106,'ru_RU','Малайзия',NULL,NULL,NULL),(107,'cs_CZ',NULL,NULL,NULL,NULL),(107,'de_DE','Malawi',NULL,NULL,NULL),(107,'en_US','Malawi',NULL,NULL,NULL),(107,'es_ES','Malawi',NULL,NULL,NULL),(107,'fr_FR','Malawi',NULL,NULL,NULL),(107,'it_IT',NULL,NULL,NULL,NULL),(107,'ru_RU','Малави',NULL,NULL,NULL),(108,'cs_CZ',NULL,NULL,NULL,NULL),(108,'de_DE','Malediven',NULL,NULL,NULL),(108,'en_US','Maldives',NULL,NULL,NULL),(108,'es_ES','Maldivas',NULL,NULL,NULL),(108,'fr_FR','Maldives',NULL,NULL,NULL),(108,'it_IT',NULL,NULL,NULL,NULL),(108,'ru_RU','Мальдивы',NULL,NULL,NULL),(109,'cs_CZ',NULL,NULL,NULL,NULL),(109,'de_DE','Mali',NULL,NULL,NULL),(109,'en_US','Mali',NULL,NULL,NULL),(109,'es_ES','Malí',NULL,NULL,NULL),(109,'fr_FR','Mali',NULL,NULL,NULL),(109,'it_IT',NULL,NULL,NULL,NULL),(109,'ru_RU','Мали',NULL,NULL,NULL),(110,'cs_CZ',NULL,NULL,NULL,NULL),(110,'de_DE','Malta',NULL,NULL,NULL),(110,'en_US','Malta',NULL,NULL,NULL),(110,'es_ES','Malta',NULL,NULL,NULL),(110,'fr_FR','Malte',NULL,NULL,NULL),(110,'it_IT',NULL,NULL,NULL,NULL),(110,'ru_RU','Мальта',NULL,NULL,NULL),(111,'cs_CZ',NULL,NULL,NULL,NULL),(111,'de_DE','Marokko',NULL,NULL,NULL),(111,'en_US','Morocco',NULL,NULL,NULL),(111,'es_ES','Marruecos',NULL,NULL,NULL),(111,'fr_FR','Maroc',NULL,NULL,NULL),(111,'it_IT',NULL,NULL,NULL,NULL),(111,'ru_RU','Марокко',NULL,NULL,NULL),(112,'cs_CZ',NULL,NULL,NULL,NULL),(112,'de_DE','Marshallinseln',NULL,NULL,NULL),(112,'en_US','Marshall Islands',NULL,NULL,NULL),(112,'es_ES','Marshall',NULL,NULL,NULL),(112,'fr_FR','Marshall',NULL,NULL,NULL),(112,'it_IT',NULL,NULL,NULL,NULL),(112,'ru_RU','Маршалловы острова',NULL,NULL,NULL),(113,'cs_CZ',NULL,NULL,NULL,NULL),(113,'de_DE','Mauritius',NULL,NULL,NULL),(113,'en_US','Mauritius',NULL,NULL,NULL),(113,'es_ES','Mauricio',NULL,NULL,NULL),(113,'fr_FR','Maurice',NULL,NULL,NULL),(113,'it_IT',NULL,NULL,NULL,NULL),(113,'ru_RU','Маврикий',NULL,NULL,NULL),(114,'cs_CZ',NULL,NULL,NULL,NULL),(114,'de_DE','Mauretanien',NULL,NULL,NULL),(114,'en_US','Mauritania',NULL,NULL,NULL),(114,'es_ES','Mauritania',NULL,NULL,NULL),(114,'fr_FR','Mauritanie',NULL,NULL,NULL),(114,'it_IT',NULL,NULL,NULL,NULL),(114,'ru_RU','Мавритания',NULL,NULL,NULL),(115,'cs_CZ',NULL,NULL,NULL,NULL),(115,'de_DE','Mexiko',NULL,NULL,NULL),(115,'en_US','Mexico',NULL,NULL,NULL),(115,'es_ES','Méjico',NULL,NULL,NULL),(115,'fr_FR','Mexique',NULL,NULL,NULL),(115,'it_IT',NULL,NULL,NULL,NULL),(115,'ru_RU','Мексика',NULL,NULL,NULL),(116,'cs_CZ',NULL,NULL,NULL,NULL),(116,'de_DE','Mikronesien',NULL,NULL,NULL),(116,'en_US','Micronesia',NULL,NULL,NULL),(116,'es_ES','Micronesia',NULL,NULL,NULL),(116,'fr_FR','Micronésie',NULL,NULL,NULL),(116,'it_IT',NULL,NULL,NULL,NULL),(116,'ru_RU','Микронезия',NULL,NULL,NULL),(117,'cs_CZ',NULL,NULL,NULL,NULL),(117,'de_DE','Moldau',NULL,NULL,NULL),(117,'en_US','Moldova',NULL,NULL,NULL),(117,'es_ES','Moldova',NULL,NULL,NULL),(117,'fr_FR','Moldavie',NULL,NULL,NULL),(117,'it_IT',NULL,NULL,NULL,NULL),(117,'ru_RU','Молдова',NULL,NULL,NULL),(118,'cs_CZ',NULL,NULL,NULL,NULL),(118,'de_DE','Monaco',NULL,NULL,NULL),(118,'en_US','Monaco',NULL,NULL,NULL),(118,'es_ES','Mónaco',NULL,NULL,NULL),(118,'fr_FR','Principauté de Monaco',NULL,NULL,NULL),(118,'it_IT',NULL,NULL,NULL,NULL),(118,'ru_RU','Монако',NULL,NULL,NULL),(119,'cs_CZ',NULL,NULL,NULL,NULL),(119,'de_DE','Mongolei',NULL,NULL,NULL),(119,'en_US','Mongolia',NULL,NULL,NULL),(119,'es_ES','Mongolia',NULL,NULL,NULL),(119,'fr_FR','Mongolie',NULL,NULL,NULL),(119,'it_IT',NULL,NULL,NULL,NULL),(119,'ru_RU','Монголия',NULL,NULL,NULL),(120,'cs_CZ',NULL,NULL,NULL,NULL),(120,'de_DE','Mosambik',NULL,NULL,NULL),(120,'en_US','Mozambique',NULL,NULL,NULL),(120,'es_ES','Mozambique',NULL,NULL,NULL),(120,'fr_FR','Mozambique',NULL,NULL,NULL),(120,'it_IT',NULL,NULL,NULL,NULL),(120,'ru_RU','Мозамбик',NULL,NULL,NULL),(121,'cs_CZ',NULL,NULL,NULL,NULL),(121,'de_DE','Namibia',NULL,NULL,NULL),(121,'en_US','Namibia',NULL,NULL,NULL),(121,'es_ES','Namibia',NULL,NULL,NULL),(121,'fr_FR','Namibie',NULL,NULL,NULL),(121,'it_IT',NULL,NULL,NULL,NULL),(121,'ru_RU','Намибия',NULL,NULL,NULL),(122,'cs_CZ',NULL,NULL,NULL,NULL),(122,'de_DE','Nauru',NULL,NULL,NULL),(122,'en_US','Nauru',NULL,NULL,NULL),(122,'es_ES','Nauru',NULL,NULL,NULL),(122,'fr_FR','Nauru',NULL,NULL,NULL),(122,'it_IT',NULL,NULL,NULL,NULL),(122,'ru_RU','Науру',NULL,NULL,NULL),(123,'cs_CZ',NULL,NULL,NULL,NULL),(123,'de_DE','Nepal',NULL,NULL,NULL),(123,'en_US','Nepal',NULL,NULL,NULL),(123,'es_ES','Nepal',NULL,NULL,NULL),(123,'fr_FR','Népal',NULL,NULL,NULL),(123,'it_IT',NULL,NULL,NULL,NULL),(123,'ru_RU','Непал',NULL,NULL,NULL),(124,'cs_CZ',NULL,NULL,NULL,NULL),(124,'de_DE','Nicaragua',NULL,NULL,NULL),(124,'en_US','Nicaragua',NULL,NULL,NULL),(124,'es_ES','Nicaragua',NULL,NULL,NULL),(124,'fr_FR','Nicaragua',NULL,NULL,NULL),(124,'it_IT',NULL,NULL,NULL,NULL),(124,'ru_RU','Никарагуа',NULL,NULL,NULL),(125,'cs_CZ',NULL,NULL,NULL,NULL),(125,'de_DE','Niger',NULL,NULL,NULL),(125,'en_US','Niger',NULL,NULL,NULL),(125,'es_ES','Níger',NULL,NULL,NULL),(125,'fr_FR','Niger',NULL,NULL,NULL),(125,'it_IT',NULL,NULL,NULL,NULL),(125,'ru_RU','Нигер',NULL,NULL,NULL),(126,'cs_CZ',NULL,NULL,NULL,NULL),(126,'de_DE','Nigeria',NULL,NULL,NULL),(126,'en_US','Nigeria',NULL,NULL,NULL),(126,'es_ES','Nigeria',NULL,NULL,NULL),(126,'fr_FR','Nigeria',NULL,NULL,NULL),(126,'it_IT',NULL,NULL,NULL,NULL),(126,'ru_RU','Нигерия',NULL,NULL,NULL),(127,'cs_CZ',NULL,NULL,NULL,NULL),(127,'de_DE','Niue',NULL,NULL,NULL),(127,'en_US','Niue',NULL,NULL,NULL),(127,'es_ES','Niue',NULL,NULL,NULL),(127,'fr_FR','Niue',NULL,NULL,NULL),(127,'it_IT',NULL,NULL,NULL,NULL),(127,'ru_RU','Ниуэ',NULL,NULL,NULL),(128,'cs_CZ',NULL,NULL,NULL,NULL),(128,'de_DE','Norwegen',NULL,NULL,NULL),(128,'en_US','Norway',NULL,NULL,NULL),(128,'es_ES','Noruega',NULL,NULL,NULL),(128,'fr_FR','Norvège',NULL,NULL,NULL),(128,'it_IT',NULL,NULL,NULL,NULL),(128,'ru_RU','Норвегия',NULL,NULL,NULL),(129,'cs_CZ',NULL,NULL,NULL,NULL),(129,'de_DE','Neuseeland',NULL,NULL,NULL),(129,'en_US','New Zealand',NULL,NULL,NULL),(129,'es_ES','Nueva Zelandia',NULL,NULL,NULL),(129,'fr_FR','Nouvelle-Zélande',NULL,NULL,NULL),(129,'it_IT',NULL,NULL,NULL,NULL),(129,'ru_RU','Новая Зеландия',NULL,NULL,NULL),(130,'cs_CZ',NULL,NULL,NULL,NULL),(130,'de_DE','Oman',NULL,NULL,NULL),(130,'en_US','Oman',NULL,NULL,NULL),(130,'es_ES','Omán',NULL,NULL,NULL),(130,'fr_FR','Oman',NULL,NULL,NULL),(130,'it_IT',NULL,NULL,NULL,NULL),(130,'ru_RU','Оман',NULL,NULL,NULL),(131,'cs_CZ',NULL,NULL,NULL,NULL),(131,'de_DE','Uganda',NULL,NULL,NULL),(131,'en_US','Uganda',NULL,NULL,NULL),(131,'es_ES',NULL,NULL,NULL,NULL),(131,'fr_FR','Ouganda',NULL,NULL,NULL),(131,'it_IT',NULL,NULL,NULL,NULL),(131,'ru_RU','Уганда',NULL,NULL,NULL),(132,'cs_CZ',NULL,NULL,NULL,NULL),(132,'de_DE','Usbekistan',NULL,NULL,NULL),(132,'en_US','Uzbekistan',NULL,NULL,NULL),(132,'es_ES','Uzbekistán',NULL,NULL,NULL),(132,'fr_FR','Ouzbékistan',NULL,NULL,NULL),(132,'it_IT',NULL,NULL,NULL,NULL),(132,'ru_RU','Узбекистан',NULL,NULL,NULL),(133,'cs_CZ',NULL,NULL,NULL,NULL),(133,'de_DE','Pakistan',NULL,NULL,NULL),(133,'en_US','Pakistan',NULL,NULL,NULL),(133,'es_ES','Pakistán',NULL,NULL,NULL),(133,'fr_FR','Pakistan',NULL,NULL,NULL),(133,'it_IT',NULL,NULL,NULL,NULL),(133,'ru_RU','Пакистан',NULL,NULL,NULL),(134,'cs_CZ',NULL,NULL,NULL,NULL),(134,'de_DE','Panama',NULL,NULL,NULL),(134,'en_US','Panama',NULL,NULL,NULL),(134,'es_ES','Panamá',NULL,NULL,NULL),(134,'fr_FR','Panama',NULL,NULL,NULL),(134,'it_IT',NULL,NULL,NULL,NULL),(134,'ru_RU','Панама',NULL,NULL,NULL),(135,'cs_CZ',NULL,NULL,NULL,NULL),(135,'de_DE','Papua-Neuguinea',NULL,NULL,NULL),(135,'en_US','Papua Nueva Guinea',NULL,NULL,NULL),(135,'es_ES','Papua Nueva Guinea',NULL,NULL,NULL),(135,'fr_FR','Papouasie',NULL,NULL,NULL),(135,'it_IT',NULL,NULL,NULL,NULL),(135,'ru_RU','Папуа Новая Гвинея',NULL,NULL,NULL),(136,'cs_CZ',NULL,NULL,NULL,NULL),(136,'de_DE','Paraguay',NULL,NULL,NULL),(136,'en_US','Paraguay',NULL,NULL,NULL),(136,'es_ES','Paraguay',NULL,NULL,NULL),(136,'fr_FR','Paraguay',NULL,NULL,NULL),(136,'it_IT',NULL,NULL,NULL,NULL),(136,'ru_RU','Парагвай',NULL,NULL,NULL),(137,'cs_CZ',NULL,NULL,NULL,NULL),(137,'de_DE','Niederlande',NULL,NULL,NULL),(137,'en_US','Netherlands',NULL,NULL,NULL),(137,'es_ES','Países Bajos',NULL,NULL,NULL),(137,'fr_FR','Pays-Bas',NULL,NULL,NULL),(137,'it_IT',NULL,NULL,NULL,NULL),(137,'ru_RU','Нидерланды',NULL,NULL,NULL),(138,'cs_CZ',NULL,NULL,NULL,NULL),(138,'de_DE','Peru',NULL,NULL,NULL),(138,'en_US','Peru',NULL,NULL,NULL),(138,'es_ES','Perú',NULL,NULL,NULL),(138,'fr_FR','Pérou',NULL,NULL,NULL),(138,'it_IT',NULL,NULL,NULL,NULL),(138,'ru_RU','Перу',NULL,NULL,NULL),(139,'cs_CZ',NULL,NULL,NULL,NULL),(139,'de_DE','Philippinen',NULL,NULL,NULL),(139,'en_US','Philippines',NULL,NULL,NULL),(139,'es_ES','Filipinas',NULL,NULL,NULL),(139,'fr_FR','Philippines',NULL,NULL,NULL),(139,'it_IT',NULL,NULL,NULL,NULL),(139,'ru_RU','Филиппины',NULL,NULL,NULL),(140,'cs_CZ',NULL,NULL,NULL,NULL),(140,'de_DE','Polen',NULL,NULL,NULL),(140,'en_US','Poland',NULL,NULL,NULL),(140,'es_ES','Polonia',NULL,NULL,NULL),(140,'fr_FR','Pologne',NULL,NULL,NULL),(140,'it_IT',NULL,NULL,NULL,NULL),(140,'ru_RU','Польша',NULL,NULL,NULL),(141,'cs_CZ',NULL,NULL,NULL,NULL),(141,'de_DE','Portugal',NULL,NULL,NULL),(141,'en_US','Portugal',NULL,NULL,NULL),(141,'es_ES','Portugal',NULL,NULL,NULL),(141,'fr_FR','Portugal',NULL,NULL,NULL),(141,'it_IT',NULL,NULL,NULL,NULL),(141,'ru_RU','Португалия',NULL,NULL,NULL),(142,'cs_CZ',NULL,NULL,NULL,NULL),(142,'de_DE','Katar',NULL,NULL,NULL),(142,'en_US','Qatar',NULL,NULL,NULL),(142,'es_ES','Qatar',NULL,NULL,NULL),(142,'fr_FR','Qatar',NULL,NULL,NULL),(142,'it_IT',NULL,NULL,NULL,NULL),(142,'ru_RU','Катар',NULL,NULL,NULL),(143,'cs_CZ',NULL,NULL,NULL,NULL),(143,'de_DE','Zentralafrikanische Republik',NULL,NULL,NULL),(143,'en_US','Central African Republic',NULL,NULL,NULL),(143,'es_ES','República Centroafricana',NULL,NULL,NULL),(143,'fr_FR','République centrafricaine',NULL,NULL,NULL),(143,'it_IT',NULL,NULL,NULL,NULL),(143,'ru_RU','Центрально-Африканская Республика',NULL,NULL,NULL),(144,'cs_CZ',NULL,NULL,NULL,NULL),(144,'de_DE','Dominikanische Republik',NULL,NULL,NULL),(144,'en_US','Dominican Republic',NULL,NULL,NULL),(144,'es_ES','República Dominicana',NULL,NULL,NULL),(144,'fr_FR','République dominicaine',NULL,NULL,NULL),(144,'it_IT',NULL,NULL,NULL,NULL),(144,'ru_RU','Доминиканская Республика',NULL,NULL,NULL),(145,'cs_CZ',NULL,NULL,NULL,NULL),(145,'de_DE','Tschechische Republik',NULL,NULL,NULL),(145,'en_US','Czech Republic',NULL,NULL,NULL),(145,'es_ES','República Checa',NULL,NULL,NULL),(145,'fr_FR','République tchèque',NULL,NULL,NULL),(145,'it_IT',NULL,NULL,NULL,NULL),(145,'ru_RU','Чешская Республика',NULL,NULL,NULL),(146,'cs_CZ',NULL,NULL,NULL,NULL),(146,'de_DE','Rumänien',NULL,NULL,NULL),(146,'en_US','Romania',NULL,NULL,NULL),(146,'es_ES','Rumania',NULL,NULL,NULL),(146,'fr_FR','Roumanie',NULL,NULL,NULL),(146,'it_IT',NULL,NULL,NULL,NULL),(146,'ru_RU','Румыния',NULL,NULL,NULL),(147,'cs_CZ',NULL,NULL,NULL,NULL),(147,'de_DE','Vereinigtes Königreich',NULL,NULL,NULL),(147,'en_US','United Kingdom',NULL,NULL,NULL),(147,'es_ES','Reino Unido',NULL,NULL,NULL),(147,'fr_FR','Royaume-Uni',NULL,NULL,NULL),(147,'it_IT',NULL,NULL,NULL,NULL),(147,'ru_RU','Великобритания',NULL,NULL,NULL),(148,'cs_CZ',NULL,NULL,NULL,NULL),(148,'de_DE','Russland',NULL,NULL,NULL),(148,'en_US','Russia',NULL,NULL,NULL),(148,'es_ES','Rusia',NULL,NULL,NULL),(148,'fr_FR','Russie',NULL,NULL,NULL),(148,'it_IT',NULL,NULL,NULL,NULL),(148,'ru_RU','Россия',NULL,NULL,NULL),(149,'cs_CZ',NULL,NULL,NULL,NULL),(149,'de_DE','Ruanda',NULL,NULL,NULL),(149,'en_US','Rwanda',NULL,NULL,NULL),(149,'es_ES','Ruanda',NULL,NULL,NULL),(149,'fr_FR','Rwanda',NULL,NULL,NULL),(149,'it_IT',NULL,NULL,NULL,NULL),(149,'ru_RU','Руанда',NULL,NULL,NULL),(150,'cs_CZ',NULL,NULL,NULL,NULL),(150,'de_DE','St. Kitts und Nevis',NULL,NULL,NULL),(150,'en_US','Saint Kitts and Nevis',NULL,NULL,NULL),(150,'es_ES','San Cristóbal',NULL,NULL,NULL),(150,'fr_FR','Saint-Christophe-et-Niévès',NULL,NULL,NULL),(150,'it_IT',NULL,NULL,NULL,NULL),(150,'ru_RU','Сент-Китс и Невис',NULL,NULL,NULL),(151,'cs_CZ',NULL,NULL,NULL,NULL),(151,'de_DE','St. Lucia',NULL,NULL,NULL),(151,'en_US','Saint Lucia',NULL,NULL,NULL),(151,'es_ES','Santa Lucía',NULL,NULL,NULL),(151,'fr_FR','Sainte-Lucie',NULL,NULL,NULL),(151,'it_IT',NULL,NULL,NULL,NULL),(151,'ru_RU','Сент-Люсия',NULL,NULL,NULL),(152,'cs_CZ',NULL,NULL,NULL,NULL),(152,'de_DE','Saint-Marin',NULL,NULL,NULL),(152,'en_US','San Marino',NULL,NULL,NULL),(152,'es_ES','San Marino',NULL,NULL,NULL),(152,'fr_FR','Saint-Marin',NULL,NULL,NULL),(152,'it_IT',NULL,NULL,NULL,NULL),(152,'ru_RU','Сан-Марино',NULL,NULL,NULL),(153,'cs_CZ',NULL,NULL,NULL,NULL),(153,'de_DE','St. Vincent und die Grenadinen',NULL,NULL,NULL),(153,'en_US','Saint Vincent and the Grenadines',NULL,NULL,NULL),(153,'es_ES','San Vicente y las Granadinas',NULL,NULL,NULL),(153,'fr_FR','Saint-Vincent-et-les Grenadines',NULL,NULL,NULL),(153,'it_IT',NULL,NULL,NULL,NULL),(153,'ru_RU','Святой Винсент и Гренадины',NULL,NULL,NULL),(154,'cs_CZ',NULL,NULL,NULL,NULL),(154,'de_DE','Salomon-Inseln',NULL,NULL,NULL),(154,'en_US','Solomon Islands',NULL,NULL,NULL),(154,'es_ES','Salomón',NULL,NULL,NULL),(154,'fr_FR','Salomon',NULL,NULL,NULL),(154,'it_IT',NULL,NULL,NULL,NULL),(154,'ru_RU','Соломоновы острова',NULL,NULL,NULL),(155,'cs_CZ',NULL,NULL,NULL,NULL),(155,'de_DE','El Salvador',NULL,NULL,NULL),(155,'en_US','El Salvador',NULL,NULL,NULL),(155,'es_ES','El Salvador',NULL,NULL,NULL),(155,'fr_FR','Salvador',NULL,NULL,NULL),(155,'it_IT',NULL,NULL,NULL,NULL),(155,'ru_RU','Сальвадор',NULL,NULL,NULL),(156,'cs_CZ',NULL,NULL,NULL,NULL),(156,'de_DE','West-Samoa',NULL,NULL,NULL),(156,'en_US','Western Samoa',NULL,NULL,NULL),(156,'es_ES','Samoa',NULL,NULL,NULL),(156,'fr_FR','Samoa occidentales',NULL,NULL,NULL),(156,'it_IT',NULL,NULL,NULL,NULL),(156,'ru_RU','Западное Самоа',NULL,NULL,NULL),(157,'cs_CZ',NULL,NULL,NULL,NULL),(157,'de_DE','São Tomé und Príncipe',NULL,NULL,NULL),(157,'en_US','Sao Tome and Principe',NULL,NULL,NULL),(157,'es_ES','Santo Tomé y Príncipe',NULL,NULL,NULL),(157,'fr_FR','Sao Tomé-et-Principe',NULL,NULL,NULL),(157,'it_IT',NULL,NULL,NULL,NULL),(157,'ru_RU','Сан-Томе и Принсипи',NULL,NULL,NULL),(158,'cs_CZ',NULL,NULL,NULL,NULL),(158,'de_DE','Senegal',NULL,NULL,NULL),(158,'en_US','Senegal',NULL,NULL,NULL),(158,'es_ES','Senegal',NULL,NULL,NULL),(158,'fr_FR','Sénégal',NULL,NULL,NULL),(158,'it_IT',NULL,NULL,NULL,NULL),(158,'ru_RU','Сенегал',NULL,NULL,NULL),(159,'cs_CZ',NULL,NULL,NULL,NULL),(159,'de_DE','Seychellen',NULL,NULL,NULL),(159,'en_US','Seychelles',NULL,NULL,NULL),(159,'es_ES','Seychelles',NULL,NULL,NULL),(159,'fr_FR','Seychelles',NULL,NULL,NULL),(159,'it_IT',NULL,NULL,NULL,NULL),(159,'ru_RU','Сейшелы',NULL,NULL,NULL),(160,'cs_CZ',NULL,NULL,NULL,NULL),(160,'de_DE','Sierra Leone',NULL,NULL,NULL),(160,'en_US','Sierra Leone',NULL,NULL,NULL),(160,'es_ES','Sierra Leona',NULL,NULL,NULL),(160,'fr_FR','Sierra Léone',NULL,NULL,NULL),(160,'it_IT',NULL,NULL,NULL,NULL),(160,'ru_RU','Сьерра-Леоне',NULL,NULL,NULL),(161,'cs_CZ',NULL,NULL,NULL,NULL),(161,'de_DE','Singapur',NULL,NULL,NULL),(161,'en_US','Singapore',NULL,NULL,NULL),(161,'es_ES','Singapur',NULL,NULL,NULL),(161,'fr_FR','Singapour',NULL,NULL,NULL),(161,'it_IT',NULL,NULL,NULL,NULL),(161,'ru_RU','Сингапур',NULL,NULL,NULL),(162,'cs_CZ',NULL,NULL,NULL,NULL),(162,'de_DE','Slowakei',NULL,NULL,NULL),(162,'en_US','Slovakia',NULL,NULL,NULL),(162,'es_ES','Eslovaquia',NULL,NULL,NULL),(162,'fr_FR','Slovaquie',NULL,NULL,NULL),(162,'it_IT',NULL,NULL,NULL,NULL),(162,'ru_RU','Словакия',NULL,NULL,NULL),(163,'cs_CZ',NULL,NULL,NULL,NULL),(163,'de_DE','Slowenien',NULL,NULL,NULL),(163,'en_US','Slovenia',NULL,NULL,NULL),(163,'es_ES','Eslovenia',NULL,NULL,NULL),(163,'fr_FR','Slovénie',NULL,NULL,NULL),(163,'it_IT',NULL,NULL,NULL,NULL),(163,'ru_RU','Словения',NULL,NULL,NULL),(164,'cs_CZ',NULL,NULL,NULL,NULL),(164,'de_DE','Somalia',NULL,NULL,NULL),(164,'en_US','Somalia',NULL,NULL,NULL),(164,'es_ES','Somalia',NULL,NULL,NULL),(164,'fr_FR','Somalie',NULL,NULL,NULL),(164,'it_IT',NULL,NULL,NULL,NULL),(164,'ru_RU','Сомали',NULL,NULL,NULL),(165,'cs_CZ',NULL,NULL,NULL,NULL),(165,'de_DE','Sudan',NULL,NULL,NULL),(165,'en_US','Sudan',NULL,NULL,NULL),(165,'es_ES','Sudán',NULL,NULL,NULL),(165,'fr_FR','Soudan',NULL,NULL,NULL),(165,'it_IT',NULL,NULL,NULL,NULL),(165,'ru_RU','Судан',NULL,NULL,NULL),(166,'cs_CZ',NULL,NULL,NULL,NULL),(166,'de_DE','Sri Lanka',NULL,NULL,NULL),(166,'en_US','Sri Lanka',NULL,NULL,NULL),(166,'es_ES','Sri Lanka',NULL,NULL,NULL),(166,'fr_FR','Sri Lanka',NULL,NULL,NULL),(166,'it_IT',NULL,NULL,NULL,NULL),(166,'ru_RU','Шри-Ланка',NULL,NULL,NULL),(167,'cs_CZ',NULL,NULL,NULL,NULL),(167,'de_DE','Schweden',NULL,NULL,NULL),(167,'en_US','Sweden',NULL,NULL,NULL),(167,'es_ES','Suecia',NULL,NULL,NULL),(167,'fr_FR','Suède',NULL,NULL,NULL),(167,'it_IT',NULL,NULL,NULL,NULL),(167,'ru_RU','Швеция',NULL,NULL,NULL),(168,'cs_CZ',NULL,NULL,NULL,NULL),(168,'de_DE','Schweiz',NULL,NULL,NULL),(168,'en_US','Switzerland',NULL,NULL,NULL),(168,'es_ES','Suiza',NULL,NULL,NULL),(168,'fr_FR','Suisse',NULL,NULL,NULL),(168,'it_IT',NULL,NULL,NULL,NULL),(168,'ru_RU','Швейцария',NULL,NULL,NULL),(169,'cs_CZ',NULL,NULL,NULL,NULL),(169,'de_DE','Suriname',NULL,NULL,NULL),(169,'en_US','Suriname',NULL,NULL,NULL),(169,'es_ES','Suriname',NULL,NULL,NULL),(169,'fr_FR','Suriname',NULL,NULL,NULL),(169,'it_IT',NULL,NULL,NULL,NULL),(169,'ru_RU','Суринам',NULL,NULL,NULL),(170,'cs_CZ',NULL,NULL,NULL,NULL),(170,'de_DE','Swaziland',NULL,NULL,NULL),(170,'en_US','Swaziland',NULL,NULL,NULL),(170,'es_ES','Swazilandia',NULL,NULL,NULL),(170,'fr_FR','Swaziland',NULL,NULL,NULL),(170,'it_IT',NULL,NULL,NULL,NULL),(170,'ru_RU','Свазиленд',NULL,NULL,NULL),(171,'cs_CZ',NULL,NULL,NULL,NULL),(171,'de_DE','Syrien',NULL,NULL,NULL),(171,'en_US','Syria',NULL,NULL,NULL),(171,'es_ES','Siria',NULL,NULL,NULL),(171,'fr_FR','Syrie',NULL,NULL,NULL),(171,'it_IT',NULL,NULL,NULL,NULL),(171,'ru_RU','Сирия',NULL,NULL,NULL),(172,'cs_CZ',NULL,NULL,NULL,NULL),(172,'de_DE','Tadschikistan',NULL,NULL,NULL),(172,'en_US','Tajikistan',NULL,NULL,NULL),(172,'es_ES','Tayikistán',NULL,NULL,NULL),(172,'fr_FR','Tadjikistan',NULL,NULL,NULL),(172,'it_IT',NULL,NULL,NULL,NULL),(172,'ru_RU','Таджикистан',NULL,NULL,NULL),(173,'cs_CZ',NULL,NULL,NULL,NULL),(173,'de_DE','Tansania',NULL,NULL,NULL),(173,'en_US','Tanzania',NULL,NULL,NULL),(173,'es_ES','Tanzanía',NULL,NULL,NULL),(173,'fr_FR','Tanzanie',NULL,NULL,NULL),(173,'it_IT',NULL,NULL,NULL,NULL),(173,'ru_RU','Танзания',NULL,NULL,NULL),(174,'cs_CZ',NULL,NULL,NULL,NULL),(174,'de_DE','Tschad',NULL,NULL,NULL),(174,'en_US','Chad',NULL,NULL,NULL),(174,'es_ES','Chad',NULL,NULL,NULL),(174,'fr_FR','Tchad',NULL,NULL,NULL),(174,'it_IT',NULL,NULL,NULL,NULL),(174,'ru_RU','Чад',NULL,NULL,NULL),(175,'cs_CZ',NULL,NULL,NULL,NULL),(175,'de_DE','Thailand',NULL,NULL,NULL),(175,'en_US','Thailand',NULL,NULL,NULL),(175,'es_ES','Tailandia',NULL,NULL,NULL),(175,'fr_FR','Thaïlande',NULL,NULL,NULL),(175,'it_IT',NULL,NULL,NULL,NULL),(175,'ru_RU','Таиланд',NULL,NULL,NULL),(176,'cs_CZ',NULL,NULL,NULL,NULL),(176,'de_DE','Togo',NULL,NULL,NULL),(176,'en_US','Togo',NULL,NULL,NULL),(176,'es_ES','Togo',NULL,NULL,NULL),(176,'fr_FR','Togo',NULL,NULL,NULL),(176,'it_IT',NULL,NULL,NULL,NULL),(176,'ru_RU','Того',NULL,NULL,NULL),(177,'cs_CZ',NULL,NULL,NULL,NULL),(177,'de_DE','Tonga',NULL,NULL,NULL),(177,'en_US','Tonga',NULL,NULL,NULL),(177,'es_ES','Tonga',NULL,NULL,NULL),(177,'fr_FR','Îles Tonga',NULL,NULL,NULL),(177,'it_IT',NULL,NULL,NULL,NULL),(177,'ru_RU','Тонга',NULL,NULL,NULL),(178,'cs_CZ',NULL,NULL,NULL,NULL),(178,'de_DE','Trinidad und Tobago',NULL,NULL,NULL),(178,'en_US','Trinidad and Tobago',NULL,NULL,NULL),(178,'es_ES','Trinidad y Tabago',NULL,NULL,NULL),(178,'fr_FR','Trinité-et-Tobago',NULL,NULL,NULL),(178,'it_IT',NULL,NULL,NULL,NULL),(178,'ru_RU','Тринидад и Тобаго',NULL,NULL,NULL),(179,'cs_CZ',NULL,NULL,NULL,NULL),(179,'de_DE','Tunesien',NULL,NULL,NULL),(179,'en_US','Tunisia',NULL,NULL,NULL),(179,'es_ES','Túnez',NULL,NULL,NULL),(179,'fr_FR','Tunisie',NULL,NULL,NULL),(179,'it_IT',NULL,NULL,NULL,NULL),(179,'ru_RU','Тунис',NULL,NULL,NULL),(180,'cs_CZ',NULL,NULL,NULL,NULL),(180,'de_DE','Turkménistan',NULL,NULL,NULL),(180,'en_US','Turkmenistan',NULL,NULL,NULL),(180,'es_ES','Turkmenistán',NULL,NULL,NULL),(180,'fr_FR','Turkménistan',NULL,NULL,NULL),(180,'it_IT',NULL,NULL,NULL,NULL),(180,'ru_RU','Туркменистан',NULL,NULL,NULL),(181,'cs_CZ',NULL,NULL,NULL,NULL),(181,'de_DE','Türkei',NULL,NULL,NULL),(181,'en_US','Turkey',NULL,NULL,NULL),(181,'es_ES','Turquía',NULL,NULL,NULL),(181,'fr_FR','Turquie',NULL,NULL,NULL),(181,'it_IT',NULL,NULL,NULL,NULL),(181,'ru_RU','Турция',NULL,NULL,NULL),(182,'cs_CZ',NULL,NULL,NULL,NULL),(182,'de_DE','Tuvalu',NULL,NULL,NULL),(182,'en_US','Tuvalu',NULL,NULL,NULL),(182,'es_ES','Tuvalu',NULL,NULL,NULL),(182,'fr_FR','Tuvalu',NULL,NULL,NULL),(182,'it_IT',NULL,NULL,NULL,NULL),(182,'ru_RU','Тувалу',NULL,NULL,NULL),(183,'cs_CZ',NULL,NULL,NULL,NULL),(183,'de_DE','Ukraine',NULL,NULL,NULL),(183,'en_US','Ukraine',NULL,NULL,NULL),(183,'es_ES','Ucrania',NULL,NULL,NULL),(183,'fr_FR','Ukraine',NULL,NULL,NULL),(183,'it_IT',NULL,NULL,NULL,NULL),(183,'ru_RU','Украина',NULL,NULL,NULL),(184,'cs_CZ',NULL,NULL,NULL,NULL),(184,'de_DE','Uruguay',NULL,NULL,NULL),(184,'en_US','Uruguay',NULL,NULL,NULL),(184,'es_ES','Uruguay',NULL,NULL,NULL),(184,'fr_FR','Uruguay',NULL,NULL,NULL),(184,'it_IT',NULL,NULL,NULL,NULL),(184,'ru_RU','Уругвай',NULL,NULL,NULL),(185,'cs_CZ',NULL,NULL,NULL,NULL),(185,'de_DE','der Vatikan',NULL,NULL,NULL),(185,'en_US','The Vatican',NULL,NULL,NULL),(185,'es_ES','El Vatican',NULL,NULL,NULL),(185,'fr_FR','Vatican',NULL,NULL,NULL),(185,'it_IT',NULL,NULL,NULL,NULL),(185,'ru_RU','Ватикан',NULL,NULL,NULL),(186,'cs_CZ',NULL,NULL,NULL,NULL),(186,'de_DE','Vanuatu',NULL,NULL,NULL),(186,'en_US','Vanuatu',NULL,NULL,NULL),(186,'es_ES','Vanuatu',NULL,NULL,NULL),(186,'fr_FR','Vanuatu',NULL,NULL,NULL),(186,'it_IT',NULL,NULL,NULL,NULL),(186,'ru_RU','Вануату',NULL,NULL,NULL),(187,'cs_CZ',NULL,NULL,NULL,NULL),(187,'de_DE','Venezuela',NULL,NULL,NULL),(187,'en_US','Venezuela',NULL,NULL,NULL),(187,'es_ES','Venezuela',NULL,NULL,NULL),(187,'fr_FR','Vénézuela',NULL,NULL,NULL),(187,'it_IT',NULL,NULL,NULL,NULL),(187,'ru_RU','Венесуэла',NULL,NULL,NULL),(188,'cs_CZ',NULL,NULL,NULL,NULL),(188,'de_DE','Vietnam',NULL,NULL,NULL),(188,'en_US','Vietnam',NULL,NULL,NULL),(188,'es_ES','Viet Nam',NULL,NULL,NULL),(188,'fr_FR','Viêt Nam',NULL,NULL,NULL),(188,'it_IT',NULL,NULL,NULL,NULL),(188,'ru_RU','Вьетнам',NULL,NULL,NULL),(189,'cs_CZ',NULL,NULL,NULL,NULL),(189,'de_DE','Jemen',NULL,NULL,NULL),(189,'en_US','Yemen',NULL,NULL,NULL),(189,'es_ES','Yemen',NULL,NULL,NULL),(189,'fr_FR','Yémen',NULL,NULL,NULL),(189,'it_IT',NULL,NULL,NULL,NULL),(189,'ru_RU','Йемен',NULL,NULL,NULL),(191,'cs_CZ',NULL,NULL,NULL,NULL),(191,'de_DE','Zaire',NULL,NULL,NULL),(191,'en_US','Zaire',NULL,NULL,NULL),(191,'es_ES','Zaire',NULL,NULL,NULL),(191,'fr_FR','Zaïre',NULL,NULL,NULL),(191,'it_IT',NULL,NULL,NULL,NULL),(191,'ru_RU','Заир',NULL,NULL,NULL),(192,'cs_CZ',NULL,NULL,NULL,NULL),(192,'de_DE','Sambia',NULL,NULL,NULL),(192,'en_US','Zambia',NULL,NULL,NULL),(192,'es_ES','Zambia',NULL,NULL,NULL),(192,'fr_FR','Zambie',NULL,NULL,NULL),(192,'it_IT',NULL,NULL,NULL,NULL),(192,'ru_RU','Замбия',NULL,NULL,NULL),(193,'cs_CZ',NULL,NULL,NULL,NULL),(193,'de_DE','Zimbabwe',NULL,NULL,NULL),(193,'en_US','Zimbabwe',NULL,NULL,NULL),(193,'es_ES','Zimbabue',NULL,NULL,NULL),(193,'fr_FR','Zimbabwe',NULL,NULL,NULL),(193,'it_IT',NULL,NULL,NULL,NULL),(193,'ru_RU','Зимбабве',NULL,NULL,NULL),(196,'cs_CZ',NULL,NULL,NULL,NULL),(196,'de_DE',NULL,NULL,NULL,NULL),(196,'en_US','USA',NULL,NULL,NULL),(196,'es_ES',NULL,NULL,NULL,NULL),(196,'fr_FR','États-Unis',NULL,NULL,NULL),(196,'it_IT','USA',NULL,NULL,NULL),(196,'ru_RU','США',NULL,NULL,NULL),(246,'cs_CZ',NULL,NULL,NULL,NULL),(246,'de_DE',NULL,NULL,NULL,NULL),(246,'en_US','Canada',NULL,NULL,NULL),(246,'es_ES',NULL,NULL,NULL,NULL),(246,'fr_FR','Canada',NULL,NULL,NULL),(246,'it_IT','Canada',NULL,NULL,NULL),(246,'ru_RU','Канада',NULL,NULL,NULL),(259,'cs_CZ',NULL,NULL,NULL,NULL),(259,'de_DE','Guadeloupe',NULL,NULL,NULL),(259,'en_US','Guadeloupe',NULL,NULL,NULL),(259,'es_ES','Guadalupe',NULL,NULL,NULL),(259,'fr_FR','Guadeloupe',NULL,NULL,NULL),(259,'it_IT',NULL,NULL,NULL,NULL),(259,'ru_RU','Гваделупа',NULL,NULL,NULL),(260,'cs_CZ',NULL,NULL,NULL,NULL),(260,'de_DE','Französisch-Guayana',NULL,NULL,NULL),(260,'en_US','Guyane Française',NULL,NULL,NULL),(260,'es_ES','Guayana Francesa',NULL,NULL,NULL),(260,'fr_FR','Guyane Française',NULL,NULL,NULL),(260,'it_IT',NULL,NULL,NULL,NULL),(260,'ru_RU','Французская Гвиана',NULL,NULL,NULL),(261,'cs_CZ',NULL,NULL,NULL,NULL),(261,'de_DE','Martinique',NULL,NULL,NULL),(261,'en_US','Martinique',NULL,NULL,NULL),(261,'es_ES','Martinica',NULL,NULL,NULL),(261,'fr_FR','Martinique',NULL,NULL,NULL),(261,'it_IT',NULL,NULL,NULL,NULL),(261,'ru_RU','Мартиника',NULL,NULL,NULL),(262,'cs_CZ',NULL,NULL,NULL,NULL),(262,'de_DE','Mayotte',NULL,NULL,NULL),(262,'en_US','Mayotte',NULL,NULL,NULL),(262,'es_ES','Mayotte',NULL,NULL,NULL),(262,'fr_FR','Mayotte',NULL,NULL,NULL),(262,'it_IT',NULL,NULL,NULL,NULL),(262,'ru_RU','Майотта',NULL,NULL,NULL),(263,'cs_CZ',NULL,NULL,NULL,NULL),(263,'de_DE','La Réunion',NULL,NULL,NULL),(263,'en_US','Réunion(La)',NULL,NULL,NULL),(263,'es_ES','Réunion(la)',NULL,NULL,NULL),(263,'fr_FR','Réunion(La)',NULL,NULL,NULL),(263,'it_IT',NULL,NULL,NULL,NULL),(263,'ru_RU','Реюньон (La)',NULL,NULL,NULL),(264,'cs_CZ',NULL,NULL,NULL,NULL),(264,'de_DE','Saint-Pierre und Miquelon',NULL,NULL,NULL),(264,'en_US','St Pierre et Miquelon',NULL,NULL,NULL),(264,'es_ES','San Pedro y Miquelón',NULL,NULL,NULL),(264,'fr_FR','St Pierre et Miquelon',NULL,NULL,NULL),(264,'it_IT',NULL,NULL,NULL,NULL),(264,'ru_RU','Сен-Пьер и Микелон',NULL,NULL,NULL),(265,'cs_CZ',NULL,NULL,NULL,NULL),(265,'de_DE','Neu-Kaledonien',NULL,NULL,NULL),(265,'en_US','Nouvelle-Calédonie',NULL,NULL,NULL),(265,'es_ES','Nouvelle-Calédonie',NULL,NULL,NULL),(265,'fr_FR','Nouvelle-Calédonie',NULL,NULL,NULL),(265,'it_IT',NULL,NULL,NULL,NULL),(265,'ru_RU','Новая Каледония',NULL,NULL,NULL),(266,'cs_CZ',NULL,NULL,NULL,NULL),(266,'de_DE','Französisch-Polynesien',NULL,NULL,NULL),(266,'en_US','Polynésie française',NULL,NULL,NULL),(266,'es_ES','Polinesia Francesa',NULL,NULL,NULL),(266,'fr_FR','Polynésie française',NULL,NULL,NULL),(266,'it_IT',NULL,NULL,NULL,NULL),(266,'ru_RU','Французская полинезия',NULL,NULL,NULL),(267,'cs_CZ',NULL,NULL,NULL,NULL),(267,'de_DE','Wallis und Futuna',NULL,NULL,NULL),(267,'en_US','Wallis-et-Futuna',NULL,NULL,NULL),(267,'es_ES','Wallis-et-Futuna',NULL,NULL,NULL),(267,'fr_FR','Wallis-et-Futuna',NULL,NULL,NULL),(267,'it_IT',NULL,NULL,NULL,NULL),(267,'ru_RU','Уоллис и Футуна',NULL,NULL,NULL),(269,'cs_CZ',NULL,NULL,NULL,NULL),(269,'de_DE','Hong Kong',NULL,NULL,NULL),(269,'en_US','Hong Kong',NULL,NULL,NULL),(269,'es_ES','Hong Kong',NULL,NULL,NULL),(269,'fr_FR','Hong Kong',NULL,NULL,NULL),(269,'it_IT',NULL,NULL,NULL,NULL),(269,'ru_RU','Гонконг',NULL,NULL,NULL),(270,'cs_CZ',NULL,NULL,NULL,NULL),(270,'de_DE','Saint-Barthélemy',NULL,NULL,NULL),(270,'en_US','Saint Barthélemy',NULL,NULL,NULL),(270,'es_ES','San Bartolomé',NULL,NULL,NULL),(270,'fr_FR','Saint-Barthélemy',NULL,NULL,NULL),(270,'it_IT','Saint-Barthélemy',NULL,NULL,NULL),(270,'ru_RU','Сен-Бартельми',NULL,NULL,NULL),(271,'cs_CZ',NULL,NULL,NULL,NULL),(271,'de_DE','Saint-Martin (franz. Teil)',NULL,NULL,NULL),(271,'en_US','Saint Martin (French part)',NULL,NULL,NULL),(271,'es_ES','San Martín (parte francesa)',NULL,NULL,NULL),(271,'fr_FR','Saint-Martin (Antilles françaises)',NULL,NULL,NULL),(271,'it_IT','Saint-Martin',NULL,NULL,NULL),(271,'ru_RU','Сен-Мартен (французская часть)',NULL,NULL,NULL),(272,'cs_CZ',NULL,NULL,NULL,NULL),(272,'de_DE','Französische Süd- und Antarktisgebiete',NULL,NULL,NULL),(272,'en_US','French Southern Territories',NULL,NULL,NULL),(272,'es_ES','Tierras Australes y Antárticas Francesas',NULL,NULL,NULL),(272,'fr_FR','Terres australes et antarctiques françaises',NULL,NULL,NULL),(272,'it_IT','Terre australi e antartiche francesi',NULL,NULL,NULL),(272,'ru_RU','Французские Южные Территории',NULL,NULL,NULL);
/*!40000 ALTER TABLE `country_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `type` varchar(255) NOT NULL,
  `serialized_effects` longtext NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `max_usage` int(11) NOT NULL,
  `is_cumulative` tinyint(1) NOT NULL,
  `is_removing_postage` tinyint(1) NOT NULL,
  `is_available_on_special_offers` tinyint(1) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `serialized_conditions` text NOT NULL,
  `per_customer_usage_count` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `idx_is_enabled` (`is_enabled`),
  KEY `idx_is_used` (`is_used`),
  KEY `idx_type` (`type`),
  KEY `idx_expiration_date` (`expiration_date`),
  KEY `idx_is_cumulative` (`is_cumulative`),
  KEY `idx_is_removing_postage` (`is_removing_postage`),
  KEY `idx_max_usage` (`max_usage`),
  KEY `idx_is_available_on_special_offers` (`is_available_on_special_offers`),
  KEY `idx_start_date` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_country`
--

DROP TABLE IF EXISTS `coupon_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_country` (
  `coupon_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`country_id`),
  KEY `fk_country_id_idx` (`country_id`),
  CONSTRAINT `fk_coupon_country_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_coupon_country_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_country`
--

LOCK TABLES `coupon_country` WRITE;
/*!40000 ALTER TABLE `coupon_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_customer_count`
--

DROP TABLE IF EXISTS `coupon_customer_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_customer_count` (
  `coupon_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `fk_coupon_customer_customer_id_idx` (`customer_id`),
  KEY `fk_coupon_customer_coupon_id_idx` (`coupon_id`),
  CONSTRAINT `fk_coupon_customer_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_coupon_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_customer_count`
--

LOCK TABLES `coupon_customer_count` WRITE;
/*!40000 ALTER TABLE `coupon_customer_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_customer_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_i18n`
--

DROP TABLE IF EXISTS `coupon_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `coupon_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `coupon` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_i18n`
--

LOCK TABLES `coupon_i18n` WRITE;
/*!40000 ALTER TABLE `coupon_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_module`
--

DROP TABLE IF EXISTS `coupon_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_module` (
  `coupon_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`module_id`),
  KEY `fk_module_id_idx` (`module_id`),
  CONSTRAINT `fk_coupon_module_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_coupon_module_module_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_module`
--

LOCK TABLES `coupon_module` WRITE;
/*!40000 ALTER TABLE `coupon_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_version`
--

DROP TABLE IF EXISTS `coupon_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_version` (
  `id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  `type` varchar(255) NOT NULL,
  `serialized_effects` longtext NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `max_usage` int(11) NOT NULL,
  `is_cumulative` tinyint(1) NOT NULL,
  `is_removing_postage` tinyint(1) NOT NULL,
  `is_available_on_special_offers` tinyint(1) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `serialized_conditions` text NOT NULL,
  `per_customer_usage_count` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  CONSTRAINT `coupon_version_FK_1` FOREIGN KEY (`id`) REFERENCES `coupon` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_version`
--

LOCK TABLES `coupon_version` WRITE;
/*!40000 ALTER TABLE `coupon_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `symbol` varchar(45) DEFAULT NULL,
  `format` char(10) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `visible` tinyint(4) DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `by_default` tinyint(4) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_by_default` (`by_default`),
  KEY `idx_currency_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'EUR','€','%n %s',1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,'USD','$','%s%n',1.26,1,2,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,'GBP','£','%s%n',0.89,1,3,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,'CHF','CHF','%n %s',1.34183,0,4,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,'MXN','$','%n %s',17.1304,0,5,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,'PLN','zł','%n %s',3.8451,0,6,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,'CNY','¥','%s %n',9.13916,0,7,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(8,'NOK','kr','%n %s',7.97791,0,8,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(9,'MDL','MDL','%n %s',16.1774,0,9,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(10,'PYG','Gs','%n %s',6547.98,0,10,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(11,'ARS','ARS','%n %s',5.39,0,11,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(12,'BYR','р.','%n%s',1,0,12,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(13,'FJD','$','%s%n',2.57483,0,13,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(14,'RSD','RSD','%n %s',115.68,0,14,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(15,'SEK','kr','%n %s',9.14651,0,15,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(16,'HRK','kn','%n %s',1,0,16,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(17,'DKK','kr','%n %s',7.45201,0,17,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(18,'NGN','₦','%s %n',1,0,18,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(19,'HKD','$','%n %s',11.0512,0,19,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(20,'CAD','CAD$','%s%n',1.40054,0,20,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(21,'SAR','﷼','%n %s',5.10682,0,21,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(22,'CZK','Kč','%n %s',1,0,22,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(23,'CRC','₡','%s %n',560,0,23,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(24,'AZN','AZN','%n %s',1.09237,0,24,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(25,'IDR','Rp‎','%n %s',12177.6,0,25,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(26,'PKR','₨','%n %s',117.289,0,26,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(27,'BRL','R$','%s %n',2.31583,0,27,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(28,'VND','₫','%n %s',26505.8,0,28,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(29,'PHP','PHP','%s %n',1,0,29,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(30,'GTQ','Q','%n %s',11.0988,0,30,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(31,'TRY','TL','%n %s',1.97638,0,31,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(32,'JPY','¥','%s %n',113.786,0,32,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(33,'RUB','руб','%n %s',41.7632,0,33,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(34,'PEN','S/.','%s %n',2.7845,0,34,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(35,'EGP','£','%s %n',7.77518,0,35,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(36,'GEL','ლ','%n %s',2.46684,0,36,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(37,'BOB','$b','%n %s',9.5762,0,37,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(38,'AED','AED','%s %n',1,0,38,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(39,'THB','฿','%n %s',41.4441,0,39,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(40,'ILS','₪‎','%n%s',4.97713,0,40,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(41,'MYR','RM','%s%n',1,0,41,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(42,'VEF','Bs','%n %s',5.84819,0,42,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(43,'HUF','Ft‎','%n %s',276.334,0,43,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(44,'KES','KSh','%s %n',1,0,44,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(45,'UAH','₴','%n %s',1,0,45,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(46,'TND','DT','%n%s',1,0,46,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(47,'BGN','лв','%n %s',1.9558,0,47,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(48,'INR','₹','%s %n',60.7482,0,48,0,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_i18n`
--

DROP TABLE IF EXISTS `currency_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `currency_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `currency` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_i18n`
--

LOCK TABLES `currency_i18n` WRITE;
/*!40000 ALTER TABLE `currency_i18n` DISABLE KEYS */;
INSERT INTO `currency_i18n` VALUES (1,'cs_CZ',NULL),(1,'de_DE','Euro'),(1,'en_US','Euro'),(1,'es_ES','Euro'),(1,'fr_FR','Euro'),(1,'it_IT',NULL),(1,'ru_RU','Евро'),(2,'cs_CZ',NULL),(2,'de_DE','US Dollar'),(2,'en_US','United States Dollar'),(2,'es_ES','Dólar Estadunidense'),(2,'fr_FR','Dollar Américain'),(2,'it_IT',NULL),(2,'ru_RU','Доллар США'),(3,'cs_CZ',NULL),(3,'de_DE','Britische Pfund'),(3,'en_US','UK Pound'),(3,'es_ES','Libra Reino Unido'),(3,'fr_FR','Livre anglaise'),(3,'it_IT',NULL),(3,'ru_RU','Английский фунт'),(4,'cs_CZ',NULL),(4,'de_DE',NULL),(4,'en_US','Franc'),(4,'es_ES',NULL),(4,'fr_FR','Franc'),(4,'it_IT',NULL),(4,'ru_RU','Франк'),(5,'cs_CZ',NULL),(5,'de_DE',NULL),(5,'en_US','Peso'),(5,'es_ES',NULL),(5,'fr_FR','Peso'),(5,'it_IT',NULL),(5,'ru_RU','Песо'),(6,'cs_CZ',NULL),(6,'de_DE',NULL),(6,'en_US','Złoty'),(6,'es_ES',NULL),(6,'fr_FR','Złoty'),(6,'it_IT',NULL),(6,'ru_RU','Польский злотый'),(7,'cs_CZ',NULL),(7,'de_DE',NULL),(7,'en_US','Yuan'),(7,'es_ES',NULL),(7,'fr_FR','Yuan'),(7,'it_IT',NULL),(7,'ru_RU','Юань'),(8,'cs_CZ',NULL),(8,'de_DE',NULL),(8,'en_US','Krone'),(8,'es_ES',NULL),(8,'fr_FR','Couronne Norvégienne'),(8,'it_IT',NULL),(8,'ru_RU','Норвежская крона'),(9,'cs_CZ',NULL),(9,'de_DE',NULL),(9,'en_US','Lei'),(9,'es_ES',NULL),(9,'fr_FR','Lei'),(9,'it_IT',NULL),(9,'ru_RU','Румынский лей'),(10,'cs_CZ',NULL),(10,'de_DE',NULL),(10,'en_US','Guaraní'),(10,'es_ES',NULL),(10,'fr_FR','Guaraní'),(10,'it_IT',NULL),(10,'ru_RU','Гуарани'),(11,'cs_CZ',NULL),(11,'de_DE',NULL),(11,'en_US','Peso Argentino'),(11,'es_ES',NULL),(11,'fr_FR','Peso Argentin'),(11,'it_IT',NULL),(11,'ru_RU','Аргентинский песо'),(12,'cs_CZ',NULL),(12,'de_DE',NULL),(12,'en_US','Belarusian ruble'),(12,'es_ES',NULL),(12,'fr_FR','Rouble Biélorusse'),(12,'it_IT',NULL),(12,'ru_RU','Белорусский рубль'),(13,'cs_CZ',NULL),(13,'de_DE','Dollar'),(13,'en_US','Dollar'),(13,'es_ES',NULL),(13,'fr_FR','Dollar'),(13,'it_IT',NULL),(13,'ru_RU','Фиджийский доллар'),(14,'cs_CZ',NULL),(14,'de_DE',NULL),(14,'en_US','Dinar'),(14,'es_ES',NULL),(14,'fr_FR','Dinar'),(14,'it_IT',NULL),(14,'ru_RU','Динар'),(15,'cs_CZ',NULL),(15,'de_DE',NULL),(15,'en_US','Krona'),(15,'es_ES',NULL),(15,'fr_FR','Couronne Suédoise'),(15,'it_IT',NULL),(15,'ru_RU','Шведская крона'),(16,'cs_CZ',NULL),(16,'de_DE',NULL),(16,'en_US','Croatian Kuna'),(16,'es_ES',NULL),(16,'fr_FR','Kuna Croate'),(16,'it_IT',NULL),(16,'ru_RU','Хорватская куна'),(17,'cs_CZ',NULL),(17,'de_DE','Dänische Kronen'),(17,'en_US','Danish krone'),(17,'es_ES',NULL),(17,'fr_FR','Couronne Danoise'),(17,'it_IT',NULL),(17,'ru_RU','Датская крона'),(18,'cs_CZ',NULL),(18,'de_DE',NULL),(18,'en_US','Nigerian naira'),(18,'es_ES',NULL),(18,'fr_FR','Naira Nigérien'),(18,'it_IT',NULL),(18,'ru_RU','Нигерийская найра'),(19,'cs_CZ',NULL),(19,'de_DE',NULL),(19,'en_US','Hong Kong Dollar'),(19,'es_ES','Dólar de Hong Kong'),(19,'fr_FR','Dollar de Honk-Kong'),(19,'it_IT',NULL),(19,'ru_RU','Гонконгский доллар'),(20,'cs_CZ',NULL),(20,'de_DE','Dollar (CAD)'),(20,'en_US','Dollar (CAD)'),(20,'es_ES',NULL),(20,'fr_FR','Dollar Canadien'),(20,'it_IT',NULL),(20,'ru_RU','Канадский доллар'),(21,'cs_CZ',NULL),(21,'de_DE',NULL),(21,'en_US','Riyal'),(21,'es_ES',NULL),(21,'fr_FR','Riyal'),(21,'it_IT',NULL),(21,'ru_RU','Риал'),(22,'cs_CZ',NULL),(22,'de_DE',NULL),(22,'en_US','Czech koruna'),(22,'es_ES',NULL),(22,'fr_FR','Couronne Tchèque'),(22,'it_IT',NULL),(22,'ru_RU','Чешская крона'),(23,'cs_CZ',NULL),(23,'de_DE',NULL),(23,'en_US','Colón'),(23,'es_ES',NULL),(23,'fr_FR','Colón'),(23,'it_IT',NULL),(23,'ru_RU','Колон'),(24,'cs_CZ',NULL),(24,'de_DE',NULL),(24,'en_US','Manat'),(24,'es_ES',NULL),(24,'fr_FR','Manat'),(24,'it_IT',NULL),(24,'ru_RU','Манат'),(25,'cs_CZ',NULL),(25,'de_DE',NULL),(25,'en_US','Rupiah'),(25,'es_ES',NULL),(25,'fr_FR','Roupie Indonésienne'),(25,'it_IT',NULL),(25,'ru_RU','Индонезийская рупия'),(26,'cs_CZ',NULL),(26,'de_DE',NULL),(26,'en_US','Rupee'),(26,'es_ES',NULL),(26,'fr_FR','Roupie Pakistanaise'),(26,'it_IT',NULL),(26,'ru_RU','Пакистанская рупия'),(27,'cs_CZ',NULL),(27,'de_DE',NULL),(27,'en_US','Real'),(27,'es_ES',NULL),(27,'fr_FR','Real'),(27,'it_IT',NULL),(27,'ru_RU','Бразильский Реал'),(28,'cs_CZ',NULL),(28,'de_DE',NULL),(28,'en_US','Đồng'),(28,'es_ES',NULL),(28,'fr_FR','Đồng'),(28,'it_IT',NULL),(28,'ru_RU','Донг'),(29,'cs_CZ',NULL),(29,'de_DE',NULL),(29,'en_US','Philippine Peso'),(29,'es_ES',NULL),(29,'fr_FR','Peso Philippin'),(29,'it_IT',NULL),(29,'ru_RU','Филиппинское песо'),(30,'cs_CZ',NULL),(30,'de_DE',NULL),(30,'en_US','Quetzal'),(30,'es_ES',NULL),(30,'fr_FR','Quetzal'),(30,'it_IT',NULL),(30,'ru_RU','Кетцаль'),(31,'cs_CZ',NULL),(31,'de_DE',NULL),(31,'en_US','Lira'),(31,'es_ES',NULL),(31,'fr_FR','Lire'),(31,'it_IT',NULL),(31,'ru_RU','Лира'),(32,'cs_CZ',NULL),(32,'de_DE',NULL),(32,'en_US','Yen'),(32,'es_ES',NULL),(32,'fr_FR','Yen'),(32,'it_IT',NULL),(32,'ru_RU','Иена'),(33,'cs_CZ',NULL),(33,'de_DE',NULL),(33,'en_US','Ruble'),(33,'es_ES',NULL),(33,'fr_FR','Rouble'),(33,'it_IT',NULL),(33,'ru_RU','Рубль'),(34,'cs_CZ',NULL),(34,'de_DE',NULL),(34,'en_US','Nuevo Sol'),(34,'es_ES',NULL),(34,'fr_FR','Nuevo Sol'),(34,'it_IT',NULL),(34,'ru_RU','Перуанский соль'),(35,'cs_CZ',NULL),(35,'de_DE',NULL),(35,'en_US','Pound'),(35,'es_ES',NULL),(35,'fr_FR','Livre'),(35,'it_IT',NULL),(35,'ru_RU','Египетский фунт'),(36,'cs_CZ',NULL),(36,'de_DE',NULL),(36,'en_US','Lari'),(36,'es_ES',NULL),(36,'fr_FR','Lari'),(36,'it_IT','Lari'),(36,'ru_RU','Лари'),(37,'cs_CZ',NULL),(37,'de_DE',NULL),(37,'en_US','Boliviano'),(37,'es_ES',NULL),(37,'fr_FR','Bolivie'),(37,'it_IT',NULL),(37,'ru_RU','Боливиано'),(38,'cs_CZ',NULL),(38,'de_DE',NULL),(38,'en_US','United Arab Emirates dirham'),(38,'es_ES',NULL),(38,'fr_FR','Dirham des Émirats Arabes Unis'),(38,'it_IT',NULL),(38,'ru_RU','ОАЭ дирхам'),(39,'cs_CZ',NULL),(39,'de_DE',NULL),(39,'en_US','Baht'),(39,'es_ES',NULL),(39,'fr_FR','Baht'),(39,'it_IT',NULL),(39,'ru_RU','Бат'),(40,'cs_CZ',NULL),(40,'de_DE',NULL),(40,'en_US','Shekel'),(40,'es_ES',NULL),(40,'fr_FR','Shekel'),(40,'it_IT',NULL),(40,'ru_RU','Шекель'),(41,'cs_CZ',NULL),(41,'de_DE',NULL),(41,'en_US','Ringgit'),(41,'es_ES',NULL),(41,'fr_FR','Ringgit'),(41,'it_IT',NULL),(41,'ru_RU','Ринггит'),(42,'cs_CZ',NULL),(42,'de_DE',NULL),(42,'en_US','Bolívar fuerte'),(42,'es_ES',NULL),(42,'fr_FR','Bolivar Vénézuélien'),(42,'it_IT',NULL),(42,'ru_RU','Боливар'),(43,'cs_CZ',NULL),(43,'de_DE',NULL),(43,'en_US','Forint'),(43,'es_ES',NULL),(43,'fr_FR','Forint'),(43,'it_IT',NULL),(43,'ru_RU','Форинт'),(44,'cs_CZ',NULL),(44,'de_DE',NULL),(44,'en_US','Kenyan shilling'),(44,'es_ES',NULL),(44,'fr_FR','Shilling Kenyan'),(44,'it_IT',NULL),(44,'ru_RU','Кенийский шиллинг'),(45,'cs_CZ',NULL),(45,'de_DE',NULL),(45,'en_US','Гривна'),(45,'es_ES',NULL),(45,'fr_FR','Hryvnia Ukrainien'),(45,'it_IT',NULL),(45,'ru_RU','Гривна'),(46,'cs_CZ',NULL),(46,'de_DE',NULL),(46,'en_US','Tunisian Dinar'),(46,'es_ES',NULL),(46,'fr_FR','Dinar Tunisien'),(46,'it_IT',NULL),(46,'ru_RU','Тунисский динар'),(47,'cs_CZ',NULL),(47,'de_DE',NULL),(47,'en_US','Lev'),(47,'es_ES',NULL),(47,'fr_FR','Lev'),(47,'it_IT',NULL),(47,'ru_RU','Лев'),(48,'cs_CZ',NULL),(48,'de_DE',NULL),(48,'en_US','Indian Rupee'),(48,'es_ES',NULL),(48,'fr_FR','Roupie Hindoue'),(48,'it_IT',NULL),(48,'ru_RU','Индийская рупия');
/*!40000 ALTER TABLE `currency_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `algo` varchar(128) DEFAULT NULL,
  `reseller` tinyint(4) DEFAULT NULL,
  `sponsor` varchar(50) DEFAULT NULL,
  `discount` decimal(16,6) DEFAULT 0.000000,
  `remember_me_token` varchar(255) DEFAULT NULL,
  `remember_me_serial` varchar(255) DEFAULT NULL,
  `enable` tinyint(4) DEFAULT 0,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_UNIQUE` (`ref`),
  KEY `idx_customer_customer_title_id` (`title_id`),
  KEY `idx_customer_lang_id` (`lang_id`),
  KEY `idx_email` (`email`),
  CONSTRAINT `fk_customer_customer_title_id` FOREIGN KEY (`title_id`) REFERENCES `customer_title` (`id`),
  CONSTRAINT `fk_customer_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_title`
--

DROP TABLE IF EXISTS `customer_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by_default` int(11) NOT NULL DEFAULT 0,
  `position` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_title`
--

LOCK TABLES `customer_title` WRITE;
/*!40000 ALTER TABLE `customer_title` DISABLE KEYS */;
INSERT INTO `customer_title` VALUES (1,1,'1','2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,0,'2','2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,0,'3','2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `customer_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_title_i18n`
--

DROP TABLE IF EXISTS `customer_title_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_title_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `short` varchar(10) DEFAULT NULL,
  `long` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `customer_title_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `customer_title` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_title_i18n`
--

LOCK TABLES `customer_title_i18n` WRITE;
/*!40000 ALTER TABLE `customer_title_i18n` DISABLE KEYS */;
INSERT INTO `customer_title_i18n` VALUES (1,'cs_CZ',NULL,NULL),(1,'de_DE','Hr.','Herr'),(1,'en_US','Mr.','Mister'),(1,'es_ES','Sr.','Señor'),(1,'fr_FR','M.','Monsieur'),(1,'it_IT',NULL,NULL),(1,'ru_RU','Ув.','Уважаемый'),(2,'cs_CZ',NULL,NULL),(2,'de_DE','Fr.','Frau'),(2,'en_US','Mrs','Misses'),(2,'es_ES','Sra','Señora'),(2,'fr_FR','Mme','Madame'),(2,'it_IT',NULL,NULL),(2,'ru_RU','Ув.','Уважаемая'),(3,'cs_CZ',NULL,NULL),(3,'de_DE','Fr.','Fräulein'),(3,'en_US','Miss_short','Miss'),(3,'es_ES','Señorita','Señorita'),(3,'fr_FR','Mlle','Mademoiselle'),(3,'it_IT',NULL,NULL),(3,'ru_RU','Ув.','Уважаемая');
/*!40000 ALTER TABLE `customer_title_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_version`
--

DROP TABLE IF EXISTS `customer_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_version` (
  `id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `algo` varchar(128) DEFAULT NULL,
  `reseller` tinyint(4) DEFAULT NULL,
  `sponsor` varchar(50) DEFAULT NULL,
  `discount` decimal(16,6) DEFAULT 0.000000,
  `remember_me_token` varchar(255) DEFAULT NULL,
  `remember_me_serial` varchar(255) DEFAULT NULL,
  `enable` tinyint(4) DEFAULT 0,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  `order_ids` text DEFAULT NULL,
  `order_versions` text DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  CONSTRAINT `customer_version_FK_1` FOREIGN KEY (`id`) REFERENCES `customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_version`
--

LOCK TABLES `customer_version` WRITE;
/*!40000 ALTER TABLE `customer_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export`
--

DROP TABLE IF EXISTS `export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `export` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `export_category_id` int(11) NOT NULL,
  `handle_class` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_UNIQUE` (`ref`),
  KEY `fk_export_1_idx` (`export_category_id`),
  CONSTRAINT `fk_export_export_category_id` FOREIGN KEY (`export_category_id`) REFERENCES `export_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export`
--

LOCK TABLES `export` WRITE;
/*!40000 ALTER TABLE `export` DISABLE KEYS */;
INSERT INTO `export` VALUES (1,'thelia.export.mailing',1,1,'Thelia\\ImportExport\\Export\\Type\\MailingExport','2026-09-30 13:51:54','2026-09-30 13:51:54'),(2,'thelia.export.complete',2,1,'Thelia\\ImportExport\\Export\\Type\\CustomerExport','2026-09-30 13:51:54','2026-09-30 13:51:54'),(3,'thelia.export.prices',1,2,'Thelia\\ImportExport\\Export\\Type\\ProductPricesExport','2026-09-30 13:51:54','2026-09-30 13:51:54'),(4,'thelia.export.taxed_prices',2,2,'Thelia\\ImportExport\\Export\\Type\\ProductTaxedPricesExport','2026-09-30 13:51:54','2026-09-30 13:51:54'),(5,'thelia.export.product_seo',3,2,'Thelia\\ImportExport\\Export\\Type\\ProductSEOExport','2026-09-30 13:51:54','2026-09-30 13:51:54'),(6,'thelia.export.content',1,3,'Thelia\\ImportExport\\Export\\Type\\ContentExport','2026-09-30 13:51:54','2026-09-30 13:51:54'),(7,'thelia.export.orders',1,4,'Thelia\\ImportExport\\Export\\Type\\OrderExport','2026-09-30 13:51:54','2026-09-30 13:51:54'),(8,'thelia.export.product_i18n',4,2,'Thelia\\ImportExport\\Export\\Type\\ProductI18nExport','2026-09-30 13:51:54','2026-09-30 13:51:54');
/*!40000 ALTER TABLE `export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_category`
--

DROP TABLE IF EXISTS `export_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `export_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_UNIQUE` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_category`
--

LOCK TABLES `export_category` WRITE;
/*!40000 ALTER TABLE `export_category` DISABLE KEYS */;
INSERT INTO `export_category` VALUES (1,'thelia.export.customer',1,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(2,'thelia.export.products',2,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(3,'thelia.export.content',3,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(4,'thelia.export.orders',4,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(5,'thelia.export.modules',5,'2026-09-30 13:51:54','2026-09-30 13:51:54');
/*!40000 ALTER TABLE `export_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_category_i18n`
--

DROP TABLE IF EXISTS `export_category_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `export_category_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `export_category_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `export_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_category_i18n`
--

LOCK TABLES `export_category_i18n` WRITE;
/*!40000 ALTER TABLE `export_category_i18n` DISABLE KEYS */;
INSERT INTO `export_category_i18n` VALUES (1,'en_US','Customers'),(1,'fr_FR','Clients'),(2,'en_US','Products'),(2,'fr_FR','Produits'),(3,'en_US','Content'),(3,'fr_FR','Contenu'),(4,'en_US','Orders'),(4,'fr_FR','Commandes'),(5,'en_US','Modules'),(5,'fr_FR','Modules');
/*!40000 ALTER TABLE `export_category_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_i18n`
--

DROP TABLE IF EXISTS `export_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `export_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `export_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `export` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_i18n`
--

LOCK TABLES `export_i18n` WRITE;
/*!40000 ALTER TABLE `export_i18n` DISABLE KEYS */;
INSERT INTO `export_i18n` VALUES (1,'en_US','Mailing','Export the last name, first name and email address of the newsletter subscribers'),(1,'fr_FR','Mailing','Exporter le nom, prénom et adresse mail des abonnés à la newsletter'),(2,'en_US','Customers','Export all the information about your customers'),(2,'fr_FR','Clients','Exporter toutes les informations à propos de vos clients'),(3,'en_US','Product prices excluding taxes','Export the prices of the products excluding taxes'),(3,'fr_FR','Prix des produits Hors-Taxes','Exporter le prix hors taxes de vos produits'),(4,'en_US','Product prices including taxes','Export the prices of the products including taxes'),(4,'fr_FR','Prix des produits TTC','Exporter le prix TTC de vos produits'),(5,'en_US','Product SEO information','\n                    Export the SEO information ( rewritten url, meta description and keywords, page title ) of your products\n                '),(5,'fr_FR','Informations SEO des produits','\n                    Exporter les informations SEO de vos produits\n                    ( url réécrites, meta description et mots clés, titre ) de vos produits\n                '),(6,'en_US','Contents and folder','\n                    Export your contents and their related folders\n                '),(6,'fr_FR','Contenus et dossiers','\n                    Exporter vos contenus et les dossiers associés\n                '),(7,'en_US','Full orders','\n                    Export your orders\n                '),(7,'fr_FR','Commandes complètes','\n                    Exporter vos commandes\n                '),(8,'en_US','Product I18n information','\n                    Export the I18n information (title, chapo, description, postscriptum) of your products\n                '),(8,'fr_FR','Informations I18n des produits','\n                    Exporter les informations I18n de vos produits (titre produit, résumé, description, conclusion)\n                ');
/*!40000 ALTER TABLE `export_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visible` int(11) DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_av`
--

DROP TABLE IF EXISTS `feature_av`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_av` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_feature_av_feature_id` (`feature_id`),
  CONSTRAINT `fk_feature_av_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_av`
--

LOCK TABLES `feature_av` WRITE;
/*!40000 ALTER TABLE `feature_av` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_av` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_av_i18n`
--

DROP TABLE IF EXISTS `feature_av_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_av_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `feature_av_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `feature_av` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_av_i18n`
--

LOCK TABLES `feature_av_i18n` WRITE;
/*!40000 ALTER TABLE `feature_av_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_av_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_i18n`
--

DROP TABLE IF EXISTS `feature_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `feature_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `feature` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_i18n`
--

LOCK TABLES `feature_i18n` WRITE;
/*!40000 ALTER TABLE `feature_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_product`
--

DROP TABLE IF EXISTS `feature_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `feature_av_id` int(11) DEFAULT NULL,
  `free_text_value` text DEFAULT NULL COMMENT 'deprecated',
  `is_free_text` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_feature_prod_product_id` (`product_id`),
  KEY `idx_feature_prod_feature_id` (`feature_id`),
  KEY `idx_feature_prod_feature_av_id` (`feature_av_id`),
  KEY `idx_feature_product_product_id_feature_id_position` (`product_id`,`feature_id`,`position`),
  CONSTRAINT `fk_feature_prod_feature_av_id` FOREIGN KEY (`feature_av_id`) REFERENCES `feature_av` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_feature_prod_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_feature_prod_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_product`
--

LOCK TABLES `feature_product` WRITE;
/*!40000 ALTER TABLE `feature_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`thelia`@`%`*/ /*!50003 TRIGGER `remove_free_text_feature_av` AFTER DELETE ON `feature_product`
 FOR EACH ROW IF OLD.`is_free_text` = 1 THEN
  DELETE FROM `feature_av` WHERE `id` = OLD.`feature_av_id`;
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `feature_template`
--

DROP TABLE IF EXISTS `feature_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_feature_template_id` (`feature_id`),
  KEY `fk_feature_template_idx` (`template_id`),
  KEY `idx_feature_template_template_id_position` (`template_id`,`position`),
  CONSTRAINT `fk_feature_template` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_feature_template_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_template`
--

LOCK TABLES `feature_template` WRITE;
/*!40000 ALTER TABLE `feature_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT 0,
  `visible` tinyint(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_document`
--

DROP TABLE IF EXISTS `folder_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_document_folder_id` (`folder_id`),
  CONSTRAINT `fk_folder_document_folder_id` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_document`
--

LOCK TABLES `folder_document` WRITE;
/*!40000 ALTER TABLE `folder_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_document_i18n`
--

DROP TABLE IF EXISTS `folder_document_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_document_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `folder_document_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `folder_document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_document_i18n`
--

LOCK TABLES `folder_document_i18n` WRITE;
/*!40000 ALTER TABLE `folder_document_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_document_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_i18n`
--

DROP TABLE IF EXISTS `folder_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `folder_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `folder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_i18n`
--

LOCK TABLES `folder_i18n` WRITE;
/*!40000 ALTER TABLE `folder_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_image`
--

DROP TABLE IF EXISTS `folder_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_image_folder_id` (`folder_id`),
  KEY `idx_folder_image_folder_id_position` (`folder_id`,`position`),
  CONSTRAINT `fk_folder_image_folder_id` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_image`
--

LOCK TABLES `folder_image` WRITE;
/*!40000 ALTER TABLE `folder_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_image_i18n`
--

DROP TABLE IF EXISTS `folder_image_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_image_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `folder_image_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `folder_image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_image_i18n`
--

LOCK TABLES `folder_image_i18n` WRITE;
/*!40000 ALTER TABLE `folder_image_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_image_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_version`
--

DROP TABLE IF EXISTS `folder_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_version` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `visible` tinyint(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  CONSTRAINT `folder_version_FK_1` FOREIGN KEY (`id`) REFERENCES `folder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_version`
--

LOCK TABLES `folder_version` WRITE;
/*!40000 ALTER TABLE `folder_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_firewall`
--

DROP TABLE IF EXISTS `form_firewall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_firewall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(255) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `attempts` tinyint(4) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_form_firewall_form_name` (`form_name`),
  KEY `idx_form_firewall_ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_firewall`
--

LOCK TABLES `form_firewall` WRITE;
/*!40000 ALTER TABLE `form_firewall` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_firewall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook`
--

DROP TABLE IF EXISTS `hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `by_module` tinyint(1) DEFAULT NULL,
  `native` tinyint(1) DEFAULT NULL,
  `activate` tinyint(1) DEFAULT NULL,
  `block` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`,`type`),
  KEY `idx_module_activate` (`activate`)
) ENGINE=InnoDB AUTO_INCREMENT=3033 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook`
--

LOCK TABLES `hook` WRITE;
/*!40000 ALTER TABLE `hook` DISABLE KEYS */;
INSERT INTO `hook` VALUES (1,'order-invoice.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,'order-invoice.delivery-address',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,'order-invoice.payment-extra',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,'order-invoice.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,'order-invoice.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,'order-invoice.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,'order-invoice.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(8,'order-payment-gateway.body',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(9,'order-payment-gateway.javascript',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(10,'order-payment-gateway.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(11,'order-payment-gateway.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(12,'order-payment-gateway.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(13,'sitemap.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(14,'currency.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(15,'currency.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(16,'currency.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(17,'currency.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(18,'currency.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(19,'login.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(20,'login.main-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(21,'login.form-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(22,'login.form-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(23,'login.main-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(24,'login.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(25,'login.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(26,'login.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(27,'login.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(28,'account-update.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(29,'account-update.form-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(30,'account-update.form-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(31,'account-update.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(32,'account-update.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(33,'account-update.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(34,'account-update.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(35,'cart.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(36,'cart.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(37,'cart.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(38,'cart.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(39,'cart.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(40,'contact.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(41,'contact.form-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(42,'contact.form-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(43,'contact.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(44,'contact.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(45,'contact.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(46,'contact.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(47,'order-placed.body',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(48,'order-placed.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(49,'order-placed.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(50,'order-placed.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(51,'search.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(52,'search.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(53,'search.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(54,'register.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(55,'register.form-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(56,'register.form-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(57,'register.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(58,'register.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(59,'register.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(60,'register.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(61,'password.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(62,'password.form-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(63,'password.form-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(64,'password.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(65,'password.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(66,'password.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(67,'password.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(68,'language.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(69,'language.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(70,'language.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(71,'language.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(72,'language.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(73,'contact.success',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(74,'newsletter.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(75,'newsletter.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(76,'newsletter.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(77,'newsletter.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(78,'newsletter.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(79,'badresponseorder.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(80,'badresponseorder.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(81,'badresponseorder.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(82,'content.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(83,'content.main-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(84,'content.main-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(85,'content.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(86,'content.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(87,'content.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(88,'content.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(89,'main.head-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(90,'main.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(91,'main.head-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(92,'main.body-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(93,'main.header-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(94,'main.navbar-secondary',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(95,'main.navbar-primary',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(96,'main.header-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(97,'main.content-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(98,'main.content-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(99,'main.footer-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(100,'main.footer-body',1,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(101,'main.footer-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(102,'main.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(103,'main.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(104,'main.body-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(105,'404.content',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(106,'404.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(107,'404.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(108,'404.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(109,'order-delivery.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(110,'order-delivery.form-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(111,'order-delivery.form-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(112,'order-delivery.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(113,'order-delivery.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(114,'order-delivery.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(115,'order-delivery.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(116,'address-create.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(117,'address-create.form-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(118,'address-create.form-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(119,'address-create.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(120,'address-create.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(121,'address-create.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(122,'address-create.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(123,'folder.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(124,'folder.main-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(125,'folder.main-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(126,'folder.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(127,'folder.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(128,'folder.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(129,'folder.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(130,'order-failed.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(131,'order-failed.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(132,'order-failed.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(133,'order-failed.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(134,'order-failed.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(135,'category.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(136,'category.main-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(137,'category.main-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(138,'category.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(139,'category.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(140,'category.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(141,'category.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(142,'address-update.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(143,'address-update.form-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(144,'address-update.form-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(145,'address-update.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(146,'address-update.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(147,'address-update.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(148,'address-update.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(149,'home.body',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(150,'home.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(151,'home.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(152,'home.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(153,'account-password.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(154,'account-password.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(155,'account-password.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(156,'account-password.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(157,'account-password.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(158,'product.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(159,'product.gallery',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(160,'product.details-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(161,'product.details-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(162,'product.additional',1,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(163,'product.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(164,'product.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(165,'product.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(166,'product.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(167,'account.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(168,'account.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(169,'account.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(170,'account.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(171,'account.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(172,'viewall.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(173,'viewall.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(174,'viewall.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(175,'viewall.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(176,'viewall.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(177,'singleproduct.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(178,'singleproduct.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(179,'category.sidebar-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(180,'category.sidebar-body',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(181,'category.sidebar-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(182,'content.sidebar-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(183,'content.sidebar-body',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(184,'content.sidebar-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(185,'order-delivery.extra',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(186,'order-delivery.javascript',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(187,'category.content-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(188,'category.content-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(189,'content.content-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(190,'content.content-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(191,'folder.content-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(192,'folder.content-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(193,'brand.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(194,'brand.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(195,'brand.main-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(196,'brand.main-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(197,'brand.content-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(198,'brand.content-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(199,'brand.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(200,'brand.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(201,'brand.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(202,'brand.sidebar-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(203,'brand.sidebar-body',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(204,'brand.sidebar-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(205,'account-order.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(206,'account-order.information',1,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(207,'account-order.after-information',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(208,'account-order.delivery-information',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(209,'account-order.delivery-address',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(210,'account-order.invoice-information',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(211,'account-order.invoice-address',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(212,'account-order.after-addresses',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(213,'account-order.products-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(214,'account-order.product-extra',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(215,'account-order.products-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(216,'account-order.after-products',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(217,'account-order.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(218,'account-order.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(219,'account-order.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(220,'account-order.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(221,'account.additional',1,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(222,'account-order.product',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(223,'mini-cart',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(224,'sale.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(225,'sale.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(226,'sale.main-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(227,'sale.main-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(228,'sale.content-top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(229,'sale.content-bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(230,'sale.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(231,'sale.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(232,'sale.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(233,'account-order.invoice-address-bottom',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(234,'account-order.delivery-address-bottom',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(235,'newsletter-unsubscribe.top',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(236,'newsletter-unsubscribe.bottom',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(237,'newsletter-unsubscribe.stylesheet',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(238,'newsletter-unsubscribe.after-javascript-include',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(239,'newsletter-unsubscribe.javascript-initialization',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(240,'order-invoice.coupon-form',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(241,'order-invoice.payment-form',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(242,'account-order.product-list',1,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1000,'category.tab-content',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1001,'content.tab-content',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1002,'folder.tab-content',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1003,'order.tab-content',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1004,'product.tab-content',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1005,'features-value.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1006,'features-value.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1007,'feature.value-create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1008,'feature.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1009,'product.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1010,'coupon.create-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1011,'taxes.update-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1012,'tax-rule.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1013,'tools.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1014,'tools.col1-top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1015,'tools.col1-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1016,'tools.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1017,'tools.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1018,'messages.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1019,'messages.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1020,'messages.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1021,'messages.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1022,'message.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1023,'message.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1024,'messages.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1025,'taxes-rules.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1026,'taxes-rules.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1027,'tax.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1028,'tax.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1029,'tax-rule.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1030,'tax-rule.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1031,'taxes-rules.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1032,'exports.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1033,'exports.row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1034,'exports.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1035,'exports.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1036,'export.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1037,'product.folders-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1038,'product.folders-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1039,'product.details-pricing-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1040,'product.details-details-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1041,'product.details-promotion-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1042,'product.before-combinations',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1043,'product.combinations-list-caption',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1044,'product.after-combinations',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1045,'product.combination-delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1046,'modules.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1047,'modules.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1048,'currency.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1049,'category.contents-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1050,'category.contents-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1051,'category.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1052,'document.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1053,'customer.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1054,'customers.caption',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1055,'customers.header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1056,'customers.row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1057,'customer.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1058,'customer.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1059,'customer.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1060,'customers.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1061,'product.contents-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1062,'product.contents-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1063,'product.accessories-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1064,'product.accessories-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1065,'product.categories-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1066,'product.categories-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1067,'product.attributes-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1068,'product.attributes-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1069,'product.features-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1070,'product.features-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1071,'template.attributes-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1072,'template.attributes-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1073,'template.features-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1074,'template.features-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1075,'templates.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1076,'templates.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1077,'templates.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1078,'templates.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1079,'template.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1080,'template.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1081,'templates.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1082,'configuration.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1083,'configuration.catalog-top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1084,'configuration.catalog-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1085,'configuration.shipping-top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1086,'configuration.shipping-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1087,'configuration.system-top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1088,'configuration.system-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1089,'configuration.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1090,'configuration.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1091,'index.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1092,'index.middle',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1093,'index.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1094,'orders.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1095,'orders.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1096,'orders.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1097,'orders.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1098,'orders.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1099,'shipping-zones.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1100,'shipping-zones.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1101,'shipping-zones.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1102,'shipping-zones.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1103,'shipping-zones.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1104,'content.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1105,'home.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1106,'home.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1107,'home.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1108,'modules.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1109,'modules.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1110,'modules.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1111,'languages.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1112,'languages.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1113,'language.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1114,'languages.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1115,'languages.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1116,'zone.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1117,'shipping-zones.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1118,'system.logs-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1119,'search.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1120,'search.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1121,'search.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1122,'administrators.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1123,'administrators.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1124,'administrator.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1125,'administrator.update-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1126,'administrator.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1127,'administrators.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1128,'module-hook.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1129,'shipping-configuration.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1130,'shipping-configuration.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1131,'shipping-configuration.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1132,'shipping-configuration.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1133,'shipping-configuration.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1134,'shipping-configuration.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1135,'shipping-configuration.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1136,'features.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1137,'features.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1138,'features.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1139,'features.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1140,'feature.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1141,'feature.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1142,'feature.add-to-all-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1143,'feature.remove-to-all-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1144,'features.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1145,'module.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1146,'module-hook.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1147,'module-hook.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1148,'module-hook.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1149,'shipping-configuration.edit',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1150,'shipping-configuration.country-delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1151,'shipping-configuration.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1152,'mailing-system.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1153,'mailing-system.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1154,'mailing-system.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1155,'categories.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1156,'categories.caption',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1157,'categories.header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1158,'categories.row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1159,'products.caption',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1160,'products.header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1161,'products.row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1162,'categories.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1163,'categories.catalog-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1164,'category.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1165,'product.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1166,'category.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1167,'product.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1168,'categories.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1169,'variables.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1170,'variables.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1171,'variables.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1172,'variables.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1173,'variable.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1174,'variable.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1175,'variables.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1176,'order.product-list',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1177,'order.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1178,'config-store.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1179,'translations.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1180,'folders.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1181,'folders.caption',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1182,'folders.header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1183,'folders.row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1184,'contents.caption',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1185,'contents.header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1186,'contents.row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1187,'folders.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1188,'folder.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1189,'content.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1190,'folder.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1191,'content.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1192,'folders.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1193,'template.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1194,'tax.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1195,'hook.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1196,'countries.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1197,'countries.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1198,'countries.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1199,'countries.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1200,'country.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1201,'country.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1202,'countries.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1203,'currencies.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1204,'currencies.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1205,'currencies.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1206,'currencies.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1207,'currency.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1208,'currency.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1209,'currencies.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1210,'customer.edit',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1211,'customer.address-create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1212,'customer.address-update-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1213,'customer.address-delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1214,'customer.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1215,'attributes-value.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1216,'attributes-value.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1217,'attribute-value.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1218,'attribute.id-delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1219,'attribute.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1220,'profiles.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1221,'profiles.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1222,'profile.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1223,'profile.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1224,'profiles.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1225,'country.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1226,'profile.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1227,'variable.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1228,'coupon.update-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1229,'coupon.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1230,'coupon.list-caption',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1231,'coupon.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1232,'coupon.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1233,'coupon.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1234,'coupon.list-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1235,'module.configuration',2,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1236,'module.config-js',2,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1237,'message.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1238,'image.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1239,'attributes.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1240,'attributes.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1241,'attributes.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1242,'attributes.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1243,'attribute.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1244,'attribute.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1245,'attribute.add-to-all-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1246,'attribute.remove-to-all-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1247,'attributes.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1248,'admin-logs.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1249,'admin-logs.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1250,'admin-logs.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1251,'folder.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1252,'hooks.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1253,'hooks.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1254,'hooks.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1255,'hooks.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1256,'hook.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1257,'hook.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1258,'hooks.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1259,'main.head-css',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1260,'main.before-topbar',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1261,'main.inside-topbar',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1262,'main.after-topbar',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1263,'main.before-top-menu',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1264,'main.in-top-menu-items',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1265,'main.after-top-menu',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1266,'main.before-footer',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1267,'main.in-footer',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1268,'main.after-footer',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1269,'main.footer-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1270,'main.topbar-top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1271,'main.topbar-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1272,'main.top-menu-customer',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1273,'main.top-menu-order',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1274,'main.top-menu-catalog',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1275,'main.top-menu-content',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1276,'main.top-menu-tools',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1277,'main.top-menu-modules',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1278,'main.top-menu-configuration',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1279,'brand.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1280,'home.block',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1281,'brands.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1282,'brands.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1283,'brands.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1284,'brands.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1285,'brand.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1286,'brand.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1287,'brand.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1288,'imports.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1289,'imports.row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1290,'imports.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1291,'imports.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1292,'import.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1293,'brand.tab-content',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1294,'customer.orders-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1295,'customer.orders-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1296,'sales.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1297,'sales.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1298,'sales.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1299,'sales.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1300,'sale.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1301,'sale.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1302,'sales.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1303,'product.combinations-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1304,'main.before-content',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1305,'main.after-content',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1306,'category.tab',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1307,'product.tab',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1308,'folder.tab',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1309,'content.tab',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1310,'brand.tab',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1311,'order-edit.bill-delivery-address',2,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1312,'product.modification.form_top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1313,'product.modification.form_bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1314,'brand.update-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1315,'sale.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1319,'coupon.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1320,'order.tab',2,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1321,'profile.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1322,'profile.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1323,'import.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1324,'import.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1325,'export.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1326,'export.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1327,'category-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1328,'category-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1329,'brand-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1330,'brand-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1331,'attribute-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1332,'attribute-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1333,'currency-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1334,'currency-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1335,'country-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1336,'country-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1337,'content-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1338,'content-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1339,'feature-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1340,'feature-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1341,'document-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1342,'document-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1343,'customer-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1344,'customer-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1345,'image-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1346,'image-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1347,'hook-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1348,'hook-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1349,'folder-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1350,'folder-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1351,'module-hook-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1352,'module-hook-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1353,'module-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1354,'module-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1355,'message-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1356,'message-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1357,'profile-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1358,'profile-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1359,'product-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1360,'product-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1361,'order-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1362,'order-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1363,'shipping-zones-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1364,'shipping-zones-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1365,'shipping-configuration-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1366,'shipping-configuration-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1367,'sale-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1368,'sale-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1369,'variables-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1370,'variables-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1371,'template-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1372,'template-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1373,'tax-rule-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1374,'tax-rule-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1375,'tax-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1376,'tax-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1377,'order-edit.product-list',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1378,'tab-seo.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1379,'tab-seo.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1380,'tab-image.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1381,'tab-image.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1382,'tab-document.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1383,'tab-document.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1384,'export.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1385,'export.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1386,'order-edit.customer-information-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1387,'order-edit.payment-module-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1388,'order-edit.delivery-module-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1389,'tab-seo.update-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1390,'order-edit.order-product-table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1391,'order-edit.order-product-table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1392,'administrators.header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1393,'administrators.row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1394,'advanced-configuration',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1395,'advanced-configuration.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1396,'brand.modification.form-right.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1397,'brand.modification.form-right.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1398,'category.modification.form-right.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1399,'category.modification.form-right.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1400,'content.modification.form-right.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1401,'content.modification.form-right.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1402,'folder.modification.form-right.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1403,'folder.modification.form-right.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1404,'product.modification.form-right.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1405,'product.modification.form-right.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1406,'state-edit.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1407,'state-edit.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1408,'state.edit-js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1409,'states.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1410,'states.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1411,'states.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1412,'states.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1413,'state.create-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1414,'state.delete-form',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1415,'states.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1416,'configuration.order-path.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1417,'configuration.order-path.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1418,'order-status.top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1419,'order-status.table-header',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1420,'order-status.table-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1421,'order-status.bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1422,'order-status.form.creation',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1423,'order-status.form.modification',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1424,'order-status.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(1425,'item.edition.images',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2001,'invoice.css',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2002,'invoice.header',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2003,'invoice.footer-top',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2004,'invoice.imprint',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2005,'invoice.footer-bottom',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2006,'invoice.information',3,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2007,'invoice.after-information',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2008,'invoice.delivery-address',3,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2009,'invoice.after-addresses',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2010,'invoice.after-products',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2011,'invoice.after-summary',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2012,'delivery.css',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2013,'delivery.header',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2014,'delivery.footer-top',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2015,'delivery.imprint',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2016,'delivery.footer-bottom',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2017,'delivery.information',3,0,1,1,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2018,'delivery.after-information',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2019,'delivery.delivery-address',3,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2020,'delivery.after-addresses',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2021,'delivery.after-summary',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2022,'order-placed.additional-payment-info',1,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2023,'wysiwyg.js',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2024,'order-edit.cart-top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2025,'order-edit.cart-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2026,'order-edit.bill-top',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2027,'order-edit.bill-bottom',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2028,'order-edit.before-order-product-list',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2029,'order-edit.before-order-product-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2030,'order-edit.after-order-product-row',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2031,'order-edit.after-order-product-list',2,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2032,'invoice.after-payment-module',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2033,'invoice.after-delivery-module',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2034,'delivery.after-delivery-module',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2035,'invoice.order-product',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2036,'delivery.order-product',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2037,'delivery.product-list',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2038,'invoice.product-list',3,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3000,'email-html.layout.css',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3001,'email-html.layout.footer',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3002,'email-html.order-confirmation.before-address',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3003,'email-html.order-confirmation.delivery-address',4,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3004,'email-html.order-confirmation.after-address',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3005,'email-html.order-confirmation.order-product',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3006,'email-html.order-confirmation.before-products',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3007,'email-html.order-confirmation.after-products',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3008,'email-html.order-confirmation.footer',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3009,'email-html.order-notification.before-address',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3010,'email-html.order-notification.delivery-address',4,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3011,'email-html.order-notification.after-address',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3012,'email-html.order-notification.order-product',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3013,'email-html.order-notification.before-products',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3014,'email-html.order-notification.after-products',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3015,'email-txt.order-confirmation.before-address',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3016,'email-txt.order-confirmation.delivery-address',4,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3017,'email-txt.order-confirmation.after-address',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3018,'email-txt.order-confirmation.order-product',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3019,'email-txt.order-confirmation.before-products',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3020,'email-txt.order-confirmation.after-products',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3021,'email-txt.order-notification.before-address',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3022,'email-txt.order-notification.delivery-address',4,1,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3023,'email-txt.order-notification.after-address',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3024,'email-txt.order-notification.order-product',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3025,'email-txt.order-notification.before-products',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3026,'email-txt.order-notification.after-products',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3027,'email-html.order-confirmation.product-list',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3028,'email-txt.order-confirmation.product-list',4,0,1,1,0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3029,'thelia.blocks.plugincss',2,0,0,1,0,NULL,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(3030,'thelia.blocks.plugins',2,0,0,1,0,NULL,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(3031,'thelia.blocks.variables',2,0,0,1,0,NULL,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(3032,'thelia.blocks.item.configuration',2,0,0,1,0,NULL,'2026-09-30 13:51:54','2026-09-30 13:51:54');
/*!40000 ALTER TABLE `hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_i18n`
--

DROP TABLE IF EXISTS `hook_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hook_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `hook_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `hook` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_i18n`
--

LOCK TABLES `hook_i18n` WRITE;
/*!40000 ALTER TABLE `hook_i18n` DISABLE KEYS */;
INSERT INTO `hook_i18n` VALUES (1,'cs_CZ',NULL,NULL,NULL),(1,'de_DE','Bezahlungsmethode - oben',NULL,NULL),(1,'en_US','Invoice choice - at the top',NULL,NULL),(1,'es_ES','Opción de factura - en la parte superior',NULL,NULL),(1,'fr_FR','Choix du mode de paiement - en haut',NULL,NULL),(1,'it_IT',NULL,NULL,NULL),(1,'ru_RU','Выбор счет-фактуры - вверху',NULL,NULL),(2,'cs_CZ',NULL,NULL,NULL),(2,'de_DE','Bezahlungsmethode - Lieferadresse',NULL,NULL),(2,'en_US','Invoice choice - delivery address',NULL,NULL),(2,'es_ES','Opción de factura - dirección de envío',NULL,NULL),(2,'fr_FR','Choix du mode de paiement - adresse de livraison',NULL,NULL),(2,'it_IT',NULL,NULL,NULL),(2,'ru_RU','Выбор счет-фактуры - адрес доставки',NULL,NULL),(3,'cs_CZ',NULL,NULL,NULL),(3,'de_DE','Bezahlungsmethode - extra payment zone',NULL,NULL),(3,'en_US','Invoice choice - extra payment zone',NULL,NULL),(3,'es_ES','Opción de factura - zona de pago extra',NULL,NULL),(3,'fr_FR','Choix du mode de paiement - zone de paiement supplémentaire',NULL,NULL),(3,'it_IT',NULL,NULL,NULL),(3,'ru_RU','Выбор счет-фактуры - доп. зона оплаты',NULL,NULL),(4,'cs_CZ',NULL,NULL,NULL),(4,'de_DE','Bezahlungsmethode - unten',NULL,NULL),(4,'en_US','Invoice choice - at the bottom',NULL,NULL),(4,'es_ES','Opción de factura - en la parte inferior de la factura',NULL,NULL),(4,'fr_FR','Choix du mode de paiement - en bas',NULL,NULL),(4,'it_IT',NULL,NULL,NULL),(4,'ru_RU','Выбор счет-фактуры - внизу',NULL,NULL),(5,'cs_CZ',NULL,NULL,NULL),(5,'de_DE','Bezahlungsmethode - nach der Initialisierung von Javascript',NULL,NULL),(5,'en_US','Invoice choice - after javascript initialisation',NULL,NULL),(5,'es_ES','Opción de factura - después de la inicialización de javascript',NULL,NULL),(5,'fr_FR','Choix du mode de paiement - après l\'initialisation du JavaScript',NULL,NULL),(5,'it_IT',NULL,NULL,NULL),(5,'ru_RU','Выбор счет-фактуры - после инициализации javascript ',NULL,NULL),(6,'cs_CZ',NULL,NULL,NULL),(6,'de_DE','Bezahlungsmethode - CSS-Stylesheet',NULL,NULL),(6,'en_US','Invoice choice - CSS stylesheet',NULL,NULL),(6,'es_ES','Opción de factura - hoja de estilos CSS',NULL,NULL),(6,'fr_FR','Choix du mode de paiement - feuille de style CSS',NULL,NULL),(6,'it_IT',NULL,NULL,NULL),(6,'ru_RU','Выбор счет-фактуры - CSS стили',NULL,NULL),(7,'cs_CZ',NULL,NULL,NULL),(7,'de_DE','Bezahlungsmethode - Nach Integration von JavaScript',NULL,NULL),(7,'en_US','Invoice choice - after javascript include',NULL,NULL),(7,'es_ES','Opción de factura - después de incluir javascript',NULL,NULL),(7,'fr_FR','Choix du mode de paiement - après l\'inclusion du JavaScript',NULL,NULL),(7,'it_IT',NULL,NULL,NULL),(7,'ru_RU','Выбор счет-фактуры - после включения javascript',NULL,NULL),(8,'cs_CZ',NULL,NULL,NULL),(8,'de_DE','Zahlung-Gateway - Hauptbereich',NULL,NULL),(8,'en_US','Payment gateway - main area',NULL,NULL),(8,'es_ES','Pasarela de pago - área principal',NULL,NULL),(8,'fr_FR','Passerelle de paiement - zone principale',NULL,NULL),(8,'it_IT',NULL,NULL,NULL),(8,'ru_RU','Платежный шлюз - основная зона',NULL,NULL),(9,'cs_CZ',NULL,NULL,NULL),(9,'de_DE','Zahlung-Gateway - Javascript',NULL,NULL),(9,'en_US','Payment gateway - javascript',NULL,NULL),(9,'es_ES','Pasarela de pago - JavaScript',NULL,NULL),(9,'fr_FR','Passerelle de paiement - javascript',NULL,NULL),(9,'it_IT',NULL,NULL,NULL),(9,'ru_RU','Платежный шлюз - javascript',NULL,NULL),(10,'cs_CZ',NULL,NULL,NULL),(10,'de_DE','Zahlung-Gateway - nach der Initialisierung von Javascript',NULL,NULL),(10,'en_US','Payment gateway - after javascript initialisation',NULL,NULL),(10,'es_ES','Pasarela de pago - después de inicializar JavaScript',NULL,NULL),(10,'fr_FR','Passerelle de paiement - après l\'initialisation du JavaScript',NULL,NULL),(10,'it_IT',NULL,NULL,NULL),(10,'ru_RU','Платежный шлюз - после инициализации javascript',NULL,NULL),(11,'cs_CZ',NULL,NULL,NULL),(11,'de_DE','Zahlung-Gateway - CSS-Stylesheet',NULL,NULL),(11,'en_US','Payment gateway - CSS stylesheet',NULL,NULL),(11,'es_ES','Pasarela de pago - Hoja de estilos CSS',NULL,NULL),(11,'fr_FR','Passerelle de paiement - feuille de style CSS',NULL,NULL),(11,'it_IT',NULL,NULL,NULL),(11,'ru_RU','Платежный шлюз - CSS стили',NULL,NULL),(12,'cs_CZ',NULL,NULL,NULL),(12,'de_DE','Zahlung-Gateway - Nach Integration von JavaScript',NULL,NULL),(12,'en_US','Payment gateway - after javascript include',NULL,NULL),(12,'es_ES','Pasarela de pago - después de incluir JavaScript',NULL,NULL),(12,'fr_FR','Passerelle de paiement - après l\'inclusion du JavaScript',NULL,NULL),(12,'it_IT',NULL,NULL,NULL),(12,'ru_RU','Платежный шлюз - после включения javascript',NULL,NULL),(13,'cs_CZ',NULL,NULL,NULL),(13,'de_DE','Sitemap - unten',NULL,NULL),(13,'en_US','Sitemap - at the bottom',NULL,NULL),(13,'es_ES','Mapa de sitio - en la base',NULL,NULL),(13,'fr_FR','Sitemap - en bas',NULL,NULL),(13,'it_IT',NULL,NULL,NULL),(13,'ru_RU','Карта сайта - внизу',NULL,NULL),(14,'cs_CZ',NULL,NULL,NULL),(14,'de_DE','Währungswahl-Seite - oben',NULL,NULL),(14,'en_US','Curency selection page - at the top',NULL,NULL),(14,'es_ES','Página de selección de divisa - en la parte superior',NULL,NULL),(14,'fr_FR','Page du choix de la device - en haut',NULL,NULL),(14,'it_IT',NULL,NULL,NULL),(14,'ru_RU','Страница выбора валюты - вверху',NULL,NULL),(15,'cs_CZ',NULL,NULL,NULL),(15,'de_DE','Währungswahl-Seite - unten',NULL,NULL),(15,'en_US','Curency selection page - at the bottom',NULL,NULL),(15,'es_ES','Página de selección de divisa - en la parte inferior',NULL,NULL),(15,'fr_FR','Page du choix de la device - en bas',NULL,NULL),(15,'it_IT',NULL,NULL,NULL),(15,'ru_RU','Страница выбора валюты - внизу',NULL,NULL),(16,'cs_CZ',NULL,NULL,NULL),(16,'de_DE','Währungswahl-Seite - CSS-Stylesheet',NULL,NULL),(16,'en_US','Curency selection page - CSS stylesheet',NULL,NULL),(16,'es_ES','Página de selección de divisa - hoja de estilos CSS',NULL,NULL),(16,'fr_FR','Page du choix de la device - feuille de style CSS',NULL,NULL),(16,'it_IT',NULL,NULL,NULL),(16,'ru_RU','Страница выбора валюты - CSS стили',NULL,NULL),(17,'cs_CZ',NULL,NULL,NULL),(17,'de_DE','Währungswahl-Seite - Nach Integration von JavaScript',NULL,NULL),(17,'en_US','Curency selection page - after javascript include',NULL,NULL),(17,'es_ES','Página de selección de divisa - después de inclusión javascript',NULL,NULL),(17,'fr_FR','Page du choix de la device - après l\'inclusion du JavaScript',NULL,NULL),(17,'it_IT',NULL,NULL,NULL),(17,'ru_RU','Страница выбора валюты - послк включения javascript',NULL,NULL),(18,'cs_CZ',NULL,NULL,NULL),(18,'de_DE','Währungswahl-Seite - nach der Initialisierung von Javascript',NULL,NULL),(18,'en_US','Curency selection page - after javascript initialisation',NULL,NULL),(18,'es_ES','Página de selección de divisa - después de la inicialización de javascript',NULL,NULL),(18,'fr_FR','Page du choix de la device - après l\'initialisation du JavaScript',NULL,NULL),(18,'it_IT',NULL,NULL,NULL),(18,'ru_RU','Страница выбора валюты - после инициализации javascript',NULL,NULL),(19,'cs_CZ',NULL,NULL,NULL),(19,'de_DE','Anmeldeseite - oben',NULL,NULL),(19,'en_US','Login page - at the top',NULL,NULL),(19,'es_ES','Página de inicio de sesión - en la parte superior',NULL,NULL),(19,'fr_FR','Page de connexion - en haut',NULL,NULL),(19,'it_IT',NULL,NULL,NULL),(19,'ru_RU','Страница логина - вверху',NULL,NULL),(20,'cs_CZ',NULL,NULL,NULL),(20,'de_DE','Anmeldeseite - oben an dem Hauptbereich',NULL,NULL),(20,'en_US','Login page - at the top of the main area',NULL,NULL),(20,'es_ES','Página de inicio de sesión - en la parte superior del área principal',NULL,NULL),(20,'fr_FR','Page de connexion - en haut de la zone principal',NULL,NULL),(20,'it_IT',NULL,NULL,NULL),(20,'ru_RU','Страница логина - вверху основной зоны',NULL,NULL),(21,'cs_CZ',NULL,NULL,NULL),(21,'de_DE','Anmeldeseite - oben im Formular',NULL,NULL),(21,'en_US','Login page - at the top of the form',NULL,NULL),(21,'es_ES','Página de inicio de sesión - en la parte superior del formulario',NULL,NULL),(21,'fr_FR','Page de connexion - en haut du formulaire',NULL,NULL),(21,'it_IT',NULL,NULL,NULL),(21,'ru_RU','Страница логина - вверху формы',NULL,NULL),(22,'cs_CZ',NULL,NULL,NULL),(22,'de_DE','Anmeldeseite - unten an dem Formular',NULL,NULL),(22,'en_US','Login page - at the bottom of the form',NULL,NULL),(22,'es_ES','Página de inicio de sesión - en la parte inferior del formulario',NULL,NULL),(22,'fr_FR','Page de connexion - en bas du formulaire',NULL,NULL),(22,'it_IT',NULL,NULL,NULL),(22,'ru_RU','Страница логина - внизу формы',NULL,NULL),(23,'cs_CZ',NULL,NULL,NULL),(23,'de_DE','Anmeldeseite - unten an dem Hauptbereich',NULL,NULL),(23,'en_US','Login page - at the bottom of the main area',NULL,NULL),(23,'es_ES','Página de inicio de sesión - en la parte inferior del área principal',NULL,NULL),(23,'fr_FR','Page de connexion - en bas de la zone principal',NULL,NULL),(23,'it_IT',NULL,NULL,NULL),(23,'ru_RU','Страница логина - внизу основной зоны',NULL,NULL),(24,'cs_CZ',NULL,NULL,NULL),(24,'de_DE','Anmeldeseite - unten',NULL,NULL),(24,'en_US','Login page - at the bottom',NULL,NULL),(24,'es_ES','Página de inicio de sesión - en la parte inferior',NULL,NULL),(24,'fr_FR','Page de connexion - en bas',NULL,NULL),(24,'it_IT',NULL,NULL,NULL),(24,'ru_RU','Страница логина - внизу',NULL,NULL),(25,'cs_CZ',NULL,NULL,NULL),(25,'de_DE','Anmeldeseite - CSS-Stylesheet',NULL,NULL),(25,'en_US','Login page - CSS stylesheet',NULL,NULL),(25,'es_ES','Página de inicio de sesión - hoja de estilos CSS',NULL,NULL),(25,'fr_FR','Page de connexion - feuille de style CSS',NULL,NULL),(25,'it_IT',NULL,NULL,NULL),(25,'ru_RU','Страница логина - CSS стили',NULL,NULL),(26,'cs_CZ',NULL,NULL,NULL),(26,'de_DE','Anmeldeseite - Nach Integration von JavaScript',NULL,NULL),(26,'en_US','Login page - after javascript include',NULL,NULL),(26,'es_ES','Página de inicio de sesión - después de incluir JavaScript',NULL,NULL),(26,'fr_FR','Page de connexion - après l\'inclusion du JavaScript',NULL,NULL),(26,'it_IT',NULL,NULL,NULL),(26,'ru_RU','Страница логина - после включения javascript',NULL,NULL),(27,'cs_CZ',NULL,NULL,NULL),(27,'de_DE','Anmeldeseite - nach der Initialisierung von Javascript',NULL,NULL),(27,'en_US','Login page - after javascript initialisation',NULL,NULL),(27,'es_ES','Página de inicio de sesión - después de la inicialización de JavaScript',NULL,NULL),(27,'fr_FR','Page de connexion - après l\'initialisation du JavaScript',NULL,NULL),(27,'it_IT',NULL,NULL,NULL),(27,'ru_RU','Страница логина - после инициализации javascript',NULL,NULL),(28,'cs_CZ',NULL,NULL,NULL),(28,'de_DE','Kundenkonto Änderung - oben',NULL,NULL),(28,'en_US','Update customer account - at the top',NULL,NULL),(28,'es_ES','Actualización de cuenta de cliente - encabezado',NULL,NULL),(28,'fr_FR','Modification compte client - en haut',NULL,NULL),(28,'it_IT',NULL,NULL,NULL),(28,'ru_RU','Обновление аккаунта клиента - вверху',NULL,NULL),(29,'cs_CZ',NULL,NULL,NULL),(29,'de_DE','Kundenkonto Änderung - oben im Formular',NULL,NULL),(29,'en_US','Update customer account - at the top of the form',NULL,NULL),(29,'es_ES','Actualización de cuenta de cliente - encabezado del formulario',NULL,NULL),(29,'fr_FR','Modification compte client - en haut du formulaire',NULL,NULL),(29,'it_IT',NULL,NULL,NULL),(29,'ru_RU','Обновление аккаунта клиента - вверху формы',NULL,NULL),(30,'cs_CZ',NULL,NULL,NULL),(30,'de_DE','Kundenkonto Änderung - unten an dem Formular',NULL,NULL),(30,'en_US','Update customer account - at the bottom of the form',NULL,NULL),(30,'es_ES','Actualización de cuenta de cliente - al pie del formulario',NULL,NULL),(30,'fr_FR','Modification compte client - en bas du formulaire',NULL,NULL),(30,'it_IT',NULL,NULL,NULL),(30,'ru_RU','Обновление аккаунта клиента - внизу формы',NULL,NULL),(31,'cs_CZ',NULL,NULL,NULL),(31,'de_DE','Kundenkonto Änderung - unten',NULL,NULL),(31,'en_US','Update customer account - at the bottom',NULL,NULL),(31,'es_ES','Actualización de cuenta de cliente - al pie',NULL,NULL),(31,'fr_FR','Modification compte client - en bas',NULL,NULL),(31,'it_IT',NULL,NULL,NULL),(31,'ru_RU','Обновление аккаунта клиента - внизу',NULL,NULL),(32,'cs_CZ',NULL,NULL,NULL),(32,'de_DE','Kundenkonto Änderung - CSS-Stylesheet',NULL,NULL),(32,'en_US','Update customer account - CSS stylesheet',NULL,NULL),(32,'es_ES','Actualización de cuenta del cliente - Hoja de estilos CSS',NULL,NULL),(32,'fr_FR','Modification compte client - feuille de style CSS',NULL,NULL),(32,'it_IT',NULL,NULL,NULL),(32,'ru_RU','Обновление аккаунта клиента - CSS стили',NULL,NULL),(33,'cs_CZ',NULL,NULL,NULL),(33,'de_DE','Kundenkonto Änderung - Nach Integration von JavaScript',NULL,NULL),(33,'en_US','Update customer account - after javascript include',NULL,NULL),(33,'es_ES','Actualización de cuenta del cliente - después de incluir JavaScript',NULL,NULL),(33,'fr_FR','Modification compte client - après l\'inclusion du JavaScript',NULL,NULL),(33,'it_IT',NULL,NULL,NULL),(33,'ru_RU','Обновление аккаунта клиента - после включения javascript',NULL,NULL),(34,'cs_CZ',NULL,NULL,NULL),(34,'de_DE','Kundenkonto Änderung - nach der Initialisierung von Javascript',NULL,NULL),(34,'en_US','Update customer account - after javascript initialisation',NULL,NULL),(34,'es_ES','Actualización de cuenta de cliente - después de inicializar JavaScript',NULL,NULL),(34,'fr_FR','Modification compte client - après l\'initialisation du JavaScript',NULL,NULL),(34,'it_IT',NULL,NULL,NULL),(34,'ru_RU','Обновление аккаунта клиента - после инициализации javascript',NULL,NULL),(35,'cs_CZ',NULL,NULL,NULL),(35,'de_DE','Warenkorb - oben ',NULL,NULL),(35,'en_US','Cart - at the top',NULL,NULL),(35,'es_ES','Carrito - En la parte superior',NULL,NULL),(35,'fr_FR','Panier - en haut',NULL,NULL),(35,'it_IT',NULL,NULL,NULL),(35,'ru_RU','Корзина - вверху',NULL,NULL),(36,'cs_CZ',NULL,NULL,NULL),(36,'de_DE','Warenkorb - unten',NULL,NULL),(36,'en_US','Cart - at the bottom',NULL,NULL),(36,'es_ES','Carrito - En la parte inferior',NULL,NULL),(36,'fr_FR','Panier - en bas',NULL,NULL),(36,'it_IT',NULL,NULL,NULL),(36,'ru_RU','Корзина - внизу',NULL,NULL),(37,'cs_CZ',NULL,NULL,NULL),(37,'de_DE','Warenkorb - Nach Integration von JavaScript',NULL,NULL),(37,'en_US','Cart - after javascript include',NULL,NULL),(37,'es_ES','Carro - después de inclusión javascript',NULL,NULL),(37,'fr_FR','Panier - après l\'inclusion du JavaScript',NULL,NULL),(37,'it_IT',NULL,NULL,NULL),(37,'ru_RU','Корзина - после включения javascript',NULL,NULL),(38,'cs_CZ',NULL,NULL,NULL),(38,'de_DE','Warenkorb - CSS-Stylesheet',NULL,NULL),(38,'en_US','Cart - CSS stylesheet',NULL,NULL),(38,'es_ES','Carrito - hoja de estilos CSS',NULL,NULL),(38,'fr_FR','Panier - feuille de style CSS',NULL,NULL),(38,'it_IT',NULL,NULL,NULL),(38,'ru_RU','Корзина - CSS стили',NULL,NULL),(39,'cs_CZ',NULL,NULL,NULL),(39,'de_DE','Warenkorb - Initialisierung von Javascript',NULL,NULL),(39,'en_US','Cart - javascript initialization',NULL,NULL),(39,'es_ES','Carro - inicialización de javascript',NULL,NULL),(39,'fr_FR','Panier - initialisation du JavaScript',NULL,NULL),(39,'it_IT',NULL,NULL,NULL),(39,'ru_RU','Корзина - после инициализации javascript',NULL,NULL),(40,'cs_CZ',NULL,NULL,NULL),(40,'de_DE','Kontaktseite - oben',NULL,NULL),(40,'en_US','Contact page - at the top',NULL,NULL),(40,'es_ES','Página de contacto - en la parte superior',NULL,NULL),(40,'fr_FR','Page contact - en haut',NULL,NULL),(40,'it_IT',NULL,NULL,NULL),(40,'ru_RU','Страница контактов - вверху',NULL,NULL),(41,'cs_CZ',NULL,NULL,NULL),(41,'de_DE','Kontaktseite - oben an dem Formular',NULL,NULL),(41,'en_US','Contact page - at the top of the form',NULL,NULL),(41,'es_ES','Página de contacto - en la parte superior del formulario',NULL,NULL),(41,'fr_FR','Page contact - en haut du formulaire',NULL,NULL),(41,'it_IT',NULL,NULL,NULL),(41,'ru_RU','Страница контактов - вверху формы',NULL,NULL),(42,'cs_CZ',NULL,NULL,NULL),(42,'de_DE','Kontaktseite - unten an dem Formular',NULL,NULL),(42,'en_US','Contact page - at the bottom of the form',NULL,NULL),(42,'es_ES','Página de contacto - en la parte inferior del formulario',NULL,NULL),(42,'fr_FR','Page contact - en bas du formulaire',NULL,NULL),(42,'it_IT',NULL,NULL,NULL),(42,'ru_RU','Страница контактов - внизу формы',NULL,NULL),(43,'cs_CZ',NULL,NULL,NULL),(43,'de_DE','Kontaktseite - unten',NULL,NULL),(43,'en_US','Contact page - at the bottom',NULL,NULL),(43,'es_ES','Página de contacto - en la parte inferior',NULL,NULL),(43,'fr_FR','Page contact - en bas',NULL,NULL),(43,'it_IT',NULL,NULL,NULL),(43,'ru_RU','Страница контактов - внизу',NULL,NULL),(44,'cs_CZ',NULL,NULL,NULL),(44,'de_DE','Kontaktseite - CSS-Stylesheet',NULL,NULL),(44,'en_US','Contact page - CSS stylesheet',NULL,NULL),(44,'es_ES','Página de contacto - hoja de estilos CSS',NULL,NULL),(44,'fr_FR','Page contact - feuille de style CSS',NULL,NULL),(44,'it_IT',NULL,NULL,NULL),(44,'ru_RU','Страница контактов - CSS стили',NULL,NULL),(45,'cs_CZ',NULL,NULL,NULL),(45,'de_DE','Kontaktseite - Nach Integration von JavaScript',NULL,NULL),(45,'en_US','Contact page - after javascript include',NULL,NULL),(45,'es_ES','Página de contacto - después del include de javascript',NULL,NULL),(45,'fr_FR','Page contact - après l\'inclusion du JavaScript',NULL,NULL),(45,'it_IT',NULL,NULL,NULL),(45,'ru_RU','Страница контактов - после включения javascript',NULL,NULL),(46,'cs_CZ',NULL,NULL,NULL),(46,'de_DE','Kontaktseite - nach der Initialisierung von Javascript',NULL,NULL),(46,'en_US','Contact page - after javascript initialisation',NULL,NULL),(46,'es_ES','Página de contacto - después de la inicialización de javascript',NULL,NULL),(46,'fr_FR','Page contact - après l\'initialisation du JavaScript',NULL,NULL),(46,'it_IT',NULL,NULL,NULL),(46,'ru_RU','Страница контактов - после инициализации javascript',NULL,NULL),(47,'cs_CZ',NULL,NULL,NULL),(47,'de_DE','Erteilten Auftrag - Hauptbereich',NULL,NULL),(47,'en_US','Placed order - main area',NULL,NULL),(47,'es_ES','Orden registrada - área principal',NULL,NULL),(47,'fr_FR','Commande terminée - zone principale',NULL,NULL),(47,'it_IT',NULL,NULL,NULL),(47,'ru_RU','Размещенный заказ - основная зона',NULL,NULL),(48,'cs_CZ',NULL,NULL,NULL),(48,'de_DE','Erteilten Auftrag - CSS-Stylesheet',NULL,NULL),(48,'en_US','Placed order - CSS stylesheet',NULL,NULL),(48,'es_ES','Orden registrada - Hoja de estilo CSS',NULL,NULL),(48,'fr_FR','Commande terminée - feuille de style CSS',NULL,NULL),(48,'it_IT',NULL,NULL,NULL),(48,'ru_RU','Размещенный заказ - CSS стили',NULL,NULL),(49,'cs_CZ',NULL,NULL,NULL),(49,'de_DE','Erteilten Auftrag - nach Integration von JavaScript',NULL,NULL),(49,'en_US','Placed order - after javascript include',NULL,NULL),(49,'es_ES','Orden registrada - después del javascript include',NULL,NULL),(49,'fr_FR','Commande terminée - après l\'inclusion du JavaScript',NULL,NULL),(49,'it_IT',NULL,NULL,NULL),(49,'ru_RU','Размещенный заказ - после включения javascript',NULL,NULL),(50,'cs_CZ',NULL,NULL,NULL),(50,'de_DE','Erteilten Auftrag - nach der Initialisierung von Javascript',NULL,NULL),(50,'en_US','Placed order - after javascript initialisation',NULL,NULL),(50,'es_ES','Orden registrada - después de la inicialización de Javascript',NULL,NULL),(50,'fr_FR','Commande terminée - après l\'initialisation du JavaScript',NULL,NULL),(50,'it_IT',NULL,NULL,NULL),(50,'ru_RU','Размещенный заказ - после инициализации javascript',NULL,NULL),(51,'cs_CZ',NULL,NULL,NULL),(51,'de_DE','Suche-Seite - CSS-Stylesheet',NULL,NULL),(51,'en_US','Search page - CSS stylesheet',NULL,NULL),(51,'es_ES','Página de búsqueda - Hoja de Estilos en Cascada',NULL,NULL),(51,'fr_FR','Page de recherche - feuille de style CSS',NULL,NULL),(51,'it_IT',NULL,NULL,NULL),(51,'ru_RU','Страница поиска - CSS стили',NULL,NULL),(52,'cs_CZ',NULL,NULL,NULL),(52,'de_DE','Suche-Seite - Nach Integration von JavaScript',NULL,NULL),(52,'en_US','Search page - after javascript include',NULL,NULL),(52,'es_ES','Página de búsqueda - después de incluir JavaScript',NULL,NULL),(52,'fr_FR','Page de recherche - après l\'inclusion du JavaScript',NULL,NULL),(52,'it_IT',NULL,NULL,NULL),(52,'ru_RU','Страница поиска - после включения javascript',NULL,NULL),(53,'cs_CZ',NULL,NULL,NULL),(53,'de_DE','Suche-Seite - nach der Initialisierung von Javascript',NULL,NULL),(53,'en_US','Search page - after javascript initialisation',NULL,NULL),(53,'es_ES','Página de búsqueda - después de inicializar JavaScript',NULL,NULL),(53,'fr_FR','Page de recherche - après l\'initialisation du JavaScript',NULL,NULL),(53,'it_IT',NULL,NULL,NULL),(53,'ru_RU','Страница поиска - после инициализации javascript',NULL,NULL),(54,'cs_CZ',NULL,NULL,NULL),(54,'de_DE','Konto-Erstellung - oben',NULL,NULL),(54,'en_US','Register - at the top',NULL,NULL),(54,'es_ES','Registro - en la parte superior',NULL,NULL),(54,'fr_FR','Création de compte - en haut',NULL,NULL),(54,'it_IT',NULL,NULL,NULL),(54,'ru_RU','Регистрация - вверху',NULL,NULL),(55,'cs_CZ',NULL,NULL,NULL),(55,'de_DE','Konto-Erstellung - oben im Formular',NULL,NULL),(55,'en_US','Register - at the top of the form',NULL,NULL),(55,'es_ES','Registro - en la parte superior del formulario',NULL,NULL),(55,'fr_FR','Création de compte - en haut du formulaire',NULL,NULL),(55,'it_IT',NULL,NULL,NULL),(55,'ru_RU','Регистрация - вверху формы',NULL,NULL),(56,'cs_CZ',NULL,NULL,NULL),(56,'de_DE','Konto-Erstellung - unten an dem Formular',NULL,NULL),(56,'en_US','Register - at the bottom of the form',NULL,NULL),(56,'es_ES','Registro - en la parte inferior del formulario',NULL,NULL),(56,'fr_FR','Création de compte - en bas du formulaire',NULL,NULL),(56,'it_IT',NULL,NULL,NULL),(56,'ru_RU','Регистрация - внизу формы',NULL,NULL),(57,'cs_CZ',NULL,NULL,NULL),(57,'de_DE','Konto-Erstellung - unten',NULL,NULL),(57,'en_US','Register - at the bottom',NULL,NULL),(57,'es_ES','Registro - en la parte inferior',NULL,NULL),(57,'fr_FR','Création de compte - en bas',NULL,NULL),(57,'it_IT',NULL,NULL,NULL),(57,'ru_RU','Регистрация - внизу',NULL,NULL),(58,'cs_CZ',NULL,NULL,NULL),(58,'de_DE','Konto-Erstellung - CSS-Stylesheet',NULL,NULL),(58,'en_US','Register - CSS stylesheet',NULL,NULL),(58,'es_ES','Registro - hoja de estilos CSS',NULL,NULL),(58,'fr_FR','Création de compte - feuille de style CSS',NULL,NULL),(58,'it_IT',NULL,NULL,NULL),(58,'ru_RU','Регистрация - CSS стили',NULL,NULL),(59,'cs_CZ',NULL,NULL,NULL),(59,'de_DE','Konto-Erstellung - Nach Integration von JavaScript',NULL,NULL),(59,'en_US','Register - after javascript include',NULL,NULL),(59,'es_ES','Registro - después de incluir JavaScript',NULL,NULL),(59,'fr_FR','Création de compte - après l\'inclusion du JavaScript',NULL,NULL),(59,'it_IT',NULL,NULL,NULL),(59,'ru_RU','Регистрация - после включения javascript',NULL,NULL),(60,'cs_CZ',NULL,NULL,NULL),(60,'de_DE','Konto-Erstellung - nach der Initialisierung von Javascript',NULL,NULL),(60,'en_US','Register - after javascript initialisation',NULL,NULL),(60,'es_ES','Registro - después de la inicialización de JavaScript',NULL,NULL),(60,'fr_FR','Création de compte - après l\'initialisation du JavaScript',NULL,NULL),(60,'it_IT',NULL,NULL,NULL),(60,'ru_RU','Регистрация - после инициализации javascript',NULL,NULL),(61,'cs_CZ',NULL,NULL,NULL),(61,'de_DE','Passwort verloren - oben',NULL,NULL),(61,'en_US','Lost password - at the top',NULL,NULL),(61,'es_ES','Contraseña perdida - en la parte superior',NULL,NULL),(61,'fr_FR','Mot de passe perdu - en haut',NULL,NULL),(61,'it_IT',NULL,NULL,NULL),(61,'ru_RU','Восстановление пароля - вверху',NULL,NULL),(62,'cs_CZ',NULL,NULL,NULL),(62,'de_DE','Passwort verloren - oben im Formular',NULL,NULL),(62,'en_US','Lost password - at the top of the form',NULL,NULL),(62,'es_ES','Contraseña perdida - en la parte superior del formulario',NULL,NULL),(62,'fr_FR','Mot de passe perdu - en haut du formulaire',NULL,NULL),(62,'it_IT',NULL,NULL,NULL),(62,'ru_RU','Восстановление пароля - вверху формы',NULL,NULL),(63,'cs_CZ',NULL,NULL,NULL),(63,'de_DE','Passwort verloren - unten an dem Formular',NULL,NULL),(63,'en_US','Lost password - at the bottom of the form',NULL,NULL),(63,'es_ES','Contraseña perdida - en la parte inferior del formulario',NULL,NULL),(63,'fr_FR','Mot de passe perdu - en bas du formulaire',NULL,NULL),(63,'it_IT',NULL,NULL,NULL),(63,'ru_RU','Восстановление пароля - внизу формы',NULL,NULL),(64,'cs_CZ',NULL,NULL,NULL),(64,'de_DE','Passwort verloren - unten',NULL,NULL),(64,'en_US','Lost password - at the bottom',NULL,NULL),(64,'es_ES','Contraseña perdida - en la parte inferior',NULL,NULL),(64,'fr_FR','Mot de passe perdu - en bas',NULL,NULL),(64,'it_IT',NULL,NULL,NULL),(64,'ru_RU','Восстановление пароля - внизу',NULL,NULL),(65,'cs_CZ',NULL,NULL,NULL),(65,'de_DE','Passwort verloren - CSS-Stylesheet',NULL,NULL),(65,'en_US','Lost password - CSS stylesheet',NULL,NULL),(65,'es_ES','Contraseña perdida - hoja de estilos CSS',NULL,NULL),(65,'fr_FR','Mot de passe perdu - feuille de style CSS',NULL,NULL),(65,'it_IT',NULL,NULL,NULL),(65,'ru_RU','Восстановление пароля - CSS стили',NULL,NULL),(66,'cs_CZ',NULL,NULL,NULL),(66,'de_DE','Passwort verloren - Nach Integration von JavaScript',NULL,NULL),(66,'en_US','Lost password - after javascript include',NULL,NULL),(66,'es_ES','Contraseña perdida - después de incluir javascript',NULL,NULL),(66,'fr_FR','Mot de passe perdu - après l\'inclusion du JavaScript',NULL,NULL),(66,'it_IT',NULL,NULL,NULL),(66,'ru_RU','Восстановление пароля - после включения javascript',NULL,NULL),(67,'cs_CZ',NULL,NULL,NULL),(67,'de_DE','Passwort verloren - Initialisierung von Javascript',NULL,NULL),(67,'en_US','Lost password - javascript initialization',NULL,NULL),(67,'es_ES','Contraseña perdida - inicialización de JavaScript',NULL,NULL),(67,'fr_FR','Mot de passe perdu - initialisation du JavaScript',NULL,NULL),(67,'it_IT',NULL,NULL,NULL),(67,'ru_RU','Восстановление пароля - после инициализации javascript',NULL,NULL),(68,'cs_CZ',NULL,NULL,NULL),(68,'de_DE','Sprachwahl Seite - oben',NULL,NULL),(68,'en_US','language selection page - at the top',NULL,NULL),(68,'es_ES','página de selección de idioma - en la parte superior',NULL,NULL),(68,'fr_FR','Page du choix du langage - en haut',NULL,NULL),(68,'it_IT','pagina selezione lingua - nella parte superiore',NULL,NULL),(68,'ru_RU','Страница выбора языка - вверху',NULL,NULL),(69,'cs_CZ',NULL,NULL,NULL),(69,'de_DE','Sprachwahl Seite - unten',NULL,NULL),(69,'en_US','language selection page - at the bottom',NULL,NULL),(69,'es_ES','página de selección de idioma - en la parte inferior',NULL,NULL),(69,'fr_FR','Page du choix du langage - en bas',NULL,NULL),(69,'it_IT',NULL,NULL,NULL),(69,'ru_RU','Страница выбора языка - внизу',NULL,NULL),(70,'cs_CZ',NULL,NULL,NULL),(70,'de_DE','Sprachwahl Seite - CSS-Stylesheet',NULL,NULL),(70,'en_US','language selection page - CSS stylesheet',NULL,NULL),(70,'es_ES','página de selección de idioma - hoja de estilos CSS',NULL,NULL),(70,'fr_FR','Page du choix du langage - feuille de style CSS',NULL,NULL),(70,'it_IT',NULL,NULL,NULL),(70,'ru_RU','Страница выбора языка - CSS стили',NULL,NULL),(71,'cs_CZ',NULL,NULL,NULL),(71,'de_DE','Sprachwahl Seite - Nach Integration von JavaScript',NULL,NULL),(71,'en_US','language selection page - after javascript include',NULL,NULL),(71,'es_ES','página de selección de idioma - después de incluir JavaScript',NULL,NULL),(71,'fr_FR','Page du choix du langage - après l\'inclusion du JavaScript',NULL,NULL),(71,'it_IT',NULL,NULL,NULL),(71,'ru_RU','Страница выбора языка - после включения javascript',NULL,NULL),(72,'cs_CZ',NULL,NULL,NULL),(72,'de_DE','Sprachwahl Seite - nach der Initialisierung von Javascript',NULL,NULL),(72,'en_US','language selection page - after javascript initialisation',NULL,NULL),(72,'es_ES','página de selección de idioma - después de la inicialización de JavaScript',NULL,NULL),(72,'fr_FR','Page du choix du langage - après l\'initialisation du JavaScript',NULL,NULL),(72,'it_IT',NULL,NULL,NULL),(72,'ru_RU','Страница выбора языка - после инициализации javascript',NULL,NULL),(73,'cs_CZ',NULL,NULL,NULL),(73,'de_DE','Kontaktseite - wenn erfolgreich',NULL,NULL),(73,'en_US','Contact page - if successful response',NULL,NULL),(73,'es_ES','Página de contacto - si la respuesta es exitosa',NULL,NULL),(73,'fr_FR','Page contact - en cas de succès',NULL,NULL),(73,'it_IT',NULL,NULL,NULL),(73,'ru_RU','Страница контактов - при успешном ответе',NULL,NULL),(74,'cs_CZ',NULL,NULL,NULL),(74,'de_DE','Newletter-Seite - oben',NULL,NULL),(74,'en_US','Newsletter page - at the top',NULL,NULL),(74,'es_ES','Página del boletín de noticias - en la parte superior',NULL,NULL),(74,'fr_FR','Page newsletter - en haut',NULL,NULL),(74,'it_IT',NULL,NULL,NULL),(74,'ru_RU','Страница рассылки - вверху',NULL,NULL),(75,'cs_CZ',NULL,NULL,NULL),(75,'de_DE','Newletter-Seite - unten',NULL,NULL),(75,'en_US','Newsletter page - at the bottom',NULL,NULL),(75,'es_ES','Página del boletín de noticias - en la parte inferior',NULL,NULL),(75,'fr_FR','Page newsletter - en bas',NULL,NULL),(75,'it_IT',NULL,NULL,NULL),(75,'ru_RU','Страница рассылки - внизу',NULL,NULL),(76,'cs_CZ',NULL,NULL,NULL),(76,'de_DE','Newletter-Seite - CSS-Stylesheet',NULL,NULL),(76,'en_US','Newsletter page - CSS stylesheet',NULL,NULL),(76,'es_ES','Página del boletín de noticias - hoja de estilos CSS',NULL,NULL),(76,'fr_FR','Page newsletter - feuille de style CSS',NULL,NULL),(76,'it_IT',NULL,NULL,NULL),(76,'ru_RU','Страница рассылки - CSS стили',NULL,NULL),(77,'cs_CZ',NULL,NULL,NULL),(77,'de_DE','Newletter-Seite - Nach Integration von JavaScript',NULL,NULL),(77,'en_US','Newsletter page - after javascript include',NULL,NULL),(77,'es_ES','Página del boletín de noticias - después de incluir JavaScript',NULL,NULL),(77,'fr_FR','Page newsletter - après l\'inclusion du JavaScript',NULL,NULL),(77,'it_IT',NULL,NULL,NULL),(77,'ru_RU','Страница рассылки - после включения javascript',NULL,NULL),(78,'cs_CZ',NULL,NULL,NULL),(78,'de_DE','Newletter-Seite - nach der Initialisierung von Javascript',NULL,NULL),(78,'en_US','Newsletter page - after javascript initialisation',NULL,NULL),(78,'es_ES','Página del boletín de noticias - después de la inicialización de JavaScript',NULL,NULL),(78,'fr_FR','Page newsletter - après l\'initialisation du JavaScript',NULL,NULL),(78,'it_IT',NULL,NULL,NULL),(78,'ru_RU','Страница рассылки - после инициализации javascript',NULL,NULL),(79,'cs_CZ',NULL,NULL,NULL),(79,'de_DE','Bezahlungs-Fehlschlagen - CSS-Stylesheet',NULL,NULL),(79,'en_US','Payment failed - CSS stylesheet',NULL,NULL),(79,'es_ES','Pago erróneo - Hoja de Estilos CSS',NULL,NULL),(79,'fr_FR','Échec du paiement - feuille de style CSS',NULL,NULL),(79,'it_IT',NULL,NULL,NULL),(79,'ru_RU','Платеж отклонен - CSS стили',NULL,NULL),(80,'cs_CZ',NULL,NULL,NULL),(80,'de_DE','Bezahlungs-Fehlschlagen - Nach Integration von JavaScript',NULL,NULL),(80,'en_US','Payment failed - after javascript include',NULL,NULL),(80,'es_ES','Pago erróneo - después de incluir JavaScript',NULL,NULL),(80,'fr_FR','Echec du paiement - après l\'inclusion du JavaScript',NULL,NULL),(80,'it_IT',NULL,NULL,NULL),(80,'ru_RU','Платеж отклонен - после включения javascript',NULL,NULL),(81,'cs_CZ',NULL,NULL,NULL),(81,'de_DE','Bezahlungs-Fehlschlagen - Initialisierung von Javascript',NULL,NULL),(81,'en_US','Payment failed - javascript initialization',NULL,NULL),(81,'es_ES','Pago erróneo - inicialización de JavaScript',NULL,NULL),(81,'fr_FR','Echec du paiement - initialisation du JavaScript',NULL,NULL),(81,'it_IT',NULL,NULL,NULL),(81,'ru_RU','Платеж отклонен - после инициализации javascript',NULL,NULL),(82,'cs_CZ',NULL,NULL,NULL),(82,'de_DE','Inhaltseite - oben',NULL,NULL),(82,'en_US','Content page - at the top',NULL,NULL),(82,'es_ES','Página de contacto - en la parte superior',NULL,NULL),(82,'fr_FR','Page de contenu - en haut',NULL,NULL),(82,'it_IT',NULL,NULL,NULL),(82,'ru_RU','Страница контента - вверху',NULL,NULL),(83,'cs_CZ',NULL,NULL,NULL),(83,'de_DE','Inhaltseite - oben an dem Hauptbereich',NULL,NULL),(83,'en_US','Content page - at the top of the main area',NULL,NULL),(83,'es_ES','Página de contenido - en la parte superior de la zona principal',NULL,NULL),(83,'fr_FR','Page de contenu - en haut de la zone principal',NULL,NULL),(83,'it_IT',NULL,NULL,NULL),(83,'ru_RU','Страница контента - вверху основной зоны',NULL,NULL),(84,'cs_CZ',NULL,NULL,NULL),(84,'de_DE','Inhaltseite - unten an dem Hauptbereich',NULL,NULL),(84,'en_US','Content page - at the bottom of the main area',NULL,NULL),(84,'es_ES','Página de contenido - en la parte inferior de la zona principal',NULL,NULL),(84,'fr_FR','Page de contenu - en bas de la zone principal',NULL,NULL),(84,'it_IT',NULL,NULL,NULL),(84,'ru_RU','Страница контента - внизу основной зоны',NULL,NULL),(85,'cs_CZ',NULL,NULL,NULL),(85,'de_DE','Inhaltseite - unten',NULL,NULL),(85,'en_US','Content page - at the bottom',NULL,NULL),(85,'es_ES','Página de contacto - en la parte inferior',NULL,NULL),(85,'fr_FR','Page de contenu - en bas',NULL,NULL),(85,'it_IT',NULL,NULL,NULL),(85,'ru_RU','Страница контента - внизу',NULL,NULL),(86,'cs_CZ',NULL,NULL,NULL),(86,'de_DE','Inhaltseite - CSS-Stylesheet',NULL,NULL),(86,'en_US','Content page - CSS stylesheet',NULL,NULL),(86,'es_ES','Página de contacto - hoja de estilos CSS',NULL,NULL),(86,'fr_FR','Page de contenu - feuille de style CSS',NULL,NULL),(86,'it_IT',NULL,NULL,NULL),(86,'ru_RU','Страница контента - CSS стили',NULL,NULL),(87,'cs_CZ',NULL,NULL,NULL),(87,'de_DE','Inhaltseite - Nach Integration von JavaScript',NULL,NULL),(87,'en_US','Content page - after javascript include',NULL,NULL),(87,'es_ES','Página de contacto - después del include de javascript',NULL,NULL),(87,'fr_FR','Page de contenu - après l\'inclusion du JavaScript',NULL,NULL),(87,'it_IT',NULL,NULL,NULL),(87,'ru_RU','Страница контента - после включения javascript',NULL,NULL),(88,'cs_CZ',NULL,NULL,NULL),(88,'de_DE','Inhaltseite - nach der Initialisierung von Javascript',NULL,NULL),(88,'en_US','Content page - after javascript initialisation',NULL,NULL),(88,'es_ES','Página de contacto - después de la inicialización de javascript',NULL,NULL),(88,'fr_FR','Page de contenu - après l\'initialisation du JavaScript',NULL,NULL),(88,'it_IT',NULL,NULL,NULL),(88,'ru_RU','Страница контента - после инициализации javascript',NULL,NULL),(89,'cs_CZ',NULL,NULL,NULL),(89,'de_DE','HTML Struktur - nach der Eröffnung des Head-Tag',NULL,NULL),(89,'en_US','HTML layout - after the opening of the head tag',NULL,NULL),(89,'es_ES','Diseño HTML - después de la etiqueta head de apertura',NULL,NULL),(89,'fr_FR','Structure HTML - après l\'ouverture de la balise head',NULL,NULL),(89,'it_IT',NULL,NULL,NULL),(89,'ru_RU','HTML каркас - после открытия тега head',NULL,NULL),(90,'cs_CZ',NULL,NULL,NULL),(90,'de_DE','HTML Struktur - CSS-Stylesheet',NULL,NULL),(90,'en_US','HTML layout - CSS stylesheet',NULL,NULL),(90,'es_ES','Diseño HTML - hojas de estilo CSS',NULL,NULL),(90,'fr_FR','Structure HTML - feuille de style CSS',NULL,NULL),(90,'it_IT',NULL,NULL,NULL),(90,'ru_RU','HTML каркас - CSS стили',NULL,NULL),(91,'cs_CZ',NULL,NULL,NULL),(91,'de_DE','HTML Struktur - vor dem Ende des Head-Tag',NULL,NULL),(91,'en_US','HTML layout - before the end of the head tag',NULL,NULL),(91,'es_ES','Diseño HTML - antes de la etiqueta head de cierre',NULL,NULL),(91,'fr_FR','Structure HTML - avant la fin de la balise head',NULL,NULL),(91,'it_IT',NULL,NULL,NULL),(91,'ru_RU','HTML каркас - перед закрытием тега head',NULL,NULL),(92,'cs_CZ',NULL,NULL,NULL),(92,'de_DE','HTML Struktur - nach der Eröffnung des Body-Tag',NULL,NULL),(92,'en_US','HTML layout - after the opening of the body tag',NULL,NULL),(92,'es_ES','Diseño HTML - después de la etiqueta body de apertura',NULL,NULL),(92,'fr_FR','Structure HTML - après l\'ouverture de la balise body',NULL,NULL),(92,'it_IT',NULL,NULL,NULL),(92,'ru_RU','HTML каркас - после открытия тега body ',NULL,NULL),(93,'cs_CZ',NULL,NULL,NULL),(93,'de_DE','HTML Struktur - oben an dem Header',NULL,NULL),(93,'en_US','HTML layout - at the top of the header',NULL,NULL),(93,'es_ES','Diseño HTML - en la parte superior de la cabecera',NULL,NULL),(93,'fr_FR','Structure HTML - en haut du header',NULL,NULL),(93,'it_IT',NULL,NULL,NULL),(93,'ru_RU','HTML каркас - вверху шапки',NULL,NULL),(94,'cs_CZ',NULL,NULL,NULL),(94,'de_DE','HTML Struktur - Sekundärenavigation',NULL,NULL),(94,'en_US','HTML layout - secondary navigation',NULL,NULL),(94,'es_ES','Diseño HTML - navegación secundaria',NULL,NULL),(94,'fr_FR','Structure HTML - navigation secondaire',NULL,NULL),(94,'it_IT',NULL,NULL,NULL),(94,'ru_RU','HTML каркас - вторичная навигация',NULL,NULL),(95,'cs_CZ',NULL,NULL,NULL),(95,'de_DE','HTML Struktur - Hauptnavigation',NULL,NULL),(95,'en_US','HTML layout - primary navigation',NULL,NULL),(95,'es_ES','Diseño HTML - navegación principal',NULL,NULL),(95,'fr_FR','Structure HTML - navigation principale',NULL,NULL),(95,'it_IT',NULL,NULL,NULL),(95,'ru_RU','HTML каркас - первичная навигация',NULL,NULL),(96,'cs_CZ',NULL,NULL,NULL),(96,'de_DE','HTML Struktur - unten an dem Header',NULL,NULL),(96,'en_US','HTML layout - at the bottom of the header',NULL,NULL),(96,'es_ES','Diseño HTML - en la parte inferior de la cabecera',NULL,NULL),(96,'fr_FR','Structure HTML - en bas du header',NULL,NULL),(96,'it_IT',NULL,NULL,NULL),(96,'ru_RU','HTML каркас - внизу шапки',NULL,NULL),(97,'cs_CZ',NULL,NULL,NULL),(97,'de_DE','HTML Struktur - vor dem Hauptinhaltsbereich',NULL,NULL),(97,'en_US','HTML layout - before the main content area',NULL,NULL),(97,'es_ES','Diseño HTML - antes el área de contenido principal',NULL,NULL),(97,'fr_FR','Structure HTML - au dessus de la zone de contenu principale',NULL,NULL),(97,'it_IT',NULL,NULL,NULL),(97,'ru_RU','HTML каркас - перед зоной основного контента',NULL,NULL),(98,'cs_CZ',NULL,NULL,NULL),(98,'de_DE','HTML Struktur - nach dem Hauptinhaltsbereich',NULL,NULL),(98,'en_US','HTML layout - after the main content area',NULL,NULL),(98,'es_ES','Diseño HTML - después del área de contenido principal',NULL,NULL),(98,'fr_FR','Structure HTML - en dessous de la zone de contenu principale',NULL,NULL),(98,'it_IT',NULL,NULL,NULL),(98,'ru_RU','HTML каркас - после зоны основного контента',NULL,NULL),(99,'cs_CZ',NULL,NULL,NULL),(99,'de_DE','HTML Struktur - oben an dem Footer',NULL,NULL),(99,'en_US','HTML layout - at the top of the footer',NULL,NULL),(99,'es_ES','Diseño HTML - en la parte superior del pie de página',NULL,NULL),(99,'fr_FR','Structure HTML - en haut du pied de page',NULL,NULL),(99,'it_IT',NULL,NULL,NULL),(99,'ru_RU','HTML каркас - вверху подвала',NULL,NULL),(100,'cs_CZ',NULL,NULL,NULL),(100,'de_DE','HTML Struktur - Footer Body',NULL,NULL),(100,'en_US','HTML layout - footer body',NULL,NULL),(100,'es_ES','Diseño HTML - cuerpo del pie de página',NULL,NULL),(100,'fr_FR','Structure HTML - corps du pied de page',NULL,NULL),(100,'it_IT',NULL,NULL,NULL),(100,'ru_RU','HTML каркас - тело подвала',NULL,NULL),(101,'cs_CZ',NULL,NULL,NULL),(101,'de_DE','HTML Struktur - unten an dem Footer',NULL,NULL),(101,'en_US','HTML layout - bottom of the footer',NULL,NULL),(101,'es_ES','Diseño HTML - parte inferior del pie de página',NULL,NULL),(101,'fr_FR','Structure HTML - en bas du pied de page',NULL,NULL),(101,'it_IT',NULL,NULL,NULL),(101,'ru_RU','HTML каркас - внизу подвала',NULL,NULL),(102,'cs_CZ',NULL,NULL,NULL),(102,'de_DE','HTML Struktur - Nach Integration von JavaScript',NULL,NULL),(102,'en_US','HTML layout - after javascript include',NULL,NULL),(102,'es_ES','Diseño HTML - después de incluir javascript',NULL,NULL),(102,'fr_FR','Structure HTML - après l\'inclusion du JavaScript',NULL,NULL),(102,'it_IT',NULL,NULL,NULL),(102,'ru_RU','HTML каркас - после включения javascript',NULL,NULL),(103,'cs_CZ',NULL,NULL,NULL),(103,'de_DE','HTML Struktur - Initialisierung von Javascript',NULL,NULL),(103,'en_US','HTML layout - javascript initialization',NULL,NULL),(103,'es_ES','Diseño HTML - inicialización de JavaScript',NULL,NULL),(103,'fr_FR','Structure HTML - initialisation du JavaScript',NULL,NULL),(103,'it_IT',NULL,NULL,NULL),(103,'ru_RU','HTML каркас - после инициализации javascript',NULL,NULL),(104,'cs_CZ',NULL,NULL,NULL),(104,'de_DE','HTML Struktur - vor dem Ende des Body-Tag',NULL,NULL),(104,'en_US','HTML layout - before the end body tag',NULL,NULL),(104,'es_ES','Diseño HTML - antes de la etiqueta body de cierre',NULL,NULL),(104,'fr_FR','Structure HTML - avant la fin de la balise body',NULL,NULL),(104,'it_IT',NULL,NULL,NULL),(104,'ru_RU','HTML каркас - перед закрытием тега body',NULL,NULL),(105,'cs_CZ',NULL,NULL,NULL),(105,'de_DE','Seite nicht gefunden - Inhalts-Bereich',NULL,NULL),(105,'en_US','Page 404 - content area',NULL,NULL),(105,'es_ES','Página 404 - área de contenido',NULL,NULL),(105,'fr_FR','Page introuvable - zone de contenu',NULL,NULL),(105,'it_IT',NULL,NULL,NULL),(105,'ru_RU','Страница 404 - зона контента',NULL,NULL),(106,'cs_CZ',NULL,NULL,NULL),(106,'de_DE','Seite nicht gefunden - CSS-Stylesheet',NULL,NULL),(106,'en_US','Page 404 - CSS stylesheet',NULL,NULL),(106,'es_ES','Página 404 - CSS Hoja de estilos',NULL,NULL),(106,'fr_FR','Page introuvable - feuille de style CSS',NULL,NULL),(106,'it_IT',NULL,NULL,NULL),(106,'ru_RU','Страница 404 - CSS стили',NULL,NULL),(107,'cs_CZ',NULL,NULL,NULL),(107,'de_DE','Seite nicht gefunden - Nach Integration von JavaScript',NULL,NULL),(107,'en_US','Page 404 - after javascript include',NULL,NULL),(107,'es_ES','Página 404 - después de incluir JavaScript',NULL,NULL),(107,'fr_FR','Page introuvable - après l\'inclusion du JavaScript',NULL,NULL),(107,'it_IT',NULL,NULL,NULL),(107,'ru_RU','Страница 404 - после включения javascript',NULL,NULL),(108,'cs_CZ',NULL,NULL,NULL),(108,'de_DE','Seite nicht gefunden - nach der Initialisierung von Javascript',NULL,NULL),(108,'en_US','Page 404 - after javascript initialisation',NULL,NULL),(108,'es_ES','Página 404 - después de inicializar JavaScript',NULL,NULL),(108,'fr_FR','Page introuvable - après l\'initialisation du JavaScript',NULL,NULL),(108,'it_IT',NULL,NULL,NULL),(108,'ru_RU','Страница 404 - после инициализации javascript',NULL,NULL),(109,'cs_CZ',NULL,NULL,NULL),(109,'de_DE','Lieferwahl - oben',NULL,NULL),(109,'en_US','Delivery choice - at the top',NULL,NULL),(109,'es_ES','Opción de entrega - en la cabecera',NULL,NULL),(109,'fr_FR','Choix du transporteur - en haut',NULL,NULL),(109,'it_IT',NULL,NULL,NULL),(109,'ru_RU','Выбор доставки - вверху',NULL,NULL),(110,'cs_CZ',NULL,NULL,NULL),(110,'de_DE','Lieferwahl - oben an dem Formular',NULL,NULL),(110,'en_US','Delivery choice - at the top of the form',NULL,NULL),(110,'es_ES','Opción de entrega - en la cabecera del formulario',NULL,NULL),(110,'fr_FR','Choix du transporteur - en haut du formulaire',NULL,NULL),(110,'it_IT',NULL,NULL,NULL),(110,'ru_RU','Выбор доставки - вверху формы',NULL,NULL),(111,'cs_CZ',NULL,NULL,NULL),(111,'de_DE','Lieferwahl - unten an dem Formular',NULL,NULL),(111,'en_US','Delivery choice - at the bottom of the form',NULL,NULL),(111,'es_ES','Opción de entrega - en el pie del formulario',NULL,NULL),(111,'fr_FR','Choix du transporteur - en bas du formulaire',NULL,NULL),(111,'it_IT',NULL,NULL,NULL),(111,'ru_RU','Выбор доставки - внизу формы',NULL,NULL),(112,'cs_CZ',NULL,NULL,NULL),(112,'de_DE','Lieferwahl - unten',NULL,NULL),(112,'en_US','Delivery choice - at the bottom',NULL,NULL),(112,'es_ES','Elección de entrega - en el pie',NULL,NULL),(112,'fr_FR','Choix du transporteur - en bas',NULL,NULL),(112,'it_IT',NULL,NULL,NULL),(112,'ru_RU','Выбор доставки - внизу',NULL,NULL),(113,'cs_CZ',NULL,NULL,NULL),(113,'de_DE','Lieferwahl - nach der Initialisierung von Javascript',NULL,NULL),(113,'en_US','Delivery choice - after javascript initialisation',NULL,NULL),(113,'es_ES','Opción de entrega - despues de inicializar el javascript',NULL,NULL),(113,'fr_FR','Choix du transporteur - après l\'initialisation du JavaScript',NULL,NULL),(113,'it_IT',NULL,NULL,NULL),(113,'ru_RU','Выбор доставки - после инициализации javascript',NULL,NULL),(114,'cs_CZ',NULL,NULL,NULL),(114,'de_DE','Lieferwahl - CSS-Stylesheet',NULL,NULL),(114,'en_US','Delivery choice - CSS stylesheet',NULL,NULL),(114,'es_ES','Opción de entrega - CSS',NULL,NULL),(114,'fr_FR','Choix du transporteur - feuille de style CSS',NULL,NULL),(114,'it_IT',NULL,NULL,NULL),(114,'ru_RU','Выбор доставки - CSS стили',NULL,NULL),(115,'cs_CZ',NULL,NULL,NULL),(115,'de_DE','Lieferwahl - Nach Integration von JavaScript',NULL,NULL),(115,'en_US','Delivery choice - after javascript include',NULL,NULL),(115,'es_ES','Opción de entrega - después de incluir el javascript',NULL,NULL),(115,'fr_FR','Choix du transporteur - après l\'inclusion du JavaScript',NULL,NULL),(115,'it_IT',NULL,NULL,NULL),(115,'ru_RU','Выбор доставки- после включения javascript',NULL,NULL),(116,'cs_CZ',NULL,NULL,NULL),(116,'de_DE','Adresse Erstellung - oben',NULL,NULL),(116,'en_US','Address creation - at the top',NULL,NULL),(116,'es_ES','Creación de dirección - en la parte superior',NULL,NULL),(116,'fr_FR','Création d\'adresse - en haut',NULL,NULL),(116,'it_IT',NULL,NULL,NULL),(116,'ru_RU','Создание адреса - вверху',NULL,NULL),(117,'cs_CZ',NULL,NULL,NULL),(117,'de_DE','Adresse Erstellung - oben im Formular',NULL,NULL),(117,'en_US','Address creation - at the top of the form',NULL,NULL),(117,'es_ES','Creación de dirección - en la parte superior del formulario',NULL,NULL),(117,'fr_FR','Création d\'adresse - en haut du formulaire',NULL,NULL),(117,'it_IT',NULL,NULL,NULL),(117,'ru_RU','Создание адреса - вверху формы',NULL,NULL),(118,'cs_CZ',NULL,NULL,NULL),(118,'de_DE','Adresse Erstellung - unten im Formular',NULL,NULL),(118,'en_US','Address creation - at the bottom of the form',NULL,NULL),(118,'es_ES','Creación de dirección - en la parte inferior del formulario',NULL,NULL),(118,'fr_FR','Création d\'adresse - en bas du formulaire',NULL,NULL),(118,'it_IT',NULL,NULL,NULL),(118,'ru_RU','Создание адреса - внизу формы',NULL,NULL),(119,'cs_CZ',NULL,NULL,NULL),(119,'de_DE','Adresse Erstellung - unten',NULL,NULL),(119,'en_US','Address creation - at the bottom',NULL,NULL),(119,'es_ES','Creación de dirección - en la parte inferior',NULL,NULL),(119,'fr_FR','Création d\'adresse - en bas',NULL,NULL),(119,'it_IT',NULL,NULL,NULL),(119,'ru_RU','Создание адреса - внизу',NULL,NULL),(120,'cs_CZ',NULL,NULL,NULL),(120,'de_DE','Adresse Erstellung - CSS-Stylesheet',NULL,NULL),(120,'en_US','Address creation - CSS stylesheet',NULL,NULL),(120,'es_ES','Creación de dirección - hoja de estilos CSS',NULL,NULL),(120,'fr_FR','Création d\'adresse - feuille de style CSS',NULL,NULL),(120,'it_IT',NULL,NULL,NULL),(120,'ru_RU','Создание адреса - CSS стили',NULL,NULL),(121,'cs_CZ',NULL,NULL,NULL),(121,'de_DE','Adresse Erstellung - nach der Integration von Javascript',NULL,NULL),(121,'en_US','Address creation - after javascript include',NULL,NULL),(121,'es_ES','Creación de dirección- después del include javascript',NULL,NULL),(121,'fr_FR','Création d\'adresse - après l\'inclusion du JavaScript',NULL,NULL),(121,'it_IT',NULL,NULL,NULL),(121,'ru_RU','Создание адреса - после включения javascript',NULL,NULL),(122,'cs_CZ',NULL,NULL,NULL),(122,'de_DE','Adresse Erstellung - nach der Initialisierung von Javascript',NULL,NULL),(122,'en_US','Address creation - after javascript initialisation',NULL,NULL),(122,'es_ES','Creación de dirección - después de la inicialización de javascript',NULL,NULL),(122,'fr_FR','Création d\'adresse - après l\'initialisation du JavaScript',NULL,NULL),(122,'it_IT',NULL,NULL,NULL),(122,'ru_RU','Создание адреса - после инициализации javascript',NULL,NULL),(123,'cs_CZ',NULL,NULL,NULL),(123,'de_DE','Ordnerseite - oben',NULL,NULL),(123,'en_US','Folder page - at the top',NULL,NULL),(123,'es_ES','Carpeta de página - en la parte superior',NULL,NULL),(123,'fr_FR','Page dossier - en haut',NULL,NULL),(123,'it_IT',NULL,NULL,NULL),(123,'ru_RU','Страница папки - вверху',NULL,NULL),(124,'cs_CZ',NULL,NULL,NULL),(124,'de_DE','Ordnerseite - oben an dem Hauptbereich',NULL,NULL),(124,'en_US','Folder page - at the top of the main area',NULL,NULL),(124,'es_ES','Carpeta de página - en la parte superior del área principal',NULL,NULL),(124,'fr_FR','Page dossier - en haut de la zone principale',NULL,NULL),(124,'it_IT',NULL,NULL,NULL),(124,'ru_RU','Страница папки - вверху основной зоны',NULL,NULL),(125,'cs_CZ',NULL,NULL,NULL),(125,'de_DE','Ordnerseite - unten an dem Hauptbereich',NULL,NULL),(125,'en_US','Folder page - at the bottom of the main area',NULL,NULL),(125,'es_ES','Carpeta de página - al final del área principal',NULL,NULL),(125,'fr_FR','Page dossier - en bas de la zone principale',NULL,NULL),(125,'it_IT',NULL,NULL,NULL),(125,'ru_RU','Страница папки - внизу основной зоны',NULL,NULL),(126,'cs_CZ',NULL,NULL,NULL),(126,'de_DE','Ordnerseite - unten',NULL,NULL),(126,'en_US','Folder page - at the bottom',NULL,NULL),(126,'es_ES','Carpeta de página - al final',NULL,NULL),(126,'fr_FR','Page dossier - en bas',NULL,NULL),(126,'it_IT',NULL,NULL,NULL),(126,'ru_RU','Страница папки - внизу',NULL,NULL),(127,'cs_CZ',NULL,NULL,NULL),(127,'de_DE','Ordnerseite - CSS-Stylesheet',NULL,NULL),(127,'en_US','Folder page - CSS stylesheet',NULL,NULL),(127,'es_ES','Página de la carpeta - hoja de estilos CSS',NULL,NULL),(127,'fr_FR','Page dossier - feuille de style CSS',NULL,NULL),(127,'it_IT',NULL,NULL,NULL),(127,'ru_RU','Страница папки - CSS стили',NULL,NULL),(128,'cs_CZ',NULL,NULL,NULL),(128,'de_DE','Ordnerseite - Nach Integration von JavaScript',NULL,NULL),(128,'en_US','Folder page - after javascript include',NULL,NULL),(128,'es_ES','Carpeta de página - después de incluir JavaScript',NULL,NULL),(128,'fr_FR','Page dossier - après l\'inclusion du JavaScript',NULL,NULL),(128,'it_IT',NULL,NULL,NULL),(128,'ru_RU','Страница папки - после включения javascript',NULL,NULL),(129,'cs_CZ',NULL,NULL,NULL),(129,'de_DE','Ordnerseite - nach der Initialisierung von Javascript',NULL,NULL),(129,'en_US','Folder page - after javascript initialisation',NULL,NULL),(129,'es_ES','Carpeta de página - después de inicialización de JavaScript',NULL,NULL),(129,'fr_FR','Page dossier - après l\'initialisation du JavaScript',NULL,NULL),(129,'it_IT',NULL,NULL,NULL),(129,'ru_RU','Страница папки - после инициализации javascript',NULL,NULL),(130,'cs_CZ',NULL,NULL,NULL),(130,'de_DE','Fehlschlag der Bestellung - oben',NULL,NULL),(130,'en_US','Order failed - at the top',NULL,NULL),(130,'es_ES','Pedido erróneo - al tope',NULL,NULL),(130,'fr_FR','Échec de la commande - en haut',NULL,NULL),(130,'it_IT',NULL,NULL,NULL),(130,'ru_RU','Ошибка заказа - вверху',NULL,NULL),(131,'cs_CZ',NULL,NULL,NULL),(131,'de_DE','Fehlschlag der Bestellung - unten',NULL,NULL),(131,'en_US','Order failed - at the bottom',NULL,NULL),(131,'es_ES','Pedido erróneo - al pie',NULL,NULL),(131,'fr_FR','Échec de la commande - en bas',NULL,NULL),(131,'it_IT',NULL,NULL,NULL),(131,'ru_RU','Ошибка заказа - внизу',NULL,NULL),(132,'cs_CZ',NULL,NULL,NULL),(132,'de_DE','Fehlschlag der Bestellung - CSS-Stylesheet',NULL,NULL),(132,'en_US','Order failed - CSS stylesheet',NULL,NULL),(132,'es_ES','Pedido erróneo - Hoja de Estilos CSS',NULL,NULL),(132,'fr_FR','Échec de la commande - feuille de style CSS',NULL,NULL),(132,'it_IT',NULL,NULL,NULL),(132,'ru_RU','Ошибка заказа - CSS стили',NULL,NULL),(133,'cs_CZ',NULL,NULL,NULL),(133,'de_DE','Fehlschlag der Bestellung - Nach Integration von JavaScript',NULL,NULL),(133,'en_US','Order failed - after javascript include',NULL,NULL),(133,'es_ES','Pedido erróneo - después de incluir JavaScript',NULL,NULL),(133,'fr_FR','Echec de la commande - après l\'inclusion du JavaScript',NULL,NULL),(133,'it_IT',NULL,NULL,NULL),(133,'ru_RU','Ошибка заказа - после включения javascript',NULL,NULL),(134,'cs_CZ',NULL,NULL,NULL),(134,'de_DE','Fehlschlag der Bestellung - nach der Initialisierung von Javascript',NULL,NULL),(134,'en_US','Order failed - after javascript initialisation',NULL,NULL),(134,'es_ES','Pedido erróneo - después de la inicialización de JavaScript',NULL,NULL),(134,'fr_FR','Echec de la commande - après l\'initialisation du JavaScript',NULL,NULL),(134,'it_IT',NULL,NULL,NULL),(134,'ru_RU','Ошибка заказа - после инициализации javascript',NULL,NULL),(135,'cs_CZ',NULL,NULL,NULL),(135,'de_DE','Kategorieseite - oben',NULL,NULL),(135,'en_US','Category page - at the top',NULL,NULL),(135,'es_ES','Página de la categoría - en la parte superior',NULL,NULL),(135,'fr_FR','Page catégorie - en haut',NULL,NULL),(135,'it_IT',NULL,NULL,NULL),(135,'ru_RU','Страница категории - вверху',NULL,NULL),(136,'cs_CZ',NULL,NULL,NULL),(136,'de_DE','Kategorieseite - oben an dem Hauptbereich',NULL,NULL),(136,'en_US','Category page - at the top of the main area',NULL,NULL),(136,'es_ES','Página de categoría - en la parte superior de la zona principal',NULL,NULL),(136,'fr_FR','Page catégorie - en haut de la zone principal',NULL,NULL),(136,'it_IT',NULL,NULL,NULL),(136,'ru_RU','Страница категории - вверху основной зоны',NULL,NULL),(137,'cs_CZ',NULL,NULL,NULL),(137,'de_DE','Kategorieseite - unten an dem Hauptbereich',NULL,NULL),(137,'en_US','Category page - at the bottom of the main area',NULL,NULL),(137,'es_ES','Página de la categoría - en la parte inferior de la zona principal',NULL,NULL),(137,'fr_FR','Page catégorie - en bas de la zone principal',NULL,NULL),(137,'it_IT',NULL,NULL,NULL),(137,'ru_RU','Страница категории - внизу основной зоны',NULL,NULL),(138,'cs_CZ',NULL,NULL,NULL),(138,'de_DE','Kategorieseite - unten',NULL,NULL),(138,'en_US','Category page - at the bottom',NULL,NULL),(138,'es_ES','Página de la categoría - en la parte inferior',NULL,NULL),(138,'fr_FR','Page catégorie - en bas',NULL,NULL),(138,'it_IT',NULL,NULL,NULL),(138,'ru_RU','Страница категории - внизу',NULL,NULL),(139,'cs_CZ',NULL,NULL,NULL),(139,'de_DE','Kategorieseite - CSS-Stylesheet',NULL,NULL),(139,'en_US','Category page - CSS stylesheet',NULL,NULL),(139,'es_ES','Página de la categoría - hoja de estilos CSS',NULL,NULL),(139,'fr_FR','Page catégorie - feuille de style CSS',NULL,NULL),(139,'it_IT',NULL,NULL,NULL),(139,'ru_RU','Страница категории - CSS стили',NULL,NULL),(140,'cs_CZ',NULL,NULL,NULL),(140,'de_DE','Kategorieseite - Nach Integration von JavaScript',NULL,NULL),(140,'en_US','Category page - after javascript include',NULL,NULL),(140,'es_ES','Página de la categoría - después de inclusión javascript',NULL,NULL),(140,'fr_FR','Page catégorie - après l\'inclusion du JavaScript',NULL,NULL),(140,'it_IT',NULL,NULL,NULL),(140,'ru_RU','Страница категории - после включения javascript',NULL,NULL),(141,'cs_CZ',NULL,NULL,NULL),(141,'de_DE','Kategorieseite - nach der Initialisierung von Javascript',NULL,NULL),(141,'en_US','Category page - after javascript initialisation',NULL,NULL),(141,'es_ES','Página de la categoría - después de la inicialización de javascript',NULL,NULL),(141,'fr_FR','Page catégorie - après l\'initialisation du JavaScript',NULL,NULL),(141,'it_IT',NULL,NULL,NULL),(141,'ru_RU','Страница категории - после инициализации javascript',NULL,NULL),(142,'cs_CZ',NULL,NULL,NULL),(142,'de_DE','Adresseänderung - oben',NULL,NULL),(142,'en_US','Address update - at the top',NULL,NULL),(142,'es_ES','Actualizar dirección - en la parte superior',NULL,NULL),(142,'fr_FR','Modification d\'adresse - en haut',NULL,NULL),(142,'it_IT',NULL,NULL,NULL),(142,'ru_RU','Обновление адреса - вверху',NULL,NULL),(143,'cs_CZ',NULL,NULL,NULL),(143,'de_DE','Adressänderung - oben im Formular',NULL,NULL),(143,'en_US','Address update - at the top of the form',NULL,NULL),(143,'es_ES','Actualizar dirección - en la parte superior del formulario',NULL,NULL),(143,'fr_FR','Modification d\'adresse - en haut du formulaire',NULL,NULL),(143,'it_IT',NULL,NULL,NULL),(143,'ru_RU','Обновление адреса - вверху формы',NULL,NULL),(144,'cs_CZ',NULL,NULL,NULL),(144,'de_DE','Adresseänderung - unten im Formular',NULL,NULL),(144,'en_US','Address update - at the bottom of the form',NULL,NULL),(144,'es_ES','Actualización de dirección - en la parte inferior del formulario',NULL,NULL),(144,'fr_FR','Modification d\'adresse - en bas du formulaire',NULL,NULL),(144,'it_IT',NULL,NULL,NULL),(144,'ru_RU','Обновление адреса - внизу формы',NULL,NULL),(145,'cs_CZ',NULL,NULL,NULL),(145,'de_DE','Adresseänderung - unten',NULL,NULL),(145,'en_US','Address update - at the bottom',NULL,NULL),(145,'es_ES','Actualización de dirección - en la parte inferior',NULL,NULL),(145,'fr_FR','Modification d\'adresse - en bas',NULL,NULL),(145,'it_IT',NULL,NULL,NULL),(145,'ru_RU','Обновление адреса - внизу',NULL,NULL),(146,'cs_CZ',NULL,NULL,NULL),(146,'de_DE','Adresseänderung - CSS-Stylesheet',NULL,NULL),(146,'en_US','Address update - CSS stylesheet',NULL,NULL),(146,'es_ES','Actualización de dirección - hoja de estilos CSS',NULL,NULL),(146,'fr_FR','Modification d\'adresse - feuille de style CSS',NULL,NULL),(146,'it_IT',NULL,NULL,NULL),(146,'ru_RU','Обновление адреса - CSS стили',NULL,NULL),(147,'cs_CZ',NULL,NULL,NULL),(147,'de_DE','Adresseänderung - nach der Integration von Javascript',NULL,NULL),(147,'en_US','Address update - after javascript include',NULL,NULL),(147,'es_ES','Actualización de dirección - tras el include javascript',NULL,NULL),(147,'fr_FR','Modification d\'adresse - après l\'inclusion du JavaScript',NULL,NULL),(147,'it_IT',NULL,NULL,NULL),(147,'ru_RU','Обновление адреса - после включения javascript',NULL,NULL),(148,'cs_CZ',NULL,NULL,NULL),(148,'de_DE','Adresseänderung - nach der Initialisierung von Javascript',NULL,NULL),(148,'en_US','Address update - after javascript initialisation',NULL,NULL),(148,'es_ES','Actualización de dirección - después de la inicialización de javascript',NULL,NULL),(148,'fr_FR','Modification d\'adresse - après l\'initialisation du JavaScript',NULL,NULL),(148,'it_IT',NULL,NULL,NULL),(148,'ru_RU','Обновление адреса - после инициализации javascript',NULL,NULL),(149,'cs_CZ',NULL,NULL,NULL),(149,'de_DE','Startseite - Hauptbereich',NULL,NULL),(149,'en_US','Home page - main area',NULL,NULL),(149,'es_ES','Página de inicio - Área Principal',NULL,NULL),(149,'fr_FR','Page d\'accueil - zone principale',NULL,NULL),(149,'it_IT',NULL,NULL,NULL),(149,'ru_RU','Домашняя страница - основная зона',NULL,NULL),(150,'cs_CZ',NULL,NULL,NULL),(150,'de_DE','Startseite - CSS-Stylesheet',NULL,NULL),(150,'en_US','Home page - CSS stylesheet',NULL,NULL),(150,'es_ES','Página de inicio - hoja de estilos CSS',NULL,NULL),(150,'fr_FR','Page d\'accueil - feuille de style CSS',NULL,NULL),(150,'it_IT',NULL,NULL,NULL),(150,'ru_RU','Домашнаяя страница - CSS стили',NULL,NULL),(151,'cs_CZ',NULL,NULL,NULL),(151,'de_DE','Startseite - Nach Integration von JavaScript',NULL,NULL),(151,'en_US','Home page - after javascript include',NULL,NULL),(151,'es_ES','Página de inicio - después de incluir JavaScript',NULL,NULL),(151,'fr_FR','Page d\'accueil - après l\'inclusion du JavaScript',NULL,NULL),(151,'it_IT',NULL,NULL,NULL),(151,'ru_RU','Домашнаяя страница - после включения javascript',NULL,NULL),(152,'cs_CZ',NULL,NULL,NULL),(152,'de_DE','Startseite - nach der Initialisierung von Javascript',NULL,NULL),(152,'en_US','Home page - after javascript initialisation',NULL,NULL),(152,'es_ES','Página de inicio - después de la inicialización de JavaScript',NULL,NULL),(152,'fr_FR','Page d\'accueil - après l\'initialisation du JavaScript',NULL,NULL),(152,'it_IT',NULL,NULL,NULL),(152,'ru_RU','Домашнаяя страница - после инициализации javascript',NULL,NULL),(153,'cs_CZ',NULL,NULL,NULL),(153,'de_DE','Passwort Änderung - oben',NULL,NULL),(153,'en_US','Change password - at the top',NULL,NULL),(153,'es_ES','Cambiar contraseña - en la parte superior',NULL,NULL),(153,'fr_FR','Changement de mot de passe - en haut',NULL,NULL),(153,'it_IT',NULL,NULL,NULL),(153,'ru_RU','Смена пароля - вверху',NULL,NULL),(154,'cs_CZ',NULL,NULL,NULL),(154,'de_DE','Passwort Änderung - unten',NULL,NULL),(154,'en_US','Change password - at the bottom',NULL,NULL),(154,'es_ES','Cambiar contraseña - en la parte inferior',NULL,NULL),(154,'fr_FR','Changement de mot de passe - en bas',NULL,NULL),(154,'it_IT',NULL,NULL,NULL),(154,'ru_RU','Смена пароля - внизу',NULL,NULL),(155,'cs_CZ',NULL,NULL,NULL),(155,'de_DE','Passwort Änderung - CSS-Stylesheet',NULL,NULL),(155,'en_US','Change password - CSS stylesheet',NULL,NULL),(155,'es_ES','Cambiar contraseña - hoja de estilos CSS',NULL,NULL),(155,'fr_FR','Changement de mot de passe - feuille de style CSS',NULL,NULL),(155,'it_IT',NULL,NULL,NULL),(155,'ru_RU','Смена пароля - CSS стили',NULL,NULL),(156,'cs_CZ',NULL,NULL,NULL),(156,'de_DE','Passwort Änderung - Nach Integration von JavaScript',NULL,NULL),(156,'en_US','Change password - after javascript include',NULL,NULL),(156,'es_ES','Cambiar contraseña - después de inclusión javascript',NULL,NULL),(156,'fr_FR','Changement de mot de passe - après l\'inclusion du JavaScript',NULL,NULL),(156,'it_IT',NULL,NULL,NULL),(156,'ru_RU','Смена пароля - после включения javascript',NULL,NULL),(157,'cs_CZ',NULL,NULL,NULL),(157,'de_DE','Passwort Änderung - nach der Initialisierung von Javascript',NULL,NULL),(157,'en_US','Change password - after javascript initialisation',NULL,NULL),(157,'es_ES','Cambiar contraseña - después de la inicialización de javascript',NULL,NULL),(157,'fr_FR','Changement de mot de passe - après l\'initialisation du JavaScript',NULL,NULL),(157,'it_IT',NULL,NULL,NULL),(157,'ru_RU','Смена пароля - после инициализации javascript',NULL,NULL),(158,'cs_CZ',NULL,NULL,NULL),(158,'de_DE','Produktseite - oben',NULL,NULL),(158,'en_US','Product page - at the top',NULL,NULL),(158,'es_ES','Página de producto - en la parte superior',NULL,NULL),(158,'fr_FR','Page produit - en haut',NULL,NULL),(158,'it_IT',NULL,NULL,NULL),(158,'ru_RU','Страница товара - вверху',NULL,NULL),(159,'cs_CZ',NULL,NULL,NULL),(159,'de_DE','Produktseite - Bilder-Gallerie',NULL,NULL),(159,'en_US','Product page - photo gallery',NULL,NULL),(159,'es_ES','Página de producto - Galería de fotos',NULL,NULL),(159,'fr_FR','Page produit - galerie photos',NULL,NULL),(159,'it_IT',NULL,NULL,NULL),(159,'ru_RU','Страница товара - фото галерея',NULL,NULL),(160,'cs_CZ',NULL,NULL,NULL),(160,'de_DE','Produktseite - oben dem Details-Bereich',NULL,NULL),(160,'en_US','Product page - at the top of the detail',NULL,NULL),(160,'es_ES','Página de producto - en la parte superior del detalle',NULL,NULL),(160,'fr_FR','Page produit - en haut de la zone détail',NULL,NULL),(160,'it_IT',NULL,NULL,NULL),(160,'ru_RU','Страница товара - вверху деталей',NULL,NULL),(161,'cs_CZ',NULL,NULL,NULL),(161,'de_DE','Produktseite - unten dem Details-Bereich',NULL,NULL),(161,'en_US','Product page - at the bottom of the detail area',NULL,NULL),(161,'es_ES','Página de producto - en la parte inferior del área de detalle',NULL,NULL),(161,'fr_FR','Page produit - en dessous de la zone de détail',NULL,NULL),(161,'it_IT',NULL,NULL,NULL),(161,'ru_RU','Страница товара - внизу зоны деталей',NULL,NULL),(162,'cs_CZ',NULL,NULL,NULL),(162,'de_DE','Produktseite - erweitere Informationen',NULL,NULL),(162,'en_US','Product page - additional information',NULL,NULL),(162,'es_ES','Página de producto - información adicional',NULL,NULL),(162,'fr_FR','Page produit - informations additionnelles',NULL,NULL),(162,'it_IT',NULL,NULL,NULL),(162,'ru_RU','Страница товара - дополнительная информация',NULL,NULL),(163,'cs_CZ',NULL,NULL,NULL),(163,'de_DE','Produktseite - unten',NULL,NULL),(163,'en_US','Product page - at the bottom',NULL,NULL),(163,'es_ES','Página de producto - en la parte inferior',NULL,NULL),(163,'fr_FR','Page produit - en bas',NULL,NULL),(163,'it_IT',NULL,NULL,NULL),(163,'ru_RU','Страница товара - внизу',NULL,NULL),(164,'cs_CZ',NULL,NULL,NULL),(164,'de_DE','Produktseite - CSS-Stylesheet',NULL,NULL),(164,'en_US','Product page - CSS stylesheet',NULL,NULL),(164,'es_ES','Página de producto - hoja de estilos CSS',NULL,NULL),(164,'fr_FR','Page produit - feuille de style CSS',NULL,NULL),(164,'it_IT',NULL,NULL,NULL),(164,'ru_RU','Страница товара - CSS стили',NULL,NULL),(165,'cs_CZ',NULL,NULL,NULL),(165,'de_DE','Produktseite - Nach Integration von JavaScript',NULL,NULL),(165,'en_US','Product page - after javascript include',NULL,NULL),(165,'es_ES','Página de producto - después de incluir JavaScript',NULL,NULL),(165,'fr_FR','Page produit - après l\'inclusion du JavaScript',NULL,NULL),(165,'it_IT',NULL,NULL,NULL),(165,'ru_RU','Страница товара - после включения javascript',NULL,NULL),(166,'cs_CZ',NULL,NULL,NULL),(166,'de_DE','Produktseite - nach der Initialisierung von Javascript',NULL,NULL),(166,'en_US','Product page - after javascript initialisation',NULL,NULL),(166,'es_ES','Página de producto - después de la inicialización de Javascript',NULL,NULL),(166,'fr_FR','Page produit - après l\'initialisation du JavaScript',NULL,NULL),(166,'it_IT',NULL,NULL,NULL),(166,'ru_RU','Страница товара - после инициализации javascript',NULL,NULL),(167,'cs_CZ',NULL,NULL,NULL),(167,'de_DE','Kundenkonto - oben',NULL,NULL),(167,'en_US','customer account - at the top',NULL,NULL),(167,'es_ES','cuenta de cliente - en la parte superior',NULL,NULL),(167,'fr_FR','Compte client - en haut',NULL,NULL),(167,'it_IT',NULL,NULL,NULL),(167,'ru_RU','Аккаунт клиента - вверху',NULL,NULL),(168,'cs_CZ',NULL,NULL,NULL),(168,'de_DE','Kundenkonto - unten',NULL,NULL),(168,'en_US','customer account - at the bottom',NULL,NULL),(168,'es_ES','cuenta de cliente - en la parte inferior',NULL,NULL),(168,'fr_FR','Compte client - en bas',NULL,NULL),(168,'it_IT',NULL,NULL,NULL),(168,'ru_RU','Аккаунт клиента - внизу',NULL,NULL),(169,'cs_CZ',NULL,NULL,NULL),(169,'de_DE','Kundenkonto - CSS-Stylesheet',NULL,NULL),(169,'en_US','customer account - CSS stylesheet',NULL,NULL),(169,'es_ES','cuenta de cliente - hoja de estilos CSS',NULL,NULL),(169,'fr_FR','Compte client - feuille de style CSS',NULL,NULL),(169,'it_IT',NULL,NULL,NULL),(169,'ru_RU','Аккаунт клиента - CSS стили',NULL,NULL),(170,'cs_CZ',NULL,NULL,NULL),(170,'de_DE','Kundenkonto - Nach Integration von JavaScript',NULL,NULL),(170,'en_US','customer account - after javascript include',NULL,NULL),(170,'es_ES','cuenta de cliente - después de incluir JavaScript',NULL,NULL),(170,'fr_FR','Compte client - après l\'inclusion du JavaScript',NULL,NULL),(170,'it_IT',NULL,NULL,NULL),(170,'ru_RU','Аккаунт клиента - после включения javascript',NULL,NULL),(171,'cs_CZ',NULL,NULL,NULL),(171,'de_DE','Kundenkonto - nach der Initialisierung von Javascript',NULL,NULL),(171,'en_US','customer account - after javascript initialisation',NULL,NULL),(171,'es_ES','cuenta de cliente - después de la inicialización de JavaScript',NULL,NULL),(171,'fr_FR','Compte client - après l\'initialisation du JavaScript',NULL,NULL),(171,'it_IT',NULL,NULL,NULL),(171,'ru_RU','Аккаунт клиента - после инициализации javascript',NULL,NULL),(172,'cs_CZ',NULL,NULL,NULL),(172,'de_DE','Alle Produkte - oben',NULL,NULL),(172,'en_US','All Products - at the top',NULL,NULL),(172,'es_ES','Todos los productos - en la parte superior',NULL,NULL),(172,'fr_FR','Tous les produits - en haut',NULL,NULL),(172,'it_IT',NULL,NULL,NULL),(172,'ru_RU','Все товары - вверху',NULL,NULL),(173,'cs_CZ',NULL,NULL,NULL),(173,'de_DE','Alle Produkte - unten',NULL,NULL),(173,'en_US','All Products - at the bottom',NULL,NULL),(173,'es_ES','Todos los productos - en la parte inferior',NULL,NULL),(173,'fr_FR','Tous les produits - en bas',NULL,NULL),(173,'it_IT',NULL,NULL,NULL),(173,'ru_RU','Все товары - внизу',NULL,NULL),(174,'cs_CZ',NULL,NULL,NULL),(174,'de_DE','Alle Produkte - CSS-Stylesheet',NULL,NULL),(174,'en_US','All Products - CSS stylesheet',NULL,NULL),(174,'es_ES','Todos los productos - hoja de estilos CSS',NULL,NULL),(174,'fr_FR','Tous les produits - feuille de style CSS',NULL,NULL),(174,'it_IT',NULL,NULL,NULL),(174,'ru_RU','Все товары - CSS стили',NULL,NULL),(175,'cs_CZ',NULL,NULL,NULL),(175,'de_DE','Alle Produkte - nach der Integration von Javascript',NULL,NULL),(175,'en_US','All Products - after javascript include',NULL,NULL),(175,'es_ES','Todos los productos - después de include javascript',NULL,NULL),(175,'fr_FR','Tous les produits - après l\'inclusion du JavaScript',NULL,NULL),(175,'it_IT',NULL,NULL,NULL),(175,'ru_RU','Все товары - после включения javascript',NULL,NULL),(176,'cs_CZ',NULL,NULL,NULL),(176,'de_DE','Alle Produkte - nach der Initialisierung von Javascript',NULL,NULL),(176,'en_US','All Products - after javascript initialisation',NULL,NULL),(176,'es_ES','Todos los productos - después de la inicialización de javascript',NULL,NULL),(176,'fr_FR','Tous les produits - après l\'initialisation du JavaScript',NULL,NULL),(176,'it_IT',NULL,NULL,NULL),(176,'ru_RU','Все товары - после инициализации javascript',NULL,NULL),(177,'cs_CZ',NULL,NULL,NULL),(177,'de_DE','Produkt-Loop - oben',NULL,NULL),(177,'en_US','Product loop - at the top',NULL,NULL),(177,'es_ES','Ciclo del producto - en la parte superior',NULL,NULL),(177,'fr_FR','Boucle produit - en haut',NULL,NULL),(177,'it_IT',NULL,NULL,NULL),(177,'ru_RU','Цикл товара - вверху',NULL,NULL),(178,'cs_CZ',NULL,NULL,NULL),(178,'de_DE','Produkt-Loop - unten',NULL,NULL),(178,'en_US','Product loop - at the bottom',NULL,NULL),(178,'es_ES','Ciclo del producto - en la parte inferior',NULL,NULL),(178,'fr_FR','Boucle produit - en bas',NULL,NULL),(178,'it_IT',NULL,NULL,NULL),(178,'ru_RU','Цикл товара - внизу',NULL,NULL),(179,'cs_CZ',NULL,NULL,NULL),(179,'de_DE','Kategorieseite - oben an der Sidebar',NULL,NULL),(179,'en_US','Category page - at the top of the sidebar',NULL,NULL),(179,'es_ES','Página de categoría - en la parte inferior de la barra lateral',NULL,NULL),(179,'fr_FR','Page catégorie - en haut de la sidebar',NULL,NULL),(179,'it_IT',NULL,NULL,NULL),(179,'ru_RU','Страница категории - вверху боковой панели',NULL,NULL),(180,'cs_CZ',NULL,NULL,NULL),(180,'de_DE','Kategorieseite - Sidebars Body',NULL,NULL),(180,'en_US','Category page - the body of the sidebar',NULL,NULL),(180,'es_ES','Página de categoría - el cuerpo de la barra lateral',NULL,NULL),(180,'fr_FR','Page catégorie - le corps de la sidebar',NULL,NULL),(180,'it_IT',NULL,NULL,NULL),(180,'ru_RU','Страница категории - содержимое боковой панели',NULL,NULL),(181,'cs_CZ',NULL,NULL,NULL),(181,'de_DE','Kategorieseite - unten an der Sidebar',NULL,NULL),(181,'en_US','Category page - at the bottom of the sidebar',NULL,NULL),(181,'es_ES','Página de la categoría - en la parte inferior de la barra lateral',NULL,NULL),(181,'fr_FR','Page catégorie - en bas de la sidebar',NULL,NULL),(181,'it_IT',NULL,NULL,NULL),(181,'ru_RU','Страница категории - внизу боковой панели',NULL,NULL),(182,'cs_CZ',NULL,NULL,NULL),(182,'de_DE','Inhaltseite - oben an der Sidebar',NULL,NULL),(182,'en_US','Content page - at the top of the sidebar',NULL,NULL),(182,'es_ES','Página de contenido - en la parte superior de la barra lateral',NULL,NULL),(182,'fr_FR','Page de contenu - en haut de la sidebar',NULL,NULL),(182,'it_IT',NULL,NULL,NULL),(182,'ru_RU','Страница контента - вверху боковой панели',NULL,NULL),(183,'cs_CZ',NULL,NULL,NULL),(183,'de_DE','Inhaltseite - Sidebars Body',NULL,NULL),(183,'en_US','Content page - the body of the sidebar',NULL,NULL),(183,'es_ES','Página de contenido - cuerpo de la barra lateral',NULL,NULL),(183,'fr_FR','Page de contenu - le corps de la sidebar',NULL,NULL),(183,'it_IT',NULL,NULL,NULL),(183,'ru_RU','Страница контента - содержимое боковой панели',NULL,NULL),(184,'cs_CZ',NULL,NULL,NULL),(184,'de_DE','Inhaltseite - unten an der Sidebar',NULL,NULL),(184,'en_US','Content page - at the bottom of the sidebar',NULL,NULL),(184,'es_ES','Página de contenido - en la parte inferior de la barra lateral',NULL,NULL),(184,'fr_FR','Page de contenu - en bas de la sidebar',NULL,NULL),(184,'it_IT',NULL,NULL,NULL),(184,'ru_RU','Страница контента - внизу боковой панели',NULL,NULL),(185,'cs_CZ',NULL,NULL,NULL),(185,'de_DE','Lieferwahl - Erweiteren Bereich',NULL,NULL),(185,'en_US','Delivery choice - extra area',NULL,NULL),(185,'es_ES','Opción de entrega - área extra',NULL,NULL),(185,'fr_FR','Choix du transporteur - zone supplémentaire',NULL,NULL),(185,'it_IT',NULL,NULL,NULL),(185,'ru_RU','Выбор доставки - доп. зона',NULL,NULL),(186,'cs_CZ',NULL,NULL,NULL),(186,'de_DE','Lieferwahl - Javascript',NULL,NULL),(186,'en_US','Delivery choice - javascript',NULL,NULL),(186,'es_ES','Opción de entrega - javascript',NULL,NULL),(186,'fr_FR','Choix du transporteur - javascript',NULL,NULL),(186,'it_IT',NULL,NULL,NULL),(186,'ru_RU','Выбор доставки - javascript',NULL,NULL),(187,'cs_CZ',NULL,NULL,NULL),(187,'de_DE','Kategorieseite - vor dem Hauptinhaltsbereich',NULL,NULL),(187,'en_US','Category page - before the main content area',NULL,NULL),(187,'es_ES','Página de categoría - antes el área de contenido principal',NULL,NULL),(187,'fr_FR','Page catégorie - au dessus de la zone de contenu principale',NULL,NULL),(187,'it_IT',NULL,NULL,NULL),(187,'ru_RU','Страница категории - перед основной зоной контента',NULL,NULL),(188,'cs_CZ',NULL,NULL,NULL),(188,'de_DE','Kategorieseite - nach dem Hauptinhaltsbereich',NULL,NULL),(188,'en_US','Category page - after the main content area',NULL,NULL),(188,'es_ES','Página de la categoría - después el área de contenido principal',NULL,NULL),(188,'fr_FR','Page catégorie - en dessous de la zone de contenu principale',NULL,NULL),(188,'it_IT',NULL,NULL,NULL),(188,'ru_RU','Страница категории - после основной зоны контента',NULL,NULL),(189,'cs_CZ',NULL,NULL,NULL),(189,'de_DE','Inhaltseite- vor dem Hauptinhaltsbereich',NULL,NULL),(189,'en_US','Content page - before the main content area',NULL,NULL),(189,'es_ES','Página de contenido - antes del área de contenido principal',NULL,NULL),(189,'fr_FR','Page de contenu - au dessus de la zone de contenu principale',NULL,NULL),(189,'it_IT',NULL,NULL,NULL),(189,'ru_RU','Страница контента - перед основной зоной контента',NULL,NULL),(190,'cs_CZ',NULL,NULL,NULL),(190,'de_DE','Inhaltseite - nach dem Hauptinhaltsbereich',NULL,NULL),(190,'en_US','Content page - after the main content area',NULL,NULL),(190,'es_ES','Página de contenido - después del área de contenido principal',NULL,NULL),(190,'fr_FR','Page de contenu - en dessous de la zone de contenu principale',NULL,NULL),(190,'it_IT',NULL,NULL,NULL),(190,'ru_RU','Страница контента - после основной зоны контента',NULL,NULL),(191,'cs_CZ',NULL,NULL,NULL),(191,'de_DE','Ordnerseite - vor dem Hauptinhaltsbereich',NULL,NULL),(191,'en_US','Folder page - before the main content area',NULL,NULL),(191,'es_ES','Carpeta de página - antes del área de contenido principal',NULL,NULL),(191,'fr_FR','Page dossier - au dessus de la zone de contenu principale',NULL,NULL),(191,'it_IT',NULL,NULL,NULL),(191,'ru_RU','Страница папки - перед основной зоной контента',NULL,NULL),(192,'cs_CZ',NULL,NULL,NULL),(192,'de_DE','Ordnerseite - nach dem Hauptinhaltsbereich',NULL,NULL),(192,'en_US','Folder page - after the main content area',NULL,NULL),(192,'es_ES','Carpeta de página - después del área de contenido principal',NULL,NULL),(192,'fr_FR','Page dossier - en dessous de la zone de contenu principale',NULL,NULL),(192,'it_IT',NULL,NULL,NULL),(192,'ru_RU','Страница папки - после основной зоны контента',NULL,NULL),(193,'cs_CZ',NULL,NULL,NULL),(193,'de_DE','Marken Seite - oben',NULL,NULL),(193,'en_US','Brands page - at the top',NULL,NULL),(193,'es_ES','Página de las marcas - en la parte superior',NULL,NULL),(193,'fr_FR','Page des marques - en haut',NULL,NULL),(193,'it_IT',NULL,NULL,NULL),(193,'ru_RU','Страница брендов - вверху',NULL,NULL),(194,'cs_CZ',NULL,NULL,NULL),(194,'de_DE','Marken Seite - unten',NULL,NULL),(194,'en_US','Brands page - at the bottom',NULL,NULL),(194,'es_ES','Página de las marcas - en la parte inferior',NULL,NULL),(194,'fr_FR','Page des marques - en bas',NULL,NULL),(194,'it_IT',NULL,NULL,NULL),(194,'ru_RU','Страница брендов - внизу',NULL,NULL),(195,'cs_CZ',NULL,NULL,NULL),(195,'de_DE','Marken Seite - oben des Hauptbereichs',NULL,NULL),(195,'en_US','Brands page - at the top of the main area',NULL,NULL),(195,'es_ES','Página de las marcas - en la parte inferior del área principal',NULL,NULL),(195,'fr_FR','Page des marques - en haut de la zone principal',NULL,NULL),(195,'it_IT',NULL,NULL,NULL),(195,'ru_RU','Страница брендов - вверху основной зоны',NULL,NULL),(196,'cs_CZ',NULL,NULL,NULL),(196,'de_DE','Marken Seite - unten des Hauptbereichs',NULL,NULL),(196,'en_US','Brands page - at the bottom of the main area',NULL,NULL),(196,'es_ES','Página de las marcas - en la parte inferior del área principal',NULL,NULL),(196,'fr_FR','Page des marques - en bas de la zone principal',NULL,NULL),(196,'it_IT',NULL,NULL,NULL),(196,'ru_RU','Страница брендов - внизу основной зоны',NULL,NULL),(197,'cs_CZ',NULL,NULL,NULL),(197,'de_DE','Marken Seite - vor dem Hauptinhaltsbereich',NULL,NULL),(197,'en_US','Brands page - before the main content area',NULL,NULL),(197,'es_ES','Página de marcas - antes del área de contenido principal',NULL,NULL),(197,'fr_FR','Page des marques - au dessus de la zone de contenu principale',NULL,NULL),(197,'it_IT',NULL,NULL,NULL),(197,'ru_RU','Страница брендов - перед основной зоной контента',NULL,NULL),(198,'cs_CZ',NULL,NULL,NULL),(198,'de_DE','Marken Seite - Nach dem Hauptinhalt Bereich',NULL,NULL),(198,'en_US','Brands page - after the main content area',NULL,NULL),(198,'es_ES','Página de marcas - después el área de contenido principal',NULL,NULL),(198,'fr_FR','Page des marques - en dessous de la zone de contenu principale',NULL,NULL),(198,'it_IT',NULL,NULL,NULL),(198,'ru_RU','Страница брендов - после основной зоны контента',NULL,NULL),(199,'cs_CZ',NULL,NULL,NULL),(199,'de_DE','Marken Seite - CSS-Stylesheet',NULL,NULL),(199,'en_US','Brands page - CSS stylesheet',NULL,NULL),(199,'es_ES','Página de marcas - hoja de estilos CSS',NULL,NULL),(199,'fr_FR','Page des marques - feuille de style CSS',NULL,NULL),(199,'it_IT',NULL,NULL,NULL),(199,'ru_RU','Страница брендов - CSS стили',NULL,NULL),(200,'cs_CZ',NULL,NULL,NULL),(200,'de_DE','Marken Seite - Nach der Integration von Javascript',NULL,NULL),(200,'en_US','Brands page - after javascript include',NULL,NULL),(200,'es_ES','Página de marcas - después de inclusión de javascript',NULL,NULL),(200,'fr_FR','Page des marques - après l\'inclusion du JavaScript',NULL,NULL),(200,'it_IT',NULL,NULL,NULL),(200,'ru_RU','Страница брендов - после включения javascript',NULL,NULL),(201,'cs_CZ',NULL,NULL,NULL),(201,'de_DE','Marken Seite - Javascript Initialisation',NULL,NULL),(201,'en_US','Brands page - javascript initialization',NULL,NULL),(201,'es_ES','Página de marcas - inicialización de javascript',NULL,NULL),(201,'fr_FR','Page des marques - initialisation du JavaScript',NULL,NULL),(201,'it_IT',NULL,NULL,NULL),(201,'ru_RU','Страница брендов - после инициализации javascript',NULL,NULL),(202,'cs_CZ',NULL,NULL,NULL),(202,'de_DE','Marken Seite - oben der Sidebar',NULL,NULL),(202,'en_US','Brands page - at the top of the sidebar',NULL,NULL),(202,'es_ES','Página de las marcas - en la parte inferior de la barra lateral',NULL,NULL),(202,'fr_FR','Page des marques - en haut de la sidebar',NULL,NULL),(202,'it_IT',NULL,NULL,NULL),(202,'ru_RU','Страница брендов - вверху боковой панели',NULL,NULL),(203,'cs_CZ',NULL,NULL,NULL),(203,'de_DE','Marken Seite - Sidebars Body',NULL,NULL),(203,'en_US','Brands page - the body of the sidebar',NULL,NULL),(203,'es_ES','Página de marcas - el cuerpo de la barra lateral',NULL,NULL),(203,'fr_FR','Page des marques - le corps de la sidebar',NULL,NULL),(203,'it_IT',NULL,NULL,NULL),(203,'ru_RU','Страница брендов - содержимое боковой панели',NULL,NULL),(204,'cs_CZ',NULL,NULL,NULL),(204,'de_DE','Marken Seite - unten der Sidebar',NULL,NULL),(204,'en_US','Brands page - at the bottom of the sidebar',NULL,NULL),(204,'es_ES','Página de las marcas - en la parte inferior de la barra lateral',NULL,NULL),(204,'fr_FR','Page des marques - en bas de la sidebar',NULL,NULL),(204,'it_IT',NULL,NULL,NULL),(204,'ru_RU','Страница брендов - внизу боковой панели',NULL,NULL),(205,'cs_CZ',NULL,NULL,NULL),(205,'de_DE','Bestellungsdetails - oben',NULL,NULL),(205,'en_US','Order details - at the top',NULL,NULL),(205,'es_ES','Detalles de la orden - en la parte superior',NULL,NULL),(205,'fr_FR','Détail d\'une commande - en haut',NULL,NULL),(205,'it_IT',NULL,NULL,NULL),(205,'ru_RU','Детали заказа - вверху',NULL,NULL),(206,'cs_CZ',NULL,NULL,NULL),(206,'de_DE','Bestellungsdetails - weitere Informationen',NULL,NULL),(206,'en_US','Order details - additional information',NULL,NULL),(206,'es_ES','Detalles de la Orden - información adicional',NULL,NULL),(206,'fr_FR','Détail d\'une commande - informations additionnelles',NULL,NULL),(206,'it_IT',NULL,NULL,NULL),(206,'ru_RU','Детали заказа - дополнительная информация',NULL,NULL),(207,'cs_CZ',NULL,NULL,NULL),(207,'de_DE','Bestellungsdetails - nach den allgemeinen Informationen',NULL,NULL),(207,'en_US','Order details - after global information',NULL,NULL),(207,'es_ES','Detalles de la orden - después de la información global',NULL,NULL),(207,'fr_FR','Détail d\'une commande - après les informations générales',NULL,NULL),(207,'it_IT',NULL,NULL,NULL),(207,'ru_RU','Детали заказа - после общей информации',NULL,NULL),(208,'cs_CZ',NULL,NULL,NULL),(208,'de_DE','Bestellungsdetails - weitere Informationen für den Versand',NULL,NULL),(208,'en_US','Order details - additional delivery information',NULL,NULL),(208,'es_ES','Detalles de la Orden - información adicional del envío',NULL,NULL),(208,'fr_FR','Détail d\'une commande - informations additionnelles pour l\'expédition',NULL,NULL),(208,'it_IT',NULL,NULL,NULL),(208,'ru_RU','Детали заказа - дополнительная информация доставки',NULL,NULL),(209,'cs_CZ',NULL,NULL,NULL),(209,'de_DE','Bestellungsdetails - Lieferadresse',NULL,NULL),(209,'en_US','Order details - delivery address',NULL,NULL),(209,'es_ES','Pedir detalles - dirección de envío',NULL,NULL),(209,'fr_FR','Détail d\'une commande - adresse de livraison',NULL,NULL),(209,'it_IT',NULL,NULL,NULL),(209,'ru_RU','Детали заказа - адрес доставки',NULL,NULL),(210,'cs_CZ',NULL,NULL,NULL),(210,'de_DE','Bestellungsdetails - weitere Informationen für die Rechnung',NULL,NULL),(210,'en_US','Order details - additional invoice information',NULL,NULL),(210,'es_ES','Detalles de la Orden - información adicional de la factura',NULL,NULL),(210,'fr_FR','Détail d\'une commande - informations additionnelles pour la facturation',NULL,NULL),(210,'it_IT',NULL,NULL,NULL),(210,'ru_RU','Детали заказа - дополнительная информация счет-фактуры',NULL,NULL),(211,'cs_CZ',NULL,NULL,NULL),(211,'de_DE','Bestellungsdetails - Rechnungsadresse',NULL,NULL),(211,'en_US','Order details - invoice address',NULL,NULL),(211,'es_ES','Detalles de la orden - dirección de factura',NULL,NULL),(211,'fr_FR','Détail d\'une commande - adresse de facturation',NULL,NULL),(211,'it_IT',NULL,NULL,NULL),(211,'ru_RU','Детали заказа - адрес счет-фактуры',NULL,NULL),(212,'cs_CZ',NULL,NULL,NULL),(212,'de_DE','Bestellungsdetails - Nach den Adressen',NULL,NULL),(212,'en_US','Order details - after addresses',NULL,NULL),(212,'es_ES','Detalles de la Orden - después de direcciones',NULL,NULL),(212,'fr_FR','Détail d\'une commande - Après les adresses',NULL,NULL),(212,'it_IT',NULL,NULL,NULL),(212,'ru_RU','Детали заказа - после адресов',NULL,NULL),(213,'cs_CZ',NULL,NULL,NULL),(213,'de_DE','Bestellungsdetails - vor der Produktliste',NULL,NULL),(213,'en_US','Order details - before products list',NULL,NULL),(213,'es_ES','Detalles de la orden - antes de lista de productos',NULL,NULL),(213,'fr_FR','Détail d\'une commande - avant la liste des produits',NULL,NULL),(213,'it_IT',NULL,NULL,NULL),(213,'ru_RU','Детали заказа - перед списком товаров',NULL,NULL),(214,'cs_CZ',NULL,NULL,NULL),(214,'de_DE','Bestellungsdetails - weitere Informationen für ein Produkt',NULL,NULL),(214,'en_US','Order details - additional product information',NULL,NULL),(214,'es_ES','Detalles de la Orden - información adicional del producto',NULL,NULL),(214,'fr_FR','Détail d\'une commande - informations additionnelles pour un produit',NULL,NULL),(214,'it_IT',NULL,NULL,NULL),(214,'ru_RU','Детали заказа - дополнительная информация товара',NULL,NULL),(215,'cs_CZ',NULL,NULL,NULL),(215,'de_DE','Bestellungsdetails - nach der Produktliste',NULL,NULL),(215,'en_US','Order details - after products list',NULL,NULL),(215,'es_ES','Detalles de la orden - después de la lista de productos',NULL,NULL),(215,'fr_FR','Détail d\'une commande - après la liste des produits',NULL,NULL),(215,'it_IT',NULL,NULL,NULL),(215,'ru_RU','Детали заказа - после списка товаров',NULL,NULL),(216,'cs_CZ',NULL,NULL,NULL),(216,'de_DE','Bestellungsdetails - nach den Produkten',NULL,NULL),(216,'en_US','Order details - after products',NULL,NULL),(216,'es_ES','Detalles de la orden - después de los productos',NULL,NULL),(216,'fr_FR','Détail d\'une commande - Après les produits',NULL,NULL),(216,'it_IT',NULL,NULL,NULL),(216,'ru_RU','Детали заказа - после товаров',NULL,NULL),(217,'cs_CZ',NULL,NULL,NULL),(217,'de_DE','Bestellungsdetails - unten',NULL,NULL),(217,'en_US','Order details - at the bottom',NULL,NULL),(217,'es_ES','Detalles de la orden - en la parte inferior',NULL,NULL),(217,'fr_FR','Détail d\'une commande - en bas',NULL,NULL),(217,'it_IT',NULL,NULL,NULL),(217,'ru_RU','Детали заказа - внизу',NULL,NULL),(218,'cs_CZ',NULL,NULL,NULL),(218,'de_DE','Bestellungsdetails - CSS-Stylesheet',NULL,NULL),(218,'en_US','Order details - CSS stylesheet',NULL,NULL),(218,'es_ES','Detalles de la Orden - hoja de estilos CSS',NULL,NULL),(218,'fr_FR','Détail d\'une commande - feuille de style CSS',NULL,NULL),(218,'it_IT',NULL,NULL,NULL),(218,'ru_RU','Детали заказа - CSS стили',NULL,NULL),(219,'cs_CZ',NULL,NULL,NULL),(219,'de_DE','Bestellungsdetails - nach Integration von JavaScript',NULL,NULL),(219,'en_US','Order details - after javascript include',NULL,NULL),(219,'es_ES','Detalles de la orden - después de incluir JavaScript',NULL,NULL),(219,'fr_FR','Détail d\'une commande - après l\'inclusion du JavaScript',NULL,NULL),(219,'it_IT',NULL,NULL,NULL),(219,'ru_RU','Детали заказа - после включения javascript',NULL,NULL),(220,'cs_CZ',NULL,NULL,NULL),(220,'de_DE','Bestellungsdetails - Initialisierung von Javascript',NULL,NULL),(220,'en_US','Order details - javascript initialization',NULL,NULL),(220,'es_ES','Detalles de la Orden - inicialización de JavaScript',NULL,NULL),(220,'fr_FR','Détail d\'une commande - initialisation du JavaScript',NULL,NULL),(220,'it_IT',NULL,NULL,NULL),(220,'ru_RU','Детали заказа - после инициализщации javascript',NULL,NULL),(221,'cs_CZ',NULL,NULL,NULL),(221,'de_DE','Kundenkonto - Erweitere Informationen',NULL,NULL),(221,'en_US','Customer account - additional information',NULL,NULL),(221,'es_ES','Cuenta de cliente - información adicional',NULL,NULL),(221,'fr_FR','Compte client - informations additionnelles',NULL,NULL),(221,'it_IT',NULL,NULL,NULL),(221,'ru_RU','Аккаунт клиента - дополнительная информация',NULL,NULL),(222,'cs_CZ',NULL,NULL,NULL),(222,'de_DE','Bestelldaten - nach einem Produkt',NULL,NULL),(222,'en_US','Order details - after product',NULL,NULL),(222,'es_ES','Detalles de la orden - después del producto',NULL,NULL),(222,'fr_FR','Détail d\'une commande - Après un produit',NULL,NULL),(222,'it_IT',NULL,NULL,NULL),(222,'ru_RU','Детали заказа - после товара',NULL,NULL),(223,'cs_CZ',NULL,NULL,NULL),(223,'de_DE','Mini-Warenkorb',NULL,NULL),(223,'en_US','Mini cart',NULL,NULL),(223,'es_ES','Mini tarjeta',NULL,NULL),(223,'fr_FR','Mini panier',NULL,NULL),(223,'it_IT',NULL,NULL,NULL),(223,'ru_RU','Мини корзина',NULL,NULL),(224,'cs_CZ',NULL,NULL,NULL),(224,'de_DE',NULL,NULL,NULL),(224,'en_US','Sale - at the top',NULL,NULL),(224,'es_ES','Venta - encabezado',NULL,NULL),(224,'fr_FR','Promotion - en haut',NULL,NULL),(224,'it_IT',NULL,NULL,NULL),(224,'ru_RU','Распродажа - вверху',NULL,NULL),(225,'cs_CZ',NULL,NULL,NULL),(225,'de_DE',NULL,NULL,NULL),(225,'en_US','Sale - at the bottom',NULL,NULL),(225,'es_ES','Venta - al pie',NULL,NULL),(225,'fr_FR','Promotion - en bas',NULL,NULL),(225,'it_IT',NULL,NULL,NULL),(225,'ru_RU','Распродажа - внизу',NULL,NULL),(226,'cs_CZ',NULL,NULL,NULL),(226,'de_DE',NULL,NULL,NULL),(226,'en_US','Sale - at the top of the main area',NULL,NULL),(226,'es_ES','Venta - encabezado del área principal',NULL,NULL),(226,'fr_FR','Promotion - en haut de la zone principal',NULL,NULL),(226,'it_IT',NULL,NULL,NULL),(226,'ru_RU','Распродажа - вверху основной зоны',NULL,NULL),(227,'cs_CZ',NULL,NULL,NULL),(227,'de_DE',NULL,NULL,NULL),(227,'en_US','Sale - at the bottom of the main area',NULL,NULL),(227,'es_ES','Venta - al pie del área principal',NULL,NULL),(227,'fr_FR','Promotion - en bas de la zone principal',NULL,NULL),(227,'it_IT',NULL,NULL,NULL),(227,'ru_RU','Распродажа - внизу основной зоны',NULL,NULL),(228,'cs_CZ',NULL,NULL,NULL),(228,'de_DE',NULL,NULL,NULL),(228,'en_US','Sale - before the main content area',NULL,NULL),(228,'es_ES','Venta - antes del área de contenido principal',NULL,NULL),(228,'fr_FR','Promotion - au dessous de la zone de contenu principale',NULL,NULL),(228,'it_IT',NULL,NULL,NULL),(228,'ru_RU','Распродажа - перед зоной основного контента',NULL,NULL),(229,'cs_CZ',NULL,NULL,NULL),(229,'de_DE',NULL,NULL,NULL),(229,'en_US','Sale - after the main content area',NULL,NULL),(229,'es_ES','Venta - después del área de contenido principal',NULL,NULL),(229,'fr_FR','Promotion - en dessous de la zone de contenu principale',NULL,NULL),(229,'it_IT',NULL,NULL,NULL),(229,'ru_RU','Распродажа - после зоной основного контента',NULL,NULL),(230,'cs_CZ',NULL,NULL,NULL),(230,'de_DE',NULL,NULL,NULL),(230,'en_US','Sale - CSS stylesheet',NULL,NULL),(230,'es_ES','Venta - Hoja de estilos CSS',NULL,NULL),(230,'fr_FR','Promotion - feuille de style CSS',NULL,NULL),(230,'it_IT',NULL,NULL,NULL),(230,'ru_RU','Распродажа - CSS стили',NULL,NULL),(231,'cs_CZ',NULL,NULL,NULL),(231,'de_DE',NULL,NULL,NULL),(231,'en_US','Sale - after javascript include',NULL,NULL),(231,'es_ES','Venta - después de incluir JavaScript',NULL,NULL),(231,'fr_FR','Promotion - après l\'inclusion du JavaScript',NULL,NULL),(231,'it_IT',NULL,NULL,NULL),(231,'ru_RU','Распродажа - после включения javascript',NULL,NULL),(232,'cs_CZ',NULL,NULL,NULL),(232,'de_DE',NULL,NULL,NULL),(232,'en_US','Sale - javascript initialization',NULL,NULL),(232,'es_ES','Venta - inicialización de JavaScript',NULL,NULL),(232,'fr_FR','Promotion - initialisation du JavaScript',NULL,NULL),(232,'it_IT',NULL,NULL,NULL),(232,'ru_RU','Распродажа - после инициализации javascript ',NULL,NULL),(233,'cs_CZ',NULL,NULL,NULL),(233,'de_DE',NULL,NULL,NULL),(233,'en_US','Order details - after invoice address',NULL,NULL),(233,'es_ES','Detalles de pedido - después de la dirección de facturación',NULL,NULL),(233,'fr_FR','Détail d\'une commande - après l\'adresse de facturation',NULL,NULL),(233,'it_IT',NULL,NULL,NULL),(233,'ru_RU','Детали заказа - после адреса счет-фактуры',NULL,NULL),(234,'cs_CZ',NULL,NULL,NULL),(234,'de_DE',NULL,NULL,NULL),(234,'en_US','Order details - after delivery address',NULL,NULL),(234,'es_ES','Detalles de pedido - después de la dirección de entrega',NULL,NULL),(234,'fr_FR','Détails d\'une commande - après l\'adresse de livraison',NULL,NULL),(234,'it_IT',NULL,NULL,NULL),(234,'ru_RU','Детали заказа - после адреса доставки',NULL,NULL),(235,'cs_CZ',NULL,NULL,NULL),(235,'de_DE',NULL,NULL,NULL),(235,'en_US','Newsletter unsubscribe page - at the top',NULL,NULL),(235,'es_ES','Página de baja del boletín - en la parte superior',NULL,NULL),(235,'fr_FR','Désabonnement newsletter - en haut',NULL,NULL),(235,'it_IT',NULL,NULL,NULL),(235,'ru_RU','Страница отписки от рассылки - вверху',NULL,NULL),(236,'cs_CZ',NULL,NULL,NULL),(236,'de_DE',NULL,NULL,NULL),(236,'en_US','Newsletter unsubscribe page - at the bottom',NULL,NULL),(236,'es_ES','Página de baja del boletín - al pie',NULL,NULL),(236,'fr_FR','Désabonnement newsletter - en bas',NULL,NULL),(236,'it_IT',NULL,NULL,NULL),(236,'ru_RU','Страница отписки от рассылки - внизу',NULL,NULL),(237,'cs_CZ',NULL,NULL,NULL),(237,'de_DE',NULL,NULL,NULL),(237,'en_US','Newsletter unsubscribe page - CSS stylesheet',NULL,NULL),(237,'es_ES','Página de baja del boletín - Hoja de estilos CSS',NULL,NULL),(237,'fr_FR','Désabonnement newsletter - feuille de style CSS',NULL,NULL),(237,'it_IT',NULL,NULL,NULL),(237,'ru_RU','Страница отписки от рассылки - CSS стили',NULL,NULL),(238,'cs_CZ',NULL,NULL,NULL),(238,'de_DE',NULL,NULL,NULL),(238,'en_US','Newsletter unsubscribe page - after javascript include',NULL,NULL),(238,'es_ES','Página de baja del boletín - después de incluir JavaScript',NULL,NULL),(238,'fr_FR','Désabonnement newsletter - après l\'inclusion du JavaScript',NULL,NULL),(238,'it_IT',NULL,NULL,NULL),(238,'ru_RU','Страница отписки от рассылки - после включения javascript',NULL,NULL),(239,'cs_CZ',NULL,NULL,NULL),(239,'de_DE',NULL,NULL,NULL),(239,'en_US','Newsletter unsubscribe page - after javascript initialisation',NULL,NULL),(239,'es_ES','Página de baja del boletín - después de la inicialización de JavaScript',NULL,NULL),(239,'fr_FR','Désabonnement newsletter - après l\'initialisation du JavaScript',NULL,NULL),(239,'it_IT',NULL,NULL,NULL),(239,'ru_RU','Страница отписки от рассылки - после инициализации javascript',NULL,NULL),(240,'cs_CZ',NULL,NULL,NULL),(240,'de_DE',NULL,NULL,NULL),(240,'en_US','Order invoice page - bottom of coupon form',NULL,NULL),(240,'es_ES',NULL,NULL,NULL),(240,'fr_FR',NULL,NULL,NULL),(240,'it_IT',NULL,NULL,NULL),(240,'ru_RU',NULL,NULL,NULL),(241,'cs_CZ',NULL,NULL,NULL),(241,'de_DE',NULL,NULL,NULL),(241,'en_US','Order invoice page - bottom of payment form',NULL,NULL),(241,'es_ES',NULL,NULL,NULL),(241,'fr_FR',NULL,NULL,NULL),(241,'it_IT',NULL,NULL,NULL),(241,'ru_RU',NULL,NULL,NULL),(242,'cs_CZ',NULL,NULL,NULL),(242,'de_DE',NULL,NULL,NULL),(242,'en_US','Account order - after product information',NULL,NULL),(242,'es_ES',NULL,NULL,NULL),(242,'fr_FR',NULL,NULL,NULL),(242,'it_IT',NULL,NULL,NULL),(242,'ru_RU',NULL,NULL,NULL),(1000,'cs_CZ',NULL,NULL,NULL),(1000,'de_DE','Kategorie - Inhalt',NULL,NULL),(1000,'en_US','Category - content',NULL,NULL),(1000,'es_ES','Categoría - contenido',NULL,NULL),(1000,'fr_FR','Catégorie - contenu',NULL,NULL),(1000,'it_IT',NULL,NULL,NULL),(1000,'ru_RU','Категория - содержимое',NULL,NULL),(1001,'cs_CZ',NULL,NULL,NULL),(1001,'de_DE','Inhalt - Inhalt',NULL,NULL),(1001,'en_US','Content - content',NULL,NULL),(1001,'es_ES','Contenido - contenido',NULL,NULL),(1001,'fr_FR','Contenu - contenu',NULL,NULL),(1001,'it_IT',NULL,NULL,NULL),(1001,'ru_RU','Контент - содержимое',NULL,NULL),(1002,'cs_CZ',NULL,NULL,NULL),(1002,'de_DE','Ordner - Inhalt',NULL,NULL),(1002,'en_US','Folder - content',NULL,NULL),(1002,'es_ES','Carpeta - contenido',NULL,NULL),(1002,'fr_FR','Dossier - contenu',NULL,NULL),(1002,'it_IT',NULL,NULL,NULL),(1002,'ru_RU','Папка - содержимое',NULL,NULL),(1003,'cs_CZ',NULL,NULL,NULL),(1003,'de_DE','Bestellung - Inhalt',NULL,NULL),(1003,'en_US','Order - content',NULL,NULL),(1003,'es_ES','Orden - contenido',NULL,NULL),(1003,'fr_FR','Commande - contenu',NULL,NULL),(1003,'it_IT',NULL,NULL,NULL),(1003,'ru_RU','Заказ - содержимое',NULL,NULL),(1004,'cs_CZ',NULL,NULL,NULL),(1004,'de_DE','Produkt - Inhalt',NULL,NULL),(1004,'en_US','Product - content',NULL,NULL),(1004,'es_ES','Producto - contenido',NULL,NULL),(1004,'fr_FR','Produit - contenu',NULL,NULL),(1004,'it_IT',NULL,NULL,NULL),(1004,'ru_RU','Товар - содержимое',NULL,NULL),(1005,'cs_CZ',NULL,NULL,NULL),(1005,'de_DE','Karakteristiken-Angaben - Tabellenkopf',NULL,NULL),(1005,'en_US','Features value - table header',NULL,NULL),(1005,'es_ES','Valor Característica - encabezado de tabla',NULL,NULL),(1005,'fr_FR','Valeur de caractéristiques - colonne tableau',NULL,NULL),(1005,'it_IT',NULL,NULL,NULL),(1005,'ru_RU','Значение характеристик - заголовок таблицы',NULL,NULL),(1006,'cs_CZ',NULL,NULL,NULL),(1006,'de_DE','Karakteristiken-Angaben - Tabellenzeile',NULL,NULL),(1006,'en_US','Features value - table row',NULL,NULL),(1006,'es_ES','Valor Característica - fila de tabla',NULL,NULL),(1006,'fr_FR','Valeur de caractéristiques - ligne tableau',NULL,NULL),(1006,'it_IT',NULL,NULL,NULL),(1006,'ru_RU','Значение характеристик - строка таблицы',NULL,NULL),(1007,'cs_CZ',NULL,NULL,NULL),(1007,'de_DE','Karakteristik - Angabe-Erstellungsformular',NULL,NULL),(1007,'en_US','Feature - Value create form',NULL,NULL),(1007,'es_ES','Característica - Formulario para crear valor',NULL,NULL),(1007,'fr_FR','Caractéristique - Formulaire de création de valeur',NULL,NULL),(1007,'it_IT',NULL,NULL,NULL),(1007,'ru_RU','Характеристика - Форма создания значения',NULL,NULL),(1008,'cs_CZ',NULL,NULL,NULL),(1008,'de_DE','Karakteristik - JavaScript Änderung',NULL,NULL),(1008,'en_US','Feature - Edit JavaScript',NULL,NULL),(1008,'es_ES','Característica - Editar JavaScript',NULL,NULL),(1008,'fr_FR','Caractéristique - JavaScript modification',NULL,NULL),(1008,'it_IT',NULL,NULL,NULL),(1008,'ru_RU','Характеристика - Редактирование JavaScript',NULL,NULL),(1009,'cs_CZ',NULL,NULL,NULL),(1009,'de_DE','Produkt - JavaScript Änderung',NULL,NULL),(1009,'en_US','Product - Edit JavaScript',NULL,NULL),(1009,'es_ES','Producto - Editar JavaScript',NULL,NULL),(1009,'fr_FR','Produit - Modification de JavaScript',NULL,NULL),(1009,'it_IT',NULL,NULL,NULL),(1009,'ru_RU','Товар - Редактирование JavaScript',NULL,NULL),(1010,'cs_CZ',NULL,NULL,NULL),(1010,'de_DE','Gutschein - JavaScript erstellen',NULL,NULL),(1010,'en_US','Coupon - create JavaScript',NULL,NULL),(1010,'es_ES','Cupón - crear JavaScript',NULL,NULL),(1010,'fr_FR','Code promo - JavaScript création',NULL,NULL),(1010,'it_IT',NULL,NULL,NULL),(1010,'ru_RU','Купон - Создание JavaScript',NULL,NULL),(1011,'cs_CZ',NULL,NULL,NULL),(1011,'de_DE','Taxes - Änderungs-Formular',NULL,NULL),(1011,'en_US','Taxes - update form',NULL,NULL),(1011,'es_ES','Impuestos - formulario de actualización',NULL,NULL),(1011,'fr_FR','Taxes - formulaire de modification',NULL,NULL),(1011,'it_IT',NULL,NULL,NULL),(1011,'ru_RU','Налоги - форма обновления',NULL,NULL),(1012,'cs_CZ',NULL,NULL,NULL),(1012,'de_DE','Taxregel - JavaScript Änderung',NULL,NULL),(1012,'en_US','tax rule - Edit JavaScript',NULL,NULL),(1012,'es_ES','regla de impuesto - Editar JavaScript',NULL,NULL),(1012,'fr_FR','Règle de taxe - Modification de JavaScript',NULL,NULL),(1012,'it_IT','regola fiscale - Modificare JavaScript',NULL,NULL),(1012,'ru_RU','Налоговое правило - Редактирование JavaScript',NULL,NULL),(1013,'cs_CZ',NULL,NULL,NULL),(1013,'de_DE','Tools - oben',NULL,NULL),(1013,'en_US','Tools - at the top',NULL,NULL),(1013,'es_ES','Herramientas - en la parte superior',NULL,NULL),(1013,'fr_FR','Outils - en haut',NULL,NULL),(1013,'it_IT',NULL,NULL,NULL),(1013,'ru_RU','Инструменты - вверху',NULL,NULL),(1014,'cs_CZ',NULL,NULL,NULL),(1014,'de_DE','Tools - oben der Spalte',NULL,NULL),(1014,'en_US','Tools - at the top of the column',NULL,NULL),(1014,'es_ES','Herramientas - en la parte superior de la columna',NULL,NULL),(1014,'fr_FR','Outils - en haut de la colonne',NULL,NULL),(1014,'it_IT',NULL,NULL,NULL),(1014,'ru_RU','Инструменты - вверху колонки',NULL,NULL),(1015,'cs_CZ',NULL,NULL,NULL),(1015,'de_DE','Tools - unten der Spalte 1',NULL,NULL),(1015,'en_US','Tools - at the bottom of column 1',NULL,NULL),(1015,'es_ES','Herramientas - en la parte inferior de la columna 1',NULL,NULL),(1015,'fr_FR','Outils - en bas de la colonne 1',NULL,NULL),(1015,'it_IT',NULL,NULL,NULL),(1015,'ru_RU','Инструменты - внизу колонки 1',NULL,NULL),(1016,'cs_CZ',NULL,NULL,NULL),(1016,'de_DE','Tools - unten',NULL,NULL),(1016,'en_US','Tools - bottom',NULL,NULL),(1016,'es_ES','Herramientas - parte inferior',NULL,NULL),(1016,'fr_FR','Outils - en bas',NULL,NULL),(1016,'it_IT',NULL,NULL,NULL),(1016,'ru_RU','Инструменты - внизу',NULL,NULL),(1017,'cs_CZ',NULL,NULL,NULL),(1017,'de_DE','Tools - JavaScript',NULL,NULL),(1017,'en_US','Tools - JavaScript',NULL,NULL),(1017,'es_ES','Herramientas - JavaScript',NULL,NULL),(1017,'fr_FR','Outils - JavaScript',NULL,NULL),(1017,'it_IT',NULL,NULL,NULL),(1017,'ru_RU','Инструменты - JavaScript',NULL,NULL),(1018,'cs_CZ',NULL,NULL,NULL),(1018,'de_DE','Nachrichten - oben',NULL,NULL),(1018,'en_US','Messages - at the top',NULL,NULL),(1018,'es_ES','Mensajes - al tope',NULL,NULL),(1018,'fr_FR','Messages - en haut',NULL,NULL),(1018,'it_IT',NULL,NULL,NULL),(1018,'ru_RU','Сообщения - вверху',NULL,NULL),(1019,'cs_CZ',NULL,NULL,NULL),(1019,'de_DE','Nachrichten - Tabellenkopf',NULL,NULL),(1019,'en_US','Messages - table header',NULL,NULL),(1019,'es_ES','Mensajes - encabezado de la tabla',NULL,NULL),(1019,'fr_FR','Messages - colonne tableau',NULL,NULL),(1019,'it_IT',NULL,NULL,NULL),(1019,'ru_RU','Сообщения - заголовок таблицы',NULL,NULL),(1020,'cs_CZ',NULL,NULL,NULL),(1020,'de_DE','Nachrichten - Tabellenzeile',NULL,NULL),(1020,'en_US','Messages - table row',NULL,NULL),(1020,'es_ES','Mensajes - fila de la tabla',NULL,NULL),(1020,'fr_FR','Messages - ligne tableau',NULL,NULL),(1020,'it_IT',NULL,NULL,NULL),(1020,'ru_RU','Сообщения - строка таблицы',NULL,NULL),(1021,'cs_CZ',NULL,NULL,NULL),(1021,'de_DE','Nachrichten - unten',NULL,NULL),(1021,'en_US','Messages - bottom',NULL,NULL),(1021,'es_ES','Mensajes - base',NULL,NULL),(1021,'fr_FR','Messages - bas',NULL,NULL),(1021,'it_IT',NULL,NULL,NULL),(1021,'ru_RU','Сообщения - низ',NULL,NULL),(1022,'cs_CZ',NULL,NULL,NULL),(1022,'de_DE','Nachricht - Erstellungsformular',NULL,NULL),(1022,'en_US','Message - create form',NULL,NULL),(1022,'es_ES','Mensaje - formulario de creación',NULL,NULL),(1022,'fr_FR','Message - formulaire de création',NULL,NULL),(1022,'it_IT',NULL,NULL,NULL),(1022,'ru_RU','Сообщения - форма создания',NULL,NULL),(1023,'cs_CZ',NULL,NULL,NULL),(1023,'de_DE','Nachricht - Löschungsformular',NULL,NULL),(1023,'en_US','Message - delete form',NULL,NULL),(1023,'es_ES','Mensaje - formulario de borrado',NULL,NULL),(1023,'fr_FR','Message - formulaire de suppression',NULL,NULL),(1023,'it_IT',NULL,NULL,NULL),(1023,'ru_RU','Сообщения - форма удаления',NULL,NULL),(1024,'cs_CZ',NULL,NULL,NULL),(1024,'de_DE','Nachrichten - JavaScript',NULL,NULL),(1024,'en_US','Messages - JavaScript',NULL,NULL),(1024,'es_ES','Mensajes - JavaScript',NULL,NULL),(1024,'fr_FR','Messages - JavaScript',NULL,NULL),(1024,'it_IT',NULL,NULL,NULL),(1024,'ru_RU','Сообщения - JavaScript',NULL,NULL),(1025,'cs_CZ',NULL,NULL,NULL),(1025,'de_DE','Taxeregeln - oben',NULL,NULL),(1025,'en_US','Taxes rules - at the top',NULL,NULL),(1025,'es_ES','Reglas de impuestos - en la parte superior',NULL,NULL),(1025,'fr_FR','Règles de taxes - en haut',NULL,NULL),(1025,'it_IT',NULL,NULL,NULL),(1025,'ru_RU','Налоговые правила - вверху',NULL,NULL),(1026,'cs_CZ',NULL,NULL,NULL),(1026,'de_DE','Taxeregeln - unten',NULL,NULL),(1026,'en_US','Taxes rules - bottom',NULL,NULL),(1026,'es_ES','Reglas de impuestos - parte inferior',NULL,NULL),(1026,'fr_FR','Règles de taxes - en bas',NULL,NULL),(1026,'it_IT',NULL,NULL,NULL),(1026,'ru_RU','Налоговые правила - внизу',NULL,NULL),(1027,'cs_CZ',NULL,NULL,NULL),(1027,'de_DE','Taxe - Erstellungsformular',NULL,NULL),(1027,'en_US','Tax - create form',NULL,NULL),(1027,'es_ES','Impuesto - formulario de creación',NULL,NULL),(1027,'fr_FR','Taxe - formulaire de création',NULL,NULL),(1027,'it_IT',NULL,NULL,NULL),(1027,'ru_RU','Налог - форма создания',NULL,NULL),(1028,'cs_CZ',NULL,NULL,NULL),(1028,'de_DE','Taxe - Löschungsformular',NULL,NULL),(1028,'en_US','Tax - delete form',NULL,NULL),(1028,'es_ES','Impuesto - formulario de borrado',NULL,NULL),(1028,'fr_FR','Taxe - formulaire de suppression',NULL,NULL),(1028,'it_IT',NULL,NULL,NULL),(1028,'ru_RU','Налог - форма удаления',NULL,NULL),(1029,'cs_CZ',NULL,NULL,NULL),(1029,'de_DE','Taxregel - Erstellungsformular',NULL,NULL),(1029,'en_US','tax rule - create form',NULL,NULL),(1029,'es_ES','regla de impuesto - formulario de creación',NULL,NULL),(1029,'fr_FR','Règle de taxe - formulaire de création',NULL,NULL),(1029,'it_IT',NULL,NULL,NULL),(1029,'ru_RU','Налоговое правило - форма создания',NULL,NULL),(1030,'cs_CZ',NULL,NULL,NULL),(1030,'de_DE','Taxregel - Löschungsformular',NULL,NULL),(1030,'en_US','tax rule - delete form',NULL,NULL),(1030,'es_ES','regla de impuesto - formulario de borrado',NULL,NULL),(1030,'fr_FR','Règle de taxe - formulaire de suppression',NULL,NULL),(1030,'it_IT',NULL,NULL,NULL),(1030,'ru_RU','Налоговое правило - форма удаления',NULL,NULL),(1031,'cs_CZ',NULL,NULL,NULL),(1031,'de_DE','Taxeregeln - JavaScript',NULL,NULL),(1031,'en_US','Taxes rules - JavaScript',NULL,NULL),(1031,'es_ES','Reglas de impuestos - JavaScript',NULL,NULL),(1031,'fr_FR','Règles de taxes - JavaScript',NULL,NULL),(1031,'it_IT',NULL,NULL,NULL),(1031,'ru_RU','Налоговые правила - JavaScript',NULL,NULL),(1032,'cs_CZ',NULL,NULL,NULL),(1032,'de_DE','Exporte - oben',NULL,NULL),(1032,'en_US','Exports - at the top',NULL,NULL),(1032,'es_ES','Exportar - en la parte superior',NULL,NULL),(1032,'fr_FR','Exports - en haut',NULL,NULL),(1032,'it_IT',NULL,NULL,NULL),(1032,'ru_RU','Экспорты - вверху',NULL,NULL),(1033,'cs_CZ',NULL,NULL,NULL),(1033,'de_DE','Exporte - unten einer Kategorie',NULL,NULL),(1033,'en_US','Exports - at the bottom of a category',NULL,NULL),(1033,'es_ES','Exportar - en la parte inferior de una categoría',NULL,NULL),(1033,'fr_FR','Exports - en bas d\'une catégorie',NULL,NULL),(1033,'it_IT',NULL,NULL,NULL),(1033,'ru_RU','Экспорты - внизу категории',NULL,NULL),(1034,'cs_CZ',NULL,NULL,NULL),(1034,'de_DE','Exporte - unten der Spalte 1',NULL,NULL),(1034,'en_US','Exports - at the bottom of column 1',NULL,NULL),(1034,'es_ES','Exportar - en la parte inferior de la columna 1',NULL,NULL),(1034,'fr_FR','Exports - en bas de la colonne 1',NULL,NULL),(1034,'it_IT',NULL,NULL,NULL),(1034,'ru_RU','Экспорты - внизу колонки 1',NULL,NULL),(1035,'cs_CZ',NULL,NULL,NULL),(1035,'de_DE','Exporte - JavaScript',NULL,NULL),(1035,'en_US','Exports - JavaScript',NULL,NULL),(1035,'es_ES','Exportar JavaScript',NULL,NULL),(1035,'fr_FR','Exports - JavaScript',NULL,NULL),(1035,'it_IT',NULL,NULL,NULL),(1035,'ru_RU','Экспорты - JavaScript',NULL,NULL),(1036,'cs_CZ',NULL,NULL,NULL),(1036,'de_DE','Export - JavaScript',NULL,NULL),(1036,'en_US','Export - JavaScript',NULL,NULL),(1036,'es_ES','Exportación - JavaScript',NULL,NULL),(1036,'fr_FR','Export - JavaScript',NULL,NULL),(1036,'it_IT',NULL,NULL,NULL),(1036,'ru_RU','Экспорт - JavaScript',NULL,NULL),(1037,'cs_CZ',NULL,NULL,NULL),(1037,'de_DE','Produkt - Ordner Tabellenkopf',NULL,NULL),(1037,'en_US','Product - folders table header',NULL,NULL),(1037,'es_ES','Producto - encabezado de la tabla de carpetas',NULL,NULL),(1037,'fr_FR','Produit - colonne tableau dossiers',NULL,NULL),(1037,'it_IT',NULL,NULL,NULL),(1037,'ru_RU','Товар - заголовок таблицы папок',NULL,NULL),(1038,'cs_CZ',NULL,NULL,NULL),(1038,'de_DE','Produkt - Ordner Tabellenzeile',NULL,NULL),(1038,'en_US','Product - folders table row',NULL,NULL),(1038,'es_ES','Producto - fila de la tabla de carpetas',NULL,NULL),(1038,'fr_FR','Produit - ligne tableau dossiers',NULL,NULL),(1038,'it_IT',NULL,NULL,NULL),(1038,'ru_RU','Товар - строка таблицы папок',NULL,NULL),(1039,'cs_CZ',NULL,NULL,NULL),(1039,'de_DE','Produkt - Preisedetails Formular',NULL,NULL),(1039,'en_US','Product - details pricing form',NULL,NULL),(1039,'es_ES','Producto - formato de detalles del precio',NULL,NULL),(1039,'fr_FR','Produit - Formulaire détail des prix',NULL,NULL),(1039,'it_IT',NULL,NULL,NULL),(1039,'ru_RU','Товар - форма деталей ценообразования',NULL,NULL),(1040,'cs_CZ',NULL,NULL,NULL),(1040,'de_DE','Produkt - Bestandänderung Formular',NULL,NULL),(1040,'en_US','Product - stock edit form',NULL,NULL),(1040,'es_ES','Producto - Editar formulario de stock',NULL,NULL),(1040,'fr_FR','Produit - formulaire de modification du stock',NULL,NULL),(1040,'it_IT',NULL,NULL,NULL),(1040,'ru_RU','Товар - форма редактирования остатков на складе',NULL,NULL),(1041,'cs_CZ',NULL,NULL,NULL),(1041,'de_DE','Produkt - Sonderangebotdetails Formular',NULL,NULL),(1041,'en_US','Product - details promotion form',NULL,NULL),(1041,'es_ES','Producto - formulario de detalles de la promoción',NULL,NULL),(1041,'fr_FR','Produit - Formulaire détail des promotions',NULL,NULL),(1041,'it_IT',NULL,NULL,NULL),(1041,'ru_RU','Товар - форма деталей продвижения',NULL,NULL),(1042,'cs_CZ',NULL,NULL,NULL),(1042,'de_DE','Produkt - vor den Kombinationen',NULL,NULL),(1042,'en_US','Product - before combinations',NULL,NULL),(1042,'es_ES','Producto - después de las combinaciones',NULL,NULL),(1042,'fr_FR','Produit - avant les déclinaisons',NULL,NULL),(1042,'it_IT',NULL,NULL,NULL),(1042,'ru_RU','Товар - перед комбинациями',NULL,NULL),(1043,'cs_CZ',NULL,NULL,NULL),(1043,'de_DE','Produkt - Kombinationsliste-Bildunterschrift',NULL,NULL),(1043,'en_US','Product - combinations list caption',NULL,NULL),(1043,'es_ES','Producto - título de la lista de combinaciones',NULL,NULL),(1043,'fr_FR','Produit - légende liste des déclinaisons',NULL,NULL),(1043,'it_IT',NULL,NULL,NULL),(1043,'ru_RU','Товар - заголовок списка комбинаций',NULL,NULL),(1044,'cs_CZ',NULL,NULL,NULL),(1044,'de_DE','Produkt - nach den Kombinationen',NULL,NULL),(1044,'en_US','Product - after combinations',NULL,NULL),(1044,'es_ES','Producto - después de las combinaciones',NULL,NULL),(1044,'fr_FR','Produit - après les déclinaisons',NULL,NULL),(1044,'it_IT',NULL,NULL,NULL),(1044,'ru_RU','Товар - после комбинаций',NULL,NULL),(1045,'cs_CZ',NULL,NULL,NULL),(1045,'de_DE','Produkt - Kombinations-Löschungsformular',NULL,NULL),(1045,'en_US','Product - combination delete form',NULL,NULL),(1045,'es_ES','Producto - Formulario para borrar combinaciones',NULL,NULL),(1045,'fr_FR','Produit - formulaire de suppression de combinaison',NULL,NULL),(1045,'it_IT',NULL,NULL,NULL),(1045,'ru_RU','Товар - форма удаления комбинации',NULL,NULL),(1046,'cs_CZ',NULL,NULL,NULL),(1046,'de_DE','Modulen - Tabellenkopf',NULL,NULL),(1046,'en_US','Modules - table header',NULL,NULL),(1046,'es_ES','Módulos - encabezado de la tabla',NULL,NULL),(1046,'fr_FR','Modules - colonne tableau',NULL,NULL),(1046,'it_IT',NULL,NULL,NULL),(1046,'ru_RU','Модули - заголовок таблицы',NULL,NULL),(1047,'cs_CZ',NULL,NULL,NULL),(1047,'de_DE','Modulen - Tabellenzeile',NULL,NULL),(1047,'en_US','Modules - table row',NULL,NULL),(1047,'es_ES','Módulos - fila de la tabla',NULL,NULL),(1047,'fr_FR','Modules - ligne tableau',NULL,NULL),(1047,'it_IT',NULL,NULL,NULL),(1047,'ru_RU','Модули - строка таблицы',NULL,NULL),(1048,'cs_CZ',NULL,NULL,NULL),(1048,'de_DE','Währung - JavaScript Änderung',NULL,NULL),(1048,'en_US','Currency - Edit JavaScript',NULL,NULL),(1048,'es_ES','Divisas - Editar javaScript',NULL,NULL),(1048,'fr_FR','Devise - JavaScript modification',NULL,NULL),(1048,'it_IT',NULL,NULL,NULL),(1048,'ru_RU','Валюта - Редактирование JavaScript',NULL,NULL),(1049,'cs_CZ',NULL,NULL,NULL),(1049,'de_DE','Kategorie - Inhalts Tabellenkopf',NULL,NULL),(1049,'en_US','Category - contents table header',NULL,NULL),(1049,'es_ES','Categoría - encabezado de tabla de contenido',NULL,NULL),(1049,'fr_FR','Catégorie - colonne tableau contenus',NULL,NULL),(1049,'it_IT',NULL,NULL,NULL),(1049,'ru_RU','Категория - заголовок таблицы содержимого',NULL,NULL),(1050,'cs_CZ',NULL,NULL,NULL),(1050,'de_DE','Kategorie - Inhalts Tabellenzeile',NULL,NULL),(1050,'en_US','Category - contents table row',NULL,NULL),(1050,'es_ES','Categoría - fila de la tabla de contenido',NULL,NULL),(1050,'fr_FR','Catégorie - ligne tableau contenus',NULL,NULL),(1050,'it_IT',NULL,NULL,NULL),(1050,'ru_RU','Категория - строка таблицы содержимого',NULL,NULL),(1051,'cs_CZ',NULL,NULL,NULL),(1051,'de_DE','Kategorie - JavaScript Änderung',NULL,NULL),(1051,'en_US','Category - Edit JavaScript',NULL,NULL),(1051,'es_ES','Categoría - edición JavaScript',NULL,NULL),(1051,'fr_FR','Catégorie - JavaScript modification',NULL,NULL),(1051,'it_IT',NULL,NULL,NULL),(1051,'ru_RU','Категория - Редактирование JavaScript',NULL,NULL),(1052,'cs_CZ',NULL,NULL,NULL),(1052,'de_DE','Dokument - JavaScript Änderung',NULL,NULL),(1052,'en_US','Document - Edit JavaScript',NULL,NULL),(1052,'es_ES','Documento - edición JavaScript',NULL,NULL),(1052,'fr_FR','Document - JavaScript modification',NULL,NULL),(1052,'it_IT',NULL,NULL,NULL),(1052,'ru_RU','Документ - Редактирование JavaScript',NULL,NULL),(1053,'cs_CZ',NULL,NULL,NULL),(1053,'de_DE','Kunde - oben',NULL,NULL),(1053,'en_US','Customer - at the top',NULL,NULL),(1053,'es_ES','Cliente - en la cabecera',NULL,NULL),(1053,'fr_FR','Client - en haut',NULL,NULL),(1053,'it_IT',NULL,NULL,NULL),(1053,'ru_RU','Клиент - вверху',NULL,NULL),(1054,'cs_CZ',NULL,NULL,NULL),(1054,'de_DE','Kunden - Bildunterschrift',NULL,NULL),(1054,'en_US','Customers - caption',NULL,NULL),(1054,'es_ES','Clientes - texto',NULL,NULL),(1054,'fr_FR','Clients - légende',NULL,NULL),(1054,'it_IT',NULL,NULL,NULL),(1054,'ru_RU','Клиенты - заглавие',NULL,NULL),(1055,'cs_CZ',NULL,NULL,NULL),(1055,'de_DE','Kunden - Tabellenkopf',NULL,NULL),(1055,'en_US','Customers - header',NULL,NULL),(1055,'es_ES','Clientes - encabezado',NULL,NULL),(1055,'fr_FR','Clients - en-tête',NULL,NULL),(1055,'it_IT',NULL,NULL,NULL),(1055,'ru_RU','Клиенты - заголовок',NULL,NULL),(1056,'cs_CZ',NULL,NULL,NULL),(1056,'de_DE','Kunden - Zeile',NULL,NULL),(1056,'en_US','Customers - row',NULL,NULL),(1056,'es_ES','Clientes - fila',NULL,NULL),(1056,'fr_FR','Clients - ligne',NULL,NULL),(1056,'it_IT',NULL,NULL,NULL),(1056,'ru_RU','Клиенты - строка',NULL,NULL),(1057,'cs_CZ',NULL,NULL,NULL),(1057,'de_DE','Kunde - unten',NULL,NULL),(1057,'en_US','Customer - bottom',NULL,NULL),(1057,'es_ES','Cliente - pie',NULL,NULL),(1057,'fr_FR','Client - bas',NULL,NULL),(1057,'it_IT',NULL,NULL,NULL),(1057,'ru_RU','Клиент - внизу',NULL,NULL),(1058,'cs_CZ',NULL,NULL,NULL),(1058,'de_DE','Kunde - Erstellungsformular',NULL,NULL),(1058,'en_US','Customer - create form',NULL,NULL),(1058,'es_ES','Cliente - formulario creación',NULL,NULL),(1058,'fr_FR','Client - formulaire de création',NULL,NULL),(1058,'it_IT',NULL,NULL,NULL),(1058,'ru_RU','Клиент - форма создания',NULL,NULL),(1059,'cs_CZ',NULL,NULL,NULL),(1059,'de_DE','Kunde - Löschungsformular',NULL,NULL),(1059,'en_US','Customer - delete form',NULL,NULL),(1059,'es_ES','Cliente - formulario eliminación',NULL,NULL),(1059,'fr_FR','Client - formulaire de suppression',NULL,NULL),(1059,'it_IT',NULL,NULL,NULL),(1059,'ru_RU','Клиент - форма удаления',NULL,NULL),(1060,'cs_CZ',NULL,NULL,NULL),(1060,'de_DE','Kunden - JavaScript',NULL,NULL),(1060,'en_US','Customers - JavaScript',NULL,NULL),(1060,'es_ES','Clientes - JavaScript',NULL,NULL),(1060,'fr_FR','Clients - JavaScript',NULL,NULL),(1060,'it_IT',NULL,NULL,NULL),(1060,'ru_RU','Клиенты - JavaScript',NULL,NULL),(1061,'cs_CZ',NULL,NULL,NULL),(1061,'de_DE','Produkt - Inhalte Tabellenkopf',NULL,NULL),(1061,'en_US','Product - contents table header',NULL,NULL),(1061,'es_ES','Producto - contenidos del encabezado de tabla',NULL,NULL),(1061,'fr_FR','Produit - colonne tableau contenus',NULL,NULL),(1061,'it_IT',NULL,NULL,NULL),(1061,'ru_RU','Товар - заголовок таблицы содержимого',NULL,NULL),(1062,'cs_CZ',NULL,NULL,NULL),(1062,'de_DE','Produkt - Inhalte Tabellenzeile',NULL,NULL),(1062,'en_US','Product - contents table row',NULL,NULL),(1062,'es_ES','Producto - contenidos de la fila de la tabla',NULL,NULL),(1062,'fr_FR','Produit - ligne tableau contenus',NULL,NULL),(1062,'it_IT',NULL,NULL,NULL),(1062,'ru_RU','Товар - строка таблицы содержимого',NULL,NULL),(1063,'cs_CZ',NULL,NULL,NULL),(1063,'de_DE','Produkt - Zubehör Tabellenkopf',NULL,NULL),(1063,'en_US','Product - accessories table header',NULL,NULL),(1063,'es_ES','Producto - encabezado de la tabla accesoria',NULL,NULL),(1063,'fr_FR','Produit - colonne tableau accessoires',NULL,NULL),(1063,'it_IT',NULL,NULL,NULL),(1063,'ru_RU','Товар - заголовок таблицы аксессуаров',NULL,NULL),(1064,'cs_CZ',NULL,NULL,NULL),(1064,'de_DE','Produkt - Zubehör Tabellenzeile',NULL,NULL),(1064,'en_US','Product - accessories table row',NULL,NULL),(1064,'es_ES','Producto - fila de la tabla de accesorios',NULL,NULL),(1064,'fr_FR','Produit - ligne tableau accessoires',NULL,NULL),(1064,'it_IT',NULL,NULL,NULL),(1064,'ru_RU','Товар - строка таблицы аксессуаров',NULL,NULL),(1065,'cs_CZ',NULL,NULL,NULL),(1065,'de_DE','Produkt - Kategorien Tabellenkopf',NULL,NULL),(1065,'en_US','Product - categories table header',NULL,NULL),(1065,'es_ES','Producto - encabezado de la tabla de categorías',NULL,NULL),(1065,'fr_FR','Produit - colonne tableau catégories',NULL,NULL),(1065,'it_IT',NULL,NULL,NULL),(1065,'ru_RU','Товар - заголовок таблицы категорий',NULL,NULL),(1066,'cs_CZ',NULL,NULL,NULL),(1066,'de_DE','Produkt - Kategorien Tabellenzeile',NULL,NULL),(1066,'en_US','Product - categories table row',NULL,NULL),(1066,'es_ES','Producto - fila de la tabla de categorías',NULL,NULL),(1066,'fr_FR','Produit - ligne tableau catégories',NULL,NULL),(1066,'it_IT',NULL,NULL,NULL),(1066,'ru_RU','Товар - строка таблицы категорий',NULL,NULL),(1067,'cs_CZ',NULL,NULL,NULL),(1067,'de_DE','Produkt - Deklination Tabellenkopf',NULL,NULL),(1067,'en_US','Product - attributes table header',NULL,NULL),(1067,'es_ES','Producto - encabezado de la tabla de atributos',NULL,NULL),(1067,'fr_FR','Produit - colonne tableau attributs',NULL,NULL),(1067,'it_IT',NULL,NULL,NULL),(1067,'ru_RU','Товар - заголовок таблицы атрибутов',NULL,NULL),(1068,'cs_CZ',NULL,NULL,NULL),(1068,'de_DE','Produkt - Deklination Tabellenzeile',NULL,NULL),(1068,'en_US','Product - attributes table row',NULL,NULL),(1068,'es_ES','Producto - fila de la tabla de atributos',NULL,NULL),(1068,'fr_FR','Produit - ligne tableau attributs',NULL,NULL),(1068,'it_IT',NULL,NULL,NULL),(1068,'ru_RU','Товар - строка таблицы атрибутов',NULL,NULL),(1069,'cs_CZ',NULL,NULL,NULL),(1069,'de_DE','Produkt - Charakteristiken Tabellenkopf',NULL,NULL),(1069,'en_US','Product - features-table-header',NULL,NULL),(1069,'es_ES','Producto - encabezado de la tabla de características',NULL,NULL),(1069,'fr_FR','Produit - colonne tableau caractéristiques',NULL,NULL),(1069,'it_IT',NULL,NULL,NULL),(1069,'ru_RU','Товар - заголовок таблицы характеристик',NULL,NULL),(1070,'cs_CZ',NULL,NULL,NULL),(1070,'de_DE','Produkt - Charakteristiken Tabellenzeile',NULL,NULL),(1070,'en_US','Product - features table row',NULL,NULL),(1070,'es_ES','Producto - fila de la tabla de características',NULL,NULL),(1070,'fr_FR','Produit - ligne tableau caractéristiques',NULL,NULL),(1070,'it_IT',NULL,NULL,NULL),(1070,'ru_RU','Товар - строка таблицы характеристик',NULL,NULL),(1071,'cs_CZ',NULL,NULL,NULL),(1071,'de_DE','Template - Tabellenkopf attributs',NULL,NULL),(1071,'en_US','Template - attributes table header',NULL,NULL),(1071,'es_ES','Plantilla - cabecera de la tabla de atributos',NULL,NULL),(1071,'fr_FR','Gabarit - colonne tableau attributs',NULL,NULL),(1071,'it_IT',NULL,NULL,NULL),(1071,'ru_RU','Шаблон - заголовок таблицы атрибутов',NULL,NULL),(1072,'cs_CZ',NULL,NULL,NULL),(1072,'de_DE','Template - Tabellenzeile attributs',NULL,NULL),(1072,'en_US','Template - attributes table row',NULL,NULL),(1072,'es_ES','Plantilla - fila de la tabla de atributos',NULL,NULL),(1072,'fr_FR','Gabarit - ligne tableau attributs',NULL,NULL),(1072,'it_IT',NULL,NULL,NULL),(1072,'ru_RU','Шаблон - строка таблицы атрибутов',NULL,NULL),(1073,'cs_CZ',NULL,NULL,NULL),(1073,'de_DE','Template - Charakteristiken Tabellenkopf',NULL,NULL),(1073,'en_US','Template - features-table-header',NULL,NULL),(1073,'es_ES','Plantilla - encabezado de tabla de características',NULL,NULL),(1073,'fr_FR','Gabarit - colonne tableau caractéristiques',NULL,NULL),(1073,'it_IT',NULL,NULL,NULL),(1073,'ru_RU','Шаблон - заголовок таблицы характеристик',NULL,NULL),(1074,'cs_CZ',NULL,NULL,NULL),(1074,'de_DE','Template - Charakteristiken Tabellenzeile',NULL,NULL),(1074,'en_US','Template - features table row',NULL,NULL),(1074,'es_ES','Plantilla - fila de la tabla de características',NULL,NULL),(1074,'fr_FR','Gabarit - ligne tableau caractéristiques',NULL,NULL),(1074,'it_IT',NULL,NULL,NULL),(1074,'ru_RU','Шаблон - строка таблицы характеристик',NULL,NULL),(1075,'cs_CZ',NULL,NULL,NULL),(1075,'de_DE','Templates - oben',NULL,NULL),(1075,'en_US','Templates - at the top',NULL,NULL),(1075,'es_ES','Plantillas - en la parte superior',NULL,NULL),(1075,'fr_FR','Gabarits - en haut',NULL,NULL),(1075,'it_IT',NULL,NULL,NULL),(1075,'ru_RU','Шаблоны - вверху',NULL,NULL),(1076,'cs_CZ',NULL,NULL,NULL),(1076,'de_DE','Templates - Tabellenkopf',NULL,NULL),(1076,'en_US','Templates - table header',NULL,NULL),(1076,'es_ES','Plantillas - encabezado de tabla',NULL,NULL),(1076,'fr_FR','Gabarits - colonne tableau',NULL,NULL),(1076,'it_IT',NULL,NULL,NULL),(1076,'ru_RU','Шаблоны - заголовок таблицы',NULL,NULL),(1077,'cs_CZ',NULL,NULL,NULL),(1077,'de_DE','Templates - Tabellenzeile',NULL,NULL),(1077,'en_US','Templates - table row',NULL,NULL),(1077,'es_ES','Plantillas - fila de la tabla',NULL,NULL),(1077,'fr_FR','Gabarits - ligne tableau',NULL,NULL),(1077,'it_IT',NULL,NULL,NULL),(1077,'ru_RU','Шаблоны - строка таблицы',NULL,NULL),(1078,'cs_CZ',NULL,NULL,NULL),(1078,'de_DE','Templates - unten',NULL,NULL),(1078,'en_US','Templates - bottom',NULL,NULL),(1078,'es_ES','Plantillas - parte inferior',NULL,NULL),(1078,'fr_FR','Gabarits - en bas',NULL,NULL),(1078,'it_IT',NULL,NULL,NULL),(1078,'ru_RU','Шаблоны - внизу',NULL,NULL),(1079,'cs_CZ',NULL,NULL,NULL),(1079,'de_DE','Template - Erstellungsformular',NULL,NULL),(1079,'en_US','Template - create form',NULL,NULL),(1079,'es_ES','Plantilla - formulario de creación',NULL,NULL),(1079,'fr_FR','Gabarit - formulaire de création',NULL,NULL),(1079,'it_IT',NULL,NULL,NULL),(1079,'ru_RU','Шаблон - форма создания',NULL,NULL),(1080,'cs_CZ',NULL,NULL,NULL),(1080,'de_DE','Template - Löschungsformular',NULL,NULL),(1080,'en_US','Template - delete form',NULL,NULL),(1080,'es_ES','Plantilla - formulario de borrado',NULL,NULL),(1080,'fr_FR','Gabarit - formulaire de suppression',NULL,NULL),(1080,'it_IT',NULL,NULL,NULL),(1080,'ru_RU','Шаблон - форма удаления',NULL,NULL),(1081,'cs_CZ',NULL,NULL,NULL),(1081,'de_DE','Templates - JavaScript',NULL,NULL),(1081,'en_US','Templates - JavaScript',NULL,NULL),(1081,'es_ES','Plantillas - JavaScript',NULL,NULL),(1081,'fr_FR','Gabarits - JavaScript',NULL,NULL),(1081,'it_IT',NULL,NULL,NULL),(1081,'ru_RU','Шаблоны - JavaScript',NULL,NULL),(1082,'cs_CZ',NULL,NULL,NULL),(1082,'de_DE','Konfiguration - oben',NULL,NULL),(1082,'en_US','Configuration - at the top',NULL,NULL),(1082,'es_ES','Configuración - en la parte superior',NULL,NULL),(1082,'fr_FR','Configuration - en haut',NULL,NULL),(1082,'it_IT',NULL,NULL,NULL),(1082,'ru_RU','Конфигурация - вверху',NULL,NULL),(1083,'cs_CZ',NULL,NULL,NULL),(1083,'de_DE','Konfiguration - oben an dem Katalogsbereich',NULL,NULL),(1083,'en_US','Configuration - at the top of the catalog area',NULL,NULL),(1083,'es_ES','Configuración - en la parte superior de la zona de catálogo',NULL,NULL),(1083,'fr_FR','Configuration - en haut de la zone catalogue',NULL,NULL),(1083,'it_IT',NULL,NULL,NULL),(1083,'ru_RU','Конфигурация - вверху зоны каталога',NULL,NULL),(1084,'cs_CZ',NULL,NULL,NULL),(1084,'de_DE','Konfiguration - unten an dem katalog',NULL,NULL),(1084,'en_US','Configuration - at the bottom of the catalog',NULL,NULL),(1084,'es_ES','Configuración - en la parte inferior del catálogo',NULL,NULL),(1084,'fr_FR','Configuration - en bas du catlogue',NULL,NULL),(1084,'it_IT',NULL,NULL,NULL),(1084,'ru_RU','Конфигурация - внизу каталога',NULL,NULL),(1085,'cs_CZ',NULL,NULL,NULL),(1085,'de_DE','Konfiguration - oben an der Lieferzone',NULL,NULL),(1085,'en_US','Configuration - at the top of the shipping area',NULL,NULL),(1085,'es_ES','Configuración - en la parte superior del área de envío',NULL,NULL),(1085,'fr_FR','Configuration - en haut de la zone livraison',NULL,NULL),(1085,'it_IT',NULL,NULL,NULL),(1085,'ru_RU','Конфигурация - вверху зоны доставки',NULL,NULL),(1086,'cs_CZ',NULL,NULL,NULL),(1086,'de_DE','Konfiguration - unten an der Lieferzone',NULL,NULL),(1086,'en_US','Configuration - at the bottom of the shipping area',NULL,NULL),(1086,'es_ES','Configuración - en la parte inferior de la zona de envío',NULL,NULL),(1086,'fr_FR','Configuration - en bas de la zone livraison',NULL,NULL),(1086,'it_IT',NULL,NULL,NULL),(1086,'ru_RU','Конфигурация - внизу зоны доставки',NULL,NULL),(1087,'cs_CZ',NULL,NULL,NULL),(1087,'de_DE','Konfiguration - oben an dem Systembereich',NULL,NULL),(1087,'en_US','Configuration - at the top of the system area',NULL,NULL),(1087,'es_ES','Configuración - en la parte superior del área del sistema',NULL,NULL),(1087,'fr_FR','Configuration - en haut de la zone système',NULL,NULL),(1087,'it_IT',NULL,NULL,NULL),(1087,'ru_RU','Конфигурация - вверху системной зоны',NULL,NULL),(1088,'cs_CZ',NULL,NULL,NULL),(1088,'de_DE','Konfiguration - unten an dem Systembereich',NULL,NULL),(1088,'en_US','Configuration - at the bottom of the system area',NULL,NULL),(1088,'es_ES','Configuración - en la parte inferior de la zona del sistema',NULL,NULL),(1088,'fr_FR','Configuration - en bas de la zone système',NULL,NULL),(1088,'it_IT',NULL,NULL,NULL),(1088,'ru_RU','Конфигурация - внизу системной зоны',NULL,NULL),(1089,'cs_CZ',NULL,NULL,NULL),(1089,'de_DE','Konfiguration - unten',NULL,NULL),(1089,'en_US','Configuration - bottom',NULL,NULL),(1089,'es_ES','Configuración - parte inferior',NULL,NULL),(1089,'fr_FR','Configuration - bas',NULL,NULL),(1089,'it_IT',NULL,NULL,NULL),(1089,'ru_RU','Конфигурация - внизу',NULL,NULL),(1090,'cs_CZ',NULL,NULL,NULL),(1090,'de_DE','Konfiguration - JavaScript',NULL,NULL),(1090,'en_US','Configuration - JavaScript',NULL,NULL),(1090,'es_ES','Configuración - JavaScript',NULL,NULL),(1090,'fr_FR','Configuration - JavaScript',NULL,NULL),(1090,'it_IT',NULL,NULL,NULL),(1090,'ru_RU','Конфигурация - JavaScript',NULL,NULL),(1091,'cs_CZ',NULL,NULL,NULL),(1091,'de_DE','Dashboard - oben',NULL,NULL),(1091,'en_US','Dashboard - at the top',NULL,NULL),(1091,'es_ES','Dashboard - en la parte superior',NULL,NULL),(1091,'fr_FR','Tableau de bord - en haut',NULL,NULL),(1091,'it_IT',NULL,NULL,NULL),(1091,'ru_RU','Приборная панель - вверху',NULL,NULL),(1092,'cs_CZ',NULL,NULL,NULL),(1092,'de_DE','Dashboard - in der Mitte',NULL,NULL),(1092,'en_US','Dashboard - middle',NULL,NULL),(1092,'es_ES','Dashboard - medio',NULL,NULL),(1092,'fr_FR','Tableau de bord - au milieu',NULL,NULL),(1092,'it_IT',NULL,NULL,NULL),(1092,'ru_RU','Приборная панель - середина',NULL,NULL),(1093,'cs_CZ',NULL,NULL,NULL),(1093,'de_DE','Dashboard - unten',NULL,NULL),(1093,'en_US','Dashboard - bottom',NULL,NULL),(1093,'es_ES','Dashboard - fondo',NULL,NULL),(1093,'fr_FR','Tableau de bord - bas',NULL,NULL),(1093,'it_IT',NULL,NULL,NULL),(1093,'ru_RU','Приборная панель - внизу',NULL,NULL),(1094,'cs_CZ',NULL,NULL,NULL),(1094,'de_DE','Bestellungen - oben',NULL,NULL),(1094,'en_US','Orders - at the top',NULL,NULL),(1094,'es_ES','Pedidos - encabezado',NULL,NULL),(1094,'fr_FR','Commandes - en haut',NULL,NULL),(1094,'it_IT',NULL,NULL,NULL),(1094,'ru_RU','Заказы - вверху',NULL,NULL),(1095,'cs_CZ',NULL,NULL,NULL),(1095,'de_DE','Bestellungen - Tabellenkopf',NULL,NULL),(1095,'en_US','Orders - table header',NULL,NULL),(1095,'es_ES','Pedidos - encabezado de tabla',NULL,NULL),(1095,'fr_FR','Commandes - colonne tableau',NULL,NULL),(1095,'it_IT',NULL,NULL,NULL),(1095,'ru_RU','Заказы - заголовок таблицы',NULL,NULL),(1096,'cs_CZ',NULL,NULL,NULL),(1096,'de_DE','Bestellungen - Tabellenzeile',NULL,NULL),(1096,'en_US','Orders - table row',NULL,NULL),(1096,'es_ES','Pedidos - fila de tabla',NULL,NULL),(1096,'fr_FR','Commandes - ligne tableau',NULL,NULL),(1096,'it_IT',NULL,NULL,NULL),(1096,'ru_RU','Заказы - строка таблицы',NULL,NULL),(1097,'cs_CZ',NULL,NULL,NULL),(1097,'de_DE','Bestellungen - unten',NULL,NULL),(1097,'en_US','Orders - bottom',NULL,NULL),(1097,'es_ES','Pedidos - pie de página',NULL,NULL),(1097,'fr_FR','Commandes - en bas',NULL,NULL),(1097,'it_IT',NULL,NULL,NULL),(1097,'ru_RU','Заказы - внизу',NULL,NULL),(1098,'cs_CZ',NULL,NULL,NULL),(1098,'de_DE','Bestellungen - JavaScript',NULL,NULL),(1098,'en_US','Orders - JavaScript',NULL,NULL),(1098,'es_ES','Pedidos - JavaScript',NULL,NULL),(1098,'fr_FR','Commandes - JavaScript',NULL,NULL),(1098,'it_IT',NULL,NULL,NULL),(1098,'ru_RU','Заказы - JavaScript',NULL,NULL),(1099,'cs_CZ',NULL,NULL,NULL),(1099,'de_DE','Lieferzone - oben',NULL,NULL),(1099,'en_US','Delivery zone - at the top',NULL,NULL),(1099,'es_ES','Zona de entrega - En la cabecera',NULL,NULL),(1099,'fr_FR','Zone de livraison - en haut',NULL,NULL),(1099,'it_IT',NULL,NULL,NULL),(1099,'ru_RU','Зона доставки - вверху',NULL,NULL),(1100,'cs_CZ',NULL,NULL,NULL),(1100,'de_DE','Lieferzone - Tabellenkopf',NULL,NULL),(1100,'en_US','Delivery zone - table header',NULL,NULL),(1100,'es_ES','Zona de entrega - en el encabezado de tabla',NULL,NULL),(1100,'fr_FR','Zone de livraison - colonne tableau',NULL,NULL),(1100,'it_IT',NULL,NULL,NULL),(1100,'ru_RU','Зона доставки - заголовок таблицы',NULL,NULL),(1101,'cs_CZ',NULL,NULL,NULL),(1101,'de_DE','Lieferzone - Tabellenzeile',NULL,NULL),(1101,'en_US','Delivery zone - table row',NULL,NULL),(1101,'es_ES','Zona de entrega - en la fila de la tabla',NULL,NULL),(1101,'fr_FR','Zone de livraison - ligne tableau',NULL,NULL),(1101,'it_IT',NULL,NULL,NULL),(1101,'ru_RU','Зона доставки - строка таблицы',NULL,NULL),(1102,'cs_CZ',NULL,NULL,NULL),(1102,'de_DE','Lieferzone - unten',NULL,NULL),(1102,'en_US','Delivery zone - bottom',NULL,NULL),(1102,'es_ES','Zona de entrega - en el pie',NULL,NULL),(1102,'fr_FR','Zone de livraison - bas',NULL,NULL),(1102,'it_IT',NULL,NULL,NULL),(1102,'ru_RU','Зона доставки - внизу',NULL,NULL),(1103,'cs_CZ',NULL,NULL,NULL),(1103,'de_DE','Lieferzone - JavaScript',NULL,NULL),(1103,'en_US','Delivery zone - JavaScript',NULL,NULL),(1103,'es_ES','Zona de entrega - JavaScript',NULL,NULL),(1103,'fr_FR','Zone de livraison - JavaScript',NULL,NULL),(1103,'it_IT',NULL,NULL,NULL),(1103,'ru_RU','Зона доставки - JavaScript',NULL,NULL),(1104,'cs_CZ',NULL,NULL,NULL),(1104,'de_DE','Inhalt - JavaScript Änderung',NULL,NULL),(1104,'en_US','Content - Edit JavaScript',NULL,NULL),(1104,'es_ES','Contenido - Editar JavaScript',NULL,NULL),(1104,'fr_FR','Contenu - JavaScript modification',NULL,NULL),(1104,'it_IT',NULL,NULL,NULL),(1104,'ru_RU','Контент - Редактирование JavaScript',NULL,NULL),(1105,'cs_CZ',NULL,NULL,NULL),(1105,'de_DE','Accueil - oben',NULL,NULL),(1105,'en_US','Home - at the top',NULL,NULL),(1105,'es_ES','Inicio - en la parte superior',NULL,NULL),(1105,'fr_FR','Accueil - en haut',NULL,NULL),(1105,'it_IT',NULL,NULL,NULL),(1105,'ru_RU','Главная - вверху',NULL,NULL),(1106,'cs_CZ',NULL,NULL,NULL),(1106,'de_DE','Accueil - unten',NULL,NULL),(1106,'en_US','Home - bottom',NULL,NULL),(1106,'es_ES','Inicio - fondo',NULL,NULL),(1106,'fr_FR','Accueil - bas',NULL,NULL),(1106,'it_IT',NULL,NULL,NULL),(1106,'ru_RU','Главная - внизу',NULL,NULL),(1107,'cs_CZ',NULL,NULL,NULL),(1107,'de_DE','Accueil - JavaScript',NULL,NULL),(1107,'en_US','Home - JavaScript',NULL,NULL),(1107,'es_ES','Inicio - JavaScript',NULL,NULL),(1107,'fr_FR','Accueil - JavaScript',NULL,NULL),(1107,'it_IT',NULL,NULL,NULL),(1107,'ru_RU','Главная - JavaScript',NULL,NULL),(1108,'cs_CZ',NULL,NULL,NULL),(1108,'de_DE','Modulen - oben',NULL,NULL),(1108,'en_US','Modules - at the top',NULL,NULL),(1108,'es_ES','Módulos - al inicio',NULL,NULL),(1108,'fr_FR','Modules - en haut',NULL,NULL),(1108,'it_IT',NULL,NULL,NULL),(1108,'ru_RU','Модули - вверху',NULL,NULL),(1109,'cs_CZ',NULL,NULL,NULL),(1109,'de_DE','Modulen - unten',NULL,NULL),(1109,'en_US','Modules - bottom',NULL,NULL),(1109,'es_ES','Módulos - base',NULL,NULL),(1109,'fr_FR','Modules - bas',NULL,NULL),(1109,'it_IT',NULL,NULL,NULL),(1109,'ru_RU','Модули - внизу',NULL,NULL),(1110,'cs_CZ',NULL,NULL,NULL),(1110,'de_DE','Modulen - JavaScript',NULL,NULL),(1110,'en_US','Modules - JavaScript',NULL,NULL),(1110,'es_ES','Módulos - JavaScript',NULL,NULL),(1110,'fr_FR','Modules - JavaScript',NULL,NULL),(1110,'it_IT',NULL,NULL,NULL),(1110,'ru_RU','Модули - JavaScript',NULL,NULL),(1111,'cs_CZ',NULL,NULL,NULL),(1111,'de_DE','Sprachen - oben',NULL,NULL),(1111,'en_US','Languages - at the top',NULL,NULL),(1111,'es_ES','Idiomas - en la parte superior',NULL,NULL),(1111,'fr_FR','Langages - en haut',NULL,NULL),(1111,'it_IT',NULL,NULL,NULL),(1111,'ru_RU','Языки - вверху',NULL,NULL),(1112,'cs_CZ',NULL,NULL,NULL),(1112,'de_DE','Sprachen - unten',NULL,NULL),(1112,'en_US','Languages - bottom',NULL,NULL),(1112,'es_ES','Idiomas - parte inferior',NULL,NULL),(1112,'fr_FR','Langages - bas',NULL,NULL),(1112,'it_IT',NULL,NULL,NULL),(1112,'ru_RU','Языки - внизу',NULL,NULL),(1113,'cs_CZ',NULL,NULL,NULL),(1113,'de_DE','Sprache - Erstellungsformular',NULL,NULL),(1113,'en_US','Language - create form',NULL,NULL),(1113,'es_ES','Idioma - formulario de creación',NULL,NULL),(1113,'fr_FR','Langage - formulaire de création',NULL,NULL),(1113,'it_IT',NULL,NULL,NULL),(1113,'ru_RU','Язык - форма создания',NULL,NULL),(1114,'cs_CZ',NULL,NULL,NULL),(1114,'de_DE','Sprachen - Löschungsformular',NULL,NULL),(1114,'en_US','Languages - delete form',NULL,NULL),(1114,'es_ES','Idiomas - Formulario de borrar',NULL,NULL),(1114,'fr_FR','Langages - formulaire de suppression',NULL,NULL),(1114,'it_IT',NULL,NULL,NULL),(1114,'ru_RU','Языки - форма удаления',NULL,NULL),(1115,'cs_CZ',NULL,NULL,NULL),(1115,'de_DE','Sprachen - JavaScript',NULL,NULL),(1115,'en_US','Languages - JavaScript',NULL,NULL),(1115,'es_ES','Idiomas - JavaScript',NULL,NULL),(1115,'fr_FR','Langages - JavaScript',NULL,NULL),(1115,'it_IT',NULL,NULL,NULL),(1115,'ru_RU','Языки - JavaScript',NULL,NULL),(1116,'cs_CZ',NULL,NULL,NULL),(1116,'de_DE','Zone - Löschungsformular',NULL,NULL),(1116,'en_US','Zone - delete form',NULL,NULL),(1116,'es_ES','Zona - formulario de borrado',NULL,NULL),(1116,'fr_FR','Zone - formulaire de suppression',NULL,NULL),(1116,'it_IT',NULL,NULL,NULL),(1116,'ru_RU','Зона - форма удаления',NULL,NULL),(1117,'cs_CZ',NULL,NULL,NULL),(1117,'de_DE','Lieferzone - JavaScript Änderung',NULL,NULL),(1117,'en_US','Delivery zone - Edit JavaScript',NULL,NULL),(1117,'es_ES','Zona de entrega - Editar JavasCript',NULL,NULL),(1117,'fr_FR','Zone de livraison - JavaScript modification',NULL,NULL),(1117,'it_IT',NULL,NULL,NULL),(1117,'ru_RU','Зона доставки - Редактирование JavaScript',NULL,NULL),(1118,'cs_CZ',NULL,NULL,NULL),(1118,'de_DE','System - JavaScript Logs',NULL,NULL),(1118,'en_US','System - logs JavaScript',NULL,NULL),(1118,'es_ES','Sistema - registros de JavaScript',NULL,NULL),(1118,'fr_FR','Système - logs JavaScript',NULL,NULL),(1118,'it_IT',NULL,NULL,NULL),(1118,'ru_RU','Система - логи JavaScript',NULL,NULL),(1119,'cs_CZ',NULL,NULL,NULL),(1119,'de_DE','Suche - oben',NULL,NULL),(1119,'en_US','Search - at the top',NULL,NULL),(1119,'es_ES','Búsqueda - al inicio',NULL,NULL),(1119,'fr_FR','Recherche - en haut',NULL,NULL),(1119,'it_IT',NULL,NULL,NULL),(1119,'ru_RU','Поиск - вверху',NULL,NULL),(1120,'cs_CZ',NULL,NULL,NULL),(1120,'de_DE','Suche - unten',NULL,NULL),(1120,'en_US','Search - bottom',NULL,NULL),(1120,'es_ES','Búsqueda - base',NULL,NULL),(1120,'fr_FR','Recherche - en bas',NULL,NULL),(1120,'it_IT',NULL,NULL,NULL),(1120,'ru_RU','Поиск - внизу',NULL,NULL),(1121,'cs_CZ',NULL,NULL,NULL),(1121,'de_DE','Suche - JavaScript',NULL,NULL),(1121,'en_US','Search - JavaScript',NULL,NULL),(1121,'es_ES','Búsqueda - JavaScript',NULL,NULL),(1121,'fr_FR','Recherche - JavaScript',NULL,NULL),(1121,'it_IT',NULL,NULL,NULL),(1121,'ru_RU','Поиск - JavaScript',NULL,NULL),(1122,'cs_CZ',NULL,NULL,NULL),(1122,'de_DE','Administratoren - oben',NULL,NULL),(1122,'en_US','Administrators - at the top',NULL,NULL),(1122,'es_ES','Administradores - en la parte superior',NULL,NULL),(1122,'fr_FR','Administateurs - en haut',NULL,NULL),(1122,'it_IT',NULL,NULL,NULL),(1122,'ru_RU','Администраторы - вверху',NULL,NULL),(1123,'cs_CZ',NULL,NULL,NULL),(1123,'de_DE','Administratoren - unten',NULL,NULL),(1123,'en_US','Administrators - bottom',NULL,NULL),(1123,'es_ES','Administradores - inferior',NULL,NULL),(1123,'fr_FR','Administateurs - bas',NULL,NULL),(1123,'it_IT',NULL,NULL,NULL),(1123,'ru_RU','Администраторы - внизу',NULL,NULL),(1124,'cs_CZ',NULL,NULL,NULL),(1124,'de_DE','Administrator - Erstellungsformular',NULL,NULL),(1124,'en_US','Administrator - create form',NULL,NULL),(1124,'es_ES','Administrador - formulario de creación',NULL,NULL),(1124,'fr_FR','Administateur - formulaire de création',NULL,NULL),(1124,'it_IT',NULL,NULL,NULL),(1124,'ru_RU','Администратор - форма создания',NULL,NULL),(1125,'cs_CZ',NULL,NULL,NULL),(1125,'de_DE','Administrator - Änderungsformular',NULL,NULL),(1125,'en_US','Administrator - update form',NULL,NULL),(1125,'es_ES','Administrador - formulario de actualización',NULL,NULL),(1125,'fr_FR','Administateur - formulaire de modification',NULL,NULL),(1125,'it_IT',NULL,NULL,NULL),(1125,'ru_RU','Администратор - форма обновления',NULL,NULL),(1126,'cs_CZ',NULL,NULL,NULL),(1126,'de_DE','Administrator - Löschungsformular',NULL,NULL),(1126,'en_US','Administrator - delete form',NULL,NULL),(1126,'es_ES','Administrador - formulario de eliminación',NULL,NULL),(1126,'fr_FR','Administateur - formulaire de suppression',NULL,NULL),(1126,'it_IT',NULL,NULL,NULL),(1126,'ru_RU','Администратор - форма удаления',NULL,NULL),(1127,'cs_CZ',NULL,NULL,NULL),(1127,'de_DE','Administratoren - JavaScript',NULL,NULL),(1127,'en_US','Administrators - JavaScript',NULL,NULL),(1127,'es_ES','Administradores - JavaScript',NULL,NULL),(1127,'fr_FR','Administateurs - JavaScript',NULL,NULL),(1127,'it_IT',NULL,NULL,NULL),(1127,'ru_RU','Администраторы - JavaScript',NULL,NULL),(1128,'cs_CZ',NULL,NULL,NULL),(1128,'de_DE','Modul Hook - JavaScript Änderung',NULL,NULL),(1128,'en_US','Module hook - Edit JavaScript',NULL,NULL),(1128,'es_ES',NULL,NULL,NULL),(1128,'fr_FR','Module hook - Modification de JavaScript',NULL,NULL),(1128,'it_IT',NULL,NULL,NULL),(1128,'ru_RU','Хук модуля - Редактирование JavaScript',NULL,NULL),(1129,'cs_CZ',NULL,NULL,NULL),(1129,'de_DE','Versandkonfiguration - oben',NULL,NULL),(1129,'en_US','Shipping configuration - at the top',NULL,NULL),(1129,'es_ES','Configuración de envío - al inicio',NULL,NULL),(1129,'fr_FR','Configuration du transport - en haut',NULL,NULL),(1129,'it_IT',NULL,NULL,NULL),(1129,'ru_RU','Конфигурация доставки - вверху',NULL,NULL),(1130,'cs_CZ',NULL,NULL,NULL),(1130,'de_DE','Versandkonfiguration - Tabellenkopf',NULL,NULL),(1130,'en_US','Shipping configuration - table header',NULL,NULL),(1130,'es_ES','Configuración de envío - encabezado de tabla',NULL,NULL),(1130,'fr_FR','Configuration du transport - colonne tableau',NULL,NULL),(1130,'it_IT',NULL,NULL,NULL),(1130,'ru_RU','Конфигурация доставки - заголовок таблицы',NULL,NULL),(1131,'cs_CZ',NULL,NULL,NULL),(1131,'de_DE','Versandkonfiguration - Tabellenzeile',NULL,NULL),(1131,'en_US','Shipping configuration - table row',NULL,NULL),(1131,'es_ES','Configuración de envío - fila de tabla',NULL,NULL),(1131,'fr_FR','Configuration du transport - ligne tableau',NULL,NULL),(1131,'it_IT',NULL,NULL,NULL),(1131,'ru_RU','Конфигурация доставки - строка таблицы',NULL,NULL),(1132,'cs_CZ',NULL,NULL,NULL),(1132,'de_DE','Versandkonfiguration - unten',NULL,NULL),(1132,'en_US','Shipping configuration - bottom',NULL,NULL),(1132,'es_ES','Configuración de envío - base',NULL,NULL),(1132,'fr_FR','Configuration du transport - en bas',NULL,NULL),(1132,'it_IT',NULL,NULL,NULL),(1132,'ru_RU','Конфигурация доставки - внизу',NULL,NULL),(1133,'cs_CZ',NULL,NULL,NULL),(1133,'de_DE','Versandkonfiguration - Erstellungsformular',NULL,NULL),(1133,'en_US','Shipping configuration - create form',NULL,NULL),(1133,'es_ES','Configuración de envío - formulario de creación',NULL,NULL),(1133,'fr_FR','Configuration du transport - formulaire de création',NULL,NULL),(1133,'it_IT',NULL,NULL,NULL),(1133,'ru_RU','Конфигурация доставки - форма создания',NULL,NULL),(1134,'cs_CZ',NULL,NULL,NULL),(1134,'de_DE','Versandkonfiguration - Löschungsformular',NULL,NULL),(1134,'en_US','Shipping configuration - delete form',NULL,NULL),(1134,'es_ES','Configuración de envío - formulario de borrado',NULL,NULL),(1134,'fr_FR','Configuration du transport - formulaire de suppression',NULL,NULL),(1134,'it_IT',NULL,NULL,NULL),(1134,'ru_RU','Конфигурация доставки - форма удаления',NULL,NULL),(1135,'cs_CZ',NULL,NULL,NULL),(1135,'de_DE','Versandkonfiguration - JavaScript',NULL,NULL),(1135,'en_US','Shipping configuration - JavaScript',NULL,NULL),(1135,'es_ES','Configuración de envío - JavaScript',NULL,NULL),(1135,'fr_FR','Configuration du transport - JavaScript',NULL,NULL),(1135,'it_IT',NULL,NULL,NULL),(1135,'ru_RU','Конфигурация доставки - JavaScript',NULL,NULL),(1136,'cs_CZ',NULL,NULL,NULL),(1136,'de_DE','Karakteristiken - oben',NULL,NULL),(1136,'en_US','Features - at the top',NULL,NULL),(1136,'es_ES','Característica - ir arriba',NULL,NULL),(1136,'fr_FR','Caractéristiques - en haut',NULL,NULL),(1136,'it_IT',NULL,NULL,NULL),(1136,'ru_RU','Характеристики - вверху',NULL,NULL),(1137,'cs_CZ',NULL,NULL,NULL),(1137,'de_DE','Karakteristiken - Tabellenkopf',NULL,NULL),(1137,'en_US','Features - table header',NULL,NULL),(1137,'es_ES','Característica - Encabezado de tabla',NULL,NULL),(1137,'fr_FR','Caractéristiques - colonne tableau',NULL,NULL),(1137,'it_IT',NULL,NULL,NULL),(1137,'ru_RU','Характеристики - заголовок таблицы',NULL,NULL),(1138,'cs_CZ',NULL,NULL,NULL),(1138,'de_DE','Karakteristiken - Tabellenzeile',NULL,NULL),(1138,'en_US','Features - table row',NULL,NULL),(1138,'es_ES','Característica - Fila de tabla',NULL,NULL),(1138,'fr_FR','Caractéristiques - ligne tableau',NULL,NULL),(1138,'it_IT',NULL,NULL,NULL),(1138,'ru_RU','Характеристики - строка таблицы',NULL,NULL),(1139,'cs_CZ',NULL,NULL,NULL),(1139,'de_DE','Karakteristiken - unten',NULL,NULL),(1139,'en_US','Features - bottom',NULL,NULL),(1139,'es_ES','Característica - inferior',NULL,NULL),(1139,'fr_FR','Caractéristiques - bas',NULL,NULL),(1139,'it_IT',NULL,NULL,NULL),(1139,'ru_RU','Характеристики - внизу',NULL,NULL),(1140,'cs_CZ',NULL,NULL,NULL),(1140,'de_DE','Karakteristik - Erstellungsformular',NULL,NULL),(1140,'en_US','Feature - create form',NULL,NULL),(1140,'es_ES','Característica - formulario crear',NULL,NULL),(1140,'fr_FR','Caractéristique - formulaire de création',NULL,NULL),(1140,'it_IT',NULL,NULL,NULL),(1140,'ru_RU','Характеристика - форма создания',NULL,NULL),(1141,'cs_CZ',NULL,NULL,NULL),(1141,'de_DE','Karakteristik - Löschungsformular',NULL,NULL),(1141,'en_US','Feature - delete form',NULL,NULL),(1141,'es_ES','Característica - formulario borrar',NULL,NULL),(1141,'fr_FR','Caractéristique - formulaire de suppression',NULL,NULL),(1141,'it_IT',NULL,NULL,NULL),(1141,'ru_RU','Характеристика - форма удаления',NULL,NULL),(1142,'cs_CZ',NULL,NULL,NULL),(1142,'de_DE','Karakteristik - zu allen hinzufügen Formular',NULL,NULL),(1142,'en_US','Feature - add to all form',NULL,NULL),(1142,'es_ES','Característica - Agregar a todos los formularios',NULL,NULL),(1142,'fr_FR','Caractéristique - formulaire ajouter à tous',NULL,NULL),(1142,'it_IT',NULL,NULL,NULL),(1142,'ru_RU','Характеристика - форма добавить все',NULL,NULL),(1143,'cs_CZ',NULL,NULL,NULL),(1143,'de_DE','Karakteristik - multipel Löschungsformular',NULL,NULL),(1143,'en_US','Feature - remove to all form',NULL,NULL),(1143,'es_ES','Característica - eliminar todos los formularios',NULL,NULL),(1143,'fr_FR','Caractéristique - formulaire de suppression multiple',NULL,NULL),(1143,'it_IT',NULL,NULL,NULL),(1143,'ru_RU','Характеристика - форма удалить все',NULL,NULL),(1144,'cs_CZ',NULL,NULL,NULL),(1144,'de_DE','Karakteristiken - JavaScript',NULL,NULL),(1144,'en_US','Features - JavaScript',NULL,NULL),(1144,'es_ES','Característica - JavaScript',NULL,NULL),(1144,'fr_FR','Caractéristiques - JavaScript',NULL,NULL),(1144,'it_IT',NULL,NULL,NULL),(1144,'ru_RU','Характеристики - JavaScript',NULL,NULL),(1145,'cs_CZ',NULL,NULL,NULL),(1145,'de_DE','Modul - JavaScript Änderung',NULL,NULL),(1145,'en_US','Module - Edit JavaScript',NULL,NULL),(1145,'es_ES','Módulo - Editar JavaScript',NULL,NULL),(1145,'fr_FR','Module - Modification de JavaScript',NULL,NULL),(1145,'it_IT',NULL,NULL,NULL),(1145,'ru_RU','Модуль - Редактирование JavaScript',NULL,NULL),(1146,'cs_CZ',NULL,NULL,NULL),(1146,'de_DE','Modul Hook - Erstellungsformular',NULL,NULL),(1146,'en_US','Module hook - create form',NULL,NULL),(1146,'es_ES',NULL,NULL,NULL),(1146,'fr_FR','Module hook - formulaire de création',NULL,NULL),(1146,'it_IT',NULL,NULL,NULL),(1146,'ru_RU','Хук модуля - форма создания',NULL,NULL),(1147,'cs_CZ',NULL,NULL,NULL),(1147,'de_DE','Modul Hook - Löschungsformular',NULL,NULL),(1147,'en_US','Module hook - delete form',NULL,NULL),(1147,'es_ES',NULL,NULL,NULL),(1147,'fr_FR','Module hook - formulaire de suppression',NULL,NULL),(1147,'it_IT',NULL,NULL,NULL),(1147,'ru_RU','Хук модуля - форма удаления',NULL,NULL),(1148,'cs_CZ',NULL,NULL,NULL),(1148,'de_DE','Modul Hook - JavaScript',NULL,NULL),(1148,'en_US','Module hook - JavaScript',NULL,NULL),(1148,'es_ES',NULL,NULL,NULL),(1148,'fr_FR','Point d\'accroche des modules - Javascript',NULL,NULL),(1148,'it_IT',NULL,NULL,NULL),(1148,'ru_RU','Хук модуля - JavaScript',NULL,NULL),(1149,'cs_CZ',NULL,NULL,NULL),(1149,'de_DE','Versandkonfiguration - Änderung',NULL,NULL),(1149,'en_US','Shipping configuration - Edit',NULL,NULL),(1149,'es_ES','Configuración de envío - Editar',NULL,NULL),(1149,'fr_FR','Configuration du transport - Modification',NULL,NULL),(1149,'it_IT',NULL,NULL,NULL),(1149,'ru_RU','Конфигурация доставки - Edit',NULL,NULL),(1150,'cs_CZ',NULL,NULL,NULL),(1150,'de_DE','Versandkonfiguration - Länder Löschungsfomular',NULL,NULL),(1150,'en_US','Shipping configuration - country delete form',NULL,NULL),(1150,'es_ES','Configuración de envío - formulario de borrado de país',NULL,NULL),(1150,'fr_FR','Configuration du transport - formulaire de suppression de pays',NULL,NULL),(1150,'it_IT',NULL,NULL,NULL),(1150,'ru_RU','Конфигурация доставки - форма удаления страны',NULL,NULL),(1151,'cs_CZ',NULL,NULL,NULL),(1151,'de_DE','Versandkonfiguration - JavaScript Änderung',NULL,NULL),(1151,'en_US','Shipping configuration - Edit JavaScript',NULL,NULL),(1151,'es_ES','Configuración de envío - Editar JavaScript',NULL,NULL),(1151,'fr_FR','Configuration du transport - Modification de JavaScript',NULL,NULL),(1151,'it_IT',NULL,NULL,NULL),(1151,'ru_RU','Конфигурация доставки - Редактирование JavaScript',NULL,NULL),(1152,'cs_CZ',NULL,NULL,NULL),(1152,'de_DE','E-Mail Sendung - oben',NULL,NULL),(1152,'en_US','Mailing system - at the top',NULL,NULL),(1152,'es_ES','Sistema de correo - en la parte superior',NULL,NULL),(1152,'fr_FR','Envoi des e-mails - en haut',NULL,NULL),(1152,'it_IT',NULL,NULL,NULL),(1152,'ru_RU','Система отправки почты - вверху',NULL,NULL),(1153,'cs_CZ',NULL,NULL,NULL),(1153,'de_DE','E-Mail Sendung - unten',NULL,NULL),(1153,'en_US','Mailing system - bottom',NULL,NULL),(1153,'es_ES','Sistema de correo - fondo',NULL,NULL),(1153,'fr_FR','Envoi des e-mails - en bas',NULL,NULL),(1153,'it_IT',NULL,NULL,NULL),(1153,'ru_RU','Система отправки почты - внизу',NULL,NULL),(1154,'cs_CZ',NULL,NULL,NULL),(1154,'de_DE','E-Mail Sendung - JavaScript',NULL,NULL),(1154,'en_US','Mailing system - JavaScript',NULL,NULL),(1154,'es_ES','Sistema de correo - JavaScript',NULL,NULL),(1154,'fr_FR','Envoi des e-mails - JavaScript',NULL,NULL),(1154,'it_IT',NULL,NULL,NULL),(1154,'ru_RU','Система отправки почты - JavaScript',NULL,NULL),(1155,'cs_CZ',NULL,NULL,NULL),(1155,'de_DE','Kategorien - oben',NULL,NULL),(1155,'en_US','Categories - at the top',NULL,NULL),(1155,'es_ES','Categorías - en la parte superior',NULL,NULL),(1155,'fr_FR','Catégories - en haut',NULL,NULL),(1155,'it_IT',NULL,NULL,NULL),(1155,'ru_RU','Категории - вверху',NULL,NULL),(1156,'cs_CZ',NULL,NULL,NULL),(1156,'de_DE','Kategorien - Bildunterschrift',NULL,NULL),(1156,'en_US','Categories - caption',NULL,NULL),(1156,'es_ES','Categorías - título',NULL,NULL),(1156,'fr_FR','Catégories - légende',NULL,NULL),(1156,'it_IT',NULL,NULL,NULL),(1156,'ru_RU','Категории - заглавие',NULL,NULL),(1157,'cs_CZ',NULL,NULL,NULL),(1157,'de_DE','Kategorien - Kopfzeile',NULL,NULL),(1157,'en_US','Categories - header',NULL,NULL),(1157,'es_ES','Categorías - header',NULL,NULL),(1157,'fr_FR','Catégories - en-tête',NULL,NULL),(1157,'it_IT',NULL,NULL,NULL),(1157,'ru_RU','Категории - заголовок',NULL,NULL),(1158,'cs_CZ',NULL,NULL,NULL),(1158,'de_DE','Kategorien - Zeile',NULL,NULL),(1158,'en_US','Categories - row',NULL,NULL),(1158,'es_ES','Categorías - fila',NULL,NULL),(1158,'fr_FR','Catégories - ligne',NULL,NULL),(1158,'it_IT',NULL,NULL,NULL),(1158,'ru_RU','Категории - строка',NULL,NULL),(1159,'cs_CZ',NULL,NULL,NULL),(1159,'de_DE','Produkte - Bildunterschrift',NULL,NULL),(1159,'en_US','Products - caption',NULL,NULL),(1159,'es_ES','Productos - leyenda',NULL,NULL),(1159,'fr_FR','Produits - légende',NULL,NULL),(1159,'it_IT',NULL,NULL,NULL),(1159,'ru_RU','Товары - заглавие',NULL,NULL),(1160,'cs_CZ',NULL,NULL,NULL),(1160,'de_DE','Produkte - Header',NULL,NULL),(1160,'en_US','Products - header',NULL,NULL),(1160,'es_ES','Productos - encabezado',NULL,NULL),(1160,'fr_FR','Produits - en-tête',NULL,NULL),(1160,'it_IT',NULL,NULL,NULL),(1160,'ru_RU','Товары - заголовок',NULL,NULL),(1161,'cs_CZ',NULL,NULL,NULL),(1161,'de_DE','Produkte - Zeile',NULL,NULL),(1161,'en_US','Products - row',NULL,NULL),(1161,'es_ES','Productos - fila',NULL,NULL),(1161,'fr_FR','Produits - ligne',NULL,NULL),(1161,'it_IT',NULL,NULL,NULL),(1161,'ru_RU','Товары - строка',NULL,NULL),(1162,'cs_CZ',NULL,NULL,NULL),(1162,'de_DE','Kategorien - unten',NULL,NULL),(1162,'en_US','Categories - bottom',NULL,NULL),(1162,'es_ES','Categorías - inferior',NULL,NULL),(1162,'fr_FR','Catégories - bas',NULL,NULL),(1162,'it_IT',NULL,NULL,NULL),(1162,'ru_RU','Категории - внизу',NULL,NULL),(1163,'cs_CZ',NULL,NULL,NULL),(1163,'de_DE','Kategorien - unten an dem Katalog',NULL,NULL),(1163,'en_US','Categories - at the bottom of the catalog',NULL,NULL),(1163,'es_ES','Categorías - en la parte inferior del catálogo',NULL,NULL),(1163,'fr_FR','Catégories - en bas du catalogue',NULL,NULL),(1163,'it_IT',NULL,NULL,NULL),(1163,'ru_RU','Категории - внизу каталога',NULL,NULL),(1164,'cs_CZ',NULL,NULL,NULL),(1164,'de_DE','Kategorie - Erstellungsformular',NULL,NULL),(1164,'en_US','Category - create form',NULL,NULL),(1164,'es_ES','Formulario de creación de la categoría-',NULL,NULL),(1164,'fr_FR','Catégorie - formulaire de création',NULL,NULL),(1164,'it_IT',NULL,NULL,NULL),(1164,'ru_RU','Категория - форма создания',NULL,NULL),(1165,'cs_CZ',NULL,NULL,NULL),(1165,'de_DE','Produkt - Erstellungsformular',NULL,NULL),(1165,'en_US','Product - create form',NULL,NULL),(1165,'es_ES','Producto - formulario de creación',NULL,NULL),(1165,'fr_FR','Produit - formulaire de création',NULL,NULL),(1165,'it_IT',NULL,NULL,NULL),(1165,'ru_RU','Товар - форма создания',NULL,NULL),(1166,'cs_CZ',NULL,NULL,NULL),(1166,'de_DE','Kategorie - Löschungsformular',NULL,NULL),(1166,'en_US','Category - delete form',NULL,NULL),(1166,'es_ES','Categoría - formulario de eliminación',NULL,NULL),(1166,'fr_FR','Catégorie - formulaire de suppression',NULL,NULL),(1166,'it_IT',NULL,NULL,NULL),(1166,'ru_RU','Категория - форма удаления',NULL,NULL),(1167,'cs_CZ',NULL,NULL,NULL),(1167,'de_DE','Produkt - Löschungsformular',NULL,NULL),(1167,'en_US','Product - delete form',NULL,NULL),(1167,'es_ES','Producto - formulario de borrado',NULL,NULL),(1167,'fr_FR','Produit - formulaire de suppression',NULL,NULL),(1167,'it_IT',NULL,NULL,NULL),(1167,'ru_RU','Товар - форма удаления',NULL,NULL),(1168,'cs_CZ',NULL,NULL,NULL),(1168,'de_DE','Kategorien - JavaScript',NULL,NULL),(1168,'en_US','Categories - JavaScript',NULL,NULL),(1168,'es_ES','Categorías - JavaScript',NULL,NULL),(1168,'fr_FR','Catégories - JavaScript',NULL,NULL),(1168,'it_IT',NULL,NULL,NULL),(1168,'ru_RU','Категории - JavaScript',NULL,NULL),(1169,'cs_CZ',NULL,NULL,NULL),(1169,'de_DE','Variablen - oben',NULL,NULL),(1169,'en_US','Variables - at the top',NULL,NULL),(1169,'es_ES','Variables - en la parte superior',NULL,NULL),(1169,'fr_FR','Variables - en haut',NULL,NULL),(1169,'it_IT',NULL,NULL,NULL),(1169,'ru_RU','Переменные - вверху',NULL,NULL),(1170,'cs_CZ',NULL,NULL,NULL),(1170,'de_DE','Variablen - Tabellenkopf',NULL,NULL),(1170,'en_US','Variables - table header',NULL,NULL),(1170,'es_ES','Variables - encabezado de tabla',NULL,NULL),(1170,'fr_FR','Variables - colonne tableau',NULL,NULL),(1170,'it_IT',NULL,NULL,NULL),(1170,'ru_RU','Переменные - заголовок таблицы',NULL,NULL),(1171,'cs_CZ',NULL,NULL,NULL),(1171,'de_DE','Variablen - Tabellenzeile',NULL,NULL),(1171,'en_US','Variables - table row',NULL,NULL),(1171,'es_ES','Variables - fila de la tabla',NULL,NULL),(1171,'fr_FR','Variables - ligne tableau',NULL,NULL),(1171,'it_IT',NULL,NULL,NULL),(1171,'ru_RU','Переменные - строка таблицы',NULL,NULL),(1172,'cs_CZ',NULL,NULL,NULL),(1172,'de_DE','Variablen - unten',NULL,NULL),(1172,'en_US','Variables - bottom',NULL,NULL),(1172,'es_ES','Variables - parte inferior',NULL,NULL),(1172,'fr_FR','Variables - en bas',NULL,NULL),(1172,'it_IT',NULL,NULL,NULL),(1172,'ru_RU','Переменные - внизу',NULL,NULL),(1173,'cs_CZ',NULL,NULL,NULL),(1173,'de_DE','Variable - Erstellungsformular',NULL,NULL),(1173,'en_US','Variable - create form',NULL,NULL),(1173,'es_ES','Variable - formulario de creación',NULL,NULL),(1173,'fr_FR','Variable - formulaire de création',NULL,NULL),(1173,'it_IT',NULL,NULL,NULL),(1173,'ru_RU','Переменная - форма создания',NULL,NULL),(1174,'cs_CZ',NULL,NULL,NULL),(1174,'de_DE','Variable - Löschungsformular',NULL,NULL),(1174,'en_US','Variable - delete form',NULL,NULL),(1174,'es_ES','Variable - formulario de borrado',NULL,NULL),(1174,'fr_FR','Variable - formulaire de suppression',NULL,NULL),(1174,'it_IT',NULL,NULL,NULL),(1174,'ru_RU','Переменная - форма удаления',NULL,NULL),(1175,'cs_CZ',NULL,NULL,NULL),(1175,'de_DE','Variablen - JavaScript',NULL,NULL),(1175,'en_US','Variables - JavaScript',NULL,NULL),(1175,'es_ES','Variables - JavaScript',NULL,NULL),(1175,'fr_FR','Variables - JavaScript',NULL,NULL),(1175,'it_IT',NULL,NULL,NULL),(1175,'ru_RU','Переменные - JavaScript',NULL,NULL),(1176,'cs_CZ',NULL,NULL,NULL),(1176,'de_DE','Bestellung - Produktliste',NULL,NULL),(1176,'en_US','Order - product list',NULL,NULL),(1176,'es_ES','Orden - lista de productos',NULL,NULL),(1176,'fr_FR','Commande - liste produit',NULL,NULL),(1176,'it_IT',NULL,NULL,NULL),(1176,'ru_RU','Заказ - список товаров',NULL,NULL),(1177,'cs_CZ',NULL,NULL,NULL),(1177,'de_DE','Bestellung - JavaScript Änderung',NULL,NULL),(1177,'en_US','Order - Edit JavaScript',NULL,NULL),(1177,'es_ES','Orden - editar JavaScript',NULL,NULL),(1177,'fr_FR','Commande - Modification de JavaScript',NULL,NULL),(1177,'it_IT',NULL,NULL,NULL),(1177,'ru_RU','Заказ - Редактирование JavaScript',NULL,NULL),(1178,'cs_CZ',NULL,NULL,NULL),(1178,'de_DE','Shop Informationen - JavaScript',NULL,NULL),(1178,'en_US','Store Information - JavaScript',NULL,NULL),(1178,'es_ES','Información de tienda - JavaScript',NULL,NULL),(1178,'fr_FR','Information boutique - JavaScript',NULL,NULL),(1178,'it_IT',NULL,NULL,NULL),(1178,'ru_RU','Информация о магазине - JavaScript',NULL,NULL),(1179,'cs_CZ',NULL,NULL,NULL),(1179,'de_DE','Übersetzungen - JavaScript',NULL,NULL),(1179,'en_US','Translations - JavaScript',NULL,NULL),(1179,'es_ES','Traducciones - JavaScript',NULL,NULL),(1179,'fr_FR','Traductions - JavaScript',NULL,NULL),(1179,'it_IT',NULL,NULL,NULL),(1179,'ru_RU','Переводы - JavaScript',NULL,NULL),(1180,'cs_CZ',NULL,NULL,NULL),(1180,'de_DE','Ordner - oben',NULL,NULL),(1180,'en_US','Folder - at the top',NULL,NULL),(1180,'es_ES','Carpeta - ir arriba',NULL,NULL),(1180,'fr_FR','Dossiers - en haut',NULL,NULL),(1180,'it_IT',NULL,NULL,NULL),(1180,'ru_RU','Папка - вверху',NULL,NULL),(1181,'cs_CZ',NULL,NULL,NULL),(1181,'de_DE','Ordner - Bildunterschrift',NULL,NULL),(1181,'en_US','Folder - caption',NULL,NULL),(1181,'es_ES','Carpeta - título',NULL,NULL),(1181,'fr_FR','Dossiers - légende',NULL,NULL),(1181,'it_IT',NULL,NULL,NULL),(1181,'ru_RU','Папка - заглавие',NULL,NULL),(1182,'cs_CZ',NULL,NULL,NULL),(1182,'de_DE','Ordner - Header',NULL,NULL),(1182,'en_US','Folder - header',NULL,NULL),(1182,'es_ES','Carpeta - encabezado',NULL,NULL),(1182,'fr_FR','Dossiers - en-tête',NULL,NULL),(1182,'it_IT',NULL,NULL,NULL),(1182,'ru_RU','Папка - заголовок',NULL,NULL),(1183,'cs_CZ',NULL,NULL,NULL),(1183,'de_DE','Ordner - Zeile',NULL,NULL),(1183,'en_US','Folder - row',NULL,NULL),(1183,'es_ES','Carpeta - fila',NULL,NULL),(1183,'fr_FR','Dossiers - ligne',NULL,NULL),(1183,'it_IT',NULL,NULL,NULL),(1183,'ru_RU','Папка - строка',NULL,NULL),(1184,'cs_CZ',NULL,NULL,NULL),(1184,'de_DE','Inhalte - Bildunterschrift',NULL,NULL),(1184,'en_US','Contents - caption',NULL,NULL),(1184,'es_ES','Contenido - leyenda',NULL,NULL),(1184,'fr_FR','Contenus - légende',NULL,NULL),(1184,'it_IT',NULL,NULL,NULL),(1184,'ru_RU','Контенты - заглавие',NULL,NULL),(1185,'cs_CZ',NULL,NULL,NULL),(1185,'de_DE','Inhalte - Kopfzeile',NULL,NULL),(1185,'en_US','Contents - header',NULL,NULL),(1185,'es_ES','Contenido - encabezado',NULL,NULL),(1185,'fr_FR','Contenus - en-tête',NULL,NULL),(1185,'it_IT',NULL,NULL,NULL),(1185,'ru_RU','Контенты - заголовок',NULL,NULL),(1186,'cs_CZ',NULL,NULL,NULL),(1186,'de_DE','Inhalte - Zeile',NULL,NULL),(1186,'en_US','Contents - row',NULL,NULL),(1186,'es_ES','Contenido - fila',NULL,NULL),(1186,'fr_FR','Contenus - ligne',NULL,NULL),(1186,'it_IT',NULL,NULL,NULL),(1186,'ru_RU','Контенты - строка',NULL,NULL),(1187,'cs_CZ',NULL,NULL,NULL),(1187,'de_DE','Ordner - unten',NULL,NULL),(1187,'en_US','Folder - bottom',NULL,NULL),(1187,'es_ES','Carpeta - abajo',NULL,NULL),(1187,'fr_FR','Dossiers - bas',NULL,NULL),(1187,'it_IT',NULL,NULL,NULL),(1187,'ru_RU','Папка - внизу',NULL,NULL),(1188,'cs_CZ',NULL,NULL,NULL),(1188,'de_DE','Ordner - Erstellungsformular',NULL,NULL),(1188,'en_US','Folder - create form',NULL,NULL),(1188,'es_ES',NULL,NULL,NULL),(1188,'fr_FR','Dossier - formulaire de création',NULL,NULL),(1188,'it_IT',NULL,NULL,NULL),(1188,'ru_RU','Папка - форма создания',NULL,NULL),(1189,'cs_CZ',NULL,NULL,NULL),(1189,'de_DE','Inhalt - Erstellungsformular',NULL,NULL),(1189,'en_US','Content - create form',NULL,NULL),(1189,'es_ES','Contenido - formulario de creación',NULL,NULL),(1189,'fr_FR','Contenu - formulaire de création',NULL,NULL),(1189,'it_IT',NULL,NULL,NULL),(1189,'ru_RU','Контент - форма создания',NULL,NULL),(1190,'cs_CZ',NULL,NULL,NULL),(1190,'de_DE','Ordner - Löschungsformular',NULL,NULL),(1190,'en_US','Folder - delete form',NULL,NULL),(1190,'es_ES',NULL,NULL,NULL),(1190,'fr_FR','Dossier - formulaire de suppression',NULL,NULL),(1190,'it_IT',NULL,NULL,NULL),(1190,'ru_RU','Папка - форма удаления',NULL,NULL),(1191,'cs_CZ',NULL,NULL,NULL),(1191,'de_DE','Inhalt - Löschungsformular',NULL,NULL),(1191,'en_US','Content - delete form',NULL,NULL),(1191,'es_ES','Contenido - Formulario para eliminar',NULL,NULL),(1191,'fr_FR','Contenu - formulaire de suppression',NULL,NULL),(1191,'it_IT',NULL,NULL,NULL),(1191,'ru_RU','Контент - форма удаления',NULL,NULL),(1192,'cs_CZ',NULL,NULL,NULL),(1192,'de_DE','Ordner - JavaScript',NULL,NULL),(1192,'en_US','Folder - JavaScript',NULL,NULL),(1192,'es_ES','Carpeta - JavaScript',NULL,NULL),(1192,'fr_FR','Dossiers - JavaScript',NULL,NULL),(1192,'it_IT',NULL,NULL,NULL),(1192,'ru_RU','Папка - JavaScript',NULL,NULL),(1193,'cs_CZ',NULL,NULL,NULL),(1193,'de_DE','Template - JavaScript Änderung',NULL,NULL),(1193,'en_US','Template - Edit JavaScript',NULL,NULL),(1193,'es_ES','Plantilla - editar JavaScript',NULL,NULL),(1193,'fr_FR','Gabarit - Modification de JavaScript',NULL,NULL),(1193,'it_IT',NULL,NULL,NULL),(1193,'ru_RU','Шаблон - Редактирование JavaScript',NULL,NULL),(1194,'cs_CZ',NULL,NULL,NULL),(1194,'de_DE','Taxe - JavaScript Änderung',NULL,NULL),(1194,'en_US','Tax - Edit JavaScript',NULL,NULL),(1194,'es_ES','Editar JavaScript',NULL,NULL),(1194,'fr_FR','Taxe - Modification de JavaScript',NULL,NULL),(1194,'it_IT',NULL,NULL,NULL),(1194,'ru_RU','Налог - Редактирование JavaScript',NULL,NULL),(1195,'cs_CZ',NULL,NULL,NULL),(1195,'de_DE','Hook - JavaScript Änderung',NULL,NULL),(1195,'en_US','Hook - Edit JavaScript',NULL,NULL),(1195,'es_ES','Hook - editar JavaScript',NULL,NULL),(1195,'fr_FR','Point d\'accroche - JavaScript modification',NULL,NULL),(1195,'it_IT',NULL,NULL,NULL),(1195,'ru_RU','Хук - Редактирование JavaScript',NULL,NULL),(1196,'cs_CZ',NULL,NULL,NULL),(1196,'de_DE','Länder - oben',NULL,NULL),(1196,'en_US','Countries - at the top',NULL,NULL),(1196,'es_ES','Países - en la parte superior',NULL,NULL),(1196,'fr_FR','Pays - en haut',NULL,NULL),(1196,'it_IT',NULL,NULL,NULL),(1196,'ru_RU','Страны - вверху',NULL,NULL),(1197,'cs_CZ',NULL,NULL,NULL),(1197,'de_DE','Länder - Tabellenkopf',NULL,NULL),(1197,'en_US','Countries - table header',NULL,NULL),(1197,'es_ES','Países - encabezado de la tabla',NULL,NULL),(1197,'fr_FR','Pays - colonne tableau',NULL,NULL),(1197,'it_IT',NULL,NULL,NULL),(1197,'ru_RU','Страны - заголовок таблицы',NULL,NULL),(1198,'cs_CZ',NULL,NULL,NULL),(1198,'de_DE','Länder - Tabellenzeile',NULL,NULL),(1198,'en_US','Countries - table row',NULL,NULL),(1198,'es_ES','Países - fila de la tabla',NULL,NULL),(1198,'fr_FR','Pays - ligne tableau',NULL,NULL),(1198,'it_IT',NULL,NULL,NULL),(1198,'ru_RU','Страны - строка таблицы',NULL,NULL),(1199,'cs_CZ',NULL,NULL,NULL),(1199,'de_DE','Länder - unten',NULL,NULL),(1199,'en_US','Countries - bottom',NULL,NULL),(1199,'es_ES','Países - parte inferior',NULL,NULL),(1199,'fr_FR','Pays - bas',NULL,NULL),(1199,'it_IT',NULL,NULL,NULL),(1199,'ru_RU','Страны - внизу',NULL,NULL),(1200,'cs_CZ',NULL,NULL,NULL),(1200,'de_DE','Land - Erstellungsformular',NULL,NULL),(1200,'en_US','Country - create form',NULL,NULL),(1200,'es_ES','País - formulario de creación',NULL,NULL),(1200,'fr_FR','Pays - formulaire de création',NULL,NULL),(1200,'it_IT',NULL,NULL,NULL),(1200,'ru_RU','Страна - форма создания',NULL,NULL),(1201,'cs_CZ',NULL,NULL,NULL),(1201,'de_DE','Land - Löschungsformular',NULL,NULL),(1201,'en_US','Country - delete form',NULL,NULL),(1201,'es_ES','País - formulario para eliminar',NULL,NULL),(1201,'fr_FR','Pays - formulaire de suppression',NULL,NULL),(1201,'it_IT',NULL,NULL,NULL),(1201,'ru_RU','Страна - форма удаления',NULL,NULL),(1202,'cs_CZ',NULL,NULL,NULL),(1202,'de_DE','Länder - JavaScript',NULL,NULL),(1202,'en_US','Countries - JavaScript',NULL,NULL),(1202,'es_ES','Países - JavaScript',NULL,NULL),(1202,'fr_FR','Pays - JavaScript',NULL,NULL),(1202,'it_IT',NULL,NULL,NULL),(1202,'ru_RU','Страны - JavaScript',NULL,NULL),(1203,'cs_CZ',NULL,NULL,NULL),(1203,'de_DE','Währungen - oben',NULL,NULL),(1203,'en_US','Currencies - at the top',NULL,NULL),(1203,'es_ES','Divisas - en la parte superior',NULL,NULL),(1203,'fr_FR','Devises - en haut',NULL,NULL),(1203,'it_IT',NULL,NULL,NULL),(1203,'ru_RU','Валюты - вверху',NULL,NULL),(1204,'cs_CZ',NULL,NULL,NULL),(1204,'de_DE','Währungen - Tabellenkopf',NULL,NULL),(1204,'en_US','Currencies - table header',NULL,NULL),(1204,'es_ES','Divisas - encabezado de tabla',NULL,NULL),(1204,'fr_FR','Devises - colonne tableau',NULL,NULL),(1204,'it_IT',NULL,NULL,NULL),(1204,'ru_RU','Валюты - заголовок таблицы',NULL,NULL),(1205,'cs_CZ',NULL,NULL,NULL),(1205,'de_DE','Währungen - Tabellenzeile',NULL,NULL),(1205,'en_US','Currencies - table row',NULL,NULL),(1205,'es_ES','Divisas - fila de tabla',NULL,NULL),(1205,'fr_FR','Devises - ligne tableau',NULL,NULL),(1205,'it_IT',NULL,NULL,NULL),(1205,'ru_RU','Валюты - строка таблицы',NULL,NULL),(1206,'cs_CZ',NULL,NULL,NULL),(1206,'de_DE','Währungen - unten',NULL,NULL),(1206,'en_US','Currencies - bottom',NULL,NULL),(1206,'es_ES','Divisas - inferior',NULL,NULL),(1206,'fr_FR','Devises - bas',NULL,NULL),(1206,'it_IT',NULL,NULL,NULL),(1206,'ru_RU','Валюты - внизу',NULL,NULL),(1207,'cs_CZ',NULL,NULL,NULL),(1207,'de_DE','Währung - Erstellungsformular',NULL,NULL),(1207,'en_US','Currency - create form',NULL,NULL),(1207,'es_ES','Divisas - formulario de creación',NULL,NULL),(1207,'fr_FR','Devise - formulaire de création',NULL,NULL),(1207,'it_IT',NULL,NULL,NULL),(1207,'ru_RU','Валюта - форма создания',NULL,NULL),(1208,'cs_CZ',NULL,NULL,NULL),(1208,'de_DE','Währung - Löschungsformular',NULL,NULL),(1208,'en_US','Currency - delete form',NULL,NULL),(1208,'es_ES','Moneda - Formulario de eliminación',NULL,NULL),(1208,'fr_FR','Devise - formulaire de suppression',NULL,NULL),(1208,'it_IT',NULL,NULL,NULL),(1208,'ru_RU','Валюта - форма удаления',NULL,NULL),(1209,'cs_CZ',NULL,NULL,NULL),(1209,'de_DE','Währungen - JavaScript',NULL,NULL),(1209,'en_US','Currencies - JavaScript',NULL,NULL),(1209,'es_ES','Divisas - JavaScript',NULL,NULL),(1209,'fr_FR','Devises - JavaScript',NULL,NULL),(1209,'it_IT',NULL,NULL,NULL),(1209,'ru_RU','Валюты - JavaScript',NULL,NULL),(1210,'cs_CZ',NULL,NULL,NULL),(1210,'de_DE','Kunde - Modification',NULL,NULL),(1210,'en_US','Customer - Edit',NULL,NULL),(1210,'es_ES','Cliente - Editar',NULL,NULL),(1210,'fr_FR','Client - Modification',NULL,NULL),(1210,'it_IT',NULL,NULL,NULL),(1210,'ru_RU','Клиент - Edit',NULL,NULL),(1211,'cs_CZ',NULL,NULL,NULL),(1211,'de_DE','Kunde - Adresse-Erstellungsformular',NULL,NULL),(1211,'en_US','Customer - address create form',NULL,NULL),(1211,'es_ES','Cliente - formulario crear dirección',NULL,NULL),(1211,'fr_FR','Client - formulaire de création d\'adresse',NULL,NULL),(1211,'it_IT',NULL,NULL,NULL),(1211,'ru_RU','Клиент - форма создания адреса',NULL,NULL),(1212,'cs_CZ',NULL,NULL,NULL),(1212,'de_DE','Kunde - Adresse-Änderungsformular',NULL,NULL),(1212,'en_US','Customer - address update form',NULL,NULL),(1212,'es_ES','Cliente - formulario de actualización de dirección',NULL,NULL),(1212,'fr_FR','Client - formulaire de Modification d\'adresse',NULL,NULL),(1212,'it_IT',NULL,NULL,NULL),(1212,'ru_RU','Клиент - форма обновления адреса',NULL,NULL),(1213,'cs_CZ',NULL,NULL,NULL),(1213,'de_DE','Kunde - Adresse-Löschungsformular',NULL,NULL),(1213,'en_US','Customer - address delete form',NULL,NULL),(1213,'es_ES','Cliente - Formulario borrar dirección',NULL,NULL),(1213,'fr_FR','Client - formulaire de suppression adresse',NULL,NULL),(1213,'it_IT',NULL,NULL,NULL),(1213,'ru_RU','Клиент - форма удаления адреса',NULL,NULL),(1214,'cs_CZ',NULL,NULL,NULL),(1214,'de_DE','Kunde - JavaScript Änderung',NULL,NULL),(1214,'en_US','Customer - Edit JavaScript',NULL,NULL),(1214,'es_ES','Cliente - Editar JavaScript',NULL,NULL),(1214,'fr_FR','Client - JavaScript modification',NULL,NULL),(1214,'it_IT',NULL,NULL,NULL),(1214,'ru_RU','Клиент - Редактирование JavaScript',NULL,NULL),(1215,'cs_CZ',NULL,NULL,NULL),(1215,'de_DE','Deklinationenangaben - Tabellenkopf',NULL,NULL),(1215,'en_US','Attributes value - table header',NULL,NULL),(1215,'es_ES','Valor de atributos - encabezado de tabla',NULL,NULL),(1215,'fr_FR','Valeurs des attributs - colonne tableau',NULL,NULL),(1215,'it_IT',NULL,NULL,NULL),(1215,'ru_RU','Значение атрибутов - заголовок таблицы',NULL,NULL),(1216,'cs_CZ',NULL,NULL,NULL),(1216,'de_DE','Deklinationenangaben - Tabellenzeile',NULL,NULL),(1216,'en_US','Attributes value - table row',NULL,NULL),(1216,'es_ES','Valor de atributos - fila de la tabla',NULL,NULL),(1216,'fr_FR','Valeurs des attributs - ligne tableau',NULL,NULL),(1216,'it_IT',NULL,NULL,NULL),(1216,'ru_RU','Значение атрибутов - строка таблицы',NULL,NULL),(1217,'cs_CZ',NULL,NULL,NULL),(1217,'de_DE','Deklinationsangabe - Erstellungsformular',NULL,NULL),(1217,'en_US','Attribute value - create form',NULL,NULL),(1217,'es_ES','Valor de atributo - formulario de creación',NULL,NULL),(1217,'fr_FR','Valeur d\'attribut - formulaire de création',NULL,NULL),(1217,'it_IT',NULL,NULL,NULL),(1217,'ru_RU','Значение атрибута - форма создания',NULL,NULL),(1218,'cs_CZ',NULL,NULL,NULL),(1218,'de_DE','Deklination - ID Löschungsformular',NULL,NULL),(1218,'en_US','Attribut - id delete form',NULL,NULL),(1218,'es_ES','Atributo - Formulario de eliminación de id',NULL,NULL),(1218,'fr_FR','Attribut - formulaire de suppression ID',NULL,NULL),(1218,'it_IT',NULL,NULL,NULL),(1218,'ru_RU','Атрибут - форма удаления id',NULL,NULL),(1219,'cs_CZ',NULL,NULL,NULL),(1219,'de_DE','Deklination - JavaScript Änderung',NULL,NULL),(1219,'en_US','Attribut - Edit JavaScript',NULL,NULL),(1219,'es_ES','Atributo - editar JavaScript',NULL,NULL),(1219,'fr_FR','Attribut - JavaScript modification',NULL,NULL),(1219,'it_IT',NULL,NULL,NULL),(1219,'ru_RU','Атрибут - Редактирование JavaScript',NULL,NULL),(1220,'cs_CZ',NULL,NULL,NULL),(1220,'de_DE','Profile - oben',NULL,NULL),(1220,'en_US','Profiles - at the top',NULL,NULL),(1220,'es_ES','Perfiles - en la parte superior',NULL,NULL),(1220,'fr_FR','Profils - en haut',NULL,NULL),(1220,'it_IT',NULL,NULL,NULL),(1220,'ru_RU','Профили - вверху',NULL,NULL),(1221,'cs_CZ',NULL,NULL,NULL),(1221,'de_DE','Profile - unten',NULL,NULL),(1221,'en_US','Profiles - bottom',NULL,NULL),(1221,'es_ES','Perfiles - parte inferior',NULL,NULL),(1221,'fr_FR','Profils - en bas',NULL,NULL),(1221,'it_IT',NULL,NULL,NULL),(1221,'ru_RU','Профили - внизу',NULL,NULL),(1222,'cs_CZ',NULL,NULL,NULL),(1222,'de_DE','Profil - Erstellungsformular',NULL,NULL),(1222,'en_US','Profile - create form',NULL,NULL),(1222,'es_ES','Perfil - formulario de alta',NULL,NULL),(1222,'fr_FR','Profil - formulaire de création',NULL,NULL),(1222,'it_IT',NULL,NULL,NULL),(1222,'ru_RU','Профиль - форма создания',NULL,NULL),(1223,'cs_CZ',NULL,NULL,NULL),(1223,'de_DE','Profil - Löschungsformular',NULL,NULL),(1223,'en_US','Profile - delete form',NULL,NULL),(1223,'es_ES','Perfil - formulario de borrado',NULL,NULL),(1223,'fr_FR','Profil - formulaire de suppression',NULL,NULL),(1223,'it_IT',NULL,NULL,NULL),(1223,'ru_RU','Профиль - форма удаления',NULL,NULL),(1224,'cs_CZ',NULL,NULL,NULL),(1224,'de_DE','Profile - JavaScript',NULL,NULL),(1224,'en_US','Profiles - JavaScript',NULL,NULL),(1224,'es_ES','Perfiles - JavaScript',NULL,NULL),(1224,'fr_FR','Profils - JavaScript',NULL,NULL),(1224,'it_IT',NULL,NULL,NULL),(1224,'ru_RU','Профили - JavaScript',NULL,NULL),(1225,'cs_CZ',NULL,NULL,NULL),(1225,'de_DE','Land - JavaScript Änderung',NULL,NULL),(1225,'en_US','Country - Edit JavaScript',NULL,NULL),(1225,'es_ES','País - editar JavaScript',NULL,NULL),(1225,'fr_FR','Pays - JavaScript modification',NULL,NULL),(1225,'it_IT',NULL,NULL,NULL),(1225,'ru_RU','Страна - Редактирование JavaScript',NULL,NULL),(1226,'cs_CZ',NULL,NULL,NULL),(1226,'de_DE','Profil - JavaScript Änderung',NULL,NULL),(1226,'en_US','Profile - Edit JavaScript',NULL,NULL),(1226,'es_ES','Perfil - editar JavaScript',NULL,NULL),(1226,'fr_FR','Profil - Modification de JavaScript',NULL,NULL),(1226,'it_IT',NULL,NULL,NULL),(1226,'ru_RU','Профиль - Редактирование JavaScript',NULL,NULL),(1227,'cs_CZ',NULL,NULL,NULL),(1227,'de_DE','Variable - JavaScript Änderung',NULL,NULL),(1227,'en_US','Variable - Edit JavaScript',NULL,NULL),(1227,'es_ES','Variable - Editar JavaScript',NULL,NULL),(1227,'fr_FR','Variable - Modification de JavaScript',NULL,NULL),(1227,'it_IT',NULL,NULL,NULL),(1227,'ru_RU','Переменная - Редактирование JavaScript',NULL,NULL),(1228,'cs_CZ',NULL,NULL,NULL),(1228,'de_DE','Gutschein - JavaScript Änderung',NULL,NULL),(1228,'en_US','Coupon - update JavaScript',NULL,NULL),(1228,'es_ES','Cupón - actualizar JavaScript',NULL,NULL),(1228,'fr_FR','Code promo - JavaScript modification',NULL,NULL),(1228,'it_IT',NULL,NULL,NULL),(1228,'ru_RU','Купон - обновить JavaScript',NULL,NULL),(1229,'cs_CZ',NULL,NULL,NULL),(1229,'de_DE','Gutschein - oben',NULL,NULL),(1229,'en_US','Coupon - at the top',NULL,NULL),(1229,'es_ES','Cupón - en la parte superior',NULL,NULL),(1229,'fr_FR','Code promo - en haut',NULL,NULL),(1229,'it_IT',NULL,NULL,NULL),(1229,'ru_RU','Купон - вверху',NULL,NULL),(1230,'cs_CZ',NULL,NULL,NULL),(1230,'de_DE','Gutschein - Bildunterschrift',NULL,NULL),(1230,'en_US','Coupon - list caption',NULL,NULL),(1230,'es_ES','Cupón - titulo de la lista',NULL,NULL),(1230,'fr_FR','Code promo - légende liste',NULL,NULL),(1230,'it_IT',NULL,NULL,NULL),(1230,'ru_RU','Купон - заголовок списка',NULL,NULL),(1231,'cs_CZ',NULL,NULL,NULL),(1231,'de_DE','Gutschein - Tabellenkopf',NULL,NULL),(1231,'en_US','Coupon - table header',NULL,NULL),(1231,'es_ES','Cupón - encabezado de tabla',NULL,NULL),(1231,'fr_FR','Code promo - colonne tableau',NULL,NULL),(1231,'it_IT',NULL,NULL,NULL),(1231,'ru_RU','Купон - заголовок таблицы',NULL,NULL),(1232,'cs_CZ',NULL,NULL,NULL),(1232,'de_DE','Gutschein - Tabellenzeile',NULL,NULL),(1232,'en_US','Coupon - table row',NULL,NULL),(1232,'es_ES','Cupón - fila de la tabla',NULL,NULL),(1232,'fr_FR','Code promo - ligne tableau',NULL,NULL),(1232,'it_IT',NULL,NULL,NULL),(1232,'ru_RU','Купон - строка таблицы',NULL,NULL),(1233,'cs_CZ',NULL,NULL,NULL),(1233,'de_DE','Gutschein - unten',NULL,NULL),(1233,'en_US','Coupon - bottom',NULL,NULL),(1233,'es_ES','Cupón - parte inferior',NULL,NULL),(1233,'fr_FR','Code promo - bas',NULL,NULL),(1233,'it_IT',NULL,NULL,NULL),(1233,'ru_RU','Купон - внизу',NULL,NULL),(1234,'cs_CZ',NULL,NULL,NULL),(1234,'de_DE','Gutschein - JavaScript den Listen',NULL,NULL),(1234,'en_US','Coupon - list JavaScript',NULL,NULL),(1234,'es_ES','Cupón - enlistar JavaScript',NULL,NULL),(1234,'fr_FR','Code promo - JavaScript des listes',NULL,NULL),(1234,'it_IT',NULL,NULL,NULL),(1234,'ru_RU','Купон - список JavaScript',NULL,NULL),(1235,'cs_CZ',NULL,NULL,NULL),(1235,'de_DE','Modul - Konfiguration',NULL,NULL),(1235,'en_US','Module - configuration',NULL,NULL),(1235,'es_ES','Módulo - configuración',NULL,NULL),(1235,'fr_FR','Module - configuration',NULL,NULL),(1235,'it_IT',NULL,NULL,NULL),(1235,'ru_RU','Модуль - конфигурация',NULL,NULL),(1236,'cs_CZ',NULL,NULL,NULL),(1236,'de_DE','Modul - JavaScript Konfiguration',NULL,NULL),(1236,'en_US','Module - configuration JavaScript',NULL,NULL),(1236,'es_ES','Módulo - configuración de JavaScript',NULL,NULL),(1236,'fr_FR','Module - JavaScript configuration',NULL,NULL),(1236,'it_IT',NULL,NULL,NULL),(1236,'ru_RU','Модуль - конфигурация JavaScript',NULL,NULL),(1237,'cs_CZ',NULL,NULL,NULL),(1237,'de_DE','Nachricht - JavaScript Änderung',NULL,NULL),(1237,'en_US','Message - Edit JavaScript',NULL,NULL),(1237,'es_ES','Mensaje - Editar JavaScript',NULL,NULL),(1237,'fr_FR','Message - Modification de JavaScript',NULL,NULL),(1237,'it_IT',NULL,NULL,NULL),(1237,'ru_RU','Сообщение - Редактирование JavaScript',NULL,NULL),(1238,'cs_CZ',NULL,NULL,NULL),(1238,'de_DE','Bild - JavaScript Änderung',NULL,NULL),(1238,'en_US','Image - Edit JavaScript',NULL,NULL),(1238,'es_ES','Imagen - Editar JavaScript',NULL,NULL),(1238,'fr_FR','Image - Modification de JavaScript',NULL,NULL),(1238,'it_IT',NULL,NULL,NULL),(1238,'ru_RU','Изображение - Редактирование JavaScript',NULL,NULL),(1239,'cs_CZ',NULL,NULL,NULL),(1239,'de_DE','Deklinationen - oben',NULL,NULL),(1239,'en_US','Attributes - at the top',NULL,NULL),(1239,'es_ES','Atributos - en la parte superior',NULL,NULL),(1239,'fr_FR','Attributs - en haut',NULL,NULL),(1239,'it_IT',NULL,NULL,NULL),(1239,'ru_RU','Атрибуты - вверху',NULL,NULL),(1240,'cs_CZ',NULL,NULL,NULL),(1240,'de_DE','Deklinationen - Tabellenkopf',NULL,NULL),(1240,'en_US','Attributes - table header',NULL,NULL),(1240,'es_ES','Atributos - encabezado de tabla',NULL,NULL),(1240,'fr_FR','Attributs - colonne tableau',NULL,NULL),(1240,'it_IT',NULL,NULL,NULL),(1240,'ru_RU','Атрибуты - заголовок таблицы',NULL,NULL),(1241,'cs_CZ',NULL,NULL,NULL),(1241,'de_DE','Deklinationen - Tabellenzeile',NULL,NULL),(1241,'en_US','Attributes - table row',NULL,NULL),(1241,'es_ES','Atributos - fila de la tabla',NULL,NULL),(1241,'fr_FR','Attributs - ligne tableau',NULL,NULL),(1241,'it_IT',NULL,NULL,NULL),(1241,'ru_RU','Атрибуты - строка таблицы',NULL,NULL),(1242,'cs_CZ',NULL,NULL,NULL),(1242,'de_DE','Deklinationen - unten',NULL,NULL),(1242,'en_US','Attributes - bottom',NULL,NULL),(1242,'es_ES','Atributos - inferior',NULL,NULL),(1242,'fr_FR','Attributs - bas',NULL,NULL),(1242,'it_IT',NULL,NULL,NULL),(1242,'ru_RU','Атрибуты - внизу',NULL,NULL),(1243,'cs_CZ',NULL,NULL,NULL),(1243,'de_DE','Deklination - Erstellungsformular',NULL,NULL),(1243,'en_US','Attribut - create form',NULL,NULL),(1243,'es_ES','Atributo - formulario de creación',NULL,NULL),(1243,'fr_FR','Attribut - formulaire de création',NULL,NULL),(1243,'it_IT',NULL,NULL,NULL),(1243,'ru_RU','Атрибут - форма создания',NULL,NULL),(1244,'cs_CZ',NULL,NULL,NULL),(1244,'de_DE','Deklination - Löschungsformular',NULL,NULL),(1244,'en_US','Attribut - delete form',NULL,NULL),(1244,'es_ES','Atributo - formulario de eliminación',NULL,NULL),(1244,'fr_FR','Attribut - formulaire de suppression',NULL,NULL),(1244,'it_IT',NULL,NULL,NULL),(1244,'ru_RU','Атрибут - форма удаления',NULL,NULL),(1245,'cs_CZ',NULL,NULL,NULL),(1245,'de_DE','Deklination - zu allen hinzufügen Formular',NULL,NULL),(1245,'en_US','Attribut - add to all form',NULL,NULL),(1245,'es_ES','Atributo - agregar a todos los formularios',NULL,NULL),(1245,'fr_FR','Attribut - formulaire ajouter à tous',NULL,NULL),(1245,'it_IT',NULL,NULL,NULL),(1245,'ru_RU','Атрибут - форма добавить все',NULL,NULL),(1246,'cs_CZ',NULL,NULL,NULL),(1246,'de_DE','Deklination - multipel Löschungsformular',NULL,NULL),(1246,'en_US','Attribut - remove to all form',NULL,NULL),(1246,'es_ES','Atributo - quitar a todos',NULL,NULL),(1246,'fr_FR','Attribut - formulaire de suppression multiple',NULL,NULL),(1246,'it_IT',NULL,NULL,NULL),(1246,'ru_RU','Атрибут - форма удалить все',NULL,NULL),(1247,'cs_CZ',NULL,NULL,NULL),(1247,'de_DE','Deklinationen - JavaScript',NULL,NULL),(1247,'en_US','Attributes - JavaScript',NULL,NULL),(1247,'es_ES','Atributos - JavaScript',NULL,NULL),(1247,'fr_FR','Attributs - JavaScript',NULL,NULL),(1247,'it_IT',NULL,NULL,NULL),(1247,'ru_RU','Атрибуты - JavaScript',NULL,NULL),(1248,'cs_CZ',NULL,NULL,NULL),(1248,'de_DE','Logs - oben',NULL,NULL),(1248,'en_US','Logs - at the top',NULL,NULL),(1248,'es_ES','Registros - en la parte superior',NULL,NULL),(1248,'fr_FR','Logs - en haut',NULL,NULL),(1248,'it_IT',NULL,NULL,NULL),(1248,'ru_RU','Логи - вверху',NULL,NULL),(1249,'cs_CZ',NULL,NULL,NULL),(1249,'de_DE','Logs - unten',NULL,NULL),(1249,'en_US','Logs - bottom',NULL,NULL),(1249,'es_ES','Registros - inferior',NULL,NULL),(1249,'fr_FR','Logs - bas',NULL,NULL),(1249,'it_IT',NULL,NULL,NULL),(1249,'ru_RU','Логи - внизу',NULL,NULL),(1250,'cs_CZ',NULL,NULL,NULL),(1250,'de_DE','Protokolle - JavaScript',NULL,NULL),(1250,'en_US','Logs - JavaScript',NULL,NULL),(1250,'es_ES','Registros - JavaScript',NULL,NULL),(1250,'fr_FR','Journaux - JavaScript',NULL,NULL),(1250,'it_IT',NULL,NULL,NULL),(1250,'ru_RU','Логи - JavaScript',NULL,NULL),(1251,'cs_CZ',NULL,NULL,NULL),(1251,'de_DE','Ordner - JavaScript Änderung',NULL,NULL),(1251,'en_US','Folder - Edit JavaScript',NULL,NULL),(1251,'es_ES','Carpeta - Editar JavaScript',NULL,NULL),(1251,'fr_FR','Dossier - JavaScript modification',NULL,NULL),(1251,'it_IT',NULL,NULL,NULL),(1251,'ru_RU','Папка - Редактирование JavaScript',NULL,NULL),(1252,'cs_CZ',NULL,NULL,NULL),(1252,'de_DE','Hooks - oben',NULL,NULL),(1252,'en_US','Hooks - at the top',NULL,NULL),(1252,'es_ES','Hooks - en la parte superior',NULL,NULL),(1252,'fr_FR','Point d\'accroches - en haut',NULL,NULL),(1252,'it_IT',NULL,NULL,NULL),(1252,'ru_RU','Хуки - вверху',NULL,NULL),(1253,'cs_CZ',NULL,NULL,NULL),(1253,'de_DE','Hooks - Tabellenkopf',NULL,NULL),(1253,'en_US','Hooks - table header',NULL,NULL),(1253,'es_ES','Hooks - encabezado de tabla',NULL,NULL),(1253,'fr_FR','Point d\'accroches - colonne tableau',NULL,NULL),(1253,'it_IT',NULL,NULL,NULL),(1253,'ru_RU','Хуки - заголовок таблицы',NULL,NULL),(1254,'cs_CZ',NULL,NULL,NULL),(1254,'de_DE','Hooks - Tabellenzeile',NULL,NULL),(1254,'en_US','Hooks - table row',NULL,NULL),(1254,'es_ES','Hooks - fila de la tabla',NULL,NULL),(1254,'fr_FR','Point d\'accroches - ligne tableau',NULL,NULL),(1254,'it_IT',NULL,NULL,NULL),(1254,'ru_RU','Хуки - строка таблицы',NULL,NULL),(1255,'cs_CZ',NULL,NULL,NULL),(1255,'de_DE','Hooks - unten',NULL,NULL),(1255,'en_US','Hooks - bottom',NULL,NULL),(1255,'es_ES','Hooks - inferior',NULL,NULL),(1255,'fr_FR','Point d\'accroches - bas',NULL,NULL),(1255,'it_IT',NULL,NULL,NULL),(1255,'ru_RU','Хуки - внизу',NULL,NULL),(1256,'cs_CZ',NULL,NULL,NULL),(1256,'de_DE','Hook - Erstellungsformular',NULL,NULL),(1256,'en_US','Hook - create form',NULL,NULL),(1256,'es_ES',NULL,NULL,NULL),(1256,'fr_FR','Point d\'accroche - formulaire de création',NULL,NULL),(1256,'it_IT',NULL,NULL,NULL),(1256,'ru_RU','Хук - форма создания',NULL,NULL),(1257,'cs_CZ',NULL,NULL,NULL),(1257,'de_DE','Hook - Löschungsformular',NULL,NULL),(1257,'en_US','Hook - delete form',NULL,NULL),(1257,'es_ES',NULL,NULL,NULL),(1257,'fr_FR','Point d\'accroche - formulaire de suppression',NULL,NULL),(1257,'it_IT',NULL,NULL,NULL),(1257,'ru_RU','Хук - форма удаления',NULL,NULL),(1258,'cs_CZ',NULL,NULL,NULL),(1258,'de_DE','Hooks - JavaScript',NULL,NULL),(1258,'en_US','Hooks - JavaScript',NULL,NULL),(1258,'es_ES','Hooks - JavaScript',NULL,NULL),(1258,'fr_FR','Points d\'accroche - Javascript',NULL,NULL),(1258,'it_IT',NULL,NULL,NULL),(1258,'ru_RU','Хуки - JavaScript',NULL,NULL),(1259,'cs_CZ',NULL,NULL,NULL),(1259,'de_DE','Layout - CSS',NULL,NULL),(1259,'en_US','Layout - CSS',NULL,NULL),(1259,'es_ES','Diseño - CSS',NULL,NULL),(1259,'fr_FR','Mise en page - CSS',NULL,NULL),(1259,'it_IT',NULL,NULL,NULL),(1259,'ru_RU','Каркас - CSS',NULL,NULL),(1260,'cs_CZ',NULL,NULL,NULL),(1260,'de_DE','Layout - vor der Titelleiste',NULL,NULL),(1260,'en_US','Layout - before topbar',NULL,NULL),(1260,'es_ES','Diseño - antes de la barra superior',NULL,NULL),(1260,'fr_FR','Mise en page - avant la barre de titre',NULL,NULL),(1260,'it_IT',NULL,NULL,NULL),(1260,'ru_RU','Каркас - перед верхней панелью',NULL,NULL),(1261,'cs_CZ',NULL,NULL,NULL),(1261,'de_DE','Layout - in der Titelleiste',NULL,NULL),(1261,'en_US','Layout - inside top bar',NULL,NULL),(1261,'es_ES','Diseño - en la barra superior',NULL,NULL),(1261,'fr_FR','Mise en page - dans la barre de titre',NULL,NULL),(1261,'it_IT',NULL,NULL,NULL),(1261,'ru_RU','Каркас - внутри верхней панели',NULL,NULL),(1262,'cs_CZ',NULL,NULL,NULL),(1262,'de_DE','Layout - nach der Titelleiste',NULL,NULL),(1262,'en_US','Layout - after top bar',NULL,NULL),(1262,'es_ES','Diseño - después de la barra superior',NULL,NULL),(1262,'fr_FR','Mise en page - après la barre de titre',NULL,NULL),(1262,'it_IT',NULL,NULL,NULL),(1262,'ru_RU','Каркас - после верхней панели',NULL,NULL),(1263,'cs_CZ',NULL,NULL,NULL),(1263,'de_DE','Layout - vor dem Top Menü',NULL,NULL),(1263,'en_US','Layout - before top menu',NULL,NULL),(1263,'es_ES','Diseño - antes del menú principal',NULL,NULL),(1263,'fr_FR','Mise en page - avant le menu haut',NULL,NULL),(1263,'it_IT',NULL,NULL,NULL),(1263,'ru_RU','Каркас - перед верхним меню',NULL,NULL),(1264,'cs_CZ',NULL,NULL,NULL),(1264,'de_DE','Layout - in Top-Menü Elementen',NULL,NULL),(1264,'en_US','Layout - in top menu items',NULL,NULL),(1264,'es_ES','Diseño - en la parte superior del menú artículos',NULL,NULL),(1264,'fr_FR','Mise en page - éléments du menu haut',NULL,NULL),(1264,'it_IT',NULL,NULL,NULL),(1264,'ru_RU','Каркас - в элементрах верхнего меню',NULL,NULL),(1265,'cs_CZ',NULL,NULL,NULL),(1265,'de_DE','Layout - nach dem Top Menü',NULL,NULL),(1265,'en_US','Layout - after top menu',NULL,NULL),(1265,'es_ES','Diseño - después del menú principal',NULL,NULL),(1265,'fr_FR','Mise en page - après le menu haut',NULL,NULL),(1265,'it_IT',NULL,NULL,NULL),(1265,'ru_RU','Каркас - после верхнего меню',NULL,NULL),(1266,'cs_CZ',NULL,NULL,NULL),(1266,'de_DE','Layout - vor dem Footer',NULL,NULL),(1266,'en_US','Layout - before footer',NULL,NULL),(1266,'es_ES','Diseño - antes del pie de página',NULL,NULL),(1266,'fr_FR','Mise en page - avant le pied de page',NULL,NULL),(1266,'it_IT',NULL,NULL,NULL),(1266,'ru_RU','Каркас - перед подвалом',NULL,NULL),(1267,'cs_CZ',NULL,NULL,NULL),(1267,'de_DE','Layout - Im Footer',NULL,NULL),(1267,'en_US','Layout - in footer',NULL,NULL),(1267,'es_ES','Diseño - en el pie de página',NULL,NULL),(1267,'fr_FR','Mise en page - dans le pied de page',NULL,NULL),(1267,'it_IT',NULL,NULL,NULL),(1267,'ru_RU','Каркас - в подвале',NULL,NULL),(1268,'cs_CZ',NULL,NULL,NULL),(1268,'de_DE','Layout - nach dem Footer',NULL,NULL),(1268,'en_US','Layout - after footer',NULL,NULL),(1268,'es_ES','Diseño - después de pie de página',NULL,NULL),(1268,'fr_FR','Mise en page - après le pied de page',NULL,NULL),(1268,'it_IT',NULL,NULL,NULL),(1268,'ru_RU','Каркас - после подвала',NULL,NULL),(1269,'cs_CZ',NULL,NULL,NULL),(1269,'de_DE','Layout - JavaScript',NULL,NULL),(1269,'en_US','Layout - JavaScript',NULL,NULL),(1269,'es_ES','Diseño - JavaScript',NULL,NULL),(1269,'fr_FR','Mise en page - JavaScript',NULL,NULL),(1269,'it_IT',NULL,NULL,NULL),(1269,'ru_RU','Каркас - JavaScript',NULL,NULL),(1270,'cs_CZ',NULL,NULL,NULL),(1270,'de_DE','Layout - oben an der Titelleiste',NULL,NULL),(1270,'en_US','Layout - at the top of the top bar',NULL,NULL),(1270,'es_ES','Diseño - en la parte superior de la barra superior',NULL,NULL),(1270,'fr_FR','Mise en page - en haut de la barre supérieure',NULL,NULL),(1270,'it_IT',NULL,NULL,NULL),(1270,'ru_RU','Каркас - вверху верхней панели',NULL,NULL),(1271,'cs_CZ',NULL,NULL,NULL),(1271,'de_DE','Layout - unten an der Titelleiste',NULL,NULL),(1271,'en_US','Layout - at the bottom of the top bar',NULL,NULL),(1271,'es_ES','Diseño - en la parte inferior de la barra superior',NULL,NULL),(1271,'fr_FR','Mise en page - en bas de la barre supérieure',NULL,NULL),(1271,'it_IT',NULL,NULL,NULL),(1271,'ru_RU','Каркас - внизу верхней панели',NULL,NULL),(1272,'cs_CZ',NULL,NULL,NULL),(1272,'de_DE','Layout - im Kundes-Menü',NULL,NULL),(1272,'en_US','Layout - in the menu customers',NULL,NULL),(1272,'es_ES','Diseño - en el menú de cliente',NULL,NULL),(1272,'fr_FR','Mise en page - dans le menu clients',NULL,NULL),(1272,'it_IT',NULL,NULL,NULL),(1272,'ru_RU','Каркас - в меню клиенты',NULL,NULL),(1273,'cs_CZ',NULL,NULL,NULL),(1273,'de_DE','Layout - im Bestellungsmenü',NULL,NULL),(1273,'en_US','Layout - in the menu orders',NULL,NULL),(1273,'es_ES','Diseño - en el menú de pedidos',NULL,NULL),(1273,'fr_FR','Mise en page - dans le menu commandes',NULL,NULL),(1273,'it_IT',NULL,NULL,NULL),(1273,'ru_RU','Каркас - в меню заказы',NULL,NULL),(1274,'cs_CZ',NULL,NULL,NULL),(1274,'de_DE','Layout - im Katalogs-Menü',NULL,NULL),(1274,'en_US','Layout - in the menu catalog',NULL,NULL),(1274,'es_ES','Diseño - en el menú de catálogo',NULL,NULL),(1274,'fr_FR','Mise en page - dans le menu catalogue',NULL,NULL),(1274,'it_IT',NULL,NULL,NULL),(1274,'ru_RU','Каркас - в меню каталог',NULL,NULL),(1275,'cs_CZ',NULL,NULL,NULL),(1275,'de_DE','Layout - im Ordners-Menü',NULL,NULL),(1275,'en_US','Layout - in the menu folders',NULL,NULL),(1275,'es_ES','Diseño - en el menú de carpetas',NULL,NULL),(1275,'fr_FR','Mise en page - dans le menu dossiers',NULL,NULL),(1275,'it_IT',NULL,NULL,NULL),(1275,'ru_RU','Каркас - в меню папки',NULL,NULL),(1276,'cs_CZ',NULL,NULL,NULL),(1276,'de_DE','Layout - im Tools-Menü',NULL,NULL),(1276,'en_US','Layout - in the menu tools',NULL,NULL),(1276,'es_ES','Diseño - en el menú de herramientas',NULL,NULL),(1276,'fr_FR','Mise en page - dans le menu outils',NULL,NULL),(1276,'it_IT',NULL,NULL,NULL),(1276,'ru_RU','Каркас - в меню инструменты',NULL,NULL),(1277,'cs_CZ',NULL,NULL,NULL),(1277,'de_DE','Layout - im Moduls-Menü',NULL,NULL),(1277,'en_US','Layout - in the menu modules',NULL,NULL),(1277,'es_ES','Diseño - en el menú de módulos',NULL,NULL),(1277,'fr_FR','Mise en page - dans le menu modules',NULL,NULL),(1277,'it_IT',NULL,NULL,NULL),(1277,'ru_RU','Каркас - в меню модули',NULL,NULL),(1278,'cs_CZ',NULL,NULL,NULL),(1278,'de_DE','Layout - im konfigurations-Menü',NULL,NULL),(1278,'en_US','Layout - in the menu configuration',NULL,NULL),(1278,'es_ES','Diseño - en el menú de configuración',NULL,NULL),(1278,'fr_FR','Mise en page - dans le menu configuration',NULL,NULL),(1278,'it_IT',NULL,NULL,NULL),(1278,'ru_RU','Каркас - в меню конфигурация',NULL,NULL),(1279,'cs_CZ',NULL,NULL,NULL),(1279,'de_DE','Marke - JavaScript Änderung',NULL,NULL),(1279,'en_US','Brand - Edit JavaScript',NULL,NULL),(1279,'es_ES','Marca - editar JavaScript',NULL,NULL),(1279,'fr_FR','Marque - Modification du JavaScript',NULL,NULL),(1279,'it_IT',NULL,NULL,NULL),(1279,'ru_RU','Бренд - Редактирование JavaScript',NULL,NULL),(1280,'cs_CZ',NULL,NULL,NULL),(1280,'de_DE','Accueil - Block',NULL,NULL),(1280,'en_US','Home - block',NULL,NULL),(1280,'es_ES','Inicio - bloque',NULL,NULL),(1280,'fr_FR','Accueil - bloc',NULL,NULL),(1280,'it_IT',NULL,NULL,NULL),(1280,'ru_RU','Главная - блок',NULL,NULL),(1281,'cs_CZ',NULL,NULL,NULL),(1281,'de_DE','Marken - oben',NULL,NULL),(1281,'en_US','Brands - at the top',NULL,NULL),(1281,'es_ES','Marcas - en parte superior',NULL,NULL),(1281,'fr_FR','Marques - en haut',NULL,NULL),(1281,'it_IT',NULL,NULL,NULL),(1281,'ru_RU','Бренды - вверху',NULL,NULL),(1282,'cs_CZ',NULL,NULL,NULL),(1282,'de_DE','Marken - Tabellenkopf',NULL,NULL),(1282,'en_US','Brands - table header',NULL,NULL),(1282,'es_ES','Marcas - encabezado de tabla',NULL,NULL),(1282,'fr_FR','Marques - colonne tableau',NULL,NULL),(1282,'it_IT',NULL,NULL,NULL),(1282,'ru_RU','Бренды - заголовок таблицы',NULL,NULL),(1283,'cs_CZ',NULL,NULL,NULL),(1283,'de_DE','Marken - Tabellzeilen',NULL,NULL),(1283,'en_US','Brands - table row',NULL,NULL),(1283,'es_ES','Marcas - file de la tabla',NULL,NULL),(1283,'fr_FR','Marques - ligne tableau',NULL,NULL),(1283,'it_IT',NULL,NULL,NULL),(1283,'ru_RU','Бренды - строка таблицы',NULL,NULL),(1284,'cs_CZ',NULL,NULL,NULL),(1284,'de_DE','Marken - unten',NULL,NULL),(1284,'en_US','Brands - bottom',NULL,NULL),(1284,'es_ES','Marcas - inferior',NULL,NULL),(1284,'fr_FR','Marques - bas',NULL,NULL),(1284,'it_IT',NULL,NULL,NULL),(1284,'ru_RU','Бренды - внизу',NULL,NULL),(1285,'cs_CZ',NULL,NULL,NULL),(1285,'de_DE','Marke - Erstellungsformular',NULL,NULL),(1285,'en_US','Brand - create form',NULL,NULL),(1285,'es_ES','Marca - formulario de creación',NULL,NULL),(1285,'fr_FR','Marque - formulaire de création',NULL,NULL),(1285,'it_IT',NULL,NULL,NULL),(1285,'ru_RU','Бренд - форма создания',NULL,NULL),(1286,'cs_CZ',NULL,NULL,NULL),(1286,'de_DE','Marke - Löschungsformular',NULL,NULL),(1286,'en_US','Brand - delete form',NULL,NULL),(1286,'es_ES','Marca - formulario de eliminación',NULL,NULL),(1286,'fr_FR','Marque - formulaire de suppression',NULL,NULL),(1286,'it_IT',NULL,NULL,NULL),(1286,'ru_RU','Бренд - форма удаления',NULL,NULL),(1287,'cs_CZ',NULL,NULL,NULL),(1287,'de_DE','Marke - JavaScript',NULL,NULL),(1287,'en_US','Brand - JavaScript',NULL,NULL),(1287,'es_ES','Marca - JavaScript',NULL,NULL),(1287,'fr_FR','Marque - JavaScript',NULL,NULL),(1287,'it_IT',NULL,NULL,NULL),(1287,'ru_RU','Бренд - JavaScript',NULL,NULL),(1288,'cs_CZ',NULL,NULL,NULL),(1288,'de_DE','Exporte - oben',NULL,NULL),(1288,'en_US','Exports - at the top',NULL,NULL),(1288,'es_ES','Exportar - en la parte superior',NULL,NULL),(1288,'fr_FR','Exports - en haut',NULL,NULL),(1288,'it_IT',NULL,NULL,NULL),(1288,'ru_RU','Экспорты - вверху',NULL,NULL),(1289,'cs_CZ',NULL,NULL,NULL),(1289,'de_DE','Exporte - unten einer Kategorie',NULL,NULL),(1289,'en_US','Exports - at the bottom of a category',NULL,NULL),(1289,'es_ES','Exportar - en la parte inferior de una categoría',NULL,NULL),(1289,'fr_FR','Exports - en bas d\'une catégorie',NULL,NULL),(1289,'it_IT',NULL,NULL,NULL),(1289,'ru_RU','Экспорты - внизу категории',NULL,NULL),(1290,'cs_CZ',NULL,NULL,NULL),(1290,'de_DE','Exporte - unten der Spalte 1',NULL,NULL),(1290,'en_US','Exports - at the bottom of column 1',NULL,NULL),(1290,'es_ES','Exportar - en la parte inferior de la columna 1',NULL,NULL),(1290,'fr_FR','Exports - en bas de la colonne 1',NULL,NULL),(1290,'it_IT',NULL,NULL,NULL),(1290,'ru_RU','Экспорты - внизу колонки 1',NULL,NULL),(1291,'cs_CZ',NULL,NULL,NULL),(1291,'de_DE','Exporte - JavaScript',NULL,NULL),(1291,'en_US','Exports - JavaScript',NULL,NULL),(1291,'es_ES','Exportar JavaScript',NULL,NULL),(1291,'fr_FR','Exports - JavaScript',NULL,NULL),(1291,'it_IT',NULL,NULL,NULL),(1291,'ru_RU','Экспорты - JavaScript',NULL,NULL),(1292,'cs_CZ',NULL,NULL,NULL),(1292,'de_DE','Export - JavaScript',NULL,NULL),(1292,'en_US','Export - JavaScript',NULL,NULL),(1292,'es_ES','Exportación - JavaScript',NULL,NULL),(1292,'fr_FR','Export - JavaScript',NULL,NULL),(1292,'it_IT',NULL,NULL,NULL),(1292,'ru_RU','Экспорт - JavaScript',NULL,NULL),(1293,'cs_CZ',NULL,NULL,NULL),(1293,'de_DE','Marke - Inhalt',NULL,NULL),(1293,'en_US','Brand - content',NULL,NULL),(1293,'es_ES','Marca - contenido',NULL,NULL),(1293,'fr_FR','Marque - contenu',NULL,NULL),(1293,'it_IT',NULL,NULL,NULL),(1293,'ru_RU','Бренд - содержимое',NULL,NULL),(1294,'cs_CZ',NULL,NULL,NULL),(1294,'de_DE','Kunde - Bestellungs-Tabellenkopf',NULL,NULL),(1294,'en_US','Customer - order table header',NULL,NULL),(1294,'es_ES','Cliente - cabecera tabla de pedidos',NULL,NULL),(1294,'fr_FR','Client - colonne tableau commande',NULL,NULL),(1294,'it_IT',NULL,NULL,NULL),(1294,'ru_RU','Клиент - заголовок таблицы заказа',NULL,NULL),(1295,'cs_CZ',NULL,NULL,NULL),(1295,'de_DE','Kunde - Bestellungs-Tabellenzeile',NULL,NULL),(1295,'en_US','Customer - order table row',NULL,NULL),(1295,'es_ES','Cliente - celda tabla pedidos',NULL,NULL),(1295,'fr_FR','Client - ligne tableau commande',NULL,NULL),(1295,'it_IT',NULL,NULL,NULL),(1295,'ru_RU','Клиент - строка таблицы заказа',NULL,NULL),(1296,'cs_CZ',NULL,NULL,NULL),(1296,'de_DE','Sonderangebote - oben',NULL,NULL),(1296,'en_US','Sales - at the top',NULL,NULL),(1296,'es_ES','Ventas - en la parte superior',NULL,NULL),(1296,'fr_FR','Promotions - en haut',NULL,NULL),(1296,'it_IT',NULL,NULL,NULL),(1296,'ru_RU','Распродажи - вверху',NULL,NULL),(1297,'cs_CZ',NULL,NULL,NULL),(1297,'de_DE','Sonderangebote - Tabellenkopf',NULL,NULL),(1297,'en_US','Sales - table header',NULL,NULL),(1297,'es_ES','Ventas - encabezado de tabla',NULL,NULL),(1297,'fr_FR','Promotions - colonne tableau',NULL,NULL),(1297,'it_IT',NULL,NULL,NULL),(1297,'ru_RU','Распродажи - заголовок таблицы',NULL,NULL),(1298,'cs_CZ',NULL,NULL,NULL),(1298,'de_DE','Sonderangebote - Tabellenzeile',NULL,NULL),(1298,'en_US','Sales - table row',NULL,NULL),(1298,'es_ES','Ventas - fila de la tabla',NULL,NULL),(1298,'fr_FR','Promotions - ligne du tableau',NULL,NULL),(1298,'it_IT',NULL,NULL,NULL),(1298,'ru_RU','Распродажи - строка таблицы',NULL,NULL),(1299,'cs_CZ',NULL,NULL,NULL),(1299,'de_DE','Sonderangebote - unten',NULL,NULL),(1299,'en_US','Sales - at the bottom',NULL,NULL),(1299,'es_ES','Ventas - en la parte inferior',NULL,NULL),(1299,'fr_FR','Promotions - en bas',NULL,NULL),(1299,'it_IT',NULL,NULL,NULL),(1299,'ru_RU','Распродажи - внизу',NULL,NULL),(1300,'cs_CZ',NULL,NULL,NULL),(1300,'de_DE','Sonderangebot - Erstellungsformular',NULL,NULL),(1300,'en_US','Sale - create form',NULL,NULL),(1300,'es_ES','Venta - formulario de creación',NULL,NULL),(1300,'fr_FR','Promotion - formulaire de création',NULL,NULL),(1300,'it_IT',NULL,NULL,NULL),(1300,'ru_RU','Распродажа - форма создания',NULL,NULL),(1301,'cs_CZ',NULL,NULL,NULL),(1301,'de_DE','Sonderangebot - Löschungsformular',NULL,NULL),(1301,'en_US','Sale - delete form',NULL,NULL),(1301,'es_ES','Venta - formulario de borrado',NULL,NULL),(1301,'fr_FR','Promotion - formulaire de suppression',NULL,NULL),(1301,'it_IT',NULL,NULL,NULL),(1301,'ru_RU','Распродажа - форма удаления',NULL,NULL),(1302,'cs_CZ',NULL,NULL,NULL),(1302,'de_DE','Sonderangebote - JavaScript',NULL,NULL),(1302,'en_US','Sales - JavaScript',NULL,NULL),(1302,'es_ES','Ventas - JavaScript',NULL,NULL),(1302,'fr_FR','Promotions - JavaScript',NULL,NULL),(1302,'it_IT',NULL,NULL,NULL),(1302,'ru_RU','Распродажи - JavaScript',NULL,NULL),(1303,'cs_CZ',NULL,NULL,NULL),(1303,'de_DE','Produkt - unten einer Produkt-Kombination',NULL,NULL),(1303,'en_US','Product - at the bottom of a product combination',NULL,NULL),(1303,'es_ES','Producto - al pie de la combinación de un producto',NULL,NULL),(1303,'fr_FR','Produit - en bas d\'une combinaison de déclinaisons',NULL,NULL),(1303,'it_IT',NULL,NULL,NULL),(1303,'ru_RU','Товар - внизу комбинации товара',NULL,NULL),(1304,'cs_CZ',NULL,NULL,NULL),(1304,'de_DE','Layout - vor dem Hauptinhaltsbereich',NULL,NULL),(1304,'en_US','Layout - Before the main content',NULL,NULL),(1304,'es_ES','Diseño - antes el contenido principal',NULL,NULL),(1304,'fr_FR','Layout - Avant le contenu principal',NULL,NULL),(1304,'it_IT',NULL,NULL,NULL),(1304,'ru_RU','Каркас - Перед основным контентом',NULL,NULL),(1305,'cs_CZ',NULL,NULL,NULL),(1305,'de_DE','Admin layout - Nach dem Hauptinhalt',NULL,NULL),(1305,'en_US','Admin layout - After the main content',NULL,NULL),(1305,'es_ES','Diseño de administración - Después del contenido principal',NULL,NULL),(1305,'fr_FR','Admin layout - Après le contenu principal',NULL,NULL),(1305,'it_IT',NULL,NULL,NULL),(1305,'ru_RU','Каркас админки - После основного контента',NULL,NULL),(1306,'cs_CZ',NULL,NULL,NULL),(1306,'de_DE','Kategorie - Tab',NULL,NULL),(1306,'en_US','Category - Tab',NULL,NULL),(1306,'es_ES','Categoría - Tab',NULL,NULL),(1306,'fr_FR','Catégorie - Onglet',NULL,NULL),(1306,'it_IT',NULL,NULL,NULL),(1306,'ru_RU','Категория - Вкладка',NULL,NULL),(1307,'cs_CZ',NULL,NULL,NULL),(1307,'de_DE','Produkt - Tab',NULL,NULL),(1307,'en_US','Product - Tab',NULL,NULL),(1307,'es_ES','Producto - Pestaña',NULL,NULL),(1307,'fr_FR','Produit - Onglet',NULL,NULL),(1307,'it_IT',NULL,NULL,NULL),(1307,'ru_RU','Товар - Вкладка',NULL,NULL),(1308,'cs_CZ',NULL,NULL,NULL),(1308,'de_DE','Ordner - Tab',NULL,NULL),(1308,'en_US','Folder - Tab',NULL,NULL),(1308,'es_ES','Carpeta - Pestaña',NULL,NULL),(1308,'fr_FR','Dossier - Onglet',NULL,NULL),(1308,'it_IT',NULL,NULL,NULL),(1308,'ru_RU','Папка - Вкладка',NULL,NULL),(1309,'cs_CZ',NULL,NULL,NULL),(1309,'de_DE','Inhalt - Tab',NULL,NULL),(1309,'en_US','Content - Tab',NULL,NULL),(1309,'es_ES','Contenido - Pestaña',NULL,NULL),(1309,'fr_FR','Contenu - Onglet',NULL,NULL),(1309,'it_IT',NULL,NULL,NULL),(1309,'ru_RU','Контент - Вкладка',NULL,NULL),(1310,'cs_CZ',NULL,NULL,NULL),(1310,'de_DE','Marke - Tab',NULL,NULL),(1310,'en_US','Brand - Tab',NULL,NULL),(1310,'es_ES','Marca - Tab',NULL,NULL),(1310,'fr_FR','Marque - Onglet',NULL,NULL),(1310,'it_IT',NULL,NULL,NULL),(1310,'ru_RU','Бренд - Вкладка',NULL,NULL),(1311,'cs_CZ',NULL,NULL,NULL),(1311,'de_DE','Bestellungs-Änderung - Lieferadresse',NULL,NULL),(1311,'en_US','Order edit - delivery address',NULL,NULL),(1311,'es_ES','Editar Orden - dirección de envío',NULL,NULL),(1311,'fr_FR','Modification commande - adresse de livraison',NULL,NULL),(1311,'it_IT',NULL,NULL,NULL),(1311,'ru_RU','Редактирование заказа - адрес доставки',NULL,NULL),(1312,'cs_CZ',NULL,NULL,NULL),(1312,'de_DE','Produktseite - oben im Formular',NULL,NULL),(1312,'en_US','Product page - On the top of the form',NULL,NULL),(1312,'es_ES','Página de producto - en la parte superior del formulario',NULL,NULL),(1312,'fr_FR','Page produit - En haut du formulaire',NULL,NULL),(1312,'it_IT',NULL,NULL,NULL),(1312,'ru_RU','Страница товара - Вверху формы',NULL,NULL),(1313,'cs_CZ',NULL,NULL,NULL),(1313,'de_DE','Produktseite - unten an dem Formular',NULL,NULL),(1313,'en_US','Product page - On the bottom of the form',NULL,NULL),(1313,'es_ES','Página del producto - en la parte inferior del formulario',NULL,NULL),(1313,'fr_FR','Page produit - En bas du formulaire',NULL,NULL),(1313,'it_IT',NULL,NULL,NULL),(1313,'ru_RU','Страница товара - Внизу формы',NULL,NULL),(1314,'cs_CZ',NULL,NULL,NULL),(1314,'de_DE','Brand edit Seite - im Formular',NULL,NULL),(1314,'en_US','Brand edit page - in the form',NULL,NULL),(1314,'es_ES','Página de edición de marca - en formulario',NULL,NULL),(1314,'fr_FR','Page brand edit - dans formulaire',NULL,NULL),(1314,'it_IT',NULL,NULL,NULL),(1314,'ru_RU','Страница редактирования бренда - в форме',NULL,NULL),(1315,'cs_CZ',NULL,NULL,NULL),(1315,'de_DE','Sonderangebot Änderungsseite - javascript last call block',NULL,NULL),(1315,'en_US','Sale edit page - javascript last call block',NULL,NULL),(1315,'es_ES','Página de edición de Venta - última bloque de llamada JavaScript',NULL,NULL),(1315,'fr_FR','Page sale edit - appel javascript',NULL,NULL),(1315,'it_IT',NULL,NULL,NULL),(1315,'ru_RU','Страница редактирования распродажи - блок последнего вызова javascript',NULL,NULL),(1319,'cs_CZ',NULL,NULL,NULL),(1319,'de_DE','Gutschein-Seite - Löschungsformular',NULL,NULL),(1319,'en_US','Coupon page - in deletion form',NULL,NULL),(1319,'es_ES','Página de cupón - en formulario de eliminación',NULL,NULL),(1319,'fr_FR','Page coupon - formulaire de suppression',NULL,NULL),(1319,'it_IT',NULL,NULL,NULL),(1319,'ru_RU','Страница купона - в форме удаления',NULL,NULL),(1320,'cs_CZ',NULL,NULL,NULL),(1320,'de_DE','Bestellung - Tab',NULL,NULL),(1320,'en_US','Order - Tab',NULL,NULL),(1320,'es_ES','Orden - Pestaña',NULL,NULL),(1320,'fr_FR','Commande- Onglet',NULL,NULL),(1320,'it_IT',NULL,NULL,NULL),(1320,'ru_RU','Заказ - Вкладка',NULL,NULL),(1321,'cs_CZ',NULL,'',''),(1321,'de_DE','Profil - Tabellenkopf','',''),(1321,'en_US','Profile - table header','',''),(1321,'es_ES','Perfil - encabezado de tabla','',''),(1321,'fr_FR','Profil - colonne tableau','',''),(1321,'it_IT',NULL,'',''),(1321,'ru_RU','Профиль - заголовок таблицы','',''),(1322,'cs_CZ',NULL,'',''),(1322,'de_DE','Profil - Tabellenzeile','',''),(1322,'en_US','Profile - table row','',''),(1322,'es_ES','Perfil - fila de la tabla','',''),(1322,'fr_FR','Profil - ligne du tableau','',''),(1322,'it_IT',NULL,'',''),(1322,'ru_RU','Профиль - строка таблицы','',''),(1323,'cs_CZ',NULL,'',''),(1323,'de_DE','Import - Tabellenkopf','',''),(1323,'en_US','Import - table header','',''),(1323,'es_ES','Importar - encabezado de tabla','',''),(1323,'fr_FR','Import - colonne tableau','',''),(1323,'it_IT',NULL,'',''),(1323,'ru_RU','Импорт - заголовок таблицы','',''),(1324,'cs_CZ',NULL,'',''),(1324,'de_DE','Import - Tabellenzeile','',''),(1324,'en_US','Import - table row','',''),(1324,'es_ES','Importar - fila de la tabla','',''),(1324,'fr_FR','Import - ligne du tableau','',''),(1324,'it_IT',NULL,'',''),(1324,'ru_RU','Импорт - строка таблицы','',''),(1325,'cs_CZ',NULL,'',''),(1325,'de_DE','Export - Tabellenkopf','',''),(1325,'en_US','Export - table header','',''),(1325,'es_ES','Exportación - encabezado de tabla','',''),(1325,'fr_FR','Export - colonne tableau','',''),(1325,'it_IT',NULL,'',''),(1325,'ru_RU','Экспорт - заголовок таблицы','',''),(1326,'cs_CZ',NULL,'',''),(1326,'de_DE','Export - Tabellenzeile','',''),(1326,'en_US','Export - table row','',''),(1326,'es_ES','Exportación - fila de la tabla','',''),(1326,'fr_FR','Export - ligne du tableau','',''),(1326,'it_IT',NULL,'',''),(1326,'ru_RU','Экспорт - строка таблицы','',''),(1327,'cs_CZ',NULL,'',''),(1327,'de_DE','Kategorie Bearbeitung - oben','',''),(1327,'en_US','Category edit - top','',''),(1327,'es_ES','Categoría edición - superior','',''),(1327,'fr_FR','Édition d\'une categorie - en haut','',''),(1327,'it_IT',NULL,'',''),(1327,'ru_RU','Редактирование категории - вверху','',''),(1328,'cs_CZ',NULL,'',''),(1328,'de_DE','Kategorie Bearbeitung - unten','',''),(1328,'en_US','Category edit - bottom','',''),(1328,'es_ES','Editar categoría - inferior','',''),(1328,'fr_FR','Édition d\'une categorie - en bas','',''),(1328,'it_IT',NULL,'',''),(1328,'ru_RU','Редактирование категории - внизу','',''),(1329,'cs_CZ',NULL,'',''),(1329,'de_DE','Marke Bearbeitung - oben','',''),(1329,'en_US','Brand edit - top','',''),(1329,'es_ES','Editar marca - superior','',''),(1329,'fr_FR','Édition d\'une marque - en haut','',''),(1329,'it_IT',NULL,'',''),(1329,'ru_RU','Редактирование бренда - вверху','',''),(1330,'cs_CZ',NULL,'',''),(1330,'de_DE','Marke Bearbeitung - unten','',''),(1330,'en_US','Brand edit - bottom','',''),(1330,'es_ES','Editar marca - inferior','',''),(1330,'fr_FR','Édition d\'une marque - en bas','',''),(1330,'it_IT',NULL,'',''),(1330,'ru_RU','Редактирование бренда - внизу','',''),(1331,'cs_CZ',NULL,'',''),(1331,'de_DE','Deklination Bearbeitung - oben','',''),(1331,'en_US','Attribute edit - top','',''),(1331,'es_ES','Editar atributo - superior','',''),(1331,'fr_FR','Édition d\'une déclinaison - en haut','',''),(1331,'it_IT',NULL,'',''),(1331,'ru_RU','Редактирование атрибута - вверху','',''),(1332,'cs_CZ',NULL,'',''),(1332,'de_DE','Deklination Bearbeitung - unten','',''),(1332,'en_US','Attribute edit - bottom','',''),(1332,'es_ES','Edición de atributos - inferior','',''),(1332,'fr_FR','Édition d\'une déclinaison - en bas','',''),(1332,'it_IT',NULL,'',''),(1332,'ru_RU','Редактирование атрибута - внизу','',''),(1333,'cs_CZ',NULL,'',''),(1333,'de_DE','Währung Bearbeitung - oben','',''),(1333,'en_US','Currency edit - top','',''),(1333,'es_ES','Editar Monedas - Cabecera','',''),(1333,'fr_FR','Édition d\'une devise - en haut','',''),(1333,'it_IT',NULL,'',''),(1333,'ru_RU','Редактирование валюты - вверху','',''),(1334,'cs_CZ',NULL,'',''),(1334,'de_DE','Währung Bearbeitung - unten','',''),(1334,'en_US','Currency edit - bottom','',''),(1334,'es_ES','Editar Monedas - Pie','',''),(1334,'fr_FR','Édition d\'une devise - en bas','',''),(1334,'it_IT',NULL,'',''),(1334,'ru_RU','Редактирование валюты - внизу','',''),(1335,'cs_CZ',NULL,'',''),(1335,'de_DE','Währung Bearbeitung - oben','',''),(1335,'en_US','Country edit - top','',''),(1335,'es_ES','Edición de país - parte superior','',''),(1335,'fr_FR','Édition d\'un pays - en haut','',''),(1335,'it_IT',NULL,'',''),(1335,'ru_RU','Редактирование страны - вверху','',''),(1336,'cs_CZ',NULL,'',''),(1336,'de_DE','Währung Bearbeitung - unten','',''),(1336,'en_US','Country edit - bottom','',''),(1336,'es_ES','Edición de pais - parte inferior','',''),(1336,'fr_FR','Édition d\'un pays - en bas','',''),(1336,'it_IT',NULL,'',''),(1336,'ru_RU','Редактирование страны - внизу','',''),(1337,'cs_CZ',NULL,'',''),(1337,'de_DE','Inhalt Bearbeitung - oben','',''),(1337,'en_US','Content edit - top','',''),(1337,'es_ES','Editar contenido - superior','',''),(1337,'fr_FR','Édition d\'un contenu - en haut','',''),(1337,'it_IT',NULL,'',''),(1337,'ru_RU','Редактирование контента - вверху','',''),(1338,'cs_CZ',NULL,'',''),(1338,'de_DE','Inhalt Bearbeitung - unten','',''),(1338,'en_US','Content edit - bottom','',''),(1338,'es_ES','Editar Contenido - inferior','',''),(1338,'fr_FR','Édition d\'un contenu - en bas','',''),(1338,'it_IT',NULL,'',''),(1338,'ru_RU','Редактирование контента - внизу','',''),(1339,'cs_CZ',NULL,'',''),(1339,'de_DE','Charakteristik Bearbeitung - oben','',''),(1339,'en_US','Feature edit - top','',''),(1339,'es_ES','Editar Característica - superior','',''),(1339,'fr_FR','Édition d\'une caractéristique - en haut','',''),(1339,'it_IT',NULL,'',''),(1339,'ru_RU','Редактирование характеристики - вверху','',''),(1340,'cs_CZ',NULL,'',''),(1340,'de_DE','Charakteristik Bearbeitung - unten','',''),(1340,'en_US','Feature edit - bottom','',''),(1340,'es_ES','Editar Característica - inferior','',''),(1340,'fr_FR','Édition d\'une caractéristique - en bas','',''),(1340,'it_IT',NULL,'',''),(1340,'ru_RU','Редактирование характеристики - внизу','',''),(1341,'cs_CZ',NULL,'',''),(1341,'de_DE','Dokument Bearbeitung - oben','',''),(1341,'en_US','Document edit - top','',''),(1341,'es_ES','Edición de documentos - cabecera','',''),(1341,'fr_FR','Édition d\'un document - en haut','',''),(1341,'it_IT',NULL,'',''),(1341,'ru_RU','Редактирование документа - вверху','',''),(1342,'cs_CZ',NULL,'',''),(1342,'de_DE','Dokument Bearbeitung - unten','',''),(1342,'en_US','Document edit - bottom','',''),(1342,'es_ES','Edición de documentos - pie','',''),(1342,'fr_FR','Édition d\'un document - en bas','',''),(1342,'it_IT',NULL,'',''),(1342,'ru_RU','Редактирование документа - внизу','',''),(1343,'cs_CZ',NULL,'',''),(1343,'de_DE','Kunde Bearbeitung - oben','',''),(1343,'en_US','Client edit - top','',''),(1343,'es_ES','Editar cliente - superior','',''),(1343,'fr_FR','Édition d\'un client - en haut','',''),(1343,'it_IT',NULL,'',''),(1343,'ru_RU','Редактирование клиента - вверху','',''),(1344,'cs_CZ',NULL,'',''),(1344,'de_DE','Kunde Bearbeitung - unten','',''),(1344,'en_US','Client edit - bottom','',''),(1344,'es_ES','Editar cliente - parte inferior','',''),(1344,'fr_FR','Édition d\'un client - en bas','',''),(1344,'it_IT',NULL,'',''),(1344,'ru_RU','Редактирование клиента - внизу','',''),(1345,'cs_CZ',NULL,'',''),(1345,'de_DE','Bild Bearbeitung - oben','',''),(1345,'en_US','Image edit - top','',''),(1345,'es_ES','Edición de imagen - parte superior','',''),(1345,'fr_FR','Édition d\'image - en haut','',''),(1345,'it_IT',NULL,'',''),(1345,'ru_RU','Редактирование изображения - вверху','',''),(1346,'cs_CZ',NULL,'',''),(1346,'de_DE','Bild Bearbeitung - unten','',''),(1346,'en_US','Image edit - bottom','',''),(1346,'es_ES','Edición de imagen - parte inferior','',''),(1346,'fr_FR','Édition d\'image - en bas','',''),(1346,'it_IT',NULL,'',''),(1346,'ru_RU','Редактирование изображения - внизу','',''),(1347,'cs_CZ',NULL,'',''),(1347,'de_DE','Hook Bearbeitung - oben','',''),(1347,'en_US','Hook edit - top','',''),(1347,'es_ES','Edición de Hook - superior','',''),(1347,'fr_FR','Édition d\'hook - en haut','',''),(1347,'it_IT',NULL,'',''),(1347,'ru_RU','Редактирование хука - вверху','',''),(1348,'cs_CZ',NULL,'',''),(1348,'de_DE','Hook Bearbeitung - unten','',''),(1348,'en_US','Hook edit - bottom','',''),(1348,'es_ES','Edición de Hook - inferior','',''),(1348,'fr_FR','Édition d\'hook - en bas','',''),(1348,'it_IT',NULL,'',''),(1348,'ru_RU','Редактирование хука - внизу','',''),(1349,'cs_CZ',NULL,'',''),(1349,'de_DE','Ordner Bearbeitung - oben','',''),(1349,'en_US','Folder edit - top','',''),(1349,'es_ES','Edición de carpeta - superior','',''),(1349,'fr_FR','Édition d\'un dossier - en haut','',''),(1349,'it_IT',NULL,'',''),(1349,'ru_RU','Редактирование папки - вверху','',''),(1350,'cs_CZ',NULL,'',''),(1350,'de_DE','Ordner Bearbeitung - unten','',''),(1350,'en_US','Folder edit - bottom','',''),(1350,'es_ES','Editar carpeta - parte inferior','',''),(1350,'fr_FR','Édition d\'un dossier - en bas','',''),(1350,'it_IT',NULL,'',''),(1350,'ru_RU','Редактирование папки - внизу','',''),(1351,'cs_CZ',NULL,'',''),(1351,'de_DE','Modul-Hook Bearbeitung - oben','',''),(1351,'en_US','Module hook edit - top','',''),(1351,'es_ES',NULL,'',''),(1351,'fr_FR','Édition d\'un hook de module - en haut','',''),(1351,'it_IT',NULL,'',''),(1351,'ru_RU','Редактирование хука модуля - вверху','',''),(1352,'cs_CZ',NULL,'',''),(1352,'de_DE','Modul-Hook Bearbeitung - unten','',''),(1352,'en_US','Module hook edit - bottom','',''),(1352,'es_ES',NULL,'',''),(1352,'fr_FR','Édition d\'un hook de module - en bas','',''),(1352,'it_IT',NULL,'',''),(1352,'ru_RU','Редактирование хука модуля - внизу','',''),(1353,'cs_CZ',NULL,'',''),(1353,'de_DE','Modul Bearbeitung - oben','',''),(1353,'en_US','Module edit - top','',''),(1353,'es_ES','Edición de módulo - tope','',''),(1353,'fr_FR','Édition d\'un module - en haut','',''),(1353,'it_IT',NULL,'',''),(1353,'ru_RU','Редактирование модуля - вверху','',''),(1354,'cs_CZ',NULL,'',''),(1354,'de_DE','Modul Bearbeitung - unten','',''),(1354,'en_US','Module edit - bottom','',''),(1354,'es_ES','Edición de módulo - base','',''),(1354,'fr_FR','Édition d\'un module - en bas','',''),(1354,'it_IT',NULL,'',''),(1354,'ru_RU','Редактирование модуля - внизу','',''),(1355,'cs_CZ',NULL,'',''),(1355,'de_DE','Nachricht Bearbeitung - oben','',''),(1355,'en_US','Message edit - top','',''),(1355,'es_ES','Editar mensaje - tope','',''),(1355,'fr_FR','Édition d\'un message - en haut','',''),(1355,'it_IT',NULL,'',''),(1355,'ru_RU','Редактирование сообщения - вверху','',''),(1356,'cs_CZ',NULL,'',''),(1356,'de_DE','Nachricht Bearbeitung - unten','',''),(1356,'en_US','Message edit - bottom','',''),(1356,'es_ES','Editar mensaje - base','',''),(1356,'fr_FR','Édition d\'un message - en bas','',''),(1356,'it_IT',NULL,'',''),(1356,'ru_RU','Редактирование сообщения - внизу','',''),(1357,'cs_CZ',NULL,'',''),(1357,'de_DE','Profil Bearbeitung - oben','',''),(1357,'en_US','Profile edit - top','',''),(1357,'es_ES','Editar Perfil - parte superior','',''),(1357,'fr_FR','Édition d\'un profil - en haut','',''),(1357,'it_IT',NULL,'',''),(1357,'ru_RU','Редактирование профиля - вверху','',''),(1358,'cs_CZ',NULL,'',''),(1358,'de_DE','Profil Bearbeitung - unten','',''),(1358,'en_US','Profile edit - bottom','',''),(1358,'es_ES','Editar Perfil - parte inferior','',''),(1358,'fr_FR','Édition d\'un profil - en bas','',''),(1358,'it_IT',NULL,'',''),(1358,'ru_RU','Редактирование профиля - внизу','',''),(1359,'cs_CZ',NULL,'',''),(1359,'de_DE','Produkt Bearbeitung - oben','',''),(1359,'en_US','Product edit - top','',''),(1359,'es_ES','Editar producto - parte superior','',''),(1359,'fr_FR','Édition d\'un produit - en haut','',''),(1359,'it_IT',NULL,'',''),(1359,'ru_RU','Редактирование товара - вверху','',''),(1360,'cs_CZ',NULL,'',''),(1360,'de_DE','Produkt Bearbeitung - unten','',''),(1360,'en_US','Product edit - bottom','',''),(1360,'es_ES','Editar producto - parte inferior','',''),(1360,'fr_FR','Édition d\'un produit - en bas','',''),(1360,'it_IT',NULL,'',''),(1360,'ru_RU','Редактирование товара - внизу','',''),(1361,'cs_CZ',NULL,'',''),(1361,'de_DE','Bestellung Bearbeitung - oben','',''),(1361,'en_US','Order edit - top','',''),(1361,'es_ES','Edición de Pedido - al tope','',''),(1361,'fr_FR','Édition d\'une commande - en haut','',''),(1361,'it_IT',NULL,'',''),(1361,'ru_RU','Редактирование заказа - вверху','',''),(1362,'cs_CZ',NULL,'',''),(1362,'de_DE','Bestellung Bearbeitung - unten','',''),(1362,'en_US','Order edit - bottom','',''),(1362,'es_ES','Editar Orden - parte inferior','',''),(1362,'fr_FR','Édition d\'une commande - en bas','',''),(1362,'it_IT',NULL,'',''),(1362,'ru_RU','Редактирование заказа - внизу','',''),(1363,'cs_CZ',NULL,'',''),(1363,'de_DE','Transporteur Lieferzonen Bearbeitung - oben','',''),(1363,'en_US','Shipping zones edit - top','',''),(1363,'es_ES','Edición zonas de envío - inicio','',''),(1363,'fr_FR','Édition des zones de livraison d\'un transporteur - en haut','',''),(1363,'it_IT',NULL,'',''),(1363,'ru_RU','Редактирование зон доставки - вверху','',''),(1364,'cs_CZ',NULL,'',''),(1364,'de_DE','Transporteur Lieferzonen Bearbeitung - unten','',''),(1364,'en_US','Shipping zones edit - bottom','',''),(1364,'es_ES','Edición zonas de envío - base','',''),(1364,'fr_FR','Édition des zones de livraison d\'un transporteur - en bas','',''),(1364,'it_IT',NULL,'',''),(1364,'ru_RU','Редактирование зон доставки - внизу','',''),(1365,'cs_CZ',NULL,'',''),(1365,'de_DE','Lieferzone Bearbeitung - oben','',''),(1365,'en_US','Shipping configuration edit - top','',''),(1365,'es_ES','Configuración de envío - inicio','',''),(1365,'fr_FR','Édition d\'une zone de livraison - en haut','',''),(1365,'it_IT',NULL,'',''),(1365,'ru_RU','Редактирование конфигурации доставки - вверху','',''),(1366,'cs_CZ',NULL,'',''),(1366,'de_DE','Lieferzone Bearbeitung - unten','',''),(1366,'en_US','Shipping configuration edit - bottom','',''),(1366,'es_ES','Configuración de envío - base','',''),(1366,'fr_FR','Édition d\'une zone de livraiso - en bas','',''),(1366,'it_IT',NULL,'',''),(1366,'ru_RU','Редактирование конфигурации доставки - внизу','',''),(1367,'cs_CZ',NULL,'',''),(1367,'de_DE','Sonderangebot Bearbeitung - oben','',''),(1367,'en_US','Sale edit - top','',''),(1367,'es_ES','Editar Venta - parte superior','',''),(1367,'fr_FR','Édition d\'une promotion - en haut','',''),(1367,'it_IT',NULL,'',''),(1367,'ru_RU','Редактирование распродажи - вверху','',''),(1368,'cs_CZ',NULL,'',''),(1368,'de_DE','Sonderangebot Bearbeitung - unten','',''),(1368,'en_US','Sale edit - bottom','',''),(1368,'es_ES','Editar Venta - parte inferior','',''),(1368,'fr_FR','Édition d\'une promotion - en bas','',''),(1368,'it_IT',NULL,'',''),(1368,'ru_RU','Редактирование распродажи - внизу','',''),(1369,'cs_CZ',NULL,'',''),(1369,'de_DE','Variable Bearbeitung - oben','',''),(1369,'en_US','Variable edit - top','',''),(1369,'es_ES','Editar variable - parte superior','',''),(1369,'fr_FR','Édition d\'une variable - en haut','',''),(1369,'it_IT',NULL,'',''),(1369,'ru_RU','Редактирование переменной - вверху','',''),(1370,'cs_CZ',NULL,'',''),(1370,'de_DE','Variable Bearbeitung - unten','',''),(1370,'en_US','Variable edit - bottom','',''),(1370,'es_ES','Editar variable - parte inferior','',''),(1370,'fr_FR','Édition d\'une variable - en bas','',''),(1370,'it_IT',NULL,'',''),(1370,'ru_RU','Редактирование переменной - внизу','',''),(1371,'cs_CZ',NULL,'',''),(1371,'de_DE','Template Bearbeitung - oben','',''),(1371,'en_US','Template edit - top','',''),(1371,'es_ES','Editar plantilla - parte superior','',''),(1371,'fr_FR','Édition d\'un gabarit - en haut','',''),(1371,'it_IT',NULL,'',''),(1371,'ru_RU','Редактирование шаблона - вверху','',''),(1372,'cs_CZ',NULL,'',''),(1372,'de_DE','Template Bearbeitung - unten','',''),(1372,'en_US','Template edit - bottom','',''),(1372,'es_ES','Editar plantilla - parte inferior','',''),(1372,'fr_FR','Édition d\'un gabarit - en bas','',''),(1372,'it_IT',NULL,'',''),(1372,'ru_RU','Редактирование шаблона - внизу','',''),(1373,'cs_CZ',NULL,'',''),(1373,'de_DE','Taxregel Bearbeitung - oben','',''),(1373,'en_US','Tax rule edit - top','',''),(1373,'es_ES','Edición de regla de impuesto - parte superior','',''),(1373,'fr_FR','Édition d\'une règle de taxe - en haut','',''),(1373,'it_IT',NULL,'',''),(1373,'ru_RU','Редактирование налогового правила - вверху','',''),(1374,'cs_CZ',NULL,'',''),(1374,'de_DE','Taxregel Bearbeitung - unten','',''),(1374,'en_US','Tax rule edit - bottom','',''),(1374,'es_ES','Editar regla de Impuesto - base','',''),(1374,'fr_FR','Édition d\'une règle de taxe - en bas','',''),(1374,'it_IT',NULL,'',''),(1374,'ru_RU','Редактирование налогового правила - внизу','',''),(1375,'cs_CZ',NULL,'',''),(1375,'de_DE','Taxe Bearbeitung - oben','',''),(1375,'en_US','Tax edit - top','',''),(1375,'es_ES','Editar Impuesto - parte superior','',''),(1375,'fr_FR','Édition d\'une taxe - en haut','',''),(1375,'it_IT',NULL,'',''),(1375,'ru_RU','Редактирование налога - вверху','',''),(1376,'cs_CZ',NULL,'',''),(1376,'de_DE','Taxe Bearbeitung - unten','',''),(1376,'en_US','Tax edit - bottom','',''),(1376,'es_ES','Editar Impuesto - base','',''),(1376,'fr_FR','Édition d\'une taxe - en bas','',''),(1376,'it_IT',NULL,'',''),(1376,'ru_RU','Редактирование налога - внизу','',''),(1377,'cs_CZ',NULL,'',''),(1377,'de_DE','Bestellungs Bearbeitung - unter die Produktdaten','',''),(1377,'en_US','Order edit - displayed after product information','',''),(1377,'es_ES','Edición de Pedido - se muestra después de la información de producto','',''),(1377,'fr_FR','Édition d\'une commande - sous les informations du produit','',''),(1377,'it_IT',NULL,'',''),(1377,'ru_RU','Редактирование заказа - отображается после информации о товаре','',''),(1378,'cs_CZ',NULL,'',''),(1378,'de_DE','SEO Tab - oben','',''),(1378,'en_US','Tab SEO - top','',''),(1378,'es_ES','Ficha SEO - arriba','',''),(1378,'fr_FR','Onglet SEO - en haut','',''),(1378,'it_IT',NULL,'',''),(1378,'ru_RU','Вкладка SEO - вверху','',''),(1379,'cs_CZ',NULL,'',''),(1379,'de_DE','SEO Tab - unten','',''),(1379,'en_US','Tab SEO - bottom','',''),(1379,'es_ES','Ficha SEO - abajo','',''),(1379,'fr_FR','Onglet SEO - en bas','',''),(1379,'it_IT',NULL,'',''),(1379,'ru_RU','Вкладка SEO - внизу','',''),(1380,'cs_CZ',NULL,'',''),(1380,'de_DE','Bild Tab - oben','',''),(1380,'en_US','Tab image - top','',''),(1380,'es_ES','Pestaña de imagen - arriba','',''),(1380,'fr_FR','Onglet image - en haut','',''),(1380,'it_IT',NULL,'',''),(1380,'ru_RU','Вкладка изображений - вверху','',''),(1381,'cs_CZ',NULL,'',''),(1381,'de_DE','Bild Tab - unten','',''),(1381,'en_US','Tab image - bottom','',''),(1381,'es_ES','Pestaña de imagen - abajo','',''),(1381,'fr_FR','Onglet image - en bas','',''),(1381,'it_IT',NULL,'',''),(1381,'ru_RU','Вкладка изображений - внизу','',''),(1382,'cs_CZ',NULL,'',''),(1382,'de_DE','Dokument Tab - oben','',''),(1382,'en_US','Tab document - top','',''),(1382,'es_ES','Ficha de documento - arriba','',''),(1382,'fr_FR','Onglet document - en haut','',''),(1382,'it_IT',NULL,'',''),(1382,'ru_RU','Вкладка документов - вверху','',''),(1383,'cs_CZ',NULL,'',''),(1383,'de_DE','Dokument Tab - unten','',''),(1383,'en_US','Tab document - bottom','',''),(1383,'es_ES','Ficha de documento - abajo','',''),(1383,'fr_FR','Onglet document - en bas','',''),(1383,'it_IT',NULL,'',''),(1383,'ru_RU','Вкладка документов - внизу','',''),(1384,'cs_CZ',NULL,'',''),(1384,'de_DE','Export modal or page - oben','',''),(1384,'en_US','Export modal or page - top','',''),(1384,'es_ES','Modal o página de exportación - superior','',''),(1384,'fr_FR','Modal ou page d\'export - en haut','',''),(1384,'it_IT',NULL,'',''),(1384,'ru_RU','Страница или модальное окно экспорта - вверху','',''),(1385,'cs_CZ',NULL,'',''),(1385,'de_DE','Export modal or page - unten','',''),(1385,'en_US','Export modal or page - bottom','',''),(1385,'es_ES','Modal o página de exportación - inferior','',''),(1385,'fr_FR','Modal ou page d\'export - en bas','',''),(1385,'it_IT',NULL,'',''),(1385,'ru_RU','Страница или модальное окно экспорта - внизу','',''),(1386,'cs_CZ',NULL,'',''),(1386,'de_DE','Bestellung - Kunde Informationen unten','',''),(1386,'en_US','Order - customer information bottom','',''),(1386,'es_ES','Orden - parte inferior de información del cliente','',''),(1386,'fr_FR','Commande - en bas des  informations client','',''),(1386,'it_IT',NULL,'',''),(1386,'ru_RU','Заказ - внизу информации о клиенте','',''),(1387,'cs_CZ',NULL,'',''),(1387,'de_DE','Bestellung - Zahlungsmodul unten','',''),(1387,'en_US','Order - payment module bottom','',''),(1387,'es_ES','Orden - parte inferior del módulo de pago','',''),(1387,'fr_FR','Commande - en bas du module de paiement','',''),(1387,'it_IT',NULL,'',''),(1387,'ru_RU','Заказ - внизу модуля оплаты','',''),(1388,'cs_CZ',NULL,'',''),(1388,'de_DE','Bestellung - Liefermodul unten','',''),(1388,'en_US','Order - delivery module bottom','',''),(1388,'es_ES','Orden - parte inferior del módulo de entrega','',''),(1388,'fr_FR','Commande - en bas du module de livraison','',''),(1388,'it_IT',NULL,'',''),(1388,'ru_RU','Заказ - внизу модуля доставки','',''),(1389,'cs_CZ',NULL,'',''),(1389,'de_DE','Registerkarte SEO - Update-Formular','',''),(1389,'en_US','Tab SEO - update form','',''),(1389,'es_ES','Ficha SEO - formato de actualización','',''),(1389,'fr_FR','Onglet SEO - formulaire de mise à jour','',''),(1389,'it_IT',NULL,'',''),(1389,'ru_RU','Вкладка SEO - форма обновления','',''),(1390,'cs_CZ',NULL,'',''),(1390,'de_DE','Bestellung bearbeiten - Produkttabelle Header','',''),(1390,'en_US','Order edit - order product table header','',''),(1390,'es_ES','Edición de Pedido - encabezado de la tabla de pedido de producto','',''),(1390,'fr_FR','Modification commande - en-tête des produits','',''),(1390,'it_IT',NULL,'',''),(1390,'ru_RU','Редактирование заказа - заголовок таблицы заказ товара','',''),(1391,'cs_CZ',NULL,'',''),(1391,'de_DE','Bestellung bearbeiten - Produkttabelle Zeile','',''),(1391,'en_US','Order edit - order product table row','',''),(1391,'es_ES','Edición de Pedido - fila de la tabla del pedido de producto','',''),(1391,'fr_FR','Modification commande - ligne du tableau des produits','',''),(1391,'it_IT',NULL,'',''),(1391,'ru_RU','Редактирование заказа - строка таблицы заказ товара','',''),(1392,'cs_CZ',NULL,'',''),(1392,'de_DE','Administratoren - Header','',''),(1392,'en_US','Administrators - header','',''),(1392,'es_ES','Administradores - cabecera','',''),(1392,'fr_FR','Administrateurs - en-tête','',''),(1392,'it_IT',NULL,'',''),(1392,'ru_RU','Администраторы - заголовок','',''),(1393,'cs_CZ',NULL,'',''),(1393,'de_DE','Administratoren - Zeile','',''),(1393,'en_US','Administrators - row','',''),(1393,'es_ES','Administradores - fila','',''),(1393,'fr_FR','Administrateurs - ligne','',''),(1393,'it_IT',NULL,'',''),(1393,'ru_RU','Администраторы - строка','',''),(1394,'cs_CZ',NULL,'',''),(1394,'de_DE','Erweiterte Konfiguration','',''),(1394,'en_US','Advanced Configuration','',''),(1394,'es_ES','Configuración avanzada','',''),(1394,'fr_FR','Configuration avancée','',''),(1394,'it_IT',NULL,'',''),(1394,'ru_RU','Расширенная конфигурация','',''),(1395,'cs_CZ',NULL,'',''),(1395,'de_DE','Erweiterte Konfiguration - JavaScript','',''),(1395,'en_US','Advanced Configuration - Javascript','',''),(1395,'es_ES','Configuración avanzada - JavaScript','',''),(1395,'fr_FR','Configuration avancée - JavaScript','',''),(1395,'it_IT',NULL,'',''),(1395,'ru_RU','Расширенная конфигурация - Javascript','',''),(1396,'cs_CZ',NULL,NULL,NULL),(1396,'de_DE','Marke bearbeiten - Rechte Spalte oben',NULL,NULL),(1396,'en_US','Brand edit - right column top',NULL,NULL),(1396,'es_ES','Edición de marca - encabezado de la columna derecha',NULL,NULL),(1396,'fr_FR','Édition d\'une marque - en haut de la colonne de droite',NULL,NULL),(1396,'it_IT',NULL,NULL,NULL),(1396,'ru_RU','Редактирование бренда - вверху правой колонки',NULL,NULL),(1397,'cs_CZ',NULL,NULL,NULL),(1397,'de_DE','Marke bearbeiten - Rechte Spalte unten',NULL,NULL),(1397,'en_US','Brand edit - right column bottom',NULL,NULL),(1397,'es_ES','Edición de marca - al pie de la columna derecha',NULL,NULL),(1397,'fr_FR','Édition d\'une marque - en bas de la colonne de droite',NULL,NULL),(1397,'it_IT',NULL,NULL,NULL),(1397,'ru_RU','Редактирование бренда - внизу правой колонки',NULL,NULL),(1398,'cs_CZ',NULL,NULL,NULL),(1398,'de_DE',NULL,NULL,NULL),(1398,'en_US','Category edit - right column top',NULL,NULL),(1398,'es_ES','Edición de categoría - al tope de la columna derecha',NULL,NULL),(1398,'fr_FR','Édition d\'une catégorie - en haut de la colonne de droite',NULL,NULL),(1398,'it_IT',NULL,NULL,NULL),(1398,'ru_RU','Редактирование категории - вверху правой колонки',NULL,NULL),(1399,'cs_CZ',NULL,NULL,NULL),(1399,'de_DE',NULL,NULL,NULL),(1399,'en_US','Category edit - right column bottom',NULL,NULL),(1399,'es_ES','Edición de categoría - al pie de la columna derecha',NULL,NULL),(1399,'fr_FR','Édition d\'une catégorie - en bas de la colonne de droite',NULL,NULL),(1399,'it_IT',NULL,NULL,NULL),(1399,'ru_RU','Редактирование категории - внизу правой колонки',NULL,NULL),(1400,'cs_CZ',NULL,NULL,NULL),(1400,'de_DE','Inhalt bearbeiten - Rechte Spalte oben',NULL,NULL),(1400,'en_US','Content edit - right column top',NULL,NULL),(1400,'es_ES','Edición de Contenido - al tope de la columna derecha',NULL,NULL),(1400,'fr_FR','Édition d\'un contenu - en haut de la colonne de droite',NULL,NULL),(1400,'it_IT',NULL,NULL,NULL),(1400,'ru_RU','Редактирование контента - вверху правой колонки',NULL,NULL),(1401,'cs_CZ',NULL,NULL,NULL),(1401,'de_DE','Inhalt bearbeiten - Rechte Spalte unten',NULL,NULL),(1401,'en_US','Content edit - right column bottom',NULL,NULL),(1401,'es_ES','Edición de Contenido - al pie de la columna derecha',NULL,NULL),(1401,'fr_FR','Édition d\'un contenu  - en bas de la colonne de droite',NULL,NULL),(1401,'it_IT',NULL,NULL,NULL),(1401,'ru_RU','Редактирование контента - внизу правой колонки',NULL,NULL),(1402,'cs_CZ',NULL,NULL,NULL),(1402,'de_DE','Ordner bearbeiten - Rechte Spalte oben',NULL,NULL),(1402,'en_US','Folder edit - right column top',NULL,NULL),(1402,'es_ES','Edición de carpeta - al tope de la columna derecha',NULL,NULL),(1402,'fr_FR','Édition d\'un dossier - en haut de la colonne de droite',NULL,NULL),(1402,'it_IT',NULL,NULL,NULL),(1402,'ru_RU','Редактирование папки - вверху правой колонки',NULL,NULL),(1403,'cs_CZ',NULL,NULL,NULL),(1403,'de_DE','Ordner bearbeiten - Rechte Spalte unten',NULL,NULL),(1403,'en_US','Folder edit - right column bottom',NULL,NULL),(1403,'es_ES','Edición de carpeta - al pie de la columna derecha',NULL,NULL),(1403,'fr_FR','Édition d\'un dossier - en bas de la colonne de droite',NULL,NULL),(1403,'it_IT',NULL,NULL,NULL),(1403,'ru_RU','Редактирование папки - внизу правой колонки',NULL,NULL),(1404,'cs_CZ',NULL,NULL,NULL),(1404,'de_DE',NULL,NULL,NULL),(1404,'en_US','Product edit - right column top',NULL,NULL),(1404,'es_ES','Edición de producto - encabezado de la columna derecha',NULL,NULL),(1404,'fr_FR','Édition d\'un produit - en haut de la colonne de droite',NULL,NULL),(1404,'it_IT',NULL,NULL,NULL),(1404,'ru_RU','Редактирование товара - вверху правой колонки',NULL,NULL),(1405,'cs_CZ',NULL,NULL,NULL),(1405,'de_DE',NULL,NULL,NULL),(1405,'en_US','Product edit - right column bottom',NULL,NULL),(1405,'es_ES','Edición de producto - al pie de la columna derecha',NULL,NULL),(1405,'fr_FR','Édition d\'un produit - en bas de la colonne de droite',NULL,NULL),(1405,'it_IT',NULL,NULL,NULL),(1405,'ru_RU','Редактирование товара - внизу правой колонки',NULL,NULL),(1406,'cs_CZ',NULL,'',''),(1406,'de_DE',NULL,'',''),(1406,'en_US','state-edit - at the top','',''),(1406,'es_ES','estado - editar - encabezado','',''),(1406,'fr_FR','édition d\'un état - en haut','',''),(1406,'it_IT',NULL,'',''),(1406,'ru_RU','Редактирование штата - вверху','',''),(1407,'cs_CZ',NULL,'',''),(1407,'de_DE',NULL,'',''),(1407,'en_US','state-edit - bottom','',''),(1407,'es_ES','estado - al pie','',''),(1407,'fr_FR','édition d\'un état - en bas','',''),(1407,'it_IT',NULL,'',''),(1407,'ru_RU','Редактирование штата - внизу','',''),(1408,'cs_CZ',NULL,'',''),(1408,'de_DE',NULL,'',''),(1408,'en_US','state - Edit JavaScript','',''),(1408,'es_ES','estado - Editar JavaScript','',''),(1408,'fr_FR','Etat - JavaScript modification','',''),(1408,'it_IT',NULL,'',''),(1408,'ru_RU','Штат - Редактирование JavaScript','',''),(1409,'cs_CZ',NULL,'',''),(1409,'de_DE',NULL,'',''),(1409,'en_US','states - at the top','',''),(1409,'es_ES','estados - encabezado','',''),(1409,'fr_FR','états - en haut','',''),(1409,'it_IT',NULL,'',''),(1409,'ru_RU','Штаты - вверху','',''),(1410,'cs_CZ',NULL,'',''),(1410,'de_DE',NULL,'',''),(1410,'en_US','states - table header','',''),(1410,'es_ES','estados - encabezado de tabla','',''),(1410,'fr_FR','états - colonne tableau','',''),(1410,'it_IT',NULL,'',''),(1410,'ru_RU','Штаты - заголовок таблицы','',''),(1411,'cs_CZ',NULL,'',''),(1411,'de_DE',NULL,'',''),(1411,'en_US','states - table row','',''),(1411,'es_ES','estados - fila de tabla','',''),(1411,'fr_FR','états - ligne du tableau','',''),(1411,'it_IT',NULL,'',''),(1411,'ru_RU','Штаты - строка таблицы','',''),(1412,'cs_CZ',NULL,'',''),(1412,'de_DE',NULL,'',''),(1412,'en_US','states - bottom','',''),(1412,'es_ES','estados - al pie','',''),(1412,'fr_FR','états - bas','',''),(1412,'it_IT',NULL,'',''),(1412,'ru_RU','Штаты - внизу','',''),(1413,'cs_CZ',NULL,'',''),(1413,'de_DE',NULL,'',''),(1413,'en_US','state - creation form','',''),(1413,'es_ES','estado - formulario de creación','',''),(1413,'fr_FR','état - formulaire de création','',''),(1413,'it_IT',NULL,'',''),(1413,'ru_RU','Штат - форма создания','',''),(1414,'cs_CZ',NULL,'',''),(1414,'de_DE',NULL,'',''),(1414,'en_US','state - delete form','',''),(1414,'es_ES','estado - formulario de borrado','',''),(1414,'fr_FR','état - formulaire de suppression','',''),(1414,'it_IT',NULL,'',''),(1414,'ru_RU','Штат - форма удаления','',''),(1415,'cs_CZ',NULL,'',''),(1415,'de_DE',NULL,'',''),(1415,'en_US','states - JavaScript','',''),(1415,'es_ES','estados - JavaScript','',''),(1415,'fr_FR','états - JavaScript','',''),(1415,'it_IT',NULL,'',''),(1415,'ru_RU','Штаты - JavaScript','',''),(1416,'cs_CZ',NULL,NULL,NULL),(1416,'de_DE',NULL,NULL,NULL),(1416,'en_US','Configuration - Order path - top',NULL,NULL),(1416,'es_ES',NULL,NULL,NULL),(1416,'fr_FR',NULL,NULL,NULL),(1416,'it_IT',NULL,NULL,NULL),(1416,'ru_RU',NULL,NULL,NULL),(1417,'cs_CZ',NULL,NULL,NULL),(1417,'de_DE',NULL,NULL,NULL),(1417,'en_US','Configuration - Order path - bottom',NULL,NULL),(1417,'es_ES',NULL,NULL,NULL),(1417,'fr_FR',NULL,NULL,NULL),(1417,'it_IT',NULL,NULL,NULL),(1417,'ru_RU',NULL,NULL,NULL),(1418,'cs_CZ',NULL,NULL,NULL),(1418,'de_DE',NULL,NULL,NULL),(1418,'en_US','Order status - top',NULL,NULL),(1418,'es_ES',NULL,NULL,NULL),(1418,'fr_FR',NULL,NULL,NULL),(1418,'it_IT',NULL,NULL,NULL),(1418,'ru_RU',NULL,NULL,NULL),(1419,'cs_CZ',NULL,NULL,NULL),(1419,'de_DE',NULL,NULL,NULL),(1419,'en_US','Order status - bottom',NULL,NULL),(1419,'es_ES',NULL,NULL,NULL),(1419,'fr_FR',NULL,NULL,NULL),(1419,'it_IT',NULL,NULL,NULL),(1419,'ru_RU',NULL,NULL,NULL),(1420,'cs_CZ',NULL,NULL,NULL),(1420,'de_DE',NULL,NULL,NULL),(1420,'en_US','Order status - table header',NULL,NULL),(1420,'es_ES',NULL,NULL,NULL),(1420,'fr_FR',NULL,NULL,NULL),(1420,'it_IT',NULL,NULL,NULL),(1420,'ru_RU',NULL,NULL,NULL),(1421,'cs_CZ',NULL,NULL,NULL),(1421,'de_DE',NULL,NULL,NULL),(1421,'en_US','Order status - table row',NULL,NULL),(1421,'es_ES',NULL,NULL,NULL),(1421,'fr_FR',NULL,NULL,NULL),(1421,'it_IT',NULL,NULL,NULL),(1421,'ru_RU',NULL,NULL,NULL),(1422,'cs_CZ',NULL,NULL,NULL),(1422,'de_DE',NULL,NULL,NULL),(1422,'en_US','Order status - form creation',NULL,NULL),(1422,'es_ES',NULL,NULL,NULL),(1422,'fr_FR',NULL,NULL,NULL),(1422,'it_IT',NULL,NULL,NULL),(1422,'ru_RU',NULL,NULL,NULL),(1423,'cs_CZ',NULL,NULL,NULL),(1423,'de_DE',NULL,NULL,NULL),(1423,'en_US','Order status - form modification',NULL,NULL),(1423,'es_ES',NULL,NULL,NULL),(1423,'fr_FR',NULL,NULL,NULL),(1423,'it_IT',NULL,NULL,NULL),(1423,'ru_RU',NULL,NULL,NULL),(1424,'cs_CZ',NULL,NULL,NULL),(1424,'de_DE',NULL,NULL,NULL),(1424,'en_US','Order status - JavaScript',NULL,NULL),(1424,'es_ES',NULL,NULL,NULL),(1424,'fr_FR',NULL,NULL,NULL),(1424,'it_IT',NULL,NULL,NULL),(1424,'ru_RU',NULL,NULL,NULL),(1425,'cs_CZ',NULL,NULL,NULL),(1425,'de_DE',NULL,NULL,NULL),(1425,'en_US','Edit images for an item',NULL,NULL),(1425,'es_ES',NULL,NULL,NULL),(1425,'fr_FR',NULL,NULL,NULL),(1425,'it_IT',NULL,NULL,NULL),(1425,'ru_RU',NULL,NULL,NULL),(2001,'cs_CZ',NULL,NULL,NULL),(2001,'de_DE','Rechnung - CSS',NULL,NULL),(2001,'en_US','Invoice - CSS',NULL,NULL),(2001,'es_ES','Factura - CSS',NULL,NULL),(2001,'fr_FR','Facture - CSS',NULL,NULL),(2001,'it_IT',NULL,NULL,NULL),(2001,'ru_RU','Счет-фактура - CSS',NULL,NULL),(2002,'cs_CZ',NULL,NULL,NULL),(2002,'de_DE','Rechnung - im Header',NULL,NULL),(2002,'en_US','Invoice - in the header',NULL,NULL),(2002,'es_ES','Factura - en la cabecera',NULL,NULL),(2002,'fr_FR','Facture - dans l\'en-tête',NULL,NULL),(2002,'it_IT',NULL,NULL,NULL),(2002,'ru_RU','Счет-фактура - в заголовке',NULL,NULL),(2003,'cs_CZ',NULL,NULL,NULL),(2003,'de_DE','Rechnung - oben an dem Footer',NULL,NULL),(2003,'en_US','Invoice - at the top of the footer',NULL,NULL),(2003,'es_ES','Factura - en la parte superior del pie de página',NULL,NULL),(2003,'fr_FR','Facture - en haut du pied de page',NULL,NULL),(2003,'it_IT',NULL,NULL,NULL),(2003,'ru_RU','Счет-фактура - вверху подвала',NULL,NULL),(2004,'cs_CZ',NULL,NULL,NULL),(2004,'de_DE','Rechnung - Impressum',NULL,NULL),(2004,'en_US','Invoice - imprint',NULL,NULL),(2004,'es_ES','Factura - pie de imprenta',NULL,NULL),(2004,'fr_FR','Facture - mentions légales',NULL,NULL),(2004,'it_IT',NULL,NULL,NULL),(2004,'ru_RU','Счет-фактура - штамп',NULL,NULL),(2005,'cs_CZ',NULL,NULL,NULL),(2005,'de_DE','Rechnung - unten an dem Footer',NULL,NULL),(2005,'en_US','Invoice - at the bottom of the footer',NULL,NULL),(2005,'es_ES','Factura - en la parte inferior del pie de página',NULL,NULL),(2005,'fr_FR','Facture - en bas du pied de page',NULL,NULL),(2005,'it_IT',NULL,NULL,NULL),(2005,'ru_RU','Счет-фактура - внизу подвала',NULL,NULL),(2006,'cs_CZ',NULL,NULL,NULL),(2006,'de_DE','Rechnung - unten an dem Informationsbereich',NULL,NULL),(2006,'en_US','Invoice - at the bottom of information area',NULL,NULL),(2006,'es_ES','Factura - en la parte inferior del área de la información',NULL,NULL),(2006,'fr_FR','Facture - en bas de la zone d\'informations',NULL,NULL),(2006,'it_IT',NULL,NULL,NULL),(2006,'ru_RU','Счет-фактура - внизу информационной зоны',NULL,NULL),(2007,'cs_CZ',NULL,NULL,NULL),(2007,'de_DE','Rechnung - nach dem Informationsbereich',NULL,NULL),(2007,'en_US','Invoice - after the information area',NULL,NULL),(2007,'es_ES','Factura - después del área de información',NULL,NULL),(2007,'fr_FR','Facture - après la zone d\'informations',NULL,NULL),(2007,'it_IT',NULL,NULL,NULL),(2007,'ru_RU','Счет-фактура - после информационной зоны',NULL,NULL),(2008,'cs_CZ',NULL,NULL,NULL),(2008,'de_DE','Rechnung - Bestellungsadresse',NULL,NULL),(2008,'en_US','Invoice - delivery address',NULL,NULL),(2008,'es_ES','Factura - dirección de envío',NULL,NULL),(2008,'fr_FR','Facture - adresse de livraison',NULL,NULL),(2008,'it_IT',NULL,NULL,NULL),(2008,'ru_RU','Счет-фактура - адрес доставки',NULL,NULL),(2009,'cs_CZ',NULL,NULL,NULL),(2009,'de_DE','Rechnung - nach dem Adressebereich',NULL,NULL),(2009,'en_US','Invoice - after addresse area',NULL,NULL),(2009,'es_ES','Factura - después del área de dirección',NULL,NULL),(2009,'fr_FR','Facture - après la zone d\'adresses',NULL,NULL),(2009,'it_IT',NULL,NULL,NULL),(2009,'ru_RU','Счет-фактура - после зоны адреса',NULL,NULL),(2010,'cs_CZ',NULL,NULL,NULL),(2010,'de_DE','Rechnung - nach der Produktliste',NULL,NULL),(2010,'en_US','Invoice - after product listing',NULL,NULL),(2010,'es_ES','Factura - después de listado de productos',NULL,NULL),(2010,'fr_FR','Facture - après la liste des produits',NULL,NULL),(2010,'it_IT',NULL,NULL,NULL),(2010,'ru_RU','Счет-фактура - после списка товаров',NULL,NULL),(2011,'cs_CZ',NULL,NULL,NULL),(2011,'de_DE','Rechnung - nach der Bestellungs-Zusammenfassung',NULL,NULL),(2011,'en_US','Invoice - after the order summary',NULL,NULL),(2011,'es_ES','Factura - después del resumen de la orden',NULL,NULL),(2011,'fr_FR','Facture - après le résumé de la commande',NULL,NULL),(2011,'it_IT',NULL,NULL,NULL),(2011,'ru_RU','Счет-фактура - после общей суммы заказа',NULL,NULL),(2012,'cs_CZ',NULL,NULL,NULL),(2012,'de_DE','Lieferung - CSS',NULL,NULL),(2012,'en_US','Delivery - CSS',NULL,NULL),(2012,'es_ES','Entrega - CSS',NULL,NULL),(2012,'fr_FR','Bon de livraison - CSS',NULL,NULL),(2012,'it_IT',NULL,NULL,NULL),(2012,'ru_RU','Доставка - CSS',NULL,NULL),(2013,'cs_CZ',NULL,NULL,NULL),(2013,'de_DE','Lieferung - im Header',NULL,NULL),(2013,'en_US','Delivery - in the header',NULL,NULL),(2013,'es_ES','Envío - en la cabecera',NULL,NULL),(2013,'fr_FR','Bon de livraison - dans l\'en-tête',NULL,NULL),(2013,'it_IT',NULL,NULL,NULL),(2013,'ru_RU','Доставка - в заголовке',NULL,NULL),(2014,'cs_CZ',NULL,NULL,NULL),(2014,'de_DE','Lieferung - oben an dem Footer',NULL,NULL),(2014,'en_US','Delivery - at the top of the footer',NULL,NULL),(2014,'es_ES','Envío - en la parte superior del footer',NULL,NULL),(2014,'fr_FR','Bon de livraison - en haut du pied de page',NULL,NULL),(2014,'it_IT',NULL,NULL,NULL),(2014,'ru_RU','Доставка - вверху подвала',NULL,NULL),(2015,'cs_CZ',NULL,NULL,NULL),(2015,'de_DE','Lieferung - Impressum',NULL,NULL),(2015,'en_US','Delivery - imprint',NULL,NULL),(2015,'es_ES','Envío - imprimir',NULL,NULL),(2015,'fr_FR','Bon de livraison - mentions légales',NULL,NULL),(2015,'it_IT',NULL,NULL,NULL),(2015,'ru_RU','Доставка - штамп',NULL,NULL),(2016,'cs_CZ',NULL,NULL,NULL),(2016,'de_DE','Lieferung - unten an dem Footer',NULL,NULL),(2016,'en_US','Delivery - at the bottom of the footer',NULL,NULL),(2016,'es_ES','Envío - En el pie del footer',NULL,NULL),(2016,'fr_FR','Bon de livraison - en bas du pied de page',NULL,NULL),(2016,'it_IT',NULL,NULL,NULL),(2016,'ru_RU','Доставка - внизу подвала',NULL,NULL),(2017,'cs_CZ',NULL,NULL,NULL),(2017,'de_DE','Lieferung - unten an dem Informationsbereich',NULL,NULL),(2017,'en_US','Delivery - at the bottom of information area',NULL,NULL),(2017,'es_ES','Envío - en el pié del área de información',NULL,NULL),(2017,'fr_FR','Bon de livraison - en bas de la zone d\'informations',NULL,NULL),(2017,'it_IT',NULL,NULL,NULL),(2017,'ru_RU','Доставка - внизу информационной зоны',NULL,NULL),(2018,'cs_CZ',NULL,NULL,NULL),(2018,'de_DE','Lieferung - Nach dem Informationsbereich',NULL,NULL),(2018,'en_US','Delivery - after the information area',NULL,NULL),(2018,'es_ES','Entrega - después del área de información',NULL,NULL),(2018,'fr_FR','Bon de livraison - après la zone d\'informations',NULL,NULL),(2018,'it_IT',NULL,NULL,NULL),(2018,'ru_RU','Доставка - после информационной зоны',NULL,NULL),(2019,'cs_CZ',NULL,NULL,NULL),(2019,'de_DE','Lieferung - Lieferadresse',NULL,NULL),(2019,'en_US','Delivery - delivery address',NULL,NULL),(2019,'es_ES','Envío - dirección de entrega',NULL,NULL),(2019,'fr_FR','Bon de livraison - adresse de livraison',NULL,NULL),(2019,'it_IT',NULL,NULL,NULL),(2019,'ru_RU','Доставка - адрес доставки',NULL,NULL),(2020,'cs_CZ',NULL,NULL,NULL),(2020,'de_DE','Lieferung - Nach dem Adresse-Bereich',NULL,NULL),(2020,'en_US','Delivery - after addresse area',NULL,NULL),(2020,'es_ES','Entrega - tras el área de dirección',NULL,NULL),(2020,'fr_FR','Bon de livraison - après la zone d\'adresses',NULL,NULL),(2020,'it_IT',NULL,NULL,NULL),(2020,'ru_RU','Доставка - после зоны адреса',NULL,NULL),(2021,'cs_CZ',NULL,NULL,NULL),(2021,'de_DE','Lieferung - Nach der Zusammenfassung der Bestellung',NULL,NULL),(2021,'en_US','Delivery - after the order summary',NULL,NULL),(2021,'es_ES','Envío - después del resumen de pedido',NULL,NULL),(2021,'fr_FR','Bon de livraison - après le résumé de la commande',NULL,NULL),(2021,'it_IT',NULL,NULL,NULL),(2021,'ru_RU','Доставка - после общей суммы заказа',NULL,NULL),(2022,'cs_CZ',NULL,NULL,NULL),(2022,'de_DE','Bestellbestätigung - nach den Bestellungszusammenfassungen',NULL,NULL),(2022,'en_US','Order confirmation - after the order summary',NULL,NULL),(2022,'es_ES','Confirmación de la orden - después del Resumen de la orden',NULL,NULL),(2022,'fr_FR','Confirmation de commande - après les récapitulatif de commande',NULL,NULL),(2022,'it_IT',NULL,NULL,NULL),(2022,'ru_RU','Подтверждение заказа - после общей суммы заказа',NULL,NULL),(2023,'cs_CZ',NULL,NULL,NULL),(2023,'de_DE','Überall wo WYSIWYG editor ist nötig',NULL,NULL),(2023,'en_US','Where the WYSIWYG editor is required',NULL,NULL),(2023,'es_ES','Donde se requiere el editor WYSIWYG',NULL,NULL),(2023,'fr_FR','Partout ou l\'éditeur WYSIWYG est nécessaire',NULL,NULL),(2023,'it_IT',NULL,NULL,NULL),(2023,'ru_RU','Где требуется редактор WYSIWYG',NULL,NULL),(2024,'cs_CZ',NULL,NULL,NULL),(2024,'de_DE','Bestellung - Warenkorb oben',NULL,NULL),(2024,'en_US','Order - cart top',NULL,NULL),(2024,'es_ES','Orden - parte superior del carro',NULL,NULL),(2024,'fr_FR','Commande - panier haut',NULL,NULL),(2024,'it_IT',NULL,NULL,NULL),(2024,'ru_RU','Заказ - верх корзины',NULL,NULL),(2025,'cs_CZ',NULL,NULL,NULL),(2025,'de_DE','Bestellung - Warenkorb unten',NULL,NULL),(2025,'en_US','Order - cart bottom',NULL,NULL),(2025,'es_ES','Orden - parte inferior del carro',NULL,NULL),(2025,'fr_FR','Commande - panier bas',NULL,NULL),(2025,'it_IT',NULL,NULL,NULL),(2025,'ru_RU','Заказ - низ корзины',NULL,NULL),(2026,'cs_CZ',NULL,NULL,NULL),(2026,'de_DE','Bestellung - Rechnung oben',NULL,NULL),(2026,'en_US','Order - bill top',NULL,NULL),(2026,'es_ES','Orden - parte superior de la cuenta',NULL,NULL),(2026,'fr_FR','Commande - facture haut',NULL,NULL),(2026,'it_IT',NULL,NULL,NULL),(2026,'ru_RU','Заказ - верх оплаты',NULL,NULL),(2027,'cs_CZ',NULL,NULL,NULL),(2027,'de_DE','Bestellung - Rechnung unten',NULL,NULL),(2027,'en_US','Order - bill bottom',NULL,NULL),(2027,'es_ES','Orden - parte inferior de la cuenta',NULL,NULL),(2027,'fr_FR','Commande - facture bas',NULL,NULL),(2027,'it_IT',NULL,NULL,NULL),(2027,'ru_RU','Заказ - низ оплаты',NULL,NULL),(2028,'cs_CZ',NULL,NULL,NULL),(2028,'de_DE','Bestellung - Vor der Produktliste',NULL,NULL),(2028,'en_US','Order - Before product list',NULL,NULL),(2028,'es_ES','Orden - antes de la lista de productos',NULL,NULL),(2028,'fr_FR','Commande - Avant la liste des produits',NULL,NULL),(2028,'it_IT',NULL,NULL,NULL),(2028,'ru_RU','Заказ - Перед списком товаров',NULL,NULL),(2029,'cs_CZ',NULL,NULL,NULL),(2029,'de_DE','Bestellung - Vor der Öffnung der Produktzeile',NULL,NULL),(2029,'en_US','Order - Before starting product row',NULL,NULL),(2029,'es_ES','Orden - antes de comenzar la fila de producto',NULL,NULL),(2029,'fr_FR','Commande - Avant d\'ouvrir la ligne produit',NULL,NULL),(2029,'it_IT',NULL,NULL,NULL),(2029,'ru_RU','Заказ - Перед строкой товара',NULL,NULL),(2030,'cs_CZ',NULL,NULL,NULL),(2030,'de_DE','Bestellung - Nach Sperrung der Produkt Zeile',NULL,NULL),(2030,'en_US','Order - After closing product row',NULL,NULL),(2030,'es_ES','Orden - después de cerrar la fila de producto',NULL,NULL),(2030,'fr_FR','Commande - Après avoir fermé la ligne produit',NULL,NULL),(2030,'it_IT',NULL,NULL,NULL),(2030,'ru_RU','Заказ - После строки товара',NULL,NULL),(2031,'cs_CZ',NULL,NULL,NULL),(2031,'de_DE','Bestellung - Nach der Produktliste',NULL,NULL),(2031,'en_US','Order - After product list',NULL,NULL),(2031,'es_ES','Orden - después de la lista de productos',NULL,NULL),(2031,'fr_FR','Commande - Après la liste des produits',NULL,NULL),(2031,'it_IT',NULL,NULL,NULL),(2031,'ru_RU','Заказ - После списка товаров',NULL,NULL),(2032,'cs_CZ',NULL,NULL,NULL),(2032,'de_DE','Rechnung - Nach dem Zahlungsmodul',NULL,NULL),(2032,'en_US','Invoice - After payment module',NULL,NULL),(2032,'es_ES','Factura - Después de módulo de pago de factura',NULL,NULL),(2032,'fr_FR','Commande - après le module de paiement',NULL,NULL),(2032,'it_IT',NULL,NULL,NULL),(2032,'ru_RU','Счет-фактура - После модуля оплаты',NULL,NULL),(2033,'cs_CZ',NULL,NULL,NULL),(2033,'de_DE','Rechnung - Nach dem Liefermodul',NULL,NULL),(2033,'en_US','Invoice - After delivery module',NULL,NULL),(2033,'es_ES','Factura - Después de módulo de entrega de factura',NULL,NULL),(2033,'fr_FR','Commande - après le module de livraison',NULL,NULL),(2033,'it_IT',NULL,NULL,NULL),(2033,'ru_RU','Счет-фактура - После модуля доставки',NULL,NULL),(2034,'cs_CZ',NULL,NULL,NULL),(2034,'de_DE','Lieferung - Nach dem Liefermodul',NULL,NULL),(2034,'en_US','Delivery - After delivery module',NULL,NULL),(2034,'es_ES','Entrega - después del módulo de entrega',NULL,NULL),(2034,'fr_FR','Commande - après le module de livraison',NULL,NULL),(2034,'it_IT',NULL,NULL,NULL),(2034,'ru_RU','Доставка - После модуля доставки',NULL,NULL),(2035,'cs_CZ',NULL,NULL,NULL),(2035,'de_DE','Rechnung - Weitere Produktinformationen',NULL,NULL),(2035,'en_US','Invoice - additional product information',NULL,NULL),(2035,'es_ES','Factura - información adicional del producto',NULL,NULL),(2035,'fr_FR','Facture - informations additionnelles pour un produit',NULL,NULL),(2035,'it_IT',NULL,NULL,NULL),(2035,'ru_RU','Счет-фактура - дополнительная информация о товаре',NULL,NULL),(2036,'cs_CZ',NULL,NULL,NULL),(2036,'de_DE','Lieferung - Weitere Produktinformationen',NULL,NULL),(2036,'en_US','Delivery - additional product information',NULL,NULL),(2036,'es_ES','Entrega - información adicional del producto',NULL,NULL),(2036,'fr_FR','Bon de livraison - informations additionnelles pour un produit',NULL,NULL),(2036,'it_IT',NULL,NULL,NULL),(2036,'ru_RU','Доставка - дополнительная информация о товаре',NULL,NULL),(2037,'cs_CZ',NULL,NULL,NULL),(2037,'de_DE',NULL,NULL,NULL),(2037,'en_US','Delivery - after product information',NULL,NULL),(2037,'es_ES',NULL,NULL,NULL),(2037,'fr_FR',NULL,NULL,NULL),(2037,'it_IT',NULL,NULL,NULL),(2037,'ru_RU',NULL,NULL,NULL),(2038,'cs_CZ',NULL,NULL,NULL),(2038,'de_DE',NULL,NULL,NULL),(2038,'en_US','Invoice - after product information',NULL,NULL),(2038,'es_ES',NULL,NULL,NULL),(2038,'fr_FR',NULL,NULL,NULL),(2038,'it_IT',NULL,NULL,NULL),(2038,'ru_RU',NULL,NULL,NULL),(3000,'cs_CZ',NULL,NULL,NULL),(3000,'de_DE','E-Mail html - Layout - CSS',NULL,NULL),(3000,'en_US','Email html - layout - CSS',NULL,NULL),(3000,'es_ES','Email HTML - Interfaz - CSS',NULL,NULL),(3000,'fr_FR','Email html - layout - CSS',NULL,NULL),(3000,'it_IT',NULL,NULL,NULL),(3000,'ru_RU','Email html - каркас - CSS',NULL,NULL),(3001,'cs_CZ',NULL,NULL,NULL),(3001,'de_DE','E-Mail html - Layout - Fußzeile',NULL,NULL),(3001,'en_US','Email html - layout - footer',NULL,NULL),(3001,'es_ES','Email HTML - Interfaz - pie',NULL,NULL),(3001,'fr_FR','Email html - layout - pied de page',NULL,NULL),(3001,'it_IT',NULL,NULL,NULL),(3001,'ru_RU','Email html - каркас - footer',NULL,NULL),(3002,'cs_CZ',NULL,NULL,NULL),(3002,'de_DE','E-Mail html - Bestellbestätigung - vor Adresse',NULL,NULL),(3002,'en_US','Email html - order confirmation - before address',NULL,NULL),(3002,'es_ES',NULL,NULL,NULL),(3002,'fr_FR','Email html - confirmation commande - avant adresses',NULL,NULL),(3002,'it_IT',NULL,NULL,NULL),(3002,'ru_RU','Email html - подтверждение заказа - до адреса',NULL,NULL),(3003,'cs_CZ',NULL,NULL,NULL),(3003,'de_DE',NULL,NULL,NULL),(3003,'en_US','Email html - order confirmation - delivery address',NULL,NULL),(3003,'es_ES',NULL,NULL,NULL),(3003,'fr_FR','Email html - confirmation commande - adresse de livraison',NULL,NULL),(3003,'it_IT',NULL,NULL,NULL),(3003,'ru_RU','Email html - подтверждение заказа - адрес доставки',NULL,NULL),(3004,'cs_CZ',NULL,NULL,NULL),(3004,'de_DE','E-Mail html - Bestellbestätigung - nach Adresse',NULL,NULL),(3004,'en_US','Email html - order confirmation - after address',NULL,NULL),(3004,'es_ES','Email HTML - confirmación de orden - después de la dirección',NULL,NULL),(3004,'fr_FR','Email html - confirmation commande - après adresses',NULL,NULL),(3004,'it_IT',NULL,NULL,NULL),(3004,'ru_RU','Email html - подтверждение заказа - после адреса',NULL,NULL),(3005,'cs_CZ',NULL,NULL,NULL),(3005,'de_DE',NULL,NULL,NULL),(3005,'en_US','Email html - order confirmation - order product',NULL,NULL),(3005,'es_ES',NULL,NULL,NULL),(3005,'fr_FR','Email html - confirmation commande - produit de la commande',NULL,NULL),(3005,'it_IT',NULL,NULL,NULL),(3005,'ru_RU','Email html - подтверждение заказа - заказ товара',NULL,NULL),(3006,'cs_CZ',NULL,NULL,NULL),(3006,'de_DE','E-Mail html - Bestellbestätigung - vor Produkten',NULL,NULL),(3006,'en_US','Email html - order confirmation - before products',NULL,NULL),(3006,'es_ES',NULL,NULL,NULL),(3006,'fr_FR','Email html - confirmation commande - avant produits',NULL,NULL),(3006,'it_IT',NULL,NULL,NULL),(3006,'ru_RU','Email html - подтверждение заказа - до товаров',NULL,NULL),(3007,'cs_CZ',NULL,NULL,NULL),(3007,'de_DE','E-Mail html - Bestellbestätigung - nach Produkten',NULL,NULL),(3007,'en_US','Email html - order confirmation - after products',NULL,NULL),(3007,'es_ES',NULL,NULL,NULL),(3007,'fr_FR','Email html - confirmation commande - après produits',NULL,NULL),(3007,'it_IT',NULL,NULL,NULL),(3007,'ru_RU','Email html - подтверждение заказа - после товаров',NULL,NULL),(3008,'cs_CZ',NULL,NULL,NULL),(3008,'de_DE',NULL,NULL,NULL),(3008,'en_US','Email html - order confirmation - footer',NULL,NULL),(3008,'es_ES',NULL,NULL,NULL),(3008,'fr_FR','Email html - confirmation commande - pied de page',NULL,NULL),(3008,'it_IT',NULL,NULL,NULL),(3008,'ru_RU','Email html - подтверждение заказа - footer',NULL,NULL),(3009,'cs_CZ',NULL,NULL,NULL),(3009,'de_DE',NULL,NULL,NULL),(3009,'en_US','Email html - order notification - before address',NULL,NULL),(3009,'es_ES',NULL,NULL,NULL),(3009,'fr_FR','Email html - notification commande - avant adresses',NULL,NULL),(3009,'it_IT',NULL,NULL,NULL),(3009,'ru_RU','Email html - уведомление о заказе - до адреса',NULL,NULL),(3010,'cs_CZ',NULL,NULL,NULL),(3010,'de_DE',NULL,NULL,NULL),(3010,'en_US','Email html - order notification - delivery address',NULL,NULL),(3010,'es_ES',NULL,NULL,NULL),(3010,'fr_FR','Email html - notification commande - adresse de livraison',NULL,NULL),(3010,'it_IT',NULL,NULL,NULL),(3010,'ru_RU','Email html - уведомление о заказе - адрес доставки',NULL,NULL),(3011,'cs_CZ',NULL,NULL,NULL),(3011,'de_DE',NULL,NULL,NULL),(3011,'en_US','Email html - order notification - after address',NULL,NULL),(3011,'es_ES',NULL,NULL,NULL),(3011,'fr_FR','Email html - notification commande - après adresses',NULL,NULL),(3011,'it_IT',NULL,NULL,NULL),(3011,'ru_RU','Email html - уведомление о заказе - после адреса',NULL,NULL),(3012,'cs_CZ',NULL,NULL,NULL),(3012,'de_DE',NULL,NULL,NULL),(3012,'en_US','Email html - order notification - order product',NULL,NULL),(3012,'es_ES','Email HTML - notificación de orden - pedir producto',NULL,NULL),(3012,'fr_FR','Email html - notification commande - produit de la commande',NULL,NULL),(3012,'it_IT',NULL,NULL,NULL),(3012,'ru_RU','Email html - уведомление о заказе - заказ товара',NULL,NULL),(3013,'cs_CZ',NULL,NULL,NULL),(3013,'de_DE',NULL,NULL,NULL),(3013,'en_US','Email html - order notification - before products',NULL,NULL),(3013,'es_ES',NULL,NULL,NULL),(3013,'fr_FR','Email html - notification commande - avant produits',NULL,NULL),(3013,'it_IT',NULL,NULL,NULL),(3013,'ru_RU','Email html - уведомление о заказе - до товаров',NULL,NULL),(3014,'cs_CZ',NULL,NULL,NULL),(3014,'de_DE',NULL,NULL,NULL),(3014,'en_US','Email html - order notification - after products',NULL,NULL),(3014,'es_ES',NULL,NULL,NULL),(3014,'fr_FR','Email html - notification commande - après produits',NULL,NULL),(3014,'it_IT',NULL,NULL,NULL),(3014,'ru_RU','Email html - уведомление о заказе - после товаров',NULL,NULL),(3015,'cs_CZ',NULL,NULL,NULL),(3015,'de_DE',NULL,NULL,NULL),(3015,'en_US','Email txt - order confirmation - before address',NULL,NULL),(3015,'es_ES','Email texto - confirmación de pedido - antes de la dirección',NULL,NULL),(3015,'fr_FR','Email txt - confirmation commande - avant adresses',NULL,NULL),(3015,'it_IT',NULL,NULL,NULL),(3015,'ru_RU','Email текст - подтверждение заказа - до адреса',NULL,NULL),(3016,'cs_CZ',NULL,NULL,NULL),(3016,'de_DE',NULL,NULL,NULL),(3016,'en_US','Email txt - order confirmation - delivery address',NULL,NULL),(3016,'es_ES','Email texto - confirmación de pedido - dirección de entrega',NULL,NULL),(3016,'fr_FR','Email txt - confirmation commande - adresse de livraison',NULL,NULL),(3016,'it_IT',NULL,NULL,NULL),(3016,'ru_RU','Email текст - подтверждение заказа - адрес доставки',NULL,NULL),(3017,'cs_CZ',NULL,NULL,NULL),(3017,'de_DE',NULL,NULL,NULL),(3017,'en_US','Email txt - order confirmation - after address',NULL,NULL),(3017,'es_ES','Email texto - confirmación de pedido - después de la dirección',NULL,NULL),(3017,'fr_FR','Email txt - confirmation commande - après adresses',NULL,NULL),(3017,'it_IT',NULL,NULL,NULL),(3017,'ru_RU','Email текст - подтверждение заказа - после адреса',NULL,NULL),(3018,'cs_CZ',NULL,NULL,NULL),(3018,'de_DE',NULL,NULL,NULL),(3018,'en_US','Email txt - order confirmation - order product',NULL,NULL),(3018,'es_ES','Email texto - confirmación de pedido - pedido de producto',NULL,NULL),(3018,'fr_FR','Email txt - confirmation commande - produit de la commande',NULL,NULL),(3018,'it_IT',NULL,NULL,NULL),(3018,'ru_RU','Email текст - подтверждение заказа - заказ товара',NULL,NULL),(3019,'cs_CZ',NULL,NULL,NULL),(3019,'de_DE',NULL,NULL,NULL),(3019,'en_US','Email txt - order confirmation - before products',NULL,NULL),(3019,'es_ES','Email texto - confirmación de pedido - antes de los productos',NULL,NULL),(3019,'fr_FR','Email txt - confirmation commande - avant produits',NULL,NULL),(3019,'it_IT',NULL,NULL,NULL),(3019,'ru_RU','Email текст - подтверждение заказа - до товаров',NULL,NULL),(3020,'cs_CZ',NULL,NULL,NULL),(3020,'de_DE',NULL,NULL,NULL),(3020,'en_US','Email txt - order confirmation - after products',NULL,NULL),(3020,'es_ES','Email texto - confirmación de pedido - después de los productos',NULL,NULL),(3020,'fr_FR','Email txt - confirmation commande - après produits',NULL,NULL),(3020,'it_IT',NULL,NULL,NULL),(3020,'ru_RU','Email текст - подтверждение заказа - после товаров',NULL,NULL),(3021,'cs_CZ',NULL,NULL,NULL),(3021,'de_DE',NULL,NULL,NULL),(3021,'en_US','Email txt - order notification - before address',NULL,NULL),(3021,'es_ES',NULL,NULL,NULL),(3021,'fr_FR','Email txt - notification commande - avant adresses',NULL,NULL),(3021,'it_IT',NULL,NULL,NULL),(3021,'ru_RU','Email текст - уведомление о заказе - до адреса',NULL,NULL),(3022,'cs_CZ',NULL,NULL,NULL),(3022,'de_DE',NULL,NULL,NULL),(3022,'en_US','Email txt - order notification - delivery address',NULL,NULL),(3022,'es_ES',NULL,NULL,NULL),(3022,'fr_FR','Email txt - notification commande - adresse de livraison',NULL,NULL),(3022,'it_IT',NULL,NULL,NULL),(3022,'ru_RU','Email текст - уведомление о заказе - адрес доставки',NULL,NULL),(3023,'cs_CZ',NULL,NULL,NULL),(3023,'de_DE',NULL,NULL,NULL),(3023,'en_US','Email txt - order notification - after address',NULL,NULL),(3023,'es_ES','Email texto - notificación de pedido - después de la dirección',NULL,NULL),(3023,'fr_FR','Email txt - notification commande - après adresses',NULL,NULL),(3023,'it_IT',NULL,NULL,NULL),(3023,'ru_RU','Email текст - уведомление о заказе - после адреса',NULL,NULL),(3024,'cs_CZ',NULL,NULL,NULL),(3024,'de_DE',NULL,NULL,NULL),(3024,'en_US','Email txt - order notification - order product',NULL,NULL),(3024,'es_ES',NULL,NULL,NULL),(3024,'fr_FR','Email txt - notification commande - produit de la commande',NULL,NULL),(3024,'it_IT',NULL,NULL,NULL),(3024,'ru_RU','Email текст - уведомление о заказе - заказ товара',NULL,NULL),(3025,'cs_CZ',NULL,NULL,NULL),(3025,'de_DE',NULL,NULL,NULL),(3025,'en_US','Email txt - order notification - before products',NULL,NULL),(3025,'es_ES',NULL,NULL,NULL),(3025,'fr_FR','Email txt - notification commande - avant produits',NULL,NULL),(3025,'it_IT',NULL,NULL,NULL),(3025,'ru_RU','Email текст - уведомление о заказе - до товаров',NULL,NULL),(3026,'cs_CZ',NULL,NULL,NULL),(3026,'de_DE',NULL,NULL,NULL),(3026,'en_US','Email txt - order notification - after products',NULL,NULL),(3026,'es_ES',NULL,NULL,NULL),(3026,'fr_FR','Email txt - notification commande - après produits',NULL,NULL),(3026,'it_IT',NULL,NULL,NULL),(3026,'ru_RU','Email текст - уведомление о заказе - после товаров',NULL,NULL),(3027,'cs_CZ',NULL,NULL,NULL),(3027,'de_DE',NULL,NULL,NULL),(3027,'en_US','Email html - order notification - after product information',NULL,NULL),(3027,'es_ES',NULL,NULL,NULL),(3027,'fr_FR',NULL,NULL,NULL),(3027,'it_IT',NULL,NULL,NULL),(3027,'ru_RU',NULL,NULL,NULL),(3028,'cs_CZ',NULL,NULL,NULL),(3028,'de_DE',NULL,NULL,NULL),(3028,'en_US','Email txt - order notification - after product information',NULL,NULL),(3028,'es_ES',NULL,NULL,NULL),(3028,'fr_FR',NULL,NULL,NULL),(3028,'it_IT',NULL,NULL,NULL),(3028,'ru_RU',NULL,NULL,NULL),(3029,'en_US','Hook blocks css plugins','Hook to add css to thelia blocks plugins',NULL),(3030,'en_US','Hook blocks plugins','Hook to add thelia blocks plugins',NULL),(3031,'en_US','Hook blocks variables','Hook to add or override thelia blocks variable defined in window object',NULL),(3032,'en_US','Hook blocks item configuration','Hook to add a configuration page for any items',NULL);
/*!40000 ALTER TABLE `hook_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ignored_module_hook`
--

DROP TABLE IF EXISTS `ignored_module_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ignored_module_hook` (
  `module_id` int(11) NOT NULL,
  `hook_id` int(11) NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`module_id`,`hook_id`),
  KEY `fk_deleted_module_hook_module_id_idx` (`module_id`),
  KEY `fk_deleted_module_hook_hook_id_idx` (`hook_id`),
  CONSTRAINT `fk_deleted_module_hook_hook_id` FOREIGN KEY (`hook_id`) REFERENCES `hook` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_deleted_module_hook_module_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ignored_module_hook`
--

LOCK TABLES `ignored_module_hook` WRITE;
/*!40000 ALTER TABLE `ignored_module_hook` DISABLE KEYS */;
/*!40000 ALTER TABLE `ignored_module_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import`
--

DROP TABLE IF EXISTS `import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `import_category_id` int(11) NOT NULL,
  `handle_class` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_UNIQUE` (`ref`),
  KEY `fk_export_1_idx` (`import_category_id`),
  CONSTRAINT `fk_import_import_category_id` FOREIGN KEY (`import_category_id`) REFERENCES `import_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import`
--

LOCK TABLES `import` WRITE;
/*!40000 ALTER TABLE `import` DISABLE KEYS */;
INSERT INTO `import` VALUES (1,'thelia.import.stock',1,1,'Thelia\\ImportExport\\Import\\Type\\ProductStockImport','2026-09-30 13:51:54','2026-09-30 13:51:54'),(2,'thelia.import.price',2,1,'Thelia\\ImportExport\\Import\\Type\\ProductPricesImport','2026-09-30 13:51:54','2026-09-30 13:51:54');
/*!40000 ALTER TABLE `import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_category`
--

DROP TABLE IF EXISTS `import_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_UNIQUE` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_category`
--

LOCK TABLES `import_category` WRITE;
/*!40000 ALTER TABLE `import_category` DISABLE KEYS */;
INSERT INTO `import_category` VALUES (1,'thelia.import.products',1,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(2,'thelia.import.modules',2,'2026-09-30 13:51:54','2026-09-30 13:51:54');
/*!40000 ALTER TABLE `import_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_category_i18n`
--

DROP TABLE IF EXISTS `import_category_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_category_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `import_category_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `import_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_category_i18n`
--

LOCK TABLES `import_category_i18n` WRITE;
/*!40000 ALTER TABLE `import_category_i18n` DISABLE KEYS */;
INSERT INTO `import_category_i18n` VALUES (1,'en_US','Products'),(1,'fr_FR','Produits'),(2,'en_US','Modules'),(2,'fr_FR','Modules');
/*!40000 ALTER TABLE `import_category_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_i18n`
--

DROP TABLE IF EXISTS `import_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `import_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `import` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_i18n`
--

LOCK TABLES `import_i18n` WRITE;
/*!40000 ALTER TABLE `import_i18n` DISABLE KEYS */;
INSERT INTO `import_i18n` VALUES (1,'en_US','Import your stock','\n                    \n                    Your file must have the following columns to work:\n                    <ul>\n                        <li>id: The id of your product sale elements </li>\n                        <li>stock: The quantity of product you have </li>\n                    </ul>\n                    It can have the column \"ean\" that defines the product\'s EAN code.\n                    \n                '),(1,'fr_FR','Importer votre stock','\n                    \n                    Votre fichier doit avoir les colonnes suivantes :\n                    <ul>\n                        <li>id: L\'id de la déclinaison de produit</li>\n                        <li>stock: La quantité de la déclinaison </li>\n                    </ul>\n                    \n                '),(2,'en_US','Import your prices excluding taxes','\n                    \n                    Your file must have the following columns:\n                    <ul>\n                        <li>id: The id of your product sale elements </li>\n                        <li>price: The price excluding taxes of the product attribute combinations</li>\n                    </ul>\n                    It may also optionally have those columns:\n                    <ul>\n                       <li>currency: the currency code (example: EUR, USD)</li>\n                       <li>promo_price: the promo price excluding taxes of the product attribute combinations</li>\n                       <li>promo: If this value is 0, set the product not in promo, if 1, it sets the product in promo</li>\n                    </ul>\n                    \n                '),(2,'fr_FR','Importer vos prix Hors-Taxes','\n                    \n                    Votre fichier doit avoir les colonnes suivantes:\n                    <ul>\n                        <li>id: L\'id de la déclinaison de produit</li>\n                        <li>price: Le prix Hors-Taxes de votre déclinaison de combinaison de produit</li>\n                    </ul>\n                    Il peut aussi optionnellement avoir ces colonnes:\n                    <ul>\n                       <li>currency: Le code de la monnaie (exemple: EUR, USD)</li>\n                       <li>promo_price: Le prix promotionnel Hors-Taxes de votre déclinaison de combinaison de produit</li>\n                       <li>promo: Si cette valeur est a 0, désactive la promotion, si elle est a 1, l\'active</li>\n                    </ul>\n                    \n                ');
/*!40000 ALTER TABLE `import_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `locale` varchar(45) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `date_format` varchar(45) DEFAULT NULL,
  `time_format` varchar(45) DEFAULT NULL,
  `datetime_format` varchar(45) DEFAULT NULL,
  `decimal_separator` varchar(45) DEFAULT NULL,
  `thousands_separator` varchar(45) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 0,
  `visible` tinyint(4) DEFAULT 0,
  `decimals` varchar(45) DEFAULT NULL,
  `by_default` tinyint(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lang_by_default` (`by_default`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lang`
--

LOCK TABLES `lang` WRITE;
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
INSERT INTO `lang` VALUES (1,'Français','fr','fr_FR','','d/m/Y','H:i:s','d/m/Y H:i:s',',',' ',1,1,'2',0,NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,'English','en','en_US','','m-d-Y','h:i:s','m-d-Y h:i:s','.',' ',1,1,'2',1,NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,'Castellano','es','es_ES','','m-d-Y','h:i:s','m-d-Y h:i:s',',','.',1,1,'2',0,NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,'Italiano','it','it_IT','','d/m/Y','H:i:s','d/m/y H:i:s',',',' ',1,1,'2',0,NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,'Russian','ru','ru_RU','','j.n.Y','H:i:s','j.n.Y H:i:s',',',' ',0,0,'2',0,NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,'Czech','cs','cs_CZ','','j.n.Y','H:i:s','j.n.Y H:i:s',',',' ',0,0,'2',0,NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,'Deutsch','de','de_DE','','d-m-Y','H:i:s','d-m-Y H:i:s',',','.',0,0,'2',0,NULL,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `secured` tinyint(4) DEFAULT NULL,
  `text_layout_file_name` varchar(255) DEFAULT NULL,
  `text_template_file_name` varchar(255) DEFAULT NULL,
  `html_layout_file_name` varchar(255) DEFAULT NULL,
  `html_template_file_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'order_confirmation',NULL,NULL,'order_confirmation.txt',NULL,'order_confirmation.html','2026-09-30 13:51:52','2026-09-30 13:51:52',0,NULL,NULL),(2,'lost_password',NULL,NULL,'password.txt',NULL,'password.html','2026-09-30 13:51:52','2026-09-30 13:51:52',0,NULL,NULL),(3,'order_notification',NULL,NULL,'order_notification.txt',NULL,'order_notification.html','2026-09-30 13:51:52','2026-09-30 13:51:52',0,NULL,NULL),(4,'customer_account_changed',0,NULL,'account_changed_by_admin.txt',NULL,'account_changed_by_admin.html','2026-09-30 13:51:52','2026-09-30 13:51:52',0,NULL,NULL),(5,'customer_account_created',0,NULL,'account_created_by_admin.txt',NULL,'account_created_by_admin.html','2026-09-30 13:51:52','2026-09-30 13:51:52',0,NULL,NULL),(6,'new_admin_password',NULL,NULL,'admin_password.txt',NULL,'admin_password.html','2026-09-30 13:51:52','2026-09-30 13:51:52',0,NULL,NULL),(7,'newsletter_subscription_confirmation',NULL,NULL,'newsletter_subscription_confirmation.txt',NULL,'newsletter_subscription_confirmation.html','2026-09-30 13:51:52','2026-09-30 13:51:52',0,NULL,NULL),(8,'customer_confirmation',NULL,NULL,'customer_confirmation.txt',NULL,'customer_confirmation.html','2026-09-30 13:51:52','2026-09-30 13:51:52',0,NULL,NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_i18n`
--

DROP TABLE IF EXISTS `message_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` text DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `text_message` longtext DEFAULT NULL,
  `html_message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `message_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_i18n`
--

LOCK TABLES `message_i18n` WRITE;
/*!40000 ALTER TABLE `message_i18n` DISABLE KEYS */;
INSERT INTO `message_i18n` VALUES (1,'cs_CZ',NULL,NULL,NULL,NULL),(1,'de_DE','Bestellbestätigung den Kunden gesendet','Ihre Bestellung {$order_ref} bei {config key=\"store_name\"}',NULL,NULL),(1,'en_US','Order confirmation sent to the customer','Your order {$order_ref} at {config key=\"store_name\"}',NULL,NULL),(1,'es_ES','Confirmación de la orden enviada al cliente','Su orden {$order_ref} en {tecla config = \"store_name\"}',NULL,NULL),(1,'fr_FR','Confirmation de commande envoyée au client','Votre commande {$order_ref} chez {config key=\"store_name\"}',NULL,NULL),(1,'it_IT',NULL,NULL,NULL,NULL),(1,'ru_RU','Подтверждение заказа отосланное клиенту','Ваш заказ {$order_ref} в {config key=\"store_name\"}',NULL,NULL),(2,'cs_CZ',NULL,NULL,NULL,NULL),(2,'de_DE','Ihr neues Passwort','Ihr neues Passwort für {config key=\"store_name\"}',NULL,NULL),(2,'en_US','Your new password','Your new password for {config key=\"store_name\"}',NULL,NULL),(2,'es_ES','Su nueva contraseña','Su nueva contraseña para {tecla config = \"store_name\"}',NULL,NULL),(2,'fr_FR','Votre nouveau mot de passe','Votre nouveau mot de passe {config key=\"store_name\"}',NULL,NULL),(2,'it_IT',NULL,NULL,NULL,NULL),(2,'ru_RU','Ваш новый пароль','Ваш новый пароль для {config key=\"store_name\"}',NULL,NULL),(3,'cs_CZ',NULL,NULL,NULL,NULL),(3,'de_DE','Gesendete Nachricht wenn eine neue Bestellung erteilt wird.','Neue Bestellung {$order_ref} für {config key=\"store_name\"}',NULL,NULL),(3,'en_US','Message sent to the shop owner when a new order is placed','New order {$order_ref} placed on {config key=\"store_name\"}',NULL,NULL),(3,'es_ES','Mensaje enviado al propietario de la tienda cuando se envía una nueva orden','Nueva orden {$order_ref} ubicada en {tecla config = \"store_name\"}',NULL,NULL),(3,'fr_FR','Message envoyé au gestionnaire de la boutique lors d\'une nouvelle commande.','Nouvelle commande {$order_ref} reçue sur {config key=\"store_name\"}',NULL,NULL),(3,'it_IT',NULL,NULL,NULL,NULL),(3,'ru_RU','Сообщение отсылаемое владельцу магазина при новом заказе','Новый заказ {$order_ref} размещен в {config key=\"store_name\"}',NULL,NULL),(4,'cs_CZ',NULL,NULL,NULL,NULL),(4,'de_DE','Mail an den Kunden geschickt, wenn sein Passwort oder E-Mail von einem Administrator im Back-Office geändert werden','Ihre Konto-Zugriff für {config key=\"store_name\"} wurde geändert',NULL,NULL),(4,'en_US','Mail sent to the customer when its password or email is changed in the back-office','Your account information on {config key=\"store_name\"} has been changed.',NULL,NULL),(4,'es_ES','Correo enviado al cliente cuando se cambia su contraseña o correo electrónico en el back-office','La información de su cuenta en {tecla config = \"store_name\"} ha sido cambiada.',NULL,NULL),(4,'fr_FR','Message envoyé au client lorsque son mot de passe ou son email est changé dans le back-office','L\'accès à votre compte {config key=\"store_name\"} a changé',NULL,NULL),(4,'it_IT',NULL,NULL,NULL,NULL),(4,'ru_RU','Письмо отылаемое клиенту когда его пароль или email изменен из админки','Данные аккаунта в {config key=\"store_name\"} были изменены.',NULL,NULL),(5,'cs_CZ',NULL,NULL,NULL,NULL),(5,'de_DE','Mail an den Kunden geschickt, wenn sein Konto von einem Administrator im Back-Office erstellt wird','Ein Konto {config key=\"store_name\"} wurde für Sie erstellt.',NULL,NULL),(5,'en_US','Mail sent to the customer when its account is created by an administrator in the back-office','A {config key=\"store_name\"} account has been created for you',NULL,NULL),(5,'es_ES','Correo enviado al cliente cuando se crea su cuenta por un administrador en el back-office','Una {config key=\"store_name\"} cuenta ha sido creada para ti',NULL,NULL),(5,'fr_FR','Mail envoyé au client lorsque son compte est créé depuis le back-office par un administrateur','Un compte {config key=\"store_name\"} vient d\'être créé pour vous.',NULL,NULL),(5,'it_IT',NULL,NULL,NULL,NULL),(5,'ru_RU','Письмо отсылаемое клиенту когда аккаунт был создан администратором в админке','Аккаунт в {config key=\"store_name\"} был создан для вас',NULL,NULL),(6,'cs_CZ',NULL,NULL,NULL,NULL),(6,'de_DE',NULL,NULL,NULL,NULL),(6,'en_US','Mail sent to an administrator who requested a new password','New password request on {config key=\"store_name\"}',NULL,NULL),(6,'es_ES','Correo enviado a un administrador que ha solicitado una nueva contraseña','Nueva contraseña solicitada en {config key=\"store_name\"}',NULL,NULL),(6,'fr_FR','Courrier envoyé à un administrateur qui a demandé un nouveau mot de passe','Votre demande de mot de passe {config key=\"store_name\"}',NULL,NULL),(6,'it_IT',NULL,NULL,NULL,NULL),(6,'ru_RU','Письмо отсылаемое администратору при запросе нового пароля','Ваш новый пароль для %store',NULL,NULL),(7,'cs_CZ',NULL,NULL,NULL,NULL),(7,'de_DE',NULL,NULL,NULL,NULL),(7,'en_US','Newsletter subscription confirmation mail','Your subscription to {config key=\"store_name\"} newsletter',NULL,NULL),(7,'es_ES','Confirmación de suscripción por correo al boletín','Tu suscripción al boletín de {config key=\"store_name\"}',NULL,NULL),(7,'fr_FR','Mail de confirmation d\'inscription à la newsletter','Votre abonnement à {config key=\"store_name\"} newsletter',NULL,NULL),(7,'it_IT',NULL,NULL,NULL,NULL),(7,'ru_RU','Письмо подтверждения подписки на рассылку новостей','Подписка на рассылку новостей %store',NULL,NULL),(8,'cs_CZ',NULL,NULL,NULL,NULL),(8,'de_DE',NULL,NULL,NULL,NULL),(8,'en_US','Mail sent to the customer to confirm its account','Confirm your {config key=\"store_name\"} account',NULL,NULL),(8,'es_ES',NULL,NULL,NULL,NULL),(8,'fr_FR','E-mail de confirmation de création de compte client','Confirmez la création de votre compte {config key=\"store_name\"}',NULL,NULL),(8,'it_IT',NULL,NULL,NULL,NULL),(8,'ru_RU',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `message_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_version`
--

DROP TABLE IF EXISTS `message_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_version` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `secured` tinyint(4) DEFAULT NULL,
  `text_layout_file_name` varchar(255) DEFAULT NULL,
  `text_template_file_name` varchar(255) DEFAULT NULL,
  `html_layout_file_name` varchar(255) DEFAULT NULL,
  `html_template_file_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  CONSTRAINT `message_version_FK_1` FOREIGN KEY (`id`) REFERENCES `message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_version`
--

LOCK TABLES `message_version` WRITE;
/*!40000 ALTER TABLE `message_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_data`
--

DROP TABLE IF EXISTS `meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(100) NOT NULL,
  `element_key` varchar(100) NOT NULL,
  `element_id` int(11) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_data_key_element_idx` (`meta_key`,`element_key`,`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_data`
--

LOCK TABLES `meta_data` WRITE;
/*!40000 ALTER TABLE `meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `version` varchar(25) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL,
  `category` varchar(50) NOT NULL DEFAULT 'classic',
  `activate` tinyint(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `full_namespace` varchar(255) DEFAULT NULL,
  `mandatory` tinyint(4) DEFAULT 0,
  `hidden` tinyint(4) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `idx_module_activate` (`activate`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'Carousel','2.5.4',1,'classic',0,1,'Carousel\\Carousel',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,'Cheque','2.5.4',3,'payment',0,1,'Cheque\\Cheque',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:54'),(4,'Front','2.5.4',1,'classic',1,2,'Front\\Front',0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,'Tinymce','2.5.4',1,'classic',0,16,'Tinymce\\Tinymce',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:55'),(6,'HookNavigation','2.5.4',1,'classic',1,11,'HookNavigation\\HookNavigation',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,'HookCurrency','2.5.4',1,'classic',1,3,'HookCurrency\\HookCurrency',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(8,'HookLang','2.5.4',1,'classic',1,4,'HookLang\\HookLang',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(9,'HookSearch','2.5.4',1,'classic',1,5,'HookSearch\\HookSearch',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(10,'HookCustomer','2.5.4',1,'classic',1,6,'HookCustomer\\HookCustomer',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(11,'HookCart','2.5.4',1,'classic',1,7,'HookCart\\HookCart',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(12,'HookAnalytics','2.5.4',1,'classic',1,8,'HookAnalytics\\HookAnalytics',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(13,'HookContact','2.5.4',1,'classic',1,9,'HookContact\\HookContact',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(14,'HookLinks','2.5.4',1,'classic',1,10,'HookLinks\\HookLinks',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(15,'HookNewsletter','2.5.4',1,'classic',1,12,'HookNewsletter\\HookNewsletter',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(16,'HookSocial','2.5.4',1,'classic',1,13,'HookSocial\\HookSocial',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(17,'HookProductsNew','2.5.4',1,'classic',1,14,'HookProductsNew\\HookProductsNew',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(18,'HookProductsOffer','2.5.4',1,'classic',1,15,'HookProductsOffer\\HookProductsOffer',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(19,'TheliaSmarty','2.5.4',1,'classic',1,16,'TheliaSmarty\\TheliaSmarty',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:55'),(20,'VirtualProductControl','2.5.4',1,'classic',1,17,'VirtualProductControl\\VirtualProductControl',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(21,'HookAdminHome','2.5.4',1,'classic',1,18,'HookAdminHome\\HookAdminHome',0,0,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(22,'WebProfiler','2.5.4',1,'classic',1,19,'WebProfiler\\WebProfiler',0,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(23,'BetterSeo','2.3.1',1,'classic',0,20,'BetterSeo\\BetterSeo',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(24,'ChoiceFilter','2.1.2',1,'classic',0,21,'ChoiceFilter\\ChoiceFilter',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(25,'CustomDelivery','3.1.3',2,'delivery',0,1,'CustomDelivery\\CustomDelivery',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(26,'ForcePhone','2.1.0',1,'classic',0,22,'ForcePhone\\ForcePhone',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(27,'FreeOrder','2.5.4',3,'payment',0,2,'FreeOrder\\FreeOrder',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(28,'OpenApi','2.2.34',1,'classic',0,23,'OpenApi\\OpenApi',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(29,'ProductLoopAttributeFilter','2.5.0',1,'classic',0,24,'ProductLoopAttributeFilter\\ProductLoopAttributeFilter',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(30,'ShortCode','2.0.0',1,'classic',0,25,'ShortCode\\ShortCode',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(31,'ShortCodeMeta','2.0.0',1,'classic',0,26,'ShortCodeMeta\\ShortCodeMeta',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(32,'SmartyRedirection','2.0.0',1,'classic',0,27,'SmartyRedirection\\SmartyRedirection',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(33,'StoreSeo','2.0.1',1,'classic',0,28,'StoreSeo\\StoreSeo',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(34,'TheliaBlocks','2.1.21',1,'classic',0,29,'TheliaBlocks\\TheliaBlocks',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(35,'TheliaLibrary','1.4.0',1,'classic',0,30,'TheliaLibrary\\TheliaLibrary',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(36,'TheliaMigrateCountry','2.5.4',1,'classic',0,31,'TheliaMigrateCountry\\TheliaMigrateCountry',0,0,'2026-09-30 13:51:54','2026-09-30 13:51:54'),(37,'VirtualProductDelivery','2.5.4',2,'delivery',0,2,'VirtualProductDelivery\\VirtualProductDelivery',0,0,'2026-09-30 13:51:55','2026-09-30 13:51:55');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_config`
--

DROP TABLE IF EXISTS `module_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module_id_name` (`module_id`,`name`),
  CONSTRAINT `fk_module_config_module_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_config`
--

LOCK TABLES `module_config` WRITE;
/*!40000 ALTER TABLE `module_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_config_i18n`
--

DROP TABLE IF EXISTS `module_config_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_config_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `module_config_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `module_config` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_config_i18n`
--

LOCK TABLES `module_config_i18n` WRITE;
/*!40000 ALTER TABLE `module_config_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_config_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_hook`
--

DROP TABLE IF EXISTS `module_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_hook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `hook_id` int(11) NOT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `hook_active` tinyint(1) NOT NULL,
  `module_active` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `templates` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module_hook_active` (`active`),
  KEY `fk_module_hook_module_id_idx` (`module_id`),
  KEY `fk_module_hook_hook_id_idx` (`hook_id`),
  CONSTRAINT `fk_module_hook_hook_id` FOREIGN KEY (`hook_id`) REFERENCES `hook` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_module_hook_module_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_hook`
--

LOCK TABLES `module_hook` WRITE;
/*!40000 ALTER TABLE `module_hook` DISABLE KEYS */;
INSERT INTO `module_hook` VALUES (1,7,94,'hookcurrency.hook.front','insertTemplate',1,1,1,1,'render:main-navbar-secondary.html'),(2,8,94,'hooklang.hook.front','insertTemplate',1,1,1,2,'render:main-navbar-secondary.html'),(3,9,91,'hooksearch.hook.front','insertTemplate',1,1,1,1,'css:assets/css/styles.css'),(4,9,94,'hooksearch.hook.front','insertTemplate',1,1,1,3,'render:main-navbar-secondary.html'),(5,9,95,'hooksearch.hook.front','insertTemplate',0,1,1,1,'render:main-navbar-primary.html'),(6,10,91,'hookcustomer.hook.front','insertTemplate',1,1,1,2,'css:assets/css/styles.css'),(7,10,94,'hookcustomer.hook.front','insertTemplate',1,1,1,4,'render:main-navbar-secondary.html'),(8,11,91,'hookcart.hook.front','insertTemplate',1,1,1,3,'css:assets/css/styles.css'),(9,11,94,'hookcart.hook.front','insertTemplate',1,1,1,5,'main-navbar-secondary.html'),(10,11,223,'hookcart.hook.front','insertTemplate',1,1,1,1,'render:mini-cart.html'),(11,12,91,'hookanalytics.hook.front','onMainHeadBottom',1,1,1,4,''),(12,12,1235,'hookanalytics.hook.back','insertTemplate',1,1,1,1,'render:module_configuration.html'),(13,12,1236,'hookanalytics.hook.back','insertTemplate',1,1,1,1,'js:assets/js/module-configuration.js'),(14,13,100,'hookcontact.hook.front','onMainFooterBody',1,1,1,1,''),(15,14,100,'hooklinks.hook.front','onMainFooterBody',1,1,1,2,''),(16,6,95,'hooknavigation.hook.front','insertTemplate',1,1,1,2,'render:main-navbar-primary.html'),(17,6,101,'hooknavigation.hook.front','onMainFooterBottom',1,1,1,1,''),(18,6,100,'hooknavigation.hook.front','onMainFooterBody',1,1,1,3,''),(19,15,100,'hooknewsletter.hook.front','onMainFooterBody',1,1,1,4,''),(20,16,100,'hooksocial.hook.front','onMainFooterBody',1,1,1,5,''),(21,16,1235,'hooksocial.hook.back','insertTemplate',1,1,1,2,'render:module_configuration.html'),(22,16,1236,'hooksocial.hook.back','insertTemplate',1,1,1,2,'js:assets/js/module-configuration.js'),(23,17,149,'hookproductsnew.hook.front','insertTemplate',1,1,1,1,'render:home-body.html'),(24,18,149,'hookproductsoffer.hook.front','insertTemplate',1,1,1,2,'render:home-body.html'),(25,20,1304,'virtualproductcontrol.hook','onMainBeforeContent',1,1,1,1,''),(26,21,1235,'hookadminhome.configuration.hook','onModuleConfiguration',1,1,1,3,''),(27,21,1259,'hookadminhome.hook.css','insertTemplate',1,1,1,1,'css:assets/css/home.css'),(28,21,1105,'hookadminhome.hook.block_information','insertTemplate',1,1,1,1,'render:block-information.html'),(29,21,1105,'hookadminhome.hook.block_statistics','blockStatistics',1,1,1,2,''),(30,21,1107,'hookadminhome.hook.block_statistics','blockStatisticsJs',1,1,1,1,''),(31,21,1280,'hookadminhome.hook.block_sales_statistics','blockSalesStatistics',1,1,1,1,''),(32,21,1280,'hookadminhome.hook.block_news','blockNews',1,1,1,2,''),(33,21,1107,'hookadminhome.hook.block_news','insertTemplate',1,1,1,2,'render:block-news-js.html'),(34,21,1280,'hookadminhome.hook.block_thelia_informations','blockTheliaInformation',1,1,1,3,'');
/*!40000 ALTER TABLE `module_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_i18n`
--

DROP TABLE IF EXISTS `module_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `module_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_i18n`
--

LOCK TABLES `module_i18n` WRITE;
/*!40000 ALTER TABLE `module_i18n` DISABLE KEYS */;
INSERT INTO `module_i18n` VALUES (1,'cs_CZ',NULL,NULL,NULL,NULL),(1,'de_DE','Ein Bilder-Karussel auf Ihre Startseite',NULL,NULL,NULL),(1,'en_US','An image carousel on your home page',NULL,NULL,NULL),(1,'es_ES','Un carrusel de imágenes en la página de inicio',NULL,NULL,NULL),(1,'fr_FR','Un carrousel d\'images sur votre page d\'accueil',NULL,NULL,NULL),(1,'it_IT',NULL,NULL,NULL,NULL),(1,'ru_RU','Слайдер на главной',NULL,NULL,NULL),(3,'cs_CZ',NULL,NULL,NULL,NULL),(3,'de_DE','Per Cheque bezahlen',NULL,NULL,NULL),(3,'en_US','Pay by cheque',NULL,NULL,NULL),(3,'es_ES','Pagar con Cheque',NULL,NULL,NULL),(3,'fr_FR','Payer par chèque',NULL,NULL,NULL),(3,'it_IT',NULL,NULL,NULL,NULL),(3,'ru_RU','Оплата чеком',NULL,NULL,NULL),(4,'cs_CZ',NULL,NULL,NULL,NULL),(4,'de_DE','Front office Modul ',NULL,NULL,NULL),(4,'en_US','Front office integration',NULL,NULL,NULL),(4,'es_ES','Front office integración',NULL,NULL,NULL),(4,'fr_FR','Module Front office',NULL,NULL,NULL),(4,'it_IT',NULL,NULL,NULL,NULL),(4,'ru_RU','Отображение магазина',NULL,NULL,NULL),(5,'cs_CZ',NULL,NULL,NULL,NULL),(5,'de_DE','TinyMCE WYSIWYG Editor',NULL,NULL,NULL),(5,'en_US','TinyMCE WYSIWYG editor',NULL,NULL,NULL),(5,'es_ES','Editor TinyMCE WYSIWYG',NULL,NULL,NULL),(5,'fr_FR','Editeur visuel TinyMCE',NULL,NULL,NULL),(5,'it_IT',NULL,NULL,NULL,NULL),(5,'ru_RU','Редактор TinyMCE',NULL,NULL,NULL),(6,'cs_CZ',NULL,NULL,NULL,NULL),(6,'de_DE','Menü Block',NULL,NULL,NULL),(6,'en_US','Navigation block',NULL,NULL,NULL),(6,'es_ES','Bloque de navegación',NULL,NULL,NULL),(6,'fr_FR','Bloc menu',NULL,NULL,NULL),(6,'it_IT',NULL,NULL,NULL,NULL),(6,'ru_RU','Блок навигации',NULL,NULL,NULL),(7,'cs_CZ',NULL,NULL,NULL,NULL),(7,'de_DE','Währungensblock',NULL,NULL,NULL),(7,'en_US','Currency block',NULL,NULL,NULL),(7,'es_ES','Bloque de monedas',NULL,NULL,NULL),(7,'fr_FR','Bloc des devises',NULL,NULL,NULL),(7,'it_IT',NULL,NULL,NULL,NULL),(7,'ru_RU','Переключатель валют',NULL,NULL,NULL),(8,'cs_CZ',NULL,NULL,NULL,NULL),(8,'de_DE','Sprachen Block',NULL,NULL,NULL),(8,'en_US','Languages block',NULL,NULL,NULL),(8,'es_ES','Bloque de idiomas',NULL,NULL,NULL),(8,'fr_FR','Bloc des langues',NULL,NULL,NULL),(8,'it_IT',NULL,NULL,NULL,NULL),(8,'ru_RU','Переключатель языков',NULL,NULL,NULL),(9,'cs_CZ',NULL,NULL,NULL,NULL),(9,'de_DE','Suche-Block',NULL,NULL,NULL),(9,'en_US','Search block',NULL,NULL,NULL),(9,'es_ES','Bloque de búsqueda',NULL,NULL,NULL),(9,'fr_FR','Bloc de recherche',NULL,NULL,NULL),(9,'it_IT',NULL,NULL,NULL,NULL),(9,'ru_RU','Блок поиска',NULL,NULL,NULL),(10,'cs_CZ',NULL,NULL,NULL,NULL),(10,'de_DE','Kundenkonto-Block',NULL,NULL,NULL),(10,'en_US','Customer account block',NULL,NULL,NULL),(10,'es_ES','Bloque de cuenta de cliente',NULL,NULL,NULL),(10,'fr_FR','Bloc compte client',NULL,NULL,NULL),(10,'it_IT',NULL,NULL,NULL,NULL),(10,'ru_RU','Блок для клиентов',NULL,NULL,NULL),(11,'cs_CZ',NULL,NULL,NULL,NULL),(11,'de_DE','Warenkorb Block',NULL,NULL,NULL),(11,'en_US','Cart block',NULL,NULL,NULL),(11,'es_ES','Bloque de carrito',NULL,NULL,NULL),(11,'fr_FR','Bloc panier',NULL,NULL,NULL),(11,'it_IT',NULL,NULL,NULL,NULL),(11,'ru_RU','Блок корзины',NULL,NULL,NULL),(12,'cs_CZ',NULL,NULL,NULL,NULL),(12,'de_DE','Google Analytics Block',NULL,NULL,NULL),(12,'en_US','Google Analytics block',NULL,NULL,NULL),(12,'es_ES','Bloque Google Analytics',NULL,NULL,NULL),(12,'fr_FR','Bloc Google Analytics',NULL,NULL,NULL),(12,'it_IT',NULL,NULL,NULL,NULL),(12,'ru_RU','Блок Google Analytics',NULL,NULL,NULL),(13,'cs_CZ',NULL,NULL,NULL,NULL),(13,'de_DE','Kontakt-Block',NULL,NULL,NULL),(13,'en_US','Contact block',NULL,NULL,NULL),(13,'es_ES','Bloque de contacto',NULL,NULL,NULL),(13,'fr_FR','Bloc contact',NULL,NULL,NULL),(13,'it_IT',NULL,NULL,NULL,NULL),(13,'ru_RU','Блок контактов',NULL,NULL,NULL),(14,'cs_CZ',NULL,NULL,NULL,NULL),(14,'de_DE','Links Block',NULL,NULL,NULL),(14,'en_US','Links block',NULL,NULL,NULL),(14,'es_ES','Bloque de enlaces',NULL,NULL,NULL),(14,'fr_FR','Bloc liens',NULL,NULL,NULL),(14,'it_IT',NULL,NULL,NULL,NULL),(14,'ru_RU','Блок ссылок',NULL,NULL,NULL),(15,'cs_CZ',NULL,NULL,NULL,NULL),(15,'de_DE','Newsletter Block',NULL,NULL,NULL),(15,'en_US','Newsletter block',NULL,NULL,NULL),(15,'es_ES','Bloque del boletín de noticias',NULL,NULL,NULL),(15,'fr_FR','Bloc newsletter',NULL,NULL,NULL),(15,'it_IT',NULL,NULL,NULL,NULL),(15,'ru_RU','Блок подписки',NULL,NULL,NULL),(16,'cs_CZ',NULL,NULL,NULL,NULL),(16,'de_DE','Social Networks Block',NULL,NULL,NULL),(16,'en_US','Social Networks block',NULL,NULL,NULL),(16,'es_ES','Bloque de Redes Sociales',NULL,NULL,NULL),(16,'fr_FR','Bloc réseaux sociaux',NULL,NULL,NULL),(16,'it_IT',NULL,NULL,NULL,NULL),(16,'ru_RU','Блок социалок',NULL,NULL,NULL),(17,'cs_CZ',NULL,NULL,NULL,NULL),(17,'de_DE','Neue Produkte Block',NULL,NULL,NULL),(17,'en_US','New Products block',NULL,NULL,NULL),(17,'es_ES','Bloque de nuevos productos',NULL,NULL,NULL),(17,'fr_FR','Bloc nouveaux produits',NULL,NULL,NULL),(17,'it_IT',NULL,NULL,NULL,NULL),(17,'ru_RU','Блок новых товаров',NULL,NULL,NULL),(18,'cs_CZ',NULL,NULL,NULL,NULL),(18,'de_DE','Sonderangebot-Block',NULL,NULL,NULL),(18,'en_US','Products offer block',NULL,NULL,NULL),(18,'es_ES','Bloque de oferta de productos',NULL,NULL,NULL),(18,'fr_FR','Bloc promotions',NULL,NULL,NULL),(18,'it_IT',NULL,NULL,NULL,NULL),(18,'ru_RU','Блок предлагаемых товаров',NULL,NULL,NULL),(19,'cs_CZ',NULL,NULL,NULL,NULL),(19,'de_DE','Smarty Template Engine Integration',NULL,NULL,NULL),(19,'en_US','Smarty template engine integration',NULL,NULL,NULL),(19,'es_ES','Integración del motor de plantillas Smarty',NULL,NULL,NULL),(19,'fr_FR','Intégration du moteur de template Smarty',NULL,NULL,NULL),(19,'it_IT',NULL,NULL,NULL,NULL),(19,'ru_RU','Интеграция шаблонизатора Smarty',NULL,NULL,NULL),(20,'cs_CZ',NULL,NULL,NULL,NULL),(20,'de_DE','Steuerung für virtuelle Produkte',NULL,NULL,NULL),(20,'en_US','Virtual Product Controller',NULL,NULL,NULL),(20,'es_ES','Controlador de producto virtual',NULL,NULL,NULL),(20,'fr_FR','Contôle de produit virtuel',NULL,NULL,NULL),(20,'it_IT',NULL,NULL,NULL,NULL),(20,'ru_RU','Поддержка виртуальных товаров',NULL,NULL,NULL),(21,'cs_CZ',NULL,NULL,NULL,NULL),(21,'de_DE',NULL,NULL,NULL,NULL),(21,'en_US','Back-office Home page content',NULL,NULL,NULL),(21,'es_ES',NULL,NULL,NULL,NULL),(21,'fr_FR','Contenu de la page d\'accueil de l\'administration',NULL,NULL,NULL),(21,'it_IT',NULL,NULL,NULL,NULL),(21,'ru_RU',NULL,NULL,NULL,NULL),(23,'en_US','Set noindex, nofollow, h1, tag on pages, and manage mesh links',NULL,NULL,NULL),(23,'fr_FR','Ajoute la balise noindex, nofollow, h1, sur les pages, plus gestion des liens maillés',NULL,NULL,NULL),(24,'en_US','This module allows the management of filters in front by template and category',NULL,NULL,NULL),(24,'fr_FR','Ce module permet la gestion des filtres en front par gabarit et catégorie',NULL,NULL,NULL),(25,'en_US','Custom Delivery',NULL,NULL,NULL),(25,'fr_FR','Livraison Personnalisée',NULL,NULL,NULL),(26,'en_US','Require the customer to enter its home phone number, mobile phone number or both',NULL,NULL,NULL),(26,'fr_FR','Oblige le client à laisser un numéro de téléphone fixe, mobile ou les deux',NULL,NULL,NULL),(27,'en_US','There\'s nothing to pay for this order',NULL,'This is a pseudo-payment module for free orders.',NULL),(27,'fr_FR','Vous n\'avez rien à payer pour cette commande',NULL,'Un pseudo-module de paiement pour les commandes de montant nul',NULL),(28,'en_US','Add an API to Thelia',NULL,NULL,NULL),(28,'fr_FR','Ajoute une API a Thelia',NULL,NULL,NULL),(29,'en_US','Automatically generated module - please update module.xml file',NULL,NULL,NULL),(29,'fr_FR','Module généré automatiquement - éditez le fichier module.xml',NULL,NULL,NULL),(30,'en_US','Add short codes Wordpress\'ShortCode syntax',NULL,NULL,NULL),(30,'fr_FR','Ajoute les short codes avec la syntax wordpress',NULL,NULL,NULL),(31,'en_US','Add meta to header by short code',NULL,NULL,NULL),(31,'fr_FR','Ajoute des méta-données au header par les short codes',NULL,NULL,NULL),(32,'en_US','Redirection function for templates',NULL,NULL,NULL),(32,'fr_FR','Fonction de redirection pour les templates',NULL,NULL,NULL),(33,'en_US','Manage translations for your store main SEO meta',NULL,NULL,NULL),(33,'fr_FR','Gère les traductions des principales metas SEO de votre boutique',NULL,NULL,NULL),(34,'en_US','Assemble blocks and display them wherever you want',NULL,NULL,NULL),(34,'fr_FR','Assemblez des blocs et afficher les où vous voulez',NULL,NULL,NULL),(35,'en_US','A media library for Thelia',NULL,NULL,NULL),(35,'fr_FR','Une médiathéque pour Thelia',NULL,NULL,NULL),(36,'en_US','Countries/states migration tool',NULL,NULL,NULL),(36,'fr_FR','Utilitaire de migration des pays/états',NULL,NULL,NULL),(37,'en_US','Virtual Products Delivery',NULL,NULL,NULL),(37,'fr_FR','Livraison Produits Virtuels',NULL,NULL,NULL);
/*!40000 ALTER TABLE `module_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_image`
--

DROP TABLE IF EXISTS `module_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module_image_module_id` (`module_id`),
  KEY `idx_module_image_module_id_position` (`module_id`,`position`),
  CONSTRAINT `fk_module_image_module_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_image`
--

LOCK TABLES `module_image` WRITE;
/*!40000 ALTER TABLE `module_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_image_i18n`
--

DROP TABLE IF EXISTS `module_image_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_image_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `module_image_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `module_image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_image_i18n`
--

LOCK TABLES `module_image_i18n` WRITE;
/*!40000 ALTER TABLE `module_image_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_image_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `locale` varchar(5) DEFAULT NULL,
  `unsubscribed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `idx_unsubscribed` (`unsubscribed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(45) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `invoice_order_address_id` int(11) NOT NULL,
  `delivery_order_address_id` int(11) NOT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_rate` float NOT NULL,
  `transaction_ref` varchar(100) DEFAULT NULL COMMENT 'transaction reference - usually use to identify a transaction with banking modules',
  `delivery_ref` varchar(100) DEFAULT NULL COMMENT 'delivery reference - usually use to identify a delivery progress on a distant delivery tracker website',
  `invoice_ref` varchar(100) DEFAULT NULL COMMENT 'the invoice reference',
  `discount` decimal(16,6) DEFAULT 0.000000,
  `postage` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `postage_tax` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `postage_tax_rule_title` varchar(255) DEFAULT NULL,
  `payment_module_id` int(11) NOT NULL,
  `delivery_module_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_UNIQUE` (`ref`),
  KEY `idx_order_currency_id` (`currency_id`),
  KEY `idx_order_customer_id` (`customer_id`),
  KEY `idx_order_invoice_order_address_id` (`invoice_order_address_id`),
  KEY `idx_order_delivery_order_address_id` (`delivery_order_address_id`),
  KEY `idx_order_status_id` (`status_id`),
  KEY `fk_order_payment_module_id_idx` (`payment_module_id`),
  KEY `fk_order_delivery_module_id_idx` (`delivery_module_id`),
  KEY `fk_order_lang_id_idx` (`lang_id`),
  KEY `idx_order_cart_fk` (`cart_id`),
  CONSTRAINT `fk_order_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  CONSTRAINT `fk_order_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_order_delivery_module_id` FOREIGN KEY (`delivery_module_id`) REFERENCES `module` (`id`),
  CONSTRAINT `fk_order_delivery_order_address_id` FOREIGN KEY (`delivery_order_address_id`) REFERENCES `order_address` (`id`),
  CONSTRAINT `fk_order_invoice_order_address_id` FOREIGN KEY (`invoice_order_address_id`) REFERENCES `order_address` (`id`),
  CONSTRAINT `fk_order_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`),
  CONSTRAINT `fk_order_payment_module_id` FOREIGN KEY (`payment_module_id`) REFERENCES `module` (`id`),
  CONSTRAINT `fk_order_status_id` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_address`
--

DROP TABLE IF EXISTS `order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_title_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `zipcode` varchar(10) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_address_customer_title_id_idx` (`customer_title_id`),
  KEY `fk_order_address_country_id_idx` (`country_id`),
  KEY `fk_order_address_state_id_idx` (`state_id`),
  CONSTRAINT `fk_order_address_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `fk_order_address_customer_title_id` FOREIGN KEY (`customer_title_id`) REFERENCES `customer_title` (`id`),
  CONSTRAINT `fk_order_address_state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_address`
--

LOCK TABLES `order_address` WRITE;
/*!40000 ALTER TABLE `order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_coupon`
--

DROP TABLE IF EXISTS `order_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` longtext NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `expiration_date` datetime NOT NULL,
  `is_cumulative` tinyint(1) NOT NULL,
  `is_removing_postage` tinyint(1) NOT NULL,
  `is_available_on_special_offers` tinyint(1) NOT NULL,
  `serialized_conditions` text NOT NULL,
  `per_customer_usage_count` tinyint(1) NOT NULL,
  `usage_canceled` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_coupon_order_id` (`order_id`),
  CONSTRAINT `fk_order_coupon_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_coupon`
--

LOCK TABLES `order_coupon` WRITE;
/*!40000 ALTER TABLE `order_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_coupon_country`
--

DROP TABLE IF EXISTS `order_coupon_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_coupon_country` (
  `coupon_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`country_id`),
  KEY `fk_country_id_idx` (`country_id`),
  CONSTRAINT `fk_order_coupon_country_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_coupon_country_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `order_coupon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_coupon_country`
--

LOCK TABLES `order_coupon_country` WRITE;
/*!40000 ALTER TABLE `order_coupon_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_coupon_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_coupon_module`
--

DROP TABLE IF EXISTS `order_coupon_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_coupon_module` (
  `coupon_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`module_id`),
  KEY `fk_module_id_idx` (`module_id`),
  CONSTRAINT `fk_coupon_module_coupon_id0` FOREIGN KEY (`coupon_id`) REFERENCES `order_coupon` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_coupon_module_module_id0` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_coupon_module`
--

LOCK TABLES `order_coupon_module` WRITE;
/*!40000 ALTER TABLE `order_coupon_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_coupon_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_ref` varchar(255) NOT NULL,
  `product_sale_elements_ref` varchar(255) NOT NULL,
  `product_sale_elements_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  `quantity` float NOT NULL,
  `price` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `promo_price` decimal(16,6) DEFAULT 0.000000,
  `was_new` tinyint(4) NOT NULL,
  `was_in_promo` tinyint(4) NOT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `ean_code` varchar(255) DEFAULT NULL,
  `tax_rule_title` varchar(255) DEFAULT NULL,
  `tax_rule_description` longtext DEFAULT NULL,
  `parent` int(11) DEFAULT NULL COMMENT 'not managed yet',
  `virtual` tinyint(4) NOT NULL DEFAULT 0,
  `virtual_document` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_product_order_id` (`order_id`),
  CONSTRAINT `fk_order_product_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_attribute_combination`
--

DROP TABLE IF EXISTS `order_product_attribute_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_attribute_combination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product_id` int(11) NOT NULL,
  `attribute_title` varchar(255) NOT NULL,
  `attribute_chapo` text DEFAULT NULL,
  `attribute_description` longtext DEFAULT NULL,
  `attribute_postscriptum` text DEFAULT NULL,
  `attribute_av_title` varchar(255) NOT NULL,
  `attribute_av_chapo` text DEFAULT NULL,
  `attribute_av_description` longtext DEFAULT NULL,
  `attribute_av_postscriptum` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_product_attribute_combination_order_product_id` (`order_product_id`),
  CONSTRAINT `fk_order_product_attribute_combination_order_product_id` FOREIGN KEY (`order_product_id`) REFERENCES `order_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_attribute_combination`
--

LOCK TABLES `order_product_attribute_combination` WRITE;
/*!40000 ALTER TABLE `order_product_attribute_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_attribute_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_tax`
--

DROP TABLE IF EXISTS `order_product_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `amount` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `promo_amount` decimal(16,6) DEFAULT 0.000000,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ order_product_tax_order_product_id` (`order_product_id`),
  CONSTRAINT `fk_ order_product_tax_order_product_id0` FOREIGN KEY (`order_product_id`) REFERENCES `order_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_tax`
--

LOCK TABLES `order_product_tax` WRITE;
/*!40000 ALTER TABLE `order_product_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `color` char(7) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `protected_status` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'not_paid','#f0ad4e',1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,'paid','#5cb85c',2,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,'processing','#f39922',3,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,'sent','#5bc0de',4,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,'canceled','#d9534f',5,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,'refunded','#986dff',6,1,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_i18n`
--

DROP TABLE IF EXISTS `order_status_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `order_status_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_i18n`
--

LOCK TABLES `order_status_i18n` WRITE;
/*!40000 ALTER TABLE `order_status_i18n` DISABLE KEYS */;
INSERT INTO `order_status_i18n` VALUES (1,'cs_CZ',NULL,'','',''),(1,'de_DE','Nicht bezahlt','','',''),(1,'en_US','Not paid','','',''),(1,'es_ES','No pagados','','',''),(1,'fr_FR','Non payée','','',''),(1,'it_IT',NULL,'','',''),(1,'ru_RU','Не оплачен','','',''),(2,'cs_CZ',NULL,'','',''),(2,'de_DE','Bezahlt','','',''),(2,'en_US','Paid','','',''),(2,'es_ES','Pagado','','',''),(2,'fr_FR','Payée','','',''),(2,'it_IT',NULL,'','',''),(2,'ru_RU','Оплачен','','',''),(3,'cs_CZ',NULL,'','',''),(3,'de_DE','Bearbeitung','','',''),(3,'en_US','Processing','','',''),(3,'es_ES','Procesando','','',''),(3,'fr_FR','Traitement','','',''),(3,'it_IT',NULL,'','',''),(3,'ru_RU','В обработке','','',''),(4,'cs_CZ',NULL,'','',''),(4,'de_DE','Gesendet','','',''),(4,'en_US','Sent','','',''),(4,'es_ES','Enviado','','',''),(4,'fr_FR','Envoyée','','',''),(4,'it_IT',NULL,'','',''),(4,'ru_RU','Выслан','','',''),(5,'cs_CZ',NULL,'','',''),(5,'de_DE','Storniert','','',''),(5,'en_US','Canceled','','',''),(5,'es_ES','Cancelado','','',''),(5,'fr_FR','Annulée','','',''),(5,'it_IT',NULL,'','',''),(5,'ru_RU','Отменен','','',''),(6,'cs_CZ',NULL,'','',''),(6,'de_DE','Zrückerstattet','','',''),(6,'en_US','Refunded','','',''),(6,'es_ES','Reembolsado','','',''),(6,'fr_FR','Remboursé','','',''),(6,'it_IT',NULL,'','',''),(6,'ru_RU','Возвращен','','','');
/*!40000 ALTER TABLE `order_status_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_version`
--

DROP TABLE IF EXISTS `order_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_version` (
  `id` int(11) NOT NULL,
  `ref` varchar(45) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `invoice_order_address_id` int(11) NOT NULL,
  `delivery_order_address_id` int(11) NOT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_rate` float NOT NULL,
  `transaction_ref` varchar(100) DEFAULT NULL COMMENT 'transaction reference - usually use to identify a transaction with banking modules',
  `delivery_ref` varchar(100) DEFAULT NULL COMMENT 'delivery reference - usually use to identify a delivery progress on a distant delivery tracker website',
  `invoice_ref` varchar(100) DEFAULT NULL COMMENT 'the invoice reference',
  `discount` decimal(16,6) DEFAULT 0.000000,
  `postage` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `postage_tax` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `postage_tax_rule_title` varchar(255) DEFAULT NULL,
  `payment_module_id` int(11) NOT NULL,
  `delivery_module_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  `customer_id_version` int(11) DEFAULT 0,
  PRIMARY KEY (`id`,`version`),
  CONSTRAINT `order_version_FK_1` FOREIGN KEY (`id`) REFERENCES `order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_version`
--

LOCK TABLES `order_version` WRITE;
/*!40000 ALTER TABLE `order_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_rule_id` int(11) DEFAULT NULL,
  `ref` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  `template_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `virtual` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_UNIQUE` (`ref`),
  KEY `idx_product_tax_rule_id` (`tax_rule_id`),
  KEY `fk_product_template_id` (`template_id`),
  KEY `fk_product_brand1_idx` (`brand_id`),
  CONSTRAINT `fk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_product_tax_rule_id` FOREIGN KEY (`tax_rule_id`) REFERENCES `tax_rule` (`id`),
  CONSTRAINT `fk_product_template` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_associated_content`
--

DROP TABLE IF EXISTS `product_associated_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_associated_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_associated_content_product_id` (`product_id`),
  KEY `idx_product_associated_content_content_id` (`content_id`),
  CONSTRAINT `fk_product_associated_content_content_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product_associated_content_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_associated_content`
--

LOCK TABLES `product_associated_content` WRITE;
/*!40000 ALTER TABLE `product_associated_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_associated_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `default_category` tinyint(1) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `idx_product_has_category_category1` (`category_id`),
  KEY `idx_product_has_category_product1` (`product_id`),
  KEY `idx_product_has_category_default` (`default_category`),
  CONSTRAINT `fk_product_has_category_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product_has_category_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_document`
--

DROP TABLE IF EXISTS `product_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_document_product_id` (`product_id`),
  CONSTRAINT `fk_product_document_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_document`
--

LOCK TABLES `product_document` WRITE;
/*!40000 ALTER TABLE `product_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_document_i18n`
--

DROP TABLE IF EXISTS `product_document_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_document_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `product_document_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `product_document` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_document_i18n`
--

LOCK TABLES `product_document_i18n` WRITE;
/*!40000 ALTER TABLE `product_document_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_document_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_i18n`
--

DROP TABLE IF EXISTS `product_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `product_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_i18n`
--

LOCK TABLES `product_i18n` WRITE;
/*!40000 ALTER TABLE `product_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_image_product_id` (`product_id`),
  KEY `idx_product_image_product_id_position` (`product_id`,`position`),
  CONSTRAINT `fk_product_image_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image_i18n`
--

DROP TABLE IF EXISTS `product_image_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `product_image_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `product_image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image_i18n`
--

LOCK TABLES `product_image_i18n` WRITE;
/*!40000 ALTER TABLE `product_image_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price` (
  `product_sale_elements_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `price` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `promo_price` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `from_default_currency` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`product_sale_elements_id`,`currency_id`),
  KEY `idx_product_price_product_sale_elements_id` (`product_sale_elements_id`),
  KEY `idx_product_price_currency_id` (`currency_id`),
  CONSTRAINT `fk_product_price_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product_price_product_sale_elements_id` FOREIGN KEY (`product_sale_elements_id`) REFERENCES `product_sale_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sale_elements`
--

DROP TABLE IF EXISTS `product_sale_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sale_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `quantity` float NOT NULL,
  `promo` tinyint(4) DEFAULT 0,
  `newness` tinyint(4) DEFAULT 0,
  `weight` float DEFAULT 0,
  `is_default` tinyint(1) DEFAULT 0,
  `ean_code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_sale_element_product_id` (`product_id`),
  KEY `ref` (`ref`),
  KEY `idx_product_elements_product_id_promo_is_default` (`product_id`,`promo`,`is_default`),
  CONSTRAINT `fk_product_sale_element_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sale_elements`
--

LOCK TABLES `product_sale_elements` WRITE;
/*!40000 ALTER TABLE `product_sale_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_sale_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sale_elements_product_document`
--

DROP TABLE IF EXISTS `product_sale_elements_product_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sale_elements_product_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_sale_elements_id` int(11) NOT NULL,
  `product_document_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pse_product_document_product_document__idx` (`product_document_id`),
  KEY `fk_pse_product_document_product_sale_elem_idx` (`product_sale_elements_id`),
  CONSTRAINT `fk_pse_product_document_product_document_id` FOREIGN KEY (`product_document_id`) REFERENCES `product_document` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pse_product_document_product_sale_elements_id` FOREIGN KEY (`product_sale_elements_id`) REFERENCES `product_sale_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sale_elements_product_document`
--

LOCK TABLES `product_sale_elements_product_document` WRITE;
/*!40000 ALTER TABLE `product_sale_elements_product_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_sale_elements_product_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sale_elements_product_image`
--

DROP TABLE IF EXISTS `product_sale_elements_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sale_elements_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_sale_elements_id` int(11) NOT NULL,
  `product_image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pse_product_image_product_image_id_idx` (`product_image_id`),
  KEY `fk_pse_product_image_product_sale_element_idx` (`product_sale_elements_id`),
  CONSTRAINT `fk_pse_product_image_product_image_id` FOREIGN KEY (`product_image_id`) REFERENCES `product_image` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pse_product_image_product_sale_elements_id` FOREIGN KEY (`product_sale_elements_id`) REFERENCES `product_sale_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sale_elements_product_image`
--

LOCK TABLES `product_sale_elements_product_image` WRITE;
/*!40000 ALTER TABLE `product_sale_elements_product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_sale_elements_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_version`
--

DROP TABLE IF EXISTS `product_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_version` (
  `id` int(11) NOT NULL,
  `tax_rule_id` int(11) DEFAULT NULL,
  `ref` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  `template_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `virtual` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  CONSTRAINT `product_version_FK_1` FOREIGN KEY (`id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_version`
--

LOCK TABLES `product_version` WRITE;
/*!40000 ALTER TABLE `product_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_i18n`
--

DROP TABLE IF EXISTS `profile_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `profile_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `profile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_i18n`
--

LOCK TABLES `profile_i18n` WRITE;
/*!40000 ALTER TABLE `profile_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_module`
--

DROP TABLE IF EXISTS `profile_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_module` (
  `profile_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `access` tinyint(4) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`profile_id`,`module_id`),
  KEY `idx_profile_module_profile_id` (`profile_id`),
  KEY `idx_profile_module_module_id` (`module_id`),
  CONSTRAINT `fk_profile_module_module_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_profile_module_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_module`
--

LOCK TABLES `profile_module` WRITE;
/*!40000 ALTER TABLE `profile_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_resource`
--

DROP TABLE IF EXISTS `profile_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_resource` (
  `profile_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `access` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`profile_id`,`resource_id`),
  KEY `idx_profile_resource_profile_id` (`profile_id`),
  KEY `idx_profile_resource_resource_id` (`resource_id`),
  CONSTRAINT `fk_profile_resource_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_profile_resource_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_resource`
--

LOCK TABLES `profile_resource` WRITE;
/*!40000 ALTER TABLE `profile_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,'admin.address','2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,'admin.configuration.administrator','2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,'admin.configuration.area','2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,'admin.configuration.attribute','2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,'admin.category','2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,'admin.configuration','2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,'admin.content','2026-09-30 13:51:52','2026-09-30 13:51:52'),(8,'admin.configuration.country','2026-09-30 13:51:52','2026-09-30 13:51:52'),(9,'admin.coupon','2026-09-30 13:51:52','2026-09-30 13:51:52'),(10,'admin.configuration.currency','2026-09-30 13:51:52','2026-09-30 13:51:52'),(11,'admin.customer','2026-09-30 13:51:52','2026-09-30 13:51:52'),(12,'admin.configuration.feature','2026-09-30 13:51:52','2026-09-30 13:51:52'),(13,'admin.folder','2026-09-30 13:51:52','2026-09-30 13:51:52'),(14,'admin.configuration.language','2026-09-30 13:51:52','2026-09-30 13:51:52'),(15,'admin.configuration.mailing-system','2026-09-30 13:51:52','2026-09-30 13:51:52'),(16,'admin.configuration.message','2026-09-30 13:51:52','2026-09-30 13:51:52'),(17,'admin.module','2026-09-30 13:51:52','2026-09-30 13:51:52'),(18,'admin.order','2026-09-30 13:51:52','2026-09-30 13:51:52'),(19,'admin.product','2026-09-30 13:51:52','2026-09-30 13:51:52'),(20,'admin.configuration.profile','2026-09-30 13:51:52','2026-09-30 13:51:52'),(21,'admin.configuration.shipping-zone','2026-09-30 13:51:52','2026-09-30 13:51:52'),(22,'admin.configuration.tax','2026-09-30 13:51:52','2026-09-30 13:51:52'),(23,'admin.configuration.template','2026-09-30 13:51:52','2026-09-30 13:51:52'),(24,'admin.configuration.system-log','2026-09-30 13:51:52','2026-09-30 13:51:52'),(25,'admin.cache','2026-09-30 13:51:52','2026-09-30 13:51:52'),(26,'admin.home','2026-09-30 13:51:52','2026-09-30 13:51:52'),(27,'admin.configuration.store','2026-09-30 13:51:52','2026-09-30 13:51:52'),(28,'admin.configuration.variable','2026-09-30 13:51:52','2026-09-30 13:51:52'),(29,'admin.configuration.admin-logs','2026-09-30 13:51:52','2026-09-30 13:51:52'),(30,'admin.configuration.system-logs','2026-09-30 13:51:52','2026-09-30 13:51:52'),(31,'admin.configuration.advanced','2026-09-30 13:51:52','2026-09-30 13:51:52'),(32,'admin.configuration.translations','2026-09-30 13:51:52','2026-09-30 13:51:52'),(33,'admin.export','2026-09-30 13:51:52','2026-09-30 13:51:52'),(34,'admin.tools','2026-09-30 13:51:52','2026-09-30 13:51:52'),(35,'admin.brand','2026-09-30 13:51:52','2026-09-30 13:51:52'),(36,'admin.hook','2026-09-30 13:51:52','2026-09-30 13:51:52'),(37,'admin.module-hook','2026-09-30 13:51:52','2026-09-30 13:51:52'),(38,'admin.sales','2026-09-30 13:51:52','2026-09-30 13:51:52'),(39,'admin.administrator','2026-09-30 13:51:52','2026-09-30 13:51:52'),(40,'admin.configuration.category','2026-09-30 13:51:52','2026-09-30 13:51:52'),(41,'admin.configuration.shipping-configuration','2026-09-30 13:51:52','2026-09-30 13:51:52'),(42,'admin.configuration.tax-rule','2026-09-30 13:51:52','2026-09-30 13:51:52'),(43,'admin.hooks','2026-09-30 13:51:52','2026-09-30 13:51:52'),(44,'admin.import','2026-09-30 13:51:52','2026-09-30 13:51:52'),(45,'admin.modules','2026-09-30 13:51:52','2026-09-30 13:51:52'),(46,'admin.profile','2026-09-30 13:51:52','2026-09-30 13:51:52'),(47,'admin.search','2026-09-30 13:51:52','2026-09-30 13:51:52'),(49,'admin.customer.title','2026-09-30 13:51:52','2026-09-30 13:51:52'),(50,'admin.configuration.order-status','2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_i18n`
--

DROP TABLE IF EXISTS `resource_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `resource_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_i18n`
--

LOCK TABLES `resource_i18n` WRITE;
/*!40000 ALTER TABLE `resource_i18n` DISABLE KEYS */;
INSERT INTO `resource_i18n` VALUES (1,'cs_CZ','Adresa',NULL,NULL,NULL),(1,'de_DE','Adresse',NULL,NULL,NULL),(1,'en_US','Address',NULL,NULL,NULL),(1,'es_ES','Dirección',NULL,NULL,NULL),(1,'fr_FR','Adresse',NULL,NULL,NULL),(1,'it_IT','Indirizzo',NULL,NULL,NULL),(1,'ru_RU','Адрес',NULL,NULL,NULL),(2,'cs_CZ',NULL,NULL,NULL,NULL),(2,'de_DE','Konfiguration / Administrator',NULL,NULL,NULL),(2,'en_US','Configuration / Administrator',NULL,NULL,NULL),(2,'es_ES','Configuración / administrador',NULL,NULL,NULL),(2,'fr_FR','Configuration / Administrateur',NULL,NULL,NULL),(2,'it_IT',NULL,NULL,NULL,NULL),(2,'ru_RU','Конфигурация / Администратор',NULL,NULL,NULL),(3,'cs_CZ',NULL,NULL,NULL,NULL),(3,'de_DE','Konfiguration / Zone',NULL,NULL,NULL),(3,'en_US','Configuration / Area',NULL,NULL,NULL),(3,'es_ES','Configuración / área',NULL,NULL,NULL),(3,'fr_FR','Configuration / Zone',NULL,NULL,NULL),(3,'it_IT',NULL,NULL,NULL,NULL),(3,'ru_RU','Конфигурация / Зона',NULL,NULL,NULL),(4,'cs_CZ',NULL,NULL,NULL,NULL),(4,'de_DE','Konfiguration / Deklination',NULL,NULL,NULL),(4,'en_US','Configuration / Attribute',NULL,NULL,NULL),(4,'es_ES','Configuración / atributo',NULL,NULL,NULL),(4,'fr_FR','Configuration / Attribut',NULL,NULL,NULL),(4,'it_IT',NULL,NULL,NULL,NULL),(4,'ru_RU','Конфигурация / Атрибут',NULL,NULL,NULL),(5,'cs_CZ','Kategorie',NULL,NULL,NULL),(5,'de_DE','Kategorie',NULL,NULL,NULL),(5,'en_US','Category',NULL,NULL,NULL),(5,'es_ES','Categoria',NULL,NULL,NULL),(5,'fr_FR','Catégorie',NULL,NULL,NULL),(5,'it_IT','Categoria',NULL,NULL,NULL),(5,'ru_RU','Категория',NULL,NULL,NULL),(6,'cs_CZ',NULL,NULL,NULL,NULL),(6,'de_DE','Einstellungen',NULL,NULL,NULL),(6,'en_US','Configuration',NULL,NULL,NULL),(6,'es_ES','Configuración',NULL,NULL,NULL),(6,'fr_FR','Configuration',NULL,NULL,NULL),(6,'it_IT','Impostazioni',NULL,NULL,NULL),(6,'ru_RU','Конфигурация',NULL,NULL,NULL),(7,'cs_CZ','Obsah',NULL,NULL,NULL),(7,'de_DE','Inhalt',NULL,NULL,NULL),(7,'en_US','Content',NULL,NULL,NULL),(7,'es_ES','Contenido',NULL,NULL,NULL),(7,'fr_FR','Contenu',NULL,NULL,NULL),(7,'it_IT','Contenuto',NULL,NULL,NULL),(7,'ru_RU','Содержимое',NULL,NULL,NULL),(8,'cs_CZ',NULL,NULL,NULL,NULL),(8,'de_DE','Konfiguration / Land',NULL,NULL,NULL),(8,'en_US','Configuration / Country',NULL,NULL,NULL),(8,'es_ES','Configuración / país',NULL,NULL,NULL),(8,'fr_FR','Configuration / Pays',NULL,NULL,NULL),(8,'it_IT',NULL,NULL,NULL,NULL),(8,'ru_RU','Конфигурация / Страна',NULL,NULL,NULL),(9,'cs_CZ',NULL,NULL,NULL,NULL),(9,'de_DE','Gutschein',NULL,NULL,NULL),(9,'en_US','Coupon',NULL,NULL,NULL),(9,'es_ES','Cupón',NULL,NULL,NULL),(9,'fr_FR','Code promo',NULL,NULL,NULL),(9,'it_IT','Promozione',NULL,NULL,NULL),(9,'ru_RU','Купон',NULL,NULL,NULL),(10,'cs_CZ',NULL,NULL,NULL,NULL),(10,'de_DE','Konfiguration / Währung',NULL,NULL,NULL),(10,'en_US','Configuration / Currency',NULL,NULL,NULL),(10,'es_ES','Configuración / Moneda',NULL,NULL,NULL),(10,'fr_FR','Configuration / Devise',NULL,NULL,NULL),(10,'it_IT',NULL,NULL,NULL,NULL),(10,'ru_RU','Конфигурация / Валюта',NULL,NULL,NULL),(11,'cs_CZ',NULL,NULL,NULL,NULL),(11,'de_DE','Kunde',NULL,NULL,NULL),(11,'en_US','Customer',NULL,NULL,NULL),(11,'es_ES','Cliente',NULL,NULL,NULL),(11,'fr_FR','Client',NULL,NULL,NULL),(11,'it_IT','Cliente',NULL,NULL,NULL),(11,'ru_RU','Клиент',NULL,NULL,NULL),(12,'cs_CZ',NULL,NULL,NULL,NULL),(12,'de_DE','Konfiguration / Charakteristik',NULL,NULL,NULL),(12,'en_US','Configuration / Feature',NULL,NULL,NULL),(12,'es_ES','Configuración / Característica',NULL,NULL,NULL),(12,'fr_FR','Configuration / Caractéristique',NULL,NULL,NULL),(12,'it_IT',NULL,NULL,NULL,NULL),(12,'ru_RU','Конфигурация / Характеристика',NULL,NULL,NULL),(13,'cs_CZ',NULL,NULL,NULL,NULL),(13,'de_DE','Ordner',NULL,NULL,NULL),(13,'en_US','Folder',NULL,NULL,NULL),(13,'es_ES','Carpeta',NULL,NULL,NULL),(13,'fr_FR','Dossier',NULL,NULL,NULL),(13,'it_IT','Cartella',NULL,NULL,NULL),(13,'ru_RU','Папка',NULL,NULL,NULL),(14,'cs_CZ',NULL,NULL,NULL,NULL),(14,'de_DE','Konfiguration / Sprache',NULL,NULL,NULL),(14,'en_US','Configuration / Language',NULL,NULL,NULL),(14,'es_ES','Configuración / Idioma',NULL,NULL,NULL),(14,'fr_FR','Configuration / Langue',NULL,NULL,NULL),(14,'it_IT',NULL,NULL,NULL,NULL),(14,'ru_RU','Конфигурация / Язык',NULL,NULL,NULL),(15,'cs_CZ',NULL,NULL,NULL,NULL),(15,'de_DE','Konfiguration / Mailing-System',NULL,NULL,NULL),(15,'en_US','Configuration / Mailing-system',NULL,NULL,NULL),(15,'es_ES','Configuración / Sistema de correo',NULL,NULL,NULL),(15,'fr_FR','Configuration / Système de mails',NULL,NULL,NULL),(15,'it_IT',NULL,NULL,NULL,NULL),(15,'ru_RU','Конфигурация / Система отправки почты',NULL,NULL,NULL),(16,'cs_CZ',NULL,NULL,NULL,NULL),(16,'de_DE','Konfiguration / Nachricht',NULL,NULL,NULL),(16,'en_US','Configuration / Message',NULL,NULL,NULL),(16,'es_ES','Configuración / Mensaje',NULL,NULL,NULL),(16,'fr_FR','Configuration / Message',NULL,NULL,NULL),(16,'it_IT',NULL,NULL,NULL,NULL),(16,'ru_RU','Конфигурация / Сообщение',NULL,NULL,NULL),(17,'cs_CZ',NULL,NULL,NULL,NULL),(17,'de_DE','Konfiguration / Modul',NULL,NULL,NULL),(17,'en_US','Configuration / Module',NULL,NULL,NULL),(17,'es_ES','Configuración / Módulo',NULL,NULL,NULL),(17,'fr_FR','Configuration / Module',NULL,NULL,NULL),(17,'it_IT',NULL,NULL,NULL,NULL),(17,'ru_RU','Конфигурация / Модуль',NULL,NULL,NULL),(18,'cs_CZ',NULL,NULL,NULL,NULL),(18,'de_DE','Bestellung',NULL,NULL,NULL),(18,'en_US','Order',NULL,NULL,NULL),(18,'es_ES','Pedido',NULL,NULL,NULL),(18,'fr_FR','Commande',NULL,NULL,NULL),(18,'it_IT',NULL,NULL,NULL,NULL),(18,'ru_RU','Заказ',NULL,NULL,NULL),(19,'cs_CZ',NULL,NULL,NULL,NULL),(19,'de_DE','Produkt',NULL,NULL,NULL),(19,'en_US','Product',NULL,NULL,NULL),(19,'es_ES','Producto',NULL,NULL,NULL),(19,'fr_FR','Produit',NULL,NULL,NULL),(19,'it_IT','Prodotto',NULL,NULL,NULL),(19,'ru_RU','Товар',NULL,NULL,NULL),(20,'cs_CZ',NULL,NULL,NULL,NULL),(20,'de_DE','Konfiguration / Profil',NULL,NULL,NULL),(20,'en_US','Configuration / Profile',NULL,NULL,NULL),(20,'es_ES','Configuración / Perfil',NULL,NULL,NULL),(20,'fr_FR','Configuration / Profil',NULL,NULL,NULL),(20,'it_IT',NULL,NULL,NULL,NULL),(20,'ru_RU','Конфигурация / Профиль',NULL,NULL,NULL),(21,'cs_CZ',NULL,NULL,NULL,NULL),(21,'de_DE','Konfiguration / Lieferzone',NULL,NULL,NULL),(21,'en_US','Configuration / Shipping-zone',NULL,NULL,NULL),(21,'es_ES','Configuración / Zona de envío',NULL,NULL,NULL),(21,'fr_FR','Configuration / Zone de livraison',NULL,NULL,NULL),(21,'it_IT',NULL,NULL,NULL,NULL),(21,'ru_RU','Конфигурация / Зона доставки',NULL,NULL,NULL),(22,'cs_CZ',NULL,NULL,NULL,NULL),(22,'de_DE','Konfiguration / Tax',NULL,NULL,NULL),(22,'en_US','Configuration / Tax',NULL,NULL,NULL),(22,'es_ES','Configuración / Impuestos',NULL,NULL,NULL),(22,'fr_FR','Configuration / Taxe',NULL,NULL,NULL),(22,'it_IT',NULL,NULL,NULL,NULL),(22,'ru_RU','Конфигурация / Налог',NULL,NULL,NULL),(23,'cs_CZ',NULL,NULL,NULL,NULL),(23,'de_DE','Konfiguration / Template',NULL,NULL,NULL),(23,'en_US','Configuration / Template',NULL,NULL,NULL),(23,'es_ES','Configuración / Plantilla',NULL,NULL,NULL),(23,'fr_FR','Configuration / Modèle',NULL,NULL,NULL),(23,'it_IT',NULL,NULL,NULL,NULL),(23,'ru_RU','Конфигурация / Шаблон',NULL,NULL,NULL),(24,'cs_CZ',NULL,NULL,NULL,NULL),(24,'de_DE','Konfiguration / Logs System',NULL,NULL,NULL),(24,'en_US','Configuration / System Log',NULL,NULL,NULL),(24,'es_ES','Configuración / Sistema de log',NULL,NULL,NULL),(24,'fr_FR','Configuration / Logs système',NULL,NULL,NULL),(24,'it_IT',NULL,NULL,NULL,NULL),(24,'ru_RU','Конфигурация / Системный лог',NULL,NULL,NULL),(25,'cs_CZ',NULL,NULL,NULL,NULL),(25,'de_DE','Konfiguration / Cache',NULL,NULL,NULL),(25,'en_US','Configuration / Cache',NULL,NULL,NULL),(25,'es_ES','Configuración / caché',NULL,NULL,NULL),(25,'fr_FR','Configuration / Cache',NULL,NULL,NULL),(25,'it_IT',NULL,NULL,NULL,NULL),(25,'ru_RU','Конфигурация / Кеш',NULL,NULL,NULL),(26,'cs_CZ',NULL,NULL,NULL,NULL),(26,'de_DE','Back-Office Startseite',NULL,NULL,NULL),(26,'en_US','Back-office home page',NULL,NULL,NULL),(26,'es_ES','Página de inicio de back office',NULL,NULL,NULL),(26,'fr_FR','Page d\'acceuil de l\'administration',NULL,NULL,NULL),(26,'it_IT',NULL,NULL,NULL,NULL),(26,'ru_RU','Главная админки',NULL,NULL,NULL),(27,'cs_CZ',NULL,NULL,NULL,NULL),(27,'de_DE','Shop Informationen',NULL,NULL,NULL),(27,'en_US','Store information configuration',NULL,NULL,NULL),(27,'es_ES','Configuración de la información de tienda',NULL,NULL,NULL),(27,'fr_FR','Configuration des informations sur la boutique',NULL,NULL,NULL),(27,'it_IT',NULL,NULL,NULL,NULL),(27,'ru_RU','Конфигурация информации магазина',NULL,NULL,NULL),(28,'cs_CZ',NULL,NULL,NULL,NULL),(28,'de_DE','Konfigurations Variablen',NULL,NULL,NULL),(28,'en_US','Configuration variables',NULL,NULL,NULL),(28,'es_ES','Variables de configuración',NULL,NULL,NULL),(28,'fr_FR','Variables de configuration',NULL,NULL,NULL),(28,'it_IT',NULL,NULL,NULL,NULL),(28,'ru_RU','Конфигурация переменных',NULL,NULL,NULL),(29,'cs_CZ',NULL,NULL,NULL,NULL),(29,'de_DE','Administration Logs ansehen',NULL,NULL,NULL),(29,'en_US','View administration logs',NULL,NULL,NULL),(29,'es_ES','Ver logs de administración',NULL,NULL,NULL),(29,'fr_FR','Consulter les logs d\'administration',NULL,NULL,NULL),(29,'it_IT',NULL,NULL,NULL,NULL),(29,'ru_RU','Просмотр административных логов',NULL,NULL,NULL),(30,'cs_CZ',NULL,NULL,NULL,NULL),(30,'de_DE','Logs System Konfiguration',NULL,NULL,NULL),(30,'en_US','Logging system configuration',NULL,NULL,NULL),(30,'es_ES','Configuración de sistema de registro',NULL,NULL,NULL),(30,'fr_FR','Configuration du système de log',NULL,NULL,NULL),(30,'it_IT',NULL,NULL,NULL,NULL),(30,'ru_RU','Конфигурация системы логов',NULL,NULL,NULL),(31,'cs_CZ',NULL,NULL,NULL,NULL),(31,'de_DE','Erweiterte Konfiguration',NULL,NULL,NULL),(31,'en_US','Advanced configuration',NULL,NULL,NULL),(31,'es_ES','Configuración avanzada',NULL,NULL,NULL),(31,'fr_FR','Configuration avancée',NULL,NULL,NULL),(31,'it_IT','Configurazione avanzata',NULL,NULL,NULL),(31,'ru_RU','Расширенная конфигурация',NULL,NULL,NULL),(32,'cs_CZ',NULL,NULL,NULL,NULL),(32,'de_DE','Übersetzungen',NULL,NULL,NULL),(32,'en_US','Translations',NULL,NULL,NULL),(32,'es_ES','Traducciones',NULL,NULL,NULL),(32,'fr_FR','Traductions',NULL,NULL,NULL),(32,'it_IT',NULL,NULL,NULL,NULL),(32,'ru_RU','Переводы',NULL,NULL,NULL),(33,'cs_CZ',NULL,NULL,NULL,NULL),(33,'de_DE','Exporten-Verwaltung',NULL,NULL,NULL),(33,'en_US','Back-office export management',NULL,NULL,NULL),(33,'es_ES','Gestor de exportación de Back Office',NULL,NULL,NULL),(33,'fr_FR','gestion des exports',NULL,NULL,NULL),(33,'it_IT',NULL,NULL,NULL,NULL),(33,'ru_RU','Управление экспортом в админке',NULL,NULL,NULL),(34,'cs_CZ',NULL,NULL,NULL,NULL),(34,'de_DE','Tools',NULL,NULL,NULL),(34,'en_US','Tools panel',NULL,NULL,NULL),(34,'es_ES','Panel de herramientas',NULL,NULL,NULL),(34,'fr_FR','Outils',NULL,NULL,NULL),(34,'it_IT',NULL,NULL,NULL,NULL),(34,'ru_RU','Панель инструментов',NULL,NULL,NULL),(35,'cs_CZ',NULL,NULL,NULL,NULL),(35,'de_DE','Marken-Verwaltung',NULL,NULL,NULL),(35,'en_US','Brands management',NULL,NULL,NULL),(35,'es_ES','Gestión de marcas',NULL,NULL,NULL),(35,'fr_FR','Gestion des marques',NULL,NULL,NULL),(35,'it_IT',NULL,NULL,NULL,NULL),(35,'ru_RU','Управление брендами',NULL,NULL,NULL),(36,'cs_CZ',NULL,NULL,NULL,NULL),(36,'de_DE','Andockpunkte',NULL,NULL,NULL),(36,'en_US','Hooks',NULL,NULL,NULL),(36,'es_ES','Hooks',NULL,NULL,NULL),(36,'fr_FR','Points d\'accroche',NULL,NULL,NULL),(36,'it_IT',NULL,NULL,NULL,NULL),(36,'ru_RU','Хуки',NULL,NULL,NULL),(37,'cs_CZ',NULL,NULL,NULL,NULL),(37,'de_DE','Hook Positionen',NULL,NULL,NULL),(37,'en_US','Hook positions',NULL,NULL,NULL),(37,'es_ES','Posiciones de hook',NULL,NULL,NULL),(37,'fr_FR','Positions des points d\'accroche',NULL,NULL,NULL),(37,'it_IT','Posizioni dell\'hook',NULL,NULL,NULL),(37,'ru_RU','Позиции хуков',NULL,NULL,NULL),(38,'cs_CZ',NULL,NULL,NULL,NULL),(38,'de_DE','Sonderangebotsmanagement',NULL,NULL,NULL),(38,'en_US','Sales management',NULL,NULL,NULL),(38,'es_ES','Administración de ventas',NULL,NULL,NULL),(38,'fr_FR','Gestion des promotions',NULL,NULL,NULL),(38,'it_IT','Gestione vendite',NULL,NULL,NULL),(38,'ru_RU','Управление распродажами',NULL,NULL,NULL),(39,'cs_CZ',NULL,NULL,NULL,NULL),(39,'de_DE','Administratorenliste',NULL,NULL,NULL),(39,'en_US','Administatros list',NULL,NULL,NULL),(39,'es_ES','Lista de Administradores',NULL,NULL,NULL),(39,'fr_FR','Liste des administrateurs',NULL,NULL,NULL),(39,'it_IT',NULL,NULL,NULL,NULL),(39,'ru_RU','Список администраторов',NULL,NULL,NULL),(40,'cs_CZ',NULL,NULL,NULL,NULL),(40,'de_DE','Kategorie-Konfiguration',NULL,NULL,NULL),(40,'en_US','Category configuration',NULL,NULL,NULL),(40,'es_ES','Configuración de la categoría',NULL,NULL,NULL),(40,'fr_FR','Configuration d\'une catégorie',NULL,NULL,NULL),(40,'it_IT',NULL,NULL,NULL,NULL),(40,'ru_RU','Конфигурация категорий',NULL,NULL,NULL),(41,'cs_CZ',NULL,NULL,NULL,NULL),(41,'de_DE','Lieferungskonfiguration',NULL,NULL,NULL),(41,'en_US','Shipping configuration',NULL,NULL,NULL),(41,'es_ES','Configuración de envío',NULL,NULL,NULL),(41,'fr_FR','Configuration du transport',NULL,NULL,NULL),(41,'it_IT','Configurazione di spedizione',NULL,NULL,NULL),(41,'ru_RU','Конфигурация доставки',NULL,NULL,NULL),(42,'cs_CZ',NULL,NULL,NULL,NULL),(42,'de_DE','Taxeregelung-Konfiguration',NULL,NULL,NULL),(42,'en_US','Tax rules configuration',NULL,NULL,NULL),(42,'es_ES','Configuración de las reglas de impuestos',NULL,NULL,NULL),(42,'fr_FR','Configuration des règles de taxes',NULL,NULL,NULL),(42,'it_IT',NULL,NULL,NULL,NULL),(42,'ru_RU','Конфигурация налоговых правил',NULL,NULL,NULL),(43,'cs_CZ',NULL,NULL,NULL,NULL),(43,'de_DE','Hooks Verwendung',NULL,NULL,NULL),(43,'en_US','Hooks management',NULL,NULL,NULL),(43,'es_ES','Gestión de Hooks',NULL,NULL,NULL),(43,'fr_FR','Gestion des hooks',NULL,NULL,NULL),(43,'it_IT',NULL,NULL,NULL,NULL),(43,'ru_RU','Управление хуками',NULL,NULL,NULL),(44,'cs_CZ',NULL,NULL,NULL,NULL),(44,'de_DE','Importation / Exportation von Daten',NULL,NULL,NULL),(44,'en_US','Data import / export',NULL,NULL,NULL),(44,'es_ES','Importación/ exportación de datos',NULL,NULL,NULL),(44,'fr_FR','Importation / exportation de données',NULL,NULL,NULL),(44,'it_IT',NULL,NULL,NULL,NULL),(44,'ru_RU','Импорт / экспорт',NULL,NULL,NULL),(45,'cs_CZ',NULL,NULL,NULL,NULL),(45,'de_DE','Modul Verwendung',NULL,NULL,NULL),(45,'en_US','Modules maagement',NULL,NULL,NULL),(45,'es_ES','Administración de módulos',NULL,NULL,NULL),(45,'fr_FR','Gestion des modules',NULL,NULL,NULL),(45,'it_IT',NULL,NULL,NULL,NULL),(45,'ru_RU','Управление модулями',NULL,NULL,NULL),(46,'cs_CZ',NULL,NULL,NULL,NULL),(46,'de_DE','Administration-Profilverwaltung',NULL,NULL,NULL),(46,'en_US','Administration profiles management',NULL,NULL,NULL),(46,'es_ES','Gestión de perfiles de administración',NULL,NULL,NULL),(46,'fr_FR','Gestion des profils d\'administration',NULL,NULL,NULL),(46,'it_IT',NULL,NULL,NULL,NULL),(46,'ru_RU','Управление административными модулями',NULL,NULL,NULL),(47,'cs_CZ',NULL,NULL,NULL,NULL),(47,'de_DE','Back-Office Suchfunktion',NULL,NULL,NULL),(47,'en_US','Back-office search function',NULL,NULL,NULL),(47,'es_ES','Función de búsqueda de back office',NULL,NULL,NULL),(47,'fr_FR','Fonction de recherche dans l\'administration',NULL,NULL,NULL),(47,'it_IT',NULL,NULL,NULL,NULL),(47,'ru_RU','Поиск по админке',NULL,NULL,NULL),(49,'cs_CZ',NULL,NULL,NULL,NULL),(49,'de_DE','Kunde-Andere',NULL,NULL,NULL),(49,'en_US','Customer title',NULL,NULL,NULL),(49,'es_ES','Estado civil cliente',NULL,NULL,NULL),(49,'fr_FR','civilité client',NULL,NULL,NULL),(49,'it_IT',NULL,NULL,NULL,NULL),(49,'ru_RU','Заголовок клиента',NULL,NULL,NULL),(50,'cs_CZ',NULL,NULL,NULL,NULL),(50,'de_DE',NULL,NULL,NULL,NULL),(50,'en_US','Configuration order status',NULL,NULL,NULL),(50,'es_ES',NULL,NULL,NULL,NULL),(50,'fr_FR',NULL,NULL,NULL,NULL),(50,'it_IT',NULL,NULL,NULL,NULL),(50,'ru_RU',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resource_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewriting_argument`
--

DROP TABLE IF EXISTS `rewriting_argument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rewriting_argument` (
  `rewriting_url_id` int(11) NOT NULL,
  `parameter` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`rewriting_url_id`,`parameter`,`value`),
  KEY `idx_rewriting_argument_rewirting_url_id` (`rewriting_url_id`),
  CONSTRAINT `fk_rewriting_argument_rewirting_url_id` FOREIGN KEY (`rewriting_url_id`) REFERENCES `rewriting_url` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewriting_argument`
--

LOCK TABLES `rewriting_argument` WRITE;
/*!40000 ALTER TABLE `rewriting_argument` DISABLE KEYS */;
/*!40000 ALTER TABLE `rewriting_argument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewriting_url`
--

DROP TABLE IF EXISTS `rewriting_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rewriting_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varbinary(255) NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `view_id` varchar(255) DEFAULT NULL,
  `view_locale` varchar(255) DEFAULT NULL,
  `redirected` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`),
  KEY `idx_rewriting_url_redirected` (`redirected`),
  KEY `idx_rewriting_url` (`view_locale`,`view`,`view_id`,`redirected`),
  CONSTRAINT `fk_rewriting_url_redirected` FOREIGN KEY (`redirected`) REFERENCES `rewriting_url` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewriting_url`
--

LOCK TABLES `rewriting_url` WRITE;
/*!40000 ALTER TABLE `rewriting_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `rewriting_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `display_initial_price` tinyint(1) NOT NULL DEFAULT 1,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `price_offset_type` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sales_active_start_end_date` (`active`,`start_date`,`end_date`),
  KEY `idx_sales_active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_i18n`
--

DROP TABLE IF EXISTS `sale_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `chapo` text DEFAULT NULL,
  `postscriptum` text DEFAULT NULL,
  `sale_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `sale_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `sale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_i18n`
--

LOCK TABLES `sale_i18n` WRITE;
/*!40000 ALTER TABLE `sale_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_offset_currency`
--

DROP TABLE IF EXISTS `sale_offset_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_offset_currency` (
  `sale_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `price_offset_value` float DEFAULT 0,
  PRIMARY KEY (`sale_id`,`currency_id`),
  KEY `fk_sale_offset_currency_currency1_idx` (`currency_id`),
  CONSTRAINT `fk_sale_offset_currency_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sale_offset_currency_sales_id` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_offset_currency`
--

LOCK TABLES `sale_offset_currency` WRITE;
/*!40000 ALTER TABLE `sale_offset_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_offset_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_product`
--

DROP TABLE IF EXISTS `sale_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_av_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sale_product_product_idx` (`product_id`),
  KEY `fk_sale_product_attribute_av_idx` (`attribute_av_id`),
  KEY `idx_sale_product_sales_id_product_id` (`sale_id`,`product_id`),
  CONSTRAINT `fk_sale_product_attribute_av_id` FOREIGN KEY (`attribute_av_id`) REFERENCES `attribute_av` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sale_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sale_product_sales_id` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_product`
--

LOCK TABLES `sale_product` WRITE;
/*!40000 ALTER TABLE `sale_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visible` tinyint(4) NOT NULL DEFAULT 0,
  `isocode` varchar(4) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_state_country_id_idx` (`country_id`),
  CONSTRAINT `fk_state_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,1,'AL',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,1,'AK',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(3,1,'AZ',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(4,1,'AR',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(5,1,'CA',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(6,1,'CO',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(7,1,'CT',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(8,1,'DE',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(9,1,'FL',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(10,1,'GA',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(11,1,'HI',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(12,1,'ID',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(13,1,'IL',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(14,1,'IN',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(15,1,'IA',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(16,1,'KS',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(17,1,'KY',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(18,1,'LA',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(19,1,'ME',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(20,1,'MD',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(21,1,'MA',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(22,1,'MI',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(23,1,'MN',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(24,1,'MS',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(25,1,'MO',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(26,1,'MT',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(27,1,'NE',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(28,1,'NV',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(29,1,'NH',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(30,1,'NJ',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(31,1,'NM',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(32,1,'NY',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(33,1,'NC',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(34,1,'ND',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(35,1,'OH',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(36,1,'OK',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(37,1,'OR',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(38,1,'PA',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(39,1,'RI',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(40,1,'SC',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(41,1,'SD',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(42,1,'TN',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(43,1,'TX',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(44,1,'UT',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(45,1,'VT',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(46,1,'VA',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(47,1,'WA',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(48,1,'WV',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(49,1,'WI',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(50,1,'WY',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(51,1,'PR',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(52,1,'VI',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(53,1,'DC',196,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(54,1,'AGS',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(55,1,'BCN',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(56,1,'BCS',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(57,1,'CAM',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(58,1,'CHP',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(59,1,'CHH',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(60,1,'COA',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(61,1,'COL',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(62,1,'DIF',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(63,1,'DUR',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(64,1,'GUA',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(65,1,'GRO',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(66,1,'HID',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(67,1,'JAL',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(68,1,'MEX',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(69,1,'MIC',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(70,1,'MOR',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(71,1,'NAY',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(72,1,'NLE',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(73,1,'OAX',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(74,1,'PUE',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(75,1,'QUE',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(76,1,'ROO',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(77,1,'SLP',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(78,1,'SIN',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(79,1,'SON',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(80,1,'TAB',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(81,1,'TAM',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(82,1,'TLA',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(83,1,'VER',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(84,1,'YUC',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(85,1,'ZAC',115,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(86,1,'ON',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(87,1,'QC',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(88,1,'BC',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(89,1,'AB',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(90,1,'MB',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(91,1,'SK',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(92,1,'NS',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(93,1,'NB',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(94,1,'NL',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(95,1,'PE',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(96,1,'NT',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(97,1,'YT',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(98,1,'NU',246,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(99,1,'B',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(100,1,'K',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(101,1,'H',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(102,1,'U',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(103,1,'C',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(104,1,'X',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(105,1,'W',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(106,1,'E',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(107,1,'P',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(108,1,'Y',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(109,1,'L',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(110,1,'F',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(111,1,'M',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(112,1,'N',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(113,1,'Q',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(114,1,'R',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(115,1,'A',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(116,1,'J',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(117,1,'D',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(118,1,'Z',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(119,1,'S',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(120,1,'G',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(121,1,'V',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(122,1,'T',10,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(123,1,'AG',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(124,1,'AL',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(125,1,'AN',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(126,1,'AO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(127,1,'AR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(128,1,'AP',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(129,1,'AT',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(130,1,'AV',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(131,1,'BA',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(132,1,'BT',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(133,1,'BL',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(134,1,'BN',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(135,1,'BG',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(136,1,'BI',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(137,1,'BO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(138,1,'BZ',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(139,1,'BS',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(140,1,'BR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(141,1,'CA',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(142,1,'CL',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(143,1,'CB',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(144,1,'CI',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(145,1,'CE',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(146,1,'CT',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(147,1,'CZ',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(148,1,'CH',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(149,1,'CO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(150,1,'CS',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(151,1,'CR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(152,1,'KR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(153,1,'CN',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(154,1,'EN',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(155,1,'FM',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(156,1,'FE',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(157,1,'FI',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(158,1,'FG',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(159,1,'FC',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(160,1,'FR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(161,1,'GE',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(162,1,'GO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(163,1,'GR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(164,1,'IM',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(165,1,'IS',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(166,1,'AQ',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(167,1,'SP',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(168,1,'LT',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(169,1,'LE',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(170,1,'LC',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(171,1,'LI',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(172,1,'LO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(173,1,'LU',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(174,1,'MC',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(175,1,'MN',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(176,1,'MS',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(177,1,'MT',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(178,1,'VS',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(179,1,'ME',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(180,1,'MI',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(181,1,'MO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(182,1,'MB',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(183,1,'NA',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(184,1,'NO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(185,1,'NU',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(186,1,'OG',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(187,1,'OT',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(188,1,'OR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(189,1,'PD',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(190,1,'PA',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(191,1,'PR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(192,1,'PV',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(193,1,'PG',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(194,1,'PU',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(195,1,'PE',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(196,1,'PC',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(197,1,'PI',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(198,1,'PT',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(199,1,'PN',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(200,1,'PZ',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(201,1,'PO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(202,1,'RG',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(203,1,'RA',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(204,1,'RC',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(205,1,'RE',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(206,1,'RI',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(207,1,'RN',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(208,1,'RM',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(209,1,'RO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(210,1,'SA',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(211,1,'SS',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(212,1,'SV',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(213,1,'SI',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(214,1,'SR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(215,1,'SO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(216,1,'TA',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(217,1,'TE',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(218,1,'TR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(219,1,'TO',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(220,1,'TP',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(221,1,'TN',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(222,1,'TV',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(223,1,'TS',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(224,1,'UD',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(225,1,'VA',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(226,1,'VE',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(227,1,'VB',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(228,1,'VC',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(229,1,'VR',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(230,1,'VV',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(231,1,'VI',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(232,1,'VT',86,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(233,1,'AC',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(234,1,'BA',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(235,1,'BB',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(236,1,'BT',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(237,1,'BE',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(238,1,'JT',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(239,1,'KT',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(240,1,'ST',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(241,1,'JI',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(242,1,'KI',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(243,1,'NT',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(244,1,'GO',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(245,1,'JK',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(246,1,'JA',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(247,1,'LA',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(248,1,'MA',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(249,1,'MU',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(250,1,'SA',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(251,1,'SU',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(252,1,'PA',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(253,1,'RI',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(254,1,'KR',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(255,1,'SG',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(256,1,'KS',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(257,1,'SN',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(258,1,'SS',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(259,1,'JB',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(260,1,'KB',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(261,1,'NB',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(262,1,'PB',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(263,1,'SR',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(264,1,'SB',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(265,1,'YO',80,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(266,1,'23',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(267,1,'05',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(268,1,'02',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(269,1,'12',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(270,1,'38',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(271,1,'18',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(272,1,'40',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(273,1,'07',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(274,1,'21',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(275,1,'10',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(276,1,'34',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(277,1,'01',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(278,1,'28',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(279,1,'08',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(280,1,'17',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(281,1,'03',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(282,1,'37',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(283,1,'46',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(284,1,'14',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(285,1,'39',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(286,1,'43',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(287,1,'26',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(288,1,'24',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(289,1,'04',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(290,1,'45',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(291,1,'20',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(292,1,'42',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(293,1,'29',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(294,1,'15',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(295,1,'44',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(296,1,'33',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(297,1,'47',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(298,1,'27',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(299,1,'41',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(300,1,'11',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(301,1,'25',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(302,1,'32',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(303,1,'22',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(304,1,'09',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(305,1,'36',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(306,1,'13',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(307,1,'31',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(308,1,'16',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(309,1,'30',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(310,1,'06',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(311,1,'35',88,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(312,1,'19',88,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_i18n`
--

DROP TABLE IF EXISTS `state_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `state_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `state` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_i18n`
--

LOCK TABLES `state_i18n` WRITE;
/*!40000 ALTER TABLE `state_i18n` DISABLE KEYS */;
INSERT INTO `state_i18n` VALUES (1,'cs_CZ',NULL),(1,'de_DE',NULL),(1,'en_US','Alabama'),(1,'es_ES',NULL),(1,'fr_FR','Alabama'),(1,'it_IT','Alabama'),(1,'ru_RU','Алабама'),(2,'cs_CZ',NULL),(2,'de_DE',NULL),(2,'en_US','Alaska'),(2,'es_ES',NULL),(2,'fr_FR','Alaska'),(2,'it_IT','Alaska'),(2,'ru_RU','Аляска'),(3,'cs_CZ',NULL),(3,'de_DE',NULL),(3,'en_US','Arizona'),(3,'es_ES',NULL),(3,'fr_FR','Arizona'),(3,'it_IT','Arizona'),(3,'ru_RU','Аризона'),(4,'cs_CZ',NULL),(4,'de_DE',NULL),(4,'en_US','Arkansas'),(4,'es_ES',NULL),(4,'fr_FR','Arkansas'),(4,'it_IT','Arkansas'),(4,'ru_RU','Арканзас'),(5,'cs_CZ',NULL),(5,'de_DE',NULL),(5,'en_US','California'),(5,'es_ES',NULL),(5,'fr_FR','Californie'),(5,'it_IT','California'),(5,'ru_RU','Калифорния'),(6,'cs_CZ',NULL),(6,'de_DE',NULL),(6,'en_US','Colorado'),(6,'es_ES',NULL),(6,'fr_FR','Colorado'),(6,'it_IT','Colorado'),(6,'ru_RU','Колорадо'),(7,'cs_CZ',NULL),(7,'de_DE',NULL),(7,'en_US','Connecticut'),(7,'es_ES',NULL),(7,'fr_FR','Connecticut'),(7,'it_IT',NULL),(7,'ru_RU','Коннектикут'),(8,'cs_CZ',NULL),(8,'de_DE',NULL),(8,'en_US','Delaware'),(8,'es_ES',NULL),(8,'fr_FR','Delaware'),(8,'it_IT',NULL),(8,'ru_RU','Делавэр'),(9,'cs_CZ',NULL),(9,'de_DE',NULL),(9,'en_US','Florida'),(9,'es_ES',NULL),(9,'fr_FR','Floride'),(9,'it_IT','Florida'),(9,'ru_RU','Флорида'),(10,'cs_CZ',NULL),(10,'de_DE','Georgien'),(10,'en_US','Georgia'),(10,'es_ES','Georgia'),(10,'fr_FR','Géorgie'),(10,'it_IT',NULL),(10,'ru_RU','Джорджия'),(11,'cs_CZ',NULL),(11,'de_DE',NULL),(11,'en_US','Hawaii'),(11,'es_ES',NULL),(11,'fr_FR','Hawaii'),(11,'it_IT',NULL),(11,'ru_RU','Гавайи'),(12,'cs_CZ',NULL),(12,'de_DE',NULL),(12,'en_US','Idaho'),(12,'es_ES',NULL),(12,'fr_FR','Idaho'),(12,'it_IT','Idaho'),(12,'ru_RU','Айдахо'),(13,'cs_CZ',NULL),(13,'de_DE',NULL),(13,'en_US','Illinois'),(13,'es_ES',NULL),(13,'fr_FR','Illinois'),(13,'it_IT','Illinois'),(13,'ru_RU','Иллинойс'),(14,'cs_CZ',NULL),(14,'de_DE',NULL),(14,'en_US','Indiana'),(14,'es_ES',NULL),(14,'fr_FR','Indiana'),(14,'it_IT',NULL),(14,'ru_RU','Индиана'),(15,'cs_CZ',NULL),(15,'de_DE',NULL),(15,'en_US','Iowa'),(15,'es_ES',NULL),(15,'fr_FR','Iowa'),(15,'it_IT',NULL),(15,'ru_RU','Айова'),(16,'cs_CZ',NULL),(16,'de_DE',NULL),(16,'en_US','Kansas'),(16,'es_ES',NULL),(16,'fr_FR','Kansas'),(16,'it_IT','Kansas'),(16,'ru_RU','Канзас'),(17,'cs_CZ',NULL),(17,'de_DE',NULL),(17,'en_US','Kentucky'),(17,'es_ES',NULL),(17,'fr_FR','Kentucky'),(17,'it_IT','Kentucky'),(17,'ru_RU','Кентукки'),(18,'cs_CZ',NULL),(18,'de_DE',NULL),(18,'en_US','Louisiana'),(18,'es_ES',NULL),(18,'fr_FR','Louisiane'),(18,'it_IT','Louisiana'),(18,'ru_RU','Луизиана'),(19,'cs_CZ',NULL),(19,'de_DE',NULL),(19,'en_US','Maine'),(19,'es_ES',NULL),(19,'fr_FR','Maine'),(19,'it_IT','Maine'),(19,'ru_RU','Мейн'),(20,'cs_CZ',NULL),(20,'de_DE',NULL),(20,'en_US','Maryland'),(20,'es_ES',NULL),(20,'fr_FR','Maryland'),(20,'it_IT','Maryland'),(20,'ru_RU','Мэриленд'),(21,'cs_CZ',NULL),(21,'de_DE',NULL),(21,'en_US','Massachusetts'),(21,'es_ES',NULL),(21,'fr_FR','Massachusetts'),(21,'it_IT','Massachusetts'),(21,'ru_RU','Массачусетс'),(22,'cs_CZ',NULL),(22,'de_DE',NULL),(22,'en_US','Michigan'),(22,'es_ES',NULL),(22,'fr_FR','Michigan'),(22,'it_IT','Michigan'),(22,'ru_RU','Мичиган'),(23,'cs_CZ',NULL),(23,'de_DE',NULL),(23,'en_US','Minnesota'),(23,'es_ES',NULL),(23,'fr_FR','Minnesota'),(23,'it_IT','Minnesota'),(23,'ru_RU','Миннесота'),(24,'cs_CZ',NULL),(24,'de_DE',NULL),(24,'en_US','Mississippi'),(24,'es_ES',NULL),(24,'fr_FR','Mississippi'),(24,'it_IT','Mississippi'),(24,'ru_RU','Миссисипи'),(25,'cs_CZ',NULL),(25,'de_DE',NULL),(25,'en_US','Missouri'),(25,'es_ES',NULL),(25,'fr_FR','Missouri'),(25,'it_IT','Missouri'),(25,'ru_RU','Миссури'),(26,'cs_CZ',NULL),(26,'de_DE',NULL),(26,'en_US','Montana'),(26,'es_ES',NULL),(26,'fr_FR','Montana'),(26,'it_IT','Montana'),(26,'ru_RU','Монтана'),(27,'cs_CZ',NULL),(27,'de_DE',NULL),(27,'en_US','Nebraska'),(27,'es_ES',NULL),(27,'fr_FR','Nebraska'),(27,'it_IT',NULL),(27,'ru_RU','Небраска'),(28,'cs_CZ',NULL),(28,'de_DE',NULL),(28,'en_US','Nevada'),(28,'es_ES',NULL),(28,'fr_FR','Nevada'),(28,'it_IT','Nevada'),(28,'ru_RU','Невада'),(29,'cs_CZ',NULL),(29,'de_DE',NULL),(29,'en_US','New Hampshire'),(29,'es_ES',NULL),(29,'fr_FR','New Hampshire'),(29,'it_IT','New Hampshire'),(29,'ru_RU','Нью-Гемпшир'),(30,'cs_CZ',NULL),(30,'de_DE',NULL),(30,'en_US','New Jersey'),(30,'es_ES',NULL),(30,'fr_FR','New Jersey'),(30,'it_IT','New Jersey'),(30,'ru_RU','Нью-Джерси'),(31,'cs_CZ',NULL),(31,'de_DE',NULL),(31,'en_US','New Mexico'),(31,'es_ES',NULL),(31,'fr_FR','Nouveau-Mexique'),(31,'it_IT',NULL),(31,'ru_RU','Нью-Мексико'),(32,'cs_CZ','New York'),(32,'de_DE','New York'),(32,'en_US','New York'),(32,'es_ES','Nueva York'),(32,'fr_FR','New York'),(32,'it_IT','Roma'),(32,'ru_RU','Нью-Йорк'),(33,'cs_CZ',NULL),(33,'de_DE',NULL),(33,'en_US','North Carolina'),(33,'es_ES',NULL),(33,'fr_FR','Caroline du Nord'),(33,'it_IT','North Carolina'),(33,'ru_RU','Северная Каролина'),(34,'cs_CZ',NULL),(34,'de_DE',NULL),(34,'en_US','North Dakota'),(34,'es_ES',NULL),(34,'fr_FR','Dakota du Nord'),(34,'it_IT','North Dakota'),(34,'ru_RU','Северная Дакота'),(35,'cs_CZ',NULL),(35,'de_DE',NULL),(35,'en_US','Ohio'),(35,'es_ES',NULL),(35,'fr_FR','Ohio'),(35,'it_IT','Ohio'),(35,'ru_RU','Огайо'),(36,'cs_CZ',NULL),(36,'de_DE',NULL),(36,'en_US','Oklahoma'),(36,'es_ES',NULL),(36,'fr_FR','Oklahoma'),(36,'it_IT','Oklahoma'),(36,'ru_RU','Оклахома'),(37,'cs_CZ',NULL),(37,'de_DE',NULL),(37,'en_US','Oregon'),(37,'es_ES',NULL),(37,'fr_FR','Oregon'),(37,'it_IT','Oregon'),(37,'ru_RU','Oregon'),(38,'cs_CZ',NULL),(38,'de_DE',NULL),(38,'en_US','Pennsylvania'),(38,'es_ES',NULL),(38,'fr_FR','Pennsylvanie'),(38,'it_IT','Pennsylvania'),(38,'ru_RU','Пенсильвания'),(39,'cs_CZ',NULL),(39,'de_DE',NULL),(39,'en_US','Rhode Island'),(39,'es_ES',NULL),(39,'fr_FR','Rhode Island'),(39,'it_IT',NULL),(39,'ru_RU','Род-Айленд'),(40,'cs_CZ',NULL),(40,'de_DE',NULL),(40,'en_US','South Carolina'),(40,'es_ES',NULL),(40,'fr_FR','Caroline du Sud'),(40,'it_IT',NULL),(40,'ru_RU','Южная Каролина'),(41,'cs_CZ',NULL),(41,'de_DE',NULL),(41,'en_US','South Dakota'),(41,'es_ES',NULL),(41,'fr_FR','Dakota du Sud'),(41,'it_IT',NULL),(41,'ru_RU','Северная Дакота'),(42,'cs_CZ',NULL),(42,'de_DE',NULL),(42,'en_US','Tennessee'),(42,'es_ES',NULL),(42,'fr_FR','Tennessee'),(42,'it_IT',NULL),(42,'ru_RU','Теннесси'),(43,'cs_CZ',NULL),(43,'de_DE',NULL),(43,'en_US','Texas'),(43,'es_ES',NULL),(43,'fr_FR','Texas'),(43,'it_IT',NULL),(43,'ru_RU','Техас'),(44,'cs_CZ',NULL),(44,'de_DE',NULL),(44,'en_US','Utah'),(44,'es_ES',NULL),(44,'fr_FR','Utah'),(44,'it_IT',NULL),(44,'ru_RU','Юта'),(45,'cs_CZ',NULL),(45,'de_DE',NULL),(45,'en_US','Vermont'),(45,'es_ES',NULL),(45,'fr_FR','Vermont'),(45,'it_IT','Vermont'),(45,'ru_RU','Вермонт'),(46,'cs_CZ',NULL),(46,'de_DE',NULL),(46,'en_US','Virginia'),(46,'es_ES',NULL),(46,'fr_FR','Virginie'),(46,'it_IT',NULL),(46,'ru_RU','Вирджиния'),(47,'cs_CZ',NULL),(47,'de_DE',NULL),(47,'en_US','Washington'),(47,'es_ES',NULL),(47,'fr_FR','Washington'),(47,'it_IT',NULL),(47,'ru_RU','Вашингтон'),(48,'cs_CZ',NULL),(48,'de_DE',NULL),(48,'en_US','West Virginia'),(48,'es_ES',NULL),(48,'fr_FR','Virginie-occidentale'),(48,'it_IT',NULL),(48,'ru_RU','Западная Виргиния'),(49,'cs_CZ',NULL),(49,'de_DE',NULL),(49,'en_US','Wisconsin'),(49,'es_ES',NULL),(49,'fr_FR','Wisconsin'),(49,'it_IT',NULL),(49,'ru_RU','Висконсин'),(50,'cs_CZ',NULL),(50,'de_DE',NULL),(50,'en_US','Wyoming'),(50,'es_ES',NULL),(50,'fr_FR','Wyoming'),(50,'it_IT',NULL),(50,'ru_RU','Вайоминг'),(51,'cs_CZ',NULL),(51,'de_DE',NULL),(51,'en_US','Puerto Rico'),(51,'es_ES',NULL),(51,'fr_FR','Porto Rico'),(51,'it_IT','Puerto Rico'),(51,'ru_RU','Пуэрто-Рико'),(52,'cs_CZ',NULL),(52,'de_DE',NULL),(52,'en_US','US Virgin Islands'),(52,'es_ES',NULL),(52,'fr_FR','Îles Vierges américaines'),(52,'it_IT',NULL),(52,'ru_RU','Виргинские острова США'),(53,'cs_CZ',NULL),(53,'de_DE',NULL),(53,'en_US','District of Columbia'),(53,'es_ES',NULL),(53,'fr_FR','District de Columbia'),(53,'it_IT',NULL),(53,'ru_RU','Округ Колумбия'),(54,'cs_CZ',NULL),(54,'de_DE',NULL),(54,'en_US','Aguascalientes'),(54,'es_ES',NULL),(54,'fr_FR','Aguascalientes'),(54,'it_IT',NULL),(54,'ru_RU','Агуаскальентес'),(55,'cs_CZ',NULL),(55,'de_DE',NULL),(55,'en_US','Baja California'),(55,'es_ES',NULL),(55,'fr_FR','Baja California'),(55,'it_IT',NULL),(55,'ru_RU','Южная Калифорния'),(56,'cs_CZ',NULL),(56,'de_DE',NULL),(56,'en_US','Baja California Sur'),(56,'es_ES',NULL),(56,'fr_FR','Baja California Sur'),(56,'it_IT',NULL),(56,'ru_RU','Южная Нижняя Калифорния'),(57,'cs_CZ',NULL),(57,'de_DE',NULL),(57,'en_US','Campeche'),(57,'es_ES',NULL),(57,'fr_FR','Campeche'),(57,'it_IT',NULL),(57,'ru_RU','Кампече'),(58,'cs_CZ',NULL),(58,'de_DE',NULL),(58,'en_US','Chiapas'),(58,'es_ES',NULL),(58,'fr_FR','Chiapas'),(58,'it_IT',NULL),(58,'ru_RU','Чьяпас'),(59,'cs_CZ',NULL),(59,'de_DE',NULL),(59,'en_US','Chihuahua'),(59,'es_ES',NULL),(59,'fr_FR','Chihuahua'),(59,'it_IT',NULL),(59,'ru_RU','Чихуахуа'),(60,'cs_CZ',NULL),(60,'de_DE',NULL),(60,'en_US','Coahuila'),(60,'es_ES',NULL),(60,'fr_FR','Coahuila'),(60,'it_IT',NULL),(60,'ru_RU','Коауила'),(61,'cs_CZ',NULL),(61,'de_DE',NULL),(61,'en_US','Colima'),(61,'es_ES',NULL),(61,'fr_FR','Colima'),(61,'it_IT',NULL),(61,'ru_RU','Колима'),(62,'cs_CZ',NULL),(62,'de_DE',NULL),(62,'en_US','Distrito Federal'),(62,'es_ES','Ciudad de México'),(62,'fr_FR','Distrito Federal'),(62,'it_IT',NULL),(62,'ru_RU','Федеральный округ'),(63,'cs_CZ',NULL),(63,'de_DE',NULL),(63,'en_US','Durango'),(63,'es_ES',NULL),(63,'fr_FR','Durango'),(63,'it_IT',NULL),(63,'ru_RU','Дюранго'),(64,'cs_CZ',NULL),(64,'de_DE',NULL),(64,'en_US','Guanajuato'),(64,'es_ES',NULL),(64,'fr_FR','Guanajuato'),(64,'it_IT',NULL),(64,'ru_RU','Гуанахуато'),(65,'cs_CZ',NULL),(65,'de_DE',NULL),(65,'en_US','Guerrero'),(65,'es_ES',NULL),(65,'fr_FR','Guerrero'),(65,'it_IT',NULL),(65,'ru_RU','Герреро'),(66,'cs_CZ',NULL),(66,'de_DE',NULL),(66,'en_US','Hidalgo'),(66,'es_ES',NULL),(66,'fr_FR','Hidalgo'),(66,'it_IT',NULL),(66,'ru_RU','Идальго'),(67,'cs_CZ',NULL),(67,'de_DE',NULL),(67,'en_US','Jalisco'),(67,'es_ES',NULL),(67,'fr_FR','Jalisco'),(67,'it_IT',NULL),(67,'ru_RU','Халиско'),(68,'cs_CZ',NULL),(68,'de_DE',NULL),(68,'en_US','Estado de México'),(68,'es_ES',NULL),(68,'fr_FR','Estado de México'),(68,'it_IT',NULL),(68,'ru_RU','Мехико'),(69,'cs_CZ',NULL),(69,'de_DE',NULL),(69,'en_US','Michoacán'),(69,'es_ES',NULL),(69,'fr_FR','Michoacán'),(69,'it_IT',NULL),(69,'ru_RU','Мичоакан'),(70,'cs_CZ',NULL),(70,'de_DE',NULL),(70,'en_US','Morelos'),(70,'es_ES',NULL),(70,'fr_FR','Morelos'),(70,'it_IT',NULL),(70,'ru_RU','Морелос'),(71,'cs_CZ',NULL),(71,'de_DE',NULL),(71,'en_US','Nayarit'),(71,'es_ES',NULL),(71,'fr_FR','Nayarit'),(71,'it_IT',NULL),(71,'ru_RU','Наярит'),(72,'cs_CZ',NULL),(72,'de_DE',NULL),(72,'en_US','Nuevo León'),(72,'es_ES',NULL),(72,'fr_FR','Nuevo León'),(72,'it_IT',NULL),(72,'ru_RU','Нуэво-Леон'),(73,'cs_CZ',NULL),(73,'de_DE',NULL),(73,'en_US','Oaxaca'),(73,'es_ES',NULL),(73,'fr_FR','Oaxaca'),(73,'it_IT',NULL),(73,'ru_RU','Оахака'),(74,'cs_CZ',NULL),(74,'de_DE',NULL),(74,'en_US','Puebla'),(74,'es_ES',NULL),(74,'fr_FR','Puebla'),(74,'it_IT',NULL),(74,'ru_RU','Пуэбла'),(75,'cs_CZ',NULL),(75,'de_DE',NULL),(75,'en_US','Querétaro'),(75,'es_ES',NULL),(75,'fr_FR','Querétaro'),(75,'it_IT',NULL),(75,'ru_RU','Керетаро'),(76,'cs_CZ',NULL),(76,'de_DE',NULL),(76,'en_US','Quintana Roo'),(76,'es_ES',NULL),(76,'fr_FR','Quintana Roo'),(76,'it_IT',NULL),(76,'ru_RU','Кинтана-РОО'),(77,'cs_CZ',NULL),(77,'de_DE',NULL),(77,'en_US','San Luis Potosí'),(77,'es_ES',NULL),(77,'fr_FR','San Luis Potosí'),(77,'it_IT',NULL),(77,'ru_RU','Сан-Луис-Потоси'),(78,'cs_CZ',NULL),(78,'de_DE',NULL),(78,'en_US','Sinaloa'),(78,'es_ES',NULL),(78,'fr_FR','Sinaloa'),(78,'it_IT',NULL),(78,'ru_RU','Синалоа'),(79,'cs_CZ',NULL),(79,'de_DE',NULL),(79,'en_US','Sonora'),(79,'es_ES',NULL),(79,'fr_FR','Sonora'),(79,'it_IT',NULL),(79,'ru_RU','Сонора'),(80,'cs_CZ',NULL),(80,'de_DE',NULL),(80,'en_US','Tabasco'),(80,'es_ES',NULL),(80,'fr_FR','Tabasco'),(80,'it_IT',NULL),(80,'ru_RU','Табаско'),(81,'cs_CZ',NULL),(81,'de_DE',NULL),(81,'en_US','Tamaulipas'),(81,'es_ES',NULL),(81,'fr_FR','Tamaulipas'),(81,'it_IT',NULL),(81,'ru_RU','Тамаулипас'),(82,'cs_CZ',NULL),(82,'de_DE',NULL),(82,'en_US','Tlaxcala'),(82,'es_ES',NULL),(82,'fr_FR','Tlaxcala'),(82,'it_IT',NULL),(82,'ru_RU','Тлашкала'),(83,'cs_CZ',NULL),(83,'de_DE',NULL),(83,'en_US','Veracruz'),(83,'es_ES',NULL),(83,'fr_FR','Veracruz'),(83,'it_IT',NULL),(83,'ru_RU','Веракрус'),(84,'cs_CZ',NULL),(84,'de_DE',NULL),(84,'en_US','Yucatán'),(84,'es_ES',NULL),(84,'fr_FR','Yucatán'),(84,'it_IT','Yucatán'),(84,'ru_RU','Юкатан'),(85,'cs_CZ',NULL),(85,'de_DE',NULL),(85,'en_US','Zacatecas'),(85,'es_ES',NULL),(85,'fr_FR','Zacatecas'),(85,'it_IT',NULL),(85,'ru_RU','Сакатекас'),(86,'cs_CZ',NULL),(86,'de_DE',NULL),(86,'en_US','Ontario'),(86,'es_ES',NULL),(86,'fr_FR','Ontario'),(86,'it_IT','Ontario'),(86,'ru_RU','Онтарио'),(87,'cs_CZ',NULL),(87,'de_DE',NULL),(87,'en_US','Quebec'),(87,'es_ES',NULL),(87,'fr_FR','Québec'),(87,'it_IT','Quebec'),(87,'ru_RU','Квебек'),(88,'cs_CZ',NULL),(88,'de_DE',NULL),(88,'en_US','British Columbia'),(88,'es_ES',NULL),(88,'fr_FR','Colombie-Britannique'),(88,'it_IT',NULL),(88,'ru_RU','Британская Колумбия'),(89,'cs_CZ',NULL),(89,'de_DE',NULL),(89,'en_US','Alberta'),(89,'es_ES',NULL),(89,'fr_FR','Alberta'),(89,'it_IT','Alberta'),(89,'ru_RU','Альберта'),(90,'cs_CZ',NULL),(90,'de_DE',NULL),(90,'en_US','Manitoba'),(90,'es_ES',NULL),(90,'fr_FR','Manitoba'),(90,'it_IT',NULL),(90,'ru_RU','Манитоба'),(91,'cs_CZ',NULL),(91,'de_DE',NULL),(91,'en_US','Saskatchewan'),(91,'es_ES',NULL),(91,'fr_FR','Saskatchewan'),(91,'it_IT',NULL),(91,'ru_RU','Саскачеван'),(92,'cs_CZ',NULL),(92,'de_DE',NULL),(92,'en_US','Nova Scotia'),(92,'es_ES',NULL),(92,'fr_FR','Nouvelle-Écosse'),(92,'it_IT',NULL),(92,'ru_RU','Новая Шотландия'),(93,'cs_CZ',NULL),(93,'de_DE',NULL),(93,'en_US','New Brunswick'),(93,'es_ES',NULL),(93,'fr_FR','Nouveau-Brunswick'),(93,'it_IT',NULL),(93,'ru_RU','Новый Брансвик'),(94,'cs_CZ',NULL),(94,'de_DE',NULL),(94,'en_US','Newfoundland and Labrador'),(94,'es_ES',NULL),(94,'fr_FR','Terre Neuve et Labrador'),(94,'it_IT',NULL),(94,'ru_RU','Ньюфаундленд и Лабрадор'),(95,'cs_CZ',NULL),(95,'de_DE',NULL),(95,'en_US','Prince Edward Island'),(95,'es_ES',NULL),(95,'fr_FR','Île-du-Prince-Édouard'),(95,'it_IT',NULL),(95,'ru_RU','Остров Принца Эдуарда'),(96,'cs_CZ',NULL),(96,'de_DE',NULL),(96,'en_US','Northwest Territories'),(96,'es_ES',NULL),(96,'fr_FR','Territoires du Nord-Ouest'),(96,'it_IT',NULL),(96,'ru_RU','Северо-западные территории'),(97,'cs_CZ',NULL),(97,'de_DE',NULL),(97,'en_US','Yukon'),(97,'es_ES',NULL),(97,'fr_FR','Yukon'),(97,'it_IT',NULL),(97,'ru_RU','Юкон'),(98,'cs_CZ',NULL),(98,'de_DE',NULL),(98,'en_US','Nunavut'),(98,'es_ES',NULL),(98,'fr_FR','Nunavut'),(98,'it_IT',NULL),(98,'ru_RU','Нунавут'),(99,'cs_CZ',NULL),(99,'de_DE',NULL),(99,'en_US','Buenos Aires'),(99,'es_ES',NULL),(99,'fr_FR','Buenos Aires'),(99,'it_IT','Buenos Aires'),(99,'ru_RU','Буэнос айрес'),(100,'cs_CZ',NULL),(100,'de_DE',NULL),(100,'en_US','Catamarca'),(100,'es_ES',NULL),(100,'fr_FR','Catamarca'),(100,'it_IT',NULL),(100,'ru_RU','Катамарка'),(101,'cs_CZ',NULL),(101,'de_DE',NULL),(101,'en_US','Chaco'),(101,'es_ES',NULL),(101,'fr_FR','Chaco'),(101,'it_IT',NULL),(101,'ru_RU','Чако'),(102,'cs_CZ',NULL),(102,'de_DE',NULL),(102,'en_US','Chubut'),(102,'es_ES',NULL),(102,'fr_FR','Chubut'),(102,'it_IT',NULL),(102,'ru_RU','Чубут'),(103,'cs_CZ',NULL),(103,'de_DE',NULL),(103,'en_US','Ciudad de Buenos Aires'),(103,'es_ES',NULL),(103,'fr_FR','Ciudad de Buenos Aires'),(103,'it_IT',NULL),(103,'ru_RU','Сьюдад-де-Буэнос-Айрес'),(104,'cs_CZ',NULL),(104,'de_DE',NULL),(104,'en_US','Córdoba'),(104,'es_ES',NULL),(104,'fr_FR','Cordoba'),(104,'it_IT',NULL),(104,'ru_RU','Кордова'),(105,'cs_CZ',NULL),(105,'de_DE',NULL),(105,'en_US','Corrientes'),(105,'es_ES',NULL),(105,'fr_FR','Corrientes'),(105,'it_IT',NULL),(105,'ru_RU','Корриентес'),(106,'cs_CZ',NULL),(106,'de_DE',NULL),(106,'en_US','Entre Ríos'),(106,'es_ES',NULL),(106,'fr_FR','Entre Ríos'),(106,'it_IT',NULL),(106,'ru_RU','Энтре-Риос'),(107,'cs_CZ',NULL),(107,'de_DE',NULL),(107,'en_US','Formosa'),(107,'es_ES',NULL),(107,'fr_FR','Formosa'),(107,'it_IT',NULL),(107,'ru_RU','Формоза'),(108,'cs_CZ',NULL),(108,'de_DE',NULL),(108,'en_US','Jujuy'),(108,'es_ES',NULL),(108,'fr_FR','Jujuy'),(108,'it_IT',NULL),(108,'ru_RU','Жужуй'),(109,'cs_CZ',NULL),(109,'de_DE',NULL),(109,'en_US','La Pampa'),(109,'es_ES',NULL),(109,'fr_FR','La Pampa'),(109,'it_IT',NULL),(109,'ru_RU','Ла-Пампа'),(110,'cs_CZ',NULL),(110,'de_DE',NULL),(110,'en_US','La Rioja'),(110,'es_ES',NULL),(110,'fr_FR','La Rioja'),(110,'it_IT',NULL),(110,'ru_RU','Ла-Риоха'),(111,'cs_CZ',NULL),(111,'de_DE',NULL),(111,'en_US','Mendoza'),(111,'es_ES',NULL),(111,'fr_FR','Mendoza'),(111,'it_IT',NULL),(111,'ru_RU','Мендоса'),(112,'cs_CZ',NULL),(112,'de_DE',NULL),(112,'en_US','Misiones'),(112,'es_ES',NULL),(112,'fr_FR','Misiones'),(112,'it_IT',NULL),(112,'ru_RU','Мисьонес'),(113,'cs_CZ',NULL),(113,'de_DE',NULL),(113,'en_US','Neuquén'),(113,'es_ES',NULL),(113,'fr_FR','Neuquén'),(113,'it_IT',NULL),(113,'ru_RU','Неукен'),(114,'cs_CZ',NULL),(114,'de_DE',NULL),(114,'en_US','Río Negro'),(114,'es_ES',NULL),(114,'fr_FR','Rio Negro'),(114,'it_IT',NULL),(114,'ru_RU','Рио-Негро'),(115,'cs_CZ',NULL),(115,'de_DE',NULL),(115,'en_US','Salta'),(115,'es_ES',NULL),(115,'fr_FR','Salta'),(115,'it_IT',NULL),(115,'ru_RU','Сальта'),(116,'cs_CZ',NULL),(116,'de_DE',NULL),(116,'en_US','San Juan'),(116,'es_ES',NULL),(116,'fr_FR','San Juan'),(116,'it_IT',NULL),(116,'ru_RU','Сан-Хуан'),(117,'cs_CZ',NULL),(117,'de_DE',NULL),(117,'en_US','San Luis'),(117,'es_ES',NULL),(117,'fr_FR','San Luis'),(117,'it_IT',NULL),(117,'ru_RU','Сан-Луис'),(118,'cs_CZ',NULL),(118,'de_DE',NULL),(118,'en_US','Santa Cruz'),(118,'es_ES',NULL),(118,'fr_FR','Santa Cruz'),(118,'it_IT','Santa Cruz'),(118,'ru_RU','Санта Круз'),(119,'cs_CZ',NULL),(119,'de_DE',NULL),(119,'en_US','Santa Fe'),(119,'es_ES',NULL),(119,'fr_FR','Santa Fe'),(119,'it_IT',NULL),(119,'ru_RU','Санта-Фе'),(120,'cs_CZ',NULL),(120,'de_DE',NULL),(120,'en_US','Santiago del Estero'),(120,'es_ES',NULL),(120,'fr_FR','Santiago del Estero'),(120,'it_IT',NULL),(120,'ru_RU','Сантьяго'),(121,'cs_CZ',NULL),(121,'de_DE',NULL),(121,'en_US','Tierra del Fuego'),(121,'es_ES',NULL),(121,'fr_FR','Tierra del Fuego'),(121,'it_IT',NULL),(121,'ru_RU','Огненной Земли'),(122,'cs_CZ',NULL),(122,'de_DE',NULL),(122,'en_US','Tucumán'),(122,'es_ES',NULL),(122,'fr_FR','Tucuman'),(122,'it_IT',NULL),(122,'ru_RU','Тукуман'),(123,'cs_CZ',NULL),(123,'de_DE',NULL),(123,'en_US','Agrigento'),(123,'es_ES',NULL),(123,'fr_FR','Agrigento'),(123,'it_IT','Agrigento'),(123,'ru_RU','Агридженто'),(124,'cs_CZ',NULL),(124,'de_DE',NULL),(124,'en_US','Alessandria'),(124,'es_ES',NULL),(124,'fr_FR','Alessandria'),(124,'it_IT','Alessandria'),(124,'ru_RU','Алессандрия'),(125,'cs_CZ',NULL),(125,'de_DE',NULL),(125,'en_US','Ancona'),(125,'es_ES',NULL),(125,'fr_FR','Ancona'),(125,'it_IT','Ancona'),(125,'ru_RU','Анконы'),(126,'cs_CZ',NULL),(126,'de_DE',NULL),(126,'en_US','Aosta'),(126,'es_ES',NULL),(126,'fr_FR','Aosta'),(126,'it_IT','Aosta'),(126,'ru_RU','Аоста'),(127,'cs_CZ',NULL),(127,'de_DE',NULL),(127,'en_US','Arezzo'),(127,'es_ES',NULL),(127,'fr_FR','Arezzo'),(127,'it_IT','Arezzo'),(127,'ru_RU','Ареццо'),(128,'cs_CZ',NULL),(128,'de_DE',NULL),(128,'en_US','Ascoli Piceno'),(128,'es_ES',NULL),(128,'fr_FR','Ascoli Piceno'),(128,'it_IT','Ascoli Piceno'),(128,'ru_RU','Асколи-Пичено'),(129,'cs_CZ',NULL),(129,'de_DE',NULL),(129,'en_US','Asti'),(129,'es_ES',NULL),(129,'fr_FR','Asti'),(129,'it_IT','Asti'),(129,'ru_RU','Асти'),(130,'cs_CZ',NULL),(130,'de_DE',NULL),(130,'en_US','Avellino'),(130,'es_ES',NULL),(130,'fr_FR','Avellino'),(130,'it_IT','Avellino'),(130,'ru_RU','Авеллино'),(131,'cs_CZ',NULL),(131,'de_DE',NULL),(131,'en_US','Bari'),(131,'es_ES',NULL),(131,'fr_FR','Bari'),(131,'it_IT','Bari'),(131,'ru_RU','Бари'),(132,'cs_CZ',NULL),(132,'de_DE',NULL),(132,'en_US','Barletta-Andria-Trani'),(132,'es_ES',NULL),(132,'fr_FR','Barletta-Andria-Trani'),(132,'it_IT',NULL),(132,'ru_RU','Барлетта-Андрия-Трани'),(133,'cs_CZ',NULL),(133,'de_DE',NULL),(133,'en_US','Belluno'),(133,'es_ES',NULL),(133,'fr_FR','Belluno'),(133,'it_IT','Belluno'),(133,'ru_RU','Беллуно'),(134,'cs_CZ',NULL),(134,'de_DE',NULL),(134,'en_US','Benevento'),(134,'es_ES',NULL),(134,'fr_FR','Benevento'),(134,'it_IT','Benevento'),(134,'ru_RU','Беневенто'),(135,'cs_CZ',NULL),(135,'de_DE',NULL),(135,'en_US','Bergamo'),(135,'es_ES',NULL),(135,'fr_FR','Bergamo'),(135,'it_IT','Bergamo'),(135,'ru_RU','Бергамо'),(136,'cs_CZ',NULL),(136,'de_DE',NULL),(136,'en_US','Biella'),(136,'es_ES',NULL),(136,'fr_FR','Biella'),(136,'it_IT','Biella'),(136,'ru_RU','Биэлла'),(137,'cs_CZ',NULL),(137,'de_DE',NULL),(137,'en_US','Bologna'),(137,'es_ES',NULL),(137,'fr_FR','Bologne'),(137,'it_IT','Bologna'),(137,'ru_RU','Болонья'),(138,'cs_CZ',NULL),(138,'de_DE',NULL),(138,'en_US','Bolzano'),(138,'es_ES',NULL),(138,'fr_FR','Bolzano'),(138,'it_IT',NULL),(138,'ru_RU','Больцано'),(139,'cs_CZ',NULL),(139,'de_DE',NULL),(139,'en_US','Brescia'),(139,'es_ES',NULL),(139,'fr_FR','Brescia'),(139,'it_IT','Brescia'),(139,'ru_RU','Брешиа'),(140,'cs_CZ',NULL),(140,'de_DE',NULL),(140,'en_US','Brindisi'),(140,'es_ES',NULL),(140,'fr_FR','Brindisi'),(140,'it_IT','Brindisi'),(140,'ru_RU','Бриндиси'),(141,'cs_CZ',NULL),(141,'de_DE',NULL),(141,'en_US','Cagliari'),(141,'es_ES',NULL),(141,'fr_FR','Cagliari'),(141,'it_IT','Cagliari'),(141,'ru_RU','Кальяри'),(142,'cs_CZ',NULL),(142,'de_DE',NULL),(142,'en_US','Caltanissetta'),(142,'es_ES',NULL),(142,'fr_FR','Caltanissetta'),(142,'it_IT','Caltanissetta'),(142,'ru_RU','Кальтаниссетта'),(143,'cs_CZ',NULL),(143,'de_DE',NULL),(143,'en_US','Campobasso'),(143,'es_ES',NULL),(143,'fr_FR','Campobasso'),(143,'it_IT','Campobasso'),(143,'ru_RU','Кампобассо'),(144,'cs_CZ',NULL),(144,'de_DE',NULL),(144,'en_US','Carbonia-Iglesias'),(144,'es_ES',NULL),(144,'fr_FR','Carbonia-Iglesias'),(144,'it_IT',NULL),(144,'ru_RU','Карбония-Иглесиас'),(145,'cs_CZ',NULL),(145,'de_DE',NULL),(145,'en_US','Caserta'),(145,'es_ES',NULL),(145,'fr_FR','Caserta'),(145,'it_IT','Caserta'),(145,'ru_RU','Казерта'),(146,'cs_CZ',NULL),(146,'de_DE',NULL),(146,'en_US','Catania'),(146,'es_ES',NULL),(146,'fr_FR','Catane'),(146,'it_IT','Catania'),(146,'ru_RU','Катания'),(147,'cs_CZ',NULL),(147,'de_DE',NULL),(147,'en_US','Catanzaro'),(147,'es_ES',NULL),(147,'fr_FR','Catanzaro'),(147,'it_IT','Catanzaro'),(147,'ru_RU','Катандзаро'),(148,'cs_CZ',NULL),(148,'de_DE',NULL),(148,'en_US','Chieti'),(148,'es_ES',NULL),(148,'fr_FR','Chieti'),(148,'it_IT','Chieti'),(148,'ru_RU','Кьети'),(149,'cs_CZ',NULL),(149,'de_DE',NULL),(149,'en_US','Como'),(149,'es_ES',NULL),(149,'fr_FR','Como'),(149,'it_IT','Como'),(149,'ru_RU','Комо'),(150,'cs_CZ',NULL),(150,'de_DE',NULL),(150,'en_US','Cosenza'),(150,'es_ES',NULL),(150,'fr_FR','Cosenza'),(150,'it_IT','Cosenza'),(150,'ru_RU','Козенца'),(151,'cs_CZ',NULL),(151,'de_DE',NULL),(151,'en_US','Cremona'),(151,'es_ES',NULL),(151,'fr_FR','Cremona'),(151,'it_IT','Cremona'),(151,'ru_RU','Кремона'),(152,'cs_CZ',NULL),(152,'de_DE',NULL),(152,'en_US','Crotone'),(152,'es_ES',NULL),(152,'fr_FR','Crotone'),(152,'it_IT','Crotone'),(152,'ru_RU','Кротоне'),(153,'cs_CZ',NULL),(153,'de_DE',NULL),(153,'en_US','Cuneo'),(153,'es_ES',NULL),(153,'fr_FR','Cuneo'),(153,'it_IT','Cuneo'),(153,'ru_RU','Кунео'),(154,'cs_CZ',NULL),(154,'de_DE',NULL),(154,'en_US','Enna'),(154,'es_ES',NULL),(154,'fr_FR','Enna'),(154,'it_IT',NULL),(154,'ru_RU','Энна'),(155,'cs_CZ',NULL),(155,'de_DE',NULL),(155,'en_US','Fermo'),(155,'es_ES',NULL),(155,'fr_FR','Fermo'),(155,'it_IT',NULL),(155,'ru_RU','Фермо'),(156,'cs_CZ',NULL),(156,'de_DE',NULL),(156,'en_US','Ferrara'),(156,'es_ES',NULL),(156,'fr_FR','Ferrara'),(156,'it_IT','Ferrara'),(156,'ru_RU','Феррара'),(157,'cs_CZ',NULL),(157,'de_DE',NULL),(157,'en_US','Firenze'),(157,'es_ES',NULL),(157,'fr_FR','Firenze'),(157,'it_IT','Firenze'),(157,'ru_RU','Флоренция'),(158,'cs_CZ',NULL),(158,'de_DE',NULL),(158,'en_US','Foggia'),(158,'es_ES',NULL),(158,'fr_FR','Foggia'),(158,'it_IT','Foggia'),(158,'ru_RU','Фоджа'),(159,'cs_CZ',NULL),(159,'de_DE',NULL),(159,'en_US','Forlì-Cesena'),(159,'es_ES',NULL),(159,'fr_FR','Forlì-Cesena'),(159,'it_IT','Forlì-Cesena'),(159,'ru_RU','Форли-Чезена'),(160,'cs_CZ',NULL),(160,'de_DE',NULL),(160,'en_US','Frosinone'),(160,'es_ES',NULL),(160,'fr_FR','Frosinone'),(160,'it_IT',NULL),(160,'ru_RU','Фрозиноне'),(161,'cs_CZ',NULL),(161,'de_DE',NULL),(161,'en_US','Genova'),(161,'es_ES',NULL),(161,'fr_FR','Genova'),(161,'it_IT','Genova'),(161,'ru_RU','Генуя'),(162,'cs_CZ',NULL),(162,'de_DE',NULL),(162,'en_US','Gorizia'),(162,'es_ES',NULL),(162,'fr_FR','Gorizia'),(162,'it_IT','Gorizia'),(162,'ru_RU','Гориция'),(163,'cs_CZ',NULL),(163,'de_DE',NULL),(163,'en_US','Grosseto'),(163,'es_ES',NULL),(163,'fr_FR','Grosseto'),(163,'it_IT',NULL),(163,'ru_RU','Гроссето'),(164,'cs_CZ',NULL),(164,'de_DE',NULL),(164,'en_US','Imperia'),(164,'es_ES',NULL),(164,'fr_FR','Imperia'),(164,'it_IT','Imperia'),(164,'ru_RU','Империя'),(165,'cs_CZ',NULL),(165,'de_DE',NULL),(165,'en_US','Isernia'),(165,'es_ES',NULL),(165,'fr_FR','Isernia'),(165,'it_IT',NULL),(165,'ru_RU','Изерния'),(166,'cs_CZ',NULL),(166,'de_DE',NULL),(166,'en_US','L\'Aquila'),(166,'es_ES',NULL),(166,'fr_FR','L\'Aquila'),(166,'it_IT','L\'Aquila'),(166,'ru_RU','Аквила'),(167,'cs_CZ',NULL),(167,'de_DE',NULL),(167,'en_US','La Spezia'),(167,'es_ES',NULL),(167,'fr_FR','La Spezia'),(167,'it_IT','La Spezia'),(167,'ru_RU','Ла Специя'),(168,'cs_CZ',NULL),(168,'de_DE',NULL),(168,'en_US','Latina'),(168,'es_ES',NULL),(168,'fr_FR','Latina'),(168,'it_IT','Latina'),(168,'ru_RU','Латина'),(169,'cs_CZ',NULL),(169,'de_DE',NULL),(169,'en_US','Lecce'),(169,'es_ES',NULL),(169,'fr_FR','Lecce'),(169,'it_IT','Lecce'),(169,'ru_RU','Лечче'),(170,'cs_CZ',NULL),(170,'de_DE',NULL),(170,'en_US','Lecco'),(170,'es_ES',NULL),(170,'fr_FR','Lecco'),(170,'it_IT','Lecco'),(170,'ru_RU','Лекко'),(171,'cs_CZ',NULL),(171,'de_DE',NULL),(171,'en_US','Livorno'),(171,'es_ES',NULL),(171,'fr_FR','Livourne'),(171,'it_IT','Livorno'),(171,'ru_RU','Ливорно'),(172,'cs_CZ',NULL),(172,'de_DE',NULL),(172,'en_US','Lodi'),(172,'es_ES',NULL),(172,'fr_FR','Lodi'),(172,'it_IT','Lodi'),(172,'ru_RU','Лоди'),(173,'cs_CZ',NULL),(173,'de_DE',NULL),(173,'en_US','Lucca'),(173,'es_ES',NULL),(173,'fr_FR','Lucca'),(173,'it_IT','Lucca'),(173,'ru_RU','Лукка'),(174,'cs_CZ',NULL),(174,'de_DE',NULL),(174,'en_US','Macerata'),(174,'es_ES',NULL),(174,'fr_FR','Macerata'),(174,'it_IT','Macerata'),(174,'ru_RU','Мачерата'),(175,'cs_CZ',NULL),(175,'de_DE',NULL),(175,'en_US','Mantova'),(175,'es_ES',NULL),(175,'fr_FR','Mantova'),(175,'it_IT','Mantova'),(175,'ru_RU','Мантуя'),(176,'cs_CZ',NULL),(176,'de_DE',NULL),(176,'en_US','Massa'),(176,'es_ES',NULL),(176,'fr_FR','Massa'),(176,'it_IT','Massa'),(176,'ru_RU','Масса'),(177,'cs_CZ',NULL),(177,'de_DE',NULL),(177,'en_US','Matera'),(177,'es_ES',NULL),(177,'fr_FR','Matera'),(177,'it_IT','Matera'),(177,'ru_RU','Матера'),(178,'cs_CZ',NULL),(178,'de_DE',NULL),(178,'en_US','Medio Campidano'),(178,'es_ES',NULL),(178,'fr_FR','Medio Campidano'),(178,'it_IT','Medio Campidano'),(178,'ru_RU','Медио Кампидано'),(179,'cs_CZ',NULL),(179,'de_DE',NULL),(179,'en_US','Messina'),(179,'es_ES',NULL),(179,'fr_FR','Messina'),(179,'it_IT','Messina'),(179,'ru_RU','Мессина'),(180,'cs_CZ',NULL),(180,'de_DE',NULL),(180,'en_US','Milano'),(180,'es_ES',NULL),(180,'fr_FR','Milano'),(180,'it_IT','Milano'),(180,'ru_RU','Милан'),(181,'cs_CZ',NULL),(181,'de_DE',NULL),(181,'en_US','Modena'),(181,'es_ES',NULL),(181,'fr_FR','Modena'),(181,'it_IT','Modena'),(181,'ru_RU','Модена'),(182,'cs_CZ',NULL),(182,'de_DE',NULL),(182,'en_US','Monza e della Brianza'),(182,'es_ES',NULL),(182,'fr_FR','Monza e della Brianza'),(182,'it_IT',NULL),(182,'ru_RU','Монца э делла Брианца'),(183,'cs_CZ',NULL),(183,'de_DE',NULL),(183,'en_US','Napoli'),(183,'es_ES',NULL),(183,'fr_FR','Napoli'),(183,'it_IT','Napoli'),(183,'ru_RU','Наполи'),(184,'cs_CZ',NULL),(184,'de_DE',NULL),(184,'en_US','Novara'),(184,'es_ES',NULL),(184,'fr_FR','Novara'),(184,'it_IT','Novara'),(184,'ru_RU','Новара'),(185,'cs_CZ',NULL),(185,'de_DE',NULL),(185,'en_US','Nuoro'),(185,'es_ES',NULL),(185,'fr_FR','Nuoro'),(185,'it_IT',NULL),(185,'ru_RU','Нуоро'),(186,'cs_CZ',NULL),(186,'de_DE',NULL),(186,'en_US','Ogliastra'),(186,'es_ES',NULL),(186,'fr_FR','Ogliastra'),(186,'it_IT',NULL),(186,'ru_RU','Ольястра'),(187,'cs_CZ',NULL),(187,'de_DE',NULL),(187,'en_US','Olbia-Tempio'),(187,'es_ES',NULL),(187,'fr_FR','Olbia-Tempio'),(187,'it_IT','Olbia-Tempio'),(187,'ru_RU','Ольвия-Темпио'),(188,'cs_CZ',NULL),(188,'de_DE',NULL),(188,'en_US','Oristano'),(188,'es_ES',NULL),(188,'fr_FR','Oristano'),(188,'it_IT','Oristano'),(188,'ru_RU','Ористано'),(189,'cs_CZ',NULL),(189,'de_DE',NULL),(189,'en_US','Padova'),(189,'es_ES',NULL),(189,'fr_FR','Padova'),(189,'it_IT','Padova'),(189,'ru_RU','Падуя'),(190,'cs_CZ',NULL),(190,'de_DE',NULL),(190,'en_US','Palermo'),(190,'es_ES',NULL),(190,'fr_FR','Palerme'),(190,'it_IT','Palermo'),(190,'ru_RU','Палермо'),(191,'cs_CZ',NULL),(191,'de_DE',NULL),(191,'en_US','Parma'),(191,'es_ES',NULL),(191,'fr_FR','Parma'),(191,'it_IT','Parma'),(191,'ru_RU','Парма'),(192,'cs_CZ',NULL),(192,'de_DE',NULL),(192,'en_US','Pavia'),(192,'es_ES',NULL),(192,'fr_FR','Pavie'),(192,'it_IT','Pavia'),(192,'ru_RU','Павия'),(193,'cs_CZ',NULL),(193,'de_DE',NULL),(193,'en_US','Perugia'),(193,'es_ES',NULL),(193,'fr_FR','Pérouse'),(193,'it_IT','Perugia'),(193,'ru_RU','Перуджа'),(194,'cs_CZ',NULL),(194,'de_DE',NULL),(194,'en_US','Pesaro-Urbino'),(194,'es_ES',NULL),(194,'fr_FR','Pesaro-Urbino'),(194,'it_IT','Pesaro-Urbino'),(194,'ru_RU','Пезаро-Урбино'),(195,'cs_CZ',NULL),(195,'de_DE',NULL),(195,'en_US','Pescara'),(195,'es_ES',NULL),(195,'fr_FR','Pescara'),(195,'it_IT','Pescara'),(195,'ru_RU','Пескара'),(196,'cs_CZ',NULL),(196,'de_DE',NULL),(196,'en_US','Piacenza'),(196,'es_ES',NULL),(196,'fr_FR','Piacenza'),(196,'it_IT','Piacenza'),(196,'ru_RU','Пьяченца'),(197,'cs_CZ',NULL),(197,'de_DE',NULL),(197,'en_US','Pisa'),(197,'es_ES',NULL),(197,'fr_FR','Pise'),(197,'it_IT','Pisa'),(197,'ru_RU','Пиза'),(198,'cs_CZ',NULL),(198,'de_DE',NULL),(198,'en_US','Pistoia'),(198,'es_ES',NULL),(198,'fr_FR','Pistoia'),(198,'it_IT','Pistoia'),(198,'ru_RU','Пистойя'),(199,'cs_CZ',NULL),(199,'de_DE',NULL),(199,'en_US','Pordenone'),(199,'es_ES',NULL),(199,'fr_FR','Pordenone'),(199,'it_IT','Pordenone'),(199,'ru_RU','Порденоне'),(200,'cs_CZ',NULL),(200,'de_DE',NULL),(200,'en_US','Potenza'),(200,'es_ES',NULL),(200,'fr_FR','Potenza'),(200,'it_IT','Potenza'),(200,'ru_RU','Потенца'),(201,'cs_CZ',NULL),(201,'de_DE',NULL),(201,'en_US','Prato'),(201,'es_ES',NULL),(201,'fr_FR','Prato'),(201,'it_IT','Prato'),(201,'ru_RU','Прато'),(202,'cs_CZ',NULL),(202,'de_DE',NULL),(202,'en_US','Ragusa'),(202,'es_ES',NULL),(202,'fr_FR','Ragusa'),(202,'it_IT','Ragusa'),(202,'ru_RU','Рагуза'),(203,'cs_CZ',NULL),(203,'de_DE',NULL),(203,'en_US','Ravenna'),(203,'es_ES',NULL),(203,'fr_FR','Ravenne'),(203,'it_IT','Ravenna'),(203,'ru_RU','Равенна'),(204,'cs_CZ',NULL),(204,'de_DE',NULL),(204,'en_US','Reggio Calabria'),(204,'es_ES',NULL),(204,'fr_FR','Reggio de Calabre'),(204,'it_IT','Reggio Calabria'),(204,'ru_RU','Реджо-ди-Калабрии'),(205,'cs_CZ',NULL),(205,'de_DE',NULL),(205,'en_US','Reggio Emilia'),(205,'es_ES',NULL),(205,'fr_FR','Reggio d\'Émilie'),(205,'it_IT','Reggio Emilia'),(205,'ru_RU','Реджио Эмилия'),(206,'cs_CZ',NULL),(206,'de_DE',NULL),(206,'en_US','Rieti'),(206,'es_ES',NULL),(206,'fr_FR','Rieti'),(206,'it_IT','Rieti'),(206,'ru_RU','Риети'),(207,'cs_CZ',NULL),(207,'de_DE',NULL),(207,'en_US','Rimini'),(207,'es_ES',NULL),(207,'fr_FR','Rimini'),(207,'it_IT','Rimini'),(207,'ru_RU','Римини'),(208,'cs_CZ',NULL),(208,'de_DE',NULL),(208,'en_US','Roma'),(208,'es_ES',NULL),(208,'fr_FR','Rome'),(208,'it_IT',NULL),(208,'ru_RU','Рома'),(209,'cs_CZ',NULL),(209,'de_DE',NULL),(209,'en_US','Rovigo'),(209,'es_ES',NULL),(209,'fr_FR','Rovigo'),(209,'it_IT',NULL),(209,'ru_RU','Ровиго'),(210,'cs_CZ',NULL),(210,'de_DE',NULL),(210,'en_US','Salerno'),(210,'es_ES',NULL),(210,'fr_FR','Salerno'),(210,'it_IT','Salerno'),(210,'ru_RU','Салерно'),(211,'cs_CZ',NULL),(211,'de_DE',NULL),(211,'en_US','Sassari'),(211,'es_ES',NULL),(211,'fr_FR','Sassari'),(211,'it_IT','Sassari'),(211,'ru_RU','Сассари'),(212,'cs_CZ',NULL),(212,'de_DE',NULL),(212,'en_US','Savona'),(212,'es_ES',NULL),(212,'fr_FR','Savona'),(212,'it_IT','Savona'),(212,'ru_RU','Савона'),(213,'cs_CZ',NULL),(213,'de_DE',NULL),(213,'en_US','Siena'),(213,'es_ES',NULL),(213,'fr_FR','Siena'),(213,'it_IT','Siena'),(213,'ru_RU','Сиена'),(214,'cs_CZ',NULL),(214,'de_DE',NULL),(214,'en_US','Siracusa'),(214,'es_ES',NULL),(214,'fr_FR','Siracusa'),(214,'it_IT','Siracusa'),(214,'ru_RU','Сиракузы'),(215,'cs_CZ',NULL),(215,'de_DE',NULL),(215,'en_US','Sondrio'),(215,'es_ES',NULL),(215,'fr_FR','Sondrio'),(215,'it_IT','Sondrio'),(215,'ru_RU','Сондрио'),(216,'cs_CZ',NULL),(216,'de_DE',NULL),(216,'en_US','Taranto'),(216,'es_ES',NULL),(216,'fr_FR','Taranto'),(216,'it_IT','Taranto'),(216,'ru_RU','Таранто'),(217,'cs_CZ',NULL),(217,'de_DE',NULL),(217,'en_US','Teramo'),(217,'es_ES',NULL),(217,'fr_FR','Teramo'),(217,'it_IT','Teramo'),(217,'ru_RU','Терамо'),(218,'cs_CZ',NULL),(218,'de_DE',NULL),(218,'en_US','Terni'),(218,'es_ES',NULL),(218,'fr_FR','Terni'),(218,'it_IT','Terni'),(218,'ru_RU','Терни'),(219,'cs_CZ',NULL),(219,'de_DE',NULL),(219,'en_US','Torino'),(219,'es_ES',NULL),(219,'fr_FR','Torino'),(219,'it_IT','Torino'),(219,'ru_RU','Торино'),(220,'cs_CZ',NULL),(220,'de_DE',NULL),(220,'en_US','Trapani'),(220,'es_ES',NULL),(220,'fr_FR','Trapani'),(220,'it_IT','Trapani'),(220,'ru_RU','Трапани'),(221,'cs_CZ',NULL),(221,'de_DE',NULL),(221,'en_US','Trento'),(221,'es_ES',NULL),(221,'fr_FR','Trento'),(221,'it_IT','Trento'),(221,'ru_RU','Тренто'),(222,'cs_CZ',NULL),(222,'de_DE',NULL),(222,'en_US','Treviso'),(222,'es_ES',NULL),(222,'fr_FR','Treviso'),(222,'it_IT','Treviso'),(222,'ru_RU','Тревизо'),(223,'cs_CZ',NULL),(223,'de_DE',NULL),(223,'en_US','Trieste'),(223,'es_ES',NULL),(223,'fr_FR','Trieste'),(223,'it_IT','Trieste'),(223,'ru_RU','Триест'),(224,'cs_CZ',NULL),(224,'de_DE',NULL),(224,'en_US','Udine'),(224,'es_ES',NULL),(224,'fr_FR','Udine'),(224,'it_IT','Udine'),(224,'ru_RU','Удине'),(225,'cs_CZ',NULL),(225,'de_DE',NULL),(225,'en_US','Varese'),(225,'es_ES',NULL),(225,'fr_FR','Varese'),(225,'it_IT','Varese'),(225,'ru_RU','Варезе'),(226,'cs_CZ',NULL),(226,'de_DE',NULL),(226,'en_US','Venezia'),(226,'es_ES',NULL),(226,'fr_FR','Venezia'),(226,'it_IT','Venezia'),(226,'ru_RU','Венеция'),(227,'cs_CZ',NULL),(227,'de_DE',NULL),(227,'en_US','Verbano-Cusio-Ossola'),(227,'es_ES',NULL),(227,'fr_FR','Verbano-Cusio-Ossola'),(227,'it_IT',NULL),(227,'ru_RU','Вербано-Кузьо-Оссола'),(228,'cs_CZ',NULL),(228,'de_DE',NULL),(228,'en_US','Vercelli'),(228,'es_ES',NULL),(228,'fr_FR','Vercelli'),(228,'it_IT','Vercelli'),(228,'ru_RU','Верчелли'),(229,'cs_CZ',NULL),(229,'de_DE',NULL),(229,'en_US','Verona'),(229,'es_ES',NULL),(229,'fr_FR','Vérone'),(229,'it_IT','Verona'),(229,'ru_RU','Верона'),(230,'cs_CZ',NULL),(230,'de_DE',NULL),(230,'en_US','Vibo Valentia'),(230,'es_ES',NULL),(230,'fr_FR','Vibo Valentia'),(230,'it_IT','Vibo Valentia'),(230,'ru_RU','Вибо Валентия'),(231,'cs_CZ',NULL),(231,'de_DE',NULL),(231,'en_US','Vicenza'),(231,'es_ES',NULL),(231,'fr_FR','Vicenza'),(231,'it_IT','Vicenza'),(231,'ru_RU','Виченца'),(232,'cs_CZ',NULL),(232,'de_DE',NULL),(232,'en_US','Viterbo'),(232,'es_ES',NULL),(232,'fr_FR','Viterbo'),(232,'it_IT','Viterbo'),(232,'ru_RU','Витербо'),(233,'cs_CZ',NULL),(233,'de_DE',NULL),(233,'en_US','Aceh'),(233,'es_ES',NULL),(233,'fr_FR','Aceh'),(233,'it_IT',NULL),(233,'ru_RU','Ачех'),(234,'cs_CZ',NULL),(234,'de_DE',NULL),(234,'en_US','Bali'),(234,'es_ES',NULL),(234,'fr_FR','Bali'),(234,'it_IT','Bali'),(234,'ru_RU','Бали'),(235,'cs_CZ',NULL),(235,'de_DE',NULL),(235,'en_US','Bangka'),(235,'es_ES',NULL),(235,'fr_FR','Bangka'),(235,'it_IT',NULL),(235,'ru_RU','Bangka'),(236,'cs_CZ',NULL),(236,'de_DE',NULL),(236,'en_US','Banten'),(236,'es_ES',NULL),(236,'fr_FR','Banten'),(236,'it_IT',NULL),(236,'ru_RU','Бантен'),(237,'cs_CZ',NULL),(237,'de_DE',NULL),(237,'en_US','Bengkulu'),(237,'es_ES',NULL),(237,'fr_FR','Bengkulu'),(237,'it_IT',NULL),(237,'ru_RU','Бенгкулу'),(238,'cs_CZ',NULL),(238,'de_DE',NULL),(238,'en_US','Central Java'),(238,'es_ES',NULL),(238,'fr_FR','Central Java'),(238,'it_IT',NULL),(238,'ru_RU','Центральная Ява'),(239,'cs_CZ',NULL),(239,'de_DE',NULL),(239,'en_US','Central Kalimantan'),(239,'es_ES',NULL),(239,'fr_FR','Kalimantan occidental'),(239,'it_IT',NULL),(239,'ru_RU','Центральный Калимантан'),(240,'cs_CZ',NULL),(240,'de_DE',NULL),(240,'en_US','Central Sulawesi'),(240,'es_ES',NULL),(240,'fr_FR','Sulawesi central'),(240,'it_IT',NULL),(240,'ru_RU','Центральный Сулавеси'),(241,'cs_CZ',NULL),(241,'de_DE',NULL),(241,'en_US','Coat of arms of East Java'),(241,'es_ES',NULL),(241,'fr_FR','Coat of arms of East Java'),(241,'it_IT',NULL),(241,'ru_RU','Герб Восточная Ява'),(242,'cs_CZ',NULL),(242,'de_DE',NULL),(242,'en_US','East kalimantan'),(242,'es_ES',NULL),(242,'fr_FR','Kalimantan oriental'),(242,'it_IT',NULL),(242,'ru_RU','Восточный Калимантан'),(243,'cs_CZ',NULL),(243,'de_DE',NULL),(243,'en_US','East Nusa Tenggara'),(243,'es_ES',NULL),(243,'fr_FR','Nusa Tenggara oriental'),(243,'it_IT',NULL),(243,'ru_RU','Восточной долготы Малые Зондские'),(244,'cs_CZ',NULL),(244,'de_DE',NULL),(244,'en_US','Lambang propinsi'),(244,'es_ES',NULL),(244,'fr_FR','Lambang propinsi'),(244,'it_IT',NULL),(244,'ru_RU','Lambang Пропинси'),(245,'cs_CZ',NULL),(245,'de_DE',NULL),(245,'en_US','Jakarta'),(245,'es_ES',NULL),(245,'fr_FR','Jakarta'),(245,'it_IT','Jakarta'),(245,'ru_RU','Джакарта'),(246,'cs_CZ',NULL),(246,'de_DE',NULL),(246,'en_US','Jambi'),(246,'es_ES',NULL),(246,'fr_FR','Jambi'),(246,'it_IT',NULL),(246,'ru_RU','Джамби'),(247,'cs_CZ',NULL),(247,'de_DE',NULL),(247,'en_US','Lampung'),(247,'es_ES',NULL),(247,'fr_FR','Lampung'),(247,'it_IT',NULL),(247,'ru_RU','Лампунг'),(248,'cs_CZ',NULL),(248,'de_DE',NULL),(248,'en_US','Maluku'),(248,'es_ES',NULL),(248,'fr_FR','Maluku'),(248,'it_IT',NULL),(248,'ru_RU','Малуку'),(249,'cs_CZ',NULL),(249,'de_DE',NULL),(249,'en_US','North Maluku'),(249,'es_ES',NULL),(249,'fr_FR','Maluku du Nord'),(249,'it_IT',NULL),(249,'ru_RU','Северное Малуку'),(250,'cs_CZ',NULL),(250,'de_DE',NULL),(250,'en_US','North Sulawesi'),(250,'es_ES',NULL),(250,'fr_FR','Sulawesi du Nord'),(250,'it_IT',NULL),(250,'ru_RU','Северный Сулавеси'),(251,'cs_CZ',NULL),(251,'de_DE',NULL),(251,'en_US','North Sumatra'),(251,'es_ES',NULL),(251,'fr_FR','Sumatra-Nord'),(251,'it_IT',NULL),(251,'ru_RU','Северная Суматра'),(252,'cs_CZ',NULL),(252,'de_DE',NULL),(252,'en_US','Papua'),(252,'es_ES',NULL),(252,'fr_FR','Papouasie'),(252,'it_IT',NULL),(252,'ru_RU','Папуа'),(253,'cs_CZ',NULL),(253,'de_DE',NULL),(253,'en_US','Riau'),(253,'es_ES',NULL),(253,'fr_FR','Riau'),(253,'it_IT',NULL),(253,'ru_RU','Риау'),(254,'cs_CZ',NULL),(254,'de_DE',NULL),(254,'en_US','Lambang Riau'),(254,'es_ES',NULL),(254,'fr_FR','Lambang Riau'),(254,'it_IT',NULL),(254,'ru_RU','Lambang Риау'),(255,'cs_CZ',NULL),(255,'de_DE',NULL),(255,'en_US','Southeast Sulawesi'),(255,'es_ES',NULL),(255,'fr_FR','Sulawesi du sud-est'),(255,'it_IT',NULL),(255,'ru_RU','Юго-Восточный Сулавеси'),(256,'cs_CZ',NULL),(256,'de_DE',NULL),(256,'en_US','South Kalimantan'),(256,'es_ES',NULL),(256,'fr_FR','Kalimantan du Sud'),(256,'it_IT',NULL),(256,'ru_RU','Южный Калимантан'),(257,'cs_CZ',NULL),(257,'de_DE',NULL),(257,'en_US','South Sulawesi'),(257,'es_ES',NULL),(257,'fr_FR','Sulawesi du Sud'),(257,'it_IT',NULL),(257,'ru_RU','Южный Сулавеси'),(258,'cs_CZ',NULL),(258,'de_DE',NULL),(258,'en_US','South Sumatra'),(258,'es_ES',NULL),(258,'fr_FR','Sumatra du Sud'),(258,'it_IT',NULL),(258,'ru_RU','Южная Суматра'),(259,'cs_CZ',NULL),(259,'de_DE',NULL),(259,'en_US','West Java'),(259,'es_ES',NULL),(259,'fr_FR','Java-Ouest'),(259,'it_IT',NULL),(259,'ru_RU','Западная Ява'),(260,'cs_CZ',NULL),(260,'de_DE',NULL),(260,'en_US','West Kalimantan'),(260,'es_ES',NULL),(260,'fr_FR','Kalimantan occidental'),(260,'it_IT',NULL),(260,'ru_RU','Западный Калимантан'),(261,'cs_CZ',NULL),(261,'de_DE',NULL),(261,'en_US','West Nusa Tenggara'),(261,'es_ES',NULL),(261,'fr_FR','Nusa Tenggara occidental'),(261,'it_IT',NULL),(261,'ru_RU','Западные Малые Зондские острова'),(262,'cs_CZ',NULL),(262,'de_DE',NULL),(262,'en_US','Lambang Provinsi Papua Barat'),(262,'es_ES',NULL),(262,'fr_FR','Lambang Provinsi Papua Barat'),(262,'it_IT',NULL),(262,'ru_RU','Lambang Provinsi Папуа Барат'),(263,'cs_CZ',NULL),(263,'de_DE',NULL),(263,'en_US','West Sulawesi'),(263,'es_ES',NULL),(263,'fr_FR','Sulawesi occidental'),(263,'it_IT',NULL),(263,'ru_RU','Западный Сулавеси'),(264,'cs_CZ',NULL),(264,'de_DE',NULL),(264,'en_US','West Sumatra'),(264,'es_ES',NULL),(264,'fr_FR','Sumatra occidental'),(264,'it_IT',NULL),(264,'ru_RU','Западная Суматра'),(265,'cs_CZ',NULL),(265,'de_DE',NULL),(265,'en_US','Yogyakarta'),(265,'es_ES',NULL),(265,'fr_FR','Yogyakarta'),(265,'it_IT',NULL),(265,'ru_RU','Джокьякарта'),(266,'cs_CZ',NULL),(266,'de_DE',NULL),(266,'en_US','Aichi'),(266,'es_ES',NULL),(266,'fr_FR','Aichi'),(266,'it_IT',NULL),(266,'ru_RU','Айти'),(267,'cs_CZ',NULL),(267,'de_DE',NULL),(267,'en_US','Akita'),(267,'es_ES',NULL),(267,'fr_FR','Akita'),(267,'it_IT','Akita'),(267,'ru_RU','Акита'),(268,'cs_CZ',NULL),(268,'de_DE',NULL),(268,'en_US','Aomori'),(268,'es_ES',NULL),(268,'fr_FR','Aomori'),(268,'it_IT',NULL),(268,'ru_RU','Аомори'),(269,'cs_CZ',NULL),(269,'de_DE',NULL),(269,'en_US','Chiba'),(269,'es_ES',NULL),(269,'fr_FR','Chiba'),(269,'it_IT',NULL),(269,'ru_RU','Тиба'),(270,'cs_CZ',NULL),(270,'de_DE',NULL),(270,'en_US','Ehime'),(270,'es_ES',NULL),(270,'fr_FR','Ehime'),(270,'it_IT',NULL),(270,'ru_RU','Эхимэ'),(271,'cs_CZ',NULL),(271,'de_DE',NULL),(271,'en_US','Fukui'),(271,'es_ES',NULL),(271,'fr_FR','Fukui'),(271,'it_IT',NULL),(271,'ru_RU','Фукуи'),(272,'cs_CZ',NULL),(272,'de_DE',NULL),(272,'en_US','Fukuoka'),(272,'es_ES',NULL),(272,'fr_FR','Fukuoka'),(272,'it_IT',NULL),(272,'ru_RU','Фукуока'),(273,'cs_CZ',NULL),(273,'de_DE',NULL),(273,'en_US','Fukushima'),(273,'es_ES',NULL),(273,'fr_FR','Fukushima'),(273,'it_IT',NULL),(273,'ru_RU','Фукусима'),(274,'cs_CZ',NULL),(274,'de_DE',NULL),(274,'en_US','Gifu'),(274,'es_ES',NULL),(274,'fr_FR','Gifu'),(274,'it_IT',NULL),(274,'ru_RU','Гифу'),(275,'cs_CZ',NULL),(275,'de_DE',NULL),(275,'en_US','Gunma'),(275,'es_ES',NULL),(275,'fr_FR','Gunma'),(275,'it_IT',NULL),(275,'ru_RU','Гумма'),(276,'cs_CZ',NULL),(276,'de_DE',NULL),(276,'en_US','Hiroshima'),(276,'es_ES',NULL),(276,'fr_FR','Hiroshima'),(276,'it_IT',NULL),(276,'ru_RU','Хиросима'),(277,'cs_CZ',NULL),(277,'de_DE',NULL),(277,'en_US','Hokkaido'),(277,'es_ES',NULL),(277,'fr_FR','Hokkaido'),(277,'it_IT',NULL),(277,'ru_RU','Хоккайдо'),(278,'cs_CZ',NULL),(278,'de_DE',NULL),(278,'en_US','Hyogo'),(278,'es_ES',NULL),(278,'fr_FR','Hyogo'),(278,'it_IT',NULL),(278,'ru_RU','Хего'),(279,'cs_CZ',NULL),(279,'de_DE',NULL),(279,'en_US','Ibaraki'),(279,'es_ES',NULL),(279,'fr_FR','Ibaraki'),(279,'it_IT',NULL),(279,'ru_RU','Ибараки'),(280,'cs_CZ',NULL),(280,'de_DE',NULL),(280,'en_US','Ishikawa'),(280,'es_ES',NULL),(280,'fr_FR','Ishikawa'),(280,'it_IT',NULL),(280,'ru_RU','Исикава'),(281,'cs_CZ',NULL),(281,'de_DE',NULL),(281,'en_US','Iwate'),(281,'es_ES',NULL),(281,'fr_FR','Iwate'),(281,'it_IT',NULL),(281,'ru_RU','Ивате'),(282,'cs_CZ',NULL),(282,'de_DE',NULL),(282,'en_US','Kagawa'),(282,'es_ES',NULL),(282,'fr_FR','Kagawa'),(282,'it_IT',NULL),(282,'ru_RU','Кагава'),(283,'cs_CZ',NULL),(283,'de_DE',NULL),(283,'en_US','Kagoshima'),(283,'es_ES',NULL),(283,'fr_FR','Kagoshima'),(283,'it_IT',NULL),(283,'ru_RU','Кагосима'),(284,'cs_CZ',NULL),(284,'de_DE',NULL),(284,'en_US','Kanagawa'),(284,'es_ES',NULL),(284,'fr_FR','Kanagawa'),(284,'it_IT',NULL),(284,'ru_RU','Канагава'),(285,'cs_CZ',NULL),(285,'de_DE',NULL),(285,'en_US','Kochi'),(285,'es_ES',NULL),(285,'fr_FR','Kochi'),(285,'it_IT',NULL),(285,'ru_RU','Коти'),(286,'cs_CZ',NULL),(286,'de_DE',NULL),(286,'en_US','Kumamoto'),(286,'es_ES',NULL),(286,'fr_FR','Kumamoto'),(286,'it_IT',NULL),(286,'ru_RU','Кумамото'),(287,'cs_CZ',NULL),(287,'de_DE',NULL),(287,'en_US','Kyoto'),(287,'es_ES',NULL),(287,'fr_FR','Kyoto'),(287,'it_IT',NULL),(287,'ru_RU','Киото'),(288,'cs_CZ',NULL),(288,'de_DE',NULL),(288,'en_US','Mie'),(288,'es_ES',NULL),(288,'fr_FR','Mie'),(288,'it_IT',NULL),(288,'ru_RU','Мие'),(289,'cs_CZ',NULL),(289,'de_DE',NULL),(289,'en_US','Miyagi'),(289,'es_ES',NULL),(289,'fr_FR','Miyagi'),(289,'it_IT',NULL),(289,'ru_RU','Мияги'),(290,'cs_CZ',NULL),(290,'de_DE',NULL),(290,'en_US','Miyazaki'),(290,'es_ES',NULL),(290,'fr_FR','Miyazaki'),(290,'it_IT',NULL),(290,'ru_RU','Миядзаки'),(291,'cs_CZ',NULL),(291,'de_DE',NULL),(291,'en_US','Nagano'),(291,'es_ES',NULL),(291,'fr_FR','Nagano'),(291,'it_IT',NULL),(291,'ru_RU','Нагано'),(292,'cs_CZ',NULL),(292,'de_DE',NULL),(292,'en_US','Nagasaki'),(292,'es_ES',NULL),(292,'fr_FR','Nagasaki'),(292,'it_IT',NULL),(292,'ru_RU','Нагасаки'),(293,'cs_CZ',NULL),(293,'de_DE',NULL),(293,'en_US','Nara'),(293,'es_ES',NULL),(293,'fr_FR','Nara'),(293,'it_IT',NULL),(293,'ru_RU','Нара'),(294,'cs_CZ',NULL),(294,'de_DE',NULL),(294,'en_US','Niigata'),(294,'es_ES',NULL),(294,'fr_FR','Niigata'),(294,'it_IT',NULL),(294,'ru_RU','Ниигата'),(295,'cs_CZ',NULL),(295,'de_DE',NULL),(295,'en_US','Oita'),(295,'es_ES',NULL),(295,'fr_FR','Oita'),(295,'it_IT',NULL),(295,'ru_RU','Оита'),(296,'cs_CZ',NULL),(296,'de_DE',NULL),(296,'en_US','Okayama'),(296,'es_ES',NULL),(296,'fr_FR','Okayama'),(296,'it_IT',NULL),(296,'ru_RU','Окаяма'),(297,'cs_CZ',NULL),(297,'de_DE',NULL),(297,'en_US','Okinawa'),(297,'es_ES',NULL),(297,'fr_FR','Okinawa'),(297,'it_IT',NULL),(297,'ru_RU','Окинава'),(298,'cs_CZ',NULL),(298,'de_DE',NULL),(298,'en_US','Osaka'),(298,'es_ES',NULL),(298,'fr_FR','Osaka'),(298,'it_IT',NULL),(298,'ru_RU','Осака'),(299,'cs_CZ',NULL),(299,'de_DE',NULL),(299,'en_US','Saga'),(299,'es_ES',NULL),(299,'fr_FR','Saga'),(299,'it_IT',NULL),(299,'ru_RU','Сага'),(300,'cs_CZ',NULL),(300,'de_DE',NULL),(300,'en_US','Saitama'),(300,'es_ES',NULL),(300,'fr_FR','Saitama'),(300,'it_IT',NULL),(300,'ru_RU','Сайтама'),(301,'cs_CZ',NULL),(301,'de_DE',NULL),(301,'en_US','Shiga'),(301,'es_ES',NULL),(301,'fr_FR','Shiga'),(301,'it_IT',NULL),(301,'ru_RU','Сига'),(302,'cs_CZ',NULL),(302,'de_DE',NULL),(302,'en_US','Shimane'),(302,'es_ES',NULL),(302,'fr_FR','Shimane'),(302,'it_IT',NULL),(302,'ru_RU','Симанэ'),(303,'cs_CZ',NULL),(303,'de_DE',NULL),(303,'en_US','Shizuoka'),(303,'es_ES',NULL),(303,'fr_FR','Shizuoka'),(303,'it_IT',NULL),(303,'ru_RU','Сидзуока'),(304,'cs_CZ',NULL),(304,'de_DE',NULL),(304,'en_US','Tochigi'),(304,'es_ES',NULL),(304,'fr_FR','Tochigi'),(304,'it_IT',NULL),(304,'ru_RU','Тотиги'),(305,'cs_CZ',NULL),(305,'de_DE',NULL),(305,'en_US','Tokushima'),(305,'es_ES',NULL),(305,'fr_FR','Tokushima'),(305,'it_IT',NULL),(305,'ru_RU','Токусима'),(306,'cs_CZ',NULL),(306,'de_DE',NULL),(306,'en_US','Tokyo'),(306,'es_ES',NULL),(306,'fr_FR','Tokyo'),(306,'it_IT','Tokyo'),(306,'ru_RU','Токио'),(307,'cs_CZ',NULL),(307,'de_DE',NULL),(307,'en_US','Tottori'),(307,'es_ES',NULL),(307,'fr_FR','Tottori'),(307,'it_IT',NULL),(307,'ru_RU','Тоттори'),(308,'cs_CZ',NULL),(308,'de_DE',NULL),(308,'en_US','Toyama'),(308,'es_ES',NULL),(308,'fr_FR','Toyama'),(308,'it_IT',NULL),(308,'ru_RU','Тояма'),(309,'cs_CZ',NULL),(309,'de_DE',NULL),(309,'en_US','Wakayama'),(309,'es_ES',NULL),(309,'fr_FR','Wakayama'),(309,'it_IT',NULL),(309,'ru_RU','Вакаяма'),(310,'cs_CZ',NULL),(310,'de_DE',NULL),(310,'en_US','Yamagata'),(310,'es_ES',NULL),(310,'fr_FR','Yamagata'),(310,'it_IT',NULL),(310,'ru_RU','Ямагата'),(311,'cs_CZ',NULL),(311,'de_DE',NULL),(311,'en_US','Yamaguchi'),(311,'es_ES',NULL),(311,'fr_FR','Yamaguchi'),(311,'it_IT',NULL),(311,'ru_RU','Ямагути'),(312,'cs_CZ',NULL),(312,'de_DE',NULL),(312,'en_US','Yamanashi'),(312,'es_ES',NULL),(312,'fr_FR','Yamanashi'),(312,'it_IT',NULL),(312,'ru_RU','Яманаси');
/*!40000 ALTER TABLE `state_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `serialized_requirements` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
INSERT INTO `tax` VALUES (1,'Thelia\\TaxEngine\\TaxType\\PricePercentTaxType','eyJwZXJjZW50IjoiMjAifQ==','2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,'Thelia\\TaxEngine\\TaxType\\PricePercentTaxType','eyJwZXJjZW50IjoiMTAifQ==','2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_i18n`
--

DROP TABLE IF EXISTS `tax_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `tax_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `tax` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_i18n`
--

LOCK TABLES `tax_i18n` WRITE;
/*!40000 ALTER TABLE `tax_i18n` DISABLE KEYS */;
INSERT INTO `tax_i18n` VALUES (1,'cs_CZ',NULL,NULL),(1,'de_DE','20% Französische MwSt.',NULL),(1,'en_US','French 20% VAT',NULL),(1,'es_ES','Francés 20% de IVA',NULL),(1,'fr_FR','TVA française à 20%',NULL),(1,'it_IT',NULL,NULL),(1,'ru_RU','Французский 20% НДС',NULL),(2,'cs_CZ',NULL,NULL),(2,'de_DE','10% Französische MwSt.',NULL),(2,'en_US','French 10% VAT',NULL),(2,'es_ES','Francés 10% de IVA',NULL),(2,'fr_FR','TVA française à 10%',NULL),(2,'it_IT',NULL,NULL),(2,'ru_RU','Французский 10% НДС',NULL);
/*!40000 ALTER TABLE `tax_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rule`
--

DROP TABLE IF EXISTS `tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rule`
--

LOCK TABLES `tax_rule` WRITE;
/*!40000 ALTER TABLE `tax_rule` DISABLE KEYS */;
INSERT INTO `tax_rule` VALUES (1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,0,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rule_country`
--

DROP TABLE IF EXISTS `tax_rule_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rule_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_rule_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `tax_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tax_rule_country_tax_id` (`tax_id`),
  KEY `idx_tax_rule_country_tax_rule_id` (`tax_rule_id`),
  KEY `idx_tax_rule_country_country_id` (`country_id`),
  KEY `idx_tax_rule_country_tax_rule_id_country_id_position` (`tax_rule_id`,`country_id`,`position`),
  KEY `idx_tax_rule_country_state_id` (`state_id`),
  CONSTRAINT `fk_tax_rule_country_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tax_rule_country_state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tax_rule_country_tax_id` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tax_rule_country_tax_rule_id` FOREIGN KEY (`tax_rule_id`) REFERENCES `tax_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rule_country`
--

LOCK TABLES `tax_rule_country` WRITE;
/*!40000 ALTER TABLE `tax_rule_country` DISABLE KEYS */;
INSERT INTO `tax_rule_country` VALUES (1,1,64,NULL,1,1,'2026-09-30 13:51:52','2026-09-30 13:51:52'),(2,2,64,NULL,2,1,'2026-09-30 13:51:52','2026-09-30 13:51:52');
/*!40000 ALTER TABLE `tax_rule_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rule_i18n`
--

DROP TABLE IF EXISTS `tax_rule_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rule_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `tax_rule_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `tax_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rule_i18n`
--

LOCK TABLES `tax_rule_i18n` WRITE;
/*!40000 ALTER TABLE `tax_rule_i18n` DISABLE KEYS */;
INSERT INTO `tax_rule_i18n` VALUES (1,'cs_CZ',NULL,NULL),(1,'de_DE','Standardsteuerregel','Französische Mehrwertsteuer von 20% für alle Länder in Europa (nur Metropolregion)'),(1,'en_US','Default Tax Rule','French 20% VAT  for all European countries (metropolitan only)'),(1,'es_ES','Regla impositiva predeterminada','IVA francés al 20% para todos los países de Europa (solo países metropolitanos)'),(1,'fr_FR','Règle de taxes par défaut','TVA Française a 20% pour tous les pays en Europe (hors DOM TOM)'),(1,'it_IT',NULL,NULL),(1,'ru_RU',NULL,NULL),(2,'cs_CZ',NULL,NULL),(2,'de_DE','10% französische Mehrwertsteuer (nur Metropolitan France)','Französische Mehrwertsteuer von 10% nur für die französische Metropole'),(2,'en_US','French 10% VAT (France only)','French 10% VAT (for metropolitan France only)'),(2,'es_ES','10% de IVA francés (solo Francia metropolitana)','IVA francés al 10% (solo para Francia metropolitana)'),(2,'fr_FR','TVA française à 10% (France métropolitaine seulement)','TVA Française à 10% (France métropolitaine seulement)'),(2,'it_IT',NULL,NULL),(2,'ru_RU',NULL,NULL);
/*!40000 ALTER TABLE `tax_rule_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_i18n`
--

DROP TABLE IF EXISTS `template_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  CONSTRAINT `template_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_i18n`
--

LOCK TABLES `template_i18n` WRITE;
/*!40000 ALTER TABLE `template_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_i18n` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 13:52:01
