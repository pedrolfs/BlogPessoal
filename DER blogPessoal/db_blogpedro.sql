-- MySQL Script generated by MySQL Workbench
-- Mon Jan 17 12:14:43 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_blogpedro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_blogpedro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_blogpedro` DEFAULT CHARACTER SET utf8 ;
USE `db_blogpedro` ;

-- -----------------------------------------------------
-- Table `db_blogpedro`.`tb_tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blogpedro`.`tb_tema` (
  `id_tema` BIGINT NOT NULL AUTO_INCREMENT,
  `descricao_tema` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_tema`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_blogpedro`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blogpedro`.`tb_usuario` (
  `id_usuario` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(255) NOT NULL,
  `login_usuario` VARCHAR(255) NOT NULL,
  `senha_usuario` VARCHAR(255) NOT NULL,
  `foto_usuario` VARCHAR(255) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_blogpedro`.`tb_postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blogpedro`.`tb_postagens` (
  `id_postagens` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo_post` VARCHAR(100) NOT NULL,
  `texto_post` VARCHAR(1000) NOT NULL,
  `data_post` DATE NULL,
  `id_tema` BIGINT NOT NULL,
  `id_usuario` BIGINT NOT NULL,
  PRIMARY KEY (`id_postagens`),
  INDEX `fk_tb_postagens_tb_tema_idx` (`id_tema` ASC) VISIBLE,
  INDEX `fk_tb_postagens_tb_usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagens_tb_tema`
    FOREIGN KEY (`id_tema`)
    REFERENCES `db_blogpedro`.`tb_tema` (`id_tema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagens_tb_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_blogpedro`.`tb_usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
