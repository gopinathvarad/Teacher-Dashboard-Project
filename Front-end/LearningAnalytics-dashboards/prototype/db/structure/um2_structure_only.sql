CREATE DATABASE  IF NOT EXISTS `um2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `um2`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: um2
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Temporary view structure for view `activity_concept`
--

DROP TABLE IF EXISTS `activity_concept`;
/*!50001 DROP VIEW IF EXISTS `activity_concept`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activity_concept` AS SELECT 
 1 AS `activityid`,
 1 AS `concept`,
 1 AS `ConceptID`,
 1 AS `name`,
 1 AS `appid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `activity_details`
--

DROP TABLE IF EXISTS `activity_details`;
/*!50001 DROP VIEW IF EXISTS `activity_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activity_details` AS SELECT 
 1 AS `activityid`,
 1 AS `appid`,
 1 AS `activity`,
 1 AS `description`,
 1 AS `uri`,
 1 AS `app`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `activitydetailstemp`
--

DROP TABLE IF EXISTS `activitydetailstemp`;
/*!50001 DROP VIEW IF EXISTS `activitydetailstemp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activitydetailstemp` AS SELECT 
 1 AS `activityid`,
 1 AS `appid`,
 1 AS `activity`,
 1 AS `description`,
 1 AS `uri`,
 1 AS `app`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `agg_content_concept`
--

DROP TABLE IF EXISTS `agg_content_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agg_content_concept` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `content_id` int(12) NOT NULL,
  `content_name` varchar(50) NOT NULL,
  `concept_name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `domain` varchar(20) NOT NULL,
  `weight` decimal(6,3) NOT NULL DEFAULT '0.000',
  `direction` varchar(20) NOT NULL DEFAULT '',
  `active` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ind_concept_dir` (`concept_name`,`direction`)
) ENGINE=InnoDB AUTO_INCREMENT=5673 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `archive_user_activity`
--

DROP TABLE IF EXISTS `archive_user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_user_activity` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `AppID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  `GroupID` int(10) unsigned NOT NULL DEFAULT '0',
  `Result` varchar(50) NOT NULL DEFAULT '',
  `ActivityID` int(10) unsigned NOT NULL DEFAULT '0',
  `Session` varchar(25) NOT NULL,
  `DateNTime` varchar(25) NOT NULL DEFAULT '',
  `DateNTimeNS` bigint(20) DEFAULT NULL,
  `SVC` varchar(255) DEFAULT NULL,
  `AllParameters` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_AppID` (`AppID`),
  KEY `Index_ActivityID` (`ActivityID`),
  KEY `Index_AppIDActivityID` (`ActivityID`,`AppID`) USING BTREE,
  KEY `Index_UserID` (`UserID`) USING BTREE,
  KEY `Index_GroupID` (`GroupID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2692864 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 7168 kB; (`AppID`) REFER `um2/ent_app`(`AppID`)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_activity`
--

DROP TABLE IF EXISTS `ent_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_activity` (
  `ActivityID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AppID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `URI` varchar(255) NOT NULL DEFAULT '',
  `Activity` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `DateNTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ActivityID`),
  KEY `Index_AppID` (`AppID`),
  KEY `Index_ActivityID` (`ActivityID`),
  KEY `Index_AppIDActivityID_NonUnique` (`ActivityID`,`AppID`),
  CONSTRAINT `FK_ent_activity_1` FOREIGN KEY (`AppID`) REFERENCES `ent_app` (`AppID`)
) ENGINE=InnoDB AUTO_INCREMENT=219797 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_app`
--

DROP TABLE IF EXISTS `ent_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_app` (
  `AppID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(45) NOT NULL DEFAULT '',
  `Description` varchar(255) DEFAULT NULL,
  `OpenCorpus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SingleActivityReport` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AnonymousUser` tinyint(1) NOT NULL DEFAULT '0',
  `URIPrefix` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AppID`),
  UNIQUE KEY `Index_AppID` (`AppID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_concept`
--

DROP TABLE IF EXISTS `ent_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_concept` (
  `ConceptID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(65) NOT NULL,
  `Description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ConceptID`),
  KEY `Index_ConceptID` (`ConceptID`),
  KEY `Index_Title` (`Title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3048 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_domain`
--

DROP TABLE IF EXISTS `ent_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_domain` (
  `DomainID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(45) NOT NULL DEFAULT '',
  `Description` varchar(255) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL COMMENT '''id'' is used to relate domains in webex21 with um2 domain.',
  PRIMARY KEY (`DomainID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_locking_log`
--

DROP TABLE IF EXISTS `ent_locking_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_locking_log` (
  `LockingLogID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AppID` tinyint(3) unsigned NOT NULL,
  `UserID` int(10) unsigned NOT NULL,
  `GroupID` int(10) unsigned NOT NULL,
  `AdditionalContext` varchar(255) DEFAULT NULL COMMENT 'e.g. ActivityID, Result, SVC',
  `LockValue` bigint(20) unsigned NOT NULL COMMENT 'e.g. Time in MS, or even -1 - no lock',
  `Action` varchar(50) NOT NULL COMMENT 'e.g. Set, Removed, Observed',
  `TimeMS` bigint(20) unsigned NOT NULL COMMENT 'for Action=Set same as LockValue, for others different',
  `Description` varchar(255) DEFAULT NULL COMMENT 'textual summary',
  `Agent` varchar(255) DEFAULT NULL COMMENT 'who is requesting',
  PRIMARY KEY (`LockingLogID`)
) ENGINE=MyISAM AUTO_INCREMENT=162031 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_report_log`
--

DROP TABLE IF EXISTS `ent_report_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_report_log` (
  `ReportLogID` int(11) NOT NULL AUTO_INCREMENT,
  `Dir` varchar(5) NOT NULL,
  `Type` varchar(7) NOT NULL,
  `Format` varchar(5) NOT NULL,
  `App` int(11) NOT NULL,
  `Token` varchar(50) DEFAULT NULL,
  `UserGroup` varchar(50) DEFAULT NULL,
  `Result` varchar(20) DEFAULT NULL COMMENT 'OK, Exception',
  `StartTS` bigint(20) NOT NULL,
  `FinishTS` bigint(20) NOT NULL,
  `Delay` bigint(20) NOT NULL,
  PRIMARY KEY (`ReportLogID`),
  KEY `newindex` (`Token`)
) ENGINE=MyISAM AUTO_INCREMENT=2285840 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_student_prepost`
--

DROP TABLE IF EXISTS `ent_student_prepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_student_prepost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `userid` int(10) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `consent` smallint(6) NOT NULL DEFAULT '0',
  `pretest` int(11) DEFAULT NULL,
  `posttest` int(11) DEFAULT NULL,
  `normpre` float(8,4) DEFAULT NULL,
  `normpost` float(8,4) DEFAULT NULL,
  `repeatingcourse` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_userid` (`userid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=675 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_user`
--

DROP TABLE IF EXISTS `ent_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_user` (
  `UserID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `URI` varchar(255) NOT NULL DEFAULT '',
  `Login` varchar(30) DEFAULT NULL,
  `Name` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `Pass` varchar(60) DEFAULT NULL,
  `IsGroup` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `IsAnyGroup` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Sync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EMail` varchar(50) NOT NULL DEFAULT '<unspecified>',
  `Organization` varchar(100) NOT NULL DEFAULT '<unspecified>',
  `City` varchar(30) NOT NULL DEFAULT '<unspecified>',
  `Country` varchar(50) NOT NULL DEFAULT '<unspecified>',
  `How` text NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `Index_Login` (`Login`),
  KEY `Index_UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=22524 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 4096 kB; (`AppID`) REFER `um2/ent_app`(`AppID`)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_user_activity`
--

DROP TABLE IF EXISTS `ent_user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_user_activity` (
  `AppID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  `GroupID` int(10) unsigned NOT NULL DEFAULT '0',
  `Result` varchar(50) NOT NULL DEFAULT '',
  `ActivityID` int(10) unsigned NOT NULL DEFAULT '0',
  `Session` varchar(25) NOT NULL,
  `DateNTime` varchar(25) NOT NULL DEFAULT '',
  `DateNTimeNS` bigint(20) DEFAULT NULL,
  `SVC` varchar(255) DEFAULT NULL,
  `AllParameters` text NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `Index_AppID` (`AppID`),
  KEY `Index_ActivityID` (`ActivityID`),
  KEY `Index_AppIDActivityID` (`ActivityID`,`AppID`) USING BTREE,
  KEY `Index_UserID` (`UserID`) USING BTREE,
  KEY `Index_GroupID` (`GroupID`) USING BTREE,
  CONSTRAINT `FK_ent_user_activity_1` FOREIGN KEY (`AppID`) REFERENCES `ent_app` (`AppID`),
  CONSTRAINT `FK_ent_user_activity_2` FOREIGN KEY (`ActivityID`) REFERENCES `ent_activity` (`ActivityID`),
  CONSTRAINT `FK_ent_user_activity_3` FOREIGN KEY (`UserID`) REFERENCES `ent_user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3263756 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 7168 kB; (`AppID`) REFER `um2/ent_app`(`AppID`)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_user_knowledge_updates`
--

DROP TABLE IF EXISTS `ent_user_knowledge_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_user_knowledge_updates` (
  `UserKnowledgeUpdateID` int(11) NOT NULL AUTO_INCREMENT,
  `AppID` tinyint(3) NOT NULL,
  `UserID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `DomainID` int(11) NOT NULL,
  `ConceptID` int(11) NOT NULL,
  `Value` float NOT NULL,
  `Session` varchar(25) NOT NULL,
  `SVC` varchar(225) DEFAULT NULL,
  `DateNTime` varchar(25) NOT NULL,
  `DateNTimeNS` bigint(20) NOT NULL,
  `AllParameters` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`UserKnowledgeUpdateID`),
  KEY `IN_ACTIVE` (`active`),
  KEY `IN_USER` (`UserID`),
  KEY `IN_GROUP` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=346499 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nsf_2010_sqlknot`
--

DROP TABLE IF EXISTS `nsf_2010_sqlknot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsf_2010_sqlknot` (
  `GroupID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `SQLKnoT` int(11) DEFAULT NULL,
  KEY `i1` (`GroupID`),
  KEY `i2` (`UserID`),
  KEY `i3` (`SQLKnoT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nsf_2010_sqllab`
--

DROP TABLE IF EXISTS `nsf_2010_sqllab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsf_2010_sqllab` (
  `GroupID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `SQLLab` int(11) DEFAULT NULL,
  KEY `i1` (`GroupID`),
  KEY `i2` (`UserID`),
  KEY `i3` (`SQLLab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nsf_2010_webex`
--

DROP TABLE IF EXISTS `nsf_2010_webex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsf_2010_webex` (
  `GroupID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `WebEx` int(11) DEFAULT NULL,
  KEY `i1` (`GroupID`),
  KEY `i2` (`UserID`),
  KEY `i3` (`WebEx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `progressor_rel_topic_content`
--

DROP TABLE IF EXISTS `progressor_rel_topic_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progressor_rel_topic_content` (
  `rdfid` varchar(225) DEFAULT NULL,
  `topic_name` varchar(225) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `group_id` varchar(225) DEFAULT NULL,
  `content_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `progressor_rel_topic_example`
--

DROP TABLE IF EXISTS `progressor_rel_topic_example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progressor_rel_topic_example` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `example_rdfid` varchar(255) DEFAULT NULL,
  `topicid` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_activity_activity`
--

DROP TABLE IF EXISTS `rel_activity_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_activity_activity` (
  `ParentActivityID` int(10) unsigned NOT NULL DEFAULT '1',
  `ChildActivityID` int(10) unsigned NOT NULL DEFAULT '1',
  `AppID` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `DateNTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ParentActivityID`,`ChildActivityID`,`AppID`),
  KEY `Index_ParentActivityID` (`ParentActivityID`),
  KEY `Index_ChildActivityID` (`ChildActivityID`),
  KEY `Index_AppID` (`AppID`),
  CONSTRAINT `FK_rel_activity_activity_1` FOREIGN KEY (`ParentActivityID`) REFERENCES `ent_activity` (`ActivityID`),
  CONSTRAINT `FK_rel_activity_activity_2` FOREIGN KEY (`ChildActivityID`) REFERENCES `ent_activity` (`ActivityID`),
  CONSTRAINT `FK_rel_activity_activity_3` FOREIGN KEY (`AppID`) REFERENCES `ent_app` (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 7168 kB; (`ParentActivityID`) REFER `um2/ent_ac';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_app_user`
--

DROP TABLE IF EXISTS `rel_app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_app_user` (
  `AppID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AppID`,`UserID`),
  KEY `Index_AppID` (`AppID`),
  KEY `Index_UserID` (`UserID`),
  CONSTRAINT `FK_rel_app_user_1` FOREIGN KEY (`AppID`) REFERENCES `ent_app` (`AppID`),
  CONSTRAINT `FK_rel_app_user_2` FOREIGN KEY (`UserID`) REFERENCES `ent_user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 4096 kB';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_concept_activity`
--

DROP TABLE IF EXISTS `rel_concept_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_concept_activity` (
  `ConceptID` int(10) unsigned NOT NULL DEFAULT '0',
  `ActivityID` int(10) unsigned NOT NULL DEFAULT '0',
  `Weight` float NOT NULL DEFAULT '0',
  `Direction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DateNTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ConceptID`,`ActivityID`),
  KEY `Index_ConceptID` (`ConceptID`),
  KEY `Index_ActivityID` (`ActivityID`),
  CONSTRAINT `FK_rel_concept_activity_1` FOREIGN KEY (`ConceptID`) REFERENCES `ent_concept` (`ConceptID`),
  CONSTRAINT `FK_rel_concept_activity_2` FOREIGN KEY (`ActivityID`) REFERENCES `ent_activity` (`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_concept_activity_old_ictg`
--

DROP TABLE IF EXISTS `rel_concept_activity_old_ictg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_concept_activity_old_ictg` (
  `ConceptID` int(10) unsigned NOT NULL DEFAULT '0',
  `ActivityID` int(10) unsigned NOT NULL DEFAULT '0',
  `Weight` float NOT NULL DEFAULT '0',
  `Direction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DateNTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_concept_concept`
--

DROP TABLE IF EXISTS `rel_concept_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_concept_concept` (
  `ParentConceptID` int(10) unsigned NOT NULL DEFAULT '0',
  `ChildConceptID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ParentConceptID`,`ChildConceptID`),
  KEY `Index_ParentConceptID` (`ParentConceptID`),
  KEY `Index_ChildConceptID` (`ChildConceptID`),
  CONSTRAINT `FK_rel_concept_concept_1` FOREIGN KEY (`ParentConceptID`) REFERENCES `ent_concept` (`ConceptID`),
  CONSTRAINT `FK_rel_concept_concept_2` FOREIGN KEY (`ChildConceptID`) REFERENCES `ent_concept` (`ConceptID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_domain_concept`
--

DROP TABLE IF EXISTS `rel_domain_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_domain_concept` (
  `DomainID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ConceptID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DomainID`,`ConceptID`),
  KEY `Index_DomainID` (`DomainID`),
  KEY `Index_ConceptID` (`ConceptID`),
  CONSTRAINT `FK_rel_domain_concept_1` FOREIGN KEY (`ConceptID`) REFERENCES `ent_concept` (`ConceptID`),
  CONSTRAINT `FK_rel_domain_concept_2` FOREIGN KEY (`DomainID`) REFERENCES `ent_domain` (`DomainID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 61440 kB';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_pcex_set_component`
--

DROP TABLE IF EXISTS `rel_pcex_set_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_pcex_set_component` (
  `ParentActivityID` int(10) NOT NULL,
  `ChildActivityID` int(10) NOT NULL,
  `AppID` tinyint(3) unsigned NOT NULL,
  `DateNTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ParentActivityID`,`AppID`,`ChildActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_user_user`
--

DROP TABLE IF EXISTS `rel_user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_user_user` (
  `GroupID` int(10) unsigned NOT NULL DEFAULT '0',
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`GroupID`,`UserID`),
  KEY `Index_GroupID` (`GroupID`) USING BTREE,
  KEY `Index_UserID` (`UserID`) USING BTREE,
  CONSTRAINT `FK_rel_user_user_1` FOREIGN KEY (`UserID`) REFERENCES `ent_user` (`UserID`),
  CONSTRAINT `FK_rel_user_user_2` FOREIGN KEY (`GroupID`) REFERENCES `ent_user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 7168 kB; (`ParentUserID`) REFER `um2/ent_user`(';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

DROP TABLE IF EXISTS `slow_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slow_log` (
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time NOT NULL,
  `lock_time` time NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sql_question_names`
--

DROP TABLE IF EXISTS `sql_question_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_question_names` (
  `activityid` int(12) NOT NULL,
  `content_name` varchar(50) NOT NULL,
  `content_type` varchar(50) NOT NULL,
  `url` varchar(500) NOT NULL,
  PRIMARY KEY (`activityid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_activity`
--

DROP TABLE IF EXISTS `view_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_activity` (
  `groupid` int(10) unsigned DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `question_attempts` decimal(23,0) DEFAULT NULL,
  `question_attempts_succ` decimal(23,0) DEFAULT NULL,
  `dist_succ_questions` bigint(21) DEFAULT NULL,
  `example_line_attempts` decimal(23,0) DEFAULT NULL,
  `dist_example_lines` bigint(21) DEFAULT NULL,
  `ae_line_attempts` decimal(23,0) DEFAULT NULL,
  `dist_ae_lines` bigint(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'um2'
--

--
-- Dumping routines for database 'um2'
--

--
-- Final view structure for view `activity_concept`
--

/*!50001 DROP VIEW IF EXISTS `activity_concept`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activity_concept` AS select `a`.`ActivityID` AS `activityid`,`c`.`Title` AS `concept`,`c`.`ConceptID` AS `ConceptID`,`a`.`Activity` AS `name`,`a`.`AppID` AS `appid` from ((`ent_activity` `a` join `rel_concept_activity` `ca`) join `ent_concept` `c`) where ((`a`.`ActivityID` = `ca`.`ActivityID`) and (`ca`.`ConceptID` = `c`.`ConceptID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `activity_details`
--

/*!50001 DROP VIEW IF EXISTS `activity_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activity_details` AS select `activity`.`ActivityID` AS `activityid`,`app`.`AppID` AS `appid`,`activity`.`Activity` AS `activity`,`activity`.`Description` AS `description`,`activity`.`URI` AS `uri`,`app`.`Title` AS `app` from (`ent_activity` `activity` join `ent_app` `app`) where ((`app`.`Title` = 'quizjet') and (`app`.`AppID` = `activity`.`AppID`) and (`activity`.`Description` in ('QuizJet quiz','QuizJET question'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `activitydetailstemp`
--

/*!50001 DROP VIEW IF EXISTS `activitydetailstemp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activitydetailstemp` AS select `activity`.`ActivityID` AS `activityid`,`app`.`AppID` AS `appid`,`activity`.`Activity` AS `activity`,`activity`.`Description` AS `description`,`activity`.`URI` AS `uri`,`app`.`Title` AS `app` from (`ent_activity` `activity` join `ent_app` `app`) where ((`app`.`Title` = 'webex') and (`app`.`AppID` = `activity`.`AppID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-19  3:15:50
