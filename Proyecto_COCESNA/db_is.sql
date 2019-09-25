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
INSERT INTO `personal` VALUES (1,'voluptas pariatur','eligendi aut','2000-06-15','1992-09-14','M','111',1),(2,'sint ipsa','quia voluptatem','1995-11-18','1992-09-14','M','222',1),(3,'quas non','illum ut','1986-12-18','1989-12-04','F','333',1),(4,'harum ducimus','quidem quo','1982-07-24','2015-08-20','M','444',1),(5,'velit rerum','omnis ratione','2003-03-19','1980-06-13','M','86',1),(6,'quas quam','quasi ipsam','2008-12-29','1991-09-08','F','820',1),(7,'nesciunt dolorem','optio qui','2003-12-02','2016-10-10','M','50',1),(8,'delectus temporibus','iste cupiditate','2006-07-24','1986-06-25','M','180',1),(9,'voluptatum cumque','molestiae omnis','1985-11-01','1975-06-01','M','794',1),(10,'provident dolores','veniam quia','1995-12-20','1980-05-14','M','812',1),(11,'aperiam qui','quo et','2001-06-23','2003-09-15','F','572',1),(12,'quod eos','corrupti unde','2004-12-18','1996-02-22','M','861',1),(13,'sit odio','facilis mollitia','1977-08-24','2014-11-26','M','209',1),(14,'laboriosam maxime','id vel','1976-01-22','1999-02-16','M','90',1),(15,'et adipisci','enim vel','1990-10-06','1995-09-08','M','686',1),(16,'aut molestiae','occaecati non','2003-05-08','2001-07-12','F','58',1),(17,'aliquam fugiat','odio neque','1982-11-29','1971-06-18','M','168',1),(18,'nostrum accusamus','sed nihil','2012-10-30','2014-09-24','F','993',1),(19,'dolore voluptatem','ipsum nihil','1988-08-17','2012-02-07','M','550',1),(20,'rerum consequatur','et eligendi','1997-05-01','2012-08-18','M','684',1),(21,'sit sed','cum vero','2014-07-29','1994-12-07','F','52',1),(22,'quo ut','ratione excepturi','2019-06-22','2014-05-01','M','221',1),(23,'ullam ex','ipsa velit','1979-04-26','2012-02-23','M','966',1),(24,'voluptatum exercitationem','est laborum','1992-03-17','2017-03-02','M','373',1),(25,'perferendis perferendis','perspiciatis repudiandae','2008-08-26','1974-02-03','F','447',1),(26,'sunt voluptatem','iure hic','1973-03-10','2018-05-14','F','449',1),(27,'qui repellendus','cumque aspernatur','1971-08-24','1998-07-24','F','234',1),(28,'at maiores','sint nihil','2005-09-29','1984-03-16','M','185',1),(29,'repellendus ut','aut eveniet','1999-09-13','1988-11-28','F','132',1),(30,'maiores neque','maxime fuga','1997-06-08','2002-10-17','F','137',1),(31,'suscipit omnis','pariatur a','2005-01-07','1987-08-28','M','435',1),(32,'esse autem','a neque','2013-06-15','1999-02-20','F','229',1),(33,'aut fuga','officia voluptas','1987-06-11','2006-01-13','M','609',1),(34,'veritatis voluptatum','harum voluptate','1997-01-22','2011-04-23','F','108',1);
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
INSERT INTO `pregunta_filtro` VALUES ('¿Estoy en forma para realizar el turno?','2019-09-24','2019-09-24');
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
INSERT INTO `turnos` VALUES (1,'sit','01:52:34','12:47:09',1),(2,'aspernatur','09:13:19','22:12:02',1),(3,'ipsa','13:20:49','11:47:19',1);
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
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6Ik1TK0hGZEVjUkxmcXlzWVJncWNYXC9nPT0iLCJ2YWx1ZSI6InViNVBkMkNkZTNETnhIQlZLTGdjM3c9PSIsIm1hYyI6Ijc2ZmQ1NmEwNTRiYzdlYTkyZGY4MjA1NTk4ZDI5YzNjZTk4NGI3YmFhODYwMmJjMjM4YTdmMjlhYmYwNWJkNGQifQ==',NULL),(2,1,2,'primer@controlador.p','eyJpdiI6IlRhZ01rNUhwanFtRUJIZ255MU01bUE9PSIsInZhbHVlIjoiQ0RtXC9DdWFFNUM0ckRla2t6b2pXVnc9PSIsIm1hYyI6ImI5ZmRiMzMyOWE5MDJlNzc0Y2JhNTlkMDNjYTA2NzQzYjM0MzAxM2ExMjVjNzkxMjcwNDY0NzI0NTY1MDc1MmMifQ==',NULL),(3,1,3,'el@supervisor.p','eyJpdiI6IjlMeUlBOFg2a2o5MDN3dVdvU1BEdHc9PSIsInZhbHVlIjoidGl4dVRcL3hOUWN6QlR0bm9Ea3Q4TUE9PSIsIm1hYyI6ImM3NDVjNDAxNzQxMmVlOTNkNWJlMmRlNGIyMDcxNDM3MmFlNWExYTIxN2M3ODJhZWNjZmQ1MGU2NWEzYWYwNjIifQ==',NULL),(4,1,4,'RR@HH.p','eyJpdiI6IjFWejNwaVhXTVFmZStFTmx0cFZqc3c9PSIsInZhbHVlIjoid3hHRjFxMDl4QTVYVHpHTEtzZWV5dz09IiwibWFjIjoiMTJmMzU0MzVmNDM3Y2RhNWRmYTkzYzE4NjVkMTRmMzA2ODc3MWU5ZGZkZjY0NzdiMGFlZWI4OTlhNGQ5ZDVkZiJ9',NULL),(5,2,1,'bridie.paucek@hotmail.com','eyJpdiI6ImpYdTZhQ0w5UkdlcnRzRzNZeTlrZ1E9PSIsInZhbHVlIjoiU1psXC9GMHI0cDJFZitzb1BsdElzYUE9PSIsIm1hYyI6IjI1NDBmYjBhMWZkYjczZGVhMWY5NGZmNWRlNzRlOGUxZDFmM2M0YTUxNGZmYWM0OGRmYjJkZTIxOThkZDM1YTcifQ==',NULL),(6,3,2,'winifred65@sporer.org','eyJpdiI6ImE5VFZrZDZXY2orb29RbU85alB1Q3c9PSIsInZhbHVlIjoid3ZcL1p2OTZRalJKSnpIclF0cmxPMFE9PSIsIm1hYyI6ImRiNjkzMjRhYjA0OGE0OTNhNjJhNWZkYTlkOGE3ZDU4NDlmZmI1ODJkMDYwN2M5ZGU1NjhlNzhhMDYyYjhkZDAifQ==',NULL),(7,3,2,'farrell.selina@gmail.com','eyJpdiI6IlVyUmN2aFwvZ2JYNWZyQkV3TnlEV0VRPT0iLCJ2YWx1ZSI6IjBGSXQ5TDlIQVgzKzE5bkpjdXZSSHc9PSIsIm1hYyI6ImZkNWEwY2U5ZWVkODJjZDQ1ZmU2NmYwYzBjNDFkM2I2MjdjMjU0ODFlZjA3ZDgyOGJjZjk1MmRjZDJkNDlmNGYifQ==',NULL),(8,1,3,'soconner@ondricka.org','eyJpdiI6IlpPa1JRVjZONUdKd0VoVDQ5bkMrc2c9PSIsInZhbHVlIjoiWUw5bHBydkg2YUZtRmVZMHdoMkhrQT09IiwibWFjIjoiYTdiMDNmNzczNTk5ZTE1MTdhNzE1ZjA4N2M5OWNiNWZiZGFjNWYwMWNjNDNmOThlNDE1YjVjNTVhM2IyYmM1OCJ9',NULL),(9,2,2,'lyric.gutkowski@gmail.com','eyJpdiI6IlR1dlRiMytOVmhqZGdQZzBzOUpsZGc9PSIsInZhbHVlIjoiSGI1SEZMNERBSm9pcVlUMkNEOGh2QT09IiwibWFjIjoiMTYwOWY4N2M5NjAwYTQwYWYyMjUzODAxM2JhZjJkNTY4ZTBiNjI2NWJiMzM1NmJjMDQ2M2RlZjg3Yzc2YmIyNCJ9',NULL),(10,2,4,'epfeffer@kunde.net','eyJpdiI6IjNTVlBLbWpHbzNIZlNRSUZBZ1Z3aGc9PSIsInZhbHVlIjoibStWc3hRT0lWN0RWMjdcL0pRc1lRRWc9PSIsIm1hYyI6ImQzYjQ2NjBkYjAyNDJiMzI4ZWM0YWQ1Y2ZjZDVkNjYzNTAyOTIwMDJjYzMxZWRkYzYyMmU0ODZlYjYxZWE3ODUifQ==',NULL),(11,1,2,'lgutmann@mills.com','eyJpdiI6Ikg4Zmt0SGtpN1lES3haWDJ3TjBaV1E9PSIsInZhbHVlIjoiN0s3QmkzSnhneWZWam5ycjB0OGlvZz09IiwibWFjIjoiYWJlOWY4Mzg4NzIxMDc4ZGVmYzNlZGU2YzQzMmNiMzRlZDI3ZjQ3ODBlMjA3ZWVlNTQwNzgyMmZhYjcxOWEzZSJ9',NULL);
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

-- Dump completed on 2019-09-24 19:51:51
