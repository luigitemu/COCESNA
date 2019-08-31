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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_usuarios`
--

LOCK TABLES `log_usuarios` WRITE;
/*!40000 ALTER TABLE `log_usuarios` DISABLE KEYS */;
INSERT INTO `log_usuarios` VALUES (1,2,1,NULL,NULL,NULL,1,'2019-08-30'),(2,2,1,NULL,NULL,NULL,1,'2019-08-30'),(3,2,1,NULL,NULL,NULL,1,'2019-08-30'),(4,2,1,NULL,NULL,NULL,1,'2019-08-30'),(5,2,1,NULL,NULL,NULL,1,'2019-08-30'),(6,2,1,NULL,NULL,NULL,1,'2019-08-30'),(7,2,1,NULL,NULL,NULL,1,'2019-08-30'),(8,2,1,NULL,NULL,NULL,1,'2019-08-30'),(9,2,1,NULL,NULL,NULL,1,'2019-08-30'),(10,2,1,NULL,NULL,NULL,1,'2019-08-30'),(11,2,1,NULL,NULL,NULL,1,'2019-08-30'),(12,2,1,NULL,NULL,NULL,1,'2019-08-30'),(13,2,1,NULL,NULL,NULL,1,'2019-08-30'),(14,2,1,NULL,NULL,NULL,1,'2019-08-30'),(15,3,1,NULL,NULL,NULL,1,'2019-08-30'),(16,2,1,NULL,NULL,NULL,1,'2019-08-30'),(17,3,1,NULL,NULL,NULL,1,'2019-08-30'),(18,2,1,NULL,NULL,NULL,1,'2019-08-30'),(19,2,1,NULL,NULL,NULL,1,'2019-08-30'),(20,3,1,NULL,NULL,NULL,1,'2019-08-30');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'eos quis','odio maiores','2005-04-01','1989-11-24','M','111',1),(2,'debitis quam','nobis id','1988-12-03','2004-05-21','F','222',1),(3,'numquam distinctio','omnis illum','2017-04-24','2007-04-11','F','333',1),(4,'harum ea','tempora optio','2007-06-30','1976-11-15','F','444',1),(5,'dicta quam','animi nostrum','2016-10-02','2018-07-22','F','216',1),(6,'alias nam','accusamus deleniti','1996-08-07','2007-10-04','F','720',1),(7,'officia reprehenderit','dignissimos maiores','2009-07-01','2015-03-05','M','778',1),(8,'ratione quia','temporibus impedit','2018-02-07','1987-04-25','F','857',1),(9,'voluptatem et','optio porro','2012-11-05','1996-02-13','F','461',1),(10,'unde molestiae','quae voluptatem','1971-06-15','1984-02-03','F','581',1),(11,'earum vel','vel dolores','1981-01-11','1987-03-27','M','228',1),(12,'quia ea','rerum voluptas','1972-12-30','2004-06-03','F','85',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta_filtro`
--

