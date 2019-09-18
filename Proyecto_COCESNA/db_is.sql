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
INSERT INTO `personal` VALUES (1,'voluptatem qui','vel velit','1997-07-27','1988-03-26','F','111',1),(2,'excepturi consectetur','doloribus omnis','1994-06-16','1986-12-24','M','222',1),(3,'aut aliquam','est fugit','1998-06-05','2015-04-20','M','333',1),(4,'sed sed','nisi facilis','1991-09-08','2016-07-22','F','444',1),(5,'quia eum','commodi et','1989-02-09','1974-10-22','F','873',1),(6,'magnam in','facilis sit','1991-02-13','1980-07-30','F','59',1),(7,'alias libero','suscipit quisquam','2016-09-14','1971-03-10','F','828',1),(8,'porro soluta','et id','2011-11-01','1991-12-24','F','639',1),(9,'voluptas ratione','temporibus magni','2003-10-26','1970-11-22','F','575',1),(10,'quae dolor','ducimus quis','2017-09-08','1985-09-29','F','780',1),(11,'occaecati earum','dicta iure','1996-04-15','1985-10-29','M','795',1),(12,'occaecati itaque','ipsum et','1992-12-22','1972-05-11','F','773',1),(13,'magni magni','ea magnam','2014-01-10','1975-03-28','F','911',1),(14,'deleniti fugiat','sit occaecati','1995-09-21','1983-07-26','M','659',1),(15,'harum est','quia eaque','1981-11-11','1975-03-02','M','560',1),(16,'ut reprehenderit','deserunt aut','2010-12-01','1971-11-14','M','748',1),(17,'soluta debitis','eos ratione','1992-08-15','1976-08-06','M','655',1),(18,'harum labore','facere natus','1970-11-27','1992-02-13','F','579',1),(19,'sunt molestiae','quasi in','1987-09-19','2017-07-19','M','128',1),(20,'eius eligendi','id ratione','2008-09-25','1979-04-21','M','874',1),(21,'nam temporibus','porro laborum','2016-05-11','1973-01-09','M','572',1),(22,'et est','atque voluptas','2011-01-07','2003-12-26','M','352',1),(23,'voluptatem voluptates','voluptatem commodi','1980-08-18','1983-12-08','M','974',1),(24,'ut et','dolor reprehenderit','1980-11-01','1972-04-14','F','523',1),(25,'unde quisquam','reprehenderit dolore','2018-02-15','1997-04-12','F','392',1),(26,'quam nam','quo sit','1972-04-29','1979-07-21','F','274',1),(27,'sint sint','ut dignissimos','1975-11-13','1971-10-27','M','969',1),(28,'vitae et','quia ipsa','1998-04-01','2006-10-10','F','846',1),(29,'sequi placeat','mollitia ipsum','2005-09-07','2016-11-27','F','286',1),(30,'adipisci adipisci','dolore ut','1975-08-14','2005-02-11','M','208',1),(31,'perspiciatis neque','voluptatum ratione','1979-07-24','1974-01-20','M','812',1),(32,'consequuntur nihil','non distinctio','1975-09-22','1970-08-06','F','633',1),(33,'itaque temporibus','rerum non','2007-03-03','1971-12-25','M','719',1),(34,'perspiciatis aliquid','nostrum adipisci','1985-09-07','2005-01-27','F','599',1);
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
INSERT INTO `pregunta_filtro` VALUES ('¿Estoy en forma para realizar el turno?','2019-09-11','2019-09-11');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seglog`
--

LOCK TABLES `seglog` WRITE;
/*!40000 ALTER TABLE `seglog` DISABLE KEYS */;
INSERT INTO `seglog` VALUES (1,'2019-09-11','21:04:13',111,'commodi excepturi','Nueva area',111,'areas_de_preguntas','INSERT','area_guardar(?,?)','1'),(2,'2019-09-11','21:39:38',111,'quam ea','Nueva area',111,'areas_de_preguntas','area_guardar(?,?)','INSERT','1'),(3,'2019-09-11','21:57:59',111,'quam ea','Actualizar pregunta',111,'preguntas','Actualizar pregunta 3 usando el contenido \"Quien comenzo con el hola mundo?\" y el tipo \"3\"','UPDATE','1'),(4,'2019-09-11','21:58:46',111,'quam ea','Actualizar pregunta',111,'preguntas','Actualizar pregunta 3 usando el contenido \"wQuien comenzo con el hola mundo?\" y el tipo \"3\"','UPDATE','1'),(5,'2019-09-11','21:58:52',111,'quam ea','Actualizar pregunta',111,'preguntas','Actualizar pregunta 3 usando el contenido \"Quien comenzo con el hola mundo?\" y el tipo \"3\"','UPDATE','1'),(6,'2019-09-11','21:59:02',111,'quam ea','Actualizar pregunta',111,'preguntas','Actualizar pregunta 3 usando el contenido \"Quien comenzo con el hola mundo?\" y el tipo \"2\"','UPDATE','1'),(7,'2019-09-11','22:00:14',111,'quam ea','Borrar pregunta',111,'preguntas','Borra la pregunta 3','DELETE','1'),(8,'2019-09-11','22:00:24',111,'quam ea','Borrar area',111,'areas_de_preguntas','Borra el area2','DELETE','1'),(9,'2019-09-11','22:00:59',111,'quam ea','Nueva area',111,'areas_de_preguntas','area_guardar(?,?)','INSERT','1'),(10,'2019-09-11','22:01:09',111,'quam ea','Nueva pregunta',111,'preguntas','pregunta_guardar(?,?)','INSERT','1'),(11,'2019-09-11','22:01:15',111,'quam ea','Actualizar pregunta',111,'preguntas','Actualizar pregunta 7 usando el contenido \"¿Qué es la existencia?\" y el tipo \"3\"','UPDATE','1'),(12,'2019-09-11','22:01:25',111,'quam ea','Nueva pregunta',111,'preguntas','pregunta_guardar(?,?)','INSERT','1'),(13,'2019-09-11','22:01:45',111,'quam ea','Actualizar pregunta',111,'preguntas','Actualizar pregunta 8 usando el contenido \"/\" y el tipo \"1\"','UPDATE','1'),(14,'2019-09-11','22:01:48',111,'quam ea','Borrar pregunta',111,'preguntas','Borra la pregunta 8','DELETE','1'),(15,'2019-09-11','22:02:06',111,'quam ea','Borrar area',111,'areas_de_preguntas','Borra el area3','DELETE','1'),(16,'2019-09-11','22:45:51',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"5\"','UPDATE','1'),(17,'2019-09-11','22:47:05',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"1\"','UPDATE','1'),(18,'2019-09-11','22:49:58',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"5\"','UPDATE','1'),(19,'2019-09-11','22:50:02',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"4\"','UPDATE','1'),(20,'2019-09-11','22:50:08',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"3\"','UPDATE','1'),(21,'2019-09-11','22:50:12',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"4\"','UPDATE','1'),(22,'2019-09-11','22:50:17',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"2\"','UPDATE','1'),(23,'2019-09-11','22:50:20',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"1\"','UPDATE','1'),(24,'2019-09-11','22:50:25',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"5\"','UPDATE','1'),(25,'2019-09-11','22:50:31',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"4\"','UPDATE','1'),(26,'2019-09-11','22:52:02',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"4\"','UPDATE','1'),(27,'2019-09-11','22:52:25',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"1\"','UPDATE','1'),(28,'2019-09-11','22:52:32',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"3\"','UPDATE','1'),(29,'2019-09-11','22:52:34',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"4\"','UPDATE','1'),(30,'2019-09-11','22:52:52',111,'labore in','Actualizar pregunta',111,'preguntas','Actualizar pregunta 1 usando el contenido \"¿Existes?\" y el tipo \"5\"','UPDATE','1');
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
INSERT INTO `turnos` VALUES (1,'dolor','09:04:38','12:16:54',1),(2,'vel','12:04:32','11:36:54',1),(3,'assumenda','16:48:46','20:27:00',1);
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
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6IkswT21xUkxvWTdqVDlTckQ5U244TGc9PSIsInZhbHVlIjoiMjh6RjZDNDZodHhMcm9NWHd2STRCZz09IiwibWFjIjoiYTk3MzM1NWRkOGE5MDczZjMwMzYzMmE4Njc5NjRhYTgxY2E4OTUyMGVhNmFlZDU0NjRlNDk0ZjhiYjEzNDcwNiJ9',NULL),(2,1,2,'primer@controlador.p','eyJpdiI6InFCM1NWTzBCVkpHWkRPb2NNYjNiWWc9PSIsInZhbHVlIjoiTWpCNmtzZmJ2WDlsR1JVNUtVR1VCZz09IiwibWFjIjoiM2Q3Nzk3ZTJhOTYxZThiNzlmNzg0MGFiN2M3ZTEwNGJiMmRhMGJmNmZhOTVhNzQxMjdhYjU3NDYwZWIwZDRiOSJ9',NULL),(3,1,3,'el@supervisor.p','eyJpdiI6IjUxQW9VZTR3eDhnU3lMN1IyRFJnNXc9PSIsInZhbHVlIjoiZVp3dElZRCs0bDFQMFRoVzFIdVJZUT09IiwibWFjIjoiNWU2ZmJhY2Q3OWI4ODBhNzg2Mzc2NGIxZGQxNzI5MWNhYjJkZjlmNzAzNjc1MjIyNGIzNmMxMWU5OGU0ZTQxNyJ9',NULL),(4,1,4,'RR@HH.p','eyJpdiI6Ik5uXC8yRFNmXC9NazVnVUlEUUVMQyt5UT09IiwidmFsdWUiOiI3aE04amEya25TK0QxRThmN0NhUktnPT0iLCJtYWMiOiI5ZWM3MGU4YTM2Zjk5ZGIxMzcxOTVjMmRiODc5M2U4NGMwYTA3ODBiNTcyOTJmNWYwOTdjODk0ZWIwMDdiMDJmIn0=',NULL),(5,3,2,'schiller.lesley@grimes.com','eyJpdiI6IlJORWlNb0xHN1BkWUJET2RXazR5dXc9PSIsInZhbHVlIjoiV2w5RkFydUxIYkg5SVltY2hjQmhNQT09IiwibWFjIjoiNTA5NTgzMzA4N2Y3ZmM3YmUyOWQyYzRhOWNiOTY1MmU2ZWQ2ZmI5NDUwOTYxZDJkYWFmZTc2NzE3NDIwNGJmNyJ9',NULL),(6,2,3,'walter.lloyd@yahoo.com','eyJpdiI6IndGWDlDZ2xNVlEyQXZweXBcL1I1SlNnPT0iLCJ2YWx1ZSI6IktLbnZCQ2pOSmh6UFk1d3JlZlA2SGc9PSIsIm1hYyI6ImFjZTU4YTRmYzg2ZDQ5ZjA1MzUxYmYzZTE4YWZlOWE1YzQ2YmJiODU5NjMzZWFkYTBiMzc4YTg3MzQ3MzIxMGUifQ==',NULL),(7,1,3,'chilpert@nolan.com','eyJpdiI6IlVMcFwvaWVVeXk1cmMzb1oxUWhqTU5RPT0iLCJ2YWx1ZSI6ImU1Wm9mNUtYd214ZEIzRGZpcld4cWc9PSIsIm1hYyI6Ijg3OWRhZjdlNzY3OTQyNTM0ZDFjYmUwNjRmNDk1YzVjZTRhNDhhNDAxNzhmOGQ2MTY2YTkxMDZjMmM2MTVlODQifQ==',NULL),(8,1,3,'schuster.twila@yahoo.com','eyJpdiI6IldCQk0yS1htNFFlNzQxQXhQK3RiRGc9PSIsInZhbHVlIjoidHU3VlZOZ1wvUTIwSlJ2dFI3OTRTenc9PSIsIm1hYyI6Ijg1ZjM1ZjkzNzMwNGRkNWY2NTQ1YTllYTRmYWE5YzA5YWQwYzdiNDdhYzcyNzE4NzRjNWZkOTNjMDhjNzVmMzIifQ==',NULL),(9,2,4,'melissa85@huels.com','eyJpdiI6ImJQVFlNTm1hWFBNQUhmUmNBVGR1RXc9PSIsInZhbHVlIjoibmxscVhCenZqZU1hakdYcXdcL1NlNEE9PSIsIm1hYyI6ImYzYWExZWY0YWQzM2E3OGZjZDgyMDM3ZTRlMWVkNWY1ODBmZjU5NjcyOWJhNzhlOWI2Zjk4ODY4Mjg3NjM2ZmYifQ==',NULL),(10,2,2,'ocrooks@gmail.com','eyJpdiI6ImpPMlFhSFVpS1NUbVEyVmgraGpkc2c9PSIsInZhbHVlIjoibEdJKzNleHJORWR2UWtyVEVHRlNSUT09IiwibWFjIjoiYWIzOWFmOTQyYjA2N2ExMGZiZDc3YWM1ZTlkYjJhNDIwMDc2MDI0NjA5ZmYwZmI2OGMyNDEyZTA1ZmRhOWI0NSJ9',NULL),(11,3,1,'krohan@oconner.com','eyJpdiI6InBYNWRqU0l4VGM3Q2JobTFrVFF5QWc9PSIsInZhbHVlIjoiV005R3BVakRWYzBYQ094YXZNNzhLUT09IiwibWFjIjoiODcxY2E2MWJkMTI3OTUyNjY4YTQ5NTJkYjY1NDEzZmUxMTdjZmQ4NGQ5MDJjODhjNWU2NDI4ZWNiZGM1NDI2NCJ9',NULL),(12,2,3,'ulemke@spencer.com','eyJpdiI6IkpcL3UxR04yc0hVVUZRZGNUVGFTaVNBPT0iLCJ2YWx1ZSI6InMzQm1Va0hEU014R0s2TlJ1S3lqWVE9PSIsIm1hYyI6IjA5ODVmM2JiYmRkNmIzYmU4YjE4YzdlYjA5OGU4MjczZTgyNDQ3OWYwMTJiYTU1NTdmYTU1NzI4MWRhODVlNTUifQ==',NULL),(13,3,1,'antwan42@yahoo.com','eyJpdiI6Ik5VUDZIMWlONVF3U0lLTFp3WW1ReFE9PSIsInZhbHVlIjoiVzFcL25KMmRvYXNNbDd3YWxcL2lvYnFRPT0iLCJtYWMiOiI1MmRlNzU1NTIyYWVkYzVlZWM3NjI5NWFjOTM0MGQ0ZTk4ZDM0ZTNkYmI2ZjE2MDFjMThjMDk4NDNiYTdmNjRhIn0=',NULL),(14,2,2,'larkin.magali@hotmail.com','eyJpdiI6IlptSTNPaHlRN3pQVkp6anlMY1k0WGc9PSIsInZhbHVlIjoiaUFPUGhzWERRVzNOS3l3Q1pjb0NiUT09IiwibWFjIjoiYTI2MmY5NWZkNGJmNDcwMGNiNGZhZDFiNzkzZGUxM2Q0ZDI1NTUwNWRiNWI5YjVmZDNjMWE4MDRmMDkwMzlmMSJ9',NULL),(15,1,3,'crona.moshe@gmail.com','eyJpdiI6Ik1SY2NqNmxVWkYrbTlDNVFIaEowMlE9PSIsInZhbHVlIjoiMUNoMTM1VlZMT1VlWUNrMTBoVnRoZz09IiwibWFjIjoiMmZmMWI5MGI4M2MxOTg5MzUzN2EyNjc2ZjFlM2RjNGE1OGFkMTllZmI2NGU0MDQ5MmExMjk2ZDQ2Nzk1NDhhZiJ9',NULL),(16,2,4,'alexzander.reinger@lockman.com','eyJpdiI6IjBZR3VHQVN2Ymx2N29JXC8zdkxcL1lmQT09IiwidmFsdWUiOiI3VldvNlU3eU5mRmNhOWdEVXNZNWpRPT0iLCJtYWMiOiJlMWY5ODFlNjAwMjI5MzY2NWM2ZTNjMDYxMTVhYWQxMzc3NTQ5ZWY5MTg3OWU4YWJlOGU3MmI4MzA1NmVlNGQyIn0=',NULL),(17,2,2,'selmer.sanford@yahoo.com','eyJpdiI6InVGc0NuamJJQnZrSTZxaFJnbG1UTFE9PSIsInZhbHVlIjoiNlRuUjRGc21pV1FITHpQcFdJcnNjQT09IiwibWFjIjoiMWE4MDVmMWY5Y2FhNjY5NGNlNDRmZGEzMGIxY2VkYjZjZTkwNTgwMDA0ZjUxYjU0ZjgxZTA0NDYyNTdkOWNmOSJ9',NULL),(18,2,4,'velva.konopelski@heathcote.com','eyJpdiI6InQ5WU1RUEwwcitpK1crNXJsdTlzeXc9PSIsInZhbHVlIjoiU01yS01TR1puaHZiR0tMSFRReG5BQT09IiwibWFjIjoiMGRmM2MwZDJiMzUyY2RiMmZkMDZmMmUzNjhmYmUyY2JmOWI2YmE0NWYwOWQ0NzAzMDAxNTM5MDNhM2E3ZjRkOCJ9',NULL),(19,3,2,'nader.lelah@gmail.com','eyJpdiI6ImhYM0ZKTnh1Y2Z6M1FZN0FobFhKNVE9PSIsInZhbHVlIjoialZwVllyNHBsOWtleWRaeFdGTDVyUT09IiwibWFjIjoiODcyY2YzNjdmZTA5Y2I3ZTE4NzU2ODlhYTRlNTkwYmZjMzQ4YWJiNjkzMDM5MWFlNzNmYTkzMGZkMzMwNjM2YSJ9',NULL),(20,1,2,'boyer.shad@lehner.com','eyJpdiI6IlNiRUVkUERNQWZLelU2TUVkMDhXeWc9PSIsInZhbHVlIjoiSzdPa0RGNTlmNmQxTHk0Tm4wYk9EZz09IiwibWFjIjoiYTY4MmQxMDUwMmQxNzg4MjRhOWEwZTEwYjYzMGNkNWViMDU1YmI3N2Y0NGZlMGE4MTQ2MDJlYTgxOGJiY2YwNSJ9',NULL),(21,3,2,'isadore.crona@gmail.com','eyJpdiI6IkNmcDJ2UlljWkVqVGh0aWpGOTAzckE9PSIsInZhbHVlIjoiM2Y2QW5LUmFsK0Z5RVBPVEVmZTBMdz09IiwibWFjIjoiMTEyYmQ1YjFiZmIzM2VhYjExOWFjOGM2YTU0YWI2NmVhMjk0MzZlMTVjODZjNzc1MWI4ZGU0YTk0YzE3MzI1ZCJ9',NULL),(22,1,4,'qwhite@pouros.com','eyJpdiI6Im16QnRXN0l3M0tQeXFwTUpoTFwvMnlnPT0iLCJ2YWx1ZSI6Ik5PWTJ4ODhoeDZJMDh1YktlU2FTalE9PSIsIm1hYyI6IjVkNWFkYjBhYjZmNzkwYzFkYjM3MzY1ODY1YzQ0OWM5Y2FkM2ZmMjQwOWY0Y2I2ZDU4YWMyMjg3ZmU0NWEzMzAifQ==',NULL),(23,2,4,'denis.goyette@gmail.com','eyJpdiI6Ik5cL25kV1U5TldyaXRQZHJDZ1lObkRRPT0iLCJ2YWx1ZSI6ImFOV0h0eHd2WWF5andQK1RFUHhCMXc9PSIsIm1hYyI6IjUzMmZhMzYxY2U0MmQyZDc3NDdmNzA1YTQ2ZmQxNmMxMDQyYTA3NWY4NTAyY2UwMWZlMGYxY2Q3MGQzYjMzMmEifQ==',NULL),(24,1,1,'upton.karina@walker.org','eyJpdiI6InRsc0NIXC84YmxBRUdHcEJEb01ya1lRPT0iLCJ2YWx1ZSI6Ill0ZytIeDViSVArN2tabFJGcEZialE9PSIsIm1hYyI6ImM4MDg1NjVjOTM4ZGMwZmQ1MDZkOTI5ZjQzMjFlOGU1ODdhNmM4MDFjYzhhYWExMDY5MTdkZDNlNmFlZjIzY2QifQ==',NULL),(25,2,4,'carter.anibal@hotmail.com','eyJpdiI6InpKY1VhRk1DcW1rU2lxZUcrUVIrYlE9PSIsInZhbHVlIjoiZGY1WDd5OVo4ZXU2aHh2RjFURmlrdz09IiwibWFjIjoiYzk4MTUwNzQxZjE4ZGI4MmNkMjYyNTlmYjU4NjIzZDNlNTRmZWQyMGNhMDUyZmNjOTg3ZDY2NzljOTRlYTlmYSJ9',NULL),(26,3,1,'toni64@tremblay.com','eyJpdiI6Ikp6dnZidDcrNGtOUU82cjROVis0R3c9PSIsInZhbHVlIjoiazFmRWlTOHp4Q3FDS3VGMGluekpmdz09IiwibWFjIjoiYTIxNDVjZGNjNjdlYWQ5NjYyYjUyMzBjODk3ZmNlNTQxZTQ5NTQwODEzYTAzNmMxYzI0OWExZDUxZWU1OGVmNyJ9',NULL),(27,2,2,'pschroeder@gmail.com','eyJpdiI6IlM1NkF4QW04TnZialpoTTBqR2EyYVE9PSIsInZhbHVlIjoiTlVLbVREMjhscjYyZG5zSnE5OGIrQT09IiwibWFjIjoiNDUxMzRiNzczMzNhOTc5M2E2OGFlZWQ4ZGMyMmU0ZWViOTAzOTIyMTM1MmY4YzQwOWE5ZTIzYWJkZGVhMWVhNiJ9',NULL),(28,1,4,'bernhard94@schmidt.com','eyJpdiI6InM4NnptSEE4aFZoZjJ2UndlVm02a0E9PSIsInZhbHVlIjoiQzdvNnA0S0Z5cGM0bU5rbHgzV0Vmdz09IiwibWFjIjoiYjMxZjNjODA1NGQ1NGEwMzVlMmZjYTIwNDY1MGYyNTNkYzgyMGZhMzlkNGU5ZGI1Yjc0ZTdkMTM4OGZmNWFmNSJ9',NULL),(29,1,2,'nluettgen@sanford.org','eyJpdiI6IkZGTzJ6WUFzYmpwTXZtRGs1RVBLcEE9PSIsInZhbHVlIjoiZVBPR2xFT1FlV1pRVnRaeDVscmJDdz09IiwibWFjIjoiNzIzNTY2YjUzZjU1YWY2OGQxNjI4M2MxNmNkNDdkOTVjZGE2MzE4ZjA2NTY4Yjg0ZDdjNDFiNWExNmE3ODAyMiJ9',NULL),(30,2,4,'erik.bahringer@farrell.org','eyJpdiI6IitXWDVzQmxRTVFRUHRJRG9BT0drcUE9PSIsInZhbHVlIjoiZHBTXC9jamdUM1lJQTJzYlwvNE54VzRRPT0iLCJtYWMiOiIzMDQ4YjUxZmM2YjJjZTExNTJkODQxYjkzYzlkNDIyZjhhZWEzYzljNDJmYmQyZTM1MjZjYTE0YWJhNTY2MGE4In0=',NULL),(31,2,2,'zschulist@tillman.biz','eyJpdiI6Ik42YkFmU3BwVFdcL0s1WVUwSFJrWm9BPT0iLCJ2YWx1ZSI6InM1YUhXMUlqeVRyMnRvTXhEYUdoTFE9PSIsIm1hYyI6IjU3ZTFmMzRlNDRhOGQ0MDllNzQwOWQ3MjlmNWM3YzQ5ZWM1ZGViNThhNmQ3OWYyMmFlMWFjMGFhZmZkNGI3MjMifQ==',NULL),(32,2,2,'arturo92@gmail.com','eyJpdiI6IlhuMnBNUkdqQ2hhbVgrWXVCVVBnVHc9PSIsInZhbHVlIjoibTZ2WFdDSXFSOFBVSFBsZ2Z4TzNodz09IiwibWFjIjoiODRiNzIwYjJmYzlhYTc1Y2IwYjU0MjczODBhMDlmMjg0ZmE1ZTRkOGYxNDNjODUzZTYyMTQxNTBkMTYxNzE3MSJ9',NULL),(33,1,1,'eldred.kihn@hotmail.com','eyJpdiI6IkdXRkVsTmRrRkxSa0VUWUVDS2l3SHc9PSIsInZhbHVlIjoicm9cL290VXZWc2V1Szc0djQ5eUhUU3c9PSIsIm1hYyI6IjA3MDA1OTEzNjRkMjI5OGMwMjY0MjA3YTA3OGMxMGI3MmM2YWVkNTRiOWY3MzNiYTRjNDVjMmJlODc1YWY2MzQifQ==',NULL),(34,2,2,'macie48@gmail.com','eyJpdiI6IkV2aTlLb0tCVm9tWDVBRjVJSjJQbkE9PSIsInZhbHVlIjoieEZxY3I5RlhMY21aNGw4VEh4SExqdz09IiwibWFjIjoiNDc1OTJhODFlOGMyYmE4ZTg4ZGViMmYyODNjNTgyNWQ3ZTYzMDliYzk5MGI5MzZjZTNjMDcyODBiNTE0NGFjMyJ9',NULL);
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

-- Dump completed on 2019-09-11 22:53:10
