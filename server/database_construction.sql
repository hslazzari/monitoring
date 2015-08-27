CREATE DATABASE  IF NOT EXISTS `monitor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `monitor`;
-- MySQL dump 10.13  Distrib 5.6.19, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: monitor
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `audio_bytes_decoded_per_second`
--

DROP TABLE IF EXISTS `audio_bytes_decoded_per_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audio_bytes_decoded_per_second` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_video_position` float NOT NULL,
  `timestamp_of_audio_bytes_decoded` bigint(64) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  `audio_bytes` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_bytes_decoded_per_second`
--

LOCK TABLES `audio_bytes_decoded_per_second` WRITE;
/*!40000 ALTER TABLE `audio_bytes_decoded_per_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio_bytes_decoded_per_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buffer_interval`
--

DROP TABLE IF EXISTS `buffer_interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buffer_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_buffer_time` float NOT NULL,
  `end_buffer_time` float NOT NULL,
  `video_information_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buffer_interval`
--

LOCK TABLES `buffer_interval` WRITE;
/*!40000 ALTER TABLE `buffer_interval` DISABLE KEYS */;
/*!40000 ALTER TABLE `buffer_interval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frame_per_second`
--

DROP TABLE IF EXISTS `frame_per_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frame_per_second` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_video_position` float NOT NULL,
  `timestamp_of_frame` bigint(64) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  `number_of_frames` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frame_per_second`
--

LOCK TABLES `frame_per_second` WRITE;
/*!40000 ALTER TABLE `frame_per_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `frame_per_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `length_of_stall`
--

DROP TABLE IF EXISTS `length_of_stall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `length_of_stall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_video_position` float NOT NULL,
  `timestamp_of_stall` bigint(64) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  `duration_of_stall` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `length_of_stall`
--

