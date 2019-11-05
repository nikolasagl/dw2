-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 26/09/2019 às 18:54
-- Versão do servidor: 10.1.37-MariaDB
-- Versão do PHP: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dw2`
--

-- --------------------------------------------------------

-- -----------------------------------------------------
-- Schema dw2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dw2` ;

-- -----------------------------------------------------
-- Schema dw2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dw2` DEFAULT CHARACTER SET utf8 ;
USE `dw2` ;

--
-- Estrutura para tabela `admin`
--

CREATE TABLE `admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bandeja`
--

CREATE TABLE `bandeja` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `preco` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `bandeja`
--

INSERT INTO `bandeja` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Retangular', 'Bandeja Retangular 40cm x 20cm', 20.00),
(2, 'Redonda', 'Bandeja Redonda diametro 30cm', 20.00),
(3, 'Quadrada', 'Bandeja Quadrada 30cm x 30cm', 20.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cobertura`
--

CREATE TABLE `cobertura` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `preco` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `cobertura`
--

INSERT INTO `cobertura` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Chocolate', 'Cobertura chocolate derretido', 10.00),
(2, 'Morango', 'Cobertura geleia de morango', 15.00),
(3, 'Brigadeiro', 'Cobertura de brigadeiro', 8.00),
(4, 'Chantilly', 'Cobertura de chantilly', 13.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `confeito`
--

CREATE TABLE `confeito` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `preco` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `confeito`
--

INSERT INTO `confeito` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Granulado', 'Cobertura de granulado preto ou colorido', 10.00),
(2, 'Crispy', 'Bolinhas de chocolate', 12.00),
(3, 'Split', 'Raspas de chocolate', 14.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `massa`
--

CREATE TABLE `massa` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `preco` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `massa`
--

INSERT INTO `massa` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Chocolate', 'Massa de chocolate', 10.00),
(2, 'Abacaxi', 'Massa de baunilha com abacaxi', 15.00),
(3, 'Baunilha', 'Massa de baunilha', 9.00),
(4, 'Morango', 'Massa de baunilha com morangos', 15.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` int(10) UNSIGNED NOT NULL,
  `preco` varchar(45) NOT NULL,
  `data_pedido` DATE NOT NULL,
  `data_entrega` DATE NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `bandeja_id` int(10) UNSIGNED NOT NULL,
  `massa_id` int(10) UNSIGNED NOT NULL,
  `sabor_id` int(10) UNSIGNED NOT NULL,
  `peso` int(10) NOT NULL,
  `cobertura_id` int(10) UNSIGNED NOT NULL,
  `confeito_id` int(10) UNSIGNED NOT NULL,
  `pessoa_id` int(10) UNSIGNED NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id`, `preco`, `data_pedido`, `data_entrega`, `status_id`, `bandeja_id`, `massa_id`, `sabor_id`, `peso`, `cobertura_id`, `confeito_id`, `pessoa_id`) VALUES
(3, '100', '2019-09-24 18:38:18.548', '2019-09-24 18:38:18.549', 1, 1, 1, 1, 1, 1, 1, 10),
(4, '100', '2019-09-24 18:40:18.383', '2019-09-24 18:40:18.383', 1, 1, 1, 1, 2, 1, 1, 11);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `endereco` varchar(255) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `telefone` varchar(12) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `email`, `endereco`, `numero`, `bairro`, `complemento`, `telefone`) VALUES
(10, 'teste1', 'teste@gmail.com', 'av maestro heitor de carvalho', '655', 'massaguaçu', NULL, '1298217333'),
(11, 'teste2', 'teste2@gmail.com', 'av maestro heitor de carvalho', '656', 'massaguaçu', NULL, '1298217335');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sabor`
--

CREATE TABLE `sabor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `preco` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `sabor`
--

INSERT INTO `sabor` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Chocolate', 'Recheio ganache chocolate', 10.00),
(2, 'Leite Ninho', 'Recheio de leite ninho', 10.00),
(3, 'Morango', 'Recheio ganache chocolate branco ou preto com pedaços de morango', 13.00),
(4, 'Abacaxi', 'Recheio ganache chocolate branco ou preto com pedaços de abacaxi', 13.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `status`
--

CREATE TABLE `status` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `status`
--

INSERT INTO `status` (`id`, `nome`) VALUES
(1, 'Recebido'),
(2, 'Em Produção'),
(3, 'Concluido'),
(4, 'Entregue'),
(5, 'Finalizado'),
(6, 'Cancelado');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Índices de tabela `bandeja`
--
ALTER TABLE `bandeja`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Índices de tabela `cobertura`
--
ALTER TABLE `cobertura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Índices de tabela `confeito`
--
ALTER TABLE `confeito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Índices de tabela `massa`
--
ALTER TABLE `massa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_pedido_status_idx` (`status_id`),
  ADD KEY `fk_pedido_bandeja_idx` (`bandeja_id`),
  ADD KEY `fk_pedido_massa_idx` (`massa_id`),
  ADD KEY `fk_pedido_sabor_idx` (`sabor_id`),
  ADD KEY `fk_pedido_cobertura_idx` (`cobertura_id`),
  ADD KEY `fk_pedido_confeito_idx` (`confeito_id`),
  ADD KEY `fk_pedido_pessoa_idx` (`pessoa_id`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Índices de tabela `sabor`
--
ALTER TABLE `sabor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Índices de tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bandeja`
--
ALTER TABLE `bandeja`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cobertura`
--
ALTER TABLE `cobertura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `confeito`
--
ALTER TABLE `confeito`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `massa`
--
ALTER TABLE `massa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `sabor`
--
ALTER TABLE `sabor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_bandeja` FOREIGN KEY (`bandeja_id`) REFERENCES `bandeja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_cobertura` FOREIGN KEY (`cobertura_id`) REFERENCES `cobertura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_confeito` FOREIGN KEY (`confeito_id`) REFERENCES `confeito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_massa` FOREIGN KEY (`massa_id`) REFERENCES `massa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pessoa` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_sabor` FOREIGN KEY (`sabor_id`) REFERENCES `sabor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
