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
  `id_area` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_area`),
  UNIQUE KEY `id_area_UNIQUE` (`id_area`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_de_preguntas`
--

LOCK TABLES `areas_de_preguntas` WRITE;
/*!40000 ALTER TABLE `areas_de_preguntas` DISABLE KEYS */;
INSERT INTO `areas_de_preguntas` VALUES (1,'Fatiga','Lorem ipsum dolor sit amet',NULL);
/*!40000 ALTER TABLE `areas_de_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_usuarios`
--

DROP TABLE IF EXISTS `log_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_usuarios` (
  `id_log_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_personal` int(3) NOT NULL,
  `id_respuesta` int(6) NOT NULL,
  `id_area` int(6) DEFAULT NULL,
  `id_pregunta` int(6) DEFAULT NULL,
  `id_turno` int(3) DEFAULT NULL,
  `es_pregunta_filtro` tinyint(4) DEFAULT '0',
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_log_usuario`),
  UNIQUE KEY `id_log_usuario_UNIQUE` (`id_log_usuario`),
  KEY `fk_log_usuarios_personal1_idx` (`id_personal`),
  KEY `fk_log_usuarios_respuestas1_idx` (`id_respuesta`),
  KEY `fk_log_usuarios_preguntas1_idx` (`id_pregunta`),
  KEY `fk_log_usuarios_areas_de_preguntas1_idx` (`id_area`),
  KEY `fk_log_usuarios_turnos1_idx` (`id_turno`),
  CONSTRAINT `fk_log_usuarios_areas_de_preguntas1` FOREIGN KEY (`id_area`) REFERENCES `areas_de_preguntas` (`id_area`),
  CONSTRAINT `fk_log_usuarios_personal1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  CONSTRAINT `fk_log_usuarios_preguntas1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`),
  CONSTRAINT `fk_log_usuarios_respuestas1` FOREIGN KEY (`id_respuesta`) REFERENCES `respuestas` (`id_respuesta`),
  CONSTRAINT `fk_log_usuarios_turnos1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_usuarios`
--

LOCK TABLES `log_usuarios` WRITE;
/*!40000 ALTER TABLE `log_usuarios` DISABLE KEYS */;
INSERT INTO `log_usuarios` VALUES (1,2,1,NULL,NULL,NULL,1,'2019-08-30'),(2,2,1,NULL,NULL,NULL,1,'2019-08-30'),(3,2,1,NULL,NULL,NULL,1,'2019-08-30'),(4,2,1,NULL,NULL,NULL,1,'2019-08-30'),(5,2,1,NULL,NULL,NULL,1,'2019-08-30'),(6,2,1,NULL,NULL,NULL,1,'2019-08-30'),(7,2,1,NULL,NULL,NULL,1,'2019-08-30'),(8,2,1,NULL,NULL,NULL,1,'2019-08-30'),(9,2,1,NULL,NULL,NULL,1,'2019-08-30'),(10,2,1,NULL,NULL,NULL,1,'2019-08-30'),(11,2,1,NULL,NULL,NULL,1,'2019-08-30'),(12,2,1,NULL,NULL,NULL,1,'2019-08-30'),(13,2,1,NULL,NULL,NULL,1,'2019-08-30'),(14,2,1,NULL,NULL,NULL,1,'2019-08-30'),(15,3,1,NULL,NULL,NULL,1,'2019-08-30'),(16,2,1,NULL,NULL,NULL,1,'2019-08-30'),(17,3,1,NULL,NULL,NULL,1,'2019-08-30'),(18,2,1,NULL,NULL,NULL,1,'2019-08-30'),(19,2,1,NULL,NULL,NULL,1,'2019-08-30'),(20,3,1,NULL,NULL,NULL,1,'2019-08-30'),(21,3,1,NULL,NULL,NULL,1,'2019-08-30'),(22,2,2,NULL,NULL,NULL,1,'2019-08-30'),(23,2,1,NULL,NULL,NULL,1,'2019-08-30'),(24,2,1,NULL,NULL,NULL,1,'2019-08-31'),(25,2,2,NULL,NULL,NULL,1,'2019-08-31');
/*!40000 ALTER TABLE `log_usuarios` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'non nulla','dolorem earum','1975-01-02','1987-10-05','M','111',1),(2,'molestiae possimus','itaque autem','2001-10-01','1984-10-10','F','222',1),(3,'at nisi','quas unde','2011-07-29','1985-08-19','M','333',1),(4,'dolorem ipsa','iusto architecto','1972-11-16','2002-10-29','M','444',1),(5,'adipisci ut','fuga pariatur','2005-11-18','1973-11-27','F','860',1),(6,'quis quo','voluptatem reiciendis','1998-04-09','1988-07-30','F','609',1),(7,'autem aut','delectus sequi','2018-10-13','1994-09-16','M','65',1),(8,'enim nihil','alias atque','1977-03-03','1989-01-29','F','630',1),(9,'et explicabo','aut sequi','2013-01-26','1970-05-18','M','464',1),(10,'qui aliquid','mollitia repudiandae','1988-08-09','2010-04-01','M','356',1),(11,'quo hic','quos fugiat','1978-11-29','1994-01-21','F','382',1),(12,'culpa beatae','laboriosam quam','1993-09-15','1975-07-21','M','838',1),(13,'quis beatae','nihil qui','1987-06-11','1989-07-17','F','360',1),(14,'et molestiae','rerum voluptatem','1977-09-17','1999-05-08','M','998',1),(15,'ad dignissimos','facilis illo','2009-06-23','1984-11-15','F','315',1),(16,'debitis dolorem','impedit excepturi','1983-05-10','1995-01-16','F','777',1),(17,'facilis reiciendis','adipisci enim','1973-04-12','1996-03-16','F','818',1),(18,'nisi laborum','natus eos','1998-12-26','1974-09-27','M','927',1),(19,'a voluptatem','quisquam magnam','1988-10-28','1976-11-09','F','632',1),(20,'occaecati amet','inventore odit','1988-12-26','2012-08-31','M','639',1),(21,'dolorem et','alias ut','2002-03-20','1994-08-14','F','769',1),(22,'eveniet perferendis','explicabo optio','2013-12-27','2001-01-02','F','952',1),(23,'aliquam aut','harum iste','2009-04-07','1981-03-23','F','662',1),(24,'porro voluptates','corrupti voluptatem','2003-11-22','1995-04-16','M','115',1),(25,'tempore voluptatem','porro non','1992-12-05','2012-07-17','M','570',1),(26,'animi nulla','qui in','2003-07-05','2001-08-31','F','105',1),(27,'omnis cumque','impedit voluptates','1977-10-09','1984-08-08','F','264',1),(28,'sequi doloremque','consequuntur maxime','2001-01-23','1985-07-23','M','875',1),(29,'rerum distinctio','ea numquam','1979-01-04','2012-07-12','F','878',1),(30,'rem officiis','itaque nesciunt','1995-07-16','1974-04-06','M','51',1),(31,'exercitationem suscipit','nesciunt in','2013-02-26','2009-02-09','M','959',1),(32,'ut provident','et ad','2019-02-16','1978-01-25','F','793',1),(33,'qui et','nemo facere','2001-10-18','1991-04-06','M','37',1),(34,'rem ipsa','labore voluptatum','1974-02-20','1982-10-11','M','141',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicion`
--

LOCK TABLES `posicion` WRITE;
/*!40000 ALTER TABLE `posicion` DISABLE KEYS */;
INSERT INTO `posicion` VALUES (1,'Administrador'),(2,'Controlador'),(3,'Supervisor'),(4,'RRHH');
/*!40000 ALTER TABLE `posicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta_filtro`
--

DROP TABLE IF EXISTS `pregunta_filtro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta_filtro` (
  `pregunta` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  UNIQUE KEY `pregunta_UNIQUE` (`pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta_filtro`
--

LOCK TABLES `pregunta_filtro` WRITE;
/*!40000 ALTER TABLE `pregunta_filtro` DISABLE KEYS */;
INSERT INTO `pregunta_filtro` VALUES ('¿Estoy en forma para realizar el turno?','2019-09-01','2019-09-01');
/*!40000 ALTER TABLE `pregunta_filtro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `id_pregunta` int(6) NOT NULL AUTO_INCREMENT,
  `id_area` int(6) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `contenido` varchar(100) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`,`id_area`,`id_tipo`),
  UNIQUE KEY `id_pregunta_UNIQUE` (`id_pregunta`),
  KEY `fk_preguntas_areas_de_preguntas1_idx` (`id_area`),
  KEY `fk_preguntas_tipos_de_respuesta1_idx` (`id_tipo`),
  CONSTRAINT `fk_preguntas_areas_de_preguntas1` FOREIGN KEY (`id_area`) REFERENCES `areas_de_preguntas` (`id_area`),
  CONSTRAINT `fk_preguntas_tipos_de_respuesta1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_de_respuesta` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,1,1,'¿Existes?',NULL),(2,1,3,'¿Cómo está el calor?',NULL);
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
  `fecha_creacion` date DEFAULT NULL,
  `id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_respuesta`,`id_tipo`),
  UNIQUE KEY `id_pregunta_UNIQUE` (`id_respuesta`),
  KEY `fk_respuestas_tipos_de_respuesta1_idx` (`id_tipo`),
  CONSTRAINT `fk_respuestas_tipos_de_respuesta1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_de_respuesta` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,'si',NULL,1),(2,'no',NULL,1),(3,'1',NULL,2),(4,'2',NULL,2),(5,'3',NULL,2),(6,'4',NULL,2),(7,'5',NULL,2),(8,'bajo',NULL,3),(9,'medio',NULL,3),(10,'alto',NULL,3);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seglog`
--

LOCK TABLES `seglog` WRITE;
/*!40000 ALTER TABLE `seglog` DISABLE KEYS */;
/*!40000 ALTER TABLE `seglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_de_respuesta`
--

DROP TABLE IF EXISTS `tipos_de_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_de_respuesta` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(80) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_de_respuesta`
--

LOCK TABLES `tipos_de_respuesta` WRITE;
/*!40000 ALTER TABLE `tipos_de_respuesta` DISABLE KEYS */;
INSERT INTO `tipos_de_respuesta` VALUES (1,'Cerrada',NULL),(2,'Escala numerica 1-5',NULL),(3,'Escala ordinal',NULL);
/*!40000 ALTER TABLE `tipos_de_respuesta` ENABLE KEYS */;
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
INSERT INTO `turnos` VALUES (1,'ut','16:37:04','15:59:10',1),(2,'tempore','16:41:11','01:04:05',1),(3,'quos','09:58:04','20:42:01',1);
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
  `id_turno` int(3) NOT NULL,
  `id_posicion` int(3) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasena` varchar(200) NOT NULL DEFAULT '0000',
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_personal`,`id_turno`,`id_posicion`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_personal_UNIQUE` (`id_personal`),
  KEY `fk_datos_adiciones_turnos1_idx` (`id_turno`),
  KEY `fk_datos_adiciones_posicion1_idx` (`id_posicion`),
  CONSTRAINT `fk_datos_adiciones_personal1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  CONSTRAINT `fk_datos_adiciones_posicion1` FOREIGN KEY (`id_posicion`) REFERENCES `posicion` (`id_posicion`),
  CONSTRAINT `fk_datos_adiciones_turnos1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6ImtFY1NJeXlXUk82MkZ5UnZ0a0psVnc9PSIsInZhbHVlIjoibHdONmtxYStlSDBvYUcxSGJzSUxrUT09IiwibWFjIjoiZTU2YWUwMTdhODM5NGRjYzIzYmQwMzE4YTAwYWQwMWZlMTViZDI2NDlmNzcxZDFiZjM3OTAzZDUzNDZiMTQwYiJ9',NULL),(2,1,2,'primer@controlador.p','eyJpdiI6IjVFd0p6XC9HRGdlakVRUkd0S09aWkxBPT0iLCJ2YWx1ZSI6Ilc1Mk9QYXVTRUR6OWhab3lsWGp6ZGc9PSIsIm1hYyI6ImRiNmQ4ZWI2NGU3Y2M1MzdiMGIzZTEzMTc4ZmQ2MmFhMDU3Yzg2ZjVjZGJlMTg1ZGIxZjc5MjVhNDIzMTVlOWUifQ==',NULL),(3,1,3,'el@supervisor.p','eyJpdiI6ImUrZHkzT1NqMEo4TiszdVU1eVE4eEE9PSIsInZhbHVlIjoiMG10VFwvUU1ORHJYNEJyZlhGaTZIVWc9PSIsIm1hYyI6ImY3ODM3NzFkMzMxNjQwYzY3MDRjMTVlZmVlMGY0ZDA0ODI5OGJjNWUxMjA0MzNlZDkyMmI4MTlhZmU3ODUwMmEifQ==',NULL),(4,1,4,'RR@HH.p','eyJpdiI6ImtuRWMrK2JBZkZ3bzJjYkxhMGFvc1E9PSIsInZhbHVlIjoiTlVMRlBJNzJySTRDUEJ3cG1TbzBJQT09IiwibWFjIjoiNDZhN2M4YzMyOTQwMGEzNDY1NmE2ZDc1NzU3NzAxMjg2NmUxODdkODdkZjAyZjAyNWZhNDVhYjQ4OTRiZTYzNyJ9',NULL),(5,1,1,'volkman.kamryn@yahoo.com','eyJpdiI6ImdHZXpnOXZYUHRqK1ZmTFM3T0ZVeHc9PSIsInZhbHVlIjoiQWZIM2F6Wm1FMDJBUkJ0U295enFGZz09IiwibWFjIjoiYTE3MzYxNzI1ZGFhOWQxMDNjNDc1YjVkNDRlYzYyYTI1MzZlYWUxZWYyMjAzNjRmZmU0N2FiYjZlMmQxZjg1NCJ9',NULL),(6,1,3,'steve.schmidt@gmail.com','eyJpdiI6ImI2VnEwZE14d0U5SzhudHZrT0lzXC93PT0iLCJ2YWx1ZSI6IjFPMGZpYnYxdTVyMkNJK0JrVW81aGc9PSIsIm1hYyI6ImYyMWFiOGJkYzY0ZDJkODI1Nzk3OWRjMGU3M2QyMTlkZDgzNjA0MWViNmEyZGY0NjhlZDFkYzQ2MDUwOTMwOGMifQ==',NULL),(7,1,4,'ikoelpin@yahoo.com','eyJpdiI6IlV2ZjNQRWloRk5aYm4wSnBmK1I4N3c9PSIsInZhbHVlIjoiVHVvdzZXXC8xK29qb3dtZE1rNUpMZGc9PSIsIm1hYyI6IjJjMDg2MDFmOWIzMmI4YTU3ZDlmNjJlNGExMDAyOGM0YzYyZGViZmIzNjdkNTMzMjEwNGQ1ODNjOWIxNzg3NjIifQ==',NULL),(8,3,4,'marty.morissette@yahoo.com','eyJpdiI6IjBVMHI5TEFCWGllTys2MGlNZVpmcEE9PSIsInZhbHVlIjoiY2Q4ZmJ4Tmhuallaa1pHaExiRU43Zz09IiwibWFjIjoiYTNmODk4YTM5MjM3MzhlNWI0MTQwNDQ0NjIzMzFhOWEwMTg4MWYwZjZlMmZkZTQ2OTVhOGE1YTFmMGQ0OTYzOSJ9',NULL),(9,2,4,'missouri50@hintz.info','eyJpdiI6Ing3UDl0dXdqTW5tS2Vhd0E3S3M5SGc9PSIsInZhbHVlIjoiY1wvRHVhZFwvZm9ZTWhWRk9XNHNsNjNBPT0iLCJtYWMiOiJjYWY4ODU3MWU1MTg1YmRlNWJmMjdkMWNlZDlkNjRhZjY0YTgzNWZlYTg0NmQxOGE2Y2FiYzcxYTU0NjQ2NmI1In0=',NULL),(10,3,2,'tyshawn05@howell.net','eyJpdiI6IkRmQWFoU0xWTmxyRExOc3JuMmJpTFE9PSIsInZhbHVlIjoieThlUFc1bUtaYjVWNytpc3JDRkd2QT09IiwibWFjIjoiYzIzMDUzNjVlY2Q4ZGFmMmZlNWU4MjdhNjVkYzhlODc3NjQ5ZmU0M2Y0NDA1YjFmZWZhZjM1MTJkMWRkNGUzNiJ9',NULL),(11,3,3,'william.mertz@ebert.com','eyJpdiI6IkZiS01zZUl2dk5DaXdYcUZ3WHV0eEE9PSIsInZhbHVlIjoiU3E0WXVnNmVvWElDZDByUzhQNHZwQT09IiwibWFjIjoiZTE0YmE3Y2U0Y2YzNWZhM2Y0ZWIwN2FhZmY3ZTRlN2FhZjkyMDliMmFiOWFiN2ZkY2FkZTc5Mjc5NzVlM2U5MCJ9',NULL),(12,3,3,'nprice@hotmail.com','eyJpdiI6Ik5iTVdzbWxVWDhQd1diZ0xUcEdnREE9PSIsInZhbHVlIjoiNFRtd3R5MmxyeU8zRlR1NnpZYmtydz09IiwibWFjIjoiMzIzNzNjY2YxMzNkZWVjMTA4MWFhZDIxOTZhNTA3ZmZjOTJlYjJmYjI5OWJjYjhmNGYzZWE2ZWVhMWRjZTU3NCJ9',NULL),(13,1,4,'dillan29@nicolas.com','eyJpdiI6ImpcL0dqMEQzcHpcL2F5WEZvSUw2MHJKQT09IiwidmFsdWUiOiJaOXNxU2ZrY3JTUEhlMmdVNXQrQ3B3PT0iLCJtYWMiOiIxYTgyZDEzZDY0Njc4MGNmOWE5OTgwMTAwOTUwYmI1Yzc2Y2FiNjc2YjUzYjZkZjUyNDUyNTY3NTg5YzQ2MmY3In0=',NULL),(14,2,2,'abbott.cassandra@gmail.com','eyJpdiI6IjVUQTRjem9Ka1dBeTFlc2hhaWdLSEE9PSIsInZhbHVlIjoiRGRLK1VBRXpEUUE0RHg3Q0QwT1hJQT09IiwibWFjIjoiZjk4OWQzNjllZDFkYmFhOWUyZDIwMWRkOGUzMjQwNGVhYWQ1NjVhYzFiN2U3OGFkM2NjYThhNDU1YWMwYWY5MyJ9',NULL),(15,3,1,'hermann.keyon@ohara.net','eyJpdiI6IkdXRnpHbmtWQmp3RHp4OVwvWG9JMzNBPT0iLCJ2YWx1ZSI6InlUcU9MU3gzRDl4TTBtXC9rQmJmMTNBPT0iLCJtYWMiOiIwNTcyMjBiZTE0NGM5MDNmNTc2OWE3Yjk0ZjY5Y2U3YzdjNTM5ZjZiYTFhMDFlMmZiYTczMmRlZTljYzk3ZWZhIn0=',NULL),(16,1,1,'schmeler.prince@klein.com','eyJpdiI6IkdPRFdtcytsU1Q4ZW95RG11Unp4cGc9PSIsInZhbHVlIjoiOHNXMFd0SzNvcjNBd2p5TVA5UVczUT09IiwibWFjIjoiZGVjOTE5ODI3ZTQ1YTFhNmEzYjA4Njg1NzgyZmUzYjBiYmZmMjRmODFhZGNmOGJkZDcwNzBkMWUwZmI4ODI4MiJ9',NULL),(17,2,4,'cweissnat@gmail.com','eyJpdiI6IkFpVVB0dEwwaVd4QlJPc2tJT2p3cnc9PSIsInZhbHVlIjoiUDcrczQ3RmhvYXRVbXhrNlFxMkFXUT09IiwibWFjIjoiYTJjZDUwMWNmMTdmMjRlMzMwODBhZTM5ODc3OGI1ODJhZjkxMGQ4ZGMyZWE4NjE1ZGIwMTA1YjEwMzljN2YwNCJ9',NULL),(18,2,3,'frami.abigayle@schaefer.com','eyJpdiI6IlI2dDViXC85bU1Mek1cL0xjbVhnS0hyZz09IiwidmFsdWUiOiJDaUIwS3VVc29pVGZSWkhqczVzSFl3PT0iLCJtYWMiOiIwZTgyODRhMTRjOGZjYzgyODU3ZDJhMTVmYzZmZmMwMmNkNWViZTM2MWEwZjU1MTAxNWI4MzRmYmQ0Yzk0MmY0In0=',NULL),(19,3,2,'trevion.ankunding@bauch.com','eyJpdiI6IjhodXA3b244ZWJOc2MrM1ZValJOSmc9PSIsInZhbHVlIjoiMGp5UUYzUFRyWXBNaEVXMWpnUkpcL3c9PSIsIm1hYyI6ImJiZjJjNzM1NmQwYjFiYTg4Y2VhNTczZDI5ODkyNzZmMmU0ZjdhMmJjYzM0MjYyYWZkMjg4YWM2MGQ2NGM2N2IifQ==',NULL),(20,2,4,'lina18@yahoo.com','eyJpdiI6ImdEWGVGRXRhSDlrUWRsa0I5VHZ5SlE9PSIsInZhbHVlIjoiZ2prU3RtdlZFaTB0ejNYSUltdW8xQT09IiwibWFjIjoiZDA5Zjg0N2FkYzk0MGZlMmUzYzlkMWFlMjUwYzNkZWJkZWY2NDczZTQ4YzY4YjM0MDM1YTVlYTEzMmNiMmUxOCJ9',NULL),(21,2,2,'baylee72@mosciski.com','eyJpdiI6Img5NWRtdUxUVnQrZDRHYkNEYzA4RXc9PSIsInZhbHVlIjoicFwvOXBqcTFOMjZDMUtrc3BLM0ttQ0E9PSIsIm1hYyI6IjNhYmFjYTUyNDE2ZGI5YmI1YTZjZWY0Mzk4NWM4NzA0NjA3ZmVkNjM3NmIwN2YzZDBkMDhiMzZhMzhlZDk3ZmYifQ==',NULL),(22,2,2,'harber.jerome@wisoky.org','eyJpdiI6ImphTFY2aU8rbDJEYWord1pLSTczN3c9PSIsInZhbHVlIjoiZjVBa3lGWHBRbTJLT1krNG5qOW9ydz09IiwibWFjIjoiMTZhYWJlZWVhNmYxYTllZTI0NGEwYWYyMTQzMGY4M2U3M2I3NTMwNTQ0ZjBkYmQ4ODA1NGNmMGM2ZmQxNTA2MSJ9',NULL),(23,3,3,'hailie32@hermann.biz','eyJpdiI6IjdPdFVcL0J3VURQVmcwQUtiUGlPdHNnPT0iLCJ2YWx1ZSI6IjZBeW9SdTZ1clhcL2RuZlwvbEE5eTR0Zz09IiwibWFjIjoiYTAyMTg5MDBjMmY5OTZlZTM2NjE5ODlkNzBmNmE2NTllZjdhODFhNWRjMGE1ZjdlM2ZmODAxM2RmNTI0NGI3MiJ9',NULL),(24,2,2,'herminia66@beahan.com','eyJpdiI6InhVRnFqV2pqOFYxQUZIaDk2RFg4Q2c9PSIsInZhbHVlIjoiQnhjalE5MkxLUCtuSm1mazJXaWlodz09IiwibWFjIjoiN2Y2OTFjOTRmMmQwN2JmMjkzZmY2MWRiNTMzNGY5Mzk1ZDQ5YzI1M2U2NGFhMWRmODc5OWEzMzNhZmEzOGIyYiJ9',NULL),(25,2,3,'sigurd.ernser@funk.com','eyJpdiI6IkdqZGtBOHhmWnZjWE5qSzlReUYwWHc9PSIsInZhbHVlIjoidmRQekd1SkZHMzV5YjJjSVpsTzM0UT09IiwibWFjIjoiM2ZkYzg0MDJmNzg4YzQxMjBjMWEzMDVmZjRiODdhMjg0YWIwMjI4ZDc2ODY2MDk0NmUyMzllMzgzNWZiMjI2OSJ9',NULL),(26,1,4,'napoleon05@marvin.com','eyJpdiI6ImM0bDZIV0hvMmhhb1FpMGhibjJyK2c9PSIsInZhbHVlIjoiYVJMbUtKbUVcL0tPSmpabFlGNkF3a1E9PSIsIm1hYyI6IjhhZDA1MDI1NGNmZjU5NTc3OTA2YmMwYTBhMTIxNTVhYmFkYTg5NGJjYzIzMjVmNzNlNzUyYjlkYWE0MTA2NmQifQ==',NULL),(27,3,2,'heaney.lyric@hotmail.com','eyJpdiI6ImVOazNoZnhmR1hCdzhhemRTd2xJV2c9PSIsInZhbHVlIjoiTzZmTmhZQnVsWGtVT1dpVE1UaWhEZz09IiwibWFjIjoiOWJmOWRmNmQ3ZTM4MmVkNzkxZjA3YjdjOGIxNjZlOThhMTRhMWZjNDBhNGNkMzYzMWE0OTZlN2U5YWRhODI4MyJ9',NULL),(28,1,2,'ymarks@hickle.com','eyJpdiI6IkRnR3lXQlpYUlppcVhJUE1oYnhIUWc9PSIsInZhbHVlIjoiRk8zcUlxRm9Na3lMYkhFQ25ueU1FZz09IiwibWFjIjoiYTM1YmVjMDM1MjkzNjZkOWIwZmFmYmYzNjYzYTg4NGYwYWFjMjJhNmNmZTZlZjM0MmFlZjBkZjM2NGQyMGMzMCJ9',NULL),(29,1,3,'jodie06@weimann.com','eyJpdiI6InNaTnA0VnlNb0ErcHdLTlZBcHptR0E9PSIsInZhbHVlIjoiQkk2TENSRHkyNVZVTnVMQVBHNkV5dz09IiwibWFjIjoiYWFlZTViOTFkMWU1YTdlNWEwOTRiYjIyZTFjMTY4YTk5NDBjZmZmYjQ2OWQzMTZjNjE0NzljZGU4YzU5NjM2ZiJ9',NULL),(30,1,2,'blanda.pietro@mckenzie.org','eyJpdiI6Ilp0MktLSk03cDFCTHNnT1ExdVhLalE9PSIsInZhbHVlIjoiYkJMSktHZUYzbnBiV2x2T0ZnbDJIQT09IiwibWFjIjoiYjA2MmFlYjljZGFhYjc2NmI3NjUyNTQ2NTQ3NDQ2ZWE3ZWUwMTVkZGIyYmJjN2NkOTEzNzI5Nzk3MzhlOTk1OSJ9',NULL),(31,3,4,'kaleb72@braun.net','eyJpdiI6InFDS1czZDZKMDJMZFRZekxRTE9lUmc9PSIsInZhbHVlIjoiM1BDWmFaSmZuRExkU0YzMEpraUNPdz09IiwibWFjIjoiMzUxZjg2YzQzYzMzZTM2YTIzMGU4ODAzODQ5ZTA4YjI1ODgzOGZkNmNmZTIzZDYwZGNiNWY2OGZmNThjNGUzZSJ9',NULL),(32,2,3,'rhea.harvey@hotmail.com','eyJpdiI6IktiXC9YWkxFNklWMGdyRGlrbGJcLytxdz09IiwidmFsdWUiOiJSa0ladDFLcDQyQm4wNGlXaHBnWTdnPT0iLCJtYWMiOiJhZDBlZjg2NjM0ZTFmN2EzYmFjMjYxOGE2NGUyZTZjNGQxMjBhN2JlZGZkNTM1MzU5OWExN2MxY2QyYmQwZGM3In0=',NULL),(33,1,4,'jed11@gmail.com','eyJpdiI6IlM5OHcrNFJEU0NSYnBNQXV6eTVZV2c9PSIsInZhbHVlIjoienk5RnRmTTFqSVE2REVmUWJWK0hpQT09IiwibWFjIjoiOWY2Mzc5OTk0NzBkOGRmMTQ2OGQ4MWM4NGZlNGNmMmY5MTdmZmE4Y2RlZDcxYzc5OWMxZThiOTk1NzBlMzJlMSJ9',NULL),(34,3,4,'nhills@gmail.com','eyJpdiI6IkJhSmh0XC96MHV6MTBGYnZGaWdGQVFRPT0iLCJ2YWx1ZSI6IndZazRHaXJ6Um1SbEx1c2RrQk41RUE9PSIsIm1hYyI6IjJkNmE5MzhmZGQ2YTdlMDNjNzIzMTUxZTJkMjYzYTAwMTlhYjg0ODZhZTcwOWU5NDdmNjhmMGE1NTczN2E1ZmEifQ==',NULL);
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

-- Dump completed on 2019-09-01 16:07:40
