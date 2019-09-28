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
  `id_perdida` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `personal` VALUES (1,'cum iste','cupiditate officiis','1983-07-29','1979-06-13','F','111',1),(2,'quod id','optio ut','2002-05-16','1972-07-08','M','222',1),(3,'veniam officia','cumque eveniet','1971-07-12','2002-02-12','F','333',1),(4,'quaerat laborum','provident est','2019-02-15','2016-10-22','M','444',1),(5,'culpa dolores','id aut','1996-04-10','2017-01-16','F','460',1),(6,'sit et','et molestiae','1985-07-30','2007-08-13','M','410',1),(7,'repellendus sint','qui aut','1982-12-18','2009-04-21','F','817',1),(8,'est et','aut quasi','2002-04-09','2008-01-20','M','745',1),(9,'aperiam in','quis repudiandae','2000-05-16','1973-07-18','F','565',1),(10,'suscipit earum','dicta dicta','1993-03-24','1972-08-21','M','896',1),(11,'ut voluptas','id fugit','1998-02-02','1972-10-22','F','728',1),(12,'quibusdam molestiae','a dicta','2013-09-06','2016-01-25','F','827',1),(13,'id voluptatibus','accusantium voluptatem','1973-03-22','2019-07-12','M','433',1),(14,'sapiente aut','dolores doloremque','2007-09-16','1984-10-03','M','593',1),(15,'rerum beatae','et sunt','1974-07-13','2005-07-06','M','1',1),(16,'nihil hic','praesentium facilis','1996-09-23','1976-08-04','F','590',1),(17,'fuga fugiat','provident ipsa','1975-05-14','2002-10-27','F','770',1),(18,'et ut','eum voluptatibus','1998-12-28','1973-05-13','M','241',1),(19,'distinctio rerum','provident dolorem','1972-07-05','2009-06-30','F','992',1),(20,'dolorem expedita','inventore voluptate','2007-08-14','2018-04-11','F','139',1),(21,'dolorem eos','sit id','1985-03-02','1995-10-27','M','147',1),(22,'aspernatur eos','laborum quidem','1982-10-27','1970-06-15','M','158',1),(23,'quia consequatur','maxime commodi','1979-03-13','1978-12-12','F','733',1),(24,'vero ea','ratione perferendis','2004-04-13','1977-12-08','F','86',1),(25,'ut sit','saepe distinctio','2006-04-01','2000-11-30','F','399',1),(26,'architecto praesentium','est numquam','2016-08-16','1981-11-25','F','224',1),(27,'aspernatur est','odit ut','1993-10-10','2003-09-27','M','257',1),(28,'nesciunt officiis','officiis qui','1990-01-18','2013-11-27','M','716',1),(29,'quia ea','aliquid possimus','1983-10-04','1980-04-04','F','891',1),(30,'magni incidunt','harum exercitationem','1972-06-07','1971-07-24','F','94',1),(31,'rerum facilis','magnam incidunt','2017-02-01','1995-05-04','F','604',1),(32,'totam ratione','repudiandae a','2017-10-31','1989-01-19','M','387',1),(33,'reprehenderit est','vel qui','1977-02-02','1983-07-05','F','63',1),(34,'maiores velit','neque qui','1982-07-03','2001-11-17','F','211',1);
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
INSERT INTO `pregunta_filtro` VALUES (1,'¿Estoy en forma para realizar el turno?','2019-09-27','2019-09-27');
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
INSERT INTO `turnos` VALUES (1,'ea','03:53:15','23:43:07',1),(2,'facilis','10:23:05','01:10:55',1),(3,'blanditiis','13:43:09','05:41:09',1);
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
  `nuevo_intento` tinyint(4) DEFAULT '0',
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
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6IklPeUtKMlpaVlhcLzZ4VTc3czZtaTBnPT0iLCJ2YWx1ZSI6IkpubDdTVjdPN2QzRVV4S1F2SGRqZGc9PSIsIm1hYyI6ImNlZWZiYTFkY2Q1MmRiZWE3MjJhYTEzZmExMjA4N2RjZDhjYTY4OTZlODViNzhlMDAwNDI0OTNkMTg2YWE4ZDMifQ==',0,NULL),(2,1,2,'primer@controlador.p','eyJpdiI6Ijk1NkJ1ZE9FNFAxV1VYbldVcDVPQkE9PSIsInZhbHVlIjoiYlVJdnp3NzFMaW1BNzMreDV3ckVmZz09IiwibWFjIjoiNWMzY2Q1Y2RlOGVmNzgxM2RmNDNkZWM3YjEwMGZlZTVjY2IxMmNmNDY5MmM3YjQwOWQ3M2Q4ZDdiOGMzNDQ1NiJ9',0,NULL),(3,1,3,'el@supervisor.p','eyJpdiI6IkF0U1FTT1N0MG9wT2dqSUw2U3hWUXc9PSIsInZhbHVlIjoiazZ6b0EzRGJEdEQ2cXl1WEdcL2xGMlE9PSIsIm1hYyI6IjY2MzcwNmEwODIzNGRlNmUyYjI4MjY1ZTMzZDJiOWRjYjI3MjVkNjBhM2YwMmVjNjUwOWJhOThjN2E0OTljMjQifQ==',0,NULL),(4,1,4,'RR@HH.p','eyJpdiI6Im1nc2xrXC9QdjdZVVdjNUxaT3JkZlhnPT0iLCJ2YWx1ZSI6IjBWSzJEdjM0XC9IbGs3aWxKRm1raWp3PT0iLCJtYWMiOiJjMTkwMGU2OGQxMWNjZWQ3NDI3MDczNjJlODQzOWQ2ZjExNjg4YzFlOTBmMTI1YzU0Y2FlNWFkYmQxYjQ3MTRhIn0=',0,NULL),(5,1,1,'mona.crona@hotmail.com','eyJpdiI6InZNeFhNWmxVUFRUVHh2VTJGeVd3N1E9PSIsInZhbHVlIjoiTGJaanBZVG1vUEcrcVFsUE9idm4rZz09IiwibWFjIjoiZWE3ZWJmZmM3MGRhOWQ1MzFmZTM3OGQwMjYzZmZhMDdkYzk1ODM4NmVlMDZkNjUwZWNiNGY0NWY2Mzc0ZTFiNSJ9',0,NULL),(6,1,3,'kuphal.amie@paucek.net','eyJpdiI6IjJNa2lkSWs4aVwvTnNDMkhBREFSbU93PT0iLCJ2YWx1ZSI6IkZ3SWJ4TFZwcXBuRDRIUXdBMUFqd3c9PSIsIm1hYyI6IjJmNDg3NDM3ZjJhODRjMjJiY2JmZGMyZDlhOGNiNDdmYWQwOTNmY2JjZmNlZGJkZWEwZmI4ZDYyMjkwNzc2Y2MifQ==',0,NULL),(7,1,4,'minerva.hintz@yahoo.com','eyJpdiI6IlwvVUZwRVFzeXgyd01RbGM3dEV0bzdBPT0iLCJ2YWx1ZSI6ImlnTmFHUHFxM0Y4dE8xUE5RWitNSnc9PSIsIm1hYyI6IjBmZTc4ODQxNWQ4Y2E0MjNkMmMzOTI5MDI1NGNmYjQyMmIyZDExN2ExMjIxMGExMGJiZmM1ZjU2NzA2MzAyOWIifQ==',0,NULL),(8,2,1,'xthiel@mertz.com','eyJpdiI6IlN2K0FkYlRWdEwxSDFSUHJWa29xUGc9PSIsInZhbHVlIjoia0Z6UjhZOWpcL0FQSUk3SElFbnhkYmc9PSIsIm1hYyI6ImM0NWYyNDhmMGE2M2QzZDUzMmE2NmM0MWM3NjRkZmI1YTYwZTJmYzAzOTNhYTM2NjVjOGVmZDJlZDNhZGMwZjIifQ==',0,NULL),(9,3,2,'sanford.lavern@yahoo.com','eyJpdiI6IlpWa2hpc1l2WU5QUXpTaHNDeVh2WGc9PSIsInZhbHVlIjoiZFN1OVNyd0MxalB0eUd2SXhTeWZNdz09IiwibWFjIjoiNmE2Yjg5YzZmOTU0YWI1ZmRhZDk1NDY4NDc3YzFlNDlkZGM5ZDkyNWIzNzg5ZTAyMGVjZDVhNzJjMTg0YjE1YSJ9',0,NULL),(10,2,2,'hlittel@morissette.com','eyJpdiI6IkpNT0I3YTg5ck9RUTNvODY5alZ4UUE9PSIsInZhbHVlIjoibU85QnE4WFdWeDJjdkx2ZG00Z1E1Zz09IiwibWFjIjoiYTNiMmVhZDBkZjcyMDQxYmNmZGEyNDVhZjYxMDA1OGUwYWZlOTA2NzE1ZTFlMzdjNGI4YzMzYTBjOWJhNjlkYSJ9',0,NULL),(11,1,1,'pedro.jenkins@heidenreich.com','eyJpdiI6IjRSTXRlSWR2OHRuNXJyeHpMamlvcGc9PSIsInZhbHVlIjoiR3R3clVhNzN1YW1WY0pBc3ZrTEhxUT09IiwibWFjIjoiOWFiMmVlYWNhMjlkNDVkY2EzM2Y0NmU3MmI1YjEzODI5MGYyNTg5NmNiZjU2MmY0Zjc3ZTc0YmEwMDc3NWUyMiJ9',0,NULL);
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

-- Dump completed on 2019-09-27 20:46:01
