-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 01, 2024 at 12:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `panda`
--
CREATE DATABASE IF NOT EXISTS `panda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `panda`;

-- --------------------------------------------------------

--
-- Table structure for table `tabla_categoria`
--

CREATE TABLE `tabla_categoria` (
  `Id_categoria` int(11) NOT NULL,
  `Nombre_categoria` varchar(45) DEFAULT NULL,
  `Descripcion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tabla_categoria`
--

INSERT INTO `tabla_categoria` (`Id_categoria`, `Nombre_categoria`, `Descripcion`) VALUES
(1, 'Ron', NULL),
(2, 'l', 'o');

-- --------------------------------------------------------

--
-- Table structure for table `tblclientes`
--

CREATE TABLE `tblclientes` (
  `ID_cliente` int(11) NOT NULL DEFAULT 0,
  `Nombre_cliente` varchar(60) DEFAULT NULL,
  `Dr_cliente` varchar(40) DEFAULT NULL,
  `TL_cliente` varchar(15) DEFAULT NULL,
  `Correo_cliente` varchar(60) DEFAULT NULL,
  `Ciudad_cliente` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblproducto`
--

CREATE TABLE `tblproducto` (
  `ID_producto` int(11) NOT NULL,
  `Nombre_producto` varchar(45) DEFAULT NULL,
  `Precio_producto` float DEFAULT NULL,
  `Proeevedor_producto` varchar(45) DEFAULT NULL,
  `Stock_producto` float DEFAULT NULL,
  `Tblproductocol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblproveedores`
--

CREATE TABLE `tblproveedores` (
  `ID_proveedores` int(11) NOT NULL,
  `Nombrepr` varchar(60) DEFAULT NULL,
  `telefonopro` varchar(40) DEFAULT NULL,
  `direcionpro` varchar(45) DEFAULT NULL,
  `correopr` varchar(45) DEFAULT NULL,
  `ciudadpro` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_venta`
--

CREATE TABLE `tbl_venta` (
  `Id_venta` int(11) NOT NULL,
  `Fecha_venta` date DEFAULT NULL,
  `Cantidad` varchar(40) DEFAULT NULL,
  `Precio` decimal(10,0) DEFAULT NULL,
  `Descuento` varchar(45) DEFAULT NULL,
  `Monto_total` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabla_categoria`
--
ALTER TABLE `tabla_categoria`
  ADD PRIMARY KEY (`Id_categoria`);

--
-- Indexes for table `tblclientes`
--
ALTER TABLE `tblclientes`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indexes for table `tblproducto`
--
ALTER TABLE `tblproducto`
  ADD PRIMARY KEY (`ID_producto`);

--
-- Indexes for table `tblproveedores`
--
ALTER TABLE `tblproveedores`
  ADD PRIMARY KEY (`ID_proveedores`);

--
-- Indexes for table `tbl_venta`
--
ALTER TABLE `tbl_venta`
  ADD PRIMARY KEY (`Id_venta`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblclientes`
--
ALTER TABLE `tblclientes`
  ADD CONSTRAINT `fk_producto` FOREIGN KEY (`ID_cliente`) REFERENCES `tblproducto` (`ID_producto`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venta` FOREIGN KEY (`ID_cliente`) REFERENCES `tbl_venta` (`Id_venta`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tblproducto`
--
ALTER TABLE `tblproducto`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`ID_producto`) REFERENCES `tabla_categoria` (`Id_categoria`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`ID_producto`) REFERENCES `tblclientes` (`ID_cliente`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tblproveedores`
--
ALTER TABLE `tblproveedores`
  ADD CONSTRAINT `fk_cteg` FOREIGN KEY (`ID_proveedores`) REFERENCES `tabla_categoria` (`Id_categoria`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prod` FOREIGN KEY (`ID_proveedores`) REFERENCES `tblproducto` (`ID_producto`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_venta`
--
ALTER TABLE `tbl_venta`
  ADD CONSTRAINT `fk_clien` FOREIGN KEY (`Id_venta`) REFERENCES `tblclientes` (`ID_cliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produ` FOREIGN KEY (`Id_venta`) REFERENCES `tblproducto` (`ID_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
