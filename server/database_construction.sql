CREATE DATABASE  IF NOT EXISTS `monitor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `monitor`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: monitor
-- ------------------------------------------------------
-- Server version	5.6.14

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_bytes_decoded_per_second`
--

LOCK TABLES `audio_bytes_decoded_per_second` WRITE;
/*!40000 ALTER TABLE `audio_bytes_decoded_per_second` DISABLE KEYS */;
INSERT INTO `audio_bytes_decoded_per_second` VALUES (1,0.696026,1441043648655,3,30913),(2,1.69444,1441043649656,3,31650),(3,2.69286,1441043650656,3,31649),(4,4.59682,1441043652563,3,60356),(5,5.59523,1441043653563,3,31649),(6,6.61687,1441043654567,3,32386),(7,8.6137,1441043656563,3,62563),(8,9.61212,1441043657564,3,32386),(9,10.6105,1441043658567,3,31650),(10,11.8179,1441043659789,3,38327),(11,12.8396,1441043660792,3,32332),(12,13.838,1441043661794,3,31650),(13,14.8364,1441043662794,3,31650),(14,175.463,1441043663795,3,108197),(15,176.461,1441043664796,3,31650),(16,177.46,1441043665799,3,31650),(17,2.11239,1441044802728,4,75811),(18,3.1108,1441044803730,4,31650),(19,4.10922,1441044804731,4,31650),(20,5.13086,1441044805732,4,32385),(21,0.881778,1441116593940,5,36801),(22,176.646,1441116594944,5,144264),(23,177.645,1441116595947,5,31650);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buffer_interval`
--

LOCK TABLES `buffer_interval` WRITE;
/*!40000 ALTER TABLE `buffer_interval` DISABLE KEYS */;
INSERT INTO `buffer_interval` VALUES (1,0,26.648,3),(2,172.8,178.214,3),(3,0,16.322,4),(4,0,14.989,5),(5,172.8,178.214,5);
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
INSERT INTO `config` VALUES (1,'http://0.0.0.0:3000','true','true','false',100,1000,'1','Desativar simulador',1000,1000,'1','1','0','1','','','','','','1','http://200.220.254.84/hobbit-480p.html',1441113043723);
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
INSERT INTO `config_estado_stall` VALUES (1,'pos0','bad'),(2,'pos1','good'),(3,'pos2','good'),(4,'pos3','good'),(5,'pos4','good'),(6,'pos5','good'),(7,'pos6','good'),(8,'pos7','good'),(9,'pos8','good'),(10,'pos9','good'),(11,'pos11','good'),(12,'pos12','good'),(13,'pos13','good'),(14,'pos14','good'),(15,'pos15','good'),(16,'pos16','good'),(17,'pos17','good'),(18,'pos18','good'),(19,'pos19','good'),(20,'pos20','good'),(21,'pos21','good'),(22,'pos22','good'),(23,'pos23','good'),(24,'pos24','good'),(25,'pos25','good'),(26,'pos26','good'),(27,'pos27','good'),(28,'pos28','good'),(29,'pos29','good'),(30,'pos30','good'),(31,'pos31','good'),(32,'pos32','good'),(33,'pos33','good'),(34,'pos34','good'),(35,'pos35','good'),(36,'pos36','good'),(37,'pos37','good'),(38,'pos38','good'),(39,'pos39','good'),(40,'pos40','good'),(41,'pos41','good'),(42,'pos42','good'),(43,'pos43','good'),(44,'pos44','good'),(45,'pos45','good'),(46,'pos46','good'),(47,'pos47','good'),(48,'pos48','good'),(49,'pos49','good'),(50,'pos50','good'),(51,'pos51','good'),(52,'pos52','good'),(53,'pos53','good'),(54,'pos54','good'),(55,'pos55','good'),(56,'pos56','good'),(57,'pos57','good'),(58,'pos58','good'),(59,'pos59','good'),(60,'pos60','good'),(61,'pos61','good'),(62,'pos62','good'),(63,'pos63','good'),(64,'pos64','good'),(65,'pos65','good'),(66,'pos66','good'),(67,'pos67','good'),(68,'pos68','good'),(69,'pos69','good'),(70,'pos70','good'),(71,'pos71','good'),(72,'pos72','good'),(73,'pos73','good'),(74,'pos74','good'),(75,'pos75','good'),(76,'pos76','good'),(77,'pos77','good'),(78,'pos78','good'),(79,'pos79','good'),(80,'pos80','good'),(81,'pos81','good'),(82,'pos82','good'),(83,'pos83','good'),(84,'pos84','good'),(85,'pos85','good'),(86,'pos86','good'),(87,'pos87','good'),(88,'pos88','good'),(89,'pos89','good'),(90,'pos90','good'),(91,'pos91','good'),(92,'pos92','good'),(93,'pos93','good'),(94,'pos94','good'),(95,'pos95','good'),(96,'pos96','good'),(97,'pos97','good'),(98,'pos98','good'),(99,'pos99','good'),(100,'pos100','good');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frame_per_second`
--

