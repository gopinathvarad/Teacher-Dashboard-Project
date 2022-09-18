-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: aggregate
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
-- Current Database: `aggregate`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `aggregate` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `aggregate`;

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
-- Table structure for table `ent_activity_combstudy16`
--

DROP TABLE IF EXISTS `ent_activity_combstudy16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_activity_combstudy16` (
  `ActivityID` int(10) unsigned NOT NULL DEFAULT '0',
  `AppID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `URI` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `Activity` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `DateNTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_badge`
--

DROP TABLE IF EXISTS `ent_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_badge` (
  `badge_id` varchar(50) NOT NULL,
  `value` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `img_URL` varchar(100) NOT NULL,
  `congrat_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`badge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_computed_models`
--

DROP TABLE IF EXISTS `ent_computed_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_computed_models` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `course_id` int(12) NOT NULL,
  `last_update` datetime NOT NULL,
  `model4topics` text,
  `model4content` text,
  `model4kc` text,
  PRIMARY KEY (`id`),
  KEY `idx_user_course` (`user_id`,`course_id`),
  KEY `idx_course` (`course_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15447 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_computed_models_combstudy16`
--

DROP TABLE IF EXISTS `ent_computed_models_combstudy16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_computed_models_combstudy16` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `course_id` int(12) NOT NULL,
  `last_update` datetime NOT NULL,
  `model4kc` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_course` (`user_id`,`course_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_computed_models_combstudy16_history`
--

DROP TABLE IF EXISTS `ent_computed_models_combstudy16_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_computed_models_combstudy16_history` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `course_id` int(12) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `computedon` datetime NOT NULL,
  `model4kc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_computed_models_history`
--

DROP TABLE IF EXISTS `ent_computed_models_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_computed_models_history` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `course_id` int(12) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `computedon` datetime NOT NULL,
  `model4topics` text NOT NULL,
  `model4content` text NOT NULL,
  `model4kc` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=420732 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_content`
--

DROP TABLE IF EXISTS `ent_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_content` (
  `content_id` int(12) NOT NULL AUTO_INCREMENT,
  `content_name` varchar(50) NOT NULL,
  `content_type` varchar(50) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `desc` varchar(500) DEFAULT '',
  `url` varchar(500) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `provider_id` varchar(100) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator_id` varchar(50) NOT NULL DEFAULT 'admin',
  `privacy` varchar(50) NOT NULL,
  `author_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  UNIQUE KEY `content_name_unique` (`content_name`),
  KEY `content_index1` (`content_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2904 DEFAULT CHARSET=utf8 COMMENT='This table is still in discussion. The real material is host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_content_backup_20161201`
--

DROP TABLE IF EXISTS `ent_content_backup_20161201`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_content_backup_20161201` (
  `content_id` int(12) NOT NULL DEFAULT '0',
  `content_name` varchar(50) NOT NULL,
  `content_type` varchar(50) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `desc` varchar(500) DEFAULT '',
  `url` varchar(500) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `provider_id` varchar(100) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL,
  `creator_id` varchar(50) NOT NULL DEFAULT 'admin',
  `privacy` varchar(50) NOT NULL,
  `author_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_course`
--

DROP TABLE IF EXISTS `ent_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_course` (
  `course_id` int(12) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `course_code` varchar(50) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL,
  `creator_id` varchar(50) NOT NULL DEFAULT 'admin',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=422 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_creator`
--

DROP TABLE IF EXISTS `ent_creator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_creator` (
  `creator_id` varchar(50) NOT NULL,
  `creator_name` varchar(50) NOT NULL,
  `affiliation` varchar(50) NOT NULL,
  `affiliation_code` varchar(10) NOT NULL,
  PRIMARY KEY (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_domain`
--

DROP TABLE IF EXISTS `ent_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_domain` (
  `name` varchar(50) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `order` smallint(4) NOT NULL,
  `creation_date` datetime NOT NULL,
  `creator_id` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_group`
--

DROP TABLE IF EXISTS `ent_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(100) NOT NULL,
  `group_name` varchar(250) NOT NULL,
  `course_id` int(12) NOT NULL,
  `creation_date` datetime NOT NULL,
  `term` varchar(50) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `creator_id` varchar(50) DEFAULT 'admin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_groupid` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_hidden_topics`
--

DROP TABLE IF EXISTS `ent_hidden_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_hidden_topics` (
  `topic_name` varchar(50) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  PRIMARY KEY (`topic_name`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_log`
--

DROP TABLE IF EXISTS `ent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `subject` varchar(30) DEFAULT NULL,
  `object` varchar(50) NOT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=4937 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_non_student`
--

DROP TABLE IF EXISTS `ent_non_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_non_student` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `user_role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_group` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=759 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_parameters`
--

DROP TABLE IF EXISTS `ent_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_parameters` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `level` varchar(50) NOT NULL DEFAULT 'group' COMMENT 'group, user',
  `user_id` varchar(50) DEFAULT NULL,
  `group_id` varchar(50) DEFAULT NULL,
  `condition_id` varchar(100) DEFAULT NULL,
  `params_vis` varchar(1000) DEFAULT NULL,
  `params_svcs` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(50) NOT NULL DEFAULT 'admin',
  `user_manual` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique` (`user_id`,`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_point`
--

DROP TABLE IF EXISTS `ent_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_point` (
  `user_id` varchar(100) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `recent_point` varchar(10) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `total_point` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`,`total_point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_point_history`
--

DROP TABLE IF EXISTS `ent_point_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_point_history` (
  `user_id` varchar(100) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `recent_point` varchar(10) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `total_point` varchar(10) NOT NULL,
  `content_name` varchar(100) DEFAULT NULL,
  `provider_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`group_id`,`total_point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_precomputed_models`
--

DROP TABLE IF EXISTS `ent_precomputed_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_precomputed_models` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `course_id` int(12) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `computedon` datetime NOT NULL,
  `model4topics` text NOT NULL,
  `model4content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_course` (`user_id`,`course_id`),
  KEY `idx_user_id` (`id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1965 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_provider`
--

DROP TABLE IF EXISTS `ent_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_provider` (
  `provider_id` varchar(100) NOT NULL COMMENT 'This column has the provider id.',
  `name` varchar(100) DEFAULT NULL COMMENT 'This column has the provider name.',
  `desc` varchar(500) DEFAULT NULL COMMENT 'This column has the description for the provider.',
  `url` varchar(500) DEFAULT NULL COMMENT 'This column has the url for the provider.',
  `creation_date` datetime NOT NULL,
  `creator_id` varchar(50) NOT NULL,
  `um_svc_url` varchar(400) DEFAULT NULL,
  `activity_svc_url` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_resource`
--

DROP TABLE IF EXISTS `ent_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'This column has the resource id.',
  `resource_name` varchar(100) NOT NULL,
  `course_id` int(11) NOT NULL COMMENT 'This column has the course id.',
  `display_name` varchar(100) DEFAULT NULL COMMENT 'This column has the resource name.',
  `desc` varchar(500) DEFAULT NULL COMMENT 'This column has the resource description.',
  `order` int(2) NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL,
  `creator_id` varchar(50) NOT NULL,
  `update_state_on` varchar(3) NOT NULL DEFAULT '010' COMMENT 'Digit represent in order options for updating the user model on: 1: activity done, 2: in window close, and 3: window close if activity done. For example 010 will update UM when the content window is closed.',
  `window_width` smallint(4) DEFAULT '800',
  `window_height` smallint(4) DEFAULT '420',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_subgroups`
--

DROP TABLE IF EXISTS `ent_subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_subgroups` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(50) DEFAULT NULL,
  `subgroup_name` varchar(100) DEFAULT NULL,
  `subgroup_users` text,
  `type` varchar(20) DEFAULT 'relative',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_tagging`
--

DROP TABLE IF EXISTS `ent_tagging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_tagging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) NOT NULL,
  `entity_type` varchar(50) NOT NULL COMMENT 'The entity_type can take on the following values:\nresource, provider, topic, content, creator',
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29942 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_timeline`
--

DROP TABLE IF EXISTS `ent_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_timeline` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(50) DEFAULT NULL,
  `currentTopics` varchar(400) DEFAULT NULL,
  `coveredTopics` varchar(400) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_topic`
--

DROP TABLE IF EXISTS `ent_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_topic` (
  `topic_id` int(12) NOT NULL AUTO_INCREMENT,
  `course_id` int(12) NOT NULL DEFAULT '1',
  `topic_name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `parent` int(12) DEFAULT NULL,
  `order` smallint(8) NOT NULL DEFAULT '0',
  `domain` varchar(50) NOT NULL DEFAULT 'UNDEFINED',
  `creation_date` datetime NOT NULL,
  `creator_id` varchar(50) NOT NULL DEFAULT 'admin',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `active` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1700 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_topic_backup_20161201`
--

DROP TABLE IF EXISTS `ent_topic_backup_20161201`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_topic_backup_20161201` (
  `topic_id` int(12) NOT NULL DEFAULT '0',
  `course_id` int(12) NOT NULL DEFAULT '1',
  `topic_name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `parent` int(12) DEFAULT NULL,
  `order` smallint(8) NOT NULL DEFAULT '0',
  `domain` varchar(50) NOT NULL DEFAULT 'UNDEFINED',
  `creation_date` datetime NOT NULL,
  `creator_id` varchar(50) NOT NULL DEFAULT 'admin',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `active` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_tracking`
--

DROP TABLE IF EXISTS `ent_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_tracking` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `datentime` datetime(3) DEFAULT NULL,
  `user_id` varchar(50) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `action` text NOT NULL COMMENT 'pick_topic, change_level_display',
  `comment` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10294821 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_tracking_combstudy_backup_20161201`
--

DROP TABLE IF EXISTS `ent_tracking_combstudy_backup_20161201`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_tracking_combstudy_backup_20161201` (
  `id` int(18) NOT NULL DEFAULT '0',
  `datentime` datetime NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `action` text NOT NULL COMMENT 'pick_topic, change_level_display',
  `comment` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_user_feedback`
--

DROP TABLE IF EXISTS `ent_user_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_user_feedback` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `src_content_name` varchar(100) NOT NULL,
  `src_content_res` varchar(100) NOT NULL,
  `fb_id` varchar(100) NOT NULL COMMENT 'this field stores a unique key among different feedback items responded. Group by fb_id for getting answers of different questions in the same form presented to the user.',
  `fb_item_id` varchar(100) NOT NULL,
  `fb_response_value` varchar(100) NOT NULL,
  `item_rec_id` varchar(100) NOT NULL COMMENT 'for some feedback which comes from recommended items, set this value',
  `datentime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62794 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_user_preferences`
--

DROP TABLE IF EXISTS `ent_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) DEFAULT NULL,
  `group_id` varchar(45) DEFAULT NULL,
  `parameter_name` varchar(45) DEFAULT NULL,
  `parameter_value` longtext,
  `user_context` varchar(200) DEFAULT NULL,
  `session_id` varchar(20) DEFAULT 'test',
  `app_name` varchar(30) DEFAULT NULL,
  `datetime` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23906 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ent_user_rec`
--

DROP TABLE IF EXISTS `ent_user_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_user_rec` (
  `user_id` varchar(100) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `total_rec` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kc_component`
--

DROP TABLE IF EXISTS `kc_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kc_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(200) NOT NULL,
  `cardinality` smallint(6) NOT NULL DEFAULT '1',
  `display_name` varchar(100) NOT NULL DEFAULT '',
  `domain` varchar(50) NOT NULL DEFAULT '',
  `main_topic` varchar(100) NOT NULL DEFAULT '',
  `active` smallint(1) NOT NULL DEFAULT '1',
  `main_component` varchar(100) NOT NULL DEFAULT '',
  `threshold1` decimal(6,4) NOT NULL DEFAULT '0.0000',
  `threshold2` decimal(6,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniquename` (`component_name`,`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=1068 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kc_component_combstudy16`
--

DROP TABLE IF EXISTS `kc_component_combstudy16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kc_component_combstudy16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(200) NOT NULL,
  `cardinality` smallint(6) NOT NULL DEFAULT '1',
  `display_name` varchar(100) NOT NULL DEFAULT '',
  `domain` varchar(50) NOT NULL DEFAULT '',
  `main_topic` varchar(100) NOT NULL DEFAULT '',
  `active` smallint(1) NOT NULL DEFAULT '1',
  `main_component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kc_content_component`
--

DROP TABLE IF EXISTS `kc_content_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kc_content_component` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `content_name` varchar(200) NOT NULL,
  `component_name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `context_name` varchar(200) NOT NULL DEFAULT '',
  `domain` varchar(20) NOT NULL,
  `weight` float(10,3) NOT NULL DEFAULT '0.000',
  `active` smallint(1) NOT NULL DEFAULT '1',
  `source_method` varchar(100) NOT NULL DEFAULT 'expert',
  `importance` smallint(6) NOT NULL DEFAULT '0',
  `contributesK` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ind_concept_dir` (`component_name`),
  KEY `ind_content_name` (`content_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31029 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kc_content_component_combstudy16`
--

DROP TABLE IF EXISTS `kc_content_component_combstudy16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kc_content_component_combstudy16` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `content_name` varchar(200) NOT NULL,
  `component_name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `context_name` varchar(200) NOT NULL DEFAULT '',
  `domain` varchar(20) NOT NULL,
  `weight` float(10,3) NOT NULL DEFAULT '0.000',
  `active` smallint(1) NOT NULL DEFAULT '1',
  `source_method` varchar(100) NOT NULL DEFAULT 'expert',
  `importance` smallint(6) NOT NULL DEFAULT '0',
  `contributesK` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7406 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kc_content_recommendation_combstudy16`
--

DROP TABLE IF EXISTS `kc_content_recommendation_combstudy16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kc_content_recommendation_combstudy16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_que` varchar(90) NOT NULL,
  `rec_que_type` varchar(45) NOT NULL,
  `main_kc_name` varchar(45) NOT NULL DEFAULT '',
  `ori_que` varchar(45) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '1',
  `note` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommendations_by_models_combstudy16`
--

DROP TABLE IF EXISTS `recommendations_by_models_combstudy16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendations_by_models_combstudy16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `course_id` varchar(100) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `user_model` varchar(45) NOT NULL,
  `rec_que` varchar(100) NOT NULL,
  `rec_order` int(11) NOT NULL,
  `ori_que` varchar(100) DEFAULT NULL,
  `ori_que_res` double DEFAULT NULL,
  `rec_method` varchar(45) DEFAULT NULL,
  `rec_que_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3726 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_activity_activity_combstudy16`
--

DROP TABLE IF EXISTS `rel_activity_activity_combstudy16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_activity_activity_combstudy16` (
  `ParentActivityID` int(10) unsigned NOT NULL DEFAULT '1',
  `ChildActivityID` int(10) unsigned NOT NULL DEFAULT '1',
  `AppID` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `DateNTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_content_concept`
--

DROP TABLE IF EXISTS `rel_content_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_content_concept` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `content_id` int(12) NOT NULL,
  `concept_name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `weight` float NOT NULL DEFAULT '0',
  `direction` varchar(12) NOT NULL DEFAULT '',
  `active` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ind_concept_dir` (`concept_name`,`direction`)
) ENGINE=InnoDB AUTO_INCREMENT=5064 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_provider_domain`
--

DROP TABLE IF EXISTS `rel_provider_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_provider_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` varchar(100) DEFAULT NULL,
  `domain_name` varchar(50) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `contentbrokering_cb` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='This table defines a mapping between providers and the domai';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_resource_provider`
--

DROP TABLE IF EXISTS `rel_resource_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_resource_provider` (
  `resource_id` int(11) NOT NULL COMMENT 'This column has the resource id.',
  `provider_id` varchar(100) NOT NULL COMMENT 'This column has the provider id.',
  PRIMARY KEY (`resource_id`,`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_topic_content`
--

DROP TABLE IF EXISTS `rel_topic_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_topic_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(12) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `content_id` int(12) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `display_order` smallint(4) NOT NULL,
  `creation_date` datetime NOT NULL,
  `creator` varchar(50) NOT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `to_con_index1` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20389 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_topic_content_backup_20161201`
--

DROP TABLE IF EXISTS `rel_topic_content_backup_20161201`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_topic_content_backup_20161201` (
  `id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(12) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `content_id` int(12) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `display_order` smallint(4) NOT NULL,
  `creation_date` datetime NOT NULL,
  `creator` varchar(50) NOT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_user_badge`
--

DROP TABLE IF EXISTS `rel_user_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_user_badge` (
  `user_id` varchar(100) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `badge_id` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`,`badge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats_content`
--

DROP TABLE IF EXISTS `stats_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_name` varchar(100) DEFAULT NULL,
  `provider_id` varchar(100) DEFAULT NULL,
  `domain` varchar(50) DEFAULT 'java',
  `a_p10` float(6,2) DEFAULT NULL,
  `a_p25` float(6,2) DEFAULT NULL,
  `a_p33` float(6,2) DEFAULT NULL,
  `a_p50` float(6,2) DEFAULT NULL,
  `a_p66` float(6,2) DEFAULT NULL,
  `a_p75` float(6,2) DEFAULT NULL,
  `a_p80` float(6,2) DEFAULT NULL,
  `a_p85` float(6,2) DEFAULT NULL,
  `a_p90` float(6,2) DEFAULT NULL,
  `t_p10` float(6,2) DEFAULT NULL,
  `t_p25` float(6,2) DEFAULT NULL,
  `t_p33` float(6,2) DEFAULT NULL,
  `t_p50` float(6,2) DEFAULT NULL,
  `t_p66` float(6,2) DEFAULT NULL,
  `t_p75` float(6,2) DEFAULT NULL,
  `t_p80` float(6,2) DEFAULT NULL,
  `t_p85` float(6,2) DEFAULT NULL,
  `t_p90` float(6,2) DEFAULT NULL,
  `sr_p10` float(6,2) DEFAULT NULL,
  `sr_p25` float(6,2) DEFAULT NULL,
  `sr_p33` float(6,2) DEFAULT NULL,
  `sr_p50` float(6,2) DEFAULT NULL,
  `sr_p66` float(6,2) DEFAULT NULL,
  `sr_p75` float(6,2) DEFAULT NULL,
  `sr_p80` float(6,2) DEFAULT NULL,
  `sr_p85` float(6,2) DEFAULT NULL,
  `sr_p90` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stats` (`content_name`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `study2data`
--

DROP TABLE IF EXISTS `study2data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study2data` (
  `id` int(18) NOT NULL DEFAULT '0',
  `datentime` datetime NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `action` text NOT NULL COMMENT 'pick_topic, change_level_display',
  `comment` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idxuser` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `study_kc_component`
--

DROP TABLE IF EXISTS `study_kc_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_kc_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(200) NOT NULL,
  `cardinality` smallint(6) NOT NULL DEFAULT '1',
  `display_name` varchar(100) NOT NULL DEFAULT '',
  `domain` varchar(50) NOT NULL DEFAULT '',
  `main_topic` varchar(100) NOT NULL DEFAULT '',
  `active` smallint(1) NOT NULL DEFAULT '1',
  `main_component` varchar(100) NOT NULL DEFAULT '',
  `threshold1` decimal(6,4) NOT NULL DEFAULT '0.0000',
  `threshold2` decimal(6,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniquename` (`component_name`,`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `study_kc_content_component`
--

DROP TABLE IF EXISTS `study_kc_content_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_kc_content_component` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `content_name` varchar(200) NOT NULL,
  `component_name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `context_name` varchar(200) NOT NULL DEFAULT '',
  `domain` varchar(20) NOT NULL,
  `weight` float(10,3) NOT NULL DEFAULT '0.000',
  `active` smallint(1) NOT NULL DEFAULT '1',
  `source_method` varchar(100) NOT NULL DEFAULT 'expert',
  `importance` smallint(6) NOT NULL DEFAULT '0',
  `contributesK` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ind_concept_dir` (`component_name`),
  KEY `ind_content_name` (`content_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9366 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `um2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `um2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `um2`;

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
) ENGINE=InnoDB AUTO_INCREMENT=221951 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=3059 DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=2631880 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=29060 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 4096 kB; (`AppID`) REFER `um2/ent_app`(`AppID`)';
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
) ENGINE=InnoDB AUTO_INCREMENT=4498977 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 7168 kB; (`AppID`) REFER `um2/ent_app`(`AppID`)';
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
) ENGINE=InnoDB AUTO_INCREMENT=709696 DEFAULT CHARSET=utf8;
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
  `DateNTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
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
-- Current Database: `aggregate`
--

USE `aggregate`;

--
-- Current Database: `um2`
--

USE `um2`;

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

-- Dump completed on 2022-05-23  1:37:37ent_user