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
  `verification_token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
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
  `id_area` INT(6) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_area`),
  UNIQUE INDEX `id_area_UNIQUE` (`id_area` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`preguntas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`preguntas` ;

CREATE TABLE IF NOT EXISTS `db_is`.`preguntas` (
  `id_pregunta` INT(6) NOT NULL AUTO_INCREMENT,
  `contenido` VARCHAR(100) NOT NULL,
  `fecha_creacion` VARCHAR(45) NULL,
  `id_area` INT(6) NOT NULL,
  PRIMARY KEY (`id_pregunta`),
  UNIQUE INDEX `id_pregunta_UNIQUE` (`id_pregunta` ASC) VISIBLE,
  INDEX `fk_preguntas_areas_de_preguntas1_idx` (`id_area` ASC) VISIBLE,
  CONSTRAINT `fk_preguntas_areas_de_preguntas1`
    FOREIGN KEY (`id_area`)
    REFERENCES `db_is`.`areas_de_preguntas` (`id_area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`respuestas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`respuestas` ;

CREATE TABLE IF NOT EXISTS `db_is`.`respuestas` (
  `id_respuesta` INT(6) NOT NULL AUTO_INCREMENT,
  `contenido` VARCHAR(100) NOT NULL,
  `fecha_creacion` VARCHAR(45) NULL,
  `id_pregunta` INT(6) NOT NULL,
  PRIMARY KEY (`id_respuesta`),
  UNIQUE INDEX `id_pregunta_UNIQUE` (`id_respuesta` ASC) VISIBLE,
  INDEX `fk_respuestas_preguntas1_idx` (`id_pregunta` ASC) VISIBLE,
  CONSTRAINT `fk_respuestas_preguntas1`
    FOREIGN KEY (`id_pregunta`)
    REFERENCES `db_is`.`preguntas` (`id_pregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_is`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_is`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `db_is`.`usuarios` (
  `id_personal` INT(3) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(200) NOT NULL DEFAULT '0000',
  `id_turno` INT(3) NOT NULL,
  `id_posicion` INT(3) NOT NULL,
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

USE `db_is` ;

-- -----------------------------------------------------
-- procedure Guardar_reg_entrada
-- -----------------------------------------------------

USE `db_is`;
DROP procedure IF EXISTS `db_is`.`Guardar_reg_entrada`;

DELIMITER $$
USE `db_is`$$
CREATE PROCEDURE `Guardar_reg_entrada` (IN nombreUsuario varchar(255),
IN llaveAutorizacion varchar(32), IN hashContrasena varchar(255),
IN correo varchar(255),IN estado smallint(6))
BEGIN
INSERT INTO `user`(`username`, `auth_key`, `password_hash`, 
`email`, `status`, `created_at`, 
`updated_at`) 
VALUES (nombreUsuario,llaveAutorizacion,hashContrasena,
correo,estado,unix_timestamp(),unix_timestamp());
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
