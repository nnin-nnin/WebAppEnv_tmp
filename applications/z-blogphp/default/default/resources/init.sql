/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: zblog
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
-- Table structure for table `zbp_category`
--

DROP TABLE IF EXISTS `zbp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `zbp_category` (
  `cate_ID` int(11) NOT NULL AUTO_INCREMENT,
  `cate_Name` varchar(250) NOT NULL DEFAULT '',
  `cate_Order` int(11) NOT NULL DEFAULT 0,
  `cate_Type` int(11) NOT NULL DEFAULT 0,
  `cate_Count` int(11) NOT NULL DEFAULT 0,
  `cate_Alias` varchar(250) NOT NULL DEFAULT '',
  `cate_Group` varchar(250) NOT NULL DEFAULT '',
  `cate_Intro` text NOT NULL,
  `cate_RootID` int(11) NOT NULL DEFAULT 0,
  `cate_ParentID` int(11) NOT NULL DEFAULT 0,
  `cate_CreateTime` int(11) NOT NULL DEFAULT 0,
  `cate_PostTime` int(11) NOT NULL DEFAULT 0,
  `cate_UpdateTime` int(11) NOT NULL DEFAULT 0,
  `cate_Template` varchar(250) NOT NULL DEFAULT '',
  `cate_LogTemplate` varchar(250) NOT NULL DEFAULT '',
  `cate_Meta` longtext NOT NULL,
  PRIMARY KEY (`cate_ID`),
  KEY `zbp_cate_Order` (`cate_Order`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbp_category`
--

