-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_is
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_is` ;

-- -----------------------------------------------------
-- Schema db_is
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_is` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_is` ;

-- -----------------------------------------------------
-- Table `db_is`.`personal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`personal` ;

CREATE TABLE IF NOT EXISTS `db_is`.`personal` (
  `id_personal` INT(3) NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_spanish_ci' NOT NULL,
  `apellidos` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_spanish_ci' NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `fecha_ingreso` DATE NOT NULL,
  `sexo` ENUM('M', 'F') CHARACTER SET 'latin1' COLLATE 'latin1_spanish_ci' NOT NULL,
  `no_empleado` VARCHAR(10) CHARACTER SET 'latin1' COLLATE 'latin1_spanish_ci' NOT NULL,
  `activo` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_personal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `db_is`.`posicion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`posicion` ;

CREATE TABLE IF NOT EXISTS `db_is`.`posicion` (
  `id_posicion` INT(3) NOT NULL AUTO_INCREMENT,
  `posicion` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_spanish_ci' NOT NULL,
  PRIMARY KEY (`id_posicion`),
  UNIQUE INDEX `id_posicion_UNIQUE` (`id_posicion` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `db_is`.`seglog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`seglog` ;

CREATE TABLE IF NOT EXISTS `db_is`.`seglog` (
  `SegLogKey` INT(11) NOT NULL AUTO_INCREMENT,
  `SegLogFecha` DATE NULL DEFAULT NULL,
  `SegLogHora` TIME NULL DEFAULT NULL,
  `SegUsrKey` INT(11) NULL DEFAULT NULL,
  `SegUsrUsuario` VARCHAR(20) NULL DEFAULT NULL,
  `SegLogDetalle` MEDIUMTEXT NULL DEFAULT NULL,
  `SegLogLlave` INT(11) NULL DEFAULT NULL,
  `SegLogTabla` VARCHAR(60) NULL DEFAULT NULL,
  `SegLogAccion` MEDIUMTEXT NULL DEFAULT NULL,
  `SegLogComando` MEDIUMTEXT NULL DEFAULT NULL,
  `SegLogIp` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`SegLogKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_is`.`turnos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`turnos` ;

CREATE TABLE IF NOT EXISTS `db_is`.`turnos` (
  `id_turno` INT(3) NOT NULL AUTO_INCREMENT,
  `turno` VARCHAR(25) CHARACTER SET 'latin1' COLLATE 'latin1_spanish_ci' NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fin` TIME NOT NULL,
  `activo` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_turno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `db_is`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`user` ;

CREATE TABLE IF NOT EXISTS `db_is`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `auth_key` VARCHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `password_hash` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `password_reset_token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `status` SMALLINT(6) NOT NULL DEFAULT '10',
  `created_at` INT(11) NOT NULL,
  `updated_at` INT(11) NOT NULL,
  `verification_token` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_is`.`areas_de_preguntas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`areas_de_preguntas` ;

CREATE TABLE IF NOT EXISTS `db_is`.`areas_de_preguntas` (
  `id_area` INT(6) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_area`),
  UNIQUE INDEX `id_area_UNIQUE` (`id_area` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`tipos_de_respuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`tipos_de_respuesta` ;

CREATE TABLE IF NOT EXISTS `db_is`.`tipos_de_respuesta` (
  `id_tipo` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(80) NOT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`preguntas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`preguntas` ;

CREATE TABLE IF NOT EXISTS `db_is`.`preguntas` (
  `id_pregunta` INT(6) NOT NULL AUTO_INCREMENT,
  `id_area` INT(6) NOT NULL,
  `id_tipo` INT NOT NULL,
  `contenido` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_pregunta`, `id_area`, `id_tipo`, `contenido`),
  UNIQUE INDEX `id_pregunta_UNIQUE` (`id_pregunta` ASC) VISIBLE,
  INDEX `fk_preguntas_areas_de_preguntas1_idx` (`id_area` ASC) VISIBLE,
  INDEX `fk_preguntas_tipos_de_respuesta1_idx` (`id_tipo` ASC) VISIBLE,
  CONSTRAINT `fk_preguntas_areas_de_preguntas1`
    FOREIGN KEY (`id_area`)
    REFERENCES `db_is`.`areas_de_preguntas` (`id_area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_preguntas_tipos_de_respuesta1`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `db_is`.`tipos_de_respuesta` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`respuestas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`respuestas` ;

CREATE TABLE IF NOT EXISTS `db_is`.`respuestas` (
  `id_respuesta` INT(6) NOT NULL AUTO_INCREMENT,
  `id_tipo` INT NOT NULL,
  `contenido` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_respuesta`, `id_tipo`),
  UNIQUE INDEX `id_pregunta_UNIQUE` (`id_respuesta` ASC) VISIBLE,
  INDEX `fk_respuestas_tipos_de_respuesta1_idx` (`id_tipo` ASC) VISIBLE,
  CONSTRAINT `fk_respuestas_tipos_de_respuesta1`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `db_is`.`tipos_de_respuesta` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `db_is`.`usuarios` (
  `id_personal` INT(3) NOT NULL,
  `id_turno` INT(3) NOT NULL,
  `id_posicion` INT(3) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(200) NOT NULL DEFAULT '0000',
  `nuevo_intento` TINYINT NULL DEFAULT 0,
  `fecha_creacion` DATETIME NULL,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  PRIMARY KEY (`id_personal`, `id_turno`, `id_posicion`),
  INDEX `fk_datos_adiciones_turnos1_idx` (`id_turno` ASC) VISIBLE,
  INDEX `fk_datos_adiciones_posicion1_idx` (`id_posicion` ASC) VISIBLE,
  UNIQUE INDEX `id_personal_UNIQUE` (`id_personal` ASC) VISIBLE,
  CONSTRAINT `fk_datos_adiciones_personal1`
    FOREIGN KEY (`id_personal`)
    REFERENCES `db_is`.`personal` (`id_personal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_adiciones_turnos1`
    FOREIGN KEY (`id_turno`)
    REFERENCES `db_is`.`turnos` (`id_turno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_adiciones_posicion1`
    FOREIGN KEY (`id_posicion`)
    REFERENCES `db_is`.`posicion` (`id_posicion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`log_usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`log_usuarios` ;

CREATE TABLE IF NOT EXISTS `db_is`.`log_usuarios` (
  `id_log_usuario` INT NOT NULL AUTO_INCREMENT,
  `id_personal` INT(3) NOT NULL,
  `id_respuesta` INT(6) NOT NULL,
  `id_area` INT(6) NULL,
  `id_pregunta` INT(6) NULL,
  `id_turno` INT(3) NULL,
  `ip` VARCHAR(20) NULL,
  `es_pregunta_filtro` TINYINT NULL DEFAULT 0,
  `fecha_creacion` DATETIME NULL,
  PRIMARY KEY (`id_log_usuario`),
  INDEX `fk_log_usuarios_personal1_idx` (`id_personal` ASC) VISIBLE,
  INDEX `fk_log_usuarios_respuestas1_idx` (`id_respuesta` ASC) VISIBLE,
  INDEX `fk_log_usuarios_preguntas1_idx` (`id_pregunta` ASC) VISIBLE,
  INDEX `fk_log_usuarios_areas_de_preguntas1_idx` (`id_area` ASC) VISIBLE,
  UNIQUE INDEX `id_log_usuario_UNIQUE` (`id_log_usuario` ASC) VISIBLE,
  INDEX `fk_log_usuarios_turnos1_idx` (`id_turno` ASC) VISIBLE,
  CONSTRAINT `fk_log_usuarios_personal1`
    FOREIGN KEY (`id_personal`)
    REFERENCES `db_is`.`personal` (`id_personal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_usuarios_respuestas1`
    FOREIGN KEY (`id_respuesta`)
    REFERENCES `db_is`.`respuestas` (`id_respuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_usuarios_preguntas1`
    FOREIGN KEY (`id_pregunta`)
    REFERENCES `db_is`.`preguntas` (`id_pregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_usuarios_areas_de_preguntas1`
    FOREIGN KEY (`id_area`)
    REFERENCES `db_is`.`areas_de_preguntas` (`id_area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_usuarios_turnos1`
    FOREIGN KEY (`id_turno`)
    REFERENCES `db_is`.`turnos` (`id_turno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`pregunta_filtro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`pregunta_filtro` ;

CREATE TABLE IF NOT EXISTS `db_is`.`pregunta_filtro` (
  `id_pregunta` INT NOT NULL AUTO_INCREMENT,
  `pregunta` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `fecha_modificacion` DATE NOT NULL,
  PRIMARY KEY (`id_pregunta`),
  UNIQUE INDEX `id_pregunta_UNIQUE` (`id_pregunta` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`razones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`razones` ;

CREATE TABLE IF NOT EXISTS `db_is`.`razones` (
  `id_razon` INT NOT NULL AUTO_INCREMENT,
  `razon` VARCHAR(500) NULL,
  `fecha_creacion` DATETIME NULL,
  PRIMARY KEY (`id_razon`),
  UNIQUE INDEX `id_razon_UNIQUE` (`id_razon` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`perdidas_de_contrasena`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`perdidas_de_contrasena` ;

CREATE TABLE IF NOT EXISTS `db_is`.`perdidas_de_contrasena` (
  `id_perdida` INT NOT NULL AUTO_INCREMENT,
  `ip` VARCHAR(20) NULL,
  `fecha_creacion` DATETIME NULL,
  PRIMARY KEY (`id_perdida`),
  UNIQUE INDEX `id_perdida_UNIQUE` (`id_perdida` ASC) VISIBLE)
ENGINE = InnoDB;

USE `db_is` ;

-- -----------------------------------------------------
-- procedure reg_entrada_guardar
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`reg_entrada_guardar`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `reg_entrada_guardar` (
	IN nombreUsuario varchar(255),
	IN llaveAutorizacion varchar(32), 
    IN hashContrasena varchar(255),
	IN correo varchar(255), 
    IN estado smallint(6), 
    IN token varchar(255)
)
BEGIN
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure area_guardar
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`area_guardar`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `area_guardar` (
	in nombre varchar(45),
    in descripcion varchar(300)
)
BEGIN
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure preg_filtro_crear
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`preg_filtro_crear`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `preg_filtro_crear` (
	in pregunta varchar(60)
)
BEGIN
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure preg_filtro_modificar
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`preg_filtro_modificar`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `preg_filtro_modificar` (
	in pregunta varchar(60)
)
BEGIN
	INSERT INTO `pregunta_filtro`(
		`pregunta`,
        `fecha_modificacion`
    )
    VALUES(
		pregunta,
        now()
    );
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure log_usuarios_guardar
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`log_usuarios_guardar`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `log_usuarios_guardar` (
	in id_personal int,
    in id_respuesta int,
    in id_area int,
    in id_pregunta int,
    in id_turno int,
    in ip varchar(20),
    in es_pregunta_fltro tinyint
)
BEGIN
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure pregunta_crear
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`pregunta_crear`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `pregunta_crear` (
	in id_area int,
    in id_tipo int,
    in contenido varchar(100)
)
BEGIN
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure log_guardar
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`log_guardar`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `log_guardar` (
	in log_key int,
	in user_key int,
    in usuario varchar(20),
    in detalle mediumtext,
    in llave int,
    in tabla varchar(60),
    in accion mediumtext,
    in comando mediumtext,
    in ip varchar(20)
)
BEGIN
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure seglog_guardar
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`seglog_guardar`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `seglog_guardar` (
	IN noEmpleado int,
    IN nombre varchar(20),
    IN accion mediumtext,
    IN tabla varchar(60),
    IN accionTabla mediumtext,
    IN comando mediumtext,
    IN ip varchar(20)
)
BEGIN
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

DELIMITER ;

-- -----------------------------------------------------
-- procedure usuarios_guardar
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`usuarios_guardar`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `usuarios_guardar` (
		in idPersonal int,
        in idTurno int,
        in idPosicion int,
        in email varchar(45),
        in contrasena varchar(200)
)
BEGIN
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

-- -----------------------------------------------------
-- procedure perdidas_de_contrasena_guardar
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`perdidas_de_contrasena_guardar`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `perdidas_de_contrasena_guardar` (
			in ip varchar(20)
)
BEGIN
	INSERT INTO `perdidas_de_contrasena`(
			`ip`, 
            `fecha_creacion`
	) VALUES (
			ip,
            now()
	);
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
