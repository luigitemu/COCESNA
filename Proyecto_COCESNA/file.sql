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
INSERT INTO `personal` VALUES (1,'est in','rerum quis','2017-02-11','1984-01-03','F','506',1),(2,'consequatur voluptas','illum quae','1972-03-13','2005-04-22','F','464',1),(3,'nesciunt id','occaecati rerum','1989-02-01','1992-02-25','M','344',1),(4,'aut ut','quam unde','1995-11-11','1993-12-23','M','983',1),(5,'est aperiam','ea aspernatur','1975-12-30','1991-01-17','F','433',1),(6,'est porro','perspiciatis quas','1973-05-15','2015-03-24','M','878',1),(7,'et nihil','eos cupiditate','2004-02-13','2007-08-08','M','123',1),(8,'molestiae est','et dolores','1983-10-05','1972-02-28','M','243',1),(9,'hic sequi','sint inventore','2015-07-26','1998-07-08','M','190',1),(10,'nesciunt officia','quia vero','1978-01-08','1984-08-11','F','873',1);
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
INSERT INTO `posicion` VALUES (1,'ut'),(2,'omnis');
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
INSERT INTO `turnos` VALUES (1,'voluptatem','01:56:49','14:47:43',1),(2,'et','18:30:39','04:40:01',1),(3,'est','06:32:27','07:33:36',1);
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
INSERT INTO `usuarios` VALUES (1,'isabel53@kautzer.net','eyJpdiI6InEyRTNWWGFhbGRuaDlQR0U0YmRSMUE9PSIsInZhbHVlIjoiSjJCNEJ2RDdLang2QSsreEFPOXZ0Zz09IiwibWFjIjoiZjk0OGUyMDllNWFlN2I3Njc0YjdlN2Y3MzQyYzdhMzFkN2ExOGVkMGZiMjk2M2ExMjFiNTMzZjg0YTIzNDIwMyJ9',2,2),(2,'evalyn23@grady.com','eyJpdiI6IkhiQ2xxbzFYSm13QXZvUW9iNWR5QUE9PSIsInZhbHVlIjoiOWt5MWdYUVcxNkxGR1Z4SzBONW1PUT09IiwibWFjIjoiYTQ0YjQ4OTM5MDBlNDRlZDJkMDQ5ZTg4NDhjOTkxYTJlMWYzMmFjNWYyNzNlZDQ5ODM4OTEzNDUyODM0YzNlMSJ9',2,1),(3,'herta42@von.info','eyJpdiI6ImowaGZYcWkzV2xJZmsycERYbDNQTFE9PSIsInZhbHVlIjoiT3hCMzhQbUxRU0oxdEUxaU0reFwveEE9PSIsIm1hYyI6IjVlMGNjZTcwMzk5OWZlYjY1MDI2NWUyYWY5ZTMyMjdiOWM2NGU2MTNiZmVlYjRjOWRmNmFjZjhhYmFmNmZjMTAifQ==',1,1),(4,'wolson@yahoo.com','eyJpdiI6ImQ4WDJ1bmIrcytEN29VREgrenFwYXc9PSIsInZhbHVlIjoiT210TitQazZhMnJZQmdrb2lpRTFUZz09IiwibWFjIjoiYWJlY2FmYTQ2Njk1ZGFkMmFmMTE5MjExMDI5NTgxZGZjNjM4NDgyNWNlYjc0MzYwYTBkY2M3MDE5ZTg0MzJlNyJ9',2,2),(5,'katharina84@yahoo.com','eyJpdiI6InpTcTFMb2Q4UzlNZG9WVFlLQmlEOVE9PSIsInZhbHVlIjoiUFlvWGEzc1lvV0ZSTWRERUQ0cGM0Zz09IiwibWFjIjoiMGQ3NzBhNjhhZmFkMzJkNjYwYjY1MjFlZjU2ZTIzNDllZmJhZjE2ZjQyMGEwODVhYmU2NjVkYWE2OTc4MWFmNiJ9',2,1),(6,'genevieve.kihn@kiehn.info','eyJpdiI6ImVBclM3Wmg2S1FNQUJMRGZVd0pcL1BRPT0iLCJ2YWx1ZSI6IlBsdVpRV0Q3dDVZaXdEXC9uOXU4MDBnPT0iLCJtYWMiOiI1YjczYTE3YTBjZWE5YjRhY2JmYWU1YWYwYjU2MjZkZDllYzBjZDFlMzEwNWQ3MWEzNTlmYmQyNDhlYzAwN2Y5In0=',3,2),(7,'jessie.carter@yahoo.com','eyJpdiI6Ik0yYlwvaitaQlNvQ3Q2N3hBSERFdUxBPT0iLCJ2YWx1ZSI6IkxOaUl0czd2ZG92cGJ6MHdQZ1BhTnc9PSIsIm1hYyI6IjE3NmE5M2IyYmJlOTYwNjJmNWM0Mzc4YmI2ZTM1ZmUzODVkNzMyNjY5MDczNDc1YTNlOTU1ODFlNWIwM2JiMjMifQ==',2,1),(8,'kcarter@little.com','eyJpdiI6IjlqbnpoZERDZW5rTXRDNjFEeTJNXC9nPT0iLCJ2YWx1ZSI6IllCaVBJSm9uWDVHdHpBQ0MrWGxtS1E9PSIsIm1hYyI6IjNmZTJkNmEzZWMwNDgyM2JjOTAzMTQwNGI5ZmRiNjEyNDVhZGI0NDQyZWY0NjUwNmUwYWE4OGEzODQ5MmE3OTUifQ==',3,1),(9,'monahan.rosario@walter.com','eyJpdiI6InlrSzFKXC9UeG1KR0lFXC9BK2FpUEVoUT09IiwidmFsdWUiOiJjdjRCRU11RllqXC9ja2drYVAwamJDQT09IiwibWFjIjoiOTgwYWQ5MzI0NzFhODhiYzhlZGZlODYzYWVlYjlmOThkYzA2NGFhMjBiMGNmN2U3ZDVhYjdmYmZmODVjZjg3OCJ9',3,1),(10,'schuppe.jammie@littel.com','eyJpdiI6InJUZFZIbkV4Y01DemV2MWF2VXlGdmc9PSIsInZhbHVlIjoiZUtrZk1JXC9xVEdrR2p5UmVsSUYzZFE9PSIsIm1hYyI6IjJhZWEzMzYyZjY5ZmFjYzNhYjM3ZjgzYjk0YjFhYjQxZGVmM2M5NmY4NmZkOWQyYzljNWMyMzExNzUzYzBhMTEifQ==',2,2);
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

-- Dump completed on 2019-08-22 21:10:45
