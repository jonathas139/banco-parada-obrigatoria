-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           11.3.2-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para trabalho_poo
CREATE DATABASE IF NOT EXISTS `trabalho_poo` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `trabalho_poo`;

-- Copiando estrutura para tabela trabalho_poo.aparelho
CREATE TABLE IF NOT EXISTS `aparelho` (
  `ID_APARELHO` int(11) NOT NULL AUTO_INCREMENT,
  `MARCA` char(50) DEFAULT NULL,
  `MODELO` char(50) DEFAULT NULL,
  `TIPO` char(50) DEFAULT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_APARELHO`),
  KEY `FK_APARELHO_2` (`ID_CLIENTE`),
  CONSTRAINT `FK_APARELHO_2` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela trabalho_poo.aparelho: ~5 rows (aproximadamente)
INSERT INTO `aparelho` (`ID_APARELHO`, `MARCA`, `MODELO`, `TIPO`, `ID_CLIENTE`) VALUES
	(9, 'LG', 'G8 ThinQ1', 'Smartphone1', 1),
	(11, 'samsung', 'andoid', 'celular', 2),
	(13, 'samsug', 'x10', 'celular', 3),
	(14, 'samsug', 'x101', 'celular', 3),
	(16, 'motorola', 'g5000', 'celular', 6);

-- Copiando estrutura para tabela trabalho_poo.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` char(50) DEFAULT NULL,
  `ENDERECO` char(50) DEFAULT NULL,
  `TELEFONE` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela trabalho_poo.cliente: ~7 rows (aproximadamente)
INSERT INTO `cliente` (`ID_CLIENTE`, `NOME`, `ENDERECO`, `TELEFONE`) VALUES
	(1, 'Alice Santos', 'Rua A, 123', '(11) 1111-1111'),
	(2, 'Bruno Rodrigues', '(22) 2222-2222', 'Rua B, 456'),
	(3, 'Carla Souza', 'Rua C, 789', '(33) 3333-3333'),
	(4, 'Daniel Ferreira', 'Rua D, 1011', '(44) 4444-4444'),
	(5, 'Erica Oliveira', 'Rua E, 1213', '(55) 5555-5555'),
	(6, 'alafy Santos', 'Rua A, 123', '(11) 1111-1111'),
	(7, 'jonathas', 'qualquer', '(11)1111-1111');

-- Copiando estrutura para tabela trabalho_poo.ordem_servico
CREATE TABLE IF NOT EXISTS `ordem_servico` (
  `ID_OR` int(11) NOT NULL AUTO_INCREMENT,
  `DESC_DEFEITO` char(50) DEFAULT NULL,
  `STATUS` char(50) DEFAULT NULL,
  `DATA_INICIO` char(50) DEFAULT NULL,
  `DATA_TERMINO` char(50) DEFAULT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_OR`),
  KEY `FK_ORDEM_SERVICO_2` (`ID_CLIENTE`),
  CONSTRAINT `FK_ORDEM_SERVICO_2` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela trabalho_poo.ordem_servico: ~5 rows (aproximadamente)
INSERT INTO `ordem_servico` (`ID_OR`, `DESC_DEFEITO`, `STATUS`, `DATA_INICIO`, `DATA_TERMINO`, `ID_CLIENTE`) VALUES
	(1, 'Tela quebrada', 'Em andamento', '01/01/2024', '05/01/2024', 1),
	(2, 'Bateria viciada', 'Concluído', '02/01/2024', '06/01/2024', NULL),
	(3, 'Sistema travando', 'Em andamento', '03/01/2024', '07/01/2024', 3),
	(4, 'Não liga', 'Concluído', '04/01/2024', '08/01/2024', 4),
	(5, 'Teclado com falhas', 'Em andamento', '05/01/2024', '09/01/2024', 5);

-- Copiando estrutura para tabela trabalho_poo.solicita_or_cliente_ordem_servico_aparelho
CREATE TABLE IF NOT EXISTS `solicita_or_cliente_ordem_servico_aparelho` (
  `FK_CLIENTE_ID_CLIENTE` int(11) DEFAULT NULL,
  `FK_ORDEM_SERVICO_ID_OR` int(11) DEFAULT NULL,
  `FK_APARELHO_ID_APARELHO` int(11) DEFAULT NULL,
  `ID_SOLICITACAO_OR` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_SOLICITACAO_OR`),
  KEY `FK_SOLICITA_OR_CLIENTE_ORDEM_SERVICO_APARELHO_1` (`FK_CLIENTE_ID_CLIENTE`),
  KEY `FK_SOLICITA_OR_CLIENTE_ORDEM_SERVICO_APARELHO_2` (`FK_ORDEM_SERVICO_ID_OR`),
  KEY `FK_SOLICITA_OR_CLIENTE_ORDEM_SERVICO_APARELHO_3` (`FK_APARELHO_ID_APARELHO`),
  CONSTRAINT `FK_SOLICITA_OR_CLIENTE_ORDEM_SERVICO_APARELHO_1` FOREIGN KEY (`FK_CLIENTE_ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE NO ACTION,
  CONSTRAINT `FK_SOLICITA_OR_CLIENTE_ORDEM_SERVICO_APARELHO_2` FOREIGN KEY (`FK_ORDEM_SERVICO_ID_OR`) REFERENCES `ordem_servico` (`ID_OR`) ON DELETE NO ACTION,
  CONSTRAINT `FK_SOLICITA_OR_CLIENTE_ORDEM_SERVICO_APARELHO_3` FOREIGN KEY (`FK_APARELHO_ID_APARELHO`) REFERENCES `aparelho` (`ID_APARELHO`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela trabalho_poo.solicita_or_cliente_ordem_servico_aparelho: ~5 rows (aproximadamente)
INSERT INTO `solicita_or_cliente_ordem_servico_aparelho` (`FK_CLIENTE_ID_CLIENTE`, `FK_ORDEM_SERVICO_ID_OR`, `FK_APARELHO_ID_APARELHO`, `ID_SOLICITACAO_OR`) VALUES
	(1, 1, NULL, 1),
	(NULL, 2, NULL, 2),
	(3, 3, NULL, 3),
	(4, 4, NULL, 4),
	(5, 5, NULL, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
