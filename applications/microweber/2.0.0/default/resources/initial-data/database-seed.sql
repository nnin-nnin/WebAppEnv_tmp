/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: microweber
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address_street_1` varchar(255) DEFAULT NULL,
  `address_street_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_vat` varchar(255) DEFAULT NULL,
  `company_vat_registered` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` text DEFAULT NULL,
  `attribute_value` longtext DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `attribute_type` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` longtext DEFAULT NULL,
  `is_active` varchar(255) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `other_info` longtext DEFAULT NULL,
  `order_completed` int(11) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `skip_promo_code` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `custom_fields_data` longtext DEFAULT NULL,
  `custom_fields_json` longtext DEFAULT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_coupon_logs`
--

DROP TABLE IF EXISTS `cart_coupon_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_coupon_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `customer_ip` varchar(255) DEFAULT NULL,
  `uses_count` int(11) DEFAULT NULL,
  `use_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_coupon_logs`
--

LOCK TABLES `cart_coupon_logs` WRITE;
/*!40000 ALTER TABLE `cart_coupon_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_coupon_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_coupons`
--

DROP TABLE IF EXISTS `cart_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `uses_per_coupon` int(11) DEFAULT NULL,
  `uses_per_customer` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_coupons`
--

LOCK TABLES `cart_coupons` WRITE;
/*!40000 ALTER TABLE `cart_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_orders`
--

DROP TABLE IF EXISTS `cart_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_id` longtext DEFAULT NULL,
  `shipping_service` longtext DEFAULT NULL,
  `shipping` double(8,2) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `first_name` longtext DEFAULT NULL,
  `last_name` longtext DEFAULT NULL,
  `email` longtext DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `address2` longtext DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_completed` int(11) DEFAULT NULL,
  `is_paid` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `items_count` int(11) DEFAULT NULL,
  `custom_fields_data` longtext DEFAULT NULL,
  `payment_gw` varchar(255) DEFAULT NULL,
  `payment_verify_token` varchar(255) DEFAULT NULL,
  `payment_amount` double(8,2) DEFAULT NULL,
  `payment_currency` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_email` text DEFAULT NULL,
  `payment_receiver_email` text DEFAULT NULL,
  `payment_name` text DEFAULT NULL,
  `payment_country` text DEFAULT NULL,
  `payment_address` text DEFAULT NULL,
  `payment_city` text DEFAULT NULL,
  `payment_state` varchar(255) DEFAULT NULL,
  `payment_zip` varchar(255) DEFAULT NULL,
  `payment_phone` varchar(255) DEFAULT NULL,
  `payer_id` text DEFAULT NULL,
  `payer_status` text DEFAULT NULL,
  `payment_type` text DEFAULT NULL,
  `payment_data` longtext DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `payment_shipping` double(8,2) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `other_info` longtext DEFAULT NULL,
  `promo_code` longtext DEFAULT NULL,
  `skip_promo_code` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` double(8,2) DEFAULT NULL,
  `taxes_amount` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_orders`
--

LOCK TABLES `cart_orders` WRITE;
/*!40000 ALTER TABLE `cart_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping`
--

DROP TABLE IF EXISTS `cart_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_shipping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_active` varchar(255) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_cost_max` double(8,2) DEFAULT NULL,
  `shipping_cost_above` double(8,2) DEFAULT NULL,
  `shipping_country` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `shipping_type` longtext DEFAULT NULL,
  `shipping_price_per_size` double(8,2) DEFAULT NULL,
  `shipping_price_per_weight` double(8,2) DEFAULT NULL,
  `shipping_price_per_item` double(8,2) DEFAULT NULL,
  `shipping_price_custom` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping`
--

LOCK TABLES `cart_shipping` WRITE;
/*!40000 ALTER TABLE `cart_shipping` DISABLE KEYS */;
INSERT INTO `cart_shipping` VALUES (1,NULL,NULL,'1',0.00,NULL,NULL,'Worldwide',NULL,'fixed',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cart_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `is_hidden` int(11) DEFAULT 0,
  `users_can_create_subcategories` int(11) DEFAULT NULL,
  `users_can_create_content` int(11) DEFAULT NULL,
  `users_can_create_content_allowed_usergroups` varchar(255) DEFAULT NULL,
  `category_meta_title` text DEFAULT NULL,
  `category_meta_keywords` text DEFAULT NULL,
  `category_meta_description` text DEFAULT NULL,
  `category_subtype` varchar(255) DEFAULT NULL,
  `category_subtype_settings` longtext DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_items`
--

DROP TABLE IF EXISTS `categories_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_items`
--

