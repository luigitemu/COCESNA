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
INSERT INTO `personal` VALUES (1,'sapiente ut','aut reprehenderit','2003-07-20','1993-08-19','F','111',1),(2,'consequuntur sit','fugit est','1982-08-29','1996-09-09','M','222',1),(3,'recusandae aspernatur','earum ut','1976-09-28','1974-01-27','F','333',1),(4,'consequuntur dolore','consequatur rerum','2011-09-19','1988-12-25','F','444',1),(5,'eaque iure','eius ipsam','1992-07-27','1998-03-08','F','759',1),(6,'magnam dolorem','error laudantium','2006-06-02','1973-04-06','F','282',1),(7,'in iusto','perspiciatis sed','1976-02-11','1987-03-27','F','598',1),(8,'eveniet libero','aut atque','1975-11-19','2000-02-29','M','656',1),(9,'eum illum','aliquid occaecati','1992-05-24','1991-10-16','F','177',1),(10,'sit sunt','vitae quis','1976-01-14','2015-02-17','F','905',1),(11,'blanditiis voluptates','iure sequi','1988-02-19','2007-04-23','F','380',1),(12,'non molestiae','omnis quia','1995-10-20','1982-11-07','M','750',1),(13,'animi nam','perferendis fugiat','1977-08-02','1993-07-28','M','362',1),(14,'impedit corrupti','dolores eveniet','1970-09-24','2011-10-10','M','706',1),(15,'alias libero','vitae ut','2002-06-23','2012-10-25','M','269',1),(16,'dolor ipsa','sed placeat','1974-12-30','1970-01-21','M','327',1),(17,'ea et','eaque saepe','1972-09-09','1982-08-27','F','826',1),(18,'molestias et','hic nobis','2000-08-02','2011-09-30','F','20',1),(19,'sint inventore','rerum provident','1973-02-04','1984-01-27','M','196',1),(20,'distinctio et','itaque velit','1990-06-13','1981-07-26','F','668',1),(21,'quia in','id quia','2015-01-14','1978-03-25','M','765',1),(22,'voluptatem excepturi','excepturi et','1977-04-07','1988-02-08','F','8',1),(23,'quae enim','molestias quisquam','2016-06-16','1974-07-29','M','336',1),(24,'reiciendis porro','recusandae quia','2005-05-27','2011-06-23','F','58',1),(25,'dolore delectus','voluptatem in','2012-02-27','2011-04-29','M','557',1),(26,'consequatur ut','recusandae voluptatem','1987-07-24','2016-08-10','F','56',1),(27,'in odit','sit architecto','2015-06-16','1983-08-25','F','28',1),(28,'non dolorum','sequi perspiciatis','1992-05-01','2011-12-26','M','41',1),(29,'ipsum qui','quo eaque','1996-08-17','1973-12-13','M','213',1),(30,'id sunt','quibusdam voluptas','1985-10-28','2016-07-20','M','107',1),(31,'doloremque iusto','itaque esse','1982-04-05','2008-07-05','M','789',1),(32,'aliquam suscipit','explicabo sit','2010-03-08','2017-06-17','F','57',1),(33,'distinctio et','laboriosam tempore','2002-05-18','1984-07-04','M','746',1),(34,'deserunt commodi','quas voluptas','1983-07-27','2009-03-27','F','762',1);
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
INSERT INTO `pregunta_filtro` VALUES ('¿Estoy en forma para realizar el turno?','2019-09-21','2019-09-21');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,'si',NULL,1),(2,'no',NULL,1),(3,'1',NULL,2),(4,'2',NULL,2),(5,'3',NULL,2),(6,'4',NULL,2),(7,'5',NULL,2),(8,'bajo',NULL,3),(9,'medio',NULL,3),(10,'alto',NULL,3),(11,'muy bien',NULL,4),(12,'bien',NULL,4),(13,'regular',NULL,4),(14,'mal',NULL,4),(15,'muy mal',NULL,4),(16,'mucho',NULL,5),(17,'medio',NULL,5),(18,'poco',NULL,5),(19,'muy poco',NULL,5);
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
INSERT INTO `tipos_de_respuesta` VALUES (1,'Cerrada',NULL),(2,'Escala numerica 1-5',NULL),(3,'Escala ordinal bajo-alto',NULL),(4,'Escala ordinal bien-mal',NULL),(5,'Escala ordinal mucho-poco',NULL);
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
INSERT INTO `turnos` VALUES (1,'eum','17:03:21','09:43:32',1),(2,'tempore','06:10:04','21:52:52',1),(3,'tempore','01:56:02','14:03:57',1);
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
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6IlEzUGg1c0wzMUtnSDllbllaNDdnMlE9PSIsInZhbHVlIjoiSk93bzlaazhSRWxVaTdCV1c4NGNyQT09IiwibWFjIjoiYTg2NjVkMTUxNDFiNDU4NGNhZWY3YTAyYTI4Njc2MjA0MjczYjVlYTJjYmVkNTQxNWM1ODgwMDNlZTNkNmUyNyJ9',NULL),(2,1,2,'primer@controlador.p','eyJpdiI6ImdVQmJjbEdLZU1ZV0wwc2hXVVB4eXc9PSIsInZhbHVlIjoiSmRWVEVKWjdnOEt5Z2doaWQ5YTF6QT09IiwibWFjIjoiY2I0YWQwODJiMzM3YmZkYWIyODEyYjg1NDQ1ZTM3MzI1OTVjNjZhOTJmNDA0NzU2MzAzNjY3ZjYwZDMxODU0MSJ9',NULL),(3,1,3,'el@supervisor.p','eyJpdiI6IkxRY0F3ZXQ2UGp5bFNnTktYZXAyOHc9PSIsInZhbHVlIjoiRWM1eG1paHcxN0hNYTFvRXRIaExrdz09IiwibWFjIjoiYWFkYmYwNmU0OWZkNmI0OTFhOTAzYTBiZWEzNTVjZmYzODk1N2UyM2VjNTMyYmEzNTBlNTIyZDI1ZTFmOTQ0NyJ9',NULL),(4,1,4,'RR@HH.p','eyJpdiI6IkV4WjBDSHBsdit2MGdVNDBqZEoyTEE9PSIsInZhbHVlIjoiV1wvQnIrN3gzV1ZmVmV0dHJlU3ZISVE9PSIsIm1hYyI6ImNjYzcxYjJkYzIwNjJmYzEwZmE3YjI4YjFjYjg1NTRlZDgxOTVlZTJhYjhkNzUyN2JlODZhMTNhZGI5MzgzZDQifQ==',NULL),(5,2,3,'nitzsche.jerrell@marvin.org','eyJpdiI6IkhZSklCa09JY0dQVkZXQWx1NnB3Y0E9PSIsInZhbHVlIjoiTnd4a2xGdnh6SGdyNVg1MDhXbVlGQT09IiwibWFjIjoiZjU4ZDM1Mzg2ZWRlM2Y5OTE0MGQ1YjdiOWFhYWViM2ZiNDJmMDI1NjlkYTE3ZjY2NmYwOWZjOWZlODdiMWI0MyJ9',NULL),(6,1,2,'wehner.stephon@yahoo.com','eyJpdiI6Imc4ZXpqSERqU3BwclwvaGZBYWdtSk93PT0iLCJ2YWx1ZSI6IjlcLzNjRXk4UnR6bXZLQU8xV0hZaUZ3PT0iLCJtYWMiOiI5ZjQ1ZDI4Mzc3NTNhNzVkODdjMWY0ZmFjZTBlNTk5YTg2Nzk1ZDNmNmVkYmExZDYxNjhkYTVjYjA0NDkwZDM4In0=',NULL),(7,2,3,'hrempel@schuster.biz','eyJpdiI6IlZxYWNJc0ZPeVVJb0l4RmNETDF3NXc9PSIsInZhbHVlIjoiYjlZQm96TU1KSG1Ua05NeXNSc3pxdz09IiwibWFjIjoiN2ExM2ViYjlkNGNlNjU4NmVkNjZiNTkzNzQyYjk2ZDcyYzVlMmVjODE1NzVkNDNjZGFmNDRhMmQyOWZiMzkyZiJ9',NULL),(8,2,2,'donato.friesen@heathcote.info','eyJpdiI6InlwY2FTZHcyMmcrV2FDejVKc1wvZDFBPT0iLCJ2YWx1ZSI6IlhTQnZ0UlZ4czBpUVJtdVwvNHlGK1pnPT0iLCJtYWMiOiJlNTgyODUyMWUxOGI4Y2EyNGUxNWVhYTY3YTNiMjVmYzRlOWY1MTQ4MWQ2NWRmOTgyOWUwYWE1NzA1MTNlOWMyIn0=',NULL),(9,2,4,'strosin.nedra@weber.com','eyJpdiI6IlAyWTYydkNPcTliWDViRXJLS2E4dlE9PSIsInZhbHVlIjoiVGxiV0FoQUFOTWlhT3UraFJTaWRQZz09IiwibWFjIjoiODQwNDY2YTkxYjhkZDBmNjdjZGYwZjRmYzA2NWRhODE2ZTdhMWU3NTY5ODY4YTVlMTAwMWY5ZDU2MzU1YWFiMCJ9',NULL),(10,1,1,'hintz.ricardo@will.com','eyJpdiI6IlFXSWl5MHFtbWc5cTNXcEZtZkdPV2c9PSIsInZhbHVlIjoid2xCbUorRHZNN1E5KzlYTWdITzNGdz09IiwibWFjIjoiMTk1OTg5NzEyY2RiY2RlOTQwMThmNGNkNTI5MmM3MTM1MWZmNWY2NTE4NDBkYTdiOTZkZDVhMzU5YjhlMTNjMyJ9',NULL),(11,3,2,'goyette.sarah@hotmail.com','eyJpdiI6InlmeG9wSUJoKzlPTjNvUUFcL2tBRnhnPT0iLCJ2YWx1ZSI6InlGSlAxcEFYc2x6TnFHK1N1RWNHVmc9PSIsIm1hYyI6IjI3MDQxMWFhNDA5YTQ5NjJiNjI2ZDBlZGE3MDcwNmIxOGVmZDgzZWRjNjJkNzUzNjhjNDBkZTZhMDNkNmMwYTAifQ==',NULL),(12,2,2,'raynor.larry@yahoo.com','eyJpdiI6IjNRN2srY1I5M291aExzOElUVmlcL2lnPT0iLCJ2YWx1ZSI6IloxazErUnpUWU80Ulh2NkZTK1ltTXc9PSIsIm1hYyI6ImJmNDFmMjk5ZjA4MGQ1ODA1ZjZhNmNhODg2Yjc3MDM0NGY5MzA5NGY1YzZiMDZlNmM2N2IxZmU4MjNhOWNkY2EifQ==',NULL),(13,2,1,'jayce.hoeger@gmail.com','eyJpdiI6IjZnNHJzekZkRFAyTzJSXC96YWdSNGNBPT0iLCJ2YWx1ZSI6IlBKVHF6Y2ZjVUZrWWpDR2t2S045ZUE9PSIsIm1hYyI6IjVlMTRiN2RkOTkxZTI5NjFmYzYzM2IwOWVkYmRkZWM3MGIzZjExMGNhMzg1MmFiMzM1M2FiNmQ0NmUyYjMwZTQifQ==',NULL),(14,1,4,'guiseppe.watsica@yahoo.com','eyJpdiI6IlplV3VNaDVJd3p0bDNsK3M3Vzl6dUE9PSIsInZhbHVlIjoiZ2pBOFg2bDdEVDdZQ2JPSjlYdHBLZz09IiwibWFjIjoiZGE2MDEyZWM1ZjY4NmM5MThkMzU2MGIwN2IzOGU1NjFjYzBjYTE1ZjhiODI2YTRkNGM2Yjk5ODBlM2Y5ZTI5ZSJ9',NULL),(15,3,4,'wauer@mcglynn.org','eyJpdiI6IlBNaUJBVVE1XC8ybHc0R2czNFpNYjRBPT0iLCJ2YWx1ZSI6IjFuMkRzVGhzQmpOMkZ6cmd0a0RNWHc9PSIsIm1hYyI6Ijk1YTVmZjBhMTljMWUxZjdlMmY4NDdmNTI5Mjc5Y2Y3OTY4MTVlY2M0OWM4M2U0OTU3MDM4ZGM3MDc4ZDFkYmEifQ==',NULL),(16,3,1,'cronin.annetta@leannon.com','eyJpdiI6IjdKQ0R1MW1BM2R6UDdnNmUxV2tUeWc9PSIsInZhbHVlIjoieFBoTDVsZFY2enF2MTZIRlJaOWFqZz09IiwibWFjIjoiZWY0Y2ZhMjA4YmY5NTgzODRjOGIzNjA3YmU2YTNmOGIxMzMxZGVhMmJhYjNjZTM4MTk5NDkyZjk5ZTMxZGRkZiJ9',NULL),(17,3,1,'ortiz.lenore@hotmail.com','eyJpdiI6IlJ2bzJNdUt5UW1cL2NlQnI1SEFpYXNnPT0iLCJ2YWx1ZSI6Iko5Rkh3a3Y5cDBEdGp2U2l3aE1NTFE9PSIsIm1hYyI6ImM3ZDQ5ODIzYWFmMGQwZjQ0OTM3ZGU0ZTlkMmEwYjljZWQ4YTNhYmRmOTRmMzU0ZDhjYTU1NzVhYTAwOGE5NzQifQ==',NULL),(18,2,3,'jfeest@koch.com','eyJpdiI6Ik1TdFdFbXJ3WHBnTk9UejltVTNnTXc9PSIsInZhbHVlIjoiZVZ4cVRxQjZOQnc1RmdpbVdseW1oUT09IiwibWFjIjoiNDM4Zjk5MDhjMjEwZDQxY2IxZmVjODc3MmMwMWM0OWQ1YjA2MjEyYjAyNGE2MDYyYTYwMDFjYTBmZWNmMTk3YiJ9',NULL),(19,2,2,'nelda.schiller@sanford.com','eyJpdiI6Ikc5WTNzZ2hPTFZjTzlWS3lSNnVmSGc9PSIsInZhbHVlIjoiQklYUWdScWJuQUQrbHJxQTRMMVFmZz09IiwibWFjIjoiYzhlZGIxNmRiN2MyMDA4ODY4ZDUwMmZhYjY2MDgyN2RlN2ZjOGFlZmIxODg5M2JhZGFiZmNmYmNlMWViOGRiMCJ9',NULL),(20,2,2,'mafalda82@mayer.info','eyJpdiI6IkttOXlhWHNBVmVBNEZyeDFqbmlLd2c9PSIsInZhbHVlIjoidnIxbVkzc3JPSXJHRVdKaXVUY29zdz09IiwibWFjIjoiMmQ0OGFmNjRiNmEwNmNmNWZlMWVmZWNmNmJhNmFkZDFlODZmODI5Y2QwM2Q5MGFjYzY1OGMyNWIwZmMwYWY4NyJ9',NULL),(21,1,2,'koepp.maximus@gmail.com','eyJpdiI6IlZyQVRXN2FSMzRicWQrVHl1VUlcL3lBPT0iLCJ2YWx1ZSI6ImY1bmJibXNaT1wvN21aOWJtVjk1b0RnPT0iLCJtYWMiOiI2NGQ4YWY1MDgxMWQwZTdiYWFkOTk0MDQwMmQ0M2Y5M2NkNzgzMWY1MzRhNmE1MTU0MzRmNWViZmFmZWE0OTZkIn0=',NULL),(22,3,1,'bell.heaney@yahoo.com','eyJpdiI6IitvT1NETkZMREJWMHFUS3BBNHAxQUE9PSIsInZhbHVlIjoiM01GZDJYeE9XUFVjczNnWENIYzd3QT09IiwibWFjIjoiY2VmYzhiMjAzZTkwMjFiZTIyODY4NDgwOTM3YzVlMjAwZTNlN2U2MWFkMGU5ZWNmNWJiY2UzYmIwMGE4ZGEyOCJ9',NULL),(23,2,1,'xgorczany@spencer.biz','eyJpdiI6IjdpS0VMaHpRaUk5N2t6M25Ua2ZpaWc9PSIsInZhbHVlIjoicHJUUjhFbnA1UTdzR1wvRzJ4eDY0Z1E9PSIsIm1hYyI6Ijg2ZDk2OThmOTEwM2Q0NzA1OTdlZTI4YjRkYTJhNjk3MTMwNmU2ODY4MzllZmM5M2ZiZDU0ZTQ3YzhmNDM1MTQifQ==',NULL),(24,3,2,'ana.brekke@hotmail.com','eyJpdiI6InVUeEhSWG1rbEVxeVwvT3dFeE8rcTJnPT0iLCJ2YWx1ZSI6InFYM3QzT1wvclwvQndGMWdRWE54eklCZz09IiwibWFjIjoiZjIzMTlhYjBmYzJjNzViN2NjMGJhYzVhZmE0N2NmZjU1OWUwOTQ2ZWZhMThhNTczZjgzZTA2YzdmY2Y3NzVlMCJ9',NULL),(25,2,1,'abbott.luciano@bartell.info','eyJpdiI6IkZUU1U2Mkx5bFZNMFU1S2NxV3czN0E9PSIsInZhbHVlIjoiY1JPSDIxVVh3VWFyNnRmTEMrUllyZz09IiwibWFjIjoiMTM4MTQ5M2EzMzU4NTRiOWQyOGJiZTdjNjhjNmY5NTkwZDM0NWU0N2VhOWFmYTE2NzA2YTFiNjVjMjhkNjcyOSJ9',NULL),(26,3,1,'ullrich.braeden@kunze.org','eyJpdiI6IjdvcUVvU0pIWktqQWV1ZDU4XC9WeWZnPT0iLCJ2YWx1ZSI6IjJGVVhHemMwbFgrYTcxT1JTeUg5N3c9PSIsIm1hYyI6IjUyNzFjZWIwN2M3MGZlNmZhNjE4MDlmMGIwYjc4ZjM1MGVmMTMwMTliMGM3NDkxODI3NTBmYTRlNmQxYTU0YzUifQ==',NULL),(27,1,1,'jswaniawski@gmail.com','eyJpdiI6IkFBajNsa1IwTDFvM1M3d0tVNmtHY3c9PSIsInZhbHVlIjoidm84bElXRnRER1FoV05KVDh1dWJydz09IiwibWFjIjoiYjljOTc1ZWYyMGU2MGZiMmZmMmFlODJlMDBlMGMzYTIxZmQwNGIxNzZjNzJjNTVkMjA1YjFlMmU3MmI3OTM4MCJ9',NULL),(28,3,2,'gchamplin@hotmail.com','eyJpdiI6ImlRcGRNUFhtWVY1dUxhcTNqY0tVOVE9PSIsInZhbHVlIjoiTG1zZkZpdXllWnF1SkNyQ0x6S1pyUT09IiwibWFjIjoiMDczOTA2ZDYxYjExM2RhNzdmYjI1Y2MxZjhiNzZiMGVmYzcyOTg1ODJlMjY0NDQ5MTM2YTgxN2YyODVkMDVjNSJ9',NULL),(29,2,1,'marlin.turner@gmail.com','eyJpdiI6IjhDRnNmdWJFWnowV0hBVTg0Q1wvU0xRPT0iLCJ2YWx1ZSI6InhKOFwvaHdJcHorNWVlQXM5bmxxYnl3PT0iLCJtYWMiOiJjYzBiYmEzMmFhNTgwMzk2ZGVhN2YxODAzZmIxY2FhZGJiZTYzODU0YWE2OTAyOTI0YjYwNDdhYTk5Mjc3ZGEzIn0=',NULL),(30,2,1,'layne86@predovic.net','eyJpdiI6IjN4ZUVkSUo3eVA0TWJSck5cL1NLWlpnPT0iLCJ2YWx1ZSI6ImpmWUtcLzFZYlRQYTNqNDNjSXdVcW1RPT0iLCJtYWMiOiI4Yjc1NGYxNGRlYmZjNGU3OGFkMDkxNWVlMjQ5MjljODhmZDJhZjgwY2M2YjU0ZDY2OWNhYzVjNWJkYmIzYTgyIn0=',NULL),(31,2,2,'usatterfield@gmail.com','eyJpdiI6IjNCbkVcL2hSS0l6ck5aMTVcL1ZjcTVndz09IiwidmFsdWUiOiJcL3FaVzd5M1l4a2NURjlyRUFEVWVXdz09IiwibWFjIjoiZTg3NGRhNWI4ZWQyMGFjNjkxNmU1MDEyMGM4MmUwY2FjN2ZjZTY2ZDRkYTAxMTk1MTU2MDk4MTMxMzlmYzdmZiJ9',NULL),(32,2,3,'dooley.franco@dach.net','eyJpdiI6IlZxbjYyS1A3MFBoRkVBXC8wdUhaUUxRPT0iLCJ2YWx1ZSI6IjdhRnFmYU4rTFZWUlZhVEZPMWRxMmc9PSIsIm1hYyI6IjI1NGVjMGM5NWRkOTNkYjlkNGQ3ZDNhN2FjMDkzY2VlYWE5NWFlNWVjNmYxMjYxM2EzNGMwMTQ3OWIxZWQ2YWMifQ==',NULL),(33,2,1,'daphney96@gmail.com','eyJpdiI6IjVHTitLTExNb0RBRlRLb0tuNGF1N3c9PSIsInZhbHVlIjoiclZmMHdhZ1RwMnVHaU14RE40ZkozZz09IiwibWFjIjoiZmQ1ODBhNDNmYjc2NjEwMjhkY2RiNzcxNjY4ODUyZDc0YzIyMTQzZGYzNDVlYmYxYmQ1ODQzYzYyMDdhNTJlOCJ9',NULL),(34,1,4,'carolyn96@larkin.com','eyJpdiI6ImZWXC9LZmFtNzA4ZFJNRm1HTk52RWNRPT0iLCJ2YWx1ZSI6InNXcm8wTmNJSSt3enFUZEd0SHpOelE9PSIsIm1hYyI6ImViNGQ2N2RmZDkwODYzNTczNzM4ODFhOTkxNmM3MDAzODFkMzI0MDBiNTc4MmQ5OGVkZDkyNzBhZTk0ZTIxMWMifQ==',NULL);
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

-- Dump completed on 2019-09-21 12:39:27
