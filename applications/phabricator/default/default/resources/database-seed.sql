/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: phabricator_almanac
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
-- Current Database: `phabricator_almanac`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_almanac` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_almanac`;

--
-- Table structure for table `almanac_binding`
--

DROP TABLE IF EXISTS `almanac_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_binding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `servicePHID` varbinary(64) NOT NULL,
  `devicePHID` varbinary(64) NOT NULL,
  `interfacePHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_service` (`servicePHID`,`interfacePHID`),
  KEY `key_device` (`devicePHID`),
  KEY `key_interface` (`interfacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_binding`
--

LOCK TABLES `almanac_binding` WRITE;
/*!40000 ALTER TABLE `almanac_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_binding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_bindingtransaction`
--

DROP TABLE IF EXISTS `almanac_bindingtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_bindingtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_bindingtransaction`
--

LOCK TABLES `almanac_bindingtransaction` WRITE;
/*!40000 ALTER TABLE `almanac_bindingtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_bindingtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_device`
--

DROP TABLE IF EXISTS `almanac_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `nameIndex` binary(12) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `isBoundToClusterService` tinyint(1) NOT NULL,
  `status` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_name` (`nameIndex`),
  KEY `key_nametext` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_device`
--

LOCK TABLES `almanac_device` WRITE;
/*!40000 ALTER TABLE `almanac_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_devicename_ngrams`
--

DROP TABLE IF EXISTS `almanac_devicename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_devicename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_devicename_ngrams`
--

LOCK TABLES `almanac_devicename_ngrams` WRITE;
/*!40000 ALTER TABLE `almanac_devicename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_devicename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_devicetransaction`
--

DROP TABLE IF EXISTS `almanac_devicetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_devicetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_devicetransaction`
--

LOCK TABLES `almanac_devicetransaction` WRITE;
/*!40000 ALTER TABLE `almanac_devicetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_devicetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_interface`
--

DROP TABLE IF EXISTS `almanac_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_interface` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `devicePHID` varbinary(64) NOT NULL,
  `networkPHID` varbinary(64) NOT NULL,
  `address` varchar(64) NOT NULL,
  `port` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_unique` (`devicePHID`,`networkPHID`,`address`,`port`),
  KEY `key_location` (`networkPHID`,`address`,`port`),
  KEY `key_device` (`devicePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_interface`
--

LOCK TABLES `almanac_interface` WRITE;
/*!40000 ALTER TABLE `almanac_interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_interfacetransaction`
--

DROP TABLE IF EXISTS `almanac_interfacetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_interfacetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_interfacetransaction`
--

LOCK TABLES `almanac_interfacetransaction` WRITE;
/*!40000 ALTER TABLE `almanac_interfacetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_interfacetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_namespace`
--

DROP TABLE IF EXISTS `almanac_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_namespace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `nameIndex` binary(12) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_nameindex` (`nameIndex`),
  KEY `key_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_namespace`
--

LOCK TABLES `almanac_namespace` WRITE;
/*!40000 ALTER TABLE `almanac_namespace` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_namespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_namespacename_ngrams`
--

DROP TABLE IF EXISTS `almanac_namespacename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_namespacename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_namespacename_ngrams`
--

LOCK TABLES `almanac_namespacename_ngrams` WRITE;
/*!40000 ALTER TABLE `almanac_namespacename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_namespacename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_namespacetransaction`
--

DROP TABLE IF EXISTS `almanac_namespacetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_namespacetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_namespacetransaction`
--

LOCK TABLES `almanac_namespacetransaction` WRITE;
/*!40000 ALTER TABLE `almanac_namespacetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_namespacetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_network`
--

DROP TABLE IF EXISTS `almanac_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_network` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_network`
--

LOCK TABLES `almanac_network` WRITE;
/*!40000 ALTER TABLE `almanac_network` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_networkname_ngrams`
--

DROP TABLE IF EXISTS `almanac_networkname_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_networkname_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_networkname_ngrams`
--

LOCK TABLES `almanac_networkname_ngrams` WRITE;
/*!40000 ALTER TABLE `almanac_networkname_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_networkname_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_networktransaction`
--

DROP TABLE IF EXISTS `almanac_networktransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_networktransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_networktransaction`
--

LOCK TABLES `almanac_networktransaction` WRITE;
/*!40000 ALTER TABLE `almanac_networktransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_networktransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_property`
--

DROP TABLE IF EXISTS `almanac_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldName` varchar(128) NOT NULL,
  `fieldValue` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_property`
--

LOCK TABLES `almanac_property` WRITE;
/*!40000 ALTER TABLE `almanac_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_service`
--

DROP TABLE IF EXISTS `almanac_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `nameIndex` binary(12) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `serviceType` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_name` (`nameIndex`),
  KEY `key_nametext` (`name`),
  KEY `key_servicetype` (`serviceType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_service`
--

LOCK TABLES `almanac_service` WRITE;
/*!40000 ALTER TABLE `almanac_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_servicename_ngrams`
--

DROP TABLE IF EXISTS `almanac_servicename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_servicename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_servicename_ngrams`
--

LOCK TABLES `almanac_servicename_ngrams` WRITE;
/*!40000 ALTER TABLE `almanac_servicename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_servicename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_servicetransaction`
--

DROP TABLE IF EXISTS `almanac_servicetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `almanac_servicetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_servicetransaction`
--

LOCK TABLES `almanac_servicetransaction` WRITE;
/*!40000 ALTER TABLE `almanac_servicetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_servicetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_application`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_application` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_application`;

--
-- Table structure for table `application_application`
--

DROP TABLE IF EXISTS `application_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_application`
--

LOCK TABLES `application_application` WRITE;
/*!40000 ALTER TABLE `application_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_applicationtransaction`
--

DROP TABLE IF EXISTS `application_applicationtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_applicationtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_applicationtransaction`
--

LOCK TABLES `application_applicationtransaction` WRITE;
/*!40000 ALTER TABLE `application_applicationtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_applicationtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_audit`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_audit`;

--
-- Table structure for table `audit_transaction`
--

DROP TABLE IF EXISTS `audit_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_transaction`
--

LOCK TABLES `audit_transaction` WRITE;
/*!40000 ALTER TABLE `audit_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_transaction_comment`
--

DROP TABLE IF EXISTS `audit_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `commitPHID` varbinary(64) DEFAULT NULL,
  `pathID` int(10) unsigned DEFAULT NULL,
  `isNewFile` tinyint(1) NOT NULL,
  `lineNumber` int(10) unsigned NOT NULL,
  `lineLength` int(10) unsigned NOT NULL,
  `fixedState` varchar(12) DEFAULT NULL,
  `hasReplies` tinyint(1) NOT NULL,
  `replyToCommentPHID` varbinary(64) DEFAULT NULL,
  `legacyCommentID` int(10) unsigned DEFAULT NULL,
  `attributes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  KEY `key_path` (`pathID`),
  KEY `key_draft` (`authorPHID`,`transactionPHID`),
  KEY `key_commit` (`commitPHID`),
  KEY `key_legacy` (`legacyCommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_transaction_comment`
--

LOCK TABLES `audit_transaction_comment` WRITE;
/*!40000 ALTER TABLE `audit_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_auth`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_auth` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_auth`;

--
-- Table structure for table `auth_challenge`
--

DROP TABLE IF EXISTS `auth_challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_challenge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `factorPHID` varbinary(64) NOT NULL,
  `sessionPHID` varbinary(64) NOT NULL,
  `challengeKey` varchar(255) NOT NULL,
  `challengeTTL` int(10) unsigned NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `workflowKey` varchar(255) NOT NULL,
  `responseDigest` varchar(255) DEFAULT NULL,
  `responseTTL` int(10) unsigned DEFAULT NULL,
  `isCompleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_issued` (`userPHID`,`challengeTTL`),
  KEY `key_collection` (`challengeTTL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_challenge`
--

LOCK TABLES `auth_challenge` WRITE;
/*!40000 ALTER TABLE `auth_challenge` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_challenge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_contactnumber`
--

DROP TABLE IF EXISTS `auth_contactnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_contactnumber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `contactNumber` varchar(255) NOT NULL,
  `status` varchar(32) NOT NULL,
  `properties` longtext NOT NULL,
  `uniqueKey` binary(12) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isPrimary` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_unique` (`uniqueKey`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_contactnumber`
--

LOCK TABLES `auth_contactnumber` WRITE;
/*!40000 ALTER TABLE `auth_contactnumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_contactnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_contactnumbertransaction`
--

DROP TABLE IF EXISTS `auth_contactnumbertransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_contactnumbertransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_contactnumbertransaction`
--

LOCK TABLES `auth_contactnumbertransaction` WRITE;
/*!40000 ALTER TABLE `auth_contactnumbertransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_contactnumbertransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_factorconfig`
--

DROP TABLE IF EXISTS `auth_factorconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_factorconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `factorName` longtext NOT NULL,
  `factorSecret` longtext NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `factorProviderPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_user` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_factorconfig`
--

LOCK TABLES `auth_factorconfig` WRITE;
/*!40000 ALTER TABLE `auth_factorconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_factorconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_factorprovider`
--

DROP TABLE IF EXISTS `auth_factorprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_factorprovider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `providerFactorKey` varchar(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_factorprovider`
--

LOCK TABLES `auth_factorprovider` WRITE;
/*!40000 ALTER TABLE `auth_factorprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_factorprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_factorprovidertransaction`
--

DROP TABLE IF EXISTS `auth_factorprovidertransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_factorprovidertransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_factorprovidertransaction`
--

LOCK TABLES `auth_factorprovidertransaction` WRITE;
/*!40000 ALTER TABLE `auth_factorprovidertransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_factorprovidertransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_hmackey`
--

DROP TABLE IF EXISTS `auth_hmackey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_hmackey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyName` varchar(64) NOT NULL,
  `keyValue` varchar(128) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_name` (`keyName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_hmackey`
--

LOCK TABLES `auth_hmackey` WRITE;
/*!40000 ALTER TABLE `auth_hmackey` DISABLE KEYS */;
INSERT INTO `auth_hmackey` VALUES (1,'csrf.alternate','865f1f96245bb05d3dfe883ebfff423051ba7d57fc8677ccaf64abb1e7eb92878740afb74cc2c501a88915a62014c2c2ac8888270a710b9ffb0a81b979406615',1790768765,1790768765),(2,'csrf','6ee404cf7a832b615554bb16ffcdd1afdcecf9b15f34ca0d99e092a1b07ed688bd394585aacb2b928ab5df472f6e7ba39a8bc8f6e351568aefdb2496e5e5b99e',1790768769,1790768769),(3,'file.integrity','e763fd5aa48173dd03d3360c278b43092b304d158bd6582edbed6fbce9ae08828faad25a2f3f1e198267e186e7a969a742bab056a6a5427941900c1402c9b49a',1790768769,1790768769),(4,'session.digest','79ecacca6b004f3ebf92ef3388c7bb75ad30e312d27d2e06eea5787a1b9cab5b5728339d3235c16f8a1bef976855610244f018602f91497996e7f9bd8f6bfc61',1790768776,1790768776);
/*!40000 ALTER TABLE `auth_hmackey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `messageKey` varchar(64) NOT NULL,
  `messageText` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_type` (`messageKey`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_messagetransaction`
--

DROP TABLE IF EXISTS `auth_messagetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_messagetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_messagetransaction`
--

LOCK TABLES `auth_messagetransaction` WRITE;
/*!40000 ALTER TABLE `auth_messagetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_messagetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_password`
--

DROP TABLE IF EXISTS `auth_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_password` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `passwordType` varchar(64) NOT NULL,
  `passwordHash` varchar(128) NOT NULL,
  `isRevoked` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `passwordSalt` varchar(64) NOT NULL,
  `legacyDigestFormat` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_role` (`objectPHID`,`passwordType`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_password`
--

LOCK TABLES `auth_password` WRITE;
/*!40000 ALTER TABLE `auth_password` DISABLE KEYS */;
INSERT INTO `auth_password` VALUES (1,'PHID-APAS-nxltdzl4dtubvxqpwh2d','PHID-USER-bfbqcgqfuuqhgalc72mp','account','bcrypt:$2y$11$IE8D2kJBipKqM05HGpP1u.mJ5PCY/U.hgtjIA.bMu2tEuRkRMG3GO',0,1790768868,1790768868,'fj7guhvt6ykw7fp3az742tfzclebz3gtm6hrg35t357rynyhvggrbcgcj56vnqao',NULL);
/*!40000 ALTER TABLE `auth_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_passwordtransaction`
--

DROP TABLE IF EXISTS `auth_passwordtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_passwordtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_passwordtransaction`
--

LOCK TABLES `auth_passwordtransaction` WRITE;
/*!40000 ALTER TABLE `auth_passwordtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_passwordtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_providerconfig`
--

DROP TABLE IF EXISTS `auth_providerconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_providerconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `providerClass` varchar(128) NOT NULL,
  `providerType` varchar(32) NOT NULL,
  `providerDomain` varchar(128) NOT NULL,
  `isEnabled` tinyint(1) NOT NULL,
  `shouldAllowLogin` tinyint(1) NOT NULL,
  `shouldAllowRegistration` tinyint(1) NOT NULL,
  `shouldAllowLink` tinyint(1) NOT NULL,
  `shouldAllowUnlink` tinyint(1) NOT NULL,
  `shouldTrustEmails` tinyint(1) NOT NULL DEFAULT 0,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `shouldAutoLogin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_provider` (`providerType`,`providerDomain`),
  KEY `key_class` (`providerClass`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_providerconfig`
--

LOCK TABLES `auth_providerconfig` WRITE;
/*!40000 ALTER TABLE `auth_providerconfig` DISABLE KEYS */;
INSERT INTO `auth_providerconfig` VALUES (1,'PHID-AUTH-uuclgbk7ztekk6jclew3','PhabricatorPasswordAuthProvider','password','self',1,1,1,1,1,0,'[]',1790768858,1790768858,0);
/*!40000 ALTER TABLE `auth_providerconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_providerconfigtransaction`
--

DROP TABLE IF EXISTS `auth_providerconfigtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_providerconfigtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_providerconfigtransaction`
--

LOCK TABLES `auth_providerconfigtransaction` WRITE;
/*!40000 ALTER TABLE `auth_providerconfigtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_providerconfigtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sshkey`
--

DROP TABLE IF EXISTS `auth_sshkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sshkey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `keyType` varchar(255) NOT NULL,
  `keyBody` longtext NOT NULL,
  `keyComment` varchar(255) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `keyIndex` binary(12) NOT NULL,
  `isTrusted` tinyint(1) NOT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_activeunique` (`keyIndex`,`isActive`),
  KEY `key_object` (`objectPHID`),
  KEY `key_active` (`isActive`,`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sshkey`
--

LOCK TABLES `auth_sshkey` WRITE;
/*!40000 ALTER TABLE `auth_sshkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sshkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sshkeytransaction`
--

DROP TABLE IF EXISTS `auth_sshkeytransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sshkeytransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sshkeytransaction`
--

LOCK TABLES `auth_sshkeytransaction` WRITE;
/*!40000 ALTER TABLE `auth_sshkeytransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sshkeytransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_temporarytoken`
--

DROP TABLE IF EXISTS `auth_temporarytoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_temporarytoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tokenResource` varbinary(64) NOT NULL,
  `tokenType` varchar(64) NOT NULL,
  `tokenExpires` int(10) unsigned NOT NULL,
  `tokenCode` varchar(64) NOT NULL,
  `userPHID` varbinary(64) DEFAULT NULL,
  `properties` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_token` (`tokenResource`,`tokenType`,`tokenCode`),
  KEY `key_expires` (`tokenExpires`),
  KEY `key_user` (`userPHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_temporarytoken`
--

LOCK TABLES `auth_temporarytoken` WRITE;
/*!40000 ALTER TABLE `auth_temporarytoken` DISABLE KEYS */;
INSERT INTO `auth_temporarytoken` VALUES (1,'PHID-USER-bfbqcgqfuuqhgalc72mp','login:onetime',1790855182,'8edb0db180d7fdda2a66a824add9bc68b72df5c3',NULL,'{\"force-full-session\":false}');
/*!40000 ALTER TABLE `auth_temporarytoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_badges`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_badges` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_badges`;

--
-- Table structure for table `badges_award`
--

DROP TABLE IF EXISTS `badges_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `badges_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `badgePHID` varbinary(64) NOT NULL,
  `recipientPHID` varbinary(64) NOT NULL,
  `awarderPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_badge` (`badgePHID`,`recipientPHID`),
  KEY `key_recipient` (`recipientPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_award`
--

LOCK TABLES `badges_award` WRITE;
/*!40000 ALTER TABLE `badges_award` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_badge`
--

DROP TABLE IF EXISTS `badges_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `badges_badge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flavor` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `icon` varchar(255) NOT NULL,
  `quality` int(10) unsigned NOT NULL,
  `status` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_creator` (`creatorPHID`,`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_badge`
--

LOCK TABLES `badges_badge` WRITE;
/*!40000 ALTER TABLE `badges_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_badgename_ngrams`
--

DROP TABLE IF EXISTS `badges_badgename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `badges_badgename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_badgename_ngrams`
--

LOCK TABLES `badges_badgename_ngrams` WRITE;
/*!40000 ALTER TABLE `badges_badgename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_badgename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_transaction`
--

DROP TABLE IF EXISTS `badges_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `badges_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_transaction`
--

LOCK TABLES `badges_transaction` WRITE;
/*!40000 ALTER TABLE `badges_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_transaction_comment`
--

DROP TABLE IF EXISTS `badges_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `badges_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_transaction_comment`
--

LOCK TABLES `badges_transaction_comment` WRITE;
/*!40000 ALTER TABLE `badges_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_cache`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_cache` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_cache`;

--
-- Table structure for table `cache_general`
--

DROP TABLE IF EXISTS `cache_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_general` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cacheKeyHash` binary(12) NOT NULL,
  `cacheKey` varchar(128) NOT NULL,
  `cacheFormat` varchar(16) NOT NULL,
  `cacheData` longblob NOT NULL,
  `cacheCreated` int(10) unsigned NOT NULL,
  `cacheExpires` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_cacheKeyHash` (`cacheKeyHash`),
  KEY `key_cacheCreated` (`cacheCreated`),
  KEY `key_ttl` (`cacheExpires`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_general`
--

LOCK TABLES `cache_general` WRITE;
/*!40000 ALTER TABLE `cache_general` DISABLE KEYS */;
INSERT INTO `cache_general` VALUES (1,'K3VntSub8LL2','phabricator.setup.issue-keys','raw','[\"large-files\",\"security.security.alternate-file-domain\",\"repository.default-local-path.empty\",\"pygments.noenabled\",\"mysql.max_allowed_packet\",\"sql_mode.strict\",\"mysql.innodb_buffer_pool_size\",\"mysql.local_infile\",\"cluster.mailers\",\"auth.noproviders\",\"daemons.not-running\",\"extension.opcache\",\"extension.apcu\",\"config.phabricator.base-uri\"]',1790768777,NULL),(2,'Z1eljTO_DXcw','phabricator:hmac.key(csrf.alternate)','raw','865f1f96245bb05d3dfe883ebfff423051ba7d57fc8677ccaf64abb1e7eb92878740afb74cc2c501a88915a62014c2c2ac8888270a710b9ffb0a81b979406615',1790768765,NULL),(3,'WQaq6n7_8ffH','phabricator:user.settings.globals.v1','raw','a:0:{}',1790768918,NULL),(7,'vhzI6LB21pBN','phabricator:hmac.key(csrf)','raw','6ee404cf7a832b615554bb16ffcdd1afdcecf9b15f34ca0d99e092a1b07ed688bd394585aacb2b928ab5df472f6e7ba39a8bc8f6e351568aefdb2496e5e5b99e',1790768769,NULL),(10,'BnTlrCiB63YN','phabricator:hmac.key(file.integrity)','raw','e763fd5aa48173dd03d3360c278b43092b304d158bd6582edbed6fbce9ae08828faad25a2f3f1e198267e186e7a969a742bab056a6a5427941900c1402c9b49a',1790768769,NULL),(11,'7JHAI.ID_Jgm','phabricator:favicon(LcMwgFqX7oRW,rlz5Kl3aNWTG,8)','raw','http://127.0.0.1:18854/file/data/aj6nq3op5qig6ync6iq5/PHID-FILE-uidoehlkddemzyahugte/favicon',1790768769,NULL),(12,'DmU9NoZDKTCH','phabricator:favicon(LcMwgFqX7oRW,4YJAagoVgHnE,8)','raw','http://127.0.0.1:18854/file/data/karsspbo24ahplionqgb/PHID-FILE-zcokuzrrfhppucksqxpj/favicon',1790768769,NULL),(13,'sH8Duupkibvh','phabricator:favicon(LcMwgFqX7oRW,HOwbjDXUTk8Z,8)','raw','http://127.0.0.1:18854/file/data/a7pmp7ald6jlftohuzrl/PHID-FILE-evg3ehskrxlvamr3q2h3/favicon',1790768769,NULL),(14,'rgDfZ0SlUe.M','phabricator:favicon(LcMwgFqX7oRW,wAK4LaieqDA3,8)','raw','http://127.0.0.1:18854/file/data/y6msozunwybmkpm244fx/PHID-FILE-u67ins7wulctntns5ejr/favicon',1790768769,NULL),(23,'xPQOReUx_0mQ','phabricator:hmac.key(session.digest)','raw','79ecacca6b004f3ebf92ef3388c7bb75ad30e312d27d2e06eea5787a1b9cab5b5728339d3235c16f8a1bef976855610244f018602f91497996e7f9bd8f6bfc61',1790768776,NULL),(26,'DPB23G21NPx8','phabricator:favicon(LcMwgFqX7oRW,oQN1m8g4aPca,8)','raw','http://127.0.0.1:18854/file/data/ynnscffnsumjk5rysg47/PHID-FILE-mo6g2hnth7qw6h5l3p7r/favicon',1790768777,NULL);
/*!40000 ALTER TABLE `cache_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_markupcache`
--

DROP TABLE IF EXISTS `cache_markupcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_markupcache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(128) NOT NULL,
  `cacheData` longblob NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cacheKey` (`cacheKey`),
  KEY `dateCreated` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_markupcache`
--

LOCK TABLES `cache_markupcache` WRITE;
/*!40000 ALTER TABLE `cache_markupcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_markupcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_calendar`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_calendar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_calendar`;

--
-- Table structure for table `calendar_event`
--

DROP TABLE IF EXISTS `calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `hostPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext NOT NULL,
  `isCancelled` tinyint(1) NOT NULL,
  `name` longtext NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `isAllDay` tinyint(1) NOT NULL,
  `icon` varchar(32) NOT NULL,
  `isRecurring` tinyint(1) NOT NULL,
  `instanceOfEventPHID` varbinary(64) DEFAULT NULL,
  `sequenceIndex` int(10) unsigned DEFAULT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `isStub` tinyint(1) NOT NULL,
  `utcInitialEpoch` int(10) unsigned NOT NULL,
  `utcUntilEpoch` int(10) unsigned DEFAULT NULL,
  `utcInstanceEpoch` int(10) unsigned DEFAULT NULL,
  `parameters` longtext NOT NULL,
  `importAuthorPHID` varbinary(64) DEFAULT NULL,
  `importSourcePHID` varbinary(64) DEFAULT NULL,
  `importUIDIndex` binary(12) DEFAULT NULL,
  `importUID` longtext DEFAULT NULL,
  `seriesParentPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_instance` (`instanceOfEventPHID`,`sequenceIndex`),
  UNIQUE KEY `key_rdate` (`instanceOfEventPHID`,`utcInstanceEpoch`),
  KEY `key_epoch` (`utcInitialEpoch`,`utcUntilEpoch`),
  KEY `key_series` (`seriesParentPHID`,`utcInitialEpoch`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event`
--

LOCK TABLES `calendar_event` WRITE;
/*!40000 ALTER TABLE `calendar_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_event_fdocument`
--

DROP TABLE IF EXISTS `calendar_event_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event_fdocument`
--

LOCK TABLES `calendar_event_fdocument` WRITE;
/*!40000 ALTER TABLE `calendar_event_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_event_ffield`
--

DROP TABLE IF EXISTS `calendar_event_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event_ffield`
--

LOCK TABLES `calendar_event_ffield` WRITE;
/*!40000 ALTER TABLE `calendar_event_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_event_fngrams`
--

DROP TABLE IF EXISTS `calendar_event_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event_fngrams`
--

LOCK TABLES `calendar_event_fngrams` WRITE;
/*!40000 ALTER TABLE `calendar_event_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_event_fngrams_common`
--

DROP TABLE IF EXISTS `calendar_event_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event_fngrams_common`
--

LOCK TABLES `calendar_event_fngrams_common` WRITE;
/*!40000 ALTER TABLE `calendar_event_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_eventinvitee`
--

DROP TABLE IF EXISTS `calendar_eventinvitee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_eventinvitee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventPHID` varbinary(64) NOT NULL,
  `inviteePHID` varbinary(64) NOT NULL,
  `inviterPHID` varbinary(64) NOT NULL,
  `status` varchar(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `availability` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_event` (`eventPHID`,`inviteePHID`),
  KEY `key_invitee` (`inviteePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_eventinvitee`
--

LOCK TABLES `calendar_eventinvitee` WRITE;
/*!40000 ALTER TABLE `calendar_eventinvitee` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_eventinvitee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_eventtransaction`
--

DROP TABLE IF EXISTS `calendar_eventtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_eventtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_eventtransaction`
--

LOCK TABLES `calendar_eventtransaction` WRITE;
/*!40000 ALTER TABLE `calendar_eventtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_eventtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_eventtransaction_comment`
--

DROP TABLE IF EXISTS `calendar_eventtransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_eventtransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_eventtransaction_comment`
--

LOCK TABLES `calendar_eventtransaction_comment` WRITE;
/*!40000 ALTER TABLE `calendar_eventtransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_eventtransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_export`
--

DROP TABLE IF EXISTS `calendar_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_export` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` longtext NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `policyMode` varchar(64) NOT NULL,
  `queryKey` varchar(64) NOT NULL,
  `secretKey` binary(20) NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_secret` (`secretKey`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_author` (`authorPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_export`
--

LOCK TABLES `calendar_export` WRITE;
/*!40000 ALTER TABLE `calendar_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_exporttransaction`
--

DROP TABLE IF EXISTS `calendar_exporttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_exporttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_exporttransaction`
--

LOCK TABLES `calendar_exporttransaction` WRITE;
/*!40000 ALTER TABLE `calendar_exporttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_exporttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_externalinvitee`
--

DROP TABLE IF EXISTS `calendar_externalinvitee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_externalinvitee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` longtext NOT NULL,
  `nameIndex` binary(12) NOT NULL,
  `uri` longtext NOT NULL,
  `parameters` longtext NOT NULL,
  `sourcePHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_name` (`nameIndex`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_externalinvitee`
--

LOCK TABLES `calendar_externalinvitee` WRITE;
/*!40000 ALTER TABLE `calendar_externalinvitee` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_externalinvitee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_import`
--

DROP TABLE IF EXISTS `calendar_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_import` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` longtext NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `engineType` varchar(64) NOT NULL,
  `parameters` longtext NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `triggerPHID` varbinary(64) DEFAULT NULL,
  `triggerFrequency` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_author` (`authorPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_import`
--

LOCK TABLES `calendar_import` WRITE;
/*!40000 ALTER TABLE `calendar_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_importlog`
--

DROP TABLE IF EXISTS `calendar_importlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_importlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `importPHID` varbinary(64) NOT NULL,
  `parameters` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_import` (`importPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_importlog`
--

LOCK TABLES `calendar_importlog` WRITE;
/*!40000 ALTER TABLE `calendar_importlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_importlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_importtransaction`
--

DROP TABLE IF EXISTS `calendar_importtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_importtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_importtransaction`
--

LOCK TABLES `calendar_importtransaction` WRITE;
/*!40000 ALTER TABLE `calendar_importtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_importtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_notification`
--

DROP TABLE IF EXISTS `calendar_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventPHID` varbinary(64) NOT NULL,
  `utcInitialEpoch` int(10) unsigned NOT NULL,
  `targetPHID` varbinary(64) NOT NULL,
  `didNotifyEpoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_notify` (`eventPHID`,`utcInitialEpoch`,`targetPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_notification`
--

LOCK TABLES `calendar_notification` WRITE;
/*!40000 ALTER TABLE `calendar_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_chatlog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_chatlog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_chatlog`;

--
-- Table structure for table `chatlog_channel`
--

DROP TABLE IF EXISTS `chatlog_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatlog_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(64) NOT NULL,
  `serviceType` varchar(32) NOT NULL,
  `channelName` varchar(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_channel` (`channelName`,`serviceType`,`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatlog_channel`
--

LOCK TABLES `chatlog_channel` WRITE;
/*!40000 ALTER TABLE `chatlog_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatlog_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatlog_event`
--

DROP TABLE IF EXISTS `chatlog_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatlog_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `epoch` int(10) unsigned NOT NULL,
  `author` varchar(64) NOT NULL,
  `type` varchar(4) NOT NULL,
  `message` longtext NOT NULL,
  `loggedByPHID` varbinary(64) NOT NULL,
  `channelID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatlog_event`
--

LOCK TABLES `chatlog_event` WRITE;
/*!40000 ALTER TABLE `chatlog_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatlog_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_conduit`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_conduit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_conduit`;

--
-- Table structure for table `conduit_certificatetoken`
--

DROP TABLE IF EXISTS `conduit_certificatetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conduit_certificatetoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `token` varchar(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userPHID` (`userPHID`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conduit_certificatetoken`
--

LOCK TABLES `conduit_certificatetoken` WRITE;
/*!40000 ALTER TABLE `conduit_certificatetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `conduit_certificatetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conduit_methodcalllog`
--

DROP TABLE IF EXISTS `conduit_methodcalllog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conduit_methodcalllog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connectionID` bigint(20) unsigned DEFAULT NULL,
  `method` varchar(64) NOT NULL,
  `error` varchar(255) NOT NULL,
  `duration` bigint(20) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `callerPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key_method` (`method`),
  KEY `key_callermethod` (`callerPHID`,`method`),
  KEY `key_date` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conduit_methodcalllog`
--

LOCK TABLES `conduit_methodcalllog` WRITE;
/*!40000 ALTER TABLE `conduit_methodcalllog` DISABLE KEYS */;
/*!40000 ALTER TABLE `conduit_methodcalllog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conduit_token`
--

DROP TABLE IF EXISTS `conduit_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conduit_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `tokenType` varchar(32) NOT NULL,
  `token` varchar(32) NOT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_token` (`token`),
  KEY `key_object` (`objectPHID`,`tokenType`),
  KEY `key_expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conduit_token`
--

LOCK TABLES `conduit_token` WRITE;
/*!40000 ALTER TABLE `conduit_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `conduit_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_config`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_config` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_config`;

--
-- Table structure for table `config_entry`
--

DROP TABLE IF EXISTS `config_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_entry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `configKey` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_name` (`namespace`,`configKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_entry`
--

LOCK TABLES `config_entry` WRITE;
/*!40000 ALTER TABLE `config_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_manualactivity`
--

DROP TABLE IF EXISTS `config_manualactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_manualactivity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activityType` varchar(64) NOT NULL,
  `parameters` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_type` (`activityType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_manualactivity`
--

LOCK TABLES `config_manualactivity` WRITE;
/*!40000 ALTER TABLE `config_manualactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_manualactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_transaction`
--

DROP TABLE IF EXISTS `config_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_transaction`
--

LOCK TABLES `config_transaction` WRITE;
/*!40000 ALTER TABLE `config_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_conpherence`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_conpherence` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_conpherence`;

--
-- Table structure for table `conpherence_index`
--

DROP TABLE IF EXISTS `conpherence_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conpherence_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `threadPHID` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) NOT NULL,
  `previousTransactionPHID` varbinary(64) DEFAULT NULL,
  `corpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_transaction` (`transactionPHID`),
  UNIQUE KEY `key_previous` (`previousTransactionPHID`),
  KEY `key_thread` (`threadPHID`),
  FULLTEXT KEY `key_corpus` (`corpus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_index`
--

LOCK TABLES `conpherence_index` WRITE;
/*!40000 ALTER TABLE `conpherence_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conpherence_participant`
--

DROP TABLE IF EXISTS `conpherence_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conpherence_participant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `participantPHID` varbinary(64) NOT NULL,
  `conpherencePHID` varbinary(64) NOT NULL,
  `seenMessageCount` bigint(20) unsigned NOT NULL,
  `settings` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conpherencePHID` (`conpherencePHID`,`participantPHID`),
  KEY `key_thread` (`participantPHID`,`conpherencePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_participant`
--

LOCK TABLES `conpherence_participant` WRITE;
/*!40000 ALTER TABLE `conpherence_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conpherence_thread`
--

DROP TABLE IF EXISTS `conpherence_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conpherence_thread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `messageCount` bigint(20) unsigned NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `joinPolicy` varbinary(64) NOT NULL,
  `mailKey` varchar(20) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `topic` varchar(255) NOT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_thread`
--

LOCK TABLES `conpherence_thread` WRITE;
/*!40000 ALTER TABLE `conpherence_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conpherence_threadtitle_ngrams`
--

DROP TABLE IF EXISTS `conpherence_threadtitle_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conpherence_threadtitle_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_threadtitle_ngrams`
--

LOCK TABLES `conpherence_threadtitle_ngrams` WRITE;
/*!40000 ALTER TABLE `conpherence_threadtitle_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_threadtitle_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conpherence_transaction`
--

DROP TABLE IF EXISTS `conpherence_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conpherence_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_transaction`
--

LOCK TABLES `conpherence_transaction` WRITE;
/*!40000 ALTER TABLE `conpherence_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conpherence_transaction_comment`
--

DROP TABLE IF EXISTS `conpherence_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conpherence_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `conpherencePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  UNIQUE KEY `key_draft` (`authorPHID`,`conpherencePHID`,`transactionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_transaction_comment`
--

LOCK TABLES `conpherence_transaction_comment` WRITE;
/*!40000 ALTER TABLE `conpherence_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_countdown`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_countdown` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_countdown`;

--
-- Table structure for table `countdown`
--

DROP TABLE IF EXISTS `countdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `countdown` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `description` longtext NOT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_epoch` (`epoch`),
  KEY `key_author` (`authorPHID`,`epoch`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countdown`
--

LOCK TABLES `countdown` WRITE;
/*!40000 ALTER TABLE `countdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `countdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countdown_transaction`
--

DROP TABLE IF EXISTS `countdown_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `countdown_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countdown_transaction`
--

LOCK TABLES `countdown_transaction` WRITE;
/*!40000 ALTER TABLE `countdown_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `countdown_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countdown_transaction_comment`
--

DROP TABLE IF EXISTS `countdown_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `countdown_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countdown_transaction_comment`
--

LOCK TABLES `countdown_transaction_comment` WRITE;
/*!40000 ALTER TABLE `countdown_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `countdown_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_daemon`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_daemon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_daemon`;

--
-- Table structure for table `daemon_locklog`
--

DROP TABLE IF EXISTS `daemon_locklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `daemon_locklog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lockName` varchar(64) NOT NULL,
  `lockReleased` int(10) unsigned DEFAULT NULL,
  `lockParameters` longtext NOT NULL,
  `lockContext` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_lock` (`lockName`),
  KEY `key_created` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemon_locklog`
--

LOCK TABLES `daemon_locklog` WRITE;
/*!40000 ALTER TABLE `daemon_locklog` DISABLE KEYS */;
/*!40000 ALTER TABLE `daemon_locklog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daemon_log`
--

DROP TABLE IF EXISTS `daemon_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `daemon_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `daemon` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `argv` longtext NOT NULL,
  `explicitArgv` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(8) NOT NULL,
  `runningAsUser` varchar(255) DEFAULT NULL,
  `daemonID` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_daemonID` (`daemonID`),
  KEY `status` (`status`),
  KEY `key_modified` (`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemon_log`
--

LOCK TABLES `daemon_log` WRITE;
/*!40000 ALTER TABLE `daemon_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `daemon_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daemon_logevent`
--

DROP TABLE IF EXISTS `daemon_logevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `daemon_logevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logID` int(10) unsigned NOT NULL,
  `logType` varchar(4) NOT NULL,
  `message` longtext NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logID` (`logID`,`epoch`),
  KEY `key_epoch` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemon_logevent`
--

LOCK TABLES `daemon_logevent` WRITE;
/*!40000 ALTER TABLE `daemon_logevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `daemon_logevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_dashboard`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_dashboard` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_dashboard`;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `layoutConfig` longtext NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(32) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_dashboard_fdocument`
--

DROP TABLE IF EXISTS `dashboard_dashboard_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_dashboard_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_dashboard_fdocument`
--

LOCK TABLES `dashboard_dashboard_fdocument` WRITE;
/*!40000 ALTER TABLE `dashboard_dashboard_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_dashboard_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_dashboard_ffield`
--

DROP TABLE IF EXISTS `dashboard_dashboard_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_dashboard_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_dashboard_ffield`
--

LOCK TABLES `dashboard_dashboard_ffield` WRITE;
/*!40000 ALTER TABLE `dashboard_dashboard_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_dashboard_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_dashboard_fngrams`
--

DROP TABLE IF EXISTS `dashboard_dashboard_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_dashboard_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_dashboard_fngrams`
--

LOCK TABLES `dashboard_dashboard_fngrams` WRITE;
/*!40000 ALTER TABLE `dashboard_dashboard_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_dashboard_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_dashboard_fngrams_common`
--

DROP TABLE IF EXISTS `dashboard_dashboard_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_dashboard_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_dashboard_fngrams_common`
--

LOCK TABLES `dashboard_dashboard_fngrams_common` WRITE;
/*!40000 ALTER TABLE `dashboard_dashboard_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_dashboard_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_panel`
--

DROP TABLE IF EXISTS `dashboard_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_panel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `panelType` varchar(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `isArchived` tinyint(1) NOT NULL DEFAULT 0,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_panel`
--

LOCK TABLES `dashboard_panel` WRITE;
/*!40000 ALTER TABLE `dashboard_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_panel_fdocument`
--

DROP TABLE IF EXISTS `dashboard_panel_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_panel_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_panel_fdocument`
--

LOCK TABLES `dashboard_panel_fdocument` WRITE;
/*!40000 ALTER TABLE `dashboard_panel_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_panel_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_panel_ffield`
--

DROP TABLE IF EXISTS `dashboard_panel_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_panel_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_panel_ffield`
--

LOCK TABLES `dashboard_panel_ffield` WRITE;
/*!40000 ALTER TABLE `dashboard_panel_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_panel_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_panel_fngrams`
--

DROP TABLE IF EXISTS `dashboard_panel_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_panel_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_panel_fngrams`
--

LOCK TABLES `dashboard_panel_fngrams` WRITE;
/*!40000 ALTER TABLE `dashboard_panel_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_panel_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_panel_fngrams_common`
--

DROP TABLE IF EXISTS `dashboard_panel_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_panel_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_panel_fngrams_common`
--

LOCK TABLES `dashboard_panel_fngrams_common` WRITE;
/*!40000 ALTER TABLE `dashboard_panel_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_panel_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_paneltransaction`
--

DROP TABLE IF EXISTS `dashboard_paneltransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_paneltransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_paneltransaction`
--

LOCK TABLES `dashboard_paneltransaction` WRITE;
/*!40000 ALTER TABLE `dashboard_paneltransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_paneltransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_portal`
--

DROP TABLE IF EXISTS `dashboard_portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_portal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(32) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_portal`
--

LOCK TABLES `dashboard_portal` WRITE;
/*!40000 ALTER TABLE `dashboard_portal` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_portal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_portal_fdocument`
--

DROP TABLE IF EXISTS `dashboard_portal_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_portal_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_portal_fdocument`
--

LOCK TABLES `dashboard_portal_fdocument` WRITE;
/*!40000 ALTER TABLE `dashboard_portal_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_portal_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_portal_ffield`
--

DROP TABLE IF EXISTS `dashboard_portal_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_portal_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_portal_ffield`
--

LOCK TABLES `dashboard_portal_ffield` WRITE;
/*!40000 ALTER TABLE `dashboard_portal_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_portal_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_portal_fngrams`
--

DROP TABLE IF EXISTS `dashboard_portal_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_portal_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_portal_fngrams`
--

LOCK TABLES `dashboard_portal_fngrams` WRITE;
/*!40000 ALTER TABLE `dashboard_portal_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_portal_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_portal_fngrams_common`
--

DROP TABLE IF EXISTS `dashboard_portal_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_portal_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_portal_fngrams_common`
--

LOCK TABLES `dashboard_portal_fngrams_common` WRITE;
/*!40000 ALTER TABLE `dashboard_portal_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_portal_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_portaltransaction`
--

DROP TABLE IF EXISTS `dashboard_portaltransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_portaltransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_portaltransaction`
--

LOCK TABLES `dashboard_portaltransaction` WRITE;
/*!40000 ALTER TABLE `dashboard_portaltransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_portaltransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_transaction`
--

DROP TABLE IF EXISTS `dashboard_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_transaction`
--

LOCK TABLES `dashboard_transaction` WRITE;
/*!40000 ALTER TABLE `dashboard_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_differential`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_differential` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_differential`;

--
-- Table structure for table `differential_affectedpath`
--

DROP TABLE IF EXISTS `differential_affectedpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_affectedpath` (
  `repositoryID` int(10) unsigned DEFAULT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `revisionID` int(10) unsigned NOT NULL,
  KEY `revisionID` (`revisionID`),
  KEY `key_path` (`pathID`,`repositoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_affectedpath`
--

LOCK TABLES `differential_affectedpath` WRITE;
/*!40000 ALTER TABLE `differential_affectedpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_affectedpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_changeset`
--

DROP TABLE IF EXISTS `differential_changeset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_changeset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diffID` int(10) unsigned NOT NULL,
  `oldFile` longblob DEFAULT NULL,
  `filename` longblob NOT NULL,
  `awayPaths` longtext DEFAULT NULL,
  `changeType` int(10) unsigned NOT NULL,
  `fileType` int(10) unsigned NOT NULL,
  `metadata` longtext DEFAULT NULL,
  `oldProperties` longtext DEFAULT NULL,
  `newProperties` longtext DEFAULT NULL,
  `addLines` int(10) unsigned NOT NULL,
  `delLines` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `diffID` (`diffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_changeset`
--

LOCK TABLES `differential_changeset` WRITE;
/*!40000 ALTER TABLE `differential_changeset` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_changeset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_changeset_parse_cache`
--

DROP TABLE IF EXISTS `differential_changeset_parse_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_changeset_parse_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cacheIndex` binary(12) NOT NULL,
  `cache` longblob NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_cacheIndex` (`cacheIndex`),
  KEY `key_created` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_changeset_parse_cache`
--

LOCK TABLES `differential_changeset_parse_cache` WRITE;
/*!40000 ALTER TABLE `differential_changeset_parse_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_changeset_parse_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_customfieldnumericindex`
--

DROP TABLE IF EXISTS `differential_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_customfieldnumericindex`
--

LOCK TABLES `differential_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `differential_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_customfieldstorage`
--

DROP TABLE IF EXISTS `differential_customfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_customfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_customfieldstorage`
--

LOCK TABLES `differential_customfieldstorage` WRITE;
/*!40000 ALTER TABLE `differential_customfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_customfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_customfieldstringindex`
--

DROP TABLE IF EXISTS `differential_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_customfieldstringindex`
--

LOCK TABLES `differential_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `differential_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_diff`
--

DROP TABLE IF EXISTS `differential_diff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_diff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `revisionID` int(10) unsigned DEFAULT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `sourceMachine` varchar(255) DEFAULT NULL,
  `sourcePath` varchar(255) DEFAULT NULL,
  `sourceControlSystem` varchar(64) DEFAULT NULL,
  `sourceControlBaseRevision` varchar(255) DEFAULT NULL,
  `sourceControlPath` varchar(255) DEFAULT NULL,
  `lintStatus` int(10) unsigned NOT NULL,
  `unitStatus` int(10) unsigned NOT NULL,
  `lineCount` int(10) unsigned NOT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `bookmark` varchar(255) DEFAULT NULL,
  `creationMethod` varchar(255) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `repositoryUUID` varchar(64) DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `commitPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `revisionID` (`revisionID`),
  KEY `key_commit` (`commitPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_diff`
--

LOCK TABLES `differential_diff` WRITE;
/*!40000 ALTER TABLE `differential_diff` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_diff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_diffproperty`
--

DROP TABLE IF EXISTS `differential_diffproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_diffproperty` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diffID` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `data` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `diffID` (`diffID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_diffproperty`
--

LOCK TABLES `differential_diffproperty` WRITE;
/*!40000 ALTER TABLE `differential_diffproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_diffproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_difftransaction`
--

DROP TABLE IF EXISTS `differential_difftransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_difftransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_difftransaction`
--

LOCK TABLES `differential_difftransaction` WRITE;
/*!40000 ALTER TABLE `differential_difftransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_difftransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_hiddencomment`
--

DROP TABLE IF EXISTS `differential_hiddencomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_hiddencomment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `commentID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_user` (`userPHID`,`commentID`),
  KEY `key_comment` (`commentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_hiddencomment`
--

LOCK TABLES `differential_hiddencomment` WRITE;
/*!40000 ALTER TABLE `differential_hiddencomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_hiddencomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_hunk`
--

DROP TABLE IF EXISTS `differential_hunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_hunk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changesetID` int(10) unsigned NOT NULL,
  `oldOffset` int(10) unsigned NOT NULL,
  `oldLen` int(10) unsigned NOT NULL,
  `newOffset` int(10) unsigned NOT NULL,
  `newLen` int(10) unsigned NOT NULL,
  `dataType` binary(4) NOT NULL,
  `dataEncoding` varchar(16) DEFAULT NULL,
  `dataFormat` binary(4) NOT NULL,
  `data` longblob NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_changeset` (`changesetID`),
  KEY `key_created` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_hunk`
--

LOCK TABLES `differential_hunk` WRITE;
/*!40000 ALTER TABLE `differential_hunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_hunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_reviewer`
--

DROP TABLE IF EXISTS `differential_reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_reviewer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revisionPHID` varbinary(64) NOT NULL,
  `reviewerPHID` varbinary(64) NOT NULL,
  `reviewerStatus` varchar(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `lastActionDiffPHID` varbinary(64) DEFAULT NULL,
  `lastCommentDiffPHID` varbinary(64) DEFAULT NULL,
  `lastActorPHID` varbinary(64) DEFAULT NULL,
  `voidedPHID` varbinary(64) DEFAULT NULL,
  `options` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_revision` (`revisionPHID`,`reviewerPHID`),
  KEY `key_reviewer` (`reviewerPHID`,`revisionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_reviewer`
--

LOCK TABLES `differential_reviewer` WRITE;
/*!40000 ALTER TABLE `differential_reviewer` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_revision`
--

DROP TABLE IF EXISTS `differential_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_revision` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `summary` longtext NOT NULL,
  `testPlan` longtext NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `lastReviewerPHID` varbinary(64) DEFAULT NULL,
  `lineCount` int(10) unsigned DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `attached` longtext NOT NULL,
  `mailKey` binary(40) NOT NULL,
  `branchName` varchar(255) DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `properties` longtext NOT NULL,
  `activeDiffPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `authorPHID` (`authorPHID`,`status`),
  KEY `repositoryPHID` (`repositoryPHID`),
  KEY `key_status` (`status`,`phid`),
  KEY `key_modified` (`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_revision`
--

LOCK TABLES `differential_revision` WRITE;
/*!40000 ALTER TABLE `differential_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_revision_fdocument`
--

DROP TABLE IF EXISTS `differential_revision_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_revision_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_revision_fdocument`
--

LOCK TABLES `differential_revision_fdocument` WRITE;
/*!40000 ALTER TABLE `differential_revision_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_revision_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_revision_ffield`
--

DROP TABLE IF EXISTS `differential_revision_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_revision_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_revision_ffield`
--

LOCK TABLES `differential_revision_ffield` WRITE;
/*!40000 ALTER TABLE `differential_revision_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_revision_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_revision_fngrams`
--

DROP TABLE IF EXISTS `differential_revision_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_revision_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_revision_fngrams`
--

LOCK TABLES `differential_revision_fngrams` WRITE;
/*!40000 ALTER TABLE `differential_revision_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_revision_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_revision_fngrams_common`
--

DROP TABLE IF EXISTS `differential_revision_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_revision_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_revision_fngrams_common`
--

LOCK TABLES `differential_revision_fngrams_common` WRITE;
/*!40000 ALTER TABLE `differential_revision_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_revision_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_revisionhash`
--

DROP TABLE IF EXISTS `differential_revisionhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_revisionhash` (
  `revisionID` int(10) unsigned NOT NULL,
  `type` binary(4) NOT NULL,
  `hash` binary(40) NOT NULL,
  KEY `type` (`type`,`hash`),
  KEY `revisionID` (`revisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_revisionhash`
--

LOCK TABLES `differential_revisionhash` WRITE;
/*!40000 ALTER TABLE `differential_revisionhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_revisionhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_transaction`
--

DROP TABLE IF EXISTS `differential_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_transaction`
--

LOCK TABLES `differential_transaction` WRITE;
/*!40000 ALTER TABLE `differential_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_transaction_comment`
--

DROP TABLE IF EXISTS `differential_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `revisionPHID` varbinary(64) DEFAULT NULL,
  `changesetID` int(10) unsigned DEFAULT NULL,
  `isNewFile` tinyint(1) NOT NULL,
  `lineNumber` int(10) unsigned NOT NULL,
  `lineLength` int(10) unsigned NOT NULL,
  `fixedState` varchar(12) DEFAULT NULL,
  `hasReplies` tinyint(1) NOT NULL,
  `replyToCommentPHID` varbinary(64) DEFAULT NULL,
  `attributes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  KEY `key_changeset` (`changesetID`),
  KEY `key_draft` (`authorPHID`,`transactionPHID`),
  KEY `key_revision` (`revisionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_transaction_comment`
--

LOCK TABLES `differential_transaction_comment` WRITE;
/*!40000 ALTER TABLE `differential_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_viewstate`
--

DROP TABLE IF EXISTS `differential_viewstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `differential_viewstate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `viewerPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewState` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_viewer` (`viewerPHID`,`objectPHID`),
  KEY `key_object` (`objectPHID`),
  KEY `key_modified` (`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_viewstate`
--

LOCK TABLES `differential_viewstate` WRITE;
/*!40000 ALTER TABLE `differential_viewstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_viewstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_diviner`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_diviner` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_diviner`;

--
-- Table structure for table `diviner_liveatom`
--

DROP TABLE IF EXISTS `diviner_liveatom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `diviner_liveatom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `symbolPHID` varbinary(64) NOT NULL,
  `content` longtext NOT NULL,
  `atomData` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `symbolPHID` (`symbolPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diviner_liveatom`
--

LOCK TABLES `diviner_liveatom` WRITE;
/*!40000 ALTER TABLE `diviner_liveatom` DISABLE KEYS */;
/*!40000 ALTER TABLE `diviner_liveatom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diviner_livebook`
--

DROP TABLE IF EXISTS `diviner_livebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `diviner_livebook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `configurationData` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diviner_livebook`
--

LOCK TABLES `diviner_livebook` WRITE;
/*!40000 ALTER TABLE `diviner_livebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `diviner_livebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diviner_livebooktransaction`
--

DROP TABLE IF EXISTS `diviner_livebooktransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `diviner_livebooktransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diviner_livebooktransaction`
--

LOCK TABLES `diviner_livebooktransaction` WRITE;
/*!40000 ALTER TABLE `diviner_livebooktransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `diviner_livebooktransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diviner_livesymbol`
--

DROP TABLE IF EXISTS `diviner_livesymbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `diviner_livesymbol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `bookPHID` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `atomIndex` int(10) unsigned NOT NULL,
  `identityHash` binary(12) NOT NULL,
  `graphHash` varchar(64) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `titleSlugHash` binary(12) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `isDocumentable` tinyint(1) NOT NULL,
  `nodeHash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identityHash` (`identityHash`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `graphHash` (`graphHash`),
  UNIQUE KEY `nodeHash` (`nodeHash`),
  KEY `key_slug` (`titleSlugHash`),
  KEY `bookPHID` (`bookPHID`,`type`,`name`(64),`context`(64),`atomIndex`),
  KEY `name` (`name`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diviner_livesymbol`
--

LOCK TABLES `diviner_livesymbol` WRITE;
/*!40000 ALTER TABLE `diviner_livesymbol` DISABLE KEYS */;
/*!40000 ALTER TABLE `diviner_livesymbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_doorkeeper`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_doorkeeper` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_doorkeeper`;

--
-- Table structure for table `doorkeeper_externalobject`
--

DROP TABLE IF EXISTS `doorkeeper_externalobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `doorkeeper_externalobject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `objectKey` binary(12) NOT NULL,
  `applicationType` varchar(32) NOT NULL,
  `applicationDomain` varchar(32) NOT NULL,
  `objectType` varchar(32) NOT NULL,
  `objectID` varchar(64) NOT NULL,
  `objectURI` varchar(128) DEFAULT NULL,
  `importerPHID` varbinary(64) DEFAULT NULL,
  `properties` longtext NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_object` (`objectKey`),
  KEY `key_full` (`applicationType`,`applicationDomain`,`objectType`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doorkeeper_externalobject`
--

LOCK TABLES `doorkeeper_externalobject` WRITE;
/*!40000 ALTER TABLE `doorkeeper_externalobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `doorkeeper_externalobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_draft`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_draft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_draft`;

--
-- Table structure for table `draft`
--

DROP TABLE IF EXISTS `draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) NOT NULL,
  `draftKey` varchar(64) NOT NULL,
  `draft` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authorPHID` (`authorPHID`,`draftKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft`
--

LOCK TABLES `draft` WRITE;
/*!40000 ALTER TABLE `draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft_versioneddraft`
--

DROP TABLE IF EXISTS `draft_versioneddraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `draft_versioneddraft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`,`authorPHID`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft_versioneddraft`
--

LOCK TABLES `draft_versioneddraft` WRITE;
/*!40000 ALTER TABLE `draft_versioneddraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft_versioneddraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_drydock`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_drydock` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_drydock`;

--
-- Table structure for table `drydock_authorization`
--

DROP TABLE IF EXISTS `drydock_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_authorization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `blueprintPHID` varbinary(64) NOT NULL,
  `blueprintAuthorizationState` varchar(32) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `objectAuthorizationState` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_unique` (`objectPHID`,`blueprintPHID`),
  KEY `key_blueprint` (`blueprintPHID`,`blueprintAuthorizationState`),
  KEY `key_object` (`objectPHID`,`objectAuthorizationState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_authorization`
--

LOCK TABLES `drydock_authorization` WRITE;
/*!40000 ALTER TABLE `drydock_authorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_blueprint`
--

DROP TABLE IF EXISTS `drydock_blueprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_blueprint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `className` varchar(255) NOT NULL,
  `blueprintName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `details` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_blueprint`
--

LOCK TABLES `drydock_blueprint` WRITE;
/*!40000 ALTER TABLE `drydock_blueprint` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_blueprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_blueprintname_ngrams`
--

DROP TABLE IF EXISTS `drydock_blueprintname_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_blueprintname_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_blueprintname_ngrams`
--

LOCK TABLES `drydock_blueprintname_ngrams` WRITE;
/*!40000 ALTER TABLE `drydock_blueprintname_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_blueprintname_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_blueprinttransaction`
--

DROP TABLE IF EXISTS `drydock_blueprinttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_blueprinttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_blueprinttransaction`
--

LOCK TABLES `drydock_blueprinttransaction` WRITE;
/*!40000 ALTER TABLE `drydock_blueprinttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_blueprinttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_command`
--

DROP TABLE IF EXISTS `drydock_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) NOT NULL,
  `targetPHID` varbinary(64) NOT NULL,
  `command` varchar(32) NOT NULL,
  `isConsumed` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `properties` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_target` (`targetPHID`,`isConsumed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_command`
--

LOCK TABLES `drydock_command` WRITE;
/*!40000 ALTER TABLE `drydock_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_lease`
--

DROP TABLE IF EXISTS `drydock_lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_lease` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `until` int(10) unsigned DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `attributes` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `resourceType` varchar(128) NOT NULL,
  `resourcePHID` varbinary(64) DEFAULT NULL,
  `authorizingPHID` varbinary(64) NOT NULL,
  `acquiredEpoch` int(10) unsigned DEFAULT NULL,
  `activatedEpoch` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_resource` (`resourcePHID`,`status`),
  KEY `key_status` (`status`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_recent` (`resourcePHID`,`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_lease`
--

LOCK TABLES `drydock_lease` WRITE;
/*!40000 ALTER TABLE `drydock_lease` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_log`
--

DROP TABLE IF EXISTS `drydock_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `epoch` int(10) unsigned NOT NULL,
  `blueprintPHID` varbinary(64) DEFAULT NULL,
  `resourcePHID` varbinary(64) DEFAULT NULL,
  `leasePHID` varbinary(64) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `data` longtext NOT NULL,
  `operationPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epoch` (`epoch`),
  KEY `key_blueprint` (`blueprintPHID`,`type`),
  KEY `key_resource` (`resourcePHID`,`type`),
  KEY `key_lease` (`leasePHID`,`type`),
  KEY `key_operation` (`operationPHID`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_log`
--

LOCK TABLES `drydock_log` WRITE;
/*!40000 ALTER TABLE `drydock_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_repositoryoperation`
--

DROP TABLE IF EXISTS `drydock_repositoryoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_repositoryoperation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `repositoryTarget` longblob NOT NULL,
  `operationType` varchar(32) NOT NULL,
  `operationState` varchar(32) NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDismissed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`),
  KEY `key_repository` (`repositoryPHID`,`operationState`),
  KEY `key_state` (`operationState`),
  KEY `key_author` (`authorPHID`,`operationState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_repositoryoperation`
--

LOCK TABLES `drydock_repositoryoperation` WRITE;
/*!40000 ALTER TABLE `drydock_repositoryoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_repositoryoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_resource`
--

DROP TABLE IF EXISTS `drydock_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_resource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `status` varchar(32) NOT NULL,
  `type` varchar(64) NOT NULL,
  `attributes` longtext NOT NULL,
  `capabilities` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `blueprintPHID` varbinary(64) NOT NULL,
  `until` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_type` (`type`,`status`),
  KEY `key_blueprint` (`blueprintPHID`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_resource`
--

LOCK TABLES `drydock_resource` WRITE;
/*!40000 ALTER TABLE `drydock_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_slotlock`
--

DROP TABLE IF EXISTS `drydock_slotlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drydock_slotlock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerPHID` varbinary(64) NOT NULL,
  `lockIndex` binary(12) NOT NULL,
  `lockKey` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_lock` (`lockIndex`),
  KEY `key_owner` (`ownerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_slotlock`
--

LOCK TABLES `drydock_slotlock` WRITE;
/*!40000 ALTER TABLE `drydock_slotlock` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_slotlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_fact`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_fact` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_fact`;

--
-- Table structure for table `fact_aggregate`
--

DROP TABLE IF EXISTS `fact_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_aggregate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `factType` varchar(32) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `valueX` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `factType` (`factType`,`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_aggregate`
--

LOCK TABLES `fact_aggregate` WRITE;
/*!40000 ALTER TABLE `fact_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_chart`
--

DROP TABLE IF EXISTS `fact_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_chart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chartKey` binary(12) NOT NULL,
  `chartParameters` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_chart` (`chartKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_chart`
--

LOCK TABLES `fact_chart` WRITE;
/*!40000 ALTER TABLE `fact_chart` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_cursor`
--

DROP TABLE IF EXISTS `fact_cursor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_cursor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `position` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_cursor`
--

LOCK TABLES `fact_cursor` WRITE;
/*!40000 ALTER TABLE `fact_cursor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_cursor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_intdatapoint`
--

DROP TABLE IF EXISTS `fact_intdatapoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_intdatapoint` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `keyID` int(10) unsigned NOT NULL,
  `objectID` int(10) unsigned NOT NULL,
  `dimensionID` int(10) unsigned DEFAULT NULL,
  `value` bigint(20) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_dimension` (`keyID`,`dimensionID`),
  KEY `key_object` (`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_intdatapoint`
--

LOCK TABLES `fact_intdatapoint` WRITE;
/*!40000 ALTER TABLE `fact_intdatapoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_intdatapoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_keydimension`
--

DROP TABLE IF EXISTS `fact_keydimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_keydimension` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `factKey` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_factkey` (`factKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_keydimension`
--

LOCK TABLES `fact_keydimension` WRITE;
/*!40000 ALTER TABLE `fact_keydimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_keydimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_objectdimension`
--

DROP TABLE IF EXISTS `fact_objectdimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_objectdimension` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_objectdimension`
--

LOCK TABLES `fact_objectdimension` WRITE;
/*!40000 ALTER TABLE `fact_objectdimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_objectdimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_raw`
--

DROP TABLE IF EXISTS `fact_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_raw` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `factType` varchar(32) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `objectA` varbinary(64) NOT NULL,
  `valueX` bigint(20) NOT NULL,
  `valueY` bigint(20) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectPHID` (`objectPHID`),
  KEY `factType` (`factType`,`epoch`),
  KEY `factType_2` (`factType`,`objectA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_raw`
--

LOCK TABLES `fact_raw` WRITE;
/*!40000 ALTER TABLE `fact_raw` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_raw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_feed`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_feed` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_feed`;

--
-- Table structure for table `feed_storydata`
--

DROP TABLE IF EXISTS `feed_storydata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feed_storydata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `chronologicalKey` bigint(20) unsigned NOT NULL,
  `storyType` varchar(64) NOT NULL,
  `storyData` longtext NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chronologicalKey` (`chronologicalKey`),
  UNIQUE KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_storydata`
--

LOCK TABLES `feed_storydata` WRITE;
/*!40000 ALTER TABLE `feed_storydata` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_storydata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_storynotification`
--

DROP TABLE IF EXISTS `feed_storynotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feed_storynotification` (
  `userPHID` varbinary(64) NOT NULL,
  `primaryObjectPHID` varbinary(64) NOT NULL,
  `chronologicalKey` bigint(20) unsigned NOT NULL,
  `hasViewed` tinyint(1) NOT NULL,
  UNIQUE KEY `userPHID` (`userPHID`,`chronologicalKey`),
  KEY `userPHID_2` (`userPHID`,`hasViewed`,`primaryObjectPHID`),
  KEY `key_object` (`primaryObjectPHID`),
  KEY `key_chronological` (`chronologicalKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_storynotification`
--

LOCK TABLES `feed_storynotification` WRITE;
/*!40000 ALTER TABLE `feed_storynotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_storynotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_storyreference`
--

DROP TABLE IF EXISTS `feed_storyreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feed_storyreference` (
  `objectPHID` varbinary(64) NOT NULL,
  `chronologicalKey` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `objectPHID` (`objectPHID`,`chronologicalKey`),
  KEY `chronologicalKey` (`chronologicalKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_storyreference`
--

LOCK TABLES `feed_storyreference` WRITE;
/*!40000 ALTER TABLE `feed_storyreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_storyreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_file`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_file` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_file`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `byteSize` bigint(20) unsigned NOT NULL,
  `storageEngine` varchar(32) NOT NULL,
  `storageFormat` varchar(32) NOT NULL,
  `storageHandle` varchar(255) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `secretKey` binary(20) DEFAULT NULL,
  `contentHash` binary(64) DEFAULT NULL,
  `metadata` longtext NOT NULL,
  `ttl` int(10) unsigned DEFAULT NULL,
  `isExplicitUpload` tinyint(1) DEFAULT 1,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `isPartial` tinyint(1) NOT NULL DEFAULT 0,
  `builtinKey` varchar(64) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `key_builtin` (`builtinKey`),
  KEY `authorPHID` (`authorPHID`),
  KEY `contentHash` (`contentHash`),
  KEY `key_ttl` (`ttl`),
  KEY `key_dateCreated` (`dateCreated`),
  KEY `key_partial` (`authorPHID`,`isPartial`),
  KEY `key_engine` (`storageEngine`,`storageHandle`(64))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'PHID-FILE-3li36jtfvuuoqve4rsaf','favicon/default-76x76.png','image/png',5112,'blob','raw','1',1790768769,1790768769,NULL,'knvutafkiga53a4w5n2j','1c1971413ee764908dad1d66f419c00bb020f24022c453612cd57f94458e2ae0','{\"storage\":[],\"integrity\":\"6fb5657353062f4dc94e71e91142e134adac5e663b503b89512386bd2bae0825\",\"canCDN\":1,\"builtin\":\"builtin:disk(name=favicon\\/default-7-K9YqaPE.u2nI\",\"width\":76,\"height\":76}',NULL,0,'gzubzs4q4shuo25ywxek','users',0,'builtin:disk(name=favicon/default-7-K9YqaPE.u2nI',0),(2,'PHID-FILE-uidoehlkddemzyahugte','favicon','image/png',5135,'blob','raw','2',1790768769,1790768769,NULL,'aj6nq3op5qig6ync6iq5','c639d732c949236496b816d13b653e196b79fdadd79cec2adc0797683082791d','{\"storage\":[],\"integrity\":\"7caa845fbddd6c7366893972014f64faffa39a9122ad14636d3c0c236234ca5b\",\"canCDN\":1,\"width\":76,\"height\":76}',NULL,0,'szny5vsx435wzccbjnto','users',0,NULL,0),(3,'PHID-FILE-oyokw7hhx6uf5hdwy4oe','favicon/default-120x120.png','image/png',9913,'blob','raw','3',1790768769,1790768769,NULL,'7pgw3t6str3ykq6ygoql','8ef8a64b96ed4a08b48aec82e8b5bbc6325f4973ab1ec95a95d1425f9e8ce473','{\"storage\":[],\"integrity\":\"713b41e1d16bfc8c8e6428347ed84706e8b2ede9cf478aaddf4ef4a6dec89cb9\",\"canCDN\":1,\"builtin\":\"builtin:disk(name=favicon\\/default-1-I0j2RP7nI19D\",\"width\":120,\"height\":120}',NULL,0,'djduzjmbw7g2akt55pyq','users',0,'builtin:disk(name=favicon/default-1-I0j2RP7nI19D',0),(4,'PHID-FILE-zcokuzrrfhppucksqxpj','favicon','image/png',9949,'blob','raw','4',1790768769,1790768769,NULL,'karsspbo24ahplionqgb','19df8c94998bf4813249e934117df895a39238ca68d613dd6051d0ffc66b42bd','{\"storage\":[],\"integrity\":\"89f320b278cf5cec0350399ebab45fb8702d62dc3e65563cb730d3d82b1c32be\",\"canCDN\":1,\"width\":120,\"height\":120}',NULL,0,'culgcrnluaajyx4pf256','users',0,NULL,0),(5,'PHID-FILE-hzwmubvnepa6studpfb5','favicon/default-152x152.png','image/png',16134,'blob','raw','5',1790768769,1790768769,NULL,'5ft5knkcddhbhonni4g5','d9a2f30aba489e692948559c80da5550de46bb9f2e3e97fad3ac74146bb3beca','{\"storage\":[],\"integrity\":\"53de4a052fd46abf13310dce1a10730337b2b58ba28ca7bd47aa6552593b5c03\",\"canCDN\":1,\"builtin\":\"builtin:disk(name=favicon\\/default-1-M7E1.CkNLLJR\",\"width\":152,\"height\":152}',NULL,0,'4kzlifovjvobzybkidkx','users',0,'builtin:disk(name=favicon/default-1-M7E1.CkNLLJR',0),(6,'PHID-FILE-evg3ehskrxlvamr3q2h3','favicon','image/png',16126,'blob','raw','6',1790768769,1790768769,NULL,'a7pmp7ald6jlftohuzrl','7d96b7eb60240b50c9958719fab6b2820f88bb169ed0d0aae64eabc6dc7536ce','{\"storage\":[],\"integrity\":\"b35e98002bfc2372e2e498e17f071f044007a017f0ecc474d6a4902fda3c2ddb\",\"canCDN\":1,\"width\":152,\"height\":152}',NULL,0,'j6c7iietdlocdphy2s2x','users',0,NULL,0),(7,'PHID-FILE-u67ins7wulctntns5ejr','favicon','image/png',5095,'blob','raw','7',1790768769,1790768769,NULL,'y6msozunwybmkpm244fx','8456c157d8b49104dc91b1bd43314b0927b84ca08d134db9a155f5a3d53de7e6','{\"storage\":[],\"integrity\":\"b404a2b19f11ea883e1da461545d6d575f51891bf0fd3a977ac1d1311db79c6c\",\"canCDN\":1,\"width\":64,\"height\":64}',NULL,0,'sepm3yv43rcebmpcwyik','users',0,NULL,0),(8,'PHID-FILE-4aapmeaafky3mybnqfak','favicon/dot-pink-64x64.png','image/png',1468,'blob','raw','8',1790768777,1790768777,NULL,'6zprquqi53fhy3iak7ur','36f1fe0953e2b9071824593cb7eb4eaeb59239634c1e824eb8fd5f2dbd45d6ce','{\"storage\":[],\"integrity\":\"944876806a7185cb9342de8ad30c1cee760783c298c6586c1c77851d2d544687\",\"canCDN\":1,\"builtin\":\"builtin:disk(name=favicon\\/dot-pink--mj3Chn__AzLl\",\"width\":64,\"height\":64}',NULL,0,'iuleh4qd3cqlpzzqh7zc','users',0,'builtin:disk(name=favicon/dot-pink--mj3Chn__AzLl',0),(9,'PHID-FILE-mo6g2hnth7qw6h5l3p7r','favicon','image/png',5168,'blob','raw','9',1790768777,1790768777,NULL,'ynnscffnsumjk5rysg47','e8fe5f8e21b22983854bef6d1bc3a80c3c71044e81f8637de3459d860402da81','{\"storage\":[],\"integrity\":\"7170e095c264d11d0a8c00c5d3f10208ca86846d76a2761ba1dba07ded9bf4b2\",\"canCDN\":1,\"width\":64,\"height\":64}',NULL,0,'5dr5e5qfwwcesk5b3mgx','users',0,NULL,0),(10,'PHID-FILE-p4mta22vhcapihmmupyj','#335862-alphanumeric/lato-dark/A.png-0,0,0,0.3.png','image/png',4495,'blob','raw','10',1790768777,1790768777,NULL,'isua7saadmhx2fu2wsre','f2ee5c701b8a8a330b6b0babc41fec81c83c0c095943569e70057c398a26d6f8','{\"storage\":[],\"integrity\":\"747bf8e2cda80da44d86168c620984e9b448f75cc4662158bf8d7f2b0c8f8af5\",\"canCDN\":1,\"profile\":true,\"width\":400,\"height\":400}',NULL,0,'6octro2azvlh4gu4rgnm','users',0,NULL,0);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_attachment`
--

DROP TABLE IF EXISTS `file_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `filePHID` varbinary(64) NOT NULL,
  `attacherPHID` varbinary(64) DEFAULT NULL,
  `attachmentMode` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`,`filePHID`),
  KEY `key_file` (`filePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_attachment`
--

LOCK TABLES `file_attachment` WRITE;
/*!40000 ALTER TABLE `file_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_chunk`
--

DROP TABLE IF EXISTS `file_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_chunk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chunkHandle` binary(12) NOT NULL,
  `byteStart` bigint(20) unsigned NOT NULL,
  `byteEnd` bigint(20) unsigned NOT NULL,
  `dataFilePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key_file` (`chunkHandle`,`byteStart`,`byteEnd`),
  KEY `key_data` (`dataFilePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_chunk`
--

LOCK TABLES `file_chunk` WRITE;
/*!40000 ALTER TABLE `file_chunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_externalrequest`
--

DROP TABLE IF EXISTS `file_externalrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_externalrequest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filePHID` varbinary(64) DEFAULT NULL,
  `ttl` int(10) unsigned NOT NULL,
  `uri` longtext NOT NULL,
  `uriIndex` binary(12) NOT NULL,
  `isSuccessful` tinyint(1) NOT NULL,
  `responseMessage` longtext DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uriindex` (`uriIndex`),
  KEY `key_ttl` (`ttl`),
  KEY `key_file` (`filePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_externalrequest`
--

LOCK TABLES `file_externalrequest` WRITE;
/*!40000 ALTER TABLE `file_externalrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_externalrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_filename_ngrams`
--

DROP TABLE IF EXISTS `file_filename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_filename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_filename_ngrams`
--

LOCK TABLES `file_filename_ngrams` WRITE;
/*!40000 ALTER TABLE `file_filename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_filename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_imagemacro`
--

DROP TABLE IF EXISTS `file_imagemacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_imagemacro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `filePHID` varbinary(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  `audioPHID` varbinary(64) DEFAULT NULL,
  `audioBehavior` varchar(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `name` (`name`),
  KEY `key_disabled` (`isDisabled`),
  KEY `key_dateCreated` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_imagemacro`
--

LOCK TABLES `file_imagemacro` WRITE;
/*!40000 ALTER TABLE `file_imagemacro` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_imagemacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_storageblob`
--

DROP TABLE IF EXISTS `file_storageblob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_storageblob` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longblob NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_storageblob`
--

LOCK TABLES `file_storageblob` WRITE;
/*!40000 ALTER TABLE `file_storageblob` DISABLE KEYS */;
INSERT INTO `file_storageblob` VALUES (1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0L\0\0\0L\0\0\0Ç—Q+\0\0¿IDATxœÕ\\\\UÅ¶ÿÎæ\0‡Ãáøã !¡\"˜ø»®åï2Íêãıè{vÍğÙ{¦ŞwïM¯ÖËL³ÔòU·üQ¯ôvı¼×Çº]„–¢™‚¿Qü\"$ †*p\0áœ=ï½gŸÙûìó°îâ3ÌÌšÙkÖš=³Öš9³‡PJp@)!	uõ6sqIÅ ’ÒÊ´+•Uı®WÕ$V×Ü‰©«·EÚ\Z›- \0´„›Œu–ˆğêHk§kÑQÖÒøØ¨³I‰±§““z°D„7´7oŞä\'¢(\nz‚ ˆ¬L/Íã¼H)Îœ+’w¬hJ~añØ²òëEÍ‹òBÄ„¸è“éÉÙÃ‡¤îìŸ’xLàÕãÏÎ¼Ú¼Ûk(¯¬êµûû#sræÿkÍ­º8\0PÅhCš‹­],å£Gf|şÄ¸aŸÄÅFıÔQ2ù4Â! ”ªğ<Õ¤!}òôÅ[·å,Î/,¨ò\r„1#=ù›éÏŒ^30­O._¦9¼zi=Ûu„](øÉ–¬UEçËÆò\riD‚44´y-Şpÿ!©$dÏ™9ùåÔ¾	\'ı$ì±Å6CuÍíÈ\r›w¼³ÿPÁL@\ZQT†(ÍH‚QEH	/¿W9MTsÏZêNçÆ zøÁ-/f>µ(ÒÚ¹º­²^áñ1\0ø¢ô÷î?>uı¦íëë\Z#ÛÊLGB„ÙT=oöÓóÆ\Zü•œŞp,x„5ØšÌk×mığ‡ÜS³UÔí¦ônêÀ™~ä¡Ÿ-œ?}9<, —$ ·âJÅÏ‰¯¾õéÎÊ«7Siô—†Øûº­|åß¦ÄÅFıDqq+´JŸ7t„R*BDk‡%!¬œRŠÓg/YºjSV½í×=½AD¸©ú—gOĞ¿÷m\0\0Ÿæøcöœ8;zÙêÍ;[ìvSàÓˆ\0„¶Ó”äh+WÕáÊ¨ºNˆÁĞ¸|Iæ”aƒúåøÚ.#LÛË€äÛä/\ZûÚªÍYv‡Ãè+ñ05¯x9sòğÁ©Ùz#Lû¤ôO¹4ìÏ¯oÜ×jw˜x¼ôÂ4¯M.¡œsÀÀŠ1#30iÂT\\½·?ø-­v¿hMü\Z–†¯¿=„óNÃî°»<£uNx~¡ÓB°!¨ñí×çĞ¿÷·ÀÕê.­¢¯¸z£×üÅïm°5Ej§%rVgºPH³HNê‰IãG`ÔoÂªxÏ§ŠJğê›Ÿ¢©é®wZ\0›şfN› 0_{«»öæ!ë»\\ÔÖÖ©¦¥\0ÑLI*—ít`6‡U¯[ó‡¡ñ={”º\r¶&óÜ…ÿWy-pk˜9c\"fLçvàì…2,Yñ1lÍéÌœ6ÏML—N«İmYññß¾”M\0@lL·¢k_\ZîÉådëçDQÖ®ÛúaÅµ›©TÖ«JìGº{dÛ%ıú&àí×ç\"ÜdÔ}\0¦==Úmg@°Á€‡†öw>ÇÓ¡š4£êòŠ«7S×®Ûú¡(Šª¾\0$F)ÙßµñŞıÇ§8\\0KâZ¦\n®_ÓRcCßŞqxûõ¹0›Œ.ÏO0/Ìœì•N¸É¨îg-ÿĞ	2şÀá‚Y{÷ŸÊú3 „ˆÀ¹bquÍíÈç¬^ß+M‡ÃÅ•Ñ…¾½ã°zÙ`×\\ˆT„Ã!\"ª[Ì~ö	Ÿ		ÖYëùêR|­õ›¶¯4 9GÅZ¾¾(Š‚9¦¼rÛ°yÇ;\r¶¦H\"û9NÊifJä,ó©äæ)•5¡@Kk«ÊsVä<i†Oé~É½TBéí€êÑ2‚$»H)(‘b}¥O@˜@Ì\n€:ñ hhhŒÜ°yÇ;¯-šõ¼Ö­Püæİ](¸ÿPÁL¥!JäÖX‡@“fÜè¥––Vx‚öÚuû|¬‡SÊôóûÌ<}îò Ö?J?ñJ\r\0>Ù’µ\n€ÀÚ‘NğD§Œ(Ï47·èvŒ^GŠ“g‰Š/=İáue„O¶d­ÒöÀ|\"J)NœºğpÑù²±ºŠŞõ’nj¾ëUé·GPÀ›‘r‡ƒkYÑù²±ù…Å#ä—\"0À©ì·nËYL)u5ÁÚØÇtpp0Lë£\Zzi·#FgTy¢Õ£{W}}ÁQ2J±u[ÎbQBAË+«zåOtrÀQç•áW<Ÿ		Æò%Ïcğƒ}}º­e‚@ğîÊùˆ²ªyâù$\Z4å:åO,¯¬êÅúÉ\0HósÃæs@eİE¥•˜s ;7‰	$;lp?„›Œ0é§4Ñ!Âîa·ÛñØ˜¡š‘â\" »¼?àVî]ñŞÊùøÓÒõøùF- (H€   E­v;DQ”\r—ÓJ*ÛİŠ…•-. ìşşÈœ3Ÿú/J©@(¥‚C1-sYYí­ú8pdœİ¥Î?<¼?V,™°À\r’ïG!®;W\"¥8~ò<^yã^+#·v‰(ÿbóòCPäVœ9W:¤öv}œõĞONxè(ò@ƒ İÎ\0ÍHA¯ø>É\nÔŞ®;s®t\0¢(\nyÇŠ¦ğƒh,Ÿé‰éÉí¦¨µ¸{Eëé\'Fª,%ÑY&IJHŠóM¡”JJ?¿°x¬TD@©»	“&‡ ´¢ö·~{Ò\Z÷HÌf“Z^ÊÉ¯Iç%„ˆ†ºz›¹¬üú@ğ¾à\\RpqHH0=TU­-Î&‡ˆ—® ¤ì*êëa4† .6\ni)‰0\ZCı¢åÎhÅÄ±ÃğÅE>¥Ÿ•eå×Ş©k°ŠK*‰”\n êŠj\"A§ˆp©Å6‚Ã!bûîƒørçT×ŞVÚf¼šŒF<>v(fN›€³É-@`üèÁørgÒ–Öá¥)„â’ŠABIie\Z¿n$ìinÍH\0Ü¬¹Wßüwïz^ú\n5µuX°ä}lÜ¼ÕµwTmC^¼757ã»\"ó÷kpşâ•viœÒ-[¿“ÜÕ\ZØ~ÔQ ¤´2M¸RYÕ! 0ÌÇD‰	\n‹.ã••ÿƒæ»-.:Â]^O—Ô74âOK×¡øRÇ,äh„\0jkë°hÙF\\*­t¡Å§}Qú\0ğşGÇÁÜBV‹{Qš˜¥®TVõ®WÕ$¶*%\04YÉ³WçO•`ñòĞ`krË¸\'¡\0àİ_¢òÚM®\rp<ğÁ¹oj¾‹ïü\r-­ö€•>\0¬ûtvíÍÓÈ¨m×‰ge×«j…êš;1×z1€3çÊğÒÒõ¸Sgsy{Şîù‹Wp0·ĞóúÎMúêÏÕÈÚsØ¯öxX÷é6lÛı£çu²ŞÚ@uÍ¡®Ş©ò=|‰åôÅËøÏW>À›·ür,¿É>\"}ºŞÒßî;ê·3+Šùø+lÛuĞ•¦Ş®…v÷‚RÔÕÛ\"[c³ÅWW/”_­Â·ûê¾Mwz¥°¨Äã4ğÊ®\\G}C£Ç6µğÅ}Ø¹çËT×Û#ÓW¶Æf‹\0Ğ¦àÕV‘¨¬&‘Ë¥?VWJ‹¢¨(W_ôÈ›·d##ÓSÒÎ¶^¦\"§åÖ)ÅÍêÛ.íéµÍBí­z8å”oX<áäu–K¼Ñ³\0„ë4Êu’j;\Z\\#NÕ~™7B¡fÔ™æİ\Zwu¸ö}lÖDãŸ—NÓÇ;c-úCÒ}^;t#­\\v„tìì†–§vÔ¡{·.>·	\0DĞN1ßeäÊZ„p“±Î/…¯Z ÓŸƒ\'óo÷\"­_’-/«“Ø+æğ0¿Ú|rÂCˆ²‚h¹zern2Ö	–ˆğjÅ¤ú\ZS\0„`ÆÔq˜ó»IÊÈñeS‚ÇÇQ›n7üêÕ™8v˜BK¾D÷°âƒU¿GB\\ŒëëàÛĞ+“cKDxµiítÍıPÕÆnÆÔqÈœ1Ñ…I=…«UÆ©$`ÄàT\r}W«¤ÇSlLwL\Z?Ü­‚÷ÄC×.¼÷æ|ôíĞôŒ´vº&DGYKõÖ’l‰âŒåÓŸ\ZƒÌ}\ZQÚdé—æOCL”U±Æ\n(ÖÎveLF#^[ôœô+·ÚŞp–ˆp¬]1©}–—­Ü*ãFe-âc£ÎJ•‰“9U\'1†¥òÇÇÅÏMvëc¹Ãi¡K§¼»r>îïãìJ†y×°ví„w–ÏEïÄX¯´½A¸)k^ûw¤ôMP[}UTÜ\n¹3ãc£Î\nI‰±§UC®C’Ï?ûÛñ\0à·§­ºGvÆú·ÿˆÙ¿{]:›u§Ñ‚g&ı›ş²ô‰o—v)¥Å[¯ÎÅ.É×¶ÉŸ”{ÚœÔó„@ RJP¹¢6f@=9G1ë_!î?áq”ª?AÑ¦ƒƒ\r˜1u¦=5\nEçËPòÓUÔ×7ÁŠøQHë—„0cˆO´´åŞøjj¾‹[#4N˜«ÜÒ3brRÏKDxCB\\ôÉËW®‚;àìÚ›‡g;ÁÁ“zÄ3Ì§µ‚€Á`@zjôï­n:\0Z¾òµ{ï8²pl€ğ2\n>1>úd\'‹¹N\0€Œôäl_}°Ú[u8pø”ã<²E}¯iÙí|“}^}AŸ‘œMÙºáCRw*“XÑ[šI,—B°}÷ÁvÓ%¿T8|ìjjï8İYFÕhæğÃ‡¤î$„HgÂú§$³v¶”€[”rv€RŞ&àÂ¥rœ¹ärXRi]Ùj·û|î—‚¬=¹N/@ELvÅfÊxkgKyÿ”Äc\0``éÖoÚşùW_XÂ<é	éŸ2’¹Q¾ğµ\r „ H@¢¼9Q”âØ˜nx÷ù°vµèê^Ak³§¼§gşÀáäüxƒvT@.·Ûh°5áäé‹pL-¸R>zdÆçìk_¥ÊOå×Ÿ_°úä=í÷EwÃ»+ç¡›µ³‹ÖæÛ‚ãó9?Ä[ïı¯t~¢}@üë‡Kz÷Š‹.¸SÔñ={ü”‘ü\r¨·Eïáêµøó²ºBw„Ò?˜W(u–ÃÑn2d¤\'Ó+.º”ê¢şÌè5 DÏV~¾y@û8ºŞÂÉÂ‹p8íÆ;‘úÊ(VŸ˜Ö\'7õ„lùµü„b5µê<48ªq\n;ÂÂBİğ¼÷ú@BöÀ´>¹ü)så@ 3sòËDşIZKÉJNKI˜EayªZMpVÆÕÃÖÛVn+åÃBC œjc–:ùc/P*ã±d%9<Àú‚ ˆ,v9E–rÿ‰Q?¸EnÕeÕ eìRgc .Û×	!¡!\nŠËÀ€º$<Â¨‡Ü’–rÿ	¢9Em :Ÿ¹ÕÔŞYt¼àÂ¤[S$àjmÙ´ÓZÅ\r‘\ZPÑ‘RéX8zÊÜáñÑ_w¢æv‚AA~b$úöóø,Ë‡$5¢Ï´Óar)S?c7U¿˜ùÔ¢¥Ÿ?RùµpŸ†°8ÒÚ¹zÏ¾£óVğù.RùhmµCĞìa¹T£k>ø?dTß˜wü,Ö®xÑ§mCàãøñóf?=O{2Ùé`@ı	ÍøQƒ¿ztÄ€ÏÚj–)¥°Ùšù†uÓïôwdÿïò|}C£êL…»ç6ÛÆï£#|6~Ôà¯ØZü	jÊÔñJ\rô™ âÂùÓô¼¯{ šx~Ã¹p8Dİ]\0X¿i;²¾ËÕ{\0PWoÃ¢ep±¤Â¥³xZU7nùÅ—vÓó¾îEçO_ÀúƒHgA•gsÓ”WVÉ˜6FRÊ-“(äeÉ0(ŒS\0„2µ«0díbÁ¤	#0iüpX»J?ËQJ±aóüãë”ï–ø6(£Es¸o½úú§$*´ë\Z‘ıÃ	ìú.eå×e˜eçÜ\Z\"ÿ&)]êô\0\0\n³ÙT½nÍ†z»·G÷›o‰¾3]XT2äÏ¯oÜ×Úê0)æ‡²™Öàz’@Nf%é¥}¯‘ÃÓ1yÂì=pß~TQ{c\nÎ2B\ZŒ—ÿø,¬],Øµ7ÈçÕœÂ³å„h;LâÁ¹õ,=,}ÂœštŒÓéó\r\0ÿLÉ³®ó¥ŒÿHŞÚ~]ôq4ÿÜèe«7ïÔ~,ï3·¿265._’9ehFJNÀ}¸#ÎÊO¹4léªMY¿ö»v¼A„ù\\ôHº]%SqõÆ¯æ*¦‘|÷uW®’ñ»@owjlºk’.+*˜E9+©µlÎ\0Ù\n‚¨oµ J=\nO´ÔŞˆš–2…X£ÒÃP™&\n<*_Vd\nm¼§·;1¢ì:,¶Œâİ\nB]­¤ä6ÈkTÎ L8§Îxji)fQ¦%g¹qgÖ\\‡¨Ìº#pUòšêş06ÏÕ®APdõƒ,›/´à|Fuá\Z¡v4ñzK[Ïe„¹Sr¾\Z\08}îò v¥Ÿòu°+ıÒRî?á©?2ú¤ôİ9´î ¿°X¹4÷øÒHp—Ff¤\'çª‹ÜóîkY›®ôcõ”% ı°¢º–´¿–”ı`á/we¾Ô÷é–Mşg2¾ó|½‹o)uê:§’’8¿2bÚSdò³Ç‹o;\nü¾¡W>Oewê\Z,¯V†|µ2<_­ÜÉb®ó·m½2=¥ï®şÿÎçãq$5Ú×\0\0\0\0IEND®B`‚',1790768769,1790768769),(2,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0L\0\0\0L\0\0\0Ç—Q+\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0ÁIDATxœÕ\\{\\UÅ¾ÿÎb›ÍEP„x¡ø@0ñ]Çò]¦Y}<½×^»×´sÏ9éÑº™i–Zê”º¥§ãçŞ>Öíø-3B3_ˆ(¦(Bj( ²y	{¯¹¬5kÍZ{í\'`ŸŸåÌüfÖï1{æ÷ûÍ0k¥T\0”RBĞ™Pok´–”V)-«J¿\\U=àZumrMííØz[cTcSK8(‚\0\0­¡s}xXhMTd—«1Ñ‘e‰qÑgS’ãN§¦ÄŸmèhÙ<éODQŒ*\"ˆ\"•êŒò<Îˆ”âÌeÃòO+(*_^qm°¨û¡|1)!ædfFjÎÈai»öO>&pŠ\ZÉççJ_}Ùe‡uTTU÷Úóí‘y¹şµöf}\0\nhR´#Ï¥‘ácGg~úè„%ÄEÿÔY:y5Â! ”jğ<µ¤!}òô…QÛ¶ç.)(*™¬Ÿò\r„13#õ«™O];8½O_§9¼Fy#;t„Ÿ/üÑÖìÕÅçÊÇóŒt*A\Z\Zú²ï\r¸~‡‚´~I9ófO}1­oÒI	»áè«ŒPSw+jã–oí?T8F••!2¦á˜Jxùw‘óD3÷¼¡¥ítnL€\0â˜îÛú\\Öã‹£ºu­i¯®DUƒÇ§\0àÑß·ÿøô\r›wl°54EµW˜Î„0«¥fÁÜ\'L3ô#==áXê÷khj¶®[¿íıïóNÍñ×Pw˜Ñg8¸h5ÿàıƒ>Y´pæóVKˆ_!‰_aÅåªŸ“_~ãã]UWn¤ùÃô—†¸{º¯zéß¦%ÄEÿD@œÂ\n½Ñç¡”\nD¤Rı°$„€ÕSJqúì¥aËVoÎ¶5şº§ \'µÔ¼öâÜ©ƒÒzaº³\0ø<Ä·äÄÙ±Ë×lÙÕj·[üŸF ´ƒ¦$G\\½¦\rWGµm‚L¦¦K³¦2 ×Û>p\Zaú^–x1ÿDñøWVoÉ¶;fo‰ÿ3€)  eå‹YSGIË1\ZaúÔ+£ªøâˆ?¿ºé»6»ÃÂã¥L÷³É5”XB‚1nt&¦L\Z…Ê+×ñæ{Ÿ¢µÍî­éSÄı#Òñå×‡ğCşiØv§wôÁ	//8ššŞ|uş¸Ai½¸ìö.a®ÖS•W®÷Z¸äİ£\rÍQúiA‰\\4˜.ÒlRSâ1eâ(ŒùÍ`XB‚•èùTq)^~ıc47ßñLÀÓ3Æì“áënÖc÷¾|d“‡ººzÍ´£ º)Iå:¢Ÿ®\0¬Öšõkÿ0<1®gàgXÑĞÔl¿è/ùUWı÷†Y³&cÖô	.w\0Î/ÇÒ•¢±©Å-Ù3&áé™Òi³Û±=û >üû—şŠ	\0ˆ‹í^¼iİ#İ…5|D*\nëÖo{¿òê4*ÛU%õ!ß#*ÂívÉ€¾IxóÕùµ˜\rß€OŒuÙY\0h2áşáÕ÷x:T—çqT[_yåFÚºõÛŞ©¨é@²iT(¥RØ K÷í?>ıÀáÂ9’Ô2Up¼ÍCZ»{úöNÀ›¯Î‡Õbvzê¤QxvöTtB-fmğ2ëå‡Á#ã.œ³oÿñé¬\' —M€ºbiMİ­¨g6¯Ùàdı\0‡Ã)”1„¾½°fù`÷Ş<ˆT„Ã!\"º{æ>õ¨Wï:[sÃ¸B[Ë€oµaó\rC¥æŠbß^¤¢`b)oÜ6nÙùVCcs‘ãÕ€r–™¹Èb*™=¥²¡& hmkÓDÎŠ€\\$Íğıû$b@j/RF; F´L¦\0É/R\nJ¤ÔØè¦ó *\r\rMQ·ì|ë•EsÑ‡JÜÁ¢ûâóåƒ÷*œ­0¢DæÆ:º<“Æ(´¶¶ÁtÔvx€ hùó©N©3.ï?T8ûô¹KCXÿ(ıÄ5\0øhköj\0ã\"ƒGÂƒ:¢¼ÓÒÒjØ1Få/\"á8¹Œdv…7Ô>Úš½Zß?‹‰(¥8Qtşâsåã\r\r½+#ê!ßÜrÇ£ÑïˆGONÊÎuÅçÊÇ•Œ¸¨Æ~ÛöÜ%”Rg¬O½Ìâ¾ô>ša”w9bF•;Z={t3–Ù5¨£Û¶ç.©(°G „@ ‚XQUİ« ¨d²*D[V†/œñ|>((+–>ƒ¡÷õõJéöÖ	ÁÛ«\"&:R+/\'Ñá «7x­ ¨drEUu/ÖO&@šŸ¿İ9T¶]TZ‰©]İ$&ìˆ¡j1Ã\0B¤?¥‰v‡»İ‡Ç\rÇğÌşN\nº*û®hõìÑ\rï¬Zˆ?-Û€Ÿ¯×A‚\0QÑf·CEÙq©^RÙîV<¬ìqaÏ·Gæ=—õøQPPJ‡(bFÖòòº›¶pdÔîÒ–9+—Îõ[áÎ)ö£ç+‘R?y/½ö‘¯×‘ÇGF„U|¶eE’IÂŠ3?–\r«»eK0òFÏc“î¿+†ÜßGˆag€@†göG¯Ä^é\nÔİ²%œù±l\0\"…ücÅÓxAt„/ÇöŒÂàŒÔ3ÔzÜİ¢õÄ££5’,“$#$¥ùÇŠ§QPÉè•Œ—ª(•SÏ”I#!c¨}mß‘´&<˜	«Õ¢Õ—rúëòE%ã	ˆhª·5ZË+®\rË\0ê’‚Kƒ‚ñğØášfí	6yp8Dœ¿x¥åW`³5ÁlBB\\4Òû\'Ãlö‰–78³9“ÇÀg;sı”v|QÎ”W\\|ÛÖn*)­\"R*€hj}ˆ]ÂB \rÛ	‡ˆ{âó]PSwKáÍdµ˜ÍxdüpÌ1	aV‹K:şÀÄ±Cñù®\\…—>\náµ)„’ÒÊ!BiYU:¿n$ìmnÍH\0Ü¨½…—_ÿwî¸_zµuõx~é»Ø´e\'jênkxC^¼7·´à»\"ë÷kqîÂåáHAéÖmßHá…f\r¬¦„u(-«J.WU`(ó)QR‚¢âKxiÕ£åN«“pU6²%¶†&üiÙz”\\¬ä„…¼ã\0@]]=/ß„‹eUN´ø¼7F\0Şıàÿp0¯ˆµâ~(]J‰Ò—«ª×ªk“	[•\0º…¬ÙkË§ŠK±dÅhhlv)¸;¥\0àíMŸ£êê\r8øG]È7·ÜÁÊ·şÖ6»ßF\0Ö¼»÷åëtÔóUñ¬îZum²PS{;ÖíºÑ(pæÇr¼°ln×7:ızî¹—q0¯ÈıúÎEşÊÏ5ÈŞ{Ø\'~<¬ÿx;¶ïùÁı:Ùhm	 ¦öv¬PokŒÒÄŞ¤rşÂ¥JüçKïáú›>–_å‘‡1]Où¯¿;ês0+Šığlß}Ğ™¦Ñ®…~÷‚RÔÛ\Z£„Æ¦–po#^£§âJ5¾şî¨á¯éÊ®—ºòË×`khrËSŸíü»öršêF{dÆæ ±©%\\\0h3ğZ¯H4^“ÈõÒ?ÖVÊ‹¢¨WoìÈõ7e\'#ÓSò*o†—©Èy™;¥¸QsË‰ŸoöÔİ´AÕSvr¼cQğ„ÓW­—d£A&æ×i”ë$Ív48&Nµq™\'›B¡TÍóa«6/ùÒ\Z’€èâsâÔiÆx5@Ğj<$]—õC7*²‹“À®€‚Q]]ĞrÇGûôèá5O\0 ‚~Šy¯#W×*„ZÌõ>|Í˜ùä8<ö°o»éRhyx¸6É½ba\r\rñ‰çc“îGLt$ˆÎ;ÉaT\'§¡s½Z£¸ToS\n€Ìš>ó~7E9Şl\nBğÈ¸á\0!Z×íB^£6“ÇPhÑ7‚˜‘xoõï‘”ëüsğ<Œêä4<,´FˆŠìrÕõP5\ZÆnÖô	Èš5ÙIH#ƒ«7Æiı’0jhš¾³W2’).¶¦LéÒÀ»“¡[D8Şy}!úöNôkzFEv¹*ÄDG–­%ÙEMÕú™CÖ¬É^(}G²üg 6:RñÆ\n(Ş*_Y‹ÙŒW?-ı•ÛmO¸ğ°P¬[9i}“UÏË^os#ˆ‰,ã¢ÏJ‰*œ¦“˜ÀRı#ã†ãÙ§§ºŒ±\\áôÑ%o¯Zˆ{{ÅªC‰\"0Ú€‘İºà­óÑ;9Î#mOj	ÁÚWşıû&i½¾Î+*a…Ü™‰qÑg…”ä¸Óš¡ç!É—ŸúíD\0ğ9Ò6zzDuÅ†7ÿˆ¹¿{]­†ÓÀlÂ“S~ƒÍ]‚~};„/¥!!Áxãåy•t„3o†gú§$Ç6¥¦ÄŸDJ©\0*7Ô§(°7÷(æüË# Äõ§3<Rí\'(ú|` 	³¦OÀŒÇÇ ø\\9Jº›­–`$ÆG#}@\nBÌA^ÑÒ×{’«¹å\Z\Z› Âœõ–ŞSSâO˜ÂÃB’bN^º|m\\G`÷¾|<õÛ‰4i„4ê$^`>¯W\0L&2ÒR0h`o-k?hy+×}GàpÈÊ±Âë(øäÄ˜“]Â¬õ\0df¤æxƒÕİ¬ÇÃ§œçÁŸ-ê»MËnwà«œ#ğÊøÌŒÔÊÔ–¶K™ÄŠİÒMb¹‚{v˜-ù¥ÃÇÎ ¶î¶\ZÈ:jF3‡9,m‘Î„\rìŸ|,²kx¸E)ç(å}Î_¬@á™‹N‡å(•Ö•mv»×é~)ÈŞ›§Fò(bº+>SÆGv\r¯Ø?ù\0˜D*\n‚ ˆFïøô‹/,eˆô†ôŸ2’¹Q¾è• „ @@¢ür¢(¥q±İñökÙ-ÜĞÎğZo˜İ•İ½Ãğ\"÷‡“0™L0±£r½İî@Cc3N¾\0\'Å´Š+õcGg~Ê¾öUPüTy-ù™ç×\\„|¢§#à˜îx{Õtìêd„õåöàørî\'ñÆ;ÿ#ŸèÿöşÒŞ½âcÊ\0îub|ÏŸ23R¿õ´¨óş¹rõ:ş¼|“¡ÒaôæIåpt˜™©_õŠ)£F§¨g>9v-1ò~??ß¸	 c]OÏÉ¢p8&;‘úD–Ÿ€hOONï“—Ö/)GşÙ\0~BñšúÚ2t8ª\n;BB‚]È¼ç\'­_RÎàô>yü)så@ 7{ê‹„Qñ˜²‘“N0şTİ¡•ÛéWñúÛh[¹½8V	R2óìT•ıx„R¯¦’—äğ\0ëDYêtŠ:½ß½\'Æ<pßV™«ÓªAÊØ¥j™ NÛ×	AÁAŠJÈÀ€:eÜÂ˜îÛšŞïŞúSÔ&jğ™[mÖíÅÇÏOihl’\ZËÀgX,ËÇ\ZD-³™ì)•…s`dÌümjoÕ#@ à‰GG£oï·ï²rP I2#ÆB«“Sök¨¥æ¹¬Ç/ã>¤rŞÄ\Z\"¥QİºÖì{tÁš÷>ıÌI+_mmvº=,§f”bí{ÿ‹œƒÚòŸÅº•Ïyµ­c\n¼?îaÁÜ\'èo Pf\";h?¡™8fè\ZôI{İ2¥ê—jFh@:ëó}Óû¶†&Í™\nWïl6¶OŞ‡F\rúdâ˜¡_°´øÔ”¨ã\Z\0Ù¸	â¢…3Ÿ¿§G±ÔÃşÃ÷y…p8DÃ]\0Ø°y²¿É3z\0PokÄâåq¡´Ò©³xZÕ×oú$—~OâEg>Ïúƒ€ˆ|ÿÑã7ßUÕò¦MQ”rË$\nygYrŠà\0¡Ìì*EF„cÊ¤Q˜2q$\"»I–£”bã–øÇ—ß+ß-ñ<(£Ek¨o¼ü,öOVhÛ\Zšóı	ìş&å×d˜gçÂ\Z\"ÿMRşºT\0\0\n«ÕR³~í†{º·Çğ›o™™’/*.öçW7}×Öæ°(î‡²™Õàz’@Rª°m¤ÉdÂè‘˜:iö8¯¿=*«HŒij!\nÄ‹|\n‘áØ½/ÊçÕTåÙ‰rBô&É n=KïJŸ0g¤¥Slz{¾ù€¦äY×ySÇ$ï\rmŸ.ú8ZğãØåk¶ìÒ,ïµ´¿244­Xš5mxfÿ\\¿/úpEœÕŸ*¾8bÙêÍÙ¿ö»v<A˜õ.\\ôH¶]%Syåú¯æ*f‘¼ø{z(WÉøÌÇßÛššïX¤ËŠ\nçPÎKê=›º\"\0 {Aí­TiGá–6\ZÑÒR¦c*½k¢ÀCòeE–à¦»z»#Ê®ÃbË(>¬ ÔÙKJaƒ¼FåâÊ”ÓàyZàœ§–âeZr‘wVİuXşêl8Â\0çQEåËŠø¶lk/\\ƒ èêƒ ¾x6ohA}Gsá\Z¡~4ñvKßÎi„¹2rFÑœ>wi»ÒÏı:\rØ•~éıî=á®/:zeô]´®  ¨D¹4wùÒHp—Fff¤jÖ[îd÷¶®]Wú1‚FÆş°¢¹–´¿–”ıÁÂ•\\®ê¼iïÕ-›üŸÉ|¹ğVeæ|ñ-¥ª­S”lÀù•³öœ!“wœİ^|ÛYàó\ru¼qtğ¹«»mkw{µ2ä«•áşjå.aÖz_yÕ}WíÿXÂ’‹Öó†\0\0\0\0IEND®B`‚',1790768769,1790768769),(3,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0x\0\0\0x\0\0\09d6Ò\0\0 \0IDATxœİ}{|UÅµÿwö9‚$Hä-òĞ\n©€òyø€ˆ¦\nŠ´*•\"Vz‹Öz½|¸Ö¶Ê­© ¢ÒVEA\nAQ€<l\0%€È›$ÈH!äœ³ç÷Ç~Í=ûqÎI\0+Ÿ={f­™5kÍ¬™Y³Ïl\"Ë²„Ÿ8”Uœku¬èdâÒòî¥\'Ë;—WVeTTV¥«®i][[×ê|Mm<(àWI‚ ¤.!>®&..öLËñeÉI‰§R’‹ÒÚ¦NOKÙß!£í¾ÖÉ-Ï\\Éz5¯\n–$I–eYâïl\Z‹«…ùx/´¢r´û¥ú€ïşc™»÷øÃc*Î¬:¡½Q#P@ıgÄš¢ÄÒ \05š—të’^p}·[oèÙysÏî\nš6‰	²<±õtâİÓİ‹lDwâE¹W\ZJOU¤~³½pôÖ‚½Y{ö¹-¶\0 (Œ­…¡ÌpÁmŒß_İ«G§\r2{æİÚ¯÷ª´ÔäSátyÁÒƒ	! ”‚BˆŞz´x¶uPJ%\r—O\0J©¤ŞMùkù¢hGK×Ò\0 òlUË¯ów_—¿sâ‡ŠT2)TówÀFñ\\Íp<åMäëºdäÜgÑíƒû,½&1¡š·F\"™²²\0œ-#KÏËÑV£¹ªz°,ËÒ®Âƒ™Ÿ~¶iê¶û²ƒÁPœ+‘H	v8NtNô.eúı¾Úş}{äŞ;jĞü›zw-`M·§ì(•´†İĞpU(8JëòwÜ“»bıÌ£ÇOŞr¥ù‰:^ÛvKö˜¡s†\rî»2&Æß(JL\næ\'\r@PZ»±`ì‡KÖÌ*=UÑËÑÌÂ!µ\\nô¢ü¼Ğñx<.Nk›¼ç¡ûGÎ>$sù•T´ãl7n°q¢t/°åÛ=ƒßY˜7§¨¤,S7wîlâ€¥	—7Ù^i\0Û1<£}ë‚)“²fŞrs¯|7Y9¥óinÏzüå^Ÿ(k?oÁ²œßIÃø)!}oì¶|úããf¤·k]rYËÖfº\r@PZ¼lí“‹–~õb Š¿e^Vğ0¼Äø}5ÇxaÂ¸á¯óf›\"Gª\'ZÂN¯õ©µJ ÍìøYhÖÇ.ø´CGKºüåï‹Ş?|´T<²3«.æÏ‚Ã>ƒÃáğeºåkg¾	@(%\\á¢<)Ğ¹cÚ–çøH—íÑÍ}ÜhÄD;Ëò6NzgaŞ<½×\n„£Ç;)—jy+Î&Öédr@yPŒm°â°yğøºsÌIÁ0ğ)\0BJ”Ş<eRÖôqYC¢\0f\Z`¸\ZİÜq¢8í~¾¦6î•¹‹ßØ´­p²^µ™\03i&ı‡9I\"P„‰#+âòÔ€IÁÔŠ§¿ìØ¿÷{Ï<5aZB|\\­†ã$g;[WecŒÁÅ\'ÊÚ?ÿÒ‚OŠO”÷Qš,ôæO¸nJÁÎØ¡ö\nm¨€’µÇ¨‚¡L†¸(±YCQ\rOy¦JHÉ™2Ş½­Çj¼2wÕ»D£`‡èÌ%*J›–²ó¥ç¿¯1&`¥T[ÉÌÒGfïZ¼†§¥±a-mWáÁÌiÏäl/.-ïC ˜$M¸†èÍ!]-ŒIÔ1(¨¡ãNÀ«’hr¤T	S€P~Yİy„ª\r’B/—Ç3x£.´†ÌVˆÊà(X%\'ÊúL{&gû®Âƒ™š>\0³\\İä®°# p1¬İXp÷Ës/	‚qûJ+5”ÈÛ/kšÖŒAë	:-c:;˜ÏZ®}#WZ†7İDsÊi¢ÁĞúı¾ÚgŸšpÿğ!™Ÿ£ÀÑD³ÓovfÍŞ5ÜUk¶dçÌÏı€Rê7eb³dˆ\Zlóeè¥lÍ ì”3ü8îF9ñËĞB‚3¦f?œuÇ­»ÉŞí»\"Ã…OVåOš·`Ù»ªÂµJ;UÖ±t­Ò¾hvæ(0¯Ü³ù…¡`¾a¸)Ø¬´Dşø¸_Ş7zpÔ3lá2ÉnÛK\'b¶õò¾üæœ7sQJ%ÏJpU° $9$‡ÙK]xãÊ°(Ì©NìÚI4uæ#nDñ›ì‰£FÈe·fE?ZOå·nuzUG~»E²—…÷Úwÿ9çƒ(Ê… RnñÀçóaÀÏ{bôÈ[Ğ¥c;¼ôêØUxÀ™(ŞÔÄ»†õCÖ·bõÚmX»±\0ë.y £bÇòÅ=‚J9ós?hÛ´\ZÀç¼óH{Öôd·İñ2iWáÁÌgg¿µ>Æé|6ÆX«Bjë$Ü=¼?îŞÉ­õø@ ˆWæ-ÆºüÛ<ò‹R\0\0ÁÄñ#ğ«‰wë›æ55µøbı°rõf””–‹Ëq§½–o¿ß_ûò¬\'†ŞÔ»kŸf72á°^]fE%§3¦=“³½æBmj´°à0¸>Ÿı3{bôÈÈ¼©;|’µÚÒàµw–\"ï‹-ğ<ÁbÓs9ùÁ»ğpöHÓnš²,£à»ñéç›ğí Ë² e;áÌ{||Ü©7^™Ñ/£}›\"—\\-`»]hjëb3óÕMÅ\'Êû(0©\"f½T†ÃíÓ»+şğôD¤$µ´lMÚmeÎw–®Ü`^é8ñÀ­¤yàNLúÅöÒRy\0€Ò“XñÅf,_•`HvÎ_$rĞhÓÛ¥ì|sÎï5‹­sdI’$Y»Ô\nÈ|~eîâ7ŠKåZ$ÀUˆ¾u\n×±Ê­×õ‘Ü*Ñ¤@ÖáÂŞ5˜úË1x`ì0QqÀ„ñÃ]•«•I)EÛÔ$<1y:whgƒÈİEqaŒ(Å\'Êû¼2wñ€¡/—Ÿ·İ\"[®Å-]¹aÒ¦m…“M­ÍKÅDé.iM›Ä˜Ì£WxüáÑÁâekÍş	^Çİ3NQyI­Z\0‡]Êñ\n.\r`Ó¶ÂÉËò6n¤”z^>ioEÊvn1í~øØ‰Nï,Ì›çX‰h*Ç+l§!C”öèC£ğà8®\'ÛÀ¨ıñ›_İ+š¼”ß¼™Â¯{Q¶àDË§½³0oŞác\':‰t&ºü€ùåt-L)…,Ë¥õõÿÔ™¯¾†âuïšRMvñ‚Ã DÌt2ãWÕø±{UH4?öĞhP™âãO¾¶mwCoıfLÍÖó`ï^ËmÚDÃdêa©I*|íE´`hXCñùû¢÷ëëCü~Ÿ¾ÓdSEå§N[…²,K‹—­}òÈ1c³Şì_e-ŠÊ¨ÍìYÛeÑ#5á	ÒC¡µ²‚ñØî\0Ÿ”I’°å?{ Ë²,C–e„B2ºvnç~’äŞ÷œÊmÒ$Æ\nv*Vbµ]-1­±sfÍíğ±Ò[/[ûääïú»hk0ôçW[¤ŞøpQÉéö‹–~õ¢§lXŒS3 Ä4“Õ°eeğ(@Œ	e\rB‰<<öğh<öğè¨ó±¿ßg‰#¦ÿª§\nD©ŞYµ\ZótĞ¯5VAÖD²héW//>µœRÂüÀÀ2ŸÒ·ù­&í>oÁ²œ@0oÌXÔâ©Â¬Q=[Cúöa+«nj[fºufî—ê,£6âuïÉIK)…ßgV0UåÁÜ\n>Q®ªL\\f[”\"ÅÏ[°,‡Ÿ7ñs*‰ŸV³Êİ¼m÷m;¾?0Ö0©Ì˜e=‰Z&8TÓ2[h¤š@Úúú€©Ññ\r‘7›v¸I\0’dİ«Cµg¦#hæRÖLG…´†øv|`ì–o÷ÖKU—¸o’,©NjÓ(oA¾³0oÑ\n™moÊ–¤*…²Œ¿F…À™h¶’FPw©^s˜Û^j¥\"º\ZŠVâ½kšlL2²·fZFNº¡æiÍSµwæÍ	‚ºŞØ;¥T’DSk\0X»±`lqIY& N~…Ìïlo6z-a•lj•†ARøVêêê½	å\nƒ·y‚ÇNé|¼Èd@qÉéÌµÆŠ–¶„Y’eë¥—¬™¥¾oÃ\\NÏT|gëgJ3ÂÄ„£Äé»7€Ğ4²i¢gŞÄÚÑòæX”î–fjü&ù@X_Sš\'Z>LM´.Y3+št¨÷`‘{k]ş{JOVô2ñ~™¡öâ%ÇñÒmÜdïN´lº(/·´«JOUôZ—¿ã~.E±Á²,K¹+ÖÏ´ä\"\Z\n\"7:\nH’cîº5â1òr^mR®ØG	¢ÑAv¹+ÖÏd{®í¼«ğ`æÑãªSƒn•ì%¬åc|>üá·1|H¦ÆR§!ÁK¹#‡ş<p§±@¼5~7VNTÇÁÑã¥·ì*<˜iqUòn®Yı×ÔyÙ’W²Ó\\AMóù$<÷ôDÜ>¨î±MEE dŞµIŞ\Z“~q$BğîG«ÍUäë-ğîY3uÀsJğég›¦Ê²lz1ÀôÊNåÙª–ÛvìË¶-Ô­`-EYñÍcÛ´	ü~Ÿ¾œ &—a0B0B($ã¿¦ıCŞdd{…zg$ù<”=D\"ø×¢ÏíWH‚9™°§:±æ@»mÇ¾ì³Uçg$]“xN‹6m.]¹a|@;6Aø+&ŠâÔpJ«D¼÷ÆshÛÔuÁ\nº!\\“W&”¤–8Uv11~ø}|>|>	’$é~oY¦C¸T@Uu\r¾Îß‰ò3UV¿ë›lz¾ŠK€@0÷uşÎñ”Òi©~ÆÅ%­Ëß9ÑÈK]ŸR®»¸{D‹r\r?´4Sé„kGë÷rÓŞqûÍ®yñiim’óöR&wQ/òëòwN¼ÌĞhÏúºéäéÊÖÊi6*C§Éf;á—$Ü=¼¿òäÁíçÅEhG«—\Zm4åFBË>óiÃoû9Ô}åpo?*\Z\\zª\"UÓ«n¿Ù^8š(çv4¤È>ët˜§dı2{ %¹eDÌ†WÛz4RhÛwëÇÄP“ly9;ÛS*}³½p4 ú¢µõÜÖ‚½Y¬-N(ÕGÌg®ûK©bÖï¹ó§±~½Ú®1w\r„c.«Ê“Rè²eå/Òƒê%ÇÖ‚½YêĞ§lÖ]ª÷ïÙwä6bÛ6“¨Ïâ(@UCNº¶m’ù³ëÔdkï²ëqv#»t§<Ã¥¦\\Ñ0Á†İL3K›–š„~}{è–RíOêLˆãA$[5€bÏ¾#·Õ]ª÷ewI’÷î?–¨ÇZ¨”Öã0iÖG`Y»ºivBskÃƒE´^•ÏÚ3Ÿî”ÆÆİ7z:¡U{+5Ö§ÖÑÌ&›}/&µØ»ÿX& .“Ş]¼z ‰F+b1á¨‰T	7‰ñáÎaı\"ZêD³<r¢¥”âÌÙj=~g«Ñ´i´N¹;¤¡y\\lÄe7Æ’®Ï\r×!£}[ÀÔu¡ÊÛÚ«ÕxµQìŞ{x ¥t›Ÿ\"Ïœõæ\0=#–†Úø´L+y%Ü?³\'®i™Aµ¢J­K™ŠÊsXµf+6lŞ…¢eB“&ù|èŞ5Ã‡dbäĞŸ#®YSOy{åÃ‰ÖW’î½{æ¾½„Åfnn#ı‡Çè®Êû~>S„n¬»Ùµ®ØçøıŞÃ8q²i©I=³ÆeM¿İù<L|qkg-|±îŞÿø|òÙ&˜W~D ‡BØ·ÿ(öí?Š÷?^ÉŞ…¬;nÑ\'=¬ÉæùàÃ†˜¬îU;:‘’à¦ºª0[gÖ…èmåpàPq¦,Ë’TVq®U5{Ş²-8·êê\Z<;{>*ÎTY˜vkİp-œp/Å”ÿ‡ÜO×»*—‡ªª\Z¼öÖ<;û-TŸ¿à:A´¿İøwƒëë˜3ï#Åqé¹‚èêóÚ—Uœk%+:ÙCL.”¬Àï_x•g«/ëcïş£øíssq¢´ÌkÂï`ú^Cå™ªË¾L\n…d¼ø·…Ø·ÿ¨w†]êz¬èd©¸´¼{ä\"±Bñ‰Óøİ¿òŠsîÈÁn©\0Ç‹OãZ€.*ÑÌ}Pr¢ÏşïÛ¨½XçX®KãB²Œ—ç.Æ–í…ç!‚âÒòîRéÉòÎ”PP¢^ ê›­ìó—‘V\\Z§ŸŸ‡“§+„·.´[Îˆâëëøß9ïâü…‹ïN<º\\*í‘ã\'1÷íe¶å:\r/á\\€²³ö·7şµù;\"àY¤#ã*=YŞY*¯¬Ê\0àĞò#ë¥§+ñôç¡¨ä´)ŞëxårW¬Ç‘¢Æ9UÍ†ÿà»ÂC®xÑô\\Y–ñê›¹X½n[Äy8ÙéòÊª©¢²*5ÒÜ ¬ò~~9ÑàcVmmşıéúˆys\nà½V@£Œ¹”RüíÍ\\|¶v[Tó\'ÚŠÊªTé\\uMkÏÀÙª\Züî…×±{ïa[·^ J_·i\'j´q·‘ ğ‡#8fc!Ü¬İ\0¡Œ9¯ŒÏ×ò=×›ì½ÚÔsÕ5­¥ÚÚºV¦Œ©æ²n8¨©­Ã³³ßÂ·;kŒuJß´mwrˆ„KlŞ^è‰\'Ñ³Ç†ƒ¡şúÚ\"|ñõ·z<1…Ü•Ì¯í ¶¶®•T]SkœË2c\nğ[UÔ¶ìphù0œÔÕ°~ó.Wæ½€,ËØ÷ã1£LÊòÃÛp©	ŸXÂ¢÷€=?i5x}Ár¬Íßa“Ê:””gûíBû† ¥Ÿ¯©÷ˆ5R_&QÜìÑŸJ2!,;šOšè‡l*¾róOCE1\ráÃ­8S‹/©Ìh~Z†1h}Ac”ñzõ„±$¼p•pIiyƒğ¬AIi¹ğ5,­LbJ!FMŞ,æÇªìÚX	`¤\"å\\cT¹ó¬ìvP3ö¬ıúP½\0EÁ\"ğ2±PU]}oT-Çp´s=“\Z‡ê<ó´Ú¥Ò†ÖÉ³åÕT³a¢ıYĞM=“²a¢ß‰Zæ§F~¿v@µ¹Ÿ2T&[­ws),eãØFB ËÑíërœÏÖjõ»Î€ÖğwGË7¥1	Uï³¦ÎatE/\'Zh	üÀo%çXSÈ×’ÛZÔÃF$ò6aC˜»	ÍÁöX¾ƒasÂáf¦UpZÄÇ5¨‰–$Édq´#¥˜âm¸2ã˜l=cÒÈ D@êD:³fM`î¥œ©áZ±D×¦·”>$·JDll&FÔ™}R!¾™Øô”Ş®µ\r^d`!hL¼ùY\'K|”WcZ˜ÁüóQ‡Bìº?!—5Dù‰‡ˆ-‡¥…(İï÷¡{·k…y©æ»ÛnŒ™ØDÛûúNÇ`>€C2á÷›O\\nxP´˜Ğ¼FŠ‹‹|#7¸—õ‹ûnÇo~u¯’£Íš’MãñøtJ)öë=o®¼ìß[È7Ë“ˆXº!·ş/şñQ4Õ,PX¢¦âG­{FjÙ\"¾Ì>ÃpÆ¾eBöà¸á˜2)«Á]}Ã‡ôE³f±BN\Z\nnìÙíÛ48ïıúöÀ+³¦¢y¼û·7£–-âË¤ä¤Do}8=˜X\'ŒÇ\Z¥¯;mKqH³ƒ	Í16k°5!\Z£cšÛ(“z`…[‡Ş=:áÕ§¡ebã}#,9)ñ””’”Xdİ6sßtK{pì0<úĞ(\0šİp\\•v×„qÃÑ.-%½n¿Ü9ìfÜĞ³³g^\"©_—íóçéHNj!ß°ğÍ^)I‰ERZÛ›]\0~¢â\r€ûï¹­QÏ¦Ò ¶iÌš9ÍL3êè¡s‡4Ll\\ƒåçÔ»3ÚµFÎKÓÕ’G”¹mRZÛ”ÃRzZÊ~1²üy5¢?¦şrL£l±‰®.ÚãÅçeŒ2ÚµÆËÿók4kÖô²Õ¡]ÛdäüéI¤FªdHOKÙ/uÈh»Oy4÷X}ä	cuËÏ{âé\'²]Ç\\7p÷b™ÓúŞxrş4\rm¢üMTß»aî_~‹$õDùpæ\r^V\"<-®m›$üíÅih”ˆpÀI=2Úî“Z\'·<“W¢»}øIãí³+€\0ÁM{\0’dÿË†HÇ3§¼´´ëºd`ÁßŸÁ˜;o…ßgı„„ÓZ?1¡9~;e^™õZ$ÄE4®êârYFñxl^mÛ$á¯³@sÁ;ÚáBb|\\Iëä–g$\0èÖ%½@÷:Ù½¼¯CS¬æg‘eŠßÿ5cÑ@|óføí¯Çãı7şˆì{‡\"5å\ZŸlX\"İ»¤cúc÷aÑÛ/`Ì]Ô%)tHOEçíL[„l°ël¬ZÑ©~éõİ:lıÏ®ı÷jZ$z–\\º\0Ìn?e&÷Ég›0lpß+.¨´Ôd<1y~ıÈ=8yºGŸDåÙjA4kÖmR®A—íĞ\"¡ùç•‡¢’Óú4Ñ:±n,Xö\rô8%öún¶RJ%?¥7ôì¼™ß÷5„C­„è]š0%ıpà8ö,Âõİ®¥WşWú„´m“„´Ôd[ÚpøÑêûÌÌ³SšÛóª5[•g\ncGSÊlšSWÖ¶D5’zvŞL)Ua¹Xw© &ÆW]ÏÿÂP\0Ã_š¨9úù&tïša+@;pÃ½\ZiİğÃÍûÒ¥z¬Yÿ-´ı_J™ƒ…5\\n˜4îZ:ALŒ¯ºg÷úa¤±M›{õè´Àlßõ <¨eˆ+¬•¿á›ïpöÜùË¶ÄøÿéÚ°å;TW×B›Ù˜².i\r4…ß«G§\r±M›){Ú€Ìy63ÃS¢Ìû–æ°–¨à³¯¶ş$z`cÒ†ÚlZùî“¦Í^Â1¿™=óé­ız¯‚öy4]iN…Øó‘÷ÅC!Ó€­[1>î=\\šHÊñÂƒˆÆí™…ÃÇJÕ	ÍÃ¢›2Í@Bä[ûõ^EÕc)õÃHÓR“O]×%#ßXLpÏ¦‹ZÓ**«°y[¡P|#³¢¡\r×®lQ]\"áC{Îûrcf=^¦6 Ä]×%#?-5ùQçB[ôãÁã·‰^¹Q@49§-X˜‡CB|š4‰O’L³Få´;å=á@ „`(„©¦3*ª\nÉ¦}¸ÍÄ+ÏVcİÆ„×[‘ù6¸Ï¢ùÿgèÔTråÙª–<6û„~ÚNxyÖŠÀ´GïÃØÑƒ¯ø+RÚ¥+7`Á«à“$øü>ı´;I\"ÊwêJD¦2‚ê.Õ£îR}ƒlÄø}µÿcV;ÓQ†Üa¤ÕıûöÈİ¼}÷dÇ·ï\ZŞøç\' \0Æg\r1	Ñ.¬s(0“<>.­[O\\²bæ¿û)@)Âû	zÃt¡ş}{ä^“˜P-ËÊñX”Rë·ï5h¾y?Qì¯FöÎ7ÿù	–®Ü`všüğà4¡‹„Öi²´t¥¢\\ŠHäŒ\rÚ{G\ršÏnù(!7õîZĞéÚ¶êˆÏâ|¸ñ.\nŠ7ÿõ)¶şgï_›z¹å®P=‘\\ÑÈU¡ítmÛ-7õîZ@ùÁUÓÃ~gGÎ3t>É2ÍìØ°İåÇ–úy^–WlØ®·ò­Ól8ïKí»ÅŞëJLáğd&¢Í3tú©wæÃ |M‹eY–†\rî»²]Ûä=Ğ½—·5²ÏnkM;Eˆ\Z…Ckw§”\"®Y¬ÊnxVJ’¶]jÒaƒû®du¨®T$Ó÷\nµpLŒ_~èş‘³­=˜™úë-‰a#¢ÖFL˜f*bÂ`ÉúJ‚ˆ‡fúş­¹^Äæki¶\\VY­U®ÀC÷œ­Imùî³í·ƒÁĞò–¯+(*9iô.¦¢–8ÊÅSæ?La––rx„¥u˜¹^MÛ´	cé `‘Ó\Z…ê* F‚/¨BÌaö¬öôöm\n†É\\ÎëQ)ÖáÛ…~¿S&eÍTL¸?€Pbú¤ûŸP\0”8T¥cŸ)ÌŸQéZY6›B\'nzCÑP~F£Z:¥>j]´»&CÇô«HZÊÅ©4S&eÍŒ‰ñëc®evúváÀş7lè{c·åšà©>4\n&SzÁfSnÛĞZ†dYv4Ën&ûrĞRJÑ´IL“%]1Ì³–Æİ	ww¥%mß»-Øÿ†\rJ4ÑÍ²é™ŸVkİ\\»O|ÜŒ¯ºÉa\'Dê³^aãNØtK˜ŸT™ã4Ú`(tÅ—@^.EÁš¹åzƒa–l&¬àháL«ÊÚã«™şø¸¼¾x]êßlàA‹¿6=µè½V¿ğşG_äÀ$~7Ş@ó8¢°[œ€õ#Ñ<¸ÓµëğüKÿ@É‰2H>	>Iù@†Ï\'aèÀ›ğÈwzvGÚALŒßàŸòòáÃ¢üxZÂà‹i\'ñÂµé©EzÜ·5°|7Im•²Ú@A |}Ó¶İ÷9Zz‹1­0éhölm¡> 8ü4>˜9‚	U¾TÀù\'¾/<(Ìá¿¿\0]É|>|ş¢tB|>ŒÙP¸3}Æ;m§í¶L7üõÉ0¾ô­éKãIãÕôİ$S±æ– :ZòÈÔß¿º+9ü˜Æ­µ‡7#®««·u@ğÀ§‡B2^œó>v}Ğ¾\\ª(Y’$<œ=R˜·İ\Z˜M7&>šY¿;­?ÆWóÜÓiÒ$&h¢´±Äc0{uîĞîÈ”IYÓ­c?–Ø<S;:QšB[sábDc¢,SüõµEØòm¡}™LÙï}´\Z.ùJTØ•y[\ZÎÅyÀŸ2)kzçíhzÒ–Gv—ëÌ‚,Ëwï=<dÓöÂÉ\"\Zûs$@PÉ¸*½“²Lñêücİ¦ÌŒÓŞ]ü9(•ñpöBsïTî¥ú\0¨†Éºpc¯\rê×û½qYC²ºQ,ˆØ\nÌw“¼\\\0ğÌS¦¥§¥ì$”Â|Ö¸è®İ{ã­÷V½°º\0\0tIDATàäéJOkR™R¼öö¬şj[Øe)=ù¼»xµ«‹“-·¤´û~<…à‰6=-eç3OM˜è®H]\'Z˜ÿ~°,Ë¦ÁC°İ\Z\\QÉéŒiÏäl?á¢Ë9—\r>‰àæ>=pß¨Aè{c7a¯¢˜ûÎR¬øâ›¨Ê\"\0²ÇÅ¯\'ßc‹†ğÍöBä­Ù‚ï\nAÖ‡˜H-–3mBóf§ŞxeF¿ŒömŠø47Ş½åvÌ|vö[ëÁ`ãşL‚öi)s×@ÜqûÍˆW¿\nÉÈ™Ÿ‹Ï×n³sø…]Îİ#úcÆ÷«3dNœ,Çgk¶áË¯·ãLÕù¨Ëñ1~íË³zSï®îØVğÔƒùxªìËk7ÜıçœVÈ}ªˆâb›bÄm™q[&>Z¾ß|»§ÁËÙ¿òAî=Œ¼5[°k÷Aµ·*À.lˆÙûì\n^h%‚àg<<føÌÏù4Mì2I4o\"ü:8\\øì«­Ù9oæ.’™%¸ÚA\"dê:j5|¹ òŒßdO5b@n4ùøÅÉ*ší­Z¼†ÃŞÕôÜ` ÔdŞ‚eïRPIûé\Z¥ŒK•ns„iÉj¼€VÁc§£	ı?¸¼Dî6–<­øºó@T®J „)(×¯/_Gj˜\"O|Ü/GËÈYé€·®||Äc0«ÖlÉÎ™Ÿû¥ÔoQ*S3‹rmÒD`ñõPc…Á*GärjT~$‡2LÕ£°x)õr9M›˜™V\"$8cjöÃ£GŞUÏÕÀ¯­£ø¬ÙtÍÆ¶\nÖŞ3cAn³Ø¦Õ/Ï]¼$Å™ú!œPŒ^cXv£±´åÙÛ\nœ)—)ÏÑ¥GhÕ_\\²|è<ª	Ú9 új_‡¿¯öÙ§&Üû >_h²ÈÙ¤·çh<BØ¹ûÀÍ³şú¯55æ%%Ğ7K,`×u/k7ºòìÊtÊK€ßìÔì?üjLŸº}kCM4Ûz—˜%Î¿øDYûç_ZğIÉ‰²>z-t{,âÂ¼Q¡÷\'\ZÛ\Z¹mz4$­ª¨ÏÔi€)‚ô´”/=ÿø}éíZ—xcÓ,o‘ND¥6(œ¯©{eîâ76oSİš^[t´M^\rÙƒ=ÂÀş½ß{æ©	Óâãj#(Ù,Ë$v»P³é€u¦-Âcq´ğ²¼“ŞY˜7/ÅÛ÷`p‚Ñzï¥F—³stôæVàñ×L™”5}\\Ö…€!/v«õ3óòÕäÏÆó´„ps¯®ÊpáĞÑ’.ùû¢÷•ıd‡º7\\±ìİUÙ©cÚ–çøH—íÑÉ=\"W¥“M\0 ´xÙÚ\'-ıêÅ` Øx4^Å6Úã¯™8~ÄÆ\r{QÎqµ-5Ü1¸±z0Ç‹OeÌ[°,gÇ÷Æ6T§½Ú\0è{c·åÓ7ƒ}ÍFƒFíÁ‘¸*ù×gØí5vlĞXğ·|»gğ;óæ—œnØG3G=VXéÓÛ·)˜2)kæ-7÷ÊÉÊës¤´–Àq¹!!Jk7ŒıpÉšY\'NUöºe6ğíR“ö<tÿÈÙÃ‡d.×Ì±\\µcpCA0Âºü÷ä®X?óÈq›‰ØO:]›¶%{ÌĞ9Ã÷]é÷ûÜ	\Z`nNÎl/-ß¶â—QN´²,K»\nf~úÙ¦©ÛvìË6Ÿ4põ¶ã÷×öïÛ#÷ŞQƒæßÔ»k×Ş(rVØ½B)mÔÛ…^€¼¤­:ßâëüã×åïœøã¡¢Áô*Û$ òu]2ò‡\rî³èöÁ}–^“˜P}¥yPÁáô`»m+œòs£-=U‘úÍöÂÑ[öfíÙwä¶@0ÔÂìÊ56\rD»DpÛÍiuÇø}Õ½ztÚ0 ³gŞ­ız¯JKM>åuÛN$7Üphy™5øváå‚ºKõş½ûeîŞ{xà\r8p¨8³ºæB{§ıg¼n&Æ7/éÖ%½àún¶ŞĞ³óæİ;Ä6mÄO]•¼ËÌe»0¬m¬†¤-«8×êXÑÉÅ¥åİKO–w.¯¬Ê¨¨¬J=W]Óº¶¶®Õùóâ¡|„S{µ( .!¡yM\\\\ì™–-âË’“O¥$%¥µM9œ–²¿CFÛ}­“[¹\Zëíÿ°E\r]C«\0\0\0\0IEND®B`‚',1790768769,1790768769),(4,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0x\0\0\0x\0\0\09d6Ò\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0 \0IDATxœİ}yxEÖ÷¯úŞ@	A’@H \"›È¢#d‚Èâ%˜QPdFetæ}ÑqüüxxÇQ¾•™Qq@\',Šq²h\0%€È\Z²B$!„{o×ûGoÕÕÕË½I\0¿“§ÓÕUçTªSuªÎ©¾ÕD–e	?s¨¨:Ó¡°¨¼oqYeŸ²òÊ•Õ5iUÕ5Égjë:Ö×7t8[WJ£øU’ iˆ‹©‹‰‰>İ¾]lEbBüÉ¤„ø¢”ÎIG»¦$ì–Öù@ÇÄö§/e½šˆWKD’e*KüMcqµ0ï…VTv¿Ğğï?X˜¾wÿÑa?*zèHqzÍÙs]Œ\Z€ê?#Ô%n\rP)>®mIï]ó¯éİmûµızlí×§[~ëVQA–\'¶N¼{Áqº{iÑ¸Vú2€²SUÉ_ï,¿=æ¾Çnƒí\0(#\"…!ÌpÁm”ß_Û¿o÷ÍCÓûåŞ4xÀ§)O†_ĞÅË&„€R\nBˆŞ{´x¶wPPIÃåÓ\0€‚J\0@™QÁæKˆ\"-]K€ê35í¿ÌÛ=icŞî)?)Ê\0¨d¨æï€à¹š;áxÊ›ÈW÷LË•1pÙ-W^WËk#Q›²m8kF–oG7Zæ²\ZÁ2•¥=‡Ó?^»å±»dƒ¡W\"‘ìpœèœè]Êôû}õCõÍ¹kÜğÅ×è•ÏªnoÙQIëØÍ\r—…€Á ´1o×9k6Í9~¢üÆKÍOSàª+;oË0rş¨ŒAŸDùı-\"´pÀ$`~áĞÒ¥\r_åOü×ŠõsËNVõwT³pˆg;©½(?/t<Ë…S:\'î»ÿ±óFH_})í8ÛÍlœ(İlûf_ÆÛKsç•T¤ëêÎÂM¼°4áÒó*Û+\r`;‡§ué˜?}jæœoèŸçÖVNé|šÛ³±íàâÒŠ.‹–¬Z°ëûC#é?G „`Ğu½WÏ|$kv×Ô%µlJéEp ”–¯Úğø²•_<†b/F™<L/Q~_İ”Icœ5úµ¨(³Ú& ²fu„N´D–åµ±´V´•¿Ê­úXÓ‰O;RXÒó…W–½wôx™xe§V]ÔŸ‡}‡/ÂáËtË×N}€P\nJ¸ÂEyR ÇU)Û5åÁİºš¶öq£mí4¬ÊıjêÛKsé£VĞ8z¼“p©–·âlbN&”ÁØæ+›¯;ÇœŸ  DÍÓ§fÎÌÊ±-ÔìBW£›;N§İÏ«yiáò×·ì(˜¦–¤4Ç\0åÒLòs‘D 4^Ä¦_$å©“€©OŞì6dÀ»O>1yF\\Û˜z\rÇ©ípl]•-1—Vtyæù%—VTº,ôîO¸aJÁ®Ø¡\nuª PÒ¡8ÕªS¨´Œæ¢ÄÆ†¢\ZòL”’3Õ§(åh#Vã•¹ƒ¨Ş%B38”@gŞ¨(QqTÚ®)I»Ÿæ‘»[b&QJ•Æ‘uÓGCõ9X×ğ´46¬¥í)8œ>ãÉ;‹Ë*(*Ik\\£éÍ!],ŒJÔ1(¨!ãNÀ‹’híH©¦\0¡<ıâùRh¡ÒjåòxoÔÂÖ‘Ù\n±@«¤´bàŒ\'ìÜSp8]“‡š—Ş®ní®°#¢mFKeC^ş/.\\¾\"Æì+½Ô\"¯¿¬iÚ0&=n$è´ÌéìdJ<k¹öqŒĞ\\iŞtÍi(§…Cë÷ûêŸzbò=£3Ò?C3£Šf—ßìÊš½k¸Ÿ®ß–½`qÎû”R¿)“¡É`›/Ó€^Ê6áØLÂNù0Óãn”¿-!$8û±ì2ÇŞô¡[Û»İÚfÁ­Í›ºhÉªwtk•vª,ì*ÌVšÁ­ÎÌ+÷l~a˜ïn¶+-‘g>’õë»Çe4y…-4“ì¶½t\"f[/wı×÷.x#g¥Tò,W{I\"Cr˜£Ô…7®‹ÀœêÄÚN¢¥³0q‡$ òìßeO7fh»5(òÑF*¿u«Ó«2òÛÉ^ï\ryùwüeñûïS„A¥Üâ=€ÏçÃĞ_öÃø±7¢çU©xşå÷±§à3Q8¼©‰·\ZŒÌÛnÂº\r;°á«|œo¸àŠqËx\n*-Xœó~›èÖµÈÀgD6/\r”¦É‰O×ñ\"5“öNjŞ››‚Á`ŒÎgKÌµ*$wLÀ£‡à¶Ñƒ‘Ø!^‚xiÑrlÌÛ°Õ#o”\0¦L\ZƒßL¹Cß4¯««Çç›¾Å\'ë¶¢¤¬R\\ë<íµ|3øışúç>:òú½òù4»õ‡áÕ«Ë¬¨ôTÚŒ\'ì¬;WŸÜÔ\nXp\\ŸÏ‡!éı0~ìP¤_ß>ÉZÍ4xõí•Èı|</°ØtF]N»ïv<=Ö´›¦,ËÈÿîG|üÙ|³ëÈ²,ÈÃCÙNøõsòõ—fNKíTä’«l·íà\\}Côïæ¼¼¥¸´r B\0óœ*bÖKe8Üzá³¦ )¡½ekÒn+sñ;k°ò“ÍfKÇ‰Î’zğŞÛ0õW·Ú·–Ê\0”•WaÍç[±úÓ<C²sş¢öñØ\Zm×Ô¤İoÌÿÃğ¶1Ñ\rr ID’µKáÈ|~iáò×‹ËáZZ€«|ïÚ±Ê­ÿ5W!±C¼I€¬Ã…½kğØ¯\'àŞ‰£@De8Ä\0“\'v®V&¥“ğè´	èÑ-Õ‘»‹âÂ˜QŠK+¾´pùë€!OÕ/BØg>nUîWSuß²Æ Ï$åÒDéÒZ·ŠRV‚a^<0“³F+²cË•«†³2Gà¡)ã\"*/¡C;qı#—°eGÁ´U¹_MåeätI¬+LäÓîGK»¿½4w‘c%šÁ¦Ö€ûœ¦QÚC÷Ã}YÜH¶qc†àw¿¹K85y)7¶m…_÷¢lÁ‰–O{{iî¢£…¥İE2] ,®4»WSJ¡İÿ¯,{/Å‚¨æTG³~ÙÅë\\êñÔ†•NVU¡H-Û©jV ß?÷Ş}Ã“õ\Z9ì˜ıX¶0¯åF·n¥–ÈÖÃÜ„›Òmhµ‹rÏ`(ö…W–½×øy™‰.?`vlˆ¶—¯Úğø±Bc³Şì_e5Š:±Ù¬µ]=R[(	ÒC¡xÍÇvÏ\0ğÈÔLH’„mßîƒ,SÈ²Y–\nÉèÕ£u?$É}ì9•ÛªU”ìVSJ¬¶«%¦5vÎ¬¹-,»qùª\rO»÷öWD[‹€!?¿6Çêm®ÙSD	•ê²låÏi„Ê†µÁ80BL+Y\rÛ0;(ƒGblL(Ûh@ 2©éHááÆãáÆ79;ğû}–8búO 5!Fçg¶b8:è‚WÖ\Z­‚¬5É²•_<wbØÉÕ¤)Ñäg²…Õg‰UI¢íÂEKV-ƒ±Æ‰Z<U˜5*\0=]—…¾ıFØÊª[€Ú–™¾ bî\ZFaÌÁ‘Ì£‘ÒRJá÷™L@Õö`î\nŸ(WµM\\V[”\"Å.Z²j¿nâ×T¿¬f…»uçŞ›w}h¢¡R!(˜QËzµ,p¨&e¶2ĞHµ1h–yOÔù4·çæ¤\0I²îUƒ¡Ú334õF)Gk¦£BZ£ùv}hâ¶oöe¥™UÓ3I»\0å¥ô·—æÎ7z!³íMÙ’T¡°Q–ù×¨8ÍVÒˆ\Z.4ºš(\nzø¦MsÒJ¼wMkSy4/ÁŠš§egcàí¥¹óÁ .7öNA%I´´€\r_åO,.©H´…®ˆY\"àÍÆ¨%¬M½’ñ–­’@CC£·F¹Äàm Â±:Oq—œJßğUşD‘iK@ÄKë@0(ıkÅú¹VsÇé™ŠïlılÌ$bÂQâôİ@¨\ZÙ4Ñ³È¼ÑŠÌQ¹Ni¦Î/0u,f!›æ‰–Sí¿V¬ŸM2ÔG°È½µ1o×eåUıM¼_d¨?Áq¾t›7Ù»-›.ÊË-ír€²“Uı7æíº“_Kë,SYÊY³i%ÑT	¸ÑQ@’|˜pûMÏ‘óê”tÄ*¸‰ šÚ.gÍ¦9ìÈµƒ÷N?~BujpÓ­£½„µ|ì€’Ï‡?ş~\nFH7¢Ã0uš¼”;vä/ñà½·*à­ó»á°íDq?Qvã‚Ãé¼<ıü«9s×şó1{KÀÙi­ ¦ù|5·¨;Eìæ@SQÙm[ÔKŞ\ZSu+$BğÎëÌUäëm±.D™:à9¥øxí–Çä²éÅ\0Ó+;ÕgjÚïØu Û¶P·‚µ0aÅ¶FtëVğû}º9A)L.Ã`(„`0„PHÆÍøF»ŞÈöÎHò¹?{,ˆDğÏeŸÙ[H‚5™p¤:±æ@»c×ìŸjÎÎNhF‹ö³î­•y›\'´c„¿`¢ˆ N\r\'uˆÇ»¯?6Ñ­]Í¶¡›Ã5y)aÊ¤1HJh“§å‡ß\'ÁçóÁç“ I’î÷–eŠ`0„ÔÔÖáË¼İ¨<]cõ°¾IÀfä«¸C1_æíDï¤ÿÔRıº‹TÚ˜·{Š‘—jŸR®»¸cÌ‹p\r?´Ø·3ìpíh½à^lÚ[o¹Á5/>-¥S¼µ’É]4Š¼ÁÆ¼İSî¹säßµgİn*?UİQ9ÍFeÈó2Ù¬\'ü’„;FQ<¸ı¼¸íhõR# mJ¹‘Ğ²Ï|Úè›‰8u_9\\à»ÀGŠ2ÊNU%krÕÕó×;ÆS@åÜF+²†ó’lpz_$%¶ˆÙpár³G#…6Ñ­pÛ¨ÁL5µ-ßÎÎú”J_ï,h¯ö¨öÜöüı™¬-N(ÕGÌg®ûK©¢Öï¼íça¿^n×„Û‡ÁGˆ±–UÛ“RèmË¶¿Hª—Ûó÷g¢lK”R4\\hôï;pìfbÛ7•¨¯â(@UENºÎş‹«ÕdëèrsÚá9yì<R^i›R®hš`Ãnª™¥MINÀàA}uM©\'u%Äñ j[5€bßc77\\hôe×ÿÁÂô@ ØNL¥ô‡E³8~ìP‹íê6§Ù5šÛ\\Î,¢õ*œpxÖùt§46îîñÃÕ­:Z©aŸ\ZxÚ@3«lö½˜@ ÔnÿÁÂt@5“ŞÙ¿n˜‰F/b;1á¨‰T	·Šòá¶Qƒ#2ušb9ÑRJqú§Z?QªŸjÑºu+tLº=º¥ mLtÄe·„I7ğÚ«‘Ö¥ŠŠ­G`ê²PÛÛ:ªÕxµSìİt½îğyÎ¡7†ê±4ÔÆ§e²ä•ğô~¸¢}\\Õj\ZPj5eªªÏàÓõÛ±yë•VUšäó¡O¯4Œ‘±#‰˜6­=åí•\'Z;\\I\"¸ëáXøÖ\n›¹¹yBŒôÕ]•wy&]„nØİ¬­+ö9~¿ÿ(JË«’œ`Ğñ/x{Ptçó0ñÅÙÎZø|Ã¼÷áçøhí˜W~D ‡B8pğ8<÷>\\‡i÷İÌ[oÔ=¬ÊæùàÃF3Yİ«vt\"!Àõ×öR\'`¶Î¬Ñ›åpèHqºLeIª¨:Ó¡–=oÙœ{Ommš·U§k,L»Íµn¸N¸ÇN”aúìÿ‡œ7¹\n—‡šš:¼úæ\n<5ïMÔ=çº@´›¿İøw›ƒ˜¿èÆq¹‚èÚ³çºTTé •÷S…eåUøïgß@õOµÕÄØğ8~ÿôB”–UxíàBØõİ!Ìüã«¨>]sÑÍ¤PHÆs[Š{gØ¥®…Eå}¥â²Ê>‘7‰ŠKOáÿç5TVqGöNÅ§ğ§?/Á¹sç•ˆ¦¬}PRZ§şç-ÔŸop,×‹¦ñ\n!YÆ‹—cÛÎ‚ˆóAqYe©¬¼²%”¨ˆúf+{çÃüe¤—UbÖ3‹P~ª\Z@xv¡9#Šolàæ¿ƒ³çÎ3¼;ñèr©´ÇN”cá[«lËuš^Â¹\0egío¯ÿòvEÀ³HFÆUV^ÙCª¬®IàĞó#e§ª1ëO‹PTrÊïu¾ò9k6áXQËœª¿~ó·ø®àˆ+^SF®,Ëxù¬Û¸#â<œôteuMšTU]“inPQ}³Y„#ÇJ›}Îª¯oÀ¿?Ş1on@¼ûÁ:\0h‘9—RŠ¿½‘ƒµv4iİàD[U]“,©­ëè™\"ø©¦xö5ìİÔÇmˆÒ7nÙ:mŞm!(øá\nm4„›ö±›’\0 ’1ÿµñÙ~äzk{¯:õLm]G©¾¾¡ƒ)cª¹¬›êêğÔ¼7ñÍîÂšcÒ·ìØÛŒ¢Æ¥\0¶î,ğÄ“èY‹cÃÁP}u>ÿò=˜BîBæ-d;¨¯oè ÕÖÕ§À²Ì˜üV5…-;Z>\'\rlÚºÇ•y/ Ë2üXh”IY~X`;.5áKXô°ï‡cÍÂ³¯-Y\ry»lRY‡’òl¿]hß´ô³uõ±~\0ÑFŠáË$ªƒ›€=úSI&„eGóIıMÅWnşi( ¦9|¸U§kqşü•ÍOË0m,hŒ2^/°0–„o\\%\\RVÙ,<kPRV)|\rK+“˜RˆQG“7‹yãÆÂ±Úö\nm´0GR‘r®1ª\\„yVv;¨™N{Ö~}¨^€\"`x™ÏX¨©­ƒ¾7ª–c8Ú¹‘IÃ?uyZíRi	CëäÙòªªÙ0Ñ~,€¦‘IÙ0ÑïÄ-óS#¿_; Ú<N*“®Ö‡‹¹²ql\'!å¦íërœÏÖªõ»Î€Öğw7•oJ)$bjT}Ìš‡19¾œh! %ğS H\0¿•œ`U!_KnkQ‘ÊÛ„Í¡îÚÅµ;bùr†a¬-‡/˜™VÁiÓ¬*Z’$“ÆÑ”`Š·áÊŒcÒõŒJ7\"ƒiÉÌš5y”rª†ë=Ä	\\Ùµ“ ”ğ!±C<¢£[11¢ÈğÈì“\nñÍÄ¦§®©mğ\"ãÈA‡dâÍÏ¢8Xâ¤¸¸˜:ëÒÂæŸ:b7ü	AVæå\'\"¶LQºßïCŸŞW\nóR	Ìw·İ3±‰vÀ5İ=ÏÁ|\Z\0cF¤Ãï7Ÿ¸Üü H1.®m-øFn8\râ^Ö¯î¾¿ûÍ]J66%›Æãñé”R< é¼¹òN0lÈ\0!ß,O\"şY`éFÜô<÷§‡ĞZÓ@a55?Zh•ˆ˜˜èÓRûv±ö†3÷ğ¥(²û²FcúÔÌfwõ1mÚD9i.¸®_¤uéÔì¼Ô/Í}mcİ¿½Ùhß.¶BJLˆwğÖ‡3‚‰åqrÖh<|ÿ8İî´-Å!ÍÚÅµÅÄÌkBS”im£Lêunôí—Ÿ›öñ-÷°Ä„ø“RRB|‘uÛÌ}KĞ-í¾‰£ğĞıã\0@¨vÃqUÚ]“³F#5%)½n¿Ü6ê\\Û¯‡g^\"©_Ï«R±à/3‘˜Ğ>B¾aá›½’â‹¤”ÎI6»\0üBÅ\0÷Üys‹M¥AtëV˜;g\ZÚ˜VÔM‡İR0óá¬fËÏit§¥vÄ‚çgª?$(sÛ¤”ÎIG¥®)IÄÈòçaÜ˜!xì×Zd‹MtõìŞÏ=ıs¤`Ó -µ#^ü¿¿E›6­/ZR;\'bÁŸGr¤B¶®)I¥ni(æ«Ï<a¬³nüe?Ìz4ÛuÎuw/–9mĞuWcÁŸg S5èºŞXøÂï‘ (ÎºÁ‹E ÂÓâ:wJÀß›	ñœÄÓ-­ó©cbûÓñ±1%ºÛ‡_T0Ş>»\0‰ü×Œ{!Iö¿lˆt>sÊKK»ºg\Z–¼ò$&Üvü>ë\'$œlıø¸¶øıô,¼4÷Q´‹‹‰h^Õ›ËÅŒâñØ¼:wJÀ_ç>Š¶‚w´Ã…øØ˜’‰íOK\0Ğ»g×|İëd3õò¾M°šŸE–)vÿc“k\nÄ¶mƒßÿvŞ{ıOÈ¾k$’“®0ñÉ†%BĞ§gWÌ|øn,{ëYL¸}X³º$#…n]“ÑãªTÓ!ìë£VdªFzMïnÛ¿İsğ.MŠDÏ’Ë@o\0³Û@YÉ}´vFeºä\r•’œˆG§MÀo¼å§ªqüD9ªªE D›6­Ñ)é\nô¼*íâÚ^r^y(*9¥ïAmÀëÆ‚eß@Sb¯éİm;•ü”R\\Û¯ÇV~ß×LJ±¢iÂ”ôÃ¡8x¸×ô¾”^ú_éBĞ¹SR’miÃáCD«ï33ÏNinÏŸ®ß®<S;8Z˜RfÓ„˜†²¶%ª‘\\Û¯ÇVJ©rËù>ò£¢|µü/õ`²ñK5ç?Û‚>½ÒlĞÜp/GZ7üpó¾p¡ë7}mÿ—Ræ`a\r—›&»–Nå«í×§[¾~itëVÁş}»o&0ëw}$(jâ\nkåoşú;ütæìE31şº6oûµµõĞV6f¥¬·4„\nšBïß·ûæèÖ­‚”=mhz¿\\›Yá)Qæ}KsXK4°ö‹í?‹Ø’´á€¶šV¾û¤i³—§pÌohz¿\\ÂFzÓàŸ‚(\'îBs*ÄÜÏ·!\n™L\0¶\"lÅøp¸÷pi\")Ç\"\Z·g–©/š§E7aš„È7\rğ)U¥Ô#Mé”xòêiy†1ahxÂ=›.jM«ª®ÁÖÂFà+ÉœÕÚpqíÊÕ%>´çÜÿlcÔ¬ÇËÔ”¸«{¦å¥tJ<IÔÃÁÍ¡el^öãá7‹^¹Q@´8§-Yš‹\".6­ZEÁ\'I¦U£rÚòp B0ÂUiÉ¦3*®\nÉ¦}¸­Ä«ªÅÆ¯òŞhDêsTÆÀe‹™šŞ½¬>SÓşŞ‡ç•ê§İé„ÇV$\0f<t7&Ï¸ä&V¤´+?ÙŒ%ï\nŸ$Áç÷é§İIQ^¸S-™ÊBh¸Ğˆ†Í²å÷Õø÷¹©¦£M‡‘Æ£vÈ ¾9[wîæøö]ÂëÿøÀ¤Ì¦F´ë\nÔ$ÏÇ‡Kë6W¬ÙŒÅï|PŠğ~‚Ş<ChÈ ¾9WÄÇÕÊT9‹Rjıvá]ã†/6ï£	û«‘ı„ó|„•Ÿl65vZüğà´ ‹„Öi±´òE¸‘´WSÚØ ½kÜğÅìàÂo^? W~÷+;«3>;‹óá–»((ŞøçÇØşíşKn›z¹á®Q=‘\\MiW…¶û•·]? W>åW¼%Ìwvˆ$gO9__d™VvlØîò‚ãNKı¼/æ¶­<„Cë´\ZÎıöİbïu%¦pxm&¢Í0r¾D$ı[†J¬Í·Geú$µsâ>èŞ‹ÛÙg7[ÓN¢NÁ_áĞÚİ)¥ˆi­²–ÒŸ›H›šœ°oTÆ OXRª|{Òô½B-å÷Ë÷ß3vu3K½\'±1¬sDÔÛˆ	ÓLELlCò\r})AÄC}ÿÖ\\/b	óµ4k.k[­µ]ûï;Ïç“À¯§ôÃHµùWSPiôˆôÕi©ÕãáùQ¦õ#¶²Tgi¨¥ç‰3ÂæüŒr©çW/WtëVœ¦3×”*”;ßF\Z­p§Ö0aâºvé”?zDújVvš<õ9˜W[Döû}˜>5sb\Zî ”˜>éÃş\'\0%UéØg\nóç„@T:ƒV–ÍªĞIÅ†›Ş\\´\0”ŸÑ¨šN©Zí®µ!‹cúU¤-åâT\Z‚éS3çDùıúœk™ƒ¾]8lğµ›]×{µÖğzÇáÔ°I•›\\—àÂ6´–©@Y–Õ²›Ê¾´”R´nÓbIó¬¥qwÂİ]i‰A;èºŞ«‡\r¾v³šƒ®–MÏü²Zs]j÷™dÍöGùê\0ö[zœjÖ+lÜ	›n	S.lÓhƒ¡Ğ%W¿^.EÀj=øÑ`¨%›+8Z8ÓªmíòÕÍ|$k6//^–ú7xĞâ¯ì’\\ôî¤uÏ¾÷Áç´˜Îôà{¨]Ø-N@Àú‘hœ<L\0P¾Ï<ÿw””V@òIğIÊ2|>	#‡]ï½Í–Ş-o\r¢¢üÿ”o>,Ê§%¾˜vÊ¤1Ï^Ù%¹ÈÈÁüíB\r,ßM\"„(ºTÒ*È\n¾¶eÇŞ{/»Q[š™tT{6„¶ĞP~^\\Z¾ĞÀ³/üßæ¿ôßÿ\0]È|>|ş¢tB|>ŸZ·ğëhĞx§í~Uê¶ÉY£_›ãKßš¼44^ç`í¹UTTğéYSTTµ›x¯éÖ«¡¡ÑÑáä”Cxnş{Øóıaû2¨\"ä÷sÖ‡eóéæÏÄ‡WG3¸ãû£üuOÏšò`«¨¨ ™’È¼›’ˆ¾]h§Ë{tK=6}jæLëÂÏ%6ÏÔN”¦ĞÖ;Ñœ(Ë}u¶}S`_&Sö»¬Ã¿V|¡4TåQ™×¥á\\™üéS3göè–zL“o…=³ gÊK÷î?:bËÎ‚i\"\Zûs$@PÍ¸*½Î“²Lñòâcã–İÌŠÓŞYş(•ñ@ö­BuïTî…Æ\0¨†F™:0+c\'>xÀ»Y™#–²²ÑÜËv4ÂïÛ]\0ğä“gtMIÚM¨bp`kÚµwÿQ¼ùî\Z”Ÿª†Ÿñ\0\0ƒIDATöd“Ê”âÕ·V`İ;Â.KÉŸãåë\\]œl¹%e•8ğcaÚ\0h»¦$í~ò‰É3\0Õ©¾’(Ú–—•gÚğ×&l·WTz*mÆ“v=wŞåœËæŸDpÃÀ¾¸{Üpº®·pTQ\n,|{%Ö|şu“Ê\"\0²\'ŒÄo§İi‹†ğõÎä®ß†ï\n@Ö§˜H5–3m\\Û6\'_iöà´ÔNE|š›Ì¥T²Kt‚=‡ÓŸš÷æ¦@0Ø²?Sg€€ KJ&Ü>·ŞrbÕ¯……B2,ÎÁgvÀì>¼œ;ÆÁìGïQWÈ\n”–WbíúøÏ—;qºæl“ËñQ~ı‹syı€^ùîØVğ4‚ùx\n*yC^şYğş\Z™¢¥O±@LtkŒ¹9cnNÇ«7âëoö5{CÓûâ¿¿û\"wı6ìÙ{X­\n°†ò»ï#Ø­DüÓì&ŒÎHÿŒOÓdÀšI¢u‘e9¢¬ÁÚ/¶g/x#g™ŒÈ4Áå‘ S×Y«ùË‘gÿ.{Ê¸1Csš’Pü—¬Ãƒ­Z¼†ÃŞ@#ç¡V‹–¬zGYš+~UJ—*Z_åÍ{=^@«à±?ŒÓÎÑ„ş\\^\"÷KV|fÆZ®J „)(×¯/_Gj˜\"Ï|$ë×ãÆÍÑÛ™k{‘,DxÏÁ<|º~[ö‚Å9ïSJı¡25³×&M_5,V8\"ŸS§rô#9”aª…ÅK©—ËIÚÜÁÌ´!ÁÙe?0~ìM\Z¹\Zø5;ŠÁšN×\\`l¯`õ½>Œ‘sÚD·®}qáòÁ`(Æ4¦á\ZÅ5æ±e7›KoQ½YàL¹Ly¼Jœ‘€VıÅ%Ë‡Î£š ªÿ§öuˆòûêŸzbò=·ø¹Öö–vædàöLÄİ6rØ]pè†¹ıçšº:³	E	ôÍØ\r]Ûaå\0®CÒm¸ *Ó)/^ll›“óşø›	ôşÆ†*\"ªh¶÷è.1Aœ~qiE—g_òQIiÅ@½º>qALiúXq¢±­	Ÿ&bZU:\ZQŸ©Ó$S\Z%]S’v?ÿÌ#wwMíXâ­Ts{‹dbà6óÖàì¹ú˜—.}ëÕ­éµG7š’Ws`0lÈ€wŸ|bòŒ¸¶1õ”ì\n3‰İ.Ôt:`]i‹ğX-¼*÷«©o/Í]†bíG0¸†ÑFï¥Fsstôæ^àò×MŸš93+sÄRÀh/v«õ3óí«µ?ÏÓ*8¸*Ã…#…%=_xeÙ{Ê~²Cİ›.Ùöîªì~UÊ¶§gMy°g·.G€¦µ{D®J\'	\0Aiùª\r/[ùÅsÁ@°åh¼Œu´?Ê_7eÒ˜g\'g~-*ŠyQÎeµ/5Ì9¸¥F0\'JN¦-Z²jÁ®ïMl¡éÿ²`Ğu½WÏ|$k6ûš-:‚#qUò¯Ï°ÛkìÜ =°àoûf_ÆÛKsç—œjŞ7enò\\a¥ïÚ¥Sşô©™sn¼¡¨­¼>GJkÁ\07›Á ´á«ü‰ÿZ±~néÉêş£Ì–~Ã 59aßı÷Œ7zDújí½e;¸lçàæ‚`0„y»îÌY³iÎ±6±Ÿ	t¿2e[ö„‘óGeúÄï÷¹´0Ps/prf{éiü¶oF9ÑÊT–öNÿxí–Çvì:m>iàòm$Êï¯2¨oÎ]ã†/¾~@¯|¯£Qä¬°{…*RÚ&oz~~ğ’öSÍÙv_æí´1o÷”e\\Lâˆ|uÏ´¼Q—İ’1påñqµ—š\'Î¶Û¶âÁ)?7Ú²SUÉ_ï,¿=æ¾ÇnCíÌ®\\cÓ@´KÇ°İÙœV—q”ßWÛ¿o÷ÍCÓûåŞ4xÀ§)Ozİ¶µ…n8´|›5ûváÅ‚†şıÓ÷î?:ì‡C…C)N¯­;×Åiÿ™¯Û…ñ±mKz÷ìšMïnÛ¯í×ck¿>İò£[·\nâg®JŞeæ¸]æ6VsÒVTéPXTŞ·¸¬²OYyeÊêš´ªêšä3µuëë:œ={.ÊG8µW‹‚\0\ZââÚÖÅÄDŸnß.¶\"1!şdRB|QJç¤£]S’vKë| cbûÓ—c}Ã¡ı_¬<ïÒáˆ8\0\0\0\0IEND®B`‚',1790768769,1790768769),(5,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0˜\0\0\0˜\0\0\0Â !\0\0 \0IDATxœí}yœÅµÿ·úŞY‡deQDÑÄ]P!(O%ú¢bŒ+1ş11Æ QIÔ˜çn1.ILx\Z—ˆ\\\".€\nèÈ( 0Ã0ÌÂÜÛõû£»ªOUWu÷½3$úûü\nzººêÔ·N:}êœê¾÷2×u’ã8®¨yZ¦ÓDµoOy¾X\"¯óKËZ[÷9ÛjvöÙ²mûàm5µ‡ì¨İİ¿vg}ïºú==w74V67·v­oh,Ëºn)€b\0ËĞ’rœ¦Šò²Æ’’¢ºÎåeµ]+¨©ìV±­{eçÏz÷¬ü¤oïëz÷ì¶µ¨¨ĞÍ…¯$ÉÖæ«†Å\\×ucàœ‡9çç¢1\02ÏÑ\0Pèõ2ª:­ŞàA`é|‰:¿Ì€––ÖôÚ\r[F¬Y¿ùèu·µaÓçG|şEmU6›-\0¿O\0B\ZÌÿË\ne]Ğ†¶£å©Tªñ ^•k8hÅàCû¾_5¨ß{Cö­...Ê˜Æa’sœìuùŠq\'Å²ÕEaé²IÇRk\"‡1æšê¾.©­-ãT¯Ù4òƒ•ëN]ñÑúSÖnØ<®-“)‡?ùáSµò‡÷óÜ¿\"Š\'ÿªXzBñ\0‚tºaÈÀ~‹8lĞëG>øµU>,(H­åmKFËá¿š™ö¦¦æ–â%ËVøÖâÏYº|õÄ½M-½Pç“nÁ aú(\Z7\\3 Siñ¶1£†Îıæ±#Ÿ;zØ‚Ò’â–øÑ~=RÎ\nöU³nmmgéòÕã^]°ì¢w—­šÒÜÚZÙ€(†MBÊÓÄ\0p¡¼¤¨¨ö˜ÑÃ=íÄÑ3jè\"İ²å\"ÿ¯Â\\1á£„*|Æt&)½ğÄÙÖ>ªÌÔW¬šíu]_œ·pÚü7–^^·«ap®ÿ:¤®]Ê×?iÌ#“&÷x¯»Õù+•­.Ï¸y‰ª3á*tIœ|\ZER‡Ïæ|Ó:ª0Qy,Î9ªWo\Zñôo\\·hiõ…n–<òøeP§Kº¬%ÁJÚÆÔ†z\0NŠµŒ3â©ó&ŸtÏˆ¡ª…LD=C=¸I—¥^&p\0sÀ céu:–äËfÁh2Y•¨òÆbŒ¹KŞ_5îÉ9óo^µæÓ3¹mRã–5›ß”4‡„ı³\\øÒ•ÌÀËğªƒ_¾xêø_=jØ\"ÀlYò™–©<,fÛã0…²¢\\/£mhYÒ­‹¨PyÙò5£Ÿ˜3oÖªµŸ.\"3±™ b5\ZÅ©İvtj9á>2òSçYÅJ‘ÆcÙMi86¤ÿ+—L0cô¨ªe´Æ´7·\r”tƒÒ›ğM<|e£Èõ·|èñf/_¹şÜP¥œ0fñÔa_–B)™I²Ü%MímOÒ¨Ã=sõ´É7\r:´ï†üQö_’Rı*(\0ÔÕ7”=ú§—fÌ{mÉ\\îˆ_¾’úCQuQy›îÙ¶/Lù¨qèX¶m‹s˜Ó2áÔ±÷^ö³fu­(o´pJÿŠ97*LL˜ÊLKÜ (]6›uşñú’o=òä‹÷5ìÙÛà`¾P9ó™•ã›eæ/1b£İo#ò m¨Áã}`Z¹Ö?%ÖËcc½‰/nn/ht|øc¸åå¶^~ñ¤kÏ8eìßS©”1²³Í3M¦rS´˜+r›‚†±zDç\0ÆmmPÚ/jvö¸óş¿<°â£\rSô™â<˜|FËá_›œã\\¢¸ˆ¤÷™ØEŠK¸D†nBqØÀgôı¦÷êÙm»ÒmÛDQs¬IŞ8wBÛQ¹ã@ÒIäó-ÚçÜWOyø±çjnö7Hs]ş’,_QË’­Ï\\ú X//@íÏVf[Jm}q ¤¤¨öªKÏ¾zâéÇ>k›Én‚-\"ZĞ9N´MaKq[QØõ»Kïzà¯÷,ZòÑw“\Z\"“œi>‰¯o+ß_~{®X¹¸‘¦rÚ\'0nìa¸aú·¯«è\\Ö”?yl{(íómØôñšM#n½ãñ9;jw\rƒ¸›|Jl<\0ò\"Zô\nƒµ‘spï.ñê4,™<:¿}àÏi—âAö…¥F´Kø0ğùÔ°¼kÂ”À‰¾„sIú¡¾ixI÷°ºwë²jæ§M^5 :zf:>l=Ãr]×yáåwÎ}ğ±çÍd¼×dşú×¤t:ÕxÍ¥g_6ùÌãŸùWî,*òË\'´u]×Éd²Î}¿öÖç-üi>LÚ—™Ü¡üc€piÔ;d¹.‘&W.	êôò‰»ıÚïM™YXXIÀ–Lùni¤MN¾¨4=‹4¼`Š<tØÔÔR<ó×xâı×Ÿë­<ê²ÀÁıU…ò4”d$|–(4^9<|%öyæÿç>	)—×,„2SLÉç¥ó%°à/÷LéOŠœÓ§Œ´	p™‹¬¹óıtÛ;766]Ò©SI‹i;BÌ#-\'Î¼rä-»9çög‘&¥‰¢±ÕÕíj¨¸aæƒ/|º¹æxİ×1E–_—tp¿ïÜuë5“»v)¯ÏçYdÜ6…T¾¨çV>xhkA§³mSl«©íyıÏîŸ¿½¶~„Wáû©IC¾¨ğíÇR‹b3}\'4’Ç 0CttjGÈÚ£²¢úî_||ï•5¦g˜ú+ÓV4]PE¶\'J[>ßŞç†[|}ÇÎ]•M9ÀÍCF…œ˜|îk£á›ö,’‹eÂ\'Ñ#,o‰aÁî»ˆ´Èr#®…RˆhSBmX2¶bé|ù.ÅÊDËÔ±hyéšæ/–¡>ºWvÙp×m×œÒ÷ [M{dù&¹Ö!hZÚ¼õË~×ıôŞ7êw7’3chßòÓ‘Ë××a)ÔU/~+:—}rÏí?8©_Ÿ7wg^Ê9ŠŒK[·mï}ıÏxs{mı@ÙƒM\n¹„sQa’	‹ŒøÍ”4v9‰\nÇ’†s	øJÄ‹‰·(¾’´%©GeÅ†»1ı„>½{lË‘“è®¢f›ÑzvWıŠ«oøÍ›ÛkëGˆåCYVà™sî‡5Ş¾¡ç˜1ÎäGNd)ò—H„±è2›³Ü÷›Ê:•àÔFcâéÇbÇÎzÌşï?£¡±In|rÑÈRgÁòúgÁ^/^ôåZD‘ßw8Î8e,şñÚ,z¯\Z×%ş\\€bå€Z@_Æ¢,÷#X–²‰ {·ÎÕİõÃºuí\\§+\nÕ½NÔ›ô(ô,’:j¦m\núÌŠ>Ãjjj)¾ö¦{æÓh1©ÉŞ_KÑĞÁı1ñôcqâñ£P\\T(Ç¶åóíøÉm¿CÍö;<7ù$\\yÉ$8Î9¶×ÖãÅùñò«ï¢~wâ7k¬©#–HŠ5 _Ïwî›}İøÒÒâ–¸W¦MŸ‹=ìîˆg‘mmç¦Y¿ûË+×™_”·9îĞöFTr‰ Ñ€NJpÊ7ÂÄÓÅ¡²:­;jëqãmãÓÏ¾00\ZÕaR=¾xêx\\òí	FZ÷µáÍ…+ğüËocÍúÍÊ’\'†àİ$ŸybyøàgfÏ¸ò‚‚‚´Ûîg‘¶m\nšzr\0¿}øéY/Î_¤ìĞË-äîViÃV—X˜ïÚ!ûaÒxÏZ•%z5{÷½¸ñçcİ\'[#ùµòEéÈ’É\0\\zá™øÎy§%z]yÍúÍxşå·±`á\n´µe×ŠË¬|æ\ZŠÀ!7Z•¥[F¶LŞŒr¹—ta¬‰»ı¿®:o†¯eq¯P·ÛÉnî[çßûÈßæ(’æ–†¼¼s|i¨N‚ŸÒíËÊJñ›Û¦cà!YA“^×ØØ„ŸÌú¬Zó)\"ï|ãS3İ´&à¢óÇoH›Eåœ£~w#^~í]<;÷-ìÚÕ`ç…¶#ûÉÇŠ1mË¸îòs§3ñ›ÿ›#’ÚµöñšM#|ìùG¹Ïg[,óşÍ™çdzcòœ1­\rSÛƒYh‚öõª”Ê@Ş9ôL½®S§üzæU8lø!~_ÌãQ?$¿AŞD÷Ÿç†‹Î¯ôÅ¥©è\\†ÿãTL=çdÓÈ¨#|ÊË8;¸§)Öƒ=ÿèÇk6hˆÉ ú[TD İU¿§ìÖ;ŸÓÖ–)çæ“#îZ”1C=3\\ÛÚ””‰€\0d^¿yıÌCiIfÏ¸‡?4Ä‰ïà@À€ó\'Ÿˆïşç™9õ­óÌCÏî]å8™6nıÚ–×G{½	+Ó–)»õÇçìªßSç‡Ùêú°Z‚!ÒcJE¼ë¿Ş³£v×0Æ˜«=iB„¬Ö*XíızAì—K:0¥Ü«H§Rr0†ˆ&”×Ï\"_ZRŒÙ?»#Gúóïd9ùş?şEİÄñãpÕ´ÉVü¨¾õT~@)E¨bğó,hÃmŒIÈ•œıüÚúaw=ğ×{|KëP\0T1•;œs¸®ës-Ë|BĞ3\0Ì}eñ”EïUWxµL(‰\\ÿÉY´rÃÖóŠû“L1Œ%e<\'­+..Äí?»#‡ªú‘šÇÏ\0¥ş”o‰ÿså¹Šs›kßô\\ZZŒÌB“é²Â—“¼7IY€cÀRî`ÒTàú‹–Twî+‹§P9çÕÁ¿^&­SÜ²\"Ò5;{<üØóy€Üû\'”Ô§ˆÏsÒ>TNòQX®LVKõ¬M,—·Ï¸#†\rˆì_ŒıØ1Ãqã.„ã8‰û6ñ@ëŠ‹\ne¿°ÈH/7Ö‘ö&,ÙÆ–\'X?öüC_ÔììaÈ‹àP”‰w¼\"ÑĞu]Üyÿ_hjn­š/,ÓòzÇtéK]>U,Â¢7ÅÊf³\0’9Ô´NoCëJŠ1{Æ•^5 °œŒ<¸õ™?â°A¸å†KJ¥rê[/×ËŠ\n##í{°È1YN­‘k`ñ…lmXÁPkÆ(¬ææÖÊ;ïÿË®ë\"NWü¹wcn\Z9¤¼¾ä[+ª7L¡Š\"ÙÖ”DIÊKDE—C{ºô†VGÿ¢-“’åã$©cŒ¡Si1~=ó*lød+\\—Ãå.Ü¬‹¬Ëáº.²®‹#GBQQ!èöƒÉJé|EÕ@AAZ]¢¥‚¥1,ò9RŞ­`ÚY«ñûQäÍ=¬m˜ò×—|Àó¡Æ–$,îYc]}CÙ¥ßŸ}½ëòNù@XÚ´µeŒVÈvm«3m––yşX[ËhÂJÊ\0¤Ó)èæœÌ5¼ó*@ÉÉGf¸Iı$Ÿ#Ïdƒşàã3Òÿ#O¾x_]}Ãkú\'Èm{§ïà;Œ1áìÃÍGÿôÒŒ†=M}‚HQ\Zißº’eMÔÑèKæÅÒ©/«ÑX´œbµîk3úqÛzœ°ôsG`1ÆJ9r¤,‘b˜\\º},QæSêKº\r‹ÉÉK%$–¾¨6ìiêóèŸ^š¨ÛZ6ßVyX©X(Şú[Î{mÉˆèTFèšNëŒ‰šè@¹ÁŒÅL€Œ¡u_[ˆÓu’º|é;€¤¬¤|`šH½HŠØo(¬‘ÀÑ±8iÆ(\0ÍÊ†˜÷Ú’¬ß¸e o©ã·)üİ	•áæC¿0;ëºÅºã\Z:ô¨2&ºÑFÕ™°8Gkë>ë6€ié´9Ü¦|İşÄo^È¨Î$;î¯m\\•‡Gv£äÈıå”Ga‘è2ëºÅ=şÂlÓ8BÛQ&\0–-_3zù‡ëÏ•æ˜šfFL³r{Ğ:óMûıå`‰)0ÿ ¸w_kkØ‚™Æ¡ÓĞë\\—À¤4ùXA*ÓE$,€ˆQ¢XZ¬†Ù\n–KÑ2kùÊõç.[¾f´‰N6ç³EñÄœy³´|ß[DşvŠnq1»L2%Çd[&Í8±ĞŒä¹yñÚ2d2ÙhËªYÓuG6Ì\\ûVd$µ@˜	mQ—B)|^<¥\'\n©L˜+<UÁ¤“óÄœy³lz#¶¿Bk\'˜¹%ï¯\Z·jíg§‡Ì*=‡ÌvÄ¨mô¼Uà\Zpd³.öµer²*qu¦#	½Tÿvö-æÙ()u)´Ê>I^o¯åms½jíg§/yÕ8“‰$×K×u\Z¸®ë<9gşÍœs¢åDtY¤æ\\šT&éå²¨mÈİHË•:Íœ)K4¼Ğº¹¥5äè–‚æãêâ¬P}GôM•AU>&’,_Ô½0Ò²¬pûcÀ“sæß,5\ZŒ|:WÖ€êÕ›F¬Zûé™’º@1²&K‹Ê¤0ªA«äI[H]\n°|š`é\r°*»uöw¾Í–B”ÙÎ¹úZûËÄ·9ÅÕSÒÚØ¾âû]µöÓ3«Wo\ZA}/\0rËËºMñôo\\çÛa¯’^]vä@ı„ÚÛğ`Êİ++p÷¬ïã€²R…:¨	6ÛV–o]Rzš\nÒ)ùNYœŒl¯5ÅÊÑp0ä‡õôo\\\'xçÄÁ¼×uB&ºf{]×EK«//×y’\0yòE80óm y¦ça)ÂRÛtï^ßÌšƒzUÆ.¶å‹E¡ÿwaQœK¾=Ó.˜@–ƒÀ¤sâ>ˆ—mNÈNÈ<p7ÂXşÛb¦†¨ç€Î»^´´úÂšíu]9ç`äƒ@œsïa·~¼8oá4×åÅàÄŠúJËü<ãœ”yAóøæ$Ú„ú\"›\'É`Üoç[5ÅàÕƒsXY»gMGŸŞİAï“5ˆ[.Môe«Ó±ô%ó¢óÇãÒÏğ/åÍ¥¼¼D}•†KÃ²0“XäVô•F`ù}Š9t³nñ‹óN#oRú¤¼­-ãÌcéåÜC\0—\Z-®úš­ò:3H^Ğ+V	ä•gÓëĞv,‘ïÑ½+îşÅ÷Ñ»ge¬E u&:İjì/,#¬ïœw:.ûÎY!!cƒ¥­ú|%Â2ÓÊUjİü7–^ŞÖ–	éSèa÷Òå«ÇíT~ûÇÿP*÷†ş®nàh«bE¸Ü·HeJ0í‚3PÙ­3JKŠQXF*•‚ãx¼gìü·²ŞÙ¬‹L&ëíwµe1¬ê`ôìÑ¾9–g1QÔ*äR\'yo\'–\"‡éõ$è.üSá0†Gş8Ãà80¤©”-–4Îár.åÖÖ–…›uåäˆÑêsi/÷\'_2¦ºü@İ®İƒ—._=À;ti®=?ºíÎÇ/\n>ñ%¢“pÑ©¨ä`\\h½ÏŒ¯‘Œ|ôé\'Á”‰ßŒl’”ÄaÎµ®#°ò¥7%Ê×·§œ‚Ég\'å JAl@D×†äİ7mmYÔ7ìÁìÿş3>üxcğ•£æ×Ó!²”2ÈÀÉï£ä«CÁ’úê‚eÁW0¡WÊ³Èæ–ÖÂw—­ò_\rÖZ‰«3&éŸåÑ_Á»\'\'û\n„Ìa«û‹1†ÒÒbøË³dÑ\nGË^Ş{p^TT€•]pşÙ\'É¹Q’œ¯ ÉõÉHïÿÑêŞ]¶jJSsK±pò¨Ï\"—,[ubsKk%\'8<@”ƒò€F?\0k>€‘Ã¢ŸC¼ş«·âó¯–­Ì®PÌH#ÊÆ5½{UŠ­DmÎ¸áZ-£m`(oni­\\²lÕ‰”e›â­ÅãÓKš¨!M÷Ë˜^ÏáG„“4ëerpiy^fs£õ¤N~\\ ±?±ò©‹¢O9&Ÿq¼2Oô0Í#y^£Ö[Ú	}ÊmŠlÖÅÒå«\'2á(Š;Àräa)ò]*ÀñÇŒTî,[ˆnJ¦zK¿{)\r+\n×†e«WR,N’ñÚ°õº	§ŒEII1™WxgØçÚ>˜<ôr0,]¾zb&“Eh›¢zÍ¦‘M-½Ã¦Ò°ô?šÎ;&œ|4\nÒ©Dw!½ªëH,‘Ï·oS]{Æ‘ÔòæcíÊ:•àÔ\"slCY]3\r1e¢¾±©¥wõšM#…^9â!÷+×*Z«fîïúe„‹¹$g\0H1†³Ngô5lwa.uQe_G,›•¤.)Ö9g~|ª›Ì©|Dä—1JG9÷>=Åú`åºS½*ÿY$c+>ZJ°¦¨JÓku—ØgŠıòÑ£ªĞëÀ®F!ëù|ê¢Ê¾X&\\M{°ú÷í‰Q#éV\'µe>½°6ª[IR ˆj1ÇŠÖŸÂé6EKKkzí†Íã88Ùí\rL\"”r®ÔIÓÉü¥“Ö1`Ò„À¹[:tG9—%A§7µ¢é,Q–/=G?Š>	\0œ3ñ¡e/tˆ9¬ëÂÚ\r›Çµ´´¦ í8»â£õ#öe²åŒyz+îßwóËh,¤åR!½v=*»`ì‘Ãäİ#—ë]gJI±¢¬¸Ö±ö6µàık±¢z6lÚŠš/ë°§±	.÷>Û­kgôïs †UŒ£ªl¿DYÏQí¢dÃ6VÆ9j8z÷¬Ä_îTçÑ0§‘Éàµe²åk7lqÄaƒ>HÀšõ›–tD‹tìP_>-³ĞŒ>bR)G¹“\0„®Û“â°’öÅ9Ç¦Í_àéàÍ…+ĞÒºÏH×Ö–AãŞf|¶¥o-^‰‡{9çœù\rœzÂhÿ3íç\'	½®¸¢ÌÖ†Z6Ça˜|Æñxøñrâ\'iZ³~óÑ\0<[·qËQ\\Óa±]öÎ^.dËè0dİko.Ã§Åğªr`\"QáĞ;Kœ“ÔÙ°$\'	±êw7âwOü¯¾±YßQÍE\rÖò9î¼ÿ¯xêo¯aúeç`ìQÃòæK‘dDMQ2‰Â\Z2°ohœÜ’J<é0í9÷ı€ÁÜ¯Û¸å(\0H@ßAcnÙİ°··lLÍ;İh#¸!½4à©Í¸..ùG5¿š?®öşŠµ¸aæƒøxõ&¸ A¿>ã¤ÓË˜ÄP9q={šñúÛ ¶n7F^å}€ö+šö46aÆìG±§¡	Œ¬Bò)Æ‚×¦èÙŸlÆ=cŒÉGˆâ­cÆ¬ëºË—¼ö¨ÓÜÜ’şü‹Ú*&Àˆ÷¯\0(¢_ÁÅkj$rôqD¾aÏ^ühæCølë—f!|’:S˜.’\rëÅy‹ğ“Yÿƒúú=şx¹2vù,UŒ‹7’2~i9¼ö/¿ò.~xËŞW¥Gğjâ/n+\"Éøãè[÷µaÆìG±õóí’ç`ÛÁçI0Ç¹o‚1†Ş-.dûÏ¿¨­jmİç8Ûjvöq³â·™Ö0P®P’ÀL­§ú»v5à†à³-ª’éiO×&Î9ş>o!şûwOÃõ¿Ç¾(\nĞqÅ- «ÖlÂg>„Æ½ÍV^Mü%MIe¢§L&‹Ûî|}¼ÑÀ¶>Æˆù·&Øu³eÛjvöq¶lÛ>XÓz—k×jmİ¦!nİ®\\?ã~lüt[lŒ1Lò\'ÙxïƒÕ¸ï‘¿)5ù\"ú½bÌss[\0X¿qfİõ²Y7ñ–‡.ƒ(YÄÉKÏg²YÜşÛ?bñÒÕqú9}ŒÄ.RXvŠNp`Ë¶íƒm5µ‡@7§	–0O1ëw7â‡3Àº[¬Kší4™|[]Ô2Q·«³ÿûÏŞ×Q^_.c´Éféò5øßçÿÉ7½ÖÇ%FÇ¦y×åøõ=OáÍE+cù×Ça¬G<İ¶šÚCœµ»ûmÕÄ\\çsìŞ³7Üò >Zõ‰Õú$9\0»õŠ:øÃóØ½gox<,™r•\0<ñ×yØVS›7ï6z½\\$.›uqÇ}Oáõ·Şå5ñØbä\0;jw÷wjwÖ÷–Å<¨¦÷#×Ò‰WhÂFTi¯­)M-¸ñÖ‡±lÅ\Z¯>ænNr§\'¡_»a3¼³œ°0¦ØXË,XœsìkËà±§^N4Æ¤N¾É\Zê×ÂrİqßSxuÁ²Ğ4‰Ç}áùÕóª\n1hs*¯U½¨İYßÛ©«ßÓSD¢¡ŒŠ”¼ù“)~HËA\"Qµ=#a\0ZZ÷ág¿|o-Z©2jX¢êr¡ŸóÜ?Ã¼pòğ–s¥NÜtr\"8hLãÒ±xğ:ñ‚…+äo#Eñlâ?	‰.›Íâ×÷ş¯¾±Šr à‹QÓ#Æ¬œAæ6E0vù>††ÅQW¿§§³»¡±R(Š’ˆph#q\n&@7eŒ22\nmmm˜õ›\'ñÒ«‹cVq6•EÑ‹´»¡—TË#l¥¸r\nn¨°E—qXcÈf²xuÁÒı:FZ–Édqûoÿ„×,#,qÏÜoP	®…Î&õõcwCc¥ÓÜÜÚ5ˆö¸BD•¤œë4„çPû`­# tÙl¿y`æ<÷Oè;ÖQK¡Nc£éİe«Ğ–É(rI’—¹G¸¸¯rÄZ¸¤:§1ÚxÛE>“ÉbÖ]OàŸo ë‘éuÜÚFı«cy-››[»:õ\reúšËÄÉë>™©âx¶_ÓMKÎ9ÿË?bÃù\\œ|½~åÇ‚10˜óÊ¸L2ĞÊ•ö,ŒµqÓçØÛÔ’ÓXDJ*ƒ¶¶fşú1¼½x¥‘_ÓxMs×ÆFCëë\ZËÒ®ËKÁ˜ÒH6Öâ”LÏ›®M#a\0\\_@Q>…^¯—™êÅõÆMÛä€¨rD¥È1\ZhÌ\0A6ëºølK\r†\r98Ò‹¤!?Œ–sÎ±£¶ï.ûX›¼d)jóÁr]^šæ@±€+y€)åíNr¦»ÖØÄPoòCôëí;v%â»=ãKÒv{í.rpì8E2ùZ²?~s‚9ú‡\r%ôÔÊÄs¢Ğ2R1’â4ü/úåàŞ\",>D+4™s€1(¿§È¹Ï®ßµöÁÛ oHòwæ˜ç¼0Â÷Úx~Çªn‘ô³©.Š>›Í¢©¥Õ€áÒ·“Ì\0\0ÁIDAT‹ÊÂç‘ƒŒşX8ÔŸÍcV,¦aAÃÚÛÔ9FeJcê$çË‘«‘>>ÊŸæàûËÔ1ÊjÅ$¥ÙbŠå¤=®1%-Ì‹ß”ŠtF·/”ÈK–sËÍÂå =ëã·³G¯Ë™Ù¬×éèXLc×¶naE?ˆWÚäXÇ¾¡ÚÈW³â¾XRX»°Òp!~7’Ú= •4_‚êMPÈU:bñ\"-±\\óƒ%2WÀH\'êRƒ’âBìÛ×ÕDYÆEÇÌmöò(¬N¥Åáe-‚wSŠ”‰c¾©lü3Lmi5AØòZrÓ`¬…¥r=eDŒê\n-\rå‘–#’Şi#–È¤Œ&¥ï^Ù\r{šd <#Ô–¡¨1RãÎºlXvï’xû!j‰´ÉÂ±ÈŠòî;œ·ÑëŠC´oqRk¢QluIò6q}ÖiÇ¢¸¸(rëÁ$	áéßKéÏÆ[>ãMŠ•J9èß·§•Wg[¹m ?â`K’EŸËqX“SQ^ÖÈĞ&= ]Ç•G<Œqö™ßÀ]}¾ÿ5NÉ9X­Ì”gŒaäğC÷ë¸’`\r:¤:•[Ça^n“\0t.ï„©gŸœl†¹ˆ¦åÖ¶¦qW”—5:%%Euú×óĞ»Rù6;QG^¿­r\'sû]ÎXpÍ\0œ÷­qíåS|_ ·7\0óo:=)ÇQx”Á<ƒ\\ÓñŠ±†ŸAJ0Î¥lTÌ 8nìa±–6¦×‰tÅ%“pùÅ“|¾¸vày)ï`ŒôĞ¹Ò:Nñ¬’’¢:§syY-ÀƒšB=}¡QÕER>¤˜:Y\nÄöÒÔsNÆU—††Øvëu’—z‘ºT€±Gõ\'œ<\'U”‹üÉkc”cG  BfBdìÁX9\nR)œvâèXÿ+Î‚ét¶ñûœ“qı5ç{K&u)´9ÊÈ¸´1Òq©XÁÜJ‚Õ¹¼¬ÖéZq@ÚS5®µ´3C31!&¥€L9W\\<)§­ˆ|¶)èqşÙ\'Ù=]ğèr]°²SS»pÙÉß8=*»ùÒÇ¡\'ª,j™xú8Ü|ıÅHˆ/²Œ\Z#7ŒÑFŸ«kÅ5Ne·Šm¤8¤+ÜïÌ´N›º2¶§L3†¦œ‚ï]4Ñ/2/	4·tDÑĞcäğCqÌèaFÑèe¡›Õ6FnnKÏEE…˜vÁ„œxM\"zm£9ñ¸#pÛO.CQQ¡u¬qcLšôö•İ*¶9İ+;æ9FÑ¯ÿ2K1yoê9\'ã{MŒ5ñ4u§Ç-/úqíåÿN¥%\nO:ß6Ş“‘içK/<=ì–¯q²0ÕÑkz3zfÏ¸%¥ÅÆ±Æ1é¡·é^Ùù3§wÏÊOtËd²Vqœ;é\\qñ$7“çĞæˆ£g®øáô©9-_Y3zÎıÖ‰yñšK Gwøˆ¸cæUŞFoÑ†Õ»gå\'NßŞ=Ö©Q¤Bû¬$Z›7£×1\0“N?W}÷ìHë’¯C›+Ö‰ÇË¾sg`ÜUçÜ4FUNA1a\r9´/n¾şâœÆ7|±\0`xÕ\0Üyë5(/+!c#ŸsõËô¼wpPİ`Z]wúöî±Îéİ³ÛV\'å4\n§^0|XFd\'’o}Ñ”\Z3x~ÀuWgİe¦)Îôëù|°ó¾\ZÜ[ªA\"h.…‘{Q†íÚxáÓÑ,3_>#ªÆ?¿Jî{%cÜ8’ÑFW5¨î˜y5èTÌŸl¦Ù2Í¬©;‚&øà5wRÓØ»g·­NQQ¡{P¯Ê5R±‘Î®*ô€©Uãg#ªÁO®ûOåKPlÎk{êò¡¿ğ?NÅ-?š†NJÂ#VÊ‚m\rJ%äEd0œyú1¸ë¶é(? S‡1—à€^ëCõÃ¯n¹Òû*M9õ5i9§<4@¢\\ôšÊ„ã ^•kŠŠ\n½_Z8à ¡5”{û¶œ2Gpå–e\\ÕQÆğ£k/@aaí¼¶§._¬ÆGï¹Ç;`6_„+º¤ä‰,zõ¬Ä/oş~xÍTÊ­c.Á-çaCÆÏoœ†T*e—eŒqyqpĞ\nÆ˜÷tƒíû> ­«>oL4XØ¿¢miç¯Ù”Øy× íuš¤1m‡Õ½²·Şx)îûÕÿÁ7=é‚tx\\ÌœgŒáş½qı5SñØı7á˜ÑÃ¥¼’:ìQcÌµ.úÑGTaÌ‘UñcŒ˜g³¿>´ïûœsùtï×oE“XpiQ2Sş¹—ŞÆø“cö·âü:az^/³µM‚5lHÜú“ï¢~÷¼»lV~¼6}š/w¢¹Åûñù‚‚4ºu-ÇÁ}zbXÕÁ{Ô0zpo#¦¾Lu6˜°âä“VãŞf¬¬Şë&ÿ¨ù|RÕ ~ï9ã¦`ÈÀ¾ÕéTÃ¾L¶<Ä˜>À_8™Ÿ7\'Q·ş“­øxÍ¦Ğw„™,•é:I]®>MVçò2Œ?ùhŒ?ùhYŸÉfÁ]OÁL))_IÆh¢‹ºy¢°£°^{sšZZ=,s™k^O…éTÃ}«ÿ[¦‹‹‹2Cö[$#!âğßBlrrÃ¦QšM.è8{ém«?AóùÔE•u$V:•BaÄ/ëv_&\\\rM&+\0æÎ_ù}`şôê_a%uÀ/—Ïq9ÈCnúd`ÈÀ~‹JJŠ÷qú‹·G6èõ z€I¨:ª~âÛÏHæiğö»¢vg}¤#kºNR—«ÃüUÇ2ášhÚ‹õñšMøä³/3¤¾Oİw-‰ù5F—.qıÇ°<|ğkz$ ?®D<ˆ¬”³©Ì;·µeğâüE‰vÉo½NOë’8û&ºp¦õ>“ÔÅ?Š>ª?ÚşïóÈ|Èúü›Êµ2×qO—ü¾ÒâWJÛÚ2–u*ÙÖØÔÒ›€ÀµW¿š&[9M/½²ÿyîiÊ2—’Ğ%±,qÆäGY©¨2“3Ä‚Ù¬URY%ísİ\rxkñ\n•øóèÉ9å´2¨ÂsÎ”•oQ5àC¡WòıÚ‚‚´;fÔĞ¹ùIÚÔÕïÁ›şÄY¦¤G–©ÎF/ÔXQõ¹`EñDûÑÏQíæÿó=ìÛ—I6,Ld£g\0ÆŒ\Z:·  íŠ2åîo;ò¹(3¨_çz<÷Ò[ŠµÈõ í”Yàö–çëLçÓ®N~œµµaqÎ1÷•Å±ËõItá›Ç|ò¢üâmsKë‚’¢ÂÚ––}•bW;X9‚Ûúy¿\'Îü\Z®çUm_³~3Ö¬ßŒ¡ƒû#Ÿ·Ô™è’Ôåêh·×1Oš¢°L˜Iè–´[·íœxæÿó%¬ ƒòl(ô\nü%´¸¸¨vìèa<rÃ/Ş––·3zØ³>BH]•ß$\"•B¡Ây‚ãşù™W±­¦MM-Èd²Èº.\\yp™§¿×İº¯\rMÍ­ØÓØ„†={sr¦EJZ÷UÅÒS>ôœs¼8oQ ,\0™cıµp_kÄœ‡è¡–8fô°gKKŠ[\0€1æ@Z3ŸÎâ¥Õ\\ğÎò+¨{oL<”ID³hÉGXô^5\0 N!åÿÀ9sü!qÀå.¸ë	Äå\\*¸÷ÁÒ\\q.&Ÿq¼ä[\n%Ogº½ôûK¤ŸnÃú[PPF:B:•B:R~$^¼±\"d—Éd±Ï¿Ak¶×a¡/{5qíU©Œ)\\Ú‰£ÿxYo‰TˆÆŒ\Zº¨k×Îëêví,GÆáE¢…òõJŸ ße xí½«L[m>±¤¡8~bÁå¸÷çÀä3óÈXô\'¼„Êôq›êrÅÊß„e£€Õë>ÃşöîmVÅãË$Ìä¼¦È¸3/Ëˆìi¢ôôº[×ÎëÆŒ\ZºHüÅ[q¤İñ\'yÄ›uÿĞòâ„)ş±à¦Ñ‰¼¥½‚Å,X~sàŞÿyÏ¿ü2!z>Î29æ6,SŠ£‹sÆM´&_*WSK \'\"hyQ\'Ë)½åZoOåmÃ¢×ãO\ZóHAAÚuÇeŒ¹¡_¼¥iÒ„ãwÖDGúu’#Ÿ6¶ã¾Gş†ç_z;qXo»ySYışÀÒ×~Šo}M-í’U¾rOÒÎqXË¤	Ç=Crü*Šv`÷.uãÆŒxJ\\ÓeÒ³AÂ&\núª,\'m‚$ÚĞ¥€¶Ñ_`cÑ×u¬ûÿ,{éí\0ÓàÓ˜B}S]®ô‰¥Ó0Æ°jí§øÉ­coS‹¶İñš3§ò\näÇI].X0`AÃ\Z7fÄS½ìV«ëà?ìæœÃuUkvŞä“î¡k°ú\rÓAV,zÁµÅI=‡¤¢G@ÃóL)NU6Àâ\0şø¿óÖò´\"´}¾ÌÄC>s/¾Ü‰oûöîmñFÉ|ƒµìHvä…ïäájĞ†´Hˆå—‹ñ†¯şú¼É\'İãº®#\"Gš¥¿ß\r\0#†¨^uğË´CõI»o éY+c´Lá\ZÖvL/×q¹‹*¸Áÿ²Ejq~S¾XAîÙÓ„¦½ÍIÇ,¯¹òPÚ.o\rƒ\'Ä‘;H{rV5àåCT{°ó\rWğ›İ¦ãâ©ã	Æ$ ÉˆùJ¬É\\«y®İ©\Zz­‹IÁÕ°ô·™ÎzŞT–F{•1†ÒÒà›MM2²•ë*`ÊGµ‘y_GèX9ç÷¿5ğ7ZmÇÑG}wØş¯ \"1C><MúÚŸ­	ŸæõåÉæàëg}‰´•ÙêmNzTYŸ”®¤¸J!]pQr³aEÑFa\rÒÿ•1£ªŞ¥ü3Æ\\zÚ¦ cÌ½dê„4$µåYLyÔ…Ê“°\\æÉ}eõmVD·Zz™‰>\n+\nßFoÂ-.õ7ÈÊÄp6ÊÎ‚Ó/ÀpÉÔ	3t\0¥L˜:ù4?zTÕ²Q#=ÃA—µğë?½æ/Éáù›Akï+ĞEŠ³$±µ‹ÅÊKé´÷‹¹r¼dqòwSÕåÎ—¡¯ÃrcÚoOCEîÿü±¨×—>Õ%’WLö‚Q‡zfô¨ªeˆIuìO¹èz\n\0WO›|SŠ9-²ÿ@Àsx	äA™ü)^…–Éö,úÓÅ,ü6L©ç®jÁôsœ¿Ó^úÄ‡x$uC:¸d¬Ô)õ2ŒH€$Ê„“¬M—ñ+¨$—§Àr˜Órõ´É7yÕÏ%œzrò©sF\'lĞ¡}7L8uì½ô•é ²”Ÿ–Ş8hd#¥{†`)BƒÕh	ëÊõß8™¦²¨º\\é;K$Çq¬0‘ò…&/­N¥·$…+\'c;L8uì½ƒí»!*@âôm\nËAëœË¾sÖ¬òòN[ƒ%,o\\_æÈòç@üäMáÓ(Xœ<®Ñ¨72çŞƒp_?\'uÌ‰€\"ëL4IúÌ¥®¨°\0dRÎâŠt-e\r#mPbÖ7®VX°ÊË;m½ì;gÍúAyöçÂ¡º#_™N\Zç¾²èÚß<0ç9áVµåAò¦2Ê|–K±Äo1æ{ÃF·³n7VVo„“bŞ›)G¾’J96ä`”Eâçk\rÓ¾Cm–c\\²Ñæ‚¡·¹üâI×v­(oLÚÎhƒ]×uLŠwÆ)cÿşú›ï?»¢zÃi™Ey¸”šš’Koë_g²Yù[G²-³¿¡45ìiÂ~ş>ı¬Æ:+G6·ß|ŠŠ\náçÂW:L½Óè5H¹‰FÏÛæDïÃ€ÄaŸ=ã”±7 X“ña·éî€T*åşèûL/).¬å€õgu#ëH9’Ğû7Ò°\0gß¾6ë6îP\')onnÅM³~‡M›k\"y[şÑÌ˜ı{ÿGTù%íËF›N¥¼¾™6f“™šçÌ’·Í	³`ùGIIaí¾ÁôT*•tÅàù`ò0ˆrqîİ«²æªKÏ¾šjä\'óZT\"ë´oaöG ´±ä…?À\"°Z[÷ıYn[Òé[[÷ág·ÿ«×&ûèOÉ{|½¿r-füêhmİ¹çš˜ÃÔopæôC®Œé¯¿L«Ó0”rÅXW]zöÕ½zvÛnŠm:Ä9wGMlWØœVÑhâéÇ>;îèğCùéIÈØ¿fˆğ¸¡-õKğB‰sù;Œ&-ã0ÖµµepëO`ÅGëı­_Ø”w%ï™…e¬ÆÌ_?†Vß’åÓ·^§zãÚØ9‘4¹‰æ$iõW¦ƒúqcGüaâéÇ>+Š„è/H˜ÊİDÓ­\nšu\"Ãôo_×½²ËªóJKAÈğÏ4Xk{S^`‘>\04ìÙÛî­×uqûoÿ„w—V+Ø¡|h÷Ò{ï¯Â-¿zT±dIû6Õe²YØ5ÃÀ—²c$Î«{eÅª¦ûº\\¥Øm\njÍ´-pÎÑ¹¼SÓÌO›š.H7†|2º³ì.ó OiH^¶Ñh,aÓ=š/¾¬ËËRˆñd]wÜ÷W,X¸ÜìÆù1şñŞ«1cö£hiİÙg_âhnn\rèVk›¼l‡Ş6„«7]nœùãiS;—wj²mëÄmqŸEŞó$æ¿úÊè+°ä^5 úšKÏ¾L¼^Ë˜úª­¸†(\'Ï¿dŞ¿Öé¡céå‹1<òä‹øËß^CıîÆHÿÇ´‘Ì9ÇİÌÁ«–ª¶a\\òŸ‰Æ¿^¶b-nşÅ#hñıÂ$~™²R\0ø`å:ÔÕ7cfDZº¼l‡Ş6„KÚ×\\zöeÃ«TGéˆí¶Ì[Gœ0¹®ëüöá§g½8ÑOÛƒÃkÀ¥¢‚4N<~Î>ó2°o,=çw?ø¿xéµw; w5v~yóåèTjüQáPªohÄ+o,ÅK¯,Æ–m;:œŸ\\Ò¤ñãnÿ¯«Î›‘Ã>©1I£{_¶}0[Ú·¯-}Ó¬ßıåı×ŸKA©Û$n^ÎéE@,×Âd<VıÜgŸù\rœ0îp¤â¹¿yğ¯øÇëKÀ@>b¬aÙ_å‹KëCË«öÅìW¢¢s™Òwà÷q|øñÌ}e1Şy÷C´¶é7ÉÅÃæòC±j9•=½\"Q½	K	€£FzföŒ+/(,,ÌøşxÎÊÆ„2	ŸKä“”Q ÆÆ¦Òkoºgş¦Í_/\"+õ\'•%§şäùÎ:˜7zãO2ŸW$­c‰HHL0%å]º”ã¬ÓÁÄñãĞ½[\0 -“Á¯îy\nŞşÀ—á‰gşï“ì¾ïÁu”ìˆ:ˆå.ÀêwPüjæU8°{)¯İ\r{ñÊßZ}¾=C05ƒe¾Z/äå]KÙEĞÚ¯÷åMÁ€~=ß¹oöuãËÊJ›hk›ŠÓ¦‡•Â\'qÇÎ\Zİiyı\0»ê÷T\\}ÃoŞÜQ[?¦$eF,ÏÄ˜¯`HŒ“J§pÜÑ‡áÔÂÓ/,ÀG«6¶ƒÜR—.å¸ùú‹rÌ}eŞZü!ÚÈæl~É4ø|\r†î•«ºë‡\'tíR^/æ–1æŠ7llóNË˜÷Â¡ÔfÛ`J:­ûü‹=¯ÿÙoî¨İ5Ğô“ÊêËûÕÂˆª|ü<ƒÚ&”§z¦·¡FòÂÕ¥ÜĞ­iİQpuã°‚¥ˆ+XôÃ²ZwÖ¼LÆÎèâhÇ¢8=*»l¸ûÓO8¨W÷\Zt`\nY0¥2Bkm4\0°uÛ>×ıôŞ7vÕï9ÄE¨ÃK*T-şƒITñí™ïwÄ§üøÊ+ŸÔX|rÏí?8©Oïî[i¹ÉJ%IJ»<øI”6oı²ß\r·<øúõ÷Wÿ?%H1Z×½[Å†»n»æ”~}Ü¼?ºWŞdÕ˜ÊlI3¶_Ÿ7ßı‹é\'tïÖÙûH“8xğŞ˜RqÀ’—XœK—ÎxÈ:®bñ „6„eÄVû4bAÅ²W,á•^Gbkr•‰‰¶\\6rëŞ­sõİ¿˜~BåŠ›[ò Ï)Ëg›Â¾Ò²u»»Ş0óÁ>İüÅñŞhy°µ è‘ëRä_É(’,‘~Ê½hÏù‘×ˆ¥$H4Ú!Xš‚$À’\Z#qdC³æÈjŠEdupÿ^ïÜuë5“»v)¯§óG†ÊÈµÔò2„ôËi;‡\0*Ï\Zş6…é©9-§uœs§k—òúûf_7şÈ‘ƒŸÑZÈÛÑ<y^©¾¬™K¢;:êïÑşÆááBú+tV,“ÙĞ¯Y–¨²ñ1f_QXG>ø™ûf_7¾k—òz…D›;kŸÚóFZ¦··nS˜ÊpNN\0d2Yç¾ß?{ëÜyjŠ.¥@ô¨ˆÒiå\"ŠÔ7õˆÔùD±^Š)–İÆaécÔ±ô¸EµÚ$‘±˜¾¾I¡Ñ°&N8îök¿7ef:í½×E·¥„.Ø‚»8§ßD—Ë+ÓíM®ëº3é×kåƒ=ÿh&“-ÒãVMš8·—Ë‰1•ku¡,DNŒÌ•K¶O€e£2.œãøJœg@A:ÕxÍ¥g_6ùÌãŸ±ÍùşĞ…ıEF¥×l\ZqëÏÙ±³~Ø¿£ÿı’t«KË;j\"¦Z!%İ»U¬šùãiS‡W\r0}½á~MFÖó}î”KÚU¿§ì®şzÏÂ÷ª¿»?ûÉ\'©;kÿ^,½}®xÇ=â7Lÿöu]*HüAL¡|±;OÏ@ t¦(CÔÛÚkÎ ¼æœcî+‹§<üØó57‹o¶ÖEÊ<qÎåÃF?Š$°Œ¤x\\äG\"=±ÆQŸB,Ë~yËï[ ª>‘p¬&#ÏUíXAÿºÃhP)?ê\rü.NúöŞ¡¿êÒ³¯xú±ÏŠÇ~qsiÒ…¨ùM‚ròéƒmº}¡}â;´¥acÀÔN/«ù²®Ç÷ÿå­Ÿöœ…\"	9³°‚iŠÌ\rU\"KŞØp`åÒ>i\"Åò>ıó£ï_0½WÏnÛ¥Mö¦­Êl@’`)ÆêZi¢³•çÓÆu]üãõ%ßzäÉïkhØÛGÈ/²‘+VÁšçÈò|è:+ç†j]yy§­—_<éÚ3NûwÇQElR\nÉ0/6Ë‡¥`Ğ\'å4Ù,\rSÅ“vq-:\'ZCYš§Xõ\r¥şé¥ó^[òƒ¬ëëb™·´„v›i©³éâ~ÁŠ3°;ì6LäSÓ2áÔ±÷^ö³fué|@“m+!jk)é\\%¡}ù¯pòãÒú[>ôø³—û/1ÊdšSg\r¯rÄ²E‡&\\Š‘Kßqe¦şıòQ‡zæêi“o\Zthß\r†^şíÉ¨`¹¾Ñº¿’ëºÎ²åkF?1gŞ¬Uk?;½£\";‘Ú»vä\nšKbğ¾üí’©fŒUµì«0W¶”³‚åcİ:Â\".yÕ¸\'çÌ¿yÕšOÏˆ(RÍ\'V\n[›Æ2½JmÆRC5ÓO\rrğËOÿË±G\r[dJ”ôÈ>	½Î´ë ±õI9\"EU¶$ÖÍÖ¦½X®ë:Õ«7xú…7®[´´úB7ëë\nlsğ`k‚ƒL	íQ(o0&À\"Š£F‚QÛ ¯’«|…œI¿ÎI9-ãÆŒxê¼É\'İ#¾pW—›I–I^}ÏËT…•Ó‡¦²¨ç”qu´LÕ6®®f{]×ç-œ6ÿ¥—×ÕílÃ×9uíÚyİø“Æ<2iÂqØ½KØ¢¶ü|èSúQóµ%dojgxÈ­`%ze:j;\"Ÿdb,ß”Éd±tùêq¯.XvÑ»ËVMinm­ÔÃ¬Ğn‡ZmÏkkšÉïOŒkÀÒË¼ŸÄ;fô°gO;qôÇŒ\Zº(Nå(sêH™ç’\"-˜$ÊñÍ‰HùôÙÒº¯pÉ²U\'¾µøÃs–._=±±©¹·éMå©@D²½© ‰¤\\€ŠoÅb@YiÉ¶1£†Îıæ±#Ÿ;zØ‚â¢BùM.69Ğm$¥[mûH¯Ëw›\"_¬¯tÙÔÖ–qª×l\ZùÁÊu§®øhı)k7l×–É–ÿ»ù€‚tªaÈÀ~‹8lĞëG>øµU>¤?CüÿRb&<NÁlõ6gŞÖ&*\0ÂGŞl©¹¹¥pí†-#Ö¬ß|ôº[Ú°éó#>ÿ¢¶*ëfËÀ™xÊâ	Å^DE~Ó®´ñÆ™ùq¤œTãA½*×pĞŠÁ‡ö}¿jP¿÷†ì[]RR¼ÏÛÎqî/¬¨¹JÊN~Ô+Eêl\'yjs)–Îp®XÔ¡MúlÍu]§µuŸ³­fgŸ-Û¶ŞVS{ÈÚİıkwÖ÷®«ßÓswCcessk×ú†Æ27ë–rÆŠ™è‡1—·8ÓTQ^ÖXRRT×¹¼¬¶kÅ5•İ*¶u¯ìüYï•Ÿôíİc]ïİ¶ºõÌONœË$ß7Öÿ\\šÕÌ9°o\0\0\0\0IEND®B`‚',1790768769,1790768769),(6,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0˜\0\0\0˜\0\0\0Â !\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0 \0IDATxœí}yœÅµÿ·úŞaÆaEPuQDÑ¸¨”¨D_TŒq%Æß3&Æ$J\"‰1æ¹ &Æ¸$1ái\\\"\ZPŒ¸\0\"¨#»¢€0Â\0Ã0ÌÂÜÛõû£»ªOUWu÷½3øô}^is««N}ëÔ©Ó§Î©®;—¹®ëÀæ¸.÷êD–é4Qí[S/–ÈëüÒ²ææıÎÖê‡lŞº}àÖêš~;jöZ³³¶ç®Ú½İ÷ÔÕ—766w®­«/Íºn	€\"\0ËĞ”rœ†e¥õÅÅ…»:”•ÖtîxPuy—[»–wø¬g÷òOz÷ì¶®g÷.[\nÛ¹¹ğ•$ÙÚ|Õ°˜ëºcœó!w8çõŒ1\0y¢ ĞëeT)t:[;½ÁƒÀÒùu\0ÀÁ\0hjjN¯İ°¹rÍúMÇ®ûxó16~~ÔçÛjg³ÙR\0``àğû ¤Áü9ãA¡¬ÚĞv´<•JÕ÷êQ¾¦ß^+Şû½Áú¼;¨ïª¢¢ÂŒi&9ÇÉ^—¯wR,[]–.{‘t,¦M\0207\\óõI-™ŒSµfã°åï¯;cå‡ëO_»aÓè–L¦şä³PªV^â`>÷óÜ¿#Š\'ÿU±ô>„âétİ ş}uÄ€×>ràüÊÁ}?(H§¿Öò¶%£‚‰åğËg§u©¡©©hÉ²U§¼¹øƒó–®X=~_CSO\0T#ÂyÀ¤[0hG˜>ŠÆ„Å\r÷h_R´uäğ!sN:~Øs£FT,()*jŠí×#å¬`_5ëÖ’É8KW¬ıê‚e—¼³lÕ¤ÆææòÈD1lúRV$€ÛğåÅ……5Ç¨xöÌSFüyäğ!‹tË–‹ü¿\nsÅ8çFN0¦3)|\ZA#êi¹Ş>ªÌÔW¬êí»:¿8wá”y¯/½r×îº¹üë:w*[7öÔ‘LwÂã=ºu©òW0*[]qóUgÂUè’8ù4Š¤ŸÍù¦uTa¢ó$XœsT­ŞXùô¯ß°hiÕÅn–<òøeP§Kº¬%ÁJÚÆÔ†z\0NŠ5YùÔO½·rHß*!QO=¸I—¥^&p\0sÀ céu:–äËfÁh2Y•¨ò¶Æb`î’å«F?9{Ş­«Ö|z6·MjÜ²fó›’æã°€°–_º’x:ø°—/<ö—£®Xä…-K>sbÃ2•ç‚Ålû`¦PV”ëe´\r-Kºu*/[±fÄ³çÎXµö³1\"2›	\"V£¤\ZáÑmA§–SÑDE~ê<«XÉ\"Òx,»)\rG ƒ}å²Éã¦>x­1í\rÆm%İÂ ô&|_Ù(rı\'›û?ôø3W¼¿şüP¥œ0fñÔa_–B)™I²Ü%M­mOÒğ#<sí”‰·è×{Cş(.Iû*(\0ìÚSWúè_^š6wş’¸Ü-¿|%õ‡¢ê¢ò6İ³m_˜òQãĞ±lÛ&ç0§iÜ£î»â;çÌèÜ¡¬ŞÂm(}snT0\Z˜˜0•™\"–¸APº¬›uşõÚ’o>òä‹÷×íİw8ÀÀ|ş8óçCNŒo–Ån±Øh÷Ûˆ<hjğ¸A˜V®õO‰õòØBocâ‹›Û\ZşXnYYû-W^:áú³NõÏ”“2Fv¶y¦ÉTnŠ“`EnSĞ0VãÀ¸­\rJ»­zg·ß<ğ·Y+?Ü0IŸ)ÎƒÉg´ş½É9Î%Š‹HzŸ‰]¤¸Ô†Kdè!äÀQGôöGß¿hjî]¶«İæ¶M5ÇQÁšä\rÜ	mSD½äs\0e\'1ï·hX=ç•Å“~ìù‡\Zı\rÒ\\—¿$ËWÔ²dë3—>(Å‹ãPû³•Ù–R[_(..¬¹æòs¯?æøgmó°¿EDËâ‚:Ç‰¶)l)nk!*¼­İS_r÷¬¿ß»hÉ‡ßMjˆLr¦ù$¾¾­ü@ùí¹båâFšÊiŸÀèQGüé¦©ß¾¡c‡Ò†Ø üä¾í¡¶o…yÎ7}´vcåíw=>{GÍî\nˆ§É÷§ÄÆ€ /¢E¯0X9÷¯NÃ’yÀ£óÛşœæp)NdQXÁìêX‚À‡Ï§†åİ¦Hœğ%œKÒõMÃKº‡ÕµK§UÓ<eòĞA}«¢g¦íÓ—zšÂå®óÂËoŸÿàcÏ?šÉxÇdş/}9)NÕ_wù¹WL<ûÄg¾Ìİ‚œ÷Áò	m]î:™LÖ¹ÿÏŞşâÜ…?ÍÉ¨e&·E(ÿ \\\Zu†,×%ÒäÊÅá\"A^>~Ü	w^ÿ½IÓÛd°%S¾[\Ziêpê©KÓ»ÈĞ3Cä¡[À††¦¢é¿şÓï}°ş|oåQ—î¯z,”§¡$#ác°ä@¡ñÊ=ÎÔØ_ä™ÿ?÷IH9¸¼g!,™bJ>w,/¹gJRäœ¾5`¤M€ËXŒ`Í™·è§[·íXsÃeíÛ7™¶#Ä<ÒréÌk:¡¿wéF.ÛQ4¶º]»ë:Ş4ıÁ>İT}¢‰îë˜¢Ë¯K:¬O÷·ï¾ıº‰;•Õæó.2n›B*Ÿş.2ÉÖ‚NgÛ¦ØZ]ÓıÆŸ=0o{Mm¥ß»ç§&\rù¢Â?´K-ŠYÌôĞHƒÂPÑÖ©!k·òU÷üâûc{v/¯6½ÃÔL[YĞtAyÙšmŠ¨´ùóí‡ÜtÛƒ¯íØ¹»¿¡éÑ\"8£yÈ¨“Ï}mb4|ÓŞEr±Lø$z„å-1,Ø}‘YnÄ½P\nmêQ¨\rKÆÀV,/ß%Ğ£X™h9‚:-/]ÓüÅ2ÔG×òNî¾ãºÓ{÷ê¶Å´G–oŠ<“ßÚ´éó/úÜğÓû^¯İSß/gÆĞºå§-—¯¯ÃR¨«^>üvìPúÉ½wşàÔ>½ŞÔvœy©ÍOSlÙ¶½ç?›õÆöšÚş~v)äÎE…I&,*iâ7SÒØ‡+*K\ZÎ%à+/&Ş¢øJÒ–¤nå7Üó‹©\'Ò£ÛÖ9‰îÊuí/³M¯Œh½N»»voÇkoúíÛkj+Åò¡,+ğÌ9÷Ã\ZoßĞsÌgr‰#d)ò—H„±è2›³Ü÷›JÛãŒ“G`ü˜ã±cg-fş×_QWß 7>¹èd©³`yı³`¯/úr-¢ÈoŒ>g>\nÿš¿‹Ş­BÆuA£H¦(š±\n~4¥Ô—±(ÆıÖ†¥l\"èÚ¥CÕCwÿğä.:ìÒ…ê‚^\'êMzzIµ\\L744]Ë½óh´˜Ôd¨¥hÈÀC1~Ìñ8åÄá(*l\'Ç¶ùóíøÉ¿GõöÛ<]0ñT\\}Ù8Î9¶×ÔâÅyñò«ï vOâ“5ÖÔK$ÅêÛ§ûÛ÷Ï¼alIIQSÜ‘iÓ÷\"C/»Ûâ]dKKÆ¹eÆïÿ¶üıuæÃò1gÁÚZßO.$ºĞ¾}1N?éŒs<ïÛËê´î¨©ÅÍw<ŒO?Ûf`4ªÃ¤şz|éä±¸ìÛãŒ<4ïoÁWâù—ßÂšõ›”1$OÁÙ$Ÿyb}äÀgfN»ú¢‚‚´Ûêw‘¶m\nšzs\0¿{øé/Î[¤ìĞË-äîViÃV—X˜ŸÚAıû`ÂXÏZ&:š½gï>Üüó‡±î“-‘üZù¢tdÉd\0.¿øl|ç‚3W^³~ù-,X¸--™ÀµâÁ2+ß¹†\"pÈVeé–‘­“£\\î%]kü¸îüÏk.˜&ÇkGÜêV;ùÏ½ôæ…÷=òÙŠ¤å‰:mp0äå“ãKCu²Äø”&h_ZZ‚ßŞ1ıûõ²\n‚&½®¾¾?™ñ¬Zó)\"Ÿ|ã[3İ”‹Æá’ÇZÏ·›çµ{êñòüwğìœ7±{wÚ¼ì$+Æ´-à†+ÏŸ|Ş9\'ıw@JjÕØGk7V>øØórŸ!Î<·Xæı\'š3O½±yÎ˜Ö†©íÁ,4Aû^=Ê¥rOı¤—^×¾}1~=ı\Z1´ŸßóxÔ/Éo7ÑıÇùgâ’Ç*}GñCi:v(ÅÅß:“Ï;MÁ4ò#ê_ ò2Á#iŠõàcÏ?úÑÚ•­Ñï ™¿ÆFıQ\'hwïÙ[zû]ÏniÉ”‚sOóÉw/Ê˜¡îmmŠ‹½åPX‘×ïE^ÿdŒ¡¤¸3§]…#‡âÇÄwp!àÀ…OÁwÿãìœúÖyfŒ¡{×ÎrœL·~oËë—Ç£½Ş„•iÉ”Ş~×ã³wïÙ[\Zç‡Ùêå¬µ&îÈ÷‘ŞÚ/ñîY¿wGÍî\nÆ˜«=iB„¬Ö*XíızAì—K:0¥Ü«H§Rr0¡ˆ†ÜÛ&ZäKŠ‹0ógWaXeÿ ?ÿI–“ïÿÂ¿¨?v4®™2ÑŠÕ·Ê*¡£Õ³€Á@@~m˜¡1	¹’O?¿£¦¶âîY¿—s.õ*½7•;œs¸Üu¤¹ö·¤ÅÒL<\0Ìyeñ¤EïV}WxµL(‰\\ÿÉ§>håS[Ï#P(îO2QÄ0M<\'©+*j‡;v†\r=\\õ#5ŸJıé\'ÿwõùŠs›kßô³¤¤!™…&Òe…/\'ùl’²\0Ç€¥<Á¤©Àõ-©úîœWO¢<sp‡êˆà_/“Ö)nYi[õÎn?öüC ÷ş”“tŸç¤}¨œä£°\\7˜¬$–\"ê]›X.ïœv5*+úFö/Æ~üÈ¡¸ùÃqœÄ}›x uE…íd¿°ÈH/7Ö‘ö&,ÙÆ–\'X?öüCÛªwv³GäEp(Ê¼3^`‘—hèº.~óÀßf546—Í–…iy½cºtŠ%†.Ÿ*aÑ‡be³Y\0ÉjZ§·¡uÅEí0sÚÕ:¸o`9#¼xeG1\0·İtR©TÎÁ…©oq¶+ŒŒ´ïÁ\"Çd9µFB®Å²µaC	¬£X°\Z›ËóÀßf¹®‹8]ñ{r˜›Fé_¯-ùæÊª\r“¨¢H¶5%Q’òÄQÑ%ÇĞ.½¡ÕÑ¿iÉdı.Ôı¥ k•™$uŒ1´/)Â¯§_ƒ\rŸlër¸Ü…›u‘u9\\×EÖuqô°(,lºı`²R:_Qu\0PPV—h)‡`iË%8íA¤Ş,åS«ñûQäÍ=¬•n˜ô¯×–|gâùPcK’\n÷®q×ºÒËŸœy¿¾©–WÊÂÒ¦¥%c´B¶{[iÃ°¤¸ĞóÇ¢Ø2XFVR>\0 NA0çd®áe8˜WJ.”ƒË6¡ş@°¸¸ïdƒşàã3Òÿ#O¾xÿ®cëæëß ·í:.wAŠ¼Işå¥iu{	\"Ei¤}ëJ–5QG£/™K§¾¬FcÑrŠÕ¼¿Åè?ÆmèurzrÀÒ?Û‹1†TÊ‘Ëp ¥`‰ÀäÒíc‰2ŸR_ÒmX2zk©À%Ë§ÀªÛÛpÈ£yi\Z nkÙ|[åe¥i›‚1†õŸlî?wş’Ñ©ŒĞ5Ö5Ñr	Ø°˜	14ïo	ñoºÏe#Wú¶Ä )+)˜&R/’\"ö\nk$pt,Nš1\n@³²!æÎ_òƒõŸlîÏK¶M„dÙˆs<ôø3³®[dÛ…6E…¡r[i¡3âèXœ£¹y¿u ÉVAhÜ	é$–8y!£:“ì¸¿¶qUy8Ú’#÷—S…E¢Ë¬ë=ôø3MãmSÄmM,[±fÄŠÖŸ/Í15ÍŒ˜fåñ u æ›ö%ú!ËÁR`şAp!Ÿ¾ææ°K²@ïs]“Òäc©lLK‘°\0\"F‰bimX°>f+X.EË¬ï¯?ÙŠ5#Lüs²9ïD…œÌ}böÜZ÷Q†¿¢[\\Æ@Ì.“ŒAÉ1Ù–I3N,4#yn^<†–L™L6Ú²j–Ã¶•ĞÚË†™kßŠŒ¤3¡-êR(…À‹§ôD!•	3b…§*˜”`r˜=w†MoÄöWhí3·dùªÑ«Ö~6&dVégÈlG,q€ÚFÏ[n¡G6ëbK&\'«Wgº’ĞKõoeßbò2P—B«ì“äõöZŞ6×«Ö~6fÉòU£M:$’\\/]î:4*p¹ë<9{Ş­œs¢åDtY¤æ\\šT&éå²¨mÈÓHË•:Íœ)K4¼Ğº±©9äè–‚æãêâ¬P}[ôM•AU>&’,_Ô½0Ò²¬pûcÀ“³çİ*^5\ZL~AÒ×\0¡‰U«7V®ZûéÙ’º@1²&K‹Ê¤0ªA«äI[H]\n°|š`é\r°Ê»tğw¾Í–B”Ù>sõµ–‰osŠ«§¤1´±}Å÷»jí§gW­ŞXI}/\0rËËºMñô¯ßàÛa¯’®@»Or!ˆ~Bímx0å®åqÏŒïã Ò…:¨	6ÛV–o]Rzš\nÒ)y¦,NF¶cM±r4\\ùa=ıÂë7@r8ø\0à˜Ì|õö]-­ºX®ó$r\0ò ˜ù@héyXÊ£°Ô6]»vÄogLE¯å±Ë£mù’B±,[_6Å¹ìÛã0å¢qd9L:\'îƒ8ths‚@vBæ»ÆòO‹y˜\Z ~tŞı¢¥UWoßÕ™sF¾Ä9÷^vë×‹sNq]^N¬¨¯´ÌÏ3ÎI™÷4oN¢M¨Ù<IÃà~;ßª±,¯œãàò¸gÆTÒ³+èÓb²qË¥‰¾­±lu:–¾d^ráX\\~ñYŞà¥¼¹”——¨ï£Ò0bi˜BÆb‹ü}¥X~Ÿbİ¬[ôâÜ…SäI\n?Št˜>ÁÚ’É8ó^_z%÷(Á¥F‹{€³U3ƒä½b•@<›CÛ±D¾[×Î¸çßGÏîå±Ö™èt«q °tŒ\\°¾sÁ\\ñsBBÆKZ\rôùJ„e¦•«Ôºy¯/½²%“	éSèe÷Ò«GïT~ûÇÿR*÷†àşF5n4…Ê}‹TÚ¾S.:å]: ¤¸í\nÒH¥RpÏ÷ŒZ!ëXÈf]d2Yo¿«%‹ŠÁ‡¡{·ÎàÜşm\':ÁIë$ï­ÄRä#½İÅß:cxäÏsà8ãøCÊqJù÷bIã.çRn--Y¸YWN­>—örò%cªËÏìÚ½gàÒ«Gc$Ş¦cHKÏŸyÚ¿$øÆ3”ˆN2ÀE§¢’ƒq¡õ>3¾F2ò§ Çœ:“ÆŸ+Ø$)‰Ãœk][`åKoJ”¯oO:Ï:NÊA:•‚Ø:€ˆ®\rÉ{n8ZZ²¨­Û‹™ÿõW|ğÑÇÁŸE0¿‘¥”A~Nşı1ÚH\n–ÔW,»D(˜Ğ+å]dcSs»w–­òÆk­ÄÕ“t‚ÀÏòh„¯à=‰ãÇ–}BHæ0ÇÕıoÇbŒ¡¤¤…í\n|‹åY2Ïh…£e/ï½8/,,@·òN¸ğÜSåÜ(IÎWäúd¤÷ÿÑêŞY¶jRCSS‘pò¨ï\"—,[uJcSs9\'8<@”ÿå~Ö|\0Ã†öÇ¡‡âõËŞˆsÌ¿JX¶2»B1#(uLzö([‰ÚœqÃ½ZFÛÀPŞØÔ\\¾dÙªS(/Ê6Å›‹?8Ï§—(4/PCšî—1½Ã&hÖËäàÒò(\Z½Ìæ G9êIü¸@â@båSEŸrL<ëDeèešGò¾F­·´:$ú”ÛÙ¬‹¥+VgÂQO€å>ÈÃRä;u<\'7Ly²l!º)™êu,ıé¥t6¬(\\–­>n\\I±L8IÆkÃÖëÆ>\nÅÅEd^á}Â>¿ĞöÁä¥—ƒaéŠÕã3™,BÛUk6«ohê6•†¥¸øÑtŞ5î´cQN%z\né}T][b‰|¾}›êZ3¤–7kWÚ¾gœr™«`Êêú0˜iˆ)õõ\rM=«Öl&ôÊ/¹—¿¿îÑZ5ƒt×/#\\„Ì%ù€c8gÌh£¯a{\ns©‹*û:bÙ|¬$uI±Î;ûp€à[İdNå+\"¿ŒQ:rÉ¹÷é)Öò÷×\0\\¼‹dŒaå‡ëOÖÔ Uiz¯îûLqÂ _>bø`ô8¸³QÈz>Ÿº¨²¯#–	×DÓ\Z¬C{wÇğat«“Ú2Ÿ^XÕ­$)PDµ˜cå‡ëOW¶)šššÓk7l\ZÍÁÉno`¡”s¥NšNæ/´ÆÎ}ÜÒ¡;Ê¹,	:½©}M[`‰²|±ègÔø£è“`Àyã¿ZöB—˜ÓÈú°.¬İ°itSSs\Z\0ÒsÜ•ÖWîÏdËóôV<¾ïæ—Ñ:YHË¥Bzíº•wÂ¨£+äÓ#—ëSgJI±¢¬¸×±ö54á½•k±²j6lÜ‚ê/vao}\\î})¶Kç8ôƒQ1ø0{ôeû%Ê²˜xj%ƒ$¶±2ÆpÜ1CÑ³{9¶}±SGÃœF&ƒ_Ô’É–­İ°¹ò¨ÊËÓ\0°fı¦c%Ñ\";Ô—OË,4#\Z„TÊQ$\0¡ûÖ¤8¬¤}qÎ±qÓ6<ıÂ¼±p%šš÷éZZ2¨ß×ˆÏ6WãÍÅïãáÇ^@ÿ~½pŞÙßÀ\'ğ¿ÓØz~’ĞëŠ+Êlm¨es†‰gˆ‡!\'~’¦5ë7‹Jx\n¶îãÍÇpM[„Å\ntÙûôr![F‡!ëæ¿±g1\nC÷•‰\n‡>Yâ3I\rKr’«vO=~ÿÄ?ñêëK‘õÕ\\Ô`ı\'Ÿã7üOıc>¦^qFS‘7_Š$#êhŠ’IÖ ş½Cãä–|PâI‡iïy¼¿Ìıº7\0)üèı×‘·í©Û×S6¦æn´‘ÜïÀˆ^\n\ZpÏÔf\\—|ˆc‚¾š?®öŞÊµ¸iúƒøhõF¸ A¿>ã¤ÓË˜ÄP9q½{ñÚ[ËQ³kF9ØûíW4í­oÀ´™bo]Y…ä)Æ‚cSôÓŸlÆ=cŒÉWˆâÔ1ã@ÖuİgÏÔiljJ¾­f0à€ŒÄù+\0J„(ÂWpqLD>È×íİ‡MŸmùÂÃÌ#„ORg\nÓE²a½8w~2ã¨­İë—+c—ïRÅ¸xğ )ã—–Ãkÿò+ïà‡·ÍòşTz¯&şâ¶\"’Œ?¾y¦Í|[>ß.y¶|sœûæ)cèlYp#Û¾­fpsó~ÇÙZ½ó7+~»‘i\rå\n%	ÌÔzÚ¡±{wnš6ŸmV•LHkêô¼¸7apÎñÏ¹ñ_¿\Z®ÿ×yì‹¢WÜÊ±jÍFüxúC¨ß×håÕÄ_Ò”T&zÊd²¸ã7ãÃ>6°­1bş­É#vİléÖê‡8›·n(Šé½ŠËµ{µÎ¶nÓw×î:Ü8í|üéÖØ>c˜&.äO²ğîòÕ¸ÿ‘(5ù\"ú³bÌss[\0XÿñfÌ¸û	d³nâ-]Q²ˆ“—Ïd³¸ówÆâ¥©ãôsú‰]6¤°ìàÀæ­Û:[«kúA7§	.–0O1k÷Ôã‡ÓfaİÇ›­Kší‰4™|[]Ô2±kwfş×_½?\\GyEx|¹ŒÑ&›¥+Öà¿Ÿÿw$ßô^w”,t\Z›æ]—ã×÷>…7½Ë¿>c=âé¶V×ôsvÔì9Th«~!æ>ŸkÏŞ}¸é¶ñáªO¬Ö\'ÉØ­WÔ5ëOÏcÏŞ}áñ°d2ÈU\0ğÄßçbkuMŞ¼Ûèõr‘tºlÖÅ]÷?…×Ş|/–×Äc‹‘\0ì¨Ùs¨S³³¶§,æA5}.¹—N¼B6¢J{mM©ohÂÍ·?Œe+×xõ1Os’\'=	ıÚ\r›°àí„•€1ÅÄúX†dÁâœcK=õr¢1&uòMÖP¿–ë®ûŸÂ«–…¦I¼îÏ¯WUˆA›Sy¯êEÍÎÚÎ®Ú½İEô \ZÊ¨HÉ›¿™â1á‡´$UÛ32 ©y?~öËGñæ¢÷UF\rËBT].ô³Ÿûw˜N^Şr®Ô‰‡NNçi\\:/X¸Rş6RÏ&ş“Ğ˜è²Ù,~}ß_ñêëK¡(¾5=bÌÊ\'ÈÜ²Æ.ÏchX»j÷vwöÔÕ—EQm$>‚	Ğ\r$d£Ì†ŒGKKfüöI¼ôêâX§U|šÊ¢èEÚSW…Kªäƒ¶R\\ù¨°E—qXcÈf²xuÁÒ:FZ–Édqçïş‚ù––¸…gî7¨ŒWÈBŸ&õõcO]}¹ÓØØÜ9ˆö¸BD•¤œë4„çPû`­# tÙl¿5³Ÿû7ôë¨¥P§±Ñ‹ôÎ²UhÉd¹$ÉË‹<#\\<W9b-\\R•Óm¼mŒ\"ŸÉd1ãî\'ğï·–ËºDcdz·¶QÿÕ±¼–ÍÚºúR}Íeâ†äuŸÌTOq¼Ûïé¦%çÿí_±á|.N¾^ÿşG‚10˜óÊ¸L2ĞÊ•ö,ŒõñÆÏ±¯¡)§±ˆ”T--LÿõcxkñûF~Mã5Í]\\\r­¯­«/M»./cJ#ÙXCŠS2=oº7„p}Eùz½^fª÷oÜ*D•#*EÑ@c²Y×Åg›«Q1è°HK,’„Xü0ZÎ9ÇšZ¼³ì#mò’¥¨yÌËuyIšE6®ä9\0¦”·:qÈA˜ZcC½ÉÑï·ïØˆïÖŒ/IÛí5»Q1è°ØqŠdòµd,|r‚9ú—\r%ôÔÊÄs¢Ğ2R1’¢4¸÷‡~9¸·‹/Ñ\nMæ`Êï)rî³ëw­}ñ6ÈÃ’ü9æ9/Œ°Ç½6_ã±ª[$ıÓTEŸÍfÑĞÔì™¼=Ô\0\0¤IDATG@ŒğEeáóÈAÆ,êÏæ1+Ó° aíkhŠ£2¥1u’s‚åÈÕHåOsğıå‰êeµÀâ\n’ÀÒl1ÅrÒ×˜‚æÅoJE:£ÛJä%Ë¹åaárĞõ‚q‰ŒÛÙ£×åÌlÖƒëtt,¦±k[7‰°¢_Ä+mr¬cŒ¡ÚÈW³â¹XRX«°Òp!~7’Ú= •4_‚êMPÈU:bñ\"-±\\óƒ%2WÀH\'êRƒâ¢vØ¿¿ª‰²Œ‹™ÛìåQXíKŠÂËZï¦)ÇüPÙøg,˜:ÛÒj‚°åµä¦ÁXJäzÊˆ<ÕZ\ZÊ\"-/F$½9ÒF,‘I-M6:Jßµ¼êö6Èş@xF¨-CQc¤Æ!ôüØ°îÚ)ñöCÔi“…c‘å9Üw8o£×†<ißä¤Ö@	¢\ZÙê’äm8âşœ3GQQaäÖƒ-HÂ÷;´‡ÒŸ·|Æ›+•rphïîV^umå¶-€şˆƒ},IR}R,Ça\rNÇ²Òz„6Éèí>®<òâaŒsÏşşóÚı?ã”ì’ƒÕÊLyÆ†\r=ü€+	Ö€~‡ }I‘u¶ñèå6\0@‡²ö˜|îiÉÆ`˜‹hZnmk\ZwÇ²Òz§¸¸p—şçyèS©ü5;QG^¿­ò$sûSÎXpÏ\0\\ğÍSpı•“|_ ·€ù‰7]ÇŠ”ã(<ÊàF~‚ÜÓñŠ±†ßAJ0Î¥lTÌ 8aÔ±–6¦×‰tÕepå¥|¾¸và})ï`ŒôÒŞ¹Ò:Nñ¬ââÂ]N‡²Ò\Z€/4…zúB£ªŠ¤|:!H11t²:‰í¥Éç†k.ÿ±í	Öë$/ô\"uêxF=ÄŸpòTQ.ğ\'ïŒQ‚\n™	±cå(H¥pæ)#bı¯8¦ÓÙÆÿíóNÃ×]è-™Ô¥Ğæ (#ãÒÆHÇ¥bs+	V‡²Ò\Z§sÇƒªÕ‚¬q­¥š‰	1)(¼hÒé¸êÒ	9mEä³MA¯Ï=Õîé‚G—ë‚•šÚ…ËNûÆÑèVŞÉÈ—>}<QeQËìø1£që—\"] şeÔ¹aŒ6údX;Tí”wé¸•‡t…û™ÖiSWÆö”iÆpÑ¤Óñ½KÆûEæ%æã–(\Zz\rz8Qa^zXmcäæ¶ô³°°¦\\4.\'^“È‚ŞÛhN9á(Üñ“+PXØÎ:Ö¸1&Mzûò.·:]Ë;|æ9FÑÇ™%˜¼7ù¼Óğ½KÆÇšxšzÒã–ıºşÊo¡}I±Â“Î·÷¤cdÚçåŸ…îwÉ‰×8Y˜êè=½Q™Ó®BqI‘q¬qcLzémº–wøÌéÙ½üİ2™¬U[\\çO8W]:ÁÃMàäÆ9´¹âêŞ­3~8urÎcËWÇ¨Àùß<%/^s	âè¬ì»¦_ãmô¶ñmX=»—âôîÙm\ZEj!´ïJ\" µy3z0aÌñ¸æ»çFZ—|Ú\\±N9á(\\ñsÈ8ã®:ç¦1ªr\nŠykĞá½që—æ4Æ¸qä‹\0C÷Åon¿e¥Ådlä{®~™÷.ªÌ@«ëNïİÖ9=»wÙâ¤œzáÔ+æËˆì¤BòàÔgM©á9ƒçÜpõÖ]fšâL¿Ï‹1ïOƒ{K5HÍ¥¢0ò,Ê°]/|:ú…eæË§rğa¸ëç×È}¯¤cŒGÒ1Úèèƒ»¦_‹ƒÚó\'›i¶L3kêƒ 	¾xMã”ãÔ÷ìŞe‹SXØÎíÕ£|T,B¤³«\n=`*dÕxÀYåà~øÉ\rÿ¡ü›óÚšº|è/şÖ¸íGSĞ¾}qxÄŠ@Y°­A©„¼ˆÌ\0†³Ç‡»ï˜Š²ƒÚ·és	è½1h@üê¶«½?¥)Ç¡“–sÊC$ÊEï©L8zõ(_SXØÎû¥µş}{­­¡ÜÛ·å”9‚«(·,ãª2†]Úµ+ğo£×ÖÔå‹uòè£ğè½7ãÄã‡Ìæ‹pE—”<‘Eîåøå­ßÃ¯›Œvrk íÆ˜Kp`ÄgÅ Ãğó›§ •J™Çec\\^\\ıûöZÉóş\0İÀÃ{¿hëªÏÓ\rö¯h[ZÆ9ÇGk6&v^Å=H{&©CLÛÅau-ïˆÛo¾÷ÿêÿá¤ãDº 3çcèwhOÜxİd<öÀ-8nÄP)¯¤{Ôs­Ë…~ÄQƒ1òèÁñcŒ˜g³¿<¼÷{œsÿĞ\rXÿ®qıV4‰·%3åŸ{é-Œ=íX0f?ç‡Ğ	Óóz™­m¬ŠA‡âöŸ|µ{öâe«ğşGcÃÆÏQıÅN46y?>_PF—Îe8ìî¨|FSÃëiäÁÔ—©Î&Vœ|rÁªß×ˆ÷«>„u“ÿ¨ù|Òà}Şu˜ã¦`PÿŞUéTİşL¶,Ä˜>À_8™Ÿ7\'Q·ş“-øhÍÆĞß3Y*Ó}’º\\}š8¬e¥{Ú±{Ú±²>“Í‚»‚™RR¾’ŒÑDõğDaGaÍc\Zšš=,s™k^OíÒ©ºAı{Wş_™.**Ìêßg‘Œ„ˆÃüb““6ÒlrAÇñÜKoYı	šÏ§.ª¬-±Ò©ÚEü²n[ñeÂ5ÑĞdò·â°\0`Î¼EÌŸ^ıOXIğËå{\\ò’›~!Ô¿Ï¢â¢¢ıœşâíQGx-ˆàGªªßøö3Ò#¤yZ¼õÎ¨ÙYéÈšî“Ôåê0Õ±L¸&šÖb}´f#>ùl›b†ÔcğÔ}×’˜_ctéé×ëè#Î×#ù¥p%ºàAd¥|šÊ¼Ï––^œ·(±Ó.ùÍÁ¡×éi]gßD×Î´Şg’º¸ñGÑGõGÛÿs.™ùŸ>ÿ¦²@­ÌuÜÓ%¿/ÇaËÀÜÊÁ}?(m_¼Ô¬2an}Í·™rK9½^ze1ZZ¼oVÇÑŠ”„ÎFOëâ–½½\r+®ÌfÙr]:uŒ¨>réOÜï©«Ç›‹WÊ¹ƒ¬3Ì)´O­®¥í‹·VîûAè§d\nÒiwäğ!sò	’´ÙU»oøè$Î2%½¢°Lu6z‘Ú+ª>¬(h?úgT»yÿ~û÷g’ÍÙè€‘Ã‡Ì)H§]Q¦à>éøaÏE™Aı>×ë¹—Ş”ƒŒ³NQ+î)o«r[?¹Ò\'é?ÎBÇYú¨~)çs^Y»ìÁPŸDN:~Øs”‡ƒËkÔˆŠÅ…íjÔ—ŸôİÔ<œ}SJd¹fı&¬Y¿)ÒÌG%“PMXI–‘\\é£&4>I»\\±L˜IèV|¸[¶îP#?ùââÈ´zZ¥ç Ñ¥8f]\\Ø®fÔˆŠ\0 tJùÅÛ’¢¢¦ãFT<ëuÅCêªü&©dä‹š\'8~á_Ÿy[«kĞĞĞ„L&‹¬ëÂ•—yú{İÍû[ĞĞØŒ½õ\r¨Û»/\'gZ¤¤u_U,=åCÏ9Ç‹sys(+ ç‡ª\';]bÎCôPË\07¢âÙ’¢¢&¿½\0iÅ|‚;‹O©úó‚·W\\%º°&Ê$¢Y´äC,z·\n\0N§òàœ9ş8àrÜõâr.Üûbé®:Ï:Qò-…á0çR÷UÃéãO·bıÇ›QPF:B:•B:R~$^œX²Ëd²Øï? ÕÛwa¡/{5qíªRS¸şÌSFüù6ñğ~JëÚ>røE;wX·k÷Ä\nùÿ²À@©~©}2€ü-‹\0ÁkïİeZ2hñ‰%\rÅñó.Ç}xœÏ:Á#cÑßğ*ÓÇmªË+|–\0V¯û?şùCØ·¯Q–7NäHUS§:GZ^–ÙÓDéé}—ÎÖ>d‘>ù‹·â*H§İ±§|Ä›uÿÒòâ?\'RüÇ‚O0Nä-í,fÁòóœ÷ıá<ÿòÛÊ„èù8?Èä˜Û°L).Î7Ñš|©\\\rMœˆ\\ åE,§ô–{½=•·\r‹Ş=uä#é´+¶½BÛ4MwÂãÃš€èÈA¿OråÓÆvİÿÈ?ğüKo%ëm÷\"o*‹¢?XúõÑÚOqóí£¾¡©U²ÊWîIÚ9kš0î„ÇaH ®›wí´kôÈÊ§Ä=]&=$l²  Ge9i$Ñ†.´~€1ŒEëXüñY<÷Ò[¦Á§1…ú¦º\\éÛK§aŒaÕÚOñ“ÛÆ¾†&%ªò\nÊHSyòã¤.,° aYùTn]jt=ü—İC¨Z³&z/]ƒÕ¿0dÅ¢ÜûwœÔsH*z4Œ0Ï”ò`àTe,àÏÿ=/`-O+BÛçkÁL<äcñ8çØöÅNÜ|Çï±o_“7JùGz¥$¤‰áA^øNş\\\rÚğ€	±ür±3 Nøêï¡/˜xê½.w9Ò¤(•øın\0¨Ò·jèàÃ^¦ªoÚ}I?µ2FË®amÇôr—°¨‚ü/[¤ç7å‹ÕäŞ½\rhØ×9‘tÌò>øš´¼5Dî íÉgÅà¾/Wé[åİÌå®·¦›ez]:yì/Á˜41_‰ƒ5™ku\"Ïµ\'Õ@Cïu1)¸\Z–â–!Ó§7•å‚Ñ\ZEeŒ¡¤$øË¦&ÙÊu0å£ÚÈ<‹Ç‚¯#t¬bƒUÜ;Qæ±Gy§bĞ¡¯ \"1C><MúÚŸ­	ŸæõåÉæàëŸúi+³ÕÛœô¨²(>)]qQ;@(]„tÁEÉÍ†E…U1èĞWFüåŸ¹ô>´MA/æ^6yÜ4\Z’Úò,¦<êŠÂ\råIX.óä¹²…ú6+¢[-½ÌD……o£7á‰¯úd‹Œ@ebø4ÊÎ‚Ó/ÀpÙäqÓt\0¥L˜:ù4?bøàeÃ‡\rx†ƒ.ká%.ş\nÖzÏ	^’Ëó7ƒÖŞŸ@)Î’´ÅÖB.+W,q¤ÓŞ/æÊñ’ÅÉßMU—;_†¾Ëi¿=\r9¸ÿóÇ¢^_úT—HŞ1Ù†9à™Ã/CLr¨cxÊE×S\0¸vÊÄ[RÌi’ıûÃK ÊäOñ*´L¶g`Ñß.dá·aJ=wU¦Æù;­¥oK,q‰WAR7¤ƒKÆJR/ÈˆH¢L8ÉúŸé2ş	*‰ÅeÄ)°æ4];eâ-•çs	§$…œ|êœÑ	Ğ¯÷†qgŒº™\";@ùéaéó€F6R»Wi–\"$1X–à¹ş{Ë|#¶ÖÒ·%–HãX¿`\"åM^ZJoI\n=W>Œí80îŒQ÷\rè×{CT€Äé‘iãîĞüß9gFYYû-ÁG–7®/sdùó G~ò¡ği,Î	×hÔ™sïE¸¯&uÌ¥€bêL4IúÌ¥®°]È¥|Êi$BÖ0Ò%f}ãj…«¬¬ı–+¾sÎ¡”gÎ¹Ü÷iá˜UÊ¨Ÿsé¢ë;kösÂ­Õ¶<…0•Qæã°t\\Š%~ãˆ1ÿ¯±ça1lt;wíÁûUÃI1ïäGÊ‘\'@R)ƒCqQa$~¾Ö°]»´ïP›å—l´¹`èm®¼tÂõ;”ÕÇ2å—m°Ë]Ç¤xg>êŸ¯½ñŞ³+«6L’æ˜Y”‡KÙ¨É )‰±ô¶ş}&›•¿u$Û2û	…¤©no~ôó‡ğégÕÖY9êˆş¸óÖ«PXX?¾Òét`:è“FïAÊM4zŞ6\'zü£èÿìY§ú§ÁšŒ/»MO7\0¤œ”û£ï_4µ¸¨]\r¬?«YGÊ‘„Ş¸‘†8û÷·X·	t‡:Iycc3n™ñ{lÜTÉÛŠ7`ÚÌ?ú?ò Ê/i_6Út*åõÍ´1›dÈÔ<g–¼mN˜Ë¿Š‹ÛÕüèûMM9)ûŠgHÊ‘i(Ÿ=»—W_sù¹×2@üd^‹JdıëÆd”6–¼ğXVsóş ?ËbK:}só~üìÎ?bõúÏd?ı)y¯÷Ş_‹i¿úš›÷G.Á¹&æ0õ/8sú%×@ÆôWŠƒ_¦Õé\rJ¹ÀâF¬k.?÷Úİ»l7EŠ6âú‘i±]asZE£ñcvô±•òCùíIÈØ¿gˆğ¸¡- d6&Îåï0šx6ÃR×Ò’Áí¿y+?\\ïo¥øÂ¦¼+yÏ,,[¾\ZÓıš}K–OßzêkcçD.Ğxä&z˜“¤ÕLõ£GUşiü˜ãŸEBOô¦2G7Ñt«‚æEÈß4õÛ7t-ï´*Ä¼’çRŞ¸y°Öö¦¼À\"}\0¨Û»¯Õ[®ëâÎßıï,­R°CùĞï¥wß[…Û~õ¨bÉ’ömªËd³°k†/eÇHœ3V×ò«nšúír\r”b·)¨5S¶,ü«CYû†é?29]®ùd8tg9Ø]æAÒ¼l£ÑXÂ¦{4Û¾Ø•—¥ãÉº.îºÿïX°p…Ù/Œócüëİå«1mæ£hjŞÙg_âjllèVk›¼l—Ş6„«7]®Ÿşã)“;”µoHòöÂ´Åe|	xï“ÄÑWå,¹†ê[uİåç^!×2¦µ÷åâ]Íû÷:=t,½œb1†G|ûÇ|Ôî©ôLÉœsÜ3k6^]°Tu´\rã’ÿ™hüûe+×âÖ_<‚&ß/Lâ—©+°üıuØU[Œ™Yhıéò²]zÛ.i0\\wù¹WÔ·*JGlï°ƒ|ŒÕŒK.wß=üôŒç-úikpb\rx¢TXÆ)\'Ç¹gƒú÷¥çœãÿ/Í§\rzWÓ°Š~øå­W¢}‰ñG…C©¶®¯¼¾/½²›·îhs~rIÆ¾ó?¯¹`Zä>i‚$Œî}ÙöÁliKKú–¿ÿÛ{¬?ßõu›ÄÃË9½	ˆåâ\Z™L‚äEÿCŠsÏşN}$\n\nÒŠñŞ\0püöÁ¿ã_¯-“ìp\rË¦ø*_\\ZZ>¸oÌœv5:v(Uúü>>Ú€9¯,ÆÛï|€æ–à+ı&¹xØâW‰Õr*{zG¢z–*\0ÇğÌÌiW_Ô® @2ÃÁ\'Vãs]O™„Ï%òIÊ(Pı¾†’ëo¹wŞÆMÛN‘•ú“Ê‚S1y¾³æŞø“Ì\\FiŠ¤u,	‰	¦¤œ£S§2œsæq?v4ºvé\0hÉdğ«{ŸÂ‚·–û’ <±@àÌÿ‡ƒÉğİû¹a¯ÉŒ²År`õéÕ\r¿š~\rîÚIÊkOİ>¼²À·VŸoÆL\rä`Y€¯Öyy÷Rvôöë}ySĞ·O÷·ïŸyÃØÒö%\r´µÍ\0Åés]5¬>‰ÃW8kt§YäõO\0Ø]»·ãµ7ıö5µ•0%)3ª`y&Æ|CbœT:…=gœ|~a>\\õq+È-uêT†[o¼)ÇÁœWáÍÅ …lÎæ—LƒÏ×Ù`èZŞ¡ê¡»xrçNeµbn˜+NØØæ–10Eoçæ\rÖ¨¤ƒÑºÏ·íè~ãÏf½±£fwÓO*«?.ïW#¨òñój›Pê™Ş†\Z9ÊW—rC·¦uGÁÕyŒÃ\n–\"®`Ñ/ËjİYó2;£‹£‹ât+ï´á_L=¹W®ÕhÃ²`Je„ÖÚh\0`ËÖ‡ÜğÓû^ß]»·Ÿ9nR‡—T¨Zü“¨âÛ3ßïˆOùñ•?V>©-°:v<è“{ïüÁ©‡ôìº…–›¬T’¤´k“ĞÍ6}şEŸ›n{ğµ;kû˜ş/%J1Z×µKÇ\rwßqİé}z¼é@t¯œdÕ_˜ÊlI?Û§×Á›îùÅÔ“»véà¥É¿xpnL)¸`ÉK,Î¥Kg¼dW±xPBÂ2b«}\Z± bYÇ«–ğJï#±5¹ÊÄD[.¹uíÒ¡ê_L=9‰rÅÍ¿-ù‡Q=§,Ÿm\nSøJËvîŞÓù¦é¾ğé¦m\'z£åÁÖ‚¤Ïu)òïdI–H?\nå^´gŒüÈ1b)	¶	–¦ 	°¤ÆHÙĞ¬9²šbE`vh·ï¾ıº‰;•ÕÒù“¯\reòèŠ<AürÚN¾×ß5\nı4…íä…é:w:w*«½æ\rc6ğ½…xäÍ“÷•êq`ÍDXİÑQ_ˆö‡0Ò_¡³b™Ì†~Ïb°D•§ˆ1ÛøŠÂ:úÈÏÜ?ó†±;•Õª$êÜYûÔŞ7Ò2½½u›ÂT&-TÊd²Îı|öö9sşÔ]JèQ¥ÓÊE©o\"ê©1ò‰b	¼S,=ºÃÒÇ¨céq‹jµI\"c1ıù&…FÃ\Z?î„;¯ÿŞ¤éé´w®‹nK‰eĞÜÅ9ıFº8‹Ğ–Éå®óÂËoŸÿàcÏ?šÉdåÖ¶})’UØ	éòé#÷¥»uXù¤¤XétªşºËÏ½bâÙ\'>ÓÚ×?¹¤/UÁDúhíÆÊÛïz|öµ_~ï(éV—–·•ÅT+¤ä¦k—«¦ÿxÊä¡ƒúšş¼áMFË÷½S.i÷½¥wÏúû½ß­úîì\'Ÿ¤oBşObéísÅ;áØÊ?İ4õÛ7têpP}+ØÈ;…vòÅî<ı¥3E¢ŞÖ^qÉ=çs^Y<éáÇ¨±q¹©™ñ½$qÎåËFıµ“Œ¤x\\äG\"=á\0QŸBø`~yËï[ ª>‘p¬&#ïUíXAÿºÃhP)?ê\rü.NúöÎĞ_sù¹×sü³âµ_Ü\\ê½-ºÌ+ääÓÛtûBùÆ·aKÃÆ€©^VıÅ®n¿yào³V~¸~RØsŠ$äÌÂ\n¦)F07T‰,ycÃ•Kû¤Éê,ïÛ??úşES{tï²]PÚdoÚZğÍ$	–b`lï\"u­4…­¶ò|Ú¸®‹½¶ä›<ùâıuuûò‡l$äŠU0„æ9²<º¶ÄÊ¹¡ZWVÖ~Ë•—N¸ş¬ÓGıÓqT›”BE\nÏ‹Í²Åa)®¼)§ÉfÁh˜*Ş´‹{Ñ¹eibÕÖÕ—<ú——¦Í¿äY×-ÒÅ2oi	½ì6\rÒRgÓÅ‚g iFµI9NÓ¸3FİwÅwÎ™Ñ©ÃA\r¶­„¨­¥¤s•„>v›âËpòãÒúO6÷èñf®ğ1ÊdšS—ë^‚\rËšp)F>û.¶2Sÿ~ùğ#<sí”‰·è×{ƒ¡—ÿñdT°\\O´¨är×Y¶bÍˆ\'fÏ±jígcÚzG¥µ+`[® ¹$ï¿]6yÜ´Ã/û*Ì•-å¬`ùX·¶°ˆK–¯\Zıäìy·®ZóéÙÁ›\0EªùÄJakÓÆX¦£Ôf,u1Q3ıæĞĞA‡½|éä±¿utÅ\"T¢¤GöIèmt¦]‡\0›«oÊi	„•-‰u³µi-–Ë]§jõÆÊ§_xı†EK«.v³n‘®`Á6¶&8H0À”ĞŠB=Á˜\0‹(\Z	FmS€%Wù\n9“~“ršF¬|ê‚‰§Ş+şà®.7“,“}ÏËT…•ÓCSYÔ{Ê¸:Z¦µ««Ş¾«ó‹sN™÷úÒ+wíÚ3Ğ6†¯sêÜ¹Ãº±§|dÂ¸?¸k§]4b‹ÚesÌõ9ŠÚŠ²7µ½äÖ°™ÚÈ\'™Ë7e2Y,]±zô«–]òÎ²U“\Z››Ëõ0+´Û¡VÛóÚšfòûã\Z°ôr ¨¨°æ¸ÏyÊˆ?>dQ:ÊQ\"æÔ–2Ï%EZ0I”ãÉ‰¶HùôÙÔ¼¿İ’e«Nysñç-]±z|}CcOÓIå­@D²TP‚DR®@Å·b1 ´¤xëÈáCæœtü°çF¨XPTØNş%›è6’Ò­¶}¤×å»M‘/ÖW:ŠlMjÉdœª5‡-İ+?\\úÚ\r›F·d²eÿÓ|@A:U7¨ŸEG1àµ£8¿rpßèÏÿoJÊ÷\"“hµÕÛœy[›¨`\0Ix³¥Æ¦¦vk7l®\\³~Ó±ë>Ş|Ì†Ÿõù¶šÁY7[\nÎ”o1ÿ}!ùyN»ÒÆg~äÇ‘rRõ½z”¯éß·×Ê‡÷~oğ€>ïêß»ª¸¨h¿¶•ã<PXQs•”ü¨/VŠÊwŞ¼µ9Kg8W¬¸c»KXsó~gkõÎC6oİ>pkuM¿5{­ÙYÛsWíŞî{êêË›;×ÖÕ—ºY·„3VÄ|•3æ2ğ&Çq\Z:–•ÖîêPVZÓ¹ãAÕå]:níZŞá³İË?éİ³Ûºİ»l),lç¶Õ;?9q,“|ÿ§±ş?ã¢ B¾\0Ó\0\0\0\0IEND®B`‚',1790768769,1790768769),(7,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0ªiqŞ\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0™IDATxœÕ[ytTUšÿİ÷^íY*{HB	K!²%a	†‚\rØBÓŠ¢è´3ãqÎñ8Ós<ÀxæŸîãñØÓöØ(6Ncã¢lJXÂ¶²W¥R©-UõŞ?ŞR¯^*•J §Ï|çÜªû¾w¿{¿ï.ßı¾ïİK(¥$ ”‚‚û‡Ó…-qß×]Nèì¶Yór3y^˜ÓksÛì¹w¦ÛãµòAÁ\0,Çø,f“ÃšhéJINlKK±6±,sáv[Wó„ŒÇâòYÎ9%S]Ö„¸qñM.\"£E2„\Z„ÓBW·M ¶>÷èÉóÓ’“ºÜŞŠÎn[‰×7dã&£Á1!#¥1Îb:eïw®Z2÷Çšê²¶ÌŒÿh´Z~Gâ?bŒ®^¿m<|´¡äbSËÃ\0*{û‹¢\nM\0Ğp*0\r´Të\0Ï.zbEÕüÆÓó|÷Ëû}wÀ}Ç‹©Ûlï¬v{¼…@Ğ|¿LEóXÌ¦æä¤øÚšeå;×¯©lºŸúH´^¶ş¸vìİròÌå—Ï\rƒf\nq åá”«„1òºŒ^–(Óƒ(XÇyX–m[²`Öû/mY·#%)Ñ59ˆ C\0\Z=äyæ£O÷é)èü“§·öö9*‚<oOÃ\n8–õ¥¥ZO-YP²ÒğÂ3küË\n‘ÊF’iL3àƒOö¦6]»õÄ½Ş×®|Õ\0B5H!œ\ZF+^­ˆ¦¼„³&ÄİÌÎJ{§¸hò½ôìº¾Xeâ\"iÆH\ZóPm}æçõG^ï³9¶x½~ë0&©æ_£•F­cÀ•?ä÷¿åtÊ­{eUY»ZBˆ²A$£QÛ#Aıùk9¿ùğO[»{ûŸò¼~´òPÏ(À±¬?#-é³W^X¿½|ŞŒöÑÊJ)C@\n±#Ô½\0uç®æ¼÷á·ºzû7\n‚ğ]ï±Ã0¾Ì´¤İ¯¼¸şÍòy3Úµ2É@@¢ë€GÎd}öÅá·ºzú7Ex†a`Ğë0yR&VT•Ád4àã?|ƒîŞşQi9ÅÚ•‹1)7‡këqãvü\0!Äh¤É ÅI°ëé+Ş¬Y¶ c¤ö” #díøŸ»¾I?şıÅêì²ım0Èë£¶¨Ê[ã°¨¬+––¢hztJ)š[Ûğ«ww¡í^(¥éãâLXÿ“JlÚ°ËÂâJó-:z—›n «×>œˆ´a@•ÎôOÈLù÷EeÅÿúÒ³ëúbŞ~»c¯ñJó­_Ü¼İñÖXÍØ\rk+ñÂæ5Ğé¸p^)Å¥¦V|ôé×¸~£-lD 1!kW-Æ†µ•ˆ·¥AÀñï/á­·?+\0D2?/ëÍ™…“÷7[Ö\r³\n:<Qa~{GÏk¯ÏJ)ÅX’ÅdR4®:ÀÌ¢Éxî©Õ(œ:)¬LœÅ„šeåX[³qÓ0ZB¦äg‰9y¼>k{GÏk”\nóÕ:@ CANfN†~Ç ùäéÆ­§jŸ”jì½p,‹’™Øòd\r©ƒ­\0\0ÁÌéyxlõ$[ãG¬×hÔÇ´\0ÃM‰§+ÿäéÆ­?¬ú§‚UğÈå(¥àä}QŞ3?Ø±wK¯m ‚PJÄ*%R­ğ„]LJA‰X.*&®ì‚Ê£H)…^ÇavñLÍÏF0(ª£A³Ùæ²ª]XJ)8ë•Û’òRC PñDE@ˆ4” ·ÏQñÁï÷nùçxæßÔ;\'+@†0Â÷Ö–œ<sùe>(š·„ªºœ†úVÁ+M õüCg€,Ç±H£oÏ1LˆU»ZŞÂó!oƒçãÉºË/ïŞ[{‚¬#r\rŒÜ—®¶š©ß,ğ|.ˆTÇ8’oÈP„æx‚,Ãè	QÚ Ú„Ó&çsÖÖo¾ĞÔ¢hY†R\n\nÌ‘ãçKìÁê@ h¥ˆšGoi\n+Z\"0\rÑùŠÄ§Š×@0h¶÷V×8_¢t\0!÷:{õ›Zv{¼…Tœ9P‘cªpòLÊçÎ@UÅp,«Œœ<’r^;²‘µ4\0`0è±am%L&cdŞ\"ñLC¼Bzv{¼…—®´>ÜÑÕk\0\0mÈPŠÁ\"…	ÔJ„\0ˆ³˜0mÊDô:0Œ¨xx^\0Ï˜‘‚GW,DÁä¬aS>ÒĞ\n®İ´ïu‹Çò0ş´ï|C~0†w6çÁó‚$mxì€HŠ‘‚ °©<P[ÿ?tm%v‡“ùû|wµİîÜéõù­#ù,ËâçWaóÆ•B†pû@‚ªÑ bÈyPï\Z ¸ÛŞƒ_ıfîÜíZ‡Ñ¨w¤$\'lŞöÆóû¹ºs×Ì)I	ïuöY£í³‹TÎ‡^cáiA;’\Z8Ç±ßNÍÅ¼ÙÓÑŞÑ^ˆ\0ø†üÖ”¤„…-7Û1\rš­.··BVD­äTJdVQrs2Ç½†ïWÄJ¿¢ª&£>²\"Ti—Û[Q×p%ëì¶Y;ºm%a§	:°,‹UËË”75®TMA—İ6z ×ë‘„Ôd+X62Íhí©Ÿò²Q\\”Ó\rWÂeÑä;ºm%:—Ìååf^ıñvØô\'\Z:³É€ÜìŒûŞN7=‹ú×`ëw\"à€eÄÅ™Q8%5Ë`rî0ÌøõÃ¬¨.Å™sW4Vdœ×ç·æçer</Ì\r©€dNŠf¥XÜíñâÃO¾Â¯>‹yì1\nà^G/~ıŞçh¹Õ!\0TP­¡h¹ÑÓ\rWñü¦\ZT.š=â:\r ¾¯k’v.uHæ1d³ày~ûPiõ«İ¶éD1™ \nWK8\nÜëìE{G/\n§æÂb6‰†Y„5é¿£³ÿòë¸Şr|PÜªHØ¸…ËåEİ¹«˜41“r2À0ÌˆuÊyõ³sĞßï:€CGê¥Ù\Z’	\Z™€„K?;mVÅÎAwfÈ¤™œêDttÛĞÛç@îÄXâFTVêŸÏŸÀ¹Æ!P:ª¹Ênµu¡|Ş%.©nmGØúøbï1ìÿîüş@Ô6d³Y¯ÓyÙ¼éåÛ|Cş˜<ĞÙeCOŸ¹ÙH²Nvõúmü÷ş“èwÆÒ\0ÑŸHŒ· ¸(?¦òö~\'ö|uûÔÁåòŒN ÆíöZÇâì¨;w‡…Ç;±Rõè\\omƒİ1“³\"\' €Ë×n!*€Ç;„¯¿=o¾;ç [Ô_ªQõğÙív{­/ğFíV!úÚª)F	ˆ´ndŸßf\0Ïó#îÛ2ôÙğy‡\0©BÃÛQãˆÒ608è†ËíÑóş@\0-7Ú1èòˆôòV¯Öd’£@€P[ àyŞÈÉ‚Ê/¨ÂÂ:ax<@­`¢íÍ4ìšN©®ÈÏ ]ÈJ+LÕ†pêv–e|êéËTML´`ZAôúèf1\0¤$\'Âd2Ä<ıA\0ÂÄ\'X†G#Ç²HMI§cc¯_úg9ÆÇX,&ÇXükkBÖ¬\\ŒÕ¥0\Zô£úñÓ\n&\"É\Z°ÂpÇ5ì½^Ç¡¤(œR–Ì&V-+CéìB1=ZÜB•,f“ƒ±&Zº:j\"°XLX³j[]¤Äø˜lùéS&¢¸(,Ëà·“a~}Fz2–.“/À²,¦æOÄsO­Æ‚y3Àé4íÈê,‚LÖDK“’œØ6š%àXëVU`ıšJ$YãG\ryÉ8³Éˆ\'~Z‰Ùi²\Z\rk‡Hyô:ÛTƒÌŒäë×vË2ÈÏËÂ‹Ï®EÙÜ\"°D©Y,’K…MINlcÒR¬M¢\"!)ãšeexö‰UHˆ·Œêühabv:¶¾şŠ¦æÂ¨×€Q˜’Ó±&¤§âõ¿{‹Ëf9®À‚ì	©xã•M([$í.DÙ¹¤é@(–bmâX–½ nk¤v–+kr<›“·~ù¬­GÃÅfô;á÷Á²âãÌ˜>e\"j–/@ş¤,1Ú4ÎvââLxñÙµ¸ÔtCĞF\0\"ı°,{»İÖÙl2êÊ\'0Ù„V‡†(p°¶åóŠÀ0ŒÂœ:n¯~–qÚïÉI	xòñeX½¼]6º¼0tÈLO59ËF¥W¿‹Öş­;’ğªNÔ„ºLFƒãæí{ÍÜ„Œ‡oÈßxóvÇÃa…Nñr+îÜíÆäIî+@51ÖÄ‘¿E£íY(|Wy©P™)™éÉvfqÙ,gœÅt*T›\\!QÙ:¯ßoxàáîZoµ£¹åäÔ•<ÃÅYL§ÊçÏtrùyY.{¿ó´Ùhpx}CVÙ‹Ô)Ï8ÓpKÏFVfjØô““Ñh€nœ~|¬@)E0ÈC tÀá£gáó\r‰\nOeŞÊe	¥0š{¿ótA^–‡‚Àünç7ù§ê\Zß½{¯gu,L0†ˆagQxÀd2`ãº*¬«©@b‚%â\ZVÿ‘×°¶¬š>Èóø±õ.¾>üzz`YFŠˆSß7äGËvx}‘4&f§ï¯\\4ûÕ¿zêÑV!Œpwywû©ºÆã:[*ˆ‚ @sõx|øbïQ<ùøò°ˆN´ †öy¤À¥bÔèã]ûqáÒ#|}tçpü‘¥óÛéÛ`NVºvñÔ³±÷±ş\\n/öì; ğÀ×v0ÈãÛã\r8I¬Œ§Ñü56—Ì(8–“•æ§ #¿\\Q5¿1))¾–ÓqC­Œ\\˜O­*\'={}CçJátK6Í|Œ’8çIJŠ¯]Y]ÚˆK‹!„€!Œ0czoUuÙN–eÛD+0ä5)íÈßàÅB”ì*	¨¥fË«ŸG+ˆ–É ‡èTxÔ(8\'ó)yeÙ¶šeå;‹‹ò}²ÜÊ)†0ÂÆuÕKÊg½Ï²¬Oô¤†ï²ğá~¾¬‘©tögô)àr{Ñg@Ÿ}\0N—ø]/\Z@¯×K<Ñğ&a‡‘(ü³,ë[R>ëıŸ­­jÇ‰rsáçíÏ9w45ßZ×Õc_V“œ!\Z$	ÏóT\0/„[nZ¥×ÛçÀ}ÇÑÜÚ\0HK±bõ#0kF>t7ŒFÎëtlø’Ó:<ZŞT|¥¥ZOıõ–µ;~‰Ğ©8\nÊpòñùKj’5Ş³dáCÛ=›ïpºb‹JªC>?¨ÅñuŸm\0»÷ÅÁÚz¸=â¡-†ôôõcË“5˜5#?Ì$V×+n½ckBÜÍ%Úšl\r;QN@å„HØB\Zr²ÒŞ1õ±KTézk›²w«×³sĞ/¿>ÃGÏÂíö*åAÀ•æÛøøßàÚõ;j>Âl—ÛSûD•7õœ¬´wB\Z¨t\nN>!\0ì¶mÛˆV!Í}h\ZßÓk¿ÕÛçˆ÷x|slˆ™ĞTShM)jÛë-mh½uf³)I	à8@;wÆ×‡€Ëãû_U\'…ÍîDsËÌ˜‡ÔäD\0b„¸ñÊ\r|¶û[üPßŸß¯˜·¡M 4Õ…Çú3Ò“?ZX:ó?úÑA­±\rÛHØIQª:=5ä÷3Ç¾¿˜õénïêîß$PÁ(*F•‹¨v		í\0„€!zƒyÙXQUŠë­m8t¤<ÏKt\ZzG2Ó“ñüS«1àtãÛc\rhkï†ßPlÔSbR=Ãú2Ó“v=óÄª­+«ÊÚeùÔ²’ÑÎ\nÀ™sM¹ï}øåÿÓÃÒ¿¹`^q[´²QoÉÿõç¯å¼÷Ñ­=½áÇååŒ´_ş€cYzšõ³W^X¿½ln‘r\\^í_±Ş\0€ƒGê2?ÿòÈë½6Ç¯w|×àşÜ`2i)ÖOoxäíGªJG<!®åÎ|RT}šZ]P>A~¡±ec{GÏkW~HCC4É¤¥ÊÊÖx}áeÕŞ`ˆ^m2Dôe#ˆ(G¹@!nu9YiïÌ)™º{Ãš¥}‰ñ–˜d\ZóÆúÛ{”\nâ¥)Û@ÏKŸÖÂ”(Õè8êå=Q½‡F/ªéC\nTş¾/âXùÒÔÂ‡¶3„4¼áDx4›ÚQ\"9\r¡w\0Ğgw˜?ØñÕó§ê.¿,ğBn,nôƒ\n@Ïq†eÚ*Êg½ÿÒ–µ§&[=”‘yÄW¯yõsØ}ª¹.#62üzI$f¾Øw´äÀwu›ûƒÕnïÿèâ¤±9É\Z_[³¼|çÏÖT5F*+ÿ#*AmP‘!Œ İGåwM×n\ZÕ-n¼zc)€Ê¾>Ç\"Ï8ïf£Á‘*]-™QpleuiSqQ¾OæUu5_‘tĞ°ÙëÕÙX.OwvÛô#\\öùÄkvŠÓFh½\0E‰ŠŒŠ\Zµ—§WU—µMˆáòt¬vk,Òúù£a3@»dÔÏ”¹q»-7ÛÍu\rWºzìÉùyÙ…<ÏK×ç¹W¦Ûíµò’aÅ2ŒÏb19¬‰q])É	ÒõyöÂÍÛ÷š3Ó“íåóg:§æçx\nò²Kû‘Ö¼\\NKÿ¿)¢DÃÂm\0\0\0\0IEND®B`‚',1790768769,1790768769),(8,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0ªiqŞ\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0^IDATxÚì[=Lg~Ï±qŒm¢”Ö¥Ô\n•ˆ*X’TNÅS†Š$j‡²†1C•v¨2TªQ†eÈHVwhbuÈD…RÔ–%¨*R‘¨Ji)E	`ã€‰¯ïûİ¡|÷İwgÇáÌığHdàÎ¼Ïs÷ıŞsŠªªd„ à7áô!‘È~d\Z™Bv\"ú1Eä\ZrY@Î#ç³È\'‹Sj\'‘YäYPÕ÷@QÚúU]Çsà§)ä$rÆÍD‘—ÃPU/@HIîk¥Uu¿ó~Ê#ï\"·İdÀˆÎ‹MjºÈœÎ5 ƒ.ƒbß¡V–Ë°óÇ&ì<*Aei*+ex¶¦]Ä#QˆtÇ ÒÓ\n-oÅ¡åx\"©XæUüŸwğÓ8rºÙ(È+ênõc%ê·:hû÷\r(?|å_ÃÓßÖ¡Z¬Ô74%\"pôD;ÄŞé€ØPDßn³öa·:5ÜÂ·™-M0 ù	òª´ JJ?®Bé§UØúù?½ûrãt\"­§_ø»]?ÓJÄòFC~\\tÒ€!ä5äG²?\'W øÃ?Pš^u¤áÇ3]8÷\Z$²İV‡|ƒ¼|è„§_ ßÿ@·÷æı¿`ãşßÔ[;<uS íüë<ÿk&|üùË~\Z@Wş+“x<u=ÿ\'lä—`§Pjê®%‡¶áh~Së‘Ì&|^ÏPÔæoˆ·ıî¿OáÉ·‹°şİ\"$Ú?è…cöBøÕ£²æğY­>¡–äíM±ÃÛ^Ø„\'¹¶÷WÌççºáØH\Z¢}IYÇø©İèPk1tEÏ®¼‹Ä³Îk¡š¨6Wu\r\r­34Î‹mn{7‰7˜€µ‰×Z×iÄ€Qq’CŞA·y;PmT£¡\rk\ZF_Ô€6½†:êíİª‘jîÜËúZ¥.¢ì`anOã|³‡ºF@5R­BWÒ\rˆÖcÀ%qUG3<6Éñ¨VªYÀE][M†Å¹=MoŸáíïŞ«™j·Ó&3à$ÛÌàÀ6ÍíÕLµÆ\\Ğw«,\rÈŠ;9´ªó*LµkÚ²vœ×ó´¤õ*¨vÒ`§‘7 m`r ÍŒ—]ÏhW€µ“ãÈ4öÉwoi\'Çë0iĞ4Êà£=<Ó„Âƒ \r¤EÀ€Ì\0Ã´—60ëİÃsw3¨0-úe¤\r<*_ Ñ’–24¥-ß Ñ’’Ği8i¥ìÌZ:e$ø#öZø-‰zw„|Ş€\"ÿz\\åH´e¬ñGĞ³:¿@¢eMfÀ²á¤Vÿ`Ö²,3 ÀAOiı‰–‚Ì€yÃIÇ“ì)­ç;9Ô@ZÌË˜3Ü6©˜Õ³7O4H²s2fY&‡=Ÿ÷:L\Z4³2ô@Òó“‡:ØóyïŞşa¦AX?\0.y&N„¦ø(™Aá¯‚j—¤K¦¬&B„I–Æâ@É¯ÂT»¦mÒÎ€=ŠöüKÎt±d†çÄg´H±M0m3vò†&	±X\n%3¼ÓøV³$O”·[ìBˆ†¥S¶›ÅR¼ªU’#šĞµÕ4€Ö9–Ãã@™Š¥¸~Ö‡5R­Æ¡iÉ$]jµÎé!DÃ„‚29®¿úX£i§iÉÕZ‹§\"ÿ\n$Q&Ç­ ÚXhŠ¿øš†ñzöDLë	LŞIH¢LÛÀrBX›˜Ó5L7b\0â§cü/(E$7™°’’$ÅÆt\r–8ŒÉ%£²‡aé­#Ğqyn@î<ûÊŒˆÀ¾4eØ@‚\0¿6\'\"/NZ!¯Îzgóÿ\0WŠ”Aã-Ú\0\0\0\0IEND®B`‚',1790768777,1790768777),(9,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0ªiqŞ\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0âIDATxœÅ[ipE–ş2«ú–Ô­n-YBò!Ù’llËÂ>ğÍÚÜ^n0;,ËÌî3À±ìÄ,Á3/ÌÀƒ‡ËÇÈÆÉ2Y¶e$_²¬»[}¨uwUîêª®.µZ-!ï<Eªº^eæ{/+ßË÷^eÆEc „àû‚Ç7‚“­Y_4ÊéíwÙÊËœU‚ Ş0èòÔ¸ÜŞ27àC6!&\Z€ãiØb6ylVKŸÃníÊwØÚ8¼ÔÕ×^Tèğ,o¨õİP7kÄ–“5%~ÒÉEDQ¤Z$%TY2>N}ı.ıgšËùz¶=7géH ´¢·ßU\nÚ¦Â¸Éhğ:Z³,¦£:ûöô·¶¢BG!¤@9\0{¼ªÀ%\0­\0v8L@|j~Çã?å\0LÎœ»dÜw°¥î›¶›\0¬\Zò,K+4À2À°Y³pû-7áo6,…=7\'3†ú@ğ:€—céª~ïxÿ£C5Ÿ56=èö¯\rCUÑhÌü}úSÃ†Õõxü¡­ÈsX\0bP@øÔ0Ç†¹àG´?\0Ğš ¯È†eiŒµ¹ fNî¢‰ìg xc<\Z$Õ¨g®aoÖ«»vï8òÕ©§DA(‹ÆbféEÊ¯Sî:NÂÈz™\\×h4à‰‡¶â¶-+\0‚\'ï‡WàßÛƒØĞhZ¾ø<²7Ãz[)8›^Fÿ\nÀO	Èˆ¶>E‘RBE\0Yúß1A ;ßøHÏÀ9ÖúÜàgELŒYF`2êñOOİƒ›oZ\0ğïï…ûµNÄ\\é×ï0ÀşØLd¯/’QÿàIâ2Mj¼ú?»óÚÎ^¼çjÏàO<Ş‘\nÕLè°\Z§†‰êÆqÿğä¸mËJˆ!îßuÀûçîÌLÖm%°ÿ`¨‰€_§ÔÏùT–1•ÅÜ{ Ùùvsã³C.ÏP(b#$Ó\\µ0Q]¬_½X™öÓ!<\0¥¼§«\0àG¢(§”î’H2J	!Ğ–„?~²½ä÷ïí{±§oèGÁğ¨†é.V›?´€4í§Cxõ ø÷÷\0%ÿÎÀœ’ÿC€€ˆre\"ªï›Nœ)ùïßüñÅ¾áûAÔ\\›¿;n¹	y+Oî×:§MxÜ¯uBğD\0À	àiYV*«œ€ˆ{\Z›œ/ï|ÿ¹¾Ááí¢(flì(¥0\r˜;ç:üø‡wãg?~\0…ù¹ãÖ7\ZõØ|ó\0\0ï‡W&mğ2˜kŞ¯H7;\0˜€g`T-¸l_{ë“‚·¿h|v`Ğó€(ˆzh=ÉTF’ã²lI\r6¬®GõœrèxŒ1”ÌÈÇüò-t]\0c,©Íü¹•ÈsX!ø÷öL»ğ2ø÷öÀ¶½ÔÌX\ràã$áÉ\0şz×nãÉÖíC.ï˜ Œ	æµ¿×­Z„g¸uó*¡ã%‡„‚ª™exæÉ»P5³”’¤6Ë\Zj\0áSÃ®óßbC£Ÿ\Z–o·\0e`cw÷ü$\nÛc˜L±˜L’!Õà`^õõxäş-¨šu]RY%\0€À±¡k&¼*\ZåeædöøÍGµ>çñ©ÖùI€È˜ÆßK\0Ïq¨›W‰÷nÆÆ&¸†½\0ÊJ\n\0\0‘şÉœ$¨h”3ÆÀB@@”uÿÕ]»wº¼+#`D„0yÊ2 \'€b2F¤zÑXLqqåTGcĞëx,¨™‰Y3‹IÚg2\Z\0@ñí¯%¨hØ)¡\"/Û\0J¨øÎîuG¾:õ”“Ü[ÂTS€ŠW/ã•M+DF£ãÎ\0y@xƒuŠ±ı4‚$·ì|{¦Ó¼·±ùAQÊ@€©–ğh`HJ@dšdÑš¦G´Ìh¸€2Æ 2‘6úºÎíñ¯Fcf0†´©q„\09Ù€`R†S¶CúŠìk>\0*\Z—\0€BpµwPÿM[ÇM`¨Š`DšİIEc*\\OAÃÂ¹X³âğ\\bù“ß¾Úµ–A{oYšw-eO¢Á;\0<\0ì;ØR`U4&%3H<M@H\\›™dÖ²,&ÌY\nƒ^J	A„ ˆ(*tà–\rKQy}ñ˜)ŸJR©ˆ±6|ášù|ÆZÉ#ííw51\'£ü°×ƒG¿®r»}Ë‹GÇL6ú‰”G9lÛ²nß˜Ò)¤„€ç¹Œô=eP3‡ìÅşÃÅ)™²7ƒš9¸‡}ø¯_½ãù»Gom:qÖìÈÍY\Z\ZØÒ7‹Å€õ«C¯ã¡Ó½÷ú&«ûJ‰¯ÖÛJÁ;Ó.<ï0Àz[)\0à“ıÇ‹	ó;.t›iËÉvÛH ´B6lDmäø][]‰²gZÖêùdm\0\0p6=ìÍœö°?6œM!—úä0F¡M-§søŞ~—­§ßU—äjÇaÓº%Šß3U¤qõÑÛï‚ß„^¯CaA.òì6P*ÕÍ^_„Ñvï´å¬ÛJ”ÔØÎ7>Â°gáÑhNÇÛùò2gÕ™ï.ÙÔŠ­ÍP›M”Í(„Öm,x}ì;xÍ\'ÏÂ5ìC4ÇQde™Q5³›×İˆŠëŠA)ı³¤6Ó”€?=‚}‡…#¶ŠòUÜÚ·ßşâÕ•DåíB@Œ‹ÆbÆ’Es¡×ñ“f‚¸Ú3ˆ{é\r49îAx<~ŒBğùƒryĞyñ*š¾>Gn6®+-Õs07äAWdÂh»bH˜MŞa@ŞÓUÈ½÷zÅÃ\'ğòÎ Ä î¶W”uróë×>ÓÛïšC‹§NWÇq¸Ú;ˆîATÍ*ƒÅl’\'…N§ºöôâ_ÿsÎu\\ã«Lr<-Š##!|Õr\ZåeN”•‚Ce6²×è)b½!ˆÁôÁç`½½ÿ<ÆyRêòÃOàå (2\099–anvíŠŸúü§,+‘_»¦0\0=ı.yPVZ[NÖ¸ÆN}\r‡#Øõög8ÑúDÆ&t¥QÄ…Ë½hXT,‹ZS#Ó;r¶”ÀTc5ñ <¨‰ƒ¡<æ†|Ø®€ãñÙ0×;@†\\^üò·ÄÛï7\"&HÈ(]õ:]ˆ÷xGœ™êv$Å—ÍmˆÆ<´}cJ§Gß¿‚oOŸG4\ZËˆ\0ô\r¸ñùÑ“¸÷ÎuIv‡š%µ07¤÷‡†¼ø´ñ+üé“ÃğxÇ|QÀãqò@(É\0N£Ñ(šNœ³À‡›`1MÊ¡/\0œëì‚Ûã!ãgÌµ‰FqêìEÜA§²9ã½¨p8‚Ëİıè¸p_4·¡õt\'Âáˆ:€ödó„l¼ \nFm~O\0À8ù€h,—ÛAÆÄüZrûBÑúxî )bTò	€<R~\0#ì¹9cúVß{ıxé•wğEó©8»Jç q÷ŠÄ	¢ˆ\0AŒ<˜ã+ò\'¹Â	ª‰á”:LM oÀ’.êÜAz\\ª¾Rßƒir²ÑJ2µ	œš.å8\Z&*yÔ¿Ç+V«³+K ×O¼$:ìV˜L†Iå%ÈÎ± ;kâÍ<Ç!Ïa¯ã2ï?~åx\Z¦‹É3aü¯Šùm9YØºq96¬­‡Ñ ŸĞÇŸ]YŠ\\[6’rcƒí¤çzºê\nğñ”zºb6°éæ%¨_P%Ù‹‰òªb1›<Ôfµô)q}ÚB`±˜°uÓ2Ü¶er­ÙÅsf–¢¦ºÇ\'å…$çPX`Çêå7dKp‡Y¥xäş-¸qÑ\\ğ:\røo¤ÉfµôQ‡İÚ¥ıHIäÚ\n€ç8ÜºiîÜº\n¹¶ì	S^2Îl2âÛ×¢tF>ÔÎ–LG¶­2èu:<rßf8ícúÒ´GQQ^Œ\'Ş†%«Á¥g©~\\ïµÎ—Ãní¢ù[›d„H‚AÙ_a2Ø|ó<|Ï&äd[&~´P:£\0Ï=ûªg•Á¨×€*LÉŒé8EyxöïïÁò%µ“Ş¬E	ÁŒ¢<üôéûP¿°Z\ZÜ8ÿjã\'pÂ€|‡­ç8î¤šÖxt—Ö×(:9(+)À‹?ÿöhFË7íöø‰ÄÀqÙYfÌ™YšM•NV–	O<¼\rß¶—´)€Äÿqw’¿ÔÕÛn2ê=Ê¦&Ù\'Ğø{4¡aQ5(¥\nsj@}/ã´>‚=7÷Şq3¶¬k@OŸş‘œvÉ’s\\Úöêgéè_¼Ü^5ˆjy í@»péj;_Tèğ„G#­.õÜ”TÉí¿9Õ‰ËWúqıuEß+@Íš\r›5}8Iw/ŠŸı¥)õR¡œ…VgİM—/©õeYLG½É•¯C…±ÿPËÔS^ÿO¥ób7Ú;.Çƒ:¢’I¸,‹éhÃây>¾¢¼xÄ=ì;f6\Z<¡ğ¨±„ìj_µœÆêåPìÌKš~r1\Z\rÊákŒ1ÄbDÆÆğÈ\0ì;xáğhÜNx¡r]ÂŒ&ƒÇ=ì;VY^$¢(Òß½ùIÅÑ¦Ö_^¹:°%&(¥ Dò´%á“É€í·®Á­›WÀšcI©Ãê+Z‡µuÕíc‚€ï:¯àã}_b`Ğ£ ”‚iê‡G#è8ßP8}Z½tFÁ§«–-xæ±ûoéä)¡â•uıİG›Zéx~µüm ˆ¢QƒÃxo÷AÜ{Ç:%K¬T{Õ>¯< ç»ñú[Ÿâä·ßMfs[èx>àĞúÕ‹»ø·Á’â‚È‚šY‡-fc;¾‡şBxÿ£ÃˆD£Ó®Û±˜€ı‡Zğõ·Rbe*}Hî¯±½nnåç%ÅùF©üpÃšÅ­¹¹Ùx„l,ï\0\n.)c¤ª¿…G1Å%<-ˆŒÁçÄ}šqø˜ ğ:>˜››}`ãÚú6@R-J%Tœ;§<¼ií’79ë’¼ÀDÔ¤ĞSÂVÙCŒûUq –>/¯¾Ÿ¨ yz&ƒòÎN…G“p2Ÿñh#ã8®kóÍ\roÖTW„e¹•=B”Pqû­k[W6Ô¾Âq\\XŠ¤Æ®²ğÉq¾l‘D‘hèH „!·Cn/¼¾‚Öªh‰z½>ÎK&¡;¦‰Â?Çqá•\rµ¯Ü½mM«zGœ²KŒÅ÷	¸ñíjk¿xkß€{]ROò¢A’äß!ˆÉ›Öè\ryğşG‡ĞŞÙ\0ÈwØ°eı¨[Ïi#ÿÖé¸d•Ó<ZŞT|åçÙ>¹cÛ®Ÿ«vÅ10ÊËÛcäos¹¶ìàÊ¥ó_Øwğx…Ç7R1fX\'Œ†#`–Ô›†\\^¼»û öhF  Mï¡aì¸w3jçV$¹Äê~¥¥wò`ËÉº°réüòì¶¤)•\"Ii))Îÿ…É¨Ï<Y¢*ç:»”µ[­Ï>\0||ûG Rê‹¢ˆÓí—ğú>ÁÙs—Õ|$ù#pFô‰ê·É¨÷”çÿ‚ÒÂâ»àâ/œ\0÷üóÏ­AZ8¶00è¾88äÉÃE\\‚™ÄTSÚ(–R²¶ç:ºĞyñ*Ìf#¹9àyÑho¾»ïû#Á4şª>\\nÚ;.cîœräÙ¥C‘h­§Ïã÷ïîÇ—ÍmG\"Š{›XS]1È Ğñ\\¤°À¾siı¼ß<úÀ-~­ñ<\'„±d§Æh$B?ÿâ›â7ŞÙóB_ÿğ}\"SªòœT‡‹„$V\0B@	Ş CeùlXSs]ØÛØAâí4íe!pØñèı[àõ°ÿótu÷#‰*VÎêªé1e…’ú¡”;rßzèMÏm\\³¤[–O-«d\'Pª¯N´•½üÛ^œì~á¿&PJÃÎüÜwŸ~â¹qQMWººiOÉ×æ¯Ï–¼¼óıç=ÄAŸTYÀTëå_x‹äÛ~ÿôãw¾°daµòiY_$ÍÆÆ\ZÁT°§±ÉùöÏº<;B¡©ƒ»Ö`2<ùÛ®îZÿÒú5õíºVÎÉ;EÕç„Ôåä\'[;¶w÷üÄã©HXhH.Yü’¢Ùš¨/¹®:\ZL´W»)£DÙ	\"ÊV.0HK]Iqş/n¨›õî][WY³-É4é…õ×»v¥CS.ï\nAP}ZS%0¦±q$1Ês¢z]T·OH0ù3š„ã8.œŸg;ºréü(!-?Üqkx2ò$Í\0íU’…Äƒ†Ä3\0r{Ì¯îúó£G›N=%\nbY&aôt çù åh×Š†ÚW~¸cÛëyv[Q™W@zãjWß\'\ZS/	\"É¶A{®@†÷>:X÷Ù_šöø×‚ái=8™\nt:>h1ÛsmÙ6¯kxóî­kZSÕË”ÿq 6©H	µë¨ü¬íìãŞÇkZÏœ_\r`ÕĞgYpŠç…Ç³ÑàÉË³}	àPİÜÊÏ7®­o«©®Ë¼Êo]ÍW*4f6dzt6“ÃÓ½ı.ı‡§Ãaé˜´–Â.@1¢£€Ñ¨WO»‡}ÇÖ¬\\øİ¦µKºŠ\n©şS\0ÅO$şXÒĞªŒúÑó—zĞq¡ÛÜÔr:§oÀm¯(ŸQ%Büø¼¯Ìãq!›w¬8JÃ‹Éc³fõ9ì9ñãóÜÉ—®¶;ìî†Åó|³*J‚•åÅÈ„~*—ëiÛÿ“ìºÏCÇ\0\0\0\0IEND®B`‚',1790768777,1790768777),(10,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0İ¡›\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0AIDATxœíİMoWv€á\Zv£›lŠ\"MÓˆãd$«ù3³ÿšU6Ùd“E€,’™¦HId“MTYÈi‘MSdßS÷T=Ï*0&*®Şî>u?şğç¿üµÈ`£ë?\0à±HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4HC°€4Æ]ÿTíoÿù7óË˜gí}ğİ1Ï\")ß°Xéf~V«¦i®Î^‡=‹¤‹•Şşı#×Ş,æg§‘O$Áâ~Ë¶½:şÊsñóOÁO$Áâ~Wg§ï—Ëè‡¿n‹à‡’ˆ`q¿w?ı­“ç^üüª“ç’‚`qàqûm—~²š`qàqûmFï<@°¸Gü¸ı6ÁbÁâS\'¯âÇí·],Û¶Ã?€j	Ÿº<=éúOh.OM²¸‡`ñíbqıîM×Eóîïÿ×õŸ@‹ßxûª³qûmíÍâúm÷İ¤6‚ÅoÔ³ªÀ‚,î,~Õù¸ı¶«ó×Fï|B°øÕ¼ÓÕŸx¿\\^YßÀo	¿h‹n—_İÕÕö ª%Xü¢Â™Q‡;„¨“`ñ‹zÆí·u¸Iˆ\n	MÓ4ó³Óö¦Æs]ŒŞ¹M°hšŠOÎ3zç6Á¢Æqûm5l¢‚EãöÛ®ß½q)•Ûo«dÃ¬¡»~û¦Îqûmõ\'•‚5t•ÿüàıryq’àï¤4Á\Z´eÛfigù;)J°-Ñ9yFï4‚5p¹ÎÉKñë•¢k¸RŒÛo3zG°†+İ7€!XµlÛšW·¯Rí\"bÖ@]Ös¸èã]¿6z2Á\Z¨¢gãmí”ûÇÓı’ekˆŠŒ7™m¿øâËBÿxcô>l‚5DEOÅ›îìNwöÊıûn\02Á\ZœÒãöÙşáh<Ş,Ù,¿\nK°§ô¸}sw¯iš­—ÇX—§\'!&Á\Zœ˜q{ÑoXMªME¬‘`\rK»X½‡æÃ×«¦i&³íñdZîA¹6±.‚5,¥OÂ›í~ü¿‹ş*4z&Á\Z–¢kÆ“éxúë·ªÒ¿\nŞH°äâäUÑqû\'_©f/7F£rsØ\0	Ö€”>ïÅÇŸü—¢KŞİ\06@‚5íbqı®àĞgc4šÌ¶?ù¥}ãI…k(JÛïı2µõòğî\\£¢{Œ¨`\rEé-x³ûÚ4\Z‹ş*l\no3¢6‚5óÂ«Û7F£{ƒÕ4Í¬p°ŒŞE°¡ô¹w|*ı«Ğè}P«ÿÚÅ¢ôá¢«¾^5!¿\nİ\06‚Õ¥X>ğ{ğƒ¢Çc5n\0Áê¿ÒãößıUziSş(•¬›Ÿ–¾Ëk÷«o÷SüW¡cH‡A°z®ô¸}<™Ş]/z×c¢öï—Ë‹[ûO°ú,à.¯¯¾yÌÿl2Û~L×Ãè}«ÏN¹»}ÌÃ¶Şy6Áê³Ò§ÜmíÜ>OæaÛ‡eƒÕ8pf\0«·®ß¾)=nÿ¬Uì²ŒŞûN°z+`ùÕç®b/½M§½YÌ­zï5Áê§eÛ–BoíŒÆãÏúyqt\\zAVé·¢tK°ú)bÜş¤M‚¥^¿6zï1Áê§Òãöñdú´`•^Õ½÷š`õĞÍü²ô¸ıÉ7â”¾ş«1zï5Áê¡€3íîßşx¥d¹¬Ç«oV·?sÙúsb÷H~ö•`õÍUáÃE›gE\ZOµığ9.OOCÚK‚Õ7É<ÍúÎ—_¯å/y@À{Râ	V¯Ü\"ó„åW÷ü#…ÏMnÊ¿\'¥‚Õ+ãöµ¬VØ¦côŞK‚Õ+¥Çí£Ñ‹£õŒÌKŸ›Ü½÷‘`õÇÅÉ«Òãö5~-\n87Ù\r`ı#Xıp‚İzW$”^å°ş¬h‹ëweG6ãÉtswoÿ`À‚¬€w¦D¬¸6æÉÛqV	Ø¦ğÚ”H‚Õèv×¿où‘GÂ?GÀ›SÂVŒÛ\'³íÇŸ†üx?şÉŒŞûD°ú `Ü^h@>N7wÖ9»Ëè½O+½€q{Sò\n‰íÃ£BÿòGn\0ë\rÁJ/`yäZ¶ã¬üÇËoÓqXoVzãö¢«ÒGãqÀ—¬€·¨¬Üæg§¥İv\Zòã•ş÷Çö…`åpILé]ÊMÓÌ^–^õ~¹¼8±µ0=ÁJ¬],JïvnB®h\n¬J½Ëè½+±€qûxRütĞ¶é½÷€`%0—)½?ù£gÿHœÉN°²º~û¦ô¸½	ùâóQ@Ş³¬¬¾,Ú³JÀ6öf1·ê=3ÁJiÙ¶#ä€«\"nO§o$Ş«R`¥s%LÀ\ZôO¬åÀø‡]¿6zÏK°R\n¸¦èvœ•-nrcô™`å5nz?x[Àm:Ñ{f‚•OÀ„€í8«¼—tX^‚•LÌ¸=lùÕ]›»{¥·é4~¦%XÉÄœE¹üê®˜m:!ÍH°’	¸&l;Î*%¿+æM+ë%X™ÄÜp1ÄÃÆÓˆb¼ieí+“˜`Vœÿ®€!šÑ{F‚•Æ²m“ÙÜÙ‹Ü³J¹#äo3zOG°Ò¸:;-}—Wr%ÄcÄ,ÈrX:‚•FÌ­ëñÛqV	Ø¦ã°t+‡v±·oÅoÇYåÅÑqÀ6˜ÖE°rˆ¹ô¥«Õí«ü*ŒyñÊºVÛß:Ü³JÌqò1ï^YÁJàâäUÄ¸½»í8«LfÛÛtŒŞ¬b®{év;Î*5zOD°j×.×ïŠ¯oŒ¹â	b2ê°,«v1ãö\n~³MÇ\r`YVíbN›«a;Î*1GËÇ|0ğL‚UµyÈêö­ıƒ\Z¶ã¬³–Õ1¤)VÕb®x	XSş1ÛtŞ/—\'¶ÖN°êÕ.»7F£z¶ã¬sÀ¼Ñ{ı«^1g	tr;Îçš…Ü¦cô^?ÁªWĞ¸½ú¯WÄ¼ÇtàLå«Ró³Ó€»¼Æ“i–`-È2z¯›`U*fÜpİÃºÄlÓios«Ş+&X5Š·7µnÇY%æ°ù˜\nF°j4?ø¯v;Î*1«[¯Î_½W«ö×CÃs¡ËÍüòşıß”ÎÅÏ¯ö¿ı®ë¿‚{ø†Uë·oÆí<Àè½Z‚UoÖ;ç°j	V]–mk½u\r|lÔI°êâşôJ\\8†´B‚U÷§×Ã‡G…«\"7óKãözøğ¨`UÄõ-U1z¯`ÕbÙ¶1«Ûy<£÷ÚV-®Bå³¸¬6‚Uw¦WÈ\r`µ¬*¸0½Z>Hª\"XU0n¯–Ï’ªV÷ŒÛ+çã¤‚Õ=ãöÊ½×C°ºgó`åŒŞë!Xk‹ëwV\'ÖÎ‡J%«cnHOÁ\r`•¬9+.-5¬.]œ¼2nÏÂGK\r«K&#‰¼_./Nl-ì˜`uÆ¸=0¬Î8	 £÷Î	VgÌD2ò1Ó-÷vc~v\Zs¸èx2O7Ô¹˜ß×—?ÿäÊÂ	V7ÂîC?úñŸs]ïüd?ÿ÷Ì˜Ú›Åüìtö2âjîò“°íb³Ûy<™¤VMÓ„E$ìÃ†»«así/¾ŒyP\rf/7F£€]¿6zïŠ`u lÜşâ‹ã˜U\",ĞFï]¬haãöÉl{<<¨aö†·+‚muPÉÎ—_Ç<¨“ÙöxÑh7€uE°B-Û6lµôÖ ßdí|õMÌƒü*ì„`…\n»ı|kÿ`4âš•Ù~P¦/OOC\ZO°B…İ~şbHïoO§[û1Ï\nûøá#ÁŠsıöMÌ¸}c4\ZòÊÆYT°Â>~øH°âX~c+jA–Ñ{<Á\n9nÚò«OŒÆã°_…FïÁ+HØµ+ƒÚ³JØ/b7€¬ a7‡½×¯ÙìåaÌ‚,7€¬‘×‡½×¯ÜÖË¨Ñ{ÔG`Å»ë|sgohÛqV	äE~\Z!XÅ-Û6æ0™¦i¶bT¿Él;l–ö„`wuv\Zs—×Æh4Ìí8«„-ï0z#XÅ…Í8»g•íÃ `½‡¬²BÇí¾^ıVä‚,7€Å¬²Â\'SÁº+l›ÀbVYa\'½…½ÅÏåÅÑqÌ6¦iŞ¾2z/N°\nº8y3no¿çq¿\nCZ`6×ˆ|…ŸNXÊß/—\'¶–%X¥´‹EÌÕÍàgxØæî^Ì6Æè½<Á*%r¢a;ÎÃÂ‚nô^š`•7nß?°ça‘>Î%XEÌ£V·7oîó\ZOãÜ1z/J°Š»Í|c4zqäıàï»ô¬½Y„İä6@‚µ~íb¶Û9ì}v‘»,Ã>®H°Ö/rŠaùÕ#EnÓ¹:mô^ˆ`­_Øc<™nîîÅ<«\"¯>3z/D°Öl~v\Zs—Wc;ÎgšEİ¦Ó½#Xk9¿Ø=ş6ìYıö«Ğ\r`…Ö:EÛ\'³mË¯>×îWq‰÷«°ÁZ§ùyÜûì°÷ô}2™mGnÓqéÚ	Ö:EŞ]î4ä§‰¼íòÔ$kÍkm®ß¾‰·;\rù©\"÷]F~€\r„`­Mìò+Ç3<Ñx:İÜ	Zbô¾v‚µË¶\r;ZÄiÈÏ´÷Í?„=Ëè}½k=\"§‡ßÿö¬^ÚÜİ‹\\õnô¾F‚µaÓŠã¯­n¾ÃïŒ9¿Á\r`ë%Xkp3¿Œ·o|÷CÀƒzo4~ÿcÌÂ÷°‹)‡@°Ö æ¦òíÃ£/~øÇ€\rÄd¶}ü§\røy7eï	Ös-Û¶ôêöñdzôÇ?©ÕÚMfÛ_şÓ¿ì_‚ó‘6Öò<×U±ÃE7F£éÎŞlÿÀ}åŒÆãƒï~Ø=şv~~zuöºĞ½!Fï–Î=ßşü—¿vı7\0<ŠŸ„@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Z‚¤!X@\Zÿ»•h0Ù?ZÔ\0\0\0\0IEND®B`‚',1790768777,1790768777);
/*!40000 ALTER TABLE `file_storageblob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_transaction`
--

DROP TABLE IF EXISTS `file_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_transaction`
--

LOCK TABLES `file_transaction` WRITE;
/*!40000 ALTER TABLE `file_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_transaction_comment`
--

DROP TABLE IF EXISTS `file_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_transaction_comment`
--

LOCK TABLES `file_transaction_comment` WRITE;
/*!40000 ALTER TABLE `file_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_transformedfile`
--

DROP TABLE IF EXISTS `file_transformedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_transformedfile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `originalPHID` varbinary(64) NOT NULL,
  `transform` varchar(128) NOT NULL,
  `transformedPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `originalPHID` (`originalPHID`,`transform`),
  KEY `transformedPHID` (`transformedPHID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_transformedfile`
--

LOCK TABLES `file_transformedfile` WRITE;
/*!40000 ALTER TABLE `file_transformedfile` DISABLE KEYS */;
INSERT INTO `file_transformedfile` VALUES (1,'PHID-FILE-3li36jtfvuuoqve4rsaf','favicon(LcMwgFqX7oRW,rlz5Kl3aNWTG,8)','PHID-FILE-uidoehlkddemzyahugte',1790768769,1790768769),(2,'PHID-FILE-oyokw7hhx6uf5hdwy4oe','favicon(LcMwgFqX7oRW,4YJAagoVgHnE,8)','PHID-FILE-zcokuzrrfhppucksqxpj',1790768769,1790768769),(3,'PHID-FILE-hzwmubvnepa6studpfb5','favicon(LcMwgFqX7oRW,HOwbjDXUTk8Z,8)','PHID-FILE-evg3ehskrxlvamr3q2h3',1790768769,1790768769),(4,'PHID-FILE-3li36jtfvuuoqve4rsaf','favicon(LcMwgFqX7oRW,wAK4LaieqDA3,8)','PHID-FILE-u67ins7wulctntns5ejr',1790768769,1790768769),(5,'PHID-FILE-3li36jtfvuuoqve4rsaf','favicon(LcMwgFqX7oRW,oQN1m8g4aPca,8)','PHID-FILE-mo6g2hnth7qw6h5l3p7r',1790768777,1790768777);
/*!40000 ALTER TABLE `file_transformedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macro_transaction`
--

DROP TABLE IF EXISTS `macro_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `macro_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macro_transaction`
--

LOCK TABLES `macro_transaction` WRITE;
/*!40000 ALTER TABLE `macro_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `macro_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macro_transaction_comment`
--

DROP TABLE IF EXISTS `macro_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `macro_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macro_transaction_comment`
--

LOCK TABLES `macro_transaction_comment` WRITE;
/*!40000 ALTER TABLE `macro_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `macro_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_flag`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_flag` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_flag`;

--
-- Table structure for table `flag`
--

DROP TABLE IF EXISTS `flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerPHID` varbinary(64) NOT NULL,
  `type` varchar(4) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `reasonPHID` varbinary(64) NOT NULL,
  `color` int(10) unsigned NOT NULL,
  `note` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerPHID` (`ownerPHID`,`type`,`objectPHID`),
  KEY `objectPHID` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag`
--

LOCK TABLES `flag` WRITE;
/*!40000 ALTER TABLE `flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_fund`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_fund` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_fund`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_backer`
--

DROP TABLE IF EXISTS `fund_backer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_backer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `initiativePHID` varbinary(64) NOT NULL,
  `backerPHID` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `amountAsCurrency` varchar(64) NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_initiative` (`initiativePHID`),
  KEY `key_backer` (`backerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_backer`
--

LOCK TABLES `fund_backer` WRITE;
/*!40000 ALTER TABLE `fund_backer` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_backer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_backertransaction`
--

DROP TABLE IF EXISTS `fund_backertransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_backertransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_backertransaction`
--

LOCK TABLES `fund_backertransaction` WRITE;
/*!40000 ALTER TABLE `fund_backertransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_backertransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiative`
--

DROP TABLE IF EXISTS `fund_initiative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_initiative` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerPHID` varbinary(64) NOT NULL,
  `description` longtext NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `merchantPHID` varbinary(64) DEFAULT NULL,
  `risks` longtext NOT NULL,
  `totalAsCurrency` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_status` (`status`),
  KEY `key_owner` (`ownerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiative`
--

LOCK TABLES `fund_initiative` WRITE;
/*!40000 ALTER TABLE `fund_initiative` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiative_fdocument`
--

DROP TABLE IF EXISTS `fund_initiative_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_initiative_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiative_fdocument`
--

LOCK TABLES `fund_initiative_fdocument` WRITE;
/*!40000 ALTER TABLE `fund_initiative_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiative_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiative_ffield`
--

DROP TABLE IF EXISTS `fund_initiative_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_initiative_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiative_ffield`
--

LOCK TABLES `fund_initiative_ffield` WRITE;
/*!40000 ALTER TABLE `fund_initiative_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiative_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiative_fngrams`
--

DROP TABLE IF EXISTS `fund_initiative_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_initiative_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiative_fngrams`
--

LOCK TABLES `fund_initiative_fngrams` WRITE;
/*!40000 ALTER TABLE `fund_initiative_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiative_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiative_fngrams_common`
--

DROP TABLE IF EXISTS `fund_initiative_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_initiative_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiative_fngrams_common`
--

LOCK TABLES `fund_initiative_fngrams_common` WRITE;
/*!40000 ALTER TABLE `fund_initiative_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiative_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiativetransaction`
--

DROP TABLE IF EXISTS `fund_initiativetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_initiativetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiativetransaction`
--

LOCK TABLES `fund_initiativetransaction` WRITE;
/*!40000 ALTER TABLE `fund_initiativetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiativetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiativetransaction_comment`
--

DROP TABLE IF EXISTS `fund_initiativetransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_initiativetransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiativetransaction_comment`
--

LOCK TABLES `fund_initiativetransaction_comment` WRITE;
/*!40000 ALTER TABLE `fund_initiativetransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiativetransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_harbormaster`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_harbormaster` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_harbormaster`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_build`
--

DROP TABLE IF EXISTS `harbormaster_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_build` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `buildablePHID` varbinary(64) NOT NULL,
  `buildPlanPHID` varbinary(64) NOT NULL,
  `buildStatus` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `buildGeneration` int(10) unsigned NOT NULL DEFAULT 0,
  `planAutoKey` varchar(32) DEFAULT NULL,
  `buildParameters` longtext NOT NULL,
  `initiatorPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_planautokey` (`buildablePHID`,`planAutoKey`),
  KEY `key_buildable` (`buildablePHID`),
  KEY `key_plan` (`buildPlanPHID`),
  KEY `key_status` (`buildStatus`),
  KEY `key_initiator` (`initiatorPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_build`
--

LOCK TABLES `harbormaster_build` WRITE;
/*!40000 ALTER TABLE `harbormaster_build` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_build` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildable`
--

DROP TABLE IF EXISTS `harbormaster_buildable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `buildablePHID` varbinary(64) NOT NULL,
  `containerPHID` varbinary(64) DEFAULT NULL,
  `buildableStatus` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isManualBuildable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_buildable` (`buildablePHID`),
  KEY `key_container` (`containerPHID`),
  KEY `key_manual` (`isManualBuildable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildable`
--

LOCK TABLES `harbormaster_buildable` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildable` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildabletransaction`
--

DROP TABLE IF EXISTS `harbormaster_buildabletransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildabletransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildabletransaction`
--

LOCK TABLES `harbormaster_buildabletransaction` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildabletransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildabletransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildartifact`
--

DROP TABLE IF EXISTS `harbormaster_buildartifact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildartifact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `artifactType` varchar(32) NOT NULL,
  `artifactIndex` binary(12) NOT NULL,
  `artifactKey` varchar(255) NOT NULL,
  `artifactData` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `buildTargetPHID` varbinary(64) NOT NULL,
  `isReleased` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_artifact` (`artifactType`,`artifactIndex`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_garbagecollect` (`artifactType`,`dateCreated`),
  KEY `key_target` (`buildTargetPHID`,`artifactType`),
  KEY `key_index` (`artifactIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildartifact`
--

LOCK TABLES `harbormaster_buildartifact` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildartifact` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildartifact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildlintmessage`
--

DROP TABLE IF EXISTS `harbormaster_buildlintmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildlintmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `buildTargetPHID` varbinary(64) NOT NULL,
  `path` longtext NOT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `characterOffset` int(10) unsigned DEFAULT NULL,
  `code` varchar(128) NOT NULL,
  `severity` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_target` (`buildTargetPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildlintmessage`
--

LOCK TABLES `harbormaster_buildlintmessage` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildlintmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildlintmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildlog`
--

DROP TABLE IF EXISTS `harbormaster_buildlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `logSource` varchar(255) DEFAULT NULL,
  `logType` varchar(255) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `live` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `buildTargetPHID` varbinary(64) NOT NULL,
  `filePHID` varbinary(64) DEFAULT NULL,
  `byteLength` bigint(20) unsigned NOT NULL,
  `chunkFormat` varchar(32) NOT NULL,
  `lineMap` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_buildtarget` (`buildTargetPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildlog`
--

LOCK TABLES `harbormaster_buildlog` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildlogchunk`
--

DROP TABLE IF EXISTS `harbormaster_buildlogchunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildlogchunk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logID` int(10) unsigned NOT NULL,
  `encoding` varchar(32) NOT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `chunk` longblob NOT NULL,
  `headOffset` bigint(20) unsigned NOT NULL,
  `tailOffset` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_offset` (`logID`,`headOffset`,`tailOffset`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildlogchunk`
--

LOCK TABLES `harbormaster_buildlogchunk` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildlogchunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildlogchunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildmessage`
--

DROP TABLE IF EXISTS `harbormaster_buildmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) NOT NULL,
  `receiverPHID` varbinary(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `isConsumed` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_receiver` (`receiverPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildmessage`
--

LOCK TABLES `harbormaster_buildmessage` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildplan`
--

DROP TABLE IF EXISTS `harbormaster_buildplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `planStatus` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `planAutoKey` varchar(32) DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `properties` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_planautokey` (`planAutoKey`),
  KEY `key_status` (`planStatus`),
  KEY `key_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildplan`
--

LOCK TABLES `harbormaster_buildplan` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildplanname_ngrams`
--

DROP TABLE IF EXISTS `harbormaster_buildplanname_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildplanname_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildplanname_ngrams`
--

LOCK TABLES `harbormaster_buildplanname_ngrams` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildplanname_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildplanname_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildplantransaction`
--

DROP TABLE IF EXISTS `harbormaster_buildplantransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildplantransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildplantransaction`
--

LOCK TABLES `harbormaster_buildplantransaction` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildplantransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildplantransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildstep`
--

DROP TABLE IF EXISTS `harbormaster_buildstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildstep` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `buildPlanPHID` varbinary(64) NOT NULL,
  `className` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `stepAutoKey` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_stepautokey` (`buildPlanPHID`,`stepAutoKey`),
  KEY `key_plan` (`buildPlanPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildstep`
--

LOCK TABLES `harbormaster_buildstep` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildsteptransaction`
--

DROP TABLE IF EXISTS `harbormaster_buildsteptransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildsteptransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildsteptransaction`
--

LOCK TABLES `harbormaster_buildsteptransaction` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildsteptransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildsteptransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildtarget`
--

DROP TABLE IF EXISTS `harbormaster_buildtarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildtarget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `buildPHID` varbinary(64) NOT NULL,
  `buildStepPHID` varbinary(64) NOT NULL,
  `className` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `targetStatus` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateStarted` int(10) unsigned DEFAULT NULL,
  `dateCompleted` int(10) unsigned DEFAULT NULL,
  `buildGeneration` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_build` (`buildPHID`,`buildStepPHID`),
  KEY `key_started` (`dateStarted`),
  KEY `key_completed` (`dateCompleted`),
  KEY `key_created` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildtarget`
--

LOCK TABLES `harbormaster_buildtarget` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildtarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildtarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildtransaction`
--

DROP TABLE IF EXISTS `harbormaster_buildtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildtransaction`
--

LOCK TABLES `harbormaster_buildtransaction` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildunitmessage`
--

DROP TABLE IF EXISTS `harbormaster_buildunitmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_buildunitmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `buildTargetPHID` varbinary(64) NOT NULL,
  `engine` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `result` varchar(32) NOT NULL,
  `duration` double DEFAULT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `nameIndex` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_target` (`buildTargetPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildunitmessage`
--

LOCK TABLES `harbormaster_buildunitmessage` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildunitmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildunitmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_object`
--

DROP TABLE IF EXISTS `harbormaster_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_object` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_object`
--

LOCK TABLES `harbormaster_object` WRITE;
/*!40000 ALTER TABLE `harbormaster_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_scratchtable`
--

DROP TABLE IF EXISTS `harbormaster_scratchtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_scratchtable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` varchar(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `bigData` longtext DEFAULT NULL,
  `nonmutableData` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_scratchtable`
--

LOCK TABLES `harbormaster_scratchtable` WRITE;
/*!40000 ALTER TABLE `harbormaster_scratchtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_scratchtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_string`
--

DROP TABLE IF EXISTS `harbormaster_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harbormaster_string` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stringIndex` binary(12) NOT NULL,
  `stringValue` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_string` (`stringIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_string`
--

LOCK TABLES `harbormaster_string` WRITE;
/*!40000 ALTER TABLE `harbormaster_string` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_string` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lisk_counter`
--

DROP TABLE IF EXISTS `lisk_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lisk_counter` (
  `counterName` varchar(32) NOT NULL,
  `counterValue` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`counterName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lisk_counter`
--

LOCK TABLES `lisk_counter` WRITE;
/*!40000 ALTER TABLE `lisk_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `lisk_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_herald`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_herald` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_herald`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_action`
--

DROP TABLE IF EXISTS `herald_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruleID` int(10) unsigned NOT NULL,
  `action` varchar(255) NOT NULL,
  `target` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ruleID` (`ruleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_action`
--

LOCK TABLES `herald_action` WRITE;
/*!40000 ALTER TABLE `herald_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_condition`
--

DROP TABLE IF EXISTS `herald_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruleID` int(10) unsigned NOT NULL,
  `fieldName` varchar(255) NOT NULL,
  `fieldCondition` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ruleID` (`ruleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_condition`
--

LOCK TABLES `herald_condition` WRITE;
/*!40000 ALTER TABLE `herald_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_rule`
--

DROP TABLE IF EXISTS `herald_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `contentType` varchar(255) NOT NULL,
  `mustMatchAll` tinyint(1) NOT NULL,
  `configVersion` int(10) unsigned NOT NULL DEFAULT 1,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `repetitionPolicy` varchar(32) NOT NULL,
  `ruleType` varchar(32) NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `isDisabled` int(10) unsigned NOT NULL DEFAULT 0,
  `triggerObjectPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_trigger` (`triggerObjectPHID`),
  KEY `key_name` (`name`(128)),
  KEY `key_author` (`authorPHID`),
  KEY `key_ruletype` (`ruleType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_rule`
--

LOCK TABLES `herald_rule` WRITE;
/*!40000 ALTER TABLE `herald_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_ruleapplied`
--

DROP TABLE IF EXISTS `herald_ruleapplied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_ruleapplied` (
  `ruleID` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  PRIMARY KEY (`ruleID`,`phid`),
  KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_ruleapplied`
--

LOCK TABLES `herald_ruleapplied` WRITE;
/*!40000 ALTER TABLE `herald_ruleapplied` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_ruleapplied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_ruletransaction`
--

DROP TABLE IF EXISTS `herald_ruletransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_ruletransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_ruletransaction`
--

LOCK TABLES `herald_ruletransaction` WRITE;
/*!40000 ALTER TABLE `herald_ruletransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_ruletransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_savedheader`
--

DROP TABLE IF EXISTS `herald_savedheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_savedheader` (
  `phid` varbinary(64) NOT NULL,
  `header` longtext NOT NULL,
  PRIMARY KEY (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_savedheader`
--

LOCK TABLES `herald_savedheader` WRITE;
/*!40000 ALTER TABLE `herald_savedheader` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_savedheader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_transcript`
--

DROP TABLE IF EXISTS `herald_transcript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_transcript` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `host` varchar(255) NOT NULL,
  `duration` double NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `dryRun` tinyint(1) NOT NULL,
  `objectTranscript` longblob NOT NULL,
  `ruleTranscripts` longblob NOT NULL,
  `conditionTranscripts` longblob NOT NULL,
  `applyTranscripts` longblob NOT NULL,
  `garbageCollected` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `objectPHID` (`objectPHID`),
  KEY `garbageCollected` (`garbageCollected`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_transcript`
--

LOCK TABLES `herald_transcript` WRITE;
/*!40000 ALTER TABLE `herald_transcript` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_transcript` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_webhook`
--

DROP TABLE IF EXISTS `herald_webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_webhook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `webhookURI` varchar(255) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `hmacKey` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_webhook`
--

LOCK TABLES `herald_webhook` WRITE;
/*!40000 ALTER TABLE `herald_webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_webhook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_webhookrequest`
--

DROP TABLE IF EXISTS `herald_webhookrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_webhookrequest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `webhookPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `properties` longtext NOT NULL,
  `lastRequestResult` varchar(32) NOT NULL,
  `lastRequestEpoch` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_ratelimit` (`webhookPHID`,`lastRequestResult`,`lastRequestEpoch`),
  KEY `key_collect` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_webhookrequest`
--

LOCK TABLES `herald_webhookrequest` WRITE;
/*!40000 ALTER TABLE `herald_webhookrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_webhookrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_webhooktransaction`
--

DROP TABLE IF EXISTS `herald_webhooktransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `herald_webhooktransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_webhooktransaction`
--

LOCK TABLES `herald_webhooktransaction` WRITE;
/*!40000 ALTER TABLE `herald_webhooktransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_webhooktransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_legalpad`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_legalpad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_legalpad`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_document`
--

DROP TABLE IF EXISTS `legalpad_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `legalpad_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `contributorCount` int(10) unsigned NOT NULL DEFAULT 0,
  `recentContributorPHIDs` longtext NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `versions` int(10) unsigned NOT NULL DEFAULT 0,
  `documentBodyPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `signatureType` varchar(4) NOT NULL,
  `preamble` longtext NOT NULL,
  `requireSignature` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_creator` (`creatorPHID`,`dateModified`),
  KEY `key_required` (`requireSignature`,`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_document`
--

LOCK TABLES `legalpad_document` WRITE;
/*!40000 ALTER TABLE `legalpad_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_documentbody`
--

DROP TABLE IF EXISTS `legalpad_documentbody`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `legalpad_documentbody` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `documentPHID` varbinary(64) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `text` longtext DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_document` (`documentPHID`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_documentbody`
--

LOCK TABLES `legalpad_documentbody` WRITE;
/*!40000 ALTER TABLE `legalpad_documentbody` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_documentbody` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_documentsignature`
--

DROP TABLE IF EXISTS `legalpad_documentsignature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `legalpad_documentsignature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentPHID` varbinary(64) NOT NULL,
  `documentVersion` int(10) unsigned NOT NULL DEFAULT 0,
  `signatureType` varchar(4) NOT NULL,
  `signerPHID` varbinary(64) DEFAULT NULL,
  `signerName` varchar(255) NOT NULL,
  `signerEmail` varchar(255) NOT NULL,
  `signatureData` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `secretKey` binary(20) NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `isExemption` tinyint(1) NOT NULL DEFAULT 0,
  `exemptionPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key_signer` (`signerPHID`,`dateModified`),
  KEY `secretKey` (`secretKey`),
  KEY `key_document` (`documentPHID`,`signerPHID`,`documentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_documentsignature`
--

LOCK TABLES `legalpad_documentsignature` WRITE;
/*!40000 ALTER TABLE `legalpad_documentsignature` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_documentsignature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_transaction`
--

DROP TABLE IF EXISTS `legalpad_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `legalpad_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_transaction`
--

LOCK TABLES `legalpad_transaction` WRITE;
/*!40000 ALTER TABLE `legalpad_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_transaction_comment`
--

DROP TABLE IF EXISTS `legalpad_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `legalpad_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `documentID` int(10) unsigned DEFAULT NULL,
  `lineNumber` int(10) unsigned NOT NULL,
  `lineLength` int(10) unsigned NOT NULL,
  `fixedState` varchar(12) DEFAULT NULL,
  `hasReplies` tinyint(1) NOT NULL,
  `replyToCommentPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  UNIQUE KEY `key_draft` (`authorPHID`,`documentID`,`transactionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_transaction_comment`
--

LOCK TABLES `legalpad_transaction_comment` WRITE;
/*!40000 ALTER TABLE `legalpad_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_maniphest`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_maniphest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_maniphest`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_customfieldnumericindex`
--

DROP TABLE IF EXISTS `maniphest_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_customfieldnumericindex`
--

LOCK TABLES `maniphest_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `maniphest_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_customfieldstorage`
--

DROP TABLE IF EXISTS `maniphest_customfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_customfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_customfieldstorage`
--

LOCK TABLES `maniphest_customfieldstorage` WRITE;
/*!40000 ALTER TABLE `maniphest_customfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_customfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_customfieldstringindex`
--

DROP TABLE IF EXISTS `maniphest_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_customfieldstringindex`
--

LOCK TABLES `maniphest_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `maniphest_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_nameindex`
--

DROP TABLE IF EXISTS `maniphest_nameindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_nameindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `indexedObjectPHID` varbinary(64) NOT NULL,
  `indexedObjectName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`indexedObjectPHID`),
  KEY `key_name` (`indexedObjectName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_nameindex`
--

LOCK TABLES `maniphest_nameindex` WRITE;
/*!40000 ALTER TABLE `maniphest_nameindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_nameindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_task`
--

DROP TABLE IF EXISTS `maniphest_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `ownerOrdering` varchar(64) DEFAULT NULL,
  `originalEmailSource` varchar(255) DEFAULT NULL,
  `subpriority` double NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `properties` longtext NOT NULL,
  `points` double DEFAULT NULL,
  `bridgedObjectPHID` varbinary(64) DEFAULT NULL,
  `subtype` varchar(64) NOT NULL,
  `closedEpoch` int(10) unsigned DEFAULT NULL,
  `closerPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `key_bridgedobject` (`bridgedObjectPHID`),
  KEY `priority` (`priority`,`status`),
  KEY `status` (`status`),
  KEY `ownerPHID` (`ownerPHID`,`status`),
  KEY `authorPHID` (`authorPHID`,`status`),
  KEY `ownerOrdering` (`ownerOrdering`),
  KEY `priority_2` (`priority`,`subpriority`),
  KEY `key_dateCreated` (`dateCreated`),
  KEY `key_dateModified` (`dateModified`),
  KEY `key_title` (`title`(64)),
  KEY `key_subtype` (`subtype`),
  KEY `key_closed` (`closedEpoch`),
  KEY `key_closer` (`closerPHID`,`closedEpoch`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_task`
--

LOCK TABLES `maniphest_task` WRITE;
/*!40000 ALTER TABLE `maniphest_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_task_fdocument`
--

DROP TABLE IF EXISTS `maniphest_task_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_task_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_task_fdocument`
--

LOCK TABLES `maniphest_task_fdocument` WRITE;
/*!40000 ALTER TABLE `maniphest_task_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_task_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_task_ffield`
--

DROP TABLE IF EXISTS `maniphest_task_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_task_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_task_ffield`
--

LOCK TABLES `maniphest_task_ffield` WRITE;
/*!40000 ALTER TABLE `maniphest_task_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_task_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_task_fngrams`
--

DROP TABLE IF EXISTS `maniphest_task_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_task_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_task_fngrams`
--

LOCK TABLES `maniphest_task_fngrams` WRITE;
/*!40000 ALTER TABLE `maniphest_task_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_task_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_task_fngrams_common`
--

DROP TABLE IF EXISTS `maniphest_task_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_task_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_task_fngrams_common`
--

LOCK TABLES `maniphest_task_fngrams_common` WRITE;
/*!40000 ALTER TABLE `maniphest_task_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_task_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_transaction`
--

DROP TABLE IF EXISTS `maniphest_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_transaction`
--

LOCK TABLES `maniphest_transaction` WRITE;
/*!40000 ALTER TABLE `maniphest_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_transaction_comment`
--

DROP TABLE IF EXISTS `maniphest_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maniphest_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_transaction_comment`
--

LOCK TABLES `maniphest_transaction_comment` WRITE;
/*!40000 ALTER TABLE `maniphest_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_meta_data`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_meta_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_meta_data`;

--
-- Table structure for table `hoststate`
--

DROP TABLE IF EXISTS `hoststate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoststate` (
  `stateKey` varchar(128) NOT NULL,
  `stateValue` longtext NOT NULL,
  PRIMARY KEY (`stateKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoststate`
--

LOCK TABLES `hoststate` WRITE;
/*!40000 ALTER TABLE `hoststate` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoststate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_status`
--

DROP TABLE IF EXISTS `patch_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `patch_status` (
  `patch` varchar(128) NOT NULL,
  `applied` int(10) unsigned NOT NULL,
  `duration` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`patch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_status`
--

LOCK TABLES `patch_status` WRITE;
/*!40000 ALTER TABLE `patch_status` DISABLE KEYS */;
INSERT INTO `patch_status` VALUES ('phabricator:000.project.sql',1556231684,NULL),('phabricator:0000.legacy.sql',1556231684,NULL),('phabricator:001.maniphest_projects.sql',1556231684,NULL),('phabricator:002.oauth.sql',1556231684,NULL),('phabricator:003.more_oauth.sql',1556231684,NULL),('phabricator:004.daemonrepos.sql',1556231684,NULL),('phabricator:005.workers.sql',1556231684,NULL),('phabricator:006.repository.sql',1556231684,NULL),('phabricator:007.daemonlog.sql',1556231684,NULL),('phabricator:008.repoopt.sql',1556231684,NULL),('phabricator:009.repo_summary.sql',1556231684,NULL),('phabricator:010.herald.sql',1556231684,NULL),('phabricator:011.badcommit.sql',1556231684,NULL),('phabricator:012.dropphidtype.sql',1556231684,NULL),('phabricator:013.commitdetail.sql',1556231684,NULL),('phabricator:014.shortcuts.sql',1556231684,NULL),('phabricator:015.preferences.sql',1556231684,NULL),('phabricator:016.userrealnameindex.sql',1556231684,NULL),('phabricator:017.sessionkeys.sql',1556231684,NULL),('phabricator:018.owners.sql',1556231684,NULL),('phabricator:019.arcprojects.sql',1556231684,NULL),('phabricator:020.pathcapital.sql',1556231684,NULL),('phabricator:021.xhpastview.sql',1556231684,NULL),('phabricator:022.differentialcommit.sql',1556231684,NULL),('phabricator:023.dxkeys.sql',1556231685,NULL),('phabricator:024.mlistkeys.sql',1556231685,NULL),('phabricator:025.commentopt.sql',1556231685,NULL),('phabricator:026.diffpropkey.sql',1556231685,NULL),('phabricator:027.metamtakeys.sql',1556231685,NULL),('phabricator:028.systemagent.sql',1556231685,NULL),('phabricator:029.cursors.sql',1556231685,NULL),('phabricator:030.imagemacro.sql',1556231685,NULL),('phabricator:031.workerrace.sql',1556231685,NULL),('phabricator:032.viewtime.sql',1556231685,NULL),('phabricator:033.privtest.sql',1556231685,NULL),('phabricator:034.savedheader.sql',1556231685,NULL),('phabricator:035.proxyimage.sql',1556231685,NULL),('phabricator:036.mailkey.sql',1556231685,NULL),('phabricator:037.setuptest.sql',1556231685,NULL),('phabricator:038.admin.sql',1556231685,NULL),('phabricator:039.userlog.sql',1556231685,NULL),('phabricator:040.transform.sql',1556231685,NULL),('phabricator:041.heraldrepetition.sql',1556231685,NULL),('phabricator:042.commentmetadata.sql',1556231685,NULL),('phabricator:043.pastebin.sql',1556231685,NULL),('phabricator:044.countdown.sql',1556231685,NULL),('phabricator:045.timezone.sql',1556231685,NULL),('phabricator:046.conduittoken.sql',1556231685,NULL),('phabricator:047.projectstatus.sql',1556231685,NULL),('phabricator:048.relationshipkeys.sql',1556231685,NULL),('phabricator:049.projectowner.sql',1556231685,NULL),('phabricator:050.taskdenormal.sql',1556231685,NULL),('phabricator:051.projectfilter.sql',1556231685,NULL),('phabricator:052.pastelanguage.sql',1556231685,NULL),('phabricator:053.feed.sql',1556231685,NULL),('phabricator:054.subscribers.sql',1556231685,NULL),('phabricator:055.add_author_to_files.sql',1556231685,NULL),('phabricator:056.slowvote.sql',1556231685,NULL),('phabricator:057.parsecache.sql',1556231685,NULL),('phabricator:058.missingkeys.sql',1556231685,NULL),('phabricator:059.engines.php',1556231685,NULL),('phabricator:060.phriction.sql',1556231685,NULL),('phabricator:061.phrictioncontent.sql',1556231685,NULL),('phabricator:062.phrictionmenu.sql',1556231685,NULL),('phabricator:063.pasteforks.sql',1556231685,NULL),('phabricator:064.subprojects.sql',1556231685,NULL),('phabricator:065.sshkeys.sql',1556231685,NULL),('phabricator:066.phrictioncontent.sql',1556231685,NULL),('phabricator:067.preferences.sql',1556231685,NULL),('phabricator:068.maniphestauxiliarystorage.sql',1556231685,NULL),('phabricator:069.heraldxscript.sql',1556231685,NULL),('phabricator:070.differentialaux.sql',1556231685,NULL),('phabricator:071.contentsource.sql',1556231685,NULL),('phabricator:072.blamerevert.sql',1556231685,NULL),('phabricator:073.reposymbols.sql',1556231685,NULL),('phabricator:074.affectedpath.sql',1556231685,NULL),('phabricator:075.revisionhash.sql',1556231685,NULL),('phabricator:076.indexedlanguages.sql',1556231685,NULL),('phabricator:077.originalemail.sql',1556231685,NULL),('phabricator:078.nametoken.sql',1556231685,NULL),('phabricator:079.nametokenindex.php',1556231685,NULL),('phabricator:080.filekeys.sql',1556231685,NULL),('phabricator:081.filekeys.php',1556231685,NULL),('phabricator:082.xactionkey.sql',1556231685,NULL),('phabricator:083.dxviewtime.sql',1556231685,NULL),('phabricator:084.pasteauthorkey.sql',1556231685,NULL),('phabricator:085.packagecommitrelationship.sql',1556231685,NULL),('phabricator:086.formeraffil.sql',1556231685,NULL),('phabricator:087.phrictiondelete.sql',1556231685,NULL),('phabricator:088.audit.sql',1556231685,NULL),('phabricator:089.projectwiki.sql',1556231685,NULL),('phabricator:090.forceuniqueprojectnames.php',1556231685,NULL),('phabricator:091.uniqueslugkey.sql',1556231686,NULL),('phabricator:092.dropgithubnotification.sql',1556231686,NULL),('phabricator:093.gitremotes.php',1556231686,NULL),('phabricator:094.phrictioncolumn.sql',1556231686,NULL),('phabricator:095.directory.sql',1556231686,NULL),('phabricator:096.filename.sql',1556231686,NULL),('phabricator:097.heraldruletypes.sql',1556231686,NULL),('phabricator:098.heraldruletypemigration.php',1556231686,NULL),('phabricator:099.drydock.sql',1556231686,NULL),('phabricator:100.projectxaction.sql',1556231686,NULL),('phabricator:101.heraldruleapplied.sql',1556231686,NULL),('phabricator:102.heraldcleanup.php',1556231686,NULL),('phabricator:103.heraldedithistory.sql',1556231686,NULL),('phabricator:104.searchkey.sql',1556231686,NULL),('phabricator:105.mimetype.sql',1556231686,NULL),('phabricator:106.chatlog.sql',1556231686,NULL),('phabricator:107.oauthserver.sql',1556231686,NULL),('phabricator:108.oauthscope.sql',1556231686,NULL),('phabricator:109.oauthclientphidkey.sql',1556231686,NULL),('phabricator:110.commitaudit.sql',1556231686,NULL),('phabricator:111.commitauditmigration.php',1556231686,NULL),('phabricator:112.oauthaccesscoderedirecturi.sql',1556231686,NULL),('phabricator:113.lastreviewer.sql',1556231686,NULL),('phabricator:114.auditrequest.sql',1556231686,NULL),('phabricator:115.prepareutf8.sql',1556231686,NULL),('phabricator:116.utf8-backup-first-expect-wait.sql',1556231688,NULL),('phabricator:117.repositorydescription.php',1556231688,NULL),('phabricator:118.auditinline.sql',1556231688,NULL),('phabricator:119.filehash.sql',1556231688,NULL),('phabricator:120.noop.sql',1556231688,NULL),('phabricator:121.drydocklog.sql',1556231688,NULL),('phabricator:122.flag.sql',1556231688,NULL),('phabricator:123.heraldrulelog.sql',1556231688,NULL),('phabricator:124.subpriority.sql',1556231688,NULL),('phabricator:125.ipv6.sql',1556231688,NULL),('phabricator:126.edges.sql',1556231688,NULL),('phabricator:127.userkeybody.sql',1556231688,NULL),('phabricator:128.phabricatorcom.sql',1556231688,NULL),('phabricator:129.savedquery.sql',1556231688,NULL),('phabricator:130.denormalrevisionquery.sql',1556231688,NULL),('phabricator:131.migraterevisionquery.php',1556231688,NULL),('phabricator:132.phame.sql',1556231688,NULL),('phabricator:133.imagemacro.sql',1556231688,NULL),('phabricator:134.emptysearch.sql',1556231688,NULL),('phabricator:135.datecommitted.sql',1556231688,NULL),('phabricator:136.sex.sql',1556231688,NULL),('phabricator:137.auditmetadata.sql',1556231688,NULL),('phabricator:138.notification.sql',1556231688,NULL),('phabricator:20121209.pholioxactions.sql',1556231689,NULL),('phabricator:20121209.xmacroadd.sql',1556231689,NULL),('phabricator:20121209.xmacromigrate.php',1556231689,NULL),('phabricator:20121209.xmacromigratekey.sql',1556231689,NULL),('phabricator:20121220.generalcache.sql',1556231689,NULL),('phabricator:20121226.config.sql',1556231689,NULL),('phabricator:20130101.confxaction.sql',1556231689,NULL),('phabricator:20130102.metamtareceivedmailmessageidhash.sql',1556231689,NULL),('phabricator:20130103.filemetadata.sql',1556231689,NULL),('phabricator:20130111.conpherence.sql',1556231689,NULL),('phabricator:20130127.altheraldtranscript.sql',1556231689,NULL),('phabricator:20130131.conpherencepics.sql',1556231689,NULL),('phabricator:20130201.revisionunsubscribed.php',1556231689,NULL),('phabricator:20130201.revisionunsubscribed.sql',1556231689,NULL),('phabricator:20130214.chatlogchannel.sql',1556231689,NULL),('phabricator:20130214.chatlogchannelid.sql',1556231689,NULL),('phabricator:20130214.token.sql',1556231689,NULL),('phabricator:20130215.phabricatorfileaddttl.sql',1556231689,NULL),('phabricator:20130217.cachettl.sql',1556231689,NULL),('phabricator:20130218.longdaemon.sql',1556231689,NULL),('phabricator:20130218.updatechannelid.php',1556231689,NULL),('phabricator:20130219.commitsummary.sql',1556231689,NULL),('phabricator:20130219.commitsummarymig.php',1556231689,NULL),('phabricator:20130222.dropchannel.sql',1556231689,NULL),('phabricator:20130226.commitkey.sql',1556231689,NULL),('phabricator:20130304.lintauthor.sql',1556231689,NULL),('phabricator:20130310.xactionmeta.sql',1556231689,NULL),('phabricator:20130317.phrictionedge.sql',1556231689,NULL),('phabricator:20130319.conpherence.sql',1556231689,NULL),('phabricator:20130319.phabricatorfileexplicitupload.sql',1556231689,NULL),('phabricator:20130320.phlux.sql',1556231689,NULL),('phabricator:20130321.token.sql',1556231689,NULL),('phabricator:20130322.phortune.sql',1556231689,NULL),('phabricator:20130323.phortunepayment.sql',1556231689,NULL),('phabricator:20130324.phortuneproduct.sql',1556231689,NULL),('phabricator:20130330.phrequent.sql',1556231689,NULL),('phabricator:20130403.conpherencecache.sql',1556231689,NULL),('phabricator:20130403.conpherencecachemig.php',1556231689,NULL),('phabricator:20130409.commitdrev.php',1556231689,NULL),('phabricator:20130417.externalaccount.sql',1556231689,NULL),('phabricator:20130423.conpherenceindices.sql',1556231690,NULL),('phabricator:20130423.phortunepaymentrevised.sql',1556231690,NULL),('phabricator:20130423.updateexternalaccount.sql',1556231689,NULL),('phabricator:20130426.search_savedquery.sql',1556231690,NULL),('phabricator:20130502.countdownrevamp1.sql',1556231690,NULL),('phabricator:20130502.countdownrevamp2.php',1556231690,NULL),('phabricator:20130502.countdownrevamp3.sql',1556231690,NULL),('phabricator:20130507.releephrqmailkey.sql',1556231690,NULL),('phabricator:20130507.releephrqmailkeypop.php',1556231690,NULL),('phabricator:20130507.releephrqsimplifycols.sql',1556231690,NULL),('phabricator:20130508.releephtransactions.sql',1556231690,NULL),('phabricator:20130508.releephtransactionsmig.php',1556231690,NULL),('phabricator:20130508.search_namedquery.sql',1556231690,NULL),('phabricator:20130513.receviedmailstatus.sql',1556231690,NULL),('phabricator:20130519.diviner.sql',1556231690,NULL),('phabricator:20130521.dropconphimages.sql',1556231690,NULL),('phabricator:20130523.maniphest_owners.sql',1556231690,NULL),('phabricator:20130524.repoxactions.sql',1556231690,NULL),('phabricator:20130529.macroauthor.sql',1556231690,NULL),('phabricator:20130529.macroauthormig.php',1556231690,NULL),('phabricator:20130530.macrodatekey.sql',1556231690,NULL),('phabricator:20130530.pastekeys.sql',1556231690,NULL),('phabricator:20130530.sessionhash.php',1556231690,NULL),('phabricator:20130531.filekeys.sql',1556231690,NULL),('phabricator:20130602.morediviner.sql',1556231690,NULL),('phabricator:20130602.namedqueries.sql',1556231690,NULL),('phabricator:20130606.userxactions.sql',1556231690,NULL),('phabricator:20130607.xaccount.sql',1556231690,NULL),('phabricator:20130611.migrateoauth.php',1556231690,NULL),('phabricator:20130611.nukeldap.php',1556231690,NULL),('phabricator:20130613.authdb.sql',1556231690,NULL),('phabricator:20130619.authconf.php',1556231690,NULL),('phabricator:20130620.diffxactions.sql',1556231690,NULL),('phabricator:20130621.diffcommentphid.sql',1556231690,NULL),('phabricator:20130621.diffcommentphidmig.php',1556231690,NULL),('phabricator:20130621.diffcommentunphid.sql',1556231690,NULL),('phabricator:20130622.doorkeeper.sql',1556231690,NULL),('phabricator:20130628.legalpadv0.sql',1556231690,NULL),('phabricator:20130701.conduitlog.sql',1556231690,NULL),('phabricator:20130703.legalpaddocdenorm.php',1556231690,NULL),('phabricator:20130703.legalpaddocdenorm.sql',1556231690,NULL),('phabricator:20130709.droptimeline.sql',1556231690,NULL),('phabricator:20130709.legalpadsignature.sql',1556231690,NULL),('phabricator:20130711.pholioimageobsolete.php',1556231690,NULL),('phabricator:20130711.pholioimageobsolete.sql',1556231690,NULL),('phabricator:20130711.pholioimageobsolete2.sql',1556231690,NULL),('phabricator:20130711.trimrealnames.php',1556231690,NULL),('phabricator:20130714.votexactions.sql',1556231690,NULL),('phabricator:20130715.votecomments.php',1556231690,NULL),('phabricator:20130715.voteedges.sql',1556231690,NULL),('phabricator:20130716.archivememberlessprojects.php',1556231690,NULL),('phabricator:20130722.pholioreplace.sql',1556231690,NULL),('phabricator:20130723.taskstarttime.sql',1556231690,NULL),('phabricator:20130726.ponderxactions.sql',1556231690,NULL),('phabricator:20130727.ponderquestionstatus.sql',1556231690,NULL),('phabricator:20130728.ponderunique.php',1556231690,NULL),('phabricator:20130728.ponderuniquekey.sql',1556231690,NULL),('phabricator:20130728.ponderxcomment.php',1556231690,NULL),('phabricator:20130731.releephcutpointidentifier.sql',1556231690,NULL),('phabricator:20130731.releephproject.sql',1556231690,NULL),('phabricator:20130731.releephrepoid.sql',1556231690,NULL),('phabricator:20130801.pastexactions.php',1556231690,NULL),('phabricator:20130801.pastexactions.sql',1556231690,NULL),('phabricator:20130802.heraldphid.sql',1556231690,NULL),('phabricator:20130802.heraldphids.php',1556231690,NULL),('phabricator:20130802.heraldphidukey.sql',1556231690,NULL),('phabricator:20130802.heraldxactions.sql',1556231690,NULL),('phabricator:20130805.pasteedges.sql',1556231690,NULL),('phabricator:20130805.pastemailkey.sql',1556231690,NULL),('phabricator:20130805.pastemailkeypop.php',1556231690,NULL),('phabricator:20130814.usercustom.sql',1556231690,NULL),('phabricator:20130820.file-mailkey-populate.php',1556231691,NULL),('phabricator:20130820.filemailkey.sql',1556231691,NULL),('phabricator:20130820.filexactions.sql',1556231691,NULL),('phabricator:20130820.releephxactions.sql',1556231690,NULL),('phabricator:20130826.divinernode.sql',1556231691,NULL),('phabricator:20130912.maniphest.1.touch.sql',1556231691,NULL),('phabricator:20130912.maniphest.2.created.sql',1556231691,NULL),('phabricator:20130912.maniphest.3.nameindex.sql',1556231691,NULL),('phabricator:20130912.maniphest.4.fillindex.php',1556231691,NULL),('phabricator:20130913.maniphest.1.migratesearch.php',1556231691,NULL),('phabricator:20130914.usercustom.sql',1556231691,NULL),('phabricator:20130915.maniphestcustom.sql',1556231691,NULL),('phabricator:20130915.maniphestmigrate.php',1556231691,NULL),('phabricator:20130915.maniphestqdrop.sql',1556231691,NULL),('phabricator:20130919.mfieldconf.php',1556231691,NULL),('phabricator:20130920.repokeyspolicy.sql',1556231691,NULL),('phabricator:20130921.mtransactions.sql',1556231691,NULL),('phabricator:20130921.xmigratemaniphest.php',1556231691,NULL),('phabricator:20130923.mrename.sql',1556231691,NULL),('phabricator:20130924.mdraftkey.sql',1556231691,NULL),('phabricator:20130925.mpolicy.sql',1556231691,NULL),('phabricator:20130925.xpolicy.sql',1556231691,NULL),('phabricator:20130926.dcustom.sql',1556231691,NULL),('phabricator:20130926.dinkeys.sql',1556231691,NULL),('phabricator:20130926.dinline.php',1556231691,NULL),('phabricator:20130927.audiomacro.sql',1556231691,NULL),('phabricator:20130929.filepolicy.sql',1556231691,NULL),('phabricator:20131004.dxedgekey.sql',1556231691,NULL),('phabricator:20131004.dxreviewers.php',1556231691,NULL),('phabricator:20131006.hdisable.sql',1556231691,NULL),('phabricator:20131010.pstorage.sql',1556231691,NULL),('phabricator:20131015.cpolicy.sql',1556231691,NULL),('phabricator:20131020.col1.sql',1556231691,NULL),('phabricator:20131020.harbormaster.sql',1556231691,NULL),('phabricator:20131020.pcustom.sql',1556231691,NULL),('phabricator:20131020.pxaction.sql',1556231691,NULL),('phabricator:20131020.pxactionmig.php',1556231691,NULL),('phabricator:20131025.repopush.sql',1556231691,NULL),('phabricator:20131026.commitstatus.sql',1556231691,NULL),('phabricator:20131030.repostatusmessage.sql',1556231691,NULL),('phabricator:20131031.vcspassword.sql',1556231691,NULL),('phabricator:20131105.buildstep.sql',1556231691,NULL),('phabricator:20131106.diffphid.1.col.sql',1556231691,NULL),('phabricator:20131106.diffphid.2.mig.php',1556231691,NULL),('phabricator:20131106.diffphid.3.key.sql',1556231691,NULL),('phabricator:20131106.nuance-v0.sql',1556231691,NULL),('phabricator:20131107.buildlog.sql',1556231691,NULL),('phabricator:20131112.userverified.1.col.sql',1556231691,NULL),('phabricator:20131112.userverified.2.mig.php',1556231691,NULL),('phabricator:20131118.ownerorder.php',1556231691,NULL),('phabricator:20131119.passphrase.sql',1556231691,NULL),('phabricator:20131120.nuancesourcetype.sql',1556231691,NULL),('phabricator:20131121.passphraseedge.sql',1556231691,NULL),('phabricator:20131121.repocredentials.1.col.sql',1556231691,NULL),('phabricator:20131121.repocredentials.2.mig.php',1556231691,NULL),('phabricator:20131122.repomirror.sql',1556231691,NULL),('phabricator:20131123.drydockblueprintpolicy.sql',1556231691,NULL),('phabricator:20131129.drydockresourceblueprint.sql',1556231691,NULL),('phabricator:20131204.pushlog.sql',1556231691,NULL),('phabricator:20131205.buildsteporder.sql',1556231691,NULL),('phabricator:20131205.buildstepordermig.php',1556231691,NULL),('phabricator:20131205.buildtargets.sql',1556231691,NULL),('phabricator:20131206.phragment.sql',1556231691,NULL),('phabricator:20131206.phragmentnull.sql',1556231691,NULL),('phabricator:20131208.phragmentsnapshot.sql',1556231691,NULL),('phabricator:20131211.phragmentedges.sql',1556231691,NULL),('phabricator:20131217.pushlogphid.1.col.sql',1556231691,NULL),('phabricator:20131217.pushlogphid.2.mig.php',1556231691,NULL),('phabricator:20131217.pushlogphid.3.key.sql',1556231692,NULL),('phabricator:20131219.pxdrop.sql',1556231692,NULL),('phabricator:20131224.harbormanual.sql',1556231692,NULL),('phabricator:20131227.heraldobject.sql',1556231692,NULL),('phabricator:20131231.dropshortcut.sql',1556231692,NULL),('phabricator:20131302.maniphestvalue.sql',1556231689,NULL),('phabricator:20140104.harbormastercmd.sql',1556231692,NULL),('phabricator:20140106.macromailkey.1.sql',1556231692,NULL),('phabricator:20140106.macromailkey.2.php',1556231692,NULL),('phabricator:20140108.ddbpname.1.sql',1556231692,NULL),('phabricator:20140108.ddbpname.2.php',1556231692,NULL),('phabricator:20140109.ddxactions.sql',1556231692,NULL),('phabricator:20140109.projectcolumnsdates.sql',1556231692,NULL),('phabricator:20140113.legalpadsig.1.sql',1556231692,NULL),('phabricator:20140113.legalpadsig.2.php',1556231692,NULL),('phabricator:20140115.auth.1.id.sql',1556231692,NULL),('phabricator:20140115.auth.2.expires.sql',1556231692,NULL),('phabricator:20140115.auth.3.unlimit.php',1556231692,NULL),('phabricator:20140115.legalpadsigkey.sql',1556231692,NULL),('phabricator:20140116.reporefcursor.sql',1556231692,NULL),('phabricator:20140126.diff.1.parentrevisionid.sql',1556231692,NULL),('phabricator:20140126.diff.2.repositoryphid.sql',1556231692,NULL),('phabricator:20140130.dash.1.board.sql',1556231692,NULL),('phabricator:20140130.dash.2.panel.sql',1556231692,NULL),('phabricator:20140130.dash.3.boardxaction.sql',1556231692,NULL),('phabricator:20140130.dash.4.panelxaction.sql',1556231692,NULL),('phabricator:20140130.mail.1.retry.sql',1556231692,NULL),('phabricator:20140130.mail.2.next.sql',1556231692,NULL),('phabricator:20140201.gc.1.mailsent.sql',1556231692,NULL),('phabricator:20140201.gc.2.mailreceived.sql',1556231692,NULL),('phabricator:20140205.cal.1.rename.sql',1556231692,NULL),('phabricator:20140205.cal.2.phid-col.sql',1556231692,NULL),('phabricator:20140205.cal.3.phid-mig.php',1556231692,NULL),('phabricator:20140205.cal.4.phid-key.sql',1556231692,NULL),('phabricator:20140210.herald.rule-condition-mig.php',1556231692,NULL),('phabricator:20140210.projcfield.1.blurb.php',1556231692,NULL),('phabricator:20140210.projcfield.2.piccol.sql',1556231692,NULL),('phabricator:20140210.projcfield.3.picmig.sql',1556231692,NULL),('phabricator:20140210.projcfield.4.memmig.sql',1556231692,NULL),('phabricator:20140210.projcfield.5.dropprofile.sql',1556231692,NULL),('phabricator:20140211.dx.1.nullablechangesetid.sql',1556231692,NULL),('phabricator:20140211.dx.2.migcommenttext.php',1556231692,NULL),('phabricator:20140211.dx.3.migsubscriptions.sql',1556231692,NULL),('phabricator:20140211.dx.999.drop.relationships.sql',1556231692,NULL),('phabricator:20140212.dx.1.armageddon.php',1556231692,NULL),('phabricator:20140214.clean.1.legacycommentid.sql',1556231692,NULL),('phabricator:20140214.clean.2.dropcomment.sql',1556231692,NULL),('phabricator:20140214.clean.3.dropinline.sql',1556231692,NULL),('phabricator:20140218.differentialdraft.sql',1556231692,NULL),('phabricator:20140218.passwords.1.extend.sql',1556231692,NULL),('phabricator:20140218.passwords.2.prefix.sql',1556231692,NULL),('phabricator:20140218.passwords.3.vcsextend.sql',1556231692,NULL),('phabricator:20140218.passwords.4.vcs.php',1556231692,NULL),('phabricator:20140223.bigutf8scratch.sql',1556231692,NULL),('phabricator:20140224.dxclean.1.datecommitted.sql',1556231692,NULL),('phabricator:20140226.dxcustom.1.fielddata.php',1556231692,NULL),('phabricator:20140226.dxcustom.99.drop.sql',1556231692,NULL),('phabricator:20140228.dxcomment.1.sql',1556231692,NULL),('phabricator:20140305.diviner.1.slugcol.sql',1556231692,NULL),('phabricator:20140305.diviner.2.slugkey.sql',1556231692,NULL),('phabricator:20140311.mdroplegacy.sql',1556231692,NULL),('phabricator:20140314.projectcolumn.1.statuscol.sql',1556231692,NULL),('phabricator:20140314.projectcolumn.2.statuskey.sql',1556231692,NULL),('phabricator:20140317.mupdatedkey.sql',1556231692,NULL),('phabricator:20140321.harbor.1.bxaction.sql',1556231692,NULL),('phabricator:20140321.mstatus.1.col.sql',1556231692,NULL),('phabricator:20140321.mstatus.2.mig.php',1556231692,NULL),('phabricator:20140323.harbor.1.renames.php',1556231692,NULL),('phabricator:20140323.harbor.2.message.sql',1556231692,NULL),('phabricator:20140325.push.1.event.sql',1556231692,NULL),('phabricator:20140325.push.2.eventphid.sql',1556231692,NULL),('phabricator:20140325.push.3.groups.php',1556231692,NULL),('phabricator:20140325.push.4.prune.sql',1556231692,NULL),('phabricator:20140326.project.1.colxaction.sql',1556231692,NULL),('phabricator:20140328.releeph.1.productxaction.sql',1556231692,NULL),('phabricator:20140330.flagtext.sql',1556231692,NULL),('phabricator:20140402.actionlog.sql',1556231692,NULL),('phabricator:20140410.accountsecret.1.sql',1556231692,NULL),('phabricator:20140410.accountsecret.2.php',1556231692,NULL),('phabricator:20140416.harbor.1.sql',1556231692,NULL),('phabricator:20140420.rel.1.objectphid.sql',1556231692,NULL),('phabricator:20140420.rel.2.objectmig.php',1556231692,NULL),('phabricator:20140421.slowvotecolumnsisclosed.sql',1556231692,NULL),('phabricator:20140423.session.1.hisec.sql',1556231692,NULL),('phabricator:20140427.mfactor.1.sql',1556231692,NULL),('phabricator:20140430.auth.1.partial.sql',1556231692,NULL),('phabricator:20140430.dash.1.paneltype.sql',1556231692,NULL),('phabricator:20140430.dash.2.edge.sql',1556231692,NULL),('phabricator:20140501.passphraselockcredential.sql',1556231692,NULL),('phabricator:20140501.remove.1.dlog.sql',1556231692,NULL),('phabricator:20140507.smstable.sql',1556231692,NULL),('phabricator:20140509.coverage.1.sql',1556231692,NULL),('phabricator:20140509.dashboardlayoutconfig.sql',1556231692,NULL),('phabricator:20140512.dparents.1.sql',1556231692,NULL),('phabricator:20140514.harbormasterbuildabletransaction.sql',1556231692,NULL),('phabricator:20140514.pholiomockclose.sql',1556231692,NULL),('phabricator:20140515.trust-emails.sql',1556231692,NULL),('phabricator:20140517.dxbinarycache.sql',1556231692,NULL),('phabricator:20140518.dxmorebinarycache.sql',1556231693,NULL),('phabricator:20140519.dashboardinstall.sql',1556231693,NULL),('phabricator:20140520.authtemptoken.sql',1556231693,NULL),('phabricator:20140521.projectslug.1.create.sql',1556231693,NULL),('phabricator:20140521.projectslug.2.mig.php',1556231693,NULL),('phabricator:20140522.projecticon.sql',1556231693,NULL),('phabricator:20140524.auth.mfa.cache.sql',1556231693,NULL),('phabricator:20140525.hunkmodern.sql',1556231693,NULL),('phabricator:20140615.pholioedit.1.sql',1556231693,NULL),('phabricator:20140615.pholioedit.2.sql',1556231693,NULL),('phabricator:20140617.daemon.explicit-argv.sql',1556231693,NULL),('phabricator:20140617.daemonlog.sql',1556231693,NULL),('phabricator:20140624.projcolor.1.sql',1556231693,NULL),('phabricator:20140624.projcolor.2.sql',1556231693,NULL),('phabricator:20140629.dasharchive.1.sql',1556231693,NULL),('phabricator:20140629.legalsig.1.sql',1556231693,NULL),('phabricator:20140629.legalsig.2.php',1556231693,NULL),('phabricator:20140701.legalexemption.1.sql',1556231693,NULL),('phabricator:20140701.legalexemption.2.sql',1556231693,NULL),('phabricator:20140703.legalcorp.1.sql',1556231693,NULL),('phabricator:20140703.legalcorp.2.sql',1556231693,NULL),('phabricator:20140703.legalcorp.3.sql',1556231693,NULL),('phabricator:20140703.legalcorp.4.sql',1556231693,NULL),('phabricator:20140703.legalcorp.5.sql',1556231693,NULL),('phabricator:20140704.harbormasterstep.1.sql',1556231693,NULL),('phabricator:20140704.harbormasterstep.2.sql',1556231693,NULL),('phabricator:20140704.legalpreamble.1.sql',1556231693,NULL),('phabricator:20140706.harbormasterdepend.1.php',1556231693,NULL),('phabricator:20140706.pedge.1.sql',1556231693,NULL),('phabricator:20140711.pnames.1.sql',1556231693,NULL),('phabricator:20140711.pnames.2.php',1556231693,NULL),('phabricator:20140711.workerpriority.sql',1556231693,NULL),('phabricator:20140712.projcoluniq.sql',1556231693,NULL),('phabricator:20140721.phortune.1.cart.sql',1556231693,NULL),('phabricator:20140721.phortune.2.purchase.sql',1556231693,NULL),('phabricator:20140721.phortune.3.charge.sql',1556231693,NULL),('phabricator:20140721.phortune.4.cartstatus.sql',1556231693,NULL),('phabricator:20140721.phortune.5.cstatusdefault.sql',1556231693,NULL),('phabricator:20140721.phortune.6.onetimecharge.sql',1556231693,NULL),('phabricator:20140721.phortune.7.nullmethod.sql',1556231693,NULL),('phabricator:20140722.appname.php',1556231693,NULL),('phabricator:20140722.audit.1.xactions.sql',1556231693,NULL),('phabricator:20140722.audit.2.comments.sql',1556231693,NULL),('phabricator:20140722.audit.3.miginlines.php',1556231693,NULL),('phabricator:20140722.audit.4.migtext.php',1556231693,NULL),('phabricator:20140722.renameauth.php',1556231693,NULL),('phabricator:20140723.apprenamexaction.sql',1556231693,NULL),('phabricator:20140725.audit.1.migxactions.php',1556231693,NULL),('phabricator:20140731.audit.1.subscribers.php',1556231693,NULL),('phabricator:20140731.cancdn.php',1556231693,NULL),('phabricator:20140731.harbormasterstepdesc.sql',1556231693,NULL),('phabricator:20140805.boardcol.1.sql',1556231693,NULL),('phabricator:20140805.boardcol.2.php',1556231693,NULL),('phabricator:20140807.harbormastertargettime.sql',1556231693,NULL),('phabricator:20140808.boardprop.1.sql',1556231693,NULL),('phabricator:20140808.boardprop.2.sql',1556231693,NULL),('phabricator:20140808.boardprop.3.php',1556231693,NULL),('phabricator:20140811.blob.1.sql',1556231693,NULL),('phabricator:20140811.blob.2.sql',1556231693,NULL),('phabricator:20140812.projkey.1.sql',1556231693,NULL),('phabricator:20140812.projkey.2.sql',1556231693,NULL),('phabricator:20140814.passphrasecredentialconduit.sql',1556231693,NULL),('phabricator:20140815.cancdncase.php',1556231693,NULL),('phabricator:20140818.harbormasterindex.1.sql',1556231693,NULL),('phabricator:20140821.harbormasterbuildgen.1.sql',1556231693,NULL),('phabricator:20140822.daemonenvhash.sql',1556231693,NULL),('phabricator:20140902.almanacdevice.1.sql',1556231693,NULL),('phabricator:20140904.macroattach.php',1556231693,NULL),('phabricator:20140911.fund.1.initiative.sql',1556231693,NULL),('phabricator:20140911.fund.2.xaction.sql',1556231693,NULL),('phabricator:20140911.fund.3.edge.sql',1556231693,NULL),('phabricator:20140911.fund.4.backer.sql',1556231693,NULL),('phabricator:20140911.fund.5.backxaction.sql',1556231693,NULL),('phabricator:20140914.betaproto.php',1556231693,NULL),('phabricator:20140917.project.canlock.sql',1556231693,NULL),('phabricator:20140918.schema.1.dropaudit.sql',1556231693,NULL),('phabricator:20140918.schema.2.dropauditinline.sql',1556231693,NULL),('phabricator:20140918.schema.3.wipecache.sql',1556231693,NULL),('phabricator:20140918.schema.4.cachetype.sql',1556231693,NULL),('phabricator:20140918.schema.5.slowvote.sql',1556231693,NULL),('phabricator:20140919.schema.01.calstatus.sql',1556231693,NULL),('phabricator:20140919.schema.02.calname.sql',1556231693,NULL),('phabricator:20140919.schema.03.dropaux.sql',1556231693,NULL),('phabricator:20140919.schema.04.droptaskproj.sql',1556231693,NULL),('phabricator:20140926.schema.01.droprelev.sql',1556231693,NULL),('phabricator:20140926.schema.02.droprelreqev.sql',1556231693,NULL),('phabricator:20140926.schema.03.dropldapinfo.sql',1556231693,NULL),('phabricator:20140926.schema.04.dropoauthinfo.sql',1556231693,NULL),('phabricator:20140926.schema.05.dropprojaffil.sql',1556231693,NULL),('phabricator:20140926.schema.06.dropsubproject.sql',1556231693,NULL),('phabricator:20140926.schema.07.droppondcom.sql',1556231693,NULL),('phabricator:20140927.schema.01.dropsearchq.sql',1556231693,NULL),('phabricator:20140927.schema.02.pholio1.sql',1556231693,NULL),('phabricator:20140927.schema.03.pholio2.sql',1556231693,NULL),('phabricator:20140927.schema.04.pholio3.sql',1556231693,NULL),('phabricator:20140927.schema.05.phragment1.sql',1556231693,NULL),('phabricator:20140927.schema.06.releeph1.sql',1556231693,NULL),('phabricator:20141001.schema.01.version.sql',1556231693,NULL),('phabricator:20141001.schema.02.taskmail.sql',1556231693,NULL),('phabricator:20141002.schema.01.liskcounter.sql',1556231693,NULL),('phabricator:20141002.schema.02.draftnull.sql',1556231693,NULL),('phabricator:20141004.currency.01.sql',1556231693,NULL),('phabricator:20141004.currency.02.sql',1556231693,NULL),('phabricator:20141004.currency.03.sql',1556231693,NULL),('phabricator:20141004.currency.04.sql',1556231693,NULL),('phabricator:20141004.currency.05.sql',1556231693,NULL),('phabricator:20141004.currency.06.sql',1556231693,NULL),('phabricator:20141004.harborliskcounter.sql',1556231693,NULL),('phabricator:20141005.phortuneproduct.sql',1556231694,NULL),('phabricator:20141006.phortunecart.sql',1556231694,NULL),('phabricator:20141006.phortunemerchant.sql',1556231694,NULL),('phabricator:20141006.phortunemerchantx.sql',1556231694,NULL),('phabricator:20141007.fundmerchant.sql',1556231694,NULL),('phabricator:20141007.fundrisks.sql',1556231694,NULL),('phabricator:20141007.fundtotal.sql',1556231694,NULL),('phabricator:20141007.phortunecartmerchant.sql',1556231694,NULL),('phabricator:20141007.phortunecharge.sql',1556231694,NULL),('phabricator:20141007.phortunepayment.sql',1556231694,NULL),('phabricator:20141007.phortuneprovider.sql',1556231694,NULL),('phabricator:20141007.phortuneproviderx.sql',1556231694,NULL),('phabricator:20141008.phortunemerchdesc.sql',1556231694,NULL),('phabricator:20141008.phortuneprovdis.sql',1556231694,NULL),('phabricator:20141008.phortunerefund.sql',1556231694,NULL),('phabricator:20141010.fundmailkey.sql',1556231694,NULL),('phabricator:20141011.phortunemerchedit.sql',1556231694,NULL),('phabricator:20141012.phortunecartxaction.sql',1556231694,NULL),('phabricator:20141013.phortunecartkey.sql',1556231694,NULL),('phabricator:20141016.almanac.device.sql',1556231694,NULL),('phabricator:20141016.almanac.dxaction.sql',1556231694,NULL),('phabricator:20141016.almanac.interface.sql',1556231694,NULL),('phabricator:20141016.almanac.network.sql',1556231694,NULL),('phabricator:20141016.almanac.nxaction.sql',1556231694,NULL),('phabricator:20141016.almanac.service.sql',1556231694,NULL),('phabricator:20141016.almanac.sxaction.sql',1556231694,NULL),('phabricator:20141017.almanac.binding.sql',1556231694,NULL),('phabricator:20141017.almanac.bxaction.sql',1556231694,NULL),('phabricator:20141025.phriction.1.xaction.sql',1556231694,NULL),('phabricator:20141025.phriction.2.xaction.sql',1556231694,NULL),('phabricator:20141025.phriction.mailkey.sql',1556231694,NULL),('phabricator:20141103.almanac.1.delprop.sql',1556231694,NULL),('phabricator:20141103.almanac.2.addprop.sql',1556231694,NULL),('phabricator:20141104.almanac.3.edge.sql',1556231694,NULL),('phabricator:20141105.ssh.1.rename.sql',1556231694,NULL),('phabricator:20141106.dropold.sql',1556231694,NULL),('phabricator:20141106.uniqdrafts.php',1556231694,NULL),('phabricator:20141107.phriction.policy.1.sql',1556231694,NULL),('phabricator:20141107.phriction.policy.2.php',1556231694,NULL),('phabricator:20141107.phriction.popkeys.php',1556231694,NULL),('phabricator:20141107.ssh.1.colname.sql',1556231694,NULL),('phabricator:20141107.ssh.2.keyhash.sql',1556231694,NULL),('phabricator:20141107.ssh.3.keyindex.sql',1556231694,NULL),('phabricator:20141107.ssh.4.keymig.php',1556231694,NULL),('phabricator:20141107.ssh.5.indexnull.sql',1556231694,NULL),('phabricator:20141107.ssh.6.indexkey.sql',1556231694,NULL),('phabricator:20141107.ssh.7.colnull.sql',1556231694,NULL),('phabricator:20141113.auditdupes.php',1556231694,NULL),('phabricator:20141118.diffxaction.sql',1556231694,NULL),('phabricator:20141119.commitpedge.sql',1556231694,NULL),('phabricator:20141119.differential.diff.policy.sql',1556231694,NULL),('phabricator:20141119.sshtrust.sql',1556231694,NULL),('phabricator:20141123.taskpriority.1.sql',1556231694,NULL),('phabricator:20141123.taskpriority.2.sql',1556231694,NULL),('phabricator:20141210.maniphestsubscribersmig.1.sql',1556231694,NULL),('phabricator:20141210.maniphestsubscribersmig.2.sql',1556231694,NULL),('phabricator:20141210.reposervice.sql',1556231694,NULL),('phabricator:20141212.conduittoken.sql',1556231694,NULL),('phabricator:20141215.almanacservicetype.sql',1556231694,NULL),('phabricator:20141217.almanacdevicelock.sql',1556231694,NULL),('phabricator:20141217.almanaclock.sql',1556231694,NULL),('phabricator:20141218.maniphestcctxn.php',1556231694,NULL),('phabricator:20141222.maniphestprojtxn.php',1556231694,NULL),('phabricator:20141223.daemonloguser.sql',1556231694,NULL),('phabricator:20141223.daemonobjectphid.sql',1556231694,NULL),('phabricator:20141230.pasteeditpolicycolumn.sql',1556231694,NULL),('phabricator:20141230.pasteeditpolicyexisting.sql',1556231694,NULL),('phabricator:20150102.policyname.php',1556231694,NULL),('phabricator:20150102.tasksubscriber.sql',1556231694,NULL),('phabricator:20150105.conpsearch.sql',1556231694,NULL),('phabricator:20150114.oauthserver.client.policy.sql',1556231694,NULL),('phabricator:20150115.applicationemails.sql',1556231694,NULL),('phabricator:20150115.trigger.1.sql',1556231694,NULL),('phabricator:20150115.trigger.2.sql',1556231694,NULL),('phabricator:20150116.maniphestapplicationemails.php',1556231694,NULL),('phabricator:20150120.maniphestdefaultauthor.php',1556231694,NULL),('phabricator:20150124.subs.1.sql',1556231694,NULL),('phabricator:20150129.pastefileapplicationemails.php',1556231694,NULL),('phabricator:20150130.phortune.1.subphid.sql',1556231694,NULL),('phabricator:20150130.phortune.2.subkey.sql',1556231695,NULL),('phabricator:20150131.phortune.1.defaultpayment.sql',1556231695,NULL),('phabricator:20150205.authprovider.autologin.sql',1556231695,NULL),('phabricator:20150205.daemonenv.sql',1556231695,NULL),('phabricator:20150209.invite.sql',1556231695,NULL),('phabricator:20150209.oauthclient.trust.sql',1556231695,NULL),('phabricator:20150210.invitephid.sql',1556231695,NULL),('phabricator:20150212.legalpad.session.1.sql',1556231695,NULL),('phabricator:20150212.legalpad.session.2.sql',1556231695,NULL),('phabricator:20150219.scratch.nonmutable.sql',1556231695,NULL),('phabricator:20150223.daemon.1.id.sql',1556231695,NULL),('phabricator:20150223.daemon.2.idlegacy.sql',1556231695,NULL),('phabricator:20150223.daemon.3.idkey.sql',1556231695,NULL),('phabricator:20150312.filechunk.1.sql',1556231695,NULL),('phabricator:20150312.filechunk.2.sql',1556231695,NULL),('phabricator:20150312.filechunk.3.sql',1556231695,NULL),('phabricator:20150317.conpherence.isroom.1.sql',1556231695,NULL),('phabricator:20150317.conpherence.isroom.2.sql',1556231695,NULL),('phabricator:20150317.conpherence.policy.sql',1556231695,NULL),('phabricator:20150410.nukeruleedit.sql',1556231695,NULL),('phabricator:20150420.invoice.1.sql',1556231695,NULL),('phabricator:20150420.invoice.2.sql',1556231695,NULL),('phabricator:20150425.isclosed.sql',1556231695,NULL),('phabricator:20150427.calendar.1.edge.sql',1556231695,NULL),('phabricator:20150427.calendar.1.xaction.sql',1556231695,NULL),('phabricator:20150427.calendar.2.xaction.sql',1556231695,NULL),('phabricator:20150428.calendar.1.iscancelled.sql',1556231695,NULL),('phabricator:20150428.calendar.1.name.sql',1556231695,NULL),('phabricator:20150429.calendar.1.invitee.sql',1556231695,NULL),('phabricator:20150430.calendar.1.policies.sql',1556231695,NULL),('phabricator:20150430.multimeter.1.sql',1556231695,NULL),('phabricator:20150430.multimeter.2.host.sql',1556231695,NULL),('phabricator:20150430.multimeter.3.viewer.sql',1556231695,NULL),('phabricator:20150430.multimeter.4.context.sql',1556231695,NULL),('phabricator:20150430.multimeter.5.label.sql',1556231695,NULL),('phabricator:20150501.calendar.1.reply.sql',1556231695,NULL),('phabricator:20150501.calendar.2.reply.php',1556231695,NULL),('phabricator:20150501.conpherencepics.sql',1556231695,NULL),('phabricator:20150503.repositorysymbols.1.sql',1556231695,NULL),('phabricator:20150503.repositorysymbols.2.php',1556231695,NULL),('phabricator:20150503.repositorysymbols.3.sql',1556231695,NULL),('phabricator:20150504.symbolsproject.1.php',1556231695,NULL),('phabricator:20150504.symbolsproject.2.sql',1556231695,NULL),('phabricator:20150506.calendarunnamedevents.1.php',1556231695,NULL),('phabricator:20150507.calendar.1.isallday.sql',1556231695,NULL),('phabricator:20150513.user.cache.1.sql',1556231695,NULL),('phabricator:20150514.calendar.status.sql',1556231695,NULL),('phabricator:20150514.phame.blog.xaction.sql',1556231695,NULL),('phabricator:20150514.user.cache.2.sql',1556231695,NULL),('phabricator:20150515.phame.post.xaction.sql',1556231695,NULL),('phabricator:20150515.project.mailkey.1.sql',1556231695,NULL),('phabricator:20150515.project.mailkey.2.php',1556231695,NULL),('phabricator:20150519.calendar.calendaricon.sql',1556231695,NULL),('phabricator:20150521.releephrepository.sql',1556231695,NULL),('phabricator:20150525.diff.hidden.1.sql',1556231695,NULL),('phabricator:20150526.owners.mailkey.1.sql',1556231695,NULL),('phabricator:20150526.owners.mailkey.2.php',1556231695,NULL),('phabricator:20150526.owners.xaction.sql',1556231695,NULL),('phabricator:20150527.calendar.recurringevents.sql',1556231695,NULL),('phabricator:20150601.spaces.1.namespace.sql',1556231695,NULL),('phabricator:20150601.spaces.2.xaction.sql',1556231695,NULL),('phabricator:20150602.mlist.1.sql',1556231695,NULL),('phabricator:20150602.mlist.2.php',1556231695,NULL),('phabricator:20150604.spaces.1.sql',1556231695,NULL),('phabricator:20150605.diviner.edges.sql',1556231695,NULL),('phabricator:20150605.diviner.editPolicy.sql',1556231695,NULL),('phabricator:20150605.diviner.xaction.sql',1556231695,NULL),('phabricator:20150606.mlist.1.php',1556231695,NULL),('phabricator:20150609.inline.sql',1556231695,NULL),('phabricator:20150609.spaces.1.pholio.sql',1556231695,NULL),('phabricator:20150609.spaces.2.maniphest.sql',1556231695,NULL),('phabricator:20150610.spaces.1.desc.sql',1556231695,NULL),('phabricator:20150610.spaces.2.edge.sql',1556231695,NULL),('phabricator:20150610.spaces.3.archive.sql',1556231695,NULL),('phabricator:20150611.spaces.1.mailxaction.sql',1556231695,NULL),('phabricator:20150611.spaces.2.appmail.sql',1556231695,NULL),('phabricator:20150616.divinerrepository.sql',1556231695,NULL),('phabricator:20150617.harbor.1.lint.sql',1556231695,NULL),('phabricator:20150617.harbor.2.unit.sql',1556231695,NULL),('phabricator:20150618.harbor.1.planauto.sql',1556231695,NULL),('phabricator:20150618.harbor.2.stepauto.sql',1556231695,NULL),('phabricator:20150618.harbor.3.buildauto.sql',1556231695,NULL),('phabricator:20150619.conpherencerooms.1.sql',1556231695,NULL),('phabricator:20150619.conpherencerooms.2.sql',1556231695,NULL),('phabricator:20150619.conpherencerooms.3.sql',1556231695,NULL),('phabricator:20150621.phrase.1.sql',1556231695,NULL),('phabricator:20150621.phrase.2.sql',1556231695,NULL),('phabricator:20150622.bulk.1.job.sql',1556231695,NULL),('phabricator:20150622.bulk.2.task.sql',1556231695,NULL),('phabricator:20150622.bulk.3.xaction.sql',1556231695,NULL),('phabricator:20150622.bulk.4.edge.sql',1556231696,NULL),('phabricator:20150622.metamta.1.phid-col.sql',1556231696,NULL),('phabricator:20150622.metamta.2.phid-mig.php',1556231696,NULL),('phabricator:20150622.metamta.3.phid-key.sql',1556231696,NULL),('phabricator:20150622.metamta.4.actor-phid-col.sql',1556231696,NULL),('phabricator:20150622.metamta.5.actor-phid-mig.php',1556231696,NULL),('phabricator:20150622.metamta.6.actor-phid-key.sql',1556231696,NULL),('phabricator:20150624.spaces.1.repo.sql',1556231696,NULL),('phabricator:20150626.spaces.1.calendar.sql',1556231696,NULL),('phabricator:20150630.herald.1.sql',1556231696,NULL),('phabricator:20150630.herald.2.sql',1556231696,NULL),('phabricator:20150701.herald.1.sql',1556231696,NULL),('phabricator:20150701.herald.2.sql',1556231696,NULL),('phabricator:20150702.spaces.1.slowvote.sql',1556231696,NULL),('phabricator:20150706.herald.1.sql',1556231696,NULL),('phabricator:20150707.herald.1.sql',1556231696,NULL),('phabricator:20150708.arcanistproject.sql',1556231696,NULL),('phabricator:20150708.herald.1.sql',1556231696,NULL),('phabricator:20150708.herald.2.sql',1556231696,NULL),('phabricator:20150708.herald.3.sql',1556231696,NULL),('phabricator:20150712.badges.1.sql',1556231696,NULL),('phabricator:20150714.spaces.countdown.1.sql',1556231696,NULL),('phabricator:20150717.herald.1.sql',1556231696,NULL),('phabricator:20150719.countdown.1.sql',1556231696,NULL),('phabricator:20150719.countdown.2.sql',1556231696,NULL),('phabricator:20150719.countdown.3.sql',1556231696,NULL),('phabricator:20150721.phurl.1.url.sql',1556231696,NULL),('phabricator:20150721.phurl.2.xaction.sql',1556231696,NULL),('phabricator:20150721.phurl.3.xactioncomment.sql',1556231696,NULL),('phabricator:20150721.phurl.4.url.sql',1556231696,NULL),('phabricator:20150721.phurl.5.edge.sql',1556231696,NULL),('phabricator:20150721.phurl.6.alias.sql',1556231696,NULL),('phabricator:20150721.phurl.7.authorphid.sql',1556231696,NULL),('phabricator:20150722.dashboard.1.sql',1556231696,NULL),('phabricator:20150722.dashboard.2.sql',1556231696,NULL),('phabricator:20150723.countdown.1.sql',1556231696,NULL),('phabricator:20150724.badges.comments.1.sql',1556231696,NULL),('phabricator:20150724.countdown.comments.1.sql',1556231696,NULL),('phabricator:20150725.badges.mailkey.1.sql',1556231696,NULL),('phabricator:20150725.badges.mailkey.2.php',1556231696,NULL),('phabricator:20150725.badges.viewpolicy.3.sql',1556231696,NULL),('phabricator:20150725.countdown.mailkey.1.sql',1556231696,NULL),('phabricator:20150725.countdown.mailkey.2.php',1556231696,NULL),('phabricator:20150725.slowvote.mailkey.1.sql',1556231696,NULL),('phabricator:20150725.slowvote.mailkey.2.php',1556231696,NULL),('phabricator:20150727.heraldaction.1.sql',1556231696,NULL),('phabricator:20150730.herald.1.sql',1556231696,NULL),('phabricator:20150730.herald.2.sql',1556231696,NULL),('phabricator:20150730.herald.3.sql',1556231696,NULL),('phabricator:20150730.herald.4.sql',1556231696,NULL),('phabricator:20150730.herald.5.sql',1556231696,NULL),('phabricator:20150730.herald.6.sql',1556231696,NULL),('phabricator:20150730.herald.7.sql',1556231696,NULL),('phabricator:20150803.herald.1.sql',1556231696,NULL),('phabricator:20150803.herald.2.sql',1556231696,NULL),('phabricator:20150804.ponder.answer.mailkey.1.sql',1556231696,NULL),('phabricator:20150804.ponder.answer.mailkey.2.php',1556231696,NULL),('phabricator:20150804.ponder.question.1.sql',1556231696,NULL),('phabricator:20150804.ponder.question.2.sql',1556231696,NULL),('phabricator:20150804.ponder.question.3.sql',1556231696,NULL),('phabricator:20150804.ponder.spaces.4.sql',1556231696,NULL),('phabricator:20150805.paste.status.1.sql',1556231696,NULL),('phabricator:20150805.paste.status.2.sql',1556231696,NULL),('phabricator:20150806.ponder.answer.1.sql',1556231696,NULL),('phabricator:20150806.ponder.editpolicy.2.sql',1556231696,NULL),('phabricator:20150806.ponder.status.1.sql',1556231696,NULL),('phabricator:20150806.ponder.status.2.sql',1556231696,NULL),('phabricator:20150806.ponder.status.3.sql',1556231696,NULL),('phabricator:20150808.ponder.vote.1.sql',1556231696,NULL),('phabricator:20150808.ponder.vote.2.sql',1556231696,NULL),('phabricator:20150812.ponder.answer.1.sql',1556231696,NULL),('phabricator:20150812.ponder.answer.2.sql',1556231696,NULL),('phabricator:20150814.harbormater.artifact.phid.sql',1556231696,NULL),('phabricator:20150815.owners.status.1.sql',1556231696,NULL),('phabricator:20150815.owners.status.2.sql',1556231696,NULL),('phabricator:20150823.nuance.queue.1.sql',1556231696,NULL),('phabricator:20150823.nuance.queue.2.sql',1556231696,NULL),('phabricator:20150823.nuance.queue.3.sql',1556231696,NULL),('phabricator:20150823.nuance.queue.4.sql',1556231696,NULL),('phabricator:20150828.ponder.wiki.1.sql',1556231696,NULL),('phabricator:20150829.ponder.dupe.1.sql',1556231696,NULL),('phabricator:20150904.herald.1.sql',1556231696,NULL),('phabricator:20150906.mailinglist.sql',1556231696,NULL),('phabricator:20150910.owners.custom.1.sql',1556231696,NULL),('phabricator:20150916.drydock.slotlocks.1.sql',1556231696,NULL),('phabricator:20150922.drydock.commands.1.sql',1556231696,NULL),('phabricator:20150923.drydock.resourceid.1.sql',1556231696,NULL),('phabricator:20150923.drydock.resourceid.2.sql',1556231696,NULL),('phabricator:20150923.drydock.resourceid.3.sql',1556231696,NULL),('phabricator:20150923.drydock.taskid.1.sql',1556231696,NULL),('phabricator:20150924.drydock.disable.1.sql',1556231696,NULL),('phabricator:20150924.drydock.status.1.sql',1556231696,NULL),('phabricator:20150928.drydock.rexpire.1.sql',1556231696,NULL),('phabricator:20150930.drydock.log.1.sql',1556231696,NULL),('phabricator:20151001.drydock.rname.1.sql',1556231696,NULL),('phabricator:20151002.dashboard.status.1.sql',1556231696,NULL),('phabricator:20151002.harbormaster.bparam.1.sql',1556231696,NULL),('phabricator:20151009.drydock.auth.1.sql',1556231696,NULL),('phabricator:20151010.drydock.auth.2.sql',1556231696,NULL),('phabricator:20151013.drydock.op.1.sql',1556231696,NULL),('phabricator:20151023.harborpolicy.1.sql',1556231696,NULL),('phabricator:20151023.harborpolicy.2.php',1556231696,NULL),('phabricator:20151023.patchduration.sql',1556231697,141072),('phabricator:20151030.harbormaster.initiator.sql',1556231697,14355),('phabricator:20151106.editengine.1.table.sql',1556231697,7000),('phabricator:20151106.editengine.2.xactions.sql',1556231697,6327),('phabricator:20151106.phame.post.mailkey.1.sql',1556231697,13453),('phabricator:20151106.phame.post.mailkey.2.php',1556231697,1570),('phabricator:20151107.phame.blog.mailkey.1.sql',1556231697,11087),('phabricator:20151107.phame.blog.mailkey.2.php',1556231697,970),('phabricator:20151108.phame.blog.joinpolicy.sql',1556231697,11189),('phabricator:20151108.xhpast.stderr.sql',1556231697,18926),('phabricator:20151109.phame.post.comments.1.sql',1556231697,7158),('phabricator:20151109.repository.coverage.1.sql',1556231697,1260),('phabricator:20151109.xhpast.db.1.sql',1556231697,3950),('phabricator:20151109.xhpast.db.2.sql',1556231697,1156),('phabricator:20151110.daemonenvhash.sql',1556231697,24270),('phabricator:20151111.phame.blog.archive.1.sql',1556231697,11808),('phabricator:20151111.phame.blog.archive.2.sql',1556231697,570),('phabricator:20151112.herald.edge.sql',1556231697,10237),('phabricator:20151116.owners.edge.sql',1556231697,10178),('phabricator:20151128.phame.blog.picture.1.sql',1556231697,12092),('phabricator:20151130.phurl.mailkey.1.sql',1556231697,9727),('phabricator:20151130.phurl.mailkey.2.php',1556231697,1287),('phabricator:20151202.versioneddraft.1.sql',1556231697,5191),('phabricator:20151207.editengine.1.sql',1556231697,48281),('phabricator:20151210.land.1.refphid.sql',1556231697,9677),('phabricator:20151210.land.2.refphid.php',1556231697,629),('phabricator:20151215.phame.1.autotitle.sql',1556231697,20604),('phabricator:20151218.key.1.keyphid.sql',1556231697,13167),('phabricator:20151218.key.2.keyphid.php',1556231697,423),('phabricator:20151219.proj.01.prislug.sql',1556231697,13742),('phabricator:20151219.proj.02.prislugkey.sql',1556231697,8362),('phabricator:20151219.proj.03.copyslug.sql',1556231697,517),('phabricator:20151219.proj.04.dropslugkey.sql',1556231697,6993),('phabricator:20151219.proj.05.dropslug.sql',1556231697,14034),('phabricator:20151219.proj.06.defaultpolicy.php',1556231697,1187),('phabricator:20151219.proj.07.viewnull.sql',1556231697,17899),('phabricator:20151219.proj.08.editnull.sql',1556231697,17020),('phabricator:20151219.proj.09.joinnull.sql',1556231697,17501),('phabricator:20151219.proj.10.subcolumns.sql',1556231697,77351),('phabricator:20151219.proj.11.subprojectphids.sql',1556231697,14306),('phabricator:20151221.search.1.version.sql',1556231697,5434),('phabricator:20151221.search.2.ownersngrams.sql',1556231697,5494),('phabricator:20151221.search.3.reindex.php',1556231697,84),('phabricator:20151223.proj.01.paths.sql',1556231697,15641),('phabricator:20151223.proj.02.depths.sql',1556231697,15239),('phabricator:20151223.proj.03.pathkey.sql',1556231697,9414),('phabricator:20151223.proj.04.keycol.sql',1556231697,16788),('phabricator:20151223.proj.05.updatekeys.php',1556231697,483),('phabricator:20151223.proj.06.uniq.sql',1556231697,10101),('phabricator:20151226.reop.1.sql',1556231697,12605),('phabricator:20151227.proj.01.materialize.sql',1556231697,586),('phabricator:20151231.proj.01.icon.php',1556231697,2511),('phabricator:20160102.badges.award.sql',1556231697,6329),('phabricator:20160110.repo.01.slug.sql',1556231697,20421),('phabricator:20160110.repo.02.slug.php',1556231697,678),('phabricator:20160111.repo.01.slugx.sql',1556231697,1338),('phabricator:20160112.repo.01.uri.sql',1556231697,5759),('phabricator:20160112.repo.02.uri.index.php',1556231697,105),('phabricator:20160113.propanel.1.storage.sql',1556231697,6417),('phabricator:20160113.propanel.2.xaction.sql',1556231697,7222),('phabricator:20160119.project.1.silence.sql',1556231697,547),('phabricator:20160122.project.1.boarddefault.php',1556231697,759),('phabricator:20160124.people.1.icon.sql',1556231697,10389),('phabricator:20160124.people.2.icondefault.sql',1556231697,597),('phabricator:20160128.repo.1.pull.sql',1556231697,6188),('phabricator:20160201.revision.properties.1.sql',1556231697,13671),('phabricator:20160201.revision.properties.2.sql',1556231697,582),('phabricator:20160202.board.1.proxy.sql',1556231697,11473),('phabricator:20160202.ipv6.1.sql',1556231697,29431),('phabricator:20160202.ipv6.2.php',1556231697,1039),('phabricator:20160206.cover.1.sql',1556231697,16645),('phabricator:20160208.task.1.sql',1556231697,17354),('phabricator:20160208.task.2.sql',1556231697,28687),('phabricator:20160208.task.3.sql',1556231697,21722),('phabricator:20160212.proj.1.sql',1556231697,18838),('phabricator:20160212.proj.2.sql',1556231697,682),('phabricator:20160215.owners.policy.1.sql',1556231698,13159),('phabricator:20160215.owners.policy.2.sql',1556231698,13532),('phabricator:20160215.owners.policy.3.sql',1556231698,781),('phabricator:20160215.owners.policy.4.sql',1556231698,575),('phabricator:20160218.callsigns.1.sql',1556231698,18754),('phabricator:20160221.almanac.1.devicen.sql',1556231698,5402),('phabricator:20160221.almanac.2.devicei.php',1556231698,86),('phabricator:20160221.almanac.3.servicen.sql',1556231698,5514),('phabricator:20160221.almanac.4.servicei.php',1556231698,88),('phabricator:20160221.almanac.5.networkn.sql',1556231698,5797),('phabricator:20160221.almanac.6.networki.php',1556231698,98),('phabricator:20160221.almanac.7.namespacen.sql',1556231698,6222),('phabricator:20160221.almanac.8.namespace.sql',1556231698,6967),('phabricator:20160221.almanac.9.namespacex.sql',1556231698,6258),('phabricator:20160222.almanac.1.properties.php',1556231698,1785),('phabricator:20160223.almanac.1.bound.sql',1556231698,12636),('phabricator:20160223.almanac.2.lockbind.sql',1556231698,555),('phabricator:20160223.almanac.3.devicelock.sql',1556231698,12370),('phabricator:20160223.almanac.4.servicelock.sql',1556231698,12403),('phabricator:20160223.paste.fileedges.php',1556231698,563),('phabricator:20160225.almanac.1.disablebinding.sql',1556231698,13239),('phabricator:20160225.almanac.2.stype.sql',1556231698,5306),('phabricator:20160225.almanac.3.stype.php',1556231698,854),('phabricator:20160227.harbormaster.1.plann.sql',1556231698,5517),('phabricator:20160227.harbormaster.2.plani.php',1556231698,85),('phabricator:20160303.drydock.1.bluen.sql',1556231698,5916),('phabricator:20160303.drydock.2.bluei.php',1556231698,84),('phabricator:20160303.drydock.3.edge.sql',1556231698,9299),('phabricator:20160308.nuance.01.disabled.sql',1556231698,11938),('phabricator:20160308.nuance.02.cursordata.sql',1556231698,5933),('phabricator:20160308.nuance.03.sourcen.sql',1556231698,5421),('phabricator:20160308.nuance.04.sourcei.php',1556231698,84),('phabricator:20160308.nuance.05.sourcename.sql',1556231698,14051),('phabricator:20160308.nuance.06.label.sql',1556231698,14773),('phabricator:20160308.nuance.07.itemtype.sql',1556231698,12745),('phabricator:20160308.nuance.08.itemkey.sql',1556231698,12490),('phabricator:20160308.nuance.09.itemcontainer.sql',1556231698,14099),('phabricator:20160308.nuance.10.itemkeyu.sql',1556231698,525),('phabricator:20160308.nuance.11.requestor.sql',1556231698,16661),('phabricator:20160308.nuance.12.queue.sql',1556231698,12884),('phabricator:20160316.lfs.01.token.resource.sql',1556231698,14175),('phabricator:20160316.lfs.02.token.user.sql',1556231698,10063),('phabricator:20160316.lfs.03.token.properties.sql',1556231698,10329),('phabricator:20160316.lfs.04.token.default.sql',1556231698,508),('phabricator:20160317.lfs.01.ref.sql',1556231698,5342),('phabricator:20160321.nuance.01.taskbridge.sql',1556231698,17760),('phabricator:20160322.nuance.01.itemcommand.sql',1556231698,4975),('phabricator:20160323.badgemigrate.sql',1556231698,1649),('phabricator:20160329.nuance.01.requestor.sql',1556231698,3782),('phabricator:20160329.nuance.02.requestorsource.sql',1556231698,4055),('phabricator:20160329.nuance.03.requestorxaction.sql',1556231698,4785),('phabricator:20160329.nuance.04.requestorcomment.sql',1556231698,4420),('phabricator:20160330.badges.migratequality.sql',1556231698,15822),('phabricator:20160330.badges.qualityxaction.mig.sql',1556231698,2799),('phabricator:20160331.fund.comments.1.sql',1556231698,6871),('phabricator:20160404.oauth.1.xaction.sql',1556231698,6721),('phabricator:20160405.oauth.2.disable.sql',1556231698,10930),('phabricator:20160406.badges.ngrams.php',1556231698,97),('phabricator:20160406.badges.ngrams.sql',1556231698,6525),('phabricator:20160406.columns.1.php',1556231698,500),('phabricator:20160411.repo.1.version.sql',1556231698,5519),('phabricator:20160418.repouri.1.sql',1556231698,6074),('phabricator:20160418.repouri.2.sql',1556231698,11525),('phabricator:20160418.repoversion.1.sql',1556231698,10689),('phabricator:20160419.pushlog.1.sql',1556231698,14353),('phabricator:20160424.locks.1.sql',1556231698,10204),('phabricator:20160426.searchedge.sql',1556231698,9947),('phabricator:20160428.repo.1.urixaction.sql',1556231698,7021),('phabricator:20160503.repo.01.lpath.sql',1556231698,13307),('phabricator:20160503.repo.02.lpathkey.sql',1556231698,8490),('phabricator:20160503.repo.03.lpathmigrate.php',1556231698,504),('phabricator:20160503.repo.04.mirrormigrate.php',1556231698,850),('phabricator:20160503.repo.05.urimigrate.php',1556231698,424),('phabricator:20160510.repo.01.uriindex.php',1556231698,4595),('phabricator:20160513.owners.01.autoreview.sql',1556231698,10941),('phabricator:20160513.owners.02.autoreviewnone.sql',1556231698,564),('phabricator:20160516.owners.01.dominion.sql',1556231698,10783),('phabricator:20160516.owners.02.dominionstrong.sql',1556231698,572),('phabricator:20160517.oauth.01.edge.sql',1556231698,10687),('phabricator:20160518.ssh.01.activecol.sql',1556231698,10789),('phabricator:20160518.ssh.02.activeval.sql',1556231698,581),('phabricator:20160518.ssh.03.activekey.sql',1556231698,6783),('phabricator:20160519.ssh.01.xaction.sql',1556231698,6533),('phabricator:20160531.pref.01.xaction.sql',1556231698,7117),('phabricator:20160531.pref.02.datecreatecol.sql',1556231698,9742),('phabricator:20160531.pref.03.datemodcol.sql',1556231698,9161),('phabricator:20160531.pref.04.datecreateval.sql',1556231698,581),('phabricator:20160531.pref.05.datemodval.sql',1556231698,500),('phabricator:20160531.pref.06.phidcol.sql',1556231698,9802),('phabricator:20160531.pref.07.phidval.php',1556231698,812),('phabricator:20160601.user.01.cache.sql',1556231698,7441),('phabricator:20160601.user.02.copyprefs.php',1556231698,1761),('phabricator:20160601.user.03.removetime.sql',1556231698,15650),('phabricator:20160601.user.04.removetranslation.sql',1556231698,15109),('phabricator:20160601.user.05.removesex.sql',1556231698,14245),('phabricator:20160603.user.01.removedcenabled.sql',1556231698,13434),('phabricator:20160603.user.02.removedctab.sql',1556231698,14889),('phabricator:20160603.user.03.removedcvisible.sql',1556231698,14290),('phabricator:20160604.user.01.stringmailprefs.php',1556231698,605),('phabricator:20160604.user.02.removeimagecache.sql',1556231698,13598),('phabricator:20160605.user.01.prefnulluser.sql',1556231698,13603),('phabricator:20160605.user.02.prefbuiltin.sql',1556231698,9726),('phabricator:20160605.user.03.builtinunique.sql',1556231698,5808),('phabricator:20160616.phame.blog.header.1.sql',1556231698,10765),('phabricator:20160616.repo.01.oldref.sql',1556231698,5571),('phabricator:20160617.harbormaster.01.arelease.sql',1556231698,11995),('phabricator:20160618.phame.blog.subtitle.sql',1556231698,11187),('phabricator:20160620.phame.blog.parentdomain.2.sql',1556231698,11609),('phabricator:20160620.phame.blog.parentsite.1.sql',1556231698,13040),('phabricator:20160623.phame.blog.fulldomain.1.sql',1556231698,12008),('phabricator:20160623.phame.blog.fulldomain.2.sql',1556231698,564),('phabricator:20160623.phame.blog.fulldomain.3.sql',1556231698,1211),('phabricator:20160706.phame.blog.parentdomain.2.sql',1556231698,12418),('phabricator:20160706.phame.blog.parentsite.1.sql',1556231699,13036),('phabricator:20160707.calendar.01.stub.sql',1556231699,12754),('phabricator:20160711.files.01.builtin.sql',1556231699,15129),('phabricator:20160711.files.02.builtinkey.sql',1556231699,8836),('phabricator:20160713.event.01.host.sql',1556231699,15511),('phabricator:20160715.event.01.alldayfrom.sql',1556231699,14131),('phabricator:20160715.event.02.alldayto.sql',1556231699,12699),('phabricator:20160715.event.03.allday.php',1556231699,86),('phabricator:20160720.calendar.invitetxn.php',1556231699,1319),('phabricator:20160721.pack.01.pub.sql',1556231699,5812),('phabricator:20160721.pack.02.pubxaction.sql',1556231699,6139),('phabricator:20160721.pack.03.edge.sql',1556231699,10806),('phabricator:20160721.pack.04.pkg.sql',1556231699,6295),('phabricator:20160721.pack.05.pkgxaction.sql',1556231699,6625),('phabricator:20160721.pack.06.version.sql',1556231699,5517),('phabricator:20160721.pack.07.versionxaction.sql',1556231699,6541),('phabricator:20160722.pack.01.pubngrams.sql',1556231699,5991),('phabricator:20160722.pack.02.pkgngrams.sql',1556231699,6165),('phabricator:20160722.pack.03.versionngrams.sql',1556231699,5845),('phabricator:20160810.commit.01.summarylength.sql',1556231699,16647),('phabricator:20160824.connectionlog.sql',1556231699,3624),('phabricator:20160824.repohint.01.hint.sql',1556231699,5880),('phabricator:20160824.repohint.02.movebad.php',1556231699,610),('phabricator:20160824.repohint.03.nukebad.sql',1556231699,3549),('phabricator:20160825.ponder.sql',1556231699,635),('phabricator:20160829.pastebin.01.language.sql',1556231699,16331),('phabricator:20160829.pastebin.02.language.sql',1556231699,560),('phabricator:20160913.conpherence.topic.1.sql',1556231699,11148),('phabricator:20160919.repo.messagecount.sql',1556231699,10883),('phabricator:20160919.repo.messagedefault.sql',1556231699,3870),('phabricator:20160921.fileexternalrequest.sql',1556231699,6461),('phabricator:20160927.phurl.ngrams.php',1556231699,88),('phabricator:20160927.phurl.ngrams.sql',1556231699,5450),('phabricator:20160928.repo.messagecount.sql',1556231699,513),('phabricator:20160928.tokentoken.sql',1556231699,7220),('phabricator:20161003.cal.01.utcepoch.sql',1556231699,39888),('phabricator:20161003.cal.02.parameters.sql',1556231699,13545),('phabricator:20161004.cal.01.noepoch.php',1556231699,1824),('phabricator:20161005.cal.01.rrules.php',1556231699,313),('phabricator:20161005.cal.02.export.sql',1556231699,6093),('phabricator:20161005.cal.03.exportxaction.sql',1556231699,6495),('phabricator:20161005.conpherence.image.1.sql',1556231699,12059),('phabricator:20161005.conpherence.image.2.php',1556231699,85),('phabricator:20161011.conpherence.ngrams.php',1556231699,65),('phabricator:20161011.conpherence.ngrams.sql',1556231699,5332),('phabricator:20161012.cal.01.import.sql',1556231699,6181),('phabricator:20161012.cal.02.importxaction.sql',1556231699,6973),('phabricator:20161012.cal.03.eventimport.sql',1556231699,52644),('phabricator:20161013.cal.01.importlog.sql',1556231699,5063),('phabricator:20161016.conpherence.imagephids.sql',1556231699,10859),('phabricator:20161025.phortune.contact.1.sql',1556231699,9620),('phabricator:20161025.phortune.merchant.image.1.sql',1556231699,11081),('phabricator:20161026.calendar.01.importtriggers.sql',1556231699,23297),('phabricator:20161027.calendar.01.externalinvitee.sql',1556231699,5726),('phabricator:20161029.phortune.invoice.1.sql',1556231699,20493),('phabricator:20161031.calendar.01.seriesparent.sql',1556231699,13938),('phabricator:20161031.calendar.02.notifylog.sql',1556231699,5033),('phabricator:20161101.calendar.01.noholiday.sql',1556231699,3280),('phabricator:20161101.calendar.02.removecolumns.sql',1556231699,78114),('phabricator:20161104.calendar.01.availability.sql',1556231699,11128),('phabricator:20161104.calendar.02.availdefault.sql',1556231699,550),('phabricator:20161115.phamepost.01.subtitle.sql',1556231699,11909),('phabricator:20161115.phamepost.02.header.sql',1556231699,13239),('phabricator:20161121.cluster.01.hoststate.sql',1556231699,4824),('phabricator:20161124.search.01.stopwords.sql',1556231699,4622),('phabricator:20161125.search.01.stemmed.sql',1556231699,7243),('phabricator:20161130.search.01.manual.sql',1556231699,5811),('phabricator:20161130.search.02.rebuild.php',1556231699,1398),('phabricator:20161210.dashboards.01.author.sql',1556231699,11083),('phabricator:20161210.dashboards.02.author.php',1556231699,1611),('phabricator:20161211.menu.01.itemkey.sql',1556231699,4255),('phabricator:20161211.menu.02.itemprops.sql',1556231699,3566),('phabricator:20161211.menu.03.order.sql',1556231699,3844),('phabricator:20161212.dashboardpanel.01.author.sql',1556231699,10207),('phabricator:20161212.dashboardpanel.02.author.php',1556231699,836),('phabricator:20161212.dashboards.01.icon.sql',1556231699,11227),('phabricator:20161213.diff.01.hunks.php',1556231699,747),('phabricator:20161216.dashboard.ngram.01.sql',1556231699,10936),('phabricator:20161216.dashboard.ngram.02.php',1556231699,114),('phabricator:20170106.menu.01.customphd.sql',1556231699,10393),('phabricator:20170109.diff.01.commit.sql',1556231699,12971),('phabricator:20170119.menuitem.motivator.01.php',1556231699,407),('phabricator:20170131.dashboard.personal.01.php',1556231699,1445),('phabricator:20170301.subtype.01.col.sql',1556231699,12251),('phabricator:20170301.subtype.02.default.sql',1556231699,687),('phabricator:20170301.subtype.03.taskcol.sql',1556231699,17435),('phabricator:20170301.subtype.04.taskdefault.sql',1556231699,554),('phabricator:20170303.people.01.avatar.sql',1556231699,27615),('phabricator:20170313.reviewers.01.sql',1556231699,5349),('phabricator:20170316.rawfiles.01.php',1556231699,1720),('phabricator:20170320.reviewers.01.lastaction.sql',1556231699,11553),('phabricator:20170320.reviewers.02.lastcomment.sql',1556231699,10266),('phabricator:20170320.reviewers.03.migrate.php',1556231699,1127),('phabricator:20170322.reviewers.04.actor.sql',1556231699,10051),('phabricator:20170328.reviewers.01.void.sql',1556231699,11143),('phabricator:20170404.files.retroactive-content-hash.sql',1556231699,19835),('phabricator:20170406.hmac.01.keystore.sql',1556231699,5350),('phabricator:20170410.calendar.01.repair.php',1556231699,576),('phabricator:20170412.conpherence.01.picturecrop.sql',1556231699,499),('phabricator:20170413.conpherence.01.recentparty.sql',1556231700,11833),('phabricator:20170417.files.ngrams.sql',1556231700,5606),('phabricator:20170418.1.application.01.xaction.sql',1556231700,6959),('phabricator:20170418.1.application.02.edge.sql',1556231700,9907),('phabricator:20170418.files.isDeleted.sql',1556231700,16731),('phabricator:20170419.app.01.table.sql',1556231700,5395),('phabricator:20170419.thread.01.behind.sql',1556231700,11820),('phabricator:20170419.thread.02.status.sql',1556231700,11320),('phabricator:20170419.thread.03.touched.sql',1556231700,12098),('phabricator:20170424.user.01.verify.php',1556231700,450),('phabricator:20170427.owners.01.long.sql',1556231700,10936),('phabricator:20170504.1.slowvote.shuffle.sql',1556231700,13917),('phabricator:20170522.nuance.01.itemkey.sql',1556231700,13967),('phabricator:20170524.nuance.01.command.sql',1556231700,29175),('phabricator:20170524.nuance.02.commandstatus.sql',1556231700,10499),('phabricator:20170526.dropdifferentialdrafts.sql',1556231700,4528),('phabricator:20170526.milestones.php',1556231700,82),('phabricator:20170528.maniphestdupes.php',1556231700,407),('phabricator:20170612.repository.image.01.sql',1556231700,14513),('phabricator:20170614.taskstatus.sql',1556231700,22946),('phabricator:20170725.legalpad.date.01.sql',1556231700,1121),('phabricator:20170811.differential.01.status.php',1556231700,436),('phabricator:20170811.differential.02.modernstatus.sql',1556231700,1112),('phabricator:20170811.differential.03.modernxaction.php',1556231700,946),('phabricator:20170814.search.01.qconfig.sql',1556231700,5484),('phabricator:20170820.phame.01.post.views.sql',1556231700,12773),('phabricator:20170820.phame.02.post.views.sql',1556231700,492),('phabricator:20170824.search.01.saved.php',1556231700,1093),('phabricator:20170825.phame.01.post.views.sql',1556231700,14383),('phabricator:20170828.ferret.01.taskdoc.sql',1556231700,4720),('phabricator:20170828.ferret.02.taskfield.sql',1556231700,4430),('phabricator:20170828.ferret.03.taskngrams.sql',1556231700,4459),('phabricator:20170830.ferret.01.unique.sql',1556231700,11567),('phabricator:20170830.ferret.02.term.sql',1556231700,10544),('phabricator:20170905.ferret.01.diff.doc.sql',1556231700,4638),('phabricator:20170905.ferret.02.diff.field.sql',1556231700,4380),('phabricator:20170905.ferret.03.diff.ngrams.sql',1556231700,4849),('phabricator:20170907.ferret.01.user.doc.sql',1556231700,4719),('phabricator:20170907.ferret.02.user.field.sql',1556231700,4741),('phabricator:20170907.ferret.03.user.ngrams.sql',1556231700,4472),('phabricator:20170907.ferret.04.fund.doc.sql',1556231700,6308),('phabricator:20170907.ferret.05.fund.field.sql',1556231700,4669),('phabricator:20170907.ferret.06.fund.ngrams.sql',1556231700,4853),('phabricator:20170907.ferret.07.passphrase.doc.sql',1556231700,4554),('phabricator:20170907.ferret.08.passphrase.field.sql',1556231700,5115),('phabricator:20170907.ferret.09.passphrase.ngrams.sql',1556231700,4083),('phabricator:20170907.ferret.10.owners.doc.sql',1556231700,4723),('phabricator:20170907.ferret.11.owners.field.sql',1556231700,5061),('phabricator:20170907.ferret.12.owners.ngrams.sql',1556231700,4786),('phabricator:20170907.ferret.13.blog.doc.sql',1556231700,4252),('phabricator:20170907.ferret.14.blog.field.sql',1556231700,4923),('phabricator:20170907.ferret.15.blog.ngrams.sql',1556231700,4231),('phabricator:20170907.ferret.16.post.doc.sql',1556231700,4741),('phabricator:20170907.ferret.17.post.field.sql',1556231700,4888),('phabricator:20170907.ferret.18.post.ngrams.sql',1556231700,5208),('phabricator:20170907.ferret.19.project.doc.sql',1556231700,4908),('phabricator:20170907.ferret.20.project.field.sql',1556231700,5022),('phabricator:20170907.ferret.21.project.ngrams.sql',1556231700,4594),('phabricator:20170907.ferret.22.phriction.doc.sql',1556231700,4889),('phabricator:20170907.ferret.23.phriction.field.sql',1556231700,4387),('phabricator:20170907.ferret.24.phriction.ngrams.sql',1556231700,4437),('phabricator:20170907.ferret.25.event.doc.sql',1556231700,5550),('phabricator:20170907.ferret.26.event.field.sql',1556231700,4987),('phabricator:20170907.ferret.27.event.ngrams.sql',1556231700,4139),('phabricator:20170907.ferret.28.mock.doc.sql',1556231700,5204),('phabricator:20170907.ferret.29.mock.field.sql',1556231700,4481),('phabricator:20170907.ferret.30.mock.ngrams.sql',1556231700,4263),('phabricator:20170907.ferret.31.repo.doc.sql',1556231700,4498),('phabricator:20170907.ferret.32.repo.field.sql',1556231700,5632),('phabricator:20170907.ferret.33.repo.ngrams.sql',1556231700,4712),('phabricator:20170907.ferret.34.commit.doc.sql',1556231700,5410),('phabricator:20170907.ferret.35.commit.field.sql',1556231700,4832),('phabricator:20170907.ferret.36.commit.ngrams.sql',1556231700,4997),('phabricator:20170912.ferret.01.activity.php',1556231700,358),('phabricator:20170914.ref.01.position.sql',1556231700,4702),('phabricator:20170915.ref.01.migrate.php',1556231700,735),('phabricator:20170915.ref.02.drop.id.sql',1556231700,11053),('phabricator:20170915.ref.03.drop.closed.sql',1556231700,10493),('phabricator:20170915.ref.04.uniq.sql',1556231700,6301),('phabricator:20170918.ref.01.position.php',1556231700,6814),('phabricator:20171002.cngram.01.maniphest.sql',1556231700,6208),('phabricator:20171002.cngram.02.event.sql',1556231700,6453),('phabricator:20171002.cngram.03.revision.sql',1556231700,5686),('phabricator:20171002.cngram.04.fund.sql',1556231700,5388),('phabricator:20171002.cngram.05.owners.sql',1556231700,5625),('phabricator:20171002.cngram.06.passphrase.sql',1556231700,6665),('phabricator:20171002.cngram.07.blog.sql',1556231700,5687),('phabricator:20171002.cngram.08.post.sql',1556231700,5555),('phabricator:20171002.cngram.09.pholio.sql',1556231700,5669),('phabricator:20171002.cngram.10.phriction.sql',1556231700,5644),('phabricator:20171002.cngram.11.project.sql',1556231700,5239),('phabricator:20171002.cngram.12.user.sql',1556231700,6475),('phabricator:20171002.cngram.13.repository.sql',1556231700,5340),('phabricator:20171002.cngram.14.commit.sql',1556231700,5519),('phabricator:20171026.ferret.01.ponder.doc.sql',1556231700,4734),('phabricator:20171026.ferret.02.ponder.field.sql',1556231700,4312),('phabricator:20171026.ferret.03.ponder.ngrams.sql',1556231700,4486),('phabricator:20171026.ferret.04.ponder.cngrams.sql',1556231700,6303),('phabricator:20171026.ferret.05.ponder.index.php',1556231700,111),('phabricator:20171101.diff.01.active.sql',1556231700,13157),('phabricator:20171101.diff.02.populate.php',1556231700,466),('phabricator:20180119.bulk.01.silent.sql',1556231700,12179),('phabricator:20180120.auth.01.password.sql',1556231700,5465),('phabricator:20180120.auth.02.passwordxaction.sql',1556231700,7117),('phabricator:20180120.auth.03.vcsdata.sql',1556231700,1196),('phabricator:20180120.auth.04.vcsphid.php',1556231700,751),('phabricator:20180121.auth.01.vcsnuke.sql',1556231700,3980),('phabricator:20180121.auth.02.passsalt.sql',1556231700,9066),('phabricator:20180121.auth.03.accountdata.sql',1556231700,607),('phabricator:20180121.auth.04.accountphid.php',1556231700,431),('phabricator:20180121.auth.05.accountnuke.sql',1556231700,29120),('phabricator:20180121.auth.06.legacydigest.sql',1556231700,9699),('phabricator:20180121.auth.07.marklegacy.sql',1556231700,567),('phabricator:20180124.herald.01.repetition.sql',1556231700,17664),('phabricator:20180207.mail.01.task.sql',1556231700,18090),('phabricator:20180207.mail.02.revision.sql',1556231700,13051),('phabricator:20180207.mail.03.mock.sql',1556231700,11482),('phabricator:20180208.maniphest.01.close.sql',1556231700,34873),('phabricator:20180208.maniphest.02.populate.php',1556231700,494),('phabricator:20180209.hook.01.hook.sql',1556231700,5084),('phabricator:20180209.hook.02.hookxaction.sql',1556231700,6844),('phabricator:20180209.hook.03.hookrequest.sql',1556231700,4822),('phabricator:20180210.hunk.01.droplegacy.sql',1556231700,4058),('phabricator:20180210.hunk.02.renamemodern.sql',1556231700,4436),('phabricator:20180212.harbor.01.receiver.sql',1556231700,14179),('phabricator:20180214.harbor.01.aborted.php',1556231700,902),('phabricator:20180215.phriction.01.phidcol.sql',1556231701,12098),('phabricator:20180215.phriction.02.phidvalues.php',1556231701,643),('phabricator:20180215.phriction.03.descempty.sql',1556231701,535),('phabricator:20180215.phriction.04.descnull.sql',1556231701,14930),('phabricator:20180215.phriction.05.statustext.sql',1556231701,15691),('phabricator:20180215.phriction.06.statusvalue.sql',1556231701,904),('phabricator:20180218.fact.01.dim.key.sql',1556231701,5182),('phabricator:20180218.fact.02.dim.obj.sql',1556231701,4795),('phabricator:20180218.fact.03.data.int.sql',1556231701,4788),('phabricator:20180222.log.01.filephid.sql',1556231701,12884),('phabricator:20180223.log.01.bytelength.sql',1556231701,11783),('phabricator:20180223.log.02.chunkformat.sql',1556231701,10735),('phabricator:20180223.log.03.chunkdefault.sql',1556231701,508),('phabricator:20180223.log.04.linemap.sql',1556231701,12025),('phabricator:20180223.log.05.linemapdefault.sql',1556231701,597),('phabricator:20180228.log.01.offset.sql',1556231701,20084),('phabricator:20180305.lock.01.locklog.sql',1556231701,4480),('phabricator:20180306.opath.01.digest.sql',1556231701,11285),('phabricator:20180306.opath.02.digestpopulate.php',1556231701,636),('phabricator:20180306.opath.03.purge.php',1556231701,422),('phabricator:20180306.opath.04.unique.sql',1556231701,6155),('phabricator:20180306.opath.05.longpath.sql',1556231701,12989),('phabricator:20180306.opath.06.pathdisplay.sql',1556231701,10854),('phabricator:20180306.opath.07.copypaths.sql',1556231701,667),('phabricator:20180309.owners.01.primaryowner.sql',1556231701,12220),('phabricator:20180312.reviewers.01.options.sql',1556231701,10529),('phabricator:20180312.reviewers.02.optionsdefault.sql',1556231701,514),('phabricator:20180322.lock.01.identifier.sql',1556231701,18925),('phabricator:20180322.lock.02.wait.sql',1556231701,35843),('phabricator:20180326.lock.03.nonunique.sql',1556231701,5998),('phabricator:20180403.draft.01.broadcast.php',1556231701,689),('phabricator:20180410.almanac.01.iface.xaction.sql',1556231701,6457),('phabricator:20180418.alamanc.interface.unique.php',1556231701,8603),('phabricator:20180418.almanac.network.unique.php',1556231701,6736),('phabricator:20180419.phlux.edges.sql',1556231701,10016),('phabricator:20180423.mail.01.properties.sql',1556231701,5352),('phabricator:20180430.repo_identity.sql',1556231701,6953),('phabricator:20180504.owners.01.mailkey.php',1556231701,613),('phabricator:20180504.owners.02.rmkey.sql',1556231701,10972),('phabricator:20180504.owners.03.properties.sql',1556231701,11898),('phabricator:20180504.owners.04.default.sql',1556231701,626),('phabricator:20180504.repo_identity.author.sql',1556231701,11039),('phabricator:20180504.repo_identity.xaction.sql',1556231701,7323),('phabricator:20180509.repo_identity.commits.sql',1556231701,13684),('phabricator:20180730.phriction.01.spaces.sql',1556231701,12193),('phabricator:20180730.project.01.spaces.sql',1556231701,16504),('phabricator:20180809.repo_identities.activity.php',1556231701,412),('phabricator:20180827.drydock.01.acquired.sql',1556231701,11934),('phabricator:20180827.drydock.02.activated.sql',1556231701,10516),('phabricator:20180828.phriction.01.contentphid.sql',1556231701,12373),('phabricator:20180828.phriction.02.documentphid.sql',1556231701,12991),('phabricator:20180828.phriction.03.editedepoch.sql',1556231701,12601),('phabricator:20180828.phriction.04.migrate.php',1556231701,612),('phabricator:20180828.phriction.05.contentid.sql',1556231701,11315),('phabricator:20180828.phriction.06.c.documentid.php',1556231701,4931),('phabricator:20180828.phriction.06.documentid.sql',1556231701,12630),('phabricator:20180828.phriction.07.c.documentuniq.sql',1556231701,539),('phabricator:20180828.phriction.07.documentkey.sql',1556231701,6810),('phabricator:20180829.phriction.01.mailkey.php',1556231701,454),('phabricator:20180829.phriction.02.rmkey.sql',1556231701,12074),('phabricator:20180830.phriction.01.maxversion.sql',1556231701,12437),('phabricator:20180830.phriction.02.maxes.php',1556231701,429),('phabricator:20180910.audit.01.searches.php',1556231701,358),('phabricator:20180910.audit.02.string.sql',1556231701,27220),('phabricator:20180910.audit.03.status.php',1556231701,1070),('phabricator:20180910.audit.04.xactions.php',1556231701,1835),('phabricator:20180914.audit.01.mailkey.php',1556231701,501),('phabricator:20180914.audit.02.rmkey.sql',1556231701,15907),('phabricator:20180914.drydock.01.operationphid.sql',1556231701,11675),('phabricator:20181024.drydock.01.commandprops.sql',1556231701,10537),('phabricator:20181024.drydock.02.commanddefaults.sql',1556231701,562),('phabricator:20181031.board.01.queryreset.php',1556231701,2252),('phabricator:20181106.repo.01.sync.sql',1556231701,5414),('phabricator:20181106.repo.02.hook.sql',1556231701,10859),('phabricator:20181213.auth.01.sessionphid.sql',1556231701,11625),('phabricator:20181213.auth.02.populatephid.php',1556231701,418),('phabricator:20181213.auth.03.phidkey.sql',1556231701,8125),('phabricator:20181213.auth.04.longerhashes.sql',1556231701,15735),('phabricator:20181213.auth.05.longerloghashes.sql',1556231701,17050),('phabricator:20181213.auth.06.challenge.sql',1556231701,5795),('phabricator:20181214.auth.01.workflowkey.sql',1556231701,9956),('phabricator:20181217.auth.01.digest.sql',1556231701,10408),('phabricator:20181217.auth.02.ttl.sql',1556231701,10154),('phabricator:20181217.auth.03.completed.sql',1556231701,10782),('phabricator:20181218.pholio.01.imageauthor.sql',1556231701,11427),('phabricator:20181219.pholio.01.imagephid.sql',1556231701,11379),('phabricator:20181219.pholio.02.imagemigrate.php',1556231701,707),('phabricator:20181219.pholio.03.imageid.sql',1556231701,11959),('phabricator:20181220.pholio.01.mailkey.php',1556231701,444),('phabricator:20181220.pholio.02.dropmailkey.sql',1556231701,11687),('phabricator:20181228.auth.01.provider.sql',1556231701,4634),('phabricator:20181228.auth.02.xaction.sql',1556231701,6313),('phabricator:20181228.auth.03.name.sql',1556231701,10666),('phabricator:20190101.sms.01.drop.sql',1556231701,4467),('phabricator:20190115.mfa.01.provider.sql',1556231701,11158),('phabricator:20190115.mfa.02.migrate.php',1556231701,974),('phabricator:20190115.mfa.03.factorkey.sql',1556231701,10875),('phabricator:20190116.contact.01.number.sql',1556231701,5635),('phabricator:20190116.contact.02.xaction.sql',1556231701,6947),('phabricator:20190116.phortune.01.billing.sql',1556231701,9904),('phabricator:20190117.authmessage.01.message.sql',1556231701,4988),('phabricator:20190117.authmessage.02.xaction.sql',1556231701,6637),('phabricator:20190121.contact.01.primary.sql',1556231701,11548),('phabricator:20190127.project.01.subtype.sql',1556231701,17416),('phabricator:20190127.project.02.default.sql',1556231701,555),('phabricator:20190129.project.01.spaces.php',1556231701,406),('phabricator:20190206.external.01.legalpad.sql',1556231701,485),('phabricator:20190206.external.02.email.sql',1556231701,524),('phabricator:20190206.external.03.providerphid.sql',1556231701,13239),('phabricator:20190206.external.04.providerlink.php',1556231701,698),('phabricator:20190207.packages.01.state.sql',1556231702,10942),('phabricator:20190207.packages.02.migrate.sql',1556231702,565),('phabricator:20190207.packages.03.drop.sql',1556231702,11126),('phabricator:20190207.packages.04.xactions.php',1556231702,1229),('phabricator:20190215.daemons.01.dropdataid.php',1556231702,5352),('phabricator:20190215.daemons.02.nulldataid.sql',1556231702,13353),('phabricator:20190215.harbor.01.stringindex.sql',1556231702,5418),('phabricator:20190215.harbor.02.stringcol.sql',1556231702,10942),('phabricator:20190220.daemon_worker.completed.01.sql',1556231702,12323),('phabricator:20190220.daemon_worker.completed.02.sql',1556231702,12844),('phabricator:20190226.harbor.01.planprops.sql',1556231702,10963),('phabricator:20190226.harbor.02.planvalue.sql',1556231702,644),('phabricator:20190307.herald.01.comments.sql',1556231702,4292),('phabricator:20190312.triggers.01.trigger.sql',1556231702,5749),('phabricator:20190312.triggers.02.xaction.sql',1556231702,7189),('phabricator:20190312.triggers.03.triggerphid.sql',1556231702,12671),('phabricator:20190322.triggers.01.usage.sql',1556231702,5436),('phabricator:20190329.portals.01.create.sql',1556231702,4633),('phabricator:20190329.portals.02.xaction.sql',1556231702,8280),('phabricator:20190410.portals.01.ferret.doc.sql',1556231702,5198),('phabricator:20190410.portals.02.ferret.field.sql',1556231702,4797),('phabricator:20190410.portals.03.ferret.ngrams.sql',1556231702,4275),('phabricator:20190410.portals.04.ferret.cngrams.sql',1556231702,5990),('phabricator:20190412.dashboard.01.panels.php',1556231702,453),('phabricator:20190412.dashboard.02.install.sql',1556231702,3768),('phabricator:20190412.dashboard.03.dashngrams.sql',1556231702,4706),('phabricator:20190412.dashboard.04.panelngrams.sql',1556231702,4492),('phabricator:20190412.dashboard.05.dferret.doc.sql',1556231702,4528),('phabricator:20190412.dashboard.06.dferret.field.sql',1556231702,5105),('phabricator:20190412.dashboard.07.dferret.ngrams.sql',1556231702,4069),('phabricator:20190412.dashboard.08.dferret.cngrams.sql',1556231702,5099),('phabricator:20190412.dashboard.09.pferret.doc.sql',1556231702,4827),('phabricator:20190412.dashboard.10.pferret.field.sql',1556231702,5374),('phabricator:20190412.dashboard.11.pferret.ngrams.sql',1556231702,5073),('phabricator:20190412.dashboard.12.pferret.cngrams.sql',1556231702,5528),('phabricator:20190412.dashboard.13.rebuild.php',1556231702,7019),('phabricator:20190412.herald.01.rebuild.php',1556231702,1878),('phabricator:20190416.chart.01.storage.sql',1556231702,4935),('phabricator:20190523.myisam.01.documentfield.sql',1790768757,1673),('phabricator:20190718.paste.01.edge.sql',1790768757,8996),('phabricator:20190718.paste.02.edgedata.sql',1790768757,1822),('phabricator:20190718.paste.03.paste.sql',1790768757,2581),('phabricator:20190718.paste.04.xaction.sql',1790768757,1527),('phabricator:20190718.paste.05.comment.sql',1790768757,1435),('phabricator:20190802.email.01.storage.sql',1790768757,3600),('phabricator:20190802.email.02.xaction.sql',1790768757,2890),('phabricator:20190815.account.01.carts.php',1790768757,5723),('phabricator:20190815.account.02.subscriptions.php',1790768757,746),('phabricator:20190816.payment.01.xaction.sql',1790768757,2367),('phabricator:20190816.subscription.01.xaction.sql',1790768757,2734),('phabricator:20190822.merchant.01.view.sql',1790768757,9498),('phabricator:20190909.herald.01.rebuild.php',1790768758,5912),('phabricator:20190924.diffusion.01.permanent.sql',1790768757,1658),('phabricator:20190924.diffusion.02.default.sql',1790768757,635),('phabricator:20191028.uriindex.01.rebuild.php',1790768758,783),('phabricator:20191113.identity.01.email.sql',1790768757,1097),('phabricator:20191113.identity.02.populate.php',1790768757,1548),('phabricator:20191113.identity.03.unassigned.sql',1790768757,445),('phabricator:20191114.email.01.phid.sql',1790768757,1202),('phabricator:20191114.email.02.populate.php',1790768757,1214),('phabricator:20200220.xaccount.01.sql',1790768757,1760),('phabricator:20200222.xident.01.migrate.php',1790768757,652),('phabricator:20200222.xident.02.dropkey.php',1790768757,3011),('phabricator:20200416.paste.01.ferret.doc.sql',1790768757,1691),('phabricator:20200416.paste.02.ferret.field.sql',1790768757,1858),('phabricator:20200416.paste.03.ferret.ngrams.sql',1790768757,1618),('phabricator:20200416.paste.04.ferret.cngrams.sql',1790768757,2835),('phabricator:20200417.viewstate.01.storage.sql',1790768757,1883),('phabricator:20200428.inline.01.differential.column.sql',1790768757,1133),('phabricator:20200428.inline.02.diffusion.column.sql',1790768757,1300),('phabricator:20200428.inline.03.differential.value.sql',1790768757,375),('phabricator:20200428.inline.04.diffusion.value.sql',1790768757,351),('phabricator:20200520.inline.01.remcache.sql',1790768757,3029),('phabricator:20200520.inline.02.addcache.sql',1790768757,1417),('phabricator:20200520.inline.03.dropcommit.sql',1790768757,1047),('phabricator:20210122.queuecontainer.01.sql',1790768757,1824),('phabricator:20210215.changeset.01.phid.sql',1790768757,773),('phabricator:20210215.changeset.02.phid-populate.php',1790768757,2506),('phabricator:20210216.index.01.version.sql',1790768757,828),('phabricator:20210216.index.02.epoch.sql',1790768757,1245),('phabricator:20210309.auditors.01.status.sql',1790768757,2301),('phabricator:20210315.affectedpath.01.epoch.sql',1790768757,4546),('phabricator:20210315.affectedpath.02.repositoryid.sql',1790768757,3429),('phabricator:20210316.almanac.01.device-mailkey.php',1790768757,1952),('phabricator:20210316.almanac.02.device-dropmailkey.sql',1790768757,1382),('phabricator:20210316.almanac.03.device-status.sql',1790768757,1959),('phabricator:20210316.almanac.04.device-status-value.sql',1790768757,357),('phabricator:20210316.almanac.05.service-mailkey.php',1790768757,548),('phabricator:20210316.almanac.06.service-dropmailkey.sql',1790768757,1157),('phabricator:20210316.almanac.07.binding-mailkey.php',1790768757,463),('phabricator:20210316.almanac.08.binding-dropmailkey.sql',1790768757,1491),('phabricator:20210316.almanac.09.namespace-mailkey.php',1790768757,486),('phabricator:20210316.almanac.10.namespace-dropmailkey.sql',1790768757,1085),('phabricator:20210316.almanac.11.network-mailkey.php',1790768757,396),('phabricator:20210316.almanac.12.network-dropmailkey.sql',1790768757,941),('phabricator:20210316.almanac.13.event-mailkey.php',1790768757,1755),('phabricator:20210316.almanac.14.event-dropmailkey.sql',1790768757,1651),('phabricator:20210316.almanac.15.intiative-mailkey.php',1790768758,1188),('phabricator:20210316.almanac.16.initiative-dropmailkey.sql',1790768758,1052),('phabricator:20210625.owners.01.authority.sql',1790768758,1059),('phabricator:20210625.owners.02.authority-default.sql',1790768758,313),('phabricator:20210713.harborcommand.01.migrate.sql',1790768758,922),('phabricator:20210713.harborcommand.02.drop.sql',1790768758,1375),('phabricator:20210715.harborcommand.01.xactions.php',1790768758,3325),('phabricator:20220401.phameinteract.01.sql',1790768758,7240),('phabricator:20220401.phameinteract.02.sql',1790768758,4118),('phabricator:20220401.phameinteract.03.sql',1790768758,1152),('phabricator:20220401.phameinteract.04.postinteract.sql',1790768758,1041),('phabricator:20220510.file.01.attach.sql',1790768758,1610),('phabricator:20220519.file.02.migrate.sql',1790768758,2342),('phabricator:20220525.slowvote.01.mailkey.php',1790768758,1189),('phabricator:20220525.slowvote.02.mailkey-drop.sql',1790768758,1133),('phabricator:20220525.slowvote.03.response-type.sql',1790768758,6839),('phabricator:20220525.slowvote.04.response-value.sql',1790768758,512),('phabricator:20220525.slowvote.05.response-xactions.sql',1790768758,1152),('phabricator:20220525.slowvote.06.method-type.sql',1790768758,5593),('phabricator:20220525.slowvote.07.method-value.sql',1790768758,437),('phabricator:20220525.slowvote.08.status-type.sql',1790768758,4646),('phabricator:20220525.slowvote.09.status-value.sql',1790768758,370),('phabricator:20220525.slowvote.10.status-xactions.sql',1790768758,481),('phabricator:daemonstatus.sql',1556231688,NULL),('phabricator:daemonstatuskey.sql',1556231689,NULL),('phabricator:daemontaskarchive.sql',1556231689,NULL),('phabricator:db.almanac',1556231684,NULL),('phabricator:db.application',1556231684,NULL),('phabricator:db.audit',1556231684,NULL),('phabricator:db.auth',1556231684,NULL),('phabricator:db.badges',1556231684,NULL),('phabricator:db.cache',1556231684,NULL),('phabricator:db.calendar',1556231684,NULL),('phabricator:db.chatlog',1556231684,NULL),('phabricator:db.conduit',1556231684,NULL),('phabricator:db.config',1556231684,NULL),('phabricator:db.conpherence',1556231684,NULL),('phabricator:db.countdown',1556231684,NULL),('phabricator:db.daemon',1556231684,NULL),('phabricator:db.dashboard',1556231684,NULL),('phabricator:db.differential',1556231684,NULL),('phabricator:db.diviner',1556231684,NULL),('phabricator:db.doorkeeper',1556231684,NULL),('phabricator:db.draft',1556231684,NULL),('phabricator:db.drydock',1556231684,NULL),('phabricator:db.fact',1556231684,NULL),('phabricator:db.feed',1556231684,NULL),('phabricator:db.file',1556231684,NULL),('phabricator:db.flag',1556231684,NULL),('phabricator:db.fund',1556231684,NULL),('phabricator:db.harbormaster',1556231684,NULL),('phabricator:db.herald',1556231684,NULL),('phabricator:db.legalpad',1556231684,NULL),('phabricator:db.maniphest',1556231684,NULL),('phabricator:db.meta_data',1556231684,NULL),('phabricator:db.metamta',1556231684,NULL),('phabricator:db.multimeter',1556231684,NULL),('phabricator:db.nuance',1556231684,NULL),('phabricator:db.oauth_server',1556231684,NULL),('phabricator:db.owners',1556231684,NULL),('phabricator:db.packages',1556231684,NULL),('phabricator:db.passphrase',1556231684,NULL),('phabricator:db.paste',1790768757,333),('phabricator:db.pastebin',1556231684,NULL),('phabricator:db.phame',1556231684,NULL),('phabricator:db.phlux',1556231684,NULL),('phabricator:db.pholio',1556231684,NULL),('phabricator:db.phortune',1556231684,NULL),('phabricator:db.phragment',1556231684,NULL),('phabricator:db.phrequent',1556231684,NULL),('phabricator:db.phriction',1556231684,NULL),('phabricator:db.phurl',1556231684,NULL),('phabricator:db.policy',1556231684,NULL),('phabricator:db.ponder',1556231684,NULL),('phabricator:db.project',1556231684,NULL),('phabricator:db.releeph',1556231684,NULL),('phabricator:db.repository',1556231684,NULL),('phabricator:db.search',1556231684,NULL),('phabricator:db.slowvote',1556231684,NULL),('phabricator:db.spaces',1556231684,NULL),('phabricator:db.system',1556231684,NULL),('phabricator:db.timeline',1556231684,NULL),('phabricator:db.token',1556231684,NULL),('phabricator:db.user',1556231684,NULL),('phabricator:db.worker',1556231684,NULL),('phabricator:db.xhpast',1556231684,NULL),('phabricator:db.xhpastview',1556231684,NULL),('phabricator:db.xhprof',1556231684,NULL),('phabricator:differentialbookmarks.sql',1556231688,NULL),('phabricator:draft-metadata.sql',1556231689,NULL),('phabricator:dropfileproxyimage.sql',1556231689,NULL),('phabricator:drydockresoucetype.sql',1556231689,NULL),('phabricator:drydocktaskid.sql',1556231689,NULL),('phabricator:edgetype.sql',1556231689,NULL),('phabricator:emailtable.sql',1556231688,NULL),('phabricator:emailtableport.sql',1556231688,NULL),('phabricator:emailtableremove.sql',1556231688,NULL),('phabricator:fact-raw.sql',1556231688,NULL),('phabricator:harbormasterobject.sql',1556231688,NULL),('phabricator:holidays.sql',1556231688,NULL),('phabricator:ldapinfo.sql',1556231688,NULL),('phabricator:legalpad-mailkey-populate.php',1556231690,NULL),('phabricator:legalpad-mailkey.sql',1556231690,NULL),('phabricator:liskcounters-task.sql',1556231689,NULL),('phabricator:liskcounters.php',1556231689,NULL),('phabricator:liskcounters.sql',1556231689,NULL),('phabricator:maniphestxcache.sql',1556231688,NULL),('phabricator:markupcache.sql',1556231688,NULL),('phabricator:migrate-differential-dependencies.php',1556231688,NULL),('phabricator:migrate-maniphest-dependencies.php',1556231688,NULL),('phabricator:migrate-maniphest-revisions.php',1556231688,NULL),('phabricator:migrate-project-edges.php',1556231688,NULL),('phabricator:owners-exclude.sql',1556231689,NULL),('phabricator:pastepolicy.sql',1556231689,NULL),('phabricator:phameblog.sql',1556231688,NULL),('phabricator:phamedomain.sql',1556231689,NULL),('phabricator:phameoneblog.sql',1556231689,NULL),('phabricator:phamepolicy.sql',1556231689,NULL),('phabricator:phiddrop.sql',1556231688,NULL),('phabricator:pholio.sql',1556231689,NULL),('phabricator:policy-project.sql',1556231689,NULL),('phabricator:ponder-comments.sql',1556231689,NULL),('phabricator:ponder-mailkey-populate.php',1556231689,NULL),('phabricator:ponder-mailkey.sql',1556231689,NULL),('phabricator:ponder.sql',1556231688,NULL),('phabricator:releeph.sql',1556231689,NULL),('phabricator:repository-lint.sql',1556231689,NULL),('phabricator:statustxt.sql',1556231689,NULL),('phabricator:symbolcontexts.sql',1556231688,NULL),('phabricator:testdatabase.sql',1556231688,NULL),('phabricator:threadtopic.sql',1556231688,NULL),('phabricator:userstatus.sql',1556231688,NULL),('phabricator:usertranslation.sql',1556231688,NULL),('phabricator:xhprof.sql',1556231689,NULL);
/*!40000 ALTER TABLE `patch_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_metamta`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_metamta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_metamta`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metamta_applicationemail`
--

DROP TABLE IF EXISTS `metamta_applicationemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metamta_applicationemail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `applicationPHID` varbinary(64) NOT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `configData` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_address` (`address`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_application` (`applicationPHID`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metamta_applicationemail`
--

LOCK TABLES `metamta_applicationemail` WRITE;
/*!40000 ALTER TABLE `metamta_applicationemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `metamta_applicationemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metamta_applicationemailtransaction`
--

DROP TABLE IF EXISTS `metamta_applicationemailtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metamta_applicationemailtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metamta_applicationemailtransaction`
--

LOCK TABLES `metamta_applicationemailtransaction` WRITE;
/*!40000 ALTER TABLE `metamta_applicationemailtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `metamta_applicationemailtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metamta_mail`
--

DROP TABLE IF EXISTS `metamta_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metamta_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `actorPHID` varbinary(64) DEFAULT NULL,
  `parameters` longtext NOT NULL,
  `status` varchar(32) NOT NULL,
  `message` longtext DEFAULT NULL,
  `relatedPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `relatedPHID` (`relatedPHID`),
  KEY `key_created` (`dateCreated`),
  KEY `key_actorPHID` (`actorPHID`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metamta_mail`
--

LOCK TABLES `metamta_mail` WRITE;
/*!40000 ALTER TABLE `metamta_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `metamta_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metamta_mailproperties`
--

DROP TABLE IF EXISTS `metamta_mailproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metamta_mailproperties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `mailProperties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metamta_mailproperties`
--

LOCK TABLES `metamta_mailproperties` WRITE;
/*!40000 ALTER TABLE `metamta_mailproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `metamta_mailproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metamta_receivedmail`
--

DROP TABLE IF EXISTS `metamta_receivedmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metamta_receivedmail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `headers` longtext NOT NULL,
  `bodies` longtext NOT NULL,
  `attachments` longtext NOT NULL,
  `relatedPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `messageIDHash` binary(12) NOT NULL,
  `status` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relatedPHID` (`relatedPHID`),
  KEY `authorPHID` (`authorPHID`),
  KEY `key_messageIDHash` (`messageIDHash`),
  KEY `key_created` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metamta_receivedmail`
--

LOCK TABLES `metamta_receivedmail` WRITE;
/*!40000 ALTER TABLE `metamta_receivedmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `metamta_receivedmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_multimeter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_multimeter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_multimeter`;

--
-- Table structure for table `multimeter_context`
--

DROP TABLE IF EXISTS `multimeter_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimeter_context` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `nameHash` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`nameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_context`
--

LOCK TABLES `multimeter_context` WRITE;
/*!40000 ALTER TABLE `multimeter_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimeter_event`
--

DROP TABLE IF EXISTS `multimeter_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimeter_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventType` int(10) unsigned NOT NULL,
  `eventLabelID` int(10) unsigned NOT NULL,
  `resourceCost` bigint(20) NOT NULL,
  `sampleRate` int(10) unsigned NOT NULL,
  `eventContextID` int(10) unsigned NOT NULL,
  `eventHostID` int(10) unsigned NOT NULL,
  `eventViewerID` int(10) unsigned NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `requestKey` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_request` (`requestKey`),
  KEY `key_type` (`eventType`,`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_event`
--

LOCK TABLES `multimeter_event` WRITE;
/*!40000 ALTER TABLE `multimeter_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimeter_host`
--

DROP TABLE IF EXISTS `multimeter_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimeter_host` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `nameHash` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`nameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_host`
--

LOCK TABLES `multimeter_host` WRITE;
/*!40000 ALTER TABLE `multimeter_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimeter_label`
--

DROP TABLE IF EXISTS `multimeter_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimeter_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `nameHash` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`nameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_label`
--

LOCK TABLES `multimeter_label` WRITE;
/*!40000 ALTER TABLE `multimeter_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimeter_viewer`
--

DROP TABLE IF EXISTS `multimeter_viewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimeter_viewer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `nameHash` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`nameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_viewer`
--

LOCK TABLES `multimeter_viewer` WRITE;
/*!40000 ALTER TABLE `multimeter_viewer` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_viewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_nuance`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_nuance` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_nuance`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_importcursordata`
--

DROP TABLE IF EXISTS `nuance_importcursordata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_importcursordata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `sourcePHID` varbinary(64) NOT NULL,
  `cursorKey` varchar(32) NOT NULL,
  `cursorType` varchar(32) NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_source` (`sourcePHID`,`cursorKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_importcursordata`
--

LOCK TABLES `nuance_importcursordata` WRITE;
/*!40000 ALTER TABLE `nuance_importcursordata` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_importcursordata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_item`
--

DROP TABLE IF EXISTS `nuance_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `requestorPHID` varbinary(64) DEFAULT NULL,
  `sourcePHID` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `queuePHID` varbinary(64) DEFAULT NULL,
  `itemType` varchar(64) NOT NULL,
  `itemKey` varchar(64) DEFAULT NULL,
  `itemContainerKey` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_item` (`sourcePHID`,`itemKey`),
  KEY `key_source` (`sourcePHID`,`status`),
  KEY `key_owner` (`ownerPHID`,`status`),
  KEY `key_requestor` (`requestorPHID`,`status`),
  KEY `key_queue` (`queuePHID`,`status`),
  KEY `key_container` (`sourcePHID`,`itemContainerKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_item`
--

LOCK TABLES `nuance_item` WRITE;
/*!40000 ALTER TABLE `nuance_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_itemcommand`
--

DROP TABLE IF EXISTS `nuance_itemcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_itemcommand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `command` varchar(64) NOT NULL,
  `parameters` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `queuePHID` varbinary(64) DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_pending` (`itemPHID`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_itemcommand`
--

LOCK TABLES `nuance_itemcommand` WRITE;
/*!40000 ALTER TABLE `nuance_itemcommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_itemcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_itemtransaction`
--

DROP TABLE IF EXISTS `nuance_itemtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_itemtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_itemtransaction`
--

LOCK TABLES `nuance_itemtransaction` WRITE;
/*!40000 ALTER TABLE `nuance_itemtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_itemtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_itemtransaction_comment`
--

DROP TABLE IF EXISTS `nuance_itemtransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_itemtransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_itemtransaction_comment`
--

LOCK TABLES `nuance_itemtransaction_comment` WRITE;
/*!40000 ALTER TABLE `nuance_itemtransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_itemtransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_queue`
--

DROP TABLE IF EXISTS `nuance_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_queue`
--

LOCK TABLES `nuance_queue` WRITE;
/*!40000 ALTER TABLE `nuance_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_queuetransaction`
--

DROP TABLE IF EXISTS `nuance_queuetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_queuetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_queuetransaction`
--

LOCK TABLES `nuance_queuetransaction` WRITE;
/*!40000 ALTER TABLE `nuance_queuetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_queuetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_queuetransaction_comment`
--

DROP TABLE IF EXISTS `nuance_queuetransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_queuetransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_queuetransaction_comment`
--

LOCK TABLES `nuance_queuetransaction_comment` WRITE;
/*!40000 ALTER TABLE `nuance_queuetransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_queuetransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_source`
--

DROP TABLE IF EXISTS `nuance_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_source` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `defaultQueuePHID` varbinary(64) NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_type` (`type`,`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_source`
--

LOCK TABLES `nuance_source` WRITE;
/*!40000 ALTER TABLE `nuance_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_sourcename_ngrams`
--

DROP TABLE IF EXISTS `nuance_sourcename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_sourcename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_sourcename_ngrams`
--

LOCK TABLES `nuance_sourcename_ngrams` WRITE;
/*!40000 ALTER TABLE `nuance_sourcename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_sourcename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_sourcetransaction`
--

DROP TABLE IF EXISTS `nuance_sourcetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_sourcetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_sourcetransaction`
--

LOCK TABLES `nuance_sourcetransaction` WRITE;
/*!40000 ALTER TABLE `nuance_sourcetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_sourcetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_sourcetransaction_comment`
--

DROP TABLE IF EXISTS `nuance_sourcetransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuance_sourcetransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_sourcetransaction_comment`
--

LOCK TABLES `nuance_sourcetransaction_comment` WRITE;
/*!40000 ALTER TABLE `nuance_sourcetransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_sourcetransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_oauth_server`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_oauth_server` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_oauth_server`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_oauthclientauthorization`
--

DROP TABLE IF EXISTS `oauth_server_oauthclientauthorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_server_oauthclientauthorization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `clientPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `scope` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `userPHID` (`userPHID`,`clientPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_oauthclientauthorization`
--

LOCK TABLES `oauth_server_oauthclientauthorization` WRITE;
/*!40000 ALTER TABLE `oauth_server_oauthclientauthorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_oauthclientauthorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_oauthserveraccesstoken`
--

DROP TABLE IF EXISTS `oauth_server_oauthserveraccesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_server_oauthserveraccesstoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `clientPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_oauthserveraccesstoken`
--

LOCK TABLES `oauth_server_oauthserveraccesstoken` WRITE;
/*!40000 ALTER TABLE `oauth_server_oauthserveraccesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_oauthserveraccesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_oauthserverauthorizationcode`
--

DROP TABLE IF EXISTS `oauth_server_oauthserverauthorizationcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_server_oauthserverauthorizationcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `clientPHID` varbinary(64) NOT NULL,
  `clientSecret` varchar(32) NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `redirectURI` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_oauthserverauthorizationcode`
--

LOCK TABLES `oauth_server_oauthserverauthorizationcode` WRITE;
/*!40000 ALTER TABLE `oauth_server_oauthserverauthorizationcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_oauthserverauthorizationcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_oauthserverclient`
--

DROP TABLE IF EXISTS `oauth_server_oauthserverclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_server_oauthserverclient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `redirectURI` varchar(255) NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `isTrusted` tinyint(1) NOT NULL DEFAULT 0,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `creatorPHID` (`creatorPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_oauthserverclient`
--

LOCK TABLES `oauth_server_oauthserverclient` WRITE;
/*!40000 ALTER TABLE `oauth_server_oauthserverclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_oauthserverclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_transaction`
--

DROP TABLE IF EXISTS `oauth_server_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_server_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_transaction`
--

LOCK TABLES `oauth_server_transaction` WRITE;
/*!40000 ALTER TABLE `oauth_server_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_owners`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_owners` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_owners`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_customfieldnumericindex`
--

DROP TABLE IF EXISTS `owners_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_customfieldnumericindex`
--

LOCK TABLES `owners_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `owners_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_customfieldstorage`
--

DROP TABLE IF EXISTS `owners_customfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_customfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_customfieldstorage`
--

LOCK TABLES `owners_customfieldstorage` WRITE;
/*!40000 ALTER TABLE `owners_customfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_customfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_customfieldstringindex`
--

DROP TABLE IF EXISTS `owners_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_customfieldstringindex`
--

LOCK TABLES `owners_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `owners_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_name_ngrams`
--

DROP TABLE IF EXISTS `owners_name_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_name_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_name_ngrams`
--

LOCK TABLES `owners_name_ngrams` WRITE;
/*!40000 ALTER TABLE `owners_name_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_name_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_owner`
--

DROP TABLE IF EXISTS `owners_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_owner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `packageID` int(10) unsigned NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packageID` (`packageID`,`userPHID`),
  KEY `userPHID` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_owner`
--

LOCK TABLES `owners_owner` WRITE;
/*!40000 ALTER TABLE `owners_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_package`
--

DROP TABLE IF EXISTS `owners_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(32) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `autoReview` varchar(32) NOT NULL,
  `dominion` varchar(32) NOT NULL,
  `properties` longtext NOT NULL,
  `auditingState` varchar(32) NOT NULL,
  `authorityMode` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_package`
--

LOCK TABLES `owners_package` WRITE;
/*!40000 ALTER TABLE `owners_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_package_fdocument`
--

DROP TABLE IF EXISTS `owners_package_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_package_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_package_fdocument`
--

LOCK TABLES `owners_package_fdocument` WRITE;
/*!40000 ALTER TABLE `owners_package_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_package_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_package_ffield`
--

DROP TABLE IF EXISTS `owners_package_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_package_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_package_ffield`
--

LOCK TABLES `owners_package_ffield` WRITE;
/*!40000 ALTER TABLE `owners_package_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_package_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_package_fngrams`
--

DROP TABLE IF EXISTS `owners_package_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_package_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_package_fngrams`
--

LOCK TABLES `owners_package_fngrams` WRITE;
/*!40000 ALTER TABLE `owners_package_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_package_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_package_fngrams_common`
--

DROP TABLE IF EXISTS `owners_package_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_package_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_package_fngrams_common`
--

LOCK TABLES `owners_package_fngrams_common` WRITE;
/*!40000 ALTER TABLE `owners_package_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_package_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_packagetransaction`
--

DROP TABLE IF EXISTS `owners_packagetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_packagetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_packagetransaction`
--

LOCK TABLES `owners_packagetransaction` WRITE;
/*!40000 ALTER TABLE `owners_packagetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_packagetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_path`
--

DROP TABLE IF EXISTS `owners_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_path` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `packageID` int(10) unsigned NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `path` longtext NOT NULL,
  `excluded` tinyint(1) NOT NULL DEFAULT 0,
  `pathIndex` binary(12) NOT NULL,
  `pathDisplay` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_path` (`packageID`,`repositoryPHID`,`pathIndex`),
  KEY `key_repository` (`repositoryPHID`,`pathIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_path`
--

LOCK TABLES `owners_path` WRITE;
/*!40000 ALTER TABLE `owners_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_packages`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_packages` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_packages`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_package`
--

DROP TABLE IF EXISTS `packages_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisherPHID` varbinary(64) NOT NULL,
  `packageKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_package` (`publisherPHID`,`packageKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_package`
--

LOCK TABLES `packages_package` WRITE;
/*!40000 ALTER TABLE `packages_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_packagename_ngrams`
--

DROP TABLE IF EXISTS `packages_packagename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages_packagename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_packagename_ngrams`
--

LOCK TABLES `packages_packagename_ngrams` WRITE;
/*!40000 ALTER TABLE `packages_packagename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages_packagename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_packagetransaction`
--

DROP TABLE IF EXISTS `packages_packagetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages_packagetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_packagetransaction`
--

LOCK TABLES `packages_packagetransaction` WRITE;
/*!40000 ALTER TABLE `packages_packagetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages_packagetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_publisher`
--

DROP TABLE IF EXISTS `packages_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages_publisher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisherKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_publisher` (`publisherKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_publisher`
--

LOCK TABLES `packages_publisher` WRITE;
/*!40000 ALTER TABLE `packages_publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_publishername_ngrams`
--

DROP TABLE IF EXISTS `packages_publishername_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages_publishername_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_publishername_ngrams`
--

LOCK TABLES `packages_publishername_ngrams` WRITE;
/*!40000 ALTER TABLE `packages_publishername_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages_publishername_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_publishertransaction`
--

DROP TABLE IF EXISTS `packages_publishertransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages_publishertransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_publishertransaction`
--

LOCK TABLES `packages_publishertransaction` WRITE;
/*!40000 ALTER TABLE `packages_publishertransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages_publishertransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_version`
--

DROP TABLE IF EXISTS `packages_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `packagePHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_package` (`packagePHID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_version`
--

LOCK TABLES `packages_version` WRITE;
/*!40000 ALTER TABLE `packages_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_versionname_ngrams`
--

DROP TABLE IF EXISTS `packages_versionname_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages_versionname_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_versionname_ngrams`
--

LOCK TABLES `packages_versionname_ngrams` WRITE;
/*!40000 ALTER TABLE `packages_versionname_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages_versionname_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_versiontransaction`
--

DROP TABLE IF EXISTS `packages_versiontransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages_versiontransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_versiontransaction`
--

LOCK TABLES `packages_versiontransaction` WRITE;
/*!40000 ALTER TABLE `packages_versiontransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages_versiontransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_passphrase`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_passphrase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_passphrase`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_credential`
--

DROP TABLE IF EXISTS `passphrase_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `passphrase_credential` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credentialType` varchar(64) NOT NULL,
  `providesType` varchar(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `description` longtext NOT NULL,
  `username` varchar(255) NOT NULL,
  `secretID` int(10) unsigned DEFAULT NULL,
  `isDestroyed` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isLocked` tinyint(1) NOT NULL,
  `allowConduit` tinyint(1) NOT NULL DEFAULT 0,
  `authorPHID` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_secret` (`secretID`),
  KEY `key_type` (`credentialType`),
  KEY `key_provides` (`providesType`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_credential`
--

LOCK TABLES `passphrase_credential` WRITE;
/*!40000 ALTER TABLE `passphrase_credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_credential_fdocument`
--

DROP TABLE IF EXISTS `passphrase_credential_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `passphrase_credential_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_credential_fdocument`
--

LOCK TABLES `passphrase_credential_fdocument` WRITE;
/*!40000 ALTER TABLE `passphrase_credential_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_credential_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_credential_ffield`
--

DROP TABLE IF EXISTS `passphrase_credential_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `passphrase_credential_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_credential_ffield`
--

LOCK TABLES `passphrase_credential_ffield` WRITE;
/*!40000 ALTER TABLE `passphrase_credential_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_credential_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_credential_fngrams`
--

DROP TABLE IF EXISTS `passphrase_credential_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `passphrase_credential_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_credential_fngrams`
--

LOCK TABLES `passphrase_credential_fngrams` WRITE;
/*!40000 ALTER TABLE `passphrase_credential_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_credential_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_credential_fngrams_common`
--

DROP TABLE IF EXISTS `passphrase_credential_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `passphrase_credential_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_credential_fngrams_common`
--

LOCK TABLES `passphrase_credential_fngrams_common` WRITE;
/*!40000 ALTER TABLE `passphrase_credential_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_credential_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_credentialtransaction`
--

DROP TABLE IF EXISTS `passphrase_credentialtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `passphrase_credentialtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_credentialtransaction`
--

LOCK TABLES `passphrase_credentialtransaction` WRITE;
/*!40000 ALTER TABLE `passphrase_credentialtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_credentialtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_secret`
--

DROP TABLE IF EXISTS `passphrase_secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `passphrase_secret` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `secretData` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_secret`
--

LOCK TABLES `passphrase_secret` WRITE;
/*!40000 ALTER TABLE `passphrase_secret` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_secret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_paste`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_paste` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_paste`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paste`
--

DROP TABLE IF EXISTS `paste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paste` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `filePHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `language` varchar(64) DEFAULT NULL,
  `parentPHID` varbinary(64) DEFAULT NULL,
  `viewPolicy` varbinary(64) DEFAULT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `status` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `parentPHID` (`parentPHID`),
  KEY `authorPHID` (`authorPHID`),
  KEY `key_dateCreated` (`dateCreated`),
  KEY `key_language` (`language`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paste`
--

LOCK TABLES `paste` WRITE;
/*!40000 ALTER TABLE `paste` DISABLE KEYS */;
/*!40000 ALTER TABLE `paste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paste_paste_fdocument`
--

DROP TABLE IF EXISTS `paste_paste_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paste_paste_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paste_paste_fdocument`
--

LOCK TABLES `paste_paste_fdocument` WRITE;
/*!40000 ALTER TABLE `paste_paste_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `paste_paste_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paste_paste_ffield`
--

DROP TABLE IF EXISTS `paste_paste_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paste_paste_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paste_paste_ffield`
--

LOCK TABLES `paste_paste_ffield` WRITE;
/*!40000 ALTER TABLE `paste_paste_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `paste_paste_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paste_paste_fngrams`
--

DROP TABLE IF EXISTS `paste_paste_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paste_paste_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paste_paste_fngrams`
--

LOCK TABLES `paste_paste_fngrams` WRITE;
/*!40000 ALTER TABLE `paste_paste_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `paste_paste_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paste_paste_fngrams_common`
--

DROP TABLE IF EXISTS `paste_paste_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paste_paste_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paste_paste_fngrams_common`
--

LOCK TABLES `paste_paste_fngrams_common` WRITE;
/*!40000 ALTER TABLE `paste_paste_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `paste_paste_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paste_transaction`
--

DROP TABLE IF EXISTS `paste_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paste_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paste_transaction`
--

LOCK TABLES `paste_transaction` WRITE;
/*!40000 ALTER TABLE `paste_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `paste_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paste_transaction_comment`
--

DROP TABLE IF EXISTS `paste_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paste_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `lineNumber` int(10) unsigned DEFAULT NULL,
  `lineLength` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paste_transaction_comment`
--

LOCK TABLES `paste_transaction_comment` WRITE;
/*!40000 ALTER TABLE `paste_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `paste_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_pastebin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_pastebin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_pastebin`;

--
-- Current Database: `phabricator_phame`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_phame` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_phame`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_blog`
--

DROP TABLE IF EXISTS `phame_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` longtext NOT NULL,
  `domain` varchar(128) DEFAULT NULL,
  `configData` longtext NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `status` varchar(32) NOT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `headerImagePHID` varbinary(64) DEFAULT NULL,
  `subtitle` varchar(64) NOT NULL,
  `parentDomain` varchar(128) DEFAULT NULL,
  `parentSite` varchar(128) DEFAULT NULL,
  `domainFullURI` varchar(128) DEFAULT NULL,
  `interactPolicy` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_blog`
--

LOCK TABLES `phame_blog` WRITE;
/*!40000 ALTER TABLE `phame_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_blog_fdocument`
--

DROP TABLE IF EXISTS `phame_blog_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_blog_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_blog_fdocument`
--

LOCK TABLES `phame_blog_fdocument` WRITE;
/*!40000 ALTER TABLE `phame_blog_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_blog_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_blog_ffield`
--

DROP TABLE IF EXISTS `phame_blog_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_blog_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_blog_ffield`
--

LOCK TABLES `phame_blog_ffield` WRITE;
/*!40000 ALTER TABLE `phame_blog_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_blog_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_blog_fngrams`
--

DROP TABLE IF EXISTS `phame_blog_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_blog_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_blog_fngrams`
--

LOCK TABLES `phame_blog_fngrams` WRITE;
/*!40000 ALTER TABLE `phame_blog_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_blog_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_blog_fngrams_common`
--

DROP TABLE IF EXISTS `phame_blog_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_blog_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_blog_fngrams_common`
--

LOCK TABLES `phame_blog_fngrams_common` WRITE;
/*!40000 ALTER TABLE `phame_blog_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_blog_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_blogtransaction`
--

DROP TABLE IF EXISTS `phame_blogtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_blogtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_blogtransaction`
--

LOCK TABLES `phame_blogtransaction` WRITE;
/*!40000 ALTER TABLE `phame_blogtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_blogtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_post`
--

DROP TABLE IF EXISTS `phame_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `bloggerPHID` varbinary(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `phameTitle` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `visibility` int(10) unsigned NOT NULL DEFAULT 0,
  `configData` longtext DEFAULT NULL,
  `datePublished` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `blogPHID` varbinary(64) DEFAULT NULL,
  `mailKey` binary(20) NOT NULL,
  `subtitle` varchar(64) NOT NULL,
  `headerImagePHID` varbinary(64) DEFAULT NULL,
  `interactPolicy` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `bloggerPosts` (`bloggerPHID`,`visibility`,`datePublished`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_post`
--

LOCK TABLES `phame_post` WRITE;
/*!40000 ALTER TABLE `phame_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_post_fdocument`
--

DROP TABLE IF EXISTS `phame_post_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_post_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_post_fdocument`
--

LOCK TABLES `phame_post_fdocument` WRITE;
/*!40000 ALTER TABLE `phame_post_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_post_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_post_ffield`
--

DROP TABLE IF EXISTS `phame_post_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_post_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_post_ffield`
--

LOCK TABLES `phame_post_ffield` WRITE;
/*!40000 ALTER TABLE `phame_post_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_post_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_post_fngrams`
--

DROP TABLE IF EXISTS `phame_post_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_post_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_post_fngrams`
--

LOCK TABLES `phame_post_fngrams` WRITE;
/*!40000 ALTER TABLE `phame_post_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_post_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_post_fngrams_common`
--

DROP TABLE IF EXISTS `phame_post_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_post_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_post_fngrams_common`
--

LOCK TABLES `phame_post_fngrams_common` WRITE;
/*!40000 ALTER TABLE `phame_post_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_post_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_posttransaction`
--

DROP TABLE IF EXISTS `phame_posttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_posttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_posttransaction`
--

LOCK TABLES `phame_posttransaction` WRITE;
/*!40000 ALTER TABLE `phame_posttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_posttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_posttransaction_comment`
--

DROP TABLE IF EXISTS `phame_posttransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phame_posttransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_posttransaction_comment`
--

LOCK TABLES `phame_posttransaction_comment` WRITE;
/*!40000 ALTER TABLE `phame_posttransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_posttransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_phlux`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_phlux` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_phlux`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phlux_transaction`
--

DROP TABLE IF EXISTS `phlux_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phlux_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phlux_transaction`
--

LOCK TABLES `phlux_transaction` WRITE;
/*!40000 ALTER TABLE `phlux_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phlux_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phlux_variable`
--

DROP TABLE IF EXISTS `phlux_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phlux_variable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `variableKey` varchar(64) NOT NULL,
  `variableValue` longtext NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_key` (`variableKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phlux_variable`
--

LOCK TABLES `phlux_variable` WRITE;
/*!40000 ALTER TABLE `phlux_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `phlux_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_pholio`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_pholio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_pholio`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_image`
--

DROP TABLE IF EXISTS `pholio_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pholio_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `filePHID` varbinary(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isObsolete` tinyint(1) NOT NULL DEFAULT 0,
  `replacesImagePHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `mockPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_mock` (`mockPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_image`
--

LOCK TABLES `pholio_image` WRITE;
/*!40000 ALTER TABLE `pholio_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_mock`
--

DROP TABLE IF EXISTS `pholio_mock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pholio_mock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `coverPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(12) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `authorPHID` (`authorPHID`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_mock`
--

LOCK TABLES `pholio_mock` WRITE;
/*!40000 ALTER TABLE `pholio_mock` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_mock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_mock_fdocument`
--

DROP TABLE IF EXISTS `pholio_mock_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pholio_mock_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_mock_fdocument`
--

LOCK TABLES `pholio_mock_fdocument` WRITE;
/*!40000 ALTER TABLE `pholio_mock_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_mock_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_mock_ffield`
--

DROP TABLE IF EXISTS `pholio_mock_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pholio_mock_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_mock_ffield`
--

LOCK TABLES `pholio_mock_ffield` WRITE;
/*!40000 ALTER TABLE `pholio_mock_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_mock_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_mock_fngrams`
--

DROP TABLE IF EXISTS `pholio_mock_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pholio_mock_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_mock_fngrams`
--

LOCK TABLES `pholio_mock_fngrams` WRITE;
/*!40000 ALTER TABLE `pholio_mock_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_mock_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_mock_fngrams_common`
--

DROP TABLE IF EXISTS `pholio_mock_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pholio_mock_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_mock_fngrams_common`
--

LOCK TABLES `pholio_mock_fngrams_common` WRITE;
/*!40000 ALTER TABLE `pholio_mock_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_mock_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_transaction`
--

DROP TABLE IF EXISTS `pholio_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pholio_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_transaction`
--

LOCK TABLES `pholio_transaction` WRITE;
/*!40000 ALTER TABLE `pholio_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_transaction_comment`
--

DROP TABLE IF EXISTS `pholio_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pholio_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `imageID` int(10) unsigned DEFAULT NULL,
  `x` int(10) unsigned DEFAULT NULL,
  `y` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  UNIQUE KEY `key_draft` (`authorPHID`,`imageID`,`transactionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_transaction_comment`
--

LOCK TABLES `pholio_transaction_comment` WRITE;
/*!40000 ALTER TABLE `pholio_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_phortune`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_phortune` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_phortune`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_account`
--

DROP TABLE IF EXISTS `phortune_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `billingName` varchar(255) NOT NULL,
  `billingAddress` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_account`
--

LOCK TABLES `phortune_account` WRITE;
/*!40000 ALTER TABLE `phortune_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_accountemail`
--

DROP TABLE IF EXISTS `phortune_accountemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_accountemail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(32) NOT NULL,
  `addressKey` varchar(32) NOT NULL,
  `accessKey` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_account` (`accountPHID`,`address`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_address` (`addressKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_accountemail`
--

LOCK TABLES `phortune_accountemail` WRITE;
/*!40000 ALTER TABLE `phortune_accountemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_accountemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_accountemailtransaction`
--

DROP TABLE IF EXISTS `phortune_accountemailtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_accountemailtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_accountemailtransaction`
--

LOCK TABLES `phortune_accountemailtransaction` WRITE;
/*!40000 ALTER TABLE `phortune_accountemailtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_accountemailtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_accounttransaction`
--

DROP TABLE IF EXISTS `phortune_accounttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_accounttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_accounttransaction`
--

LOCK TABLES `phortune_accounttransaction` WRITE;
/*!40000 ALTER TABLE `phortune_accounttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_accounttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_cart`
--

DROP TABLE IF EXISTS `phortune_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(32) NOT NULL,
  `cartClass` varchar(128) NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `subscriptionPHID` varbinary(64) DEFAULT NULL,
  `isInvoice` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_account` (`accountPHID`),
  KEY `key_merchant` (`merchantPHID`),
  KEY `key_subscription` (`subscriptionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_cart`
--

LOCK TABLES `phortune_cart` WRITE;
/*!40000 ALTER TABLE `phortune_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_carttransaction`
--

DROP TABLE IF EXISTS `phortune_carttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_carttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_carttransaction`
--

LOCK TABLES `phortune_carttransaction` WRITE;
/*!40000 ALTER TABLE `phortune_carttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_carttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_charge`
--

DROP TABLE IF EXISTS `phortune_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_charge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `cartPHID` varbinary(64) NOT NULL,
  `paymentMethodPHID` varbinary(64) DEFAULT NULL,
  `amountAsCurrency` varchar(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `providerPHID` varbinary(64) NOT NULL,
  `amountRefundedAsCurrency` varchar(64) NOT NULL,
  `refundingPHID` varbinary(64) DEFAULT NULL,
  `refundedChargePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_cart` (`cartPHID`),
  KEY `key_account` (`accountPHID`),
  KEY `key_merchant` (`merchantPHID`),
  KEY `key_provider` (`providerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_charge`
--

LOCK TABLES `phortune_charge` WRITE;
/*!40000 ALTER TABLE `phortune_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_merchant`
--

DROP TABLE IF EXISTS `phortune_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_merchant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext NOT NULL,
  `contactInfo` longtext NOT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `invoiceEmail` varchar(255) NOT NULL,
  `invoiceFooter` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_merchant`
--

LOCK TABLES `phortune_merchant` WRITE;
/*!40000 ALTER TABLE `phortune_merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_merchanttransaction`
--

DROP TABLE IF EXISTS `phortune_merchanttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_merchanttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_merchanttransaction`
--

LOCK TABLES `phortune_merchanttransaction` WRITE;
/*!40000 ALTER TABLE `phortune_merchanttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_merchanttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_paymentmethod`
--

DROP TABLE IF EXISTS `phortune_paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_paymentmethod` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `brand` varchar(64) NOT NULL,
  `expires` varchar(16) NOT NULL,
  `lastFourDigits` varchar(16) NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `providerPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_account` (`accountPHID`,`status`),
  KEY `key_merchant` (`merchantPHID`,`accountPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_paymentmethod`
--

LOCK TABLES `phortune_paymentmethod` WRITE;
/*!40000 ALTER TABLE `phortune_paymentmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_paymentmethodtransaction`
--

DROP TABLE IF EXISTS `phortune_paymentmethodtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_paymentmethodtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_paymentmethodtransaction`
--

LOCK TABLES `phortune_paymentmethodtransaction` WRITE;
/*!40000 ALTER TABLE `phortune_paymentmethodtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_paymentmethodtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_paymentproviderconfig`
--

DROP TABLE IF EXISTS `phortune_paymentproviderconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_paymentproviderconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `providerClassKey` binary(12) NOT NULL,
  `providerClass` varchar(128) NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isEnabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_merchant` (`merchantPHID`,`providerClassKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_paymentproviderconfig`
--

LOCK TABLES `phortune_paymentproviderconfig` WRITE;
/*!40000 ALTER TABLE `phortune_paymentproviderconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_paymentproviderconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_paymentproviderconfigtransaction`
--

DROP TABLE IF EXISTS `phortune_paymentproviderconfigtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_paymentproviderconfigtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_paymentproviderconfigtransaction`
--

LOCK TABLES `phortune_paymentproviderconfigtransaction` WRITE;
/*!40000 ALTER TABLE `phortune_paymentproviderconfigtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_paymentproviderconfigtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_product`
--

DROP TABLE IF EXISTS `phortune_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `productClassKey` binary(12) NOT NULL,
  `productClass` varchar(128) NOT NULL,
  `productRefKey` binary(12) NOT NULL,
  `productRef` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_product` (`productClassKey`,`productRefKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_product`
--

LOCK TABLES `phortune_product` WRITE;
/*!40000 ALTER TABLE `phortune_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_purchase`
--

DROP TABLE IF EXISTS `phortune_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_purchase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `productPHID` varbinary(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `cartPHID` varbinary(64) DEFAULT NULL,
  `basePriceAsCurrency` varchar(64) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `status` varchar(32) NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_cart` (`cartPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_purchase`
--

LOCK TABLES `phortune_purchase` WRITE;
/*!40000 ALTER TABLE `phortune_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_subscription`
--

DROP TABLE IF EXISTS `phortune_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_subscription` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `triggerPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `subscriptionClassKey` binary(12) NOT NULL,
  `subscriptionClass` varchar(128) NOT NULL,
  `subscriptionRefKey` binary(12) NOT NULL,
  `subscriptionRef` varchar(128) NOT NULL,
  `status` varchar(32) NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `defaultPaymentMethodPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_subscription` (`subscriptionClassKey`,`subscriptionRefKey`),
  KEY `key_account` (`accountPHID`),
  KEY `key_merchant` (`merchantPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_subscription`
--

LOCK TABLES `phortune_subscription` WRITE;
/*!40000 ALTER TABLE `phortune_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_subscriptiontransaction`
--

DROP TABLE IF EXISTS `phortune_subscriptiontransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phortune_subscriptiontransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_subscriptiontransaction`
--

LOCK TABLES `phortune_subscriptiontransaction` WRITE;
/*!40000 ALTER TABLE `phortune_subscriptiontransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_subscriptiontransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_phrequent`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_phrequent` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_phrequent`;

--
-- Table structure for table `phrequent_usertime`
--

DROP TABLE IF EXISTS `phrequent_usertime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phrequent_usertime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `dateStarted` int(10) unsigned NOT NULL,
  `dateEnded` int(10) unsigned DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phrequent_usertime`
--

LOCK TABLES `phrequent_usertime` WRITE;
/*!40000 ALTER TABLE `phrequent_usertime` DISABLE KEYS */;
/*!40000 ALTER TABLE `phrequent_usertime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_phriction`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_phriction` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_phriction`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_content`
--

DROP TABLE IF EXISTS `phriction_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phriction_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(128) NOT NULL,
  `content` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext NOT NULL,
  `changeType` int(10) unsigned NOT NULL DEFAULT 0,
  `changeRef` int(10) unsigned DEFAULT NULL,
  `phid` varbinary(64) NOT NULL,
  `documentPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_version` (`documentPHID`,`version`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `authorPHID` (`authorPHID`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_content`
--

LOCK TABLES `phriction_content` WRITE;
/*!40000 ALTER TABLE `phriction_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_document`
--

DROP TABLE IF EXISTS `phriction_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phriction_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `status` varchar(32) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `contentPHID` varbinary(64) NOT NULL,
  `editedEpoch` int(10) unsigned NOT NULL,
  `maxVersion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `depth` (`depth`,`slug`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_document`
--

LOCK TABLES `phriction_document` WRITE;
/*!40000 ALTER TABLE `phriction_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_document_fdocument`
--

DROP TABLE IF EXISTS `phriction_document_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phriction_document_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_document_fdocument`
--

LOCK TABLES `phriction_document_fdocument` WRITE;
/*!40000 ALTER TABLE `phriction_document_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_document_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_document_ffield`
--

DROP TABLE IF EXISTS `phriction_document_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phriction_document_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_document_ffield`
--

LOCK TABLES `phriction_document_ffield` WRITE;
/*!40000 ALTER TABLE `phriction_document_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_document_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_document_fngrams`
--

DROP TABLE IF EXISTS `phriction_document_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phriction_document_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_document_fngrams`
--

LOCK TABLES `phriction_document_fngrams` WRITE;
/*!40000 ALTER TABLE `phriction_document_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_document_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_document_fngrams_common`
--

DROP TABLE IF EXISTS `phriction_document_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phriction_document_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_document_fngrams_common`
--

LOCK TABLES `phriction_document_fngrams_common` WRITE;
/*!40000 ALTER TABLE `phriction_document_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_document_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_transaction`
--

DROP TABLE IF EXISTS `phriction_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phriction_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_transaction`
--

LOCK TABLES `phriction_transaction` WRITE;
/*!40000 ALTER TABLE `phriction_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_transaction_comment`
--

DROP TABLE IF EXISTS `phriction_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phriction_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_transaction_comment`
--

LOCK TABLES `phriction_transaction_comment` WRITE;
/*!40000 ALTER TABLE `phriction_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_phurl`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_phurl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_phurl`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phurl_phurlname_ngrams`
--

DROP TABLE IF EXISTS `phurl_phurlname_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phurl_phurlname_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phurl_phurlname_ngrams`
--

LOCK TABLES `phurl_phurlname_ngrams` WRITE;
/*!40000 ALTER TABLE `phurl_phurlname_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `phurl_phurlname_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phurl_url`
--

DROP TABLE IF EXISTS `phurl_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phurl_url` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` longtext NOT NULL,
  `longURL` longtext NOT NULL,
  `description` longtext NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_instance` (`alias`),
  KEY `key_author` (`authorPHID`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phurl_url`
--

LOCK TABLES `phurl_url` WRITE;
/*!40000 ALTER TABLE `phurl_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `phurl_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phurl_urltransaction`
--

DROP TABLE IF EXISTS `phurl_urltransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phurl_urltransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phurl_urltransaction`
--

LOCK TABLES `phurl_urltransaction` WRITE;
/*!40000 ALTER TABLE `phurl_urltransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phurl_urltransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phurl_urltransaction_comment`
--

DROP TABLE IF EXISTS `phurl_urltransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phurl_urltransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phurl_urltransaction_comment`
--

LOCK TABLES `phurl_urltransaction_comment` WRITE;
/*!40000 ALTER TABLE `phurl_urltransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `phurl_urltransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_policy`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_policy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_policy`;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `rules` longtext NOT NULL,
  `defaultAction` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_ponder`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_ponder` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_ponder`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_answer`
--

DROP TABLE IF EXISTS `ponder_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionID` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `voteCount` int(10) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `content` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `status` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `key_oneanswerperquestion` (`questionID`,`authorPHID`),
  KEY `questionID` (`questionID`),
  KEY `authorPHID` (`authorPHID`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_answer`
--

LOCK TABLES `ponder_answer` WRITE;
/*!40000 ALTER TABLE `ponder_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_answertransaction`
--

DROP TABLE IF EXISTS `ponder_answertransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_answertransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_answertransaction`
--

LOCK TABLES `ponder_answertransaction` WRITE;
/*!40000 ALTER TABLE `ponder_answertransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_answertransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_answertransaction_comment`
--

DROP TABLE IF EXISTS `ponder_answertransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_answertransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_answertransaction_comment`
--

LOCK TABLES `ponder_answertransaction_comment` WRITE;
/*!40000 ALTER TABLE `ponder_answertransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_answertransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_question`
--

DROP TABLE IF EXISTS `ponder_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `content` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `contentSource` longtext DEFAULT NULL,
  `answerCount` int(10) unsigned NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `answerWiki` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `authorPHID` (`authorPHID`),
  KEY `status` (`status`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_question`
--

LOCK TABLES `ponder_question` WRITE;
/*!40000 ALTER TABLE `ponder_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_question_fdocument`
--

DROP TABLE IF EXISTS `ponder_question_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_question_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_question_fdocument`
--

LOCK TABLES `ponder_question_fdocument` WRITE;
/*!40000 ALTER TABLE `ponder_question_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_question_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_question_ffield`
--

DROP TABLE IF EXISTS `ponder_question_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_question_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_question_ffield`
--

LOCK TABLES `ponder_question_ffield` WRITE;
/*!40000 ALTER TABLE `ponder_question_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_question_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_question_fngrams`
--

DROP TABLE IF EXISTS `ponder_question_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_question_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_question_fngrams`
--

LOCK TABLES `ponder_question_fngrams` WRITE;
/*!40000 ALTER TABLE `ponder_question_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_question_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_question_fngrams_common`
--

DROP TABLE IF EXISTS `ponder_question_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_question_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_question_fngrams_common`
--

LOCK TABLES `ponder_question_fngrams_common` WRITE;
/*!40000 ALTER TABLE `ponder_question_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_question_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_questiontransaction`
--

DROP TABLE IF EXISTS `ponder_questiontransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_questiontransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_questiontransaction`
--

LOCK TABLES `ponder_questiontransaction` WRITE;
/*!40000 ALTER TABLE `ponder_questiontransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_questiontransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_questiontransaction_comment`
--

DROP TABLE IF EXISTS `ponder_questiontransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponder_questiontransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_questiontransaction_comment`
--

LOCK TABLES `ponder_questiontransaction_comment` WRITE;
/*!40000 ALTER TABLE `ponder_questiontransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_questiontransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_project`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(32) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `joinPolicy` varbinary(64) NOT NULL,
  `isMembershipLocked` tinyint(1) NOT NULL DEFAULT 0,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `icon` varchar(32) NOT NULL,
  `color` varchar(32) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `primarySlug` varchar(128) DEFAULT NULL,
  `parentProjectPHID` varbinary(64) DEFAULT NULL,
  `hasWorkboard` tinyint(1) NOT NULL,
  `hasMilestones` tinyint(1) NOT NULL,
  `hasSubprojects` tinyint(1) NOT NULL,
  `milestoneNumber` int(10) unsigned DEFAULT NULL,
  `projectPath` varbinary(64) NOT NULL,
  `projectDepth` int(10) unsigned NOT NULL,
  `projectPathKey` binary(4) NOT NULL,
  `properties` longtext NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `subtype` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_pathkey` (`projectPathKey`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_primaryslug` (`primarySlug`),
  UNIQUE KEY `key_milestone` (`parentProjectPHID`,`milestoneNumber`),
  KEY `key_icon` (`icon`),
  KEY `key_color` (`color`),
  KEY `key_path` (`projectPath`,`projectDepth`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_column`
--

DROP TABLE IF EXISTS `project_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_column` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `projectPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `properties` longtext NOT NULL,
  `proxyPHID` varbinary(64) DEFAULT NULL,
  `triggerPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_proxy` (`projectPHID`,`proxyPHID`),
  KEY `key_status` (`projectPHID`,`status`,`sequence`),
  KEY `key_sequence` (`projectPHID`,`sequence`),
  KEY `key_trigger` (`triggerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_column`
--

LOCK TABLES `project_column` WRITE;
/*!40000 ALTER TABLE `project_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_columnposition`
--

DROP TABLE IF EXISTS `project_columnposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_columnposition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `boardPHID` varbinary(64) NOT NULL,
  `columnPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `boardPHID` (`boardPHID`,`columnPHID`,`objectPHID`),
  KEY `objectPHID` (`objectPHID`,`boardPHID`),
  KEY `boardPHID_2` (`boardPHID`,`columnPHID`,`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_columnposition`
--

LOCK TABLES `project_columnposition` WRITE;
/*!40000 ALTER TABLE `project_columnposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_columnposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_columntransaction`
--

DROP TABLE IF EXISTS `project_columntransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_columntransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_columntransaction`
--

LOCK TABLES `project_columntransaction` WRITE;
/*!40000 ALTER TABLE `project_columntransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_columntransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_customfieldnumericindex`
--

DROP TABLE IF EXISTS `project_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_customfieldnumericindex`
--

LOCK TABLES `project_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `project_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_customfieldstorage`
--

DROP TABLE IF EXISTS `project_customfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_customfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_customfieldstorage`
--

LOCK TABLES `project_customfieldstorage` WRITE;
/*!40000 ALTER TABLE `project_customfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_customfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_customfieldstringindex`
--

DROP TABLE IF EXISTS `project_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_customfieldstringindex`
--

LOCK TABLES `project_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `project_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_datasourcetoken`
--

DROP TABLE IF EXISTS `project_datasourcetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_datasourcetoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(10) unsigned NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`,`projectID`),
  KEY `projectID` (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_datasourcetoken`
--

LOCK TABLES `project_datasourcetoken` WRITE;
/*!40000 ALTER TABLE `project_datasourcetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_datasourcetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_project_fdocument`
--

DROP TABLE IF EXISTS `project_project_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_project_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_project_fdocument`
--

LOCK TABLES `project_project_fdocument` WRITE;
/*!40000 ALTER TABLE `project_project_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_project_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_project_ffield`
--

DROP TABLE IF EXISTS `project_project_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_project_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_project_ffield`
--

LOCK TABLES `project_project_ffield` WRITE;
/*!40000 ALTER TABLE `project_project_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_project_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_project_fngrams`
--

DROP TABLE IF EXISTS `project_project_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_project_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_project_fngrams`
--

LOCK TABLES `project_project_fngrams` WRITE;
/*!40000 ALTER TABLE `project_project_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_project_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_project_fngrams_common`
--

DROP TABLE IF EXISTS `project_project_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_project_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_project_fngrams_common`
--

LOCK TABLES `project_project_fngrams_common` WRITE;
/*!40000 ALTER TABLE `project_project_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_project_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_slug`
--

DROP TABLE IF EXISTS `project_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_slug` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectPHID` varbinary(64) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_slug` (`slug`),
  KEY `key_projectPHID` (`projectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_slug`
--

LOCK TABLES `project_slug` WRITE;
/*!40000 ALTER TABLE `project_slug` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_slug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_transaction`
--

DROP TABLE IF EXISTS `project_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_transaction`
--

LOCK TABLES `project_transaction` WRITE;
/*!40000 ALTER TABLE `project_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_trigger`
--

DROP TABLE IF EXISTS `project_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_trigger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `ruleset` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_trigger`
--

LOCK TABLES `project_trigger` WRITE;
/*!40000 ALTER TABLE `project_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_triggertransaction`
--

DROP TABLE IF EXISTS `project_triggertransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_triggertransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_triggertransaction`
--

LOCK TABLES `project_triggertransaction` WRITE;
/*!40000 ALTER TABLE `project_triggertransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_triggertransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_triggerusage`
--

DROP TABLE IF EXISTS `project_triggerusage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_triggerusage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `triggerPHID` varbinary(64) NOT NULL,
  `examplePHID` varbinary(64) DEFAULT NULL,
  `columnCount` int(10) unsigned NOT NULL,
  `activeColumnCount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_trigger` (`triggerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_triggerusage`
--

LOCK TABLES `project_triggerusage` WRITE;
/*!40000 ALTER TABLE `project_triggerusage` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_triggerusage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_repository`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_repository` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_repository`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `callsign` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `versionControlSystem` varchar(32) NOT NULL,
  `details` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `uuid` varchar(64) DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `pushPolicy` varbinary(64) NOT NULL,
  `credentialPHID` varbinary(64) DEFAULT NULL,
  `almanacServicePHID` varbinary(64) DEFAULT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `repositorySlug` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localPath` varchar(128) DEFAULT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `callsign` (`callsign`),
  UNIQUE KEY `key_slug` (`repositorySlug`),
  UNIQUE KEY `key_local` (`localPath`),
  KEY `key_vcs` (`versionControlSystem`),
  KEY `key_name` (`name`(128)),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_auditrequest`
--

DROP TABLE IF EXISTS `repository_auditrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_auditrequest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auditorPHID` varbinary(64) NOT NULL,
  `commitPHID` varbinary(64) NOT NULL,
  `auditStatus` varchar(64) NOT NULL,
  `auditReasons` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_unique` (`commitPHID`,`auditorPHID`),
  KEY `commitPHID` (`commitPHID`),
  KEY `auditorPHID` (`auditorPHID`,`auditStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_auditrequest`
--

LOCK TABLES `repository_auditrequest` WRITE;
/*!40000 ALTER TABLE `repository_auditrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_auditrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_branch`
--

DROP TABLE IF EXISTS `repository_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_branch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryID` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `lintCommit` varchar(40) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repositoryID` (`repositoryID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_branch`
--

LOCK TABLES `repository_branch` WRITE;
/*!40000 ALTER TABLE `repository_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_commit`
--

DROP TABLE IF EXISTS `repository_commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_commit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryID` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `commitIdentifier` varchar(40) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `auditStatus` varchar(32) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `importStatus` int(10) unsigned NOT NULL,
  `authorIdentityPHID` varbinary(64) DEFAULT NULL,
  `committerIdentityPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `key_commit_identity` (`commitIdentifier`,`repositoryID`),
  KEY `repositoryID_2` (`repositoryID`,`epoch`),
  KEY `authorPHID` (`authorPHID`,`auditStatus`,`epoch`),
  KEY `repositoryID` (`repositoryID`,`importStatus`),
  KEY `key_epoch` (`epoch`),
  KEY `key_author` (`authorPHID`,`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_commit`
--

LOCK TABLES `repository_commit` WRITE;
/*!40000 ALTER TABLE `repository_commit` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_commit_fdocument`
--

DROP TABLE IF EXISTS `repository_commit_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_commit_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_commit_fdocument`
--

LOCK TABLES `repository_commit_fdocument` WRITE;
/*!40000 ALTER TABLE `repository_commit_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_commit_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_commit_ffield`
--

DROP TABLE IF EXISTS `repository_commit_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_commit_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_commit_ffield`
--

LOCK TABLES `repository_commit_ffield` WRITE;
/*!40000 ALTER TABLE `repository_commit_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_commit_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_commit_fngrams`
--

DROP TABLE IF EXISTS `repository_commit_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_commit_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_commit_fngrams`
--

LOCK TABLES `repository_commit_fngrams` WRITE;
/*!40000 ALTER TABLE `repository_commit_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_commit_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_commit_fngrams_common`
--

DROP TABLE IF EXISTS `repository_commit_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_commit_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_commit_fngrams_common`
--

LOCK TABLES `repository_commit_fngrams_common` WRITE;
/*!40000 ALTER TABLE `repository_commit_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_commit_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_commitdata`
--

DROP TABLE IF EXISTS `repository_commitdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_commitdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commitID` int(10) unsigned NOT NULL,
  `authorName` longtext NOT NULL,
  `commitMessage` longtext NOT NULL,
  `commitDetails` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commitID` (`commitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_commitdata`
--

LOCK TABLES `repository_commitdata` WRITE;
/*!40000 ALTER TABLE `repository_commitdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_commitdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_commithint`
--

DROP TABLE IF EXISTS `repository_commithint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_commithint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryPHID` varbinary(64) NOT NULL,
  `oldCommitIdentifier` varchar(40) NOT NULL,
  `newCommitIdentifier` varchar(40) DEFAULT NULL,
  `hintType` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_old` (`repositoryPHID`,`oldCommitIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_commithint`
--

LOCK TABLES `repository_commithint` WRITE;
/*!40000 ALTER TABLE `repository_commithint` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_commithint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_coverage`
--

DROP TABLE IF EXISTS `repository_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_coverage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branchID` int(10) unsigned NOT NULL,
  `commitID` int(10) unsigned NOT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `coverage` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_path` (`branchID`,`pathID`,`commitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_coverage`
--

LOCK TABLES `repository_coverage` WRITE;
/*!40000 ALTER TABLE `repository_coverage` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_filesystem`
--

DROP TABLE IF EXISTS `repository_filesystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_filesystem` (
  `repositoryID` int(10) unsigned NOT NULL,
  `parentID` int(10) unsigned NOT NULL,
  `svnCommit` int(10) unsigned NOT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `existed` tinyint(1) NOT NULL,
  `fileType` int(10) unsigned NOT NULL,
  PRIMARY KEY (`repositoryID`,`parentID`,`pathID`,`svnCommit`),
  KEY `repositoryID` (`repositoryID`,`svnCommit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_filesystem`
--

LOCK TABLES `repository_filesystem` WRITE;
/*!40000 ALTER TABLE `repository_filesystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_filesystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_gitlfsref`
--

DROP TABLE IF EXISTS `repository_gitlfsref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_gitlfsref` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryPHID` varbinary(64) NOT NULL,
  `objectHash` binary(64) NOT NULL,
  `byteSize` bigint(20) unsigned NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `filePHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`repositoryPHID`,`objectHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_gitlfsref`
--

LOCK TABLES `repository_gitlfsref` WRITE;
/*!40000 ALTER TABLE `repository_gitlfsref` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_gitlfsref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_identity`
--

DROP TABLE IF EXISTS `repository_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_identity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `automaticGuessedUserPHID` varbinary(64) DEFAULT NULL,
  `manuallySetUserPHID` varbinary(64) DEFAULT NULL,
  `currentEffectiveUserPHID` varbinary(64) DEFAULT NULL,
  `identityNameHash` binary(12) NOT NULL,
  `identityNameRaw` longblob NOT NULL,
  `identityNameEncoding` varchar(16) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `emailAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_identity` (`identityNameHash`),
  KEY `key_email` (`emailAddress`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_identity`
--

LOCK TABLES `repository_identity` WRITE;
/*!40000 ALTER TABLE `repository_identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_identitytransaction`
--

DROP TABLE IF EXISTS `repository_identitytransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_identitytransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_identitytransaction`
--

LOCK TABLES `repository_identitytransaction` WRITE;
/*!40000 ALTER TABLE `repository_identitytransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_identitytransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_lintmessage`
--

DROP TABLE IF EXISTS `repository_lintmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_lintmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branchID` int(10) unsigned NOT NULL,
  `path` longtext NOT NULL,
  `line` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `code` varchar(32) NOT NULL,
  `severity` varchar(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branchID` (`branchID`,`path`(64)),
  KEY `branchID_2` (`branchID`,`code`,`path`(64)),
  KEY `key_author` (`authorPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_lintmessage`
--

LOCK TABLES `repository_lintmessage` WRITE;
/*!40000 ALTER TABLE `repository_lintmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_lintmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_mirror`
--

DROP TABLE IF EXISTS `repository_mirror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_mirror` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `remoteURI` varchar(255) NOT NULL,
  `credentialPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_repository` (`repositoryPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_mirror`
--

LOCK TABLES `repository_mirror` WRITE;
/*!40000 ALTER TABLE `repository_mirror` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_mirror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_oldref`
--

DROP TABLE IF EXISTS `repository_oldref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_oldref` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryPHID` varbinary(64) NOT NULL,
  `commitIdentifier` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_repository` (`repositoryPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_oldref`
--

LOCK TABLES `repository_oldref` WRITE;
/*!40000 ALTER TABLE `repository_oldref` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_oldref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_parents`
--

DROP TABLE IF EXISTS `repository_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_parents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `childCommitID` int(10) unsigned NOT NULL,
  `parentCommitID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_child` (`childCommitID`,`parentCommitID`),
  KEY `key_parent` (`parentCommitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_parents`
--

LOCK TABLES `repository_parents` WRITE;
/*!40000 ALTER TABLE `repository_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_path`
--

DROP TABLE IF EXISTS `repository_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_path` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` longtext NOT NULL,
  `pathHash` binary(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pathHash` (`pathHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_path`
--

LOCK TABLES `repository_path` WRITE;
/*!40000 ALTER TABLE `repository_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_pathchange`
--

DROP TABLE IF EXISTS `repository_pathchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_pathchange` (
  `repositoryID` int(10) unsigned NOT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `commitID` int(10) unsigned NOT NULL,
  `targetPathID` int(10) unsigned DEFAULT NULL,
  `targetCommitID` int(10) unsigned DEFAULT NULL,
  `changeType` int(10) unsigned NOT NULL,
  `fileType` int(10) unsigned NOT NULL,
  `isDirect` tinyint(1) NOT NULL,
  `commitSequence` int(10) unsigned NOT NULL,
  PRIMARY KEY (`commitID`,`pathID`),
  KEY `repositoryID` (`repositoryID`,`pathID`,`commitSequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_pathchange`
--

LOCK TABLES `repository_pathchange` WRITE;
/*!40000 ALTER TABLE `repository_pathchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_pathchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_pullevent`
--

DROP TABLE IF EXISTS `repository_pullevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_pullevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `pullerPHID` varbinary(64) DEFAULT NULL,
  `remoteAddress` varbinary(64) DEFAULT NULL,
  `remoteProtocol` varchar(32) DEFAULT NULL,
  `resultType` varchar(32) NOT NULL,
  `resultCode` int(10) unsigned NOT NULL,
  `properties` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_repository` (`repositoryPHID`),
  KEY `key_epoch` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_pullevent`
--

LOCK TABLES `repository_pullevent` WRITE;
/*!40000 ALTER TABLE `repository_pullevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_pullevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_pushevent`
--

DROP TABLE IF EXISTS `repository_pushevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_pushevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `pusherPHID` varbinary(64) NOT NULL,
  `remoteAddress` varbinary(64) DEFAULT NULL,
  `remoteProtocol` varchar(32) DEFAULT NULL,
  `rejectCode` int(10) unsigned NOT NULL,
  `rejectDetails` varchar(64) DEFAULT NULL,
  `requestIdentifier` binary(12) DEFAULT NULL,
  `writeWait` bigint(20) unsigned DEFAULT NULL,
  `readWait` bigint(20) unsigned DEFAULT NULL,
  `hostWait` bigint(20) unsigned DEFAULT NULL,
  `hookWait` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_repository` (`repositoryPHID`),
  KEY `key_identifier` (`requestIdentifier`),
  KEY `key_reject` (`rejectCode`,`rejectDetails`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_pushevent`
--

LOCK TABLES `repository_pushevent` WRITE;
/*!40000 ALTER TABLE `repository_pushevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_pushevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_pushlog`
--

DROP TABLE IF EXISTS `repository_pushlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_pushlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `pushEventPHID` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `pusherPHID` varbinary(64) NOT NULL,
  `refType` varchar(12) NOT NULL,
  `refNameHash` binary(12) DEFAULT NULL,
  `refNameRaw` longblob DEFAULT NULL,
  `refNameEncoding` varchar(16) DEFAULT NULL,
  `refOld` varchar(40) DEFAULT NULL,
  `refNew` varchar(40) NOT NULL,
  `mergeBase` varchar(40) DEFAULT NULL,
  `changeFlags` int(10) unsigned NOT NULL,
  `devicePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_repository` (`repositoryPHID`),
  KEY `key_ref` (`repositoryPHID`,`refNew`),
  KEY `key_pusher` (`pusherPHID`),
  KEY `key_name` (`repositoryPHID`,`refNameHash`),
  KEY `key_event` (`pushEventPHID`),
  KEY `key_epoch` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_pushlog`
--

LOCK TABLES `repository_pushlog` WRITE;
/*!40000 ALTER TABLE `repository_pushlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_pushlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_refcursor`
--

DROP TABLE IF EXISTS `repository_refcursor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_refcursor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `refType` varchar(32) NOT NULL,
  `refNameHash` binary(12) NOT NULL,
  `refNameRaw` longblob NOT NULL,
  `refNameEncoding` varchar(16) DEFAULT NULL,
  `isPermanent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ref` (`repositoryPHID`,`refType`,`refNameHash`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_refcursor`
--

LOCK TABLES `repository_refcursor` WRITE;
/*!40000 ALTER TABLE `repository_refcursor` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_refcursor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_refposition`
--

DROP TABLE IF EXISTS `repository_refposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_refposition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cursorID` int(10) unsigned NOT NULL,
  `commitIdentifier` varchar(40) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_position` (`cursorID`,`commitIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_refposition`
--

LOCK TABLES `repository_refposition` WRITE;
/*!40000 ALTER TABLE `repository_refposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_refposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_repository_fdocument`
--

DROP TABLE IF EXISTS `repository_repository_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_repository_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_repository_fdocument`
--

LOCK TABLES `repository_repository_fdocument` WRITE;
/*!40000 ALTER TABLE `repository_repository_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_repository_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_repository_ffield`
--

DROP TABLE IF EXISTS `repository_repository_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_repository_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_repository_ffield`
--

LOCK TABLES `repository_repository_ffield` WRITE;
/*!40000 ALTER TABLE `repository_repository_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_repository_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_repository_fngrams`
--

DROP TABLE IF EXISTS `repository_repository_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_repository_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_repository_fngrams`
--

LOCK TABLES `repository_repository_fngrams` WRITE;
/*!40000 ALTER TABLE `repository_repository_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_repository_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_repository_fngrams_common`
--

DROP TABLE IF EXISTS `repository_repository_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_repository_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_repository_fngrams_common`
--

LOCK TABLES `repository_repository_fngrams_common` WRITE;
/*!40000 ALTER TABLE `repository_repository_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_repository_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_statusmessage`
--

DROP TABLE IF EXISTS `repository_statusmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_statusmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryID` int(10) unsigned NOT NULL,
  `statusType` varchar(32) NOT NULL,
  `statusCode` varchar(32) NOT NULL,
  `parameters` longtext NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `messageCount` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repositoryID` (`repositoryID`,`statusType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_statusmessage`
--

LOCK TABLES `repository_statusmessage` WRITE;
/*!40000 ALTER TABLE `repository_statusmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_statusmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_summary`
--

DROP TABLE IF EXISTS `repository_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_summary` (
  `repositoryID` int(10) unsigned NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `lastCommitID` int(10) unsigned NOT NULL,
  `epoch` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`repositoryID`),
  KEY `key_epoch` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_summary`
--

LOCK TABLES `repository_summary` WRITE;
/*!40000 ALTER TABLE `repository_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_symbol`
--

DROP TABLE IF EXISTS `repository_symbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_symbol` (
  `repositoryPHID` varbinary(64) NOT NULL,
  `symbolContext` varchar(128) NOT NULL,
  `symbolName` varchar(128) NOT NULL,
  `symbolType` varchar(12) NOT NULL,
  `symbolLanguage` varchar(32) NOT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `lineNumber` int(10) unsigned NOT NULL,
  KEY `symbolName` (`symbolName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_symbol`
--

LOCK TABLES `repository_symbol` WRITE;
/*!40000 ALTER TABLE `repository_symbol` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_symbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_syncevent`
--

DROP TABLE IF EXISTS `repository_syncevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_syncevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `devicePHID` varbinary(64) NOT NULL,
  `fromDevicePHID` varbinary(64) NOT NULL,
  `deviceVersion` int(10) unsigned DEFAULT NULL,
  `fromDeviceVersion` int(10) unsigned DEFAULT NULL,
  `resultType` varchar(32) NOT NULL,
  `resultCode` int(10) unsigned NOT NULL,
  `syncWait` bigint(20) unsigned NOT NULL,
  `properties` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_repository` (`repositoryPHID`),
  KEY `key_epoch` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_syncevent`
--

LOCK TABLES `repository_syncevent` WRITE;
/*!40000 ALTER TABLE `repository_syncevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_syncevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_transaction`
--

DROP TABLE IF EXISTS `repository_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_transaction`
--

LOCK TABLES `repository_transaction` WRITE;
/*!40000 ALTER TABLE `repository_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_uri`
--

DROP TABLE IF EXISTS `repository_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `builtinProtocol` varchar(32) DEFAULT NULL,
  `builtinIdentifier` varchar(32) DEFAULT NULL,
  `ioType` varchar(32) NOT NULL,
  `displayType` varchar(32) NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `credentialPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_builtin` (`repositoryPHID`,`builtinProtocol`,`builtinIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_uri`
--

LOCK TABLES `repository_uri` WRITE;
/*!40000 ALTER TABLE `repository_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_uriindex`
--

DROP TABLE IF EXISTS `repository_uriindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_uriindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryPHID` varbinary(64) NOT NULL,
  `repositoryURI` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_repository` (`repositoryPHID`),
  KEY `key_uri` (`repositoryURI`(128))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_uriindex`
--

LOCK TABLES `repository_uriindex` WRITE;
/*!40000 ALTER TABLE `repository_uriindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_uriindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_uritransaction`
--

DROP TABLE IF EXISTS `repository_uritransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_uritransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_uritransaction`
--

LOCK TABLES `repository_uritransaction` WRITE;
/*!40000 ALTER TABLE `repository_uritransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_uritransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_workingcopyversion`
--

DROP TABLE IF EXISTS `repository_workingcopyversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository_workingcopyversion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryPHID` varbinary(64) NOT NULL,
  `devicePHID` varbinary(64) NOT NULL,
  `repositoryVersion` int(10) unsigned NOT NULL,
  `isWriting` tinyint(1) NOT NULL,
  `writeProperties` longtext DEFAULT NULL,
  `lockOwner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_workingcopy` (`repositoryPHID`,`devicePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_workingcopyversion`
--

LOCK TABLES `repository_workingcopyversion` WRITE;
/*!40000 ALTER TABLE `repository_workingcopyversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_workingcopyversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_search`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_search` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_search`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_document`
--

DROP TABLE IF EXISTS `search_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_document` (
  `phid` varbinary(64) NOT NULL,
  `documentType` varchar(4) NOT NULL,
  `documentTitle` varchar(255) NOT NULL,
  `documentCreated` int(10) unsigned NOT NULL,
  `documentModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`phid`),
  KEY `documentCreated` (`documentCreated`),
  KEY `key_type` (`documentType`,`documentCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_document`
--

LOCK TABLES `search_document` WRITE;
/*!40000 ALTER TABLE `search_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_documentrelationship`
--

DROP TABLE IF EXISTS `search_documentrelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_documentrelationship` (
  `phid` varbinary(64) NOT NULL,
  `relatedPHID` varbinary(64) NOT NULL,
  `relation` varchar(4) NOT NULL,
  `relatedType` varchar(4) NOT NULL,
  `relatedTime` int(10) unsigned NOT NULL,
  KEY `phid` (`phid`),
  KEY `relatedPHID` (`relatedPHID`,`relation`),
  KEY `relation` (`relation`,`relatedPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_documentrelationship`
--

LOCK TABLES `search_documentrelationship` WRITE;
/*!40000 ALTER TABLE `search_documentrelationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_documentrelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_editengineconfiguration`
--

DROP TABLE IF EXISTS `search_editengineconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_editengineconfiguration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `engineKey` varchar(64) NOT NULL,
  `builtinKey` varchar(64) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `properties` longtext NOT NULL,
  `isDisabled` tinyint(1) NOT NULL DEFAULT 0,
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isEdit` tinyint(1) NOT NULL,
  `createOrder` int(10) unsigned NOT NULL,
  `editOrder` int(10) unsigned NOT NULL,
  `subtype` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_engine` (`engineKey`,`builtinKey`),
  KEY `key_default` (`engineKey`,`isDefault`,`isDisabled`),
  KEY `key_edit` (`engineKey`,`isEdit`,`isDisabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_editengineconfiguration`
--

LOCK TABLES `search_editengineconfiguration` WRITE;
/*!40000 ALTER TABLE `search_editengineconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_editengineconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_editengineconfigurationtransaction`
--

DROP TABLE IF EXISTS `search_editengineconfigurationtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_editengineconfigurationtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_editengineconfigurationtransaction`
--

LOCK TABLES `search_editengineconfigurationtransaction` WRITE;
/*!40000 ALTER TABLE `search_editengineconfigurationtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_editengineconfigurationtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_indexversion`
--

DROP TABLE IF EXISTS `search_indexversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_indexversion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `extensionKey` varchar(64) NOT NULL,
  `version` varchar(128) NOT NULL,
  `indexVersion` binary(12) NOT NULL,
  `indexEpoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`,`extensionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_indexversion`
--

LOCK TABLES `search_indexversion` WRITE;
/*!40000 ALTER TABLE `search_indexversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_indexversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_namedquery`
--

DROP TABLE IF EXISTS `search_namedquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_namedquery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `engineClassName` varchar(128) NOT NULL,
  `queryName` varchar(255) NOT NULL,
  `queryKey` varchar(12) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isBuiltin` tinyint(1) NOT NULL DEFAULT 0,
  `isDisabled` tinyint(1) NOT NULL DEFAULT 0,
  `sequence` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_userquery` (`userPHID`,`engineClassName`,`queryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_namedquery`
--

LOCK TABLES `search_namedquery` WRITE;
/*!40000 ALTER TABLE `search_namedquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_namedquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_namedqueryconfig`
--

DROP TABLE IF EXISTS `search_namedqueryconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_namedqueryconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `engineClassName` varchar(128) NOT NULL,
  `scopePHID` varbinary(64) NOT NULL,
  `properties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_scope` (`engineClassName`,`scopePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_namedqueryconfig`
--

LOCK TABLES `search_namedqueryconfig` WRITE;
/*!40000 ALTER TABLE `search_namedqueryconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_namedqueryconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_profilepanelconfiguration`
--

DROP TABLE IF EXISTS `search_profilepanelconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_profilepanelconfiguration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `profilePHID` varbinary(64) NOT NULL,
  `menuItemKey` varchar(64) NOT NULL,
  `builtinKey` varchar(64) DEFAULT NULL,
  `menuItemOrder` int(10) unsigned DEFAULT NULL,
  `visibility` varchar(32) NOT NULL,
  `menuItemProperties` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `customPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_profile` (`profilePHID`,`menuItemOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_profilepanelconfiguration`
--

LOCK TABLES `search_profilepanelconfiguration` WRITE;
/*!40000 ALTER TABLE `search_profilepanelconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_profilepanelconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_profilepanelconfigurationtransaction`
--

DROP TABLE IF EXISTS `search_profilepanelconfigurationtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_profilepanelconfigurationtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_profilepanelconfigurationtransaction`
--

LOCK TABLES `search_profilepanelconfigurationtransaction` WRITE;
/*!40000 ALTER TABLE `search_profilepanelconfigurationtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_profilepanelconfigurationtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_savedquery`
--

DROP TABLE IF EXISTS `search_savedquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_savedquery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `engineClassName` varchar(255) NOT NULL,
  `parameters` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `queryKey` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_queryKey` (`queryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_savedquery`
--

LOCK TABLES `search_savedquery` WRITE;
/*!40000 ALTER TABLE `search_savedquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_savedquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stopwords`
--

DROP TABLE IF EXISTS `stopwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stopwords` (
  `value` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stopwords`
--

LOCK TABLES `stopwords` WRITE;
/*!40000 ALTER TABLE `stopwords` DISABLE KEYS */;
INSERT INTO `stopwords` VALUES ('the'),('be'),('and'),('of'),('a'),('in'),('to'),('have'),('it'),('I'),('that'),('for'),('you'),('he'),('with'),('on'),('do'),('say'),('this'),('they'),('at'),('but'),('we'),('his'),('from'),('not'),('by'),('or'),('as'),('what'),('go'),('their'),('can'),('who'),('get'),('if'),('would'),('all'),('my'),('will'),('up'),('there'),('so'),('its'),('us');
/*!40000 ALTER TABLE `stopwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_slowvote`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_slowvote` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_slowvote`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_choice`
--

DROP TABLE IF EXISTS `slowvote_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slowvote_choice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pollID` int(10) unsigned NOT NULL,
  `optionID` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pollID` (`pollID`),
  KEY `authorPHID` (`authorPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_choice`
--

LOCK TABLES `slowvote_choice` WRITE;
/*!40000 ALTER TABLE `slowvote_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_option`
--

DROP TABLE IF EXISTS `slowvote_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slowvote_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pollID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pollID` (`pollID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_option`
--

LOCK TABLES `slowvote_option` WRITE;
/*!40000 ALTER TABLE `slowvote_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_poll`
--

DROP TABLE IF EXISTS `slowvote_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slowvote_poll` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `responseVisibility` varchar(32) NOT NULL,
  `shuffle` tinyint(1) NOT NULL DEFAULT 0,
  `method` varchar(32) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_poll`
--

LOCK TABLES `slowvote_poll` WRITE;
/*!40000 ALTER TABLE `slowvote_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_transaction`
--

DROP TABLE IF EXISTS `slowvote_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slowvote_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_transaction`
--

LOCK TABLES `slowvote_transaction` WRITE;
/*!40000 ALTER TABLE `slowvote_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_transaction_comment`
--

DROP TABLE IF EXISTS `slowvote_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slowvote_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_transaction_comment`
--

LOCK TABLES `slowvote_transaction_comment` WRITE;
/*!40000 ALTER TABLE `slowvote_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_spaces`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_spaces` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_spaces`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaces_namespace`
--

DROP TABLE IF EXISTS `spaces_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spaces_namespace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `namespaceName` varchar(255) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `isDefaultNamespace` tinyint(1) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext NOT NULL,
  `isArchived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_default` (`isDefaultNamespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaces_namespace`
--

LOCK TABLES `spaces_namespace` WRITE;
/*!40000 ALTER TABLE `spaces_namespace` DISABLE KEYS */;
/*!40000 ALTER TABLE `spaces_namespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaces_namespacetransaction`
--

DROP TABLE IF EXISTS `spaces_namespacetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spaces_namespacetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaces_namespacetransaction`
--

LOCK TABLES `spaces_namespacetransaction` WRITE;
/*!40000 ALTER TABLE `spaces_namespacetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `spaces_namespacetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_system`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_system`;

--
-- Table structure for table `system_actionlog`
--

DROP TABLE IF EXISTS `system_actionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_actionlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actorHash` binary(12) NOT NULL,
  `actorIdentity` varchar(255) NOT NULL,
  `action` varchar(32) NOT NULL,
  `score` double NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_epoch` (`epoch`),
  KEY `key_action` (`actorHash`,`action`,`epoch`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_actionlog`
--

LOCK TABLES `system_actionlog` WRITE;
/*!40000 ALTER TABLE `system_actionlog` DISABLE KEYS */;
INSERT INTO `system_actionlog` VALUES (1,'YhC0YVMnbVJu','172.23.0.1','auth.password',1,1790768918);
/*!40000 ALTER TABLE `system_actionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_destructionlog`
--

DROP TABLE IF EXISTS `system_destructionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_destructionlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectClass` varchar(128) NOT NULL,
  `rootLogID` int(10) unsigned DEFAULT NULL,
  `objectPHID` varbinary(64) DEFAULT NULL,
  `objectMonogram` varchar(64) DEFAULT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_epoch` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_destructionlog`
--

LOCK TABLES `system_destructionlog` WRITE;
/*!40000 ALTER TABLE `system_destructionlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_destructionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_token`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_token` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_token`;

--
-- Table structure for table `token_count`
--

DROP TABLE IF EXISTS `token_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `tokenCount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_objectPHID` (`objectPHID`),
  KEY `key_count` (`tokenCount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_count`
--

LOCK TABLES `token_count` WRITE;
/*!40000 ALTER TABLE `token_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_given`
--

DROP TABLE IF EXISTS `token_given`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_given` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `tokenPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_all` (`objectPHID`,`authorPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_token` (`tokenPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_given`
--

LOCK TABLES `token_given` WRITE;
/*!40000 ALTER TABLE `token_given` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_given` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_token`
--

DROP TABLE IF EXISTS `token_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `flavor` varchar(128) NOT NULL,
  `status` varchar(32) NOT NULL,
  `builtinKey` varchar(32) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `tokenImagePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_builtin` (`builtinKey`),
  KEY `key_creator` (`creatorPHID`,`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_token`
--

LOCK TABLES `token_token` WRITE;
/*!40000 ALTER TABLE `token_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_user`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_user` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_user`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phabricator_session`
--

DROP TABLE IF EXISTS `phabricator_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phabricator_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sessionKey` varchar(64) NOT NULL,
  `sessionStart` int(10) unsigned NOT NULL,
  `sessionExpires` int(10) unsigned NOT NULL,
  `highSecurityUntil` int(10) unsigned DEFAULT NULL,
  `isPartial` tinyint(1) NOT NULL DEFAULT 0,
  `signedLegalpadDocuments` tinyint(1) NOT NULL DEFAULT 0,
  `phid` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sessionKey` (`sessionKey`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_identity` (`userPHID`,`type`),
  KEY `key_expires` (`sessionExpires`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phabricator_session`
--

LOCK TABLES `phabricator_session` WRITE;
/*!40000 ALTER TABLE `phabricator_session` DISABLE KEYS */;
INSERT INTO `phabricator_session` VALUES (1,'PHID-USER-bfbqcgqfuuqhgalc72mp','web','667929f52e5ff2e1e92bbae6b1ea88148aac0839abae0f84c2c0c773299a66d9',1790768776,1793360777,NULL,0,1,'PHID-SSSN-7x5dmh6zbiobsrkjognn'),(2,'PHID-USER-bfbqcgqfuuqhgalc72mp','web','879c47e948e5acd91534023ef2d6711ade9a2712bc0afe8c2ce7db5261a31bcd',1790768918,1793360918,NULL,0,1,'PHID-SSSN-nicmsyzoaorm2wci3c32');
/*!40000 ALTER TABLE `phabricator_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `realName` varchar(128) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `conduitCertificate` varchar(255) NOT NULL,
  `isSystemAgent` tinyint(1) NOT NULL DEFAULT 0,
  `isDisabled` tinyint(1) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `isEmailVerified` int(10) unsigned NOT NULL,
  `isApproved` int(10) unsigned NOT NULL,
  `accountSecret` binary(64) NOT NULL,
  `isEnrolledInMultiFactor` tinyint(1) NOT NULL DEFAULT 0,
  `availabilityCache` varchar(255) DEFAULT NULL,
  `availabilityCacheTTL` int(10) unsigned DEFAULT NULL,
  `isMailingList` tinyint(1) NOT NULL,
  `defaultProfileImagePHID` varbinary(64) DEFAULT NULL,
  `defaultProfileImageVersion` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`),
  UNIQUE KEY `phid` (`phid`),
  KEY `realName` (`realName`),
  KEY `key_approved` (`isApproved`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'PHID-USER-bfbqcgqfuuqhgalc72mp','admin','Administrator',1790768776,1790768777,NULL,'rakms3fpifrtgzy7miezvp3akeagicz7blojxkdedwjbqsx4lg3bxpndaaq4bpz5mdztaggfjscpktbpf5wzivuujwudr4iqreuyzzrj2t53ipxovzbfnpuv537gtdhbcn5lzydzva6jnne4i5yd6m2sxm2vrwqempj7mrscouxazawvjb2d3ekvnky56ykscrkf5loeiwk6wesvcdbg64hof5trjsjtz4q335c2aip7k2xar5dgykvxvperdga',0,0,1,1,1,'f4l364e766oz523f7ut6zublavtvjgmv2hssgxnbvaiq7nsn4d45vvlvim4xgfed',0,'{\"until\":null,\"eventPHID\":null,\"availability\":null}',1791028118,0,'PHID-FILE-p4mta22vhcapihmmupyj','v1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authinvite`
--

DROP TABLE IF EXISTS `user_authinvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_authinvite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) NOT NULL,
  `emailAddress` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verificationHash` binary(12) NOT NULL,
  `acceptedByPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_address` (`emailAddress`),
  UNIQUE KEY `key_code` (`verificationHash`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authinvite`
--

LOCK TABLES `user_authinvite` WRITE;
/*!40000 ALTER TABLE `user_authinvite` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_authinvite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cache`
--

DROP TABLE IF EXISTS `user_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `cacheIndex` binary(12) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `cacheData` longtext NOT NULL,
  `cacheType` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_usercache` (`userPHID`,`cacheIndex`),
  KEY `key_cachekey` (`cacheIndex`),
  KEY `key_cachetype` (`cacheType`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cache`
--

LOCK TABLES `user_cache` WRITE;
/*!40000 ALTER TABLE `user_cache` DISABLE KEYS */;
INSERT INTO `user_cache` VALUES (1,'PHID-USER-bfbqcgqfuuqhgalc72mp','DO.iHbJI32Yo','user.preferences.v2','[]','preferences'),(2,'PHID-USER-bfbqcgqfuuqhgalc72mp','ShljA1NUxUbb','user.message.count.v1','0','message.count'),(3,'PHID-USER-bfbqcgqfuuqhgalc72mp','rOGS6Fh944dc','user.notification.count.v1','0','notification.count'),(4,'PHID-USER-bfbqcgqfuuqhgalc72mp','y_FPXujT93U3','user.profile.image.uri.v1','kq5wuMKJim_d,http://127.0.0.1:18854/file/data/isua7saadmhx2fu2wsre/PHID-FILE-p4mta22vhcapihmmupyj/335862-alphanumeric_lato-dark_A.png-0%2C0%2C0%2C0.3.png','user.profile');
/*!40000 ALTER TABLE `user_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_configuredcustomfieldstorage`
--

DROP TABLE IF EXISTS `user_configuredcustomfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_configuredcustomfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_configuredcustomfieldstorage`
--

LOCK TABLES `user_configuredcustomfieldstorage` WRITE;
/*!40000 ALTER TABLE `user_configuredcustomfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_configuredcustomfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customfieldnumericindex`
--

DROP TABLE IF EXISTS `user_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customfieldnumericindex`
--

LOCK TABLES `user_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `user_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customfieldstringindex`
--

DROP TABLE IF EXISTS `user_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customfieldstringindex`
--

LOCK TABLES `user_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `user_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_email`
--

DROP TABLE IF EXISTS `user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isVerified` tinyint(1) NOT NULL DEFAULT 0,
  `isPrimary` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `userPHID` (`userPHID`,`isPrimary`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_email`
--

LOCK TABLES `user_email` WRITE;
/*!40000 ALTER TABLE `user_email` DISABLE KEYS */;
INSERT INTO `user_email` VALUES (1,'PHID-USER-bfbqcgqfuuqhgalc72mp','admin@example.com',1,1,'aio64tudlip2p7awlal4ooec',1790768776,1790768776,'PHID-EADR-kxgph3bnrdoczniiex2f');
/*!40000 ALTER TABLE `user_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_externalaccount`
--

DROP TABLE IF EXISTS `user_externalaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_externalaccount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userPHID` varbinary(64) DEFAULT NULL,
  `accountType` varchar(16) NOT NULL,
  `accountDomain` varchar(64) NOT NULL,
  `accountSecret` longtext DEFAULT NULL,
  `accountID` varchar(64) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emailVerified` tinyint(1) NOT NULL,
  `accountURI` varchar(255) DEFAULT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `properties` longtext NOT NULL,
  `providerConfigPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_user` (`userPHID`),
  KEY `key_provider` (`providerConfigPHID`,`userPHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_externalaccount`
--

LOCK TABLES `user_externalaccount` WRITE;
/*!40000 ALTER TABLE `user_externalaccount` DISABLE KEYS */;
INSERT INTO `user_externalaccount` VALUES (1,'PHID-XUSR-fcplxss3bkzse5wvxeiv','PHID-USER-bfbqcgqfuuqhgalc72mp','password','self','be4yz2xigzgeifgmtedtjo2x7y6hq3x5','',NULL,1790768918,1790768918,NULL,NULL,NULL,0,NULL,NULL,'[]','PHID-AUTH-uuclgbk7ztekk6jclew3');
/*!40000 ALTER TABLE `user_externalaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_externalaccountidentifier`
--

DROP TABLE IF EXISTS `user_externalaccountidentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_externalaccountidentifier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `externalAccountPHID` varbinary(64) NOT NULL,
  `providerConfigPHID` varbinary(64) NOT NULL,
  `identifierHash` binary(12) NOT NULL,
  `identifierRaw` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_identifier` (`providerConfigPHID`,`identifierHash`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_account` (`externalAccountPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_externalaccountidentifier`
--

LOCK TABLES `user_externalaccountidentifier` WRITE;
/*!40000 ALTER TABLE `user_externalaccountidentifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_externalaccountidentifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actorPHID` varbinary(64) DEFAULT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `action` varchar(64) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `details` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `remoteAddr` varchar(64) NOT NULL,
  `session` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actorPHID` (`actorPHID`,`dateCreated`),
  KEY `userPHID` (`userPHID`,`dateCreated`),
  KEY `action` (`action`,`dateCreated`),
  KEY `dateCreated` (`dateCreated`),
  KEY `remoteAddr` (`remoteAddr`,`dateCreated`),
  KEY `session` (`session`,`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES (1,NULL,'PHID-USER-bfbqcgqfuuqhgalc72mp','login-partial','null','null','{\"session_type\":\"web\",\"host\":\"8dfa16464774\",\"user_agent\":\"Python-urllib\\/3.9\"}',1790768776,1790768776,'172.23.0.1','667929f52e5ff2e1e92bbae6b1ea88148aac0839abae0f84c2c0c773299a66d9'),(2,'PHID-USER-bfbqcgqfuuqhgalc72mp','PHID-USER-bfbqcgqfuuqhgalc72mp','login-full','null','null','{\"host\":\"8dfa16464774\",\"user_agent\":\"Python-urllib\\/3.9\"}',1790768777,1790768777,'172.23.0.1','667929f52e5ff2e1e92bbae6b1ea88148aac0839abae0f84c2c0c773299a66d9'),(3,NULL,'PHID-USER-bfbqcgqfuuqhgalc72mp','login-partial','null','null','{\"session_type\":\"web\",\"host\":\"8dfa16464774\",\"user_agent\":\"Python-urllib\\/3.9\"}',1790768918,1790768918,'172.23.0.1','879c47e948e5acd91534023ef2d6711ade9a2712bc0afe8c2ce7db5261a31bcd'),(4,'PHID-USER-bfbqcgqfuuqhgalc72mp','PHID-USER-bfbqcgqfuuqhgalc72mp','login-full','null','null','{\"host\":\"8dfa16464774\",\"user_agent\":\"Python-urllib\\/3.9\"}',1790768918,1790768918,'172.23.0.1','879c47e948e5acd91534023ef2d6711ade9a2712bc0afe8c2ce7db5261a31bcd');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_nametoken`
--

DROP TABLE IF EXISTS `user_nametoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_nametoken` (
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  KEY `token` (`token`(128)),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_nametoken`
--

LOCK TABLES `user_nametoken` WRITE;
/*!40000 ALTER TABLE `user_nametoken` DISABLE KEYS */;
INSERT INTO `user_nametoken` VALUES ('admin',1),('administrator',1);
/*!40000 ALTER TABLE `user_nametoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) DEFAULT NULL,
  `preferences` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `builtinKey` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_builtin` (`builtinKey`),
  UNIQUE KEY `key_user` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferencestransaction`
--

DROP TABLE IF EXISTS `user_preferencestransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferencestransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferencestransaction`
--

LOCK TABLES `user_preferencestransaction` WRITE;
/*!40000 ALTER TABLE `user_preferencestransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_preferencestransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `blurb` longtext NOT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userPHID` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_transaction`
--

DROP TABLE IF EXISTS `user_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_transaction`
--

LOCK TABLES `user_transaction` WRITE;
/*!40000 ALTER TABLE `user_transaction` DISABLE KEYS */;
INSERT INTO `user_transaction` VALUES (1,'PHID-XACT-USER-qvsfijkwarqmn27','PHID-APPS-PhabricatorPeopleApplication','PHID-USER-bfbqcgqfuuqhgalc72mp','public','no-one',NULL,0,'user.admin','false','true','{\"core.groupID\":\"za4pcsvgljpcyjogmjgz7rk4wueuflyj\"}','{\"source\":\"web\",\"params\":[]}',1790768776,1790768776);
/*!40000 ALTER TABLE `user_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_fdocument`
--

DROP TABLE IF EXISTS `user_user_fdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_fdocument` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `epochCreated` int(10) unsigned NOT NULL,
  `epochModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_owner` (`ownerPHID`),
  KEY `key_created` (`epochCreated`),
  KEY `key_modified` (`epochModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_fdocument`
--

LOCK TABLES `user_user_fdocument` WRITE;
/*!40000 ALTER TABLE `user_user_fdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_fdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_ffield`
--

DROP TABLE IF EXISTS `user_user_ffield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_ffield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `fieldKey` varchar(4) NOT NULL,
  `rawCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalCorpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_documentfield` (`documentID`,`fieldKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_ffield`
--

LOCK TABLES `user_user_ffield` WRITE;
/*!40000 ALTER TABLE `user_user_ffield` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_ffield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_fngrams`
--

DROP TABLE IF EXISTS `user_user_fngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_fngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `ngram` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_ngram` (`ngram`,`documentID`),
  KEY `key_object` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_fngrams`
--

LOCK TABLES `user_user_fngrams` WRITE;
/*!40000 ALTER TABLE `user_user_fngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_fngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_fngrams_common`
--

DROP TABLE IF EXISTS `user_user_fngrams_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_fngrams_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngram` char(3) NOT NULL,
  `needsCollection` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_ngram` (`ngram`),
  KEY `key_collect` (`needsCollection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_fngrams_common`
--

LOCK TABLES `user_user_fngrams_common` WRITE;
/*!40000 ALTER TABLE `user_user_fngrams_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_fngrams_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_worker`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_worker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_worker`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lisk_counter`
--

DROP TABLE IF EXISTS `lisk_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lisk_counter` (
  `counterName` varchar(32) NOT NULL,
  `counterValue` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`counterName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lisk_counter`
--

LOCK TABLES `lisk_counter` WRITE;
/*!40000 ALTER TABLE `lisk_counter` DISABLE KEYS */;
INSERT INTO `lisk_counter` VALUES ('worker_activetask',21);
/*!40000 ALTER TABLE `lisk_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_activetask`
--

DROP TABLE IF EXISTS `worker_activetask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_activetask` (
  `id` int(10) unsigned NOT NULL,
  `taskClass` varchar(64) NOT NULL,
  `leaseOwner` varchar(64) DEFAULT NULL,
  `leaseExpires` int(10) unsigned DEFAULT NULL,
  `failureCount` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned NOT NULL,
  `failureTime` int(10) unsigned DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  `objectPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `containerPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaseExpires` (`leaseExpires`),
  KEY `key_failuretime` (`failureTime`),
  KEY `taskClass` (`taskClass`),
  KEY `key_owner` (`leaseOwner`,`priority`,`id`),
  KEY `key_object` (`objectPHID`),
  KEY `key_container` (`containerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_activetask`
--

LOCK TABLES `worker_activetask` WRITE;
/*!40000 ALTER TABLE `worker_activetask` DISABLE KEYS */;
INSERT INTO `worker_activetask` VALUES (3,'PhabricatorRebuildIndexesWorker',NULL,NULL,0,1,NULL,3500,NULL,1556231702,1556231702,NULL),(4,'PhabricatorRebuildIndexesWorker',NULL,NULL,0,2,NULL,3500,NULL,1556231702,1556231702,NULL),(5,'PhabricatorRebuildIndexesWorker',NULL,NULL,0,3,NULL,3500,NULL,1556231702,1556231702,NULL),(6,'PhabricatorRebuildIndexesWorker',NULL,NULL,0,4,NULL,3500,NULL,1790768758,1790768758,NULL),(7,'PhabricatorRebuildIndexesWorker',NULL,NULL,0,5,NULL,3500,NULL,1790768758,1790768758,NULL),(8,'PhabricatorSearchWorker',NULL,NULL,0,6,NULL,3500,'PHID-FILE-3li36jtfvuuoqve4rsaf',1790768769,1790768769,NULL),(9,'PhabricatorSearchWorker',NULL,NULL,0,7,NULL,3500,'PHID-FILE-uidoehlkddemzyahugte',1790768769,1790768769,NULL),(10,'PhabricatorSearchWorker',NULL,NULL,0,8,NULL,3500,'PHID-FILE-oyokw7hhx6uf5hdwy4oe',1790768769,1790768769,NULL),(11,'PhabricatorSearchWorker',NULL,NULL,0,9,NULL,3500,'PHID-FILE-zcokuzrrfhppucksqxpj',1790768769,1790768769,NULL),(12,'PhabricatorSearchWorker',NULL,NULL,0,10,NULL,3500,'PHID-FILE-hzwmubvnepa6studpfb5',1790768769,1790768769,NULL),(13,'PhabricatorSearchWorker',NULL,NULL,0,11,NULL,3500,'PHID-FILE-evg3ehskrxlvamr3q2h3',1790768769,1790768769,NULL),(14,'PhabricatorSearchWorker',NULL,NULL,0,12,NULL,3500,'PHID-FILE-u67ins7wulctntns5ejr',1790768769,1790768769,NULL),(15,'PhabricatorSearchWorker',NULL,NULL,0,13,NULL,3500,'PHID-USER-bfbqcgqfuuqhgalc72mp',1790768776,1790768776,NULL),(16,'PhabricatorRepositoryIdentityChangeWorker',NULL,NULL,0,14,NULL,2000,NULL,1790768776,1790768776,NULL),(17,'PhabricatorSearchWorker',NULL,NULL,0,15,NULL,3500,'PHID-USER-bfbqcgqfuuqhgalc72mp',1790768776,1790768776,NULL),(18,'PhabricatorApplicationTransactionPublishWorker',NULL,NULL,0,16,NULL,1000,'PHID-USER-bfbqcgqfuuqhgalc72mp',1790768776,1790768776,NULL),(19,'PhabricatorSearchWorker',NULL,NULL,0,17,NULL,3500,'PHID-FILE-4aapmeaafky3mybnqfak',1790768777,1790768777,NULL),(20,'PhabricatorSearchWorker',NULL,NULL,0,18,NULL,3500,'PHID-FILE-mo6g2hnth7qw6h5l3p7r',1790768777,1790768777,NULL),(21,'PhabricatorSearchWorker',NULL,NULL,0,19,NULL,3500,'PHID-FILE-p4mta22vhcapihmmupyj',1790768777,1790768777,NULL);
/*!40000 ALTER TABLE `worker_activetask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_archivetask`
--

DROP TABLE IF EXISTS `worker_archivetask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_archivetask` (
  `id` int(10) unsigned NOT NULL,
  `taskClass` varchar(64) NOT NULL,
  `leaseOwner` varchar(64) DEFAULT NULL,
  `leaseExpires` int(10) unsigned DEFAULT NULL,
  `failureCount` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned NOT NULL,
  `result` int(10) unsigned NOT NULL,
  `duration` bigint(20) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `objectPHID` varbinary(64) DEFAULT NULL,
  `archivedEpoch` int(10) unsigned DEFAULT NULL,
  `containerPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dateCreated` (`dateCreated`),
  KEY `key_modified` (`dateModified`),
  KEY `key_object` (`objectPHID`),
  KEY `key_container` (`containerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_archivetask`
--

LOCK TABLES `worker_archivetask` WRITE;
/*!40000 ALTER TABLE `worker_archivetask` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_archivetask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_bulkjob`
--

DROP TABLE IF EXISTS `worker_bulkjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_bulkjob` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `jobTypeKey` varchar(32) NOT NULL,
  `status` varchar(32) NOT NULL,
  `parameters` longtext NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isSilent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_type` (`jobTypeKey`),
  KEY `key_author` (`authorPHID`),
  KEY `key_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_bulkjob`
--

LOCK TABLES `worker_bulkjob` WRITE;
/*!40000 ALTER TABLE `worker_bulkjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_bulkjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_bulkjobtransaction`
--

DROP TABLE IF EXISTS `worker_bulkjobtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_bulkjobtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) NOT NULL,
  `oldValue` longtext NOT NULL,
  `newValue` longtext NOT NULL,
  `contentSource` longtext NOT NULL,
  `metadata` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_bulkjobtransaction`
--

LOCK TABLES `worker_bulkjobtransaction` WRITE;
/*!40000 ALTER TABLE `worker_bulkjobtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_bulkjobtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_bulktask`
--

DROP TABLE IF EXISTS `worker_bulktask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_bulktask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bulkJobPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_job` (`bulkJobPHID`,`status`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_bulktask`
--

LOCK TABLES `worker_bulktask` WRITE;
/*!40000 ALTER TABLE `worker_bulktask` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_bulktask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_taskdata`
--

DROP TABLE IF EXISTS `worker_taskdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_taskdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_taskdata`
--

LOCK TABLES `worker_taskdata` WRITE;
/*!40000 ALTER TABLE `worker_taskdata` DISABLE KEYS */;
INSERT INTO `worker_taskdata` VALUES (1,'{\"queryClass\":\"PhabricatorDashboardQuery\"}'),(2,'{\"queryClass\":\"PhabricatorDashboardPanelQuery\"}'),(3,'{\"queryClass\":\"HeraldRuleQuery\"}'),(4,'{\"queryClass\":\"HeraldRuleQuery\"}'),(5,'{\"queryClass\":\"PhabricatorRepositoryQuery\"}'),(6,'{\"documentPHID\":\"PHID-FILE-3li36jtfvuuoqve4rsaf\",\"parameters\":[],\"strict\":false}'),(7,'{\"documentPHID\":\"PHID-FILE-uidoehlkddemzyahugte\",\"parameters\":[],\"strict\":false}'),(8,'{\"documentPHID\":\"PHID-FILE-oyokw7hhx6uf5hdwy4oe\",\"parameters\":[],\"strict\":false}'),(9,'{\"documentPHID\":\"PHID-FILE-zcokuzrrfhppucksqxpj\",\"parameters\":[],\"strict\":false}'),(10,'{\"documentPHID\":\"PHID-FILE-hzwmubvnepa6studpfb5\",\"parameters\":[],\"strict\":false}'),(11,'{\"documentPHID\":\"PHID-FILE-evg3ehskrxlvamr3q2h3\",\"parameters\":[],\"strict\":false}'),(12,'{\"documentPHID\":\"PHID-FILE-u67ins7wulctntns5ejr\",\"parameters\":[],\"strict\":false}'),(13,'{\"documentPHID\":\"PHID-USER-bfbqcgqfuuqhgalc72mp\",\"parameters\":[],\"strict\":false}'),(14,'{\"emailAddresses\":[\"admin@example.com\"]}'),(15,'{\"documentPHID\":\"PHID-USER-bfbqcgqfuuqhgalc72mp\",\"parameters\":[],\"strict\":false}'),(16,'{\"objectPHID\":\"PHID-USER-bfbqcgqfuuqhgalc72mp\",\"actorPHID\":\"PHID-APPS-PhabricatorPeopleApplication\",\"xactionPHIDs\":[\"PHID-XACT-USER-qvsfijkwarqmn27\"],\"state\":{\"parentMessageID\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[\"PHID-USER-bfbqcgqfuuqhgalc72mp\",\"PHID-APPS-PhabricatorPeopleApplication\"],\"feedShouldPublish\":true,\"mailShouldSend\":false,\"mustEncrypt\":[],\"mailStamps\":[],\"mailUnexpandablePHIDs\":[],\"mailMutedPHIDs\":[],\"webhookMap\":[],\"silent\":null,\"sendHistory\":false,\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}'),(17,'{\"documentPHID\":\"PHID-FILE-4aapmeaafky3mybnqfak\",\"parameters\":[],\"strict\":false}'),(18,'{\"documentPHID\":\"PHID-FILE-mo6g2hnth7qw6h5l3p7r\",\"parameters\":[],\"strict\":false}'),(19,'{\"documentPHID\":\"PHID-FILE-p4mta22vhcapihmmupyj\",\"parameters\":[],\"strict\":false}');
/*!40000 ALTER TABLE `worker_taskdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_trigger`
--

DROP TABLE IF EXISTS `worker_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_trigger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `triggerVersion` int(10) unsigned NOT NULL,
  `clockClass` varchar(64) NOT NULL,
  `clockProperties` longtext NOT NULL,
  `actionClass` varchar(64) NOT NULL,
  `actionProperties` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_trigger` (`triggerVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_trigger`
--

LOCK TABLES `worker_trigger` WRITE;
/*!40000 ALTER TABLE `worker_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_triggerevent`
--

DROP TABLE IF EXISTS `worker_triggerevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_triggerevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `triggerID` int(10) unsigned NOT NULL,
  `lastEventEpoch` int(10) unsigned DEFAULT NULL,
  `nextEventEpoch` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_trigger` (`triggerID`),
  KEY `key_next` (`nextEventEpoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_triggerevent`
--

LOCK TABLES `worker_triggerevent` WRITE;
/*!40000 ALTER TABLE `worker_triggerevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_triggerevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_xhpast`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_xhpast` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_xhpast`;

--
-- Table structure for table `xhpast_parsetree`
--

DROP TABLE IF EXISTS `xhpast_parsetree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xhpast_parsetree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `input` longtext NOT NULL,
  `returnCode` int(10) NOT NULL,
  `stdout` longtext NOT NULL,
  `stderr` longtext NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xhpast_parsetree`
--

LOCK TABLES `xhpast_parsetree` WRITE;
/*!40000 ALTER TABLE `xhpast_parsetree` DISABLE KEYS */;
/*!40000 ALTER TABLE `xhpast_parsetree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `phabricator_xhprof`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phabricator_xhprof` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `phabricator_xhprof`;

--
-- Table structure for table `xhprof_sample`
--

DROP TABLE IF EXISTS `xhprof_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xhprof_sample` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filePHID` varbinary(64) NOT NULL,
  `sampleRate` int(10) unsigned NOT NULL,
  `usTotal` bigint(20) unsigned NOT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `requestPath` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `userPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filePHID` (`filePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xhprof_sample`
--

LOCK TABLES `xhprof_sample` WRITE;
/*!40000 ALTER TABLE `xhprof_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `xhprof_sample` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 11:48:48