LOCK TABLES `categories_items` WRITE;
/*!40000 ALTER TABLE `categories_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reply_to_comment_id` int(11) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `comment_name` text DEFAULT NULL,
  `comment_email` text DEFAULT NULL,
  `comment_website` text DEFAULT NULL,
  `comment_body` text DEFAULT NULL,
  `comment_subject` text DEFAULT NULL,
  `from_url` text DEFAULT NULL,
  `is_moderated` int(11) DEFAULT NULL,
  `is_spam` int(11) DEFAULT NULL,
  `is_new` int(11) DEFAULT NULL,
  `for_newsletter` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) DEFAULT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `content_body` longtext DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `subtype_value` varchar(255) DEFAULT NULL,
  `custom_type` varchar(255) DEFAULT NULL,
  `custom_type_value` varchar(255) DEFAULT NULL,
  `active_site_template` varchar(255) DEFAULT NULL,
  `layout_file` varchar(255) DEFAULT NULL,
  `layout_name` varchar(255) DEFAULT NULL,
  `layout_style` varchar(255) DEFAULT NULL,
  `content_filename` varchar(255) DEFAULT NULL,
  `original_link` varchar(255) DEFAULT NULL,
  `is_home` int(11) DEFAULT 0,
  `is_pinged` int(11) DEFAULT 0,
  `is_shop` int(11) DEFAULT 0,
  `is_deleted` int(11) DEFAULT 0,
  `require_login` int(11) DEFAULT 0,
  `status` varchar(255) DEFAULT NULL,
  `content_meta_title` text DEFAULT NULL,
  `content_meta_keywords` text DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `posted_at` datetime DEFAULT NULL,
  `draft_of` int(11) DEFAULT NULL,
  `copy_of` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentparent_index` (`parent`),
  KEY `contentis_deleted_index` (`is_deleted`),
  KEY `contentis_active_index` (`is_active`),
  KEY `contentsubtype_index` (`subtype`),
  KEY `contentcontent_type_index` (`content_type`),
  KEY `contenturl_index` (`url`(1024)),
  KEY `contenttitle_index` (`title`(1024)),
  KEY `contentposition_index` (`position`),
  KEY `contentactive_site_template_index` (`active_site_template`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'page','static','home','Home',0,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,'index.php',NULL,NULL,NULL,NULL,1,0,0,0,0,NULL,NULL,NULL,NULL,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_data`
--

DROP TABLE IF EXISTS `content_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `field_name` text DEFAULT NULL,
  `field_value` longtext DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_data_rel_type_index` (`rel_type`),
  KEY `content_data_rel_id_index` (`rel_id`),
  KEY `content_data_field_name_index` (`field_name`(1024))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_data`
--

LOCK TABLES `content_data` WRITE;
/*!40000 ALTER TABLE `content_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_data_variants`
--

DROP TABLE IF EXISTS `content_data_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_data_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) DEFAULT NULL,
  `custom_field_value_id` int(11) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_data_variants`
--

LOCK TABLES `content_data_variants` WRITE;
/*!40000 ALTER TABLE `content_data_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_data_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_fields`
--

DROP TABLE IF EXISTS `content_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `field` text DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_fields`
--

LOCK TABLES `content_fields` WRITE;
/*!40000 ALTER TABLE `content_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_fields_drafts`
--

DROP TABLE IF EXISTS `content_fields_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_fields_drafts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `field` text DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `is_temp` int(11) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_fields_drafts`
--

LOCK TABLES `content_fields_drafts` WRITE;
/*!40000 ALTER TABLE `content_fields_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_fields_drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_related`
--

DROP TABLE IF EXISTS `content_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_related` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `related_content_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_related`
--

LOCK TABLES `content_related` WRITE;
/*!40000 ALTER TABLE `content_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_revisions_history`
--

DROP TABLE IF EXISTS `content_revisions_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_revisions_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `field` text DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `checksum` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_revisions_history`
--

LOCK TABLES `content_revisions_history` WRITE;
/*!40000 ALTER TABLE `content_revisions_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_revisions_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phonecode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `countries_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan',93),(2,'AX','Aland Islands',358),(3,'AL','Albania',355),(4,'DZ','Algeria',213),(5,'AS','American Samoa',1),(6,'AD','Andorra',376),(7,'AO','Angola',244),(8,'AI','Anguilla',1),(9,'AQ','Antarctica',672),(10,'AG','Antigua and Barbuda',1),(11,'AR','Argentina',54),(12,'AM','Armenia',374),(13,'AW','Aruba',297),(14,'AC','Ascension Island',0),(15,'AU','Australia',61),(16,'AT','Austria',43),(17,'AZ','Azerbaijan',994),(18,'BS','Bahamas',1),(19,'BH','Bahrain',973),(20,'BD','Bangladesh',880),(21,'BB','Barbados',1),(22,'BY','Belarus',375),(23,'BE','Belgium',32),(24,'BZ','Belize',501),(25,'BJ','Benin',229),(26,'BM','Bermuda',1),(27,'BT','Bhutan',975),(28,'BO','Bolivia',591),(29,'BQ','Bonaire, Sint Eustatius, and Saba',599),(30,'BA','Bosnia and Herzegovina',387),(31,'BW','Botswana',267),(32,'BV','Bouvet Island',47),(33,'BR','Brazil',55),(34,'IO','British Indian Ocean Territory',246),(35,'VG','British Virgin Islands',1),(36,'BN','Brunei',673),(37,'BG','Bulgaria',359),(38,'BF','Burkina Faso',226),(39,'BI','Burundi',257),(40,'KH','Cambodia',855),(41,'CM','Cameroon',237),(42,'CA','Canada',1),(43,'IC','Canary Islands',0),(44,'CV','Cape Verde',238),(45,'KY','Cayman Islands',1),(46,'CF','Central African Republic',236),(47,'EA','Ceuta and Melilla',0),(48,'TD','Chad',235),(49,'CL','Chile',56),(50,'CN','China',86),(51,'CX','Christmas Island',61),(52,'CP','Clipperton Island',0),(53,'CC','Cocos [Keeling] Islands',61),(54,'CO','Colombia',57),(55,'KM','Comoros',269),(56,'CG','Congo - Brazzaville',242),(57,'CD','Congo - Kinshasa',243),(58,'CK','Cook Islands',682),(59,'CR','Costa Rica',506),(60,'CI','Côte d’Ivoire',225),(61,'HR','Croatia',385),(62,'CU','Cuba',53),(63,'CW','Curaçao',599),(64,'CY','Cyprus',357),(65,'CZ','Czech Republic',420),(66,'DK','Denmark',45),(67,'DG','Diego Garcia',0),(68,'DJ','Djibouti',253),(69,'DM','Dominica',1),(70,'DO','Dominican Republic',1),(71,'EC','Ecuador',593),(72,'EG','Egypt',20),(73,'SV','El Salvador',503),(74,'GQ','Equatorial Guinea',240),(75,'ER','Eritrea',291),(76,'EE','Estonia',372),(77,'ET','Ethiopia',251),(78,'EU','European Union',0),(79,'FK','Falkland Islands',500),(80,'FO','Faroe Islands',298),(81,'FJ','Fiji',679),(82,'FI','Finland',358),(83,'FR','France',33),(84,'GF','French Guiana',594),(85,'PF','French Polynesia',689),(86,'TF','French Southern Territories',262),(87,'GA','Gabon',241),(88,'GM','Gambia',220),(89,'GE','Georgia',995),(90,'DE','Germany',49),(91,'GH','Ghana',233),(92,'GI','Gibraltar',350),(93,'GR','Greece',30),(94,'GL','Greenland',299),(95,'GD','Grenada',1),(96,'GP','Guadeloupe',590),(97,'GU','Guam',1),(98,'GT','Guatemala',502),(99,'GG','Guernsey',44),(100,'GN','Guinea',224),(101,'GW','Guinea-Bissau',245),(102,'GY','Guyana',592),(103,'HT','Haiti',509),(104,'HM','Heard Island and McDonald Islands',672),(105,'HN','Honduras',504),(106,'HK','Hong Kong SAR China',852),(107,'HU','Hungary',36),(108,'IS','Iceland',354),(109,'IN','India',91),(110,'ID','Indonesia',62),(111,'IR','Iran',98),(112,'IQ','Iraq',964),(113,'IE','Ireland',353),(114,'IM','Isle of Man',44),(115,'IL','Israel',972),(116,'IT','Italy',39),(117,'JM','Jamaica',1),(118,'JP','Japan',81),(119,'JE','Jersey',44),(120,'JO','Jordan',962),(121,'KZ','Kazakhstan',7),(122,'KE','Kenya',254),(123,'KI','Kiribati',686),(124,'KW','Kuwait',965),(125,'KG','Kyrgyzstan',996),(126,'LA','Laos',856),(127,'LV','Latvia',371),(128,'LB','Lebanon',961),(129,'LS','Lesotho',266),(130,'LR','Liberia',231),(131,'LY','Libya',218),(132,'LI','Liechtenstein',423),(133,'LT','Lithuania',370),(134,'LU','Luxembourg',352),(135,'MO','Macau SAR China',853),(136,'MK','Macedonia',389),(137,'MG','Madagascar',261),(138,'MW','Malawi',265),(139,'MY','Malaysia',60),(140,'MV','Maldives',960),(141,'ML','Mali',223),(142,'MT','Malta',356),(143,'MH','Marshall Islands',692),(144,'MQ','Martinique',596),(145,'MR','Mauritania',222),(146,'MU','Mauritius',230),(147,'YT','Mayotte',262),(148,'MX','Mexico',52),(149,'FM','Micronesia',691),(150,'MD','Moldova',373),(151,'MC','Monaco',377),(152,'MN','Mongolia',976),(153,'ME','Montenegro',382),(154,'MS','Montserrat',1),(155,'MA','Morocco',212),(156,'MZ','Mozambique',258),(157,'MM','Myanmar [Burma]',95),(158,'NA','Namibia',264),(159,'NR','Nauru',674),(160,'NP','Nepal',977),(161,'NL','Netherlands',31),(162,'AN','Netherlands Antilles',599),(163,'NC','New Caledonia',687),(164,'NZ','New Zealand',64),(165,'NI','Nicaragua',505),(166,'NE','Niger',227),(167,'NG','Nigeria',234),(168,'NU','Niue',683),(169,'NF','Norfolk Island',672),(170,'KP','North Korea',850),(171,'MP','Northern Mariana Islands',1),(172,'NO','Norway',47),(173,'OM','Oman',968),(174,'QO','Outlying Oceania',0),(175,'PK','Pakistan',92),(176,'PW','Palau',680),(177,'PS','Palestinian Territories',970),(178,'PA','Panama',507),(179,'PG','Papua New Guinea',675),(180,'PY','Paraguay',595),(181,'PE','Peru',51),(182,'PH','Philippines',63),(183,'PN','Pitcairn Islands',64),(184,'PL','Poland',48),(185,'PT','Portugal',351),(186,'PR','Puerto Rico',1),(187,'QA','Qatar',974),(188,'RE','Réunion',262),(189,'RO','Romania',40),(190,'RU','Russia',7),(191,'RW','Rwanda',250),(192,'BL','Saint Barthélemy',590),(193,'SH','Saint Helena',290),(194,'KN','Saint Kitts and Nevis',1),(195,'LC','Saint Lucia',1),(196,'MF','Saint Martin',590),(197,'PM','Saint Pierre and Miquelon',508),(198,'VC','Saint Vincent and the Grenadines',1),(199,'WS','Samoa',685),(200,'SM','San Marino',378),(201,'ST','São Tomé and Príncipe',239),(202,'SA','Saudi Arabia',966),(203,'SN','Senegal',221),(204,'RS','Serbia',381),(205,'CS','Serbia and Montenegro',0),(206,'SC','Seychelles',248),(207,'SL','Sierra Leone',232),(208,'SG','Singapore',65),(209,'SX','Sint Maarten',1),(210,'SK','Slovakia',421),(211,'SI','Slovenia',386),(212,'SB','Solomon Islands',677),(213,'SO','Somalia',252),(214,'ZA','South Africa',27),(215,'GS','South Georgia and the South Sandwich Islands',500),(216,'KR','South Korea',82),(217,'SS','South Sudan',211),(218,'ES','Spain',34),(219,'LK','Sri Lanka',94),(220,'SD','Sudan',249),(221,'SR','Suriname',597),(222,'SJ','Svalbard and Jan Mayen',47),(223,'SZ','Swaziland',268),(224,'SE','Sweden',46),(225,'CH','Switzerland',41),(226,'SY','Syria',963),(227,'TW','Taiwan',886),(228,'TJ','Tajikistan',992),(229,'TZ','Tanzania',255),(230,'TH','Thailand',66),(231,'TL','Timor-Leste',670),(232,'TG','Togo',228),(233,'TK','Tokelau',690),(234,'TO','Tonga',676),(235,'TT','Trinidad and Tobago',1),(236,'TA','Tristan da Cunha',0),(237,'TN','Tunisia',216),(238,'TR','Turkey',90),(239,'TM','Turkmenistan',993),(240,'TC','Turks and Caicos Islands',1),(241,'TV','Tuvalu',688),(242,'UM','U.S. Minor Outlying Islands',0),(243,'VI','U.S. Virgin Islands',1),(244,'UG','Uganda',256),(245,'UA','Ukraine',380),(246,'AE','United Arab Emirates',971),(247,'GB','United Kingdom',44),(248,'US','United States',1),(249,'UY','Uruguay',598),(250,'UZ','Uzbekistan',998),(251,'VU','Vanuatu',678),(252,'VA','Vatican City',39),(253,'VE','Venezuela',58),(254,'VN','Vietnam',84),(255,'WF','Wallis and Futuna',681),(256,'EH','Western Sahara',212),(257,'YE','Yemen',967),(258,'ZM','Zambia',260),(259,'ZW','Zimbabwe',263);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `precision` int(11) NOT NULL,
  `thousand_separator` varchar(255) NOT NULL,
  `decimal_separator` varchar(255) NOT NULL,
  `swap_currency_symbol` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `name_key` text DEFAULT NULL,
  `placeholder` text DEFAULT NULL,
  `error_text` text DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `show_label` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `copy_of_field` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_values`
--

DROP TABLE IF EXISTS `custom_fields_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `price_modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_values`
--

LOCK TABLES `custom_fields_values` WRITE;
/*!40000 ALTER TABLE `custom_fields_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `currency_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `module_id` text DEFAULT NULL,
  `module` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `author` text DEFAULT NULL,
  `website` text DEFAULT NULL,
  `help` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `installed` int(11) DEFAULT NULL,
  `ui` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `as_element` int(11) DEFAULT NULL,
  `allow_caching` int(11) DEFAULT NULL,
  `ui_admin` int(11) DEFAULT NULL,
  `ui_admin_iframe` int(11) DEFAULT NULL,
  `is_system` int(11) DEFAULT NULL,
  `is_integration` int(11) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `notifications` int(11) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `categories` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `layout_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_feeds`
--

DROP TABLE IF EXISTS `export_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `export_feeds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `export_type` varchar(255) DEFAULT NULL,
  `export_format` varchar(255) DEFAULT NULL,
  `download_link` varchar(255) DEFAULT NULL,
  `split_to_parts` int(11) DEFAULT NULL,
  `is_draft` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_feeds`
--

LOCK TABLES `export_feeds` WRITE;
/*!40000 ALTER TABLE `export_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_feeds` ENABLE KEYS */;
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
  `created_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `forms_data`
--

DROP TABLE IF EXISTS `forms_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `list_id` int(11) DEFAULT NULL,
  `form_values` text DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `is_read` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_data`
--

LOCK TABLES `forms_data` WRITE;
/*!40000 ALTER TABLE `forms_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_data_values`
--

DROP TABLE IF EXISTS `forms_data_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_data_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_data_id` int(11) DEFAULT NULL,
  `field_type` varchar(255) DEFAULT NULL,
  `field_key` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` longtext DEFAULT NULL,
  `field_value_json` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_data_values`
--

LOCK TABLES `forms_data_values` WRITE;
/*!40000 ALTER TABLE `forms_data_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_data_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_lists`
--

DROP TABLE IF EXISTS `forms_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `custom_data` text DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `last_export` datetime DEFAULT NULL,
  `last_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_lists`
--

LOCK TABLES `forms_lists` WRITE;
/*!40000 ALTER TABLE `forms_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_recipients`
--

DROP TABLE IF EXISTS `forms_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_recipients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_recipients`
--

LOCK TABLES `forms_recipients` WRITE;
/*!40000 ALTER TABLE `forms_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_feeds`
--

DROP TABLE IF EXISTS `import_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_feeds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `import_to` varchar(255) DEFAULT NULL,
  `parent_page` int(11) DEFAULT NULL,
  `source_type` varchar(255) DEFAULT NULL,
  `source_url` text DEFAULT NULL,
  `source_file` text DEFAULT NULL,
  `source_file_realpath` text DEFAULT NULL,
  `source_file_size` varchar(255) DEFAULT NULL,
  `source_content_realpath` text DEFAULT NULL,
  `last_import_start` datetime DEFAULT NULL,
  `last_import_end` datetime DEFAULT NULL,
  `last_downloaded_date` datetime DEFAULT NULL,
  `download_images` int(11) DEFAULT NULL,
  `split_to_parts` int(11) DEFAULT NULL,
  `mapped_tags` longtext DEFAULT NULL,
  `mapped_content_realpath` text DEFAULT NULL,
  `imported_content_ids` longtext DEFAULT NULL,
  `detected_content_tags` longtext DEFAULT NULL,
  `content_tag` varchar(255) DEFAULT NULL,
  `primary_key` varchar(255) DEFAULT NULL,
  `update_items` varchar(255) DEFAULT NULL,
  `old_content_action` varchar(255) DEFAULT NULL,
  `count_of_contents` int(11) DEFAULT NULL,
  `total_running` int(11) DEFAULT NULL,
  `is_draft` int(11) DEFAULT NULL,
  `custom_content_data_fields` longtext DEFAULT NULL,
  `category_separators` longtext DEFAULT NULL,
  `category_ids_separators` longtext DEFAULT NULL,
  `category_add_types` longtext DEFAULT NULL,
  `tags_separators` longtext DEFAULT NULL,
  `media_url_separators` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_feeds`
--

LOCK TABLES `import_feeds` WRITE;
/*!40000 ALTER TABLE `import_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_feeds` ENABLE KEYS */;
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
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `reserved` int(11) DEFAULT NULL,
  `mw_processed` int(11) DEFAULT NULL,
  `job_hash` longtext DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `rel_type` text DEFAULT NULL,
  `rel_id` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `field` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `module` text DEFAULT NULL,
  `data_type` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `user_ip` text DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `is_system` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `success` int(11) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_providers`
--

DROP TABLE IF EXISTS `mail_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(255) DEFAULT NULL,
  `provider_settings` text DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_providers`
--

LOCK TABLES `mail_providers` WRITE;
/*!40000 ALTER TABLE `mail_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_subscribers`
--

DROP TABLE IF EXISTS `mail_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `mail_address` varchar(255) DEFAULT NULL,
  `mail_provider_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_subscribers`
