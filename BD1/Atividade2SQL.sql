-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diretor` (
  `idDiretor` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDiretor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filme` (
  `idFilme` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  `Tempo` INT NULL,
  `Preco` VARCHAR(45) NULL,
  `Diretor_idDiretor` INT NOT NULL,
  PRIMARY KEY (`idFilme`),
  INDEX `fk_Filme_Diretor1_idx` (`Diretor_idDiretor` ASC) VISIBLE,
  CONSTRAINT `fk_Filme_Diretor1`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `mydb`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Streaming`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Streaming` (
  `idDiretor` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Produtora` VARCHAR(45) NOT NULL,
  `Preco` DOUBLE NOT NULL,
  `QntdAssinante` INT NULL,
  `Filme_idFilme` INT NOT NULL,
  PRIMARY KEY (`idDiretor`),
  INDEX `fk_Streaming_Filme_idx` (`Filme_idFilme` ASC) VISIBLE,
  CONSTRAINT `fk_Streaming_Filme`
    FOREIGN KEY (`Filme_idFilme`)
    REFERENCES `mydb`.`Filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ator` (
  `idAtor` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Idade` INT NOT NULL,
  `ContatoOpcional` VARCHAR(45) NULL,
  PRIMARY KEY (`idAtor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Personagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personagem` (
  `idPersonagem` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `PapelNoFilme` VARCHAR(45) NOT NULL,
  `Ator_idAtor` INT NOT NULL,
  PRIMARY KEY (`idPersonagem`),
  INDEX `fk_Personagem_Ator1_idx` (`Ator_idAtor` ASC) VISIBLE,
  CONSTRAINT `fk_Personagem_Ator1`
    FOREIGN KEY (`Ator_idAtor`)
    REFERENCES `mydb`.`Ator` (`idAtor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Filme_has_Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filme_has_Ator` (
  `Filme_idFilme` INT NOT NULL,
  `Ator_idAtor` INT NOT NULL,
  PRIMARY KEY (`Filme_idFilme`, `Ator_idAtor`),
  INDEX `fk_Filme_has_Ator_Ator1_idx` (`Ator_idAtor` ASC) VISIBLE,
  INDEX `fk_Filme_has_Ator_Filme1_idx` (`Filme_idFilme` ASC) VISIBLE,
  CONSTRAINT `fk_Filme_has_Ator_Filme1`
    FOREIGN KEY (`Filme_idFilme`)
    REFERENCES `mydb`.`Filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_has_Ator_Ator1`
    FOREIGN KEY (`Ator_idAtor`)
    REFERENCES `mydb`.`Ator` (`idAtor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
