CREATE DATABASE  IF NOT EXISTS `inflables` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inflables`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inflables
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `IdA` int NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  PRIMARY KEY (`IdA`),
  UNIQUE KEY `Correo` (`Correo`),
  CONSTRAINT `fk_adm` FOREIGN KEY (`Correo`) REFERENCES `usuarios` (`Usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Kaleb','Ruelas','kalebAdmin@gmail.com');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `IdC` int NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Tel` int NOT NULL,
  `Dom` varchar(45) NOT NULL,
  `Ocupacion` varchar(20) NOT NULL,
  `Gen` varchar(20) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `Activo` int NOT NULL,
  PRIMARY KEY (`IdC`),
  UNIQUE KEY `Correo` (`Correo`),
  CONSTRAINT `fk_cl` FOREIGN KEY (`Correo`) REFERENCES `usuarios` (`Usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Kaleb','Ruelas','kalebClient@gmail.com',2147483647,'Chihuahua','Estudiante','Hombre','0',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `IdE` int NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Tel` int NOT NULL,
  `Activo` int NOT NULL,
  PRIMARY KEY (`IdE`),
  UNIQUE KEY `Correo` (`Correo`),
  CONSTRAINT `fk_em` FOREIGN KEY (`Correo`) REFERENCES `usuarios` (`Usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inflable`
--

DROP TABLE IF EXISTS `inflable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inflable` (
  `idInflable` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Precio_individual` double NOT NULL,
  `Cantidad_inventario` int NOT NULL,
  `Descripcion` varchar(1000) NOT NULL,
  `Altura` varchar(45) NOT NULL,
  `Ancho` varchar(45) NOT NULL,
  `Largo` varchar(45) NOT NULL,
  PRIMARY KEY (`idInflable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inflable`
--

LOCK TABLES `inflable` WRITE;
/*!40000 ALTER TABLE `inflable` DISABLE KEYS */;
INSERT INTO `inflable` VALUES (1,'Casita','Casita',12590,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','3','4','3'),(2,'Castillo','Castillo',11990,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','3','3','3'),(3,'Castillo Resbaladero','Castillo',15290,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','3','5','4'),(4,'Castillo Resbaladero Mix','Castillo',19990,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','3.2','5','5'),(5,'Castillo Resbaladero Mix Princesas','Castillo Resbaladero',16390,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','2','5','2.8'),(6,'Cubo','Cubo',11550,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','3','4','3'),(7,'Cubo Mix','Cubo',13750,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','3','4','3'),(8,'Cubo Resbaladero','Cubo',14200,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','2','5','4'),(9,'Escalador Chido','Escalador',19250,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','3.2','5','4.5'),(10,'Escalador Digital','Escalador',16990,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','3.2','5','4.5'),(11,'Muro Mario','Muro',13750,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','4','3','4'),(12,'Muro Resbaladero Mickey Mouse','Muro',17390,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','4','3','5'),(13,'Resbaladero con Arco','Resbaladero',15995,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','3','5','4'),(14,'Resbaladero Mini','Resbaladero',11350,20,'Este inflable es un producto sorprendente y versátil que capturará la atención de todos. Diseñado para brindar diversión y entretenimiento, es perfecto para cualquier ocasión, desde fiestas en la piscina hasta eventos al aire libre.','1.8','2','3.2');
/*!40000 ALTER TABLE `inflable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intfall`
--

DROP TABLE IF EXISTS `intfall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intfall` (
  `UsuF` varchar(45) NOT NULL,
  `Intentos` int NOT NULL,
  PRIMARY KEY (`UsuF`),
  CONSTRAINT `fk_fails` FOREIGN KEY (`UsuF`) REFERENCES `usuarios` (`Usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intfall`
--

LOCK TABLES `intfall` WRITE;
/*!40000 ALTER TABLE `intfall` DISABLE KEYS */;
/*!40000 ALTER TABLE `intfall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idInventario` int NOT NULL,
  `Disponibles` int NOT NULL,
  PRIMARY KEY (`idInventario`),
  CONSTRAINT `fk_Inventario_Inflable1` FOREIGN KEY (`idInventario`) REFERENCES `inflable` (`idInflable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idInflable` int NOT NULL,
  `idCliente` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Precio` int NOT NULL,
  `Fecha_pedido` datetime NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_clientes1` (`idCliente`),
  KEY `fk_Pedido_Inflable1` (`idInflable`),
  CONSTRAINT `fk_Pedido_clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`IdC`),
  CONSTRAINT `fk_Pedido_Inflable1` FOREIGN KEY (`idInflable`) REFERENCES `inflable` (`idInflable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseña`
--

DROP TABLE IF EXISTS `reseña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseña` (
  `idResenia` int NOT NULL,
  `clientes_IdC` int NOT NULL,
  `IdInflable` int NOT NULL,
  `Texto` varchar(255) DEFAULT NULL,
  `Valoracion` decimal(5,0) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`idResenia`),
  KEY `fk_Resenia_clientes` (`clientes_IdC`),
  KEY `fk_Resenia_Inflable1` (`IdInflable`),
  CONSTRAINT `fk_Resenia_clientes` FOREIGN KEY (`clientes_IdC`) REFERENCES `clientes` (`IdC`),
  CONSTRAINT `fk_Resenia_Inflable1` FOREIGN KEY (`IdInflable`) REFERENCES `inflable` (`idInflable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseña`
--

LOCK TABLES `reseña` WRITE;
/*!40000 ALTER TABLE `reseña` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseña` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos` (
  `IdT` int NOT NULL,
  `Descr` varchar(20) NOT NULL,
  `URL` varchar(20) NOT NULL,
  `Nivel` int NOT NULL,
  PRIMARY KEY (`IdT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (1,'Rol Administrativo d','Admins',2),(2,'Rol Solicitante del ','Clientes',1);
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `Usu` varchar(45) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `IdT` int NOT NULL,
  `Activo` int NOT NULL,
  PRIMARY KEY (`Usu`),
  KEY `fk_usu` (`IdT`),
  CONSTRAINT `fk_usu` FOREIGN KEY (`IdT`) REFERENCES `tipos` (`IdT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('kalebAdmin@gmail.com','contra12345',1,1),('kalebClient@gmail.com','contra12345',2,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-01 20:48:53