--

LOCK TABLES `mail_subscribers` WRITE;
/*!40000 ALTER TABLE `mail_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_templates`
--

DROP TABLE IF EXISTS `mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `custom` text DEFAULT NULL,
  `copy_to` varchar(255) DEFAULT NULL,
  `plain_text` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_templates`
--

LOCK TABLES `mail_templates` WRITE;
/*!40000 ALTER TABLE `mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `filename` text DEFAULT NULL,
  `media_type` text DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `image_options` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_media_type_index` (`media_type`(1024)),
  KEY `media_rel_type_index` (`rel_type`),
  KEY `media_rel_id_index` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_thumbnails`
--

DROP TABLE IF EXISTS `media_thumbnails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_thumbnails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filename` text DEFAULT NULL,
  `image_options` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_thumbnails_filename_index` (`filename`(1024))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_thumbnails`
--

LOCK TABLES `media_thumbnails` WRITE;
/*!40000 ALTER TABLE `media_thumbnails` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_thumbnails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `item_type` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `url_target` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `auto_populate` int(11) DEFAULT NULL,
  `size` text DEFAULT NULL,
  `default_image` text DEFAULT NULL,
  `rollover_image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `menu_name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'header_menu','menu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL),(2,NULL,'menu_item',NULL,NULL,NULL,1,1,NULL,NULL,1,NULL,NULL,NULL,NULL,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL),(3,'footer_menu','menu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL),(4,NULL,'menu_item',NULL,NULL,NULL,2,1,NULL,NULL,1,NULL,NULL,NULL,NULL,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_01_07_073615_create_tagged_table',1),(2,'2014_01_07_073615_create_tags_table',1),(3,'2014_10_11_125754_create_currencies_table',1),(4,'2014_10_12_000000_create_user_table',1),(5,'2014_10_12_000001_update_users_table',1),(6,'2016_06_29_073615_create_tag_groups_table',1),(7,'2016_06_29_073615_update_tags_table',1),(8,'2017_05_06_173745_create_countries_table',1),(9,'2019_08_30_072639_create_addresses_table',1),(10,'2019_09_21_052540_create_tax_types_table',1),(11,'2019_11_25_021944_create_customers_table',1),(12,'2019_12_14_000001_create_personal_access_tokens_table',1),(13,'2020_00_00_000000_create_content_data_table',1),(14,'2020_00_00_000000_create_content_data_variants_table',1),(15,'2020_00_00_000000_create_content_table',1),(16,'2020_00_00_000000_create_forms_table',1),(17,'2020_00_00_000000_create_notifications_table',1),(18,'2020_00_00_000000_create_options_table',1),(19,'2020_00_00_000000_create_shop_table',1),(20,'2020_00_00_00000_create_permission_table',1),(21,'2020_00_00_00001_create_roles_table',1),(22,'2020_00_00_00002_create_model_has_permissions_table',1),(23,'2020_00_00_00003_create_model_has_roles_table',1),(24,'2020_00_00_00004_create_role_has_permissions_table',1),(25,'2020_03_13_083515_add_description_to_tags_table',1),(26,'2020_07_02_000000_create_media_table',1),(27,'2020_07_02_000000_create_media_thumbnails_table',1),(28,'2020_10_12_100000_create_password_resets_table',1),(29,'2020_10_29_090535_create_jobs_table',1),(30,'2020_10_29_090855_create_failed_jobs_table',1),(31,'2020_11_12_000000_update_customers_table',1),(32,'2021_01_13_100000_create_personal_access_clients',1),(33,'2021_01_14_000001_update_failed_jobs_table',1),(34,'2021_01_14_000003_add_new_fields_on_jobs_table',1),(35,'2021_01_19_000000_create_related_content',1),(36,'2021_02_04_000000_delete_old_backup_module',1),(37,'2021_02_12_000001_create_translation_keys_table',1),(38,'2021_02_12_000002_create_translation_texts_table',1),(39,'2021_02_19_000000_add_company_details_addresses_table',1),(40,'2021_02_24_000000_insert_countries',1),(41,'2021_03_04_000001_add_index_to_user_table',1),(42,'2021_03_08_000001_add_index_to_translation_tables',1),(43,'2021_03_17_000000_create_forms_recipients_table',1),(44,'2021_09_01_154745_create_multilanguage_translations',1),(45,'2021_09_01_154759_create_multilanguage_supported_locales',1),(46,'2021_09_02_000001_add_index_to_multilanguage_tables',1),(47,'2021_09_03_133600_change_en_uk_to_en_gb_locale',1),(48,'2021_09_08_133600_disable_old_version_multilanguage',1),(49,'2021_10_21_000000_create_forms_data_values_table',1),(50,'2021_10_22_000000_add_is_read_in_forms_data',1),(51,'2021_10_22_000000_add_updated_at_in_forms_data',1),(52,'2021_10_22_000000_migrate_old_forms_data',1),(53,'2022_00_00_000000_create_content_fields_table',1),(54,'2022_07_04_130209_create_menus_table',1),(55,'2022_10_04_000000_add_indexes_to_content',1),(56,'2022_10_04_000001_add_index_content_data_table',1),(57,'2022_10_04_000001_add_index_to_multilanguage_tables2',1),(58,'2022_12_09_000000_create_categories_table',1),(59,'2022_12_16_000000_update_categories_rel_type_in_tables',1),(60,'2023_00_00_000000_create_custom_fields_table',1),(61,'2023_00_00_000000_create_custom_fields_values_table',1),(62,'2023_00_00_000000_create_notifications_mails_log_table',1),(63,'2023_03_09_000001_add_name_field_to_users_table',1),(64,'2023_04_22_143828_add_locale_to_tagging_tags_table',1),(65,'2023_10_12_200000_add_two_factor_columns_to_users_table',1),(66,'2023_10_12_200002_add_user_columns_to_sessions_table',1),(67,'2023_10_25_000000_migrate_template_options_for_modules',1),(68,'2023_11_03_000001_add_two_factor_secret_to_users_table',1),(69,'2023_12_05_000000_add_price_modifier_to_custom_fields_values_table',1),(70,'2023_12_08_000000_add_uuid_to_media_thumbnails_table',1),(71,'2023_12_24_000000_migrate_background_image_module_options',1),(72,'2024_01_26_000000_offers_table',1),(73,'2024_03_21_000001_combined_tag_migrations',1),(74,'2024_03_21_000002_add_locale_to_tagging_tags_table3',1),(75,'2024_05_10_000001_migrate_old_version_213',1),(76,'2024_18_01_000000_add_html_field_notifications_mails_log_table',1),(77,'2022_00_00_000001_create_import_feeds_table',2),(78,'2022_00_00_000003_create_export_feeds_table',2),(79,'2023_00_00_000000_create_comments_table2',2),(80,'2023_00_00_000001_add_deleted_at_to_comments_table',2),(81,'2023_00_00_000001_create_cart_coupons_log_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_templates`
--

DROP TABLE IF EXISTS `module_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `module_id` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `module` text DEFAULT NULL,
  `module_attrs` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_templates`
--

LOCK TABLES `module_templates` WRITE;
/*!40000 ALTER TABLE `module_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `module_id` text DEFAULT NULL,
  `module` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `author` text DEFAULT NULL,
  `website` text DEFAULT NULL,
  `help` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `installed` int(11) DEFAULT NULL,
  `ui` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `as_element` int(11) DEFAULT NULL,
  `allow_caching` int(11) DEFAULT NULL,
  `ui_admin` int(11) DEFAULT NULL,
  `ui_admin_iframe` int(11) DEFAULT NULL,
  `is_system` int(11) DEFAULT NULL,
  `is_integration` int(11) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `notifications` int(11) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `categories` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Breadcrumb',0,NULL,'breadcrumb','Breadcrumb navigation','{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,1,54,NULL,1,0,NULL,0,0,'0.3',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/breadcrumb\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Breadcrumb\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Breadcrumb\\\\Providers\\\\BreadcrumbServiceProvider\"]}','miscellaneous',NULL),(2,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Sharer',0,NULL,'sharer',NULL,'{SITE_URL}userfiles/modules/sharer/sharer.svg','Microweber',NULL,NULL,NULL,1,1,210,NULL,1,0,NULL,0,0,'1.3',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/sharer\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Sharer\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Sharer\\\\Providers\\\\SharerServiceProvider\"]}','social',NULL),(3,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Facebook page',0,NULL,'facebook_page','Facebook page integration for your website!','{SITE_URL}userfiles/modules/facebook_page/facebook_page.svg','',NULL,NULL,NULL,1,1,11,NULL,1,0,NULL,0,0,'0.01',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/facebook_page\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\FacebookPage\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\FacebookPage\\\\Providers\\\\FacebookPageServiceProvider\"]}','social',NULL),(4,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Layout Content',0,NULL,'layout_content',NULL,'{SITE_URL}userfiles/modules/layout_content/icon.svg','Microweber',NULL,NULL,NULL,1,1,0,NULL,1,0,NULL,0,0,'0.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/layout_content\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\LayoutContent\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\LayoutContent\\\\Providers\\\\LayoutContentServiceProvider\"]}','essentials',NULL),(5,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Slider',0,NULL,'slider_v2',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,1,18,NULL,1,0,NULL,0,0,'0.2',NULL,'{\"translatable_options\":[\"settings\"],\"allowed_html_option_keys\":[\"settings\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/slider_v2\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\SliderV2\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\SliderV2\\\\Providers\\\\SliderServiceProvider\"]}','media',NULL),(6,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Updates',0,NULL,'updates',NULL,'{SITE_URL}userfiles/modules/updates/updates.svg','Microweber',NULL,NULL,NULL,1,0,50,NULL,1,1,NULL,1,0,'0.4',NULL,NULL,'admin',NULL),(7,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Pagination',0,NULL,'pagination','Pagination module for your posts!','{SITE_URL}userfiles/modules/pagination/pagination.svg','Bozhidar Slaveykov',NULL,NULL,NULL,1,0,100,NULL,1,0,NULL,0,0,'0.01',NULL,NULL,'navigation',NULL),(8,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Google Analytics',0,NULL,'google_analytics',NULL,'{SITE_URL}userfiles/modules/google_analytics/google_analytics.svg','Microweber',NULL,NULL,NULL,1,1,200,NULL,1,1,1,0,0,'1.2',NULL,'{\"routes\":{\"admin\":\"admin.google_analytics.index\"},\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/google_analytics\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\GoogleAnalytics\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\GoogleAnalytics\\\\Providers\\\\GoogleAnalyticsServiceProvider\"]}','content',NULL),(9,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Contact form',0,NULL,'contact_form',NULL,'{SITE_URL}userfiles/modules/contact_form/contact_form.svg','Microweber',NULL,NULL,NULL,1,1,15,NULL,1,1,NULL,1,1,'0.2',NULL,'{\"translatable_options\":[\"email_autorespond_subject\",\"email_autorespond\"],\"routes\":{\"admin\":\"admin.contact-form.index\"},\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/contact_form\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\ContactForm\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\ContactForm\\\\ContactFormServiceProvider\"]}','essentials',NULL),(10,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'White label',0,NULL,'white_label',NULL,'{SITE_URL}userfiles/modules/white_label/white_label.svg','Microweber',NULL,NULL,NULL,1,0,500,NULL,1,1,NULL,0,0,'0.4',NULL,'[]','advanced',NULL),(11,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'White label WHMCS',0,NULL,'white_label/whmcs',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,500,NULL,1,0,NULL,0,0,'0.1',NULL,NULL,'advanced',NULL),(12,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Color Schemes',0,NULL,'white_label/admin_colors',NULL,'{SITE_URL}userfiles/modules/default.svg',NULL,NULL,NULL,NULL,1,0,999,NULL,1,0,NULL,0,0,'0.1',NULL,NULL,'other',NULL),(13,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Content Revisions',0,NULL,'editor/content_revisions',NULL,'{SITE_URL}userfiles/modules/default.svg',NULL,NULL,NULL,NULL,1,0,28,NULL,1,0,NULL,0,0,'0.05',NULL,NULL,'other',NULL),(14,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Editor Template Settings',0,NULL,'editor/template_settings_v2',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,200,NULL,1,0,NULL,0,0,'0.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/editor\\/template_settings_v2\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Editor\\\\TemplateSettingsV2\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Editor\\\\TemplateSettingsV2\\\\Providers\\\\EditorTemplateSettingsV2ServiceProvider\"]}',NULL,NULL),(15,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Microweber - Editor Fonts',0,NULL,'editor/fonts',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,38,NULL,1,0,NULL,0,0,'0.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/editor\\/fonts\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Editor\\\\Fonts\\\\FontsSettings\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Editor\\\\Fonts\\\\FontsSettings\\\\Providers\\\\FontsSettingsSettingsServiceProvider\"]}','miscellaneous',NULL),(16,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Text',0,NULL,'text','Simple text','{SITE_URL}userfiles/modules/text/text.svg','Microweber',NULL,NULL,NULL,1,1,2,1,1,0,NULL,0,0,'0.2',NULL,NULL,'essentials',NULL),(17,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Empty Element',0,NULL,'text/empty_element','Microweber','{SITE_URL}userfiles/modules/text/empty_element.svg','Microweber','http://microweber.com/','http://microweber.info/modules/title',NULL,1,1,5,1,1,0,NULL,0,0,'0.2',NULL,NULL,'essentials',NULL),(18,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Multiple Columns',0,NULL,'text/multiple_columns','Microweber','{SITE_URL}userfiles/modules/text/multiple_columns.svg','Microweber','http://microweber.com/','http://microweber.info/modules/title',NULL,1,1,8,1,1,0,NULL,0,0,'0.2',NULL,NULL,'essentials',NULL),(19,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Standalone Updater',0,NULL,'standalone-updater',NULL,'{SITE_URL}userfiles/modules/standalone-updater/standalone-updater.svg','bobi@microweber.com',NULL,NULL,NULL,1,0,1,NULL,1,1,NULL,1,0,'5.3.8',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/standalone-updater\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\StandaloneUpdater\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\StandaloneUpdater\\\\StandaloneUpdaterServiceProvider\"]}','other',NULL),(20,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Accordion',0,NULL,'accordion',NULL,'{SITE_URL}userfiles/modules/accordion/accordion.svg','Microweber',NULL,NULL,NULL,1,1,52,NULL,1,0,NULL,0,0,'0.01',NULL,'{\"translatable_options\":[\"settings\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/accordion\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Accordion\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Accordion\\\\Providers\\\\AccordionServiceProvider\"]}','miscellaneous',NULL),(21,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'PDF',0,NULL,'pdf',NULL,'{SITE_URL}userfiles/modules/pdf/pdf.svg','Microweber',NULL,NULL,NULL,1,1,40,NULL,1,0,NULL,0,0,'1.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/pdf\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Pdf\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Pdf\\\\Providers\\\\PdfServiceProvider\"]}','miscellaneous',NULL),(22,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Multilanguage',0,NULL,'multilanguage',NULL,'{SITE_URL}userfiles/modules/multilanguage/multilanguage.svg','Bozhidar Slaveykov',NULL,NULL,NULL,1,1,99,NULL,1,1,NULL,0,0,'4',NULL,NULL,'miscellaneous',NULL),(23,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Image Rollover',0,NULL,'image_rollover',NULL,'{SITE_URL}userfiles/modules/image_rollover/image_rollover.svg','Microweber',NULL,NULL,NULL,1,1,7,NULL,1,0,NULL,0,0,'1',NULL,NULL,'media',NULL),(24,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Site stats',0,NULL,'site_stats',NULL,'{SITE_URL}userfiles/modules/site_stats/site_stats.svg','Microweber',NULL,NULL,'stats',1,0,9999,NULL,1,0,NULL,0,0,'0.7',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/site_stats\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\SiteStats\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\SiteStats\\\\Providers\\\\SiteStatsServiceProvider\"]}',NULL,NULL),(25,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Categories',0,NULL,'categories',NULL,'{SITE_URL}userfiles/modules/categories/categories.svg','Microweber',NULL,NULL,NULL,1,1,29,NULL,1,0,NULL,1,0,'0.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/categories\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Categories\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Categories\\\\Providers\\\\CategoryServiceProvider\"]}','navigation',NULL),(26,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Categories Images',0,NULL,'categories/category_images',NULL,'{SITE_URL}userfiles/modules/categories/category_images/category_images.svg','Microweber',NULL,NULL,NULL,1,1,51,NULL,1,0,NULL,1,0,'0.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/categories\\/category_images\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Categories\\\\CategoryImages\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Categories\\\\CategoryImages\\\\Providers\\\\CategoryImagesServiceProvider\"]}','miscellaneous',NULL),(27,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Facebook Like',0,NULL,'facebook_like',NULL,'{SITE_URL}userfiles/modules/facebook_like/facebook_like.svg','Microweber',NULL,NULL,NULL,1,1,10,NULL,1,0,NULL,0,0,'0.06',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/facebook_like\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\FacebookLike\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\FacebookLike\\\\Providers\\\\FacebookLikeServiceProvider\"]}','social',NULL),(28,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Twitter feed',0,NULL,'twitter_feed','Feed of tweets','{SITE_URL}userfiles/modules/twitter_feed/twitter_feed.svg','Peter Ivanov',NULL,NULL,NULL,1,1,200,NULL,1,0,NULL,0,0,'0.4',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/twitter_feed\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\TwitterFeed\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\TwitterFeed\\\\Providers\\\\TwitterFeedServiceProvider\"]}','social',NULL),(29,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'TOC',0,NULL,'toc',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,1,39,NULL,1,0,NULL,0,0,'1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/toc\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Toc\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Toc\\\\Providers\\\\TocServiceProvider\"]}','content',NULL),(30,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Before/After',0,NULL,'beforeafter',NULL,'{SITE_URL}userfiles/modules/beforeafter/beforeafter.svg','Microweber',NULL,NULL,NULL,1,1,37,NULL,1,0,NULL,0,0,'1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/beforeafter\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\BeforeAfter\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\BeforeAfter\\\\Providers\\\\BeforeAfterServiceProvider\"]}','media',NULL),(31,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Picture Gallery',0,NULL,'pictures',NULL,'{SITE_URL}userfiles/modules/pictures/pictures.svg','Microweber',NULL,NULL,NULL,1,1,4,NULL,1,0,NULL,1,0,'1.11',NULL,'[]','media',NULL),(32,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Embed Code',0,NULL,'embed',NULL,'{SITE_URL}userfiles/modules/embed/embed.svg','Microweber',NULL,NULL,NULL,1,1,38,NULL,1,0,NULL,0,0,'0.6',NULL,'{\"allowed_html_option_keys\":[\"source_code\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/embed\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Embed\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Embed\\\\Providers\\\\EmbedServiceProvider\"]}','miscellaneous',NULL),(33,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Marquee',0,NULL,'marquee',NULL,'{SITE_URL}userfiles/modules/marquee/marquee.svg','Microweber',NULL,NULL,NULL,1,1,39,NULL,1,0,NULL,0,0,'1',NULL,'{\"allowed_html_option_keys\":[\"text\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/marquee\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Marquee\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Marquee\\\\Providers\\\\MarqueeServiceProvider\"]}','miscellaneous',NULL),(34,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Online shop',0,NULL,'shop',NULL,'{SITE_URL}userfiles/modules/shop/shop.svg','Microweber',NULL,NULL,NULL,1,1,200,NULL,1,1,NULL,0,0,'0.4',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Shop\"}],\"service_provider\":[\"MicroweberPackages\\\\Shop\\\\ShopServiceProvider\",\"MicroweberPackages\\\\Modules\\\\Shop\\\\Providers\\\\ShopServiceProvider\"]}','store',NULL),(35,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Shipping',0,NULL,'shop/shipping',NULL,'{SITE_URL}userfiles/modules/shop/shipping/shipping.svg','Microweber',NULL,NULL,NULL,1,0,26,NULL,1,1,NULL,0,0,'0.3',NULL,NULL,'online shop',NULL),(36,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Pickup from address',0,NULL,'shop/shipping/gateways/pickup',NULL,'{SITE_URL}userfiles/modules/shop/shipping/gateways/pickup/pickup.svg','Microweber',NULL,NULL,'shipping_gateway',1,0,900,NULL,1,0,NULL,0,0,'0.3',NULL,'{\"checkout_position\":0,\"icon_class\":\"mdi mdi-walk\",\"help_text\":\"get your order from address below\",\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/shipping\\/gateways\\/pickup\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Shop\\\\Shipping\\\\Gateways\\\\Pickup\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Shop\\\\Shipping\\\\Gateways\\\\Pickup\\\\PickupEventServiceProvider\",\"MicroweberPackages\\\\Shop\\\\Shipping\\\\Gateways\\\\Pickup\\\\PickupServiceProvider\"]}','online shop',NULL),(37,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Shipping to address',0,NULL,'shop/shipping/gateways/country',NULL,'{SITE_URL}userfiles/modules/shop/shipping/gateways/country/country.svg','Microweber',NULL,NULL,'shipping_gateway',1,0,100,NULL,1,0,NULL,0,0,'0.3',NULL,'{\"checkout_position\":1,\"icon_class\":\"mdi mdi-truck-check-outline\",\"help_text\":\"The order will be delivered to your address\",\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/shipping\\/gateways\\/country\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Shop\\\\Shipping\\\\Gateways\\\\Country\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Shop\\\\Shipping\\\\Gateways\\\\Country\\\\ShippingToCountryEventServiceProvider\",\"MicroweberPackages\\\\Shop\\\\Shipping\\\\Gateways\\\\Country\\\\ShippingToCountryServiceProvider\"]}','online shop',NULL),(38,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Add to cart',0,NULL,'shop/cart_add',NULL,'{SITE_URL}userfiles/modules/shop/cart_add/cart_add.svg','Microweber',NULL,NULL,NULL,1,1,25,NULL,0,0,NULL,0,0,'0.26',NULL,NULL,'store',NULL),(39,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Shopping Cart',0,NULL,'shop/cart',NULL,'{SITE_URL}userfiles/modules/shop/cart/cart.svg','Microweber',NULL,NULL,NULL,1,0,23,NULL,0,0,NULL,0,0,'0.24',NULL,NULL,'online shop',NULL),(40,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Invoices',0,NULL,'shop/invoices',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,2,NULL,1,0,NULL,0,0,'0.3',NULL,NULL,'online shop',NULL),(41,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Payments',0,NULL,'shop/payments',NULL,'{SITE_URL}userfiles/modules/shop/payments/payments.svg','Microweber',NULL,NULL,NULL,1,0,27,NULL,1,1,NULL,0,0,'0.3',NULL,NULL,'online shop',NULL),(42,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Stripe payment',0,NULL,'shop/payments/gateways/omnipay_stripe',NULL,'{SITE_URL}userfiles/modules/shop/payments/gateways/omnipay_stripe/omnipay_stripe.svg','Microweber',NULL,NULL,'payment_gateway',1,0,132,NULL,1,0,NULL,0,0,NULL,NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/payments\\/gateways\\/omnipay_stripe\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Payment\\\\Providers\\\\Stripe\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Payment\\\\Providers\\\\Stripe\\\\StripeServiceProvider\"]}','online shop',NULL),(43,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Paypal Pro',0,NULL,'shop/payments/gateways/paypal_pro',NULL,'{SITE_URL}userfiles/modules/shop/payments/gateways/paypal_pro/paypal_pro.svg','Microweber',NULL,NULL,'deprecated_payment_gateway',1,0,111,NULL,1,0,NULL,0,0,NULL,NULL,NULL,'online shop',NULL),(44,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Pay on delivery',0,NULL,'shop/payments/gateways/pay_on_delivery',NULL,'{SITE_URL}userfiles/modules/shop/payments/gateways/pay_on_delivery/pay_on_delivery.svg','D.Velev (colocation.bg)',NULL,NULL,'payment_gateway',1,0,130,NULL,1,0,NULL,0,0,NULL,NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/payments\\/gateways\\/pay_on_delivery\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Payment\\\\Providers\\\\PayOnDelivery\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Payment\\\\Providers\\\\PayOnDelivery\\\\PayOnDeliveryServiceProvider\"]}','online shop',NULL),(45,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Przelewy24',0,NULL,'shop/payments/gateways/omnipay_przelewy24',NULL,'{SITE_URL}userfiles/modules/shop/payments/gateways/omnipay_przelewy24/omnipay_przelewy24.svg','Microweber',NULL,NULL,'payment_gateway',1,0,136,NULL,1,0,NULL,0,0,NULL,NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/payments\\/gateways\\/omnipay_przelewy24\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Payment\\\\Providers\\\\Przelewy24\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Payment\\\\Providers\\\\Przelewy24\\\\Przelewy24ServiceProvider\"]}','online shop',NULL),(46,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Paypal Express',0,NULL,'shop/payments/gateways/paypal',NULL,'{SITE_URL}userfiles/modules/shop/payments/gateways/paypal/paypal.svg','Microweber',NULL,NULL,'payment_gateway',1,0,110,NULL,1,0,NULL,0,0,NULL,NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/payments\\/gateways\\/paypal\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Payment\\\\Providers\\\\Paypal\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Payment\\\\Providers\\\\Paypal\\\\PaypalServiceProvider\"]}','online shop',NULL),(47,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'VoguePay payment',0,NULL,'shop/payments/gateways/voguepay',NULL,'{SITE_URL}userfiles/modules/shop/payments/gateways/voguepay/voguepay.png','Microweber',NULL,NULL,'deprecated_payment_gateway',1,0,139,NULL,1,0,NULL,0,0,NULL,NULL,NULL,'online shop',NULL),(48,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Bank Transfer',0,NULL,'shop/payments/gateways/bank_transfer',NULL,'{SITE_URL}userfiles/modules/shop/payments/gateways/bank_transfer/bank_transfer.svg','Bozhidar Slaveykov',NULL,NULL,'payment_gateway',1,0,110,NULL,1,0,NULL,0,0,'1.0',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/payments\\/gateways\\/bank_transfer\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Payment\\\\Providers\\\\BankTransfer\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Payment\\\\Providers\\\\BankTransfer\\\\BankTransferServiceProvider\"]}','online shop',NULL),(49,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Authorize.Net',0,NULL,'shop/payments/gateways/omnipay_authorize_aim',NULL,'{SITE_URL}userfiles/modules/shop/payments/gateways/omnipay_authorize_aim/omnipay_authorize_aim.svg','Microweber',NULL,NULL,'deprecated_payment_gateway',1,0,132,NULL,1,0,NULL,0,0,NULL,NULL,NULL,'online shop',NULL),(50,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Mollie payment',0,NULL,'shop/payments/gateways/omnipay_mollie',NULL,'{SITE_URL}userfiles/modules/shop/payments/gateways/omnipay_mollie/omnipay_mollie.svg','Microweber',NULL,NULL,'payment_gateway',1,0,136,NULL,1,0,NULL,0,0,NULL,NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/payments\\/gateways\\/omnipay_mollie\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Payment\\\\Providers\\\\Mollie\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Payment\\\\Providers\\\\Mollie\\\\MollieServiceProvider\"]}','online shop',NULL),(51,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Products',0,NULL,'shop/products',NULL,'{SITE_URL}userfiles/modules/shop/products/products.svg','Microweber',NULL,NULL,NULL,1,1,32,NULL,1,1,NULL,0,0,'0.41',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/products\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Shop\\\\Products\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Shop\\\\Products\\\\Providers\\\\ProductsServiceProvider\"]}','store',NULL),(52,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Customers',0,NULL,'shop/customers',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,2,NULL,1,0,NULL,0,0,'0.3',NULL,NULL,'online shop',NULL),(53,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Coupons',0,NULL,'shop/coupons',NULL,'{SITE_URL}userfiles/modules/shop/coupons/coupons.svg','Bozhidar Slaveykov',NULL,NULL,NULL,1,0,26,NULL,1,1,NULL,0,0,'0.6',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/shop\\/coupons\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Shop\\\\Coupons\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Shop\\\\Coupons\\\\Providers\\\\ShopCouponServiceProvider\",\"MicroweberPackages\\\\Modules\\\\Shop\\\\Coupons\\\\Providers\\\\ShopCouponEventServiceProvider\"]}','online shop',NULL),(54,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Offers',0,NULL,'shop/offers',NULL,'{SITE_URL}userfiles/modules/shop/offers/offers.svg','Microweber',NULL,NULL,NULL,1,0,27,NULL,1,1,NULL,0,0,'1.1',NULL,'{\"service_provider\":[\"MicroweberPackages\\\\Offer\\\\Providers\\\\EventServiceProvider\",\"MicroweberPackages\\\\Offer\\\\Providers\\\\OfferServiceProvider\"]}','online shop',NULL),(55,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Taxes',0,NULL,'shop/taxes',NULL,'{SITE_URL}userfiles/modules/shop/taxes/taxes.svg','Bozhidar Slaveykov',NULL,NULL,NULL,1,0,30,NULL,1,0,NULL,0,0,'0.24',NULL,NULL,'online shop',NULL),(56,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Checkout',0,NULL,'shop/checkout',NULL,'{SITE_URL}userfiles/modules/shop/checkout/checkout.svg','Microweber',NULL,NULL,NULL,1,0,94,NULL,0,0,NULL,0,0,'0.3',NULL,NULL,'online shop',NULL),(57,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Logo',0,NULL,'logo',NULL,'{SITE_URL}userfiles/modules/logo/logo.svg','Microweber',NULL,NULL,NULL,1,1,39,NULL,1,0,NULL,0,0,'1.1',NULL,'{\"translatable_options\":[\"text\",\"font_family\",\"logotype\",\"logoimage\",\"size\",\"settings\"],\"allowed_html_option_keys\":[\"text\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/logo\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Logo\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Logo\\\\Providers\\\\LogoServiceProvider\"]}','miscellaneous',NULL),(58,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Icon',0,NULL,'icon','Microweber','{SITE_URL}userfiles/modules/default.svg','Microweber','http://microweber.com/','http://microweber.info/modules/title',NULL,1,1,1,1,1,0,NULL,0,0,'0.2',NULL,NULL,'essentials',NULL),(59,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Digital Download',0,NULL,'digital_download',NULL,'{SITE_URL}userfiles/modules/digital_download/digital_download.svg','Microweber',NULL,NULL,NULL,1,1,38,NULL,1,0,NULL,0,0,'0.6',NULL,NULL,'miscellaneous',NULL),(60,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Tabs',0,NULL,'tabs',NULL,'{SITE_URL}userfiles/modules/tabs/tabs.svg','Microweber',NULL,NULL,NULL,1,1,52,NULL,1,0,NULL,0,0,'0.01',NULL,'{\"translatable_options\":[\"settings\"],\"allowed_html_option_keys\":[\"settings\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/tabs\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Tabs\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Tabs\\\\Providers\\\\TabsServiceProvider\"]}','miscellaneous',NULL),(61,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Content',0,NULL,'content','Shows dynamic content','{SITE_URL}userfiles/modules/content/content.svg','Microweber',NULL,NULL,NULL,1,1,22,NULL,1,0,NULL,0,0,'0.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/content\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Content\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Content\\\\Providers\\\\ContentServiceProvider\"]}','essentials',NULL),(62,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Rating',0,NULL,'rating','Microweber','{SITE_URL}userfiles/modules/rating/rating.svg','Microweber','http://microweber.com/','http://microweber.com',NULL,1,0,100,NULL,1,0,NULL,0,0,'0.1',NULL,NULL,'content',NULL),(63,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Button',0,NULL,'btn',NULL,'{SITE_URL}userfiles/modules/btn/btn.svg','Microweber',NULL,NULL,NULL,1,1,7,NULL,1,0,NULL,1,0,'1.1',NULL,'{\"translatable_options\":[\"button_action\",\"button_onclick\",\"popupcontent\",\"url_blank\",\"icon\",\"text\",\"url\",\"link\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/btn\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Btn\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Btn\\\\Providers\\\\BtnServiceProvider\"]}','essentials',NULL),(64,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'FAQ',0,NULL,'faq',NULL,'{SITE_URL}userfiles/modules/faq/faq.svg','Microweber',NULL,NULL,NULL,1,1,57,NULL,1,0,NULL,0,0,'0.01',NULL,'{\"translatable_options\":[\"settings\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/faq\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Faq\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Faq\\\\Providers\\\\FaqServiceProvider\"]}','miscellaneous',NULL),(65,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Posts List',0,NULL,'posts',NULL,'{SITE_URL}userfiles/modules/posts/posts.svg','Microweber',NULL,NULL,NULL,1,1,20,NULL,1,0,NULL,1,0,'0.3',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/posts\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Posts\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Posts\\\\Providers\\\\PostsServiceProvider\"]}','essentials',NULL),(66,'2026-09-23 11:24:03','2026-09-23 11:24:02',NULL,NULL,NULL,'Newsletter',0,NULL,'newsletter',NULL,'{SITE_URL}userfiles/modules/newsletter/newsletter.svg','Microweber',NULL,NULL,NULL,1,1,55,NULL,1,1,NULL,0,0,'2.0',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/newsletter\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Newsletter\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Newsletter\\\\Providers\\\\NewsletterServiceProvider\"]}','marketing',NULL),(67,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Layouts',0,NULL,'layouts',NULL,'{SITE_URL}userfiles/modules/layouts/layouts.svg','Microweber',NULL,NULL,NULL,1,0,99,NULL,1,0,NULL,0,0,'0.1',NULL,'{\"translatable_options\":[\"title\",\"type\",\"icon\",\"view\"]}','content',NULL),(68,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Layouts - Preview All',0,NULL,'layouts/preview-all',NULL,'{SITE_URL}userfiles/modules/layouts/preview-all/icon.svg','Microweber',NULL,NULL,NULL,1,0,0,NULL,1,0,NULL,0,0,'0.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/layouts\\/preview-all\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Layouts\\\\PreviewAll\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Layouts\\\\PreviewAll\\\\Providers\\\\LayoutsPreviewAllServiceProvider\"]}','essentials',NULL),(69,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Cookie Notice',0,NULL,'cookie_notice',NULL,'{SITE_URL}userfiles/modules/cookie_notice/cookie_notice.svg','Ezyweb.uk',NULL,NULL,NULL,1,0,99,NULL,1,1,NULL,0,0,'0.1',NULL,NULL,'content',NULL),(70,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Inline Table',0,NULL,'inline_table','Microweber','{SITE_URL}userfiles/modules/inline_table/inline_table.svg','Inline table','http://microweber.com/',NULL,NULL,1,1,100,1,1,0,NULL,0,0,'1',NULL,NULL,'miscellaneous',NULL),(71,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Pages Menu',0,NULL,'pages',NULL,'{SITE_URL}userfiles/modules/pages/pages.svg','Microweber',NULL,NULL,NULL,1,1,28,NULL,1,0,NULL,1,0,'1.2',NULL,NULL,'navigation',NULL),(72,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Tweet Embed',0,NULL,'tweet_embed',NULL,'{SITE_URL}userfiles/modules/tweet_embed/tweet_embed.svg','Microweber',NULL,NULL,NULL,1,1,200,NULL,1,0,NULL,0,0,'1.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/tweet_embed\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\TweetEmbed\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\TweetEmbed\\\\Providers\\\\TweetEmbedServiceProvider\"]}','social',NULL),(73,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Users',0,NULL,'users',NULL,'{SITE_URL}userfiles/modules/users/users.svg','Microweber',NULL,NULL,NULL,1,0,9,NULL,1,1,NULL,1,0,'0.4',NULL,NULL,'users',NULL),(74,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Login',0,NULL,'users/login',NULL,'{SITE_URL}userfiles/modules/users/login/login.svg','Microweber',NULL,NULL,NULL,1,1,32,NULL,0,0,NULL,0,0,'0.2',NULL,NULL,'users',NULL),(75,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'User Address',0,NULL,'users/profile/address',NULL,'{SITE_URL}userfiles/modules/users/profile/address/address.svg','Bozhidar Slaveykov',NULL,NULL,NULL,1,0,9,NULL,1,0,NULL,0,0,'0.1',NULL,NULL,NULL,NULL),(76,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Registration',0,NULL,'users/register','Microweber','{SITE_URL}userfiles/modules/users/register/register.svg','Microweber','http://microweber.com/','http://microweber.info/modules/users/registration',NULL,1,1,33,NULL,1,0,NULL,0,0,'0.2',NULL,NULL,'users',NULL),(77,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Forgot password',0,NULL,'users/forgot_password','Microweber','{SITE_URL}userfiles/modules/users/forgot_password/forgot_password.svg','Microweber','http://microweber.com/','http://microweber.info/modules/users/registration',NULL,1,1,31,NULL,1,0,NULL,0,0,'0.2',NULL,NULL,'users',NULL),(78,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Video Background',0,NULL,'video_background',NULL,'{SITE_URL}userfiles/modules/video_background/video_background.svg','Microweber',NULL,NULL,NULL,1,0,38,NULL,1,0,NULL,0,0,'1',NULL,NULL,'video, background',NULL),(79,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Video',0,NULL,'video',NULL,'{SITE_URL}userfiles/modules/video/video.svg','Microweber',NULL,NULL,NULL,1,1,6,NULL,1,0,NULL,0,0,'1.2',NULL,'{\"allowed_html_option_keys\":[\"embed_url\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/video\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Video\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Video\\\\Providers\\\\VideoServiceProvider\"]}','media',NULL),(80,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Help',0,NULL,'help',NULL,'{SITE_URL}userfiles/modules/help/help.svg','Microweber',NULL,NULL,NULL,1,0,80,NULL,1,0,NULL,0,0,'0.3',NULL,NULL,'help',NULL),(81,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Spacer',0,NULL,'spacer','Microweber','{SITE_URL}userfiles/modules/spacer/spacer.svg','Microweber','http://microweber.com/','http://microweber.info/modules/spacer',NULL,1,1,3,NULL,1,0,NULL,0,0,'1.1',NULL,NULL,'essentials',NULL),(82,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Tags',0,NULL,'tags','Tags module for your posts!','{SITE_URL}userfiles/modules/tags/tags.svg','Bozhidar Slaveykov',NULL,NULL,NULL,1,1,100,NULL,1,1,NULL,0,0,'0.1',NULL,NULL,'miscellaneous',NULL),(83,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Highlight Code',0,NULL,'highlight_code',NULL,'{SITE_URL}userfiles/modules/highlight_code/highlight_code.svg','Microweber',NULL,NULL,NULL,1,1,700,NULL,1,0,NULL,0,0,'1.3',NULL,'{\"allowed_html_option_keys\":[\"text\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/highlight_code\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\HighlightCode\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\HighlightCode\\\\Providers\\\\HighlightCodeServiceProvider\"]}','other',NULL),(84,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Unlock Package',0,NULL,'unlock-package',NULL,'{SITE_URL}userfiles/modules/unlock-package/icon.svg','Microweber',NULL,NULL,NULL,1,0,999,NULL,1,0,NULL,0,0,'0.2',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/unlock-package\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\UnlockPackage\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\UnlockPackage\\\\Providers\\\\UnlockPackageServiceProvider\"]}','essentials',NULL),(85,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Notifications',0,NULL,'admin/notifications',NULL,'{SITE_URL}userfiles/modules/admin/notifications/notifications.svg','Microweber',NULL,NULL,NULL,1,0,1,NULL,1,1,NULL,1,0,'0.3',NULL,NULL,'admin',NULL),(86,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Backup',0,NULL,'admin/backup',NULL,'{SITE_URL}userfiles/modules/admin/backup/backup.svg','Microweber',NULL,NULL,NULL,1,0,99,NULL,1,1,NULL,0,0,'2',NULL,NULL,'admin',NULL),(87,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Import',0,NULL,'admin/old_import',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,99,NULL,1,0,NULL,0,0,'0.3',NULL,NULL,'admin',NULL),(88,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Content Export',0,NULL,'admin/content_export',NULL,'{SITE_URL}userfiles/modules/admin/content_export/content_export.svg','Microweber',NULL,NULL,NULL,1,0,99,NULL,1,0,NULL,0,0,'0.3',NULL,NULL,'admin',NULL),(89,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Admin Components - File Append',0,NULL,'admin/components/file_append',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,7,NULL,1,0,NULL,1,0,'1.1',NULL,'{\"translatable_options\":[\"append_files\"]}','essentials',NULL),(90,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Mail Templates',0,NULL,'admin/mail_templates',NULL,'{SITE_URL}userfiles/modules/admin/mail_templates/mail_templates.svg','Microweber',NULL,NULL,NULL,1,0,100,NULL,1,0,NULL,0,0,NULL,NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/admin\\/mail_templates\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\MailTemplates\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\MailTemplates\\\\MailTemplatesServiceProvider\"]}',NULL,NULL),(91,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Templates Settings',0,NULL,'admin/modules/templates_settings',NULL,'{SITE_URL}userfiles/modules/admin/modules/templates_settings/icon.svg','Microweber',NULL,NULL,NULL,1,0,0,NULL,1,0,NULL,1,0,'0.1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/admin\\/modules\\/templates_settings\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Admin\\\\Modules\\\\TemplatesSettings\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Admin\\\\Modules\\\\TemplatesSettings\\\\Providers\\\\TemplatesSettingsServiceProvider\"]}','essentials',NULL),(92,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Mail Providers',0,NULL,'admin/mail_providers',NULL,'{SITE_URL}userfiles/modules/admin/mail_providers/mail_providers.svg','Microweber',NULL,NULL,'mail_providers_configuration',1,0,100,NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),(93,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'MailerLite',0,NULL,'admin/mail_providers/mailerlite',NULL,'{SITE_URL}userfiles/modules/admin/mail_providers/mailerlite/mailerlite.svg','Microweber',NULL,NULL,'mail_provider',1,0,100,NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),(94,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'FlexMail',0,NULL,'admin/mail_providers/flexmail',NULL,'{SITE_URL}userfiles/modules/admin/mail_providers/flexmail/flexmail.svg','Microweber',NULL,NULL,'mail_provider',1,0,100,NULL,1,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL),(95,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Queue',0,NULL,'admin/mics/queue',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,NULL,NULL,1,0,NULL,1,0,'0.4',NULL,NULL,'admin',NULL),(96,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Import Export Tool',0,NULL,'admin/import_export_tool',NULL,'{SITE_URL}userfiles/modules/admin/import_export_tool/import_export_tool.svg','Microweber',NULL,NULL,NULL,1,0,99,NULL,1,1,NULL,0,0,'0.3',NULL,'{\"routes\":{\"admin\":\"admin.import-export-tool.index\"},\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/admin\\/import_export_tool\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Admin\\\\ImportExportTool\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Admin\\\\ImportExportTool\\\\ImportExportToolServiceProvider\"]}','admin',NULL),(97,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Menu',0,NULL,'menu','Navigation menu for pages and links.','{SITE_URL}userfiles/modules/menu/menu.svg','Microweber',NULL,NULL,NULL,1,1,27,NULL,1,1,NULL,0,0,'0.5',NULL,NULL,'essentials',NULL),(98,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Table',0,NULL,'table','Table builder','{SITE_URL}userfiles/modules/table/table.svg','Ezyweb.uk',NULL,NULL,NULL,1,0,99,NULL,1,0,NULL,0,0,'0.2',NULL,NULL,'essentials',NULL),(99,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Pop-Up',0,NULL,'popup',NULL,'{SITE_URL}userfiles/modules/popup/popup.svg','Microweber',NULL,NULL,NULL,1,1,36,NULL,1,0,NULL,0,0,'1.1',NULL,NULL,'miscellaneous',NULL),(100,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Social Links',0,NULL,'social_links',NULL,'{SITE_URL}userfiles/modules/social_links/social_links.svg','Microweber',NULL,NULL,NULL,1,1,9,NULL,1,0,NULL,0,0,'1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/social_links\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\SocialLinks\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\SocialLinks\\\\Providers\\\\SocialLinksServiceProvider\"]}','social',NULL),(101,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Skills',0,NULL,'skills',NULL,'{SITE_URL}userfiles/modules/skills/skills.svg','Microweber',NULL,NULL,NULL,1,1,41,NULL,1,0,NULL,0,0,'1.2',NULL,NULL,'other',NULL),(102,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Files',0,NULL,'files',NULL,'{SITE_URL}userfiles/modules/files/files.svg','Microweber',NULL,NULL,NULL,1,0,20,NULL,1,1,NULL,0,0,'0.2',NULL,NULL,'media',NULL),(103,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Google Maps',0,NULL,'google_maps',NULL,'{SITE_URL}userfiles/modules/google_maps/google_maps.svg','Microweber',NULL,NULL,NULL,1,1,19,NULL,1,0,NULL,0,0,'0.6',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/google_maps\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\GoogleMaps\\\\\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\GoogleMaps\\\\Providers\\\\GoogleMapsServiceProvider\"]}','essentials',NULL),(104,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Audio',0,NULL,'audio','Microweber','{SITE_URL}userfiles/modules/audio/audio.svg','Microweber','http://microweber.com/','http://microweber.info/modules/audio',NULL,1,1,30,NULL,1,0,NULL,0,0,'0.20',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/audio\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Audio\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Audio\\\\Providers\\\\AudioServiceProvider\"]}','media',NULL),(105,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Schema.org',0,NULL,'schema_org','Microweber','{SITE_URL}userfiles/modules/default.svg','Bozhidar Slaveykov','http://microweber.com/',NULL,NULL,1,0,100,NULL,1,0,NULL,0,0,'1',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/schema_org\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\SchemaOrg\"}]}','miscellaneous',NULL),(106,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Captcha',0,NULL,'captcha',NULL,'{SITE_URL}userfiles/modules/captcha/captcha.svg','Microweber',NULL,NULL,NULL,1,0,99,NULL,0,1,NULL,0,0,'0.1',NULL,NULL,'users',NULL),(107,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Custom fields',0,NULL,'custom_fields',NULL,'{SITE_URL}userfiles/modules/custom_fields/custom_fields.svg','Microweber',NULL,NULL,NULL,1,0,15,NULL,1,0,NULL,1,0,NULL,NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/custom_fields\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\CustomFields\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\CustomFields\\\\Providers\\\\CustomFieldsServiceProvider\"]}',NULL,NULL),(108,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Slider (Deprecated)',0,NULL,'slider',NULL,'{SITE_URL}userfiles/modules/slider/slider.svg','Microweber',NULL,NULL,NULL,1,0,18,NULL,1,0,NULL,0,0,'0.2',NULL,'{\"translatable_options\":[\"settings\"],\"allowed_html_option_keys\":[\"settings\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/slider\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Slider\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Slider\\\\Providers\\\\SliderServiceProvider\"]}','media',NULL),(109,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Team Card',0,NULL,'teamcard',NULL,'{SITE_URL}userfiles/modules/teamcard/teamcard.svg','Microweber',NULL,NULL,NULL,1,1,57,NULL,1,0,NULL,0,0,'0.2',NULL,'{\"translatable_options\":[\"settings\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/teamcard\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Teamcard\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Teamcard\\\\Providers\\\\TeamcardServiceProvider\"]}','miscellaneous',NULL),(110,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Testimonials',0,NULL,'testimonials',NULL,'{SITE_URL}userfiles/modules/testimonials/testimonials.svg','Microweber',NULL,NULL,NULL,1,1,99,NULL,1,1,NULL,0,0,'0.4',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/testimonials\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Testimonials\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Testimonials\\\\Providers\\\\TestimonialsServiceProvider\"]}','miscellaneous',NULL),(111,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Settings',0,NULL,'settings',NULL,'{SITE_URL}userfiles/modules/settings/settings.svg','Microweber',NULL,NULL,NULL,1,0,4,NULL,1,0,NULL,1,0,'0.4',NULL,'{\"routes\":{\"admin\":\"admin.settings.index\"},\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/settings\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Settings\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Settings\\\\Providers\\\\SettingsServiceProvider\"]}','admin',NULL),(112,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Website Settings',0,NULL,'settings/group/website',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,400,NULL,1,0,NULL,1,0,'0.3',NULL,'{\"translatable_options\":[\"website_title\",\"website_description\",\"website_keywords\"]}','admin',NULL),(113,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Picture',0,NULL,'picture','Picture','{SITE_URL}userfiles/modules/picture/picture.svg','Microweber',NULL,NULL,NULL,1,1,3,1,1,0,NULL,0,0,'0.25',NULL,NULL,'essentials','picture,gallery,images,photos,slider,carousel,lightbox,photo,pictures'),(114,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Text Type Animation',0,NULL,'text-type',NULL,'{SITE_URL}userfiles/modules/text-type/text-type.svg','Microweber',NULL,NULL,NULL,1,1,39,NULL,1,0,NULL,0,0,'1',NULL,'{\"allowed_html_option_keys\":[\"text\"],\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/text-type\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\TextType\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\TextType\\\\Providers\\\\TextTypeServiceProvider\"]}','miscellaneous',NULL),(115,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Title',0,NULL,'title','Microweber','{SITE_URL}userfiles/modules/title/title.svg','Microweber','http://microweber.com/','http://microweber.info/modules/title',NULL,1,1,1,1,1,0,NULL,0,0,'0.2',NULL,NULL,'essentials',NULL),(116,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Examples of Microweber UI',0,NULL,'example_ui',NULL,'{SITE_URL}userfiles/modules/default.svg','Microweber',NULL,NULL,NULL,1,0,999,NULL,1,0,NULL,0,0,'0.2',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/example_ui\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\ExampleUi\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\ExampleUi\\\\Providers\\\\ExampleUiServiceProvider\"]}','miscellaneous',NULL),(117,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Comments',0,NULL,'comments',NULL,'{SITE_URL}userfiles/modules/comments/comments.svg','Microweber',NULL,NULL,NULL,1,1,200,NULL,1,1,1,0,0,'1.2',NULL,'{\"routes\":{\"admin\":\"admin.comments.index\"},\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/comments\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Comments\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Comments\\\\Providers\\\\CommentsServiceProvider\"]}','content',NULL),(118,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Blog',0,NULL,'blog',NULL,'{SITE_URL}userfiles/modules/blog/blog.svg','Microweber',NULL,NULL,NULL,1,1,200,NULL,1,1,NULL,1,0,'0.2',NULL,'{\"service_provider\":[\"MicroweberPackages\\\\Blog\\\\BlogServiceProvider\"]}','content',NULL),(119,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Background Image',0,NULL,'background','Microweber','{SITE_URL}userfiles/modules/background/background.svg','Microweber','http://microweber.com/','http://microweber.com/modules/background',NULL,1,0,333,NULL,1,0,NULL,0,0,'1.2',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/background\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Background\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Background\\\\Providers\\\\BackgroundImageServiceProvider\"]}','media',NULL),(120,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Cloudflare',0,NULL,'cloudflare','Microweber','{SITE_URL}userfiles/modules/default.svg','Bozhidar Slaveykov','http://microweber.com/',NULL,NULL,1,0,100,NULL,1,0,NULL,0,0,'1',NULL,NULL,'miscellaneous',NULL),(121,'2026-09-23 11:24:03','2026-09-23 11:24:03',NULL,NULL,NULL,'Search',0,NULL,'search','Module to search for content','{SITE_URL}userfiles/modules/search/search.svg','Microweber','http://microweber.com/','http://microweber.info/modules/search',NULL,1,1,34,NULL,1,0,NULL,0,0,'0.2',NULL,'{\"autoload_namespace\":[{\"path\":\"\\/var\\/www\\/html\\/userfiles\\/modules\\/search\\/src\\/\",\"namespace\":\"MicroweberPackages\\\\Modules\\\\Search\"}],\"service_provider\":[\"MicroweberPackages\\\\Modules\\\\Search\\\\Providers\\\\SearchServiceProvider\"]}','miscellaneous',NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multilanguage_supported_locales`
--

DROP TABLE IF EXISTS `multilanguage_supported_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `multilanguage_supported_locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `display_locale` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_icon` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `multilanguage_supported_locales_locale_index` (`locale`),
  KEY `multilanguage_supported_locales_language_index` (`language`),
  KEY `multilanguage_supported_locales_is_active_index` (`is_active`),
  KEY `multilanguage_supported_locales_display_locale_index` (`display_locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multilanguage_supported_locales`
--

LOCK TABLES `multilanguage_supported_locales` WRITE;
/*!40000 ALTER TABLE `multilanguage_supported_locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `multilanguage_supported_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multilanguage_translations`
--

DROP TABLE IF EXISTS `multilanguage_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `multilanguage_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_id` varchar(255) NOT NULL,
  `rel_type` varchar(255) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_value` text DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `multilanguage_translations_locale_index` (`locale`),
  KEY `multilanguage_translations_rel_id_index` (`rel_id`),
  KEY `multilanguage_translations_rel_type_index` (`rel_type`),
  KEY `multilanguage_translations_field_name_index` (`field_name`),
  FULLTEXT KEY `multilanguage_translations_field_value_fulltext` (`field_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multilanguage_translations`
--

LOCK TABLES `multilanguage_translations` WRITE;
/*!40000 ALTER TABLE `multilanguage_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `multilanguage_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_campaigns`
--

DROP TABLE IF EXISTS `newsletter_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `from_name` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `email_template_id` int(11) DEFAULT NULL,
  `list_id` int(11) DEFAULT NULL,
  `sender_account_id` int(11) DEFAULT NULL,
  `sending_limit_per_day` int(11) DEFAULT NULL,
  `is_scheduled` int(11) DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `is_done` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_campaigns`
--

LOCK TABLES `newsletter_campaigns` WRITE;
/*!40000 ALTER TABLE `newsletter_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_campaigns_send_log`
--

DROP TABLE IF EXISTS `newsletter_campaigns_send_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_campaigns_send_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `subscriber_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_sent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_campaigns_send_log`
--

LOCK TABLES `newsletter_campaigns_send_log` WRITE;
/*!40000 ALTER TABLE `newsletter_campaigns_send_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_campaigns_send_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_lists`
--

DROP TABLE IF EXISTS `newsletter_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `success_email_template_id` int(11) DEFAULT NULL,
  `success_sender_account_id` int(11) DEFAULT NULL,
  `unsubscription_sender_account_id` int(11) DEFAULT NULL,
  `unsubscription_email_template_id` int(11) DEFAULT NULL,
  `confirmation_email_template_id` int(11) DEFAULT NULL,
  `confirmation_sender_account_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_lists`
--

LOCK TABLES `newsletter_lists` WRITE;
/*!40000 ALTER TABLE `newsletter_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_sender_accounts`
--

DROP TABLE IF EXISTS `newsletter_sender_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_sender_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `from_name` text DEFAULT NULL,
  `from_email` text DEFAULT NULL,
  `reply_email` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `account_type` text DEFAULT NULL,
  `smtp_username` text DEFAULT NULL,
  `smtp_password` text DEFAULT NULL,
  `smtp_host` text DEFAULT NULL,
  `smtp_port` text DEFAULT NULL,
  `mailchimp_secret` text DEFAULT NULL,
  `mailgun_domain` text DEFAULT NULL,
  `mailgun_secret` text DEFAULT NULL,
  `mandrill_secret` text DEFAULT NULL,
  `sparkpost_secret` text DEFAULT NULL,
  `amazon_ses_key` text DEFAULT NULL,
  `amazon_ses_secret` text DEFAULT NULL,
  `amazon_ses_region` text DEFAULT NULL,
  `account_pass` text DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_sender_accounts`
--

LOCK TABLES `newsletter_sender_accounts` WRITE;
/*!40000 ALTER TABLE `newsletter_sender_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_sender_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscribers`
--

DROP TABLE IF EXISTS `newsletter_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `confirmation_code` text DEFAULT NULL,
  `is_subscribed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscribers`
--

LOCK TABLES `newsletter_subscribers` WRITE;
/*!40000 ALTER TABLE `newsletter_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscribers_lists`
--

DROP TABLE IF EXISTS `newsletter_subscribers_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_subscribers_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) DEFAULT NULL,
  `list_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscribers_lists`
--

LOCK TABLES `newsletter_subscribers_lists` WRITE;
/*!40000 ALTER TABLE `newsletter_subscribers_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscribers_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_templates`
--

DROP TABLE IF EXISTS `newsletter_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_templates`
--

LOCK TABLES `newsletter_templates` WRITE;
/*!40000 ALTER TABLE `newsletter_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_templates` ENABLE KEYS */;
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
-- Table structure for table `notifications_mails_log`
--

