-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: faculdade
-- ------------------------------------------------------
-- Server version	8.4.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `matricula` varchar(10) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES ('João Silva','1995-01-01','2023001','Rua A, 123'),('Maria Oliveira','1996-02-02','2023002','Rua B, 456'),('Pedro Santos','1997-03-03','2023003','Rua C, 789');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disciplina` (
  `matricula` varchar(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`matricula`,`nome`),
  KEY `nome` (`nome`),
  CONSTRAINT `aluno_disciplina_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `aluno` (`matricula`),
  CONSTRAINT `aluno_disciplina_ibfk_2` FOREIGN KEY (`nome`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
INSERT INTO `aluno_disciplina` VALUES ('2023001','Cálculo I'),('2023001','Programação I'),('2023002','Programação I');
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `prof_cpf` varchar(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `nota` int DEFAULT NULL,
  PRIMARY KEY (`prof_cpf`,`data_hora`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`prof_cpf`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES ('12345678901','2024-10-09 21:54:50','Excelente',10),('12345678901','2024-10-09 21:55:00','Muito Bom',8);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `local` varchar(255) DEFAULT NULL,
  `prof_chefe_cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prof_chefe_cpf` (`prof_chefe_cpf`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`prof_chefe_cpf`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento de Computação','Bloco A','12345678901'),(2,'Departamento de Matemática','Bloco B',NULL),(3,'Departamento de Física','Bloco C',NULL);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `nome` varchar(100) NOT NULL,
  `carga_horaria` int NOT NULL DEFAULT '30',
  `emenda` text,
  `disc_pre_requisito` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nome`),
  KEY `disc_pre_requisito` (`disc_pre_requisito`),
  CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`disc_pre_requisito`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES ('Cálculo I',45,'Revisão de matemática básica',NULL),('Física Geral',50,'Experimentos de laboratório',NULL),('Programação I',60,'Nenhuma',NULL);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `inicio_contrato` date DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `depto_id` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `depto_id` (`depto_id`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`depto_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('2021-11-17','Professor Gama','11122233344',NULL),('2020-01-01','Professor Alfa','12345678901',NULL),('2021-10-27','Professor Beta','98765432101',NULL);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_contato`
--

DROP TABLE IF EXISTS `professor_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_contato` (
  `prof_cpf` varchar(11) NOT NULL,
  `contato` varchar(14) NOT NULL,
  PRIMARY KEY (`prof_cpf`,`contato`),
  CONSTRAINT `professor_contato_ibfk_1` FOREIGN KEY (`prof_cpf`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_contato`
--

LOCK TABLES `professor_contato` WRITE;
/*!40000 ALTER TABLE `professor_contato` DISABLE KEYS */;
INSERT INTO `professor_contato` VALUES ('11122233344','(11) 9999-9999'),('12345678901','(11) 8888-8888'),('98765432101','(22) 7777-7777');
/*!40000 ALTER TABLE `professor_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_disciplina`
--

DROP TABLE IF EXISTS `professor_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_disciplina` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`nome`,`cpf`),
  KEY `cpf` (`cpf`),
  CONSTRAINT `professor_disciplina_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `professor` (`cpf`),
  CONSTRAINT `professor_disciplina_ibfk_2` FOREIGN KEY (`nome`) REFERENCES `disciplina` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_disciplina`
--

LOCK TABLES `professor_disciplina` WRITE;
/*!40000 ALTER TABLE `professor_disciplina` DISABLE KEYS */;
INSERT INTO `professor_disciplina` VALUES ('11122233344','Cálculo I'),('12345678901','Física Geral'),('98765432101','Programação I');
/*!40000 ALTER TABLE `professor_disciplina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 21:59:14
