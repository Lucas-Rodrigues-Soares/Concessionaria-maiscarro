CREATE DATABASE  IF NOT EXISTS `concessionaria_maiscarro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `concessionaria_maiscarro`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: concessionaria_maiscarro
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Gabriel Bastos','85999990001','12345678912',NULL,20),(2,'Maria Oliveira','859899999890','78945612312',NULL,50),(3,'João Pedro','85999990003',NULL,NULL,63),(4,'Ana Beatriz','85999990004',NULL,NULL,33),(5,'Carlos Eduardo','85999990005',NULL,NULL,70);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_veiculos`
--

DROP TABLE IF EXISTS `tipos_veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_veiculos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_veiculos`
--

LOCK TABLES `tipos_veiculos` WRITE;
/*!40000 ALTER TABLE `tipos_veiculos` DISABLE KEYS */;
INSERT INTO `tipos_veiculos` VALUES (1,'Carro'),(2,'Moto'),(3,'Caminhonete'),(4,'SUV');
/*!40000 ALTER TABLE `tipos_veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(80) NOT NULL,
  `descricao` varchar(550) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `tipos_veiculos_id` int NOT NULL,
  `ano_fabricacao` int NOT NULL DEFAULT '1900',
  `cor_veiculo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_veiculos_tipos` (`tipos_veiculos_id`),
  CONSTRAINT `fk_veiculos_tipos` FOREIGN KEY (`tipos_veiculos_id`) REFERENCES `tipos_veiculos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` VALUES (1,'HB20 Comfort','Hyundai HB20 Comfort 2023',58500.00,1,1900,NULL),(2,'CG','HONDA CG 160 2024',16200.00,2,1900,NULL),(3,'Hilux','Toyota Hilux 2022',1705725.00,3,1900,NULL),(4,'Pajero Sport','Mitsubishi Pajero Sport 2020',175987.50,4,1900,NULL),(5,'Fiat Argo 1.6','Fiat argo cinza 1.6 2010',58000.00,1,1900,NULL);
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clientes_id` int NOT NULL,
  `veiculos_id` int NOT NULL,
  `data_venda` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venda_cliente` (`clientes_id`),
  KEY `fk_venda_veiculo` (`veiculos_id`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_venda_veiculo` FOREIGN KEY (`veiculos_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,1,4,'2026-10-20',190000.00),(2,2,1,'2026-10-21',63000.00),(3,3,2,'2026-10-22',17500.00),(4,4,3,'2026-10-23',205000.00);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'concessionaria_maiscarro'
--

--
-- Dumping routines for database 'concessionaria_maiscarro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-14  8:36:38
