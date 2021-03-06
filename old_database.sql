-- MySQL Script generated by MySQL Workbench
-- Mon Sep  2 20:05:49 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dw2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dw2` ;

-- -----------------------------------------------------
-- Schema dw2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dw2` DEFAULT CHARACTER SET utf8 ;
USE `dw2` ;

-- -----------------------------------------------------
-- Table `dw2`.`bandeja`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw2`.`bandeja` ;

CREATE TABLE IF NOT EXISTS `dw2`.`bandeja` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `preco` FLOAT(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)ENGINE = InnoDB;

INSERT INTO `bandeja` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Retangular', 'Bandeja Retangular 40cm x 20cm', 20.00),
(2, 'Redonda', 'Bandeja Redonda diametro 30cm', 20.00),
(3, 'Quadrada', 'Bandeja Quadrada 30cm x 30cm', 20.00);

-- -----------------------------------------------------
-- Table `dw2`.`massa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw2`.`massa` ;

CREATE TABLE IF NOT EXISTS `dw2`.`massa` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `preco` FLOAT(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)ENGINE = InnoDB;

INSERT INTO `massa` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Chocolate', 'Massa de chocolate', 10.00),
(2, 'Abacaxi', 'Massa de baunilha com abacaxi', 15.00),
(3, 'Baunilha', 'Massa de baunilha', 9.00),
(4, 'Morango', 'Massa de baunilha com morangos', 15.00);

-- -----------------------------------------------------
-- Table `dw2`.`sabor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw2`.`sabor` ;

CREATE TABLE IF NOT EXISTS `dw2`.`sabor` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `preco` FLOAT(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)ENGINE = InnoDB;

INSERT INTO `sabor` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Chocolate', 'Recheio ganache chocolate', 10.00),
(2, 'Leite Ninho', 'Recheio de leite ninho', 10.00),
(3, 'Morango', 'Recheio ganache chocolate branco ou preto com pedaços de morango', 13.00),
(4, 'Abacaxi', 'Recheio ganache chocolate branco ou preto com pedaços de abacaxi', 13.00);

-- -----------------------------------------------------
-- Table `dw2`.`cobertura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw2`.`cobertura` ;

CREATE TABLE IF NOT EXISTS `dw2`.`cobertura` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `preco` FLOAT(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)ENGINE = InnoDB;

INSERT INTO `cobertura` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Chocolate', 'Cobertura chocolate derretido', 10.00),
(2, 'Morango', 'Cobertura geleia de morango', 15.00),
(3, 'Brigadeiro', 'Cobertura de brigadeiro', 8.00),
(4, 'Chantilly', 'Cobertura de chantilly', 13.00);

-- -----------------------------------------------------
-- Table `dw2`.`confeito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw2`.`confeito` ;

CREATE TABLE IF NOT EXISTS `dw2`.`confeito` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `preco` FLOAT(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)ENGINE = InnoDB;

INSERT INTO `confeito` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Granulado', 'Cobertura de granulado preto ou colorido', 10.00),
(2, 'Crispy', 'Bolinhas de chocolate', 12.00),
(3, 'Split', 'Raspas de chocolate', 14.00);

-- -----------------------------------------------------
-- Table `dw2`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw2`.`status` ;

CREATE TABLE IF NOT EXISTS `dw2`.`status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)ENGINE = InnoDB;

INSERT INTO `status` (`id`, `nome`) VALUES
(1, 'Recebido'),
(2, 'Em Produção'),
(3, 'Concluido'),
(4, 'Entregue'),
(5, 'Finalizado'),
(6, 'Cancelado');

-- -----------------------------------------------------
-- Table `dw2`.`pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw2`.`pessoa` ;

CREATE TABLE IF NOT EXISTS `dw2`.`pessoa` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `endereco` VARCHAR(255) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)ENGINE = InnoDB;

INSERT INTO `pessoa` (`id`, `nome`, `email`, `endereco`, `numero`, `bairro`, `complemento`, `telefone`) VALUES
(10, 'teste1', 'teste@gmail.com', 'av maestro heitor de carvalho', '655', 'massaguaçu', NULL, '1298217333'),
(11, 'teste2', 'teste2@gmail.com', 'av maestro heitor de carvalho', '656', 'massaguaçu', NULL, '1298217335');

-- -----------------------------------------------------
-- Table `dw2`.`pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw2`.`pedido` ;

CREATE TABLE IF NOT EXISTS `dw2`.`pedido` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `preco` VARCHAR(45) NOT NULL,
  `data_pedido` VARCHAR(45) NOT NULL,
  `data_entrega` VARCHAR(45) NOT NULL,
  `status_id` INT UNSIGNED NOT NULL,
  `bandeja_id` INT UNSIGNED NOT NULL,
  `massa_id` INT UNSIGNED NOT NULL,
  `sabor1_id` INT UNSIGNED NOT NULL,
  `sabor2_id` INT UNSIGNED NOT NULL,
  `cobertura_id` INT UNSIGNED NOT NULL,
  `confeito_id` INT UNSIGNED NOT NULL,
  `pessoa_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_pedido_status_idx` (`status_id` ASC) ,
  INDEX `fk_pedido_bandeja_idx` (`bandeja_id` ASC) ,
  INDEX `fk_pedido_massa_idx` (`massa_id` ASC) ,
  INDEX `fk_pedido_sabor1_idx` (`sabor1_id` ASC) ,
  INDEX `fk_pedido_sabor2_idx` (`sabor2_id` ASC) ,
  INDEX `fk_pedido_cobertura_idx` (`cobertura_id` ASC) ,
  INDEX `fk_pedido_confeito_idx` (`confeito_id` ASC) ,
  INDEX `fk_pedido_pessoa_idx` (`pessoa_id` ASC) ,
  CONSTRAINT `fk_pedido_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `dw2`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_bandeja`
    FOREIGN KEY (`bandeja_id`)
    REFERENCES `dw2`.`bandeja` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_massa`
    FOREIGN KEY (`massa_id`)
    REFERENCES `dw2`.`massa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_sabor1`
    FOREIGN KEY (`sabor1_id`)
    REFERENCES `dw2`.`sabor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_sabor2`
    FOREIGN KEY (`sabor2_id`)
    REFERENCES `dw2`.`sabor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_cobertura`
    FOREIGN KEY (`cobertura_id`)
    REFERENCES `dw2`.`cobertura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_confeito`
    FOREIGN KEY (`confeito_id`)
    REFERENCES `dw2`.`confeito` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_pessoa`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `dw2`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;

INSERT INTO `pedido` (`id`, `preco`, `data_pedido`, `data_entrega`, `status_id`, `forma_id`, `massa_id`, `sabor_id`, `peso`, `cobertura_id`, `confeito_id`, `pessoa_id`) VALUES
(3, '100', '2019-09-24 18:38:18.548', '2019-09-24 18:38:18.549', 1, 1, 1, 1, 1, 1, 1, 10),
(4, '100', '2019-09-24 18:40:18.383', '2019-09-24 18:40:18.383', 1, 1, 1, 1, 2, 1, 1, 11);

-- -----------------------------------------------------
-- Table `dw2`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dw2`.`admin` ;

CREATE TABLE IF NOT EXISTS `dw2`.`admin` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
