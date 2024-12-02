-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: grupoa
-- ------------------------------------------------------
-- Server version	5.1.49-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tabla_categoria`
--

DROP TABLE IF EXISTS `tabla_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabla_categoria` (
  `Id_categoria` int(11) NOT NULL,
  `Nombre_categoria` varchar(45) DEFAULT NULL,
  `Descripcion` longtext,
  PRIMARY KEY (`Id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_categoria`
--

LOCK TABLES `tabla_categoria` WRITE;
/*!40000 ALTER TABLE `tabla_categoria` DISABLE KEYS */;
INSERT INTO `tabla_categoria` VALUES (2,'l','o');
/*!40000 ALTER TABLE `tabla_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_venta`
--

DROP TABLE IF EXISTS `tbl_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_venta` (
  `Id_venta` int(11) NOT NULL,
  `Fecha_venta` date DEFAULT NULL,
  `Cantidad` varchar(40) DEFAULT NULL,
  `Precio` decimal(10,0) DEFAULT NULL,
  `Descuento` varchar(45) DEFAULT NULL,
  `Monto_total` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_venta`),
  CONSTRAINT `fk_clien` FOREIGN KEY (`Id_venta`) REFERENCES `tblclientes` (`ID_cliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_produ` FOREIGN KEY (`Id_venta`) REFERENCES `tblproducto` (`ID_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_venta`
--

LOCK TABLES `tbl_venta` WRITE;
/*!40000 ALTER TABLE `tbl_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclientes`
--

DROP TABLE IF EXISTS `tblclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclientes` (
  `ID_cliente` int(11) NOT NULL DEFAULT '0',
  `Nombre_cliente` varchar(60) DEFAULT NULL,
  `Dr_cliente` varchar(40) DEFAULT NULL,
  `TL_cliente` varchar(15) DEFAULT NULL,
  `Correo_cliente` varchar(60) DEFAULT NULL,
  `Ciudad_cliente` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_cliente`),
  CONSTRAINT `fk_producto` FOREIGN KEY (`ID_cliente`) REFERENCES `tblproducto` (`ID_producto`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_venta` FOREIGN KEY (`ID_cliente`) REFERENCES `tbl_venta` (`Id_venta`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclientes`
--

LOCK TABLES `tblclientes` WRITE;
/*!40000 ALTER TABLE `tblclientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproducto`
--

DROP TABLE IF EXISTS `tblproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproducto` (
  `ID_producto` int(11) NOT NULL,
  `Nombre_producto` varchar(45) DEFAULT NULL,
  `Precio_producto` float DEFAULT NULL,
  `Proeevedor_producto` varchar(45) DEFAULT NULL,
  `Stock_producto` float DEFAULT NULL,
  `Tblproductocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_producto`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`ID_producto`) REFERENCES `tabla_categoria` (`Id_categoria`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_cliente` FOREIGN KEY (`ID_producto`) REFERENCES `tblclientes` (`ID_cliente`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproducto`
--

LOCK TABLES `tblproducto` WRITE;
/*!40000 ALTER TABLE `tblproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproveedores`
--

DROP TABLE IF EXISTS `tblproveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproveedores` (
  `ID_proveedores` int(11) NOT NULL,
  `Nombrepr` varchar(60) DEFAULT NULL,
  `telefonopro` varchar(40) DEFAULT NULL,
  `direcionpro` varchar(45) DEFAULT NULL,
  `correopr` varchar(45) DEFAULT NULL,
  `ciudadpro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_proveedores`),
  CONSTRAINT `fk_cteg` FOREIGN KEY (`ID_proveedores`) REFERENCES `tabla_categoria` (`Id_categoria`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_prod` FOREIGN KEY (`ID_proveedores`) REFERENCES `tblproducto` (`ID_producto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproveedores`
--

LOCK TABLES `tblproveedores` WRITE;
/*!40000 ALTER TABLE `tblproveedores` DISABLE KEYS */;
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

-- Dump completed on 2024-10-17 10:33:53
