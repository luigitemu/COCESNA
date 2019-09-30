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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_de_preguntas`
--

LOCK TABLES `areas_de_preguntas` WRITE;
/*!40000 ALTER TABLE `areas_de_preguntas` DISABLE KEYS */;
INSERT INTO `areas_de_preguntas` VALUES (1,'Enfermedad','Acerca del estado fisico',NULL),(2,'Automedicación','Uso de medicamentos',NULL),(3,'Estado de animo','Acerca de problemas psicologicos',NULL),(4,'Fatiga','Causas que generan fatiga',NULL),(5,'Alimentación','Confirmar niveles de energia',NULL),(6,'Matemáticas','Problemas fáciles',NULL);
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
INSERT INTO `personal` VALUES (1,'dolor nobis','illum eligendi','1988-12-07','1991-12-10','F','111',1),(2,'tenetur dignissimos','voluptas saepe','2014-10-01','1980-03-11','F','222',1),(3,'omnis dolor','accusamus adipisci','1982-04-25','2018-09-25','M','333',1),(4,'eos praesentium','sit esse','2015-05-23','1970-06-30','M','444',1),(5,'qui minus','sit molestiae','1982-01-06','2015-05-14','M','125',1),(6,'vel cum','id enim','2012-10-10','1999-03-10','F','134',1),(7,'autem nihil','et error','1992-01-28','2007-02-17','F','161',1),(8,'necessitatibus sunt','quia aliquam','1986-08-29','1978-11-28','F','458',1),(9,'illo minima','maiores cumque','1970-02-13','2004-05-13','M','501',1),(10,'inventore similique','quia illum','1989-09-13','1975-05-14','M','669',1),(11,'qui tempora','eos molestiae','1996-11-03','1993-04-29','F','627',1),(12,'recusandae est','consequatur aliquam','1986-08-14','2001-09-20','F','651',1),(13,'rerum iure','voluptas voluptatem','1986-05-14','2001-02-06','M','770',1),(14,'esse quod','voluptas natus','1979-10-15','2009-09-05','F','24',1),(15,'rem recusandae','exercitationem illum','1994-04-06','1988-06-20','M','543',1),(16,'sapiente saepe','distinctio qui','2010-06-17','2005-02-01','M','341',1),(17,'molestiae nesciunt','debitis rerum','2000-08-19','1979-05-07','M','663',1),(18,'qui sit','incidunt deleniti','2009-09-15','2008-05-21','F','862',1),(19,'fugit illo','eius ad','2006-04-21','1979-06-01','F','810',1),(20,'exercitationem aut','rerum perspiciatis','2017-03-24','2005-01-16','F','723',1),(21,'minus maiores','vel enim','2007-09-01','1974-02-24','M','837',1),(22,'magni esse','consequatur iste','2013-06-16','1981-06-03','F','968',1),(23,'necessitatibus nam','pariatur commodi','1981-05-28','2000-10-16','M','859',1),(24,'dolores aut','mollitia at','1992-04-19','1982-02-01','M','177',1),(25,'omnis necessitatibus','impedit sapiente','1971-06-01','1979-01-16','M','851',1),(26,'velit quaerat','neque repellendus','2001-09-11','1988-08-10','F','135',1),(27,'nesciunt dignissimos','quisquam quia','2014-11-04','1975-07-04','F','875',1),(28,'quos expedita','nulla nobis','1997-06-22','1977-01-03','F','827',1),(29,'eaque rerum','qui rerum','2013-04-09','1991-06-04','F','912',1),(30,'itaque et','sapiente quibusdam','1991-11-13','1980-09-26','M','3',1),(31,'itaque qui','et consequatur','1986-08-10','2007-01-29','M','195',1),(32,'mollitia dolorem','dolorum ut','2005-02-10','1985-10-05','F','151',1),(33,'sapiente veritatis','nesciunt esse','1976-07-16','1982-04-20','M','754',1),(34,'ut ea','sequi in','1971-10-12','1981-08-05','F','21',1);
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
INSERT INTO `pregunta_filtro` VALUES (1,'¿Estoy en forma para realizar el turno?','2019-09-29','2019-09-29');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,1,1,'¿Tengo algún malestar fisico?',NULL),(2,1,1,'¿Tengo algún dolor?',NULL),(3,1,1,'¿Tengo algún sintoma?',NULL),(4,1,1,'¿Representa ese sintoma alguna enfermedad?',NULL),(5,2,1,'¿Me encuentro usando algún medicamento autorecetado?',NULL),(6,2,1,'¿Me encuentro usando algún medicamento recomendado por un amigo?',NULL),(7,2,1,'¿He vuelto a tomar algún medicamento si consultar a un especialista?',NULL),(8,3,1,'¿Me siento bajo presión psicologica?',NULL),(9,3,1,'¿Siento que tengo problemas en mi ambiente laboral?',NULL),(10,3,1,'¿Siento que tengo problemas personales?',NULL),(11,4,1,'¿Estoy cansado?',NULL),(12,4,1,'¿Tengo sueño constantemente?',NULL),(13,4,1,'¿Tengo necesidad constantemente de acostarme o recostarme?',NULL),(14,4,1,'¿Siento que todo me cuesta el doble?',NULL),(15,5,1,'¿He comido en los horarios correspondientes hoy?',NULL),(16,6,2,'¿2 + 2?',NULL),(17,6,1,'¿2 = 5?',NULL);
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
INSERT INTO `turnos` VALUES (1,'id','22:15:53','21:54:47',1),(2,'amet','00:22:29','00:43:11',1),(3,'similique','06:06:40','13:43:23',1);
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
INSERT INTO `usuarios` VALUES (1,1,1,'el@administrador.p','eyJpdiI6IkFJblpsdjNKRHYrR1JMZFNpSGM2WUE9PSIsInZhbHVlIjoiU1JZall2MFJ5Tmh3M1ZNZE9jXC9GaFE9PSIsIm1hYyI6ImFmMWI2ZDY2MmM1YjhlYzlhMjhhNWVkYmZiOGYzYTBiYzYwNjIzOGI1MDIwOGM4ZGQ2NjdmZTU5MmQ1Yzc0NjIifQ==',0,NULL),(2,1,2,'primer@controlador.p','eyJpdiI6IjVFVUNpZHRMZGpEQ3VjUkRSXC9ESHVnPT0iLCJ2YWx1ZSI6InRvaFBBTFVkVHZQd1NhZ0wzTUIxYlE9PSIsIm1hYyI6ImU5NjY2YjEwMmIzYjEwNzc3MTY3MjE3OTAzZjU3NzRmZjRkMzUxZjQwNDY4ZjQwOWJkODc2YmRmMDRmOGViYjMifQ==',0,NULL),(3,1,3,'el@supervisor.p','eyJpdiI6Imd0dmpRejZoSHZlcXF3Mk1ldUg1VGc9PSIsInZhbHVlIjoiblBoYytva2dNNUtpYXpmOFRsNlVQUT09IiwibWFjIjoiMTRhODVkM2RmMTUzMTZiZGIzZjZlMDQ0ZTY5MWRlZjcxYmY0YjRjN2I4NzIxMTI2NmNmOTc0YWE0YWE2N2UwZiJ9',0,NULL),(4,1,4,'RR@HH.p','eyJpdiI6InhLMlEyWlkwdWRtYnJCNWlDcjhNM3c9PSIsInZhbHVlIjoicDNtOW1LZzVDVWhPdDdITzdqM2dZdz09IiwibWFjIjoiYjVhYmM2OTdmMTU2NjE4MzNlNDY0Yzc0ZGUzYjU2M2FjMDVjYjgzYjNkMWJmZGUzMDdjOTkxNTY3NmZmMDc4NyJ9',0,NULL),(5,2,4,'carter.karianne@gmail.com','eyJpdiI6IkxpK1g3RVlzQTRvbjIzanpCXC9HcVdRPT0iLCJ2YWx1ZSI6IlA1bWtQTE5WOVl3a2FCME5vdytvV3c9PSIsIm1hYyI6ImNjODliM2U5ODBlMzAxNTMxOTQ3Y2M2NDhmYWUwOGFkZjhmNjFhNTMwYzg5YWNmNWFjNjM5ZjdiNWIzZTkyNTgifQ==',0,NULL),(6,2,2,'fisher.dorothea@funk.com','eyJpdiI6InE3czV6ZitaRjBwVld2U2prU3QxeGc9PSIsInZhbHVlIjoidjN1TlhNU3JuXC81TFkxV1NIK0ZBK3c9PSIsIm1hYyI6ImE0MTQzYmFhMzRkMWEyZTYyZjczNmJkNzFmMmMxYjdmYWEyM2IwMGJhYjdmZTE1YjIwMmZjOWU2MTU5ZWQ0N2YifQ==',0,NULL),(7,2,4,'yost.tyrel@gmail.com','eyJpdiI6Iis1SG1jVjA4ZmxHK01SdU9ub3gxZUE9PSIsInZhbHVlIjoiSVl1NkJxUEJiQjlic0VFbjA2bXBTUT09IiwibWFjIjoiZWJmNTZmYTYwNmEwNzhlZmI0OTcyYzQxZTdlZTA1ZTJjMDAwMzM5ZTU0OTExNzZlZTM3OWFkMDhjYjMxMjI5NyJ9',0,NULL),(8,1,1,'yost.favian@ullrich.com','eyJpdiI6InBFa0JHeVAySXZzdlppR3UxMDhjVWc9PSIsInZhbHVlIjoiTmlMZUVGZUJPQThBS0VJRVJHYWFxUT09IiwibWFjIjoiNTQ4MzY2MjdiYWI3N2I3ZjRiMTBlYTdlMGQyNWI1MDg3NWQ5OWQxYzdlMzNmMTczNzM2NDE1ZGVjNTMwMmYwMyJ9',0,NULL),(9,3,4,'teresa56@wolff.com','eyJpdiI6IkczeThXQnI3eENPOVNTdnJCNVZIVEE9PSIsInZhbHVlIjoiUFZtNHNQQVZvbmdIcGs3VTBYN0M5QT09IiwibWFjIjoiYWEwMjFkNmJkNDJmNTg0OWZmMGUwODM2MTdjMzI4ZTJmZGE4N2Q5YzU2NjdkNTEwNjk4ZmVjNWY4MTlhNTA5ZCJ9',0,NULL),(10,2,1,'waelchi.retta@gmail.com','eyJpdiI6Im5EMzExUWN1UkRnemFSR096SDVcL2FRPT0iLCJ2YWx1ZSI6IkNlbUhBSlJDbTczbU1MNkxrd3R3WUE9PSIsIm1hYyI6IjBiZjQ1MzY0ZGU3YzY2NTRiZGU3NjE0MzJmYWJlZGRhZjY0MWU1M2E2Zjg2NjQxMjQ1MTY2NTM3YzE4NzdmNzMifQ==',0,NULL),(11,1,3,'barrett18@dare.biz','eyJpdiI6IlNSWEtjNWJIV3Z2UXROUHhvTFpTVHc9PSIsInZhbHVlIjoibW91bzFtdVVSUFwvNzZ2TUoyUjJLRUE9PSIsIm1hYyI6IjU1YzlhM2E1N2NlZmMzZDBhOWMyNGJhNzJiZDdmNTVjYzM4ZTIxY2VhZDA0ZjkxZTcwNjcwZjVjZWI0MGY1NWYifQ==',0,NULL);
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

-- Dump completed on 2019-09-29 23:47:49
