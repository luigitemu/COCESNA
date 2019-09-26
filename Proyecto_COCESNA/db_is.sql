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
  `ip` varchar(20) DEFAULT NULL,
  `es_pregunta_filtro` tinyint(4) DEFAULT '0',
  `fecha_creacion` datetime DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_usuarios`
--

LOCK TABLES `log_usuarios` WRITE;
/*!40000 ALTER TABLE `log_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perdidas_de_contrasena`
--

DROP TABLE IF EXISTS `perdidas_de_contrasena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perdidas_de_contrasena` (
  `id_perdida` int(11) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_perdida`),
  UNIQUE KEY `id_perdida_UNIQUE` (`id_perdida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perdidas_de_contrasena`
--

LOCK TABLES `perdidas_de_contrasena` WRITE;
/*!40000 ALTER TABLE `perdidas_de_contrasena` DISABLE KEYS */;
/*!40000 ALTER TABLE `perdidas_de_contrasena` ENABLE KEYS */;
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
INSERT INTO `personal` VALUES (1,'est hic','illo non','2007-08-19','1991-11-19','M','111',1),(2,'iure ad','deserunt doloremque','1981-12-30','1990-10-18','F','222',1),(3,'ea ducimus','saepe eum','1995-10-07','2017-12-18','F','333',1),(4,'molestiae sed','perferendis excepturi','1980-01-18','2008-09-16','M','444',1),(5,'perspiciatis occaecati','rerum voluptatem','2008-12-06','2018-07-08','F','224',1),(6,'dolorem et','placeat sit','2010-03-20','1989-07-31','F','419',1),(7,'accusantium qui','neque deleniti','2006-05-20','1979-12-07','M','301',1),(8,'veritatis sint','tempore dolor','1996-06-09','1973-08-10','F','495',1),(9,'dicta qui','nesciunt voluptas','1998-11-03','1971-11-03','M','315',1),(10,'iusto sed','illum quibusdam','2018-05-11','1990-11-20','M','474',1),(11,'iusto perferendis','id necessitatibus','1996-09-13','2007-10-02','F','964',1),(12,'totam est','aut beatae','2002-01-05','1970-08-02','F','20',1),(13,'doloribus dolorum','consequatur perferendis','2018-01-29','2009-08-29','F','556',1),(14,'ipsa vero','corrupti ut','2015-11-20','2003-10-24','F','287',1),(15,'dolores aliquam','qui rem','2003-07-22','1973-05-20','M','324',1),(16,'iusto est','minima eum','2014-03-12','2016-01-01','M','597',1),(17,'mollitia eos','blanditiis voluptas','2007-05-28','2003-04-11','M','415',1),(18,'qui autem','impedit nobis','1974-09-01','1985-09-06','F','706',1),(19,'rerum quaerat','qui qui','1979-04-27','2008-06-08','F','753',1),(20,'delectus fuga','sed rerum','2002-07-23','2003-09-19','M','713',1),(21,'ab aperiam','ab similique','2012-07-14','2008-11-10','F','252',1),(22,'quidem explicabo','sed accusantium','1986-05-28','1992-06-01','M','86',1),(23,'doloremque aliquid','quia totam','1973-05-11','1984-08-11','M','761',1),(24,'unde aut','id molestiae','1985-11-03','2009-05-13','F','77',1),(25,'perspiciatis quos','sit mollitia','1974-09-25','2001-12-13','M','10',1),(26,'voluptas autem','et voluptatem','2008-02-01','1997-05-19','F','654',1),(27,'voluptates deleniti','aut alias','2014-01-08','1975-11-20','M','801',1),(28,'soluta labore','ut quia','2006-01-08','1996-09-22','F','907',1),(29,'dolorum nam','reprehenderit dolorum','1972-09-13','1991-11-29','M','899',1),(30,'est similique','quisquam architecto','1970-05-04','2004-03-05','M','789',1),(31,'ut sint','qui nostrum','2015-03-23','1978-06-29','M','276',1),(32,'nihil nisi','ratione architecto','1993-09-23','1985-04-15','M','553',1),(33,'eos aut','soluta a','2010-12-01','1973-08-05','F','843',1),(34,'sunt corporis','nam consequuntur','1999-12-25','1982-01-28','F','926',1);
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
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  PRIMARY KEY (`id_pregunta`),
  UNIQUE KEY `id_pregunta_UNIQUE` (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta_filtro`
--

LOCK TABLES `pregunta_filtro` WRITE;
/*!40000 ALTER TABLE `pregunta_filtro` DISABLE KEYS */;
INSERT INTO `pregunta_filtro` VALUES (1,'¿Estoy en forma para realizar el turno?','2019-09-26','2019-09-26');
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
  PRIMARY KEY (`id_pregunta`,`id_area`,`id_tipo`,`contenido`),
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
-- Table structure for table `razones`
--

DROP TABLE IF EXISTS `razones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `razones` (
  `id_razon` int(11) NOT NULL AUTO_INCREMENT,
  `razon` varchar(500) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_razon`),
  UNIQUE KEY `id_razon_UNIQUE` (`id_razon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `razones`
--

LOCK TABLES `razones` WRITE;
/*!40000 ALTER TABLE `razones` DISABLE KEYS */;
/*!40000 ALTER TABLE `razones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas` (
  `id_respuesta` int(6) NOT NULL AUTO_INCREMENT,
  `id_tipo` int(11) NOT NULL,
  `contenido` varchar(100) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_respuesta`,`id_tipo`),
  UNIQUE KEY `id_pregunta_UNIQUE` (`id_respuesta`),
  KEY `fk_respuestas_tipos_de_respuesta1_idx` (`id_tipo`),
  CONSTRAINT `fk_respuestas_tipos_de_respuesta1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_de_respuesta` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,1,'si',NULL),(2,1,'no',NULL),(3,2,'1',NULL),(4,2,'2',NULL),(5,2,'3',NULL),(6,2,'4',NULL),(7,2,'5',NULL),(8,3,'bajo',NULL),(9,3,'medio',NULL),(10,3,'alto',NULL),(11,4,'muy bien',NULL),(12,4,'bien',NULL),(13,4,'regular',NULL),(14,4,'mal',NULL),(15,4,'muy mal',NULL),(16,5,'mucho',NULL),(17,5,'medio',NULL),(18,5,'poco',NULL),(19,5,'muy poco',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_de_respuesta`
--

LOCK TABLES `tipos_de_respuesta` WRITE;
/*!40000 ALTER TABLE `tipos_de_respuesta` DISABLE KEYS */;
INSERT INTO `tipos_de_respuesta` VALUES (1,'Cerrada si-no',NULL),(2,'Escala númerica 1-5',NULL),(3,'Escala ordinal bajo-alto',NULL),(4,'Escala ordinal bien-mal',NULL),(5,'Escala ordinal mucho-poco',NULL);
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
INSERT INTO `turnos` VALUES (1,'neque','15:14:56','01:39:33',1),(2,'ut','23:13:14','01:32:11',1),(3,'dignissimos','05:35:02','11:09:39',1);
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
  `fecha_creacion` datetime DEFAULT NULL,
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
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6IlwvRWVUenJGRGJqSFZUXC9McjNLWmtkUT09IiwidmFsdWUiOiJVWjcrRUZ4VG1ySVllaUxPYno3RmFnPT0iLCJtYWMiOiI3MTYyMDFkNmFiMjI2MGQwMTcwODk1MDgxNGMyYWU4NTRmNThmMWIzMjk2ZjJjMzVhMzhhYmVlYzE2Mzg1N2RmIn0=',NULL),(2,1,2,'primer@controlador.p','eyJpdiI6ImtjUVpFUGVcL1Jwek9xbFZ4STI3YmRRPT0iLCJ2YWx1ZSI6IjU5WHVwaFwvSlhFOTlSS29nWTFoa2p3PT0iLCJtYWMiOiJiZTkwNTQ2YjcyMzdlNWU4YzU5YTVjNDcxY2I3OTI3ZjA4ZmVlYmYwNGEwNmE3NmY3MThmMWM2YzliMDE5MjFhIn0=',NULL),(3,1,3,'el@supervisor.p','eyJpdiI6IlFWSm9OTHgxSksyNGZxOEVlM1R4QlE9PSIsInZhbHVlIjoiSjdUZWlqMndFMFwvUmwrWUxSWk16MWc9PSIsIm1hYyI6IjNlZWM1YWFmNDNhODkyM2Q5MzFkYzVmYjQwZGY3YjEwZjc2NmU3NTAwMmM0ODA5YzlmZjljN2VlMGVmMTM2MDUifQ==',NULL),(4,1,4,'RR@HH.p','eyJpdiI6InZKOGxhVVlsdWM3bnBOcmlWTUQxZUE9PSIsInZhbHVlIjoiZnJsOUdwbXRqVnJkeUpZakZRRUpRQT09IiwibWFjIjoiNzU3N2QzYzcwMjNmMDAxZDdjZjc1NGE0OWFkY2Q4ZTk5MmEzMTlkOTlhNjZiMGM1ZDM1MTE0MWU2MGQ3MDhlOCJ9',NULL),(5,3,4,'friesen.aileen@hotmail.com','eyJpdiI6IlRKYW9nRmI5aVpBbHpqeVRLSXcraGc9PSIsInZhbHVlIjoiRXJjQ3FCS21nQkVpRDNOWW9FU2pyZz09IiwibWFjIjoiZGJlYzU3ZjlhOTczYjJiYzM1ZjBlZWRhMGRjZjI5MzVhOWYyZWE1ZjcwZThiZThjMmY2OGY1ODgzNmU2ZmM5NyJ9',NULL),(6,2,3,'vita01@little.com','eyJpdiI6IndqZlZLNGpRUjRmcmRabHNMM0Q5bGc9PSIsInZhbHVlIjoiWmE5SnQzNzBTY291NkVkRno4bHVJQT09IiwibWFjIjoiZTI5MTI1NmRlMDczNDkwYjE1OGZjOTljNTg3ZTc1YmI4Y2NhOWZkNWNlYjFhZTdkMTZhODBkNDY1YzBkOGZjYiJ9',NULL),(7,1,2,'carter.gleason@hackett.biz','eyJpdiI6ImtTMThxeVJnU3RyTTk3VlZlQ1NYZ2c9PSIsInZhbHVlIjoibHR6VVJyNFFIQmE5SzlvUHVcLzcxYXc9PSIsIm1hYyI6ImQ4MjIyMDM1NzU2NTQ3ZTM4ZTFkZGNhZDJhNTI3MGZiNTI3ODJjZjZiZTI4MmE3ZTAyYmE1YmJkYTI5NjMzNzcifQ==',NULL),(8,2,4,'cbins@yahoo.com','eyJpdiI6ImRJNDRzSmNtUHdTUlIwOFZcL0p1UDl3PT0iLCJ2YWx1ZSI6ImVtaFBtSjYrQVJYXC8yWWlMK0k3eTdBPT0iLCJtYWMiOiJlNjBlYzM3YzhlYmI3MDc0OGU4ZmE2NTNhYTJkNDk2MjhlZDM0NmY4ZTA1MGQ5YTQyYWI3YWQ5MTljY2EzNWQwIn0=',NULL),(9,3,4,'casper.myron@mraz.biz','eyJpdiI6ImhuQ1NSNms2dDVXdkhhVjR0TzNyOEE9PSIsInZhbHVlIjoiQ3V3ekNQWnhWWnpPWnErTHc4ckp5Zz09IiwibWFjIjoiNjU0ZmYzODU5NGMzMGM0OTg3NTg2YTBhYmEyZjVhNjRjMjY5NjFlOWY0YTU4ZThkZmI5ZjdjYzA4MDc2ODgwMSJ9',NULL),(10,1,2,'waters.katelin@stiedemann.com','eyJpdiI6IjV3M0VNcE9CWEJMOWRESUZ1S0FiWWc9PSIsInZhbHVlIjoidXdGYU9jK1Z3ZVpQTG5pWXZ5M1R2Zz09IiwibWFjIjoiNmY2NWY3M2M5YTc2M2U4ZjA3ZjdkODI5MjAxOWQ3ZTRkN2E3N2VhMWU4ZmJlMjI1NjFkMjBhYTU5OTYxYWM0OCJ9',NULL),(11,2,1,'ltoy@streich.com','eyJpdiI6IlQ4dWh1UXBRSzFcL2g0dEV2RnV2MDhBPT0iLCJ2YWx1ZSI6IjZ4QThPSG55K3A3UWJCZExIQnVueFE9PSIsIm1hYyI6ImQzZGMxZWI2ZDljNmM4NWE3ODFiYzJmODE0MWI0YzQ5MDdjMWYwZjBkMjA1MGI5MTRjNGMxN2ZiZjdjMjBlNzAifQ==',NULL);
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

-- Dump completed on 2019-09-26  0:07:40
