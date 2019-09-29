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
INSERT INTO `personal` VALUES (1,'ab quia','tempora earum','1976-01-22','1989-06-27','F','111',1),(2,'odio rem','aut voluptates','1997-05-29','2011-06-03','F','222',1),(3,'nostrum molestias','laborum et','2016-12-07','1998-12-10','F','333',1),(4,'consequatur facere','qui est','2011-08-11','2008-03-19','M','444',1),(5,'recusandae iure','nihil perspiciatis','1973-12-25','1981-10-31','M','354',1),(6,'officia quis','ab facere','1983-06-19','1995-06-21','M','702',1),(7,'consequatur sequi','corporis error','2002-08-10','2017-03-06','F','15',1),(8,'perferendis eum','illo distinctio','2005-10-19','2001-05-22','M','271',1),(9,'et repellat','perferendis fuga','2015-06-22','2015-02-25','F','603',1),(10,'omnis ut','vero laboriosam','1989-12-28','1987-12-18','M','605',1),(11,'omnis voluptas','perferendis labore','1978-01-29','2012-04-15','M','331',1),(12,'voluptatibus dolor','minus impedit','2014-06-04','1979-03-17','F','822',1),(13,'totam ut','perspiciatis quia','2014-09-26','2012-10-16','F','561',1),(14,'ut est','non dolorem','1980-05-11','2003-11-12','F','758',1),(15,'magni et','distinctio dicta','1990-05-26','1984-07-09','M','449',1),(16,'ut corrupti','tenetur laborum','2008-04-07','2000-01-29','F','102',1),(17,'asperiores natus','molestiae laborum','1999-01-28','1994-06-01','M','747',1),(18,'qui ipsa','voluptatem provident','2004-09-27','1977-10-28','M','208',1),(19,'id necessitatibus','modi culpa','2004-04-14','1979-03-05','F','574',1),(20,'est et','quia voluptatem','1971-01-26','1996-01-15','F','493',1),(21,'excepturi consequuntur','rerum voluptas','1986-02-21','2005-03-19','M','474',1),(22,'non velit','deserunt optio','2011-04-14','2012-05-27','F','13',1),(23,'dolorem magni','consequatur tempora','1983-03-31','1986-04-02','M','549',1),(24,'voluptatem sed','itaque sed','2002-12-28','1984-07-05','M','388',1),(25,'necessitatibus esse','nobis unde','1979-06-22','1989-05-22','M','269',1),(26,'optio omnis','quia fuga','2007-05-31','1976-10-26','F','880',1),(27,'illo eos','et sed','1997-02-19','1994-10-07','F','704',1),(28,'modi sit','fugiat molestiae','1990-06-27','2012-07-18','M','815',1),(29,'delectus inventore','ipsam eaque','2007-04-03','1990-08-02','F','647',1),(30,'laudantium laborum','in aut','1978-04-27','2002-01-13','F','342',1),(31,'fugiat debitis','voluptatem accusantium','1979-02-19','2015-03-16','M','996',1),(32,'illum aspernatur','nam dolor','2002-07-18','2003-04-21','M','769',1),(33,'qui voluptas','adipisci officiis','2011-08-20','1994-08-31','M','838',1),(34,'voluptatem id','quidem omnis','2002-07-09','1989-03-17','M','90',1);
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
INSERT INTO `pregunta_filtro` VALUES (1,'¿Estoy en forma para realizar el turno?','2019-09-28','2019-09-28');
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
INSERT INTO `turnos` VALUES (1,'et','20:30:04','04:13:57',1),(2,'tempore','22:48:50','16:10:03',1),(3,'commodi','23:28:23','07:33:48',1);
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
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6ImY4dUEwWVB0Z1NnXC94VWEwdTZUYk9RPT0iLCJ2YWx1ZSI6Imh5TjRXXC9icmkxa1VYdUU5U3AwUlhnPT0iLCJtYWMiOiJlMDJiZThjNTZjYzAyOTU4NjFiZDQ5MWQ1MDMxNGVkOGY4ZmMwYTMzMDJhYWY5ZjUzNGViYzY3ODE3MjUzODcyIn0=',0,NULL),(2,1,2,'primer@controlador.p','eyJpdiI6IkcrbENEMGJyWGxFQzlTQUFXUUg3dnc9PSIsInZhbHVlIjoiNnp5TTRTamlLbmdwUWRURENZRDlyZz09IiwibWFjIjoiNmQ1ZDZmNzVkYmY5MGYyMTU2YzIyM2NlYWQ5Y2VhYjUyMjFhYmIwNmI5ZWMzMGFjYzI0ODQ2NTNlYWJmMGNmNSJ9',0,NULL),(3,1,3,'el@supervisor.p','eyJpdiI6InEzbEU0Z2p1TUJ3YzVGUmRRc2w4RUE9PSIsInZhbHVlIjoiRTVRa0I5RXVsV1Y1SnhrTndXQ1l1QT09IiwibWFjIjoiNWM1OWZmMDViYjVhYTBhNGVlMDc3MDM2ZWM0MzZiN2NjNTU3OGM1ODI4M2E4MDQ4YzNjYjExMzlkMjVkM2JmMyJ9',0,NULL),(4,1,4,'RR@HH.p','eyJpdiI6IklqY0lBZzRDWXlsXC9WR0NmS25IMnV3PT0iLCJ2YWx1ZSI6IkZtalpnYW02QUxXajhIWEoyR3FJMkE9PSIsIm1hYyI6IjYyN2Y2YzJlYWFjMDQ3OWM5ZDdlM2Y0ZmM4MTUwZmVhZGZmMzZmNGVmYWY2OTQ2MjI0NTRjYjc5NzhhZjc2OWQifQ==',0,NULL),(5,2,4,'hahn.rhea@hoppe.com','eyJpdiI6IjdvVkhXKzJSS1RROGRSdXliSksrYlE9PSIsInZhbHVlIjoiS3g1OUZpRnk1QnRuXC9XdFpSUVk1RVE9PSIsIm1hYyI6Ijk5ZWE2OWFjOGQ3Mzc1MGY5NWVlNWU5NTQ5YTBiOTJhMzE4MDJjNDI3NjMwMDVhZjRhZTIxOTlmMzEyNWFhNGYifQ==',0,NULL),(6,1,2,'milan56@hirthe.net','eyJpdiI6ImZ2c3d2WHl2bmdqZExEd0VxTE9cL093PT0iLCJ2YWx1ZSI6InVyY05QM25EamR1V0xJbVVheG9RMEE9PSIsIm1hYyI6IjNiM2EwZTkzY2EzNDNjY2JjNmU1NWRiZTRlZDcyYjdiMzBiYWZiNjJjMTMwOTdmNWFhMjc0OGIyMTU5MjIwZTAifQ==',0,NULL),(7,2,2,'lenore.thiel@ryan.com','eyJpdiI6IlgwQkRrWnU1d3NleW1vTUJvNFZOclE9PSIsInZhbHVlIjoiVytpYnoxZ3R3RTRQR2FWNFNLOTlEdz09IiwibWFjIjoiMDhjZjU3NTQ2MTA3OWM4MmE3NzM5NjI5ZmVmNDMwYTIzMWFlNWM2ZGNhNWM1OWVhMjc2MWVkNmI2ZGI5MmM1OCJ9',0,NULL),(8,1,3,'oreilly.julian@hotmail.com','eyJpdiI6IlVjTnFhNmpBU3BobTRKUTF3Tkg0bGc9PSIsInZhbHVlIjoiR3lhM0xqWDF2VWV4K3BjU0JYRVMxdz09IiwibWFjIjoiZDAzYzJhYTM1NDdiMDk2MjY5NzFhN2Y1MjM2YjNiMTczMTAxNTE0YjRiNWVhMjczZTVhYzJjNzk3YWUzZGIxZCJ9',0,NULL),(9,3,3,'glenda.hammes@gmail.com','eyJpdiI6Iml5V3cyM0RGbVFybStpR2dVTnFOOFE9PSIsInZhbHVlIjoiaEZMcVFzcXh5UTZ0M255anZKTE83QT09IiwibWFjIjoiMmMyYjczOTQxNDNhYmFkYjM4NzIzNGFhZDg4ODY3OTM5Mjc5ODA4YzlhNjM2MDhiNTdmOWU1OTdlODAzYjU0OCJ9',0,NULL),(10,1,2,'fritz08@hotmail.com','eyJpdiI6Ijg5Q0JSTVZCeUdoc0VaTnV1WlhCbVE9PSIsInZhbHVlIjoiM01mQVhDeWxYOEgybUhlTEZwcVwvRmc9PSIsIm1hYyI6ImFiZDFkNzYyZjE4YWNlZDA0MGNkY2Q5Y2E5NGU0OWNjYmVmMzE5YmRiY2E4NjliYTY5MDE1N2Y3MTdiY2IxMzgifQ==',0,NULL),(11,2,1,'lacy99@borer.com','eyJpdiI6ImFoVDlaRTM4ajJDUjdYR2tRZkFoRFE9PSIsInZhbHVlIjoiM0xFYnVYK3F4dHJRaVloUjNPZWlhZz09IiwibWFjIjoiYjAxMDIwNmRhM2Y3YjM0NWNmYjk0MDVjODg3MzM2ZDI1OTA5MWFlZmIyZDUzOGEzN2I4MWFjNWRiNzk5YmIzMSJ9',0,NULL);
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

-- Dump completed on 2019-09-28 21:57:28