LOCK TABLES `frame_per_second` WRITE;
/*!40000 ALTER TABLE `frame_per_second` DISABLE KEYS */;
INSERT INTO `frame_per_second` VALUES (1,0.696026,1441043648655,3,21),(2,1.69444,1441043649655,3,25),(3,2.69286,1441043650656,3,26),(4,4.59682,1441043652563,3,38),(5,5.59523,1441043653563,3,25),(6,6.61687,1441043654567,3,26),(7,8.6137,1441043656563,3,44),(8,9.61212,1441043657564,3,26),(9,10.6105,1441043658567,3,25),(10,11.8179,1441043659789,3,38),(11,12.8396,1441043660792,3,31),(12,13.838,1441043661794,3,25),(13,14.8364,1441043662794,3,25),(14,175.463,1441043663795,3,81),(15,176.461,1441043664796,3,26),(16,177.46,1441043665799,3,25),(17,2.11239,1441044802728,4,57),(18,3.1108,1441044803730,4,25),(19,4.10922,1441044804731,4,25),(20,5.13086,1441044805732,4,25),(21,0.881778,1441116593940,5,26),(22,176.646,1441116594944,5,109),(23,177.645,1441116595947,5,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `length_of_stall`
--

LOCK TABLES `length_of_stall` WRITE;
/*!40000 ALTER TABLE `length_of_stall` DISABLE KEYS */;
INSERT INTO `length_of_stall` VALUES (1,0,1441043647755,3,0.261),(2,175.092,1441043663312,3,0.157),(3,176.484,1441116594378,5,0.413);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_state`
--

LOCK TABLES `mute_state` WRITE;
/*!40000 ALTER TABLE `mute_state` DISABLE KEYS */;
INSERT INTO `mute_state` VALUES (1,0.696026,1441043648656,0,3),(2,2.11239,1441044802729,0,4),(3,0.881778,1441116593941,0,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_state`
--

LOCK TABLES `network_state` WRITE;
/*!40000 ALTER TABLE `network_state` DISABLE KEYS */;
INSERT INTO `network_state` VALUES (1,0.696026,1441043648656,1,3),(2,2.11239,1441044802730,1,4),(3,0.881778,1441116593941,1,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playback_quality`
--

LOCK TABLES `playback_quality` WRITE;
/*!40000 ALTER TABLE `playback_quality` DISABLE KEYS */;
INSERT INTO `playback_quality` VALUES (1,1441043648654,0,1280,720,3),(2,1441044802727,0,1280,720,4),(3,1441116593939,0,1280,720,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_interval`
--

LOCK TABLES `played_interval` WRITE;
/*!40000 ALTER TABLE `played_interval` DISABLE KEYS */;
INSERT INTO `played_interval` VALUES (1,0,15.2543,3),(2,175.092,178.214,3),(3,0,5.85064,4),(4,0,1.25328,5),(5,176.484,178.214,5);
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
  `opinion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idquestionario`),
  UNIQUE KEY `idquestionario_UNIQUE` (`idquestionario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionario`
--

LOCK TABLES `questionario` WRITE;
/*!40000 ALTER TABLE `questionario` DISABLE KEYS */;
INSERT INTO `questionario` VALUES (1,'::ffff:127.0.0.1','s4esPpIpTdfZyxbcoAgWooDEgxoJZO87Mdr6oNKjzviTRhDxM4IntZzqmHomhXFf',4,1441043647646,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(2,'::ffff:127.0.0.1','lifrXVVpjB2M0oH5DJvcw0MnJHPZHqHC1fZLNccO3DgYPgOSIWh1ilmiJtnRNwsf',1,1441043768919,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(3,'::ffff:127.0.0.1','s4esPpIpTdfZyxbcoAgWooDEgxoJZO87Mdr6oNKjzviTRhDxM4IntZzqmHomhXFf',4,1441043647646,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(4,'::ffff:127.0.0.1','lifrXVVpjB2M0oH5DJvcw0MnJHPZHqHC1fZLNccO3DgYPgOSIWh1ilmiJtnRNwsf',1,1441043768919,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(5,'::ffff:127.0.0.1','s4esPpIpTdfZyxbcoAgWooDEgxoJZO87Mdr6oNKjzviTRhDxM4IntZzqmHomhXFf',4,1441043647646,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(6,'::ffff:127.0.0.1','RsKxiNDrCND7DNYKn3lR3dmugvD81ee9tqCtIjZyUrLMrlWQk6k52n8b5Y2jQpuw',1,1441115313919,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(7,'::ffff:127.0.0.1','dwKF4NcvznM3JQ19Bht6gpyfQHoJBbgqwXTgQImJ7b2Fcf8j7ZEwEhEriJURydjG',1,1441115433904,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(8,'::ffff:127.0.0.1','8HkxhEoqLyrpz30XWFi8meEmDGLAsNQaBpLv8q0HeVqI2zXBNrhU0N39xcOCYZfl',1,1441115553904,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(9,'::ffff:127.0.0.1','5N8y3keyFVB8SuqhKeiMv98nGPm0hM8UTd5lviYjs0l1q9S4hM0G5jv3EOHHhhIw',1,1441115676224,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(10,'::ffff:127.0.0.1','1wOQa3BYwpvIdtglmD4xBKhMzN6VSyxXJC0znK1iMZDJIknZtrAelQF2KsxHXdpe',1,1441115801232,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(11,'::ffff:127.0.0.1','vFCipylQmLTb9sD1cW4pNd0XzCQMcAC7wmeeoZxlCrJNDu6gtcT5exccSVeJPQ6o',1,1441115927177,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(12,'::ffff:127.0.0.1','EjpIbEUj7CPY9kqbKoe5CWwm2xFXxP52WSpHWTA253oB6GV6Hps503UekJC6cOGj',1,1441116046307,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(13,'::ffff:127.0.0.1','NKQLTc63AjEz5CpJgg6tVnKau4dHgjMJi7k559EBd6znuRw0JGP6pNYKc36Okw5Y',1,1441116073868,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(14,'::ffff:127.0.0.1','cveI8Blqeam7FH4P6dJAENijk7QFDl0SZPMIgVjLmWwzfg0wxO8iVqGK80llOMpJ',1,1441116118293,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(15,'::ffff:127.0.0.1','NKQLTc63AjEz5CpJgg6tVnKau4dHgjMJi7k559EBd6znuRw0JGP6pNYKc36Okw5Y',1,1441116073868,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(16,'::ffff:127.0.0.1','cveI8Blqeam7FH4P6dJAENijk7QFDl0SZPMIgVjLmWwzfg0wxO8iVqGK80llOMpJ',1,1441116118293,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(17,'::ffff:127.0.0.1','RdR0Ahky4rl4j0DXUZiTZylau1EXBBehUjF06Wp1OtdXLNjRv7k2Mr3KxnSUijZk',1,1441116330955,'Ação',1,24,'Masculino','Brasil',1,'','Boa'),(18,'::ffff:127.0.0.1','TgSU1tM2H9p4Kz0xToxFb1P7vF55NpjZN6LrF8HEqfrrBwY4u762wCDNZxS8xjX6',1,1441116414177,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(19,'::ffff:127.0.0.1','QKLfRJxPeFVXIWAZXmVtgZBMQwucdnQO3dhMqCrCf1T2ItKcsJXCHQrYX7N1P5UM',1,1441116592935,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(20,'::ffff:127.0.0.1','CixShN1LS6zn4TDXwEuSth502J6G2p6lCrL6mi0J4hXIkZl4yti7ljXqEDB4ENGL',1,1441116778457,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(21,'::ffff:127.0.0.1','nyXon0ZIzy2J63kmOX5SWaNBM0EnbvEqfJPycmhjWxgMtPkDBB6t5VSZhk7RbRtJ',1,1441116807929,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(22,'::ffff:127.0.0.1','LrA16fOZC39ml4OV2dpnUdoNZe5DUAnLMn8Idwl8GmvKmvZfNP161nwo4StvdCTt',5,1441117382445,'Ação',1,24,'Masculino','Brasil',5,'','Boa'),(23,'::ffff:127.0.0.1','knUTkFofOaQSQzRplCY2T1UzQrTRkxRp2i8bm4OmVSyETiHNcfN9UC6PtiwBPAfj',1,1441117715980,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(24,'::ffff:127.0.0.1','8KtULQ3Vm2yZDhZwGmlXyZJmQyCf0Dg6lCQWq2YQduXvmFt46s4t1EmQxLA1ruR0',1,1441117740777,'Ação',1,24,'Masculino','Brasil',1,'','Ruim'),(25,'::ffff:127.0.0.1','lDT7boIjEWUeXCuYCLpZMOyaSZnsbfVA3L3wML3tttJqtVQQ7vcyLstEArNCSTLX',1,1441117759146,'Ação',1,24,'Masculino','Brasil',1,'','Ruim');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skip_play`
--

LOCK TABLES `skip_play` WRITE;
/*!40000 ALTER TABLE `skip_play` DISABLE KEYS */;
INSERT INTO `skip_play` VALUES (1,0,1441043647647,3,0.092332),(2,2.7393,1441043650697,3,9.19472),(3,15.1847,1441043663153,3,159.93),(4,0,1441044801723,4,1.41581),(5,0,1441116592936,5,0.092332),(6,1.20684,1441116594268,5,175.37);
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
INSERT INTO `stall_position_simulador` VALUES (4,'pos5'),(10,'pos2'),(11,'pos2'),(11,'pos4'),(12,'pos2'),(12,'pos4'),(13,'pos2'),(13,'pos4'),(14,'pos2'),(14,'pos4'),(15,'pos2'),(15,'pos4'),(16,'pos2'),(16,'pos4'),(17,'pos2'),(17,'pos4'),(18,'pos2'),(18,'pos4'),(19,'pos2'),(19,'pos4'),(20,'pos2'),(20,'pos4'),(21,'pos2'),(21,'pos4'),(22,'pos2'),(22,'pos4'),(23,'pos2'),(23,'pos4'),(24,'pos2'),(24,'pos4'),(25,'pos2'),(25,'pos4'),(26,'pos2'),(26,'pos4'),(27,'pos2'),(27,'pos4'),(28,'pos2'),(28,'pos4'),(29,'pos2'),(29,'pos4'),(30,'pos2'),(30,'pos4'),(31,'pos2'),(31,'pos4');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_in_buffer`
--

LOCK TABLES `time_in_buffer` WRITE;
/*!40000 ALTER TABLE `time_in_buffer` DISABLE KEYS */;
INSERT INTO `time_in_buffer` VALUES (1,0.696026,1441043648655,3,11.295),(2,1.69444,1441043649656,3,10.9626),(3,2.69286,1441043650657,3,10.2981),(4,4.59682,1441043652564,3,10.8922),(5,5.59523,1441043653563,3,10.5598),(6,6.61687,1441043654567,3,10.2041),(7,8.6137,1441043656563,3,9.04029),(8,9.61212,1441043657564,3,9.04088),(9,10.6105,1441043658567,3,9.04246),(10,11.8179,1441043659789,3,9.33407),(11,12.8396,1441043660792,3,9.14444),(12,13.838,1441043661794,3,8.81302),(13,14.8364,1441043662794,3,8.6466),(14,175.463,1441043663795,3,2.75102),(15,176.461,1441043664796,3,1.7526),(16,177.46,1441043665799,3,0.754187),(17,2.11239,1441044802729,4,10.7116),(18,3.1108,1441044803731,4,10.3792),(19,4.10922,1441044804731,4,10.7138),(20,5.13086,1441044805732,4,10.3581),(21,0.881778,1441116593940,5,11.2762),(22,176.646,1441116594945,5,1.56761),(23,177.645,1441116595947,5,0.569193);
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
INSERT INTO `troca_de_resolucao_simulador` VALUES (8,'pos0','url_resolucao_6'),(8,'pos1','url_resolucao_1'),(8,'pos100','url_resolucao_6'),(8,'pos11','url_resolucao_6'),(8,'pos12','url_resolucao_6'),(8,'pos13','url_resolucao_6'),(8,'pos14','url_resolucao_6'),(8,'pos15','url_resolucao_6'),(8,'pos16','url_resolucao_6'),(8,'pos17','url_resolucao_6'),(8,'pos18','url_resolucao_6'),(8,'pos19','url_resolucao_6'),(8,'pos2','url_resolucao_1'),(8,'pos20','url_resolucao_6'),(8,'pos21','url_resolucao_6'),(8,'pos22','url_resolucao_6'),(8,'pos23','url_resolucao_6'),(8,'pos24','url_resolucao_6'),(8,'pos25','url_resolucao_6'),(8,'pos26','url_resolucao_6'),(8,'pos27','url_resolucao_6'),(8,'pos28','url_resolucao_6'),(8,'pos29','url_resolucao_6'),(8,'pos3','url_resolucao_6'),(8,'pos30','url_resolucao_6'),(8,'pos31','url_resolucao_6'),(8,'pos32','url_resolucao_6'),(8,'pos33','url_resolucao_6'),(8,'pos34','url_resolucao_6'),(8,'pos35','url_resolucao_6'),(8,'pos36','url_resolucao_6'),(8,'pos37','url_resolucao_6'),(8,'pos38','url_resolucao_6'),(8,'pos39','url_resolucao_6'),(8,'pos4','url_resolucao_6'),(8,'pos40','url_resolucao_6'),(8,'pos41','url_resolucao_6'),(8,'pos42','url_resolucao_6'),(8,'pos43','url_resolucao_6'),(8,'pos44','url_resolucao_6'),(8,'pos45','url_resolucao_6'),(8,'pos46','url_resolucao_6'),(8,'pos47','url_resolucao_6'),(8,'pos48','url_resolucao_6'),(8,'pos49','url_resolucao_6'),(8,'pos5','url_resolucao_6'),(8,'pos50','url_resolucao_6'),(8,'pos51','url_resolucao_6'),(8,'pos52','url_resolucao_6'),(8,'pos53','url_resolucao_6'),(8,'pos54','url_resolucao_6'),(8,'pos55','url_resolucao_6'),(8,'pos56','url_resolucao_6'),(8,'pos57','url_resolucao_6'),(8,'pos58','url_resolucao_6'),(8,'pos59','url_resolucao_6'),(8,'pos6','url_resolucao_6'),(8,'pos60','url_resolucao_6'),(8,'pos61','url_resolucao_6'),(8,'pos62','url_resolucao_6'),(8,'pos63','url_resolucao_6'),(8,'pos64','url_resolucao_6'),(8,'pos65','url_resolucao_6'),(8,'pos66','url_resolucao_6'),(8,'pos67','url_resolucao_6'),(8,'pos68','url_resolucao_6'),(8,'pos69','url_resolucao_6'),(8,'pos7','url_resolucao_6'),(8,'pos70','url_resolucao_6'),(8,'pos71','url_resolucao_6'),(8,'pos72','url_resolucao_6'),(8,'pos73','url_resolucao_6'),(8,'pos74','url_resolucao_6'),(8,'pos75','url_resolucao_6'),(8,'pos76','url_resolucao_6'),(8,'pos77','url_resolucao_6'),(8,'pos78','url_resolucao_6'),(8,'pos79','url_resolucao_6'),(8,'pos8','url_resolucao_6'),(8,'pos80','url_resolucao_6'),(8,'pos81','url_resolucao_6'),(8,'pos82','url_resolucao_6'),(8,'pos83','url_resolucao_6'),(8,'pos84','url_resolucao_6'),(8,'pos85','url_resolucao_6'),(8,'pos86','url_resolucao_6'),(8,'pos87','url_resolucao_6'),(8,'pos88','url_resolucao_6'),(8,'pos89','url_resolucao_6'),(8,'pos9','url_resolucao_6'),(8,'pos90','url_resolucao_6'),(8,'pos91','url_resolucao_6'),(8,'pos92','url_resolucao_6'),(8,'pos93','url_resolucao_6'),(8,'pos94','url_resolucao_6'),(8,'pos95','url_resolucao_6'),(8,'pos96','url_resolucao_6'),(8,'pos97','url_resolucao_6'),(8,'pos98','url_resolucao_6'),(8,'pos99','url_resolucao_6'),(9,'pos0','url_resolucao_6'),(9,'pos1','url_resolucao_1'),(9,'pos100','url_resolucao_6'),(9,'pos11','url_resolucao_6'),(9,'pos12','url_resolucao_6'),(9,'pos13','url_resolucao_6'),(9,'pos14','url_resolucao_6'),(9,'pos15','url_resolucao_6'),(9,'pos16','url_resolucao_6'),(9,'pos17','url_resolucao_6'),(9,'pos18','url_resolucao_6'),(9,'pos19','url_resolucao_6'),(9,'pos2','url_resolucao_1'),(9,'pos20','url_resolucao_6'),(9,'pos21','url_resolucao_6'),(9,'pos22','url_resolucao_6'),(9,'pos23','url_resolucao_6'),(9,'pos24','url_resolucao_6'),(9,'pos25','url_resolucao_6'),(9,'pos26','url_resolucao_6'),(9,'pos27','url_resolucao_6'),(9,'pos28','url_resolucao_6'),(9,'pos29','url_resolucao_6'),(9,'pos3','url_resolucao_6'),(9,'pos30','url_resolucao_6'),(9,'pos31','url_resolucao_6'),(9,'pos32','url_resolucao_6'),(9,'pos33','url_resolucao_6'),(9,'pos34','url_resolucao_6'),(9,'pos35','url_resolucao_6'),(9,'pos36','url_resolucao_6'),(9,'pos37','url_resolucao_6'),(9,'pos38','url_resolucao_6'),(9,'pos39','url_resolucao_6'),(9,'pos4','url_resolucao_6'),(9,'pos40','url_resolucao_6'),(9,'pos41','url_resolucao_6'),(9,'pos42','url_resolucao_6'),(9,'pos43','url_resolucao_6'),(9,'pos44','url_resolucao_6'),(9,'pos45','url_resolucao_6'),(9,'pos46','url_resolucao_6'),(9,'pos47','url_resolucao_6'),(9,'pos48','url_resolucao_6'),(9,'pos49','url_resolucao_6'),(9,'pos5','url_resolucao_6'),(9,'pos50','url_resolucao_6'),(9,'pos51','url_resolucao_6'),(9,'pos52','url_resolucao_6'),(9,'pos53','url_resolucao_6'),(9,'pos54','url_resolucao_6'),(9,'pos55','url_resolucao_6'),(9,'pos56','url_resolucao_6'),(9,'pos57','url_resolucao_6'),(9,'pos58','url_resolucao_6'),(9,'pos59','url_resolucao_6'),(9,'pos6','url_resolucao_6'),(9,'pos60','url_resolucao_6'),(9,'pos61','url_resolucao_6'),(9,'pos62','url_resolucao_6'),(9,'pos63','url_resolucao_6'),(9,'pos64','url_resolucao_6'),(9,'pos65','url_resolucao_6'),(9,'pos66','url_resolucao_6'),(9,'pos67','url_resolucao_6'),(9,'pos68','url_resolucao_6'),(9,'pos69','url_resolucao_6'),(9,'pos7','url_resolucao_6'),(9,'pos70','url_resolucao_6'),(9,'pos71','url_resolucao_6'),(9,'pos72','url_resolucao_6'),(9,'pos73','url_resolucao_6'),(9,'pos74','url_resolucao_6'),(9,'pos75','url_resolucao_6'),(9,'pos76','url_resolucao_6'),(9,'pos77','url_resolucao_6'),(9,'pos78','url_resolucao_6'),(9,'pos79','url_resolucao_6'),(9,'pos8','url_resolucao_6'),(9,'pos80','url_resolucao_6'),(9,'pos81','url_resolucao_6'),(9,'pos82','url_resolucao_6'),(9,'pos83','url_resolucao_6'),(9,'pos84','url_resolucao_6'),(9,'pos85','url_resolucao_6'),(9,'pos86','url_resolucao_6'),(9,'pos87','url_resolucao_6'),(9,'pos88','url_resolucao_6'),(9,'pos89','url_resolucao_6'),(9,'pos9','url_resolucao_6'),(10,'pos0','url_resolucao_3'),(10,'pos1','url_resolucao_6'),(10,'pos100','url_resolucao_6'),(10,'pos11','url_resolucao_6'),(10,'pos12','url_resolucao_6'),(10,'pos13','url_resolucao_6'),(10,'pos14','url_resolucao_6'),(10,'pos15','url_resolucao_6'),(10,'pos16','url_resolucao_6'),(10,'pos17','url_resolucao_6'),(10,'pos18','url_resolucao_6'),(10,'pos19','url_resolucao_6'),(10,'pos2','url_resolucao_6'),(10,'pos20','url_resolucao_6'),(10,'pos21','url_resolucao_6'),(10,'pos22','url_resolucao_6'),(10,'pos23','url_resolucao_6'),(10,'pos24','url_resolucao_6'),(10,'pos25','url_resolucao_6'),(10,'pos26','url_resolucao_6'),(10,'pos27','url_resolucao_6'),(10,'pos28','url_resolucao_6'),(10,'pos29','url_resolucao_6'),(10,'pos3','url_resolucao_6'),(10,'pos30','url_resolucao_6'),(10,'pos31','url_resolucao_6'),(10,'pos32','url_resolucao_6'),(10,'pos33','url_resolucao_6'),(10,'pos34','url_resolucao_6'),(10,'pos35','url_resolucao_6'),(10,'pos36','url_resolucao_6'),(10,'pos37','url_resolucao_6'),(10,'pos38','url_resolucao_6'),(10,'pos39','url_resolucao_6'),(10,'pos4','url_resolucao_6'),(10,'pos40','url_resolucao_6'),(10,'pos41','url_resolucao_6'),(10,'pos42','url_resolucao_6'),(10,'pos43','url_resolucao_6'),(10,'pos44','url_resolucao_6'),(10,'pos45','url_resolucao_6'),(10,'pos46','url_resolucao_6'),(10,'pos47','url_resolucao_6'),(10,'pos48','url_resolucao_6'),(10,'pos49','url_resolucao_6'),(10,'pos5','url_resolucao_6'),(10,'pos50','url_resolucao_6'),(10,'pos51','url_resolucao_6'),(10,'pos52','url_resolucao_6'),(10,'pos53','url_resolucao_6'),(10,'pos54','url_resolucao_6'),(10,'pos55','url_resolucao_6'),(10,'pos56','url_resolucao_6'),(10,'pos57','url_resolucao_6'),(10,'pos58','url_resolucao_6'),(10,'pos59','url_resolucao_6'),(10,'pos6','url_resolucao_6'),(10,'pos60','url_resolucao_6'),(10,'pos61','url_resolucao_6'),(10,'pos62','url_resolucao_6'),(10,'pos63','url_resolucao_6'),(10,'pos64','url_resolucao_6'),(10,'pos65','url_resolucao_6'),(10,'pos66','url_resolucao_6'),(10,'pos67','url_resolucao_6'),(10,'pos68','url_resolucao_6'),(10,'pos69','url_resolucao_6'),(10,'pos7','url_resolucao_6'),(10,'pos70','url_resolucao_6'),(10,'pos71','url_resolucao_6'),(10,'pos72','url_resolucao_6'),(10,'pos73','url_resolucao_6'),(10,'pos74','url_resolucao_6'),(10,'pos75','url_resolucao_6'),(10,'pos76','url_resolucao_6'),(10,'pos77','url_resolucao_6'),(10,'pos78','url_resolucao_6'),(10,'pos79','url_resolucao_6'),(10,'pos8','url_resolucao_6'),(10,'pos80','url_resolucao_6'),(10,'pos81','url_resolucao_6'),(10,'pos82','url_resolucao_6'),(10,'pos83','url_resolucao_6'),(10,'pos84','url_resolucao_6'),(10,'pos85','url_resolucao_6'),(10,'pos86','url_resolucao_6'),(10,'pos87','url_resolucao_6'),(10,'pos88','url_resolucao_6'),(10,'pos89','url_resolucao_6'),(10,'pos9','url_resolucao_6'),(10,'pos90','url_resolucao_6'),(10,'pos91','url_resolucao_6'),(10,'pos92','url_resolucao_6'),(10,'pos93','url_resolucao_6'),(10,'pos94','url_resolucao_6'),(10,'pos95','url_resolucao_6'),(10,'pos96','url_resolucao_6'),(10,'pos97','url_resolucao_6'),(10,'pos98','url_resolucao_6'),(10,'pos99','url_resolucao_6'),(11,'pos0','url_resolucao_3'),(11,'pos1','url_resolucao_6'),(11,'pos100','url_resolucao_6'),(11,'pos11','url_resolucao_6'),(11,'pos12','url_resolucao_6'),(11,'pos13','url_resolucao_6'),(11,'pos14','url_resolucao_6'),(11,'pos15','url_resolucao_6'),(11,'pos16','url_resolucao_6'),(11,'pos17','url_resolucao_6'),(11,'pos18','url_resolucao_6'),(11,'pos19','url_resolucao_6'),(11,'pos2','url_resolucao_6'),(11,'pos20','url_resolucao_6'),(11,'pos21','url_resolucao_6'),(11,'pos22','url_resolucao_6'),(11,'pos23','url_resolucao_6'),(11,'pos24','url_resolucao_6'),(11,'pos25','url_resolucao_6'),(11,'pos26','url_resolucao_6'),(11,'pos27','url_resolucao_6'),(11,'pos28','url_resolucao_6'),(11,'pos29','url_resolucao_6'),(11,'pos3','url_resolucao_6'),(11,'pos30','url_resolucao_6'),(11,'pos31','url_resolucao_6'),(11,'pos32','url_resolucao_6'),(11,'pos33','url_resolucao_6'),(11,'pos34','url_resolucao_6'),(11,'pos35','url_resolucao_6'),(11,'pos36','url_resolucao_6'),(11,'pos37','url_resolucao_6'),(11,'pos38','url_resolucao_6'),(11,'pos39','url_resolucao_6'),(11,'pos4','url_resolucao_6'),(11,'pos40','url_resolucao_6'),(11,'pos41','url_resolucao_6'),(11,'pos42','url_resolucao_6'),(11,'pos43','url_resolucao_6'),(11,'pos44','url_resolucao_6'),(11,'pos45','url_resolucao_6'),(11,'pos46','url_resolucao_6'),(11,'pos47','url_resolucao_6'),(11,'pos48','url_resolucao_6'),(11,'pos49','url_resolucao_6'),(11,'pos5','url_resolucao_6'),(11,'pos50','url_resolucao_6'),(11,'pos51','url_resolucao_6'),(11,'pos52','url_resolucao_6'),(11,'pos53','url_resolucao_6'),(11,'pos54','url_resolucao_6'),(11,'pos55','url_resolucao_6'),(11,'pos56','url_resolucao_6'),(11,'pos57','url_resolucao_6'),(11,'pos58','url_resolucao_6'),(11,'pos59','url_resolucao_6'),(11,'pos6','url_resolucao_6'),(11,'pos60','url_resolucao_6'),(11,'pos61','url_resolucao_6'),(11,'pos62','url_resolucao_6'),(11,'pos63','url_resolucao_6'),(11,'pos64','url_resolucao_6'),(11,'pos65','url_resolucao_6'),(11,'pos66','url_resolucao_6'),(11,'pos67','url_resolucao_6'),(11,'pos68','url_resolucao_6'),(11,'pos69','url_resolucao_6'),(11,'pos7','url_resolucao_6'),(11,'pos70','url_resolucao_6'),(11,'pos71','url_resolucao_6'),(11,'pos72','url_resolucao_6'),(11,'pos73','url_resolucao_6'),(11,'pos74','url_resolucao_6'),(11,'pos75','url_resolucao_6'),(11,'pos76','url_resolucao_6'),(11,'pos77','url_resolucao_6'),(11,'pos78','url_resolucao_6'),(11,'pos79','url_resolucao_6'),(11,'pos8','url_resolucao_6'),(11,'pos80','url_resolucao_6'),(11,'pos81','url_resolucao_6'),(11,'pos82','url_resolucao_6'),(11,'pos83','url_resolucao_6'),(11,'pos84','url_resolucao_6'),(11,'pos85','url_resolucao_6'),(11,'pos86','url_resolucao_6'),(11,'pos87','url_resolucao_6'),(11,'pos88','url_resolucao_6'),(11,'pos89','url_resolucao_6'),(11,'pos9','url_resolucao_6'),(11,'pos90','url_resolucao_6'),(11,'pos91','url_resolucao_6'),(11,'pos92','url_resolucao_6'),(11,'pos93','url_resolucao_6'),(11,'pos94','url_resolucao_6'),(11,'pos95','url_resolucao_6'),(11,'pos96','url_resolucao_6'),(11,'pos97','url_resolucao_6'),(11,'pos98','url_resolucao_6'),(11,'pos99','url_resolucao_6'),(12,'pos0','url_resolucao_3'),(12,'pos1','url_resolucao_6'),(12,'pos100','url_resolucao_6'),(12,'pos11','url_resolucao_6'),(12,'pos12','url_resolucao_6'),(12,'pos13','url_resolucao_6'),(12,'pos14','url_resolucao_6'),(12,'pos15','url_resolucao_6'),(12,'pos16','url_resolucao_6'),(12,'pos17','url_resolucao_6'),(12,'pos18','url_resolucao_6'),(12,'pos19','url_resolucao_6'),(12,'pos2','url_resolucao_6'),(12,'pos20','url_resolucao_6'),(12,'pos21','url_resolucao_6'),(12,'pos22','url_resolucao_6'),(12,'pos23','url_resolucao_6'),(12,'pos24','url_resolucao_6'),(12,'pos25','url_resolucao_6'),(12,'pos26','url_resolucao_6'),(12,'pos27','url_resolucao_6'),(12,'pos28','url_resolucao_6'),(12,'pos29','url_resolucao_6'),(12,'pos3','url_resolucao_6'),(12,'pos30','url_resolucao_6'),(12,'pos31','url_resolucao_6'),(12,'pos32','url_resolucao_6'),(12,'pos33','url_resolucao_6'),(12,'pos34','url_resolucao_6'),(12,'pos35','url_resolucao_6'),(12,'pos36','url_resolucao_6'),(12,'pos37','url_resolucao_6'),(12,'pos38','url_resolucao_6'),(12,'pos39','url_resolucao_6'),(12,'pos4','url_resolucao_6'),(12,'pos40','url_resolucao_6'),(12,'pos41','url_resolucao_6'),(12,'pos42','url_resolucao_6'),(12,'pos43','url_resolucao_6'),(12,'pos44','url_resolucao_6'),(12,'pos45','url_resolucao_6'),(12,'pos46','url_resolucao_6'),(12,'pos47','url_resolucao_6'),(12,'pos48','url_resolucao_6'),(12,'pos49','url_resolucao_6'),(12,'pos5','url_resolucao_6'),(12,'pos50','url_resolucao_6'),(12,'pos51','url_resolucao_6'),(12,'pos52','url_resolucao_6'),(12,'pos53','url_resolucao_6'),(12,'pos54','url_resolucao_6'),(12,'pos55','url_resolucao_6'),(12,'pos56','url_resolucao_6'),(12,'pos57','url_resolucao_6'),(12,'pos58','url_resolucao_6'),(12,'pos59','url_resolucao_6'),(12,'pos6','url_resolucao_6'),(12,'pos60','url_resolucao_6'),(12,'pos61','url_resolucao_6'),(12,'pos62','url_resolucao_6'),(12,'pos63','url_resolucao_6'),(12,'pos64','url_resolucao_6'),(12,'pos65','url_resolucao_6'),(12,'pos66','url_resolucao_6'),(12,'pos67','url_resolucao_6'),(12,'pos68','url_resolucao_6'),(12,'pos69','url_resolucao_6'),(12,'pos7','url_resolucao_6'),(12,'pos70','url_resolucao_6'),(12,'pos71','url_resolucao_6'),(12,'pos72','url_resolucao_6'),(12,'pos73','url_resolucao_6'),(12,'pos74','url_resolucao_6'),(12,'pos75','url_resolucao_6'),(12,'pos76','url_resolucao_6'),(12,'pos77','url_resolucao_6'),(12,'pos78','url_resolucao_6'),(12,'pos79','url_resolucao_6'),(12,'pos8','url_resolucao_6'),(12,'pos80','url_resolucao_6'),(12,'pos81','url_resolucao_6'),(12,'pos82','url_resolucao_6'),(12,'pos83','url_resolucao_6'),(12,'pos84','url_resolucao_6'),(12,'pos85','url_resolucao_6'),(12,'pos86','url_resolucao_6'),(12,'pos87','url_resolucao_6'),(12,'pos88','url_resolucao_6'),(12,'pos89','url_resolucao_6'),(12,'pos9','url_resolucao_6'),(12,'pos90','url_resolucao_6'),(12,'pos91','url_resolucao_6'),(12,'pos92','url_resolucao_6'),(12,'pos93','url_resolucao_6'),(12,'pos94','url_resolucao_6'),(12,'pos95','url_resolucao_6'),(12,'pos96','url_resolucao_6'),(12,'pos97','url_resolucao_6'),(12,'pos98','url_resolucao_6'),(12,'pos99','url_resolucao_6'),(13,'pos0','url_resolucao_3'),(13,'pos1','url_resolucao_6'),(13,'pos100','url_resolucao_6'),(13,'pos11','url_resolucao_6'),(13,'pos12','url_resolucao_6'),(13,'pos13','url_resolucao_6'),(13,'pos14','url_resolucao_6'),(13,'pos15','url_resolucao_6'),(13,'pos16','url_resolucao_6'),(13,'pos17','url_resolucao_6'),(13,'pos18','url_resolucao_6'),(13,'pos19','url_resolucao_6'),(13,'pos2','url_resolucao_6'),(13,'pos20','url_resolucao_6'),(13,'pos21','url_resolucao_6'),(13,'pos22','url_resolucao_6'),(13,'pos23','url_resolucao_6'),(13,'pos24','url_resolucao_6'),(13,'pos25','url_resolucao_6'),(13,'pos26','url_resolucao_6'),(13,'pos27','url_resolucao_6'),(13,'pos28','url_resolucao_6'),(13,'pos29','url_resolucao_6'),(13,'pos3','url_resolucao_6'),(13,'pos30','url_resolucao_6'),(13,'pos31','url_resolucao_6'),(13,'pos32','url_resolucao_6'),(13,'pos33','url_resolucao_6'),(13,'pos34','url_resolucao_6'),(13,'pos35','url_resolucao_6'),(13,'pos36','url_resolucao_6'),(13,'pos37','url_resolucao_6'),(13,'pos38','url_resolucao_6'),(13,'pos39','url_resolucao_6'),(13,'pos4','url_resolucao_6'),(13,'pos40','url_resolucao_6'),(13,'pos41','url_resolucao_6'),(13,'pos42','url_resolucao_6'),(13,'pos43','url_resolucao_6'),(13,'pos44','url_resolucao_6'),(13,'pos45','url_resolucao_6'),(13,'pos46','url_resolucao_6'),(13,'pos47','url_resolucao_6'),(13,'pos48','url_resolucao_6'),(13,'pos49','url_resolucao_6'),(13,'pos5','url_resolucao_6'),(13,'pos50','url_resolucao_6'),(13,'pos51','url_resolucao_6'),(13,'pos52','url_resolucao_6'),(13,'pos53','url_resolucao_6'),(13,'pos54','url_resolucao_6'),(13,'pos55','url_resolucao_6'),(13,'pos56','url_resolucao_6'),(13,'pos57','url_resolucao_6'),(13,'pos58','url_resolucao_6'),(13,'pos59','url_resolucao_6'),(13,'pos6','url_resolucao_6'),(13,'pos60','url_resolucao_6'),(13,'pos61','url_resolucao_6'),(13,'pos62','url_resolucao_6'),(13,'pos63','url_resolucao_6'),(13,'pos64','url_resolucao_6'),(13,'pos65','url_resolucao_6'),(13,'pos66','url_resolucao_6'),(13,'pos67','url_resolucao_6'),(13,'pos68','url_resolucao_6'),(13,'pos69','url_resolucao_6'),(13,'pos7','url_resolucao_6'),(13,'pos70','url_resolucao_6'),(13,'pos71','url_resolucao_6'),(13,'pos72','url_resolucao_6'),(13,'pos73','url_resolucao_6'),(13,'pos74','url_resolucao_6'),(13,'pos75','url_resolucao_6'),(13,'pos76','url_resolucao_6'),(13,'pos77','url_resolucao_6'),(13,'pos78','url_resolucao_6'),(13,'pos79','url_resolucao_6'),(13,'pos8','url_resolucao_6'),(13,'pos80','url_resolucao_6'),(13,'pos81','url_resolucao_6'),(13,'pos82','url_resolucao_6'),(13,'pos83','url_resolucao_6'),(13,'pos84','url_resolucao_6'),(13,'pos85','url_resolucao_6'),(13,'pos86','url_resolucao_6'),(13,'pos87','url_resolucao_6'),(13,'pos88','url_resolucao_6'),(13,'pos89','url_resolucao_6'),(13,'pos9','url_resolucao_6'),(13,'pos90','url_resolucao_6'),(13,'pos91','url_resolucao_6'),(13,'pos92','url_resolucao_6'),(13,'pos93','url_resolucao_6'),(13,'pos94','url_resolucao_6'),(13,'pos95','url_resolucao_6'),(13,'pos96','url_resolucao_6'),(13,'pos97','url_resolucao_6'),(13,'pos98','url_resolucao_6'),(13,'pos99','url_resolucao_6'),(14,'pos0','url_resolucao_3'),(14,'pos1','url_resolucao_6'),(14,'pos100','url_resolucao_6'),(14,'pos11','url_resolucao_6'),(14,'pos12','url_resolucao_6'),(14,'pos13','url_resolucao_6'),(14,'pos14','url_resolucao_6'),(14,'pos15','url_resolucao_6'),(14,'pos16','url_resolucao_6'),(14,'pos17','url_resolucao_6'),(14,'pos18','url_resolucao_6'),(14,'pos19','url_resolucao_6'),(14,'pos2','url_resolucao_6'),(14,'pos20','url_resolucao_6'),(14,'pos21','url_resolucao_6'),(14,'pos22','url_resolucao_6'),(14,'pos23','url_resolucao_6'),(14,'pos24','url_resolucao_6'),(14,'pos25','url_resolucao_6'),(14,'pos26','url_resolucao_6'),(14,'pos27','url_resolucao_6'),(14,'pos28','url_resolucao_6'),(14,'pos29','url_resolucao_6'),(14,'pos3','url_resolucao_6'),(14,'pos30','url_resolucao_6'),(14,'pos31','url_resolucao_6'),(14,'pos32','url_resolucao_6'),(14,'pos33','url_resolucao_6'),(14,'pos34','url_resolucao_6'),(14,'pos35','url_resolucao_6'),(14,'pos36','url_resolucao_6'),(14,'pos37','url_resolucao_6'),(14,'pos38','url_resolucao_6'),(14,'pos39','url_resolucao_6'),(14,'pos4','url_resolucao_6'),(14,'pos40','url_resolucao_6'),(14,'pos41','url_resolucao_6'),(14,'pos42','url_resolucao_6'),(14,'pos43','url_resolucao_6'),(14,'pos44','url_resolucao_6'),(14,'pos45','url_resolucao_6'),(14,'pos46','url_resolucao_6'),(14,'pos47','url_resolucao_6'),(14,'pos48','url_resolucao_6'),(14,'pos49','url_resolucao_6'),(14,'pos5','url_resolucao_6'),(14,'pos50','url_resolucao_6'),(14,'pos51','url_resolucao_6'),(14,'pos52','url_resolucao_6'),(14,'pos53','url_resolucao_6'),(14,'pos54','url_resolucao_6'),(14,'pos55','url_resolucao_6'),(14,'pos56','url_resolucao_6'),(14,'pos57','url_resolucao_6'),(14,'pos58','url_resolucao_6'),(14,'pos59','url_resolucao_6'),(14,'pos6','url_resolucao_6'),(14,'pos60','url_resolucao_6'),(14,'pos61','url_resolucao_6'),(14,'pos62','url_resolucao_6'),(14,'pos63','url_resolucao_6'),(14,'pos64','url_resolucao_6'),(14,'pos65','url_resolucao_6'),(14,'pos66','url_resolucao_6'),(14,'pos67','url_resolucao_6'),(14,'pos68','url_resolucao_6'),(14,'pos69','url_resolucao_6'),(14,'pos7','url_resolucao_6'),(14,'pos70','url_resolucao_6'),(14,'pos71','url_resolucao_6'),(14,'pos72','url_resolucao_6'),(14,'pos73','url_resolucao_6'),(14,'pos74','url_resolucao_6'),(14,'pos75','url_resolucao_6'),(14,'pos76','url_resolucao_6'),(14,'pos77','url_resolucao_6'),(14,'pos78','url_resolucao_6'),(14,'pos79','url_resolucao_6'),(14,'pos8','url_resolucao_6'),(14,'pos80','url_resolucao_6'),(14,'pos81','url_resolucao_6'),(14,'pos82','url_resolucao_6'),(14,'pos83','url_resolucao_6'),(14,'pos84','url_resolucao_6'),(14,'pos85','url_resolucao_6'),(14,'pos86','url_resolucao_6'),(14,'pos87','url_resolucao_6'),(14,'pos88','url_resolucao_6'),(14,'pos89','url_resolucao_6'),(14,'pos9','url_resolucao_6'),(14,'pos90','url_resolucao_6'),(14,'pos91','url_resolucao_6'),(14,'pos92','url_resolucao_6'),(14,'pos93','url_resolucao_6'),(14,'pos94','url_resolucao_6'),(14,'pos95','url_resolucao_6'),(14,'pos96','url_resolucao_6'),(14,'pos97','url_resolucao_6'),(14,'pos98','url_resolucao_6'),(14,'pos99','url_resolucao_6'),(15,'pos0','url_resolucao_3'),(15,'pos1','url_resolucao_6'),(15,'pos100','url_resolucao_6'),(15,'pos11','url_resolucao_6'),(15,'pos12','url_resolucao_6'),(15,'pos13','url_resolucao_6'),(15,'pos14','url_resolucao_6'),(15,'pos15','url_resolucao_6'),(15,'pos16','url_resolucao_6'),(15,'pos17','url_resolucao_6'),(15,'pos18','url_resolucao_6'),(15,'pos19','url_resolucao_6'),(15,'pos2','url_resolucao_6'),(15,'pos20','url_resolucao_6'),(15,'pos21','url_resolucao_6'),(15,'pos22','url_resolucao_6'),(15,'pos23','url_resolucao_6'),(15,'pos24','url_resolucao_6'),(15,'pos25','url_resolucao_6'),(15,'pos26','url_resolucao_6'),(15,'pos27','url_resolucao_6'),(15,'pos28','url_resolucao_6'),(15,'pos29','url_resolucao_6'),(15,'pos3','url_resolucao_6'),(15,'pos30','url_resolucao_6'),(15,'pos31','url_resolucao_6'),(15,'pos32','url_resolucao_6'),(15,'pos33','url_resolucao_6'),(15,'pos34','url_resolucao_6'),(15,'pos35','url_resolucao_6'),(15,'pos36','url_resolucao_6'),(15,'pos37','url_resolucao_6'),(15,'pos38','url_resolucao_6'),(15,'pos39','url_resolucao_6'),(15,'pos4','url_resolucao_6'),(15,'pos40','url_resolucao_6'),(15,'pos41','url_resolucao_6'),(15,'pos42','url_resolucao_6'),(15,'pos43','url_resolucao_6'),(15,'pos44','url_resolucao_6'),(15,'pos45','url_resolucao_6'),(15,'pos46','url_resolucao_6'),(15,'pos47','url_resolucao_6'),(15,'pos48','url_resolucao_6'),(15,'pos49','url_resolucao_6'),(15,'pos5','url_resolucao_6'),(15,'pos50','url_resolucao_6'),(15,'pos51','url_resolucao_6'),(15,'pos52','url_resolucao_6'),(15,'pos53','url_resolucao_6'),(15,'pos54','url_resolucao_6'),(15,'pos55','url_resolucao_6'),(15,'pos56','url_resolucao_6'),(15,'pos57','url_resolucao_6'),(15,'pos58','url_resolucao_6'),(15,'pos59','url_resolucao_6'),(15,'pos6','url_resolucao_6'),(15,'pos60','url_resolucao_6'),(15,'pos61','url_resolucao_6'),(15,'pos62','url_resolucao_6'),(15,'pos63','url_resolucao_6'),(15,'pos64','url_resolucao_6'),(15,'pos65','url_resolucao_6'),(15,'pos66','url_resolucao_6'),(15,'pos67','url_resolucao_6'),(15,'pos68','url_resolucao_6'),(15,'pos69','url_resolucao_6'),(15,'pos7','url_resolucao_6'),(15,'pos70','url_resolucao_6'),(15,'pos71','url_resolucao_6'),(15,'pos72','url_resolucao_6'),(15,'pos73','url_resolucao_6'),(15,'pos74','url_resolucao_6'),(15,'pos75','url_resolucao_6'),(15,'pos76','url_resolucao_6'),(15,'pos77','url_resolucao_6'),(15,'pos78','url_resolucao_6'),(15,'pos79','url_resolucao_6'),(15,'pos8','url_resolucao_6'),(15,'pos80','url_resolucao_6'),(15,'pos81','url_resolucao_6'),(15,'pos82','url_resolucao_6'),(15,'pos83','url_resolucao_6'),(15,'pos84','url_resolucao_6'),(15,'pos85','url_resolucao_6'),(15,'pos86','url_resolucao_6'),(15,'pos87','url_resolucao_6'),(15,'pos88','url_resolucao_6'),(15,'pos89','url_resolucao_6'),(15,'pos9','url_resolucao_6'),(15,'pos90','url_resolucao_6'),(15,'pos91','url_resolucao_6'),(15,'pos92','url_resolucao_6'),(15,'pos93','url_resolucao_6'),(15,'pos94','url_resolucao_6'),(15,'pos95','url_resolucao_6'),(15,'pos96','url_resolucao_6'),(15,'pos97','url_resolucao_6'),(15,'pos98','url_resolucao_6'),(15,'pos99','url_resolucao_6'),(16,'pos0','url_resolucao_3'),(16,'pos1','url_resolucao_6'),(16,'pos100','url_resolucao_6'),(16,'pos11','url_resolucao_6'),(16,'pos12','url_resolucao_6'),(16,'pos13','url_resolucao_6'),(16,'pos14','url_resolucao_6'),(16,'pos15','url_resolucao_6'),(16,'pos16','url_resolucao_6'),(16,'pos17','url_resolucao_6'),(16,'pos18','url_resolucao_6'),(16,'pos19','url_resolucao_6'),(16,'pos2','url_resolucao_6'),(16,'pos20','url_resolucao_6'),(16,'pos21','url_resolucao_6'),(16,'pos22','url_resolucao_6'),(16,'pos23','url_resolucao_6'),(16,'pos24','url_resolucao_6'),(16,'pos25','url_resolucao_6'),(16,'pos26','url_resolucao_6'),(16,'pos27','url_resolucao_6'),(16,'pos28','url_resolucao_6'),(16,'pos29','url_resolucao_6'),(16,'pos3','url_resolucao_6'),(16,'pos30','url_resolucao_6'),(16,'pos31','url_resolucao_6'),(16,'pos32','url_resolucao_6'),(16,'pos33','url_resolucao_6'),(16,'pos34','url_resolucao_6'),(16,'pos35','url_resolucao_6'),(16,'pos36','url_resolucao_6'),(16,'pos37','url_resolucao_6'),(16,'pos38','url_resolucao_6'),(16,'pos39','url_resolucao_6'),(16,'pos4','url_resolucao_6'),(16,'pos40','url_resolucao_6'),(16,'pos41','url_resolucao_6'),(16,'pos42','url_resolucao_6'),(16,'pos43','url_resolucao_6'),(16,'pos44','url_resolucao_6'),(16,'pos45','url_resolucao_6'),(16,'pos46','url_resolucao_6'),(16,'pos47','url_resolucao_6'),(16,'pos48','url_resolucao_6'),(16,'pos49','url_resolucao_6'),(16,'pos5','url_resolucao_6'),(16,'pos50','url_resolucao_6'),(16,'pos51','url_resolucao_6'),(16,'pos52','url_resolucao_6'),(16,'pos53','url_resolucao_6'),(16,'pos54','url_resolucao_6'),(16,'pos55','url_resolucao_6'),(16,'pos56','url_resolucao_6'),(16,'pos57','url_resolucao_6'),(16,'pos58','url_resolucao_6'),(16,'pos59','url_resolucao_6'),(16,'pos6','url_resolucao_6'),(16,'pos60','url_resolucao_6'),(16,'pos61','url_resolucao_6'),(16,'pos62','url_resolucao_6'),(16,'pos63','url_resolucao_6'),(16,'pos64','url_resolucao_6'),(16,'pos65','url_resolucao_6'),(16,'pos66','url_resolucao_6'),(16,'pos67','url_resolucao_6'),(16,'pos68','url_resolucao_6'),(16,'pos69','url_resolucao_6'),(16,'pos7','url_resolucao_6'),(16,'pos70','url_resolucao_6'),(16,'pos71','url_resolucao_6'),(16,'pos72','url_resolucao_6'),(16,'pos73','url_resolucao_6'),(16,'pos74','url_resolucao_6'),(16,'pos75','url_resolucao_6'),(16,'pos76','url_resolucao_6'),(16,'pos77','url_resolucao_6'),(16,'pos78','url_resolucao_6'),(16,'pos79','url_resolucao_6'),(16,'pos8','url_resolucao_6'),(16,'pos80','url_resolucao_6'),(16,'pos81','url_resolucao_6'),(16,'pos82','url_resolucao_6'),(16,'pos83','url_resolucao_6'),(16,'pos84','url_resolucao_6'),(16,'pos85','url_resolucao_6'),(16,'pos86','url_resolucao_6'),(16,'pos87','url_resolucao_6'),(16,'pos88','url_resolucao_6'),(16,'pos89','url_resolucao_6'),(16,'pos9','url_resolucao_6'),(16,'pos90','url_resolucao_6'),(16,'pos91','url_resolucao_6'),(16,'pos92','url_resolucao_6'),(16,'pos93','url_resolucao_6'),(16,'pos94','url_resolucao_6'),(16,'pos95','url_resolucao_6'),(16,'pos96','url_resolucao_6'),(16,'pos97','url_resolucao_6'),(16,'pos98','url_resolucao_6'),(16,'pos99','url_resolucao_6'),(17,'pos0','url_resolucao_3'),(17,'pos1','url_resolucao_6'),(17,'pos100','url_resolucao_6'),(17,'pos11','url_resolucao_6'),(17,'pos12','url_resolucao_6'),(17,'pos13','url_resolucao_6'),(17,'pos14','url_resolucao_6'),(17,'pos15','url_resolucao_6'),(17,'pos16','url_resolucao_6'),(17,'pos17','url_resolucao_6'),(17,'pos18','url_resolucao_6'),(17,'pos19','url_resolucao_6'),(17,'pos2','url_resolucao_6'),(17,'pos20','url_resolucao_6'),(17,'pos21','url_resolucao_6'),(17,'pos22','url_resolucao_6'),(17,'pos23','url_resolucao_6'),(17,'pos24','url_resolucao_6'),(17,'pos25','url_resolucao_6'),(17,'pos26','url_resolucao_6'),(17,'pos27','url_resolucao_6'),(17,'pos28','url_resolucao_6'),(17,'pos29','url_resolucao_6'),(17,'pos3','url_resolucao_6'),(17,'pos30','url_resolucao_6'),(17,'pos31','url_resolucao_6'),(17,'pos32','url_resolucao_6'),(17,'pos33','url_resolucao_6'),(17,'pos34','url_resolucao_6'),(17,'pos35','url_resolucao_6'),(17,'pos36','url_resolucao_6'),(17,'pos37','url_resolucao_6'),(17,'pos38','url_resolucao_6'),(17,'pos39','url_resolucao_6'),(17,'pos4','url_resolucao_6'),(17,'pos40','url_resolucao_6'),(17,'pos41','url_resolucao_6'),(17,'pos42','url_resolucao_6'),(17,'pos43','url_resolucao_6'),(17,'pos44','url_resolucao_6'),(17,'pos45','url_resolucao_6'),(17,'pos46','url_resolucao_6'),(17,'pos47','url_resolucao_6'),(17,'pos48','url_resolucao_6'),(17,'pos49','url_resolucao_6'),(17,'pos5','url_resolucao_6'),(17,'pos50','url_resolucao_6'),(17,'pos51','url_resolucao_6'),(17,'pos52','url_resolucao_6'),(17,'pos53','url_resolucao_6'),(17,'pos54','url_resolucao_6'),(17,'pos55','url_resolucao_6'),(17,'pos56','url_resolucao_6'),(17,'pos57','url_resolucao_6'),(17,'pos58','url_resolucao_6'),(17,'pos59','url_resolucao_6'),(17,'pos6','url_resolucao_6'),(17,'pos60','url_resolucao_6'),(17,'pos61','url_resolucao_6'),(17,'pos62','url_resolucao_6'),(17,'pos63','url_resolucao_6'),(17,'pos64','url_resolucao_6'),(17,'pos65','url_resolucao_6'),(17,'pos66','url_resolucao_6'),(17,'pos67','url_resolucao_6'),(17,'pos68','url_resolucao_6'),(17,'pos69','url_resolucao_6'),(17,'pos7','url_resolucao_6'),(17,'pos70','url_resolucao_6'),(17,'pos71','url_resolucao_6'),(17,'pos72','url_resolucao_6'),(17,'pos73','url_resolucao_6'),(17,'pos74','url_resolucao_6'),(17,'pos75','url_resolucao_6'),(17,'pos76','url_resolucao_6'),(17,'pos77','url_resolucao_6'),(17,'pos78','url_resolucao_6'),(17,'pos79','url_resolucao_6'),(17,'pos8','url_resolucao_6'),(17,'pos80','url_resolucao_6'),(17,'pos81','url_resolucao_6'),(17,'pos82','url_resolucao_6'),(17,'pos83','url_resolucao_6'),(17,'pos84','url_resolucao_6'),(17,'pos85','url_resolucao_6'),(17,'pos86','url_resolucao_6'),(17,'pos87','url_resolucao_6'),(17,'pos88','url_resolucao_6'),(17,'pos89','url_resolucao_6'),(17,'pos9','url_resolucao_6'),(17,'pos90','url_resolucao_6'),(17,'pos91','url_resolucao_6'),(17,'pos92','url_resolucao_6'),(17,'pos93','url_resolucao_6'),(17,'pos94','url_resolucao_6'),(17,'pos95','url_resolucao_6'),(17,'pos96','url_resolucao_6'),(17,'pos97','url_resolucao_6'),(17,'pos98','url_resolucao_6'),(17,'pos99','url_resolucao_6'),(18,'pos0','url_resolucao_3'),(18,'pos1','url_resolucao_6'),(18,'pos100','url_resolucao_6'),(18,'pos11','url_resolucao_6'),(18,'pos12','url_resolucao_6'),(18,'pos13','url_resolucao_6'),(18,'pos14','url_resolucao_6'),(18,'pos15','url_resolucao_6'),(18,'pos16','url_resolucao_6'),(18,'pos17','url_resolucao_6'),(18,'pos18','url_resolucao_6'),(18,'pos19','url_resolucao_6'),(18,'pos2','url_resolucao_6'),(18,'pos20','url_resolucao_6'),(18,'pos21','url_resolucao_6'),(18,'pos22','url_resolucao_6'),(18,'pos23','url_resolucao_6'),(18,'pos24','url_resolucao_6'),(18,'pos25','url_resolucao_6'),(18,'pos26','url_resolucao_6'),(18,'pos27','url_resolucao_6'),(18,'pos28','url_resolucao_6'),(18,'pos29','url_resolucao_6'),(18,'pos3','url_resolucao_6'),(18,'pos30','url_resolucao_6'),(18,'pos31','url_resolucao_6'),(18,'pos32','url_resolucao_6'),(18,'pos33','url_resolucao_6'),(18,'pos34','url_resolucao_6'),(18,'pos35','url_resolucao_6'),(18,'pos36','url_resolucao_6'),(18,'pos37','url_resolucao_6'),(18,'pos38','url_resolucao_6'),(18,'pos39','url_resolucao_6'),(18,'pos4','url_resolucao_6'),(18,'pos40','url_resolucao_6'),(18,'pos41','url_resolucao_6'),(18,'pos42','url_resolucao_6'),(18,'pos43','url_resolucao_6'),(18,'pos44','url_resolucao_6'),(18,'pos45','url_resolucao_6'),(18,'pos46','url_resolucao_6'),(18,'pos47','url_resolucao_6'),(18,'pos48','url_resolucao_6'),(18,'pos49','url_resolucao_6'),(18,'pos5','url_resolucao_6'),(18,'pos50','url_resolucao_6'),(18,'pos51','url_resolucao_6'),(18,'pos52','url_resolucao_6'),(18,'pos53','url_resolucao_6'),(18,'pos54','url_resolucao_6'),(18,'pos55','url_resolucao_6'),(18,'pos56','url_resolucao_6'),(18,'pos57','url_resolucao_6'),(18,'pos58','url_resolucao_6'),(18,'pos59','url_resolucao_6'),(18,'pos6','url_resolucao_6'),(18,'pos60','url_resolucao_6'),(18,'pos61','url_resolucao_6'),(18,'pos62','url_resolucao_6'),(18,'pos63','url_resolucao_6'),(18,'pos64','url_resolucao_6'),(18,'pos65','url_resolucao_6'),(18,'pos66','url_resolucao_6'),(18,'pos67','url_resolucao_6'),(18,'pos68','url_resolucao_6'),(18,'pos69','url_resolucao_6'),(18,'pos7','url_resolucao_6'),(18,'pos70','url_resolucao_6'),(18,'pos71','url_resolucao_6'),(18,'pos72','url_resolucao_6'),(18,'pos73','url_resolucao_6'),(18,'pos74','url_resolucao_6'),(18,'pos75','url_resolucao_6'),(18,'pos76','url_resolucao_6'),(18,'pos77','url_resolucao_6'),(18,'pos78','url_resolucao_6'),(18,'pos79','url_resolucao_6'),(18,'pos8','url_resolucao_6'),(18,'pos80','url_resolucao_6'),(18,'pos81','url_resolucao_6'),(18,'pos82','url_resolucao_6'),(18,'pos83','url_resolucao_6'),(18,'pos84','url_resolucao_6'),(18,'pos85','url_resolucao_6'),(18,'pos86','url_resolucao_6'),(18,'pos87','url_resolucao_6'),(18,'pos88','url_resolucao_6'),(18,'pos89','url_resolucao_6'),(18,'pos9','url_resolucao_6'),(18,'pos90','url_resolucao_6'),(18,'pos91','url_resolucao_6'),(18,'pos92','url_resolucao_6'),(18,'pos93','url_resolucao_6'),(18,'pos94','url_resolucao_6'),(18,'pos95','url_resolucao_6'),(18,'pos96','url_resolucao_6'),(18,'pos97','url_resolucao_6'),(18,'pos98','url_resolucao_6'),(18,'pos99','url_resolucao_6'),(19,'pos0','url_resolucao_3'),(19,'pos1','url_resolucao_6'),(19,'pos100','url_resolucao_6'),(19,'pos11','url_resolucao_6'),(19,'pos12','url_resolucao_6'),(19,'pos13','url_resolucao_6'),(19,'pos14','url_resolucao_6'),(19,'pos15','url_resolucao_6'),(19,'pos16','url_resolucao_6'),(19,'pos17','url_resolucao_6'),(19,'pos18','url_resolucao_6'),(19,'pos19','url_resolucao_6'),(19,'pos2','url_resolucao_6'),(19,'pos20','url_resolucao_6'),(19,'pos21','url_resolucao_6'),(19,'pos22','url_resolucao_6'),(19,'pos23','url_resolucao_6'),(19,'pos24','url_resolucao_6'),(19,'pos25','url_resolucao_6'),(19,'pos26','url_resolucao_6'),(19,'pos27','url_resolucao_6'),(19,'pos28','url_resolucao_6'),(19,'pos29','url_resolucao_6'),(19,'pos3','url_resolucao_6'),(19,'pos30','url_resolucao_6'),(19,'pos31','url_resolucao_6'),(19,'pos32','url_resolucao_6'),(19,'pos33','url_resolucao_6'),(19,'pos34','url_resolucao_6'),(19,'pos35','url_resolucao_6'),(19,'pos36','url_resolucao_6'),(19,'pos37','url_resolucao_6'),(19,'pos38','url_resolucao_6'),(19,'pos39','url_resolucao_6'),(19,'pos4','url_resolucao_6'),(19,'pos40','url_resolucao_6'),(19,'pos41','url_resolucao_6'),(19,'pos42','url_resolucao_6'),(19,'pos43','url_resolucao_6'),(19,'pos44','url_resolucao_6'),(19,'pos45','url_resolucao_6'),(19,'pos46','url_resolucao_6'),(19,'pos47','url_resolucao_6'),(19,'pos48','url_resolucao_6'),(19,'pos49','url_resolucao_6'),(19,'pos5','url_resolucao_6'),(19,'pos50','url_resolucao_6'),(19,'pos51','url_resolucao_6'),(19,'pos52','url_resolucao_6'),(19,'pos53','url_resolucao_6'),(19,'pos54','url_resolucao_6'),(19,'pos55','url_resolucao_6'),(19,'pos56','url_resolucao_6'),(19,'pos57','url_resolucao_6'),(19,'pos58','url_resolucao_6'),(19,'pos59','url_resolucao_6'),(19,'pos6','url_resolucao_6'),(19,'pos60','url_resolucao_6'),(19,'pos61','url_resolucao_6'),(19,'pos62','url_resolucao_6'),(19,'pos63','url_resolucao_6'),(19,'pos64','url_resolucao_6'),(19,'pos65','url_resolucao_6'),(19,'pos66','url_resolucao_6'),(19,'pos67','url_resolucao_6'),(19,'pos68','url_resolucao_6'),(19,'pos69','url_resolucao_6'),(19,'pos7','url_resolucao_6'),(19,'pos70','url_resolucao_6'),(19,'pos71','url_resolucao_6'),(19,'pos72','url_resolucao_6'),(19,'pos73','url_resolucao_6'),(19,'pos74','url_resolucao_6'),(19,'pos75','url_resolucao_6'),(19,'pos76','url_resolucao_6'),(19,'pos77','url_resolucao_6'),(19,'pos78','url_resolucao_6'),(19,'pos79','url_resolucao_6'),(19,'pos8','url_resolucao_6'),(19,'pos80','url_resolucao_6'),(19,'pos81','url_resolucao_6'),(19,'pos82','url_resolucao_6'),(19,'pos83','url_resolucao_6'),(19,'pos84','url_resolucao_6'),(19,'pos85','url_resolucao_6'),(19,'pos86','url_resolucao_6'),(19,'pos87','url_resolucao_6'),(19,'pos88','url_resolucao_6'),(19,'pos89','url_resolucao_6'),(19,'pos9','url_resolucao_6'),(19,'pos90','url_resolucao_6'),(19,'pos91','url_resolucao_6'),(19,'pos92','url_resolucao_6'),(19,'pos93','url_resolucao_6'),(19,'pos94','url_resolucao_6'),(19,'pos95','url_resolucao_6'),(19,'pos96','url_resolucao_6'),(19,'pos97','url_resolucao_6'),(19,'pos98','url_resolucao_6'),(19,'pos99','url_resolucao_6'),(20,'pos0','url_resolucao_3'),(20,'pos1','url_resolucao_6'),(20,'pos100','url_resolucao_6'),(20,'pos11','url_resolucao_6'),(20,'pos12','url_resolucao_6'),(20,'pos13','url_resolucao_6'),(20,'pos14','url_resolucao_6'),(20,'pos15','url_resolucao_6'),(20,'pos16','url_resolucao_6'),(20,'pos17','url_resolucao_6'),(20,'pos18','url_resolucao_6'),(20,'pos19','url_resolucao_6'),(20,'pos2','url_resolucao_6'),(20,'pos20','url_resolucao_6'),(20,'pos21','url_resolucao_6'),(20,'pos22','url_resolucao_6'),(20,'pos23','url_resolucao_6'),(20,'pos24','url_resolucao_6'),(20,'pos25','url_resolucao_6'),(20,'pos26','url_resolucao_6'),(20,'pos27','url_resolucao_6'),(20,'pos28','url_resolucao_6'),(20,'pos29','url_resolucao_6'),(20,'pos3','url_resolucao_6'),(20,'pos30','url_resolucao_6'),(20,'pos31','url_resolucao_6'),(20,'pos32','url_resolucao_6'),(20,'pos33','url_resolucao_6'),(20,'pos34','url_resolucao_6'),(20,'pos35','url_resolucao_6'),(20,'pos36','url_resolucao_6'),(20,'pos37','url_resolucao_6'),(20,'pos38','url_resolucao_6'),(20,'pos39','url_resolucao_6'),(20,'pos4','url_resolucao_6'),(20,'pos40','url_resolucao_6'),(20,'pos41','url_resolucao_6'),(20,'pos42','url_resolucao_6'),(20,'pos43','url_resolucao_6'),(20,'pos44','url_resolucao_6'),(20,'pos45','url_resolucao_6'),(20,'pos46','url_resolucao_6'),(20,'pos47','url_resolucao_6'),(20,'pos48','url_resolucao_6'),(20,'pos49','url_resolucao_6'),(20,'pos5','url_resolucao_6'),(20,'pos50','url_resolucao_6'),(20,'pos51','url_resolucao_6'),(20,'pos52','url_resolucao_6'),(20,'pos53','url_resolucao_6'),(20,'pos54','url_resolucao_6'),(20,'pos55','url_resolucao_6'),(20,'pos56','url_resolucao_6'),(20,'pos57','url_resolucao_6'),(20,'pos58','url_resolucao_6'),(20,'pos59','url_resolucao_6'),(20,'pos6','url_resolucao_6'),(20,'pos60','url_resolucao_6'),(20,'pos61','url_resolucao_6'),(20,'pos62','url_resolucao_6'),(20,'pos63','url_resolucao_6'),(20,'pos64','url_resolucao_6'),(20,'pos65','url_resolucao_6'),(20,'pos66','url_resolucao_6'),(20,'pos67','url_resolucao_6'),(20,'pos68','url_resolucao_6'),(20,'pos69','url_resolucao_6'),(20,'pos7','url_resolucao_6'),(20,'pos70','url_resolucao_6'),(20,'pos71','url_resolucao_6'),(20,'pos72','url_resolucao_6'),(20,'pos73','url_resolucao_6'),(20,'pos74','url_resolucao_6'),(20,'pos75','url_resolucao_6'),(20,'pos76','url_resolucao_6'),(20,'pos77','url_resolucao_6'),(20,'pos78','url_resolucao_6'),(20,'pos79','url_resolucao_6'),(20,'pos8','url_resolucao_6'),(20,'pos80','url_resolucao_6'),(20,'pos81','url_resolucao_6'),(20,'pos82','url_resolucao_6'),(20,'pos83','url_resolucao_6'),(20,'pos84','url_resolucao_6'),(20,'pos85','url_resolucao_6'),(20,'pos86','url_resolucao_6'),(20,'pos87','url_resolucao_6'),(20,'pos88','url_resolucao_6'),(20,'pos89','url_resolucao_6'),(20,'pos9','url_resolucao_6'),(20,'pos90','url_resolucao_6'),(20,'pos91','url_resolucao_6'),(20,'pos92','url_resolucao_6'),(20,'pos93','url_resolucao_6'),(20,'pos94','url_resolucao_6'),(20,'pos95','url_resolucao_6'),(20,'pos96','url_resolucao_6'),(20,'pos97','url_resolucao_6'),(20,'pos98','url_resolucao_6'),(20,'pos99','url_resolucao_6'),(21,'pos0','url_resolucao_3'),(21,'pos1','url_resolucao_6'),(21,'pos100','url_resolucao_6'),(21,'pos11','url_resolucao_6'),(21,'pos12','url_resolucao_6'),(21,'pos13','url_resolucao_6'),(21,'pos14','url_resolucao_6'),(21,'pos15','url_resolucao_6'),(21,'pos16','url_resolucao_6'),(21,'pos17','url_resolucao_6'),(21,'pos18','url_resolucao_6'),(21,'pos19','url_resolucao_6'),(21,'pos2','url_resolucao_6'),(21,'pos20','url_resolucao_6'),(21,'pos21','url_resolucao_6'),(21,'pos22','url_resolucao_6'),(21,'pos23','url_resolucao_6'),(21,'pos24','url_resolucao_6'),(21,'pos25','url_resolucao_6'),(21,'pos26','url_resolucao_6'),(21,'pos27','url_resolucao_6'),(21,'pos28','url_resolucao_6'),(21,'pos29','url_resolucao_6'),(21,'pos3','url_resolucao_6'),(21,'pos30','url_resolucao_6'),(21,'pos31','url_resolucao_6'),(21,'pos32','url_resolucao_6'),(21,'pos33','url_resolucao_6'),(21,'pos34','url_resolucao_6'),(21,'pos35','url_resolucao_6'),(21,'pos36','url_resolucao_6'),(21,'pos37','url_resolucao_6'),(21,'pos38','url_resolucao_6'),(21,'pos39','url_resolucao_6'),(21,'pos4','url_resolucao_6'),(21,'pos40','url_resolucao_6'),(21,'pos41','url_resolucao_6'),(21,'pos42','url_resolucao_6'),(21,'pos43','url_resolucao_6'),(21,'pos44','url_resolucao_6'),(21,'pos45','url_resolucao_6'),(21,'pos46','url_resolucao_6'),(21,'pos47','url_resolucao_6'),(21,'pos48','url_resolucao_6'),(21,'pos49','url_resolucao_6'),(21,'pos5','url_resolucao_6'),(21,'pos50','url_resolucao_6'),(21,'pos51','url_resolucao_6'),(21,'pos52','url_resolucao_6'),(21,'pos53','url_resolucao_6'),(21,'pos54','url_resolucao_6'),(21,'pos55','url_resolucao_6'),(21,'pos56','url_resolucao_6'),(21,'pos57','url_resolucao_6'),(21,'pos58','url_resolucao_6'),(21,'pos59','url_resolucao_6'),(21,'pos6','url_resolucao_6'),(21,'pos60','url_resolucao_6'),(21,'pos61','url_resolucao_6'),(21,'pos62','url_resolucao_6'),(21,'pos63','url_resolucao_6'),(21,'pos64','url_resolucao_6'),(21,'pos65','url_resolucao_6'),(21,'pos66','url_resolucao_6'),(21,'pos67','url_resolucao_6'),(21,'pos68','url_resolucao_6'),(21,'pos69','url_resolucao_6'),(21,'pos7','url_resolucao_6'),(21,'pos70','url_resolucao_6'),(21,'pos71','url_resolucao_6'),(21,'pos72','url_resolucao_6'),(21,'pos73','url_resolucao_6'),(21,'pos74','url_resolucao_6'),(21,'pos75','url_resolucao_6'),(21,'pos76','url_resolucao_6'),(21,'pos77','url_resolucao_6'),(21,'pos78','url_resolucao_6'),(21,'pos79','url_resolucao_6'),(21,'pos8','url_resolucao_6'),(21,'pos80','url_resolucao_6'),(21,'pos81','url_resolucao_6'),(21,'pos82','url_resolucao_6'),(21,'pos83','url_resolucao_6'),(21,'pos84','url_resolucao_6'),(21,'pos85','url_resolucao_6'),(21,'pos86','url_resolucao_6'),(21,'pos87','url_resolucao_6'),(21,'pos88','url_resolucao_6'),(21,'pos89','url_resolucao_6'),(21,'pos9','url_resolucao_6'),(21,'pos90','url_resolucao_6'),(21,'pos91','url_resolucao_6'),(21,'pos92','url_resolucao_6'),(21,'pos93','url_resolucao_6'),(21,'pos94','url_resolucao_6'),(21,'pos95','url_resolucao_6'),(21,'pos96','url_resolucao_6'),(21,'pos97','url_resolucao_6'),(21,'pos98','url_resolucao_6'),(21,'pos99','url_resolucao_6'),(22,'pos0','url_resolucao_3'),(22,'pos1','url_resolucao_6'),(22,'pos100','url_resolucao_6'),(22,'pos11','url_resolucao_6'),(22,'pos12','url_resolucao_6'),(22,'pos13','url_resolucao_6'),(22,'pos14','url_resolucao_6'),(22,'pos15','url_resolucao_6'),(22,'pos16','url_resolucao_6'),(22,'pos17','url_resolucao_6'),(22,'pos18','url_resolucao_6'),(22,'pos19','url_resolucao_6'),(22,'pos2','url_resolucao_6'),(22,'pos20','url_resolucao_6'),(22,'pos21','url_resolucao_6'),(22,'pos22','url_resolucao_6'),(22,'pos23','url_resolucao_6'),(22,'pos24','url_resolucao_6'),(22,'pos25','url_resolucao_6'),(22,'pos26','url_resolucao_6'),(22,'pos27','url_resolucao_6'),(22,'pos28','url_resolucao_6'),(22,'pos29','url_resolucao_6'),(22,'pos3','url_resolucao_6'),(22,'pos30','url_resolucao_6'),(22,'pos31','url_resolucao_6'),(22,'pos32','url_resolucao_6'),(22,'pos33','url_resolucao_6'),(22,'pos34','url_resolucao_6'),(22,'pos35','url_resolucao_6'),(22,'pos36','url_resolucao_6'),(22,'pos37','url_resolucao_6'),(22,'pos38','url_resolucao_6'),(22,'pos39','url_resolucao_6'),(22,'pos4','url_resolucao_6'),(22,'pos40','url_resolucao_6'),(22,'pos41','url_resolucao_6'),(22,'pos42','url_resolucao_6'),(22,'pos43','url_resolucao_6'),(22,'pos44','url_resolucao_6'),(22,'pos45','url_resolucao_6'),(22,'pos46','url_resolucao_6'),(22,'pos47','url_resolucao_6'),(22,'pos48','url_resolucao_6'),(22,'pos49','url_resolucao_6'),(22,'pos5','url_resolucao_6'),(22,'pos50','url_resolucao_6'),(22,'pos51','url_resolucao_6'),(22,'pos52','url_resolucao_6'),(22,'pos53','url_resolucao_6'),(22,'pos54','url_resolucao_6'),(22,'pos55','url_resolucao_6'),(22,'pos56','url_resolucao_6'),(22,'pos57','url_resolucao_6'),(22,'pos58','url_resolucao_6'),(22,'pos59','url_resolucao_6'),(22,'pos6','url_resolucao_6'),(22,'pos60','url_resolucao_6'),(22,'pos61','url_resolucao_6'),(22,'pos62','url_resolucao_6'),(22,'pos63','url_resolucao_6'),(22,'pos64','url_resolucao_6'),(22,'pos65','url_resolucao_6'),(22,'pos66','url_resolucao_6'),(22,'pos67','url_resolucao_6'),(22,'pos68','url_resolucao_6'),(22,'pos69','url_resolucao_6'),(22,'pos7','url_resolucao_6'),(22,'pos70','url_resolucao_6'),(22,'pos71','url_resolucao_6'),(22,'pos72','url_resolucao_6'),(22,'pos73','url_resolucao_6'),(22,'pos74','url_resolucao_6'),(22,'pos75','url_resolucao_6'),(22,'pos76','url_resolucao_6'),(22,'pos77','url_resolucao_6'),(22,'pos78','url_resolucao_6'),(22,'pos79','url_resolucao_6'),(22,'pos8','url_resolucao_6'),(22,'pos80','url_resolucao_6'),(22,'pos81','url_resolucao_6'),(22,'pos82','url_resolucao_6'),(22,'pos83','url_resolucao_6'),(22,'pos84','url_resolucao_6'),(22,'pos85','url_resolucao_6'),(22,'pos86','url_resolucao_6'),(22,'pos87','url_resolucao_6'),(22,'pos88','url_resolucao_6'),(22,'pos89','url_resolucao_6'),(22,'pos9','url_resolucao_6'),(22,'pos90','url_resolucao_6'),(22,'pos91','url_resolucao_6'),(22,'pos92','url_resolucao_6'),(22,'pos93','url_resolucao_6'),(22,'pos94','url_resolucao_6'),(22,'pos95','url_resolucao_6'),(22,'pos96','url_resolucao_6'),(22,'pos97','url_resolucao_6'),(22,'pos98','url_resolucao_6'),(22,'pos99','url_resolucao_6'),(23,'pos0','url_resolucao_3'),(23,'pos1','url_resolucao_6'),(23,'pos100','url_resolucao_6'),(23,'pos11','url_resolucao_6'),(23,'pos12','url_resolucao_6'),(23,'pos13','url_resolucao_6'),(23,'pos14','url_resolucao_6'),(23,'pos15','url_resolucao_6'),(23,'pos16','url_resolucao_6'),(23,'pos17','url_resolucao_6'),(23,'pos18','url_resolucao_6'),(23,'pos19','url_resolucao_6'),(23,'pos2','url_resolucao_6'),(23,'pos20','url_resolucao_6'),(23,'pos21','url_resolucao_6'),(23,'pos22','url_resolucao_6'),(23,'pos23','url_resolucao_6'),(23,'pos24','url_resolucao_6'),(23,'pos25','url_resolucao_6'),(23,'pos26','url_resolucao_6'),(23,'pos27','url_resolucao_6'),(23,'pos28','url_resolucao_6'),(23,'pos29','url_resolucao_6'),(23,'pos3','url_resolucao_6'),(23,'pos30','url_resolucao_6'),(23,'pos31','url_resolucao_6'),(23,'pos32','url_resolucao_6'),(23,'pos33','url_resolucao_6'),(23,'pos34','url_resolucao_6'),(23,'pos35','url_resolucao_6'),(23,'pos36','url_resolucao_6'),(23,'pos37','url_resolucao_6'),(23,'pos38','url_resolucao_6'),(23,'pos39','url_resolucao_6'),(23,'pos4','url_resolucao_6'),(23,'pos40','url_resolucao_6'),(23,'pos41','url_resolucao_6'),(23,'pos42','url_resolucao_6'),(23,'pos43','url_resolucao_6'),(23,'pos44','url_resolucao_6'),(23,'pos45','url_resolucao_6'),(23,'pos46','url_resolucao_6'),(23,'pos47','url_resolucao_6'),(23,'pos48','url_resolucao_6'),(23,'pos49','url_resolucao_6'),(23,'pos5','url_resolucao_6'),(23,'pos50','url_resolucao_6'),(23,'pos51','url_resolucao_6'),(23,'pos52','url_resolucao_6'),(23,'pos53','url_resolucao_6'),(23,'pos54','url_resolucao_6'),(23,'pos55','url_resolucao_6'),(23,'pos56','url_resolucao_6'),(23,'pos57','url_resolucao_6'),(23,'pos58','url_resolucao_6'),(23,'pos59','url_resolucao_6'),(23,'pos6','url_resolucao_6'),(23,'pos60','url_resolucao_6'),(23,'pos61','url_resolucao_6'),(23,'pos62','url_resolucao_6'),(23,'pos63','url_resolucao_6'),(23,'pos64','url_resolucao_6'),(23,'pos65','url_resolucao_6'),(23,'pos66','url_resolucao_6'),(23,'pos67','url_resolucao_6'),(23,'pos68','url_resolucao_6'),(23,'pos69','url_resolucao_6'),(23,'pos7','url_resolucao_6'),(23,'pos70','url_resolucao_6'),(23,'pos71','url_resolucao_6'),(23,'pos72','url_resolucao_6'),(23,'pos73','url_resolucao_6'),(23,'pos74','url_resolucao_6'),(23,'pos75','url_resolucao_6'),(23,'pos76','url_resolucao_6'),(23,'pos77','url_resolucao_6'),(23,'pos78','url_resolucao_6'),(23,'pos79','url_resolucao_6'),(23,'pos8','url_resolucao_6'),(23,'pos80','url_resolucao_6'),(23,'pos81','url_resolucao_6'),(23,'pos82','url_resolucao_6'),(23,'pos83','url_resolucao_6'),(23,'pos84','url_resolucao_6'),(23,'pos85','url_resolucao_6'),(23,'pos86','url_resolucao_6'),(23,'pos87','url_resolucao_6'),(23,'pos88','url_resolucao_6'),(23,'pos89','url_resolucao_6'),(23,'pos9','url_resolucao_6'),(23,'pos90','url_resolucao_6'),(23,'pos91','url_resolucao_6'),(23,'pos92','url_resolucao_6'),(23,'pos93','url_resolucao_6'),(23,'pos94','url_resolucao_6'),(23,'pos95','url_resolucao_6'),(23,'pos96','url_resolucao_6'),(23,'pos97','url_resolucao_6'),(23,'pos98','url_resolucao_6'),(23,'pos99','url_resolucao_6'),(24,'pos0','url_resolucao_3'),(24,'pos1','url_resolucao_6'),(24,'pos100','url_resolucao_6'),(24,'pos11','url_resolucao_6'),(24,'pos12','url_resolucao_6'),(24,'pos13','url_resolucao_6'),(24,'pos14','url_resolucao_6'),(24,'pos15','url_resolucao_6'),(24,'pos16','url_resolucao_6'),(24,'pos17','url_resolucao_6'),(24,'pos18','url_resolucao_6'),(24,'pos19','url_resolucao_6'),(24,'pos2','url_resolucao_6'),(24,'pos20','url_resolucao_6'),(24,'pos21','url_resolucao_6'),(24,'pos22','url_resolucao_6'),(24,'pos23','url_resolucao_6'),(24,'pos24','url_resolucao_6'),(24,'pos25','url_resolucao_6'),(24,'pos26','url_resolucao_6'),(24,'pos27','url_resolucao_6'),(24,'pos28','url_resolucao_6'),(24,'pos29','url_resolucao_6'),(24,'pos3','url_resolucao_6'),(24,'pos30','url_resolucao_6'),(24,'pos31','url_resolucao_6'),(24,'pos32','url_resolucao_6'),(24,'pos33','url_resolucao_6'),(24,'pos34','url_resolucao_6'),(24,'pos35','url_resolucao_6'),(24,'pos36','url_resolucao_6'),(24,'pos37','url_resolucao_6'),(24,'pos38','url_resolucao_6'),(24,'pos39','url_resolucao_6'),(24,'pos4','url_resolucao_6'),(24,'pos40','url_resolucao_6'),(24,'pos41','url_resolucao_6'),(24,'pos42','url_resolucao_6'),(24,'pos43','url_resolucao_6'),(24,'pos44','url_resolucao_6'),(24,'pos45','url_resolucao_6'),(24,'pos46','url_resolucao_6'),(24,'pos47','url_resolucao_6'),(24,'pos48','url_resolucao_6'),(24,'pos49','url_resolucao_6'),(24,'pos5','url_resolucao_6'),(24,'pos50','url_resolucao_6'),(24,'pos51','url_resolucao_6'),(24,'pos52','url_resolucao_6'),(24,'pos53','url_resolucao_6'),(24,'pos54','url_resolucao_6'),(24,'pos55','url_resolucao_6'),(24,'pos56','url_resolucao_6'),(24,'pos57','url_resolucao_6'),(24,'pos58','url_resolucao_6'),(24,'pos59','url_resolucao_6'),(24,'pos6','url_resolucao_6'),(24,'pos60','url_resolucao_6'),(24,'pos61','url_resolucao_6'),(24,'pos62','url_resolucao_6'),(24,'pos63','url_resolucao_6'),(24,'pos64','url_resolucao_6'),(24,'pos65','url_resolucao_6'),(24,'pos66','url_resolucao_6'),(24,'pos67','url_resolucao_6'),(24,'pos68','url_resolucao_6'),(24,'pos69','url_resolucao_6'),(24,'pos7','url_resolucao_6'),(24,'pos70','url_resolucao_6'),(24,'pos71','url_resolucao_6'),(24,'pos72','url_resolucao_6'),(24,'pos73','url_resolucao_6'),(24,'pos74','url_resolucao_6'),(24,'pos75','url_resolucao_6'),(24,'pos76','url_resolucao_6'),(24,'pos77','url_resolucao_6'),(24,'pos78','url_resolucao_6'),(24,'pos79','url_resolucao_6'),(24,'pos8','url_resolucao_6'),(24,'pos80','url_resolucao_6'),(24,'pos81','url_resolucao_6'),(24,'pos82','url_resolucao_6'),(24,'pos83','url_resolucao_6'),(24,'pos84','url_resolucao_6'),(24,'pos85','url_resolucao_6'),(24,'pos86','url_resolucao_6'),(24,'pos87','url_resolucao_6'),(24,'pos88','url_resolucao_6'),(24,'pos89','url_resolucao_6'),(24,'pos9','url_resolucao_6'),(24,'pos90','url_resolucao_6'),(24,'pos91','url_resolucao_6'),(24,'pos92','url_resolucao_6'),(24,'pos93','url_resolucao_6'),(24,'pos94','url_resolucao_6'),(24,'pos95','url_resolucao_6'),(24,'pos96','url_resolucao_6'),(24,'pos97','url_resolucao_6'),(24,'pos98','url_resolucao_6'),(24,'pos99','url_resolucao_6'),(25,'pos0','url_resolucao_3'),(25,'pos1','url_resolucao_6'),(25,'pos100','url_resolucao_6'),(25,'pos11','url_resolucao_6'),(25,'pos12','url_resolucao_6'),(25,'pos13','url_resolucao_6'),(25,'pos14','url_resolucao_6'),(25,'pos15','url_resolucao_6'),(25,'pos16','url_resolucao_6'),(25,'pos17','url_resolucao_6'),(25,'pos18','url_resolucao_6'),(25,'pos19','url_resolucao_6'),(25,'pos2','url_resolucao_6'),(25,'pos20','url_resolucao_6'),(25,'pos21','url_resolucao_6'),(25,'pos22','url_resolucao_6'),(25,'pos23','url_resolucao_6'),(25,'pos24','url_resolucao_6'),(25,'pos25','url_resolucao_6'),(25,'pos26','url_resolucao_6'),(25,'pos27','url_resolucao_6'),(25,'pos28','url_resolucao_6'),(25,'pos29','url_resolucao_6'),(25,'pos3','url_resolucao_6'),(25,'pos30','url_resolucao_6'),(25,'pos31','url_resolucao_6'),(25,'pos32','url_resolucao_6'),(25,'pos33','url_resolucao_6'),(25,'pos34','url_resolucao_6'),(25,'pos35','url_resolucao_6'),(25,'pos36','url_resolucao_6'),(25,'pos37','url_resolucao_6'),(25,'pos38','url_resolucao_6'),(25,'pos39','url_resolucao_6'),(25,'pos4','url_resolucao_6'),(25,'pos40','url_resolucao_6'),(25,'pos41','url_resolucao_6'),(25,'pos42','url_resolucao_6'),(25,'pos43','url_resolucao_6'),(25,'pos44','url_resolucao_6'),(25,'pos45','url_resolucao_6'),(25,'pos46','url_resolucao_6'),(25,'pos47','url_resolucao_6'),(25,'pos48','url_resolucao_6'),(25,'pos49','url_resolucao_6'),(25,'pos5','url_resolucao_6'),(25,'pos50','url_resolucao_6'),(25,'pos51','url_resolucao_6'),(25,'pos52','url_resolucao_6'),(25,'pos53','url_resolucao_6'),(25,'pos54','url_resolucao_6'),(25,'pos55','url_resolucao_6'),(25,'pos56','url_resolucao_6'),(25,'pos57','url_resolucao_6'),(25,'pos58','url_resolucao_6'),(25,'pos59','url_resolucao_6'),(25,'pos6','url_resolucao_6'),(25,'pos60','url_resolucao_6'),(25,'pos61','url_resolucao_6'),(25,'pos62','url_resolucao_6'),(25,'pos63','url_resolucao_6'),(25,'pos64','url_resolucao_6'),(25,'pos65','url_resolucao_6'),(25,'pos66','url_resolucao_6'),(25,'pos67','url_resolucao_6'),(25,'pos68','url_resolucao_6'),(25,'pos69','url_resolucao_6'),(25,'pos7','url_resolucao_6'),(25,'pos70','url_resolucao_6'),(25,'pos71','url_resolucao_6'),(25,'pos72','url_resolucao_6'),(25,'pos73','url_resolucao_6'),(25,'pos74','url_resolucao_6'),(25,'pos75','url_resolucao_6'),(25,'pos76','url_resolucao_6'),(25,'pos77','url_resolucao_6'),(25,'pos78','url_resolucao_6'),(25,'pos79','url_resolucao_6'),(25,'pos8','url_resolucao_6'),(25,'pos80','url_resolucao_6'),(25,'pos81','url_resolucao_6'),(25,'pos82','url_resolucao_6'),(25,'pos83','url_resolucao_6'),(25,'pos84','url_resolucao_6'),(25,'pos85','url_resolucao_6'),(25,'pos86','url_resolucao_6'),(25,'pos87','url_resolucao_6'),(25,'pos88','url_resolucao_6'),(25,'pos89','url_resolucao_6'),(25,'pos9','url_resolucao_6'),(25,'pos90','url_resolucao_6'),(25,'pos91','url_resolucao_6'),(25,'pos92','url_resolucao_6'),(25,'pos93','url_resolucao_6'),(25,'pos94','url_resolucao_6'),(25,'pos95','url_resolucao_6'),(25,'pos96','url_resolucao_6'),(25,'pos97','url_resolucao_6'),(25,'pos98','url_resolucao_6'),(25,'pos99','url_resolucao_6'),(26,'pos0','url_resolucao_3'),(26,'pos1','url_resolucao_6'),(26,'pos100','url_resolucao_6'),(26,'pos11','url_resolucao_6'),(26,'pos12','url_resolucao_6'),(26,'pos13','url_resolucao_6'),(26,'pos14','url_resolucao_6'),(26,'pos15','url_resolucao_6'),(26,'pos16','url_resolucao_6'),(26,'pos17','url_resolucao_6'),(26,'pos18','url_resolucao_6'),(26,'pos19','url_resolucao_6'),(26,'pos2','url_resolucao_6'),(26,'pos20','url_resolucao_6'),(26,'pos21','url_resolucao_6'),(26,'pos22','url_resolucao_6'),(26,'pos23','url_resolucao_6'),(26,'pos24','url_resolucao_6'),(26,'pos25','url_resolucao_6'),(26,'pos26','url_resolucao_6'),(26,'pos27','url_resolucao_6'),(26,'pos28','url_resolucao_6'),(26,'pos29','url_resolucao_6'),(26,'pos3','url_resolucao_6'),(26,'pos30','url_resolucao_6'),(26,'pos31','url_resolucao_6'),(26,'pos32','url_resolucao_6'),(26,'pos33','url_resolucao_6'),(26,'pos34','url_resolucao_6'),(26,'pos35','url_resolucao_6'),(26,'pos36','url_resolucao_6'),(26,'pos37','url_resolucao_6'),(26,'pos38','url_resolucao_6'),(26,'pos39','url_resolucao_6'),(26,'pos4','url_resolucao_6'),(26,'pos40','url_resolucao_6'),(26,'pos41','url_resolucao_6'),(26,'pos42','url_resolucao_6'),(26,'pos43','url_resolucao_6'),(26,'pos44','url_resolucao_6'),(26,'pos45','url_resolucao_6'),(26,'pos46','url_resolucao_6'),(26,'pos47','url_resolucao_6'),(26,'pos48','url_resolucao_6'),(26,'pos49','url_resolucao_6'),(26,'pos5','url_resolucao_6'),(26,'pos50','url_resolucao_6'),(26,'pos51','url_resolucao_6'),(26,'pos52','url_resolucao_6'),(26,'pos53','url_resolucao_6'),(26,'pos54','url_resolucao_6'),(26,'pos55','url_resolucao_6'),(26,'pos56','url_resolucao_6'),(26,'pos57','url_resolucao_6'),(26,'pos58','url_resolucao_6'),(26,'pos59','url_resolucao_6'),(26,'pos6','url_resolucao_6'),(26,'pos60','url_resolucao_6'),(26,'pos61','url_resolucao_6'),(26,'pos62','url_resolucao_6'),(26,'pos63','url_resolucao_6'),(26,'pos64','url_resolucao_6'),(26,'pos65','url_resolucao_6'),(26,'pos66','url_resolucao_6'),(26,'pos67','url_resolucao_6'),(26,'pos68','url_resolucao_6'),(26,'pos69','url_resolucao_6'),(26,'pos7','url_resolucao_6'),(26,'pos70','url_resolucao_6'),(26,'pos71','url_resolucao_6'),(26,'pos72','url_resolucao_6'),(26,'pos73','url_resolucao_6'),(26,'pos74','url_resolucao_6'),(26,'pos75','url_resolucao_6'),(26,'pos76','url_resolucao_6'),(26,'pos77','url_resolucao_6'),(26,'pos78','url_resolucao_6'),(26,'pos79','url_resolucao_6'),(26,'pos8','url_resolucao_6'),(26,'pos80','url_resolucao_6'),(26,'pos81','url_resolucao_6'),(26,'pos82','url_resolucao_6'),(26,'pos83','url_resolucao_6'),(26,'pos84','url_resolucao_6'),(26,'pos85','url_resolucao_6'),(26,'pos86','url_resolucao_6'),(26,'pos87','url_resolucao_6'),(26,'pos88','url_resolucao_6'),(26,'pos89','url_resolucao_6'),(26,'pos9','url_resolucao_6'),(26,'pos90','url_resolucao_6'),(26,'pos91','url_resolucao_6'),(26,'pos92','url_resolucao_6'),(26,'pos93','url_resolucao_6'),(26,'pos94','url_resolucao_6'),(26,'pos95','url_resolucao_6'),(26,'pos96','url_resolucao_6'),(26,'pos97','url_resolucao_6'),(26,'pos98','url_resolucao_6'),(26,'pos99','url_resolucao_6'),(27,'pos0','url_resolucao_3'),(27,'pos1','url_resolucao_6'),(27,'pos100','url_resolucao_6'),(27,'pos11','url_resolucao_6'),(27,'pos12','url_resolucao_6'),(27,'pos13','url_resolucao_6'),(27,'pos14','url_resolucao_6'),(27,'pos15','url_resolucao_6'),(27,'pos16','url_resolucao_6'),(27,'pos17','url_resolucao_6'),(27,'pos18','url_resolucao_6'),(27,'pos19','url_resolucao_6'),(27,'pos2','url_resolucao_6'),(27,'pos20','url_resolucao_6'),(27,'pos21','url_resolucao_6'),(27,'pos22','url_resolucao_6'),(27,'pos23','url_resolucao_6'),(27,'pos24','url_resolucao_6'),(27,'pos25','url_resolucao_6'),(27,'pos26','url_resolucao_6'),(27,'pos27','url_resolucao_6'),(27,'pos28','url_resolucao_6'),(27,'pos29','url_resolucao_6'),(27,'pos3','url_resolucao_6'),(27,'pos30','url_resolucao_6'),(27,'pos31','url_resolucao_6'),(27,'pos32','url_resolucao_6'),(27,'pos33','url_resolucao_6'),(27,'pos34','url_resolucao_6'),(27,'pos35','url_resolucao_6'),(27,'pos36','url_resolucao_6'),(27,'pos37','url_resolucao_6'),(27,'pos38','url_resolucao_6'),(27,'pos39','url_resolucao_6'),(27,'pos4','url_resolucao_6'),(27,'pos40','url_resolucao_6'),(27,'pos41','url_resolucao_6'),(27,'pos42','url_resolucao_6'),(27,'pos43','url_resolucao_6'),(27,'pos44','url_resolucao_6'),(27,'pos45','url_resolucao_6'),(27,'pos46','url_resolucao_6'),(27,'pos47','url_resolucao_6'),(27,'pos48','url_resolucao_6'),(27,'pos49','url_resolucao_6'),(27,'pos5','url_resolucao_6'),(27,'pos50','url_resolucao_6'),(27,'pos51','url_resolucao_6'),(27,'pos52','url_resolucao_6'),(27,'pos53','url_resolucao_6'),(27,'pos54','url_resolucao_6'),(27,'pos55','url_resolucao_6'),(27,'pos56','url_resolucao_6'),(27,'pos57','url_resolucao_6'),(27,'pos58','url_resolucao_6'),(27,'pos59','url_resolucao_6'),(27,'pos6','url_resolucao_6'),(27,'pos60','url_resolucao_6'),(27,'pos61','url_resolucao_6'),(27,'pos62','url_resolucao_6'),(27,'pos63','url_resolucao_6'),(27,'pos64','url_resolucao_6'),(27,'pos65','url_resolucao_6'),(27,'pos66','url_resolucao_6'),(27,'pos67','url_resolucao_6'),(27,'pos68','url_resolucao_6'),(27,'pos69','url_resolucao_6'),(27,'pos7','url_resolucao_6'),(27,'pos70','url_resolucao_6'),(27,'pos71','url_resolucao_6'),(27,'pos72','url_resolucao_6'),(27,'pos73','url_resolucao_6'),(27,'pos74','url_resolucao_6'),(27,'pos75','url_resolucao_6'),(27,'pos76','url_resolucao_6'),(27,'pos77','url_resolucao_6'),(27,'pos78','url_resolucao_6'),(27,'pos79','url_resolucao_6'),(27,'pos8','url_resolucao_6'),(27,'pos80','url_resolucao_6'),(27,'pos81','url_resolucao_6'),(27,'pos82','url_resolucao_6'),(27,'pos83','url_resolucao_6'),(27,'pos84','url_resolucao_6'),(27,'pos85','url_resolucao_6'),(27,'pos86','url_resolucao_6'),(27,'pos87','url_resolucao_6'),(27,'pos88','url_resolucao_6'),(27,'pos89','url_resolucao_6'),(27,'pos9','url_resolucao_6'),(27,'pos90','url_resolucao_6'),(27,'pos91','url_resolucao_6'),(27,'pos92','url_resolucao_6'),(27,'pos93','url_resolucao_6'),(27,'pos94','url_resolucao_6'),(27,'pos95','url_resolucao_6'),(27,'pos96','url_resolucao_6'),(27,'pos97','url_resolucao_6'),(27,'pos98','url_resolucao_6'),(27,'pos99','url_resolucao_6'),(28,'pos0','url_resolucao_3'),(28,'pos1','url_resolucao_6'),(28,'pos100','url_resolucao_6'),(28,'pos11','url_resolucao_6'),(28,'pos12','url_resolucao_6'),(28,'pos13','url_resolucao_6'),(28,'pos14','url_resolucao_6'),(28,'pos15','url_resolucao_6'),(28,'pos16','url_resolucao_6'),(28,'pos17','url_resolucao_6'),(28,'pos18','url_resolucao_6'),(28,'pos19','url_resolucao_6'),(28,'pos2','url_resolucao_6'),(28,'pos20','url_resolucao_6'),(28,'pos21','url_resolucao_6'),(28,'pos22','url_resolucao_6'),(28,'pos23','url_resolucao_6'),(28,'pos24','url_resolucao_6'),(28,'pos25','url_resolucao_6'),(28,'pos26','url_resolucao_6'),(28,'pos27','url_resolucao_6'),(28,'pos28','url_resolucao_6'),(28,'pos29','url_resolucao_6'),(28,'pos3','url_resolucao_6'),(28,'pos30','url_resolucao_6'),(28,'pos31','url_resolucao_6'),(28,'pos32','url_resolucao_6'),(28,'pos33','url_resolucao_6'),(28,'pos34','url_resolucao_6'),(28,'pos35','url_resolucao_6'),(28,'pos36','url_resolucao_6'),(28,'pos37','url_resolucao_6'),(28,'pos38','url_resolucao_6'),(28,'pos39','url_resolucao_6'),(28,'pos4','url_resolucao_6'),(28,'pos40','url_resolucao_6'),(28,'pos41','url_resolucao_6'),(28,'pos42','url_resolucao_6'),(28,'pos43','url_resolucao_6'),(28,'pos44','url_resolucao_6'),(28,'pos45','url_resolucao_6'),(28,'pos46','url_resolucao_6'),(28,'pos47','url_resolucao_6'),(28,'pos48','url_resolucao_6'),(28,'pos49','url_resolucao_6'),(28,'pos5','url_resolucao_6'),(28,'pos50','url_resolucao_6'),(28,'pos51','url_resolucao_6'),(28,'pos52','url_resolucao_6'),(28,'pos53','url_resolucao_6'),(28,'pos54','url_resolucao_6'),(28,'pos55','url_resolucao_6'),(28,'pos56','url_resolucao_6'),(28,'pos57','url_resolucao_6'),(28,'pos58','url_resolucao_6'),(28,'pos59','url_resolucao_6'),(28,'pos6','url_resolucao_6'),(28,'pos60','url_resolucao_6'),(28,'pos61','url_resolucao_6'),(28,'pos62','url_resolucao_6'),(28,'pos63','url_resolucao_6'),(28,'pos64','url_resolucao_6'),(28,'pos65','url_resolucao_6'),(28,'pos66','url_resolucao_6'),(28,'pos67','url_resolucao_6'),(28,'pos68','url_resolucao_6'),(28,'pos69','url_resolucao_6'),(28,'pos7','url_resolucao_6'),(28,'pos70','url_resolucao_6'),(28,'pos71','url_resolucao_6'),(28,'pos72','url_resolucao_6'),(28,'pos73','url_resolucao_6'),(28,'pos74','url_resolucao_6'),(28,'pos75','url_resolucao_6'),(28,'pos76','url_resolucao_6'),(28,'pos77','url_resolucao_6'),(28,'pos78','url_resolucao_6'),(28,'pos79','url_resolucao_6'),(28,'pos8','url_resolucao_6'),(28,'pos80','url_resolucao_6'),(28,'pos81','url_resolucao_6'),(28,'pos82','url_resolucao_6'),(28,'pos83','url_resolucao_6'),(28,'pos84','url_resolucao_6'),(28,'pos85','url_resolucao_6'),(28,'pos86','url_resolucao_6'),(28,'pos87','url_resolucao_6'),(28,'pos88','url_resolucao_6'),(28,'pos89','url_resolucao_6'),(28,'pos9','url_resolucao_6'),(28,'pos90','url_resolucao_6'),(28,'pos91','url_resolucao_6'),(28,'pos92','url_resolucao_6'),(28,'pos93','url_resolucao_6'),(28,'pos94','url_resolucao_6'),(28,'pos95','url_resolucao_6'),(28,'pos96','url_resolucao_6'),(28,'pos97','url_resolucao_6'),(28,'pos98','url_resolucao_6'),(28,'pos99','url_resolucao_6'),(29,'pos0','url_resolucao_3'),(29,'pos1','url_resolucao_6'),(29,'pos100','url_resolucao_6'),(29,'pos11','url_resolucao_6'),(29,'pos12','url_resolucao_6'),(29,'pos13','url_resolucao_6'),(29,'pos14','url_resolucao_6'),(29,'pos15','url_resolucao_6'),(29,'pos16','url_resolucao_6'),(29,'pos17','url_resolucao_6'),(29,'pos18','url_resolucao_6'),(29,'pos19','url_resolucao_6'),(29,'pos2','url_resolucao_6'),(29,'pos20','url_resolucao_6'),(29,'pos21','url_resolucao_6'),(29,'pos22','url_resolucao_6'),(29,'pos23','url_resolucao_6'),(29,'pos24','url_resolucao_6'),(29,'pos25','url_resolucao_6'),(29,'pos26','url_resolucao_6'),(29,'pos27','url_resolucao_6'),(29,'pos28','url_resolucao_6'),(29,'pos29','url_resolucao_6'),(29,'pos3','url_resolucao_6'),(29,'pos30','url_resolucao_6'),(29,'pos31','url_resolucao_6'),(29,'pos32','url_resolucao_6'),(29,'pos33','url_resolucao_6'),(29,'pos34','url_resolucao_6'),(29,'pos35','url_resolucao_6'),(29,'pos36','url_resolucao_6'),(29,'pos37','url_resolucao_6'),(29,'pos38','url_resolucao_6'),(29,'pos39','url_resolucao_6'),(29,'pos4','url_resolucao_6'),(29,'pos40','url_resolucao_6'),(29,'pos41','url_resolucao_6'),(29,'pos42','url_resolucao_6'),(29,'pos43','url_resolucao_6'),(29,'pos44','url_resolucao_6'),(29,'pos45','url_resolucao_6'),(29,'pos46','url_resolucao_6'),(29,'pos47','url_resolucao_6'),(29,'pos48','url_resolucao_6'),(29,'pos49','url_resolucao_6'),(29,'pos5','url_resolucao_6'),(29,'pos50','url_resolucao_6'),(29,'pos51','url_resolucao_6'),(29,'pos52','url_resolucao_6'),(29,'pos53','url_resolucao_6'),(29,'pos54','url_resolucao_6'),(29,'pos55','url_resolucao_6'),(29,'pos56','url_resolucao_6'),(29,'pos57','url_resolucao_6'),(29,'pos58','url_resolucao_6'),(29,'pos59','url_resolucao_6'),(29,'pos6','url_resolucao_6'),(29,'pos60','url_resolucao_6'),(29,'pos61','url_resolucao_6'),(29,'pos62','url_resolucao_6'),(29,'pos63','url_resolucao_6'),(29,'pos64','url_resolucao_6'),(29,'pos65','url_resolucao_6'),(29,'pos66','url_resolucao_6'),(29,'pos67','url_resolucao_6'),(29,'pos68','url_resolucao_6'),(29,'pos69','url_resolucao_6'),(29,'pos7','url_resolucao_6'),(29,'pos70','url_resolucao_6'),(29,'pos71','url_resolucao_6'),(29,'pos72','url_resolucao_6'),(29,'pos73','url_resolucao_6'),(29,'pos74','url_resolucao_6'),(29,'pos75','url_resolucao_6'),(29,'pos76','url_resolucao_6'),(29,'pos77','url_resolucao_6'),(29,'pos78','url_resolucao_6'),(29,'pos79','url_resolucao_6'),(29,'pos8','url_resolucao_6'),(29,'pos80','url_resolucao_6'),(29,'pos81','url_resolucao_6'),(29,'pos82','url_resolucao_6'),(29,'pos83','url_resolucao_6'),(29,'pos84','url_resolucao_6'),(29,'pos85','url_resolucao_6'),(29,'pos86','url_resolucao_6'),(29,'pos87','url_resolucao_6'),(29,'pos88','url_resolucao_6'),(29,'pos89','url_resolucao_6'),(29,'pos9','url_resolucao_6'),(29,'pos90','url_resolucao_6'),(29,'pos91','url_resolucao_6'),(29,'pos92','url_resolucao_6'),(29,'pos93','url_resolucao_6'),(29,'pos94','url_resolucao_6'),(29,'pos95','url_resolucao_6'),(29,'pos96','url_resolucao_6'),(29,'pos97','url_resolucao_6'),(29,'pos98','url_resolucao_6'),(29,'pos99','url_resolucao_6'),(30,'pos0','url_resolucao_3'),(30,'pos1','url_resolucao_6'),(30,'pos100','url_resolucao_6'),(30,'pos11','url_resolucao_6'),(30,'pos12','url_resolucao_6'),(30,'pos13','url_resolucao_6'),(30,'pos14','url_resolucao_6'),(30,'pos15','url_resolucao_6'),(30,'pos16','url_resolucao_6'),(30,'pos17','url_resolucao_6'),(30,'pos18','url_resolucao_6'),(30,'pos19','url_resolucao_6'),(30,'pos2','url_resolucao_6'),(30,'pos20','url_resolucao_6'),(30,'pos21','url_resolucao_6'),(30,'pos22','url_resolucao_6'),(30,'pos23','url_resolucao_6'),(30,'pos24','url_resolucao_6'),(30,'pos25','url_resolucao_6'),(30,'pos26','url_resolucao_6'),(30,'pos27','url_resolucao_6'),(30,'pos28','url_resolucao_6'),(30,'pos29','url_resolucao_6'),(30,'pos3','url_resolucao_6'),(30,'pos30','url_resolucao_6'),(30,'pos31','url_resolucao_6'),(30,'pos32','url_resolucao_6'),(30,'pos33','url_resolucao_6'),(30,'pos34','url_resolucao_6'),(30,'pos35','url_resolucao_6'),(30,'pos36','url_resolucao_6'),(30,'pos37','url_resolucao_6'),(30,'pos38','url_resolucao_6'),(30,'pos39','url_resolucao_6'),(30,'pos4','url_resolucao_6'),(30,'pos40','url_resolucao_6'),(30,'pos41','url_resolucao_6'),(30,'pos42','url_resolucao_6'),(30,'pos43','url_resolucao_6'),(30,'pos44','url_resolucao_6'),(30,'pos45','url_resolucao_6'),(30,'pos46','url_resolucao_6'),(30,'pos47','url_resolucao_6'),(30,'pos48','url_resolucao_6'),(30,'pos49','url_resolucao_6'),(30,'pos5','url_resolucao_6'),(30,'pos50','url_resolucao_6'),(30,'pos51','url_resolucao_6'),(30,'pos52','url_resolucao_6'),(30,'pos53','url_resolucao_6'),(30,'pos54','url_resolucao_6'),(30,'pos55','url_resolucao_6'),(30,'pos56','url_resolucao_6'),(30,'pos57','url_resolucao_6'),(30,'pos58','url_resolucao_6'),(30,'pos59','url_resolucao_6'),(30,'pos6','url_resolucao_6'),(30,'pos60','url_resolucao_6'),(30,'pos61','url_resolucao_6'),(30,'pos62','url_resolucao_6'),(30,'pos63','url_resolucao_6'),(30,'pos64','url_resolucao_6'),(30,'pos65','url_resolucao_6'),(30,'pos66','url_resolucao_6'),(30,'pos67','url_resolucao_6'),(30,'pos68','url_resolucao_6'),(30,'pos69','url_resolucao_6'),(30,'pos7','url_resolucao_6'),(30,'pos70','url_resolucao_6'),(30,'pos71','url_resolucao_6'),(30,'pos72','url_resolucao_6'),(30,'pos73','url_resolucao_6'),(30,'pos74','url_resolucao_6'),(30,'pos75','url_resolucao_6'),(30,'pos76','url_resolucao_6'),(30,'pos77','url_resolucao_6'),(30,'pos78','url_resolucao_6'),(30,'pos79','url_resolucao_6'),(30,'pos8','url_resolucao_6'),(30,'pos80','url_resolucao_6'),(30,'pos81','url_resolucao_6'),(30,'pos82','url_resolucao_6'),(30,'pos83','url_resolucao_6'),(30,'pos84','url_resolucao_6'),(30,'pos85','url_resolucao_6'),(30,'pos86','url_resolucao_6'),(30,'pos87','url_resolucao_6'),(30,'pos88','url_resolucao_6'),(30,'pos89','url_resolucao_6'),(30,'pos9','url_resolucao_6'),(30,'pos90','url_resolucao_6'),(30,'pos91','url_resolucao_6'),(30,'pos92','url_resolucao_6'),(30,'pos93','url_resolucao_6'),(30,'pos94','url_resolucao_6'),(30,'pos95','url_resolucao_6'),(30,'pos96','url_resolucao_6'),(30,'pos97','url_resolucao_6'),(30,'pos98','url_resolucao_6'),(30,'pos99','url_resolucao_6'),(31,'pos0','url_resolucao_3'),(31,'pos1','url_resolucao_6'),(31,'pos100','url_resolucao_6'),(31,'pos11','url_resolucao_6'),(31,'pos12','url_resolucao_6'),(31,'pos13','url_resolucao_6'),(31,'pos14','url_resolucao_6'),(31,'pos15','url_resolucao_6'),(31,'pos16','url_resolucao_6'),(31,'pos17','url_resolucao_6'),(31,'pos18','url_resolucao_6'),(31,'pos19','url_resolucao_6'),(31,'pos2','url_resolucao_6'),(31,'pos20','url_resolucao_6'),(31,'pos21','url_resolucao_6'),(31,'pos22','url_resolucao_6'),(31,'pos23','url_resolucao_6'),(31,'pos24','url_resolucao_6'),(31,'pos25','url_resolucao_6'),(31,'pos26','url_resolucao_6'),(31,'pos27','url_resolucao_6'),(31,'pos28','url_resolucao_6'),(31,'pos29','url_resolucao_6'),(31,'pos3','url_resolucao_6'),(31,'pos30','url_resolucao_6'),(31,'pos31','url_resolucao_6'),(31,'pos32','url_resolucao_6'),(31,'pos33','url_resolucao_6'),(31,'pos34','url_resolucao_6'),(31,'pos35','url_resolucao_6'),(31,'pos36','url_resolucao_6'),(31,'pos37','url_resolucao_6'),(31,'pos38','url_resolucao_6'),(31,'pos39','url_resolucao_6'),(31,'pos4','url_resolucao_6'),(31,'pos40','url_resolucao_6'),(31,'pos41','url_resolucao_6'),(31,'pos42','url_resolucao_6'),(31,'pos43','url_resolucao_6'),(31,'pos44','url_resolucao_6'),(31,'pos45','url_resolucao_6'),(31,'pos46','url_resolucao_6'),(31,'pos47','url_resolucao_6'),(31,'pos48','url_resolucao_6'),(31,'pos49','url_resolucao_6'),(31,'pos5','url_resolucao_6'),(31,'pos50','url_resolucao_6'),(31,'pos51','url_resolucao_6'),(31,'pos52','url_resolucao_6'),(31,'pos53','url_resolucao_6'),(31,'pos54','url_resolucao_6'),(31,'pos55','url_resolucao_6'),(31,'pos56','url_resolucao_6'),(31,'pos57','url_resolucao_6'),(31,'pos58','url_resolucao_6'),(31,'pos59','url_resolucao_6'),(31,'pos6','url_resolucao_6'),(31,'pos60','url_resolucao_6'),(31,'pos61','url_resolucao_6'),(31,'pos62','url_resolucao_6'),(31,'pos63','url_resolucao_6'),(31,'pos64','url_resolucao_6'),(31,'pos65','url_resolucao_6'),(31,'pos66','url_resolucao_6'),(31,'pos67','url_resolucao_6'),(31,'pos68','url_resolucao_6'),(31,'pos69','url_resolucao_6'),(31,'pos7','url_resolucao_6'),(31,'pos70','url_resolucao_6'),(31,'pos71','url_resolucao_6'),(31,'pos72','url_resolucao_6'),(31,'pos73','url_resolucao_6'),(31,'pos74','url_resolucao_6'),(31,'pos75','url_resolucao_6'),(31,'pos76','url_resolucao_6'),(31,'pos77','url_resolucao_6'),(31,'pos78','url_resolucao_6'),(31,'pos79','url_resolucao_6'),(31,'pos8','url_resolucao_6'),(31,'pos80','url_resolucao_6'),(31,'pos81','url_resolucao_6'),(31,'pos82','url_resolucao_6'),(31,'pos83','url_resolucao_6'),(31,'pos84','url_resolucao_6'),(31,'pos85','url_resolucao_6'),(31,'pos86','url_resolucao_6'),(31,'pos87','url_resolucao_6'),(31,'pos88','url_resolucao_6'),(31,'pos89','url_resolucao_6'),(31,'pos9','url_resolucao_6'),(31,'pos90','url_resolucao_6'),(31,'pos91','url_resolucao_6'),(31,'pos92','url_resolucao_6'),(31,'pos93','url_resolucao_6'),(31,'pos94','url_resolucao_6'),(31,'pos95','url_resolucao_6'),(31,'pos96','url_resolucao_6'),(31,'pos97','url_resolucao_6'),(31,'pos98','url_resolucao_6'),(31,'pos99','url_resolucao_6');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_bytes_decoded_per_second`
--

LOCK TABLES `video_bytes_decoded_per_second` WRITE;
/*!40000 ALTER TABLE `video_bytes_decoded_per_second` DISABLE KEYS */;
INSERT INTO `video_bytes_decoded_per_second` VALUES (1,0.696026,1441043648655,3,145978),(2,1.69444,1441043649656,3,87519),(3,2.69286,1441043650656,3,45041),(4,4.59682,1441043652563,3,368892),(5,5.59523,1441043653563,3,187844),(6,6.61687,1441043654567,3,122013),(7,8.6137,1441043656563,3,87425),(8,9.61212,1441043657564,3,147548),(9,10.6105,1441043658567,3,149909),(10,11.8179,1441043659789,3,290703),(11,12.8396,1441043660792,3,106165),(12,13.838,1441043661794,3,131379),(13,14.8364,1441043662794,3,105802),(14,175.463,1441043663795,3,519012),(15,176.461,1441043664796,3,174962),(16,177.46,1441043665799,3,10802),(17,2.11239,1441044802728,4,261929),(18,3.1108,1441044803730,4,99831),(19,4.10922,1441044804731,4,234243),(20,5.13086,1441044805732,4,54669),(21,0.881778,1441116593940,5,165672),(22,176.646,1441116594944,5,700604),(23,177.645,1441116595947,5,4902);
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
INSERT INTO `video_information` VALUES ('::ffff:127.0.0.1',1441043647646,'s4esPpIpTdfZyxbcoAgWooDEgxoJZO87Mdr6oNKjzviTRhDxM4IntZzqmHomhXFf','',18.3763,18.7943,0.418,2,178.214,4,178.214,3,'auto',0.261),('::ffff:127.0.0.1',1441044801723,'vGqQn4GX78Xeio24J2ZAoGIzLyItrHXkfkFxvvjlAibenMQ63eqiWQgk7f7Wo3QH','',5.85064,5.85064,0,0,178.214,0,5.85064,4,'auto',0),('::ffff:127.0.0.1',1441116592935,'QKLfRJxPeFVXIWAZXmVtgZBMQwucdnQO3dhMqCrCf1T2ItKcsJXCHQrYX7N1P5UM','',2.98288,3.39588,0.413,1,178.214,0,178.214,5,'auto',0.413);
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
  `url_page_simulador` varchar(512) NOT NULL,
  `url_resolucao_1` varchar(512) NOT NULL,
  `url_resolucao_2` varchar(512) NOT NULL,
  `url_resolucao_3` varchar(512) NOT NULL,
  `url_resolucao_4` varchar(512) NOT NULL,
  `url_resolucao_5` varchar(512) NOT NULL,
  `url_resolucao_6` varchar(512) NOT NULL,
  `ativar_troca_de_resolucao` varchar(8) NOT NULL,
  PRIMARY KEY (`idvideo_information_simulador`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_information_simulador`
--

LOCK TABLES `video_information_simulador` WRITE;
/*!40000 ALTER TABLE `video_information_simulador` DISABLE KEYS */;
INSERT INTO `video_information_simulador` VALUES (1,'127.0.0.1','ni4znVh68sipPdgp087oyNrELvtivLSb4PDPAXRWajqEy0k71QKZS2IWymIz6nHb',1440682458994,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(2,'127.0.0.1','IlMjjypHtetYD5GmMzjIoQ60ZNJGW2SfwVI0f08Y2x3RLXrvoRQLh0jWsORou7Ft',1440682502465,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(3,'127.0.0.1','3KDUca62pf70PnsaupM0QT8wEfhA5YPiO6oPcbtVljlkIxXWaUPksIWAnG5JXPDw',1440682596291,178.214,'0','1','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(4,'127.0.0.1','XIb576FxlADE8PgVYgjDutsdRJCafkJWZolW2qLgxSby5w7GsKBWO7xmKV5NeUIU',1440683390743,178.214,'0','1','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(5,'127.0.0.1','k0di6rnrs41jcYI3bpubE7dtXbuzfY1990tK8zMAK7o3DS8FQveXsz3Mttr7IQ4I',1440683868664,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(6,'127.0.0.1','BtUROU4EylZmKPGNGl0gOgt47MsEYDkrEmTdpQaXPdedccfbDbTtwubmOXoRLqyL',1440683896215,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(7,'127.0.0.1','dFl5YGZ3MWRThnzLyeoL68x7pUflsj08R8EepLWeb0A1jS8FBVpw5Gu2dMC3iQUW',1440683962669,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','0'),(8,'127.0.0.1','vXqVr2RnRAKMEQOhI0wSwaLMS24JMwx50WvaNzLDE5Vkqh80LKnt5am5ORBPx7D0',1440683987382,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(9,'127.0.0.1','QqxUQHgJ5hhTdtUOaG00sH5fHDu9RQOPyOvNEMjptA1E3rwwMA6YqXBmJIs5nlMi',1440684189165,178.214,'0','0','1',5000,1020,'http://200.220.254.84/hobbit-480p.html','hobbit-1080p.mp4','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(10,'::ffff:127.0.0.1','lifrXVVpjB2M0oH5DJvcw0MnJHPZHqHC1fZLNccO3DgYPgOSIWh1ilmiJtnRNwsf',1441043768919,178.214,'1','1','1',1000,1000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(11,'::ffff:127.0.0.1','p65VfotooENZHrIdzycsNgKhZhrZCdC05xfGAzH9K74NwdJjOke6Ne48ml9PZVa4',1441112967213,178.214,'1','1','0',2000,1000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(12,'::ffff:127.0.0.1','rRq6AFG0cmCeJhfFIme1CmmwbI6ZDiUvj5yLgGQiGDTAUTfiZL0eWeREwG4Cz4G3',1441113010298,178.214,'1','1','1',2000,1000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(13,'::ffff:127.0.0.1','WfOHHqFz5qh0tsz4jY0QCz6Pt3IeGGfhiYG2OqB4kdRi7weYrrtxfgW27Pt5bXqA',1441115285578,1177.39,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','https://s.vimeocdn.com/vimeo-prod-std-us/video/281268965.mp4?token=55e5ce77_0xadc0a82a3d75f312818953b7e5d67d5faba35c89','1'),(14,'::ffff:127.0.0.1','md1rhDBSLuSqVEj0PjRt81de2PKliJ2puH0EXlNyVPETiAjYCDGWRjiT7Iu5IZTn',1441115652893,487.573,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','https://s.vimeocdn.com/vimeo-prod-std-us/video/206285182.mp4?token=55e5cd31_0x0e6d3270da831a2f9ab61b98b19d171640a33824','1'),(15,'::ffff:127.0.0.1','TCw1HShfjzkRmcXB48wloJIPn9ZkFwGUMcZcgDjV7V1Mh1CvqEGEzZBKGcyOeCIK',1441115758974,233.493,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','https://s.vimeocdn.com/vimeo-prod-std-us/video/405448450.mp4?token=55e5cc9e_0xb2c91e247f0388564ea44b1dff8bf0ce4ab2ac4d','1'),(16,'::ffff:127.0.0.1','vFCipylQmLTb9sD1cW4pNd0XzCQMcAC7wmeeoZxlCrJNDu6gtcT5exccSVeJPQ6o',1441115927177,258.603,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','https://s.vimeocdn.com/vimeo-prod-skyfire-std-us/01/2387/5/136938394/406388990.mp4?token=55e5cd64_0xcb7f8d066365ff62506cf607331dbef79c9c315c','1'),(17,'::ffff:127.0.0.1','6IUGfl1shTbLdyjV0JA2icTNgXsanRAa7uzrl2qRtrEYWJiXDRnnK94q0seGTRT2',1441115968078,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(18,'::ffff:127.0.0.1','EjsFleeeseQOteA6cCVysMwGrEZg2hAVm0zTXJBPrdUeXX0g3qcMHr05tyTr7e8Z',1441116026372,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(19,'::ffff:127.0.0.1','NKQLTc63AjEz5CpJgg6tVnKau4dHgjMJi7k559EBd6znuRw0JGP6pNYKc36Okw5Y',1441116073868,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(20,'::ffff:127.0.0.1','cveI8Blqeam7FH4P6dJAENijk7QFDl0SZPMIgVjLmWwzfg0wxO8iVqGK80llOMpJ',1441116118293,460.139,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','https://s.vimeocdn.com/vimeo-prod-std-us/video/407416328.mp4?token=55e5ceea_0x5cfb99d108b429caae15648675aea102264acfa0','1'),(21,'::ffff:127.0.0.1','RdR0Ahky4rl4j0DXUZiTZylau1EXBBehUjF06Wp1OtdXLNjRv7k2Mr3KxnSUijZk',1441116330955,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(22,'::ffff:127.0.0.1','TgSU1tM2H9p4Kz0xToxFb1P7vF55NpjZN6LrF8HEqfrrBwY4u762wCDNZxS8xjX6',1441116414177,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(23,'::ffff:127.0.0.1','CixShN1LS6zn4TDXwEuSth502J6G2p6lCrL6mi0J4hXIkZl4yti7ljXqEDB4ENGL',1441116778457,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-720p.mp4','1'),(24,'::ffff:127.0.0.1','nyXon0ZIzy2J63kmOX5SWaNBM0EnbvEqfJPycmhjWxgMtPkDBB6t5VSZhk7RbRtJ',1441116807929,616,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','blob:https%3A//www.youtube.com/7c941aea-f14f-4633-9980-684461b1997e','1'),(25,'::ffff:127.0.0.1','dwhduXHlHqKbeeeYdINeTFyIko3UBctqHDkBo1XAMteDjDd2o8udA117wRDJ4pzE',1441117354036,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-480p.mp4','1'),(26,'::ffff:127.0.0.1','3vhDKlXEPIDL32O4QHMUVj4Rwqi2fJSsNFf8iwOVLIDkgtQXMe0RQ3tzph6KX9g9',1441117680062,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-480p.mp4','1'),(27,'::ffff:127.0.0.1','8KtULQ3Vm2yZDhZwGmlXyZJmQyCf0Dg6lCQWq2YQduXvmFt46s4t1EmQxLA1ruR0',1441117740777,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-480p.mp4','1'),(28,'::ffff:127.0.0.1','CMFWqWLGyTmnIWwTKw2x3hefJzMK4YfCyQd8K58dDeOKESurQtHvu2WKt0Kn6his',1441117754372,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-480p.mp4','1'),(29,'::ffff:127.0.0.1','lDT7boIjEWUeXCuYCLpZMOyaSZnsbfVA3L3wML3tttJqtVQQ7vcyLstEArNCSTLX',1441117759146,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-480p.mp4','1'),(30,'::ffff:127.0.0.1','VjtbSzcIC71GwZ0R4hN8pQaeAmxZxamRkhwuYfGU4SUNWrQDY4CydESIYuKqtEui',1441117915661,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-480p.mp4','1'),(31,'::ffff:127.0.0.1','Qmc3WzJMAVft9oCKfSmdRcdEyZ7Nt1rRfiURvVosGlEVny6SNhOgFmYfG6DsEFh7',1441118021250,178.214,'1','1','1',2000,10000,'http://200.220.254.84/hobbit-480p.html','','','','','','http://200.220.254.84/hobbit-480p.mp4','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_source`
--

LOCK TABLES `video_source` WRITE;
/*!40000 ALTER TABLE `video_source` DISABLE KEYS */;
INSERT INTO `video_source` VALUES (1,'http://200.220.254.84/b.html',3),(2,'http://200.220.254.84/hobbit-720p.mp4',3),(3,'http://200.220.254.84/b.html',4),(4,'http://200.220.254.84/hobbit-720p.mp4',4),(5,'http://200.220.254.84/b.html',5),(6,'http://200.220.254.84/hobbit-720p.mp4',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_state`
--

LOCK TABLES `volume_state` WRITE;
/*!40000 ALTER TABLE `volume_state` DISABLE KEYS */;
INSERT INTO `volume_state` VALUES (1,0.696026,1441043648656,3,1),(2,2.11239,1441044802729,4,1),(3,0.881778,1441116593941,5,1);
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

-- Dump completed on 2015-09-01 11:35:57
