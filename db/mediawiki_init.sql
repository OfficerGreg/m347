-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: wiki_db
-- ------------------------------------------------------
-- Server version	5.7.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wkactor`
--

DROP TABLE IF EXISTS `wkactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkactor` (
  `actor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actor_user` int(10) unsigned DEFAULT NULL,
  `actor_name` varbinary(255) NOT NULL,
  PRIMARY KEY (`actor_id`),
  UNIQUE KEY `actor_name` (`actor_name`),
  UNIQUE KEY `actor_user` (`actor_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkactor`
--

LOCK TABLES `wkactor` WRITE;
/*!40000 ALTER TABLE `wkactor` DISABLE KEYS */;
INSERT INTO `wkactor` VALUES (1,1,_binary 'Wikimedia'),(2,2,_binary 'MediaWiki default');
/*!40000 ALTER TABLE `wkactor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkarchive`
--

DROP TABLE IF EXISTS `wkarchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkarchive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_comment_id` bigint(20) unsigned NOT NULL,
  `ar_actor` bigint(20) unsigned NOT NULL,
  `ar_timestamp` binary(14) NOT NULL,
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_rev_id` int(10) unsigned NOT NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ar_id`),
  UNIQUE KEY `ar_revid_uniq` (`ar_rev_id`),
  KEY `ar_name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `ar_actor_timestamp` (`ar_actor`,`ar_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkarchive`
--

LOCK TABLES `wkarchive` WRITE;
/*!40000 ALTER TABLE `wkarchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkarchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkbot_passwords`
--

DROP TABLE IF EXISTS `wkbot_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkbot_passwords` (
  `bp_user` int(10) unsigned NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL,
  PRIMARY KEY (`bp_user`,`bp_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkbot_passwords`
--

LOCK TABLES `wkbot_passwords` WRITE;
/*!40000 ALTER TABLE `wkbot_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkbot_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkcategory`
--

DROP TABLE IF EXISTS `wkcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkcategory` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkcategory`
--

LOCK TABLES `wkcategory` WRITE;
/*!40000 ALTER TABLE `wkcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkcategorylinks`
--

DROP TABLE IF EXISTS `wkcategorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkcategorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varbinary(255) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  PRIMARY KEY (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkcategorylinks`
--

LOCK TABLES `wkcategorylinks` WRITE;
/*!40000 ALTER TABLE `wkcategorylinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkcategorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkchange_tag`
--

DROP TABLE IF EXISTS `wkchange_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkchange_tag` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ct_rc_id` int(10) unsigned DEFAULT NULL,
  `ct_log_id` int(10) unsigned DEFAULT NULL,
  `ct_rev_id` int(10) unsigned DEFAULT NULL,
  `ct_params` blob,
  `ct_tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ct_id`),
  UNIQUE KEY `ct_rc_tag_id` (`ct_rc_id`,`ct_tag_id`),
  UNIQUE KEY `ct_log_tag_id` (`ct_log_id`,`ct_tag_id`),
  UNIQUE KEY `ct_rev_tag_id` (`ct_rev_id`,`ct_tag_id`),
  KEY `ct_tag_id_id` (`ct_tag_id`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkchange_tag`
--

LOCK TABLES `wkchange_tag` WRITE;
/*!40000 ALTER TABLE `wkchange_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkchange_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkchange_tag_def`
--

DROP TABLE IF EXISTS `wkchange_tag_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkchange_tag_def` (
  `ctd_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctd_name` varbinary(255) NOT NULL,
  `ctd_user_defined` tinyint(1) NOT NULL,
  `ctd_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctd_id`),
  UNIQUE KEY `ctd_name` (`ctd_name`),
  KEY `ctd_count` (`ctd_count`),
  KEY `ctd_user_defined` (`ctd_user_defined`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkchange_tag_def`
--

LOCK TABLES `wkchange_tag_def` WRITE;
/*!40000 ALTER TABLE `wkchange_tag_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkchange_tag_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkcomment`
--

DROP TABLE IF EXISTS `wkcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkcomment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_hash` int(11) NOT NULL,
  `comment_text` blob NOT NULL,
  `comment_data` blob,
  PRIMARY KEY (`comment_id`),
  KEY `comment_hash` (`comment_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkcomment`
--

LOCK TABLES `wkcomment` WRITE;
/*!40000 ALTER TABLE `wkcomment` DISABLE KEYS */;
INSERT INTO `wkcomment` VALUES (1,0,'',NULL);
/*!40000 ALTER TABLE `wkcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkcontent`
--

DROP TABLE IF EXISTS `wkcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkcontent` (
  `content_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content_size` int(10) unsigned NOT NULL,
  `content_sha1` varbinary(32) NOT NULL,
  `content_model` smallint(5) unsigned NOT NULL,
  `content_address` varbinary(255) NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkcontent`
--

LOCK TABLES `wkcontent` WRITE;
/*!40000 ALTER TABLE `wkcontent` DISABLE KEYS */;
INSERT INTO `wkcontent` VALUES (1,755,_binary '22vz5zlxa2zctewimaum2bf1due8hkl',1,_binary 'tt:1');
/*!40000 ALTER TABLE `wkcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkcontent_models`
--

DROP TABLE IF EXISTS `wkcontent_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkcontent_models` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varbinary(64) NOT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `model_name` (`model_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkcontent_models`
--

LOCK TABLES `wkcontent_models` WRITE;
/*!40000 ALTER TABLE `wkcontent_models` DISABLE KEYS */;
INSERT INTO `wkcontent_models` VALUES (1,_binary 'wikitext');
/*!40000 ALTER TABLE `wkcontent_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkexternallinks`
--

DROP TABLE IF EXISTS `wkexternallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkexternallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  `el_index_60` varbinary(60) NOT NULL,
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60)),
  KEY `el_index_60` (`el_index_60`,`el_id`),
  KEY `el_from_index_60` (`el_from`,`el_index_60`,`el_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkexternallinks`
--

LOCK TABLES `wkexternallinks` WRITE;
/*!40000 ALTER TABLE `wkexternallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkexternallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkfilearchive`
--

DROP TABLE IF EXISTS `wkfilearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkfilearchive` (
  `fa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT NULL,
  `fa_deleted_reason_id` bigint(20) unsigned NOT NULL,
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description_id` bigint(20) unsigned NOT NULL,
  `fa_actor` bigint(20) unsigned NOT NULL,
  `fa_timestamp` binary(14) DEFAULT NULL,
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_actor_timestamp` (`fa_actor`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkfilearchive`
--

LOCK TABLES `wkfilearchive` WRITE;
/*!40000 ALTER TABLE `wkfilearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkfilearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkimage`
--

DROP TABLE IF EXISTS `wkimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkimage` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description_id` bigint(20) unsigned NOT NULL,
  `img_actor` bigint(20) unsigned NOT NULL,
  `img_timestamp` binary(14) NOT NULL,
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_actor_timestamp` (`img_actor`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkimage`
--

LOCK TABLES `wkimage` WRITE;
/*!40000 ALTER TABLE `wkimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkimagelinks`
--

DROP TABLE IF EXISTS `wkimagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkimagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkimagelinks`
--

LOCK TABLES `wkimagelinks` WRITE;
/*!40000 ALTER TABLE `wkimagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkimagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkinterwiki`
--

DROP TABLE IF EXISTS `wkinterwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkinterwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varbinary(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkinterwiki`
--

LOCK TABLES `wkinterwiki` WRITE;
/*!40000 ALTER TABLE `wkinterwiki` DISABLE KEYS */;
INSERT INTO `wkinterwiki` VALUES (_binary 'acronym',_binary 'https://www.acronymfinder.com/~/search/af.aspx?string=exact&Acronym=$1','','',0,0),(_binary 'advogato',_binary 'http://www.advogato.org/$1','','',0,0),(_binary 'arxiv',_binary 'https://www.arxiv.org/abs/$1','','',0,0),(_binary 'c2find',_binary 'http://c2.com/cgi/wiki?FindPage&value=$1','','',0,0),(_binary 'cache',_binary 'https://www.google.com/search?q=cache:$1','','',0,0),(_binary 'commons',_binary 'https://commons.wikimedia.org/wiki/$1',_binary 'https://commons.wikimedia.org/w/api.php','',0,0),(_binary 'dictionary',_binary 'http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1','','',0,0),(_binary 'doi',_binary 'https://dx.doi.org/$1','','',0,0),(_binary 'drumcorpswiki',_binary 'http://www.drumcorpswiki.com/$1',_binary 'http://drumcorpswiki.com/api.php','',0,0),(_binary 'dwjwiki',_binary 'http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1','','',0,0),(_binary 'elibre',_binary 'http://enciclopedia.us.es/index.php/$1',_binary 'http://enciclopedia.us.es/api.php','',0,0),(_binary 'emacswiki',_binary 'https://www.emacswiki.org/emacs/$1','','',0,0),(_binary 'foldoc',_binary 'https://foldoc.org/?$1','','',0,0),(_binary 'foxwiki',_binary 'https://fox.wikis.com/wc.dll?Wiki~$1','','',0,0),(_binary 'freebsdman',_binary 'https://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1','','',0,0),(_binary 'gentoo-wiki',_binary 'http://gentoo-wiki.com/$1','','',0,0),(_binary 'google',_binary 'https://www.google.com/search?q=$1','','',0,0),(_binary 'googlegroups',_binary 'https://groups.google.com/groups?q=$1','','',0,0),(_binary 'hammondwiki',_binary 'http://www.dairiki.org/HammondWiki/$1','','',0,0),(_binary 'hrwiki',_binary 'http://www.hrwiki.org/wiki/$1',_binary 'http://www.hrwiki.org/w/api.php','',0,0),(_binary 'imdb',_binary 'http://www.imdb.com/find?q=$1&tt=on','','',0,0),(_binary 'kmwiki',_binary 'https://kmwiki.wikispaces.com/$1','','',0,0),(_binary 'linuxwiki',_binary 'http://linuxwiki.de/$1','','',0,0),(_binary 'lojban',_binary 'https://mw.lojban.org/papri/$1','','',0,0),(_binary 'lqwiki',_binary 'http://wiki.linuxquestions.org/wiki/$1','','',0,0),(_binary 'meatball',_binary 'http://meatballwiki.org/wiki/$1','','',0,0),(_binary 'mediawikiwiki',_binary 'https://www.mediawiki.org/wiki/$1',_binary 'https://www.mediawiki.org/w/api.php','',0,0),(_binary 'memoryalpha',_binary 'http://en.memory-alpha.org/wiki/$1',_binary 'http://en.memory-alpha.org/api.php','',0,0),(_binary 'metawiki',_binary 'http://sunir.org/apps/meta.pl?$1','','',0,0),(_binary 'metawikimedia',_binary 'https://meta.wikimedia.org/wiki/$1',_binary 'https://meta.wikimedia.org/w/api.php','',0,0),(_binary 'mozillawiki',_binary 'https://wiki.mozilla.org/$1',_binary 'https://wiki.mozilla.org/api.php','',0,0),(_binary 'mw',_binary 'https://www.mediawiki.org/wiki/$1',_binary 'https://www.mediawiki.org/w/api.php','',0,0),(_binary 'oeis',_binary 'https://oeis.org/$1','','',0,0),(_binary 'openwiki',_binary 'http://openwiki.com/ow.asp?$1','','',0,0),(_binary 'pmid',_binary 'https://www.ncbi.nlm.nih.gov/pubmed/$1?dopt=Abstract','','',0,0),(_binary 'pythoninfo',_binary 'https://wiki.python.org/moin/$1','','',0,0),(_binary 'rfc',_binary 'https://tools.ietf.org/html/rfc$1','','',0,0),(_binary 's23wiki',_binary 'http://s23.org/wiki/$1',_binary 'http://s23.org/w/api.php','',0,0),(_binary 'seattlewireless',_binary 'http://seattlewireless.net/$1','','',0,0),(_binary 'senseislibrary',_binary 'https://senseis.xmp.net/?$1','','',0,0),(_binary 'shoutwiki',_binary 'http://www.shoutwiki.com/wiki/$1',_binary 'http://www.shoutwiki.com/w/api.php','',0,0),(_binary 'squeak',_binary 'http://wiki.squeak.org/squeak/$1','','',0,0),(_binary 'theopedia',_binary 'https://www.theopedia.com/$1','','',0,0),(_binary 'tmbw',_binary 'http://www.tmbw.net/wiki/$1',_binary 'http://tmbw.net/wiki/api.php','',0,0),(_binary 'tmnet',_binary 'http://www.technomanifestos.net/?$1','','',0,0),(_binary 'twiki',_binary 'http://twiki.org/cgi-bin/view/$1','','',0,0),(_binary 'uncyclopedia',_binary 'https://en.uncyclopedia.co/wiki/$1',_binary 'https://en.uncyclopedia.co/w/api.php','',0,0),(_binary 'unreal',_binary 'https://wiki.beyondunreal.com/$1',_binary 'https://wiki.beyondunreal.com/w/api.php','',0,0),(_binary 'usemod',_binary 'http://www.usemod.com/cgi-bin/wiki.pl?$1','','',0,0),(_binary 'wiki',_binary 'http://c2.com/cgi/wiki?$1','','',0,0),(_binary 'wikia',_binary 'http://www.wikia.com/wiki/$1','','',0,0),(_binary 'wikibooks',_binary 'https://en.wikibooks.org/wiki/$1',_binary 'https://en.wikibooks.org/w/api.php','',0,0),(_binary 'wikidata',_binary 'https://www.wikidata.org/wiki/$1',_binary 'https://www.wikidata.org/w/api.php','',0,0),(_binary 'wikif1',_binary 'http://www.wikif1.org/$1','','',0,0),(_binary 'wikihow',_binary 'https://www.wikihow.com/$1',_binary 'https://www.wikihow.com/api.php','',0,0),(_binary 'wikimedia',_binary 'https://foundation.wikimedia.org/wiki/$1',_binary 'https://foundation.wikimedia.org/w/api.php','',0,0),(_binary 'wikinews',_binary 'https://en.wikinews.org/wiki/$1',_binary 'https://en.wikinews.org/w/api.php','',0,0),(_binary 'wikinfo',_binary 'http://wikinfo.co/English/index.php/$1','','',0,0),(_binary 'wikipedia',_binary 'https://en.wikipedia.org/wiki/$1',_binary 'https://en.wikipedia.org/w/api.php','',0,0),(_binary 'wikiquote',_binary 'https://en.wikiquote.org/wiki/$1',_binary 'https://en.wikiquote.org/w/api.php','',0,0),(_binary 'wikisource',_binary 'https://wikisource.org/wiki/$1',_binary 'https://wikisource.org/w/api.php','',0,0),(_binary 'wikispecies',_binary 'https://species.wikimedia.org/wiki/$1',_binary 'https://species.wikimedia.org/w/api.php','',0,0),(_binary 'wikiversity',_binary 'https://en.wikiversity.org/wiki/$1',_binary 'https://en.wikiversity.org/w/api.php','',0,0),(_binary 'wikivoyage',_binary 'https://en.wikivoyage.org/wiki/$1',_binary 'https://en.wikivoyage.org/w/api.php','',0,0),(_binary 'wikt',_binary 'https://en.wiktionary.org/wiki/$1',_binary 'https://en.wiktionary.org/w/api.php','',0,0),(_binary 'wiktionary',_binary 'https://en.wiktionary.org/wiki/$1',_binary 'https://en.wiktionary.org/w/api.php','',0,0);
/*!40000 ALTER TABLE `wkinterwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkip_changes`
--

DROP TABLE IF EXISTS `wkip_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkip_changes` (
  `ipc_rev_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ipc_rev_timestamp` binary(14) NOT NULL,
  `ipc_hex` varbinary(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`ipc_rev_id`),
  KEY `ipc_rev_timestamp` (`ipc_rev_timestamp`),
  KEY `ipc_hex_time` (`ipc_hex`,`ipc_rev_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkip_changes`
--

LOCK TABLES `wkip_changes` WRITE;
/*!40000 ALTER TABLE `wkip_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkip_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkipblocks`
--

DROP TABLE IF EXISTS `wkipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkipblocks` (
  `ipb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_actor` bigint(20) unsigned NOT NULL,
  `ipb_reason_id` bigint(20) unsigned NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL,
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL,
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(10) unsigned DEFAULT NULL,
  `ipb_sitewide` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address_unique` (`ipb_address`(255),`ipb_user`,`ipb_auto`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkipblocks`
--

LOCK TABLES `wkipblocks` WRITE;
/*!40000 ALTER TABLE `wkipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkipblocks_restrictions`
--

DROP TABLE IF EXISTS `wkipblocks_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkipblocks_restrictions` (
  `ir_ipb_id` int(10) unsigned NOT NULL,
  `ir_type` tinyint(4) NOT NULL,
  `ir_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ir_ipb_id`,`ir_type`,`ir_value`),
  KEY `ir_type_value` (`ir_type`,`ir_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkipblocks_restrictions`
--

LOCK TABLES `wkipblocks_restrictions` WRITE;
/*!40000 ALTER TABLE `wkipblocks_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkipblocks_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkiwlinks`
--

DROP TABLE IF EXISTS `wkiwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkiwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(32) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkiwlinks`
--

LOCK TABLES `wkiwlinks` WRITE;
/*!40000 ALTER TABLE `wkiwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkiwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkjob`
--

DROP TABLE IF EXISTS `wkjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkjob` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_timestamp` binary(14) DEFAULT NULL,
  `job_params` mediumblob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT '0',
  `job_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` binary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkjob`
--

LOCK TABLES `wkjob` WRITE;
/*!40000 ALTER TABLE `wkjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkl10n_cache`
--

DROP TABLE IF EXISTS `wkl10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkl10n_cache` (
  `lc_lang` varbinary(35) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  PRIMARY KEY (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkl10n_cache`
--

LOCK TABLES `wkl10n_cache` WRITE;
/*!40000 ALTER TABLE `wkl10n_cache` DISABLE KEYS */;
INSERT INTO `wkl10n_cache` VALUES (_binary 'en',_binary 'messages:rev-suppressed-diff-view',_binary 's:203:\"One of the revisions of this diff has been <strong>suppressed</strong>.\nYou can view this diff; details can be found in the [{{fullurl:{{#Special:Log}}/suppress|page={{FULLPAGENAMEE}}}} suppression log].\";'),(_binary 'en',_binary 'messages:rev-suppressed-no-diff',_binary 's:92:\"You cannot view this diff because one of the revisions has been <strong>suppressed</strong>.\";'),(_binary 'en',_binary 'messages:rev-suppressed-text',_binary 's:56:\"This page revision has been <strong>suppressed</strong>.\";'),(_binary 'en',_binary 'messages:rev-suppressed-text-permission',_binary 's:149:\"This page revision has been <strong>suppressed</strong>.\nDetails can be found in the [{{fullurl:{{#Special:Log}}/suppress|page=$1}} suppression log].\";'),(_binary 'en',_binary 'messages:rev-suppressed-text-unhide',_binary 's:226:\"This page revision has been <strong>suppressed</strong>.\nDetails can be found in the [{{fullurl:{{#Special:Log}}/suppress|page={{FULLPAGENAMEE}}}} suppression log].\nYou can still [$1 view this revision] if you wish to proceed.\";'),(_binary 'en',_binary 'messages:rev-suppressed-text-view',_binary 's:166:\"This page revision has been <strong>suppressed</strong>.\nYou can view it; details can be found in the [{{fullurl:{{#Special:Log}}/suppress|page=$1}} suppression log].\";'),(_binary 'en',_binary 'messages:rev-suppressed-unhide-diff',_binary 's:237:\"One of the revisions of this diff has been <strong>suppressed</strong>.\nDetails can be found in the [{{fullurl:{{#Special:Log}}/suppress|page={{FULLPAGENAMEE}}}} suppression log].\nYou can still [$1 view this diff] if you wish to proceed.\";'),(_binary 'en',_binary 'messages:revdel-restore',_binary 's:17:\"change visibility\";'),(_binary 'en',_binary 'messages:revdelete-concurrent-change',_binary 's:151:\"Error modifying the item dated $2, $1: Its status appears to have been changed by someone else while you attempted to modify it.\nPlease check the logs.\";'),(_binary 'en',_binary 'messages:revdelete-confirm',_binary 's:168:\"Please confirm that you intend to do this, that you understand the consequences, and that you are doing this in accordance with [[{{MediaWiki:Policy-url}}|the policy]].\";'),(_binary 'en',_binary 'messages:revdelete-content-hid',_binary 's:14:\"content hidden\";'),(_binary 'en',_binary 'messages:revdelete-content-unhid',_binary 's:16:\"content unhidden\";'),(_binary 'en',_binary 'messages:revdelete-edit-reasonlist',_binary 's:19:\"Edit delete reasons\";'),(_binary 'en',_binary 'messages:revdelete-edit-reasonlist-suppress',_binary 's:21:\"Edit suppress reasons\";'),(_binary 'en',_binary 'messages:revdelete-failure',_binary 's:44:\"Revision visibility could not be updated:\n$1\";'),(_binary 'en',_binary 'messages:revdelete-hide-comment',_binary 's:12:\"Edit summary\";'),(_binary 'en',_binary 'messages:revdelete-hide-current',_binary 's:86:\"Error hiding the item dated $2, $1: This is the current revision.\nIt cannot be hidden.\";'),(_binary 'en',_binary 'messages:revdelete-hide-image',_binary 's:17:\"Hide file content\";'),(_binary 'en',_binary 'messages:revdelete-hide-name',_binary 's:26:\"Hide target and parameters\";'),(_binary 'en',_binary 'messages:revdelete-hide-restricted',_binary 's:51:\"Suppress data from administrators as well as others\";'),(_binary 'en',_binary 'messages:revdelete-hide-text',_binary 's:13:\"Revision text\";'),(_binary 'en',_binary 'messages:revdelete-hide-user',_binary 's:28:\"Editor\'s username/IP address\";'),(_binary 'en',_binary 'messages:revdelete-legend',_binary 's:27:\"Set visibility restrictions\";'),(_binary 'en',_binary 'messages:revdelete-log',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:revdelete-modify-missing',_binary 's:60:\"Error modifying item ID $1: It is missing from the database!\";'),(_binary 'en',_binary 'messages:revdelete-modify-no-access',_binary 's:108:\"Error modifying the item dated $2, $1: This item has been marked \"restricted\".\nYou do not have access to it.\";'),(_binary 'en',_binary 'messages:revdelete-no-change',_binary 's:94:\"<strong>Warning:</strong> The item dated $2, $1 already had the requested visibility settings.\";'),(_binary 'en',_binary 'messages:revdelete-no-file',_binary 's:34:\"The file specified does not exist.\";'),(_binary 'en',_binary 'messages:revdelete-nooldid-text',_binary 's:178:\"You have either not specified any target revision on which to perform this function, or the specified revision does not exist, or you are attempting to hide the current revision.\";'),(_binary 'en',_binary 'messages:revdelete-nooldid-title',_binary 's:23:\"Invalid target revision\";'),(_binary 'en',_binary 'messages:revdelete-offender',_binary 's:16:\"Revision author:\";'),(_binary 'en',_binary 'messages:revdelete-only-restricted',_binary 's:149:\"Error hiding the item dated $2, $1: You cannot suppress items from view by administrators without also selecting one of the other visibility options.\";'),(_binary 'en',_binary 'messages:revdelete-otherreason',_binary 's:24:\"Other/additional reason:\";'),(_binary 'en',_binary 'messages:revdelete-radio-same',_binary 's:15:\"(do not change)\";'),(_binary 'en',_binary 'messages:revdelete-radio-set',_binary 's:6:\"Hidden\";'),(_binary 'en',_binary 'messages:revdelete-radio-unset',_binary 's:7:\"Visible\";'),(_binary 'en',_binary 'messages:revdelete-reason-dropdown',_binary 's:132:\"*Common delete reasons\n** Copyright violation\n** Inappropriate comment\n** Inappropriate username\n** Potentially libelous information\";'),(_binary 'en',_binary 'messages:revdelete-reason-dropdown-suppress',_binary 's:62:\"*Common suppress reasons\n** Inappropriate personal information\";'),(_binary 'en',_binary 'messages:revdelete-reasonotherlist',_binary 's:12:\"Other reason\";'),(_binary 'en',_binary 'messages:revdelete-restricted',_binary 's:38:\"applied restrictions to administrators\";'),(_binary 'en',_binary 'messages:revdelete-selected-file',_binary 's:70:\"{{PLURAL:$1|Selected file version|Selected file versions}} of [[:$2]]:\";'),(_binary 'en',_binary 'messages:revdelete-selected-text',_binary 's:62:\"{{PLURAL:$1|Selected revision|Selected revisions}} of [[:$2]]:\";'),(_binary 'en',_binary 'messages:revdelete-show-file-confirm',_binary 's:97:\"Are you sure you want to view a deleted revision of the file \"<nowiki>$1</nowiki>\" from $2 at $3?\";'),(_binary 'en',_binary 'messages:revdelete-show-file-submit',_binary 's:3:\"Yes\";'),(_binary 'en',_binary 'messages:revdelete-show-no-access',_binary 's:106:\"Error showing the item dated $2, $1: This item has been marked \"restricted\".\nYou do not have access to it.\";'),(_binary 'en',_binary 'messages:revdelete-submit',_binary 's:50:\"Apply to selected {{PLURAL:$1|revision|revisions}}\";'),(_binary 'en',_binary 'messages:revdelete-success',_binary 's:28:\"Revision visibility updated.\";'),(_binary 'en',_binary 'messages:revdelete-summary-hid',_binary 's:19:\"edit summary hidden\";'),(_binary 'en',_binary 'messages:revdelete-summary-unhid',_binary 's:21:\"edit summary unhidden\";'),(_binary 'en',_binary 'messages:revdelete-suppress',_binary 's:51:\"Suppress data from administrators as well as others\";'),(_binary 'en',_binary 'messages:revdelete-suppress-text',_binary 's:233:\"Suppression should <strong>only</strong> be used for the following cases:\n* potentially libelous information\n* inappropriate personal information\n*: <em>home addresses and telephone numbers, national identification numbers, etc.</em>\";'),(_binary 'en',_binary 'messages:revdelete-text-file',_binary 's:123:\"Deleted file versions will still appear in the file history, but parts of their content will be inaccessible to the public.\";'),(_binary 'en',_binary 'messages:revdelete-text-others',_binary 's:128:\"Other administrators will still be able to access the hidden content and to undelete it, unless additional restrictions are set.\";'),(_binary 'en',_binary 'messages:revdelete-text-text',_binary 's:119:\"Deleted revisions will still appear in the page history, but parts of their content will be inaccessible to the public.\";'),(_binary 'en',_binary 'messages:revdelete-uname-hid',_binary 's:15:\"username hidden\";'),(_binary 'en',_binary 'messages:revdelete-uname-unhid',_binary 's:17:\"username unhidden\";'),(_binary 'en',_binary 'messages:revdelete-unrestricted',_binary 's:39:\"removed restrictions for administrators\";'),(_binary 'en',_binary 'messages:revdelete-unsuppress',_binary 's:42:\"Remove restrictions on undeleted revisions\";'),(_binary 'en',_binary 'messages:reverted',_binary 's:28:\"Reverted to earlier revision\";'),(_binary 'en',_binary 'messages:revertmerge',_binary 's:7:\"Unmerge\";'),(_binary 'en',_binary 'messages:revertmove',_binary 's:6:\"revert\";'),(_binary 'en',_binary 'messages:revertpage',_binary 's:108:\"Reverted edits by [[Special:Contributions/$2|$2]] ([[User talk:$2|talk]]) to last revision by [[User:$1|$1]]\";'),(_binary 'en',_binary 'messages:revertpage-anon',_binary 's:84:\"Reverted edits by [[Special:Contributions/$2|$2]] to last revision by [[User:$1|$1]]\";'),(_binary 'en',_binary 'messages:revertpage-nouser',_binary 's:80:\"Reverted edits by a hidden user to last revision by {{GENDER:$1|[[User:$1|$1]]}}\";'),(_binary 'en',_binary 'messages:revid',_binary 's:11:\"revision $1\";'),(_binary 'en',_binary 'messages:revision-info',_binary 's:39:\"Revision as of $1 by {{GENDER:$6|$2}}$7\";'),(_binary 'en',_binary 'messages:revision-info-current',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:revision-nav',_binary 's:65:\"($1) $2{{int:pipe-separator}}$3 ($4){{int:pipe-separator}}$5 ($6)\";'),(_binary 'en',_binary 'messages:revisionasof',_binary 's:17:\"Revision as of $1\";'),(_binary 'en',_binary 'messages:revisiondelete',_binary 's:25:\"Delete/undelete revisions\";'),(_binary 'en',_binary 'messages:rfcurl',_binary 's:33:\"https://tools.ietf.org/html/rfc$1\";'),(_binary 'en',_binary 'messages:right-apihighlimits',_binary 's:32:\"Use higher limits in API queries\";'),(_binary 'en',_binary 'messages:right-applychangetags',_binary 's:52:\"Apply [[Special:Tags|tags]] along with one\'s changes\";'),(_binary 'en',_binary 'messages:right-autoconfirmed',_binary 's:39:\"Not be affected by IP-based rate limits\";'),(_binary 'en',_binary 'messages:right-autocreateaccount',_binary 's:50:\"Automatically log in with an external user account\";'),(_binary 'en',_binary 'messages:right-autopatrol',_binary 's:54:\"Have one\'s own edits automatically marked as patrolled\";'),(_binary 'en',_binary 'messages:right-bigdelete',_binary 's:33:\"Delete pages with large histories\";'),(_binary 'en',_binary 'messages:right-block',_binary 's:30:\"Block other users from editing\";'),(_binary 'en',_binary 'messages:right-blockemail',_binary 's:31:\"Block a user from sending email\";'),(_binary 'en',_binary 'messages:right-bot',_binary 's:34:\"Be treated as an automated process\";'),(_binary 'en',_binary 'messages:right-browsearchive',_binary 's:20:\"Search deleted pages\";'),(_binary 'en',_binary 'messages:right-changetags',_binary 's:86:\"Add and remove arbitrary [[Special:Tags|tags]] on individual revisions and log entries\";'),(_binary 'en',_binary 'messages:right-createaccount',_binary 's:24:\"Create new user accounts\";'),(_binary 'en',_binary 'messages:right-createpage',_binary 's:45:\"Create pages (which are not discussion pages)\";'),(_binary 'en',_binary 'messages:right-createtalk',_binary 's:23:\"Create discussion pages\";'),(_binary 'en',_binary 'messages:right-delete',_binary 's:12:\"Delete pages\";'),(_binary 'en',_binary 'messages:right-delete-redirect',_binary 's:32:\"Delete single revision redirects\";'),(_binary 'en',_binary 'messages:right-deletechangetags',_binary 's:46:\"Delete [[Special:Tags|tags]] from the database\";'),(_binary 'en',_binary 'messages:right-deletedhistory',_binary 's:59:\"View deleted history entries, without their associated text\";'),(_binary 'en',_binary 'messages:right-deletedtext',_binary 's:55:\"View deleted text and changes between deleted revisions\";'),(_binary 'en',_binary 'messages:right-deletelogentry',_binary 's:40:\"Delete and undelete specific log entries\";'),(_binary 'en',_binary 'messages:right-deleterevision',_binary 's:47:\"Delete and undelete specific revisions of pages\";'),(_binary 'en',_binary 'messages:right-edit',_binary 's:10:\"Edit pages\";'),(_binary 'en',_binary 'messages:right-editcontentmodel',_binary 's:32:\"Edit the content model of a page\";'),(_binary 'en',_binary 'messages:right-editinterface',_binary 's:23:\"Edit the user interface\";'),(_binary 'en',_binary 'messages:right-editmyoptions',_binary 's:25:\"Edit your own preferences\";'),(_binary 'en',_binary 'messages:right-editmyprivateinfo',_binary 's:58:\"Edit your own private data (e.g. email address, real name)\";'),(_binary 'en',_binary 'messages:right-editmyusercss',_binary 's:28:\"Edit your own user CSS files\";'),(_binary 'en',_binary 'messages:right-editmyuserjs',_binary 's:35:\"Edit your own user JavaScript files\";'),(_binary 'en',_binary 'messages:right-editmyuserjson',_binary 's:29:\"Edit your own user JSON files\";'),(_binary 'en',_binary 'messages:right-editmyuserjsredirect',_binary 's:54:\"Edit your own user JavaScript files that are redirects\";'),(_binary 'en',_binary 'messages:right-editmywatchlist',_binary 's:93:\"Edit your own watchlist (note that some actions will still add pages even without this right)\";'),(_binary 'en',_binary 'messages:right-editprotected',_binary 's:53:\"Edit pages protected as \"{{int:protect-level-sysop}}\"\";'),(_binary 'en',_binary 'messages:right-editsemiprotected',_binary 's:61:\"Edit pages protected as \"{{int:protect-level-autoconfirmed}}\"\";'),(_binary 'en',_binary 'messages:right-editsitecss',_binary 's:17:\"Edit sitewide CSS\";'),(_binary 'en',_binary 'messages:right-editsitejs',_binary 's:24:\"Edit sitewide JavaScript\";'),(_binary 'en',_binary 'messages:right-editsitejson',_binary 's:18:\"Edit sitewide JSON\";'),(_binary 'en',_binary 'messages:right-editusercss',_binary 's:27:\"Edit other users\' CSS files\";'),(_binary 'en',_binary 'messages:right-edituserjs',_binary 's:34:\"Edit other users\' JavaScript files\";'),(_binary 'en',_binary 'messages:right-edituserjson',_binary 's:28:\"Edit other users\' JSON files\";'),(_binary 'en',_binary 'messages:right-hideuser',_binary 's:43:\"Block a username, hiding it from the public\";'),(_binary 'en',_binary 'messages:right-import',_binary 's:29:\"Import pages from other wikis\";'),(_binary 'en',_binary 'messages:right-importupload',_binary 's:31:\"Import pages from a file upload\";'),(_binary 'en',_binary 'messages:right-ipblock-exempt',_binary 's:46:\"Bypass IP blocks, auto-blocks and range blocks\";'),(_binary 'en',_binary 'messages:right-managechangetags',_binary 's:45:\"Create and (de)activate [[Special:Tags|tags]]\";'),(_binary 'en',_binary 'messages:right-markbotedits',_binary 's:35:\"Mark rolled-back edits as bot edits\";'),(_binary 'en',_binary 'messages:right-mergehistory',_binary 's:26:\"Merge the history of pages\";'),(_binary 'en',_binary 'messages:right-minoredit',_binary 's:19:\"Mark edits as minor\";'),(_binary 'en',_binary 'messages:right-move',_binary 's:10:\"Move pages\";'),(_binary 'en',_binary 'messages:right-move-categorypages',_binary 's:19:\"Move category pages\";'),(_binary 'en',_binary 'messages:right-move-rootuserpages',_binary 's:20:\"Move root user pages\";'),(_binary 'en',_binary 'messages:right-move-subpages',_binary 's:30:\"Move pages with their subpages\";'),(_binary 'en',_binary 'messages:right-movefile',_binary 's:10:\"Move files\";'),(_binary 'en',_binary 'messages:right-nominornewtalk',_binary 's:72:\"Not have minor edits to discussion pages trigger the new messages prompt\";'),(_binary 'en',_binary 'messages:right-noratelimit',_binary 's:30:\"Not be affected by rate limits\";'),(_binary 'en',_binary 'messages:right-override-export-depth',_binary 's:54:\"Export pages including linked pages up to a depth of 5\";'),(_binary 'en',_binary 'messages:right-pagelang',_binary 's:20:\"Change page language\";'),(_binary 'en',_binary 'messages:right-patrol',_binary 's:31:\"Mark others\' edits as patrolled\";'),(_binary 'en',_binary 'messages:right-patrolmarks',_binary 's:32:\"View recent changes patrol marks\";'),(_binary 'en',_binary 'messages:right-protect',_binary 's:59:\"Change protection settings and edit cascade-protected pages\";'),(_binary 'en',_binary 'messages:right-purge',_binary 's:26:\"Purge the cache for a page\";'),(_binary 'en',_binary 'messages:right-read',_binary 's:10:\"Read pages\";'),(_binary 'en',_binary 'messages:right-reupload',_binary 's:24:\"Overwrite existing files\";'),(_binary 'en',_binary 'messages:right-reupload-own',_binary 's:44:\"Overwrite existing files uploaded by oneself\";'),(_binary 'en',_binary 'messages:right-reupload-shared',_binary 's:53:\"Override files on the shared media repository locally\";'),(_binary 'en',_binary 'messages:right-rollback',_binary 's:72:\"Quickly rollback the edits of the last user who edited a particular page\";'),(_binary 'en',_binary 'messages:right-sendemail',_binary 's:25:\"Send email to other users\";'),(_binary 'en',_binary 'messages:right-siteadmin',_binary 's:28:\"Lock and unlock the database\";'),(_binary 'en',_binary 'messages:right-suppressionlog',_binary 's:17:\"View private logs\";'),(_binary 'en',_binary 'messages:right-suppressredirect',_binary 's:56:\"Not create redirects from source pages when moving pages\";'),(_binary 'en',_binary 'messages:right-suppressrevision',_binary 's:63:\"View, hide and unhide specific revisions of pages from any user\";'),(_binary 'en',_binary 'messages:right-unblockself',_binary 's:15:\"Unblock oneself\";'),(_binary 'en',_binary 'messages:right-undelete',_binary 's:15:\"Undelete a page\";'),(_binary 'en',_binary 'messages:right-unwatchedpages',_binary 's:30:\"View a list of unwatched pages\";'),(_binary 'en',_binary 'messages:right-upload',_binary 's:12:\"Upload files\";'),(_binary 'en',_binary 'messages:right-upload_by_url',_binary 's:23:\"Upload files from a URL\";'),(_binary 'en',_binary 'messages:right-userrights',_binary 's:20:\"Edit all user rights\";'),(_binary 'en',_binary 'messages:right-userrights-interwiki',_binary 's:40:\"Edit user rights of users on other wikis\";'),(_binary 'en',_binary 'messages:right-viewmyprivateinfo',_binary 's:58:\"View your own private data (e.g. email address, real name)\";'),(_binary 'en',_binary 'messages:right-viewmywatchlist',_binary 's:23:\"View your own watchlist\";'),(_binary 'en',_binary 'messages:right-viewsuppressed',_binary 's:35:\"View revisions hidden from any user\";'),(_binary 'en',_binary 'messages:right-writeapi',_binary 's:20:\"Use of the write API\";'),(_binary 'en',_binary 'messages:rightslog',_binary 's:15:\"User rights log\";'),(_binary 'en',_binary 'messages:rightslogentry',_binary 's:45:\"changed group membership for $1 from $2 to $3\";'),(_binary 'en',_binary 'messages:rightslogentry-autopromote',_binary 's:40:\"was automatically promoted from $2 to $3\";'),(_binary 'en',_binary 'messages:rightslogentry-temporary-group',_binary 's:24:\"$1 (temporary, until $2)\";'),(_binary 'en',_binary 'messages:rightslogtext',_binary 's:40:\"This is a log of changes to user rights.\";'),(_binary 'en',_binary 'messages:rightsnone',_binary 's:6:\"(none)\";'),(_binary 'en',_binary 'messages:rollback',_binary 's:15:\"Roll back edits\";'),(_binary 'en',_binary 'messages:rollback-confirmation-confirm',_binary 's:15:\"Please confirm:\";'),(_binary 'en',_binary 'messages:rollback-confirmation-no',_binary 's:6:\"Cancel\";'),(_binary 'en',_binary 'messages:rollback-confirmation-yes',_binary 's:8:\"Rollback\";'),(_binary 'en',_binary 'messages:rollback-missingparam',_binary 's:39:\"Missing required parameters on request.\";'),(_binary 'en',_binary 'messages:rollback-missingrevision',_binary 's:29:\"Unable to load revision data.\";'),(_binary 'en',_binary 'messages:rollback-success',_binary 's:86:\"Reverted edits by {{GENDER:$3|$1}};\nchanged back to last revision by {{GENDER:$4|$2}}.\";'),(_binary 'en',_binary 'messages:rollbackfailed',_binary 's:15:\"Rollback failed\";'),(_binary 'en',_binary 'messages:rollbacklink',_binary 's:8:\"rollback\";'),(_binary 'en',_binary 'messages:rollbacklinkcount',_binary 's:36:\"rollback $1 {{PLURAL:$1|edit|edits}}\";'),(_binary 'en',_binary 'messages:rollbacklinkcount-morethan',_binary 's:46:\"rollback more than $1 {{PLURAL:$1|edit|edits}}\";'),(_binary 'en',_binary 'messages:rotate-comment',_binary 's:58:\"Image rotated by $1 {{PLURAL:$1|degree|degrees}} clockwise\";'),(_binary 'en',_binary 'messages:sat',_binary 's:3:\"Sat\";'),(_binary 'en',_binary 'messages:saturday',_binary 's:8:\"Saturday\";'),(_binary 'en',_binary 'messages:saturday-at',_binary 's:14:\"Saturday at $1\";'),(_binary 'en',_binary 'messages:savearticle',_binary 's:9:\"Save page\";'),(_binary 'en',_binary 'messages:savearticle-start',_binary 's:12:\"Save page…\";'),(_binary 'en',_binary 'messages:savechanges',_binary 's:12:\"Save changes\";'),(_binary 'en',_binary 'messages:savechanges-start',_binary 's:15:\"Save changes…\";'),(_binary 'en',_binary 'messages:savedprefs',_binary 's:33:\"Your preferences have been saved.\";'),(_binary 'en',_binary 'messages:savedrights',_binary 's:52:\"The user groups of {{GENDER:$1|$1}} have been saved.\";'),(_binary 'en',_binary 'messages:savefile',_binary 's:9:\"Save file\";'),(_binary 'en',_binary 'messages:saveprefs',_binary 's:4:\"Save\";'),(_binary 'en',_binary 'messages:saveusergroups',_binary 's:30:\"Save {{GENDER:$1|user}} groups\";'),(_binary 'en',_binary 'messages:scarytranscludedisabled',_binary 's:36:\"[Interwiki transcluding is disabled]\";'),(_binary 'en',_binary 'messages:scarytranscludefailed',_binary 's:30:\"[Template fetch failed for $1]\";'),(_binary 'en',_binary 'messages:scarytranscludefailed-httpstatus',_binary 's:39:\"[Template fetch failed for $1: HTTP $2]\";'),(_binary 'en',_binary 'messages:scarytranscludetoolong',_binary 's:17:\"[URL is too long]\";'),(_binary 'en',_binary 'messages:search',_binary 's:6:\"Search\";'),(_binary 'en',_binary 'messages:search-category',_binary 's:13:\"(category $1)\";'),(_binary 'en',_binary 'messages:search-error',_binary 's:41:\"An error has occurred while searching: $1\";'),(_binary 'en',_binary 'messages:search-external',_binary 's:15:\"External search\";'),(_binary 'en',_binary 'messages:search-file-match',_binary 's:22:\"(matches file content)\";'),(_binary 'en',_binary 'messages:search-filter-title-prefix',_binary 's:52:\"Only searching in pages whose title starts with \"$1\"\";'),(_binary 'en',_binary 'messages:search-filter-title-prefix-reset',_binary 's:16:\"Search all pages\";'),(_binary 'en',_binary 'messages:search-ignored-headings',_binary 's:492:\" #<!-- leave this line exactly as it is --> <pre>\n# Headings that will be ignored by search.\n# Changes to this take effect as soon as the page with the heading is indexed.\n# You can force page reindexing by doing a null edit.\n# The syntax is as follows:\n#   * Everything from a \"#\" character to the end of the line is a comment.\n#   * Every non-blank line is the exact title to ignore, case and everything.\nReferences\nExternal links\nSee also\n #</pre> <!-- leave this line exactly as it is -->\";'),(_binary 'en',_binary 'messages:search-interwiki-custom',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:search-interwiki-more',_binary 's:6:\"(more)\";'),(_binary 'en',_binary 'messages:search-interwiki-more-results',_binary 's:12:\"more results\";'),(_binary 'en',_binary 'messages:search-interwiki-resultset-link',_binary 's:15:\"See all results\";'),(_binary 'en',_binary 'messages:search-invalid-sort-order',_binary 's:92:\"Sort order of $1 is unrecognized, default sorting will be applied. Valid sort orders are: $2\";'),(_binary 'en',_binary 'messages:search-match-redirect-help',_binary 's:90:\"Select to get redirected to a page when that page title matches what you have searched for\";'),(_binary 'en',_binary 'messages:search-match-redirect-label',_binary 's:40:\"Redirect to exact matches when searching\";'),(_binary 'en',_binary 'messages:search-nonefound',_binary 's:41:\"There were no results matching the query.\";'),(_binary 'en',_binary 'messages:search-nonefound-thiswiki',_binary 's:54:\"There were no results matching the query in this site.\";'),(_binary 'en',_binary 'messages:search-redirect',_binary 's:18:\"(redirect from $1)\";'),(_binary 'en',_binary 'messages:search-relatedarticle',_binary 's:7:\"Related\";'),(_binary 'en',_binary 'messages:search-result-category-size',_binary 's:111:\"{{PLURAL:$1|1 member|$1 members}} ({{PLURAL:$2|1 subcategory|$2 subcategories}}, {{PLURAL:$3|1 file|$3 files}})\";'),(_binary 'en',_binary 'messages:search-result-size',_binary 's:34:\"$1 ({{PLURAL:$2|1 word|$2 words}})\";'),(_binary 'en',_binary 'messages:search-rewritten',_binary 's:48:\"Showing results for $1. No results found for $2.\";'),(_binary 'en',_binary 'messages:search-section',_binary 's:12:\"(section $1)\";'),(_binary 'en',_binary 'messages:search-showingresults',_binary 's:121:\"{{PLURAL:$4|Result <strong>$1</strong> of <strong>$3</strong>|Results <strong>$1 – $2</strong> of <strong>$3</strong>}}\";'),(_binary 'en',_binary 'messages:search-suggest',_binary 's:16:\"Did you mean: $1\";'),(_binary 'en',_binary 'messages:search-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:search-unknown-profile',_binary 's:77:\"Search profile of $1 is unrecognized, default search profile will be applied.\";'),(_binary 'en',_binary 'messages:search-warning',_binary 's:42:\"A warning has occurred while searching: $1\";'),(_binary 'en',_binary 'messages:searchall',_binary 's:3:\"all\";'),(_binary 'en',_binary 'messages:searcharticle',_binary 's:2:\"Go\";'),(_binary 'en',_binary 'messages:searchbutton',_binary 's:6:\"Search\";'),(_binary 'en',_binary 'messages:searchdisabled',_binary 's:143:\"{{SITENAME}} search is disabled.\nYou can search via Google in the meantime.\nNote that their indexes of {{SITENAME}} content may be out of date.\";'),(_binary 'en',_binary 'messages:searchlimit-help',_binary 's:18:\"Maximum number: $1\";'),(_binary 'en',_binary 'messages:searchlimit-label',_binary 's:46:\"Number of search results to show on each page:\";'),(_binary 'en',_binary 'messages:searchmenu-exists',_binary 's:106:\"There is a page named \"[[:$1]]\" on {{SITENAME}}. {{PLURAL:$2|0=|See also the other search results found.}}\";'),(_binary 'en',_binary 'messages:searchmenu-new',_binary 's:133:\"Create the page \"[[:$1]]\" on this wiki! {{PLURAL:$2|0=|See also the page found with your search.|See also the search results found.}}\";'),(_binary 'en',_binary 'messages:searchmenu-new-nocreate',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:searchprofile-advanced',_binary 's:8:\"Advanced\";'),(_binary 'en',_binary 'messages:searchprofile-advanced-tooltip',_binary 's:27:\"Search in custom namespaces\";'),(_binary 'en',_binary 'messages:searchprofile-articles',_binary 's:13:\"Content pages\";'),(_binary 'en',_binary 'messages:searchprofile-articles-tooltip',_binary 's:12:\"Search in $1\";'),(_binary 'en',_binary 'messages:searchprofile-everything',_binary 's:10:\"Everything\";'),(_binary 'en',_binary 'messages:searchprofile-everything-tooltip',_binary 's:44:\"Search all of content (including talk pages)\";'),(_binary 'en',_binary 'messages:searchprofile-images',_binary 's:10:\"Multimedia\";'),(_binary 'en',_binary 'messages:searchprofile-images-tooltip',_binary 's:16:\"Search for files\";'),(_binary 'en',_binary 'messages:searchrelated',_binary 's:7:\"related\";'),(_binary 'en',_binary 'messages:searchresults',_binary 's:14:\"Search results\";'),(_binary 'en',_binary 'messages:searchresults-title',_binary 's:23:\"Search results for \"$1\"\";'),(_binary 'en',_binary 'messages:searchresultshead',_binary 's:6:\"Search\";'),(_binary 'en',_binary 'messages:searchsuggest-containing',_binary 's:27:\"Search for pages containing\";'),(_binary 'en',_binary 'messages:searchsuggest-search',_binary 's:19:\"Search {{SITENAME}}\";'),(_binary 'en',_binary 'messages:seconds',_binary 's:34:\"{{PLURAL:$1|$1 second|$1 seconds}}\";'),(_binary 'en',_binary 'messages:seconds-abbrev',_binary 's:4:\"$1 s\";'),(_binary 'en',_binary 'messages:seconds-ago',_binary 's:35:\"$1 {{PLURAL:$1|second|seconds}} ago\";'),(_binary 'en',_binary 'messages:sectioneditnotsupported-text',_binary 's:75:\"Section editing is not supported in this page or is disabled for this view.\";'),(_binary 'en',_binary 'messages:sectioneditnotsupported-title',_binary 's:29:\"Section editing not supported\";'),(_binary 'en',_binary 'messages:selfmove',_binary 's:54:\"The title is the same;\ncannot move a page over itself.\";'),(_binary 'en',_binary 'messages:selfredirect',_binary 's:224:\"<strong>Warning:</strong> You are redirecting this page to itself.\nYou may have specified the wrong target for the redirect, or you may be editing the wrong page.\nIf you click \"$1\" again, the redirect will be created anyway.\";'),(_binary 'en',_binary 'messages:semicolon-separator',_binary 's:6:\";&#32;\";'),(_binary 'en',_binary 'messages:semiprotectedpagemovewarning',_binary 's:151:\"<strong>Note:</strong> This page has been protected so that only autoconfirmed users can move it.\nThe latest log entry is provided below for reference:\";'),(_binary 'en',_binary 'messages:semiprotectedpagewarning',_binary 's:151:\"<strong>Note:</strong> This page has been protected so that only autoconfirmed users can edit it.\nThe latest log entry is provided below for reference:\";'),(_binary 'en',_binary 'messages:sep',_binary 's:3:\"Sep\";'),(_binary 'en',_binary 'messages:september',_binary 's:9:\"September\";'),(_binary 'en',_binary 'messages:september-gen',_binary 's:9:\"September\";'),(_binary 'en',_binary 'messages:servertime',_binary 's:12:\"Server time:\";'),(_binary 'en',_binary 'messages:session_fail_preview',_binary 's:321:\"Sorry! We could not process your edit due to a loss of session data.\n\nYou might have been logged out. <strong>Please verify that you\'re still logged in and try again</strong>.\nIf it still does not work, try [[Special:UserLogout|logging out]] and logging back in, and check that your browser allows cookies from this site.\";'),(_binary 'en',_binary 'messages:session_fail_preview_html',_binary 's:407:\"Sorry! We could not process your edit due to a loss of session data.\n\n<em>Because {{SITENAME}} has raw HTML enabled, the preview is hidden as a precaution against JavaScript attacks.</em>\n\n<strong>If this is a legitimate edit attempt, please try again.</strong>\nIf it still does not work, try [[Special:UserLogout|logging out]] and logging back in, and check that your browser allows cookies from this site.\";'),(_binary 'en',_binary 'messages:sessionfailure',_binary 's:151:\"There seems to be a problem with your login session;\nthis action has been canceled as a precaution against session hijacking.\nPlease resubmit the form.\";'),(_binary 'en',_binary 'messages:sessionfailure-title',_binary 's:15:\"Session failure\";'),(_binary 'en',_binary 'messages:sessionmanager-tie',_binary 's:57:\"Cannot combine multiple request authentication types: $1.\";'),(_binary 'en',_binary 'messages:sessionprovider-generic',_binary 's:11:\"$1 sessions\";'),(_binary 'en',_binary 'messages:sessionprovider-mediawiki-session-cookiesessionprovider',_binary 's:21:\"cookie-based sessions\";'),(_binary 'en',_binary 'messages:sessionprovider-nocookies',_binary 's:73:\"Cookies may be disabled. Ensure you have cookies enabled and start again.\";'),(_binary 'en',_binary 'messages:shared-repo',_binary 's:19:\"a shared repository\";'),(_binary 'en',_binary 'messages:shared-repo-from',_binary 's:7:\"from $1\";'),(_binary 'en',_binary 'messages:shared-repo-name-wikimediacommons',_binary 's:17:\"Wikimedia Commons\";'),(_binary 'en',_binary 'messages:shareddescriptionfollows',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:sharedupload',_binary 's:55:\"This file is from $1 and may be used by other projects.\";'),(_binary 'en',_binary 'messages:sharedupload-desc-create',_binary 's:135:\"This file is from $1 and may be used by other projects.\nMaybe you want to edit the description on its [$2 file description page] there.\";'),(_binary 'en',_binary 'messages:sharedupload-desc-edit',_binary 's:135:\"This file is from $1 and may be used by other projects.\nMaybe you want to edit the description on its [$2 file description page] there.\";'),(_binary 'en',_binary 'messages:sharedupload-desc-here',_binary 's:127:\"This file is from $1 and may be used by other projects.\nThe description on its [$2 file description page] there is shown below.\";'),(_binary 'en',_binary 'messages:sharedupload-desc-there',_binary 's:122:\"This file is from $1 and may be used by other projects.\nPlease see the [$2 file description page] for further information.\";'),(_binary 'en',_binary 'messages:shortpages',_binary 's:11:\"Short pages\";'),(_binary 'en',_binary 'messages:shortpages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:show',_binary 's:4:\"Show\";'),(_binary 'en',_binary 'messages:show-big-image',_binary 's:13:\"Original file\";'),(_binary 'en',_binary 'messages:show-big-image-other',_binary 's:47:\"Other {{PLURAL:$2|resolution|resolutions}}: $1.\";'),(_binary 'en',_binary 'messages:show-big-image-preview',_binary 's:25:\"Size of this preview: $1.\";'),(_binary 'en',_binary 'messages:show-big-image-preview-differ',_binary 's:44:\"Size of this $3 preview of this $2 file: $1.\";'),(_binary 'en',_binary 'messages:show-big-image-size',_binary 's:15:\"$1 × $2 pixels\";'),(_binary 'en',_binary 'messages:showdiff',_binary 's:12:\"Show changes\";'),(_binary 'en',_binary 'messages:showhideselectedlogentries',_binary 's:41:\"Change visibility of selected log entries\";'),(_binary 'en',_binary 'messages:showhideselectedversions',_binary 's:39:\"Change visibility of selected revisions\";'),(_binary 'en',_binary 'messages:showingresults',_binary 's:123:\"Showing below up to {{PLURAL:$1|<strong>1</strong> result|<strong>$1</strong> results}} starting with #<strong>$2</strong>.\";'),(_binary 'en',_binary 'messages:showingresultsinrange',_binary 's:142:\"Showing below up to {{PLURAL:$1|<strong>1</strong> result|<strong>$1</strong> results}} in range #<strong>$2</strong> to #<strong>$3</strong>.\";'),(_binary 'en',_binary 'messages:shown-title',_binary 's:45:\"Show $1 {{PLURAL:$1|result|results}} per page\";'),(_binary 'en',_binary 'messages:showpreview',_binary 's:12:\"Show preview\";'),(_binary 'en',_binary 'messages:showtoc',_binary 's:4:\"show\";'),(_binary 'en',_binary 'messages:sidebar',_binary 's:168:\"\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* SEARCH\n* TOOLBOX\n* LANGUAGES\";'),(_binary 'en',_binary 'messages:sig-text',_binary 's:4:\"--$1\";'),(_binary 'en',_binary 'messages:signature',_binary 's:52:\"[[{{ns:user}}:$1|$2]] ([[{{ns:user_talk}}:$1|talk]])\";'),(_binary 'en',_binary 'messages:signature-anon',_binary 's:36:\"[[{{#special:Contributions}}/$1|$2]]\";'),(_binary 'en',_binary 'messages:signature-temp',_binary 's:67:\"[[{{#special:Contributions}}/$1|$2]] ([[{{ns:user_talk}}:$1|talk]])\";'),(_binary 'en',_binary 'messages:signupend',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:signupend-https',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:signupstart',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:simpleantispam-label',_binary 's:54:\"Anti-spam check.\nDo <strong>not</strong> fill this in!\";'),(_binary 'en',_binary 'messages:site-atom-feed',_binary 's:12:\"$1 Atom feed\";'),(_binary 'en',_binary 'messages:site-rss-feed',_binary 's:11:\"$1 RSS feed\";'),(_binary 'en',_binary 'messages:sitecsspreview',_binary 's:95:\"<strong>Remember that you are only previewing this CSS.\nIt has not yet been published!</strong>\";'),(_binary 'en',_binary 'messages:sitecssprotected',_binary 's:84:\"You do not have permission to edit this CSS page because it may affect all visitors.\";'),(_binary 'en',_binary 'messages:sitejsonpreview',_binary 's:103:\"<strong>Remember that you are only previewing this JSON config.\nIt has not yet been published!</strong>\";'),(_binary 'en',_binary 'messages:sitejsonprotected',_binary 's:85:\"You do not have permission to edit this JSON page because it may affect all visitors.\";'),(_binary 'en',_binary 'messages:sitejspreview',_binary 's:107:\"<strong>Remember that you are only previewing this JavaScript code.\nIt has not yet been published!</strong>\";'),(_binary 'en',_binary 'messages:sitejsprotected',_binary 's:91:\"You do not have permission to edit this JavaScript page because it may affect all visitors.\";'),(_binary 'en',_binary 'messages:sitenotice',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:siterawhtmlprotected',_binary 's:119:\"You do not have permission to edit this page because it contains raw HTML which can be modified to affect all visitors.\";'),(_binary 'en',_binary 'messages:sitesubtitle',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:sitetitle',_binary 's:12:\"{{SITENAME}}\";'),(_binary 'en',_binary 'messages:siteuser',_binary 's:20:\"{{SITENAME}} user $1\";'),(_binary 'en',_binary 'messages:siteusers',_binary 's:54:\"{{SITENAME}} {{PLURAL:$2|{{GENDER:$1|user}}|users}} $1\";'),(_binary 'en',_binary 'messages:size-bytes',_binary 's:27:\"$1 {{PLURAL:$1|byte|bytes}}\";'),(_binary 'en',_binary 'messages:size-exabytes',_binary 's:5:\"$1 EB\";'),(_binary 'en',_binary 'messages:size-exapixel',_binary 's:5:\"$1 EP\";'),(_binary 'en',_binary 'messages:size-gigabytes',_binary 's:5:\"$1 GB\";'),(_binary 'en',_binary 'messages:size-gigapixel',_binary 's:5:\"$1 GP\";'),(_binary 'en',_binary 'messages:size-kilobytes',_binary 's:5:\"$1 KB\";'),(_binary 'en',_binary 'messages:size-kilopixel',_binary 's:5:\"$1 KP\";'),(_binary 'en',_binary 'messages:size-megabytes',_binary 's:5:\"$1 MB\";'),(_binary 'en',_binary 'messages:size-megapixel',_binary 's:5:\"$1 MP\";'),(_binary 'en',_binary 'messages:size-petabytes',_binary 's:5:\"$1 PB\";'),(_binary 'en',_binary 'messages:size-petapixel',_binary 's:5:\"$1 PP\";'),(_binary 'en',_binary 'messages:size-pixel',_binary 's:29:\"$1 {{PLURAL:$1|pixel|pixels}}\";'),(_binary 'en',_binary 'messages:size-quettabytes',_binary 's:5:\"$1 QB\";'),(_binary 'en',_binary 'messages:size-quettapixel',_binary 's:5:\"$1 QP\";'),(_binary 'en',_binary 'messages:size-ronnabytes',_binary 's:5:\"$1 RB\";'),(_binary 'en',_binary 'messages:size-ronnapixel',_binary 's:5:\"$1 RP\";'),(_binary 'en',_binary 'messages:size-terabytes',_binary 's:5:\"$1 TB\";'),(_binary 'en',_binary 'messages:size-terapixel',_binary 's:5:\"$1 TP\";'),(_binary 'en',_binary 'messages:size-yottabytes',_binary 's:5:\"$1 YB\";'),(_binary 'en',_binary 'messages:size-yottapixel',_binary 's:5:\"$1 YP\";'),(_binary 'en',_binary 'messages:size-zettabytes',_binary 's:5:\"$1 ZB\";'),(_binary 'en',_binary 'messages:size-zettapixel',_binary 's:5:\"$1 ZP\";'),(_binary 'en',_binary 'messages:skin-action-addsection',_binary 's:9:\"Add topic\";'),(_binary 'en',_binary 'messages:skin-action-delete',_binary 's:6:\"Delete\";'),(_binary 'en',_binary 'messages:skin-action-move',_binary 's:4:\"Move\";'),(_binary 'en',_binary 'messages:skin-action-protect',_binary 's:7:\"Protect\";'),(_binary 'en',_binary 'messages:skin-action-undelete',_binary 's:8:\"Undelete\";'),(_binary 'en',_binary 'messages:skin-action-unprotect',_binary 's:17:\"Change protection\";'),(_binary 'en',_binary 'messages:skin-action-viewdeleted',_binary 's:8:\"View $1?\";'),(_binary 'en',_binary 'messages:skin-action-viewsource',_binary 's:11:\"View source\";'),(_binary 'en',_binary 'messages:skin-minerva-issue-learn-more',_binary 's:10:\"Learn more\";'),(_binary 'en',_binary 'messages:skin-minerva-mobile-option-MinervaPageIssuesNewTreatment',_binary 's:30:\"Improved page issues treatment\";'),(_binary 'en',_binary 'messages:skin-minerva-mobile-option-MinervaPageIssuesNewTreatment-description',_binary 's:60:\"Page issues (Template:ambox) will be inlined in the article.\";'),(_binary 'en',_binary 'messages:skin-minerva-mobile-option-MinervaShowCategories',_binary 's:10:\"Categories\";'),(_binary 'en',_binary 'messages:skin-minerva-mobile-option-MinervaShowCategories-description',_binary 's:24:\"View categories of pages\";'),(_binary 'en',_binary 'messages:skin-minerva-recentchanges-warning-enhanced-not-supported',_binary 's:149:\"Unfortunately, grouping results by page is not available on mobile. If you would like to use the group by page feature please visit the desktop site.\";'),(_binary 'en',_binary 'messages:skin-preview',_binary 's:7:\"Preview\";'),(_binary 'en',_binary 'messages:skin-view-create',_binary 's:6:\"Create\";'),(_binary 'en',_binary 'messages:skin-view-create-local',_binary 's:21:\"Add local description\";'),(_binary 'en',_binary 'messages:skin-view-edit',_binary 's:4:\"Edit\";'),(_binary 'en',_binary 'messages:skin-view-edit-local',_binary 's:22:\"Edit local description\";'),(_binary 'en',_binary 'messages:skin-view-foreign',_binary 's:10:\"View on $1\";'),(_binary 'en',_binary 'messages:skin-view-history',_binary 's:12:\"View history\";'),(_binary 'en',_binary 'messages:skin-view-view',_binary 's:4:\"Read\";'),(_binary 'en',_binary 'messages:skinname-minerva',_binary 's:11:\"MinervaNeue\";'),(_binary 'en',_binary 'messages:skinname-monobook',_binary 's:8:\"MonoBook\";'),(_binary 'en',_binary 'messages:skinname-timeless',_binary 's:8:\"Timeless\";'),(_binary 'en',_binary 'messages:skinname-vector',_binary 's:20:\"Vector legacy (2010)\";'),(_binary 'en',_binary 'messages:skinname-vector-2022',_binary 's:13:\"Vector (2022)\";'),(_binary 'en',_binary 'messages:slot-name-main',_binary 's:4:\"Main\";'),(_binary 'en',_binary 'messages:softblockrangesreason',_binary 's:81:\"Anonymous contributions are not allowed from your IP address ($1). Please log in.\";'),(_binary 'en',_binary 'messages:sorbs',_binary 's:5:\"DNSBL\";'),(_binary 'en',_binary 'messages:sorbs_create_account_reason',_binary 's:107:\"Your IP address is listed as an open proxy in the DNSBL used by {{SITENAME}}.\nYou cannot create an account.\";'),(_binary 'en',_binary 'messages:sorbsreason',_binary 's:77:\"Your IP address is listed as an open proxy in the DNSBL used by {{SITENAME}}.\";'),(_binary 'en',_binary 'messages:sort-ascending',_binary 's:14:\"Sort ascending\";'),(_binary 'en',_binary 'messages:sort-descending',_binary 's:15:\"Sort descending\";'),(_binary 'en',_binary 'messages:sort-initial',_binary 's:12:\"Sort initial\";'),(_binary 'en',_binary 'messages:sort-rowspan-error',_binary 's:139:\"This page contains a table with a rowspan attribute that spans more rows than the table actually has. You can fix this by editing the page.\";'),(_binary 'en',_binary 'messages:sourcefilename',_binary 's:16:\"Source filename:\";'),(_binary 'en',_binary 'messages:sourceurl',_binary 's:11:\"Source URL:\";'),(_binary 'en',_binary 'messages:sp-contributions-blocked-notice',_binary 's:105:\"This {{GENDER:$1|user}} is currently blocked.\nThe latest block log entry is provided below for reference:\";'),(_binary 'en',_binary 'messages:sp-contributions-blocked-notice-anon',_binary 's:97:\"This IP address is currently blocked.\nThe latest block log entry is provided below for reference:\";'),(_binary 'en',_binary 'messages:sp-contributions-blocked-notice-anon-partial',_binary 's:107:\"This IP address is currently partially blocked.\nThe latest block log entry is provided below for reference:\";'),(_binary 'en',_binary 'messages:sp-contributions-blocked-notice-partial',_binary 's:101:\"This user is currently partially blocked.\nThe latest block log entry is provided below for reference:\";'),(_binary 'en',_binary 'messages:sp-contributions-blocklog',_binary 's:9:\"block log\";'),(_binary 'en',_binary 'messages:sp-contributions-concurrency-ip',_binary 's:85:\"Sorry, too many requests are being made from your IP address. Please try again later.\";'),(_binary 'en',_binary 'messages:sp-contributions-concurrency-user',_binary 's:87:\"Sorry, too many requests are being made from your user account. Please try again later.\";'),(_binary 'en',_binary 'messages:sp-contributions-deleted',_binary 's:40:\"deleted {{GENDER:$1|user}} contributions\";'),(_binary 'en',_binary 'messages:sp-contributions-explain',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:sp-contributions-footer',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:sp-contributions-footer-anon',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:sp-contributions-footer-anon-range',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:sp-contributions-hideminor',_binary 's:16:\"Hide minor edits\";'),(_binary 'en',_binary 'messages:sp-contributions-logs',_binary 's:4:\"logs\";'),(_binary 'en',_binary 'messages:sp-contributions-newonly',_binary 's:39:\"Only show edits that are page creations\";'),(_binary 'en',_binary 'messages:sp-contributions-outofrange',_binary 's:88:\"Unable to show any results. The requested IP range is larger than the CIDR limit of /$1.\";'),(_binary 'en',_binary 'messages:sp-contributions-search',_binary 's:24:\"Search for contributions\";'),(_binary 'en',_binary 'messages:sp-contributions-submit',_binary 's:6:\"Search\";'),(_binary 'en',_binary 'messages:sp-contributions-suppresslog',_binary 's:43:\"suppressed {{GENDER:$1|user}} contributions\";'),(_binary 'en',_binary 'messages:sp-contributions-talk',_binary 's:4:\"talk\";'),(_binary 'en',_binary 'messages:sp-contributions-toponly',_binary 's:41:\"Only show edits that are latest revisions\";'),(_binary 'en',_binary 'messages:sp-contributions-uploads',_binary 's:7:\"uploads\";'),(_binary 'en',_binary 'messages:sp-contributions-username',_binary 's:23:\"IP address or username:\";'),(_binary 'en',_binary 'messages:sp-contributions-userrights',_binary 's:36:\"{{GENDER:$1|user}} rights management\";'),(_binary 'en',_binary 'messages:sp-deletedcontributions-contribs',_binary 's:13:\"contributions\";'),(_binary 'en',_binary 'messages:sp-newimages-showfrom',_binary 's:35:\"Show new files starting from $2, $1\";'),(_binary 'en',_binary 'messages:spam_blanking',_binary 's:45:\"All revisions contained links to $1, blanking\";'),(_binary 'en',_binary 'messages:spam_deleting',_binary 's:45:\"All revisions contained links to $1, deleting\";'),(_binary 'en',_binary 'messages:spam_reverting',_binary 's:53:\"Reverting to last revision not containing links to $1\";'),(_binary 'en',_binary 'messages:spambot_username',_binary 's:22:\"MediaWiki spam cleanup\";'),(_binary 'en',_binary 'messages:spamprotectionmatch',_binary 's:56:\"The following text is what triggered our spam filter: $1\";'),(_binary 'en',_binary 'messages:spamprotectiontext',_binary 's:126:\"The text you wanted to publish was blocked by the spam filter.\nThis is probably caused by a link to a forbidden external site.\";'),(_binary 'en',_binary 'messages:spamprotectiontitle',_binary 's:22:\"Spam protection filter\";'),(_binary 'en',_binary 'messages:special-characters-group-arabic',_binary 's:6:\"Arabic\";'),(_binary 'en',_binary 'messages:special-characters-group-arabicextended',_binary 's:15:\"Arabic extended\";'),(_binary 'en',_binary 'messages:special-characters-group-bangla',_binary 's:6:\"Bangla\";'),(_binary 'en',_binary 'messages:special-characters-group-canadianaboriginal',_binary 's:19:\"Canadian Aboriginal\";'),(_binary 'en',_binary 'messages:special-characters-group-cyrillic',_binary 's:8:\"Cyrillic\";'),(_binary 'en',_binary 'messages:special-characters-group-devanagari',_binary 's:10:\"Devanagari\";'),(_binary 'en',_binary 'messages:special-characters-group-greek',_binary 's:5:\"Greek\";'),(_binary 'en',_binary 'messages:special-characters-group-greekextended',_binary 's:14:\"Greek extended\";'),(_binary 'en',_binary 'messages:special-characters-group-gujarati',_binary 's:8:\"Gujarati\";'),(_binary 'en',_binary 'messages:special-characters-group-hebrew',_binary 's:6:\"Hebrew\";'),(_binary 'en',_binary 'messages:special-characters-group-ipa',_binary 's:3:\"IPA\";'),(_binary 'en',_binary 'messages:special-characters-group-khmer',_binary 's:5:\"Khmer\";'),(_binary 'en',_binary 'messages:special-characters-group-lao',_binary 's:3:\"Lao\";'),(_binary 'en',_binary 'messages:special-characters-group-latin',_binary 's:5:\"Latin\";'),(_binary 'en',_binary 'messages:special-characters-group-latinextended',_binary 's:14:\"Latin extended\";'),(_binary 'en',_binary 'messages:special-characters-group-persian',_binary 's:7:\"Persian\";'),(_binary 'en',_binary 'messages:special-characters-group-runes',_binary 's:5:\"Runes\";'),(_binary 'en',_binary 'messages:special-characters-group-sinhala',_binary 's:7:\"Sinhala\";'),(_binary 'en',_binary 'messages:special-characters-group-symbols',_binary 's:7:\"Symbols\";'),(_binary 'en',_binary 'messages:special-characters-group-tamil',_binary 's:5:\"Tamil\";'),(_binary 'en',_binary 'messages:special-characters-group-telugu',_binary 's:6:\"Telugu\";'),(_binary 'en',_binary 'messages:special-characters-group-thai',_binary 's:4:\"Thai\";'),(_binary 'en',_binary 'messages:special-characters-title-emdash',_binary 's:7:\"em dash\";'),(_binary 'en',_binary 'messages:special-characters-title-endash',_binary 's:7:\"en dash\";'),(_binary 'en',_binary 'messages:special-characters-title-minus',_binary 's:10:\"minus sign\";'),(_binary 'en',_binary 'messages:specialdeletepage-page',_binary 's:11:\"Target page\";'),(_binary 'en',_binary 'messages:specialdeletepage-submit',_binary 's:10:\"Go to page\";'),(_binary 'en',_binary 'messages:specialeditpage-page',_binary 's:11:\"Target page\";'),(_binary 'en',_binary 'messages:specialeditpage-submit',_binary 's:10:\"Go to page\";'),(_binary 'en',_binary 'messages:speciallogtitlelabel',_binary 's:48:\"Target (title or {{ns:user}}:username for user):\";'),(_binary 'en',_binary 'messages:specialloguserlabel',_binary 's:10:\"Performer:\";'),(_binary 'en',_binary 'messages:specialmute',_binary 's:4:\"Mute\";'),(_binary 'en',_binary 'messages:specialmute-email-footer',_binary 's:67:\"To manage email preferences for user {{BIDI:$2}} please visit <$1>.\";'),(_binary 'en',_binary 'messages:specialmute-error-invalid-user',_binary 's:42:\"The username requested could not be found.\";'),(_binary 'en',_binary 'messages:specialmute-error-no-options',_binary 's:189:\"Mute features are unavailable. This might be because you haven\'t confirmed your email address, or because the wiki administrator has disabled email features or email mutelist for this wiki.\";'),(_binary 'en',_binary 'messages:specialmute-header',_binary 's:76:\"Please select your mute preferences for user <b>{{BIDI:[[User:$1|$1]]}}</b>.\";'),(_binary 'en',_binary 'messages:specialmute-label-mute-email',_binary 's:40:\"Mute emails from this {{GENDER:$1|user}}\";'),(_binary 'en',_binary 'messages:specialmute-login-required',_binary 's:46:\"Please log in to change your mute preferences.\";'),(_binary 'en',_binary 'messages:specialmute-submit',_binary 's:7:\"Confirm\";'),(_binary 'en',_binary 'messages:specialmute-success',_binary 's:105:\"Your mute preferences have been updated. See all muted users in [[Special:Preferences|your preferences]].\";'),(_binary 'en',_binary 'messages:specialpage',_binary 's:12:\"Special page\";'),(_binary 'en',_binary 'messages:specialpage-empty',_binary 's:37:\"There are no results for this report.\";'),(_binary 'en',_binary 'messages:specialpage-securitylevel-not-allowed',_binary 's:88:\"Sorry, you are not allowed to use this page because your identity could not be verified.\";'),(_binary 'en',_binary 'messages:specialpage-securitylevel-not-allowed-title',_binary 's:11:\"Not allowed\";'),(_binary 'en',_binary 'messages:specialpagehistory-page',_binary 's:11:\"Target page\";'),(_binary 'en',_binary 'messages:specialpagehistory-submit',_binary 's:10:\"Go to page\";'),(_binary 'en',_binary 'messages:specialpageinfo-page',_binary 's:11:\"Target page\";'),(_binary 'en',_binary 'messages:specialpageinfo-submit',_binary 's:10:\"Go to page\";'),(_binary 'en',_binary 'messages:specialpages',_binary 's:13:\"Special pages\";'),(_binary 'en',_binary 'messages:specialpages-group-changes',_binary 's:23:\"Recent changes and logs\";'),(_binary 'en',_binary 'messages:specialpages-group-developer',_binary 's:15:\"Developer tools\";'),(_binary 'en',_binary 'messages:specialpages-group-highuse',_binary 's:14:\"High use pages\";'),(_binary 'en',_binary 'messages:specialpages-group-login',_binary 's:22:\"Login / create account\";'),(_binary 'en',_binary 'messages:specialpages-group-maintenance',_binary 's:19:\"Maintenance reports\";'),(_binary 'en',_binary 'messages:specialpages-group-media',_binary 's:25:\"Media reports and uploads\";'),(_binary 'en',_binary 'messages:specialpages-group-other',_binary 's:19:\"Other special pages\";'),(_binary 'en',_binary 'messages:specialpages-group-pages',_binary 's:14:\"Lists of pages\";'),(_binary 'en',_binary 'messages:specialpages-group-pagetools',_binary 's:10:\"Page tools\";'),(_binary 'en',_binary 'messages:specialpages-group-redirects',_binary 's:25:\"Redirecting special pages\";'),(_binary 'en',_binary 'messages:specialpages-group-spam',_binary 's:10:\"Spam tools\";'),(_binary 'en',_binary 'messages:specialpages-group-users',_binary 's:16:\"Users and rights\";'),(_binary 'en',_binary 'messages:specialpages-group-wiki',_binary 's:14:\"Data and tools\";'),(_binary 'en',_binary 'messages:specialpages-note-cached',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:specialpages-note-restricted',_binary 's:97:\"* Normal special pages.\n* <span class=\"mw-specialpagerestricted\">Restricted special pages.</span>\";'),(_binary 'en',_binary 'messages:specialpages-note-top',_binary 's:6:\"Legend\";'),(_binary 'en',_binary 'messages:specialpages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:specialprotectpage-page',_binary 's:11:\"Target page\";'),(_binary 'en',_binary 'messages:specialprotectpage-submit',_binary 's:10:\"Go to page\";'),(_binary 'en',_binary 'messages:specialpurge-page',_binary 's:11:\"Target page\";'),(_binary 'en',_binary 'messages:specialpurge-submit',_binary 's:10:\"Go to page\";'),(_binary 'en',_binary 'messages:statistics',_binary 's:10:\"Statistics\";'),(_binary 'en',_binary 'messages:statistics-articles',_binary 's:13:\"Content pages\";'),(_binary 'en',_binary 'messages:statistics-articles-desc',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:statistics-edits',_binary 's:40:\"Page edits since {{SITENAME}} was set up\";'),(_binary 'en',_binary 'messages:statistics-edits-average',_binary 's:22:\"Average edits per page\";'),(_binary 'en',_binary 'messages:statistics-files',_binary 's:14:\"Uploaded files\";'),(_binary 'en',_binary 'messages:statistics-files-desc',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:statistics-footer',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:statistics-header-edits',_binary 's:15:\"Edit statistics\";'),(_binary 'en',_binary 'messages:statistics-header-hooks',_binary 's:16:\"Other statistics\";'),(_binary 'en',_binary 'messages:statistics-header-pages',_binary 's:15:\"Page statistics\";'),(_binary 'en',_binary 'messages:statistics-header-users',_binary 's:15:\"User statistics\";'),(_binary 'en',_binary 'messages:statistics-pages',_binary 's:5:\"Pages\";'),(_binary 'en',_binary 'messages:statistics-pages-desc',_binary 's:60:\"All pages in the wiki, including talk pages, redirects, etc.\";'),(_binary 'en',_binary 'messages:statistics-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:statistics-users',_binary 's:16:\"Registered users\";'),(_binary 'en',_binary 'messages:statistics-users-active',_binary 's:12:\"Active users\";'),(_binary 'en',_binary 'messages:statistics-users-active-desc',_binary 's:72:\"Users who have performed an action in the last {{PLURAL:$1|day|$1 days}}\";'),(_binary 'en',_binary 'messages:storedversion',_binary 's:15:\"Stored revision\";'),(_binary 'en',_binary 'messages:subcategories',_binary 's:13:\"Subcategories\";'),(_binary 'en',_binary 'messages:subject',_binary 's:8:\"Subject:\";'),(_binary 'en',_binary 'messages:summary',_binary 's:8:\"Summary:\";'),(_binary 'en',_binary 'messages:summary-preview',_binary 's:24:\"Preview of edit summary:\";'),(_binary 'en',_binary 'messages:sun',_binary 's:3:\"Sun\";'),(_binary 'en',_binary 'messages:sunday',_binary 's:6:\"Sunday\";'),(_binary 'en',_binary 'messages:sunday-at',_binary 's:12:\"Sunday at $1\";'),(_binary 'en',_binary 'messages:suppress',_binary 's:8:\"Suppress\";'),(_binary 'en',_binary 'messages:suppressionlog',_binary 's:15:\"Suppression log\";'),(_binary 'en',_binary 'messages:suppressionlogtext',_binary 's:181:\"Below is a list of deletions and blocks involving content hidden from administrators.\nSee the [[Special:BlockList|block list]] for the list of currently operational bans and blocks.\";'),(_binary 'en',_binary 'messages:suspicious-userlogout',_binary 's:106:\"Your request to log out was denied because it looks like it was sent by a broken browser or caching proxy.\";'),(_binary 'en',_binary 'messages:svg-long-desc',_binary 's:50:\"SVG file, nominally $1 × $2 pixels, file size: $3\";'),(_binary 'en',_binary 'messages:svg-long-desc-animated',_binary 's:59:\"Animated SVG file, nominally $1 × $2 pixels, file size: $3\";'),(_binary 'en',_binary 'messages:svg-long-error',_binary 's:20:\"Invalid SVG file: $1\";'),(_binary 'en',_binary 'messages:systemblockedtext',_binary 's:268:\"Your username or IP address has been automatically blocked by MediaWiki.\nThe reason given is:\n\n:<em>$2</em>\n\n* Start of block: $8\n* Expiration of block: $6\n* Intended blockee: $7\n\nYour current IP address is $3.\nPlease include all above details in any queries you make.\";'),(_binary 'en',_binary 'messages:table_pager_empty',_binary 's:10:\"No results\";'),(_binary 'en',_binary 'messages:table_pager_first',_binary 's:10:\"First page\";'),(_binary 'en',_binary 'messages:table_pager_last',_binary 's:9:\"Last page\";'),(_binary 'en',_binary 'messages:table_pager_limit',_binary 's:22:\"Show $1 items per page\";'),(_binary 'en',_binary 'messages:table_pager_limit_label',_binary 's:15:\"Items per page:\";'),(_binary 'en',_binary 'messages:table_pager_limit_submit',_binary 's:2:\"Go\";'),(_binary 'en',_binary 'messages:table_pager_next',_binary 's:9:\"Next page\";'),(_binary 'en',_binary 'messages:table_pager_prev',_binary 's:13:\"Previous page\";'),(_binary 'en',_binary 'messages:tag-filter',_binary 's:28:\"[[Special:Tags|Tag]] filter:\";'),(_binary 'en',_binary 'messages:tag-filter-submit',_binary 's:6:\"Filter\";'),(_binary 'en',_binary 'messages:tag-hidden',_binary 's:15:\"$1 (hidden tag)\";'),(_binary 'en',_binary 'messages:tag-list-wrapper',_binary 's:43:\"[[Special:Tags|{{PLURAL:$1|Tag|Tags}}]]: $2\";'),(_binary 'en',_binary 'messages:tag-mw-blank',_binary 's:8:\"Blanking\";'),(_binary 'en',_binary 'messages:tag-mw-blank-description',_binary 's:23:\"Edits that blank a page\";'),(_binary 'en',_binary 'messages:tag-mw-changed-redirect-target',_binary 's:23:\"Redirect target changed\";'),(_binary 'en',_binary 'messages:tag-mw-changed-redirect-target-description',_binary 's:42:\"Edits that change the target of a redirect\";'),(_binary 'en',_binary 'messages:tag-mw-contentmodelchange',_binary 's:20:\"content model change\";'),(_binary 'en',_binary 'messages:tag-mw-contentmodelchange-description',_binary 's:121:\"Edits that [https://www.mediawiki.org/wiki/Special:MyLanguage/Help:ChangeContentModel change the content model] of a page\";'),(_binary 'en',_binary 'messages:tag-mw-manual-revert',_binary 's:13:\"Manual revert\";'),(_binary 'en',_binary 'messages:tag-mw-manual-revert-description',_binary 's:63:\"Edits that manually restore the page to an exact previous state\";'),(_binary 'en',_binary 'messages:tag-mw-new-redirect',_binary 's:12:\"New redirect\";'),(_binary 'en',_binary 'messages:tag-mw-new-redirect-description',_binary 's:63:\"Edits that create a new redirect or change a page to a redirect\";'),(_binary 'en',_binary 'messages:tag-mw-removed-redirect',_binary 's:16:\"Removed redirect\";'),(_binary 'en',_binary 'messages:tag-mw-removed-redirect-description',_binary 's:56:\"Edits that change an existing redirect to a non-redirect\";'),(_binary 'en',_binary 'messages:tag-mw-replace',_binary 's:8:\"Replaced\";'),(_binary 'en',_binary 'messages:tag-mw-replace-description',_binary 's:56:\"Edits that remove more than 90% of the content of a page\";'),(_binary 'en',_binary 'messages:tag-mw-reverted',_binary 's:8:\"Reverted\";'),(_binary 'en',_binary 'messages:tag-mw-reverted-description',_binary 's:50:\"Edits that were later reverted by a different edit\";'),(_binary 'en',_binary 'messages:tag-mw-rollback',_binary 's:8:\"Rollback\";'),(_binary 'en',_binary 'messages:tag-mw-rollback-description',_binary 's:59:\"Edits that roll back previous edits using the rollback link\";'),(_binary 'en',_binary 'messages:tag-mw-server-side-upload',_binary 's:18:\"Server-side upload\";'),(_binary 'en',_binary 'messages:tag-mw-server-side-upload-description',_binary 's:55:\"Media files that were uploaded via a maintenance script\";'),(_binary 'en',_binary 'messages:tag-mw-undo',_binary 's:4:\"Undo\";'),(_binary 'en',_binary 'messages:tag-mw-undo-description',_binary 's:50:\"Edits that undo previous edits using the undo link\";'),(_binary 'en',_binary 'messages:tagline',_binary 's:17:\"From {{SITENAME}}\";'),(_binary 'en',_binary 'messages:tags',_binary 's:17:\"Valid change tags\";'),(_binary 'en',_binary 'messages:tags-actions-header',_binary 's:7:\"Actions\";'),(_binary 'en',_binary 'messages:tags-activate',_binary 's:8:\"activate\";'),(_binary 'en',_binary 'messages:tags-activate-not-allowed',_binary 's:44:\"It is not possible to activate the tag \"$1\".\";'),(_binary 'en',_binary 'messages:tags-activate-not-found',_binary 's:28:\"The tag \"$1\" does not exist.\";'),(_binary 'en',_binary 'messages:tags-activate-question',_binary 's:39:\"You are about to activate the tag \"$1\".\";'),(_binary 'en',_binary 'messages:tags-activate-reason',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:tags-activate-submit',_binary 's:8:\"Activate\";'),(_binary 'en',_binary 'messages:tags-activate-title',_binary 's:12:\"Activate tag\";'),(_binary 'en',_binary 'messages:tags-active-header',_binary 's:7:\"Active?\";'),(_binary 'en',_binary 'messages:tags-active-no',_binary 's:2:\"No\";'),(_binary 'en',_binary 'messages:tags-active-yes',_binary 's:3:\"Yes\";'),(_binary 'en',_binary 'messages:tags-apply-blocked',_binary 's:89:\"You cannot apply change tags along with your changes while {{GENDER:$1|you}} are blocked.\";'),(_binary 'en',_binary 'messages:tags-apply-no-permission',_binary 's:72:\"You do not have permission to apply change tags along with your changes.\";'),(_binary 'en',_binary 'messages:tags-apply-not-allowed-multi',_binary 's:82:\"The following {{PLURAL:$2|tag is|tags are}} not allowed to be manually applied: $1\";'),(_binary 'en',_binary 'messages:tags-apply-not-allowed-one',_binary 's:51:\"The tag \"$1\" is not allowed to be manually applied.\";'),(_binary 'en',_binary 'messages:tags-create-already-exists',_binary 's:28:\"The tag \"$1\" already exists.\";'),(_binary 'en',_binary 'messages:tags-create-explanation',_binary 's:80:\"By default, newly created tags will be made available for use by users and bots.\";'),(_binary 'en',_binary 'messages:tags-create-heading',_binary 's:16:\"Create a new tag\";'),(_binary 'en',_binary 'messages:tags-create-invalid-chars',_binary 's:112:\"Tag names must not contain commas (<code>,</code>), pipes (<code>|</code>), or forward slashes (<code>/</code>).\";'),(_binary 'en',_binary 'messages:tags-create-invalid-title-chars',_binary 's:73:\"Tag names must not contain characters that cannot be used in page titles.\";'),(_binary 'en',_binary 'messages:tags-create-no-name',_binary 's:28:\"You must specify a tag name.\";'),(_binary 'en',_binary 'messages:tags-create-reason',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:tags-create-submit',_binary 's:6:\"Create\";'),(_binary 'en',_binary 'messages:tags-create-tag-name',_binary 's:9:\"Tag name:\";'),(_binary 'en',_binary 'messages:tags-create-warnings-above',_binary 's:105:\"The following {{PLURAL:$2|warning was|warnings were}} encountered when attempting to create the tag \"$1\":\";'),(_binary 'en',_binary 'messages:tags-create-warnings-below',_binary 's:41:\"Do you wish to continue creating the tag?\";'),(_binary 'en',_binary 'messages:tags-deactivate',_binary 's:10:\"deactivate\";'),(_binary 'en',_binary 'messages:tags-deactivate-not-allowed',_binary 's:46:\"It is not possible to deactivate the tag \"$1\".\";'),(_binary 'en',_binary 'messages:tags-deactivate-question',_binary 's:41:\"You are about to deactivate the tag \"$1\".\";'),(_binary 'en',_binary 'messages:tags-deactivate-reason',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:tags-deactivate-submit',_binary 's:10:\"Deactivate\";'),(_binary 'en',_binary 'messages:tags-deactivate-title',_binary 's:14:\"Deactivate tag\";'),(_binary 'en',_binary 'messages:tags-delete',_binary 's:6:\"delete\";'),(_binary 'en',_binary 'messages:tags-delete-explanation-active',_binary 's:199:\"<strong>The tag \"$1\" is still active, and will continue to be applied in the future.</strong> To stop this from happening, go to the place(s) where the tag is set to be applied, and disable it there.\";'),(_binary 'en',_binary 'messages:tags-delete-explanation-in-use',_binary 's:132:\"It will be removed from {{PLURAL:$2|$2 revision or log entry|all $2 revisions and/or log entries}} to which it is currently applied.\";'),(_binary 'en',_binary 'messages:tags-delete-explanation-initial',_binary 's:55:\"You are about to delete the tag \"$1\" from the database.\";'),(_binary 'en',_binary 'messages:tags-delete-explanation-warning',_binary 's:167:\"This action is <strong>irreversible</strong> and <strong>cannot be undone</strong>, not even by database administrators. Be certain this is the tag you mean to delete.\";'),(_binary 'en',_binary 'messages:tags-delete-no-permission',_binary 's:49:\"You do not have permission to delete change tags.\";'),(_binary 'en',_binary 'messages:tags-delete-not-allowed',_binary 's:91:\"Tags defined by an extension cannot be deleted unless the extension specifically allows it.\";'),(_binary 'en',_binary 'messages:tags-delete-not-found',_binary 's:28:\"The tag \"$1\" does not exist.\";'),(_binary 'en',_binary 'messages:tags-delete-reason',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:tags-delete-submit',_binary 's:28:\"Irreversibly delete this tag\";'),(_binary 'en',_binary 'messages:tags-delete-title',_binary 's:10:\"Delete tag\";'),(_binary 'en',_binary 'messages:tags-delete-too-many-uses',_binary 's:107:\"The tag \"$1\" is applied to more than $2 {{PLURAL:$2|revision|revisions}}, which means it cannot be deleted.\";'),(_binary 'en',_binary 'messages:tags-delete-warnings-after-delete',_binary 's:96:\"The tag \"$1\" was deleted, but the following {{PLURAL:$2|warning was|warnings were}} encountered:\";'),(_binary 'en',_binary 'messages:tags-description-header',_binary 's:27:\"Full description of meaning\";'),(_binary 'en',_binary 'messages:tags-display-header',_binary 's:26:\"Appearance on change lists\";'),(_binary 'en',_binary 'messages:tags-edit',_binary 's:4:\"edit\";'),(_binary 'en',_binary 'messages:tags-edit-add',_binary 's:15:\"Add these tags:\";'),(_binary 'en',_binary 'messages:tags-edit-chosen-no-results',_binary 's:24:\"No tags found that match\";'),(_binary 'en',_binary 'messages:tags-edit-chosen-placeholder',_binary 's:16:\"Select some tags\";'),(_binary 'en',_binary 'messages:tags-edit-existing-tags',_binary 's:14:\"Existing tags:\";'),(_binary 'en',_binary 'messages:tags-edit-existing-tags-none',_binary 's:13:\"<em>None</em>\";'),(_binary 'en',_binary 'messages:tags-edit-failure',_binary 's:36:\"The changes could not be applied:\n$1\";'),(_binary 'en',_binary 'messages:tags-edit-logentry-explanation',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tags-edit-logentry-legend',_binary 's:71:\"Add or remove tags from {{PLURAL:$1|this log entry|all $1 log entries}}\";'),(_binary 'en',_binary 'messages:tags-edit-logentry-selected',_binary 's:53:\"{{PLURAL:$1|Selected log event|Selected log events}}:\";'),(_binary 'en',_binary 'messages:tags-edit-logentry-submit',_binary 's:60:\"Apply changes to {{PLURAL:$1|this log entry|$1 log entries}}\";'),(_binary 'en',_binary 'messages:tags-edit-manage-link',_binary 's:11:\"Manage tags\";'),(_binary 'en',_binary 'messages:tags-edit-new-tags',_binary 's:9:\"New tags:\";'),(_binary 'en',_binary 'messages:tags-edit-none-selected',_binary 's:48:\"Please select at least one tag to add or remove.\";'),(_binary 'en',_binary 'messages:tags-edit-nooldid-text',_binary 's:126:\"You have either not specified any target revision on which to perform this function, or the specified revision does not exist.\";'),(_binary 'en',_binary 'messages:tags-edit-nooldid-title',_binary 's:23:\"Invalid target revision\";'),(_binary 'en',_binary 'messages:tags-edit-reason',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:tags-edit-remove',_binary 's:18:\"Remove these tags:\";'),(_binary 'en',_binary 'messages:tags-edit-remove-all-tags',_binary 's:17:\"(remove all tags)\";'),(_binary 'en',_binary 'messages:tags-edit-revision-explanation',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tags-edit-revision-legend',_binary 's:68:\"Add or remove tags from {{PLURAL:$1|this revision|all $1 revisions}}\";'),(_binary 'en',_binary 'messages:tags-edit-revision-selected',_binary 's:62:\"{{PLURAL:$1|Selected revision|Selected revisions}} of [[:$2]]:\";'),(_binary 'en',_binary 'messages:tags-edit-revision-submit',_binary 's:57:\"Apply changes to {{PLURAL:$1|this revision|$1 revisions}}\";'),(_binary 'en',_binary 'messages:tags-edit-success',_binary 's:25:\"The changes were applied.\";'),(_binary 'en',_binary 'messages:tags-edit-title',_binary 's:9:\"Edit tags\";'),(_binary 'en',_binary 'messages:tags-hidden',_binary 's:8:\"(hidden)\";'),(_binary 'en',_binary 'messages:tags-hitcount',_binary 's:31:\"$1 {{PLURAL:$1|change|changes}}\";'),(_binary 'en',_binary 'messages:tags-hitcount-header',_binary 's:14:\"Tagged changes\";'),(_binary 'en',_binary 'messages:tags-intro',_binary 's:84:\"This page lists the tags that the software may mark an edit with, and their meaning.\";'),(_binary 'en',_binary 'messages:tags-manage-blocked',_binary 's:66:\"You cannot manage change tags while {{GENDER:$1|you}} are blocked.\";'),(_binary 'en',_binary 'messages:tags-manage-no-permission',_binary 's:49:\"You do not have permission to manage change tags.\";'),(_binary 'en',_binary 'messages:tags-source-extension',_binary 's:23:\"Defined by the software\";'),(_binary 'en',_binary 'messages:tags-source-header',_binary 's:6:\"Source\";'),(_binary 'en',_binary 'messages:tags-source-manual',_binary 's:34:\"Applied manually by users and bots\";'),(_binary 'en',_binary 'messages:tags-source-none',_binary 's:16:\"No longer in use\";'),(_binary 'en',_binary 'messages:tags-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tags-tag',_binary 's:8:\"Tag name\";'),(_binary 'en',_binary 'messages:tags-title',_binary 's:4:\"Tags\";'),(_binary 'en',_binary 'messages:tags-update-add-not-allowed-multi',_binary 's:80:\"The following {{PLURAL:$2|tag is|tags are}} not allowed to be manually added: $1\";'),(_binary 'en',_binary 'messages:tags-update-add-not-allowed-one',_binary 's:49:\"The tag \"$1\" is not allowed to be manually added.\";'),(_binary 'en',_binary 'messages:tags-update-blocked',_binary 's:73:\"You cannot add or remove change tags while {{GENDER:$1|you}} are blocked.\";'),(_binary 'en',_binary 'messages:tags-update-no-permission',_binary 's:97:\"You do not have permission to add or remove change tags from individual revisions or log entries.\";'),(_binary 'en',_binary 'messages:tags-update-remove-not-allowed-multi',_binary 's:82:\"The following {{PLURAL:$2|tag is|tags are}} not allowed to be manually removed: $1\";'),(_binary 'en',_binary 'messages:tags-update-remove-not-allowed-one',_binary 's:42:\"The tag \"$1\" is not allowed to be removed.\";'),(_binary 'en',_binary 'messages:talk',_binary 's:10:\"Discussion\";'),(_binary 'en',_binary 'messages:talkpageheader',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:talkpagelinktext',_binary 's:4:\"talk\";'),(_binary 'en',_binary 'messages:talkpagetext',_binary 's:31:\"<!-- MediaWiki:talkpagetext -->\";'),(_binary 'en',_binary 'messages:template-equals-category',_binary 's:31:\"Pages which use = as a template\";'),(_binary 'en',_binary 'messages:template-equals-category-desc',_binary 's:236:\"The page contains <code><nowiki>{{=}}</nowiki></code> but on this wiki that does not expand to <code>=</code>. This usage is deprecated; a future MediaWiki version will implement <code><nowiki>{{=}}</nowiki></code> as a parser function.\";'),(_binary 'en',_binary 'messages:template-equals-warning',_binary 's:259:\"<strong>Warning:</strong> This page uses <code><nowiki>{{=}}</nowiki></code> but on this wiki that does not expand to <code>=</code>. This usage is deprecated; a future MediaWiki version will implement <code><nowiki>{{=}}</nowiki></code> as a parser function.\";'),(_binary 'en',_binary 'messages:template-loop-category',_binary 's:25:\"Pages with template loops\";'),(_binary 'en',_binary 'messages:template-loop-category-desc',_binary 's:81:\"The page contains a template loop, ie. a template which calls itself recursively.\";'),(_binary 'en',_binary 'messages:template-loop-warning',_binary 's:108:\"<strong>Warning:</strong> This page calls [[:$1]] which causes a template loop (an infinite recursive call).\";'),(_binary 'en',_binary 'messages:template-protected',_binary 's:11:\"(protected)\";'),(_binary 'en',_binary 'messages:template-semiprotected',_binary 's:16:\"(semi-protected)\";'),(_binary 'en',_binary 'messages:templatepage',_binary 's:18:\"View template page\";'),(_binary 'en',_binary 'messages:templatesused',_binary 's:51:\"{{PLURAL:$1|Template|Templates}} used on this page:\";'),(_binary 'en',_binary 'messages:templatesusedpreview',_binary 's:54:\"{{PLURAL:$1|Template|Templates}} used in this preview:\";'),(_binary 'en',_binary 'messages:templatesusedsection',_binary 's:54:\"{{PLURAL:$1|Template|Templates}} used in this section:\";'),(_binary 'en',_binary 'messages:textmatches',_binary 's:17:\"Page text matches\";'),(_binary 'en',_binary 'messages:thisisdeleted',_binary 's:20:\"View or undelete $1?\";'),(_binary 'en',_binary 'messages:throttled-mailpassword',_binary 's:184:\"A password reset email has already been sent, within the last {{PLURAL:$1|hour|$1 hours}}.\nTo prevent abuse, only one password reset email will be sent per {{PLURAL:$1|hour|$1 hours}}.\";'),(_binary 'en',_binary 'messages:thu',_binary 's:3:\"Thu\";'),(_binary 'en',_binary 'messages:thumbnail-dest-create',_binary 's:39:\"Unable to save thumbnail to destination\";'),(_binary 'en',_binary 'messages:thumbnail-more',_binary 's:7:\"Enlarge\";'),(_binary 'en',_binary 'messages:thumbnail-temp-create',_binary 's:41:\"Unable to create temporary thumbnail file\";'),(_binary 'en',_binary 'messages:thumbnail_dest_directory',_binary 's:38:\"Unable to create destination directory\";'),(_binary 'en',_binary 'messages:thumbnail_error',_binary 's:28:\"Error creating thumbnail: $1\";'),(_binary 'en',_binary 'messages:thumbnail_error_remote',_binary 's:25:\"Error message from $1:\n$2\";'),(_binary 'en',_binary 'messages:thumbnail_gd-library',_binary 's:56:\"Incomplete GD library configuration: Missing function $1\";'),(_binary 'en',_binary 'messages:thumbnail_image-failure-limit',_binary 's:110:\"There have been too many recent failed attempts ($1 or more) to render this thumbnail. Please try again later.\";'),(_binary 'en',_binary 'messages:thumbnail_image-missing',_binary 's:28:\"File seems to be missing: $1\";'),(_binary 'en',_binary 'messages:thumbnail_image-size-zero',_binary 's:33:\"Image file size seems to be zero.\";'),(_binary 'en',_binary 'messages:thumbnail_image-type',_binary 's:24:\"Image type not supported\";'),(_binary 'en',_binary 'messages:thumbnail_invalid_params',_binary 's:28:\"Invalid thumbnail parameters\";'),(_binary 'en',_binary 'messages:thumbnail_toobigimagearea',_binary 's:36:\"File with dimensions greater than $1\";'),(_binary 'en',_binary 'messages:thumbsize',_binary 's:15:\"Thumbnail size:\";'),(_binary 'en',_binary 'messages:thursday',_binary 's:8:\"Thursday\";'),(_binary 'en',_binary 'messages:thursday-at',_binary 's:14:\"Thursday at $1\";'),(_binary 'en',_binary 'messages:timeless-action-addsection',_binary 's:9:\"New topic\";'),(_binary 'en',_binary 'messages:timeless-action-undelete',_binary 's:40:\"Undelete {{PLURAL:$1|one edit|$1 edits}}\";'),(_binary 'en',_binary 'messages:timeless-anonymous',_binary 's:9:\"Anonymous\";'),(_binary 'en',_binary 'messages:timeless-desc',_binary 's:117:\"A timeless skin designed after the Winter prototype by Brandon Harris, and various styles by the Wikimedia Foundation\";'),(_binary 'en',_binary 'messages:timeless-languages',_binary 's:9:\"Languages\";'),(_binary 'en',_binary 'messages:timeless-loggedinas',_binary 's:21:\"Logged in as \'\'\'$1\'\'\'\";'),(_binary 'en',_binary 'messages:timeless-more',_binary 's:4:\"More\";'),(_binary 'en',_binary 'messages:timeless-namespaces',_binary 's:10:\"Namespaces\";'),(_binary 'en',_binary 'messages:timeless-notloggedin',_binary 's:13:\"Not logged in\";'),(_binary 'en',_binary 'messages:timeless-pageactions',_binary 's:10:\"Page tools\";'),(_binary 'en',_binary 'messages:timeless-pagelog',_binary 's:9:\"Page logs\";'),(_binary 'en',_binary 'messages:timeless-pagemisc',_binary 's:4:\"More\";'),(_binary 'en',_binary 'messages:timeless-pagetools',_binary 's:12:\"Page actions\";'),(_binary 'en',_binary 'messages:timeless-projects',_binary 's:14:\"Other projects\";'),(_binary 'en',_binary 'messages:timeless-sitetitle',_binary 's:17:\"{{int:Sitetitle}}\";'),(_binary 'en',_binary 'messages:timeless-sitetools',_binary 's:10:\"Wiki tools\";'),(_binary 'en',_binary 'messages:timeless-talkpage',_binary 's:23:\"{{GENDER:$1|User}} talk\";'),(_binary 'en',_binary 'messages:timeless-userpage',_binary 's:23:\"{{GENDER:$1|User}} page\";'),(_binary 'en',_binary 'messages:timeless-userpagetools',_binary 's:15:\"User page tools\";'),(_binary 'en',_binary 'messages:timeless-view-history',_binary 's:7:\"History\";'),(_binary 'en',_binary 'messages:timeless-view-view',_binary 's:4:\"Read\";'),(_binary 'en',_binary 'messages:timeless.css',_binary 's:64:\"/* All CSS here will be loaded for users of the Timeless skin */\";'),(_binary 'en',_binary 'messages:timeless.js',_binary 's:71:\"/* All JavaScript here will be loaded for users of the Timeless skin */\";'),(_binary 'en',_binary 'messages:timeouterror',_binary 's:16:\"Server timed out\";'),(_binary 'en',_binary 'messages:timeouterror-text',_binary 's:73:\"The maximum request time of $1 {{PLURAL:$1|second|seconds}} was exceeded.\";'),(_binary 'en',_binary 'messages:timezone-local',_binary 's:5:\"Local\";'),(_binary 'en',_binary 'messages:timezone-useoffset-placeholder',_binary 's:35:\"Example values: \"-07:00\" or \"01:00\"\";'),(_binary 'en',_binary 'messages:timezone-utc',_binary 's:3:\"UTC\";'),(_binary 'en',_binary 'messages:timezonelegend',_binary 's:10:\"Time zone:\";'),(_binary 'en',_binary 'messages:timezoneregion-africa',_binary 's:6:\"Africa\";'),(_binary 'en',_binary 'messages:timezoneregion-america',_binary 's:7:\"America\";'),(_binary 'en',_binary 'messages:timezoneregion-antarctica',_binary 's:10:\"Antarctica\";'),(_binary 'en',_binary 'messages:timezoneregion-arctic',_binary 's:6:\"Arctic\";'),(_binary 'en',_binary 'messages:timezoneregion-asia',_binary 's:4:\"Asia\";'),(_binary 'en',_binary 'messages:timezoneregion-atlantic',_binary 's:14:\"Atlantic Ocean\";'),(_binary 'en',_binary 'messages:timezoneregion-australia',_binary 's:9:\"Australia\";'),(_binary 'en',_binary 'messages:timezoneregion-europe',_binary 's:6:\"Europe\";'),(_binary 'en',_binary 'messages:timezoneregion-indian',_binary 's:12:\"Indian Ocean\";'),(_binary 'en',_binary 'messages:timezoneregion-pacific',_binary 's:13:\"Pacific Ocean\";'),(_binary 'en',_binary 'messages:timezoneuseoffset',_binary 's:28:\"Other (time offset from UTC)\";'),(_binary 'en',_binary 'messages:timezoneuseserverdefault',_binary 's:21:\"Use wiki default ($1)\";'),(_binary 'en',_binary 'messages:title-invalid',_binary 's:35:\"The requested page title is invalid\";'),(_binary 'en',_binary 'messages:title-invalid-characters',_binary 's:59:\"The requested page title contains invalid characters: \"$1\".\";'),(_binary 'en',_binary 'messages:title-invalid-empty',_binary 's:75:\"The requested page title is empty or contains only the name of a namespace.\";'),(_binary 'en',_binary 'messages:title-invalid-interwiki',_binary 's:83:\"The requested page title contains an interwiki link which cannot be used in titles.\";'),(_binary 'en',_binary 'messages:title-invalid-leading-colon',_binary 's:68:\"The requested page title contains an invalid colon at the beginning.\";'),(_binary 'en',_binary 'messages:title-invalid-magic-tilde',_binary 's:86:\"The requested page title contains invalid magic tilde sequence (<nowiki>~~~</nowiki>).\";'),(_binary 'en',_binary 'messages:title-invalid-relative',_binary 's:139:\"Title has relative path. Relative page titles (./, ../) are invalid, because they will often be unreachable when handled by user\'s browser.\";'),(_binary 'en',_binary 'messages:title-invalid-talk-namespace',_binary 's:65:\"The requested page title refers to a talk page that cannot exist.\";'),(_binary 'en',_binary 'messages:title-invalid-too-long',_binary 's:110:\"The requested page title is too long. It must be no longer than $1 {{PLURAL:$1|byte|bytes}} in UTF-8 encoding.\";'),(_binary 'en',_binary 'messages:title-invalid-utf8',_binary 's:60:\"The requested page title contains an invalid UTF-8 sequence.\";'),(_binary 'en',_binary 'messages:titlematches',_binary 's:18:\"Page title matches\";'),(_binary 'en',_binary 'messages:titleprotected',_binary 's:95:\"This title has been protected from creation by [[User:$1|$1]].\nThe reason given is <em>$2</em>.\";'),(_binary 'en',_binary 'messages:titleprotectedwarning',_binary 's:185:\"<strong>Warning: This page has been protected so that [[Special:ListGroupRights|specific rights]] are needed to create it.</strong>\nThe latest log entry is provided below for reference:\";'),(_binary 'en',_binary 'messages:tmp-create-error',_binary 's:32:\"Could not create temporary file.\";'),(_binary 'en',_binary 'messages:tmp-write-error',_binary 's:29:\"Error writing temporary file.\";'),(_binary 'en',_binary 'messages:toc',_binary 's:8:\"Contents\";'),(_binary 'en',_binary 'messages:today-at',_binary 's:2:\"$1\";'),(_binary 'en',_binary 'messages:tog-ccmeonemails',_binary 's:46:\"Send me copies of emails I send to other users\";'),(_binary 'en',_binary 'messages:tog-diffonly',_binary 's:36:\"Do not show page content below diffs\";'),(_binary 'en',_binary 'messages:tog-editondblclick',_binary 's:26:\"Edit pages on double click\";'),(_binary 'en',_binary 'messages:tog-editsectiononrightclick',_binary 's:58:\"Enable section editing by right clicking on section titles\";'),(_binary 'en',_binary 'messages:tog-enotifminoredits',_binary 's:48:\"Email me also for minor edits of pages and files\";'),(_binary 'en',_binary 'messages:tog-enotifrevealaddr',_binary 's:46:\"Reveal my email address in notification emails\";'),(_binary 'en',_binary 'messages:tog-enotifusertalkpages',_binary 's:42:\"Email me when my user talk page is changed\";'),(_binary 'en',_binary 'messages:tog-enotifwatchlistpages',_binary 's:57:\"Email me when a page or a file on my watchlist is changed\";'),(_binary 'en',_binary 'messages:tog-extendwatchlist',_binary 's:62:\"Expand watchlist to show all changes, not just the most recent\";'),(_binary 'en',_binary 'messages:tog-fancysig',_binary 's:73:\"Treat signature as wikitext (without an automatic link to your user page)\";'),(_binary 'en',_binary 'messages:tog-forceeditsummary',_binary 's:74:\"Prompt me when entering a blank edit summary (or the default undo summary)\";'),(_binary 'en',_binary 'messages:tog-hidecategorization',_binary 's:28:\"Hide categorization of pages\";'),(_binary 'en',_binary 'messages:tog-hideminor',_binary 's:36:\"Hide minor edits from recent changes\";'),(_binary 'en',_binary 'messages:tog-hidepatrolled',_binary 's:40:\"Hide patrolled edits from recent changes\";'),(_binary 'en',_binary 'messages:tog-minordefault',_binary 's:31:\"Mark all edits minor by default\";'),(_binary 'en',_binary 'messages:tog-newpageshidepatrolled',_binary 's:39:\"Hide patrolled pages from new page list\";'),(_binary 'en',_binary 'messages:tog-norollbackdiff',_binary 's:43:\"Don\'t show diff after performing a rollback\";'),(_binary 'en',_binary 'messages:tog-oldsig',_binary 's:24:\"Your existing signature:\";'),(_binary 'en',_binary 'messages:tog-prefershttps',_binary 's:46:\"Always use a secure connection while logged in\";'),(_binary 'en',_binary 'messages:tog-previewonfirst',_binary 's:34:\"Show preview when starting to edit\";'),(_binary 'en',_binary 'messages:tog-previewontop',_binary 's:28:\"Show preview before edit box\";'),(_binary 'en',_binary 'messages:tog-requireemail',_binary 's:82:\"Send password reset emails only when both email address and username are provided.\";'),(_binary 'en',_binary 'messages:tog-showhiddencats',_binary 's:22:\"Show hidden categories\";'),(_binary 'en',_binary 'messages:tog-shownumberswatching',_binary 's:33:\"Show the number of watching users\";'),(_binary 'en',_binary 'messages:tog-showrollbackconfirmation',_binary 's:59:\"Show a confirmation prompt when clicking on a rollback link\";'),(_binary 'en',_binary 'messages:tog-underline',_binary 's:17:\"Link underlining:\";'),(_binary 'en',_binary 'messages:tog-useeditwarning',_binary 's:54:\"Warn me when I leave an edit page with unsaved changes\";'),(_binary 'en',_binary 'messages:tog-uselivepreview',_binary 's:39:\"Show preview without reloading the page\";'),(_binary 'en',_binary 'messages:tog-usenewrc',_binary 's:53:\"Group changes by page in recent changes and watchlist\";'),(_binary 'en',_binary 'messages:tog-watchcreations',_binary 's:53:\"Add pages I create and files I upload to my watchlist\";'),(_binary 'en',_binary 'messages:tog-watchdefault',_binary 's:42:\"Add pages and files I edit to my watchlist\";'),(_binary 'en',_binary 'messages:tog-watchdeletion',_binary 's:44:\"Add pages and files I delete to my watchlist\";'),(_binary 'en',_binary 'messages:tog-watchlisthideanons',_binary 's:48:\"Hide edits by anonymous users from the watchlist\";'),(_binary 'en',_binary 'messages:tog-watchlisthidebots',_binary 's:33:\"Hide bot edits from the watchlist\";'),(_binary 'en',_binary 'messages:tog-watchlisthidecategorization',_binary 's:28:\"Hide categorization of pages\";'),(_binary 'en',_binary 'messages:tog-watchlisthideliu',_binary 's:48:\"Hide edits by logged in users from the watchlist\";'),(_binary 'en',_binary 'messages:tog-watchlisthideminor',_binary 's:35:\"Hide minor edits from the watchlist\";'),(_binary 'en',_binary 'messages:tog-watchlisthideown',_binary 's:32:\"Hide my edits from the watchlist\";'),(_binary 'en',_binary 'messages:tog-watchlisthidepatrolled',_binary 's:39:\"Hide patrolled edits from the watchlist\";'),(_binary 'en',_binary 'messages:tog-watchlistreloadautomatically',_binary 's:85:\"Reload the watchlist automatically whenever a filter is changed (JavaScript required)\";'),(_binary 'en',_binary 'messages:tog-watchlistunwatchlinks',_binary 's:168:\"Add direct unwatch/watch markers ({{int:Watchlist-unwatch}}/{{int:Watchlist-unwatch-undo}}) to watched pages with changes (JavaScript required for toggle functionality)\";'),(_binary 'en',_binary 'messages:tog-watchmoves',_binary 's:42:\"Add pages and files I move to my watchlist\";'),(_binary 'en',_binary 'messages:tog-watchrollback',_binary 's:59:\"Add pages where I have performed a rollback to my watchlist\";'),(_binary 'en',_binary 'messages:tog-watchuploads',_binary 's:38:\"Add new files I upload to my watchlist\";'),(_binary 'en',_binary 'messages:tool-link-contributions',_binary 's:32:\"{{GENDER:$1|User}} contributions\";'),(_binary 'en',_binary 'messages:tool-link-emailuser',_binary 's:29:\"Email this {{GENDER:$1|user}}\";'),(_binary 'en',_binary 'messages:tool-link-userrights',_binary 's:32:\"Change {{GENDER:$1|user}} groups\";'),(_binary 'en',_binary 'messages:tool-link-userrights-readonly',_binary 's:30:\"View {{GENDER:$1|user}} groups\";'),(_binary 'en',_binary 'messages:toolbox',_binary 's:5:\"Tools\";'),(_binary 'en',_binary 'messages:tooltip-ca-addsection',_binary 's:19:\"Start a new section\";'),(_binary 'en',_binary 'messages:tooltip-ca-delete',_binary 's:16:\"Delete this page\";'),(_binary 'en',_binary 'messages:tooltip-ca-edit',_binary 's:14:\"Edit this page\";'),(_binary 'en',_binary 'messages:tooltip-ca-history',_binary 's:27:\"Past revisions of this page\";'),(_binary 'en',_binary 'messages:tooltip-ca-move',_binary 's:14:\"Move this page\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-category',_binary 's:22:\"View the category page\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-help',_binary 's:18:\"View the help page\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-image',_binary 's:18:\"View the file page\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-main',_binary 's:21:\"View the content page\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-media',_binary 's:19:\"View the media page\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-mediawiki',_binary 's:23:\"View the system message\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-project',_binary 's:21:\"View the project page\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-special',_binary 's:47:\"This is a special page, and it cannot be edited\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-template',_binary 's:17:\"View the template\";'),(_binary 'en',_binary 'messages:tooltip-ca-nstab-user',_binary 's:18:\"View the user page\";'),(_binary 'en',_binary 'messages:tooltip-ca-protect',_binary 's:17:\"Protect this page\";'),(_binary 'en',_binary 'messages:tooltip-ca-talk',_binary 's:33:\"Discussion about the content page\";'),(_binary 'en',_binary 'messages:tooltip-ca-undelete',_binary 's:58:\"Undelete the edits done to this page before it was deleted\";'),(_binary 'en',_binary 'messages:tooltip-ca-unprotect',_binary 's:30:\"Change protection of this page\";'),(_binary 'en',_binary 'messages:tooltip-ca-unwatch',_binary 's:36:\"Remove this page from your watchlist\";'),(_binary 'en',_binary 'messages:tooltip-ca-unwatch-expiring',_binary 's:71:\"{{PLURAL:$1|1 day|$1 days}} left in your watchlist. Click to remove it.\";'),(_binary 'en',_binary 'messages:tooltip-ca-unwatch-expiring-hours',_binary 's:55:\"A few hours left in your watchlist. Click to remove it.\";'),(_binary 'en',_binary 'messages:tooltip-ca-view',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-ca-viewsource',_binary 's:47:\"This page is protected.\nYou can view its source\";'),(_binary 'en',_binary 'messages:tooltip-ca-watch',_binary 's:31:\"Add this page to your watchlist\";'),(_binary 'en',_binary 'messages:tooltip-compareselectedversions',_binary 's:67:\"See the differences between the two selected revisions of this page\";'),(_binary 'en',_binary 'messages:tooltip-cur',_binary 's:31:\"Difference with latest revision\";'),(_binary 'en',_binary 'messages:tooltip-diff',_binary 's:39:\"Show which changes you made to the text\";'),(_binary 'en',_binary 'messages:tooltip-feed-atom',_binary 's:23:\"Atom feed for this page\";'),(_binary 'en',_binary 'messages:tooltip-feed-rss',_binary 's:22:\"RSS feed for this page\";'),(_binary 'en',_binary 'messages:tooltip-invert',_binary 's:111:\"Check this box to hide changes to pages within the selected namespace (and the associated namespace if checked)\";'),(_binary 'en',_binary 'messages:tooltip-last',_binary 's:34:\"Difference with preceding revision\";'),(_binary 'en',_binary 'messages:tooltip-minoredit',_binary 's:25:\"Mark this as a minor edit\";'),(_binary 'en',_binary 'messages:tooltip-n-currentevents',_binary 's:45:\"Find background information on current events\";'),(_binary 'en',_binary 'messages:tooltip-n-help',_binary 's:21:\"The place to find out\";'),(_binary 'en',_binary 'messages:tooltip-n-help-mediawiki',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-n-mainpage',_binary 's:19:\"Visit the main page\";'),(_binary 'en',_binary 'messages:tooltip-n-mainpage-description',_binary 's:19:\"Visit the main page\";'),(_binary 'en',_binary 'messages:tooltip-n-portal',_binary 's:56:\"About the project, what you can do, where to find things\";'),(_binary 'en',_binary 'messages:tooltip-n-randompage',_binary 's:18:\"Load a random page\";'),(_binary 'en',_binary 'messages:tooltip-n-recentchanges',_binary 's:36:\"A list of recent changes in the wiki\";'),(_binary 'en',_binary 'messages:tooltip-namespace_association',_binary 's:99:\"Check this box to also include the talk or subject namespace associated with the selected namespace\";'),(_binary 'en',_binary 'messages:tooltip-p-cactions',_binary 's:12:\"More options\";'),(_binary 'en',_binary 'messages:tooltip-p-lang',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-p-logo',_binary 's:19:\"Visit the main page\";'),(_binary 'en',_binary 'messages:tooltip-p-namespaces',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-p-navigation',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-p-personal',_binary 's:9:\"User menu\";'),(_binary 'en',_binary 'messages:tooltip-p-tb',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-p-user-interface-preferences',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-p-user-page',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-p-variants',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-p-views',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:tooltip-preferences-save',_binary 's:16:\"Save preferences\";'),(_binary 'en',_binary 'messages:tooltip-preview',_binary 's:56:\"Preview your changes. Please use this before publishing.\";'),(_binary 'en',_binary 'messages:tooltip-pt-anoncontribs',_binary 's:41:\"A list of edits made from this IP address\";'),(_binary 'en',_binary 'messages:tooltip-pt-anontalk',_binary 's:43:\"Discussion about edits from this IP address\";'),(_binary 'en',_binary 'messages:tooltip-pt-anonuserpage',_binary 's:51:\"The user page for the IP address you are editing as\";'),(_binary 'en',_binary 'messages:tooltip-pt-createaccount',_binary 's:80:\"You are encouraged to create an account and log in; however, it is not mandatory\";'),(_binary 'en',_binary 'messages:tooltip-pt-login',_binary 's:58:\"You are encouraged to log in; however, it is not mandatory\";'),(_binary 'en',_binary 'messages:tooltip-pt-login-private',_binary 's:35:\"You need to log in to use this wiki\";'),(_binary 'en',_binary 'messages:tooltip-pt-logout',_binary 's:7:\"Log out\";'),(_binary 'en',_binary 'messages:tooltip-pt-mycontris',_binary 's:40:\"A list of {{GENDER:|your}} contributions\";'),(_binary 'en',_binary 'messages:tooltip-pt-mytalk',_binary 's:26:\"{{GENDER:|Your}} talk page\";'),(_binary 'en',_binary 'messages:tooltip-pt-preferences',_binary 's:28:\"{{GENDER:|Your}} preferences\";'),(_binary 'en',_binary 'messages:tooltip-pt-tmpuserpage',_binary 's:39:\"Your auto-generated temporary user name\";'),(_binary 'en',_binary 'messages:tooltip-pt-userpage',_binary 's:26:\"{{GENDER:|Your user}} page\";'),(_binary 'en',_binary 'messages:tooltip-pt-watchlist',_binary 's:46:\"A list of pages you are monitoring for changes\";'),(_binary 'en',_binary 'messages:tooltip-publish',_binary 's:20:\"Publish your changes\";'),(_binary 'en',_binary 'messages:tooltip-recreate',_binary 's:49:\"Recreate the page even though it has been deleted\";'),(_binary 'en',_binary 'messages:tooltip-rollback',_binary 's:75:\"\"Rollback\" reverts the last contributor\'s edit(s) to this page in one click\";'),(_binary 'en',_binary 'messages:tooltip-save',_binary 's:17:\"Save your changes\";'),(_binary 'en',_binary 'messages:tooltip-search',_binary 's:19:\"Search {{SITENAME}}\";'),(_binary 'en',_binary 'messages:tooltip-search-fulltext',_binary 's:30:\"Search the pages for this text\";'),(_binary 'en',_binary 'messages:tooltip-search-go',_binary 's:46:\"Go to a page with this exact name if it exists\";'),(_binary 'en',_binary 'messages:tooltip-summary',_binary 's:21:\"Enter a short summary\";'),(_binary 'en',_binary 'messages:tooltip-t-contributions',_binary 's:50:\"A list of contributions by {{GENDER:$1|this user}}\";'),(_binary 'en',_binary 'messages:tooltip-t-emailuser',_binary 's:40:\"Send an email to {{GENDER:$1|this user}}\";'),(_binary 'en',_binary 'messages:tooltip-t-info',_binary 's:32:\"More information about this page\";'),(_binary 'en',_binary 'messages:tooltip-t-permalink',_binary 's:44:\"Permanent link to this revision of this page\";'),(_binary 'en',_binary 'messages:tooltip-t-print',_binary 's:30:\"Printable version of this page\";'),(_binary 'en',_binary 'messages:tooltip-t-recentchangeslinked',_binary 's:45:\"Recent changes in pages linked from this page\";'),(_binary 'en',_binary 'messages:tooltip-t-specialpages',_binary 's:27:\"A list of all special pages\";'),(_binary 'en',_binary 'messages:tooltip-t-upload',_binary 's:12:\"Upload files\";'),(_binary 'en',_binary 'messages:tooltip-t-whatlinkshere',_binary 's:39:\"A list of all wiki pages that link here\";'),(_binary 'en',_binary 'messages:tooltip-undo',_binary 's:107:\"\"Undo\" reverts this edit and opens the edit form in preview mode. It allows adding a reason in the summary.\";'),(_binary 'en',_binary 'messages:tooltip-upload',_binary 's:12:\"Start upload\";'),(_binary 'en',_binary 'messages:tooltip-vector-anon-user-menu-title',_binary 's:12:\"More options\";'),(_binary 'en',_binary 'messages:tooltip-watch',_binary 's:31:\"Add this page to your watchlist\";'),(_binary 'en',_binary 'messages:tooltip-watchlist-expiry',_binary 's:43:\"Temporarily add this page to your watchlist\";'),(_binary 'en',_binary 'messages:tooltip-watchlistedit-normal-submit',_binary 's:13:\"Remove titles\";'),(_binary 'en',_binary 'messages:tooltip-watchlistedit-raw-submit',_binary 's:16:\"Update watchlist\";'),(_binary 'en',_binary 'messages:tooltip-whatlinkshere-invert',_binary 's:70:\"Check this box to hide links from pages within the selected namespace.\";'),(_binary 'en',_binary 'messages:trackingcategories',_binary 's:19:\"Tracking categories\";'),(_binary 'en',_binary 'messages:trackingcategories-desc',_binary 's:27:\"Category inclusion criteria\";'),(_binary 'en',_binary 'messages:trackingcategories-disabled',_binary 's:20:\"Category is disabled\";'),(_binary 'en',_binary 'messages:trackingcategories-msg',_binary 's:17:\"Tracking category\";'),(_binary 'en',_binary 'messages:trackingcategories-name',_binary 's:12:\"Message name\";'),(_binary 'en',_binary 'messages:trackingcategories-nodesc',_binary 's:25:\"No description available.\";'),(_binary 'en',_binary 'messages:trackingcategories-summary',_binary 's:191:\"This page lists tracking categories which are automatically populated by the MediaWiki software. Their names can be changed by altering the relevant system messages in the {{ns:8}} namespace.\";'),(_binary 'en',_binary 'messages:transaction-duration-limit-exceeded',_binary 's:217:\"To avoid creating high replication lag, this transaction was aborted because the write duration ($1) exceeded the $2 second limit.\nIf you are changing many items at once, try doing multiple smaller operations instead.\";'),(_binary 'en',_binary 'messages:transaction-max-statement-time-exceeded',_binary 's:187:\"To avoid creating high database load, this query was aborted because the duration exceeded the limit.\nIf you are reading many items at once, try doing multiple smaller operations instead.\";'),(_binary 'en',_binary 'messages:translateinterface',_binary 's:139:\"To add or change translations for all wikis, please use [https://translatewiki.net/ translatewiki.net], the MediaWiki localisation project.\";'),(_binary 'en',_binary 'messages:tue',_binary 's:3:\"Tue\";'),(_binary 'en',_binary 'messages:tuesday',_binary 's:7:\"Tuesday\";'),(_binary 'en',_binary 'messages:tuesday-at',_binary 's:13:\"Tuesday at $1\";'),(_binary 'en',_binary 'messages:uctop',_binary 's:7:\"current\";'),(_binary 'en',_binary 'messages:unblock',_binary 's:12:\"Unblock user\";'),(_binary 'en',_binary 'messages:unblock-hideuser',_binary 's:64:\"You cannot unblock this user, as their username has been hidden.\";'),(_binary 'en',_binary 'messages:unblock-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unblocked',_binary 's:34:\"[[User:$1|$1]] has been unblocked.\";'),(_binary 'en',_binary 'messages:unblocked-id',_binary 's:26:\"Block $1 has been removed.\";'),(_binary 'en',_binary 'messages:unblocked-ip',_binary 's:51:\"[[Special:Contributions/$1|$1]] has been unblocked.\";'),(_binary 'en',_binary 'messages:unblocked-range',_binary 's:22:\"$1 has been unblocked.\";'),(_binary 'en',_binary 'messages:unblockip',_binary 's:12:\"Unblock user\";'),(_binary 'en',_binary 'messages:unblockiptext',_binary 's:90:\"Use the form below to restore write access to a previously blocked IP address or username.\";'),(_binary 'en',_binary 'messages:unblocklink',_binary 's:7:\"unblock\";'),(_binary 'en',_binary 'messages:unblocklogentry',_binary 's:12:\"unblocked $1\";'),(_binary 'en',_binary 'messages:uncategorized-categories-exceptionlist',_binary 's:228:\" # Contains a list of categories, which shouldn\'t be mentioned on Special:UncategorizedCategories. One per line, starting with \"*\". Lines starting with another character (including whitespaces) are ignored. Use \"#\" for comments.\";'),(_binary 'en',_binary 'messages:uncategorizedcategories',_binary 's:24:\"Uncategorized categories\";'),(_binary 'en',_binary 'messages:uncategorizedcategories-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:uncategorizedimages',_binary 's:19:\"Uncategorized files\";'),(_binary 'en',_binary 'messages:uncategorizedimages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:uncategorizedpages',_binary 's:19:\"Uncategorized pages\";'),(_binary 'en',_binary 'messages:uncategorizedpages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:uncategorizedtemplates',_binary 's:23:\"Uncategorized templates\";'),(_binary 'en',_binary 'messages:uncategorizedtemplates-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:undelete',_binary 's:18:\"View deleted pages\";'),(_binary 'en',_binary 'messages:undelete-back-to-list',_binary 's:26:\"View all deleted revisions\";'),(_binary 'en',_binary 'messages:undelete-bad-store-key',_binary 's:82:\"Cannot undelete file revision with timestamp $1: File was missing before deletion.\";'),(_binary 'en',_binary 'messages:undelete-cantcreate',_binary 's:118:\"You cannot undelete this page as there is no existing page with this name and you are not allowed to create this page.\";'),(_binary 'en',_binary 'messages:undelete-cantedit',_binary 's:71:\"You cannot undelete this page as you are not allowed to edit this page.\";'),(_binary 'en',_binary 'messages:undelete-cleanup-error',_binary 's:40:\"Error deleting unused archive file \"$1\".\";'),(_binary 'en',_binary 'messages:undelete-error',_binary 's:21:\"Error undeleting page\";'),(_binary 'en',_binary 'messages:undelete-error-associated-alreadytalk',_binary 's:52:\"Cannot undelete associated talk page of a talk page.\";'),(_binary 'en',_binary 'messages:undelete-error-associated-notdeleted',_binary 's:64:\"The associated talk page has no revisions that can be undeleted.\";'),(_binary 'en',_binary 'messages:undelete-fieldset-title',_binary 's:18:\"Undelete revisions\";'),(_binary 'en',_binary 'messages:undelete-filename-mismatch',_binary 's:67:\"Cannot undelete file revision with timestamp $1: Filename mismatch.\";'),(_binary 'en',_binary 'messages:undelete-header',_binary 's:71:\"See [[Special:Log/delete|the deletion log]] for recently deleted pages.\";'),(_binary 'en',_binary 'messages:undelete-missing-filearchive',_binary 's:108:\"Unable to undelete file archive ID $1 because it is not in the database.\nIt may have already been undeleted.\";'),(_binary 'en',_binary 'messages:undelete-no-results',_binary 's:48:\"No matching pages found in the deletion archive.\";'),(_binary 'en',_binary 'messages:undelete-nodiff',_binary 's:27:\"No previous revision found.\";'),(_binary 'en',_binary 'messages:undelete-revision',_binary 's:47:\"Deleted revision of $1 (as of $4, at $5) by $3:\";'),(_binary 'en',_binary 'messages:undelete-revision-row2',_binary 's:29:\"$1 ($2) $3 . . $4 $5 $6 $7 $8\";'),(_binary 'en',_binary 'messages:undelete-search-box',_binary 's:20:\"Search deleted pages\";'),(_binary 'en',_binary 'messages:undelete-search-full',_binary 's:28:\"Show page titles containing:\";'),(_binary 'en',_binary 'messages:undelete-search-prefix',_binary 's:25:\"Show pages starting with:\";'),(_binary 'en',_binary 'messages:undelete-search-submit',_binary 's:6:\"Search\";'),(_binary 'en',_binary 'messages:undelete-search-title',_binary 's:20:\"Search deleted pages\";'),(_binary 'en',_binary 'messages:undelete-show-file-confirm',_binary 's:99:\"Are you sure you want to view the deleted revision of the file \"<nowiki>$1</nowiki>\" from $2 at $3?\";'),(_binary 'en',_binary 'messages:undelete-show-file-submit',_binary 's:3:\"Yes\";'),(_binary 'en',_binary 'messages:undelete-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:undelete-talk-summary-prefix',_binary 's:59:\"Undeleted together with the associated page with reason: $1\";'),(_binary 'en',_binary 'messages:undelete-undeletetalk',_binary 's:50:\"Undelete all revisions of the associated talk page\";'),(_binary 'en',_binary 'messages:undelete_short',_binary 's:40:\"Undelete {{PLURAL:$1|one edit|$1 edits}}\";'),(_binary 'en',_binary 'messages:undeletebtn',_binary 's:8:\"Undelete\";'),(_binary 'en',_binary 'messages:undeletecomment',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:undeletedarticle',_binary 's:18:\"undeleted \"[[$1]]\"\";'),(_binary 'en',_binary 'messages:undeletedpage',_binary 's:138:\"<strong>$1 has been undeleted</strong>\n\nConsult the [[Special:Log/delete|deletion log]] for a record of recent deletions and restorations.\";'),(_binary 'en',_binary 'messages:undeleteextrahelp',_binary 's:283:\"To undelete the page\'s entire history, leave all checkboxes deselected and click <strong><em>{{int:undeletebtn}}</em></strong>.\nTo perform a selective undeletion, check the boxes corresponding to the revisions to be undeleted, and click <strong><em>{{int:undeletebtn}}</em></strong>.\";'),(_binary 'en',_binary 'messages:undeletehistory',_binary 's:201:\"If you undelete the page, all revisions will be undeleted to the history.\nIf a new page with the same name has been created since the deletion, the undeleted revisions will appear in the prior history.\";'),(_binary 'en',_binary 'messages:undeletehistorynoadmin',_binary 's:229:\"This page has been deleted.\nThe reason for deletion is shown in the summary below, along with details of the users who had edited this page before deletion.\nThe text of these deleted revisions is only available to administrators.\";'),(_binary 'en',_binary 'messages:undeleteinvert',_binary 's:16:\"Invert selection\";'),(_binary 'en',_binary 'messages:undeletelink',_binary 's:13:\"view/undelete\";'),(_binary 'en',_binary 'messages:undeletepage',_binary 's:31:\"View and undelete deleted pages\";'),(_binary 'en',_binary 'messages:undeletepagetext',_binary 's:179:\"The following {{PLURAL:$1|page has been deleted but is|$1 pages have been deleted but are}} still in the archive and can be undeleted.\nThe archive may be periodically cleaned out.\";'),(_binary 'en',_binary 'messages:undeletepagetitle',_binary 's:75:\"<strong>The following consists of deleted revisions of [[:$1|$1]]</strong>.\";'),(_binary 'en',_binary 'messages:undeleterevdel',_binary 's:179:\"Undeletion will not be performed if it will result in the top page or file revision being partially deleted.\nIn such cases, you must uncheck or unhide the newest deleted revision.\";'),(_binary 'en',_binary 'messages:undeleterevision-duplicate-revid',_binary 's:135:\"{{PLURAL:$1|One revision|$1 revisions}} could not be undeleted, because {{PLURAL:$1|its|their}} <code>rev_id</code> was already in use.\";'),(_binary 'en',_binary 'messages:undeleterevision-missing',_binary 's:122:\"Invalid or missing revision.\nYou may have a bad link, or the revision may have been undeleted or removed from the archive.\";'),(_binary 'en',_binary 'messages:undeleterevisions',_binary 's:43:\"$1 {{PLURAL:$1|revision|revisions}} deleted\";'),(_binary 'en',_binary 'messages:undeleteviewlink',_binary 's:4:\"view\";'),(_binary 'en',_binary 'messages:underline-always',_binary 's:6:\"Always\";'),(_binary 'en',_binary 'messages:underline-default',_binary 's:23:\"Skin or browser default\";'),(_binary 'en',_binary 'messages:underline-never',_binary 's:5:\"Never\";'),(_binary 'en',_binary 'messages:undo-failure',_binary 's:67:\"The edit could not be undone due to conflicting intermediate edits.\";'),(_binary 'en',_binary 'messages:undo-main-slot-only',_binary 's:79:\"The edit could not be undone because it involves content outside the main slot.\";'),(_binary 'en',_binary 'messages:undo-nochange',_binary 's:45:\"The edit appears to have already been undone.\";'),(_binary 'en',_binary 'messages:undo-norev',_binary 's:70:\"The edit could not be undone because it does not exist or was deleted.\";'),(_binary 'en',_binary 'messages:undo-success',_binary 's:164:\"The edit can be undone.\nPlease check the comparison below to verify that this is what you want to do, and then publish the changes below to finish undoing the edit.\";'),(_binary 'en',_binary 'messages:undo-summary',_binary 's:75:\"Undo revision $1 by [[Special:Contributions/$2|$2]] ([[User talk:$2|talk]])\";'),(_binary 'en',_binary 'messages:undo-summary-anon',_binary 's:51:\"Undo revision $1 by [[Special:Contributions/$2|$2]]\";'),(_binary 'en',_binary 'messages:undo-summary-import',_binary 's:44:\"Undo imported revision $1 by user [[:$2|$3]]\";'),(_binary 'en',_binary 'messages:undo-summary-import2',_binary 's:36:\"Undo imported revision $1 by user $2\";'),(_binary 'en',_binary 'messages:undo-summary-username-hidden',_binary 's:33:\"Undo revision $1 by a hidden user\";'),(_binary 'en',_binary 'messages:unexpected',_binary 's:28:\"Unexpected value: \"$1\"=\"$2\".\";'),(_binary 'en',_binary 'messages:unicode-support-fail',_binary 's:116:\"It appears that your browser does not support Unicode. It is required to edit pages, so your edit was not published.\";'),(_binary 'en',_binary 'messages:unit-pixel',_binary 's:2:\"px\";'),(_binary 'en',_binary 'messages:unknown-error',_binary 's:26:\"An unknown error occurred.\";'),(_binary 'en',_binary 'messages:unlinkaccounts',_binary 's:15:\"Unlink accounts\";'),(_binary 'en',_binary 'messages:unlinkaccounts-success',_binary 's:25:\"The account was unlinked.\";'),(_binary 'en',_binary 'messages:unlockbtn',_binary 's:15:\"Unlock database\";'),(_binary 'en',_binary 'messages:unlockconfirm',_binary 's:42:\"Yes, I really want to unlock the database.\";'),(_binary 'en',_binary 'messages:unlockdb',_binary 's:15:\"Unlock database\";'),(_binary 'en',_binary 'messages:unlockdbsuccesssub',_binary 's:21:\"Database lock removed\";'),(_binary 'en',_binary 'messages:unlockdbsuccesstext',_binary 's:31:\"The database has been unlocked.\";'),(_binary 'en',_binary 'messages:unlockdbtext',_binary 's:227:\"Unlocking the database will restore the ability of all users to edit pages, change their preferences, edit their watchlists, and other things requiring changes in the database.\nPlease confirm that this is what you intend to do.\";'),(_binary 'en',_binary 'messages:unpatrolledletter',_binary 's:1:\"!\";'),(_binary 'en',_binary 'messages:unprotect',_binary 's:17:\"Change protection\";'),(_binary 'en',_binary 'messages:unprotected-js',_binary 's:151:\"For security reasons JavaScript cannot be loaded from unprotected pages. Please only create javascript in the MediaWiki: namespace or as a User subpage\";'),(_binary 'en',_binary 'messages:unprotectedarticle',_binary 's:32:\"removed protection from \"[[$1]]\"\";'),(_binary 'en',_binary 'messages:unprotectedarticle-comment',_binary 's:46:\"{{GENDER:$2|Removed protection}} from \"[[$1]]\"\";'),(_binary 'en',_binary 'messages:unregistered-user-config',_binary 's:100:\"For security reasons JavaScript, CSS and JSON user subpages cannot be loaded for unregistered users.\";'),(_binary 'en',_binary 'messages:unstrip-depth-category',_binary 's:47:\"Pages where the unstrip depth limit is exceeded\";'),(_binary 'en',_binary 'messages:unstrip-depth-category-desc',_binary 's:41:\"The page exceeds the unstrip depth limit.\";'),(_binary 'en',_binary 'messages:unstrip-depth-warning',_binary 's:33:\"Unstrip depth limit exceeded ($1)\";'),(_binary 'en',_binary 'messages:unstrip-size-category',_binary 's:46:\"Pages where the unstrip size limit is exceeded\";'),(_binary 'en',_binary 'messages:unstrip-size-category-desc',_binary 's:40:\"The page exceeds the unstrip size limit.\";'),(_binary 'en',_binary 'messages:unstrip-size-warning',_binary 's:32:\"Unstrip size limit exceeded ($1)\";'),(_binary 'en',_binary 'messages:unsupported-content-diff',_binary 's:45:\"Diffs are not supported for content model $1.\";'),(_binary 'en',_binary 'messages:unsupported-content-diff2',_binary 's:74:\"Diffs between the content models $1 and $2 are not supported on this wiki.\";'),(_binary 'en',_binary 'messages:unsupported-content-model',_binary 's:73:\"<strong>Warning:</strong> Content model $1 is not supported on this wiki.\";'),(_binary 'en',_binary 'messages:unusedcategories',_binary 's:17:\"Unused categories\";'),(_binary 'en',_binary 'messages:unusedcategories-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unusedcategoriestext',_binary 's:89:\"The following category pages exist, although no other page or category makes use of them.\";'),(_binary 'en',_binary 'messages:unusedimages',_binary 's:12:\"Unused files\";'),(_binary 'en',_binary 'messages:unusedimages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unusedimagestext',_binary 's:191:\"The following files exist but are not embedded in any page.\nPlease note that other web sites may link to a file with a direct URL, and so may still be listed here despite being in active use.\";'),(_binary 'en',_binary 'messages:unusedimagestext-categorizedimgisused',_binary 's:281:\"The following files exist but are not embedded in any page. Categorized images are considered as used despite that they are not embedded in any page.\nPlease note that other web sites may link to a file with a direct URL, and so may still be listed here despite being in active use.\";'),(_binary 'en',_binary 'messages:unusedtemplates',_binary 's:16:\"Unused templates\";'),(_binary 'en',_binary 'messages:unusedtemplates-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unusedtemplatestext',_binary 's:170:\"This page lists all pages in the {{ns:template}} namespace that are not included in another page.\nRemember to check for other links to the templates before deleting them.\";'),(_binary 'en',_binary 'messages:unusedtemplateswlh',_binary 's:11:\"other links\";'),(_binary 'en',_binary 'messages:unwatch',_binary 's:7:\"Unwatch\";'),(_binary 'en',_binary 'messages:unwatchedpages',_binary 's:15:\"Unwatched pages\";'),(_binary 'en',_binary 'messages:unwatchedpages-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:unwatching',_binary 's:13:\"Unwatching...\";'),(_binary 'en',_binary 'messages:unwatchthispage',_binary 's:13:\"Stop watching\";'),(_binary 'en',_binary 'messages:updated',_binary 's:9:\"(Updated)\";'),(_binary 'en',_binary 'messages:updatedmarker',_binary 's:29:\"updated since your last visit\";'),(_binary 'en',_binary 'messages:updatewatchlist',_binary 's:16:\"Update watchlist\";'),(_binary 'en',_binary 'messages:upload',_binary 's:11:\"Upload file\";'),(_binary 'en',_binary 'messages:upload-copy-upload-invalid-domain',_binary 's:48:\"Copy uploads are not available from this domain.\";'),(_binary 'en',_binary 'messages:upload-curl-error28',_binary 's:14:\"Upload timeout\";'),(_binary 'en',_binary 'messages:upload-curl-error28-text',_binary 's:138:\"The site took too long to respond.\nPlease check the site is up, wait a short while and try again.\nYou may want to try at a less busy time.\";'),(_binary 'en',_binary 'messages:upload-curl-error6',_binary 's:19:\"Could not reach URL\";'),(_binary 'en',_binary 'messages:upload-curl-error6-text',_binary 's:102:\"The URL provided could not be reached.\nPlease double-check that the URL is correct and the site is up.\";'),(_binary 'en',_binary 'messages:upload-default-description',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:upload-description',_binary 's:16:\"File description\";'),(_binary 'en',_binary 'messages:upload-dialog-button-back',_binary 's:4:\"Back\";'),(_binary 'en',_binary 'messages:upload-dialog-button-cancel',_binary 's:6:\"Cancel\";'),(_binary 'en',_binary 'messages:upload-dialog-button-done',_binary 's:4:\"Done\";'),(_binary 'en',_binary 'messages:upload-dialog-button-save',_binary 's:4:\"Save\";'),(_binary 'en',_binary 'messages:upload-dialog-button-upload',_binary 's:6:\"Upload\";'),(_binary 'en',_binary 'messages:upload-dialog-disabled',_binary 's:57:\"File uploads using this dialog are disabled on this wiki.\";'),(_binary 'en',_binary 'messages:upload-dialog-title',_binary 's:11:\"Upload file\";'),(_binary 'en',_binary 'messages:upload-disallowed-here',_binary 's:31:\"You cannot overwrite this file.\";'),(_binary 'en',_binary 'messages:upload-file-error',_binary 's:14:\"Internal error\";'),(_binary 'en',_binary 'messages:upload-file-error-text',_binary 's:145:\"An internal error occurred when attempting to create a temporary file on the server.\nPlease contact an [[Special:ListUsers/sysop|administrator]].\";'),(_binary 'en',_binary 'messages:upload-foreign-cant-load-config',_binary 's:81:\"Failed to load the configuration for file uploads to the foreign file repository.\";'),(_binary 'en',_binary 'messages:upload-foreign-cant-upload',_binary 's:85:\"This wiki is not configured to upload files to the requested foreign file repository.\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-categories',_binary 's:10:\"Categories\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-date',_binary 's:4:\"Date\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-description',_binary 's:11:\"Description\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-description-tooltip',_binary 's:135:\"Briefly describe everything notable about the work.\nFor a photo, mention the main things that are depicted, the occasion, or the place.\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-name',_binary 's:4:\"Name\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-name-tooltip',_binary 's:147:\"A unique descriptive title for the file, which will serve as a filename. You may use plain language with spaces. Do not include the file extension.\";'),(_binary 'en',_binary 'messages:upload-form-label-infoform-title',_binary 's:7:\"Details\";'),(_binary 'en',_binary 'messages:upload-form-label-not-own-work-local-generic-foreign',_binary 's:139:\"You may also want to try using [[Special:Upload|the upload page on {{SITENAME}}]], if this file can be uploaded there under their policies.\";'),(_binary 'en',_binary 'messages:upload-form-label-not-own-work-local-generic-local',_binary 's:68:\"You may also want to try [[Special:Upload|the default upload page]].\";'),(_binary 'en',_binary 'messages:upload-form-label-not-own-work-message-generic-foreign',_binary 's:133:\"If you are not able to upload this file under the policies of the shared repository, please close this dialog and try another method.\";'),(_binary 'en',_binary 'messages:upload-form-label-not-own-work-message-generic-local',_binary 's:124:\"If you are not able to upload this file under the policies of {{SITENAME}}, please close this dialog and try another method.\";'),(_binary 'en',_binary 'messages:upload-form-label-own-work',_binary 's:19:\"This is my own work\";'),(_binary 'en',_binary 'messages:upload-form-label-own-work-message-generic-foreign',_binary 's:156:\"I understand that I am uploading this file to a shared repository. I confirm that I am doing so following the terms of service and licensing policies there.\";'),(_binary 'en',_binary 'messages:upload-form-label-own-work-message-generic-local',_binary 's:110:\"I confirm that I am uploading this file following the terms of service and licensing policies on {{SITENAME}}.\";'),(_binary 'en',_binary 'messages:upload-form-label-usage-filename',_binary 's:9:\"File name\";'),(_binary 'en',_binary 'messages:upload-form-label-usage-title',_binary 's:5:\"Usage\";'),(_binary 'en',_binary 'messages:upload-http-error',_binary 's:26:\"An HTTP error occurred: $1\";'),(_binary 'en',_binary 'messages:upload-maxfilesize',_binary 's:21:\"Maximum file size: $1\";'),(_binary 'en',_binary 'messages:upload-misc-error',_binary 's:20:\"Unknown upload error\";'),(_binary 'en',_binary 'messages:upload-misc-error-text',_binary 's:189:\"An unknown error occurred during the upload.\nPlease verify that the URL is valid and accessible and try again.\nIf the problem persists, contact an [[Special:ListUsers/sysop|administrator]].\";'),(_binary 'en',_binary 'messages:upload-options',_binary 's:14:\"Upload options\";'),(_binary 'en',_binary 'messages:upload-permitted',_binary 's:44:\"Permitted file {{PLURAL:$2|type|types}}: $1.\";'),(_binary 'en',_binary 'messages:upload-preferred',_binary 's:44:\"Preferred file {{PLURAL:$2|type|types}}: $1.\";'),(_binary 'en',_binary 'messages:upload-prohibited',_binary 's:45:\"Prohibited file {{PLURAL:$2|type|types}}: $1.\";'),(_binary 'en',_binary 'messages:upload-proto-error',_binary 's:18:\"Incorrect protocol\";'),(_binary 'en',_binary 'messages:upload-proto-error-text',_binary 's:87:\"Remote upload requires URLs beginning with <code>http://</code> or <code>ftp://</code>.\";'),(_binary 'en',_binary 'messages:upload-recreate-warning',_binary 's:148:\"<strong>Warning: A file by that name has been deleted or moved.</strong>\n\nThe deletion and move log for this page are provided here for convenience:\";'),(_binary 'en',_binary 'messages:upload-scripted-dtd',_binary 's:68:\"Cannot upload SVG files that contain a non-standard DTD declaration.\";'),(_binary 'en',_binary 'messages:upload-scripted-pi-callback',_binary 's:73:\"Cannot upload a file that contains XML-stylesheet processing instruction.\";'),(_binary 'en',_binary 'messages:upload-source',_binary 's:11:\"Source file\";'),(_binary 'en',_binary 'messages:upload-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:upload-too-many-redirects',_binary 's:36:\"The URL contained too many redirects\";'),(_binary 'en',_binary 'messages:upload-tryagain',_binary 's:32:\"Submit modified file description\";'),(_binary 'en',_binary 'messages:upload-tryagain-nostash',_binary 's:48:\"Submit re-uploaded file and modified description\";'),(_binary 'en',_binary 'messages:upload_directory_missing',_binary 's:79:\"The upload directory ($1) is missing and could not be created by the webserver.\";'),(_binary 'en',_binary 'messages:upload_directory_read_only',_binary 's:59:\"The upload directory ($1) is not writable by the webserver.\";'),(_binary 'en',_binary 'messages:upload_source_file',_binary 's:37:\"(your chosen file from your computer)\";'),(_binary 'en',_binary 'messages:upload_source_url',_binary 's:56:\"(your chosen file from a valid, publicly accessible URL)\";'),(_binary 'en',_binary 'messages:uploadbtn',_binary 's:11:\"Upload file\";'),(_binary 'en',_binary 'messages:uploaddisabled',_binary 's:17:\"Uploads disabled.\";'),(_binary 'en',_binary 'messages:uploaddisabledtext',_binary 's:26:\"File uploads are disabled.\";'),(_binary 'en',_binary 'messages:uploaded-animate-svg',_binary 's:133:\"Found \"animate\" tag that might be changing href, using the \"from\" attribute <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-event-handler-on-svg',_binary 's:82:\"Setting event-handler attributes <code>$1=\"$2\"</code> is not allowed in SVG files.\";'),(_binary 'en',_binary 'messages:uploaded-hostile-svg',_binary 's:59:\"Found unsafe CSS in the style element of uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-href-attribute-svg',_binary 's:279:\"<a> elements can only link (href) to data: (embedded file), http:// or https://, or fragment (#, same-document) targets. For other elements, such as <image>, only data: and fragment are allowed. Try embedding images when exporting your SVG. Found <code>&lt;$1 $2=\"$3\"&gt;</code>.\";'),(_binary 'en',_binary 'messages:uploaded-href-unsafe-target-svg',_binary 's:95:\"Found href to unsafe data: URI target <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-image-filter-svg',_binary 's:86:\"Found image filter with URL: <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-remote-url-svg',_binary 's:114:\"SVG that sets any style attribute with remote URL is blocked. Found <code>$1=\"$2\"</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-script-svg',_binary 's:55:\"Found scriptable element \"$1\" in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-setting-event-handler-svg',_binary 's:108:\"Setting event-handler attributes is blocked, found <code>&lt;$1 $2=\"$3\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-setting-handler-svg',_binary 's:126:\"SVG that sets the \"handler\" attribute with remote/data/script is blocked. Found <code>$1=\"$2\"</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploaded-setting-href-svg',_binary 's:73:\"Using the \"set\" tag to add \"href\" attribute to parent element is blocked.\";'),(_binary 'en',_binary 'messages:uploaded-wrong-setting-svg',_binary 's:148:\"Using the \"set\" tag to add a remote/data/script target to any attribute is blocked. Found <code>&lt;set to=\"$1\"&gt;</code> in the uploaded SVG file.\";'),(_binary 'en',_binary 'messages:uploadedimage',_binary 's:17:\"uploaded \"[[$1]]\"\";'),(_binary 'en',_binary 'messages:uploaderror',_binary 's:12:\"Upload error\";'),(_binary 'en',_binary 'messages:uploadfooter',_binary 's:1:\"-\";'),(_binary 'en',_binary 'messages:uploadinvalidxml',_binary 's:49:\"The XML in the uploaded file could not be parsed.\";'),(_binary 'en',_binary 'messages:uploadlogpage',_binary 's:10:\"Upload log\";'),(_binary 'en',_binary 'messages:uploadlogpagetext',_binary 's:126:\"Below is a list of the most recent file uploads.\nSee the [[Special:NewFiles|gallery of new files]] for a more visual overview.\";'),(_binary 'en',_binary 'messages:uploadnewversion-linktext',_binary 's:33:\"Upload a new version of this file\";'),(_binary 'en',_binary 'messages:uploadnologin',_binary 's:13:\"Not logged in\";'),(_binary 'en',_binary 'messages:uploadnologintext',_binary 's:26:\"Please $1 to upload files.\";'),(_binary 'en',_binary 'messages:uploadscripted',_binary 's:92:\"This file contains HTML or script code that may be erroneously interpreted by a web browser.\";'),(_binary 'en',_binary 'messages:uploadscriptednamespace',_binary 's:66:\"This SVG file contains an illegal namespace \"<nowiki>$1</nowiki>\".\";'),(_binary 'en',_binary 'messages:uploadstash',_binary 's:12:\"Upload stash\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path',_binary 's:19:\"Path doesn\'t exist.\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-bad-format',_binary 's:35:\"Key \"$1\" is not in a proper format.\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-invalid',_binary 's:18:\"Path is not valid.\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-no-handler',_binary 's:40:\"No handler found for mime $1 of file $2.\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-unknown-type',_binary 's:18:\"Unknown type \"$1\".\";'),(_binary 'en',_binary 'messages:uploadstash-bad-path-unrecognized-thumb-name',_binary 's:24:\"Unrecognized thumb name.\";'),(_binary 'en',_binary 'messages:uploadstash-badtoken',_binary 's:98:\"Performing that action failed, perhaps because your editing credentials expired. Please try again.\";'),(_binary 'en',_binary 'messages:uploadstash-clear',_binary 's:19:\"Clear stashed files\";'),(_binary 'en',_binary 'messages:uploadstash-errclear',_binary 's:26:\"Clearing the files failed.\";'),(_binary 'en',_binary 'messages:uploadstash-exception',_binary 's:47:\"Could not store upload in the stash ($1): \"$2\".\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found',_binary 's:28:\"Key \"$1\" not found in stash.\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-missing-content-type',_binary 's:28:\"Missing content-type header.\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-no-local-path',_binary 's:30:\"No local path for scaled item.\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-no-remote-thumb',_binary 's:38:\"Fetching thumbnail failed: $1\nURL = $2\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-no-thumb',_binary 's:27:\"Could not obtain thumbnail.\";'),(_binary 'en',_binary 'messages:uploadstash-file-not-found-not-exists',_binary 's:38:\"Cannot find path, or not a plain file.\";'),(_binary 'en',_binary 'messages:uploadstash-file-too-large',_binary 's:41:\"Cannot serve a file larger than $1 bytes.\";'),(_binary 'en',_binary 'messages:uploadstash-no-such-key',_binary 's:32:\"No such key ($1), cannot remove.\";'),(_binary 'en',_binary 'messages:uploadstash-nofiles',_binary 's:26:\"You have no stashed files.\";'),(_binary 'en',_binary 'messages:uploadstash-not-logged-in',_binary 's:49:\"No user is logged in, files must belong to users.\";'),(_binary 'en',_binary 'messages:uploadstash-refresh',_binary 's:25:\"Refresh the list of files\";'),(_binary 'en',_binary 'messages:uploadstash-summary',_binary 's:193:\"This page provides access to files that are uploaded or in the process of uploading, but are not yet published to the wiki. These files are not visible to anyone but the user who uploaded them.\";'),(_binary 'en',_binary 'messages:uploadstash-thumbnail',_binary 's:14:\"view thumbnail\";'),(_binary 'en',_binary 'messages:uploadstash-wrong-owner',_binary 's:50:\"This file ($1) doesn\'t belong to the current user.\";'),(_binary 'en',_binary 'messages:uploadstash-zero-length',_binary 's:20:\"File is zero length.\";'),(_binary 'en',_binary 'messages:uploadtext',_binary 's:839:\"Use the form below to upload files.\nTo view or search previously uploaded files go to the [[Special:FileList|list of uploaded files]]. Uploads and reuploads are also logged in the [[Special:Log/upload|upload log]]. Deletions are logged in the [[Special:Log/delete|deletion log]].\n\nTo include a file in a page, use a link in one of the following forms:\n* <strong><code><nowiki>[[</nowiki>{{ns:file}}<nowiki>:File.jpg]]</nowiki></code></strong> to use the full version of the file\n* <strong><code><nowiki>[[</nowiki>{{ns:file}}<nowiki>:File.png|200px|thumb|left|Caption]]</nowiki></code></strong> to use a 200-pixel-wide rendition in a box in the left margin with the text \"Caption\" below\n* <strong><code><nowiki>[[</nowiki>{{ns:media}}<nowiki>:File.ogg]]</nowiki></code></strong> for directly linking to the file without displaying the file\";'),(_binary 'en',_binary 'messages:uploadvirus',_binary 's:38:\"The file contains a virus!\nDetails: $1\";'),(_binary 'en',_binary 'messages:uploadwarning',_binary 's:14:\"Upload warning\";'),(_binary 'en',_binary 'messages:uploadwarning-text',_binary 's:55:\"Please modify the file description below and try again.\";'),(_binary 'en',_binary 'messages:uploadwarning-text-nostash',_binary 's:70:\"Please re-upload the file, modify the description below and try again.\";'),(_binary 'en',_binary 'messages:user-mail-no-addy',_binary 's:45:\"Tried to send email without an email address.\";'),(_binary 'en',_binary 'messages:user-mail-no-body',_binary 's:61:\"Tried to send email with an empty or unreasonably short body.\";'),(_binary 'en',_binary 'messages:usercreated',_binary 's:33:\"{{GENDER:$3|Created}} on $1 at $2\";'),(_binary 'en',_binary 'messages:usercssispublic',_binary 's:99:\"Please note: CSS subpages should not contain confidential data as they are viewable by other users.\";'),(_binary 'en',_binary 'messages:usercsspreview',_binary 's:100:\"<strong>Remember that you are only previewing your user CSS.\nIt has not yet been published!</strong>\";'),(_binary 'en',_binary 'messages:usercssyoucanpreview',_binary 's:98:\"<strong>Tip:</strong> Use the \"{{int:showpreview}}\" button to test your new CSS before publishing.\";'),(_binary 'en',_binary 'messages:usereditcount',_binary 's:27:\"$1 {{PLURAL:$1|edit|edits}}\";'),(_binary 'en',_binary 'messages:userexists',_binary 's:64:\"Username entered already in use.\nPlease choose a different name.\";'),(_binary 'en',_binary 'messages:userinvalidconfigtitle',_binary 's:179:\"<strong>Warning:</strong> There is no skin \"$1\".\nCustom .css, .json, and .js pages use a lowercase title, e.g. {{ns:user}}:Foo/vector.css as opposed to {{ns:user}}:Foo/Vector.css.\";'),(_binary 'en',_binary 'messages:userjsdangerous',_binary 's:212:\"Please note: Scripts included on this page will be run any time you load a page. Malicious code added here could result in account compromise. The code will be executed when you preview your changes to this page.\";'),(_binary 'en',_binary 'messages:userjsispublic',_binary 's:106:\"Please note: JavaScript subpages should not contain confidential data as they are viewable by other users.\";'),(_binary 'en',_binary 'messages:userjsonispublic',_binary 's:100:\"Please note: JSON subpages should not contain confidential data as they are viewable by other users.\";'),(_binary 'en',_binary 'messages:userjsonpreview',_binary 's:116:\"<strong>Remember that you are only testing/previewing your user JSON config.\nIt has not yet been published!</strong>\";'),(_binary 'en',_binary 'messages:userjsonyoucanpreview',_binary 's:99:\"<strong>Tip:</strong> Use the \"{{int:showpreview}}\" button to test your new JSON before publishing.\";'),(_binary 'en',_binary 'messages:userjspreview',_binary 's:115:\"<strong>Remember that you are only testing/previewing your user JavaScript.\nIt has not yet been published!</strong>\";'),(_binary 'en',_binary 'messages:userjsyoucanpreview',_binary 's:105:\"<strong>Tip:</strong> Use the \"{{int:showpreview}}\" button to test your new JavaScript before publishing.\";'),(_binary 'en',_binary 'messages:userlogin-createanother',_binary 's:22:\"Create another account\";'),(_binary 'en',_binary 'messages:userlogin-helplink2',_binary 's:20:\"Help with logging in\";'),(_binary 'en',_binary 'messages:userlogin-joinproject',_binary 's:17:\"Join {{SITENAME}}\";'),(_binary 'en',_binary 'messages:userlogin-loggedin',_binary 's:92:\"You are already logged in as {{GENDER:$1|$1}}.\nUse the form below to log in as another user.\";'),(_binary 'en',_binary 'messages:userlogin-noaccount',_binary 's:22:\"Don\'t have an account?\";'),(_binary 'en',_binary 'messages:userlogin-reauth',_binary 's:62:\"You must log in again to verify that you are {{GENDER:$1|$1}}.\";'),(_binary 'en',_binary 'messages:userlogin-remembermypassword',_binary 's:17:\"Keep me logged in\";'),(_binary 'en',_binary 'messages:userlogin-resetpassword-link',_binary 's:21:\"Forgot your password?\";'),(_binary 'en',_binary 'messages:userlogin-signwithsecure',_binary 's:21:\"Use secure connection\";'),(_binary 'en',_binary 'messages:userlogin-yourname',_binary 's:8:\"Username\";'),(_binary 'en',_binary 'messages:userlogin-yourname-ph',_binary 's:19:\"Enter your username\";'),(_binary 'en',_binary 'messages:userlogin-yourpassword',_binary 's:8:\"Password\";'),(_binary 'en',_binary 'messages:userlogin-yourpassword-ph',_binary 's:19:\"Enter your password\";'),(_binary 'en',_binary 'messages:userlogout',_binary 's:7:\"Log out\";'),(_binary 'en',_binary 'messages:userlogout-continue',_binary 's:23:\"Do you want to log out?\";'),(_binary 'en',_binary 'messages:userlogout-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:userlogout-temp',_binary 's:96:\"Are you sure you want to log out? There will be no way to log back in to your temporary account.\";'),(_binary 'en',_binary 'messages:usermaildisabled',_binary 's:19:\"User email disabled\";'),(_binary 'en',_binary 'messages:usermaildisabledtext',_binary 's:49:\"You cannot send email to other users on this wiki\";'),(_binary 'en',_binary 'messages:usermessage-editor',_binary 's:16:\"System messenger\";'),(_binary 'en',_binary 'messages:usermessage-summary',_binary 's:23:\"Leaving system message.\";'),(_binary 'en',_binary 'messages:usermessage-template',_binary 's:21:\"MediaWiki:UserMessage\";'),(_binary 'en',_binary 'messages:username',_binary 's:23:\"{{GENDER:$1|Username}}:\";'),(_binary 'en',_binary 'messages:usernameinprogress',_binary 's:74:\"An account creation for this username is already in progress.\nPlease wait.\";'),(_binary 'en',_binary 'messages:userpage-userdoesnotexist',_binary 's:87:\"User account \"$1\" is not registered.\nPlease check if you want to create/edit this page.\";'),(_binary 'en',_binary 'messages:userpage-userdoesnotexist-view',_binary 's:36:\"User account \"$1\" is not registered.\";'),(_binary 'en',_binary 'messages:userrights',_binary 's:11:\"User rights\";'),(_binary 'en',_binary 'messages:userrights-cannot-shorten-expiry',_binary 's:152:\"You cannot bring forward the expiry of membership in group \"$1\". Only users with permission to add and remove this group can bring forward expiry times.\";'),(_binary 'en',_binary 'messages:userrights-changeable-col',_binary 's:21:\"Groups you can change\";'),(_binary 'en',_binary 'messages:userrights-conflict',_binary 's:72:\"Conflict of user rights changes! Please review and confirm your changes.\";'),(_binary 'en',_binary 'messages:userrights-editusergroup',_binary 's:30:\"Edit {{GENDER:$1|user}} groups\";'),(_binary 'en',_binary 'messages:userrights-expiry',_binary 's:8:\"Expires:\";'),(_binary 'en',_binary 'messages:userrights-expiry-current',_binary 's:10:\"Expires $1\";'),(_binary 'en',_binary 'messages:userrights-expiry-existing',_binary 's:32:\"Existing expiration time: $3, $2\";'),(_binary 'en',_binary 'messages:userrights-expiry-in-past',_binary 's:46:\"The expiry time for group \"$1\" is in the past.\";'),(_binary 'en',_binary 'messages:userrights-expiry-none',_binary 's:15:\"Does not expire\";'),(_binary 'en',_binary 'messages:userrights-expiry-options',_binary 's:91:\"1 day:1 day,1 week:1 week,1 month:1 month,3 months:3 months,6 months:6 months,1 year:1 year\";'),(_binary 'en',_binary 'messages:userrights-expiry-othertime',_binary 's:11:\"Other time:\";'),(_binary 'en',_binary 'messages:userrights-groups-help',_binary 's:366:\"You may alter the groups {{GENDER:$1|this user}} is in:\n* A checked box means the user is in that group.\n* An unchecked box means the user is not in that group.\n* A * indicates that you cannot remove the group once you have added it, or vice versa.\n* A # indicates that you can only put back the expiration time of this group membership; you cannot bring it forward.\";'),(_binary 'en',_binary 'messages:userrights-groupsmember',_binary 's:10:\"Member of:\";'),(_binary 'en',_binary 'messages:userrights-groupsmember-auto',_binary 's:19:\"Implicit member of:\";'),(_binary 'en',_binary 'messages:userrights-groupsmember-type',_binary 's:2:\"$1\";'),(_binary 'en',_binary 'messages:userrights-invalid-expiry',_binary 's:42:\"The expiry time for group \"$1\" is invalid.\";'),(_binary 'en',_binary 'messages:userrights-irreversible-marker',_binary 's:3:\"$1*\";'),(_binary 'en',_binary 'messages:userrights-lookup-user',_binary 's:13:\"Select a user\";'),(_binary 'en',_binary 'messages:userrights-no-interwiki',_binary 's:62:\"You do not have permission to edit user rights on other wikis.\";'),(_binary 'en',_binary 'messages:userrights-no-shorten-expiry-marker',_binary 's:3:\"$1#\";'),(_binary 'en',_binary 'messages:userrights-nodatabase',_binary 's:43:\"Database $1 does not exist or is not local.\";'),(_binary 'en',_binary 'messages:userrights-reason',_binary 's:7:\"Reason:\";'),(_binary 'en',_binary 'messages:userrights-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:userrights-systemuser',_binary 's:40:\"{{GENDER:$1|This user}} is a system user\";'),(_binary 'en',_binary 'messages:userrights-unchangeable-col',_binary 's:24:\"Groups you cannot change\";'),(_binary 'en',_binary 'messages:userrights-user-editname',_binary 's:17:\"Enter a username:\";'),(_binary 'en',_binary 'messages:userrights-viewusergroup',_binary 's:30:\"View {{GENDER:$1|user}} groups\";'),(_binary 'en',_binary 'messages:variantname-crh',_binary 's:3:\"crh\";'),(_binary 'en',_binary 'messages:variantname-crh-cyrl',_binary 's:8:\"crh-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-crh-latn',_binary 's:8:\"crh-Latn\";'),(_binary 'en',_binary 'messages:variantname-gan',_binary 's:3:\"gan\";'),(_binary 'en',_binary 'messages:variantname-gan-hans',_binary 's:4:\"Hans\";'),(_binary 'en',_binary 'messages:variantname-gan-hant',_binary 's:4:\"Hant\";'),(_binary 'en',_binary 'messages:variantname-ike-cans',_binary 's:8:\"ike-Cans\";'),(_binary 'en',_binary 'messages:variantname-ike-latn',_binary 's:8:\"ike-Latn\";'),(_binary 'en',_binary 'messages:variantname-iu',_binary 's:2:\"iu\";'),(_binary 'en',_binary 'messages:variantname-kk',_binary 's:2:\"kk\";'),(_binary 'en',_binary 'messages:variantname-kk-arab',_binary 's:7:\"kk-Arab\";'),(_binary 'en',_binary 'messages:variantname-kk-cn',_binary 's:5:\"kk-CN\";'),(_binary 'en',_binary 'messages:variantname-kk-cyrl',_binary 's:7:\"kk-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-kk-kz',_binary 's:5:\"kk-KZ\";'),(_binary 'en',_binary 'messages:variantname-kk-latn',_binary 's:7:\"kk-Latn\";'),(_binary 'en',_binary 'messages:variantname-kk-tr',_binary 's:5:\"kk-TR\";'),(_binary 'en',_binary 'messages:variantname-ku',_binary 's:2:\"ku\";'),(_binary 'en',_binary 'messages:variantname-ku-arab',_binary 's:7:\"ku-Arab\";'),(_binary 'en',_binary 'messages:variantname-ku-latn',_binary 's:7:\"ku-Latn\";'),(_binary 'en',_binary 'messages:variantname-shi',_binary 's:3:\"shi\";'),(_binary 'en',_binary 'messages:variantname-shi-latn',_binary 's:8:\"shi-Latn\";'),(_binary 'en',_binary 'messages:variantname-shi-tfng',_binary 's:8:\"shi-Tfng\";'),(_binary 'en',_binary 'messages:variantname-sr',_binary 's:2:\"sr\";'),(_binary 'en',_binary 'messages:variantname-sr-cyrl',_binary 's:7:\"sr-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-sr-ec',_binary 's:7:\"sr-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-sr-el',_binary 's:7:\"sr-Latn\";'),(_binary 'en',_binary 'messages:variantname-sr-latn',_binary 's:7:\"sr-Latn\";'),(_binary 'en',_binary 'messages:variantname-tg',_binary 's:2:\"tg\";'),(_binary 'en',_binary 'messages:variantname-tg-cyrl',_binary 's:7:\"tg-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-tg-latn',_binary 's:7:\"tg-Latn\";'),(_binary 'en',_binary 'messages:variantname-tly',_binary 's:3:\"tly\";'),(_binary 'en',_binary 'messages:variantname-tly-cyrl',_binary 's:8:\"tly-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-uz',_binary 's:2:\"uz\";'),(_binary 'en',_binary 'messages:variantname-uz-cyrl',_binary 's:7:\"uz-Cyrl\";'),(_binary 'en',_binary 'messages:variantname-uz-latn',_binary 's:7:\"uz-Latn\";'),(_binary 'en',_binary 'messages:variantname-zh',_binary 's:2:\"zh\";'),(_binary 'en',_binary 'messages:variantname-zh-cn',_binary 's:2:\"CN\";'),(_binary 'en',_binary 'messages:variantname-zh-hans',_binary 's:4:\"Hans\";'),(_binary 'en',_binary 'messages:variantname-zh-hant',_binary 's:4:\"Hant\";'),(_binary 'en',_binary 'messages:variantname-zh-hk',_binary 's:2:\"HK\";'),(_binary 'en',_binary 'messages:variantname-zh-mo',_binary 's:2:\"MO\";'),(_binary 'en',_binary 'messages:variantname-zh-my',_binary 's:2:\"MY\";'),(_binary 'en',_binary 'messages:variantname-zh-sg',_binary 's:2:\"SG\";'),(_binary 'en',_binary 'messages:variantname-zh-tw',_binary 's:2:\"TW\";'),(_binary 'en',_binary 'messages:variants',_binary 's:8:\"Variants\";'),(_binary 'en',_binary 'messages:vector-2022-prefs-talkpage',_binary 's:55:\"[[mw:Talk:Reading/Web/Desktop_Improvements|Discussion]]\";'),(_binary 'en',_binary 'messages:vector-action-addsection',_binary 's:9:\"Add topic\";'),(_binary 'en',_binary 'messages:vector-action-delete',_binary 's:6:\"Delete\";'),(_binary 'en',_binary 'messages:vector-action-move',_binary 's:4:\"Move\";'),(_binary 'en',_binary 'messages:vector-action-protect',_binary 's:7:\"Protect\";'),(_binary 'en',_binary 'messages:vector-action-toggle-sidebar',_binary 's:14:\"Toggle sidebar\";'),(_binary 'en',_binary 'messages:vector-action-undelete',_binary 's:8:\"Undelete\";'),(_binary 'en',_binary 'messages:vector-action-unprotect',_binary 's:17:\"Change protection\";'),(_binary 'en',_binary 'messages:vector-anon-user-menu-pages',_binary 's:28:\"Pages for logged out editors\";'),(_binary 'en',_binary 'messages:vector-anon-user-menu-pages-label',_binary 's:24:\"Learn more about editing\";'),(_binary 'en',_binary 'messages:vector-anon-user-menu-pages-learn',_binary 's:10:\"learn more\";'),(_binary 'en',_binary 'messages:vector-article-tools-nav-label',_binary 's:5:\"Tools\";'),(_binary 'en',_binary 'messages:vector-intro-page',_binary 's:17:\"Help:Introduction\";'),(_binary 'en',_binary 'messages:vector-jumptocontent',_binary 's:15:\"Jump to content\";'),(_binary 'en',_binary 'messages:vector-jumptonavigation',_binary 's:18:\"Jump to navigation\";'),(_binary 'en',_binary 'messages:vector-jumptosearch',_binary 's:14:\"Jump to search\";'),(_binary 'en',_binary 'messages:vector-language-button-aria-label',_binary 's:89:\"Go to an article in another language. Available in {{PLURAL:$1|$1 language|$1 languages}}\";'),(_binary 'en',_binary 'messages:vector-language-button-label',_binary 's:38:\"{{PLURAL:$1|$1 language|$1 languages}}\";'),(_binary 'en',_binary 'messages:vector-language-redirect-to-top',_binary 's:124:\"On this {{SITENAME}} the language links are at the top of the page across from the article title. [[#p-lang-btn|Go to top]].\";'),(_binary 'en',_binary 'messages:vector-language-variant-switcher-label',_binary 's:23:\"Change language variant\";'),(_binary 'en',_binary 'messages:vector-languages',_binary 's:9:\"Languages\";'),(_binary 'en',_binary 'messages:vector-main-menu-tooltip',_binary 's:9:\"Main menu\";'),(_binary 'en',_binary 'messages:vector-more-actions',_binary 's:4:\"More\";'),(_binary 'en',_binary 'messages:vector-no-language-button-aria-label',_binary 's:77:\"This article exist only in this language. Add the article for other languages\";'),(_binary 'en',_binary 'messages:vector-no-language-button-label',_binary 's:13:\"Add languages\";'),(_binary 'en',_binary 'messages:vector-opt-out',_binary 's:18:\"Switch to old look\";'),(_binary 'en',_binary 'messages:vector-opt-out-tooltip',_binary 's:75:\"Change your settings to go back to the old look of the skin (legacy Vector)\";'),(_binary 'en',_binary 'messages:vector-search-loader',_binary 's:26:\"Loading search suggestions\";'),(_binary 'en',_binary 'messages:vector-searchsuggest-containing',_binary 's:98:\"Search for pages containing <strong class=\"cdx-typeahead-search__search-footer__query\">$1</strong>\";'),(_binary 'en',_binary 'messages:vector-site-nav-label',_binary 's:4:\"Site\";'),(_binary 'en',_binary 'messages:vector-skin-desc',_binary 's:195:\"Provides 2 Vector skins:\n* 2011 - The Modern version of MonoBook with fresh look and many usability improvements.\n* 2022 - The Vector built as part of the WMF [[mw:Desktop Improvements]] project.\";'),(_binary 'en',_binary 'messages:vector-specialversion-name',_binary 's:6:\"Vector\";'),(_binary 'en',_binary 'messages:vector-toc-beginning',_binary 's:9:\"Beginning\";'),(_binary 'en',_binary 'messages:vector-toc-collapsible-button-label',_binary 's:28:\"Toggle the table of contents\";'),(_binary 'en',_binary 'messages:vector-toc-heading',_binary 's:8:\"Contents\";'),(_binary 'en',_binary 'messages:vector-toc-menu-tooltip',_binary 's:17:\"Table of Contents\";'),(_binary 'en',_binary 'messages:vector-toc-toggle-button-label',_binary 's:20:\"Toggle $1 subsection\";'),(_binary 'en',_binary 'messages:vector-toc-toggle-position-sidebar',_binary 's:15:\"move to sidebar\";'),(_binary 'en',_binary 'messages:vector-toc-toggle-position-title',_binary 's:4:\"hide\";'),(_binary 'en',_binary 'messages:vector-view-create',_binary 's:6:\"Create\";'),(_binary 'en',_binary 'messages:vector-view-edit',_binary 's:4:\"Edit\";'),(_binary 'en',_binary 'messages:vector-view-history',_binary 's:12:\"View history\";'),(_binary 'en',_binary 'messages:vector-view-view',_binary 's:4:\"Read\";'),(_binary 'en',_binary 'messages:vector-view-viewsource',_binary 's:11:\"View source\";'),(_binary 'en',_binary 'messages:vector.css',_binary 's:62:\"/* All CSS here will be loaded for users of the Vector skin */\";'),(_binary 'en',_binary 'messages:vector.js',_binary 's:69:\"/* All JavaScript here will be loaded for users of the Vector skin */\";'),(_binary 'en',_binary 'messages:verification-error',_binary 's:41:\"This file did not pass file verification.\";'),(_binary 'en',_binary 'messages:version',_binary 's:7:\"Version\";'),(_binary 'en',_binary 'messages:version-antispam',_binary 's:15:\"Spam prevention\";'),(_binary 'en',_binary 'messages:version-api',_binary 's:3:\"API\";'),(_binary 'en',_binary 'messages:version-credits-not-found',_binary 's:61:\"No detailed credits information was found for this extension.\";'),(_binary 'en',_binary 'messages:version-credits-summary',_binary 's:105:\"We would like to recognize the following persons for their contribution to [[Special:Version|MediaWiki]].\";'),(_binary 'en',_binary 'messages:version-credits-title',_binary 's:14:\"Credits for $1\";'),(_binary 'en',_binary 'messages:version-db-mariadb-url',_binary 's:20:\"https://mariadb.org/\";'),(_binary 'en',_binary 'messages:version-db-mysql-url',_binary 's:22:\"https://www.mysql.com/\";'),(_binary 'en',_binary 'messages:version-db-percona-url',_binary 's:46:\"http://www.percona.com/software/percona-server\";'),(_binary 'en',_binary 'messages:version-db-postgres-url',_binary 's:26:\"http://www.postgresql.org/\";'),(_binary 'en',_binary 'messages:version-db-sqlite-url',_binary 's:23:\"https://www.sqlite.org/\";'),(_binary 'en',_binary 'messages:version-editors',_binary 's:7:\"Editors\";'),(_binary 'en',_binary 'messages:version-entrypoints',_binary 's:16:\"Entry point URLs\";'),(_binary 'en',_binary 'messages:version-entrypoints-api-php',_binary 's:74:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:api.php api.php]\";'),(_binary 'en',_binary 'messages:version-entrypoints-articlepath',_binary 's:86:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgArticlePath Article path]\";'),(_binary 'en',_binary 'messages:version-entrypoints-header-entrypoint',_binary 's:11:\"Entry point\";'),(_binary 'en',_binary 'messages:version-entrypoints-header-url',_binary 's:3:\"URL\";'),(_binary 'en',_binary 'messages:version-entrypoints-index-php',_binary 's:78:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:index.php index.php]\";'),(_binary 'en',_binary 'messages:version-entrypoints-rest-php',_binary 's:76:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:rest.php rest.php]\";'),(_binary 'en',_binary 'messages:version-entrypoints-scriptpath',_binary 's:84:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgScriptPath Script path]\";'),(_binary 'en',_binary 'messages:version-ext-colheader-credits',_binary 's:7:\"Authors\";'),(_binary 'en',_binary 'messages:version-ext-colheader-description',_binary 's:11:\"Description\";'),(_binary 'en',_binary 'messages:version-ext-colheader-license',_binary 's:7:\"License\";'),(_binary 'en',_binary 'messages:version-ext-colheader-name',_binary 's:9:\"Extension\";'),(_binary 'en',_binary 'messages:version-ext-colheader-version',_binary 's:7:\"Version\";'),(_binary 'en',_binary 'messages:version-ext-license',_binary 's:7:\"License\";'),(_binary 'en',_binary 'messages:version-extensions',_binary 's:20:\"Installed extensions\";'),(_binary 'en',_binary 'messages:version-hook-name',_binary 's:9:\"Hook name\";'),(_binary 'en',_binary 'messages:version-hook-subscribedby',_binary 's:13:\"Subscribed by\";'),(_binary 'en',_binary 'messages:version-hooks',_binary 's:5:\"Hooks\";'),(_binary 'en',_binary 'messages:version-libraries',_binary 's:19:\"Installed libraries\";'),(_binary 'en',_binary 'messages:version-libraries-authors',_binary 's:7:\"Authors\";'),(_binary 'en',_binary 'messages:version-libraries-description',_binary 's:11:\"Description\";'),(_binary 'en',_binary 'messages:version-libraries-library',_binary 's:7:\"Library\";'),(_binary 'en',_binary 'messages:version-libraries-license',_binary 's:7:\"License\";'),(_binary 'en',_binary 'messages:version-libraries-version',_binary 's:7:\"Version\";'),(_binary 'en',_binary 'messages:version-license',_binary 's:17:\"MediaWiki License\";'),(_binary 'en',_binary 'messages:version-license-info',_binary 's:820:\"MediaWiki is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.\n\nMediaWiki is distributed in the hope that it will be useful, but <em>WITHOUT ANY WARRANTY</em>; without even the implied warranty of <strong>MERCHANTABILITY</strong> or <strong>FITNESS FOR A PARTICULAR PURPOSE</strong>. See the GNU General Public License for more details.\n\nYou should have received [{{SERVER}}{{SCRIPTPATH}}/COPYING a copy of the GNU General Public License] along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA or [//www.gnu.org/licenses/old-licenses/gpl-2.0.html read it online].\";'),(_binary 'en',_binary 'messages:version-license-not-found',_binary 's:61:\"No detailed license information was found for this extension.\";'),(_binary 'en',_binary 'messages:version-license-title',_binary 's:14:\"License for $1\";'),(_binary 'en',_binary 'messages:version-mediahandlers',_binary 's:14:\"Media handlers\";'),(_binary 'en',_binary 'messages:version-no-ext-name',_binary 's:9:\"[no name]\";'),(_binary 'en',_binary 'messages:version-other',_binary 's:5:\"Other\";'),(_binary 'en',_binary 'messages:version-parser-extensiontags',_binary 's:21:\"Parser extension tags\";'),(_binary 'en',_binary 'messages:version-parser-function-hooks',_binary 's:21:\"Parser function hooks\";'),(_binary 'en',_binary 'messages:version-parserhooks',_binary 's:12:\"Parser hooks\";'),(_binary 'en',_binary 'messages:version-poweredby-credits',_binary 's:105:\"This wiki is powered by <strong>[https://www.mediawiki.org/ MediaWiki]</strong>, copyright © 2001-$1 $2.\";'),(_binary 'en',_binary 'messages:version-poweredby-others',_binary 's:6:\"others\";'),(_binary 'en',_binary 'messages:version-poweredby-translators',_binary 's:29:\"translatewiki.net translators\";'),(_binary 'en',_binary 'messages:version-poweredby-various',_binary 's:15:\"Various authors\";'),(_binary 'en',_binary 'messages:version-skin-colheader-name',_binary 's:4:\"Skin\";'),(_binary 'en',_binary 'messages:version-skins',_binary 's:15:\"Installed skins\";'),(_binary 'en',_binary 'messages:version-software',_binary 's:18:\"Installed software\";'),(_binary 'en',_binary 'messages:version-software-product',_binary 's:7:\"Product\";'),(_binary 'en',_binary 'messages:version-software-version',_binary 's:7:\"Version\";'),(_binary 'en',_binary 'messages:version-specialpages',_binary 's:13:\"Special pages\";'),(_binary 'en',_binary 'messages:version-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:version-variables',_binary 's:9:\"Variables\";'),(_binary 'en',_binary 'messages:version-version',_binary 's:4:\"($1)\";'),(_binary 'en',_binary 'messages:versionrequired',_binary 's:32:\"Version $1 of MediaWiki required\";'),(_binary 'en',_binary 'messages:versionrequiredtext',_binary 's:91:\"Version $1 of MediaWiki is required to use this page.\nSee [[Special:Version|version page]].\";'),(_binary 'en',_binary 'messages:video-dims',_binary 's:12:\"$1, $2 × $3\";'),(_binary 'en',_binary 'messages:view',_binary 's:4:\"View\";'),(_binary 'en',_binary 'messages:view-pool-contention',_binary 's:15:\"pool contention\";'),(_binary 'en',_binary 'messages:view-pool-dirty-output',_binary 's:23:\"parser cache is expired\";'),(_binary 'en',_binary 'messages:view-pool-error',_binary 's:159:\"Sorry, the servers are overloaded at the moment.\nToo many users are trying to view this page.\nPlease wait a while before you try to access this page again.\n\n$1\";'),(_binary 'en',_binary 'messages:view-pool-timeout',_binary 's:13:\"pool overload\";'),(_binary 'en',_binary 'messages:viewcount',_binary 's:56:\"This page has been accessed {{PLURAL:$1|once|$1 times}}.\";'),(_binary 'en',_binary 'messages:viewdeleted',_binary 's:8:\"View $1?\";'),(_binary 'en',_binary 'messages:viewdeleted_short',_binary 's:52:\"View {{PLURAL:$1|one deleted edit|$1 deleted edits}}\";'),(_binary 'en',_binary 'messages:viewdeletedpage',_binary 's:18:\"View deleted pages\";'),(_binary 'en',_binary 'messages:viewhelppage',_binary 's:14:\"View help page\";'),(_binary 'en',_binary 'messages:viewinguserrights',_binary 's:76:\"Viewing user groups of {{GENDER:$1|user}} <strong>[[User:$1|$1]]</strong> $2\";'),(_binary 'en',_binary 'messages:viewpagelogs',_binary 's:23:\"View logs for this page\";'),(_binary 'en',_binary 'messages:viewpagelogs-lowercase',_binary 's:23:\"view logs for this page\";'),(_binary 'en',_binary 'messages:viewprevnext',_binary 's:40:\"View ($1 {{int:pipe-separator}} $2) ($3)\";'),(_binary 'en',_binary 'messages:views',_binary 's:5:\"Views\";'),(_binary 'en',_binary 'messages:viewsource',_binary 's:11:\"View source\";'),(_binary 'en',_binary 'messages:viewsource-title',_binary 's:18:\"View source for $1\";'),(_binary 'en',_binary 'messages:viewsourcelink',_binary 's:11:\"view source\";'),(_binary 'en',_binary 'messages:viewsourceold',_binary 's:11:\"view source\";'),(_binary 'en',_binary 'messages:viewsourcetext',_binary 's:46:\"You can view and copy the source of this page.\";'),(_binary 'en',_binary 'messages:viewtalkpage',_binary 's:15:\"View discussion\";'),(_binary 'en',_binary 'messages:viewyourtext',_binary 's:77:\"You can view and copy the source of <strong>your edits</strong> to this page.\";'),(_binary 'en',_binary 'messages:virus-badscanner',_binary 's:53:\"Bad configuration: Unknown virus scanner: <em>$1</em>\";'),(_binary 'en',_binary 'messages:virus-scanfailed',_binary 's:21:\"scan failed (code $1)\";'),(_binary 'en',_binary 'messages:virus-unknownscanner',_binary 's:18:\"unknown antivirus:\";'),(_binary 'en',_binary 'messages:wantedcategories',_binary 's:17:\"Wanted categories\";'),(_binary 'en',_binary 'messages:wantedcategories-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:wantedfiles',_binary 's:12:\"Wanted files\";'),(_binary 'en',_binary 'messages:wantedfiles-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:wantedfiletext-cat',_binary 's:244:\"The following files are used but do not exist. Files from foreign repositories may be listed despite existing. Any such false positives will be <del>struck out</del>. Additionally, pages that embed files that do not exist are listed in [[:$1]].\";'),(_binary 'en',_binary 'messages:wantedfiletext-cat-noforeign',_binary 's:124:\"The following files are used but do not exist. Additionally, pages that embed files that do not exist are listed in [[:$1]].\";'),(_binary 'en',_binary 'messages:wantedfiletext-nocat',_binary 's:166:\"The following files are used but do not exist. Files from foreign repositories may be listed despite existing. Any such false positives will be <del>struck out</del>.\";'),(_binary 'en',_binary 'messages:wantedfiletext-nocat-noforeign',_binary 's:46:\"The following files are used but do not exist.\";'),(_binary 'en',_binary 'messages:wantedpages',_binary 's:12:\"Wanted pages\";'),(_binary 'en',_binary 'messages:wantedpages-badtitle',_binary 's:31:\"Invalid title in result set: $1\";'),(_binary 'en',_binary 'messages:wantedpages-summary',_binary 's:251:\"List of non-existing pages with the most links to them, excluding pages which only have redirects linking to them. For a list of non-existent pages that have redirects linking to them, see [[{{#special:BrokenRedirects}}|the list of broken redirects]].\";'),(_binary 'en',_binary 'messages:wantedtemplates',_binary 's:16:\"Wanted templates\";'),(_binary 'en',_binary 'messages:wantedtemplates-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:watch',_binary 's:5:\"Watch\";'),(_binary 'en',_binary 'messages:watching',_binary 's:11:\"Watching...\";'),(_binary 'en',_binary 'messages:watchlist',_binary 's:9:\"Watchlist\";'),(_binary 'en',_binary 'messages:watchlist-details',_binary 's:74:\"{{PLURAL:$1|$1 page is|$1 pages are}} on your Watchlist (plus talk pages).\";'),(_binary 'en',_binary 'messages:watchlist-expires-in-aria-label',_binary 's:23:\"Expiring watchlist item\";'),(_binary 'en',_binary 'messages:watchlist-expiring-days-full-text',_binary 's:50:\"{{PLURAL:$1|1 day|$1 days}} left in your watchlist\";'),(_binary 'en',_binary 'messages:watchlist-expiring-hours-full-text',_binary 's:34:\"A few hours left in your watchlist\";'),(_binary 'en',_binary 'messages:watchlist-expiry-days-left',_binary 's:33:\"{{PLURAL:$1|$1 day|$1 days}} left\";'),(_binary 'en',_binary 'messages:watchlist-expiry-hours-left',_binary 's:16:\"A few hours left\";'),(_binary 'en',_binary 'messages:watchlist-expiry-options',_binary 's:84:\"Permanent:infinite,1 week:1 week,1 month:1 month,3 months:3 months,6 months:6 months\";'),(_binary 'en',_binary 'messages:watchlist-hide',_binary 's:4:\"Hide\";'),(_binary 'en',_binary 'messages:watchlist-options',_binary 's:17:\"Watchlist options\";'),(_binary 'en',_binary 'messages:watchlist-submit',_binary 's:4:\"Show\";'),(_binary 'en',_binary 'messages:watchlist-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:watchlist-unwatch',_binary 's:2:\"×\";'),(_binary 'en',_binary 'messages:watchlist-unwatch-undo',_binary 's:1:\"+\";'),(_binary 'en',_binary 'messages:watchlistanontext',_binary 's:54:\"Please log in to view or edit items on your watchlist.\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-done',_binary 's:32:\"Your watchlist has been cleared.\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-explain',_binary 's:53:\"All of the titles will be removed from your watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-jobqueue',_binary 's:57:\"Your watchlist is being cleared. This may take some time!\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-legend',_binary 's:15:\"Clear watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-removed',_binary 's:49:\"{{PLURAL:$1|1 title was|$1 titles were}} removed:\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-submit',_binary 's:40:\"Clear the watchlist (This is permanent!)\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-title',_binary 's:15:\"Clear watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-clear-titles',_binary 's:7:\"Titles:\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-done',_binary 's:76:\"{{PLURAL:$1|A single title was|$1 titles were}} removed from your watchlist:\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-explain',_binary 's:197:\"Titles on your watchlist are shown below.\nTo remove a title, check the box next to it, and click \"{{int:Watchlistedit-normal-submit}}\".\nYou can also [[Special:EditWatchlist/raw|edit the raw list]].\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-legend',_binary 's:28:\"Remove titles from watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-submit',_binary 's:13:\"Remove titles\";'),(_binary 'en',_binary 'messages:watchlistedit-normal-title',_binary 's:14:\"Edit watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-added',_binary 's:47:\"{{PLURAL:$1|1 title was|$1 titles were}} added:\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-done',_binary 's:32:\"Your watchlist has been updated.\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-explain',_binary 's:241:\"Titles on your watchlist are shown below, and can be edited by adding to and removing from the list;\none title per line.\nWhen finished, click \"{{int:Watchlistedit-raw-submit}}\".\nYou can also [[Special:EditWatchlist|use the standard editor]].\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-legend',_binary 's:18:\"Edit raw watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-removed',_binary 's:49:\"{{PLURAL:$1|1 title was|$1 titles were}} removed:\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-submit',_binary 's:16:\"Update watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-title',_binary 's:18:\"Edit raw watchlist\";'),(_binary 'en',_binary 'messages:watchlistedit-raw-titles',_binary 's:7:\"Titles:\";'),(_binary 'en',_binary 'messages:watchlistedit-too-many',_binary 's:74:\"Your watchlist has been updated. There are too many pages to display here.\";'),(_binary 'en',_binary 'messages:watchlistfor2',_binary 's:6:\"For $1\";'),(_binary 'en',_binary 'messages:watchlistnotwatchable',_binary 's:22:\"Page is not watchable.\";'),(_binary 'en',_binary 'messages:watchlisttools-clear',_binary 's:19:\"Clear the watchlist\";'),(_binary 'en',_binary 'messages:watchlisttools-edit',_binary 's:23:\"View and edit watchlist\";'),(_binary 'en',_binary 'messages:watchlisttools-raw',_binary 's:18:\"Edit raw watchlist\";'),(_binary 'en',_binary 'messages:watchlisttools-view',_binary 's:21:\"View relevant changes\";'),(_binary 'en',_binary 'messages:watchnologin',_binary 's:13:\"Not logged in\";'),(_binary 'en',_binary 'messages:watchthis',_binary 's:15:\"Watch this page\";'),(_binary 'en',_binary 'messages:watchthispage',_binary 's:15:\"Watch this page\";'),(_binary 'en',_binary 'messages:watchthisupload',_binary 's:15:\"Watch this file\";'),(_binary 'en',_binary 'messages:wed',_binary 's:3:\"Wed\";'),(_binary 'en',_binary 'messages:wednesday',_binary 's:9:\"Wednesday\";'),(_binary 'en',_binary 'messages:wednesday-at',_binary 's:15:\"Wednesday at $1\";'),(_binary 'en',_binary 'messages:weeks',_binary 's:30:\"{{PLURAL:$1|$1 week|$1 weeks}}\";'),(_binary 'en',_binary 'messages:welcomecreation-msg',_binary 's:112:\"Your account has been created.\nYou can change your {{SITENAME}} [[Special:Preferences|preferences]] if you wish.\";'),(_binary 'en',_binary 'messages:welcomeuser',_binary 's:12:\"Welcome, $1!\";'),(_binary 'en',_binary 'messages:whatlinkshere',_binary 's:15:\"What links here\";'),(_binary 'en',_binary 'messages:whatlinkshere-count',_binary 's:38:\"Displayed $1 {{PLURAL:$1|item|items}}.\";'),(_binary 'en',_binary 'messages:whatlinkshere-hideimages',_binary 's:15:\"Hide file links\";'),(_binary 'en',_binary 'messages:whatlinkshere-hidelinks',_binary 's:10:\"Hide links\";'),(_binary 'en',_binary 'messages:whatlinkshere-hideredirs',_binary 's:14:\"Hide redirects\";'),(_binary 'en',_binary 'messages:whatlinkshere-hidetrans',_binary 's:18:\"Hide transclusions\";'),(_binary 'en',_binary 'messages:whatlinkshere-links',_binary 's:9:\"← links\";'),(_binary 'en',_binary 'messages:whatlinkshere-next',_binary 's:26:\"{{PLURAL:$1|next|next $1}}\";'),(_binary 'en',_binary 'messages:whatlinkshere-page',_binary 's:5:\"Page:\";'),(_binary 'en',_binary 'messages:whatlinkshere-prev',_binary 's:34:\"{{PLURAL:$1|previous|previous $1}}\";'),(_binary 'en',_binary 'messages:whatlinkshere-sectionredir',_binary 's:24:\"redirect to section \"$1\"\";'),(_binary 'en',_binary 'messages:whatlinkshere-submit',_binary 's:2:\"Go\";'),(_binary 'en',_binary 'messages:whatlinkshere-summary',_binary 's:0:\"\";'),(_binary 'en',_binary 'messages:whatlinkshere-title',_binary 's:23:\"Pages that link to \"$1\"\";'),(_binary 'en',_binary 'messages:whitelistedittext',_binary 's:24:\"Please $1 to edit pages.\";'),(_binary 'en',_binary 'messages:widthheight',_binary 's:8:\"$1 × $2\";'),(_binary 'en',_binary 'messages:widthheightpage',_binary 's:37:\"$1 × $2, $3 {{PLURAL:$3|page|pages}}\";'),(_binary 'en',_binary 'messages:windows-nonascii-filename',_binary 's:61:\"This wiki does not support filenames with special characters.\";'),(_binary 'en',_binary 'messages:withoutinterwiki',_binary 's:28:\"Pages without language links\";'),(_binary 'en',_binary 'messages:withoutinterwiki-legend',_binary 's:6:\"Prefix\";'),(_binary 'en',_binary 'messages:withoutinterwiki-submit',_binary 's:4:\"Show\";'),(_binary 'en',_binary 'messages:withoutinterwiki-summary',_binary 's:59:\"The following pages do not link to other language versions.\";'),(_binary 'en',_binary 'messages:wlheader-enotif',_binary 's:30:\"Email notification is enabled.\";'),(_binary 'en',_binary 'messages:wlheader-showupdated',_binary 's:92:\"Pages that have been changed since you last visited them are shown in <strong>bold</strong>.\";'),(_binary 'en',_binary 'messages:wlnote',_binary 's:151:\"Below {{PLURAL:$1|is the last change|are the last <strong>$1</strong> changes}} in the last {{PLURAL:$2|hour|<strong>$2</strong> hours}}, as of $3, $4.\";'),(_binary 'en',_binary 'messages:wlshowhideanons',_binary 's:15:\"anonymous users\";'),(_binary 'en',_binary 'messages:wlshowhidebots',_binary 's:4:\"bots\";'),(_binary 'en',_binary 'messages:wlshowhidecategorization',_binary 's:19:\"page categorization\";'),(_binary 'en',_binary 'messages:wlshowhideliu',_binary 's:16:\"registered users\";'),(_binary 'en',_binary 'messages:wlshowhidemine',_binary 's:8:\"my edits\";'),(_binary 'en',_binary 'messages:wlshowhideminor',_binary 's:11:\"minor edits\";'),(_binary 'en',_binary 'messages:wlshowhidepatr',_binary 's:15:\"patrolled edits\";'),(_binary 'en',_binary 'messages:wlshowtime',_binary 's:26:\"Period of time to display:\";'),(_binary 'en',_binary 'messages:word-separator',_binary 's:5:\"&#32;\";'),(_binary 'en',_binary 'messages:wrongpassword',_binary 's:57:\"Incorrect username or password entered.\nPlease try again.\";'),(_binary 'en',_binary 'messages:wrongpasswordempty',_binary 's:45:\"Password entered was blank.\nPlease try again.\";'),(_binary 'en',_binary 'messages:xffblockreason',_binary 's:158:\"An IP address present in the X-Forwarded-For header, either yours or that of a proxy server you are using, has been blocked. The original block reason was: $1\";'),(_binary 'en',_binary 'messages:xml-error-string',_binary 's:35:\"$1 at line $2, col $3 (byte $4): $5\";'),(_binary 'en',_binary 'messages:year',_binary 's:24:\"From year (and earlier):\";'),(_binary 'en',_binary 'messages:years',_binary 's:30:\"{{PLURAL:$1|$1 year|$1 years}}\";'),(_binary 'en',_binary 'messages:yesterday-at',_binary 's:15:\"Yesterday at $1\";'),(_binary 'en',_binary 'messages:youhavenewmessages',_binary 's:31:\"{{PLURAL:$3|You have}} $1 ($2).\";'),(_binary 'en',_binary 'messages:youhavenewmessagesfromusers',_binary 's:72:\"{{PLURAL:$4|You have}} $1 from {{PLURAL:$3|another user|$3 users}} ($2).\";'),(_binary 'en',_binary 'messages:youhavenewmessagesmanyusers',_binary 's:33:\"You have $1 from many users ($2).\";'),(_binary 'en',_binary 'messages:yourdiff',_binary 's:11:\"Differences\";'),(_binary 'en',_binary 'messages:yourdomainname',_binary 's:12:\"Your domain:\";'),(_binary 'en',_binary 'messages:youremail',_binary 's:6:\"Email:\";'),(_binary 'en',_binary 'messages:yourgender',_binary 's:34:\"How do you prefer to be described?\";'),(_binary 'en',_binary 'messages:yourlanguage',_binary 's:9:\"Language:\";'),(_binary 'en',_binary 'messages:yourname',_binary 's:9:\"Username:\";'),(_binary 'en',_binary 'messages:yournick',_binary 's:14:\"New signature:\";'),(_binary 'en',_binary 'messages:yourpassword',_binary 's:9:\"Password:\";'),(_binary 'en',_binary 'messages:yourpasswordagain',_binary 's:16:\"Retype password:\";'),(_binary 'en',_binary 'messages:yourrealname',_binary 's:10:\"Real name:\";'),(_binary 'en',_binary 'messages:yourtext',_binary 's:9:\"Your text\";'),(_binary 'en',_binary 'messages:yourvariant',_binary 's:25:\"Content language variant:\";'),(_binary 'en',_binary 'messages:zip-bad',_binary 's:99:\"The file is a corrupt or otherwise unreadable ZIP file.\nIt cannot be properly checked for security.\";'),(_binary 'en',_binary 'messages:zip-file-open-error',_binary 's:62:\"An error was encountered when opening the file for ZIP checks.\";'),(_binary 'en',_binary 'messages:zip-unsupported',_binary 's:117:\"The file is a ZIP file that uses ZIP features not supported by MediaWiki.\nIt cannot be properly checked for security.\";'),(_binary 'en',_binary 'messages:zip-wrong-format',_binary 's:38:\"The specified file was not a ZIP file.\";'),(_binary 'en',_binary 'minimumGroupingDigits',_binary 'N;'),(_binary 'en',_binary 'namespaceAliases',_binary 'a:2:{s:5:\"Image\";i:6;s:10:\"Image_talk\";i:7;}'),(_binary 'en',_binary 'namespaceGenderAliases',_binary 'a:0:{}'),(_binary 'en',_binary 'namespaceNames',_binary 'a:17:{i:-2;s:5:\"Media\";i:-1;s:7:\"Special\";i:0;s:0:\"\";i:1;s:4:\"Talk\";i:2;s:4:\"User\";i:3;s:9:\"User_talk\";i:5;s:7:\"$1_talk\";i:6;s:4:\"File\";i:7;s:9:\"File_talk\";i:8;s:9:\"MediaWiki\";i:9;s:14:\"MediaWiki_talk\";i:10;s:8:\"Template\";i:11;s:13:\"Template_talk\";i:12;s:4:\"Help\";i:13;s:9:\"Help_talk\";i:14;s:8:\"Category\";i:15;s:13:\"Category_talk\";}'),(_binary 'en',_binary 'originalFallbackSequence',_binary 'a:0:{}'),(_binary 'en',_binary 'pluralRuleTypes',_binary 'a:1:{i:0;s:3:\"one\";}'),(_binary 'en',_binary 'pluralRules',_binary 'a:1:{i:0;s:26:\"i = 1 and v = 0 @integer 1\";}'),(_binary 'en',_binary 'preload',_binary 'a:3:{s:8:\"messages\";a:111:{s:9:\"aboutpage\";s:13:\"Project:About\";s:9:\"aboutsite\";s:18:\"About {{SITENAME}}\";s:17:\"accesskey-ca-edit\";s:1:\"e\";s:20:\"accesskey-ca-history\";s:1:\"h\";s:23:\"accesskey-ca-nstab-main\";s:1:\"c\";s:17:\"accesskey-ca-talk\";s:1:\"t\";s:23:\"accesskey-ca-viewsource\";s:1:\"e\";s:25:\"accesskey-n-currentevents\";s:0:\"\";s:16:\"accesskey-n-help\";s:0:\"\";s:32:\"accesskey-n-mainpage-description\";s:1:\"z\";s:18:\"accesskey-n-portal\";s:0:\"\";s:22:\"accesskey-n-randompage\";s:1:\"x\";s:25:\"accesskey-n-recentchanges\";s:1:\"r\";s:16:\"accesskey-p-logo\";s:0:\"\";s:18:\"accesskey-pt-login\";s:1:\"o\";s:26:\"accesskey-pt-createaccount\";s:0:\"\";s:16:\"accesskey-search\";s:1:\"f\";s:25:\"accesskey-search-fulltext\";s:0:\"\";s:19:\"accesskey-search-go\";s:0:\"\";s:16:\"accesskey-t-info\";s:0:\"\";s:21:\"accesskey-t-permalink\";s:0:\"\";s:17:\"accesskey-t-print\";s:1:\"p\";s:31:\"accesskey-t-recentchangeslinked\";s:1:\"k\";s:24:\"accesskey-t-specialpages\";s:1:\"q\";s:25:\"accesskey-t-whatlinkshere\";s:1:\"j\";s:7:\"actions\";s:7:\"Actions\";s:10:\"anonnotice\";s:1:\"-\";s:8:\"brackets\";s:4:\"[$1]\";s:15:\"comma-separator\";s:6:\",&#32;\";s:13:\"currentevents\";s:14:\"Current events\";s:17:\"currentevents-url\";s:22:\"Project:Current events\";s:14:\"disclaimerpage\";s:26:\"Project:General disclaimer\";s:11:\"disclaimers\";s:11:\"Disclaimers\";s:4:\"edit\";s:4:\"Edit\";s:11:\"editsection\";s:4:\"edit\";s:15:\"editsectionhint\";s:16:\"Edit section: $1\";s:4:\"help\";s:4:\"Help\";s:8:\"helppage\";s:63:\"https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Contents\";s:24:\"interlanguage-link-title\";s:9:\"$1 – $2\";s:6:\"jumpto\";s:8:\"Jump to:\";s:16:\"jumptonavigation\";s:10:\"navigation\";s:12:\"jumptosearch\";s:6:\"search\";s:14:\"lastmodifiedat\";s:39:\"This page was last edited on $1, at $2.\";s:8:\"mainpage\";s:9:\"Main Page\";s:20:\"mainpage-description\";s:9:\"Main page\";s:14:\"mainpage-nstab\";s:9:\"Main page\";s:10:\"namespaces\";s:10:\"Namespaces\";s:10:\"navigation\";s:10:\"Navigation\";s:23:\"nav-login-createaccount\";s:23:\"Log in / create account\";s:10:\"nstab-main\";s:4:\"Page\";s:15:\"opensearch-desc\";s:34:\"{{SITENAME}} ({{CONTENTLANGUAGE}})\";s:14:\"pagecategories\";s:33:\"{{PLURAL:$1|Category|Categories}}\";s:18:\"pagecategorieslink\";s:18:\"Special:Categories\";s:9:\"pagetitle\";s:17:\"$1 - {{SITENAME}}\";s:23:\"pagetitle-view-mainpage\";s:12:\"{{SITENAME}}\";s:9:\"permalink\";s:14:\"Permanent link\";s:13:\"personaltools\";s:14:\"Personal tools\";s:6:\"portal\";s:16:\"Community portal\";s:10:\"portal-url\";s:24:\"Project:Community portal\";s:16:\"printableversion\";s:17:\"Printable version\";s:7:\"privacy\";s:14:\"Privacy policy\";s:11:\"privacypage\";s:22:\"Project:Privacy policy\";s:10:\"randompage\";s:11:\"Random page\";s:14:\"randompage-url\";s:14:\"Special:Random\";s:13:\"recentchanges\";s:14:\"Recent changes\";s:27:\"recentchangeslinked-toolbox\";s:15:\"Related changes\";s:17:\"recentchanges-url\";s:21:\"Special:RecentChanges\";s:13:\"retrievedfrom\";s:19:\"Retrieved from \"$1\"\";s:6:\"search\";s:6:\"Search\";s:13:\"searcharticle\";s:2:\"Go\";s:12:\"searchbutton\";s:6:\"Search\";s:20:\"searchsuggest-search\";s:19:\"Search {{SITENAME}}\";s:7:\"sidebar\";s:168:\"\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* SEARCH\n* TOOLBOX\n* LANGUAGES\";s:18:\"navigation-heading\";s:15:\"Navigation menu\";s:14:\"site-atom-feed\";s:12:\"$1 Atom feed\";s:10:\"sitenotice\";s:1:\"-\";s:12:\"specialpages\";s:13:\"Special pages\";s:7:\"tagline\";s:17:\"From {{SITENAME}}\";s:4:\"talk\";s:10:\"Discussion\";s:7:\"toolbox\";s:5:\"Tools\";s:15:\"tooltip-ca-edit\";s:14:\"Edit this page\";s:18:\"tooltip-ca-history\";s:27:\"Past revisions of this page\";s:21:\"tooltip-ca-nstab-main\";s:21:\"View the content page\";s:15:\"tooltip-ca-talk\";s:33:\"Discussion about the content page\";s:21:\"tooltip-ca-viewsource\";s:47:\"This page is protected.\nYou can view its source\";s:23:\"tooltip-n-currentevents\";s:45:\"Find background information on current events\";s:14:\"tooltip-n-help\";s:21:\"The place to find out\";s:30:\"tooltip-n-mainpage-description\";s:19:\"Visit the main page\";s:16:\"tooltip-n-portal\";s:56:\"About the project, what you can do, where to find things\";s:20:\"tooltip-n-randompage\";s:18:\"Load a random page\";s:23:\"tooltip-n-recentchanges\";s:36:\"A list of recent changes in the wiki\";s:14:\"tooltip-p-logo\";s:19:\"Visit the main page\";s:16:\"tooltip-pt-login\";s:58:\"You are encouraged to log in; however, it is not mandatory\";s:24:\"tooltip-pt-createaccount\";s:80:\"You are encouraged to create an account and log in; however, it is not mandatory\";s:14:\"tooltip-search\";s:19:\"Search {{SITENAME}}\";s:23:\"tooltip-search-fulltext\";s:30:\"Search the pages for this text\";s:17:\"tooltip-search-go\";s:46:\"Go to a page with this exact name if it exists\";s:14:\"tooltip-t-info\";s:32:\"More information about this page\";s:19:\"tooltip-t-permalink\";s:44:\"Permanent link to this revision of this page\";s:15:\"tooltip-t-print\";s:30:\"Printable version of this page\";s:29:\"tooltip-t-recentchangeslinked\";s:45:\"Recent changes in pages linked from this page\";s:22:\"tooltip-t-specialpages\";s:27:\"A list of all special pages\";s:23:\"tooltip-t-whatlinkshere\";s:39:\"A list of all wiki pages that link here\";s:8:\"variants\";s:8:\"Variants\";s:16:\"vector-view-edit\";s:4:\"Edit\";s:19:\"vector-view-history\";s:12:\"View history\";s:16:\"vector-view-view\";s:4:\"Read\";s:9:\"viewcount\";s:56:\"This page has been accessed {{PLURAL:$1|once|$1 times}}.\";s:5:\"views\";s:5:\"Views\";s:13:\"whatlinkshere\";s:15:\"What links here\";s:14:\"word-separator\";s:5:\"&#32;\";}s:11:\"dateFormats\";a:20:{s:8:\"mdy time\";s:3:\"H:i\";s:8:\"mdy date\";s:6:\"F j, Y\";s:13:\"mdy monthonly\";s:3:\"F Y\";s:8:\"mdy both\";s:11:\"H:i, F j, Y\";s:10:\"mdy pretty\";s:3:\"F j\";s:8:\"dmy time\";s:3:\"H:i\";s:8:\"dmy date\";s:5:\"j F Y\";s:13:\"dmy monthonly\";s:3:\"F Y\";s:8:\"dmy both\";s:10:\"H:i, j F Y\";s:10:\"dmy pretty\";s:3:\"j F\";s:8:\"ymd time\";s:3:\"H:i\";s:8:\"ymd date\";s:5:\"Y F j\";s:13:\"ymd monthonly\";s:3:\"Y F\";s:8:\"ymd both\";s:10:\"H:i, Y F j\";s:10:\"ymd pretty\";s:3:\"F j\";s:13:\"ISO 8601 time\";s:11:\"xnH:xni:xns\";s:13:\"ISO 8601 date\";s:11:\"xnY-xnm-xnd\";s:18:\"ISO 8601 monthonly\";s:7:\"xnY-xnm\";s:13:\"ISO 8601 both\";s:25:\"xnY-xnm-xnd\"T\"xnH:xni:xns\";s:15:\"ISO 8601 pretty\";s:7:\"xnm-xnd\";}s:14:\"namespaceNames\";a:17:{i:-2;s:5:\"Media\";i:-1;s:7:\"Special\";i:0;s:0:\"\";i:1;s:4:\"Talk\";i:2;s:4:\"User\";i:3;s:9:\"User_talk\";i:5;s:7:\"$1_talk\";i:6;s:4:\"File\";i:7;s:9:\"File_talk\";i:8;s:9:\"MediaWiki\";i:9;s:14:\"MediaWiki_talk\";i:10;s:8:\"Template\";i:11;s:13:\"Template_talk\";i:12;s:4:\"Help\";i:13;s:9:\"Help_talk\";i:14;s:8:\"Category\";i:15;s:13:\"Category_talk\";}}'),(_binary 'en',_binary 'preloadedMessages',_binary 'a:111:{i:0;s:9:\"aboutpage\";i:1;s:9:\"aboutsite\";i:2;s:17:\"accesskey-ca-edit\";i:3;s:20:\"accesskey-ca-history\";i:4;s:23:\"accesskey-ca-nstab-main\";i:5;s:17:\"accesskey-ca-talk\";i:6;s:23:\"accesskey-ca-viewsource\";i:7;s:25:\"accesskey-n-currentevents\";i:8;s:16:\"accesskey-n-help\";i:9;s:32:\"accesskey-n-mainpage-description\";i:10;s:18:\"accesskey-n-portal\";i:11;s:22:\"accesskey-n-randompage\";i:12;s:25:\"accesskey-n-recentchanges\";i:13;s:16:\"accesskey-p-logo\";i:14;s:18:\"accesskey-pt-login\";i:15;s:26:\"accesskey-pt-createaccount\";i:16;s:16:\"accesskey-search\";i:17;s:25:\"accesskey-search-fulltext\";i:18;s:19:\"accesskey-search-go\";i:19;s:16:\"accesskey-t-info\";i:20;s:21:\"accesskey-t-permalink\";i:21;s:17:\"accesskey-t-print\";i:22;s:31:\"accesskey-t-recentchangeslinked\";i:23;s:24:\"accesskey-t-specialpages\";i:24;s:25:\"accesskey-t-whatlinkshere\";i:25;s:7:\"actions\";i:26;s:10:\"anonnotice\";i:27;s:8:\"brackets\";i:28;s:15:\"comma-separator\";i:29;s:13:\"currentevents\";i:30;s:17:\"currentevents-url\";i:31;s:14:\"disclaimerpage\";i:32;s:11:\"disclaimers\";i:33;s:4:\"edit\";i:34;s:11:\"editsection\";i:35;s:15:\"editsectionhint\";i:36;s:4:\"help\";i:37;s:8:\"helppage\";i:38;s:24:\"interlanguage-link-title\";i:39;s:6:\"jumpto\";i:40;s:16:\"jumptonavigation\";i:41;s:12:\"jumptosearch\";i:42;s:14:\"lastmodifiedat\";i:43;s:8:\"mainpage\";i:44;s:20:\"mainpage-description\";i:45;s:14:\"mainpage-nstab\";i:46;s:10:\"namespaces\";i:47;s:10:\"navigation\";i:48;s:23:\"nav-login-createaccount\";i:49;s:10:\"nstab-main\";i:50;s:15:\"opensearch-desc\";i:51;s:14:\"pagecategories\";i:52;s:18:\"pagecategorieslink\";i:53;s:9:\"pagetitle\";i:54;s:23:\"pagetitle-view-mainpage\";i:55;s:9:\"permalink\";i:56;s:13:\"personaltools\";i:57;s:6:\"portal\";i:58;s:10:\"portal-url\";i:59;s:16:\"printableversion\";i:60;s:7:\"privacy\";i:61;s:11:\"privacypage\";i:62;s:10:\"randompage\";i:63;s:14:\"randompage-url\";i:64;s:13:\"recentchanges\";i:65;s:27:\"recentchangeslinked-toolbox\";i:66;s:17:\"recentchanges-url\";i:67;s:13:\"retrievedfrom\";i:68;s:6:\"search\";i:69;s:13:\"searcharticle\";i:70;s:12:\"searchbutton\";i:71;s:20:\"searchsuggest-search\";i:72;s:7:\"sidebar\";i:73;s:18:\"navigation-heading\";i:74;s:14:\"site-atom-feed\";i:75;s:10:\"sitenotice\";i:76;s:12:\"specialpages\";i:77;s:7:\"tagline\";i:78;s:4:\"talk\";i:79;s:7:\"toolbox\";i:80;s:15:\"tooltip-ca-edit\";i:81;s:18:\"tooltip-ca-history\";i:82;s:21:\"tooltip-ca-nstab-main\";i:83;s:15:\"tooltip-ca-talk\";i:84;s:21:\"tooltip-ca-viewsource\";i:85;s:23:\"tooltip-n-currentevents\";i:86;s:14:\"tooltip-n-help\";i:87;s:30:\"tooltip-n-mainpage-description\";i:88;s:16:\"tooltip-n-portal\";i:89;s:20:\"tooltip-n-randompage\";i:90;s:23:\"tooltip-n-recentchanges\";i:91;s:14:\"tooltip-p-logo\";i:92;s:16:\"tooltip-pt-login\";i:93;s:24:\"tooltip-pt-createaccount\";i:94;s:14:\"tooltip-search\";i:95;s:23:\"tooltip-search-fulltext\";i:96;s:17:\"tooltip-search-go\";i:97;s:14:\"tooltip-t-info\";i:98;s:19:\"tooltip-t-permalink\";i:99;s:15:\"tooltip-t-print\";i:100;s:29:\"tooltip-t-recentchangeslinked\";i:101;s:22:\"tooltip-t-specialpages\";i:102;s:23:\"tooltip-t-whatlinkshere\";i:103;s:8:\"variants\";i:104;s:16:\"vector-view-edit\";i:105;s:19:\"vector-view-history\";i:106;s:16:\"vector-view-view\";i:107;s:9:\"viewcount\";i:108;s:5:\"views\";i:109;s:13:\"whatlinkshere\";i:110;s:14:\"word-separator\";}'),(_binary 'en',_binary 'rtl',_binary 'b:0;'),(_binary 'en',_binary 'separatorTransformTable',_binary 'N;'),(_binary 'en',_binary 'specialPageAliases',_binary 'a:132:{s:11:\"Activeusers\";a:1:{i:0;s:11:\"ActiveUsers\";}s:11:\"Allmessages\";a:1:{i:0;s:11:\"AllMessages\";}s:12:\"AllMyUploads\";a:2:{i:0;s:12:\"AllMyUploads\";i:1;s:10:\"AllMyFiles\";}s:8:\"Allpages\";a:1:{i:0;s:8:\"AllPages\";}s:12:\"Ancientpages\";a:1:{i:0;s:12:\"AncientPages\";}s:7:\"ApiHelp\";a:1:{i:0;s:7:\"ApiHelp\";}s:10:\"ApiSandbox\";a:1:{i:0;s:10:\"ApiSandbox\";}s:13:\"AutoblockList\";a:2:{i:0;s:13:\"AutoblockList\";i:1;s:14:\"ListAutoblocks\";}s:8:\"Badtitle\";a:1:{i:0;s:8:\"Badtitle\";}s:9:\"Blankpage\";a:1:{i:0;s:9:\"BlankPage\";}s:5:\"Block\";a:3:{i:0;s:5:\"Block\";i:1;s:7:\"BlockIP\";i:2;s:9:\"BlockUser\";}s:9:\"BlockList\";a:3:{i:0;s:9:\"BlockList\";i:1;s:10:\"ListBlocks\";i:2;s:11:\"IPBlockList\";}s:11:\"Booksources\";a:1:{i:0;s:11:\"BookSources\";}s:12:\"BotPasswords\";a:1:{i:0;s:12:\"BotPasswords\";}s:15:\"BrokenRedirects\";a:1:{i:0;s:15:\"BrokenRedirects\";}s:10:\"Categories\";a:1:{i:0;s:10:\"Categories\";}s:18:\"ChangeContentModel\";a:1:{i:0;s:18:\"ChangeContentModel\";}s:17:\"ChangeCredentials\";a:1:{i:0;s:17:\"ChangeCredentials\";}s:11:\"ChangeEmail\";a:1:{i:0;s:11:\"ChangeEmail\";}s:14:\"ChangePassword\";a:3:{i:0;s:14:\"ChangePassword\";i:1;s:9:\"ResetPass\";i:2;s:13:\"ResetPassword\";}s:12:\"ComparePages\";a:1:{i:0;s:12:\"ComparePages\";}s:12:\"Confirmemail\";a:1:{i:0;s:12:\"ConfirmEmail\";}s:13:\"Contributions\";a:2:{i:0;s:13:\"Contributions\";i:1;s:8:\"Contribs\";}s:13:\"CreateAccount\";a:1:{i:0;s:13:\"CreateAccount\";}s:12:\"Deadendpages\";a:1:{i:0;s:12:\"DeadendPages\";}s:20:\"DeletedContributions\";a:1:{i:0;s:20:\"DeletedContributions\";}s:10:\"DeletePage\";a:2:{i:0;s:10:\"DeletePage\";i:1;s:6:\"Delete\";}s:4:\"Diff\";a:1:{i:0;s:4:\"Diff\";}s:15:\"DoubleRedirects\";a:1:{i:0;s:15:\"DoubleRedirects\";}s:8:\"EditPage\";a:2:{i:0;s:8:\"EditPage\";i:1;s:4:\"Edit\";}s:8:\"EditTags\";a:1:{i:0;s:8:\"EditTags\";}s:13:\"EditWatchlist\";a:1:{i:0;s:13:\"EditWatchlist\";}s:9:\"Emailuser\";a:2:{i:0;s:9:\"EmailUser\";i:1;s:5:\"Email\";}s:15:\"ExpandTemplates\";a:1:{i:0;s:15:\"ExpandTemplates\";}s:6:\"Export\";a:1:{i:0;s:6:\"Export\";}s:15:\"Fewestrevisions\";a:1:{i:0;s:15:\"FewestRevisions\";}s:19:\"FileDuplicateSearch\";a:1:{i:0;s:19:\"FileDuplicateSearch\";}s:8:\"Filepath\";a:1:{i:0;s:8:\"FilePath\";}s:13:\"GoToInterwiki\";a:1:{i:0;s:13:\"GoToInterwiki\";}s:6:\"Import\";a:1:{i:0;s:6:\"Import\";}s:15:\"Invalidateemail\";a:1:{i:0;s:15:\"InvalidateEmail\";}s:14:\"JavaScriptTest\";a:1:{i:0;s:14:\"JavaScriptTest\";}s:12:\"LinkAccounts\";a:1:{i:0;s:12:\"LinkAccounts\";}s:10:\"LinkSearch\";a:1:{i:0;s:10:\"LinkSearch\";}s:10:\"Listadmins\";a:1:{i:0;s:10:\"ListAdmins\";}s:8:\"Listbots\";a:1:{i:0;s:8:\"ListBots\";}s:19:\"ListDuplicatedFiles\";a:2:{i:0;s:19:\"ListDuplicatedFiles\";i:1;s:18:\"ListFileDuplicates\";}s:9:\"Listfiles\";a:3:{i:0;s:9:\"ListFiles\";i:1;s:8:\"FileList\";i:2;s:9:\"ImageList\";}s:10:\"Listgrants\";a:1:{i:0;s:10:\"ListGrants\";}s:15:\"Listgrouprights\";a:2:{i:0;s:15:\"ListGroupRights\";i:1;s:15:\"UserGroupRights\";}s:13:\"Listredirects\";a:1:{i:0;s:13:\"ListRedirects\";}s:9:\"Listusers\";a:3:{i:0;s:9:\"ListUsers\";i:1;s:8:\"UserList\";i:2;s:5:\"Users\";}s:6:\"Lockdb\";a:1:{i:0;s:6:\"LockDB\";}s:3:\"Log\";a:2:{i:0;s:3:\"Log\";i:1;s:4:\"Logs\";}s:11:\"Lonelypages\";a:2:{i:0;s:11:\"LonelyPages\";i:1;s:13:\"OrphanedPages\";}s:9:\"Longpages\";a:1:{i:0;s:9:\"LongPages\";}s:15:\"MediaStatistics\";a:1:{i:0;s:15:\"MediaStatistics\";}s:12:\"MergeHistory\";a:1:{i:0;s:12:\"MergeHistory\";}s:10:\"MIMEsearch\";a:1:{i:0;s:10:\"MIMESearch\";}s:14:\"Mostcategories\";a:1:{i:0;s:14:\"MostCategories\";}s:10:\"Mostimages\";a:3:{i:0;s:15:\"MostLinkedFiles\";i:1;s:9:\"MostFiles\";i:2;s:10:\"MostImages\";}s:14:\"Mostinterwikis\";a:1:{i:0;s:14:\"MostInterwikis\";}s:10:\"Mostlinked\";a:2:{i:0;s:15:\"MostLinkedPages\";i:1;s:10:\"MostLinked\";}s:20:\"Mostlinkedcategories\";a:2:{i:0;s:20:\"MostLinkedCategories\";i:1;s:18:\"MostUsedCategories\";}s:19:\"Mostlinkedtemplates\";a:3:{i:0;s:20:\"MostTranscludedPages\";i:1;s:19:\"MostLinkedTemplates\";i:2;s:17:\"MostUsedTemplates\";}s:13:\"Mostrevisions\";a:1:{i:0;s:13:\"MostRevisions\";}s:8:\"Movepage\";a:1:{i:0;s:8:\"MovePage\";}s:4:\"Mute\";a:1:{i:0;s:4:\"Mute\";}s:15:\"Mycontributions\";a:2:{i:0;s:15:\"MyContributions\";i:1;s:10:\"MyContribs\";}s:10:\"MyLanguage\";a:1:{i:0;s:10:\"MyLanguage\";}s:6:\"Mypage\";a:1:{i:0;s:6:\"MyPage\";}s:6:\"Mytalk\";a:1:{i:0;s:6:\"MyTalk\";}s:9:\"Myuploads\";a:2:{i:0;s:9:\"MyUploads\";i:1;s:7:\"MyFiles\";}s:9:\"Newimages\";a:2:{i:0;s:8:\"NewFiles\";i:1;s:9:\"NewImages\";}s:8:\"Newpages\";a:1:{i:0;s:8:\"NewPages\";}s:10:\"NewSection\";a:2:{i:0;s:10:\"NewSection\";i:1;s:10:\"Newsection\";}s:8:\"PageData\";a:1:{i:0;s:8:\"PageData\";}s:11:\"PageHistory\";a:2:{i:0;s:11:\"PageHistory\";i:1;s:7:\"History\";}s:8:\"PageInfo\";a:2:{i:0;s:8:\"PageInfo\";i:1;s:4:\"Info\";}s:12:\"PageLanguage\";a:1:{i:0;s:12:\"PageLanguage\";}s:13:\"PagesWithProp\";a:4:{i:0;s:13:\"PagesWithProp\";i:1;s:13:\"Pageswithprop\";i:2;s:11:\"PagesByProp\";i:3;s:11:\"Pagesbyprop\";}s:16:\"PasswordPolicies\";a:1:{i:0;s:16:\"PasswordPolicies\";}s:13:\"PasswordReset\";a:1:{i:0;s:13:\"PasswordReset\";}s:13:\"PermanentLink\";a:2:{i:0;s:13:\"PermanentLink\";i:1;s:9:\"PermaLink\";}s:11:\"Preferences\";a:1:{i:0;s:11:\"Preferences\";}s:11:\"Prefixindex\";a:1:{i:0;s:11:\"PrefixIndex\";}s:14:\"Protectedpages\";a:1:{i:0;s:14:\"ProtectedPages\";}s:15:\"Protectedtitles\";a:1:{i:0;s:15:\"ProtectedTitles\";}s:11:\"ProtectPage\";a:2:{i:0;s:11:\"ProtectPage\";i:1;s:7:\"Protect\";}s:5:\"Purge\";a:1:{i:0;s:5:\"Purge\";}s:16:\"RandomInCategory\";a:1:{i:0;s:16:\"RandomInCategory\";}s:10:\"Randompage\";a:2:{i:0;s:6:\"Random\";i:1;s:10:\"RandomPage\";}s:14:\"Randomredirect\";a:1:{i:0;s:14:\"RandomRedirect\";}s:14:\"Randomrootpage\";a:1:{i:0;s:14:\"RandomRootpage\";}s:13:\"Recentchanges\";a:1:{i:0;s:13:\"RecentChanges\";}s:19:\"Recentchangeslinked\";a:2:{i:0;s:19:\"RecentChangesLinked\";i:1;s:14:\"RelatedChanges\";}s:8:\"Redirect\";a:1:{i:0;s:8:\"Redirect\";}s:17:\"RemoveCredentials\";a:1:{i:0;s:17:\"RemoveCredentials\";}s:11:\"ResetTokens\";a:1:{i:0;s:11:\"ResetTokens\";}s:14:\"Revisiondelete\";a:1:{i:0;s:14:\"RevisionDelete\";}s:7:\"RunJobs\";a:1:{i:0;s:7:\"RunJobs\";}s:6:\"Search\";a:1:{i:0;s:6:\"Search\";}s:10:\"Shortpages\";a:1:{i:0;s:10:\"ShortPages\";}s:12:\"Specialpages\";a:1:{i:0;s:12:\"SpecialPages\";}s:10:\"Statistics\";a:2:{i:0;s:10:\"Statistics\";i:1;s:5:\"Stats\";}s:4:\"Tags\";a:1:{i:0;s:4:\"Tags\";}s:18:\"TrackingCategories\";a:1:{i:0;s:18:\"TrackingCategories\";}s:7:\"Unblock\";a:1:{i:0;s:7:\"Unblock\";}s:23:\"Uncategorizedcategories\";a:1:{i:0;s:23:\"UncategorizedCategories\";}s:19:\"Uncategorizedimages\";a:2:{i:0;s:18:\"UncategorizedFiles\";i:1;s:19:\"UncategorizedImages\";}s:18:\"Uncategorizedpages\";a:1:{i:0;s:18:\"UncategorizedPages\";}s:22:\"Uncategorizedtemplates\";a:1:{i:0;s:22:\"UncategorizedTemplates\";}s:8:\"Undelete\";a:1:{i:0;s:8:\"Undelete\";}s:14:\"UnlinkAccounts\";a:1:{i:0;s:14:\"UnlinkAccounts\";}s:8:\"Unlockdb\";a:1:{i:0;s:8:\"UnlockDB\";}s:16:\"Unusedcategories\";a:1:{i:0;s:16:\"UnusedCategories\";}s:12:\"Unusedimages\";a:2:{i:0;s:11:\"UnusedFiles\";i:1;s:12:\"UnusedImages\";}s:15:\"Unusedtemplates\";a:1:{i:0;s:15:\"UnusedTemplates\";}s:14:\"Unwatchedpages\";a:1:{i:0;s:14:\"UnwatchedPages\";}s:6:\"Upload\";a:1:{i:0;s:6:\"Upload\";}s:11:\"UploadStash\";a:1:{i:0;s:11:\"UploadStash\";}s:9:\"Userlogin\";a:2:{i:0;s:9:\"UserLogin\";i:1;s:5:\"Login\";}s:10:\"Userlogout\";a:2:{i:0;s:10:\"UserLogout\";i:1;s:6:\"Logout\";}s:10:\"Userrights\";a:3:{i:0;s:10:\"UserRights\";i:1;s:9:\"MakeSysop\";i:2;s:7:\"MakeBot\";}s:7:\"Version\";a:1:{i:0;s:7:\"Version\";}s:16:\"Wantedcategories\";a:1:{i:0;s:16:\"WantedCategories\";}s:11:\"Wantedfiles\";a:1:{i:0;s:11:\"WantedFiles\";}s:11:\"Wantedpages\";a:2:{i:0;s:11:\"WantedPages\";i:1;s:11:\"BrokenLinks\";}s:15:\"Wantedtemplates\";a:1:{i:0;s:15:\"WantedTemplates\";}s:9:\"Watchlist\";a:1:{i:0;s:9:\"Watchlist\";}s:13:\"Whatlinkshere\";a:1:{i:0;s:13:\"WhatLinksHere\";}s:16:\"Withoutinterwiki\";a:1:{i:0;s:16:\"WithoutInterwiki\";}}');
/*!40000 ALTER TABLE `wkl10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wklanglinks`
--

DROP TABLE IF EXISTS `wklanglinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wklanglinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(35) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wklanglinks`
--

LOCK TABLES `wklanglinks` WRITE;
/*!40000 ALTER TABLE `wklanglinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wklanglinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wklinktarget`
--

DROP TABLE IF EXISTS `wklinktarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wklinktarget` (
  `lt_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lt_namespace` int(11) NOT NULL,
  `lt_title` varbinary(255) NOT NULL,
  PRIMARY KEY (`lt_id`),
  UNIQUE KEY `lt_namespace_title` (`lt_namespace`,`lt_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wklinktarget`
--

LOCK TABLES `wklinktarget` WRITE;
/*!40000 ALTER TABLE `wklinktarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `wklinktarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wklog_search`
--

DROP TABLE IF EXISTS `wklog_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wklog_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wklog_search`
--

LOCK TABLES `wklog_search` WRITE;
/*!40000 ALTER TABLE `wklog_search` DISABLE KEYS */;
INSERT INTO `wklog_search` VALUES (_binary 'associated_rev_id',_binary '1',1);
/*!40000 ALTER TABLE `wklog_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wklogging`
--

DROP TABLE IF EXISTS `wklogging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wklogging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_actor` bigint(20) unsigned NOT NULL,
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment_id` bigint(20) unsigned NOT NULL,
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `log_type_time` (`log_type`,`log_timestamp`),
  KEY `log_actor_time` (`log_actor`,`log_timestamp`),
  KEY `log_page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `log_times` (`log_timestamp`),
  KEY `log_actor_type_time` (`log_actor`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `log_type_action` (`log_type`,`log_action`,`log_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wklogging`
--

LOCK TABLES `wklogging` WRITE;
/*!40000 ALTER TABLE `wklogging` DISABLE KEYS */;
INSERT INTO `wklogging` VALUES (1,_binary 'create',_binary 'create',_binary '20221219124421',2,0,_binary 'Main_Page',1,1,_binary 'a:1:{s:17:\"associated_rev_id\";i:1;}',0);
/*!40000 ALTER TABLE `wklogging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkmodule_deps`
--

DROP TABLE IF EXISTS `wkmodule_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkmodule_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  PRIMARY KEY (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkmodule_deps`
--

LOCK TABLES `wkmodule_deps` WRITE;
/*!40000 ALTER TABLE `wkmodule_deps` DISABLE KEYS */;
INSERT INTO `wkmodule_deps` VALUES (_binary 'skins.vector.styles.legacy',_binary 'vector|en',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.mixins.rotation.less\",\"resources/src/mediawiki.less/mediawiki.skin.defaults.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.skinning/i18n-counter-styles.css\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\",\"resources/src/mediawiki.skinning/toc/i18n.less\",\"resources/src/mediawiki.skinning/variables.less\",\"skins/Vector/resources/common/components/Footer.less\",\"skins/Vector/resources/common/components/Indicators.less\",\"skins/Vector/resources/common/components/Menu.less\",\"skins/Vector/resources/common/components/MenuDropdownCheckbox.less\",\"skins/Vector/resources/common/components/MenuPortal.less\",\"skins/Vector/resources/common/components/SearchBox.less\",\"skins/Vector/resources/common/components/SidebarLogo.less\",\"skins/Vector/resources/common/components/SiteNotice.less\",\"skins/Vector/resources/common/images/arrow-down.svg\",\"skins/Vector/resources/common/images/bullet-icon.svg\",\"skins/Vector/resources/common/images/link-external-small-ltr-progressive.svg\",\"skins/Vector/resources/common/images/search.svg\",\"skins/Vector/resources/common/images/unwatch-icon-hl.svg\",\"skins/Vector/resources/common/images/unwatch-icon.svg\",\"skins/Vector/resources/common/images/unwatch-temp-icon-hl.svg\",\"skins/Vector/resources/common/images/unwatch-temp-icon.svg\",\"skins/Vector/resources/common/images/watch-icon-hl.svg\",\"skins/Vector/resources/common/images/watch-icon.svg\",\"skins/Vector/resources/common/mixins.less\",\"skins/Vector/resources/common/normalize.less\",\"skins/Vector/resources/common/print.less\",\"skins/Vector/resources/common/typography.less\",\"skins/Vector/resources/common/variables.less\",\"skins/Vector/resources/mediawiki.less.legacy/mediawiki.skin.variables.less\",\"skins/Vector/resources/skins.vector.styles.legacy/components/MenuDropdown.less\",\"skins/Vector/resources/skins.vector.styles.legacy/components/MenuPortal.less\",\"skins/Vector/resources/skins.vector.styles.legacy/components/MenuTabs.less\",\"skins/Vector/resources/skins.vector.styles.legacy/components/SearchBox.less\",\"skins/Vector/resources/skins.vector.styles.legacy/components/Sidebar.less\",\"skins/Vector/resources/skins.vector.styles.legacy/components/TabWatchstarLink.less\",\"skins/Vector/resources/skins.vector.styles.legacy/components/UserLinks.less\",\"skins/Vector/resources/skins.vector.styles.legacy/images/user-avatar.svg\",\"skins/Vector/resources/skins.vector.styles.legacy/layouts/print.less\",\"skins/Vector/resources/skins.vector.styles.legacy/layouts/screen.less\"]');
/*!40000 ALTER TABLE `wkmodule_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkobjectcache`
--

DROP TABLE IF EXISTS `wkobjectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkobjectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` binary(14) NOT NULL,
  `modtoken` varbinary(17) NOT NULL DEFAULT '00000000000000000',
  `flags` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkobjectcache`
--

LOCK TABLES `wkobjectcache` WRITE;
/*!40000 ALTER TABLE `wkobjectcache` DISABLE KEYS */;
INSERT INTO `wkobjectcache` VALUES (_binary 'wiki_db-wk:messages:en',_binary '�A\n�0\��O����r!\�-\n�]�!\\�\�\�f`�B\�}c�|�y�^O\�+5o��_F�\�+\�b\r��+\�o\�a\�Pѵ,$\�]�\��4�nq\�@�\�T\�<�N�q',_binary '99991231235959',_binary '00000000000000000',NULL),(_binary 'wiki_db-wk:pcache:idhash:1-0!canonical',_binary '�WmS\�F�+�:�~��d\��LKBp�I�2\�!�\�+ҝ\�\�d\�2��>{z�����\'C�ݽ\�\��]&\��\�\�\��/���#���\�j%\'�3�v%\�7eƻ\�\\zB\Z\�Ҕ\'\�~�����\�\�#%M�Z\�N�\�g^�2c~����k\�R\�\�\�\�����A�Z���ә\�\�\�\�a����C�Q\�c�\�\�lq\�\�`\�9\�i��\�Қk�\�p���\�\"\��xc�3f���FȉCDZ=�\�v\�4o���w\�\�us&�ټ5\�,I�\�\0+�\�rk�\�Wז\'0]Q��_@Š�\�#\�\�\Z;�9P\��һ�3�U,P\�mj\���\�\"�S1�\ZN=c�\0n�I��\�nL����\��j��\nc\�\��p\�\�Ew�\�o��LG�?5�y\nR�U��9��C4t\�&�Ó+c��)��m�I�\n���ck ��3ý������\\v�bS.^\�_j&MZUs�\ns�j%Ľ%\\*���\��\�\�{��[VVX\�2�Ǚ�\�T\�=��\�q=bQE;����\�\�>��V{*\��O�w�#f��\�\��P&\"fm�~)l\�\�Ʒ\��|[�$Z���\�֕\\<]\Zs�\�-+�<\�\��\�z�:Lj8tU\�\�\"\�#\�;��\������ue\�\�K���;�w��2�(\�5�c=�G`_B_\�\�\�|��G\�Lęέ$\�{>����\�,5|\�?��\�B~�\�\�T֋� f\�\��Ru��\"\�k/#�h(\�L\�\�Y]\�\�{�T\r\�\n%Y�\�*\0��\�[�|\�S\�\�\�\�8h�\�qć!�\�k�B����\�y�U\�J\�Tm7Tm�\�.,W\�12Fz;>��T\��z8��@w�Uεm\����\�\��\�\�>\�|\�!�\�2\�v\�nxv{�.\�#\�m\�\�\�?O	ޅJE�(PIJ�ۿf�QI\�J�\�\'ܶ�{B�Kn\�[3���\�?R\�Ȅ��s�m�+%�v�V�\0,ăv�r]r\��\n�p��\�3a<\"U\����\��yC�\�\�\�\�!㴀��J?;\�\��U�\�ݐ�Uý��Z\�\�\�N5y+ṝB�K8�\n�Kg|�Z�ĊQ\�\�i}*\\`\�\"o\�\n\��3\"\r���W���:�VcA�ɇ�v�\�\�G�\�~�ײ\nk��\�1��|y�i&\��ˤ5A��8\�\���z��\�;W9��\�F[råݓ�ؒ�i�\�\�XZ@b�r\��\r�>�\n͙�9S\�\Zg��ËG6S�\�b*��\�\�偍\�؊bE\�Y�{�K�u�<������&���\\:<\�\"�g\�j��?b3�\�[�\Z_A����\�N�;�p\�\�Mrۚ\�E�cE\"�\'\�4\n[�w1�JbJ=\�\�k�y\�\�SsJ,]\"�\�6\�^��u\�K�f.\�\���Wao�w\�\r\�{���h\�\�Nx��\��C\ZpP�;��\���\�;A}�j�訚�b�Ďt�\�|4{\�\�ߔT7���\�5s	C��i=\��l���,\�t�Ne�\�\�a~��\�L�mL���,�;�\�~ͽ\�,Ǩy-fG�8�\�vG�KK�)\�GVT\�\�}��Y� \�\�e��\\6�\�Q/.ޣd�ʌ_��q��\��^Θzͨ��V�1��yS\�}\�{e��c\���Y\�MGG����\�\�\��V\�K��\�\"ϱ9Lᚔ`���j)\�3��[h\��n=\�mڂ�>��\�iY��\��q�|\�|WBp��-���#����2��>e���\��\r�K\�\�\�?�?�',_binary '20221220130021',_binary '00000000000000000',NULL),(_binary 'wiki_db-wk:pcache:idoptions:1',_binary '}�MO�@��˞9\06~\�ۄ-Q�\�f�&.\�fg�Ԧ�݅@\�<m�<3�o^�V7a$�\"\��\�Xn��V�����!Q�\�J|�/�5z#Ͳ��ĸ\��C׃U>���\�-�\nm\n�\�:\� e\�|@��\�����\�~=8�@&�3�1m�^*x�8���,J\�s6�7RR���g1\�im\\�|/�$/ŭ���{z4\�\Z��9\�i\�\�\�Q1�8�i6�*\�:Sj\��\�ހ.$��\��\Z]yd\"��^��\�rj\\7\"�\�0��\�\��\�@\��{\Z�NJ�\�كƝ��\�<��o',_binary '20221220130021',_binary '00000000000000000',NULL);
/*!40000 ALTER TABLE `wkobjectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkoldimage`
--

DROP TABLE IF EXISTS `wkoldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkoldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description_id` bigint(20) unsigned NOT NULL,
  `oi_actor` bigint(20) unsigned NOT NULL,
  `oi_timestamp` binary(14) NOT NULL,
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_actor_timestamp` (`oi_actor`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10)),
  KEY `oi_timestamp` (`oi_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkoldimage`
--

LOCK TABLES `wkoldimage` WRITE;
/*!40000 ALTER TABLE `wkoldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkoldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkpage`
--

DROP TABLE IF EXISTS `wkpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkpage` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL,
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkpage`
--

LOCK TABLES `wkpage` WRITE;
/*!40000 ALTER TABLE `wkpage` DISABLE KEYS */;
INSERT INTO `wkpage` VALUES (1,0,_binary 'Main_Page',0,1,0.599240690537,_binary '20221219124421',NULL,1,755,_binary 'wikitext',NULL);
/*!40000 ALTER TABLE `wkpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkpage_props`
--

DROP TABLE IF EXISTS `wkpage_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkpage_props` (
  `pp_page` int(10) unsigned NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  PRIMARY KEY (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkpage_props`
--

LOCK TABLES `wkpage_props` WRITE;
/*!40000 ALTER TABLE `wkpage_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkpage_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkpage_restrictions`
--

DROP TABLE IF EXISTS `wkpage_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkpage_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(10) unsigned NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkpage_restrictions`
--

LOCK TABLES `wkpage_restrictions` WRITE;
/*!40000 ALTER TABLE `wkpage_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkpage_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkpagelinks`
--

DROP TABLE IF EXISTS `wkpagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkpagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkpagelinks`
--

LOCK TABLES `wkpagelinks` WRITE;
/*!40000 ALTER TABLE `wkpagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkpagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkprotected_titles`
--

DROP TABLE IF EXISTS `wkprotected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkprotected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason_id` bigint(20) unsigned NOT NULL,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL,
  `pt_create_perm` varbinary(60) NOT NULL,
  PRIMARY KEY (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkprotected_titles`
--

LOCK TABLES `wkprotected_titles` WRITE;
/*!40000 ALTER TABLE `wkprotected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkprotected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkquerycache`
--

DROP TABLE IF EXISTS `wkquerycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkquerycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varbinary(255) NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkquerycache`
--

LOCK TABLES `wkquerycache` WRITE;
/*!40000 ALTER TABLE `wkquerycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkquerycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkquerycache_info`
--

DROP TABLE IF EXISTS `wkquerycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkquerycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  PRIMARY KEY (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkquerycache_info`
--

LOCK TABLES `wkquerycache_info` WRITE;
/*!40000 ALTER TABLE `wkquerycache_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkquerycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkquerycachetwo`
--

DROP TABLE IF EXISTS `wkquerycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkquerycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkquerycachetwo`
--

LOCK TABLES `wkquerycachetwo` WRITE;
/*!40000 ALTER TABLE `wkquerycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkquerycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkrecentchanges`
--

DROP TABLE IF EXISTS `wkrecentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkrecentchanges` (
  `rc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rc_timestamp` binary(14) NOT NULL,
  `rc_actor` bigint(20) unsigned NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment_id` bigint(20) unsigned NOT NULL,
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_source` varbinary(16) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title_timestamp` (`rc_namespace`,`rc_title`,`rc_timestamp`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `rc_new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_actor` (`rc_namespace`,`rc_actor`),
  KEY `rc_actor` (`rc_actor`,`rc_timestamp`),
  KEY `rc_name_type_patrolled_timestamp` (`rc_namespace`,`rc_type`,`rc_patrolled`,`rc_timestamp`),
  KEY `rc_this_oldid` (`rc_this_oldid`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkrecentchanges`
--

LOCK TABLES `wkrecentchanges` WRITE;
/*!40000 ALTER TABLE `wkrecentchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkrecentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkredirect`
--

DROP TABLE IF EXISTS `wkredirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkredirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkredirect`
--

LOCK TABLES `wkredirect` WRITE;
/*!40000 ALTER TABLE `wkredirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkredirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkrevision`
--

DROP TABLE IF EXISTS `wkrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkrevision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rev_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rev_timestamp` binary(14) NOT NULL,
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `rev_page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `rev_actor_timestamp` (`rev_actor`,`rev_timestamp`,`rev_id`),
  KEY `rev_page_actor_timestamp` (`rev_page`,`rev_actor`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkrevision`
--

LOCK TABLES `wkrevision` WRITE;
/*!40000 ALTER TABLE `wkrevision` DISABLE KEYS */;
INSERT INTO `wkrevision` VALUES (1,1,0,2,_binary '20221219124421',0,0,755,0,_binary '22vz5zlxa2zctewimaum2bf1due8hkl');
/*!40000 ALTER TABLE `wkrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkrevision_comment_temp`
--

DROP TABLE IF EXISTS `wkrevision_comment_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkrevision_comment_temp` (
  `revcomment_rev` int(10) unsigned NOT NULL,
  `revcomment_comment_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revcomment_rev`,`revcomment_comment_id`),
  UNIQUE KEY `revcomment_rev` (`revcomment_rev`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkrevision_comment_temp`
--

LOCK TABLES `wkrevision_comment_temp` WRITE;
/*!40000 ALTER TABLE `wkrevision_comment_temp` DISABLE KEYS */;
INSERT INTO `wkrevision_comment_temp` VALUES (1,1);
/*!40000 ALTER TABLE `wkrevision_comment_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wksearchindex`
--

DROP TABLE IF EXISTS `wksearchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wksearchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wksearchindex`
--

LOCK TABLES `wksearchindex` WRITE;
/*!40000 ALTER TABLE `wksearchindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `wksearchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wksite_identifiers`
--

DROP TABLE IF EXISTS `wksite_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wksite_identifiers` (
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  `si_site` int(10) unsigned NOT NULL,
  PRIMARY KEY (`si_type`,`si_key`),
  KEY `si_site` (`si_site`),
  KEY `si_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wksite_identifiers`
--

LOCK TABLES `wksite_identifiers` WRITE;
/*!40000 ALTER TABLE `wksite_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `wksite_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wksite_stats`
--

DROP TABLE IF EXISTS `wksite_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wksite_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_edits` bigint(20) unsigned DEFAULT NULL,
  `ss_good_articles` bigint(20) unsigned DEFAULT NULL,
  `ss_total_pages` bigint(20) unsigned DEFAULT NULL,
  `ss_users` bigint(20) unsigned DEFAULT NULL,
  `ss_active_users` bigint(20) unsigned DEFAULT NULL,
  `ss_images` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wksite_stats`
--

LOCK TABLES `wksite_stats` WRITE;
/*!40000 ALTER TABLE `wksite_stats` DISABLE KEYS */;
INSERT INTO `wksite_stats` VALUES (1,0,0,0,1,0,0);
/*!40000 ALTER TABLE `wksite_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wksites`
--

DROP TABLE IF EXISTS `wksites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wksites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(64) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(35) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `site_global_key` (`site_global_key`),
  KEY `site_type` (`site_type`),
  KEY `site_group` (`site_group`),
  KEY `site_source` (`site_source`),
  KEY `site_language` (`site_language`),
  KEY `site_protocol` (`site_protocol`),
  KEY `site_domain` (`site_domain`),
  KEY `site_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wksites`
--

LOCK TABLES `wksites` WRITE;
/*!40000 ALTER TABLE `wksites` DISABLE KEYS */;
/*!40000 ALTER TABLE `wksites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkslot_roles`
--

DROP TABLE IF EXISTS `wkslot_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkslot_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varbinary(64) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkslot_roles`
--

LOCK TABLES `wkslot_roles` WRITE;
/*!40000 ALTER TABLE `wkslot_roles` DISABLE KEYS */;
INSERT INTO `wkslot_roles` VALUES (1,_binary 'main');
/*!40000 ALTER TABLE `wkslot_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkslots`
--

DROP TABLE IF EXISTS `wkslots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkslots` (
  `slot_revision_id` bigint(20) unsigned NOT NULL,
  `slot_role_id` smallint(5) unsigned NOT NULL,
  `slot_content_id` bigint(20) unsigned NOT NULL,
  `slot_origin` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`slot_revision_id`,`slot_role_id`),
  KEY `slot_revision_origin_role` (`slot_revision_id`,`slot_origin`,`slot_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkslots`
--

LOCK TABLES `wkslots` WRITE;
/*!40000 ALTER TABLE `wkslots` DISABLE KEYS */;
INSERT INTO `wkslots` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `wkslots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wktemplatelinks`
--

DROP TABLE IF EXISTS `wktemplatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wktemplatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_target_id` bigint(20) unsigned NOT NULL,
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tl_from`,`tl_target_id`),
  KEY `tl_target_id` (`tl_target_id`,`tl_from`),
  KEY `tl_backlinks_namespace_target_id` (`tl_from_namespace`,`tl_target_id`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wktemplatelinks`
--

LOCK TABLES `wktemplatelinks` WRITE;
/*!40000 ALTER TABLE `wktemplatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wktemplatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wktext`
--

DROP TABLE IF EXISTS `wktext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wktext` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wktext`
--

LOCK TABLES `wktext` WRITE;
/*!40000 ALTER TABLE `wktext` DISABLE KEYS */;
INSERT INTO `wktext` VALUES (1,_binary '<strong>MediaWiki has been installed.</strong>\n\nConsult the [https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/postorius/lists/mediawiki-announce.lists.wikimedia.org/ MediaWiki release mailing list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]',_binary 'utf-8');
/*!40000 ALTER TABLE `wktext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkupdatelog`
--

DROP TABLE IF EXISTS `wkupdatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkupdatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkupdatelog`
--

LOCK TABLES `wkupdatelog` WRITE;
/*!40000 ALTER TABLE `wkupdatelog` DISABLE KEYS */;
INSERT INTO `wkupdatelog` VALUES (_binary 'PingBack',_binary 'e56223e0ab7cc2e1fb4211e189b56475'),(_binary 'Pingback-1.39.0',_binary '1671454821'),(_binary 'filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),(_binary 'image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),(_binary 'oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),(_binary 'user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),(_binary 'user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),(_binary 'user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `wkupdatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkuploadstash`
--

DROP TABLE IF EXISTS `wkuploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkuploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` binary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) unsigned NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkuploadstash`
--

LOCK TABLES `wkuploadstash` WRITE;
/*!40000 ALTER TABLE `wkuploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkuploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkuser`
--

DROP TABLE IF EXISTS `wkuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkuser` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_touched` binary(14) NOT NULL,
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(10) unsigned DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkuser`
--

LOCK TABLES `wkuser` WRITE;
/*!40000 ALTER TABLE `wkuser` DISABLE KEYS */;
INSERT INTO `wkuser` VALUES (1,_binary 'Wikimedia','',_binary ':pbkdf2:sha512:30000:64:H1xYg7cCuFzIdQlgEJ8T4Q==:5cKvqNlk7VOO02bxAmse+7D61eiN1qtVaSgbRkZeRO0tikxyFAhHIEFdBxfSIoJMccVLQpDZDDVjgrB6Ap7DxA==','',NULL,_binary 'admin@wiki.wiki',_binary '20221219124421',_binary '2ce1a353ba41dc014d1eb10143ff5fa5',NULL,NULL,NULL,_binary '20221219124420',0,NULL),(2,_binary 'MediaWiki default','','','',NULL,'',_binary '20221219124421',_binary '*** INVALID ***\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,NULL,_binary '20221219124421',0,NULL);
/*!40000 ALTER TABLE `wkuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkuser_autocreate_serial`
--

DROP TABLE IF EXISTS `wkuser_autocreate_serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkuser_autocreate_serial` (
  `uas_shard` int(10) unsigned NOT NULL,
  `uas_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uas_shard`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkuser_autocreate_serial`
--

LOCK TABLES `wkuser_autocreate_serial` WRITE;
/*!40000 ALTER TABLE `wkuser_autocreate_serial` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkuser_autocreate_serial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkuser_former_groups`
--

DROP TABLE IF EXISTS `wkuser_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkuser_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkuser_former_groups`
--

LOCK TABLES `wkuser_former_groups` WRITE;
/*!40000 ALTER TABLE `wkuser_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkuser_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkuser_groups`
--

DROP TABLE IF EXISTS `wkuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkuser_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  `ug_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`),
  KEY `ug_expiry` (`ug_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkuser_groups`
--

LOCK TABLES `wkuser_groups` WRITE;
/*!40000 ALTER TABLE `wkuser_groups` DISABLE KEYS */;
INSERT INTO `wkuser_groups` VALUES (1,_binary 'bureaucrat',NULL),(1,_binary 'interface-admin',NULL),(1,_binary 'sysop',NULL);
/*!40000 ALTER TABLE `wkuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkuser_newtalk`
--

DROP TABLE IF EXISTS `wkuser_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkuser_newtalk` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` binary(14) DEFAULT NULL,
  KEY `un_user_id` (`user_id`),
  KEY `un_user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkuser_newtalk`
--

LOCK TABLES `wkuser_newtalk` WRITE;
/*!40000 ALTER TABLE `wkuser_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkuser_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkuser_properties`
--

DROP TABLE IF EXISTS `wkuser_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkuser_properties` (
  `up_user` int(10) unsigned NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob,
  PRIMARY KEY (`up_user`,`up_property`),
  KEY `up_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkuser_properties`
--

LOCK TABLES `wkuser_properties` WRITE;
/*!40000 ALTER TABLE `wkuser_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkuser_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkwatchlist`
--

DROP TABLE IF EXISTS `wkwatchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkwatchlist` (
  `wl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` binary(14) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `wl_namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkwatchlist`
--

LOCK TABLES `wkwatchlist` WRITE;
/*!40000 ALTER TABLE `wkwatchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkwatchlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wkwatchlist_expiry`
--

DROP TABLE IF EXISTS `wkwatchlist_expiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wkwatchlist_expiry` (
  `we_item` int(10) unsigned NOT NULL,
  `we_expiry` binary(14) NOT NULL,
  PRIMARY KEY (`we_item`),
  KEY `we_expiry` (`we_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wkwatchlist_expiry`
--

LOCK TABLES `wkwatchlist_expiry` WRITE;
/*!40000 ALTER TABLE `wkwatchlist_expiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `wkwatchlist_expiry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-19 13:04:19