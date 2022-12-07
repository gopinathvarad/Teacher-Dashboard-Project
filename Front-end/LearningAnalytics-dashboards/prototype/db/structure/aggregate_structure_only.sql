CREATE DATABASE  IF NOT EXISTS `aggregate` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aggregate`;
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
) ENGINE=InnoDB AUTO_INCREMENT=11156 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=924125 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=2500 DEFAULT CHARSET=utf8 COMMENT='This table is still in discussion. The real material is host';
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
) ENGINE=MyISAM AUTO_INCREMENT=390 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=2790 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=660 DEFAULT CHARSET=utf8;
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
  `params_vis` varchar(500) DEFAULT NULL,
  `params_svcs` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(50) NOT NULL DEFAULT 'admin',
  `user_manual` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique` (`user_id`,`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3232 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;
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
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `creator_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=1226 DEFAULT CHARSET=utf8;
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
  `datentime` datetime NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `action` text NOT NULL COMMENT 'pick_topic, change_level_display',
  `comment` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6881774 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=54361 DEFAULT CHARSET=utf8;
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
  `parameter_value` varchar(45) DEFAULT NULL,
  `user_context` varchar(200) DEFAULT NULL,
  `session_id` varchar(20) DEFAULT 'test',
  `app_name` varchar(30) DEFAULT NULL,
  `datetime` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `group_id_fk_idx` (`group_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `ent_group` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7898 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=1059 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=28322 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='This table defines a mapping between providers and the domai';
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
) ENGINE=InnoDB AUTO_INCREMENT=13709 DEFAULT CHARSET=utf8;
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
-- Dumping events for database 'aggregate'
--

--
-- Dumping routines for database 'aggregate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-19  3:17:49
