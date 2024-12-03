CREATE DATABASE  IF NOT EXISTS `grupoae` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `grupoae`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: grupoae
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` longtext,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Cerveza','o'),(2,'Wisky',NULL),(3,'Vodka2','Una descripcion de licor Vodka 2'),(4,'Ginebra',NULL),(5,'Brandy',NULL),(6,'Ron',NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `contrasena` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Pepe',NULL,'1234567890',NULL,NULL),(2,'Juan',NULL,'3133333333',NULL,NULL),(3,'Matias',NULL,'2345678902',NULL,NULL),(4,'Jose',NULL,'4555555555',NULL,NULL),(5,'Osvaldo',NULL,'7654365423',NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_producto`
--

DROP TABLE IF EXISTS `factura_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_producto` (
  `idFactura` int NOT NULL,
  `idProducto` int NOT NULL,
  `Cantidad` smallint NOT NULL,
  PRIMARY KEY (`idFactura`,`idProducto`),
  KEY `fk_prodfac_idx` (`idProducto`),
  CONSTRAINT `fk_idfac_referenced` FOREIGN KEY (`idFactura`) REFERENCES `tbl_factura` (`idFactura`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_idprod_referenced` FOREIGN KEY (`idProducto`) REFERENCES `tblproducto` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_producto`
--

LOCK TABLES `factura_producto` WRITE;
/*!40000 ALTER TABLE `factura_producto` DISABLE KEYS */;
INSERT INTO `factura_producto` VALUES (1,1,1),(1,2,1),(1,3,2),(2,5,1),(2,6,1),(3,1,3),(3,4,1),(4,7,1),(5,8,1);
/*!40000 ALTER TABLE `factura_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_producto`
--

DROP TABLE IF EXISTS `proveedor_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_producto` (
  `idProveedor` int NOT NULL,
  `idProducto` int NOT NULL,
  PRIMARY KEY (`idProveedor`,`idProducto`),
  KEY `fk_prov_idx` (`idProveedor`),
  KEY `fk_producto_ofered_idx` (`idProducto`),
  CONSTRAINT `fk_producto_ofered` FOREIGN KEY (`idProducto`) REFERENCES `tblproducto` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_prov_referenced` FOREIGN KEY (`idProveedor`) REFERENCES `tblproveedores` (`idProveedor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_producto`
--

LOCK TABLES `proveedor_producto` WRITE;
/*!40000 ALTER TABLE `proveedor_producto` DISABLE KEYS */;
INSERT INTO `proveedor_producto` VALUES (1,4),(1,5),(2,3),(2,5),(3,2),(4,7),(5,3),(5,8);
/*!40000 ALTER TABLE `proveedor_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_factura`
--

DROP TABLE IF EXISTS `tbl_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_factura` (
  `idFactura` int NOT NULL,
  `idCliente` int NOT NULL,
  `Fecha` date NOT NULL,
  `Total` int NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `facturaClientefk_idx` (`idCliente`),
  CONSTRAINT `facturaClientefk` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_factura`
--

LOCK TABLES `tbl_factura` WRITE;
/*!40000 ALTER TABLE `tbl_factura` DISABLE KEYS */;
INSERT INTO `tbl_factura` VALUES (1,3,'2024-03-23',43000),(2,3,'2024-03-23',56000),(3,2,'2024-03-23',34000),(4,4,'2024-03-23',12000),(5,5,'2024-03-23',23000);
/*!40000 ALTER TABLE `tbl_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproducto`
--

DROP TABLE IF EXISTS `tblproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblproducto` (
  `idProducto` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Precio` float NOT NULL,
  `StockProducto` float NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproducto`
--

LOCK TABLES `tblproducto` WRITE;
/*!40000 ALTER TABLE `tblproducto` DISABLE KEYS */;
INSERT INTO `tblproducto` VALUES (1,'CervezaX',6000,40),(2,'CervezaY',5000,50),(3,'LicorA',10000,70),(4,'LicorB',15000,70),(5,'LicorC',20000,60),(6,'Aguardiente',45000,50),(7,'CervezaA',5000,30),(8,'CervezaB',5500,20),(9,'cervezapoker',4000,50),(10,'cervezalight',4500,70);
/*!40000 ALTER TABLE `tblproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproveedores`
--

DROP TABLE IF EXISTS `tblproveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblproveedores` (
  `idProveedor` int NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Teléfono` varchar(40) NOT NULL,
  `Dirección` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `idCategoria` int DEFAULT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `fk_categoria_prov_idx` (`idCategoria`),
  CONSTRAINT `fk_categoria_prov` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproveedores`
--

LOCK TABLES `tblproveedores` WRITE;
/*!40000 ALTER TABLE `tblproveedores` DISABLE KEYS */;
INSERT INTO `tblproveedores` VALUES (1,'ProveedorA','3214562313',NULL,NULL,NULL,1),(2,'ProveedorB','2344567676',NULL,NULL,NULL,1),(3,'ProveedorC','3456789034',NULL,NULL,NULL,3),(4,'ProveedorD','4556664353',NULL,NULL,NULL,4),(5,'ProveedorE','2345678654',NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `tblproveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 18:16:55
