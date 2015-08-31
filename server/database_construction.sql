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
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `idconfig` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(128) DEFAULT NULL,
  `monitorar` varchar(5) DEFAULT NULL,
  `questionario` varchar(5) DEFAULT NULL,
  `relatorio` varchar(5) DEFAULT NULL,
  `intervalo_minimo_de_stall` int(11) DEFAULT NULL,
  `intervalo_de_monitoramento` int(11) DEFAULT NULL,
  `enviar_para_servidor` varchar(5) DEFAULT NULL,
  `simulador` varchar(45) DEFAULT NULL,
  `startup_time` int(11) DEFAULT NULL,
  `stall_duration` int(11) DEFAULT NULL,
  `ativar_startup_stall` varchar(5) DEFAULT NULL,
  `ativar_stall` varchar(5) DEFAULT NULL,
  `show_video_controls` varchar(5) DEFAULT NULL,
  `show_questionario_simulador` varchar(5) DEFAULT NULL,
  `url_resolucao_1` varchar(256) DEFAULT NULL,
  `url_resolucao_2` varchar(256) DEFAULT NULL,
  `url_resolucao_3` varchar(256) DEFAULT NULL,
  `url_resolucao_4` varchar(256) DEFAULT NULL,
  `url_resolucao_5` varchar(256) DEFAULT NULL,
  `ativar_troca_de_resolucao` varchar(5) DEFAULT NULL,
  `url_page_simulador` varchar(256) DEFAULT NULL,
  `timestamp` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`idconfig`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'http://0.0.0.0:3001','true','true','false',50,1000,'1','Desativar simulador',1000,1000,'1','1','1','1','','','','','','1','http://200.220.254.84/hobbit-480p.html',1441027673092);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_estado_stall`
--

DROP TABLE IF EXISTS `config_estado_stall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_estado_stall` (
  `idconfig_estado_stall` int(11) NOT NULL AUTO_INCREMENT,
  `posicao` varchar(8) DEFAULT NULL,
  `estado` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`idconfig_estado_stall`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_estado_stall`
--

