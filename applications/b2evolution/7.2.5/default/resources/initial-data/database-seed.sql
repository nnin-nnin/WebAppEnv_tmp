/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: b2evolution
-- ------------------------------------------------------
-- Server version	10.11.19-MariaDB-ubu2204

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
-- Table structure for table `evo_antispam__iprange`
--

DROP TABLE IF EXISTS `evo_antispam__iprange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_antispam__iprange` (
  `aipr_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aipr_IPv4start` int(10) unsigned NOT NULL,
  `aipr_IPv4end` int(10) unsigned NOT NULL,
  `aipr_user_count` int(10) unsigned DEFAULT 0,
  `aipr_contact_email_count` int(10) unsigned DEFAULT 0,
  `aipr_status` enum('trusted','probably_ok','suspect','very_suspect','blocked') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `aipr_block_count` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`aipr_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_antispam__iprange`
--

LOCK TABLES `evo_antispam__iprange` WRITE;
/*!40000 ALTER TABLE `evo_antispam__iprange` DISABLE KEYS */;
INSERT INTO `evo_antispam__iprange` VALUES
(1,2130706432,2130706687,0,0,'trusted',0),
(2,167772160,184549375,0,0,'trusted',0),
(3,2886729728,2887778303,0,0,'trusted',0),
(4,3232235520,3232301055,1,0,'trusted',0);
/*!40000 ALTER TABLE `evo_antispam__iprange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_antispam__keyword`
--

DROP TABLE IF EXISTS `evo_antispam__keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_antispam__keyword` (
  `askw_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `askw_string` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `askw_source` enum('local','reported','central') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'reported',
  PRIMARY KEY (`askw_ID`),
  UNIQUE KEY `askw_string` (`askw_string`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_antispam__keyword`
--

LOCK TABLES `evo_antispam__keyword` WRITE;
/*!40000 ALTER TABLE `evo_antispam__keyword` DISABLE KEYS */;
INSERT INTO `evo_antispam__keyword` VALUES
(1,'online-casino','reported'),
(2,'penis-enlargement','reported'),
(3,'order-viagra','reported'),
(4,'order-phentermine','reported'),
(5,'order-xenical','reported'),
(6,'order-prophecia','reported'),
(7,'sexy-lingerie','reported'),
(8,'-porn-','reported'),
(9,'-adult-','reported'),
(10,'-tits-','reported'),
(11,'buy-phentermine','reported'),
(12,'order-cheap-pills','reported'),
(13,'buy-xenadrine','reported'),
(14,'paris-hilton','reported'),
(15,'parishilton','reported'),
(16,'camgirls','reported'),
(17,'adult-models','reported');
/*!40000 ALTER TABLE `evo_antispam__keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_automation__automation`
--

DROP TABLE IF EXISTS `evo_automation__automation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_automation__automation` (
  `autm_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `autm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `autm_status` enum('paused','active') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'paused',
  `autm_owner_user_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`autm_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_automation__automation`
--

LOCK TABLES `evo_automation__automation` WRITE;
/*!40000 ALTER TABLE `evo_automation__automation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_automation__automation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_automation__newsletter`
--

DROP TABLE IF EXISTS `evo_automation__newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_automation__newsletter` (
  `aunl_autm_ID` int(10) unsigned NOT NULL,
  `aunl_enlt_ID` int(10) unsigned NOT NULL,
  `aunl_autostart` tinyint(1) unsigned DEFAULT 1,
  `aunl_autoexit` tinyint(1) unsigned DEFAULT 1,
  `aunl_order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`aunl_autm_ID`,`aunl_enlt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_automation__newsletter`
--

LOCK TABLES `evo_automation__newsletter` WRITE;
/*!40000 ALTER TABLE `evo_automation__newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_automation__newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_automation__step`
--

DROP TABLE IF EXISTS `evo_automation__step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_automation__step` (
  `step_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `step_autm_ID` int(10) unsigned NOT NULL,
  `step_order` int(11) NOT NULL DEFAULT 1,
  `step_label` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step_type` enum('if_condition','send_campaign','notify_owner','add_usertag','remove_usertag','subscribe','unsubscribe','start_automation','user_status') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'if_condition',
  `step_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step_yes_next_step_ID` int(11) DEFAULT NULL COMMENT 'Must be unsigned for special values like -1 = STOP',
  `step_yes_next_step_delay` int(10) unsigned DEFAULT NULL,
  `step_no_next_step_ID` int(11) DEFAULT NULL COMMENT 'Must be unsigned for special values like -1 = STOP',
  `step_no_next_step_delay` int(10) unsigned DEFAULT NULL,
  `step_error_next_step_ID` int(11) DEFAULT NULL COMMENT 'Must be unsigned for special values like -1 = STOP',
  `step_error_next_step_delay` int(10) unsigned DEFAULT NULL,
  `step_diagram` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`step_ID`),
  UNIQUE KEY `step_autm_ID_order` (`step_autm_ID`,`step_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_automation__step`
--

LOCK TABLES `evo_automation__step` WRITE;
/*!40000 ALTER TABLE `evo_automation__step` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_automation__step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_automation__user_state`
--

DROP TABLE IF EXISTS `evo_automation__user_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_automation__user_state` (
  `aust_autm_ID` int(10) unsigned NOT NULL,
  `aust_user_ID` int(10) unsigned NOT NULL,
  `aust_next_step_ID` int(10) unsigned DEFAULT NULL,
  `aust_next_exec_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`aust_autm_ID`,`aust_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_automation__user_state`
--

LOCK TABLES `evo_automation__user_state` WRITE;
/*!40000 ALTER TABLE `evo_automation__user_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_automation__user_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_basedomains`
--

DROP TABLE IF EXISTS `evo_basedomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_basedomains` (
  `dom_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dom_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `dom_status` enum('unknown','trusted','suspect','blocked') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'unknown',
  `dom_type` enum('unknown','normal','searcheng','aggregator','email') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'unknown',
  `dom_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dom_source_tag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dom_ID`),
  UNIQUE KEY `dom_name` (`dom_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_basedomains`
--

LOCK TABLES `evo_basedomains` WRITE;
/*!40000 ALTER TABLE `evo_basedomains` DISABLE KEYS */;
INSERT INTO `evo_basedomains` VALUES
(1,'localhost','unknown','email',NULL,NULL);
/*!40000 ALTER TABLE `evo_basedomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_bloggroups`
--

DROP TABLE IF EXISTS `evo_bloggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_bloggroups` (
  `bloggroup_blog_ID` int(10) unsigned NOT NULL DEFAULT 0,
  `bloggroup_group_ID` int(10) unsigned NOT NULL DEFAULT 0,
  `bloggroup_ismember` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_can_be_assignee` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_workflow_status` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_workflow_user` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_workflow_priority` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_item_propose` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_poststatuses` set('review','draft','private','protected','deprecated','community','published','redirected') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `bloggroup_perm_item_type` enum('standard','restricted','admin') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'standard',
  `bloggroup_perm_edit` enum('no','own','lt','le','all') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'no',
  `bloggroup_perm_delpost` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_edit_ts` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_delcmts` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_recycle_owncmts` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_vote_spam_cmts` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_cmtstatuses` set('review','draft','private','protected','deprecated','community','published') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `bloggroup_perm_edit_cmt` enum('no','own','anon','lt','le','all') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'no',
  `bloggroup_perm_meta_comment` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_cats` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_properties` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_admin` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_media_upload` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_media_browse` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_media_change` tinyint(4) NOT NULL DEFAULT 0,
  `bloggroup_perm_analytics` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`bloggroup_blog_ID`,`bloggroup_group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_bloggroups`
--

LOCK TABLES `evo_bloggroups` WRITE;
/*!40000 ALTER TABLE `evo_bloggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_bloggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_blogs`
--

DROP TABLE IF EXISTS `evo_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_blogs` (
  `blog_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_sec_ID` int(10) unsigned NOT NULL DEFAULT 1,
  `blog_shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `blog_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `blog_owner_user_ID` int(10) unsigned NOT NULL DEFAULT 1,
  `blog_advanced_perms` tinyint(1) NOT NULL DEFAULT 0,
  `blog_tagline` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `blog_shortdesc` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `blog_longdesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_locale` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'en-EU',
  `blog_access_type` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'extrapath',
  `blog_siteurl` varchar(120) NOT NULL DEFAULT '',
  `blog_urlname` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'urlname',
  `blog_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_keywords` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_allowtrackbacks` tinyint(1) NOT NULL DEFAULT 0,
  `blog_allowblogcss` tinyint(1) NOT NULL DEFAULT 1,
  `blog_allowusercss` tinyint(1) NOT NULL DEFAULT 1,
  `blog_in_bloglist` enum('public','logged','member','never') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'public',
  `blog_links_blog_ID` int(10) unsigned DEFAULT NULL,
  `blog_media_location` enum('default','subdir','custom','none') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'default',
  `blog_media_subdir` varchar(255) DEFAULT NULL,
  `blog_media_fullpath` varchar(255) DEFAULT NULL,
  `blog_media_url` varchar(255) DEFAULT NULL,
  `blog_type` varchar(16) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'std',
  `blog_order` int(11) DEFAULT NULL,
  `blog_normal_skin_ID` int(10) unsigned DEFAULT NULL,
  `blog_mobile_skin_ID` int(10) unsigned DEFAULT NULL,
  `blog_tablet_skin_ID` int(10) unsigned DEFAULT NULL,
  `blog_alt_skin_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`blog_ID`),
  UNIQUE KEY `blog_urlname` (`blog_urlname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_blogs`
--

LOCK TABLES `evo_blogs` WRITE;
/*!40000 ALTER TABLE `evo_blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_blogusers`
--

DROP TABLE IF EXISTS `evo_blogusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_blogusers` (
  `bloguser_blog_ID` int(10) unsigned NOT NULL DEFAULT 0,
  `bloguser_user_ID` int(10) unsigned NOT NULL DEFAULT 0,
  `bloguser_ismember` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_can_be_assignee` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_workflow_status` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_workflow_user` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_workflow_priority` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_item_propose` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_poststatuses` set('review','draft','private','protected','deprecated','community','published','redirected') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `bloguser_perm_item_type` enum('standard','restricted','admin') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'standard',
  `bloguser_perm_edit` enum('no','own','lt','le','all') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'no',
  `bloguser_perm_delpost` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_edit_ts` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_delcmts` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_recycle_owncmts` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_vote_spam_cmts` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_cmtstatuses` set('review','draft','private','protected','deprecated','community','published') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `bloguser_perm_edit_cmt` enum('no','own','anon','lt','le','all') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'no',
  `bloguser_perm_meta_comment` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_cats` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_properties` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_admin` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_media_upload` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_media_browse` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_media_change` tinyint(4) NOT NULL DEFAULT 0,
  `bloguser_perm_analytics` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`bloguser_blog_ID`,`bloguser_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_blogusers`
--

LOCK TABLES `evo_blogusers` WRITE;
/*!40000 ALTER TABLE `evo_blogusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_blogusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_categories`
--

DROP TABLE IF EXISTS `evo_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_categories` (
  `cat_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_parent_ID` int(10) unsigned DEFAULT NULL,
  `cat_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_urlname` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `cat_blog_ID` int(10) unsigned NOT NULL DEFAULT 2,
  `cat_image_file_ID` int(10) unsigned DEFAULT NULL,
  `cat_social_media_image_file_ID` int(10) unsigned DEFAULT NULL,
  `cat_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_order` int(11) DEFAULT NULL,
  `cat_subcat_ordering` enum('parent','alpha','manual') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `cat_meta` tinyint(1) NOT NULL DEFAULT 0,
  `cat_lock` tinyint(1) NOT NULL DEFAULT 0,
  `cat_last_touched_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `cat_ityp_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cat_ID`),
  UNIQUE KEY `cat_urlname` (`cat_urlname`),
  KEY `cat_blog_ID` (`cat_blog_ID`),
  KEY `cat_parent_ID` (`cat_parent_ID`),
  KEY `cat_order` (`cat_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_categories`
--

LOCK TABLES `evo_categories` WRITE;
/*!40000 ALTER TABLE `evo_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_coll_favs`
--

DROP TABLE IF EXISTS `evo_coll_favs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_coll_favs` (
  `cufv_user_ID` int(10) unsigned NOT NULL,
  `cufv_blog_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cufv_user_ID`,`cufv_blog_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_coll_favs`
--

LOCK TABLES `evo_coll_favs` WRITE;
/*!40000 ALTER TABLE `evo_coll_favs` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_coll_favs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_coll_locales`
--

DROP TABLE IF EXISTS `evo_coll_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_coll_locales` (
  `cl_coll_ID` int(10) unsigned NOT NULL,
  `cl_locale` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `cl_linked_coll_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cl_coll_ID`,`cl_locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_coll_locales`
--

LOCK TABLES `evo_coll_locales` WRITE;
/*!40000 ALTER TABLE `evo_coll_locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_coll_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_coll_settings`
--

DROP TABLE IF EXISTS `evo_coll_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_coll_settings` (
  `cset_coll_ID` int(10) unsigned NOT NULL,
  `cset_name` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `cset_value` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'The AdSense plugin wants to store very long snippets of HTML',
  PRIMARY KEY (`cset_coll_ID`,`cset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_coll_settings`
--

LOCK TABLES `evo_coll_settings` WRITE;
/*!40000 ALTER TABLE `evo_coll_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_coll_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_coll_url_aliases`
--

DROP TABLE IF EXISTS `evo_coll_url_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_coll_url_aliases` (
  `cua_coll_ID` int(10) unsigned NOT NULL,
  `cua_url_alias` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`cua_url_alias`),
  KEY `cua_coll_ID` (`cua_coll_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_coll_url_aliases`
--

LOCK TABLES `evo_coll_url_aliases` WRITE;
/*!40000 ALTER TABLE `evo_coll_url_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_coll_url_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_comments`
--

DROP TABLE IF EXISTS `evo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_comments` (
  `comment_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_item_ID` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_type` enum('comment','linkback','trackback','pingback','meta','webmention') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'comment',
  `comment_status` enum('published','community','deprecated','protected','private','review','draft','trash') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'draft',
  `comment_in_reply_to_cmt_ID` int(10) unsigned DEFAULT NULL,
  `comment_author_user_ID` int(10) unsigned DEFAULT NULL,
  `comment_author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_author_email` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `comment_author_url` varchar(255) DEFAULT NULL,
  `comment_author_IP` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `comment_IP_ctry_ID` int(10) unsigned DEFAULT NULL,
  `comment_date` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `comment_last_touched_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_renderers` varchar(4000) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `comment_rating` tinyint(1) DEFAULT NULL,
  `comment_featured` tinyint(1) NOT NULL DEFAULT 0,
  `comment_author_url_nofollow` tinyint(1) NOT NULL DEFAULT 1,
  `comment_author_url_ugc` tinyint(1) NOT NULL DEFAULT 1,
  `comment_author_url_sponsored` tinyint(1) NOT NULL DEFAULT 0,
  `comment_helpful_addvotes` int(11) NOT NULL DEFAULT 0,
  `comment_helpful_countvotes` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_spam_addvotes` int(11) NOT NULL DEFAULT 0,
  `comment_spam_countvotes` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_spam_karma` tinyint(4) DEFAULT NULL,
  `comment_allow_msgform` tinyint(4) NOT NULL DEFAULT 0,
  `comment_anon_notify` tinyint(1) NOT NULL DEFAULT 0,
  `comment_anon_notify_last` varchar(16) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `comment_secret` char(32) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `comment_notif_status` enum('noreq','todo','started','finished') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'noreq' COMMENT 'Have notifications been sent for this comment? How far are we in the process?',
  `comment_notif_ctsk_ID` int(10) unsigned DEFAULT NULL COMMENT 'When notifications for this comment are sent through a scheduled job, what is the job ID?',
  `comment_notif_flags` set('moderators_notified','members_notified','community_notified') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_item_ID` (`comment_item_ID`),
  KEY `comment_date` (`comment_date`),
  KEY `comment_type` (`comment_type`),
  KEY `comment_status` (`comment_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_comments`
--

LOCK TABLES `evo_comments` WRITE;
/*!40000 ALTER TABLE `evo_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_comments__prerendering`
--

DROP TABLE IF EXISTS `evo_comments__prerendering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_comments__prerendering` (
  `cmpr_cmt_ID` int(10) unsigned NOT NULL,
  `cmpr_format` enum('htmlbody','entityencoded','xml','text') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `cmpr_renderers` varchar(4000) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `cmpr_content_prerendered` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmpr_datemodified` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`cmpr_cmt_ID`,`cmpr_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_comments__prerendering`
--

LOCK TABLES `evo_comments__prerendering` WRITE;
/*!40000 ALTER TABLE `evo_comments__prerendering` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_comments__prerendering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_comments__votes`
--

DROP TABLE IF EXISTS `evo_comments__votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_comments__votes` (
  `cmvt_cmt_ID` int(10) unsigned NOT NULL,
  `cmvt_user_ID` int(10) unsigned NOT NULL,
  `cmvt_helpful` tinyint(1) DEFAULT NULL,
  `cmvt_spam` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cmvt_cmt_ID`,`cmvt_user_ID`),
  KEY `cmvt_cmt_ID` (`cmvt_cmt_ID`),
  KEY `cmvt_user_ID` (`cmvt_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_comments__votes`
--

LOCK TABLES `evo_comments__votes` WRITE;
/*!40000 ALTER TABLE `evo_comments__votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_comments__votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_cron__log`
--

DROP TABLE IF EXISTS `evo_cron__log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_cron__log` (
  `clog_ctsk_ID` int(10) unsigned NOT NULL,
  `clog_realstart_datetime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `clog_realstop_datetime` timestamp NULL DEFAULT NULL,
  `clog_status` enum('started','finished','error','imap_error','timeout','warning') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'started',
  `clog_messages` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clog_actions_num` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`clog_ctsk_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_cron__log`
--

LOCK TABLES `evo_cron__log` WRITE;
/*!40000 ALTER TABLE `evo_cron__log` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_cron__log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_cron__task`
--

DROP TABLE IF EXISTS `evo_cron__task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_cron__task` (
  `ctsk_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctsk_start_datetime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `ctsk_repeat_after` int(10) unsigned DEFAULT NULL,
  `ctsk_repeat_variation` int(10) unsigned DEFAULT 0,
  `ctsk_key` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ctsk_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Specific name of this task. This value is set only if this job name was modified by an admin user',
  `ctsk_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ctsk_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_cron__task`
--

LOCK TABLES `evo_cron__task` WRITE;
/*!40000 ALTER TABLE `evo_cron__task` DISABLE KEYS */;
INSERT INTO `evo_cron__task` VALUES
(1,'2026-09-23 00:00:00',300,0,'execute-automations',NULL,'N;'),
(2,'2026-09-24 00:03:00',660,0,'process-return-path-inbox',NULL,'N;'),
(3,'2026-09-24 01:06:00',1740,0,'send-unread-messages-reminders',NULL,'N;'),
(4,'2026-09-24 01:09:00',1860,0,'send-non-activated-account-reminders',NULL,'N;'),
(5,'2026-09-24 02:00:00',86400,0,'prune-old-files-from-page-cache',NULL,'N;'),
(6,'2026-09-24 02:15:00',86400,0,'process-hit-log',NULL,'N;'),
(7,'2026-09-24 02:30:00',86400,0,'prune-old-hits-and-sessions',NULL,'N;'),
(8,'2026-09-24 02:45:00',86400,0,'poll-antispam-blacklist',NULL,'N;'),
(9,'2026-09-24 03:00:00',86400,0,'send-unmoderated-posts-reminders',NULL,'N;'),
(10,'2026-09-24 03:15:00',86400,0,'send-inactive-account-reminders',NULL,'N;'),
(11,'2026-09-24 03:30:00',86400,0,'send-unmoderated-comments-reminders',NULL,'N;'),
(12,'2026-09-24 03:45:00',86400,0,'prune-recycled-comments',NULL,'N;'),
(13,'2026-09-24 04:00:00',86400,0,'cleanup-email-logs',NULL,'N;'),
(14,'2026-09-24 04:15:00',86400,0,'manage-email-statuses',NULL,'N;'),
(15,'2026-09-24 04:30:00',86400,0,'cleanup-scheduled-jobs',NULL,'N;'),
(16,'2026-09-24 04:45:00',86400,0,'light-db-maintenance',NULL,'N;'),
(17,'2026-09-27 05:00:00',604800,0,'monthly-alert-old-contents',NULL,'N;'),
(18,'2026-09-27 05:15:00',604800,0,'heavy-db-maintenance',NULL,'N;');
/*!40000 ALTER TABLE `evo_cron__task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_email__address`
--

DROP TABLE IF EXISTS `evo_email__address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_email__address` (
  `emadr_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emadr_address` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `emadr_status` enum('unknown','working','unattended','redemption','warning','suspicious1','suspicious2','suspicious3','prmerror','spammer') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'unknown',
  `emadr_sent_count` int(10) unsigned NOT NULL DEFAULT 0,
  `emadr_sent_last_returnerror` int(10) unsigned NOT NULL DEFAULT 0,
  `emadr_prmerror_count` int(10) unsigned NOT NULL DEFAULT 0,
  `emadr_tmperror_count` int(10) unsigned NOT NULL DEFAULT 0,
  `emadr_spamerror_count` int(10) unsigned NOT NULL DEFAULT 0,
  `emadr_othererror_count` int(10) unsigned NOT NULL DEFAULT 0,
  `emadr_last_sent_ts` timestamp NULL DEFAULT NULL,
  `emadr_last_error_ts` timestamp NULL DEFAULT NULL,
  `emadr_last_open_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`emadr_ID`),
  UNIQUE KEY `emadr_address` (`emadr_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_email__address`
--

LOCK TABLES `evo_email__address` WRITE;
/*!40000 ALTER TABLE `evo_email__address` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_email__address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_email__campaign`
--

DROP TABLE IF EXISTS `evo_email__campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_email__campaign` (
  `ecmp_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ecmp_date_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `ecmp_enlt_ID` int(10) unsigned NOT NULL,
  `ecmp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ecmp_email_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_email_defaultdest` varchar(255) DEFAULT NULL,
  `ecmp_email_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_email_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_email_plaintext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_sync_plaintext` tinyint(1) NOT NULL DEFAULT 1,
  `ecmp_sent_ts` timestamp NULL DEFAULT NULL,
  `ecmp_auto_sent_ts` timestamp NULL DEFAULT NULL,
  `ecmp_renderers` varchar(4000) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ecmp_use_wysiwyg` tinyint(1) NOT NULL DEFAULT 0,
  `ecmp_send_ctsk_ID` int(10) unsigned DEFAULT NULL,
  `ecmp_welcome` tinyint(1) NOT NULL DEFAULT 0,
  `ecmp_activate` tinyint(1) NOT NULL DEFAULT 0,
  `ecmp_user_tag_sendskip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_user_tag_sendsuccess` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_user_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_user_tag_cta1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_user_tag_cta2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_user_tag_cta3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_user_tag_like` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_user_tag_dislike` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_user_tag_activate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_user_tag_unsubscribe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecmp_send_count` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_open_count` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_img_loads` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_link_clicks` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_cta1_clicks` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_cta2_clicks` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_cta3_clicks` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_like_count` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_dislike_count` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_unsub_clicks` int(10) unsigned NOT NULL DEFAULT 0,
  `ecmp_cta1_autm_ID` int(10) unsigned DEFAULT NULL,
  `ecmp_cta1_autm_execute` tinyint(1) NOT NULL DEFAULT 1,
  `ecmp_cta2_autm_ID` int(10) unsigned DEFAULT NULL,
  `ecmp_cta2_autm_execute` tinyint(1) NOT NULL DEFAULT 1,
  `ecmp_cta3_autm_ID` int(10) unsigned DEFAULT NULL,
  `ecmp_cta3_autm_execute` tinyint(1) NOT NULL DEFAULT 1,
  `ecmp_like_autm_ID` int(10) unsigned DEFAULT NULL,
  `ecmp_like_autm_execute` tinyint(1) NOT NULL DEFAULT 1,
  `ecmp_dislike_autm_ID` int(10) unsigned DEFAULT NULL,
  `ecmp_dislike_autm_execute` tinyint(1) NOT NULL DEFAULT 1,
  `ecmp_activate_autm_ID` int(10) unsigned DEFAULT NULL,
  `ecmp_activate_autm_execute` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ecmp_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_email__campaign`
--

LOCK TABLES `evo_email__campaign` WRITE;
/*!40000 ALTER TABLE `evo_email__campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_email__campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_email__campaign_send`
--

DROP TABLE IF EXISTS `evo_email__campaign_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_email__campaign_send` (
  `csnd_camp_ID` int(10) unsigned NOT NULL,
  `csnd_user_ID` int(10) unsigned NOT NULL,
  `csnd_status` enum('ready_to_send','ready_to_resend','sent','send_error','skipped') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'ready_to_send',
  `csnd_emlog_ID` int(10) unsigned DEFAULT NULL,
  `csnd_clicked_unsubscribe` tinyint(1) unsigned DEFAULT 0,
  `csnd_last_sent_ts` timestamp NULL DEFAULT NULL,
  `csnd_last_open_ts` timestamp NULL DEFAULT NULL,
  `csnd_last_click_ts` timestamp NULL DEFAULT NULL,
  `csnd_like` tinyint(1) DEFAULT NULL,
  `csnd_cta1` tinyint(1) DEFAULT NULL,
  `csnd_cta2` tinyint(1) DEFAULT NULL,
  `csnd_cta3` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`csnd_camp_ID`,`csnd_user_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_email__campaign_send`
--

LOCK TABLES `evo_email__campaign_send` WRITE;
/*!40000 ALTER TABLE `evo_email__campaign_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_email__campaign_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_email__log`
--

DROP TABLE IF EXISTS `evo_email__log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_email__log` (
  `emlog_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emlog_key` char(32) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `emlog_timestamp` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `emlog_user_ID` int(10) unsigned DEFAULT NULL,
  `emlog_to` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `emlog_result` enum('ok','error','blocked','simulated','ready_to_send') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'ok',
  `emlog_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emlog_headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emlog_message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emlog_last_open_ts` timestamp NULL DEFAULT NULL,
  `emlog_last_click_ts` timestamp NULL DEFAULT NULL,
  `emlog_camp_ID` int(10) unsigned DEFAULT NULL COMMENT 'Used to reference campaign when there is no associated campaign_send or the previously associated campaign_send updated its csnd_emlog_ID',
  `emlog_autm_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`emlog_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_email__log`
--

LOCK TABLES `evo_email__log` WRITE;
/*!40000 ALTER TABLE `evo_email__log` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_email__log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_email__newsletter`
--

DROP TABLE IF EXISTS `evo_email__newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_email__newsletter` (
  `enlt_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enlt_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enlt_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enlt_active` tinyint(1) unsigned DEFAULT 1,
  `enlt_order` int(11) DEFAULT NULL,
  `enlt_owner_user_ID` int(10) unsigned NOT NULL,
  `enlt_perm_subscribe` enum('admin','anyone','group') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'anyone',
  `enlt_perm_groups` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`enlt_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_email__newsletter`
--

LOCK TABLES `evo_email__newsletter` WRITE;
/*!40000 ALTER TABLE `evo_email__newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_email__newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_email__newsletter_subscription`
--

DROP TABLE IF EXISTS `evo_email__newsletter_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_email__newsletter_subscription` (
  `enls_user_ID` int(10) unsigned NOT NULL,
  `enls_enlt_ID` int(10) unsigned NOT NULL,
  `enls_last_sent_manual_ts` timestamp NULL DEFAULT NULL,
  `enls_last_sent_auto_ts` timestamp NULL DEFAULT NULL,
  `enls_last_open_ts` timestamp NULL DEFAULT NULL,
  `enls_last_click_ts` timestamp NULL DEFAULT NULL,
  `enls_send_count` int(10) unsigned NOT NULL DEFAULT 0,
  `enls_subscribed` tinyint(1) unsigned DEFAULT 1,
  `enls_subscribed_ts` timestamp NULL DEFAULT NULL,
  `enls_unsubscribed_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`enls_user_ID`,`enls_enlt_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_email__newsletter_subscription`
--

LOCK TABLES `evo_email__newsletter_subscription` WRITE;
/*!40000 ALTER TABLE `evo_email__newsletter_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_email__newsletter_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_email__returns`
--

DROP TABLE IF EXISTS `evo_email__returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_email__returns` (
  `emret_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emret_address` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `emret_errormsg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emret_timestamp` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `emret_headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emret_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emret_errtype` char(1) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'U',
  PRIMARY KEY (`emret_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_email__returns`
--

LOCK TABLES `evo_email__returns` WRITE;
/*!40000 ALTER TABLE `evo_email__returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_email__returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_files`
--

DROP TABLE IF EXISTS `evo_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_files` (
  `file_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_creator_user_ID` int(10) unsigned DEFAULT NULL,
  `file_type` enum('image','audio','video','other') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `file_root_type` enum('absolute','user','collection','shared','skins','siteskins','plugins','import','emailcampaign') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'absolute',
  `file_root_ID` int(10) unsigned NOT NULL DEFAULT 0,
  `file_path` varchar(767) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `file_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `file_width` int(10) unsigned DEFAULT NULL,
  `file_height` int(10) unsigned DEFAULT NULL,
  `file_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_hash` binary(16) DEFAULT NULL,
  `file_path_hash` binary(16) DEFAULT NULL,
  `file_can_be_main_profile` tinyint(1) NOT NULL DEFAULT 1,
  `file_download_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`file_ID`),
  UNIQUE KEY `file_path` (`file_path_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_files`
--

LOCK TABLES `evo_files` WRITE;
/*!40000 ALTER TABLE `evo_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_filetypes`
--

DROP TABLE IF EXISTS `evo_filetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_filetypes` (
  `ftyp_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ftyp_extensions` varchar(30) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ftyp_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ftyp_mimetype` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ftyp_icon` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ftyp_viewtype` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ftyp_allowed` enum('any','registered','admin') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`ftyp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_filetypes`
--

LOCK TABLES `evo_filetypes` WRITE;
/*!40000 ALTER TABLE `evo_filetypes` DISABLE KEYS */;
INSERT INTO `evo_filetypes` VALUES
(1,'gif','GIF image','image/gif','file_image','image','any'),
(2,'png','PNG image','image/png','file_image','image','any'),
(3,'jpg jpeg','JPEG image','image/jpeg','file_image','image','any'),
(4,'txt','Text file','text/plain','file_document','text','registered'),
(5,'htm html','HTML file','text/html','file_www','browser','admin'),
(6,'pdf','PDF file','application/pdf','file_pdf','browser','registered'),
(7,'doc docx','Microsoft Word file','application/msword','file_doc','external','registered'),
(8,'xls xlsx','Microsoft Excel file','application/vnd.ms-excel','file_xls','external','registered'),
(9,'ppt pptx','Powerpoint','application/vnd.ms-powerpoint','file_ppt','external','registered'),
(10,'pps','Slideshow','pps','file_pps','external','registered'),
(11,'zip','ZIP archive','application/zip','file_zip','external','registered'),
(12,'php php3 php4 php5 php6','PHP script','application/x-httpd-php','file_php','text','admin'),
(13,'css','Style sheet','text/css','file_document','text','registered'),
(14,'mp3','MPEG audio file','audio/mpeg','file_sound','browser','registered'),
(15,'m4a','MPEG audio file','audio/x-m4a','file_sound','browser','registered'),
(16,'mp4 f4v','MPEG video','video/mp4','file_video','browser','registered'),
(17,'mov','Quicktime video','video/quicktime','file_video','browser','registered'),
(18,'m4v','MPEG video file','video/x-m4v','file_video','browser','registered'),
(19,'flv','Flash video file','video/x-flv','file_video','browser','registered'),
(20,'swf','Flash video file','application/x-shockwave-flash','file_video','browser','admin'),
(21,'webm','WebM video file','video/webm','file_video','browser','registered'),
(22,'ogv','Ogg video file','video/ogg','file_video','browser','registered'),
(23,'m3u8','M3U8 video file','application/x-mpegurl','file_video','browser','registered'),
(24,'xml','XML file','application/xml','file_www','browser','admin'),
(25,'md','Markdown text file','text/plain','file_document','text','registered'),
(26,'csv','CSV file','text/plain','file_document','text','registered'),
(27,'svg','SVG file','image/svg+xml','file_document','image','admin'),
(28,'ico','ICO image','image/x-icon','file_image','image','admin');
/*!40000 ALTER TABLE `evo_filetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_global__cache`
--

DROP TABLE IF EXISTS `evo_global__cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_global__cache` (
  `cach_name` varchar(30) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `cach_cache` mediumblob DEFAULT NULL,
  PRIMARY KEY (`cach_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_global__cache`
--

LOCK TABLES `evo_global__cache` WRITE;
/*!40000 ALTER TABLE `evo_global__cache` DISABLE KEYS */;
INSERT INTO `evo_global__cache` VALUES
('creds','a:3:{i:0;a:1:{s:0:\"\";a:2:{i:0;a:3:{i:0;i:6;i:1;s:19:\"http://evocore.net/\";i:2;a:3:{i:0;a:2:{i:0;i:2;i:1;s:13:\"PHP framework\";}i:1;a:2:{i:0;i:4;i:1;s:9:\"framework\";}i:2;a:2:{i:0;i:6;i:1;s:7:\"evoCore\";}}}i:1;a:3:{i:0;i:100;i:1;s:24:\"https://b2evolution.net/\";i:2;a:47:{i:0;a:2:{i:0;i:8;i:1;s:11:\"b2evolution\";}i:1;a:2:{i:0;i:10;i:1;s:5:\"b2evo\";}i:2;a:2:{i:0;i:12;i:1;s:2:\"b2\";}i:3;a:2:{i:0;i:14;i:1;s:3:\"CMS\";}i:4;a:2:{i:0;i:16;i:1;s:12:\"CMS software\";}i:5;a:2:{i:0;i:18;i:1;s:10:\"CMS engine\";}i:6;a:2:{i:0;i:20;i:1;s:15:\"b2evolution CMS\";}i:7;a:2:{i:0;i:22;i:1;s:8:\"Free CMS\";}i:8;a:2:{i:0;i:24;i:1;s:15:\"Open-Source CMS\";}i:9;a:2:{i:0;i:26;i:1;s:15:\"Open Source CMS\";}i:10;a:2:{i:0;i:28;i:1;s:10:\"Secure CMS\";}i:11;a:2:{i:0;i:30;i:1;s:12:\"Advanced CMS\";}i:12;a:2:{i:0;i:32;i:1;s:24:\"Content Mangement System\";}i:13;a:2:{i:0;i:34;i:1;s:10:\"Social CMS\";}i:14;a:2:{i:0;i:36;i:1;s:19:\"Social CMS software\";}i:15;a:2:{i:0;i:38;i:1;s:17:\"Social CMS engine\";}i:16;a:2:{i:0;i:40;i:1;s:23:\"Complete website engine\";}i:17;a:2:{i:0;i:42;i:1;s:15:\"Website builder\";}i:18;a:2:{i:0;i:44;i:1;s:16:\"Web Site Builder\";}i:19;a:2:{i:0;i:46;i:1;s:14:\"Website engine\";}i:20;a:2:{i:0;i:48;i:1;s:15:\"Web Site Engine\";}i:21;a:2:{i:0;i:50;i:1;s:16:\"Multiblog engine\";}i:22;a:2:{i:0;i:52;i:1;s:17:\"Multi-blog engine\";}i:23;a:2:{i:0;i:54;i:1;s:23:\"Multiple blogs solution\";}i:24;a:2:{i:0;i:56;i:1;s:26:\"Multiple blogs done right!\";}i:25;a:2:{i:0;i:58;i:1;s:13:\"Community CMS\";}i:26;a:2:{i:0;i:60;i:1;s:4:\"CCMS\";}i:27;a:2:{i:0;i:62;i:1;s:16:\"b2evolution CCMS\";}i:28;a:2:{i:0;i:64;i:1;s:21:\"Photo albums software\";}i:29;a:2:{i:0;i:66;i:1;s:22:\"Photo gallery software\";}i:30;a:2:{i:0;i:68;i:1;s:23:\"Online manual generator\";}i:31;a:2:{i:0;i:70;i:1;s:18:\"Community software\";}i:32;a:2:{i:0;i:72;i:1;s:15:\"Forums software\";}i:33;a:2:{i:0;i:74;i:1;s:20:\"CMS + user community\";}i:34;a:2:{i:0;i:76;i:1;s:12:\"CMS + forums\";}i:35;a:2:{i:0;i:78;i:1;s:21:\"CMS + email marketing\";}i:36;a:2:{i:0;i:80;i:1;s:20:\"Build your own site!\";}i:37;a:2:{i:0;i:82;i:1;s:23:\"Build your own website!\";}i:38;a:2:{i:0;i:84;i:1;s:21:\"Run your own website!\";}i:39;a:2:{i:0;i:86;i:1;s:13:\"Bootstrap CMS\";}i:40;a:2:{i:0;i:88;i:1;s:18:\"Bootstrap back-end\";}i:41;a:2:{i:0;i:90;i:1;s:18:\"CMS with Bootstrap\";}i:42;a:2:{i:0;i:92;i:1;s:7:\"RWD CMS\";}i:43;a:2:{i:0;i:94;i:1;s:14:\"Responsive CMS\";}i:44;a:2:{i:0;i:96;i:1;s:16:\"Open-source blog\";}i:45;a:2:{i:0;i:98;i:1;s:16:\"Free blog engine\";}i:46;a:2:{i:0;i:100;i:1;s:13:\"Blog software\";}}}}}i:1;a:1:{s:0:\"\";a:1:{i:0;a:2:{i:0;i:100;i:1;s:0:\"\";}}}i:2;a:1:{s:0:\"\";a:1:{i:0;a:2:{i:0;i:100;i:1;s:0:\"\";}}}}'),
('evo_links','a:1:{s:0:\"\";a:1:{i:0;a:3:{i:0;i:100;i:1;s:24:\"https://b2evolution.net/\";i:2;a:50:{i:0;a:2:{i:0;i:1;i:1;s:22:\"powered by b2evolution\";}i:1;a:2:{i:0;i:3;i:1;s:26:\"powered by b2evolution CMS\";}i:2;a:2:{i:0;i:5;i:1;s:29:\"powered by an open-source CMS\";}i:3;a:2:{i:0;i:7;i:1;s:17:\"Multi-blog engine\";}i:4;a:2:{i:0;i:9;i:1;s:7:\"RWD CMS\";}i:5;a:2:{i:0;i:11;i:1;s:14:\"Responsive CMS\";}i:6;a:2:{i:0;i:13;i:1;s:13:\"Bootstrap CMS\";}i:7;a:2:{i:0;i:15;i:1;s:3:\"CMS\";}i:8;a:2:{i:0;i:17;i:1;s:15:\"Open-Source CMS\";}i:9;a:2:{i:0;i:19;i:1;s:16:\"Open-source blog\";}i:10;a:2:{i:0;i:21;i:1;s:15:\"Web Site Engine\";}i:11;a:2:{i:0;i:23;i:1;s:17:\"Social CMS engine\";}i:12;a:2:{i:0;i:25;i:1;s:23:\"Complete website engine\";}i:13;a:2:{i:0;i:27;i:1;s:23:\"Multiple blogs solution\";}i:14;a:2:{i:0;i:29;i:1;s:10:\"CMS engine\";}i:15;a:2:{i:0;i:31;i:1;s:23:\"Online manual generator\";}i:16;a:2:{i:0;i:33;i:1;s:18:\"Community software\";}i:17;a:2:{i:0;i:35;i:1;s:5:\"b2evo\";}i:18;a:2:{i:0;i:37;i:1;s:15:\"b2evolution CMS\";}i:19;a:2:{i:0;i:39;i:1;s:23:\"Build your own website!\";}i:20;a:2:{i:0;i:41;i:1;s:8:\"Free CMS\";}i:21;a:2:{i:0;i:43;i:1;s:21:\"Run your own website!\";}i:22;a:2:{i:0;i:45;i:1;s:10:\"Secure CMS\";}i:23;a:2:{i:0;i:47;i:1;s:12:\"Advanced CMS\";}i:24;a:2:{i:0;i:49;i:1;s:24:\"Content Mangement System\";}i:25;a:2:{i:0;i:51;i:1;s:10:\"Social CMS\";}i:26;a:2:{i:0;i:53;i:1;s:15:\"Forums software\";}i:27;a:2:{i:0;i:55;i:1;s:20:\"CMS + user community\";}i:28;a:2:{i:0;i:57;i:1;s:16:\"Multiblog engine\";}i:29;a:2:{i:0;i:59;i:1;s:21:\"CMS + email marketing\";}i:30;a:2:{i:0;i:61;i:1;s:16:\"Free blog engine\";}i:31;a:2:{i:0;i:63;i:1;s:13:\"Blog software\";}i:32;a:2:{i:0;i:65;i:1;s:11:\"b2evolution\";}i:33;a:2:{i:0;i:67;i:1;s:15:\"Website builder\";}i:34;a:2:{i:0;i:69;i:1;s:18:\"Bootstrap back-end\";}i:35;a:2:{i:0;i:71;i:1;s:18:\"CMS with Bootstrap\";}i:36;a:2:{i:0;i:73;i:1;s:2:\"b2\";}i:37;a:2:{i:0;i:75;i:1;s:16:\"Web Site Builder\";}i:38;a:2:{i:0;i:77;i:1;s:26:\"Multiple blogs done right!\";}i:39;a:2:{i:0;i:79;i:1;s:14:\"Website engine\";}i:40;a:2:{i:0;i:81;i:1;s:13:\"Community CMS\";}i:41;a:2:{i:0;i:83;i:1;s:4:\"CCMS\";}i:42;a:2:{i:0;i:85;i:1;s:16:\"b2evolution CCMS\";}i:43;a:2:{i:0;i:87;i:1;s:21:\"Photo albums software\";}i:44;a:2:{i:0;i:89;i:1;s:12:\"CMS software\";}i:45;a:2:{i:0;i:91;i:1;s:20:\"Build your own site!\";}i:46;a:2:{i:0;i:93;i:1;s:22:\"Photo gallery software\";}i:47;a:2:{i:0;i:95;i:1;s:19:\"Social CMS software\";}i:48;a:2:{i:0;i:97;i:1;s:12:\"CMS + forums\";}i:49;a:2:{i:0;i:100;i:1;s:15:\"Open Source CMS\";}}}}}'),
('extra_msg','s:0:\"\";'),
('feedhlp','a:1:{i:0;a:1:{s:0:\"\";a:1:{i:0;a:3:{i:0;i:100;i:1;s:46:\"http://webreference.fr/2006/08/30/rss_atom_xml\";i:2;a:2:{i:0;a:2:{i:0;i:16;i:1;s:11:\"More on RSS\";}i:1;a:2:{i:0;i:100;i:1;s:12:\"What is RSS?\";}}}}}}'),
('updates','a:1:{i:0;a:4:{s:4:\"name\";s:27:\"You are already up-to-date!\";s:11:\"description\";s:157:\"You MAY run the auto-upgrade process in an attempt to repair a broken installation. Make sure you are not overwriting a newer version or some custom changes.\";s:7:\"version\";s:23:\"7.2.5-stable-2022-08-06\";s:3:\"url\";s:87:\"http://b2evolution.net/media/blogs/downloads/v7/b2evolution-7.2.5-stable-2022-08-06.zip\";}}'),
('version_status_color','s:5:\"green\";'),
('version_status_msg','s:57:\"You are running the latest stable version of b2evolution.\";');
/*!40000 ALTER TABLE `evo_global__cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_groups`
--

DROP TABLE IF EXISTS `evo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_groups` (
  `grp_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grp_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `grp_usage` enum('primary','secondary') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'primary',
  `grp_level` int(10) unsigned NOT NULL DEFAULT 0,
  `grp_perm_blogs` enum('user','viewall','editall') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'user',
  `grp_perm_bypass_antispam` tinyint(1) NOT NULL DEFAULT 0,
  `grp_perm_xhtmlvalidation` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'always',
  `grp_perm_xhtmlvalidation_xmlrpc` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'always',
  `grp_perm_xhtml_css_tweaks` tinyint(1) NOT NULL DEFAULT 0,
  `grp_perm_xhtml_iframes` tinyint(1) NOT NULL DEFAULT 0,
  `grp_perm_xhtml_javascript` tinyint(1) NOT NULL DEFAULT 0,
  `grp_perm_xhtml_objects` tinyint(1) NOT NULL DEFAULT 0,
  `grp_perm_stats` enum('none','user','view','edit') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'none',
  PRIMARY KEY (`grp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_groups`
--

LOCK TABLES `evo_groups` WRITE;
/*!40000 ALTER TABLE `evo_groups` DISABLE KEYS */;
INSERT INTO `evo_groups` VALUES
(1,'Administrators','primary',10,'editall',0,'always','always',1,0,0,0,'edit'),
(2,'Moderators','primary',8,'viewall',0,'always','always',1,0,0,0,'user'),
(3,'Editors','primary',6,'user',0,'always','always',1,0,0,0,'none'),
(4,'Normal Users','primary',4,'user',0,'always','always',0,0,0,0,'none'),
(5,'Misbehaving/Suspect Users','primary',2,'user',0,'always','always',0,0,0,0,'none'),
(6,'Spammers/Restricted Users','primary',1,'user',0,'always','always',0,0,0,0,'none');
/*!40000 ALTER TABLE `evo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_groups__groupsettings`
--

DROP TABLE IF EXISTS `evo_groups__groupsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_groups__groupsettings` (
  `gset_grp_ID` int(10) unsigned NOT NULL,
  `gset_name` varchar(30) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `gset_value` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`gset_grp_ID`,`gset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_groups__groupsettings`
--

LOCK TABLES `evo_groups__groupsettings` WRITE;
/*!40000 ALTER TABLE `evo_groups__groupsettings` DISABLE KEYS */;
INSERT INTO `evo_groups__groupsettings` VALUES
(1,'comment_moderation_notif','full'),
(1,'comment_subscription_notif','full'),
(1,'cross_country_allow_contact','allowed'),
(1,'cross_country_allow_profiles','allowed'),
(1,'max_new_threads',''),
(1,'perm_admin','normal'),
(1,'perm_allowed_sections','1'),
(1,'perm_api','always'),
(1,'perm_createblog','allowed'),
(1,'perm_default_sec_ID','1'),
(1,'perm_emails','edit'),
(1,'perm_files','all'),
(1,'perm_getblog','denied'),
(1,'perm_import_root','edit'),
(1,'perm_maintenance','upgrade'),
(1,'perm_max_createblog_num',''),
(1,'perm_messaging','delete'),
(1,'perm_options','edit'),
(1,'perm_orgs','edit'),
(1,'perm_plugins_root','edit'),
(1,'perm_polls','edit'),
(1,'perm_shared_root','edit'),
(1,'perm_skins_root','edit'),
(1,'perm_slugs','edit'),
(1,'perm_spamblacklist','edit'),
(1,'perm_users','edit'),
(1,'pm_notif','full'),
(1,'post_assignment_notif','full'),
(1,'post_moderation_notif','full'),
(1,'post_subscription_notif','full'),
(2,'comment_moderation_notif','short'),
(2,'comment_subscription_notif','short'),
(2,'cross_country_allow_contact','allowed'),
(2,'cross_country_allow_profiles','allowed'),
(2,'max_new_threads','10'),
(2,'perm_admin','normal'),
(2,'perm_allowed_sections','1'),
(2,'perm_api','always'),
(2,'perm_createblog','allowed'),
(2,'perm_default_sec_ID','1'),
(2,'perm_emails','view'),
(2,'perm_files','add'),
(2,'perm_getblog','denied'),
(2,'perm_import_root','none'),
(2,'perm_maintenance','none'),
(2,'perm_max_createblog_num',''),
(2,'perm_messaging','write'),
(2,'perm_options','view'),
(2,'perm_orgs','create'),
(2,'perm_plugins_root','none'),
(2,'perm_polls','create'),
(2,'perm_shared_root','add'),
(2,'perm_skins_root','none'),
(2,'perm_slugs','none'),
(2,'perm_spamblacklist','edit'),
(2,'perm_users','moderate'),
(2,'pm_notif','short'),
(2,'post_assignment_notif','short'),
(2,'post_moderation_notif','short'),
(2,'post_subscription_notif','short'),
(3,'comment_moderation_notif','short'),
(3,'comment_subscription_notif','short'),
(3,'cross_country_allow_contact','allowed'),
(3,'cross_country_allow_profiles','allowed'),
(3,'max_new_threads','10'),
(3,'perm_admin','restricted'),
(3,'perm_allowed_sections','1'),
(3,'perm_api','always'),
(3,'perm_createblog','denied'),
(3,'perm_default_sec_ID','1'),
(3,'perm_emails','none'),
(3,'perm_files','edit_allowed'),
(3,'perm_getblog','denied'),
(3,'perm_import_root','none'),
(3,'perm_maintenance','none'),
(3,'perm_max_createblog_num',''),
(3,'perm_messaging','write'),
(3,'perm_options','none'),
(3,'perm_orgs','create'),
(3,'perm_plugins_root','none'),
(3,'perm_polls','create'),
(3,'perm_shared_root','view'),
(3,'perm_skins_root','none'),
(3,'perm_slugs','none'),
(3,'perm_spamblacklist','view'),
(3,'perm_users','none'),
(3,'pm_notif','short'),
(3,'post_assignment_notif','short'),
(3,'post_moderation_notif','short'),
(3,'post_subscription_notif','short'),
(4,'comment_moderation_notif','short'),
(4,'comment_subscription_notif','short'),
(4,'cross_country_allow_contact','allowed'),
(4,'cross_country_allow_profiles','allowed'),
(4,'max_new_threads','5'),
(4,'perm_admin','no_toolbar'),
(4,'perm_allowed_sections','1'),
(4,'perm_api','always'),
(4,'perm_createblog','denied'),
(4,'perm_default_sec_ID','1'),
(4,'perm_emails','none'),
(4,'perm_files','add'),
(4,'perm_getblog','denied'),
(4,'perm_import_root','none'),
(4,'perm_maintenance','none'),
(4,'perm_max_createblog_num',''),
(4,'perm_messaging','write'),
(4,'perm_options','none'),
(4,'perm_orgs','none'),
(4,'perm_plugins_root','none'),
(4,'perm_polls','none'),
(4,'perm_shared_root','none'),
(4,'perm_skins_root','none'),
(4,'perm_slugs','none'),
(4,'perm_spamblacklist','view'),
(4,'perm_users','none'),
(4,'pm_notif','short'),
(4,'post_assignment_notif','short'),
(4,'post_moderation_notif','short'),
(4,'post_subscription_notif','short'),
(5,'comment_moderation_notif','short'),
(5,'comment_subscription_notif','short'),
(5,'cross_country_allow_contact','denied'),
(5,'cross_country_allow_profiles','denied'),
(5,'max_new_threads','1'),
(5,'perm_admin','no_toolbar'),
(5,'perm_allowed_sections','1'),
(5,'perm_api','never'),
(5,'perm_createblog','denied'),
(5,'perm_default_sec_ID','1'),
(5,'perm_emails','none'),
(5,'perm_files','none'),
(5,'perm_getblog','denied'),
(5,'perm_import_root','none'),
(5,'perm_maintenance','none'),
(5,'perm_max_createblog_num',''),
(5,'perm_messaging','write'),
(5,'perm_options','none'),
(5,'perm_orgs','none'),
(5,'perm_plugins_root','none'),
(5,'perm_polls','none'),
(5,'perm_shared_root','none'),
(5,'perm_skins_root','none'),
(5,'perm_slugs','none'),
(5,'perm_spamblacklist','none'),
(5,'perm_users','none'),
(5,'pm_notif','short'),
(5,'post_assignment_notif','short'),
(5,'post_moderation_notif','short'),
(5,'post_subscription_notif','short'),
(6,'comment_moderation_notif','short'),
(6,'comment_subscription_notif','short'),
(6,'cross_country_allow_contact','denied'),
(6,'cross_country_allow_profiles','denied'),
(6,'max_new_threads','1'),
(6,'perm_admin','no_toolbar'),
(6,'perm_allowed_sections','1'),
(6,'perm_api','never'),
(6,'perm_createblog','denied'),
(6,'perm_default_sec_ID','1'),
(6,'perm_emails','none'),
(6,'perm_files','none'),
(6,'perm_getblog','denied'),
(6,'perm_import_root','none'),
(6,'perm_maintenance','none'),
(6,'perm_max_createblog_num',''),
(6,'perm_messaging','reply'),
(6,'perm_options','none'),
(6,'perm_orgs','none'),
(6,'perm_plugins_root','none'),
(6,'perm_polls','none'),
(6,'perm_shared_root','none'),
(6,'perm_skins_root','none'),
(6,'perm_slugs','none'),
(6,'perm_spamblacklist','none'),
(6,'perm_users','none'),
(6,'pm_notif','short'),
(6,'post_assignment_notif','short'),
(6,'post_moderation_notif','short'),
(6,'post_subscription_notif','short');
/*!40000 ALTER TABLE `evo_groups__groupsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_hitlog`
--

DROP TABLE IF EXISTS `evo_hitlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_hitlog` (
  `hit_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hit_sess_ID` int(10) unsigned DEFAULT NULL,
  `hit_datetime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `hit_uri` varchar(250) DEFAULT NULL,
  `hit_disp` varchar(30) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `hit_ctrl` varchar(30) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `hit_action` varchar(30) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `hit_type` enum('standard','rss','admin','ajax','service','api') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'standard',
  `hit_referer_type` enum('search','special','spam','referer','direct','self') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `hit_referer` varchar(250) DEFAULT NULL,
  `hit_referer_dom_ID` int(10) unsigned DEFAULT NULL,
  `hit_keyphrase_keyp_ID` int(10) unsigned DEFAULT NULL,
  `hit_keyphrase` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `hit_serprank` smallint(5) unsigned DEFAULT NULL,
  `hit_coll_ID` int(10) unsigned DEFAULT NULL,
  `hit_remote_addr` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `hit_agent_type` enum('robot','browser','unknown') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'unknown',
  `hit_agent_ID` smallint(5) unsigned DEFAULT NULL,
  `hit_response_code` smallint(6) DEFAULT NULL,
  `hit_method` enum('unknown','GET','POST','PUT','PATCH','DELETE','COPY','HEAD','OPTIONS','LINK','UNLINK','PURGE','LOCK','UNLOCK','PROPFIND','VIEW') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`hit_ID`),
  KEY `hit_coll_ID` (`hit_coll_ID`),
  KEY `hit_uri` (`hit_uri`),
  KEY `hit_referer_dom_ID` (`hit_referer_dom_ID`),
  KEY `hit_remote_addr` (`hit_remote_addr`),
  KEY `hit_sess_ID` (`hit_sess_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_hitlog`
--

LOCK TABLES `evo_hitlog` WRITE;
/*!40000 ALTER TABLE `evo_hitlog` DISABLE KEYS */;
INSERT INTO `evo_hitlog` VALUES
(1,1,'2026-09-23 13:02:47','/','','','','standard','direct','',NULL,NULL,NULL,NULL,NULL,'192.168.80.1','unknown',NULL,200,'GET');
/*!40000 ALTER TABLE `evo_hitlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_hits__aggregate`
--

DROP TABLE IF EXISTS `evo_hits__aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_hits__aggregate` (
  `hagg_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hagg_date` date NOT NULL DEFAULT '2000-01-01',
  `hagg_coll_ID` int(10) unsigned DEFAULT NULL,
  `hagg_type` enum('standard','rss','admin','ajax','service','api') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'standard',
  `hagg_referer_type` enum('search','special','spam','referer','direct','self') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `hagg_agent_type` enum('robot','browser','unknown') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'unknown',
  `hagg_count` int(11) unsigned NOT NULL,
  PRIMARY KEY (`hagg_ID`),
  UNIQUE KEY `hagg_date_coll_ID_types` (`hagg_date`,`hagg_coll_ID`,`hagg_type`,`hagg_referer_type`,`hagg_agent_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_hits__aggregate`
--

LOCK TABLES `evo_hits__aggregate` WRITE;
/*!40000 ALTER TABLE `evo_hits__aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_hits__aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_hits__aggregate_sessions`
--

DROP TABLE IF EXISTS `evo_hits__aggregate_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_hits__aggregate_sessions` (
  `hags_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hags_date` date NOT NULL DEFAULT '2000-01-01',
  `hags_coll_ID` int(10) unsigned DEFAULT NULL,
  `hags_count_browser` int(11) unsigned NOT NULL DEFAULT 0,
  `hags_count_api` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`hags_ID`),
  UNIQUE KEY `hags_date_coll_ID` (`hags_date`,`hags_coll_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_hits__aggregate_sessions`
--

LOCK TABLES `evo_hits__aggregate_sessions` WRITE;
/*!40000 ALTER TABLE `evo_hits__aggregate_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_hits__aggregate_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_i18n_original_string`
--

DROP TABLE IF EXISTS `evo_i18n_original_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_i18n_original_string` (
  `iost_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iost_string` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `iost_inpotfile` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`iost_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_i18n_original_string`
--

LOCK TABLES `evo_i18n_original_string` WRITE;
/*!40000 ALTER TABLE `evo_i18n_original_string` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_i18n_original_string` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_i18n_translated_string`
--

DROP TABLE IF EXISTS `evo_i18n_translated_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_i18n_translated_string` (
  `itst_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itst_iost_ID` int(10) unsigned NOT NULL,
  `itst_locale` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `itst_standard` varchar(10000) NOT NULL DEFAULT '',
  `itst_custom` varchar(10000) DEFAULT NULL,
  `itst_inpofile` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`itst_ID`),
  KEY `itst_iost_ID_locale` (`itst_iost_ID`,`itst_locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_i18n_translated_string`
--

LOCK TABLES `evo_i18n_translated_string` WRITE;
/*!40000 ALTER TABLE `evo_i18n_translated_string` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_i18n_translated_string` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__checklist_lines`
--

DROP TABLE IF EXISTS `evo_items__checklist_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__checklist_lines` (
  `check_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `check_item_ID` int(10) unsigned NOT NULL,
  `check_checked` tinyint(1) NOT NULL DEFAULT 0,
  `check_label` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`check_ID`),
  KEY `check_item_ID` (`check_item_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__checklist_lines`
--

LOCK TABLES `evo_items__checklist_lines` WRITE;
/*!40000 ALTER TABLE `evo_items__checklist_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__checklist_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__item`
--

DROP TABLE IF EXISTS `evo_items__item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__item` (
  `post_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_parent_ID` int(10) unsigned DEFAULT NULL,
  `post_creator_user_ID` int(10) unsigned NOT NULL,
  `post_lastedit_user_ID` int(10) unsigned DEFAULT NULL,
  `post_assigned_user_ID` int(10) unsigned DEFAULT NULL,
  `post_dateset` tinyint(1) NOT NULL DEFAULT 1,
  `post_datestart` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `post_datedeadline` timestamp NULL DEFAULT NULL,
  `post_datecreated` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `post_datemodified` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `post_last_touched_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `post_contents_last_updated_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `post_status` enum('published','community','deprecated','protected','private','review','draft','redirected') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'draft',
  `post_single_view` enum('normal','404','redirected') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'normal',
  `post_pst_ID` int(10) unsigned DEFAULT NULL,
  `post_ityp_ID` int(10) unsigned NOT NULL DEFAULT 1,
  `post_igrp_ID` int(10) unsigned DEFAULT NULL,
  `post_locale` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'en-EU',
  `post_locale_visibility` enum('always','follow-nav-locale') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'always',
  `post_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_excerpt_autogenerated` tinyint(1) NOT NULL DEFAULT 1,
  `post_short_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_urltitle` varchar(210) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `post_canonical_slug_ID` int(10) unsigned DEFAULT NULL,
  `post_tiny_slug_ID` int(10) unsigned DEFAULT NULL,
  `post_titletag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_url` varchar(255) DEFAULT NULL,
  `post_main_cat_ID` int(10) unsigned NOT NULL,
  `post_notifications_status` enum('noreq','todo','started','finished') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'noreq',
  `post_notifications_ctsk_ID` int(10) unsigned DEFAULT NULL,
  `post_notifications_flags` set('moderators_notified','members_notified','community_notified','pings_sent') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `post_wordcount` int(11) DEFAULT NULL,
  `post_comment_status` enum('disabled','open','closed') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'open',
  `post_renderers` varchar(4000) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `post_priority` int(11) unsigned DEFAULT NULL COMMENT 'Task priority in workflow',
  `post_featured` tinyint(1) NOT NULL DEFAULT 0,
  `post_ctry_ID` int(10) unsigned DEFAULT NULL,
  `post_rgn_ID` int(10) unsigned DEFAULT NULL,
  `post_subrg_ID` int(10) unsigned DEFAULT NULL,
  `post_city_ID` int(10) unsigned DEFAULT NULL,
  `post_addvotes` int(11) NOT NULL DEFAULT 0,
  `post_countvotes` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`post_ID`),
  UNIQUE KEY `post_urltitle` (`post_urltitle`),
  KEY `post_datestart` (`post_datestart`),
  KEY `post_main_cat_ID` (`post_main_cat_ID`),
  KEY `post_creator_user_ID` (`post_creator_user_ID`),
  KEY `post_status` (`post_status`),
  KEY `post_parent_ID` (`post_parent_ID`),
  KEY `post_assigned_user_ID` (`post_assigned_user_ID`),
  KEY `post_ityp_ID` (`post_ityp_ID`),
  KEY `post_pst_ID` (`post_pst_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__item`
--

LOCK TABLES `evo_items__item` WRITE;
/*!40000 ALTER TABLE `evo_items__item` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__item_custom_field`
--

DROP TABLE IF EXISTS `evo_items__item_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__item_custom_field` (
  `icfv_item_ID` int(10) unsigned NOT NULL,
  `icfv_itcf_name` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `icfv_value` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icfv_parent_sync` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`icfv_item_ID`,`icfv_itcf_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__item_custom_field`
--

LOCK TABLES `evo_items__item_custom_field` WRITE;
/*!40000 ALTER TABLE `evo_items__item_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__item_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__item_settings`
--

DROP TABLE IF EXISTS `evo_items__item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__item_settings` (
  `iset_item_ID` int(10) unsigned NOT NULL,
  `iset_name` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `iset_value` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iset_item_ID`,`iset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__item_settings`
--

LOCK TABLES `evo_items__item_settings` WRITE;
/*!40000 ALTER TABLE `evo_items__item_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__itemgroup`
--

DROP TABLE IF EXISTS `evo_items__itemgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__itemgroup` (
  `igrp_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`igrp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__itemgroup`
--

LOCK TABLES `evo_items__itemgroup` WRITE;
/*!40000 ALTER TABLE `evo_items__itemgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__itemgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__itemtag`
--

DROP TABLE IF EXISTS `evo_items__itemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__itemtag` (
  `itag_itm_ID` int(10) unsigned NOT NULL,
  `itag_tag_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`itag_itm_ID`,`itag_tag_ID`),
  UNIQUE KEY `tagitem` (`itag_tag_ID`,`itag_itm_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__itemtag`
--

LOCK TABLES `evo_items__itemtag` WRITE;
/*!40000 ALTER TABLE `evo_items__itemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__itemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__prerendering`
--

DROP TABLE IF EXISTS `evo_items__prerendering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__prerendering` (
  `itpr_itm_ID` int(10) unsigned NOT NULL,
  `itpr_format` enum('htmlbody','entityencoded','xml','text') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `itpr_renderers` varchar(4000) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `itpr_content_prerendered` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itpr_datemodified` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`itpr_itm_ID`,`itpr_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__prerendering`
--

LOCK TABLES `evo_items__prerendering` WRITE;
/*!40000 ALTER TABLE `evo_items__prerendering` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__prerendering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__status`
--

DROP TABLE IF EXISTS `evo_items__status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__status` (
  `pst_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pst_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pst_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`pst_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__status`
--

LOCK TABLES `evo_items__status` WRITE;
/*!40000 ALTER TABLE `evo_items__status` DISABLE KEYS */;
INSERT INTO `evo_items__status` VALUES
(1,'New',10),
(2,'In Progress',20),
(3,'Duplicate',30),
(4,'Not A Bug',40),
(5,'In Review',50),
(6,'Fixed',60),
(7,'Closed',70),
(8,'OK',80);
/*!40000 ALTER TABLE `evo_items__status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__status_type`
--

DROP TABLE IF EXISTS `evo_items__status_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__status_type` (
  `its_pst_ID` int(10) unsigned NOT NULL,
  `its_ityp_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`its_ityp_ID`,`its_pst_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__status_type`
--

LOCK TABLES `evo_items__status_type` WRITE;
/*!40000 ALTER TABLE `evo_items__status_type` DISABLE KEYS */;
INSERT INTO `evo_items__status_type` VALUES
(1,1),
(3,1),
(5,1),
(8,1),
(1,2),
(3,2),
(5,2),
(8,2),
(1,3),
(3,3),
(5,3),
(8,3),
(1,4),
(3,4),
(5,4),
(8,4),
(1,5),
(3,5),
(5,5),
(8,5),
(1,6),
(3,6),
(5,6),
(8,6),
(1,7),
(3,7),
(5,7),
(8,7),
(1,8),
(3,8),
(5,8),
(8,8),
(1,9),
(2,9),
(3,9),
(4,9),
(5,9),
(6,9),
(7,9),
(8,9),
(1,10),
(3,10),
(5,10),
(8,10),
(1,11),
(3,11),
(5,11),
(8,11),
(1,12),
(3,12),
(5,12),
(8,12),
(1,13),
(3,13),
(5,13),
(8,13),
(1,14),
(3,14),
(5,14),
(8,14),
(1,15),
(3,15),
(5,15),
(8,15),
(1,16),
(3,16),
(5,16),
(8,16),
(1,17),
(3,17),
(5,17),
(8,17),
(1,18),
(3,18),
(5,18),
(8,18),
(1,19),
(3,19),
(5,19),
(8,19),
(1,20),
(3,20),
(5,20),
(8,20),
(1,21),
(3,21),
(5,21),
(8,21),
(1,22),
(3,22),
(5,22),
(8,22),
(1,23),
(3,23),
(5,23),
(8,23),
(1,24),
(3,24),
(5,24),
(8,24),
(1,25),
(3,25),
(5,25),
(8,25),
(1,26),
(3,26),
(5,26),
(8,26);
/*!40000 ALTER TABLE `evo_items__status_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__subscriptions`
--

DROP TABLE IF EXISTS `evo_items__subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__subscriptions` (
  `isub_item_ID` int(10) unsigned NOT NULL,
  `isub_user_ID` int(10) unsigned NOT NULL,
  `isub_comments` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'The user wants to receive notifications for new comments on this post',
  PRIMARY KEY (`isub_item_ID`,`isub_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__subscriptions`
--

LOCK TABLES `evo_items__subscriptions` WRITE;
/*!40000 ALTER TABLE `evo_items__subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__tag`
--

DROP TABLE IF EXISTS `evo_items__tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__tag` (
  `tag_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`tag_ID`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__tag`
--

LOCK TABLES `evo_items__tag` WRITE;
/*!40000 ALTER TABLE `evo_items__tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__type`
--

DROP TABLE IF EXISTS `evo_items__type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__type` (
  `ityp_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ityp_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ityp_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ityp_usage` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'post',
  `ityp_template_excerpt` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ityp_template_normal` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ityp_template_full` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ityp_template_name` varchar(40) DEFAULT NULL,
  `ityp_schema` enum('Article','WebPage','BlogPosting','ImageGallery','DiscussionForumPosting','TechArticle','Product','Review') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ityp_add_aggregate_rating` tinyint(4) DEFAULT 1,
  `ityp_back_instruction` tinyint(4) DEFAULT 0,
  `ityp_instruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ityp_text_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ityp_use_short_title` enum('optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'never',
  `ityp_use_title` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'required',
  `ityp_use_url` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'optional',
  `ityp_podcast` tinyint(1) DEFAULT 0,
  `ityp_use_parent` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'never',
  `ityp_use_text` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'optional',
  `ityp_allow_html` tinyint(4) DEFAULT 1,
  `ityp_allow_breaks` tinyint(4) DEFAULT 1,
  `ityp_allow_attachments` tinyint(4) DEFAULT 1,
  `ityp_use_excerpt` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'optional',
  `ityp_use_title_tag` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'optional',
  `ityp_use_meta_desc` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'optional',
  `ityp_use_meta_keywds` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'optional',
  `ityp_use_tags` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'optional',
  `ityp_allow_featured` tinyint(4) DEFAULT 1,
  `ityp_allow_switchable` tinyint(4) DEFAULT 1,
  `ityp_use_country` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'never',
  `ityp_use_region` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'never',
  `ityp_use_sub_region` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'never',
  `ityp_use_city` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'never',
  `ityp_use_coordinates` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'never',
  `ityp_use_comments` tinyint(4) DEFAULT 1,
  `ityp_comment_form_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ityp_allow_comment_form_msg` tinyint(4) DEFAULT 0,
  `ityp_allow_closing_comments` tinyint(4) DEFAULT 1,
  `ityp_allow_disabling_comments` tinyint(4) DEFAULT 0,
  `ityp_use_comment_expiration` enum('required','optional','never') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT 'optional',
  `ityp_perm_level` enum('standard','restricted','admin') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'standard',
  `ityp_evobar_link_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ityp_skin_btn_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ityp_short_title_maxlen` smallint(5) unsigned DEFAULT 30,
  `ityp_title_maxlen` smallint(5) unsigned DEFAULT 100,
  `ityp_front_order_title` smallint(6) DEFAULT NULL,
  `ityp_front_order_short_title` smallint(6) DEFAULT NULL,
  `ityp_front_order_instruction` smallint(6) DEFAULT NULL,
  `ityp_front_order_attachments` smallint(6) DEFAULT NULL,
  `ityp_front_order_workflow` smallint(6) DEFAULT NULL,
  `ityp_front_order_text` smallint(6) DEFAULT NULL,
  `ityp_front_order_tags` smallint(6) DEFAULT NULL,
  `ityp_front_order_excerpt` smallint(6) DEFAULT NULL,
  `ityp_front_order_url` smallint(6) DEFAULT NULL,
  `ityp_front_order_location` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ityp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__type`
--

LOCK TABLES `evo_items__type` WRITE;
/*!40000 ALTER TABLE `evo_items__type` DISABLE KEYS */;
INSERT INTO `evo_items__type` VALUES
(1,'Post',NULL,'post',NULL,NULL,NULL,'single','Article',1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(2,'Recipe',NULL,'post',NULL,NULL,'recipe_content_full','single',NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(3,'Post with Custom Fields',NULL,'post',NULL,NULL,NULL,'single',NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(4,'Child Post',NULL,'post',NULL,NULL,NULL,'single',NULL,1,0,NULL,NULL,'never','required','optional',0,'required','optional',1,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(5,'Podcast Episode',NULL,'post',NULL,NULL,NULL,'single',NULL,1,0,NULL,NULL,'never','required','optional',1,'never','optional',1,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(6,'Photo Album',NULL,'post',NULL,NULL,NULL,'single',NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(7,'Manual Page',NULL,'post',NULL,NULL,NULL,'single',NULL,1,0,NULL,NULL,'optional','required','optional',0,'never','optional',0,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(8,'Forum Topic',NULL,'post',NULL,NULL,NULL,'single',NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',0,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(9,'Bug Report',NULL,'post',NULL,NULL,NULL,'single',NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',0,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(10,'Standalone Page',NULL,'page',NULL,NULL,NULL,'page',NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',0,NULL,0,1,0,'optional','restricted',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(11,'Widget Page',NULL,'widget-page',NULL,NULL,NULL,'widget_page',NULL,1,0,NULL,NULL,'never','required','optional',0,'never','never',0,0,0,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','optional',0,NULL,0,1,0,'optional','admin',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(12,'Intro-Front',NULL,'intro-front',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,0,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',1,NULL,0,1,1,'optional','restricted',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(13,'Intro-Main',NULL,'intro-main',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,0,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',1,NULL,0,1,1,'optional','restricted',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(14,'Intro-Cat',NULL,'intro-cat',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,0,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',1,NULL,0,1,1,'optional','restricted',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(15,'Intro-Tag',NULL,'intro-tag',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,0,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',1,NULL,0,1,1,'optional','restricted',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(16,'Intro-Sub',NULL,'intro-sub',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,0,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',1,NULL,0,1,1,'optional','restricted',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(17,'Intro-All',NULL,'intro-all',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,0,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',1,NULL,0,1,1,'optional','restricted',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(18,'Content Block',NULL,'content-block',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,0,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',0,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(19,'Text Ad',NULL,'content-block',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,0,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',0,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(20,'Sidebar link',NULL,'special',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',1,NULL,0,1,1,'optional','admin',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(21,'Advertisement',NULL,'special',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',0,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','admin',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(22,'Terms & Conditions','Use this post type for terms & conditions of the site.','special',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'never','required','never',0,'never','required',1,0,1,'never','never','never','never','never',0,1,'never','never','never','never','never',0,NULL,0,0,0,'never','admin',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(23,'Product',NULL,'post',NULL,NULL,NULL,'single','Product',1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(24,'Review',NULL,'post',NULL,NULL,NULL,'single','Review',1,0,NULL,NULL,'never','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(25,'Homepage Content Tab',NULL,'post',NULL,NULL,NULL,'single',NULL,1,0,NULL,NULL,'optional','required','optional',0,'never','optional',1,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,NULL,80,NULL,NULL,NULL,90),
(26,'Task',NULL,'post',NULL,NULL,NULL,'single',NULL,1,0,NULL,NULL,'never','required','optional',0,'never','optional',0,1,1,'optional','optional','optional','optional','optional',1,1,'never','never','never','never','never',1,NULL,0,1,0,'optional','standard',NULL,NULL,30,100,10,NULL,NULL,30,20,80,NULL,NULL,NULL,90);
/*!40000 ALTER TABLE `evo_items__type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__type_coll`
--

DROP TABLE IF EXISTS `evo_items__type_coll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__type_coll` (
  `itc_ityp_ID` int(10) unsigned NOT NULL,
  `itc_coll_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`itc_ityp_ID`,`itc_coll_ID`),
  UNIQUE KEY `itemtypecoll` (`itc_ityp_ID`,`itc_coll_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__type_coll`
--

LOCK TABLES `evo_items__type_coll` WRITE;
/*!40000 ALTER TABLE `evo_items__type_coll` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__type_coll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__type_custom_field`
--

DROP TABLE IF EXISTS `evo_items__type_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__type_custom_field` (
  `itcf_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itcf_ityp_ID` int(10) unsigned NOT NULL,
  `itcf_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `itcf_name` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `itcf_schema_prop` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `itcf_type` enum('double','varchar','text','html','url','image','computed','separator') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `itcf_order` int(11) DEFAULT NULL,
  `itcf_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itcf_required` tinyint(4) DEFAULT 0,
  `itcf_meta` tinyint(4) DEFAULT 0,
  `itcf_public` tinyint(4) DEFAULT 1,
  `itcf_format` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itcf_formula` varchar(2000) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `itcf_disp_condition` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itcf_header_class` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `itcf_cell_class` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `itcf_link` enum('nolink','linkto','permalink','zoom','linkpermzoom','permzoom','linkperm','fieldurl','fieldurlblank') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'nolink',
  `itcf_link_nofollow` tinyint(4) DEFAULT 0,
  `itcf_link_class` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `itcf_line_highlight` enum('never','differences','always') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `itcf_green_highlight` enum('never','lowest','highest') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `itcf_red_highlight` enum('never','lowest','highest') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `itcf_description` text DEFAULT NULL,
  `itcf_merge` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`itcf_ID`),
  UNIQUE KEY `itcf_ityp_ID_name` (`itcf_ityp_ID`,`itcf_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__type_custom_field`
--

LOCK TABLES `evo_items__type_custom_field` WRITE;
/*!40000 ALTER TABLE `evo_items__type_custom_field` DISABLE KEYS */;
INSERT INTO `evo_items__type_custom_field` VALUES
(1,3,'Image 1','image_1',NULL,'image',110,'Enter a link ID',0,0,1,'fit-192x192',NULL,NULL,'right nowrap','center','linkpermzoom',0,NULL,'never','never','never',NULL,0),
(2,3,'First numeric field','first_numeric_field',NULL,'double',120,'Enter a number',0,0,1,NULL,NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(3,3,'Second numeric field','second_numeric_field',NULL,'double',140,'Enter a number',0,0,1,NULL,NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(4,3,'USD Price','usd_price',NULL,'double',180,'Enter a number',0,0,1,'$ 0 0.00[.green];$ 0 0.00[.red]',NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','lowest','never',NULL,0),
(5,3,'EUR Price','eur_price',NULL,'double',190,'Enter a number',0,0,1,'0 0.00 €',NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','lowest','never',NULL,0),
(6,3,'First string field','first_string_field',NULL,'varchar',130,'Enter a string',0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(7,3,'Multiline plain text field','multiline_plain_text_field',NULL,'text',160,'Enter multiple lines',0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(8,3,'Multiline HTML field','multiline_html_field',NULL,'html',150,'Enter HTML code',0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(9,3,'URL field','url_field',NULL,'url',170,'Enter an URL (absolute or relative)',0,0,1,NULL,NULL,NULL,'right nowrap','center','fieldurl',0,NULL,'differences','never','never',NULL,0),
(10,3,'Checkmark field','checkmark_field',NULL,'double',200,'1 = Yes; 0 = No',0,0,1,'#yes#;;#no#;n/a',NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(11,3,'Numeric Average','numeric_average',NULL,'computed',210,NULL,0,0,1,NULL,'($first_numeric_field$+$second_numeric_field$)/2',NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(12,4,'Image 1','image_1',NULL,'image',110,'Enter a link ID',0,0,1,'fit-192x192',NULL,NULL,'right nowrap','center','linkpermzoom',0,NULL,'never','never','never',NULL,0),
(13,4,'First numeric field','first_numeric_field',NULL,'double',120,'Enter a number',0,0,1,NULL,NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(14,4,'First string field','first_string_field',NULL,'varchar',130,'Enter a string',0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(15,4,'Checkmark field','checkmark_field',NULL,'double',140,'1 = Yes; 0 = No',0,0,1,'#yes#;;#no#;n/a',NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(16,2,'Course','course',NULL,'varchar',110,'E-g: \"Dessert\"',0,0,1,NULL,NULL,NULL,'','','nolink',0,NULL,'differences','never','never',NULL,0),
(17,2,'Cuisine','cuisine',NULL,'varchar',120,'E-g: \"Italian\"',0,0,1,NULL,NULL,NULL,'','','nolink',0,NULL,'differences','never','never',NULL,0),
(18,2,'Servings','servings',NULL,'double',130,'people',0,0,1,'0 people',NULL,NULL,'','','nolink',0,NULL,'differences','never','never',NULL,0),
(19,2,'Prep Time','prep_time',NULL,'double',140,'minutes',0,0,1,'0 minutes',NULL,NULL,'','','nolink',0,NULL,'differences','never','never',NULL,0),
(20,2,'Cook Time','cook_time',NULL,'double',150,'minutes',0,0,1,'0 minutes',NULL,NULL,'','','nolink',0,NULL,'differences','never','never',NULL,0),
(21,2,'Passive Time','passive_time',NULL,'double',160,'minutes',0,0,1,'0 minutes',NULL,NULL,'','','nolink',0,NULL,'differences','never','never',NULL,0),
(22,2,'Total time','total_time',NULL,'computed',170,NULL,0,0,1,'0 minutes','$prep_time$ + $cook_time$ + $passive_time$',NULL,'','','nolink',0,NULL,'differences','never','never',NULL,0),
(23,2,'Ingredients','ingredients',NULL,'text',180,NULL,0,0,1,NULL,NULL,NULL,'','','nolink',0,NULL,'differences','never','never',NULL,0),
(24,21,'Brand','brand','brand','varchar',110,NULL,0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(25,21,'SKU','sku','sku','varchar',120,NULL,0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(26,21,'Price','price','offers.price','double',130,NULL,0,0,1,'$ 0 0.00',NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(27,21,'Currency','currency','offers.priceCurrency','varchar',140,'in three-letter ISO 4217 format',0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(28,21,'Availability','availability','offers.availability','varchar',150,NULL,0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(29,21,'Color','item_color','color','varchar',160,NULL,0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(30,21,'Package total weight','package_total_weight',NULL,'double',170,'Kg',0,0,1,NULL,NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(31,21,'Package length','package_length',NULL,'double',180,'cm',0,0,1,NULL,NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(32,21,'Package width','package_width',NULL,'double',190,'cm',0,0,1,NULL,NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(33,21,'Package height','package_height',NULL,'double',200,'cm',0,0,1,NULL,NULL,NULL,'right nowrap','right','nolink',0,NULL,'differences','never','never',NULL,0),
(34,22,'Item reviewed','item_reviewed_name','itemReviewed.name','varchar',110,NULL,0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0),
(35,22,'Rating value','review_rating_value','reviewRating.ratingValue','double',120,'Rating must be a value between 1 and 5 with 5 being the highest.',0,0,1,NULL,NULL,NULL,'right nowrap','center','nolink',0,NULL,'differences','never','never',NULL,0);
/*!40000 ALTER TABLE `evo_items__type_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__user_data`
--

DROP TABLE IF EXISTS `evo_items__user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__user_data` (
  `itud_user_ID` int(10) unsigned NOT NULL,
  `itud_item_ID` int(10) unsigned NOT NULL,
  `itud_read_item_ts` timestamp NULL DEFAULT NULL,
  `itud_read_comments_ts` timestamp NULL DEFAULT NULL,
  `itud_flagged_item` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`itud_user_ID`,`itud_item_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__user_data`
--

LOCK TABLES `evo_items__user_data` WRITE;
/*!40000 ALTER TABLE `evo_items__user_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__version`
--

DROP TABLE IF EXISTS `evo_items__version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__version` (
  `iver_ID` int(10) unsigned NOT NULL,
  `iver_type` enum('archived','proposed') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'archived',
  `iver_itm_ID` int(10) unsigned NOT NULL,
  `iver_edit_user_ID` int(10) unsigned DEFAULT NULL,
  `iver_edit_last_touched_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `iver_status` enum('published','community','deprecated','protected','private','review','draft','redirected') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `iver_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iver_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iver_ID`,`iver_type`,`iver_itm_ID`),
  KEY `iver_edit_user_ID` (`iver_edit_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__version`
--

LOCK TABLES `evo_items__version` WRITE;
/*!40000 ALTER TABLE `evo_items__version` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__version_custom_field`
--

DROP TABLE IF EXISTS `evo_items__version_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__version_custom_field` (
  `ivcf_iver_ID` int(10) unsigned NOT NULL,
  `ivcf_iver_type` enum('archived','proposed') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'archived',
  `ivcf_iver_itm_ID` int(10) unsigned NOT NULL,
  `ivcf_itcf_ID` int(10) unsigned NOT NULL,
  `ivcf_itcf_label` varchar(255) NOT NULL,
  `ivcf_value` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`ivcf_iver_ID`,`ivcf_iver_type`,`ivcf_iver_itm_ID`,`ivcf_itcf_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__version_custom_field`
--

LOCK TABLES `evo_items__version_custom_field` WRITE;
/*!40000 ALTER TABLE `evo_items__version_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__version_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__version_link`
--

DROP TABLE IF EXISTS `evo_items__version_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__version_link` (
  `ivl_iver_ID` int(10) unsigned NOT NULL,
  `ivl_iver_type` enum('archived','proposed') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'archived',
  `ivl_iver_itm_ID` int(10) unsigned NOT NULL,
  `ivl_link_ID` int(11) unsigned NOT NULL,
  `ivl_file_ID` int(11) unsigned DEFAULT NULL,
  `ivl_position` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ivl_order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ivl_iver_ID`,`ivl_iver_type`,`ivl_iver_itm_ID`,`ivl_link_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__version_link`
--

LOCK TABLES `evo_items__version_link` WRITE;
/*!40000 ALTER TABLE `evo_items__version_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__version_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_items__votes`
--

DROP TABLE IF EXISTS `evo_items__votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_items__votes` (
  `itvt_item_ID` int(10) unsigned NOT NULL,
  `itvt_user_ID` int(10) unsigned NOT NULL,
  `itvt_updown` tinyint(1) DEFAULT NULL,
  `itvt_report` enum('clean','rated','adult','inappropriate','spam') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `itvt_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`itvt_item_ID`,`itvt_user_ID`),
  KEY `itvt_item_ID` (`itvt_item_ID`),
  KEY `itvt_user_ID` (`itvt_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_items__votes`
--

LOCK TABLES `evo_items__votes` WRITE;
/*!40000 ALTER TABLE `evo_items__votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_items__votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_links`
--

DROP TABLE IF EXISTS `evo_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_links` (
  `link_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_datecreated` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `link_datemodified` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `link_creator_user_ID` int(10) unsigned DEFAULT NULL,
  `link_lastedit_user_ID` int(10) unsigned DEFAULT NULL,
  `link_itm_ID` int(10) unsigned DEFAULT NULL,
  `link_cmt_ID` int(10) unsigned DEFAULT NULL COMMENT 'Used for linking files to comments (comment attachments)',
  `link_usr_ID` int(10) unsigned DEFAULT NULL COMMENT 'Used for linking files to users (user profile picture)',
  `link_ecmp_ID` int(10) unsigned DEFAULT NULL COMMENT 'Used for linking files to email campaign',
  `link_msg_ID` int(10) unsigned DEFAULT NULL COMMENT 'Used for linking files to private message',
  `link_tmp_ID` int(10) unsigned DEFAULT NULL COMMENT 'Used for linking files to new creating object',
  `link_file_ID` int(10) unsigned DEFAULT NULL,
  `link_position` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `link_order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`link_ID`),
  UNIQUE KEY `link_itm_ID_order` (`link_itm_ID`,`link_order`),
  KEY `link_itm_ID` (`link_itm_ID`),
  KEY `link_cmt_ID` (`link_cmt_ID`),
  KEY `link_usr_ID` (`link_usr_ID`),
  KEY `link_file_ID` (`link_file_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_links`
--

LOCK TABLES `evo_links` WRITE;
/*!40000 ALTER TABLE `evo_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_links__vote`
--

DROP TABLE IF EXISTS `evo_links__vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_links__vote` (
  `lvot_link_ID` int(10) unsigned NOT NULL,
  `lvot_user_ID` int(10) unsigned NOT NULL,
  `lvot_like` tinyint(1) DEFAULT NULL,
  `lvot_inappropriate` tinyint(1) DEFAULT NULL,
  `lvot_spam` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`lvot_link_ID`,`lvot_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_links__vote`
--

LOCK TABLES `evo_links__vote` WRITE;
/*!40000 ALTER TABLE `evo_links__vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_links__vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_locales`
--

DROP TABLE IF EXISTS `evo_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_locales` (
  `loc_locale` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `loc_datefmt` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'y-m-d',
  `loc_longdatefmt` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'Y-m-d',
  `loc_extdatefmt` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'Y M d',
  `loc_input_datefmt` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'Y-m-d',
  `loc_timefmt` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'H:i:s',
  `loc_shorttimefmt` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'H:i',
  `loc_input_timefmt` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'H:i:s',
  `loc_startofweek` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `loc_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `loc_messages` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `loc_priority` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `loc_transliteration_map` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `loc_enabled` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`loc_locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='saves available locales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_locales`
--

LOCK TABLES `evo_locales` WRITE;
/*!40000 ALTER TABLE `evo_locales` DISABLE KEYS */;
INSERT INTO `evo_locales` VALUES
('en-US','m/d/y','m/d/Y','M d, Y','m/d/y','h:i:s a','h:i a','H:i:s',0,'English (US) utf-8','en_US',1,'',1);
/*!40000 ALTER TABLE `evo_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_menus__entry`
--

DROP TABLE IF EXISTS `evo_menus__entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_menus__entry` (
  `ment_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ment_menu_ID` int(10) unsigned NOT NULL,
  `ment_parent_ID` int(10) unsigned DEFAULT NULL,
  `ment_order` int(11) DEFAULT NULL,
  `ment_user_pic_size` varchar(32) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ment_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ment_type` varchar(32) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ment_coll_logo_size` varchar(32) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ment_coll_ID` int(10) unsigned DEFAULT NULL,
  `ment_cat_ID` int(10) unsigned DEFAULT NULL,
  `ment_item_ID` int(10) unsigned DEFAULT NULL,
  `ment_item_slug` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ment_url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ment_visibility` enum('always','access') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'always',
  `ment_access` enum('any','loggedin','perms') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'perms',
  `ment_show_badge` tinyint(1) NOT NULL DEFAULT 1,
  `ment_highlight` tinyint(1) NOT NULL DEFAULT 1,
  `ment_hide_empty` tinyint(1) NOT NULL DEFAULT 0,
  `ment_class` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`ment_ID`),
  KEY `ment_menu_ID` (`ment_menu_ID`),
  KEY `ment_parent_ID` (`ment_parent_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_menus__entry`
--

LOCK TABLES `evo_menus__entry` WRITE;
/*!40000 ALTER TABLE `evo_menus__entry` DISABLE KEYS */;
INSERT INTO `evo_menus__entry` VALUES
(1,1,NULL,10,NULL,'Home','home',NULL,NULL,NULL,NULL,NULL,NULL,'always','perms',1,1,0,NULL),
(2,1,NULL,20,NULL,'Recently','recentposts',NULL,NULL,NULL,NULL,NULL,NULL,'always','perms',1,1,0,NULL),
(3,1,NULL,30,NULL,'Archives','arcdir',NULL,NULL,NULL,NULL,NULL,NULL,'always','perms',1,1,0,NULL),
(4,1,NULL,40,NULL,'Photo index','mediaidx',NULL,NULL,NULL,NULL,NULL,NULL,'always','perms',1,1,0,NULL),
(5,1,NULL,50,NULL,'Latest comments','latestcomments',NULL,NULL,NULL,NULL,NULL,NULL,'always','perms',1,1,0,NULL),
(6,1,NULL,60,NULL,'Owner details','owneruserinfo',NULL,NULL,NULL,NULL,NULL,NULL,'always','perms',1,1,0,NULL),
(7,1,NULL,70,NULL,'Contact','ownercontact',NULL,NULL,NULL,NULL,NULL,NULL,'always','perms',1,1,0,NULL);
/*!40000 ALTER TABLE `evo_menus__entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_menus__menu`
--

DROP TABLE IF EXISTS `evo_menus__menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_menus__menu` (
  `menu_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_translates_menu_ID` int(10) unsigned DEFAULT NULL,
  `menu_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_locale` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'en-US',
  PRIMARY KEY (`menu_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_menus__menu`
--

LOCK TABLES `evo_menus__menu` WRITE;
/*!40000 ALTER TABLE `evo_menus__menu` DISABLE KEYS */;
INSERT INTO `evo_menus__menu` VALUES
(1,NULL,'Site Map - Common links','en-US');
/*!40000 ALTER TABLE `evo_menus__menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_messaging__contact`
--

DROP TABLE IF EXISTS `evo_messaging__contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_messaging__contact` (
  `mct_from_user_ID` int(10) unsigned NOT NULL,
  `mct_to_user_ID` int(10) unsigned NOT NULL,
  `mct_blocked` tinyint(1) DEFAULT 0,
  `mct_last_contact_datetime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`mct_from_user_ID`,`mct_to_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_messaging__contact`
--

LOCK TABLES `evo_messaging__contact` WRITE;
/*!40000 ALTER TABLE `evo_messaging__contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_messaging__contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_messaging__contact_groups`
--

DROP TABLE IF EXISTS `evo_messaging__contact_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_messaging__contact_groups` (
  `cgr_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cgr_user_ID` int(10) unsigned NOT NULL,
  `cgr_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cgr_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_messaging__contact_groups`
--

LOCK TABLES `evo_messaging__contact_groups` WRITE;
/*!40000 ALTER TABLE `evo_messaging__contact_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_messaging__contact_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_messaging__contact_groupusers`
--

DROP TABLE IF EXISTS `evo_messaging__contact_groupusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_messaging__contact_groupusers` (
  `cgu_user_ID` int(10) unsigned NOT NULL,
  `cgu_cgr_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cgu_user_ID`,`cgu_cgr_ID`),
  KEY `cgu_cgr_ID` (`cgu_cgr_ID`),
  CONSTRAINT `evo_messaging__contact_groupusers_ibfk_1` FOREIGN KEY (`cgu_cgr_ID`) REFERENCES `evo_messaging__contact_groups` (`cgr_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_messaging__contact_groupusers`
--

LOCK TABLES `evo_messaging__contact_groupusers` WRITE;
/*!40000 ALTER TABLE `evo_messaging__contact_groupusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_messaging__contact_groupusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_messaging__message`
--

DROP TABLE IF EXISTS `evo_messaging__message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_messaging__message` (
  `msg_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_author_user_ID` int(10) unsigned NOT NULL,
  `msg_datetime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `msg_thread_ID` int(10) unsigned NOT NULL,
  `msg_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msg_renderers` varchar(4000) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`msg_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_messaging__message`
--

LOCK TABLES `evo_messaging__message` WRITE;
/*!40000 ALTER TABLE `evo_messaging__message` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_messaging__message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_messaging__prerendering`
--

DROP TABLE IF EXISTS `evo_messaging__prerendering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_messaging__prerendering` (
  `mspr_msg_ID` int(10) unsigned NOT NULL,
  `mspr_format` enum('htmlbody','entityencoded','xml','text') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `mspr_renderers` varchar(4000) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `mspr_content_prerendered` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mspr_datemodified` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`mspr_msg_ID`,`mspr_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_messaging__prerendering`
--

LOCK TABLES `evo_messaging__prerendering` WRITE;
/*!40000 ALTER TABLE `evo_messaging__prerendering` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_messaging__prerendering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_messaging__thread`
--

DROP TABLE IF EXISTS `evo_messaging__thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_messaging__thread` (
  `thrd_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thrd_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thrd_datemodified` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`thrd_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_messaging__thread`
--

LOCK TABLES `evo_messaging__thread` WRITE;
/*!40000 ALTER TABLE `evo_messaging__thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_messaging__thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_messaging__threadstatus`
--

DROP TABLE IF EXISTS `evo_messaging__threadstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_messaging__threadstatus` (
  `tsta_thread_ID` int(10) unsigned NOT NULL,
  `tsta_user_ID` int(10) unsigned NOT NULL,
  `tsta_first_unread_msg_ID` int(10) unsigned DEFAULT NULL,
  `tsta_thread_leave_msg_ID` int(10) unsigned DEFAULT NULL,
  KEY `tsta_user_ID` (`tsta_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_messaging__threadstatus`
--

LOCK TABLES `evo_messaging__threadstatus` WRITE;
/*!40000 ALTER TABLE `evo_messaging__threadstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_messaging__threadstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_plugin_captcha_qstn_12_ip_question`
--

DROP TABLE IF EXISTS `evo_plugin_captcha_qstn_12_ip_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_plugin_captcha_qstn_12_ip_question` (
  `cptip_IP` int(10) unsigned NOT NULL,
  `cptip_cptq_ID` int(10) unsigned NOT NULL,
  KEY `cptip_IP` (`cptip_IP`,`cptip_cptq_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_plugin_captcha_qstn_12_ip_question`
--

LOCK TABLES `evo_plugin_captcha_qstn_12_ip_question` WRITE;
/*!40000 ALTER TABLE `evo_plugin_captcha_qstn_12_ip_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_plugin_captcha_qstn_12_ip_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_plugin_captcha_qstn_12_questions`
--

DROP TABLE IF EXISTS `evo_plugin_captcha_qstn_12_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_plugin_captcha_qstn_12_questions` (
  `cptq_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cptq_question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cptq_answers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cptq_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_plugin_captcha_qstn_12_questions`
--

LOCK TABLES `evo_plugin_captcha_qstn_12_questions` WRITE;
/*!40000 ALTER TABLE `evo_plugin_captcha_qstn_12_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_plugin_captcha_qstn_12_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_plugin_financial_contribution_38_contributions`
--

DROP TABLE IF EXISTS `evo_plugin_financial_contribution_38_contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_plugin_financial_contribution_38_contributions` (
  `fnct_item_ID` int(10) unsigned NOT NULL,
  `fnct_user_ID` int(10) unsigned NOT NULL,
  `fnct_amount` double unsigned NOT NULL,
  `fnct_timestamp` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`fnct_item_ID`,`fnct_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_plugin_financial_contribution_38_contributions`
--

LOCK TABLES `evo_plugin_financial_contribution_38_contributions` WRITE;
/*!40000 ALTER TABLE `evo_plugin_financial_contribution_38_contributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_plugin_financial_contribution_38_contributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_pluginevents`
--

DROP TABLE IF EXISTS `evo_pluginevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_pluginevents` (
  `pevt_plug_ID` int(10) unsigned NOT NULL,
  `pevt_event` varchar(40) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `pevt_enabled` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pevt_plug_ID`,`pevt_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_pluginevents`
--

LOCK TABLES `evo_pluginevents` WRITE;
/*!40000 ALTER TABLE `evo_pluginevents` DISABLE KEYS */;
INSERT INTO `evo_pluginevents` VALUES
(1,'AdminDisplayToolbar',1),
(1,'DisplayCommentToolbar',1),
(2,'FilterCommentContent',1),
(2,'FilterEmailContent',1),
(2,'FilterMsgContent',1),
(2,'RenderItemAsHtml',1),
(3,'FilterCommentContent',1),
(3,'FilterEmailContent',1),
(3,'FilterMsgContent',1),
(3,'RenderEmailAsHtml',1),
(3,'RenderItemAsHtml',1),
(3,'RenderMessageAsHtml',1),
(4,'FilterCommentContent',1),
(4,'FilterEmailContent',1),
(4,'FilterMsgContent',1),
(4,'RenderItemAsHtml',1),
(4,'RenderItemAsXml',1),
(5,'SkinTag',1),
(6,'SkinTag',1),
(7,'AdminDisplayToolbar',1),
(7,'DisplayCommentToolbar',1),
(7,'DisplayEmailToolbar',1),
(7,'DisplayMessageToolbar',1),
(7,'FilterCommentContent',1),
(7,'FilterEmailContent',1),
(7,'FilterMsgContent',1),
(7,'RenderItemAsHtml',1),
(7,'RenderItemAsXml',1),
(7,'SkinBeginHtmlHead',1),
(8,'ItemSendPing',1),
(9,'ItemSendPing',1),
(10,'AdminDisplayEditorButton',1),
(10,'AdminEndHtmlHead',1),
(10,'DisplayEditorButton',1),
(10,'SkinBeginHtmlHead',1),
(11,'ItemSendPing',1),
(11,'SkinBeginHtmlHead',1),
(12,'RequestCaptcha',1),
(12,'ValidateCaptcha',1),
(13,'AppendHitLog',0),
(13,'BeforeCommentFormInsert',1),
(13,'BeforeTrackbackInsert',1),
(13,'CommentFormSent',1),
(13,'GetSpamKarmaForComment',1),
(14,'AdminAfterUsersList',1),
(14,'AdminToolAction',1),
(14,'AdminToolPayload',1),
(14,'AfterCommentInsert',1),
(14,'AfterLoginRegisteredUser',1),
(14,'AfterUserInsert',1),
(14,'AfterUserRegistration',1),
(14,'BeforeBlockableAction',1),
(14,'DisplayRegisterFormBefore',1),
(14,'GetAdditionalColumnsTable',1),
(15,'AdminEndHtmlHead',1),
(15,'RenderCommentAttachment',1),
(15,'RenderItemAttachment',1),
(15,'RenderURL',1),
(15,'SkinBeginHtmlHead',1),
(16,'AdminEndHtmlHead',1),
(16,'RenderCommentAttachment',1),
(16,'RenderItemAttachment',1),
(16,'SkinBeginHtmlHead',1),
(17,'ItemSendPing',1),
(18,'CommentFormSent',1),
(18,'EmailFormSent',1),
(18,'FilterCommentContent',1),
(18,'FilterEmailContent',1),
(18,'FilterItemContents',1),
(18,'FilterMsgContent',1),
(18,'MessageThreadFormSent',1),
(18,'RenderItemAsHtml',1),
(18,'UnfilterItemContents',1),
(19,'AdminDisplayToolbar',1),
(19,'DisplayCommentToolbar',1),
(19,'DisplayEmailToolbar',1),
(19,'DisplayMessageToolbar',1),
(19,'FilterCommentContent',1),
(19,'FilterEmailContent',1),
(19,'FilterMsgContent',1),
(19,'RenderEmailAsHtml',1),
(19,'RenderItemAsHtml',1),
(19,'RenderItemAsXml',1),
(19,'RenderMessageAsHtml',1),
(20,'AdminEndHtmlHead',1),
(20,'DisplayItemAsHtml',1),
(20,'DisplayItemAsXml',1),
(20,'FilterCommentContent',1),
(20,'FilterEmailContent',1),
(20,'FilterMsgContent',1),
(21,'AdminAfterPageFooter',1),
(21,'AdminDisplayToolbar',1),
(21,'CommentFormSent',1),
(21,'DisplayCommentToolbar',1),
(21,'DisplayEmailToolbar',1),
(21,'DisplayMessageToolbar',1),
(21,'EmailFormSent',1),
(21,'FilterCommentContent',1),
(21,'FilterEmailContent',1),
(21,'FilterItemContents',1),
(21,'FilterMsgContent',1),
(21,'MessageThreadFormSent',1),
(21,'RenderItemAsHtml',1),
(21,'SkinEndHtmlBody',1),
(21,'UnfilterItemContents',1),
(23,'AdminDisplayToolbar',1),
(23,'DisplayCommentToolbar',1),
(23,'DisplayEmailToolbar',1),
(23,'DisplayItemAsHtml',1),
(23,'DisplayMessageToolbar',1),
(23,'FilterCommentContent',1),
(23,'FilterEmailContent',1),
(23,'FilterMsgContent',1),
(23,'PrependCommentInsertTransact',1),
(23,'PrependCommentUpdateTransact',1),
(23,'PrependEmailInsertTransact',1),
(23,'PrependEmailUpdateTransact',1),
(23,'PrependItemInsertTransact',1),
(23,'PrependItemUpdateTransact',1),
(23,'PrependMessageInsertTransact',1),
(23,'RenderEmailAsHtml',1),
(23,'RenderItemAsHtml',1),
(23,'RenderMessageAsHtml',1),
(24,'AdminEndHtmlHead',1),
(24,'FilterCommentContent',1),
(24,'FilterEmailContent',1),
(24,'FilterMsgContent',1),
(24,'RenderItemAsHtml',1),
(24,'SkinBeginHtmlHead',1),
(25,'AdminDisplayToolbar',1),
(25,'DisplayCommentToolbar',1),
(25,'DisplayEmailToolbar',1),
(25,'DisplayMessageToolbar',1),
(25,'FilterCommentContent',1),
(25,'FilterEmailContent',1),
(25,'FilterMsgContent',1),
(25,'InitCollectionKinds',1),
(25,'RenderItemAsHtml',1),
(26,'AdminEndHtmlHead',1),
(26,'FilterCommentContent',1),
(26,'FilterEmailContent',1),
(26,'FilterMsgContent',1),
(26,'PrepareForRenderCommentAttachment',1),
(26,'PrepareForRenderItemAttachment',1),
(26,'RenderEmailAsHtml',1),
(26,'RenderItemAsHtml',1),
(26,'RenderItemAsXml',1),
(26,'RenderMessageAsHtml',1),
(26,'SkinBeginHtmlHead',1),
(27,'AdminDisplayToolbar',1),
(27,'AdminEndHtmlHead',1),
(27,'DisplayCommentToolbar',1),
(27,'DisplayEmailToolbar',1),
(27,'DisplayMessageToolbar',1),
(27,'FilterCommentContent',1),
(27,'FilterEmailContent',1),
(27,'FilterMsgContent',1),
(27,'RenderItemAsHtml',1),
(27,'SkinBeginHtmlHead',1),
(28,'AdminToolPayload',1),
(29,'AdminDisplayToolbar',1),
(30,'FilterCommentContent',1),
(30,'FilterEmailContent',1),
(30,'FilterMsgContent',1),
(30,'RenderEmailAsHtml',1),
(30,'RenderItemAsHtml',1),
(30,'RenderItemAsXml',1),
(30,'RenderMessageAsHtml',1),
(31,'AdminDisplayToolbar',1),
(31,'DisplayCommentToolbar',1),
(31,'FilterCommentContent',1),
(31,'FilterEmailContent',1),
(31,'FilterMsgContent',1),
(31,'RenderEmailAsHtml',1),
(31,'RenderItemAsHtml',1),
(31,'RenderMessageAsHtml',1),
(32,'AdminDisplayToolbar',1),
(32,'DisplayCommentToolbar',1),
(32,'DisplayEmailToolbar',1),
(32,'DisplayItemAsHtml',1),
(32,'DisplayMessageToolbar',1),
(32,'FilterCommentContent',1),
(32,'FilterEmailContent',1),
(32,'FilterMsgContent',1),
(32,'RenderEmailAsHtml',1),
(32,'RenderItemAsHtml',1),
(33,'AdminDisplayToolbar',1),
(33,'DisplayCommentToolbar',1),
(33,'DisplayEmailToolbar',1),
(33,'DisplayMessageToolbar',1),
(34,'DisplayEmailToolbar',1),
(34,'DisplayImageInlineTagForm',1),
(34,'FilterCommentContent',1),
(34,'FilterEmailContent',1),
(34,'FilterMsgContent',1),
(34,'GetImageInlineTags',1),
(34,'GetInsertImageInlineTagJavaScript',1),
(34,'InitImageInlineTagForm',1),
(34,'RenderEmailAsHtml',1),
(34,'RenderInlineTags',1),
(34,'RenderItemAsHtml',1),
(35,'ItemSendPing',1),
(36,'AdminEndHtmlHead',1),
(36,'FilterCommentContent',1),
(36,'FilterEmailContent',1),
(36,'FilterMsgContent',1),
(36,'RenderItemAsHtml',1),
(36,'SkinBeginHtmlHead',1),
(37,'FilterCommentContent',1),
(37,'FilterEmailContent',1),
(37,'FilterMsgContent',1),
(37,'RenderEmailAsHtml',1),
(37,'RenderItemAsHtml',1),
(37,'RenderMessageAsHtml',1),
(37,'SkinBeginHtmlHead',1),
(37,'SkinTag',1),
(38,'SkinTag',1),
(39,'AdminDisplayToolbar',1),
(39,'AdminEndHtmlHead',1),
(39,'CommentFormSent',1),
(39,'DisplayCommentToolbar',1),
(39,'DisplayEmailToolbar',1),
(39,'DisplayMessageToolbar',1),
(39,'EmailFormSent',1),
(39,'FilterCommentContent',1),
(39,'FilterEmailContent',1),
(39,'FilterItemContents',1),
(39,'FilterMsgContent',1),
(39,'MessageThreadFormSent',1),
(39,'RenderItemAsHtml',1),
(39,'SkinBeginHtmlHead',1),
(39,'UnfilterItemContents',1),
(40,'FilterCommentContent',1),
(40,'FilterEmailContent',1),
(40,'FilterMsgContent',1),
(40,'RenderEmailAsHtml',1),
(40,'RenderItemAsHtml',1),
(40,'RenderMessageAsHtml',1),
(41,'FilterCommentContent',1),
(41,'FilterEmailContent',1),
(41,'FilterMsgContent',1),
(41,'RenderEmailAsHtml',1),
(41,'RenderItemAsHtml',1),
(41,'RenderMessageAsHtml',1);
/*!40000 ALTER TABLE `evo_pluginevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_plugingroupsettings`
--

DROP TABLE IF EXISTS `evo_plugingroupsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_plugingroupsettings` (
  `pgset_plug_ID` int(10) unsigned NOT NULL,
  `pgset_grp_ID` int(10) unsigned NOT NULL,
  `pgset_name` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `pgset_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pgset_plug_ID`,`pgset_grp_ID`,`pgset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_plugingroupsettings`
--

LOCK TABLES `evo_plugingroupsettings` WRITE;
/*!40000 ALTER TABLE `evo_plugingroupsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_plugingroupsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_plugins`
--

DROP TABLE IF EXISTS `evo_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_plugins` (
  `plug_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plug_priority` tinyint(3) unsigned NOT NULL DEFAULT 50,
  `plug_classname` varchar(40) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `plug_code` varchar(32) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `plug_version` varchar(42) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '0',
  `plug_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plug_shortdesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plug_status` enum('enabled','disabled','needs_config','broken') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `plug_spam_weight` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`plug_ID`),
  UNIQUE KEY `plug_code` (`plug_code`),
  KEY `plug_status` (`plug_status`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_plugins`
--

LOCK TABLES `evo_plugins` WRITE;
/*!40000 ALTER TABLE `evo_plugins` DISABLE KEYS */;
INSERT INTO `evo_plugins` VALUES
(1,30,'quicktags_plugin','b2evQTag','7.2.5',NULL,NULL,'enabled',1),
(2,80,'auto_p_plugin','b2WPAutP','7.2.5',NULL,NULL,'enabled',1),
(3,63,'autolinks_plugin','b2evALnk','7.2.5',NULL,NULL,'enabled',1),
(4,90,'texturize_plugin','b2WPTxrz','7.2.5',NULL,NULL,'enabled',1),
(5,20,'calendar_plugin','evo_Calr','7.2.5',NULL,NULL,'enabled',1),
(6,50,'archives_plugin','evo_Arch','7.2.5',NULL,NULL,'enabled',1),
(7,65,'videoplug_plugin','evo_videoplug','7.2.5',NULL,NULL,'enabled',1),
(8,50,'ping_b2evonet_plugin','ping_b2evonet','7.2.5',NULL,NULL,'enabled',1),
(9,50,'ping_pingomatic_plugin','ping_pingomatic','7.2.5',NULL,NULL,'enabled',1),
(10,10,'tinymce_plugin','evo_TinyMCE','7.2.5',NULL,NULL,'enabled',1),
(11,50,'twitter_plugin','evo_twitter','7.2.5',NULL,NULL,'enabled',1),
(12,50,'captcha_qstn_plugin','captcha_qstn','7.2.5',NULL,NULL,'needs_config',1),
(13,60,'basic_antispam_plugin','b2evBAspm','7.2.5',NULL,NULL,'enabled',1),
(14,45,'geoip_plugin','evo_GeoIP','7.2.5',NULL,NULL,'needs_config',1),
(15,80,'html5_mediaelementjs_plugin','b2evH5MP','7.2.5',NULL,NULL,'enabled',1),
(16,80,'html5_videojs_plugin','b2evH5VJSP','7.2.5',NULL,NULL,'enabled',1),
(17,50,'generic_ping_plugin','b2evGPing','7.2.5',NULL,NULL,'needs_config',1),
(18,8,'escapecode_plugin','escape_code','7.2.5',NULL,NULL,'enabled',1),
(19,50,'bbcode_plugin','b2evBBco','7.2.5',NULL,NULL,'disabled',1),
(20,55,'star_plugin','b2evStar','7.2.5',NULL,NULL,'disabled',1),
(21,27,'prism_plugin','evo_prism','7.2.5',NULL,NULL,'disabled',1),
(22,50,'code_highlight_plugin',NULL,'0.0.1',NULL,NULL,'disabled',1),
(23,35,'shortlinks_plugin','b2evWiLi','7.2.5',NULL,NULL,'enabled',1),
(24,15,'wikitables_plugin','b2evWiTa','7.2.5',NULL,NULL,'enabled',1),
(25,20,'markdown_plugin','b2evMark','7.2.5',NULL,NULL,'enabled',1),
(26,95,'infodots_plugin','b2evoDot','7.2.5',NULL,NULL,'disabled',1),
(27,100,'widescroll_plugin','evo_widescroll','7.2.5',NULL,NULL,'enabled',1),
(28,94,'bookmarklet_plugin','cafeBkmk','7.2.5',NULL,NULL,'enabled',1),
(29,40,'shortcodes_plugin','evo_shortcodes','7.2.5',NULL,NULL,'enabled',1),
(30,105,'adjust_headings_plugin','h_levels','7.2.5',NULL,NULL,'disabled',1),
(31,17,'custom_tags_plugin','b2evCTag','7.2.5',NULL,NULL,'enabled',1),
(32,65,'polls_plugin','evo_poll','7.2.5',NULL,NULL,'enabled',1),
(33,50,'inlines_plugin','evo_inlines','6.9.4',NULL,NULL,'enabled',1),
(34,50,'email_elements_plugin','b2evEmailEl','7.2.5',NULL,NULL,'enabled',1),
(35,50,'webmention_plugin','webmention','6.10.6',NULL,NULL,'enabled',1),
(36,33,'auto_anchors_plugin','auto_anchors','7.2.5',NULL,NULL,'enabled',1),
(37,110,'table_contents_plugin','b2evoTOC','7.2.5',NULL,NULL,'enabled',1),
(38,50,'financial_contribution_plugin','fin_contrib','7.2.5',NULL,NULL,'enabled',1),
(39,85,'mermaid_plugin','evo_mermaid','7.2.5',NULL,NULL,'enabled',1),
(40,99,'nofollow_plugin','evo_nofollow','7.2.5',NULL,NULL,'enabled',1),
(41,102,'content_blocks_plugin','content_blocks','7.2.5',NULL,NULL,'enabled',1);
/*!40000 ALTER TABLE `evo_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_pluginsettings`
--

DROP TABLE IF EXISTS `evo_pluginsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_pluginsettings` (
  `pset_plug_ID` int(10) unsigned NOT NULL,
  `pset_name` varchar(60) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `pset_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pset_plug_ID`,`pset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_pluginsettings`
--

LOCK TABLES `evo_pluginsettings` WRITE;
/*!40000 ALTER TABLE `evo_pluginsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_pluginsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_pluginusersettings`
--

DROP TABLE IF EXISTS `evo_pluginusersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_pluginusersettings` (
  `puset_plug_ID` int(10) unsigned NOT NULL,
  `puset_user_ID` int(10) unsigned NOT NULL,
  `puset_name` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `puset_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`puset_plug_ID`,`puset_user_ID`,`puset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_pluginusersettings`
--

LOCK TABLES `evo_pluginusersettings` WRITE;
/*!40000 ALTER TABLE `evo_pluginusersettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_pluginusersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_polls__answer`
--

DROP TABLE IF EXISTS `evo_polls__answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_polls__answer` (
  `pans_pqst_ID` int(10) unsigned NOT NULL,
  `pans_user_ID` int(10) unsigned NOT NULL,
  `pans_popt_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pans_pqst_ID`,`pans_user_ID`,`pans_popt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_polls__answer`
--

LOCK TABLES `evo_polls__answer` WRITE;
/*!40000 ALTER TABLE `evo_polls__answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_polls__answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_polls__option`
--

DROP TABLE IF EXISTS `evo_polls__option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_polls__option` (
  `popt_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `popt_pqst_ID` int(10) unsigned NOT NULL,
  `popt_option_text` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popt_order` int(11) NOT NULL,
  PRIMARY KEY (`popt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_polls__option`
--

LOCK TABLES `evo_polls__option` WRITE;
/*!40000 ALTER TABLE `evo_polls__option` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_polls__option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_polls__question`
--

DROP TABLE IF EXISTS `evo_polls__question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_polls__question` (
  `pqst_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pqst_owner_user_ID` int(10) unsigned NOT NULL,
  `pqst_question_text` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pqst_max_answers` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`pqst_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_polls__question`
--

LOCK TABLES `evo_polls__question` WRITE;
/*!40000 ALTER TABLE `evo_polls__question` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_polls__question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_postcats`
--

DROP TABLE IF EXISTS `evo_postcats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_postcats` (
  `postcat_post_ID` int(10) unsigned NOT NULL,
  `postcat_cat_ID` int(10) unsigned NOT NULL,
  `postcat_order` double DEFAULT NULL,
  PRIMARY KEY (`postcat_post_ID`,`postcat_cat_ID`),
  UNIQUE KEY `catpost` (`postcat_cat_ID`,`postcat_post_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_postcats`
--

LOCK TABLES `evo_postcats` WRITE;
/*!40000 ALTER TABLE `evo_postcats` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_postcats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_regional__city`
--

DROP TABLE IF EXISTS `evo_regional__city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_regional__city` (
  `city_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_ctry_ID` int(10) unsigned NOT NULL,
  `city_rgn_ID` int(10) unsigned DEFAULT NULL,
  `city_subrg_ID` int(10) unsigned DEFAULT NULL,
  `city_postcode` char(12) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `city_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `city_preferred` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`city_ID`),
  KEY `city_ctry_ID_postcode` (`city_ctry_ID`,`city_postcode`),
  KEY `city_rgn_ID_postcode` (`city_rgn_ID`,`city_postcode`),
  KEY `city_subrg_ID_postcode` (`city_subrg_ID`,`city_postcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_regional__city`
--

LOCK TABLES `evo_regional__city` WRITE;
/*!40000 ALTER TABLE `evo_regional__city` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_regional__city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_regional__country`
--

DROP TABLE IF EXISTS `evo_regional__country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_regional__country` (
  `ctry_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctry_code` char(2) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ctry_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctry_curr_ID` int(10) unsigned DEFAULT NULL,
  `ctry_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `ctry_preferred` tinyint(1) NOT NULL DEFAULT 0,
  `ctry_status` enum('trusted','suspect','blocked') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ctry_block_count` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`ctry_ID`),
  UNIQUE KEY `ctry_code` (`ctry_code`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_regional__country`
--

LOCK TABLES `evo_regional__country` WRITE;
/*!40000 ALTER TABLE `evo_regional__country` DISABLE KEYS */;
INSERT INTO `evo_regional__country` VALUES
(1,'af','Afghanistan',1,1,0,NULL,0),
(2,'ax','Aland Islands',2,1,0,NULL,0),
(3,'al','Albania',3,1,0,NULL,0),
(4,'dz','Algeria',4,1,0,NULL,0),
(5,'as','American Samoa',5,1,0,NULL,0),
(6,'ad','Andorra',2,1,0,NULL,0),
(7,'ao','Angola',6,1,0,NULL,0),
(8,'ai','Anguilla',7,1,0,NULL,0),
(9,'aq','Antarctica',NULL,1,0,NULL,0),
(10,'ag','Antigua And Barbuda',7,1,0,NULL,0),
(11,'ar','Argentina',8,1,0,NULL,0),
(12,'am','Armenia',9,1,0,NULL,0),
(13,'aw','Aruba',10,1,0,NULL,0),
(14,'au','Australia',11,1,0,NULL,0),
(15,'at','Austria',2,1,0,NULL,0),
(16,'az','Azerbaijan',12,1,0,NULL,0),
(17,'bs','Bahamas',13,1,0,NULL,0),
(18,'bh','Bahrain',14,1,0,NULL,0),
(19,'bd','Bangladesh',15,1,0,NULL,0),
(20,'bb','Barbados',16,1,0,NULL,0),
(21,'by','Belarus',17,1,0,NULL,0),
(22,'be','Belgium',2,1,0,NULL,0),
(23,'bz','Belize',18,1,0,NULL,0),
(24,'bj','Benin',19,1,0,NULL,0),
(25,'bm','Bermuda',20,1,0,NULL,0),
(26,'bt','Bhutan',62,1,0,NULL,0),
(27,'bo','Bolivia',NULL,1,0,NULL,0),
(28,'ba','Bosnia And Herzegovina',21,1,0,NULL,0),
(29,'bw','Botswana',22,1,0,NULL,0),
(30,'bv','Bouvet Island',23,1,0,NULL,0),
(31,'br','Brazil',24,1,0,NULL,0),
(32,'io','British Indian Ocean Territory',5,1,0,NULL,0),
(33,'bn','Brunei Darussalam',25,1,0,NULL,0),
(34,'bg','Bulgaria',26,1,0,NULL,0),
(35,'bf','Burkina Faso',19,1,0,NULL,0),
(36,'bi','Burundi',27,1,0,NULL,0),
(37,'kh','Cambodia',28,1,0,NULL,0),
(38,'cm','Cameroon',29,1,0,NULL,0),
(39,'ca','Canada',30,1,0,NULL,0),
(40,'cv','Cape Verde',31,1,0,NULL,0),
(41,'ky','Cayman Islands',32,1,0,NULL,0),
(42,'cf','Central African Republic',29,1,0,NULL,0),
(43,'td','Chad',29,1,0,NULL,0),
(44,'cl','Chile',159,1,0,NULL,0),
(45,'cn','China',33,1,0,NULL,0),
(46,'cx','Christmas Island',11,1,0,NULL,0),
(47,'cc','Cocos Islands',11,1,0,NULL,0),
(48,'co','Colombia',156,1,0,NULL,0),
(49,'km','Comoros',34,1,0,NULL,0),
(50,'cg','Congo',29,1,0,NULL,0),
(51,'cd','Congo Republic',35,1,0,NULL,0),
(52,'ck','Cook Islands',36,1,0,NULL,0),
(53,'cr','Costa Rica',37,1,0,NULL,0),
(54,'ci','Cote Divoire',19,1,0,NULL,0),
(55,'hr','Croatia',38,1,0,NULL,0),
(56,'cu','Cuba',157,1,0,NULL,0),
(57,'cy','Cyprus',2,1,0,NULL,0),
(58,'cz','Czech Republic',39,1,0,NULL,0),
(59,'dk','Denmark',40,1,0,NULL,0),
(60,'dj','Djibouti',41,1,0,NULL,0),
(61,'dm','Dominica',7,1,0,NULL,0),
(62,'do','Dominican Republic',42,1,0,NULL,0),
(63,'ec','Ecuador',5,1,0,NULL,0),
(64,'eg','Egypt',43,1,0,NULL,0),
(65,'sv','El Salvador',158,1,0,NULL,0),
(66,'gq','Equatorial Guinea',29,1,0,NULL,0),
(67,'er','Eritrea',44,1,0,NULL,0),
(68,'ee','Estonia',45,1,0,NULL,0),
(69,'et','Ethiopia',46,1,0,NULL,0),
(70,'fk','Falkland Islands (Malvinas)',47,1,0,NULL,0),
(71,'fo','Faroe Islands',40,1,0,NULL,0),
(72,'fj','Fiji',48,1,0,NULL,0),
(73,'fi','Finland',2,1,0,NULL,0),
(74,'fr','France',2,1,0,NULL,0),
(75,'gf','French Guiana',2,1,0,NULL,0),
(76,'pf','French Polynesia',49,1,0,NULL,0),
(77,'tf','French Southern Territories',2,1,0,NULL,0),
(78,'ga','Gabon',29,1,0,NULL,0),
(79,'gm','Gambia',50,1,0,NULL,0),
(80,'ge','Georgia',51,1,0,NULL,0),
(81,'de','Germany',2,1,0,NULL,0),
(82,'gh','Ghana',52,1,0,NULL,0),
(83,'gi','Gibraltar',53,1,0,NULL,0),
(84,'gr','Greece',2,1,0,NULL,0),
(85,'gl','Greenland',40,1,0,NULL,0),
(86,'gd','Grenada',7,1,0,NULL,0),
(87,'gp','Guadeloupe',2,1,0,NULL,0),
(88,'gu','Guam',5,1,0,NULL,0),
(89,'gt','Guatemala',54,1,0,NULL,0),
(90,'gg','Guernsey',55,1,0,NULL,0),
(91,'gn','Guinea',56,1,0,NULL,0),
(92,'gw','Guinea-bissau',19,1,0,NULL,0),
(93,'gy','Guyana',57,1,0,NULL,0),
(94,'ht','Haiti',160,1,0,NULL,0),
(95,'hm','Heard Island And Mcdonald Islands',11,1,0,NULL,0),
(96,'va','Holy See (vatican City State)',2,1,0,NULL,0),
(97,'hn','Honduras',58,1,0,NULL,0),
(98,'hk','Hong Kong',59,1,0,NULL,0),
(99,'hu','Hungary',60,1,0,NULL,0),
(100,'is','Iceland',61,1,0,NULL,0),
(101,'in','India',62,1,0,NULL,0),
(102,'id','Indonesia',63,1,0,NULL,0),
(103,'ir','Iran',64,1,0,NULL,0),
(104,'iq','Iraq',65,1,0,NULL,0),
(105,'ie','Ireland',2,1,0,NULL,0),
(106,'im','Isle Of Man',NULL,1,0,NULL,0),
(107,'il','Israel',66,1,0,NULL,0),
(108,'it','Italy',2,1,0,NULL,0),
(109,'jm','Jamaica',67,1,0,NULL,0),
(110,'jp','Japan',68,1,0,NULL,0),
(111,'je','Jersey',55,1,0,NULL,0),
(112,'jo','Jordan',69,1,0,NULL,0),
(113,'kz','Kazakhstan',70,1,0,NULL,0),
(114,'ke','Kenya',71,1,0,NULL,0),
(115,'ki','Kiribati',11,1,0,NULL,0),
(116,'kp','Korea',72,1,0,NULL,0),
(117,'kr','Korea',73,1,0,NULL,0),
(118,'kw','Kuwait',74,1,0,NULL,0),
(119,'kg','Kyrgyzstan',75,1,0,NULL,0),
(120,'la','Lao',76,1,0,NULL,0),
(121,'lv','Latvia',77,1,0,NULL,0),
(122,'lb','Lebanon',78,1,0,NULL,0),
(123,'ls','Lesotho',121,1,0,NULL,0),
(124,'lr','Liberia',79,1,0,NULL,0),
(125,'ly','Libyan Arab Jamahiriya',80,1,0,NULL,0),
(126,'li','Liechtenstein',81,1,0,NULL,0),
(127,'lt','Lithuania',82,1,0,NULL,0),
(128,'lu','Luxembourg',2,1,0,NULL,0),
(129,'mo','Macao',83,1,0,NULL,0),
(130,'mk','Macedonia',84,1,0,NULL,0),
(131,'mg','Madagascar',85,1,0,NULL,0),
(132,'mw','Malawi',86,1,0,NULL,0),
(133,'my','Malaysia',87,1,0,NULL,0),
(134,'mv','Maldives',88,1,0,NULL,0),
(135,'ml','Mali',19,1,0,NULL,0),
(136,'mt','Malta',2,1,0,NULL,0),
(137,'mh','Marshall Islands',5,1,0,NULL,0),
(138,'mq','Martinique',2,1,0,NULL,0),
(139,'mr','Mauritania',89,1,0,NULL,0),
(140,'mu','Mauritius',90,1,0,NULL,0),
(141,'yt','Mayotte',2,1,0,NULL,0),
(142,'mx','Mexico',161,1,0,NULL,0),
(143,'fm','Micronesia',2,1,0,NULL,0),
(144,'md','Moldova',91,1,0,NULL,0),
(145,'mc','Monaco',2,1,0,NULL,0),
(146,'mn','Mongolia',92,1,0,NULL,0),
(147,'me','Montenegro',2,1,0,NULL,0),
(148,'ms','Montserrat',7,1,0,NULL,0),
(149,'ma','Morocco',93,1,0,NULL,0),
(150,'mz','Mozambique',94,1,0,NULL,0),
(151,'mm','Myanmar',95,1,0,NULL,0),
(152,'na','Namibia',121,1,0,NULL,0),
(153,'nr','Nauru',11,1,0,NULL,0),
(154,'np','Nepal',96,1,0,NULL,0),
(155,'nl','Netherlands',2,1,0,NULL,0),
(156,'an','Netherlands Antilles',97,1,0,NULL,0),
(157,'nc','New Caledonia',49,1,0,NULL,0),
(158,'nz','New Zealand',36,1,0,NULL,0),
(159,'ni','Nicaragua',98,1,0,NULL,0),
(160,'ne','Niger',19,1,0,NULL,0),
(161,'ng','Nigeria',99,1,0,NULL,0),
(162,'nu','Niue',36,1,0,NULL,0),
(163,'nf','Norfolk Island',11,1,0,NULL,0),
(164,'mp','Northern Mariana Islands',5,1,0,NULL,0),
(165,'no','Norway',23,1,0,NULL,0),
(166,'om','Oman',100,1,0,NULL,0),
(167,'pk','Pakistan',101,1,0,NULL,0),
(168,'pw','Palau',5,1,0,NULL,0),
(169,'ps','Palestinian Territory',NULL,1,0,NULL,0),
(170,'pa','Panama',162,1,0,NULL,0),
(171,'pg','Papua New Guinea',102,1,0,NULL,0),
(172,'py','Paraguay',103,1,0,NULL,0),
(173,'pe','Peru',104,1,0,NULL,0),
(174,'ph','Philippines',105,1,0,NULL,0),
(175,'pn','Pitcairn',36,1,0,NULL,0),
(176,'pl','Poland',106,1,0,NULL,0),
(177,'pt','Portugal',2,1,0,NULL,0),
(178,'pr','Puerto Rico',5,1,0,NULL,0),
(179,'qa','Qatar',107,1,0,NULL,0),
(180,'re','Reunion',2,1,0,NULL,0),
(181,'ro','Romania',108,1,0,NULL,0),
(182,'ru','Russian Federation',109,1,0,NULL,0),
(183,'rw','Rwanda',110,1,0,NULL,0),
(184,'bl','Saint Barthelemy',2,1,0,NULL,0),
(185,'sh','Saint Helena',111,1,0,NULL,0),
(186,'kn','Saint Kitts And Nevis',7,1,0,NULL,0),
(187,'lc','Saint Lucia',7,1,0,NULL,0),
(188,'mf','Saint Martin',2,1,0,NULL,0),
(189,'pm','Saint Pierre And Miquelon',2,1,0,NULL,0),
(190,'vc','Saint Vincent And The Grenadines',7,1,0,NULL,0),
(191,'ws','Samoa',112,1,0,NULL,0),
(192,'sm','San Marino',2,1,0,NULL,0),
(193,'st','Sao Tome And Principe',113,1,0,NULL,0),
(194,'sa','Saudi Arabia',114,1,0,NULL,0),
(195,'sn','Senegal',19,1,0,NULL,0),
(196,'rs','Serbia',115,1,0,NULL,0),
(197,'sc','Seychelles',116,1,0,NULL,0),
(198,'sl','Sierra Leone',117,1,0,NULL,0),
(199,'sg','Singapore',118,1,0,NULL,0),
(200,'sk','Slovakia',2,1,0,NULL,0),
(201,'si','Slovenia',2,1,0,NULL,0),
(202,'sb','Solomon Islands',119,1,0,NULL,0),
(203,'so','Somalia',120,1,0,NULL,0),
(204,'za','South Africa',121,1,0,NULL,0),
(205,'gs','South Georgia',NULL,1,0,NULL,0),
(206,'es','Spain',2,1,0,NULL,0),
(207,'lk','Sri Lanka',122,1,0,NULL,0),
(208,'sd','Sudan',123,1,0,NULL,0),
(209,'sr','Suriname',124,1,0,NULL,0),
(210,'sj','Svalbard And Jan Mayen',23,1,0,NULL,0),
(211,'sz','Swaziland',125,1,0,NULL,0),
(212,'se','Sweden',126,1,0,NULL,0),
(213,'ch','Switzerland',81,1,0,NULL,0),
(214,'sy','Syrian Arab Republic',127,1,0,NULL,0),
(215,'tw','Taiwan, Province Of China',128,1,0,NULL,0),
(216,'tj','Tajikistan',129,1,0,NULL,0),
(217,'tz','Tanzania',130,1,0,NULL,0),
(218,'th','Thailand',131,1,0,NULL,0),
(219,'tl','Timor-leste',5,1,0,NULL,0),
(220,'tg','Togo',19,1,0,NULL,0),
(221,'tk','Tokelau',36,1,0,NULL,0),
(222,'to','Tonga',132,1,0,NULL,0),
(223,'tt','Trinidad And Tobago',133,1,0,NULL,0),
(224,'tn','Tunisia',134,1,0,NULL,0),
(225,'tr','Turkey',135,1,0,NULL,0),
(226,'tm','Turkmenistan',136,1,0,NULL,0),
(227,'tc','Turks And Caicos Islands',5,1,0,NULL,0),
(228,'tv','Tuvalu',11,1,0,NULL,0),
(229,'ug','Uganda',137,1,0,NULL,0),
(230,'ua','Ukraine',138,1,0,NULL,0),
(231,'ae','United Arab Emirates',139,1,0,NULL,0),
(232,'gb','United Kingdom',55,1,0,NULL,0),
(233,'us','United States',5,1,1,NULL,0),
(234,'um','United States Minor Outlying Islands',5,1,0,NULL,0),
(235,'uy','Uruguay',163,1,0,NULL,0),
(236,'uz','Uzbekistan',140,1,0,NULL,0),
(237,'vu','Vanuatu',141,1,0,NULL,0),
(239,'ve','Venezuela',142,1,0,NULL,0),
(240,'vn','Viet Nam',143,1,0,NULL,0),
(241,'vg','Virgin Islands, British',5,1,0,NULL,0),
(242,'vi','Virgin Islands, U.s.',5,1,0,NULL,0),
(243,'wf','Wallis And Futuna',49,1,0,NULL,0),
(244,'eh','Western Sahara',93,1,0,NULL,0),
(245,'ye','Yemen',144,1,0,NULL,0),
(246,'zm','Zambia',145,1,0,NULL,0),
(247,'zw','Zimbabwe',146,1,0,NULL,0),
(248,'ct','Catalonia',2,1,0,NULL,0);
/*!40000 ALTER TABLE `evo_regional__country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_regional__currency`
--

DROP TABLE IF EXISTS `evo_regional__currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_regional__currency` (
  `curr_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `curr_code` char(3) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `curr_shortcut` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `curr_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `curr_enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`curr_ID`),
  UNIQUE KEY `curr_code` (`curr_code`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_regional__currency`
--

LOCK TABLES `evo_regional__currency` WRITE;
/*!40000 ALTER TABLE `evo_regional__currency` DISABLE KEYS */;
INSERT INTO `evo_regional__currency` VALUES
(1,'AFN','&#x60b;','Afghani',1),
(2,'EUR','&euro;','Euro',1),
(3,'ALL','Lek','Lek',1),
(4,'DZD','DZD','Algerian Dinar',1),
(5,'USD','$','US Dollar',1),
(6,'AOA','AOA','Kwanza',1),
(7,'XCD','$','East Caribbean Dollar',1),
(8,'ARS','$','Argentine Peso',1),
(9,'AMD','AMD','Armenian Dram',1),
(10,'AWG','&fnof;','Aruban Guilder',1),
(11,'AUD','$','Australian Dollar',1),
(12,'AZN','&#x43c;&#x430;&#x43d;','Azerbaijanian Manat',1),
(13,'BSD','$','Bahamian Dollar',1),
(14,'BHD','BHD','Bahraini Dinar',1),
(15,'BDT','BDT','Taka',1),
(16,'BBD','$','Barbados Dollar',1),
(17,'BYR','p.','Belarussian Ruble',1),
(18,'BZD','BZ$','Belize Dollar',1),
(19,'XOF','XOF','CFA Franc BCEAO',1),
(20,'BMD','$','Bermudian Dollar',1),
(21,'BAM','KM','Convertible Marks',1),
(22,'BWP','P','Pula',1),
(23,'NOK','kr','Norwegian Krone',1),
(24,'BRL','R$','Brazilian Real',1),
(25,'BND','$','Brunei Dollar',1),
(26,'BGN','&#x43b;&#x432;','Bulgarian Lev',1),
(27,'BIF','BIF','Burundi Franc',1),
(28,'KHR','&#x17db;','Riel',1),
(29,'XAF','XAF','CFA Franc BEAC',1),
(30,'CAD','$','Canadian Dollar',1),
(31,'CVE','CVE','Cape Verde Escudo',1),
(32,'KYD','$','Cayman Islands Dollar',1),
(33,'CNY','&yen;','Yuan Renminbi',1),
(34,'KMF','KMF','Comoro Franc',1),
(35,'CDF','CDF','Congolese Franc',1),
(36,'NZD','$','New Zealand Dollar',1),
(37,'CRC','&#x20a1;','Costa Rican Colon',1),
(38,'HRK','kn','Croatian Kuna',1),
(39,'CZK','K&#x10d;','Czech Koruna',1),
(40,'DKK','kr','Danish Krone',1),
(41,'DJF','DJF','Djibouti Franc',1),
(42,'DOP','RD$','Dominican Peso',1),
(43,'EGP','&pound;','Egyptian Pound',1),
(44,'ERN','ERN','Nakfa',1),
(45,'EEK','EEK','Kroon',1),
(46,'ETB','ETB','Ethiopian Birr',1),
(47,'FKP','&pound;','Falkland Islands Pound',1),
(48,'FJD','$','Fiji Dollar',1),
(49,'XPF','XPF','CFP Franc',1),
(50,'GMD','GMD','Dalasi',1),
(51,'GEL','GEL','Lari',1),
(52,'GHS','GHS','Cedi',1),
(53,'GIP','&pound;','Gibraltar Pound',1),
(54,'GTQ','Q','Quetzal',1),
(55,'GBP','&pound;','Pound Sterling',1),
(56,'GNF','GNF','Guinea Franc',1),
(57,'GYD','$','Guyana Dollar',1),
(58,'HNL','L','Lempira',1),
(59,'HKD','$','Hong Kong Dollar',1),
(60,'HUF','Ft','Forint',1),
(61,'ISK','kr','Iceland Krona',1),
(62,'INR','Rs','Indian Rupee',1),
(63,'IDR','Rp','Rupiah',1),
(64,'IRR','&#xfdfc;','Iranian Rial',1),
(65,'IQD','IQD','Iraqi Dinar',1),
(66,'ILS','&#x20aa;','New Israeli Sheqel',1),
(67,'JMD','J$','Jamaican Dollar',1),
(68,'JPY','&yen;','Yen',1),
(69,'JOD','JOD','Jordanian Dinar',1),
(70,'KZT','&#x43b;&#x432;','Tenge',1),
(71,'KES','KES','Kenyan Shilling',1),
(72,'KPW','&#x20a9;','North Korean Won',1),
(73,'KRW','&#x20a9;','Won',1),
(74,'KWD','KWD','Kuwaiti Dinar',1),
(75,'KGS','&#x43b;&#x432;','Som',1),
(76,'LAK','&#x20ad;','Kip',1),
(77,'LVL','Ls','Latvian Lats',1),
(78,'LBP','&pound;','Lebanese Pound',1),
(79,'LRD','$','Liberian Dollar',1),
(80,'LYD','LYD','Libyan Dinar',1),
(81,'CHF','CHF','Swiss Franc',1),
(82,'LTL','Lt','Lithuanian Litas',1),
(83,'MOP','MOP','Pataca',1),
(84,'MKD','&#x434;&#x435;&#x43d;','Denar',1),
(85,'MGA','MGA','Malagasy Ariary',1),
(86,'MWK','MWK','Kwacha',1),
(87,'MYR','RM','Malaysian Ringgit',1),
(88,'MVR','MVR','Rufiyaa',1),
(89,'MRO','MRO','Ouguiya',1),
(90,'MUR','Rs','Mauritius Rupee',1),
(91,'MDL','MDL','Moldovan Leu',1),
(92,'MNT','&#x20ae;','Tugrik',1),
(93,'MAD','MAD','Moroccan Dirham',1),
(94,'MZN','MT','Metical',1),
(95,'MMK','MMK','Kyat',1),
(96,'NPR','Rs','Nepalese Rupee',1),
(97,'ANG','&fnof;','Netherlands Antillian Guilder',1),
(98,'NIO','C$','Cordoba Oro',1),
(99,'NGN','&#x20a6;','Naira',1),
(100,'OMR','&#xfdfc;','Rial Omani',1),
(101,'PKR','Rs','Pakistan Rupee',1),
(102,'PGK','PGK','Kina',1),
(103,'PYG','Gs','Guarani',1),
(104,'PEN','S/.','Nuevo Sol',1),
(105,'PHP','Php','Philippine Peso',1),
(106,'PLN','z&#x142;','Zloty',1),
(107,'QAR','&#xfdfc;','Qatari Rial',1),
(108,'RON','lei','New Leu',1),
(109,'RUB','&#x440;&#x443;&#x431;','Russian Ruble',1),
(110,'RWF','RWF','Rwanda Franc',1),
(111,'SHP','&pound;','Saint Helena Pound',1),
(112,'WST','WST','Tala',1),
(113,'STD','STD','Dobra',1),
(114,'SAR','&#xfdfc;','Saudi Riyal',1),
(115,'RSD','&#x414;&#x438;&#x43d;.','Serbian Dinar',1),
(116,'SCR','Rs','Seychelles Rupee',1),
(117,'SLL','SLL','Leone',1),
(118,'SGD','$','Singapore Dollar',1),
(119,'SBD','$','Solomon Islands Dollar',1),
(120,'SOS','S','Somali Shilling',1),
(121,'ZAR','R','Rand',1),
(122,'LKR','Rs','Sri Lanka Rupee',1),
(123,'SDG','SDG','Sudanese Pound',1),
(124,'SRD','$','Surinam Dollar',1),
(125,'SZL','SZL','Lilangeni',1),
(126,'SEK','kr','Swedish Krona',1),
(127,'SYP','&pound;','Syrian Pound',1),
(128,'TWD','$','New Taiwan Dollar',1),
(129,'TJS','TJS','Somoni',1),
(130,'TZS','TZS','Tanzanian Shilling',1),
(131,'THB','THB','Baht',1),
(132,'TOP','TOP','Pa',1),
(133,'TTD','TT$','Trinidad and Tobago Dollar',1),
(134,'TND','TND','Tunisian Dinar',1),
(135,'TRY','TL','Turkish Lira',1),
(136,'TMT','TMT','Manat',1),
(137,'UGX','UGX','Uganda Shilling',1),
(138,'UAH','&#x20b4;','Hryvnia',1),
(139,'AED','AED','UAE Dirham',1),
(140,'UZS','&#x43b;&#x432;','Uzbekistan Sum',1),
(141,'VUV','VUV','Vatu',1),
(142,'VEF','Bs','Bolivar Fuerte',1),
(143,'VND','&#x20ab;','Dong',1),
(144,'YER','&#xfdfc;','Yemeni Rial',1),
(145,'ZMK','ZMK','Zambian Kwacha',1),
(146,'ZWL','Z$','Zimbabwe Dollar',1),
(147,'XAU','XAU','Gold',1),
(148,'XBA','XBA','EURCO',1),
(149,'XBB','XBB','European Monetary Unit',1),
(150,'XBC','XBC','European Unit of Account 9',1),
(151,'XBD','XBD','European Unit of Account 17',1),
(152,'XDR','XDR','SDR',1),
(153,'XPD','XPD','Palladium',1),
(154,'XPT','XPT','Platinum',1),
(155,'XAG','XAG','Silver',1),
(156,'COP','$','Colombian peso',1),
(157,'CUP','$','Cuban peso',1),
(158,'SVC','SVC','Salvadoran colon',1),
(159,'CLP','$','Chilean peso',1),
(160,'HTG','G','Haitian gourde',1),
(161,'MXN','$','Mexican peso',1),
(162,'PAB','PAB','Panamanian balboa',1),
(163,'UYU','$','Uruguayan peso',1);
/*!40000 ALTER TABLE `evo_regional__currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_regional__region`
--

DROP TABLE IF EXISTS `evo_regional__region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_regional__region` (
  `rgn_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rgn_ctry_ID` int(10) unsigned NOT NULL,
  `rgn_code` char(6) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `rgn_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rgn_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `rgn_preferred` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rgn_ID`),
  UNIQUE KEY `rgn_ctry_ID_code` (`rgn_ctry_ID`,`rgn_code`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_regional__region`
--

LOCK TABLES `evo_regional__region` WRITE;
/*!40000 ALTER TABLE `evo_regional__region` DISABLE KEYS */;
INSERT INTO `evo_regional__region` VALUES
(1,233,'AL','Alabama',1,0),
(2,233,'AK','Alaska',1,0),
(3,233,'AZ','Arizona',1,0),
(4,233,'AR','Arkansas',1,0),
(5,233,'CA','California',1,0),
(6,233,'CO','Colorado',1,0),
(7,233,'CT','Connecticut',1,0),
(8,233,'DE','Delaware',1,0),
(9,233,'FL','Florida',1,0),
(10,233,'GA','Georgia',1,0),
(11,233,'HI','Hawaii',1,0),
(12,233,'ID','Idaho',1,0),
(13,233,'IL','Illinois',1,0),
(14,233,'IN','Indiana',1,0),
(15,233,'IA','Iowa',1,0),
(16,233,'KS','Kansas',1,0),
(17,233,'KY','Kentucky',1,0),
(18,233,'LA','Louisiana',1,0),
(19,233,'ME','Maine',1,0),
(20,233,'MD','Maryland',1,0),
(21,233,'MA','Massachusetts',1,0),
(22,233,'MI','Michigan',1,0),
(23,233,'MN','Minnesota',1,0),
(24,233,'MS','Mississippi',1,0),
(25,233,'MO','Missouri',1,0),
(26,233,'MT','Montana',1,0),
(27,233,'NE','Nebraska',1,0),
(28,233,'NV','Nevada',1,0),
(29,233,'NH','New Hampshire',1,0),
(30,233,'NJ','New Jersey',1,0),
(31,233,'NM','New Mexico',1,0),
(32,233,'NY','New York',1,0),
(33,233,'NC','North Carolina',1,0),
(34,233,'ND','North Dakota',1,0),
(35,233,'OH','Ohio',1,0),
(36,233,'OK','Oklahoma',1,0),
(37,233,'OR','Oregon',1,0),
(38,233,'PA','Pennsylvania',1,0),
(39,233,'RI','Rhode Island',1,0),
(40,233,'SC','South Carolina',1,0),
(41,233,'SD','South Dakota',1,0),
(42,233,'TN','Tennessee',1,0),
(43,233,'TX','Texas',1,0),
(44,233,'UT','Utah',1,0),
(45,233,'VT','Vermont',1,0),
(46,233,'VA','Virginia',1,0),
(47,233,'WA','Washington',1,0),
(48,233,'WV','West Virginia',1,0),
(49,233,'WI','Wisconsin',1,0),
(50,233,'WY','Wyoming',1,0);
/*!40000 ALTER TABLE `evo_regional__region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_regional__subregion`
--

DROP TABLE IF EXISTS `evo_regional__subregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_regional__subregion` (
  `subrg_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subrg_rgn_ID` int(10) unsigned NOT NULL,
  `subrg_code` char(6) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `subrg_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subrg_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `subrg_preferred` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`subrg_ID`),
  UNIQUE KEY `subrg_rgn_ID_code` (`subrg_rgn_ID`,`subrg_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_regional__subregion`
--

LOCK TABLES `evo_regional__subregion` WRITE;
/*!40000 ALTER TABLE `evo_regional__subregion` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_regional__subregion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_section`
--

DROP TABLE IF EXISTS `evo_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_section` (
  `sec_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sec_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_order` int(11) NOT NULL,
  `sec_owner_user_ID` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`sec_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_section`
--

LOCK TABLES `evo_section` WRITE;
/*!40000 ALTER TABLE `evo_section` DISABLE KEYS */;
INSERT INTO `evo_section` VALUES
(1,'No Section',1,1);
/*!40000 ALTER TABLE `evo_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_sessions`
--

DROP TABLE IF EXISTS `evo_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_sessions` (
  `sess_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sess_key` char(32) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `sess_start_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `sess_lastseen_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT 'User last logged activation time. Value may be off by up to 60 seconds',
  `sess_ipaddress` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `sess_user_ID` int(10) DEFAULT NULL,
  `sess_data` mediumblob DEFAULT NULL,
  `sess_device` varchar(8) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`sess_ID`),
  KEY `sess_user_ID` (`sess_user_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_sessions`
--

LOCK TABLES `evo_sessions` WRITE;
/*!40000 ALTER TABLE `evo_sessions` DISABLE KEYS */;
INSERT INTO `evo_sessions` VALUES
(1,'TsZx1SFwUYH1uu0HcPTXoOs9oIXW31xS','2026-09-23 13:02:47','2026-09-23 13:02:47','192.168.80.1',NULL,NULL,''),
(2,'pP37oWSZ1OEsqr8QPAV54AZXdpZbRQiJ','2026-09-23 13:03:31','2026-09-23 13:03:31','192.168.80.1',NULL,'a:3:{s:22:\"crumb_latest_loginform\";a:2:{i:0;N;i:1;s:43:\"EcUYbjTHgmKpcOjLOmKaMzha7Phr8Cav-1790168611\";}s:11:\"core.pepper\";a:2:{i:0;i:1790255011;i:1;s:64:\"kw697BTr4JfnNdwtIQmVGm4QLOzmqUqFAkZtMCRabv4MefiM6XYBOhGuNxovw3nD\";}s:22:\"crumb_latest_loginsalt\";a:2:{i:0;N;i:1;s:43:\"KcGqlPfSTSVqfKHvFE0izDEWxWMMQt5k-1790168611\";}}','');
/*!40000 ALTER TABLE `evo_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_settings`
--

DROP TABLE IF EXISTS `evo_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_settings` (
  `set_name` varchar(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `set_value` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_settings`
--

LOCK TABLES `evo_settings` WRITE;
/*!40000 ALTER TABLE `evo_settings` DISABLE KEYS */;
INSERT INTO `evo_settings` VALUES
('antispam_suspicious_group','5'),
('antispam_trust_groups','1,2,3,6'),
('auto_prune_stats_done','2026-09-23 15:02:47'),
('db_version','16170'),
('default_locale','en-US'),
('evocache_foldername','_evocache'),
('evonet_last_attempt','1790168567'),
('evonet_last_update','1790168567'),
('evonet_last_version_checked','b2evo b2evolution 7.2.5-stable 2022-08-06'),
('newusers_canregister','yes'),
('newusers_grp_ID','4'),
('normal_skin_ID','9'),
('quick_registration','1'),
('registration_is_public','1');
/*!40000 ALTER TABLE `evo_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_skins__skin`
--

DROP TABLE IF EXISTS `evo_skins__skin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_skins__skin` (
  `skin_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `skin_class` varchar(32) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `skin_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin_type` enum('normal','feed','sitemap','mobile','tablet','alt','rwd') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'normal',
  `skin_folder` varchar(32) NOT NULL,
  PRIMARY KEY (`skin_ID`),
  UNIQUE KEY `skin_folder` (`skin_folder`),
  UNIQUE KEY `skin_class` (`skin_class`),
  KEY `skin_name` (`skin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_skins__skin`
--

LOCK TABLES `evo_skins__skin` WRITE;
/*!40000 ALTER TABLE `evo_skins__skin` DISABLE KEYS */;
INSERT INTO `evo_skins__skin` VALUES
(1,'bootstrap_blog_Skin','Bootstrap Blog','rwd','bootstrap_blog_skin'),
(2,'bootstrap_main_Skin','Bootstrap Main','rwd','bootstrap_main_skin'),
(3,'bootstrap_gallery_Skin','Bootstrap Gallery Skin','rwd','bootstrap_gallery_skin'),
(4,'bootstrap_forums_Skin','Bootstrap Forums','rwd','bootstrap_forums_skin'),
(5,'bootstrap_manual_Skin','Bootstrap Manual','rwd','bootstrap_manual_skin'),
(6,'jared_Skin','Jared Skin','rwd','jared_skin'),
(7,'_atom_Skin','Atom','feed','_atom'),
(8,'_rss2_Skin','RSS 2.0','feed','_rss2'),
(9,'default_site_Skin','Default site skin','normal','default_site_skin'),
(10,'bootstrap_site_navbar_Skin','Bootstrap Site Navbar','rwd','bootstrap_site_navbar_skin'),
(11,'bootstrap_site_tabs_Skin','Bootstrap Site Tabs','rwd','bootstrap_site_tabs_skin'),
(12,'bootstrap_site_dropdown_Skin','Bootstrap Site Dropdown','rwd','bootstrap_site_dropdown_skin');
/*!40000 ALTER TABLE `evo_skins__skin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_slug`
--

DROP TABLE IF EXISTS `evo_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_slug` (
  `slug_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug_title` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `slug_type` char(6) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'item',
  `slug_itm_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`slug_ID`),
  UNIQUE KEY `slug_title` (`slug_title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_slug`
--

LOCK TABLES `evo_slug` WRITE;
/*!40000 ALTER TABLE `evo_slug` DISABLE KEYS */;
INSERT INTO `evo_slug` VALUES
(1,'help','help',NULL);
/*!40000 ALTER TABLE `evo_slug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_social__network`
--

DROP TABLE IF EXISTS `evo_social__network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_social__network` (
  `sn_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn_name` varchar(32) NOT NULL,
  PRIMARY KEY (`sn_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_social__network`
--

LOCK TABLES `evo_social__network` WRITE;
/*!40000 ALTER TABLE `evo_social__network` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_social__network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_subscriptions`
--

DROP TABLE IF EXISTS `evo_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_subscriptions` (
  `sub_coll_ID` int(10) unsigned NOT NULL,
  `sub_user_ID` int(10) unsigned NOT NULL,
  `sub_items` tinyint(1) NOT NULL,
  `sub_items_mod` tinyint(1) NOT NULL,
  `sub_comments` tinyint(1) NOT NULL,
  PRIMARY KEY (`sub_coll_ID`,`sub_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_subscriptions`
--

LOCK TABLES `evo_subscriptions` WRITE;
/*!40000 ALTER TABLE `evo_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_syslog`
--

DROP TABLE IF EXISTS `evo_syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_syslog` (
  `slg_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slg_timestamp` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `slg_user_ID` int(10) unsigned DEFAULT NULL,
  `slg_type` enum('info','warning','error','critical_error') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'info',
  `slg_origin` enum('core','plugin') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `slg_origin_ID` int(10) unsigned DEFAULT NULL,
  `slg_object` enum('comment','item','user','file','email_log') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `slg_object_ID` int(10) unsigned DEFAULT NULL,
  `slg_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`slg_ID`),
  KEY `slg_object` (`slg_object`,`slg_object_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_syslog`
--

LOCK TABLES `evo_syslog` WRITE;
/*!40000 ALTER TABLE `evo_syslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_templates`
--

DROP TABLE IF EXISTS `evo_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_templates` (
  `tpl_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tpl_code` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `tpl_translates_tpl_ID` int(10) unsigned DEFAULT NULL,
  `tpl_locale` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'en-US',
  `tpl_template_code` mediumtext DEFAULT NULL,
  `tpl_context` enum('custom1','custom2','custom3','content_list_master','content_list_item','content_list_category','content_block','item_details','item_content','registration_master','registration','search_form','search_result') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'custom1',
  `tpl_owner_grp_ID` int(4) DEFAULT NULL,
  PRIMARY KEY (`tpl_ID`),
  UNIQUE KEY `tpl_code` (`tpl_code`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_templates`
--

LOCK TABLES `evo_templates` WRITE;
/*!40000 ALTER TABLE `evo_templates` DISABLE KEYS */;
INSERT INTO `evo_templates` VALUES
(1,'Item Details: Posted on Date at Time','item_details_infoline_date',NULL,'en-US','<span class=\"small text-muted\">[flag_icon] Posted on [issue_time|time_format=#extended_date] at [issue_time|time_format=#short_time]</span>','item_details',NULL),
(2,'Item Details: Posted by Author on Date at Time in Categories','item_details_infoline_standard',NULL,'en-US','<span class=\"small text-muted\">[flag_icon] Posted by [author] on [issue_time|time_format=#extended_date] in [categories]</span>','item_details',NULL),
(3,'Item Details: Long info line','item_details_infoline_long',NULL,'en-US','<span class=\"small text-muted\">[flag_icon] [Item:permalink|text=#linkicon] Posted by [author] on [issue_date|date_format=#extended_date] at [issue_time|time_format=#short_time] in [categories] — Last touched: [last_touched] — Last Updated: [contents_last_updated][refresh_contents_last_updated_link] [edit_link]</span>','item_details',NULL),
(4,'Item Details: Thread last updated on Date','item_details_infoline_forums',NULL,'en-US','<span class=\"small text-muted\">[flag_icon] Thread last updated on [contents_last_updated|format=#extended_date] at [contents_last_updated|format=#short_time] [refresh_contents_last_updated_link]</span>','item_details',NULL),
(5,'Item Details: Comment Link','item_details_feedback_link',NULL,'en-US','<nav class=\"post_comments_link\">[feedback_link]</nav>','item_details',NULL),
(6,'Item Details: Small Print: Standard','item_details_smallprint_standard',NULL,'en-US','[author|link_text=only_avatar|thumb_size=crop-top-32x32|link_class=leftmargin] This entry was posted by [author|link_text=preferredname] and filed under [categories].[tags|before= Tags: |after=.] [edit_link]','item_details',NULL),
(7,'Item Details: Small Print: Long','item_details_smallprint_long',NULL,'en-US','[author|link_text=only_avatar|thumb_size=crop-top-32x32|link_class=leftmargin] [flag_icon] This entry was posted on [issue_time|time_format=#extended_date] at [issue_time|time_format=#short_time] by [author|link_text=preferredname] and filed under [categories].[tags|before= Tags: |after=.] [edit_link]','item_details',NULL),
(8,'Item Details: Small Print: Revisions','item_details_revisions',NULL,'en-US','[flag_icon] Created by [author] &bull; Last edit by [lastedit_user] on [mod_date|date_format=#extended_date] [history_link|before=&bull; ] [propose_change_link|before=&bull; ]','item_details',NULL),
(9,'Item Details: Author Details','item_details_author_details',NULL,'en-US','<table>\n	<tbody>\n		<tr>\n			<th>Picture</th>\n			<td>[User:picture|size=crop-top-128x128]</td>\n		</tr>\n		<tr>\n			<th>Fullname</th>\n			<td>[User:fullname]</td>\n		</tr>\n		<tr>\n			<th>Last name</th>\n			<td>[User:last_name]</td>\n		</tr>\n		<tr>\n			<th>First name</th>\n			<td>[User:first_name]</td>\n		</tr>\n		<tr>\n			<th>Nickname</th>\n			<td>[User:nick_name]</td>\n		</tr>\n		<tr>\n			<th>Preferred name</th>\n			<td>[User:preferred_name]</td>\n		</tr>\n		<tr>\n			<th>ID</th>\n			<td>[User:id]</td>\n		</tr>\n		<tr>\n			<th>Login</th>\n			<td>[User:login]</td>\n		</tr>\n		<tr>\n			<th>Email</th>\n			<td>[User:email]</td>\n		</tr>\n		<tr>\n			<th>Micro bio</th>\n			<td>[User:custom|field=microbio]</td>\n		</tr>\n		<tr>\n			<th>Twitter</th>\n			<td>[User:custom|field=twitter]</td>\n		</tr>\n		<tr>\n			<th>Facebook</th>\n			<td>[User:custom|field=facebook]</td>\n		</tr>\n		<tr>\n			<th>LinkedIn</th>\n			<td>[User:custom|field=linkedin]</td>\n		</tr>\n		<tr>\n			<th>GitHub</th>\n			<td>[User:custom|field=github]</td>\n		</tr>\n		<tr>\n			<th>Website</th>\n			<td>[User:custom|field=website|separator=<br />]</td>\n		</tr>\n	</tbody>\n</table>','item_details',NULL),
(10,'Item Details: Attachments: List','item_details_files_list',NULL,'en-US','[files|\n				before=<div class=\"item_attachments\"><ul class=\"bFiles\">|\n				before_attach=<li>|\n				before_attach_size=<span class=\"file_size\">(|\n				after_attach_size=)</span>|\n				after_attach=</li>|\n				after=</ul></div>|\n				file_link_format=$file_name$|\n				display_download_icon=1|\n				file_link_text=title|\n				display_file_size=1|\n				display_file_desc=1|\n			]','item_details',NULL),
(11,'Item Details: Attachments: Buttons','item_details_files_buttons',NULL,'en-US','[files|\n				before=|\n				before_attach=|\n				before_attach_size=(|\n				after_attach_size=)|\n				after_attach=|\n				after=|\n				attach_format=$file_link$|\n				file_link_format=$icon$ <b>Download Now!</b><br />$file_name$ $file_size$ $file_desc$|\n				display_download_icon=1|\n				file_link_text=title|\n				file_link_class=btn btn-success|\n				display_file_size=1|\n				display_file_desc=1|\n			]','item_details',NULL),
(12,'Item Details: About Author','about_author',NULL,'en-US','<div class=\"clearfix\"><div class=\"evo_avatar\" rel=\"bubbletip_user_[User:id]\">\n	[User:picture|size=crop-top-48x48]\n</div>\n<div class=\"evo_author_display_field\">\n	[User:custom|field=microbio]\n</div></div>','item_details',NULL),
(13,'Content List','content_list',NULL,'en-US','[set:before_list=<ul class=\"chapters_list posts_list\">]\n[set:after_list=</ul>]\n[set:subcat_template=content_list_subcat]\n[set:item_template=content_list_item]\n[set:crossposted_item_template=content_list_crossposted_item| // Use same as item_template]\n[set:active_item_template=content_list_active_item| // Use same as item_template]','content_list_master',NULL),
(14,'Content List: Subcat','content_list_subcat',NULL,'en-US','<li class=\"chapter\">\n	<h3>[Cat:permalink|text=#expandicon+name|class=link]</h3>\n	<div class=\"evo_cat__description\">[Cat:description]</div>\n</li>','content_list_category',NULL),
(15,'Content List: Item','content_list_item',NULL,'en-US','<li>\n	<h3>[read_status] [Item:permalink|text=#fileicon+title|class=link] [flag_icon]</h3>[visibility_status]\n	[Item:excerpt|\n		before=<div class=\"evo_post__excerpt_text\">|\n		after=</div>|\n		excerpt_before_more=<span class=\"evo_post__excerpt_more_link\">|\n		excerpt_more_text=#more+arrow|excerpt_after_more=</span>]\n</li>','content_list_item',NULL),
(16,'Content List: Crossposted Item','content_list_crossposted_item',NULL,'en-US','<li><i>\n	<h3>[read_status] [Item:permalink|text=#fileicon+title|class=link] [flag_icon]</h3>[visibility_status]\n	[Item:excerpt|\n		before=<div class=\"evo_post__excerpt_text\">|\n		after=</div>|\n		excerpt_before_more=<span class=\"evo_post__excerpt_more_link\">|\n		excerpt_more_text=#more+arrow|excerpt_after_more=</span>]\n</i></li>','content_list_item',NULL),
(17,'Content Title List','content_title_list',NULL,'en-US','[set:before_list=<ul>]\n[set:after_list=</ul>]\n[set:item_template=content_title_list_item]\n[set:crossposted_item_template=| // Use same as item_template]\n[set:active_item_template=content_title_list_active_item]','content_list_master',NULL),
(18,'Content Title List: Item','content_title_list_item',NULL,'en-US','<li>[Item:permalink|class=default|title=]</li>','content_list_item',NULL),
(19,'Content Title List: Active Item','content_title_list_active_item',NULL,'en-US','<li class=\"selected\">[Item:permalink|class=selected|title=]</li>','content_list_item',NULL),
(20,'Content Tiles Style 1 (Fully clickable)','content_tiles',NULL,'en-US','[set:before_list=<div class=\"evo_tiles row\">]\n[set:after_list=</div>]\n[set:subcat_template=content_tiles_subcat|          // Sub-template for displaying categories]\n[set:item_template=content_tiles_item|              // Sub-template for displaying items]\n[set:crossposted_item_template=|                    // Sub-template for displaying crossposted items]\n[set:active_item_template=|                         // Sub-template for displaying active item]\n[set:rwd_cols=col-xs-12 col-sm-6 col-md-6 col-lg-4| // RWD classes for tile containers]\n[set:evo_tile__modifiers=evo_tile__md evo_tile__grey_bg evo_tile__hoverglow| // Modifier classes for each tile]\n[set:evo_tile_image__modifiers=|                    // Modifier classes for each tile image]\n[set:evo_tile_image__classes=evo_image_block|       // Modifier classes for each evo_image_block]\n[set:evo_tile_image__size=fit-400x320|              // Image size for old browsers]\n[set:evo_tile_image__sizes=(max-width: 430px) 400px, (max-width: 670px) 640px, (max-width: 767px) 720px, (max-width: 991px) 345px, (max-width: 1199px) 334px, (max-width: 1799px) 262px, 400px]\n[set:evo_tile_text__modifiers=evo_tile_text__gradient]\n','content_list_master',NULL),
(21,'Content Tiles Style 1.1 (Contained images)','content_tiles_contain',NULL,'en-US','[set:before_list=<div class=\"evo_tiles row\">]\n[set:after_list=</div>]\n[set:subcat_template=content_tiles_subcat]\n[set:item_template=content_tiles_item]\n[set:crossposted_item_template=| // Use same as item_template]\n[set:active_item_template=| // Use same as item_template]\n[set:rwd_cols=col-xs-12 col-sm-6 col-md-6 col-lg-4]\n[set:evo_tile__modifiers=evo_tile__md evo_tile__grey_bg evo_tile__hoverglow]\n[set:evo_tile_image__modifiers=]\n[set:evo_tile_image__classes=evo_image_block contain]\n[set:evo_tile_image__size=fit-400x320]\n[set:evo_tile_image__sizes=(max-width: 430px) 400px, (max-width: 670px) 640px, (max-width: 767px) 720px, (max-width: 991px) 345px, (max-width: 1199px) 334px, (max-width: 1799px) 262px, 400px]\n[set:evo_tile_text__modifiers=evo_tile_text__gradient]\n','content_list_master',NULL),
(22,'Content Tiles Style 1 (Fully clickable): Subcat','content_tiles_subcat',NULL,'en-US','<div class=\"[echo:rwd_cols]\">\n	<div class=\"evo_tile [echo:evo_tile__modifiers]\">\n		<div class=\"hide_overflow\">\n			<div class=\"evo_tile_image [echo:evo_tile_image__modifiers]\">\n				[Cat:image|\n					size=$evo_tile_image__size$|\n					sizes=$evo_tile_image__sizes$|\n					link_to=#category_url|\n					before=<figure class=\"evo_image_block\">|\n					before_classes=$evo_tile_image__classes$|\n					after=</figure>]\n			</div>\n			<div class=\"evo_tile_body\">\n				<h3>[Cat:name]</h3>\n				<div class=\"evo_tile_text [echo:evo_tile_text__modifiers]\">[Cat:description]</div>\n			</div>\n		</div>\n		[Cat:permalink|text=]\n	</div>\n</div>','content_list_category',NULL),
(23,'Content Tiles Style 1 (Fully clickable): Item','content_tiles_item',NULL,'en-US','<div class=\"[echo:rwd_cols]\">\n	<div class=\"evo_tile [echo:evo_tile__modifiers]\">\n		<div class=\"hide_overflow\">\n			<div class=\"evo_tile_image [echo:evo_tile_image__modifiers]\">\n				[Item:images|\n					restrict_to_image_position=#cover_and_teaser_all| // Priority to cover image, fall back to any teaser image\n					limit=1|	                                      // Max 1 images\n					image_size=$evo_tile_image__size$|                // Size for old browsers\n					image_sizes=$evo_tile_image__sizes$|	          // RWD Sizes for modern browsers\n					image_link_to=|	                                  // Do NOT link to anything\n					placeholder=#file_text_icon|	                  // If no image available, display text file icon\n					before_image_classes=$evo_tile_image__classes$|	  // CSS classes to inject into evo_image_block\n				]\n				<div class=\"evo_tile_overlay\">[Item:cat_name]</div>\n			</div>\n			<div class=\"evo_tile_body\">\n				<h3>[Item:title]</h3>\n				<div class=\"evo_tile_text [echo:evo_tile_text__modifiers]\">\n					[Item:excerpt|\n						excerpt_more_text=| // No \"more\" link\n					]\n				</div>\n			</div>\n		</div>\n		[Item:permalink|text=| // This is a link without text which will cover the whole tile and make the whole tile clickable]\n	</div>\n</div>','content_list_item',NULL),
(24,'Content Tiles Style 2 (Button)','content_tiles_btn',NULL,'en-US','[set:before_list=<div class=\"evo_tiles row\">]\n[set:after_list=</div>]\n[set:subcat_template=content_tiles_btn_subcat]\n[set:item_template=content_tiles_btn_item]\n[set:crossposted_item_template=| // Use same as item_template]\n[set:active_item_template=| // Use same as item_template]\n[set:rwd_cols=col-xs-12 col-sm-6 col-md-6 col-lg-4]\n[set:evo_tile__modifiers=evo_tile__md evo_tile__grey_bg evo_tile__shadow]\n[set:evo_tile_image__modifiers=evo_tile_image__margin]\n[set:evo_tile_image__classes=evo_image_block]\n[set:evo_tile_image__size=fit-400x320]\n[set:evo_tile_image__sizes=(max-width: 430px) 400px, (max-width: 670px) 640px, (max-width: 767px) 720px, (max-width: 991px) 345px, (max-width: 1199px) 334px, (max-width: 1799px) 262px, 400px]\n[set:evo_tile_text__modifiers=evo_tile_text__gradient]','content_list_master',NULL),
(25,'Content Tiles Style 2 (Button): Subcat','content_tiles_btn_subcat',NULL,'en-US','<div class=\"[echo:rwd_cols]\">\n	<div class=\"evo_tile [echo:evo_tile__modifiers]\">\n		<div class=\"hide_overflow\">\n			<div class=\"evo_tile_image [echo:evo_tile_image__modifiers]\">\n				[Cat:image|\n					size=$evo_tile_image__size$|\n					sizes=$evo_tile_image__sizes$|\n					link_to=#category_url|\n					before=<figure class=\"evo_image_block\">|\n					after=</figure>|\n					before_classes=$evo_tile_image__classes$]\n			</div>\n			<div class=\"evo_tile_body\">\n				<h3>[Cat:permalink|class=evo_tile_title]</h3>\n				<div class=\"evo_tile_text [echo:evo_tile_text__modifiers]\">[Cat:description]</div>\n				[Cat:permalink|text=#view+arrow|class=evo_tile_more btn btn-sm btn-default]\n			</div>\n		</div>\n	</div>\n</div>','content_list_category',NULL),
(26,'Content Tiles Style 2 (Button): Item','content_tiles_btn_item',NULL,'en-US','<div class=\"[echo:rwd_cols]\">\n	<div class=\"evo_tile [echo:evo_tile__modifiers]\">\n		<div class=\"hide_overflow\">\n			<div class=\"evo_tile_image [echo:evo_tile_image__modifiers]\">\n				[Item:images|\n					restrict_to_image_position=#cover_and_teaser_all|\n					limit=1|\n					image_size=$evo_tile_image__size$|\n					image_sizes=$evo_tile_image__sizes$|\n					image_link_to=single|\n					placeholder=#file_text_icon|\n					before_image_classes=$evo_tile_image__classes$]\n				<div class=\"evo_tile_overlay\">[Item:cat_name]</div>\n			</div>\n			<div class=\"evo_tile_body\">\n				<h3>[Item:permalink|text=#title|class=evo_tile_title]</h3>\n				<div class=\"evo_tile_text [echo:evo_tile_text__modifiers]\">[Item:excerpt|excerpt_more_text=]</div>\n				[Item:permalink|text=#view+arrow|class=evo_tile_more btn btn-sm btn-default]\n			</div>\n		</div>\n	</div>\n</div>','content_list_item',NULL),
(27,'Content Tiles Style 3 (BG image:Experimental)','content_tiles_bgimg',NULL,'en-US','[set:before_list=<div class=\"evo_tiles row\">]\n[set:after_list=</div>]\n[set:subcat_template=content_tiles_bgimg_subcat]\n[set:item_template=content_tiles_bgimg_item]\n[set:crossposted_item_template=| // Use same as item_template]\n[set:active_item_template=| // Use same as item_template]\n[set:rwd_cols=col-xs-12 col-sm-6 col-md-6 col-lg-4]\n[set:evo_tile__modifiers=evo_tile__md evo_tile__grey_bg evo_tile__square evo_tile__shadow]\n[set:evo_tile_image__modifiers=]\n[set:evo_tile_image__classes=evo_image_block]\n[set:evo_tile_image__size=fit-400x320]\n[set:evo_tile_image__sizes=(max-width: 430px) 400px, (max-width: 670px) 640px, (max-width: 767px) 720px, (max-width: 991px) 345px, (max-width: 1199px) 334px, (max-width: 1799px) 262px, 400px]\n[set:evo_tile_text__modifiers=evo_tile_text__gradient]','content_list_master',NULL),
(28,'Content Tiles Style 3 (BG image:Experimental): Subcat','content_tiles_bgimg_subcat',NULL,'en-US','<div class=\"[echo:rwd_cols]\">\n	<div class=\"evo_tile [echo:evo_tile__modifiers]\">\n		<div class=\"hide_overflow\">\n			<div class=\"evo_tile_cover\" style=\"[Cat:background_image_css|size=fit-400x320|size_2x=fit-720x500]\"></div>\n			<div class=\"evo_tile_body\">\n				<h3>[Cat:permalink|class=evo_tile_title]</h3>\n				<div class=\"evo_tile_text [echo:evo_tile_text__modifiers]\">[Cat:description]</div>\n				[Cat:permalink|text=#view+arrow|class=evo_tile_more btn btn-sm btn-default]\n			</div>\n		</div>\n	</div>\n</div>','content_list_category',NULL),
(29,'Content Tiles Style 3 (BG image:Experimental): Item','content_tiles_bgimg_item',NULL,'en-US','<div class=\"[echo:rwd_cols]\">\n	<div class=\"evo_tile [echo:evo_tile__modifiers]\">\n		<div class=\"hide_overflow\">\n			<div class=\"evo_tile_cover\" style=\"[Item:background_image_css|size=fit-400x320|size_2x=fit-720x500]\">\n				<div class=\"evo_tile_overlay\">[Item:cat_name]</div>\n			</div>\n			<div class=\"evo_tile_body\">\n				<h3>[Item:permalink|text=#title|class=evo_tile_title]</h3>\n				<div class=\"evo_tile_text [echo:evo_tile_text__modifiers]\">[Item:excerpt|excerpt_more_text=]</div>\n				[Item:permalink|text=#view+arrow|class=evo_tile_more btn btn-sm btn-default]\n			</div>\n		</div>\n	</div>\n</div>','content_list_item',NULL),
(30,'Include Content Block: with clearfix','cblock_clearfix',NULL,'en-US','<div class=\"evo_content_block clearfix [echo:content_block_class]\">\n	[Item:images|restrict_to_image_position=#teaser_all|before=<div class=\"evo_cblock_images evo_cblock_teaser\">|after=</div>]\n	<div class=\"evo_cblock_text\">\n		[Item:content_teaser] \n	</div>\n	[Item:images|restrict_to_image_position=aftermore|before=<div class=\"evo_cblock_images evo_cblock_aftermore\">|after=</div>]\n</div>','content_block',NULL),
(31,'Include Content Block: without clearfix','cblock_noclearfix',NULL,'en-US','<div class=\"evo_content_block [echo:content_block_class]\">\n	[Item:images|\n		restrict_to_image_position=#teaser_all|\n		before=<div class=\"evo_cblock_images evo_cblock_teaser\">|\n		after=</div>]\n	<div class=\"evo_cblock_text\">\n		[Item:content_teaser] \n	</div>\n	[Item:images|\n		restrict_to_image_position=aftermore|\n		before=<div class=\"evo_cblock_images evo_cblock_aftermore\">|\n		after=</div>]\n</div>','content_block',NULL),
(32,'Item Excerpt','item_content_excerpt',NULL,'en-US','<section class=\"evo_post__excerpt\">\n[Item:excerpt|\n	before=<div class=\"evo_post__excerpt_text\">|\n	after=</div>|excerpt_before_more=<span class=\"evo_post__excerpt_more_link\">|\n	excerpt_more_text=#more+arrow|\n	excerpt_after_more=</span>]\n</section>','item_content',NULL),
(33,'Item Teaser content','item_content_teaser',NULL,'en-US','<section class=\"evo_post__full\">\n[Item:images|\n	restrict_to_image_position=#teaser_all|\n	image_size=fit-1280x720|\n	image_class=img-responsive|\n	before=<div class=\"evo_post_images\">|\n	after=</div>|\n	before_image=<figure class=\"evo_image_block\">|\n	after_image=</figure>]\n<div class=\"evo_post__full_text clearfix\">\n	[Item:content_teaser]\n	[Item:more_link|link_text=Read more &raquo;]\n</div>\n</section>','item_content',NULL),
(34,'Item Full content','item_content_full',NULL,'en-US','<section class=\"evo_post__full\">\n[Item:images|\n	restrict_to_image_position=#teaser_all|\n	image_size=fit-1280x720|\n	image_class=img-responsive|\n	before=<div class=\"evo_post_images\">|\n	after=</div>|\n	before_image=<figure class=\"evo_image_block\">|\n	after_image=</figure>]\n<div class=\"evo_post__full_text clearfix\">\n	[Item:content_teaser]\n	[Item:more_link|anchor_text=]\n	[Item:images|\n		restrict_to_image_position=aftermore|\n		image_size=fit-1280x720|\n		image_class=img-responsive|\n		before=<div class=\"evo_post_images\">|\n		after=</div>|\n		before_image=<figure class=\"evo_image_block\">|\n		after_image=</figure>]\n	[Item:content_extension]\n	[Item:page_links]\n	[Item:footer]\n</div>\n</section>','item_content',NULL),
(35,'Recipe Full content','recipe_content_full',NULL,'en-US','<section class=\"evo_post__full\">\n<div class=\"row\">\n	<div class=\"col-sm-5\">\n		[Item:images|\n			restrict_to_image_position=#cover_and_teaser_all|\n			image_size=crop-320x320|image_class=img-responsive|\n			before=<div class=\"evo_post_images\">|\n			after=</div>|\n			before_image=<figure class=\"evo_image_block\">|\n			after_image=</figure>]\n	</div>\n	<div class=\"col-sm-7\">\n		[Item:content_teaser]\n		[Item:tags|before=<nav class=\"small post_tags\">|after=</nav>|separator= ]\n		[Item:custom_fields|\n			fields=course,cuisine,servings|\n			custom_fields_table_start=|\n			custom_fields_row_start=<div class=\"row\"$row_attrs$>|\n			custom_fields_row_header_field=<div class=\"col-xs-3 $header_cell_class$\"><b>$field_title$$field_description_icon$</b></div>|\n			custom_fields_description_icon_class=grey|\n			custom_fields_value_default=<div class=\"col-xs-9 $data_cell_class$\"$data_cell_attrs$>$field_value$</div>|\n			custom_fields_row_end=</div>|\n			custom_fields_table_end=]\n		[Item:custom_fields|\n			fields=prep_time,cook_time,passive_time,total_time|\n			custom_fields_table_start=<br /><div class=\"row\">|\n			custom_fields_row_start=<span$row_attrs$>|\n			custom_fields_row_header_field=<div class=\"col-sm-3 col-xs-6 $header_cell_class$\"><b>$field_title$$field_description_icon$</b>|\n			custom_fields_description_icon_class=grey|\n			custom_fields_value_default=<br /><span class=\"$data_cell_class$\"$data_cell_attrs$>$field_value$</span></div>|\n			custom_fields_row_end=</span>|\n			custom_fields_table_end=</div>|\n			hide_empty_lines=1]\n	</div>\n</div>\n<div class=\"row\">\n	<div class=\"col-lg-3 col-sm-4\">\n		<h4>[Item:custom|field=ingredients|what=label]</h4>\n		<p>[Item:custom|field=ingredients]</p>\n	</div>\n	<div class=\"col-lg-9 col-sm-8\">\n		<h4>Directions</h4>\n		[Item:content_extension]\n		[Item:page_links]\n		[Item:footer]\n		[Item:feedback_link]\n	</div>\n</div>\n</section>','item_content',NULL),
(36,'Content Tabs','content_tabs',NULL,'en-US','[set:before_list=<div class=\"row\">]\n[set:after_list=</div>]\n[set:item_template=content_tabs_item]\n[set:crossposted_item_template=| // Use same as item_template]\n[set:active_item_template=| // Use same as item_template]\n[set:rwd_header_col=col-sm-5 col-xs-12]\n[set:rwd_text_col=col-sm-5 col-xs-12]\n[set:rwd_image_col=col-sm-7 pull-right-sm col-xs-12]\n[set:evo_tabs_image__size=fit-1920x1080]','content_list_master',NULL),
(37,'Content Tabs: Item','content_tabs_item',NULL,'en-US','\n	<div class=\"[echo:rwd_header_col]\">\n		<h1>[Item:title]</h1>\n	</div>\n	<div class=\"[echo:rwd_image_col]\">\n		[Item:images|\n			restrict_to_image_position=#cover_and_teaser_all|\n			limit=1|\n			image_size=$evo_tabs_image__size$]\n	</div>\n	<div class=\"[echo:rwd_text_col]\">\n		[Item:content_teaser]\n	</div>\n','content_list_item',NULL),
(38,'Registration: Standard','registration_master_standard',NULL,'en-US','\n[set:reg1_template=registration_standard]\n[set:reg1_required=login,password,email]\n','registration_master',NULL),
(39,'Registration: Standard','registration_standard',NULL,'en-US','[Form:login]\n[Form:password]\n[Form:email]\n<div class=\"evo_register_buttons\">\n	[Form:submit|\n		name=register|\n		class=btn btn-primary btn-lg|\n		value=Register my account now!]\n	<br>\n	[Link:disp|\n		disp=login|\n		class=btn btn-default|\n		text=Already have an account... ?]\n</div>','registration',NULL),
(40,'Registration: Ask for Name','registration_master_ask_name',NULL,'en-US','\n[set:reg1_template=registration_ask_name]\n[set:reg1_required=firstname,password,email]\n','registration_master',NULL),
(41,'Registration: Ask for Name','registration_ask_name',NULL,'en-US','[Form:firstname]\n[Form:lastname]\n[Form:email]\n[Form:password]\n<div class=\"evo_register_buttons\">\n	[Form:submit|\n		name=register|\n		class=btn btn-primary btn-lg|\n		value=Register my account now!]\n	<br>\n	[Link:disp|\n		disp=login|\n		class=btn btn-default|\n		text=Already have an account... ?]\n</div>','registration',NULL),
(42,'Registration: email & social buttons','registration_master_email_social',NULL,'en-US','\n[set:reg1_template=registration_email_social]\n[set:reg1_required=email]\n\n[set:reg2_template=registration_step2| // Page 2 is not implemented yet]\n[set:reg2_required=firstname]\n','registration_master',NULL),
(43,'Registration: email & social buttons','registration_email_social',NULL,'en-US','[Form:email]\n<div class=\"evo_register_buttons\">\n	[Form:submit|\n		name=register|\n		class=btn btn-primary btn-lg|\n		value=Register my account now!]\n	<br>\n	[Link:disp|\n		disp=login|\n		class=btn btn-default|\n		text=Already have an account... ?]\n</div>\n[Plugin:evo_sociallogin| // Call the SkinTag of the plugin\n	before=<div class=\"evo_social_login_buttons margin-top-md\">|\n	after=</div>]\n','registration',NULL),
(44,'Registration: Step 2','registration_step2',NULL,'en-US','[Form:firstname]\n	[Form:lastname]\n	[Form:custom_field|field=industry| // this is an example of a User custom field]\n	[Form:submit|\n		name=register|\n		class=btn btn-primary btn-lg|\n		value=Continue]\n','registration',NULL),
(45,'Search Form: Full','search_form_full',NULL,'en-US','<div class=\"row row-gutter-sm\">\n	<div class=\"col-sm-12 margin-top-sm margin-bottom-xs\">\n		<div class=\"input-group\">\n			[Form:search_input|class=w-100]\n			<span class=\"input-group-btn\">[Form:submit|value=Search]</span>\n		</div>\n	</div>\n</div>\n<div class=\"row row-gutter-sm\">\n	<div class=\"col-sm-12 col-md-4 col-lg-5 margin-y-xs\">\n		[Form:search_author]\n	</div>\n	<div class=\"col-sm-12 col-md-4 col-lg-4 margin-y-xs\">\n		[Form:search_content_age]\n	</div>\n	<div class=\"col-sm-12 col-md-4 col-lg-3 margin-y-xs\">\n		[Form:search_content_type]\n	</div>\n</div>','search_form',NULL),
(46,'Search Form: Simple','search_form_simple',NULL,'en-US','<div class=\"input-group\">\n	[Form:search_input|class=w-100]\n	<span class=\"input-group-btn\">[Form:submit|value=Search]</span>\n</div>','search_form',NULL),
(47,'Search Result: Item','search_result_item',NULL,'en-US','<div class=\"search_result\">\n	<div class=\"search_result_score dimmed\">[echo:percentage]%</div>\n	<div class=\"search_content_wrap\">\n		<div class=\"search_title\">[Item:permalink] <span class=\"label label-primary\">[Item:type]</span></div>\n		<div class=\"result_content\">[Item:excerpt|excerpt_more_text=]</div>\n		<div class=\"search_info dimmed\">[Item:categories|before=In ]</div>\n		<div class=\"search_info dimmed\">Published by [Item:author|\n			link_text=avatar_login|\n			thumb_size=crop-top-15x15] on [Item:creation_time|format=#short_date]\n		</div>\n	</div>\n</div>','search_result',NULL),
(48,'Search Result: Comment','search_result_comment',NULL,'en-US','<div class=\"search_result\">\n	<div class=\"search_result_score dimmed\">[echo:percentage]%</div>\n	<div class=\"search_content_wrap\">\n		<div class=\"search_title\">[Comment:permalink] <span class=\"label label-primary\">Comment</span></div>\n		<div class=\"result_content\">[Comment:excerpt]</div>\n		<div class=\"search_info dimmed\">Published by [Comment:author|\n			link_text=avatar_name|\n			thumb_size=crop-top-15x15|\n			thumb_class=avatar_before_login] on [Comment:creation_time|format=#short_date]\n		</div>\n	</div>\n</div>','search_result',NULL),
(49,'Search Result: Internal comment','search_result_meta',NULL,'en-US','<div class=\"search_result\">\n	<div class=\"search_result_score dimmed\">[echo:percentage]%</div>\n	<div class=\"search_content_wrap\">\n		<div class=\"search_title\">[Comment:permalink] <span class=\"label label-info\">Internal comment</span></div>\n		<div class=\"result_content\">[Comment:excerpt]</div>\n		<div class=\"search_info dimmed\">Published by [Comment:author|\n			link_text=avatar_name|\n			thumb_size=crop-top-15x15|\n			thumb_class=avatar_before_login] on [Comment:creation_time|format=#short_date]\n		</div>\n	</div>\n</div>','search_result',NULL),
(50,'Search Result: File','search_result_file',NULL,'en-US','<div class=\"search_result\">\n	<div class=\"search_result_score dimmed\">[echo:percentage]%</div>\n	<div class=\"search_content_wrap\">\n		<div class=\"search_title\">[File:file_link|link_text=title] <span class=\"label label-primary\">File: [File:file_link|link_text=icon] [File:type]</span></div>\n		<div class=\"result_content\">\n			[File:url]\n			[File:description|before=<div>|after=</div>]\n		</div>\n		<div class=\"search_info dimmed\">File size: [File:file_size]</div>\n	</div>\n</div>','search_result',NULL),
(51,'Search Result: Category','search_result_category',NULL,'en-US','<div class=\"search_result\">\n	<div class=\"search_result_score dimmed\">[echo:percentage]%</div>\n	<div class=\"search_content_wrap\">\n		<div class=\"search_title\">[Cat:permalink] <span class=\"label label-primary\">Category</span></div>\n		<div class=\"result_content\">[Cat:description]</div>\n	</div>\n</div>','search_result',NULL),
(52,'Search Result: Tag','search_result_tag',NULL,'en-US','<div class=\"search_result\">\n	<div class=\"search_result_score dimmed\">[echo:percentage]%</div>\n	<div class=\"search_content_wrap\">\n		<div class=\"search_title\">[Tag:permalink] <span class=\"label label-primary\">Tag</span></div>\n		<div class=\"result_content\">[echo:tag_post_count] posts are tagged with \"[Tag:name]\"</div>\n	</div>\n</div>','search_result',NULL),
(53,'Content List with Thumbnail','content_list_with_thumbnail',NULL,'en-US','[set:before_list=<ul class=\"evo_thumblist\">]\n[set:after_list=</ul>]\n[set:item_template=content_list_with_thumbnail_item| // Sub-template for displaying items]\n[set:crossposted_item_template=|                     // Sub-template for displaying crossposted items]\n[set:active_item_template=|                          // Sub-template for displaying active item]\n[set:evo_thumblist_image__modifiers=|                // Modifier classes for each thumbnail image]\n[set:evo_thumblist_image__size=crop-80x80|           // Image size for displaying image]','content_list_master',NULL),
(54,'Content List with Thumbnail: Item','content_list_with_thumbnail_item',NULL,'en-US','<li>\n		<div class=\"evo_thumblist_image [echo:evo_thumblist_image__modifiers]\">\n			[Item:images|\n				restrict_to_image_position=#cover_and_teaser_all| // Priority to cover image, fall back to any teaser image\n				limit=1|	                                      // Max 1 images\n				image_size=$evo_thumblist_image__size$|                \n				image_link_to=single|	                                  // Link to item details\n				placeholder=#file_thumbnail_text_icon|	                  // If no image available, display text file icon\n			]\n		</div>\n		<div class=\"evo_thumblist_title\">\n			[Item:permalink|text=#title|class=default]\n		</div>\n		<div class=\"evo_thumblist_body\">\n			<p>[Item:excerpt|\n							excerpt_no_more_link=| // No \"more\" link\n							max_words=20| // how many words we will display\n			]\n			</p> \n			[Item:permalink|text=...|class=btn btn-default  evo_thumblist_button evo_thumblist_button__transparent|title=]\n		</div>\n</li>','content_list_item',NULL);
/*!40000 ALTER TABLE `evo_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_temporary_ID`
--

DROP TABLE IF EXISTS `evo_temporary_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_temporary_ID` (
  `tmp_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tmp_type` varchar(32) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `tmp_coll_ID` int(10) unsigned DEFAULT NULL,
  `tmp_item_ID` int(11) unsigned DEFAULT NULL COMMENT 'Link to parent Item of Comment in order to enable permission checks',
  PRIMARY KEY (`tmp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_temporary_ID`
--

LOCK TABLES `evo_temporary_ID` WRITE;
/*!40000 ALTER TABLE `evo_temporary_ID` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_temporary_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_track__goal`
--

DROP TABLE IF EXISTS `evo_track__goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_track__goal` (
  `goal_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goal_gcat_ID` int(10) unsigned NOT NULL,
  `goal_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goal_key` varchar(32) DEFAULT NULL,
  `goal_redir_url` varchar(255) DEFAULT NULL,
  `goal_temp_redir_url` varchar(255) DEFAULT NULL,
  `goal_temp_start_ts` timestamp NULL DEFAULT NULL,
  `goal_temp_end_ts` timestamp NULL DEFAULT NULL,
  `goal_default_value` double DEFAULT NULL,
  `goal_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`goal_ID`),
  UNIQUE KEY `goal_key` (`goal_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_track__goal`
--

LOCK TABLES `evo_track__goal` WRITE;
/*!40000 ALTER TABLE `evo_track__goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_track__goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_track__goalcat`
--

DROP TABLE IF EXISTS `evo_track__goalcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_track__goalcat` (
  `gcat_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gcat_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gcat_color` char(7) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`gcat_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_track__goalcat`
--

LOCK TABLES `evo_track__goalcat` WRITE;
/*!40000 ALTER TABLE `evo_track__goalcat` DISABLE KEYS */;
INSERT INTO `evo_track__goalcat` VALUES
(1,'Default','#999999');
/*!40000 ALTER TABLE `evo_track__goalcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_track__goalhit`
--

DROP TABLE IF EXISTS `evo_track__goalhit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_track__goalhit` (
  `ghit_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ghit_goal_ID` int(10) unsigned NOT NULL,
  `ghit_hit_ID` int(10) unsigned NOT NULL,
  `ghit_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ghit_ID`),
  KEY `ghit_goal_ID` (`ghit_goal_ID`),
  KEY `ghit_hit_ID` (`ghit_hit_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_track__goalhit`
--

LOCK TABLES `evo_track__goalhit` WRITE;
/*!40000 ALTER TABLE `evo_track__goalhit` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_track__goalhit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_track__goalhit_aggregate`
--

DROP TABLE IF EXISTS `evo_track__goalhit_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_track__goalhit_aggregate` (
  `ghag_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ghag_date` date NOT NULL DEFAULT '2000-01-01',
  `ghag_goal_ID` int(10) unsigned NOT NULL,
  `ghag_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ghag_ID`),
  UNIQUE KEY `ghag_date_goal_ID` (`ghag_date`,`ghag_goal_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_track__goalhit_aggregate`
--

LOCK TABLES `evo_track__goalhit_aggregate` WRITE;
/*!40000 ALTER TABLE `evo_track__goalhit_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_track__goalhit_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_track__keyphrase`
--

DROP TABLE IF EXISTS `evo_track__keyphrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_track__keyphrase` (
  `keyp_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyp_phrase` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `keyp_count_refered_searches` int(10) unsigned DEFAULT 0,
  `keyp_count_internal_searches` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`keyp_ID`),
  UNIQUE KEY `keyp_phrase` (`keyp_phrase`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_track__keyphrase`
--

LOCK TABLES `evo_track__keyphrase` WRITE;
/*!40000 ALTER TABLE `evo_track__keyphrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_track__keyphrase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users`
--

DROP TABLE IF EXISTS `evo_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users` (
  `user_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(20) NOT NULL,
  `user_pass` varchar(64) NOT NULL,
  `user_salt` varchar(32) NOT NULL DEFAULT '',
  `user_pass_driver` varchar(16) NOT NULL DEFAULT 'evo$md5',
  `user_grp_ID` int(4) NOT NULL DEFAULT 1,
  `user_email` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `user_status` enum('activated','manualactivated','autoactivated','closed','deactivated','emailchanged','failedactivation','pendingdelete','new') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'new',
  `user_avatar_file_ID` int(10) unsigned DEFAULT NULL,
  `user_firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_url` varchar(255) DEFAULT NULL,
  `user_level` int(10) unsigned NOT NULL DEFAULT 0,
  `user_locale` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'en-EU',
  `user_unsubscribe_key` char(32) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '' COMMENT 'A specific key, it is used when a user wants to unsubscribe from a post comments without signing in',
  `user_gender` char(1) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `user_age_min` int(10) unsigned DEFAULT NULL,
  `user_age_max` int(10) unsigned DEFAULT NULL,
  `user_birthday_year` smallint(5) unsigned DEFAULT NULL,
  `user_birthday_month` tinyint(3) unsigned DEFAULT NULL,
  `user_birthday_day` tinyint(3) unsigned DEFAULT NULL,
  `user_reg_ctry_ID` int(10) unsigned DEFAULT NULL,
  `user_ctry_ID` int(10) unsigned DEFAULT NULL,
  `user_rgn_ID` int(10) unsigned DEFAULT NULL,
  `user_subrg_ID` int(10) unsigned DEFAULT NULL,
  `user_city_ID` int(10) unsigned DEFAULT NULL,
  `user_source` varchar(30) DEFAULT NULL,
  `user_created_datetime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `user_lastseen_ts` timestamp NULL DEFAULT NULL,
  `user_email_dom_ID` int(10) unsigned DEFAULT NULL COMMENT 'Used for email statistics',
  `user_profileupdate_date` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `user_login` (`user_login`),
  KEY `user_grp_ID` (`user_grp_ID`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users`
--

LOCK TABLES `evo_users` WRITE;
/*!40000 ALTER TABLE `evo_users` DISABLE KEYS */;
INSERT INTO `evo_users` VALUES
(1,'admin','2df2a380bd40f50b8fb298a1f4fa18f2','bYJbPCim','evo$salted',1,'postmaster@localhost','autoactivated',NULL,'Johnny','Admin',NULL,NULL,10,'en-US','cHwN1HgohmjkWw46W50R5CK0XbuHdrN6','M',NULL,NULL,NULL,NULL,NULL,NULL,233,NULL,NULL,NULL,NULL,'2026-09-23 13:00:34',NULL,1,'2026-09-23 15:02:34');
/*!40000 ALTER TABLE `evo_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__fielddefs`
--

DROP TABLE IF EXISTS `evo_users__fielddefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__fielddefs` (
  `ufdf_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ufdf_ufgp_ID` int(10) unsigned NOT NULL,
  `ufdf_type` char(8) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ufdf_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ufdf_options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ufdf_required` enum('hidden','optional','recommended','require') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'optional',
  `ufdf_visibility` enum('unrestricted','private','admin') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'unrestricted',
  `ufdf_duplicated` enum('forbidden','allowed','list') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'allowed',
  `ufdf_order` int(11) NOT NULL,
  `ufdf_suggest` tinyint(1) NOT NULL DEFAULT 0,
  `ufdf_bubbletip` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ufdf_icon_name` varchar(100) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ufdf_code` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'Code MUST be lowercase ASCII only',
  `ufdf_grp_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ufdf_ID`),
  UNIQUE KEY `ufdf_code` (`ufdf_code`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__fielddefs`
--

LOCK TABLES `evo_users__fielddefs` WRITE;
/*!40000 ALTER TABLE `evo_users__fielddefs` DISABLE KEYS */;
INSERT INTO `evo_users__fielddefs` VALUES
(1,1,'text','Micro bio',NULL,'recommended','unrestricted','forbidden',1,0,NULL,'fa fa-info-circle','microbio',NULL),
(2,1,'word','I like',NULL,'recommended','unrestricted','list',2,1,NULL,'fa fa-thumbs-o-up','ilike',NULL),
(3,1,'word','I don\'t like',NULL,'recommended','unrestricted','list',3,1,NULL,'fa fa-thumbs-o-down','idontlike',NULL),
(4,1,'list','Industry','Energy, Utilities & Resources\nFinancial Services\nHealth Services\nHospitality & Tourism\nIndustrial Manufacturing\nPharma & Life Sciences\nPublic Sector\nReal Estate\nRetail & Consumer Goods\nSports Business Advisory\nTechnology, Media & Telecom','recommended','unrestricted','allowed',4,1,NULL,'fa fa-industry','industry',NULL),
(5,2,'email','MSN/Live IM',NULL,'optional','unrestricted','allowed',1,0,NULL,NULL,'msnliveim',NULL),
(6,2,'word','Yahoo IM',NULL,'optional','unrestricted','allowed',2,0,NULL,'fa fa-yahoo','yahooim',NULL),
(7,2,'word','AOL AIM',NULL,'optional','unrestricted','allowed',3,0,NULL,NULL,'aolaim',NULL),
(8,2,'number','ICQ ID',NULL,'optional','unrestricted','allowed',4,0,NULL,NULL,'icqid',NULL),
(9,2,'phone','Skype',NULL,'optional','private','allowed',5,0,NULL,'fa fa-skype','skype',NULL),
(10,2,'phone','WhatsApp',NULL,'optional','private','allowed',6,0,NULL,'fa fa-whatsapp','whatsapp',NULL),
(11,3,'phone','Main phone',NULL,'optional','private','forbidden',1,0,NULL,'fa fa-phone','mainphone',NULL),
(12,3,'phone','Cell phone',NULL,'optional','private','allowed',2,0,NULL,'fa fa-mobile-phone','cellphone',NULL),
(13,3,'phone','Office phone',NULL,'optional','private','allowed',3,0,NULL,'fa fa-phone','officephone',NULL),
(14,3,'phone','Home phone',NULL,'optional','private','allowed',4,0,NULL,'fa fa-phone','homephone',NULL),
(15,3,'phone','Office FAX',NULL,'optional','private','allowed',5,0,NULL,'fa fa-fax','officefax',NULL),
(16,3,'phone','Home FAX',NULL,'optional','private','allowed',6,0,NULL,'fa fa-fax','homefax',NULL),
(17,4,'url','Twitter',NULL,'recommended','unrestricted','forbidden',1,0,NULL,'fa fa-twitter','twitter',NULL),
(18,4,'url','Facebook',NULL,'recommended','unrestricted','forbidden',2,0,NULL,'fa fa-facebook','facebook',NULL),
(19,4,'url','Linkedin',NULL,'optional','unrestricted','forbidden',4,0,NULL,'fa fa-linkedin fa-x-linkedin--nudge','linkedin',NULL),
(20,4,'url','GitHub',NULL,'optional','unrestricted','forbidden',5,0,NULL,'fa fa-github-alt','github',NULL),
(21,4,'url','Website',NULL,'optional','unrestricted','allowed',6,0,NULL,NULL,'website',NULL),
(22,4,'url','Blog',NULL,'optional','unrestricted','allowed',7,0,NULL,NULL,'blog',NULL),
(23,4,'url','Myspace',NULL,'optional','unrestricted','forbidden',8,0,NULL,NULL,'myspace',NULL),
(24,4,'url','Flickr',NULL,'optional','unrestricted','forbidden',9,0,NULL,'fa fa-flickr','flickr',NULL),
(25,4,'url','YouTube',NULL,'optional','unrestricted','forbidden',10,0,NULL,'fa fa-youtube','youtube',NULL),
(26,4,'url','Digg',NULL,'optional','unrestricted','forbidden',11,0,NULL,'fa fa-digg','digg',NULL),
(27,4,'url','StumbleUpon',NULL,'optional','unrestricted','forbidden',12,0,NULL,'fa fa-stumbleupon','stumbleupon',NULL),
(28,4,'url','Pinterest',NULL,'optional','unrestricted','forbidden',13,0,NULL,'fa fa-pinterest-p','pinterest',NULL),
(29,4,'url','SoundCloud',NULL,'optional','unrestricted','forbidden',14,0,NULL,'fa fa-soundcloud','soundcloud',NULL),
(30,4,'url','Yelp',NULL,'optional','unrestricted','forbidden',15,0,NULL,'fa fa-yelp','yelp',NULL),
(31,4,'url','PayPal',NULL,'optional','unrestricted','forbidden',16,0,NULL,'fa fa-paypal','paypal',NULL),
(32,4,'url','500px',NULL,'optional','unrestricted','forbidden',17,0,NULL,'fa fa-500px','500px',NULL),
(33,4,'url','Amazon',NULL,'optional','unrestricted','forbidden',18,0,NULL,'fa fa-amazon','amazon',NULL),
(34,4,'url','Instagram',NULL,'optional','unrestricted','forbidden',19,0,NULL,'fa fa-instagram','instagram',NULL),
(35,4,'url','Vimeo',NULL,'optional','unrestricted','forbidden',20,0,NULL,'fa fa-vimeo','vimeo',NULL),
(36,5,'text','Main address',NULL,'optional','private','forbidden',1,0,NULL,'fa fa-building','mainaddress',NULL),
(37,5,'text','Home address',NULL,'optional','private','forbidden',2,0,NULL,'fa fa-home','homeaddress',NULL),
(38,6,'text','Admin notes',NULL,'recommended','admin','forbidden',1,0,NULL,'fa fa-edit','adminnotes',NULL);
/*!40000 ALTER TABLE `evo_users__fielddefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__fieldgroups`
--

DROP TABLE IF EXISTS `evo_users__fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__fieldgroups` (
  `ufgp_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ufgp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ufgp_order` int(11) NOT NULL,
  PRIMARY KEY (`ufgp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__fieldgroups`
--

LOCK TABLES `evo_users__fieldgroups` WRITE;
/*!40000 ALTER TABLE `evo_users__fieldgroups` DISABLE KEYS */;
INSERT INTO `evo_users__fieldgroups` VALUES
(1,'About me',1),
(2,'Instant Messaging',2),
(3,'Phone',3),
(4,'Web',4),
(5,'Address',5),
(6,'Administrative',6);
/*!40000 ALTER TABLE `evo_users__fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__fields`
--

DROP TABLE IF EXISTS `evo_users__fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__fields` (
  `uf_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uf_user_ID` int(10) unsigned NOT NULL,
  `uf_ufdf_ID` int(10) unsigned NOT NULL,
  `uf_varchar` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uf_ID`),
  KEY `uf_user_ID` (`uf_user_ID`),
  KEY `uf_ufdf_ID` (`uf_ufdf_ID`),
  KEY `uf_varchar` (`uf_varchar`(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__fields`
--

LOCK TABLES `evo_users__fields` WRITE;
/*!40000 ALTER TABLE `evo_users__fields` DISABLE KEYS */;
INSERT INTO `evo_users__fields` VALUES
(1,1,18,'https://www.facebook.com/b2evolution'),
(2,1,20,'https://github.com/b2evolution/b2evolution'),
(3,1,19,'https://www.linkedin.com/company/b2evolution-net'),
(4,1,1,'I am the demo administrator of this site.\nI love having so much power!'),
(5,1,17,'https://twitter.com/b2evolution/'),
(6,1,21,'http://b2evolution.net/');
/*!40000 ALTER TABLE `evo_users__fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__invitation_code`
--

DROP TABLE IF EXISTS `evo_users__invitation_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__invitation_code` (
  `ivc_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ivc_code` varchar(32) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ivc_expire_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `ivc_source` varchar(30) DEFAULT NULL,
  `ivc_grp_ID` int(4) DEFAULT NULL,
  `ivc_level` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ivc_ID`),
  UNIQUE KEY `ivc_code` (`ivc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__invitation_code`
--

LOCK TABLES `evo_users__invitation_code` WRITE;
/*!40000 ALTER TABLE `evo_users__invitation_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__invitation_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__organization`
--

DROP TABLE IF EXISTS `evo_users__organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__organization` (
  `org_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_owner_user_ID` int(10) unsigned NOT NULL,
  `org_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_url` varchar(2000) DEFAULT NULL,
  `org_accept` enum('yes','owner','no') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'owner',
  `org_perm_role` enum('owner and member','owner') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'owner and member',
  PRIMARY KEY (`org_ID`),
  UNIQUE KEY `org_name` (`org_name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__organization`
--

LOCK TABLES `evo_users__organization` WRITE;
/*!40000 ALTER TABLE `evo_users__organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__profile_visit_counters`
--

DROP TABLE IF EXISTS `evo_users__profile_visit_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__profile_visit_counters` (
  `upvc_user_ID` int(10) unsigned NOT NULL,
  `upvc_total_unique_visitors` int(10) unsigned NOT NULL DEFAULT 0,
  `upvc_last_view_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `upvc_new_unique_visitors` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`upvc_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__profile_visit_counters`
--

LOCK TABLES `evo_users__profile_visit_counters` WRITE;
/*!40000 ALTER TABLE `evo_users__profile_visit_counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__profile_visit_counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__profile_visits`
--

DROP TABLE IF EXISTS `evo_users__profile_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__profile_visits` (
  `upv_visited_user_ID` int(10) unsigned NOT NULL,
  `upv_visitor_user_ID` int(10) unsigned NOT NULL,
  `upv_last_visit_ts` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`upv_visited_user_ID`,`upv_visitor_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__profile_visits`
--

LOCK TABLES `evo_users__profile_visits` WRITE;
/*!40000 ALTER TABLE `evo_users__profile_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__profile_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__reports`
--

DROP TABLE IF EXISTS `evo_users__reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__reports` (
  `urep_target_user_ID` int(10) unsigned NOT NULL,
  `urep_reporter_ID` int(10) unsigned NOT NULL,
  `urep_status` enum('fake','guidelines','harass','spam','other') CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `urep_info` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urep_datetime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`urep_target_user_ID`,`urep_reporter_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__reports`
--

LOCK TABLES `evo_users__reports` WRITE;
/*!40000 ALTER TABLE `evo_users__reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__secondary_user_groups`
--

DROP TABLE IF EXISTS `evo_users__secondary_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__secondary_user_groups` (
  `sug_user_ID` int(10) unsigned NOT NULL,
  `sug_grp_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sug_user_ID`,`sug_grp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__secondary_user_groups`
--

LOCK TABLES `evo_users__secondary_user_groups` WRITE;
/*!40000 ALTER TABLE `evo_users__secondary_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__secondary_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__social_network`
--

DROP TABLE IF EXISTS `evo_users__social_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__social_network` (
  `usn_user_ID` int(10) unsigned NOT NULL,
  `usn_sn_ID` int(10) unsigned NOT NULL,
  `usn_network_ID` varchar(256) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `usn_token` varchar(1000) NOT NULL,
  `usn_token_expiration_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`usn_user_ID`,`usn_sn_ID`),
  KEY `usn_network_ID` (`usn_network_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__social_network`
--

LOCK TABLES `evo_users__social_network` WRITE;
/*!40000 ALTER TABLE `evo_users__social_network` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__social_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__tag`
--

DROP TABLE IF EXISTS `evo_users__tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__tag` (
  `utag_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `utag_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`utag_ID`),
  UNIQUE KEY `utag_name` (`utag_name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__tag`
--

LOCK TABLES `evo_users__tag` WRITE;
/*!40000 ALTER TABLE `evo_users__tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__user_org`
--

DROP TABLE IF EXISTS `evo_users__user_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__user_org` (
  `uorg_user_ID` int(10) unsigned NOT NULL,
  `uorg_org_ID` int(10) unsigned NOT NULL,
  `uorg_accepted` tinyint(1) DEFAULT 0,
  `uorg_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uorg_priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`uorg_user_ID`,`uorg_org_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__user_org`
--

LOCK TABLES `evo_users__user_org` WRITE;
/*!40000 ALTER TABLE `evo_users__user_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__user_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__usersettings`
--

DROP TABLE IF EXISTS `evo_users__usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__usersettings` (
  `uset_user_ID` int(10) unsigned NOT NULL,
  `uset_name` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `uset_value` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uset_user_ID`,`uset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__usersettings`
--

LOCK TABLES `evo_users__usersettings` WRITE;
/*!40000 ALTER TABLE `evo_users__usersettings` DISABLE KEYS */;
INSERT INTO `evo_users__usersettings` VALUES
(1,'created_fromIPv4','2130706433'),
(1,'enable_email','1'),
(1,'login_multiple_sessions','1'),
(1,'user_registered_from_domain','localhost');
/*!40000 ALTER TABLE `evo_users__usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_users__usertag`
--

DROP TABLE IF EXISTS `evo_users__usertag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_users__usertag` (
  `uutg_user_ID` int(10) unsigned NOT NULL,
  `uutg_emtag_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uutg_user_ID`,`uutg_emtag_ID`),
  UNIQUE KEY `taguser` (`uutg_emtag_ID`,`uutg_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_users__usertag`
--

LOCK TABLES `evo_users__usertag` WRITE;
/*!40000 ALTER TABLE `evo_users__usertag` DISABLE KEYS */;
/*!40000 ALTER TABLE `evo_users__usertag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_widget__container`
--

DROP TABLE IF EXISTS `evo_widget__container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_widget__container` (
  `wico_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wico_code` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `wico_skin_type` enum('normal','mobile','tablet','alt') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'normal',
  `wico_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wico_coll_ID` int(10) DEFAULT NULL,
  `wico_order` int(10) NOT NULL,
  `wico_main` tinyint(1) NOT NULL DEFAULT 0,
  `wico_item_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`wico_ID`),
  UNIQUE KEY `wico_coll_ID_code_skin_type` (`wico_coll_ID`,`wico_code`,`wico_skin_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_widget__container`
--

LOCK TABLES `evo_widget__container` WRITE;
/*!40000 ALTER TABLE `evo_widget__container` DISABLE KEYS */;
INSERT INTO `evo_widget__container` VALUES
(1,'site_header','normal','Site Header',NULL,1,1,NULL),
(2,'site_footer','normal','Site Footer',NULL,2,1,NULL),
(3,'navigation_hamburger','normal','Navigation Hamburger',NULL,3,1,NULL),
(4,'main_navigation','normal','Main Navigation',NULL,4,0,NULL),
(5,'right_navigation','normal','Right Navigation',NULL,5,0,NULL),
(6,'marketing_popup','normal','Marketing Popup',NULL,6,1,NULL);
/*!40000 ALTER TABLE `evo_widget__container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evo_widget__widget`
--

DROP TABLE IF EXISTS `evo_widget__widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `evo_widget__widget` (
  `wi_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wi_wico_ID` int(10) unsigned NOT NULL,
  `wi_order` int(10) NOT NULL,
  `wi_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `wi_type` enum('core','plugin') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'core',
  `wi_code` varchar(32) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `wi_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wi_ID`),
  UNIQUE KEY `wi_order` (`wi_wico_ID`,`wi_order`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evo_widget__widget`
--

LOCK TABLES `evo_widget__widget` WRITE;
/*!40000 ALTER TABLE `evo_widget__widget` DISABLE KEYS */;
INSERT INTO `evo_widget__widget` VALUES
(1,1,10,1,'core','site_logo',NULL),
(2,1,20,1,'core','subcontainer','a:2:{s:5:\"title\";s:15:\"Main Navigation\";s:9:\"container\";s:22:\"shared:main_navigation\";}'),
(3,1,30,1,'core','subcontainer','a:3:{s:5:\"title\";s:16:\"Right Navigation\";s:9:\"container\";s:23:\"shared:right_navigation\";s:16:\"widget_css_class\";s:10:\"floatright\";}'),
(4,2,10,1,'core','free_text','a:1:{s:7:\"content\";s:55:\"Cookies are required to enable core site functionality.\";}'),
(5,3,10,1,'core','colls_list_public','a:1:{s:16:\"widget_css_class\";s:10:\"visible-xs\";}'),
(6,3,30,1,'core','basic_menu_link','a:2:{s:9:\"link_type\";s:12:\"ownercontact\";s:16:\"widget_css_class\";s:21:\"visible-sm visible-xs\";}'),
(7,3,40,1,'core','free_html','a:1:{s:7:\"content\";s:25:\"<hr class=\"visible-xs\" />\";}'),
(8,3,50,1,'core','basic_menu_link','a:3:{s:9:\"link_type\";s:8:\"register\";s:16:\"widget_css_class\";s:10:\"visible-xs\";s:17:\"widget_link_class\";s:8:\"bg-white\";}'),
(9,3,60,1,'core','basic_menu_link','a:2:{s:9:\"link_type\";s:8:\"messages\";s:16:\"widget_css_class\";s:10:\"visible-xs\";}'),
(10,3,70,1,'core','basic_menu_link','a:2:{s:9:\"link_type\";s:6:\"logout\";s:16:\"widget_css_class\";s:10:\"visible-xs\";}'),
(11,4,10,1,'core','colls_list_public','a:1:{s:16:\"widget_css_class\";s:9:\"hidden-xs\";}'),
(12,4,30,1,'core','basic_menu_link','a:2:{s:9:\"link_type\";s:12:\"ownercontact\";s:17:\"widget_link_class\";s:19:\"hidden-sm hidden-xs\";}'),
(13,5,10,1,'core','basic_menu_link','a:1:{s:9:\"link_type\";s:5:\"login\";}'),
(14,5,20,1,'core','basic_menu_link','a:2:{s:9:\"link_type\";s:8:\"register\";s:17:\"widget_link_class\";s:18:\"hidden-xs bg-white\";}'),
(15,5,30,1,'core','basic_menu_link','a:2:{s:9:\"link_type\";s:9:\"myprofile\";s:20:\"profile_picture_size\";s:14:\"crop-top-32x32\";}'),
(16,5,40,1,'core','basic_menu_link','a:2:{s:9:\"link_type\";s:8:\"messages\";s:17:\"widget_link_class\";s:9:\"hidden-xs\";}'),
(17,5,50,1,'core','basic_menu_link','a:2:{s:9:\"link_type\";s:6:\"logout\";s:16:\"widget_css_class\";s:9:\"hidden-xs\";}'),
(18,5,60,1,'core','free_html','a:2:{s:7:\"content\";s:33:\"<label for=\"nav-trigger\"></label>\";s:16:\"widget_css_class\";s:47:\"visible-sm-inline-block visible-xs-inline-block\";}'),
(19,6,10,1,'core','user_register_quick',NULL);
/*!40000 ALTER TABLE `evo_widget__widget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23 13:03:36