LOCK TABLES `zbp_category` WRITE;
/*!40000 ALTER TABLE `zbp_category` DISABLE KEYS */;
INSERT INTO `zbp_category` VALUES (1,'未分类',0,0,1,'uncategorized','','',0,0,1790775420,0,1790775420,'','','');
/*!40000 ALTER TABLE `zbp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbp_comment`
--

DROP TABLE IF EXISTS `zbp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `zbp_comment` (
  `comm_ID` int(11) NOT NULL AUTO_INCREMENT,
  `comm_LogID` int(11) NOT NULL DEFAULT 0,
  `comm_IsChecking` tinyint(4) NOT NULL DEFAULT 0,
  `comm_RootID` int(11) NOT NULL DEFAULT 0,
  `comm_ParentID` int(11) NOT NULL DEFAULT 0,
  `comm_AuthorID` int(11) NOT NULL DEFAULT 0,
  `comm_Name` varchar(250) NOT NULL DEFAULT '',
  `comm_Email` varchar(250) NOT NULL DEFAULT '',
  `comm_HomePage` varchar(250) NOT NULL DEFAULT '',
  `comm_Content` text NOT NULL,
  `comm_PostTime` int(11) NOT NULL DEFAULT 0,
  `comm_IP` varchar(250) NOT NULL DEFAULT '',
  `comm_Agent` text NOT NULL,
  `comm_Meta` longtext NOT NULL,
  PRIMARY KEY (`comm_ID`),
  KEY `zbp_comm_LRI` (`comm_LogID`,`comm_RootID`,`comm_IsChecking`),
  KEY `zbp_comm_IsChecking` (`comm_IsChecking`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbp_comment`
--

LOCK TABLES `zbp_comment` WRITE;
/*!40000 ALTER TABLE `zbp_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `zbp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbp_config`
--

DROP TABLE IF EXISTS `zbp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `zbp_config` (
  `conf_ID` int(11) NOT NULL AUTO_INCREMENT,
  `conf_Name` varchar(250) NOT NULL DEFAULT '',
  `conf_Key` varchar(250) NOT NULL DEFAULT '',
  `conf_Value` longtext NOT NULL,
  PRIMARY KEY (`conf_ID`),
  KEY `zbp_conf_Name` (`conf_Name`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbp_config`
--

LOCK TABLES `zbp_config` WRITE;
/*!40000 ALTER TABLE `zbp_config` DISABLE KEYS */;
INSERT INTO `zbp_config` VALUES (1,'system','ZC_CLOSE_SITE','b:0;'),(2,'system','ZC_BLOG_HOST','s:34:\"h|t|t|p|:|/|/|l|o|c|a|l|h|o|s|t|/|\";'),(3,'system','ZC_BLOG_NAME','s:14:\"Z-BlogPHP Demo\";'),(4,'system','ZC_BLOG_SUBNAME','s:17:\"Good Luck To You!\";'),(5,'system','ZC_BLOG_THEME','s:7:\"default\";'),(6,'system','ZC_BLOG_CSS','s:7:\"default\";'),(7,'system','ZC_BLOG_COPYRIGHT','s:44:\"Copyright Your WebSite.Some Rights Reserved.\";'),(8,'system','ZC_BLOG_LANGUAGE','s:5:\"zh-CN\";'),(9,'system','ZC_BLOG_LANGUAGEPACK','s:5:\"zh-cn\";'),(10,'system','ZC_USING_PLUGIN_LIST','s:36:\"AppCentre|UEditor|Totoro|LinksManage\";'),(11,'system','ZC_BLOG_CLSID','s:32:\"f633b9e0e4048a9e37a91ffc64d4f362\";'),(12,'system','ZC_TIME_ZONE_NAME','s:13:\"Asia/Shanghai\";'),(13,'system','ZC_UPDATE_INFO_URL','s:32:\"https://update.zblogcn.com/info/\";'),(14,'system','ZC_PERMANENT_DOMAIN_ENABLE','b:0;'),(15,'system','ZC_DEBUG_MODE','b:0;'),(16,'system','ZC_DEBUG_MODE_STRICT','b:0;'),(17,'system','ZC_DEBUG_MODE_WARNING','b:1;'),(18,'system','ZC_DEBUG_LOG_ERROR','b:0;'),(19,'system','ZC_BLOG_PRODUCT','s:9:\"Z-BlogPHP\";'),(20,'system','ZC_BLOG_VERSION','s:18:\"1.7.5 Build 173550\";'),(21,'system','ZC_BLOG_COMMIT','s:0:\"\";'),(22,'system','ZC_BLOG_PRODUCT_FULL','s:0:\"\";'),(23,'system','ZC_BLOG_PRODUCT_HTML','s:0:\"\";'),(24,'system','ZC_BLOG_PRODUCT_FULLHTML','s:0:\"\";'),(25,'system','ZC_COMMENT_TURNOFF','b:1;'),(26,'system','ZC_COMMENT_VERIFY_ENABLE','b:1;'),(27,'system','ZC_COMMENT_REVERSE_ORDER','b:0;'),(28,'system','ZC_COMMENT_ORDERBY_TIME','b:0;'),(29,'system','ZC_COMMENT_AUDIT','b:0;'),(30,'system','ZC_COMMENT_VALIDCMTKEY_ENABLE','b:0;'),(31,'system','ZC_VERIFYCODE_STRING','s:29:\"ABCDEFGHKMNPRSTUVWXYZ23456789\";'),(32,'system','ZC_VERIFYCODE_WIDTH','i:90;'),(33,'system','ZC_VERIFYCODE_HEIGHT','i:30;'),(34,'system','ZC_VERIFYCODE_FONT','s:26:\"zb_system/defend/arial.ttf\";'),(35,'system','ZC_VERIFYCODE_LENGTH','i:5;'),(36,'system','ZC_VERIFYCODE_MAXANGLE','i:10;'),(37,'system','ZC_VERIFYCODE_MAXOFFSET','i:10;'),(38,'system','ZC_DISPLAY_COUNT','i:10;'),(39,'system','ZC_DISPLAY_ORDER','s:12:\"log_PostTime\";'),(40,'system','ZC_PAGEBAR_COUNT','i:10;'),(41,'system','ZC_COMMENTS_DISPLAY_COUNT','i:100;'),(42,'system','ZC_DISPLAY_SUBCATEGORYS','b:1;'),(43,'system','ZC_RSS2_COUNT','i:10;'),(44,'system','ZC_RSS2_ORDER','s:12:\"log_PostTime\";'),(45,'system','ZC_RSS_EXPORT_WHOLE','b:1;'),(46,'system','ZC_MANAGE_COUNT','i:50;'),(47,'system','ZC_MANAGE_ORDER','s:12:\"log_PostTime\";'),(48,'system','ZC_LOGIN_CSRFCHECK_ENABLE','b:1;'),(49,'system','ZC_LOGIN_VERIFY_ENABLE','b:1;'),(50,'system','ZC_EMOTICONS_FILENAME','s:4:\"face\";'),(51,'system','ZC_EMOTICONS_FILETYPE','s:11:\"png|gif|jpg\";'),(52,'system','ZC_EMOTICONS_FILESIZE','s:2:\"16\";'),(53,'system','ZC_UPLOAD_FILETYPE','s:219:\"jpg|gif|png|jpeg|bmp|webp|psd|wmf|ico|rpm|deb|tar|gz|xz|sit|7z|bz2|zip|rar|xml|xsl|svg|svgz|rtf|doc|docx|ppt|pptx|xls|xlsx|wps|chm|txt|md|pdf|mp3|flac|ape|mp4|mkv|avi|mpg|rm|ra|rmvb|mov|wmv|wma|torrent|apk|json|zba|gzba\";'),(54,'system','ZC_UPLOAD_FILESIZE','i:2;'),(55,'system','ZC_UPLOAD_DIR_YEARMONTHDAY','b:0;'),(56,'system','ZC_USERNAME_MIN','i:2;'),(57,'system','ZC_USERNAME_MAX','i:50;'),(58,'system','ZC_PASSWORD_MIN','i:8;'),(59,'system','ZC_PASSWORD_MAX','i:40;'),(60,'system','ZC_EMAIL_MAX','i:50;'),(61,'system','ZC_HOMEPAGE_MAX','i:100;'),(62,'system','ZC_CONTENT_MAX','i:1000;'),(63,'system','ZC_ARTICLE_TITLE_MAX','i:100;'),(64,'system','ZC_CATEGORY_NAME_MAX','i:50;'),(65,'system','ZC_TAGS_NAME_MAX','i:50;'),(66,'system','ZC_MODULE_NAME_MAX','i:50;'),(67,'system','ZC_ARTICLE_EXCERPT_MAX','i:250;'),(68,'system','ZC_ARTICLE_INTRO_WITH_TEXT','b:0;'),(69,'system','ZC_COMMENT_EXCERPT_MAX','i:20;'),(70,'system','ZC_STATIC_MODE','s:6:\"ACTIVE\";'),(71,'system','ZC_ARTICLE_REGEX','s:18:\"{%host%}?id={%id%}\";'),(72,'system','ZC_PAGE_REGEX','s:18:\"{%host%}?id={%id%}\";'),(73,'system','ZC_CATEGORY_REGEX','s:34:\"{%host%}?cate={%id%}&page={%page%}\";'),(74,'system','ZC_AUTHOR_REGEX','s:34:\"{%host%}?auth={%id%}&page={%page%}\";'),(75,'system','ZC_TAGS_REGEX','s:34:\"{%host%}?tags={%id%}&page={%page%}\";'),(76,'system','ZC_DATE_REGEX','s:36:\"{%host%}?date={%date%}&page={%page%}\";'),(77,'system','ZC_INDEX_REGEX','s:22:\"{%host%}?page={%page%}\";'),(78,'system','ZC_ALIAS_BACK_ATTR','s:4:\"Name\";'),(79,'system','ZC_DATETIME_SEPARATOR','s:1:\"-\";'),(80,'system','ZC_DATETIME_RULE','s:3:\"Y-n\";'),(81,'system','ZC_DATETIME_WITHDAY_RULE','s:5:\"Y-n-j\";'),(82,'system','ZC_SEARCH_COUNT','i:20;'),(83,'system','ZC_SEARCH_REGEX','s:40:\"{%host%}search.php?q={%q%}&page={%page%}\";'),(84,'system','ZC_INDEX_DEFAULT_TEMPLATE','s:5:\"index\";'),(85,'system','ZC_POST_DEFAULT_TEMPLATE','s:6:\"single\";'),(86,'system','ZC_SEARCH_DEFAULT_TEMPLATE','s:6:\"search\";'),(87,'system','ZC_SIDEBAR_ORDER','s:78:\"calendar|controlpanel|catalog|searchpanel|comments|archives|favorite|link|misc\";'),(88,'system','ZC_SIDEBAR2_ORDER','s:0:\"\";'),(89,'system','ZC_SIDEBAR3_ORDER','s:0:\"\";'),(90,'system','ZC_SIDEBAR4_ORDER','s:0:\"\";'),(91,'system','ZC_SIDEBAR5_ORDER','s:0:\"\";'),(92,'system','ZC_SIDEBAR6_ORDER','s:0:\"\";'),(93,'system','ZC_SIDEBAR7_ORDER','s:0:\"\";'),(94,'system','ZC_SIDEBAR8_ORDER','s:0:\"\";'),(95,'system','ZC_SIDEBAR9_ORDER','s:0:\"\";'),(96,'system','ZC_SYNTAXHIGHLIGHTER_ENABLE','b:1;'),(97,'system','ZC_CODEMIRROR_ENABLE','b:1;'),(98,'system','ZC_ALLOW_AUDITTING_MEMBER_VISIT_MANAGE','b:0;'),(99,'system','ZC_OUTPUT_OPTION_MEMBER_MAX_LEVEL','i:0;'),(100,'system','ZC_CATEGORY_MANAGE_LEGACY_DISPLAY','b:1;'),(101,'system','ZC_LOADMEMBERS_LEVEL','i:1;'),(102,'system','ZC_LAST_VERSION','s:6:\"173000\";'),(103,'system','ZC_MODULE_CATALOG_STYLE','i:0;'),(104,'system','ZC_MODULE_ARCHIVES_STYLE','i:0;'),(105,'system','ZC_VIEWNUMS_TURNOFF','b:0;'),(106,'system','ZC_LISTONTOP_TURNOFF','b:0;'),(107,'system','ZC_RELATEDLIST_COUNT','i:10;'),(108,'system','ZC_RUNINFO_DISPLAY','b:1;'),(109,'system','ZC_POST_ALIAS_USE_ID_NOT_TITLE','b:0;'),(110,'system','ZC_COMPATIBLE_ASP_URL','b:1;'),(111,'system','ZC_LARGE_DATA','b:0;'),(112,'system','ZC_VERSION_IN_HEADER','b:1;'),(113,'system','ZC_ADDITIONAL_SECURITY','b:1;'),(114,'system','ZC_XMLRPC_ENABLE','b:0;'),(115,'system','ZC_XMLRPC_USE_WEBTOKEN','b:0;'),(116,'system','ZC_USING_CDN_GUESTIP_TYPE','s:11:\"REMOTE_ADDR\";'),(117,'system','ZC_POST_BATCH_DELETE','b:0;'),(118,'system','ZC_JS_304_ENABLE','b:1;'),(119,'system','ZC_DELMEMBER_WITH_ALLDATA','b:0;'),(120,'system','ZC_THUMB_DEFAULT_QUALITY','i:90;'),(121,'system','ZC_THUMB_IMAGE_FILL','b:1;'),(122,'system','ZC_FIX_MODULE_MIXED_FILENAME','b:1;'),(123,'system','ZC_LOGS_MORE_INFO','b:0;'),(124,'system','ZC_API_ENABLE','b:0;'),(125,'system','ZC_API_THROTTLE_ENABLE','b:0;'),(126,'system','ZC_API_THROTTLE_MAX_REQS_PER_MIN','i:60;'),(127,'system','ZC_API_DISPLAY_COUNT','i:10;'),(128,'system','ZC_NOW_VERSION','s:6:\"173550\";'),(129,'cache','templates_md5','s:0:\"\";'),(130,'AppCentre','enabledcheck','i:1;'),(131,'AppCentre','checkbeta','i:0;'),(132,'AppCentre','enabledevelop','i:0;'),(133,'AppCentre','enablegzipapp','i:0;'),(134,'cache','templates_md5_array','s:61:\"a:1:{s:8:\"template\";s:32:\"7cba2fd2ad88c4ebcdd1e17a939e2e0b\";}\";');
/*!40000 ALTER TABLE `zbp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbp_member`
--

DROP TABLE IF EXISTS `zbp_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `zbp_member` (
  `mem_ID` int(11) NOT NULL AUTO_INCREMENT,
  `mem_Guid` varchar(36) NOT NULL DEFAULT '',
  `mem_Level` tinyint(4) NOT NULL DEFAULT 0,
  `mem_Status` tinyint(4) NOT NULL DEFAULT 0,
  `mem_Name` varchar(250) NOT NULL DEFAULT '',
  `mem_Password` varchar(250) NOT NULL DEFAULT '',
  `mem_Email` varchar(250) NOT NULL DEFAULT '',
  `mem_HomePage` varchar(250) NOT NULL DEFAULT '',
  `mem_IP` varchar(250) NOT NULL DEFAULT '',
  `mem_CreateTime` int(11) NOT NULL DEFAULT 0,
  `mem_PostTime` int(11) NOT NULL DEFAULT 0,
  `mem_UpdateTime` int(11) NOT NULL DEFAULT 0,
  `mem_Alias` varchar(250) NOT NULL DEFAULT '',
  `mem_Intro` text NOT NULL,
  `mem_Articles` int(11) NOT NULL DEFAULT 0,
  `mem_Pages` int(11) NOT NULL DEFAULT 0,
  `mem_Comments` int(11) NOT NULL DEFAULT 0,
  `mem_Uploads` int(11) NOT NULL DEFAULT 0,
  `mem_Template` varchar(250) NOT NULL DEFAULT '',
  `mem_Meta` longtext NOT NULL,
  PRIMARY KEY (`mem_ID`),
  KEY `zbp_mem_Name` (`mem_Name`),
  KEY `zbp_mem_Alias` (`mem_Alias`),
  KEY `zbp_mem_Level` (`mem_Level`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbp_member`
--

LOCK TABLES `zbp_member` WRITE;
/*!40000 ALTER TABLE `zbp_member` DISABLE KEYS */;
INSERT INTO `zbp_member` VALUES (1,'36bb20ae1b9a0b2d4597808db94b410e',1,0,'admin','e91a69bbee4b5f77477dbadbf8657eb7','null@null.com','','',1790775420,1790775420,1790775420,'','',0,0,0,0,'','');
/*!40000 ALTER TABLE `zbp_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbp_module`
--

DROP TABLE IF EXISTS `zbp_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `zbp_module` (
  `mod_ID` int(11) NOT NULL AUTO_INCREMENT,
  `mod_Name` varchar(250) NOT NULL DEFAULT '',
  `mod_FileName` varchar(250) NOT NULL DEFAULT '',
  `mod_Content` text NOT NULL,
  `mod_SidebarID` int(11) NOT NULL DEFAULT 0,
  `mod_HtmlID` varchar(250) NOT NULL DEFAULT '',
  `mod_Type` varchar(5) NOT NULL DEFAULT '',
  `mod_MaxLi` int(11) NOT NULL DEFAULT 0,
  `mod_Source` varchar(250) NOT NULL DEFAULT '',
  `mod_IsHideTitle` tinyint(4) NOT NULL DEFAULT 0,
  `mod_Meta` longtext NOT NULL,
  PRIMARY KEY (`mod_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbp_module`
--

LOCK TABLES `zbp_module` WRITE;
/*!40000 ALTER TABLE `zbp_module` DISABLE KEYS */;
INSERT INTO `zbp_module` VALUES (1,'导航栏','navbar','<li id=\"navbar-item-index\"><a href=\"{#ZC_BLOG_HOST#}\">首页</a></li><li><a href=\"{#ZC_BLOG_HOST#}?id=2\">留言本</a></li>',0,'divNavBar','ul',0,'system',0,''),(2,'日历','calendar','<table id=\"tbCalendar\">\n    <caption><a title=\"上个月\" href=\"\">«</a>&nbsp;&nbsp;&nbsp;<a href=\"\">\n    2026年9月    </a>&nbsp;&nbsp;&nbsp;<a title=\"下个月\" href=\"\">»</a></caption>\n    <thead><tr> <th title=\"星期一\" scope=\"col\"><small>一</small></th> <th title=\"星期二\" scope=\"col\"><small>二</small></th> <th title=\"星期三\" scope=\"col\"><small>三</small></th> <th title=\"星期四\" scope=\"col\"><small>四</small></th> <th title=\"星期五\" scope=\"col\"><small>五</small></th> <th title=\"星期六\" scope=\"col\"><small>六</small></th> <th title=\"星期日\" scope=\"col\"><small>日</small></th></tr></thead>\n    <tbody>\n        <tr><td></td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr>\n    <tr><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td></tr>\n    <tr><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td></tr>\n    <tr><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td></tr>\n    <tr><td>28</td><td>29</td><td><a href=\"\" title=\"2026-9-30 (1)\" target=\"_blank\">30</a></td><td></td><td></td><td></td><td></td></tr>\n    	</tbody>\n</table>',0,'divCalendar','div',0,'system',1,''),(3,'控制面板','controlpanel','<span class=\"cp-hello\">您好，欢迎到访网站！</span><br/><span class=\"cp-login\"><a href=\"{#ZC_BLOG_HOST#}zb_system/cmd.php?act=login\">登录后台</a></span>&nbsp;&nbsp;<span class=\"cp-vrs\"><a href=\"{#ZC_BLOG_HOST#}zb_system/cmd.php?act=misc&amp;type=vrs\">查看权限</a></span>',0,'divContorPanel','div',0,'system',0,''),(4,'网站分类','catalog','<li><a title=\"未分类\" href=\"\">未分类</a></li>\n',0,'divCatalog','ul',0,'system',0,''),(5,'搜索','searchpanel','<form name=\"search\" method=\"post\" action=\"{#ZC_BLOG_HOST#}zb_system/cmd.php?act=search\"><label><span style=\"position:absolute;color:transparent;z-index:-9999;\">Search</span><input type=\"text\" name=\"q\" size=\"11\" /></label> <input type=\"submit\" value=\"搜索\" /></form>',0,'divSearchPanel','div',0,'system',0,''),(6,'最新留言','comments','',0,'divComments','ul',0,'system',0,''),(7,'文章归档','archives','',0,'divArchives','ul',0,'system',0,''),(8,'站点信息','statistics','',0,'divStatistics','ul',0,'system',0,''),(9,'网站收藏','favorite','<li><a href=\"https://app.zblogcn.com/\" target=\"_blank\">Z-Blog应用中心</a></li><li><a href=\"https://bbs.zblogcn.com/\" target=\"_blank\">ZBlogger社区</a></li><li><a href=\"https://z5encrypt.com/\" target=\"_blank\" title=\"全新的PHP加密方案，致力于PHP源码的保护\">Z5 PHP加密</a></li>',0,'divFavorites','ul',0,'system',0,''),(10,'友情链接','link','<li><a href=\"https://github.com/zblogcn\" target=\"_blank\" title=\"Z-Blog on Github\">Z-Blog on Github</a></li>',0,'divLinkage','ul',0,'system',0,''),(11,'作者列表','authors','',0,'divAuthors','ul',0,'system',0,''),(12,'最近发表','previous','',0,'divPrevious','ul',0,'system',0,''),(13,'标签列表','tags','',0,'divTags','ul',0,'system',0,'');
/*!40000 ALTER TABLE `zbp_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbp_post`
--

DROP TABLE IF EXISTS `zbp_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `zbp_post` (
  `log_ID` int(11) NOT NULL AUTO_INCREMENT,
  `log_CateID` int(11) NOT NULL DEFAULT 0,
  `log_AuthorID` int(11) NOT NULL DEFAULT 0,
  `log_Tag` varchar(250) NOT NULL DEFAULT '',
  `log_Status` tinyint(4) NOT NULL DEFAULT 0,
  `log_Type` int(11) NOT NULL DEFAULT 0,
  `log_Alias` varchar(250) NOT NULL DEFAULT '',
  `log_IsTop` tinyint(4) NOT NULL DEFAULT 0,
  `log_IsLock` tinyint(4) NOT NULL DEFAULT 0,
  `log_Title` varchar(250) NOT NULL DEFAULT '',
  `log_Intro` text NOT NULL,
  `log_Content` longtext NOT NULL,
  `log_CreateTime` int(11) NOT NULL DEFAULT 0,
  `log_PostTime` int(11) NOT NULL DEFAULT 0,
  `log_UpdateTime` int(11) NOT NULL DEFAULT 0,
  `log_CommNums` int(11) NOT NULL DEFAULT 0,
  `log_ViewNums` int(11) NOT NULL DEFAULT 0,
  `log_Template` varchar(250) NOT NULL DEFAULT '',
  `log_Meta` longtext NOT NULL,
  PRIMARY KEY (`log_ID`),
  KEY `zbp_log_TPISC` (`log_Type`,`log_PostTime`,`log_IsTop`,`log_Status`,`log_CateID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbp_post`
--

LOCK TABLES `zbp_post` WRITE;
/*!40000 ALTER TABLE `zbp_post` DISABLE KEYS */;
INSERT INTO `zbp_post` VALUES (1,1,1,'',0,0,'',0,0,'欢迎使用Z-BlogPHP！','<p>欢迎使用Z-Blog，这是程序自动生成的文章，您可以删除或是编辑它:)</p><p>系统生成了一个留言本和一篇《欢迎使用Z-BlogPHP！》，祝您使用愉快！</p>','<p>欢迎使用Z-Blog，这是程序自动生成的文章，您可以删除或是编辑它:)</p><p>系统生成了一个留言本和一篇《欢迎使用Z-BlogPHP！》，祝您使用愉快！</p>',1790775420,1790775420,1790775420,0,0,'',''),(2,0,1,'',0,1,'',0,0,'留言本','这是一个留言本，是由程序自动生成的页面，您可以对其进行任意操作。','这是一个留言本，是由程序自动生成的页面，您可以对其进行任意操作。',1790775420,1790775420,1790775420,0,0,'','');
/*!40000 ALTER TABLE `zbp_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbp_tag`
--

DROP TABLE IF EXISTS `zbp_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `zbp_tag` (
  `tag_ID` int(11) NOT NULL AUTO_INCREMENT,
  `tag_Name` varchar(250) NOT NULL DEFAULT '',
  `tag_Order` int(11) NOT NULL DEFAULT 0,
  `tag_Type` int(11) NOT NULL DEFAULT 0,
  `tag_Count` int(11) NOT NULL DEFAULT 0,
  `tag_Alias` varchar(250) NOT NULL DEFAULT '',
  `tag_Group` varchar(250) NOT NULL DEFAULT '',
  `tag_Intro` text NOT NULL,
  `tag_CreateTime` int(11) NOT NULL DEFAULT 0,
  `tag_PostTime` int(11) NOT NULL DEFAULT 0,
  `tag_UpdateTime` int(11) NOT NULL DEFAULT 0,
  `tag_Template` varchar(250) NOT NULL DEFAULT '',
  `tag_Meta` longtext NOT NULL,
  PRIMARY KEY (`tag_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbp_tag`
--

LOCK TABLES `zbp_tag` WRITE;
/*!40000 ALTER TABLE `zbp_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `zbp_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbp_upload`
--

DROP TABLE IF EXISTS `zbp_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `zbp_upload` (
  `ul_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ul_AuthorID` int(11) NOT NULL DEFAULT 0,
  `ul_Size` int(11) NOT NULL DEFAULT 0,
  `ul_Name` varchar(250) NOT NULL DEFAULT '',
  `ul_SourceName` varchar(250) NOT NULL DEFAULT '',
  `ul_MimeType` varchar(250) NOT NULL DEFAULT '',
  `ul_PostTime` int(11) NOT NULL DEFAULT 0,
  `ul_DownNums` int(11) NOT NULL DEFAULT 0,
  `ul_LogID` int(11) NOT NULL DEFAULT 0,
  `ul_Intro` text NOT NULL,
  `ul_Meta` longtext NOT NULL,
  PRIMARY KEY (`ul_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbp_upload`
--

LOCK TABLES `zbp_upload` WRITE;
/*!40000 ALTER TABLE `zbp_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `zbp_upload` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 13:37:25