DROP TABLE IF EXISTS `notifications_mails_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_mails_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` varchar(255) NOT NULL,
  `html` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_mails_log`
--

LOCK TABLES `notifications_mails_log` WRITE;
/*!40000 ALTER TABLE `notifications_mails_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_mails_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `price_id` int(11) DEFAULT NULL,
  `offer_price` double(8,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `option_key` varchar(255) DEFAULT NULL,
  `option_value` longtext DEFAULT NULL,
  `option_key2` varchar(255) DEFAULT NULL,
  `option_value2` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `option_group` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `field_type` varchar(255) DEFAULT NULL,
  `field_values` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `is_system` int(11) DEFAULT NULL,
  `option_value_prev` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'2026-09-23 11:24:03','2026-09-23 11:24:03','current_template',NULL,NULL,NULL,NULL,'template',NULL,NULL,NULL,NULL,NULL,1,NULL),(2,'2026-09-23 11:24:03','2026-09-23 11:24:03','website_title','Microweber',NULL,NULL,NULL,'website',NULL,NULL,NULL,NULL,NULL,1,NULL),(4,NULL,NULL,'shipping_gw_shop/shipping/gateways/country','y',NULL,NULL,NULL,'shipping',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,'payment_gw_shop/payments/gateways/paypal','1',NULL,NULL,NULL,'payments',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,'currency','USD',NULL,NULL,NULL,'payments',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
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
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
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
-- Table structure for table `stats_browser_agents`
--

DROP TABLE IF EXISTS `stats_browser_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_browser_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `browser_agent` text DEFAULT NULL,
  `browser_agent_hash` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `platform_version` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `browser_version` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `is_desktop` int(11) DEFAULT NULL,
  `is_mobile` int(11) DEFAULT NULL,
  `is_phone` int(11) DEFAULT NULL,
  `is_tablet` int(11) DEFAULT NULL,
  `robot_name` text DEFAULT NULL,
  `is_robot` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_browser_agents`
--

LOCK TABLES `stats_browser_agents` WRITE;
/*!40000 ALTER TABLE `stats_browser_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_browser_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_events`
--

DROP TABLE IF EXISTS `stats_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_category` varchar(255) DEFAULT NULL,
  `event_action` varchar(255) DEFAULT NULL,
  `event_label` varchar(255) DEFAULT NULL,
  `event_value` int(11) DEFAULT NULL,
  `utm_source` varchar(255) DEFAULT NULL,
  `utm_medium` varchar(255) DEFAULT NULL,
  `utm_campaign` varchar(255) DEFAULT NULL,
  `utm_term` varchar(255) DEFAULT NULL,
  `utm_content` varchar(255) DEFAULT NULL,
  `utm_visitor_id` varchar(255) DEFAULT NULL,
  `event_data` text DEFAULT NULL,
  `event_timestamp` datetime DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `is_sent` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_events`
--

LOCK TABLES `stats_events` WRITE;
/*!40000 ALTER TABLE `stats_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_geoip`
--

DROP TABLE IF EXISTS `stats_geoip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_geoip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_geoip`
--

LOCK TABLES `stats_geoip` WRITE;
/*!40000 ALTER TABLE `stats_geoip` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_geoip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_referrers`
--

DROP TABLE IF EXISTS `stats_referrers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_referrers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `referrer` text DEFAULT NULL,
  `referrer_hash` varchar(255) DEFAULT NULL,
  `referrer_domain_id` int(11) DEFAULT NULL,
  `referrer_path_id` int(11) DEFAULT NULL,
  `is_internal` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_referrers`
--

LOCK TABLES `stats_referrers` WRITE;
/*!40000 ALTER TABLE `stats_referrers` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_referrers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_referrers_domains`
--

DROP TABLE IF EXISTS `stats_referrers_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_referrers_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `referrer_domain` text DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_referrers_domains`
--

LOCK TABLES `stats_referrers_domains` WRITE;
/*!40000 ALTER TABLE `stats_referrers_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_referrers_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_referrers_paths`
--

DROP TABLE IF EXISTS `stats_referrers_paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_referrers_paths` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `referrer_domain_id` int(11) DEFAULT NULL,
  `referrer_path` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_referrers_paths`
--

LOCK TABLES `stats_referrers_paths` WRITE;
/*!40000 ALTER TABLE `stats_referrers_paths` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_referrers_paths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_sessions`
--

DROP TABLE IF EXISTS `stats_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `session_hostname` varchar(255) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `browser_id` int(11) DEFAULT NULL,
  `referrer_id` int(11) DEFAULT NULL,
  `referrer_domain_id` int(11) DEFAULT NULL,
  `referrer_path_id` int(11) DEFAULT NULL,
  `geoip_id` int(11) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_sessions`
--

LOCK TABLES `stats_sessions` WRITE;
/*!40000 ALTER TABLE `stats_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_urls`
--

DROP TABLE IF EXISTS `stats_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `url_hash` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_urls`
--

LOCK TABLES `stats_urls` WRITE;
/*!40000 ALTER TABLE `stats_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_visits_log`
--

DROP TABLE IF EXISTS `stats_visits_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats_visits_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url_id` int(11) DEFAULT NULL,
  `referrer_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `session_id_key` int(11) DEFAULT NULL,
  `view_count` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_visits_log`
--

LOCK TABLES `stats_visits_log` WRITE;
/*!40000 ALTER TABLE `stats_visits_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_visits_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_licenses`
--

DROP TABLE IF EXISTS `system_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_licenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `rel_type` text DEFAULT NULL,
  `rel_id` text DEFAULT NULL,
  `local_key` text DEFAULT NULL,
  `local_key_hash` text DEFAULT NULL,
  `registered_name` text DEFAULT NULL,
  `company_name` text DEFAULT NULL,
  `domains` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `billing_cycle` text DEFAULT NULL,
  `reg_on` datetime DEFAULT NULL,
  `due_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_licenses`
--

LOCK TABLES `system_licenses` WRITE;
/*!40000 ALTER TABLE `system_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tag_groups`
--

DROP TABLE IF EXISTS `tagging_tag_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagging_tag_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(125) NOT NULL,
  `name` varchar(125) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tag_groups_slug_index` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tag_groups`
--

LOCK TABLES `tagging_tag_groups` WRITE;
/*!40000 ALTER TABLE `tagging_tag_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tag_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tagged`
--

DROP TABLE IF EXISTS `tagging_tagged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagging_tagged` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taggable_id` int(10) unsigned NOT NULL,
  `taggable_type` varchar(125) NOT NULL,
  `tag_name` varchar(125) NOT NULL,
  `tag_slug` varchar(125) NOT NULL,
  `tag_description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tagged_taggable_id_index` (`taggable_id`),
  KEY `tagging_tagged_taggable_type_index` (`taggable_type`),
  KEY `tagging_tagged_tag_slug_index` (`tag_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tagged`
--

LOCK TABLES `tagging_tagged` WRITE;
/*!40000 ALTER TABLE `tagging_tagged` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tagged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tags`
--

DROP TABLE IF EXISTS `tagging_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagging_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(125) NOT NULL,
  `name` varchar(125) NOT NULL,
  `suggest` tinyint(1) NOT NULL DEFAULT 0,
  `count` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_group_id` int(10) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `locale` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tags_slug_index` (`slug`),
  KEY `tagging_tags_tag_group_id_foreign` (`tag_group_id`),
  CONSTRAINT `tagging_tags_tag_group_id_foreign` FOREIGN KEY (`tag_group_id`) REFERENCES `tagging_tag_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tags`
--

LOCK TABLES `tagging_tags` WRITE;
/*!40000 ALTER TABLE `tagging_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_types`
--

DROP TABLE IF EXISTS `tax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `compound_tax` tinyint(4) NOT NULL DEFAULT 0,
  `collective_tax` tinyint(4) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_types`
--

LOCK TABLES `tax_types` WRITE;
/*!40000 ALTER TABLE `tax_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms_accept_log`
--

DROP TABLE IF EXISTS `terms_accept_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms_accept_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `tos_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_ip` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms_accept_log`
--

LOCK TABLES `terms_accept_log` WRITE;
/*!40000 ALTER TABLE `terms_accept_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms_accept_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `read_more_url` text DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `project_name` text DEFAULT NULL,
  `client_company` text DEFAULT NULL,
  `client_role` text DEFAULT NULL,
  `client_picture` text DEFAULT NULL,
  `client_website` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translation_keys`
--

DROP TABLE IF EXISTS `translation_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `translation_keys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `translation_namespace` varchar(255) DEFAULT NULL,
  `translation_group` varchar(255) NOT NULL,
  `translation_key` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `translation_keys_translation_group_index` (`translation_group`),
  KEY `translation_keys_translation_namespace_index` (`translation_namespace`),
  KEY `translation_keys_translation_key_index` (`translation_key`(1024))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation_keys`
--

LOCK TABLES `translation_keys` WRITE;
/*!40000 ALTER TABLE `translation_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translation_texts`
--

DROP TABLE IF EXISTS `translation_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `translation_texts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `translation_key_id` int(11) NOT NULL,
  `translation_text` text NOT NULL,
  `translation_locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translation_texts_translation_key_id_index` (`translation_key_id`),
  KEY `translation_texts_translation_text_index` (`translation_text`(1024)),
  KEY `translation_texts_translation_locale_index` (`translation_locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation_texts`
--

LOCK TABLES `translation_texts` WRITE;
/*!40000 ALTER TABLE `translation_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `is_verified` int(11) DEFAULT NULL,
  `is_public` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `basic_mode` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `user_information` text DEFAULT NULL,
  `subscr_id` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `oauth_uid` varchar(255) DEFAULT NULL,
  `oauth_provider` varchar(255) DEFAULT NULL,
  `oauth_token` text DEFAULT NULL,
  `oauth_token_secret` text DEFAULT NULL,
  `profile_url` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `password_reset_hash` varchar(255) DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$r0pcaLjCtuCqEodrWb2ASedt9BHFb64ztGrZcrOmcEOK9OLSMALiO','admin@benchmark.local',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-09-23 11:24:10','2026-09-23 11:24:10',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_oauth`
--

DROP TABLE IF EXISTS `users_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_oauth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `data_id` varchar(255) DEFAULT NULL,
  `data_name` varchar(255) DEFAULT NULL,
  `data_email` varchar(255) DEFAULT NULL,
  `data_token` varchar(255) DEFAULT NULL,
  `data_avatar` varchar(255) DEFAULT NULL,
  `data_raw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_oauth`
--

LOCK TABLES `users_oauth` WRITE;
/*!40000 ALTER TABLE `users_oauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_oauth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23 11:24:23
