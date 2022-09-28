-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EstudioJuridico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EstudioJuridico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EstudioJuridico` DEFAULT CHARACTER SET utf8 ;
USE `EstudioJuridico` ;

-- -----------------------------------------------------
-- Table `EstudioJuridico`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EstudioJuridico`.`Clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `celular` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  `DNI` INT NOT NULL,
  `CUIT` INT NOT NULL,
  `profesion` VARCHAR(45) NOT NULL,
  `estadoCivil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EstudioJuridico`.`Sociedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EstudioJuridico`.`Sociedades` (
  `idSociedades` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `numeroCorrelativo` INT NOT NULL,
  `CUIT` INT NOT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSociedades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EstudioJuridico`.`Juicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EstudioJuridico`.`Juicios` (
  `idJuicios` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `materia` VARCHAR(45) NOT NULL,
  `juzgado` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `idCliente` INT NULL,
  `idSociedades` INT NULL,
  PRIMARY KEY (`idJuicios`),
  INDEX `idcliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idSociedades_idx` (`idSociedades` ASC) VISIBLE,
  CONSTRAINT `FK_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `EstudioJuridico`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sociedades`
    FOREIGN KEY (`idSociedades`)
    REFERENCES `EstudioJuridico`.`Sociedades` (`idSociedades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EstudioJuridico`.`PresupuestosSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EstudioJuridico`.`PresupuestosSA` (
  `idPresupuestosSA` INT NOT NULL AUTO_INCREMENT,
  `reserva de nombre` DECIMAL(24,2) NOT NULL,
  `formulario IGJ` DECIMAL(24,2) NOT NULL,
  `tasa` DECIMAL(24,2) NOT NULL,
  `escritura` DECIMAL(24,2) NOT NULL,
  `copias` DECIMAL(24,2) NOT NULL,
  `edicto` DECIMAL(24,2) NOT NULL,
  `seguro` DECIMAL(24,2) NOT NULL,
  `gastos` DECIMAL(24,2) NOT NULL,
  `honorarios` DECIMAL(24,2) NOT NULL,
  `total` DECIMAL(24,2) NOT NULL,
  PRIMARY KEY (`idPresupuestosSA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EstudioJuridico`.`TramitesAdministrativos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EstudioJuridico`.`TramitesAdministrativos` (
  `idTramitesAdministrativos` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `idCliente` INT NULL,
  `idSociedades` INT NULL,
  `idPresupuestosSA` INT NOT NULL,
  PRIMARY KEY (`idTramitesAdministrativos`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idSociedades_idx` (`idSociedades` ASC) VISIBLE,
  INDEX `idPresupuestosSA_idx` (`idPresupuestosSA` ASC) VISIBLE,
  CONSTRAINT `FK_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `EstudioJuridico`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sociedades`
    FOREIGN KEY (`idSociedades`)
    REFERENCES `EstudioJuridico`.`Sociedades` (`idSociedades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PresupuestosSA`
    FOREIGN KEY (`idPresupuestosSA`)
    REFERENCES `EstudioJuridico`.`PresupuestosSA` (`idPresupuestosSA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