LOCK TABLES `pregunta_filtro` WRITE;
/*!40000 ALTER TABLE `pregunta_filtro` DISABLE KEYS */;
INSERT INTO `pregunta_filtro` VALUES ('¿Estoy en forma para realizar el turno?','2019-08-30','2019-08-30');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
INSERT INTO `turnos` VALUES (1,'voluptas','13:32:08','14:09:15',1),(2,'eius','06:45:00','19:05:10',1),(3,'omnis','05:56:20','09:37:59',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6Ilc1T29KR25zTlozNjZ4R2FYYWpNUVE9PSIsInZhbHVlIjoiRUlMZTZPNkpPWjZrRWlRemorSlN2Zz09IiwibWFjIjoiYjdmNWZkMjE3MjJjOTU5OGNlZTE4MWUwZmY1MmM3MGFlYmQ2NGI1OWEzZWI1MzQzMDdmNTdmZGY4YTk1NDI0ZiJ9',NULL),(2,1,2,'primer@controlador.p','eyJpdiI6Ilwvd3BIMGtCRmY0aWdRcVUwVFBLVlZnPT0iLCJ2YWx1ZSI6Ik1vK2tQQTg4SVJ0dTZsTndDWnJyZXc9PSIsIm1hYyI6IjU5N2VjZTA1ZWNkNTI3OTJhZDM2NWZkYzFkYjM0ZGJkMjlmYzVkMWQ3Mzg0N2I4MWEwZWNhNjg5ZWQ5YmI3ZDgifQ==',NULL),(3,1,3,'el@supervisor.p','eyJpdiI6IldQcVpaMGdoSHlHZjNxVGhIdFpib3c9PSIsInZhbHVlIjoibTJzOGl1NEtzbXNBNXpPdWVEYmJydz09IiwibWFjIjoiNjM5ZGM3Nzc0OGQ3NTIxZGRlODE5NzczNjEzMGEyOWY5ODM0ZTliZWNjZmQ1ZGFhY2VhNzNhNmIwOTBmNTFkMyJ9',NULL),(4,1,4,'RR@HH.p','eyJpdiI6IjBGU0ZcL3FpNkJZajdOeHlxeTd0aEVRPT0iLCJ2YWx1ZSI6Ik5yMTZLaHhsemF0WlRSbEQ2elwvc0ZRPT0iLCJtYWMiOiJmNjBiNGNlZjU4ODgxY2FlZmU0YmEwM2M5ZWIzNjFkMzhmMTJjZWUxNzdkNmQyOTVmZTA1M2JmNmM3YzFmMjdmIn0=',NULL),(5,1,3,'parisian.marcelle@runolfsson.info','eyJpdiI6Im9jS29YU25xRDRGMlpkOFwvT0V4cVF3PT0iLCJ2YWx1ZSI6IitRcGdldTlpYUxhUlhGOU1qSGtaenc9PSIsIm1hYyI6IjY0MjUwNzRmYWRkZjMyMjMxZjFhMmU5NGE1MDM5NjM1ODEzNjRkNTMzZTVhMWM3MTFkNDczODBmNzcyYzFlYTAifQ==',NULL),(6,1,4,'alittle@hessel.com','eyJpdiI6IlJSTjBQdDUzd2VyV25mNjhIVXl5cHc9PSIsInZhbHVlIjoiUWNucVMwSnFtYTB4UVhTS0VzXC9lcVE9PSIsIm1hYyI6IjQzMDQwODQ1YmIyYTE3MWJhOTcxMWNlYTVmYjE4NjViNzNmNzEyNDY0NzkxMDJlZTBiZDUyNDFkMDQ4MzFlMTcifQ==',NULL),(7,1,2,'sabryna67@auer.biz','eyJpdiI6IkduSVBrVnl5UEY4aHNHcFBjQ3dLMmc9PSIsInZhbHVlIjoieCttc2o3SEpPa09BemE2UnBpVFNOdz09IiwibWFjIjoiODQxM2FkZTg4MzY1Y2E1MjBmYjFmMWY0NWMzMzVkYzUzNjlhMGE3ZDczZWNiNjZjMWJhOTE0YTY3NGM5NTdiYyJ9',NULL),(8,2,3,'aubrey23@yahoo.com','eyJpdiI6IjZhT0laUG1LVlwvcVVpblFJWWlxWnFBPT0iLCJ2YWx1ZSI6IlJkajBBU05SSG1mdktiWWVEdTlmUXc9PSIsIm1hYyI6Ijc4YzZjYjI5YjMxMDM1OTAzZDMwNzc0YTk4MGI0NDRmOGJmNjM0YzMxNzUxMDAyMzVhMTUxOGNmYmRjNjFmNWIifQ==',NULL),(9,3,1,'aurore24@kohler.net','eyJpdiI6ImFHamdiTitoUE53anhzczE3TVlGSHc9PSIsInZhbHVlIjoiMXYxZFF4OW1LSzAzc1dCZXpPcHNrQT09IiwibWFjIjoiMGUwYjMzMDMwNjc0NWE0MWE4YmFlMGNkNDBiYjJiNzNhN2I1NTNhODY1MWU5YzJlMTFiOTJiMjlhZDkyM2JmNiJ9',NULL),(10,1,2,'yolanda21@walter.com','eyJpdiI6IlZseHByd3JtUVd2QXYwU1ZXbnp5WlE9PSIsInZhbHVlIjoiXC9lTVwvNkNDTUhLNTRZVlJvWjVsQTNBPT0iLCJtYWMiOiJiYmE5OTM3MmViNjY4MWI4YmFhYjRlNjc5MTVkODc4ZDM2YTg2OGYxYTc0MDkyOWU2NjlkNzJkZjcwOWMwMjE4In0=',NULL),(11,3,1,'xwolf@gmail.com','eyJpdiI6IndWcEFxRk8ybmhJb0ZkRDlKc3hpNlE9PSIsInZhbHVlIjoiZW5hOGZuWTdiVlJPdkhPZWg1VWUrUT09IiwibWFjIjoiMjdkNTM2ZTcxNTkxZWQ0ZjdjZGU1YTZhZTUwYTlkMzI5YjIxN2QyNjU4ZTgyNzFhYTA3OTY2MTNlNDdmZTM5YSJ9',NULL),(12,1,1,'kilback.asia@gmail.com','eyJpdiI6IjhUNjhaRHZsY0NhYVZiZWpzVVRkakE9PSIsInZhbHVlIjoiQXVlQ3ZpQlpKTlJqZlQ3ektWNDlIQT09IiwibWFjIjoiYTNkNjliODY5NGU2MjE4N2I0Y2E1YWRiYWE3ZjRhMmQyNmI2MTQwNTNiYmRlNjgzZDY5YjI5NmE4OTMwNTFiZiJ9',NULL);
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

-- Dump completed on 2019-08-30 22:01:09
