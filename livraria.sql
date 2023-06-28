-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.36-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para livraria
DROP DATABASE IF EXISTS `livraria`;
CREATE DATABASE IF NOT EXISTS `livraria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `livraria`;

-- Copiando estrutura para tabela livraria.destino
DROP TABLE IF EXISTS `destino`;
CREATE TABLE IF NOT EXISTS `destino` (
  `codDestino` int(11) NOT NULL AUTO_INCREMENT,
  `frete` double DEFAULT NULL,
  `valorEncomenda` double NOT NULL,
  `LIVRARIA_codLivraria` int(11) NOT NULL,
  `LOJA_DE_DESTINO_codLoja` int(11) NOT NULL,
  PRIMARY KEY (`codDestino`,`LIVRARIA_codLivraria`,`LOJA_DE_DESTINO_codLoja`),
  KEY `fk_DESTINO_LIVRARIA1_idx` (`LIVRARIA_codLivraria`),
  KEY `fk_DESTINO_LOJA_DE_DESTINO1_idx` (`LOJA_DE_DESTINO_codLoja`),
  CONSTRAINT `fk_DESTINO_LOJA_DE_DESTINO1` FOREIGN KEY (`LOJA_DE_DESTINO_codLoja`) REFERENCES `loja_de_destino` (`codLoja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DESTINO_livraria1` FOREIGN KEY (`LIVRARIA_codLivraria`) REFERENCES `livraria` (`codLivraria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria.destino: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT INTO `destino` (`codDestino`, `frete`, `valorEncomenda`, `LIVRARIA_codLivraria`, `LOJA_DE_DESTINO_codLoja`) VALUES
	(7, 160, 500, 3, 1),
	(8, 50, 300, 2, 3);
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;

-- Copiando estrutura para tabela livraria.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `salario` double DEFAULT NULL,
  `LIVRARIA_codLivraria` int(11) NOT NULL,
  PRIMARY KEY (`codFuncionario`,`LIVRARIA_codLivraria`),
  KEY `fk_FUNCIONARIO_LIVRARIA_idx` (`LIVRARIA_codLivraria`),
  CONSTRAINT `fk_FUNCIONARIO_livraria` FOREIGN KEY (`LIVRARIA_codLivraria`) REFERENCES `livraria` (`codLivraria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria.funcionario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`codFuncionario`, `nome`, `cpf`, `rg`, `salario`, `livraria_codlivraria`) VALUES
	(1, 'Funcionario 1', '111', '111', 111, 1),
	(2, 'Funcionario 2', '222', '222', 22, 2),
	(3, 'Funcionario 3', '333', '333', 3, 1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela livraria.loja_de_destino
DROP TABLE IF EXISTS `loja_de_destino`;
CREATE TABLE IF NOT EXISTS `loja_de_destino` (
  `codLoja` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`codLoja`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=UTF8;

-- Copiando dados para a tabela livraria.loja_de_destino: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `loja_de_destino` DISABLE KEYS */;
INSERT INTO `loja_de_destino` (`codLoja`, `nome`, `endereco`, `cidade`, `uf`) VALUES
	(1, 'Loja 1', 'Rua 1', 'Cidade 1', '11'),
	(2, 'Loja 2', 'Rua 2', 'Cidade 2', '22'),
	(3, 'Loja 3', 'Rua 3', 'Cidade 3', '33');
/*!40000 ALTER TABLE `loja_de_destino` ENABLE KEYS */;

-- Copiando estrutura para tabela livraria.livraria
DROP TABLE IF EXISTS `livraria`;
CREATE TABLE IF NOT EXISTS `livraria` (
  `codLivraria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`codLivraria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela livraria.livraria: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `livraria` DISABLE KEYS */;
INSERT INTO `livraria` (`codLivraria`, `nome`, `endereco`, `cidade`, `uf`) VALUES
	(1, 'livraria 1', 'Rua 1', 'Cidade 1\r\n', '11'),
	(2, 'livraria 2', 'Rua 2', 'Cidade 2', '22'),
	(3, 'livraria 36', 'Rua 3', 'Cidade 3', '33');
/*!40000 ALTER TABLE `livraria` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;