LOCK TABLES `length_of_stall` WRITE;
/*!40000 ALTER TABLE `length_of_stall` DISABLE KEYS */;
/*!40000 ALTER TABLE `length_of_stall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mute_state`
--

DROP TABLE IF EXISTS `mute_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mute_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_video_position` float NOT NULL,
  `timestamp_of_mute_state` bigint(64) NOT NULL,
  `state` int(11) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_state`
--

LOCK TABLES `mute_state` WRITE;
/*!40000 ALTER TABLE `mute_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `mute_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_state`
--

DROP TABLE IF EXISTS `network_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_video_position` float NOT NULL,
  `timestamp_of_network_state` bigint(64) NOT NULL,
  `state` int(11) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_state`
--

LOCK TABLES `network_state` WRITE;
/*!40000 ALTER TABLE `network_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playback_quality`
--

DROP TABLE IF EXISTS `playback_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playback_quality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp_of_quality` bigint(64) NOT NULL,
  `current_video_position` float NOT NULL,
  `video_width` int(11) NOT NULL,
  `video_height` int(11) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playback_quality`
--

LOCK TABLES `playback_quality` WRITE;
/*!40000 ALTER TABLE `playback_quality` DISABLE KEYS */;
/*!40000 ALTER TABLE `playback_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_interval`
--

DROP TABLE IF EXISTS `played_interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `played_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_play` float NOT NULL,
  `end_play` float NOT NULL,
  `video_information_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_interval`
--

LOCK TABLES `played_interval` WRITE;
/*!40000 ALTER TABLE `played_interval` DISABLE KEYS */;
/*!40000 ALTER TABLE `played_interval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionario`
--

DROP TABLE IF EXISTS `questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionario` (
  `idquestionario` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `timestamp` bigint(64) DEFAULT NULL,
  `conteudo` varchar(64) DEFAULT NULL,
  `diario` int(11) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `sexo` varchar(12) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `tempo` int(11) DEFAULT NULL,
  `comentario` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idquestionario`),
  UNIQUE KEY `idquestionario_UNIQUE` (`idquestionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionario`
--

LOCK TABLES `questionario` WRITE;
/*!40000 ALTER TABLE `questionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skip_play`
--

DROP TABLE IF EXISTS `skip_play`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skip_play` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_video_position` float NOT NULL,
  `timestamp_of_skip` bigint(64) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  `skip_duration` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skip_play`
--

LOCK TABLES `skip_play` WRITE;
/*!40000 ALTER TABLE `skip_play` DISABLE KEYS */;
/*!40000 ALTER TABLE `skip_play` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stall_position_simulador`
--

DROP TABLE IF EXISTS `stall_position_simulador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stall_position_simulador` (
  `id_simulador` int(11) NOT NULL,
  `position_percent` varchar(8) NOT NULL,
  PRIMARY KEY (`id_simulador`,`position_percent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stall_position_simulador`
--

LOCK TABLES `stall_position_simulador` WRITE;
/*!40000 ALTER TABLE `stall_position_simulador` DISABLE KEYS */;
INSERT INTO `stall_position_simulador` VALUES (4,'pos5');
/*!40000 ALTER TABLE `stall_position_simulador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_in_buffer`
--

DROP TABLE IF EXISTS `time_in_buffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_in_buffer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_video_position` float NOT NULL,
  `timestamp_of_time` bigint(64) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  `remaining_time_in_buffer` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_in_buffer`
--

LOCK TABLES `time_in_buffer` WRITE;
/*!40000 ALTER TABLE `time_in_buffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_in_buffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troca_de_resolucao_simulador`
--

DROP TABLE IF EXISTS `troca_de_resolucao_simulador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troca_de_resolucao_simulador` (
  `id_simulador` int(11) NOT NULL,
  `position_percent` varchar(8) NOT NULL,
  `url_resolucao` varchar(25) NOT NULL,
  PRIMARY KEY (`id_simulador`,`position_percent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troca_de_resolucao_simulador`
--

LOCK TABLES `troca_de_resolucao_simulador` WRITE;
/*!40000 ALTER TABLE `troca_de_resolucao_simulador` DISABLE KEYS */;
INSERT INTO `troca_de_resolucao_simulador` VALUES (8,'pos0','url_resolucao_6'),(8,'pos1','url_resolucao_1'),(8,'pos100','url_resolucao_6'),(8,'pos11','url_resolucao_6'),(8,'pos12','url_resolucao_6'),(8,'pos13','url_resolucao_6'),(8,'pos14','url_resolucao_6'),(8,'pos15','url_resolucao_6'),(8,'pos16','url_resolucao_6'),(8,'pos17','url_resolucao_6'),(8,'pos18','url_resolucao_6'),(8,'pos19','url_resolucao_6'),(8,'pos2','url_resolucao_1'),(8,'pos20','url_resolucao_6'),(8,'pos21','url_resolucao_6'),(8,'pos22','url_resolucao_6'),(8,'pos23','url_resolucao_6'),(8,'pos24','url_resolucao_6'),(8,'pos25','url_resolucao_6'),(8,'pos26','url_resolucao_6'),(8,'pos27','url_resolucao_6'),(8,'pos28','url_resolucao_6'),(8,'pos29','url_resolucao_6'),(8,'pos3','url_resolucao_6'),(8,'pos30','url_resolucao_6'),(8,'pos31','url_resolucao_6'),(8,'pos32','url_resolucao_6'),(8,'pos33','url_resolucao_6'),(8,'pos34','url_resolucao_6'),(8,'pos35','url_resolucao_6'),(8,'pos36','url_resolucao_6'),(8,'pos37','url_resolucao_6'),(8,'pos38','url_resolucao_6'),(8,'pos39','url_resolucao_6'),(8,'pos4','url_resolucao_6'),(8,'pos40','url_resolucao_6'),(8,'pos41','url_resolucao_6'),(8,'pos42','url_resolucao_6'),(8,'pos43','url_resolucao_6'),(8,'pos44','url_resolucao_6'),(8,'pos45','url_resolucao_6'),(8,'pos46','url_resolucao_6'),(8,'pos47','url_resolucao_6'),(8,'pos48','url_resolucao_6'),(8,'pos49','url_resolucao_6'),(8,'pos5','url_resolucao_6'),(8,'pos50','url_resolucao_6'),(8,'pos51','url_resolucao_6'),(8,'pos52','url_resolucao_6'),(8,'pos53','url_resolucao_6'),(8,'pos54','url_resolucao_6'),(8,'pos55','url_resolucao_6'),(8,'pos56','url_resolucao_6'),(8,'pos57','url_resolucao_6'),(8,'pos58','url_resolucao_6'),(8,'pos59','url_resolucao_6'),(8,'pos6','url_resolucao_6'),(8,'pos60','url_resolucao_6'),(8,'pos61','url_resolucao_6'),(8,'pos62','url_resolucao_6'),(8,'pos63','url_resolucao_6'),(8,'pos64','url_resolucao_6'),(8,'pos65','url_resolucao_6'),(8,'pos66','url_resolucao_6'),(8,'pos67','url_resolucao_6'),(8,'pos68','url_resolucao_6'),(8,'pos69','url_resolucao_6'),(8,'pos7','url_resolucao_6'),(8,'pos70','url_resolucao_6'),(8,'pos71','url_resolucao_6'),(8,'pos72','url_resolucao_6'),(8,'pos73','url_resolucao_6'),(8,'pos74','url_resolucao_6'),(8,'pos75','url_resolucao_6'),(8,'pos76','url_resolucao_6'),(8,'pos77','url_resolucao_6'),(8,'pos78','url_resolucao_6'),(8,'pos79','url_resolucao_6'),(8,'pos8','url_resolucao_6'),(8,'pos80','url_resolucao_6'),(8,'pos81','url_resolucao_6'),(8,'pos82','url_resolucao_6'),(8,'pos83','url_resolucao_6'),(8,'pos84','url_resolucao_6'),(8,'pos85','url_resolucao_6'),(8,'pos86','url_resolucao_6'),(8,'pos87','url_resolucao_6'),(8,'pos88','url_resolucao_6'),(8,'pos89','url_resolucao_6'),(8,'pos9','url_resolucao_6'),(8,'pos90','url_resolucao_6'),(8,'pos91','url_resolucao_6'),(8,'pos92','url_resolucao_6'),(8,'pos93','url_resolucao_6'),(8,'pos94','url_resolucao_6'),(8,'pos95','url_resolucao_6'),(8,'pos96','url_resolucao_6'),(8,'pos97','url_resolucao_6'),(8,'pos98','url_resolucao_6'),(8,'pos99','url_resolucao_6'),(9,'pos0','url_resolucao_6'),(9,'pos1','url_resolucao_1'),(9,'pos100','url_resolucao_6'),(9,'pos11','url_resolucao_6'),(9,'pos12','url_resolucao_6'),(9,'pos13','url_resolucao_6'),(9,'pos14','url_resolucao_6'),(9,'pos15','url_resolucao_6'),(9,'pos16','url_resolucao_6'),(9,'pos17','url_resolucao_6'),(9,'pos18','url_resolucao_6'),(9,'pos19','url_resolucao_6'),(9,'pos2','url_resolucao_1'),(9,'pos20','url_resolucao_6'),(9,'pos21','url_resolucao_6'),(9,'pos22','url_resolucao_6'),(9,'pos23','url_resolucao_6'),(9,'pos24','url_resolucao_6'),(9,'pos25','url_resolucao_6'),(9,'pos26','url_resolucao_6'),(9,'pos27','url_resolucao_6'),(9,'pos28','url_resolucao_6'),(9,'pos29','url_resolucao_6'),(9,'pos3','url_resolucao_6'),(9,'pos30','url_resolucao_6'),(9,'pos31','url_resolucao_6'),(9,'pos32','url_resolucao_6'),(9,'pos33','url_resolucao_6'),(9,'pos34','url_resolucao_6'),(9,'pos35','url_resolucao_6'),(9,'pos36','url_resolucao_6'),(9,'pos37','url_resolucao_6'),(9,'pos38','url_resolucao_6'),(9,'pos39','url_resolucao_6'),(9,'pos4','url_resolucao_6'),(9,'pos40','url_resolucao_6'),(9,'pos41','url_resolucao_6'),(9,'pos42','url_resolucao_6'),(9,'pos43','url_resolucao_6'),(9,'pos44','url_resolucao_6'),(9,'pos45','url_resolucao_6'),(9,'pos46','url_resolucao_6'),(9,'pos47','url_resolucao_6'),(9,'pos48','url_resolucao_6'),(9,'pos49','url_resolucao_6'),(9,'pos5','url_resolucao_6'),(9,'pos50','url_resolucao_6'),(9,'pos51','url_resolucao_6'),(9,'pos52','url_resolucao_6'),(9,'pos53','url_resolucao_6'),(9,'pos54','url_resolucao_6'),(9,'pos55','url_resolucao_6'),(9,'pos56','url_resolucao_6'),(9,'pos57','url_resolucao_6'),(9,'pos58','url_resolucao_6'),(9,'pos59','url_resolucao_6'),(9,'pos6','url_resolucao_6'),(9,'pos60','url_resolucao_6'),(9,'pos61','url_resolucao_6'),(9,'pos62','url_resolucao_6'),(9,'pos63','url_resolucao_6'),(9,'pos64','url_resolucao_6'),(9,'pos65','url_resolucao_6'),(9,'pos66','url_resolucao_6'),(9,'pos67','url_resolucao_6'),(9,'pos68','url_resolucao_6'),(9,'pos69','url_resolucao_6'),(9,'pos7','url_resolucao_6'),(9,'pos70','url_resolucao_6'),(9,'pos71','url_resolucao_6'),(9,'pos72','url_resolucao_6'),(9,'pos73','url_resolucao_6'),(9,'pos74','url_resolucao_6'),(9,'pos75','url_resolucao_6'),(9,'pos76','url_resolucao_6'),(9,'pos77','url_resolucao_6'),(9,'pos78','url_resolucao_6'),(9,'pos79','url_resolucao_6'),(9,'pos8','url_resolucao_6'),(9,'pos80','url_resolucao_6'),(9,'pos81','url_resolucao_6'),(9,'pos82','url_resolucao_6'),(9,'pos83','url_resolucao_6'),(9,'pos84','url_resolucao_6'),(9,'pos85','url_resolucao_6'),(9,'pos86','url_resolucao_6'),(9,'pos87','url_resolucao_6'),(9,'pos88','url_resolucao_6'),(9,'pos89','url_resolucao_6'),(9,'pos9','url_resolucao_6');
/*!40000 ALTER TABLE `troca_de_resolucao_simulador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_bytes_decoded_per_second`
--

DROP TABLE IF EXISTS `video_bytes_decoded_per_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_bytes_decoded_per_second` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_video_position` float NOT NULL,
  `timestamp_of_video_bytes_decoded` bigint(64) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  `video_bytes` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_bytes_decoded_per_second`
--

LOCK TABLES `video_bytes_decoded_per_second` WRITE;
/*!40000 ALTER TABLE `video_bytes_decoded_per_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_bytes_decoded_per_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_information`
--

DROP TABLE IF EXISTS `video_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_information` (
  `ip` varchar(40) NOT NULL,
  `start_timestamp` bigint(64) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `netmetric` varchar(45) DEFAULT NULL,
  `total_played_time` float NOT NULL,
  `total_played_time_with_stall` float NOT NULL,
  `total_stall_length` float NOT NULL,
  `total_number_of_stall` float NOT NULL,
  `video_duration` float NOT NULL,
  `dropped_frames` int(11) NOT NULL,
  `left_time` float NOT NULL,
  `video_information_id` int(11) NOT NULL DEFAULT '0',
  `video_preload` varchar(16) NOT NULL,
  `video_start_time` float NOT NULL,
  PRIMARY KEY (`ip`,`start_timestamp`,`hash`),
  UNIQUE KEY `video_information_id_UNIQUE` (`video_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_information`
--

LOCK TABLES `video_information` WRITE;
/*!40000 ALTER TABLE `video_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_information_simulador`
--

DROP TABLE IF EXISTS `video_information_simulador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_information_simulador` (
  `idvideo_information_simulador` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `start_timestamp` bigint(64) NOT NULL,
  `video_duration` float NOT NULL,
  `ativar_stall` varchar(8) NOT NULL,
  `ativar_startup_stall` varchar(8) NOT NULL,
  `show_video_controls` varchar(8) NOT NULL,
  `stall_duration` int(11) NOT NULL,
  `startup_time` int(11) NOT NULL,
  `url_page_simulador` varchar(128) NOT NULL,
  `url_resolucao_1` varchar(128) NOT NULL,
  `url_resolucao_2` varchar(128) NOT NULL,
  `url_resolucao_3` varchar(128) NOT NULL,
  `url_resolucao_4` varchar(128) NOT NULL,
  `url_resolucao_5` varchar(128) NOT NULL,
  `url_resolucao_6` varchar(128) NOT NULL,
  `ativar_troca_de_resolucao` varchar(8) NOT NULL,
  PRIMARY KEY (`idvideo_information_simulador`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_information_simulador`
--

LOCK TABLES `video_information_simulador` WRITE;
/*!40000 ALTER TABLE `video_information_simulador` DISABLE KEYS */;
INSERT INTO `video_information_simulador` VALUES (1,'127.0.0.1','ni4znVh68sipPdgp087oyNrELvtivLSb4PDPAXRWajqEy0k71QKZS2IWymIz6nHb',1440682458994,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(2,'127.0.0.1','IlMjjypHtetYD5GmMzjIoQ60ZNJGW2SfwVI0f08Y2x3RLXrvoRQLh0jWsORou7Ft',1440682502465,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(3,'127.0.0.1','3KDUca62pf70PnsaupM0QT8wEfhA5YPiO6oPcbtVljlkIxXWaUPksIWAnG5JXPDw',1440682596291,178.214,'0','1','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(4,'127.0.0.1','XIb576FxlADE8PgVYgjDutsdRJCafkJWZolW2qLgxSby5w7GsKBWO7xmKV5NeUIU',1440683390743,178.214,'0','1','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(5,'127.0.0.1','k0di6rnrs41jcYI3bpubE7dtXbuzfY1990tK8zMAK7o3DS8FQveXsz3Mttr7IQ4I',1440683868664,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(6,'127.0.0.1','BtUROU4EylZmKPGNGl0gOgt47MsEYDkrEmTdpQaXPdedccfbDbTtwubmOXoRLqyL',1440683896215,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(7,'127.0.0.1','dFl5YGZ3MWRThnzLyeoL68x7pUflsj08R8EepLWeb0A1jS8FBVpw5Gu2dMC3iQUW',1440683962669,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(8,'127.0.0.1','vXqVr2RnRAKMEQOhI0wSwaLMS24JMwx50WvaNzLDE5Vkqh80LKnt5am5ORBPx7D0',1440683987382,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(9,'127.0.0.1','QqxUQHgJ5hhTdtUOaG00sH5fHDu9RQOPyOvNEMjptA1E3rwwMA6YqXBmJIs5nlMi',1440684189165,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','1');
/*!40000 ALTER TABLE `video_information_simulador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_source`
--

DROP TABLE IF EXISTS `video_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(512) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_source`
--

LOCK TABLES `video_source` WRITE;
/*!40000 ALTER TABLE `video_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_state`
--

DROP TABLE IF EXISTS `volume_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_video_position` float NOT NULL,
  `timestamp_of_volume` bigint(64) NOT NULL,
  `video_information_id` int(11) NOT NULL,
  `volume` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_state`
--

LOCK TABLES `volume_state` WRITE;
/*!40000 ALTER TABLE `volume_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-27 11:03:33
