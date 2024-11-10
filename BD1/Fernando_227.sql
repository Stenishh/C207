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
  `NOME` VARCHAR(45) NOT NULL,
  `IDADE` INT NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDiretor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Faculdade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Faculdade` (
  `idFaculdade` INT NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  `ENDERECO` VARCHAR(45) NOT NULL,
  `TELEFONE` VARCHAR(45) NOT NULL,
  `Diretor_idDiretor` INT NOT NULL,
  PRIMARY KEY (`idFaculdade`),
  INDEX `fk_Faculdade_Diretor_idx` (`Diretor_idDiretor` ASC) VISIBLE,
  CONSTRAINT `fk_Faculdade_Diretor`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `mydb`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` INT NOT NULL,
  `NomeMatri` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Idade` INT NOT NULL,
  `Periodo` INT NOT NULL,
  `Diretor_idDiretor` INT NOT NULL,
  PRIMARY KEY (`idAluno`),
  INDEX `fk_Aluno_Diretor1_idx` (`Diretor_idDiretor` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_Diretor1`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `mydb`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `idProfessor` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Idade` INT NOT NULL,
  `Materia` VARCHAR(45) NOT NULL,
  `Faculdade_idFaculdade` INT NOT NULL,
  `Aluno_idAluno` INT NOT NULL,
  PRIMARY KEY (`idProfessor`, `Faculdade_idFaculdade`),
  INDEX `fk_Professor_Faculdade1_idx` (`Faculdade_idFaculdade` ASC) VISIBLE,
  INDEX `fk_Professor_Aluno1_idx` (`Aluno_idAluno` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Faculdade1`
    FOREIGN KEY (`Faculdade_idFaculdade`)
    REFERENCES `mydb`.`Faculdade` (`idFaculdade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professor_Aluno1`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `idCurso` INT NOT NULL,
  `Cursocol` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  `Aluno_idAluno` INT NOT NULL,
  PRIMARY KEY (`idCurso`),
  INDEX `fk_Curso_Aluno1_idx` (`Aluno_idAluno` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_Aluno1`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Curso_has_Faculdade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso_has_Faculdade` (
  `Curso_idCurso` INT NOT NULL,
  `Faculdade_idFaculdade` INT NOT NULL,
  PRIMARY KEY (`Curso_idCurso`, `Faculdade_idFaculdade`),
  INDEX `fk_Curso_has_Faculdade_Faculdade1_idx` (`Faculdade_idFaculdade` ASC) VISIBLE,
  INDEX `fk_Curso_has_Faculdade_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_has_Faculdade_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `mydb`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Faculdade_Faculdade1`
    FOREIGN KEY (`Faculdade_idFaculdade`)
    REFERENCES `mydb`.`Faculdade` (`idFaculdade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
