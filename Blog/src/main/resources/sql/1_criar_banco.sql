-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
-- DROP SCHEMA blog;
-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `moderador` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`postagens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  `texto` TEXT NOT NULL,
  `datahora` DATETIME NOT NULL DEFAULT NOW(),
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_postagens_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_postagens_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `blog`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `texto` TEXT NOT NULL,
  `datahora` DATETIME NOT NULL DEFAULT NOW(),
  `ativo` TINYINT NOT NULL DEFAULT 0,
  `postagens_id` INT NOT NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comentarios_postagens_idx` (`postagens_id` ASC) VISIBLE,
  INDEX `fk_comentarios_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_postagens`
    FOREIGN KEY (`postagens_id`)
    REFERENCES `blog`.`postagens` (`id`)
    ON DELETE cascade
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `blog`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;