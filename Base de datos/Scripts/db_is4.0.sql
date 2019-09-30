-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-09-2019 a las 22:36:31
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_is`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `area_guardar` (IN `nombre` VARCHAR(45), IN `descripcion` VARCHAR(300))  BEGIN
	INSERT INTO `areas_de_preguntas`( 
		`nombre`, 
		`descripcion`, 
		`fecha_creacion`
	)
	VALUES (
		nombre,
        descripcion,
        now()
	);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `log_guardar` (IN `log_key` INT, IN `user_key` INT, IN `usuario` VARCHAR(20), IN `detalle` MEDIUMTEXT, IN `llave` INT, IN `tabla` VARCHAR(60), IN `accion` MEDIUMTEXT, IN `comando` MEDIUMTEXT, IN `ip` VARCHAR(20))  BEGIN
	INSERT INTO `seglog`(
		`SegLogKey`,
        `SegLogFecha`, 
        `SegLogHora`, 
        `SegUsrKey`, 
        `SegUsrUsuario`, 
        `SegLogDetalle`, 
        `SegLogLlave`, 
        `SegLogTabla`, 
        `SegLogAccion`, 
        `SegLogComando`, 
        `SegLogIp`
	) VALUES (
		log_key,
        now(),
        time,
        user_key,
        usuario,
        detalle,
        llave,
        tabla,
        accion,
        comando,
        ip);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `log_usuarios_guardar` (IN `id_personal` INT, IN `id_respuesta` INT, IN `id_area` INT, IN `id_pregunta` INT, IN `id_turno` INT, IN `ip` VARCHAR(20), IN `es_pregunta_fltro` TINYINT)  BEGIN
	INSERT INTO `log_usuarios`(
    `id_personal`, 
    `id_respuesta`, 
    `id_area`, 
    `id_pregunta`, 
    `id_turno`,
    `ip`,
    `es_pregunta_filtro`,
    `fecha_creacion`) 
    VALUES (
    id_personal,
    id_respuesta,
    id_area,
    id_pregunta,
    id_turno,
    ip,
    es_pregunta_fltro,
    now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `perdidas_de_contrasena_guardar` (IN `ip` VARCHAR(20))  BEGIN
	INSERT INTO `perdidas_de_contrasena`(
			`ip`, 
            `fecha_creacion`
	) VALUES (
			ip,
            now()
	);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pregunta_crear` (IN `id_area` INT, IN `id_tipo` INT, IN `contenido` VARCHAR(100))  BEGIN
	INSERT INTO `preguntas`(
		`id_area`, 
        `id_tipo`,
        `contenido`, 
        `fecha_creacion`
	) VALUES (
		id_area,
        id_tipo,
        contenido,
        now());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `preg_filtro_crear` (IN `pregunta` VARCHAR(60))  BEGIN
	INSERT INTO `pregunta_filtro`(
		`pregunta`,
        `fecha_creacion`,
        `fecha_modificacion`
    )
    VALUES(
		pregunta,
        now(),
        now()
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `preg_filtro_modificar` (IN `pregunta` VARCHAR(60))  BEGIN
	INSERT INTO `pregunta_filtro`(
		`pregunta`,
        `fecha_modificacion`
    )
    VALUES(
		pregunta,
        now()
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reg_entrada_guardar` (IN `nombreUsuario` VARCHAR(255), IN `llaveAutorizacion` VARCHAR(32), IN `hashContrasena` VARCHAR(255), IN `correo` VARCHAR(255), IN `estado` SMALLINT(6), IN `token` VARCHAR(255))  BEGIN
INSERT INTO `user`(
	`username`, 
    `auth_key`, 
    `password_hash`, 
	`email`, 
    `status`, 
    `created_at`, 
	`updated_at`,
    `verification_token`
) 
VALUES (
	nombreUsuario,
    llaveAutorizacion,
    hashContrasena,
	correo,
    estado,
    unix_timestamp(),
    unix_timestamp(),
    token
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seglog_guardar` (IN `noEmpleado` INT, IN `nombre` VARCHAR(20), IN `accion` MEDIUMTEXT, IN `tabla` VARCHAR(60), IN `accionTabla` MEDIUMTEXT, IN `comando` MEDIUMTEXT, IN `ip` VARCHAR(20))  BEGIN
	INSERT INTO `seglog`(
                    `SegLogFecha`, 
                    `SegLogHora`, 
                    `SegUsrKey`, 
                    `SegUsrUsuario`, 
                    `SegLogDetalle`, 
                    `SegLogLlave`, 
                    `SegLogTabla`, 
                    `SegLogAccion`, 
                    `SegLogComando`, 
                    `SegLogIp`
				) 
		VALUES (
			now(),
            CURRENT_TIME(),
            noEmpleado,
            nombre,
            accion,
            noEmpleado,
            tabla,
            accionTabla,
            comando,
            ip
		);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarios_guardar` (IN `idPersonal` INT, IN `idTurno` INT, IN `idPosicion` INT, IN `email` VARCHAR(45), IN `contrasena` VARCHAR(200))  BEGIN
	INSERT INTO `usuarios`(
		`id_personal`, 
		`id_turno`, 
		`id_posicion`, 
		`email`, 
		`contrasena`, 
		`fecha_creacion`
	) VALUES (
		idPersonal,
		idTurno,
		idPosicion,
		email,
		contrasena,
		now()
	);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas_de_preguntas`
--

CREATE TABLE `areas_de_preguntas` (
  `id_area` int(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `areas_de_preguntas`
--

INSERT INTO `areas_de_preguntas` (`id_area`, `nombre`, `descripcion`, `fecha_creacion`) VALUES
(1, 'Fatiga', 'Lorem ipsum dolor sit amet', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_usuarios`
--

CREATE TABLE `log_usuarios` (
  `id_log_usuario` int(11) NOT NULL,
  `id_personal` int(3) NOT NULL,
  `id_respuesta` int(6) NOT NULL,
  `id_area` int(6) DEFAULT NULL,
  `id_pregunta` int(6) DEFAULT NULL,
  `id_turno` int(3) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `es_pregunta_filtro` tinyint(4) DEFAULT '0',
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `log_usuarios`
--

INSERT INTO `log_usuarios` (`id_log_usuario`, `id_personal`, `id_respuesta`, `id_area`, `id_pregunta`, `id_turno`, `ip`, `es_pregunta_filtro`, `fecha_creacion`) VALUES
(1, 2, 1, NULL, NULL, NULL, '127.0.0.1', 1, '2019-09-28 21:57:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perdidas_de_contrasena`
--

CREATE TABLE `perdidas_de_contrasena` (
  `id_perdida` int(11) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_personal` int(3) NOT NULL,
  `nombres` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `sexo` enum('M','F') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `no_empleado` varchar(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `nombres`, `apellidos`, `fecha_nacimiento`, `fecha_ingreso`, `sexo`, `no_empleado`, `activo`) VALUES
(1, 'ab quia', 'tempora earum', '1976-01-22', '1989-06-27', 'F', '111', 1),
(2, 'odio rem', 'aut voluptates', '1997-05-29', '2011-06-03', 'F', '222', 1),
(3, 'nostrum molestias', 'laborum et', '2016-12-07', '1998-12-10', 'F', '333', 1),
(4, 'consequatur facere', 'qui est', '2011-08-11', '2008-03-19', 'M', '444', 1),
(5, 'recusandae iure', 'nihil perspiciatis', '1973-12-25', '1981-10-31', 'M', '354', 1),
(6, 'officia quis', 'ab facere', '1983-06-19', '1995-06-21', 'M', '702', 1),
(7, 'consequatur sequi', 'corporis error', '2002-08-10', '2017-03-06', 'F', '15', 1),
(8, 'perferendis eum', 'illo distinctio', '2005-10-19', '2001-05-22', 'M', '271', 1),
(9, 'et repellat', 'perferendis fuga', '2015-06-22', '2015-02-25', 'F', '603', 1),
(10, 'omnis ut', 'vero laboriosam', '1989-12-28', '1987-12-18', 'M', '605', 1),
(11, 'omnis voluptas', 'perferendis labore', '1978-01-29', '2012-04-15', 'M', '331', 1),
(12, 'voluptatibus dolor', 'minus impedit', '2014-06-04', '1979-03-17', 'F', '822', 1),
(13, 'totam ut', 'perspiciatis quia', '2014-09-26', '2012-10-16', 'F', '561', 1),
(14, 'ut est', 'non dolorem', '1980-05-11', '2003-11-12', 'F', '758', 1),
(15, 'magni et', 'distinctio dicta', '1990-05-26', '1984-07-09', 'M', '449', 1),
(16, 'ut corrupti', 'tenetur laborum', '2008-04-07', '2000-01-29', 'F', '102', 1),
(17, 'asperiores natus', 'molestiae laborum', '1999-01-28', '1994-06-01', 'M', '747', 1),
(18, 'qui ipsa', 'voluptatem provident', '2004-09-27', '1977-10-28', 'M', '208', 1),
(19, 'id necessitatibus', 'modi culpa', '2004-04-14', '1979-03-05', 'F', '574', 1),
(20, 'est et', 'quia voluptatem', '1971-01-26', '1996-01-15', 'F', '493', 1),
(21, 'excepturi consequuntur', 'rerum voluptas', '1986-02-21', '2005-03-19', 'M', '474', 1),
(22, 'non velit', 'deserunt optio', '2011-04-14', '2012-05-27', 'F', '13', 1),
(23, 'dolorem magni', 'consequatur tempora', '1983-03-31', '1986-04-02', 'M', '549', 1),
(24, 'voluptatem sed', 'itaque sed', '2002-12-28', '1984-07-05', 'M', '388', 1),
(25, 'necessitatibus esse', 'nobis unde', '1979-06-22', '1989-05-22', 'M', '269', 1),
(26, 'optio omnis', 'quia fuga', '2007-05-31', '1976-10-26', 'F', '880', 1),
(27, 'illo eos', 'et sed', '1997-02-19', '1994-10-07', 'F', '704', 1),
(28, 'modi sit', 'fugiat molestiae', '1990-06-27', '2012-07-18', 'M', '815', 1),
(29, 'delectus inventore', 'ipsam eaque', '2007-04-03', '1990-08-02', 'F', '647', 1),
(30, 'laudantium laborum', 'in aut', '1978-04-27', '2002-01-13', 'F', '342', 1),
(31, 'fugiat debitis', 'voluptatem accusantium', '1979-02-19', '2015-03-16', 'M', '996', 1),
(32, 'illum aspernatur', 'nam dolor', '2002-07-18', '2003-04-21', 'M', '769', 1),
(33, 'qui voluptas', 'adipisci officiis', '2011-08-20', '1994-08-31', 'M', '838', 1),
(34, 'voluptatem id', 'quidem omnis', '2002-07-09', '1989-03-17', 'M', '90', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posicion`
--

CREATE TABLE `posicion` (
  `id_posicion` int(3) NOT NULL,
  `posicion` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `posicion`
--

INSERT INTO `posicion` (`id_posicion`, `posicion`) VALUES
(1, 'Administrador'),
(2, 'Controlador'),
(3, 'Supervisor'),
(4, 'RRHH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_pregunta` int(6) NOT NULL,
  `id_area` int(6) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `contenido` varchar(100) NOT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id_pregunta`, `id_area`, `id_tipo`, `contenido`, `fecha_creacion`) VALUES
(1, 1, 1, '¿Existes?', NULL),
(2, 1, 3, '¿Cómo está el calor?', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta_filtro`
--

CREATE TABLE `pregunta_filtro` (
  `id_pregunta` int(11) NOT NULL,
  `pregunta` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pregunta_filtro`
--

INSERT INTO `pregunta_filtro` (`id_pregunta`, `pregunta`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, '¿Estoy en forma para realizar el turno?', '2019-09-28', '2019-09-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razones`
--

CREATE TABLE `razones` (
  `id_razon` int(11) NOT NULL,
  `razon` varchar(500) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id_respuesta` int(6) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `contenido` varchar(100) NOT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id_respuesta`, `id_tipo`, `contenido`, `fecha_creacion`) VALUES
(1, 1, 'si', NULL),
(2, 1, 'no', NULL),
(3, 2, '1', NULL),
(4, 2, '2', NULL),
(5, 2, '3', NULL),
(6, 2, '4', NULL),
(7, 2, '5', NULL),
(8, 3, 'bajo', NULL),
(9, 3, 'medio', NULL),
(10, 3, 'alto', NULL),
(11, 4, 'muy bien', NULL),
(12, 4, 'bien', NULL),
(13, 4, 'regular', NULL),
(14, 4, 'mal', NULL),
(15, 4, 'muy mal', NULL),
(16, 5, 'mucho', NULL),
(17, 5, 'medio', NULL),
(18, 5, 'poco', NULL),
(19, 5, 'muy poco', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seglog`
--

CREATE TABLE `seglog` (
  `SegLogKey` int(11) NOT NULL,
  `SegLogFecha` date DEFAULT NULL,
  `SegLogHora` time DEFAULT NULL,
  `SegUsrKey` int(11) DEFAULT NULL,
  `SegUsrUsuario` varchar(20) DEFAULT NULL,
  `SegLogDetalle` mediumtext,
  `SegLogLlave` int(11) DEFAULT NULL,
  `SegLogTabla` varchar(60) DEFAULT NULL,
  `SegLogAccion` mediumtext,
  `SegLogComando` mediumtext,
  `SegLogIp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_respuesta`
--

CREATE TABLE `tipos_de_respuesta` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(80) NOT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos_de_respuesta`
--

INSERT INTO `tipos_de_respuesta` (`id_tipo`, `tipo`, `fecha_creacion`) VALUES
(1, 'Cerrada si-no', NULL),
(2, 'Escala númerica 1-5', NULL),
(3, 'Escala ordinal bajo-alto', NULL),
(4, 'Escala ordinal bien-mal', NULL),
(5, 'Escala ordinal mucho-poco', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int(3) NOT NULL,
  `turno` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id_turno`, `turno`, `hora_inicio`, `hora_fin`, `activo`) VALUES
(1, 'et', '20:30:04', '04:13:57', 1),
(2, 'tempore', '22:48:50', '16:10:03', 1),
(3, 'commodi', '23:28:23', '07:33:48', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'odio rem aut voluptates', '222', '$2y$10$I3rjN/KRNIfPkFi3wC1PHOlkEvsyyKVySPAl/4QiynVCgH78btdjm', NULL, 'primer@controlador.p', 1, 1569729461, 1569729461, 'qQwmiM0NUqkpY0aFZYyUkAMekyk7HFDdvRx5oElx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_personal` int(3) NOT NULL,
  `id_turno` int(3) NOT NULL,
  `id_posicion` int(3) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasena` varchar(200) NOT NULL DEFAULT '0000',
  `nuevo_intento` tinyint(4) DEFAULT '0',
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_personal`, `id_turno`, `id_posicion`, `email`, `contrasena`, `nuevo_intento`, `fecha_creacion`) VALUES
(1, 1, 1, 'el@administrador.p', 'eyJpdiI6ImY4dUEwWVB0Z1NnXC94VWEwdTZUYk9RPT0iLCJ2YWx1ZSI6Imh5TjRXXC9icmkxa1VYdUU5U3AwUlhnPT0iLCJtYWMiOiJlMDJiZThjNTZjYzAyOTU4NjFiZDQ5MWQ1MDMxNGVkOGY4ZmMwYTMzMDJhYWY5ZjUzNGViYzY3ODE3MjUzODcyIn0=', 0, NULL),
(2, 1, 2, 'primer@controlador.p', 'eyJpdiI6IkcrbENEMGJyWGxFQzlTQUFXUUg3dnc9PSIsInZhbHVlIjoiNnp5TTRTamlLbmdwUWRURENZRDlyZz09IiwibWFjIjoiNmQ1ZDZmNzVkYmY5MGYyMTU2YzIyM2NlYWQ5Y2VhYjUyMjFhYmIwNmI5ZWMzMGFjYzI0ODQ2NTNlYWJmMGNmNSJ9', 0, NULL),
(3, 1, 3, 'el@supervisor.p', 'eyJpdiI6InEzbEU0Z2p1TUJ3YzVGUmRRc2w4RUE9PSIsInZhbHVlIjoiRTVRa0I5RXVsV1Y1SnhrTndXQ1l1QT09IiwibWFjIjoiNWM1OWZmMDViYjVhYTBhNGVlMDc3MDM2ZWM0MzZiN2NjNTU3OGM1ODI4M2E4MDQ4YzNjYjExMzlkMjVkM2JmMyJ9', 0, NULL),
(4, 1, 4, 'RR@HH.p', 'eyJpdiI6IklqY0lBZzRDWXlsXC9WR0NmS25IMnV3PT0iLCJ2YWx1ZSI6IkZtalpnYW02QUxXajhIWEoyR3FJMkE9PSIsIm1hYyI6IjYyN2Y2YzJlYWFjMDQ3OWM5ZDdlM2Y0ZmM4MTUwZmVhZGZmMzZmNGVmYWY2OTQ2MjI0NTRjYjc5NzhhZjc2OWQifQ==', 0, NULL),
(5, 2, 4, 'hahn.rhea@hoppe.com', 'eyJpdiI6IjdvVkhXKzJSS1RROGRSdXliSksrYlE9PSIsInZhbHVlIjoiS3g1OUZpRnk1QnRuXC9XdFpSUVk1RVE9PSIsIm1hYyI6Ijk5ZWE2OWFjOGQ3Mzc1MGY5NWVlNWU5NTQ5YTBiOTJhMzE4MDJjNDI3NjMwMDVhZjRhZTIxOTlmMzEyNWFhNGYifQ==', 0, NULL),
(6, 1, 2, 'milan56@hirthe.net', 'eyJpdiI6ImZ2c3d2WHl2bmdqZExEd0VxTE9cL093PT0iLCJ2YWx1ZSI6InVyY05QM25EamR1V0xJbVVheG9RMEE9PSIsIm1hYyI6IjNiM2EwZTkzY2EzNDNjY2JjNmU1NWRiZTRlZDcyYjdiMzBiYWZiNjJjMTMwOTdmNWFhMjc0OGIyMTU5MjIwZTAifQ==', 0, NULL),
(7, 2, 2, 'lenore.thiel@ryan.com', 'eyJpdiI6IlgwQkRrWnU1d3NleW1vTUJvNFZOclE9PSIsInZhbHVlIjoiVytpYnoxZ3R3RTRQR2FWNFNLOTlEdz09IiwibWFjIjoiMDhjZjU3NTQ2MTA3OWM4MmE3NzM5NjI5ZmVmNDMwYTIzMWFlNWM2ZGNhNWM1OWVhMjc2MWVkNmI2ZGI5MmM1OCJ9', 0, NULL),
(8, 1, 3, 'oreilly.julian@hotmail.com', 'eyJpdiI6IlVjTnFhNmpBU3BobTRKUTF3Tkg0bGc9PSIsInZhbHVlIjoiR3lhM0xqWDF2VWV4K3BjU0JYRVMxdz09IiwibWFjIjoiZDAzYzJhYTM1NDdiMDk2MjY5NzFhN2Y1MjM2YjNiMTczMTAxNTE0YjRiNWVhMjczZTVhYzJjNzk3YWUzZGIxZCJ9', 0, NULL),
(9, 3, 3, 'glenda.hammes@gmail.com', 'eyJpdiI6Iml5V3cyM0RGbVFybStpR2dVTnFOOFE9PSIsInZhbHVlIjoiaEZMcVFzcXh5UTZ0M255anZKTE83QT09IiwibWFjIjoiMmMyYjczOTQxNDNhYmFkYjM4NzIzNGFhZDg4ODY3OTM5Mjc5ODA4YzlhNjM2MDhiNTdmOWU1OTdlODAzYjU0OCJ9', 0, NULL),
(10, 1, 2, 'fritz08@hotmail.com', 'eyJpdiI6Ijg5Q0JSTVZCeUdoc0VaTnV1WlhCbVE9PSIsInZhbHVlIjoiM01mQVhDeWxYOEgybUhlTEZwcVwvRmc9PSIsIm1hYyI6ImFiZDFkNzYyZjE4YWNlZDA0MGNkY2Q5Y2E5NGU0OWNjYmVmMzE5YmRiY2E4NjliYTY5MDE1N2Y3MTdiY2IxMzgifQ==', 0, NULL),
(11, 2, 1, 'lacy99@borer.com', 'eyJpdiI6ImFoVDlaRTM4ajJDUjdYR2tRZkFoRFE9PSIsInZhbHVlIjoiM0xFYnVYK3F4dHJRaVloUjNPZWlhZz09IiwibWFjIjoiYjAxMDIwNmRhM2Y3YjM0NWNmYjk0MDVjODg3MzM2ZDI1OTA5MWFlZmIyZDUzOGEzN2I4MWFjNWRiNzk5YmIzMSJ9', 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas_de_preguntas`
--
ALTER TABLE `areas_de_preguntas`
  ADD PRIMARY KEY (`id_area`),
  ADD UNIQUE KEY `id_area_UNIQUE` (`id_area`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `log_usuarios`
--
ALTER TABLE `log_usuarios`
  ADD PRIMARY KEY (`id_log_usuario`),
  ADD UNIQUE KEY `id_log_usuario_UNIQUE` (`id_log_usuario`),
  ADD KEY `fk_log_usuarios_personal1_idx` (`id_personal`),
  ADD KEY `fk_log_usuarios_respuestas1_idx` (`id_respuesta`),
  ADD KEY `fk_log_usuarios_preguntas1_idx` (`id_pregunta`),
  ADD KEY `fk_log_usuarios_areas_de_preguntas1_idx` (`id_area`),
  ADD KEY `fk_log_usuarios_turnos1_idx` (`id_turno`);

--
-- Indices de la tabla `perdidas_de_contrasena`
--
ALTER TABLE `perdidas_de_contrasena`
  ADD PRIMARY KEY (`id_perdida`),
  ADD UNIQUE KEY `id_perdida_UNIQUE` (`id_perdida`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`);

--
-- Indices de la tabla `posicion`
--
ALTER TABLE `posicion`
  ADD PRIMARY KEY (`id_posicion`),
  ADD UNIQUE KEY `id_posicion_UNIQUE` (`id_posicion`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`,`id_area`,`id_tipo`,`contenido`),
  ADD UNIQUE KEY `id_pregunta_UNIQUE` (`id_pregunta`),
  ADD KEY `fk_preguntas_areas_de_preguntas1_idx` (`id_area`),
  ADD KEY `fk_preguntas_tipos_de_respuesta1_idx` (`id_tipo`);

--
-- Indices de la tabla `pregunta_filtro`
--
ALTER TABLE `pregunta_filtro`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD UNIQUE KEY `id_pregunta_UNIQUE` (`id_pregunta`);

--
-- Indices de la tabla `razones`
--
ALTER TABLE `razones`
  ADD PRIMARY KEY (`id_razon`),
  ADD UNIQUE KEY `id_razon_UNIQUE` (`id_razon`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id_respuesta`,`id_tipo`),
  ADD UNIQUE KEY `id_pregunta_UNIQUE` (`id_respuesta`),
  ADD KEY `fk_respuestas_tipos_de_respuesta1_idx` (`id_tipo`);

--
-- Indices de la tabla `seglog`
--
ALTER TABLE `seglog`
  ADD PRIMARY KEY (`SegLogKey`);

--
-- Indices de la tabla `tipos_de_respuesta`
--
ALTER TABLE `tipos_de_respuesta`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_personal`,`id_turno`,`id_posicion`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `id_personal_UNIQUE` (`id_personal`),
  ADD KEY `fk_datos_adiciones_turnos1_idx` (`id_turno`),
  ADD KEY `fk_datos_adiciones_posicion1_idx` (`id_posicion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas_de_preguntas`
--
ALTER TABLE `areas_de_preguntas`
  MODIFY `id_area` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `log_usuarios`
--
ALTER TABLE `log_usuarios`
  MODIFY `id_log_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perdidas_de_contrasena`
--
ALTER TABLE `perdidas_de_contrasena`
  MODIFY `id_perdida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `posicion`
--
ALTER TABLE `posicion`
  MODIFY `id_posicion` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id_pregunta` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pregunta_filtro`
--
ALTER TABLE `pregunta_filtro`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `razones`
--
ALTER TABLE `razones`
  MODIFY `id_razon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id_respuesta` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `seglog`
--
ALTER TABLE `seglog`
  MODIFY `SegLogKey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_de_respuesta`
--
ALTER TABLE `tipos_de_respuesta`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id_turno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `log_usuarios`
--
ALTER TABLE `log_usuarios`
  ADD CONSTRAINT `fk_log_usuarios_areas_de_preguntas1` FOREIGN KEY (`id_area`) REFERENCES `areas_de_preguntas` (`id_area`),
  ADD CONSTRAINT `fk_log_usuarios_personal1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  ADD CONSTRAINT `fk_log_usuarios_preguntas1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`),
  ADD CONSTRAINT `fk_log_usuarios_respuestas1` FOREIGN KEY (`id_respuesta`) REFERENCES `respuestas` (`id_respuesta`),
  ADD CONSTRAINT `fk_log_usuarios_turnos1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `fk_preguntas_areas_de_preguntas1` FOREIGN KEY (`id_area`) REFERENCES `areas_de_preguntas` (`id_area`),
  ADD CONSTRAINT `fk_preguntas_tipos_de_respuesta1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_de_respuesta` (`id_tipo`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_respuestas_tipos_de_respuesta1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_de_respuesta` (`id_tipo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_datos_adiciones_personal1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  ADD CONSTRAINT `fk_datos_adiciones_posicion1` FOREIGN KEY (`id_posicion`) REFERENCES `posicion` (`id_posicion`),
  ADD CONSTRAINT `fk_datos_adiciones_turnos1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
