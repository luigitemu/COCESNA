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
INSERT INTO `personal` VALUES (1,'placeat vel','consequatur alias','2016-06-02','1974-11-25','F','111',1),(2,'autem non','neque veniam','2017-10-15','1999-10-02','F','222',1),(3,'est libero','veritatis qui','1992-05-18','1987-12-18','F','333',1),(4,'vel iure','alias minima','2014-06-28','1980-02-19','F','444',1),(5,'labore sapiente','aut id','1986-02-02','1982-11-12','M','553',1),(6,'illum praesentium','omnis adipisci','2014-10-18','1982-11-21','F','491',1),(7,'doloribus voluptatem','quasi aliquam','1984-09-14','1977-02-06','F','611',1),(8,'quia quam','ipsam eos','1993-01-15','1972-10-07','F','981',1),(9,'et facilis','quae ex','2011-07-13','1978-06-19','M','467',1),(10,'possimus dicta','et eos','2016-05-22','1995-08-04','F','463',1),(11,'soluta est','nostrum enim','2000-06-22','1987-12-04','F','161',1),(12,'accusamus repudiandae','beatae autem','2015-11-22','1991-04-11','M','33',1),(13,'sequi tempore','voluptas omnis','1978-07-01','2015-07-22','F','841',1),(14,'quo officiis','dolorum quod','1986-10-15','1991-04-02','M','644',1),(15,'omnis labore','laudantium cupiditate','1983-12-30','2012-07-11','F','903',1),(16,'ut necessitatibus','dolores vel','1971-04-29','1981-03-02','M','500',1),(17,'voluptatem labore','voluptatem ipsa','1985-05-09','1999-03-12','M','958',1),(18,'qui ut','quaerat harum','2008-04-01','2003-10-17','M','714',1),(19,'sed odio','est at','1981-05-18','2004-09-26','M','377',1),(20,'quisquam voluptatem','est iure','2015-04-20','2017-12-20','F','656',1),(21,'quae enim','placeat eum','1995-05-15','1994-04-05','M','137',1),(22,'in ut','id voluptatem','2017-04-13','1978-03-22','F','256',1),(23,'voluptas laboriosam','aut vel','2000-12-27','1988-02-10','F','270',1),(24,'iure dolor','ea magni','1991-03-30','1979-07-07','M','288',1),(25,'non sapiente','et quae','1997-10-22','2003-01-04','M','166',1),(26,'vero hic','ipsam iste','1992-02-21','1980-05-19','F','143',1),(27,'cum cum','earum et','1991-09-22','1996-09-30','F','617',1),(28,'aut ducimus','impedit praesentium','1998-06-09','1990-11-15','F','668',1),(29,'accusantium ducimus','accusamus repellendus','2013-03-31','1972-07-22','M','952',1),(30,'enim omnis','necessitatibus quos','1973-09-23','1998-07-21','M','673',1),(31,'nihil voluptatem','nihil omnis','2012-04-18','1997-04-30','F','404',1),(32,'corrupti vitae','eius aliquid','1989-12-23','1981-12-11','M','835',1),(33,'exercitationem omnis','non ut','1970-05-07','2008-08-09','F','333',1),(34,'natus quo','voluptate excepturi','1972-03-07','2010-01-18','M','474',1);
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
INSERT INTO `pregunta_filtro` VALUES ('¿Estoy en forma para realizar el turno?','2019-09-19','2019-09-19');
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
INSERT INTO `turnos` VALUES (1,'hic','20:11:38','12:45:20',1),(2,'architecto','10:26:54','19:43:05',1),(3,'molestiae','14:21:52','14:41:59',1);
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
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6InV2Rm5JR1RNNGlvRCt3M25SV0FWR0E9PSIsInZhbHVlIjoiTUVPWXYxOU9cL1JVU2p6MWhYMGs5cmc9PSIsIm1hYyI6IjFlNDgzNzJhODM5ODA2OWUyNGNhOWU3ZDJkMjI0NzkwNWI1NjEzY2MwZjY3N2ZhZDcwOWE5NDQ3NjcwMjhmZTMifQ==',NULL),(2,1,2,'primer@controlador.p','eyJpdiI6IkxMWHlBY3hxeTZIZVwvMUdwcFVsNGp3PT0iLCJ2YWx1ZSI6ImZcL1wvRmNmYVJpNXBYWmFVUDdpUndYdz09IiwibWFjIjoiZWU0ZDM0Mjc3NTY0NjY0ZDVlZGE4NzkxY2IyZmVhOTYxZWU0MDE0YTU5YzkyM2Q2OWNjMDI0OWVhZmY5NjFhNyJ9',NULL),(3,1,3,'el@supervisor.p','eyJpdiI6IkhQQnM4dWVSblI5ZHZhRGJzRXVqN2c9PSIsInZhbHVlIjoiRk1NbGZWeHFPSE5mc2daVzM1U1NyQT09IiwibWFjIjoiMjcwYzRhZWE1ZjAzNGQ3OTk4NjgwNWJlNTM4MGMxYWQ0NmQ1YTk0MWUxOTUxYzU2MjJhMDkwNDM4NWY0ZTM0ZCJ9',NULL),(4,1,4,'RR@HH.p','eyJpdiI6ImM3RGQ3VDVtVTNscDk4VnU5TlU4Z2c9PSIsInZhbHVlIjoiR0RteldXRXlyK0hrQVdZU3h1S05Idz09IiwibWFjIjoiMmE3YzhkZjE0MzdhMTEzMmVjMjhkNWVmMmQ1YzVmYTgxMTFiOTYzYjIwOTg5OGU3NGNmZjczNDk4ODg0NGYwYSJ9',NULL),(5,3,1,'mafalda78@weimann.org','eyJpdiI6InhGY25EVXJJWHExZTVTRlwvU1RKd1FnPT0iLCJ2YWx1ZSI6Im9MZ3pLdHQ2VURVK1wvbG9RZUxlNEF3PT0iLCJtYWMiOiI5YTc4ZGFjZTBkMzUxMDY5YzU3NmRhYzBmODY3ZTdiNDlhMjY4ZjgwNGQ4NDljZTlhZTA3Mjg4NzNkNjI5NDFjIn0=',NULL),(6,1,4,'hermina.connelly@weber.biz','eyJpdiI6InBjaXhaQ0c5dHFuYmNzYlArd1cwMUE9PSIsInZhbHVlIjoiY1JMYjZqMVJVVVwvZWdmK1NJYndSUmc9PSIsIm1hYyI6IjM1ZjVhZTkyMDlkNzUzYTgyNDU2YzA2YTY5Y2VjZmU0ODNkMDU0NDc3NjRhOTA3YTYyZmM4NDQxMzE4NjAxNTIifQ==',NULL),(7,3,4,'fwunsch@spinka.biz','eyJpdiI6IjRqdjlBbmNEV3p5VXZ3WjMyZ0ZQUVE9PSIsInZhbHVlIjoidTVVSFFcL0d1TFJ6NGxrU1Y1WVJucnc9PSIsIm1hYyI6IjA4MTMyYjk2YTYwNjI1NGIxY2Q2ZDcyZjY4NTRhMGQwZmU2MjA1NzY2MGVmMmJjZTdmZDIxNTI2MzRjMWZkZmQifQ==',NULL),(8,3,3,'henri81@gmail.com','eyJpdiI6ImpwdlwvVVdRSEVESzlhVExnZzh5dTNRPT0iLCJ2YWx1ZSI6ImQzYzc4Vm1VXC91WFNSeUpHbFJXaXV3PT0iLCJtYWMiOiJlYzViMzIxNjhmMmU5Yjk2ZDA3OWM2ODY2YWRjM2NjODM5ZDk4MmUzOTRjNDViOWUwYTZlNjZhOWJiNTIwNjVkIn0=',NULL),(9,2,3,'asha78@reilly.info','eyJpdiI6IjV3dHdtbGZjdUZOdWVnVHB6bUpJc1E9PSIsInZhbHVlIjoiMUdqUWhrcGRBNVhuczdYWXhOdWVqQT09IiwibWFjIjoiZTAwMDg4NzgxODUyZTJhYTAzN2VmZDk2ZjcxN2Y2YjhhNjFiZjA5MTEzNmEwOTY0MjJkZjc3ODYyNGQ0ZWRmYyJ9',NULL),(10,3,4,'stacy.sporer@gmail.com','eyJpdiI6Ik5VXC8rUjdOamJubkpmMzk5NnNTbHVBPT0iLCJ2YWx1ZSI6IlNTYk5KSkJqNXFyXC9keDVcL2pcL3lvdEE9PSIsIm1hYyI6ImRkYjg3NGY5Zjg4N2Y5YTU1NWVmNzBiZTFkNTU1NjA3ZDU2YzgzMmQxZjRjOGYzYmI5MGQxM2MyZWQwNWRiNmIifQ==',NULL);
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

-- Dump completed on 2019-09-19 21:02:33