LOCK TABLES `config_estado_stall` WRITE;
/*!40000 ALTER TABLE `config_estado_stall` DISABLE KEYS */;
INSERT INTO `config_estado_stall` VALUES (1,'pos0','bad'),(2,'pos1','good'),(3,'pos2','good'),(4,'pos3','good'),(5,'pos4','good'),(6,'pos5','good'),(7,'pos6','good'),(8,'pos7','good'),(9,'pos8','good'),(10,'pos9','good'),(11,'pos11','good'),(12,'pos12','good'),(13,'pos13','good'),(14,'pos14','good'),(15,'pos15','good'),(16,'pos16','good'),(17,'pos17','good'),(18,'pos18','good'),(19,'pos19','good'),(20,'pos20','good'),(21,'pos21','good'),(22,'pos22','good'),(23,'pos23','good'),(24,'pos24','good'),(25,'pos25','good'),(26,'pos26','good'),(27,'pos27','good'),(28,'pos28','good'),(29,'pos29','good'),(30,'pos30','good'),(31,'pos31','good'),(32,'pos32','good'),(33,'pos33','good'),(34,'pos34','good'),(35,'pos35','good'),(36,'pos36','good'),(37,'pos37','good'),(38,'pos38','good'),(39,'pos39','good'),(40,'pos40','good'),(41,'pos41','good'),(42,'pos42','good'),(43,'pos43','bad'),(44,'pos44','good'),(45,'pos45','good'),(46,'pos46','good'),(47,'pos47','good'),(48,'pos48','good'),(49,'pos49','good'),(50,'pos50','good'),(51,'pos51','good'),(52,'pos52','good'),(53,'pos53','good'),(54,'pos54','good'),(55,'pos55','good'),(56,'pos56','good'),(57,'pos57','good'),(58,'pos58','good'),(59,'pos59','good'),(60,'pos60','good'),(61,'pos61','good'),(62,'pos62','good'),(63,'pos63','good'),(64,'pos64','good'),(65,'pos65','good'),(66,'pos66','good'),(67,'pos67','good'),(68,'pos68','good'),(69,'pos69','good'),(70,'pos70','good'),(71,'pos71','good'),(72,'pos72','good'),(73,'pos73','good'),(74,'pos74','good'),(75,'pos75','good'),(76,'pos76','good'),(77,'pos77','good'),(78,'pos78','good'),(79,'pos79','good'),(80,'pos80','good'),(81,'pos81','good'),(82,'pos82','good'),(83,'pos83','good'),(84,'pos84','good'),(85,'pos85','good'),(86,'pos86','good'),(87,'pos87','good'),(88,'pos88','good'),(89,'pos89','good'),(90,'pos90','good'),(91,'pos91','good'),(92,'pos92','good'),(93,'pos93','good'),(94,'pos94','good'),(95,'pos95','good'),(96,'pos96','good'),(97,'pos97','good'),(98,'pos98','good'),(99,'pos99','good'),(100,'pos100','good');
/*!40000 ALTER TABLE `config_estado_stall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_resolution_state`
--

DROP TABLE IF EXISTS `config_resolution_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_resolution_state` (
  `idconfig_resolution_state` int(11) NOT NULL AUTO_INCREMENT,
  `posicao` varchar(8) DEFAULT NULL,
  `estado` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`idconfig_resolution_state`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_resolution_state`
--

LOCK TABLES `config_resolution_state` WRITE;
/*!40000 ALTER TABLE `config_resolution_state` DISABLE KEYS */;
INSERT INTO `config_resolution_state` VALUES (1,'pos0','3'),(2,'pos1','6'),(3,'pos2','6'),(4,'pos3','6'),(5,'pos4','6'),(6,'pos5','6'),(7,'pos6','6'),(8,'pos7','6'),(9,'pos8','6'),(10,'pos9','6'),(11,'pos11','6'),(12,'pos12','6'),(13,'pos13','6'),(14,'pos14','6'),(15,'pos15','6'),(16,'pos16','6'),(17,'pos17','6'),(18,'pos18','6'),(19,'pos19','6'),(20,'pos20','6'),(21,'pos21','6'),(22,'pos22','6'),(23,'pos23','6'),(24,'pos24','6'),(25,'pos25','6'),(26,'pos26','6'),(27,'pos27','6'),(28,'pos28','6'),(29,'pos29','6'),(30,'pos30','6'),(31,'pos31','6'),(32,'pos32','6'),(33,'pos33','6'),(34,'pos34','6'),(35,'pos35','6'),(36,'pos36','6'),(37,'pos37','6'),(38,'pos38','6'),(39,'pos39','6'),(40,'pos40','6'),(41,'pos41','6'),(42,'pos42','6'),(43,'pos43','6'),(44,'pos44','6'),(45,'pos45','6'),(46,'pos46','6'),(47,'pos47','6'),(48,'pos48','6'),(49,'pos49','6'),(50,'pos50','6'),(51,'pos51','6'),(52,'pos52','6'),(53,'pos53','6'),(54,'pos54','6'),(55,'pos55','6'),(56,'pos56','6'),(57,'pos57','6'),(58,'pos58','6'),(59,'pos59','6'),(60,'pos60','6'),(61,'pos61','6'),(62,'pos62','6'),(63,'pos63','6'),(64,'pos64','6'),(65,'pos65','6'),(66,'pos66','6'),(67,'pos67','6'),(68,'pos68','6'),(69,'pos69','6'),(70,'pos70','6'),(71,'pos71','6'),(72,'pos72','6'),(73,'pos73','6'),(74,'pos74','6'),(75,'pos75','6'),(76,'pos76','6'),(77,'pos77','6'),(78,'pos78','6'),(79,'pos79','6'),(80,'pos80','6'),(81,'pos81','6'),(82,'pos82','6'),(83,'pos83','6'),(84,'pos84','6'),(85,'pos85','6'),(86,'pos86','6'),(87,'pos87','6'),(88,'pos88','6'),(89,'pos89','6'),(90,'pos90','6'),(91,'pos91','6'),(92,'pos92','6'),(93,'pos93','6'),(94,'pos94','6'),(95,'pos95','6'),(96,'pos96','6'),(97,'pos97','6'),(98,'pos98','6'),(99,'pos99','6'),(100,'pos100','6');
/*!40000 ALTER TABLE `config_resolution_state` ENABLE KEYS */;
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

-- Dump completed on 2015-08-31 10:37:22
