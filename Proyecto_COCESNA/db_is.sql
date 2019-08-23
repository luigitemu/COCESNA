-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: db_is
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areas_de_preguntas`
--

DROP TABLE IF EXISTS `areas_de_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas_de_preguntas` (
  `id_area` int(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_area`),
  UNIQUE KEY `id_area_UNIQUE` (`id_area`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_de_preguntas`
--

LOCK TABLES `areas_de_preguntas` WRITE;
/*!40000 ALTER TABLE `areas_de_preguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas_de_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `id_personal` int(3) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `sexo` enum('M','F') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `no_empleado` varchar(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'commodi ut','aut est','1983-10-09','2012-01-21','M','785',1),(2,'magnam iusto','nostrum inventore','1974-04-21','1973-08-31','F','888',1),(3,'sapiente ab','laudantium consequuntur','1985-12-10','1987-10-29','M','724',1),(4,'ipsum quam','non modi','2017-04-06','2004-10-27','M','840',1),(5,'sed laborum','veritatis ex','1982-02-26','2000-03-03','F','673',1),(6,'praesentium pariatur','placeat voluptatem','2009-03-31','1991-05-31','F','680',1),(7,'quaerat consequatur','similique architecto','1979-09-19','1979-07-16','F','893',1),(8,'et esse','sint architecto','1980-07-02','2004-04-16','M','972',1),(9,'aperiam recusandae','sit natus','2017-08-17','2018-12-01','F','58',1),(10,'nemo ipsum','laudantium optio','2018-01-26','1985-09-22','M','464',1);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicion`
--

DROP TABLE IF EXISTS `posicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posicion` (
  `id_posicion` int(3) NOT NULL AUTO_INCREMENT,
  `posicion` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_posicion`),
  UNIQUE KEY `id_posicion_UNIQUE` (`id_posicion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicion`
--

LOCK TABLES `posicion` WRITE;
/*!40000 ALTER TABLE `posicion` DISABLE KEYS */;
INSERT INTO `posicion` VALUES (1,'quas'),(2,'quas');
/*!40000 ALTER TABLE `posicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `id_pregunta` int(6) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(100) NOT NULL,
  `fecha_creacion` varchar(45) DEFAULT NULL,
  `id_area` int(6) NOT NULL,
  PRIMARY KEY (`id_pregunta`),
  UNIQUE KEY `id_pregunta_UNIQUE` (`id_pregunta`),
  KEY `fk_preguntas_areas_de_preguntas1_idx` (`id_area`),
  CONSTRAINT `fk_preguntas_areas_de_preguntas1` FOREIGN KEY (`id_area`) REFERENCES `areas_de_preguntas` (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas` (
  `id_respuesta` int(6) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(100) NOT NULL,
  `fecha_creacion` varchar(45) DEFAULT NULL,
  `id_pregunta` int(6) NOT NULL,
  PRIMARY KEY (`id_respuesta`),
  UNIQUE KEY `id_pregunta_UNIQUE` (`id_respuesta`),
  KEY `fk_respuestas_preguntas1_idx` (`id_pregunta`),
  CONSTRAINT `fk_respuestas_preguntas1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seglog`
--

DROP TABLE IF EXISTS `seglog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seglog` (
  `SegLogKey` int(11) NOT NULL AUTO_INCREMENT,
  `SegLogFecha` date DEFAULT NULL,
  `SegLogHora` time DEFAULT NULL,
  `SegUsrKey` int(11) DEFAULT NULL,
  `SegUsrUsuario` varchar(20) DEFAULT NULL,
  `SegLogDetalle` mediumtext,
  `SegLogLlave` int(11) DEFAULT NULL,
  `SegLogTabla` varchar(60) DEFAULT NULL,
  `SegLogAccion` mediumtext,
  `SegLogComando` mediumtext,
  `SegLogIp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SegLogKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seglog`
--

LOCK TABLES `seglog` WRITE;
/*!40000 ALTER TABLE `seglog` DISABLE KEYS */;
/*!40000 ALTER TABLE `seglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id_turno` int(3) NOT NULL AUTO_INCREMENT,
  `turno` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,'fugiat','19:36:50','02:44:15',1),(2,'perferendis','04:10:20','20:09:45',1),(3,'eveniet','23:39:27','21:40:38',1);
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_personal` int(3) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasena` varchar(200) NOT NULL DEFAULT '0000',
  `id_turno` int(3) NOT NULL,
  `id_posicion` int(3) NOT NULL,
  PRIMARY KEY (`id_personal`,`id_turno`,`id_posicion`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_personal_UNIQUE` (`id_personal`),
  KEY `fk_datos_adiciones_turnos1_idx` (`id_turno`),
  KEY `fk_datos_adiciones_posicion1_idx` (`id_posicion`),
  CONSTRAINT `fk_datos_adiciones_personal1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  CONSTRAINT `fk_datos_adiciones_posicion1` FOREIGN KEY (`id_posicion`) REFERENCES `posicion` (`id_posicion`),
  CONSTRAINT `fk_datos_adiciones_turnos1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'johan.kunze@thiel.com','eyJpdiI6IlhHcDZubnRiYkltNnZGdGo2d09cL2RBPT0iLCJ2YWx1ZSI6IjJrVDVqQ0ZMZThVZnV4NlRXUjdWVFE9PSIsIm1hYyI6IjRlNjQwNTFlOTEyMTM3Yzg2OGVmZjE1OWM1NTY0ZThlMjlmYjQ0ZDE4N2FjYWU3NTY3M2M1ZmVjNDMyNjE5MjMifQ==',1,1),(2,'ecrona@yahoo.com','eyJpdiI6Imo5TWJhWm9md0FBQStHbjNqbnE5cXc9PSIsInZhbHVlIjoiUGV0KytSVFlZaUhQTFZUOGdWbndhQT09IiwibWFjIjoiYWZkM2E1Y2FjY2RjNjNkOTc3MjczZjliZGE0MDRjZTI1ZmU0ODhkOWIyYzEwYmM0YWM4OGM1ZGNmZWVkZTNlZSJ9',3,2),(3,'kling.bonita@hotmail.com','eyJpdiI6IlJkVFdyRTRzZk9cLzlPT3gwdHRNMjh3PT0iLCJ2YWx1ZSI6IjY3Z2pcL3pJRG9lbHNndVRyVWZwM2NBPT0iLCJtYWMiOiIxNTlhZDAyMTQwMTgwMjNjY2Q1ZjViNjdiZDRmNDAwNmVhYWE1NjVmMTdhZTI1MWY2NTY1MjZiZGQzYTVmNDNkIn0=',2,1),(4,'okeefe.precious@gmail.com','eyJpdiI6ImRqQmdsUDA3Q1JYaW1leE5GMFwvZlJnPT0iLCJ2YWx1ZSI6Ild5bjhyZzRiNVVzbXNkTFwvcGMrb3hnPT0iLCJtYWMiOiIxZGI2YzVkNmE4NmZiNGYwOTRhZjM4NjY0NWNiYTYwMTE4MTMyZDM3YzNiZmFmNTY2NzBmMWNiZGZiMDczZjU0In0=',2,1),(5,'raynor.darian@labadie.biz','eyJpdiI6Ill5VzZDTW1oTmcxNVZ2cXdTSnliSkE9PSIsInZhbHVlIjoiYVdzMmFuaWFFWGRONW1wcmxsMzkxZz09IiwibWFjIjoiN2E2MzY2NmQ5NmZiMmEyNTk4MTNhNThiMjI5NjVmOTJiNDk0NTAyZjUzOTBiMDJlMWE3OWFjNDg5NmYxZGIwMiJ9',3,1),(6,'darien.macejkovic@yahoo.com','eyJpdiI6IlJxQXd2WWZEOWp3b0MzS3BFMlNMcEE9PSIsInZhbHVlIjoiRENEMW9UcFI5em5RT0dBMkZiTERoUT09IiwibWFjIjoiYjE2MTQ5ODQwNTU3ZGZhNmQ5NGIyNjQ0ODIwMTAyZWE0MmYxMzM4NTk1ZDE2MzRiYzhlNjczYWI0MDRiN2EwZiJ9',2,2),(7,'eugenia.ledner@hotmail.com','eyJpdiI6IktpRlwvbThFR01RZmhLUGlNc28xMjdBPT0iLCJ2YWx1ZSI6InFkaUVoalB2aTdMMXR2eDVkTkMxM2c9PSIsIm1hYyI6IjkxMDJmZjRlOGQ2NjM0MDdjMmQyOTg2MDIxOWVlMDZhMDA3MjE1ODViYzVkMjFhOTNhYmU0ZWFjYmY5ZDIzOTcifQ==',3,1),(8,'elinor84@mante.com','eyJpdiI6InRpR2tOd0o4ck1ueVBWR3lnQTQwc0E9PSIsInZhbHVlIjoidWRYemtTZ1VVTjJoam1sQ3NpNVFPZz09IiwibWFjIjoiOGMyYmYyM2E3YjhiOTY3YzYzNWU5Yzg5OWUwYzI4MDVlZTNiZGZmMmFkYTMwZWM1NmJlYmM4ZjJlYjRiZDg5NSJ9',1,1),(9,'leonie.reinger@yahoo.com','eyJpdiI6IlNZd1NlMnBNc3VBMlUzWVZBdmdqdmc9PSIsInZhbHVlIjoiRlwvQ3NHMVhFTXR0aHRTVWVSVEtlN0E9PSIsIm1hYyI6IjZiZTdlZmY0ZTc3YTI5NzYxZmM1ZTI3ZDJkMzNmMzY5Zjg3OGMzYTM2ZDkyZjY5ZTc5ZDY0ZjQ0ZmZhNmEyOGMifQ==',1,2),(10,'muriel.deckow@koelpin.net','eyJpdiI6IkE2MUVtK053ZTNKbFdKVmkzeU9CQWc9PSIsInZhbHVlIjoianpGaTNGcVo1OWRKRkhDKzlHZUxNQT09IiwibWFjIjoiYWZiOGQ4ODI4MjVlZjI0ODJkNmIxMDg2M2U5OGViMTM2NmM2MTEzZTNhZjNkYjExZTdjODExMjRmZmZkNTc2OCJ9',2,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-22 21:31:03
