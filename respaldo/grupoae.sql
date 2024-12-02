-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2024 at 06:07 PM
-- Server version: 8.4.0
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grupoae`
--
CREATE DATABASE IF NOT EXISTS `grupoae` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `grupoae`;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `Nombre`, `Descripcion`) VALUES
(1, 'Cerveza', 'o'),
(2, 'Wisky', NULL),
(3, 'Vodka2', 'Una descripcion de licor Vodka 2'),
(4, 'Ginebra', NULL),
(5, 'Brandy', NULL),
(6, 'Ron', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `factura_producto`
--

CREATE TABLE `factura_producto` (
  `idFactura` int NOT NULL,
  `idProducto` int NOT NULL,
  `Cantidad` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `factura_producto`
--

INSERT INTO `factura_producto` (`idFactura`, `idProducto`, `Cantidad`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 2),
(2, 5, 1),
(2, 6, 1),
(3, 1, 3),
(3, 4, 1),
(4, 7, 1),
(5, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor_producto`
--

CREATE TABLE `proveedor_producto` (
  `idProveedor` int NOT NULL,
  `idProducto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `proveedor_producto`
--

INSERT INTO `proveedor_producto` (`idProveedor`, `idProducto`) VALUES
(1, 4),
(1, 5),
(2, 3),
(2, 5),
(3, 2),
(4, 7),
(5, 3),
(5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tblcliente`
--

CREATE TABLE `tblcliente` (
  `ID_cliente` int NOT NULL DEFAULT '0',
  `Nombre` varchar(60) NOT NULL,
  `Teléfono` varchar(40) NOT NULL,
  `Dirección` varchar(15) DEFAULT NULL,
  `Correo` varchar(60) DEFAULT NULL,
  `Ciudad` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcliente`
--

INSERT INTO `tblcliente` (`ID_cliente`, `Nombre`, `Teléfono`, `Dirección`, `Correo`, `Ciudad`) VALUES
(1, 'Pepe', '1234567890', NULL, NULL, NULL),
(2, 'Juan', '3133333333', NULL, NULL, NULL),
(3, 'Matias', '2345678902', NULL, NULL, NULL),
(4, 'Jose', '4555555555', NULL, NULL, NULL),
(5, 'Osvaldo', '7654365423', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblproducto`
--

CREATE TABLE `tblproducto` (
  `idProducto` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Precio` float NOT NULL,
  `StockProducto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblproducto`
--

INSERT INTO `tblproducto` (`idProducto`, `Nombre`, `Precio`, `StockProducto`) VALUES
(1, 'CervezaX', 6000, 40),
(2, 'CervezaY', 5000, 50),
(3, 'LicorA', 10000, 70),
(4, 'LicorB', 15000, 70),
(5, 'LicorC', 20000, 60),
(6, 'Aguardiente', 45000, 50),
(7, 'CervezaA', 5000, 30),
(8, 'CervezaB', 5500, 20),
(9, 'cervezapoker', 4000, 50),
(10, 'cervezalight', 4500, 70);

-- --------------------------------------------------------

--
-- Table structure for table `tblproveedores`
--

CREATE TABLE `tblproveedores` (
  `idProveedor` int NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Teléfono` varchar(40) NOT NULL,
  `Dirección` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `idCategoria` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblproveedores`
--

INSERT INTO `tblproveedores` (`idProveedor`, `Nombre`, `Teléfono`, `Dirección`, `Correo`, `Ciudad`, `idCategoria`) VALUES
(1, 'ProveedorA', '3214562313', NULL, NULL, NULL, 1),
(2, 'ProveedorB', '2344567676', NULL, NULL, NULL, 1),
(3, 'ProveedorC', '3456789034', NULL, NULL, NULL, 3),
(4, 'ProveedorD', '4556664353', NULL, NULL, NULL, 4),
(5, 'ProveedorE', '2345678654', NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_factura`
--

CREATE TABLE `tbl_factura` (
  `idFactura` int NOT NULL,
  `idCliente` int NOT NULL,
  `Fecha` date NOT NULL,
  `Total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_factura`
--

INSERT INTO `tbl_factura` (`idFactura`, `idCliente`, `Fecha`, `Total`) VALUES
(1, 3, '2024-03-23', 43000),
(2, 3, '2024-03-23', 56000),
(3, 2, '2024-03-23', 34000),
(4, 4, '2024-03-23', 12000),
(5, 5, '2024-03-23', 23000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indexes for table `factura_producto`
--
ALTER TABLE `factura_producto`
  ADD PRIMARY KEY (`idFactura`,`idProducto`),
  ADD KEY `fk_prodfac_idx` (`idProducto`);

--
-- Indexes for table `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD PRIMARY KEY (`idProveedor`,`idProducto`),
  ADD KEY `fk_prov_idx` (`idProveedor`),
  ADD KEY `fk_producto_ofered_idx` (`idProducto`);

--
-- Indexes for table `tblcliente`
--
ALTER TABLE `tblcliente`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indexes for table `tblproducto`
--
ALTER TABLE `tblproducto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indexes for table `tblproveedores`
--
ALTER TABLE `tblproveedores`
  ADD PRIMARY KEY (`idProveedor`),
  ADD KEY `fk_categoria_prov_idx` (`idCategoria`);

--
-- Indexes for table `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `Factura_Cliente_idx` (`idCliente`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factura_producto`
--
ALTER TABLE `factura_producto`
  ADD CONSTRAINT `fk_idfac_referenced` FOREIGN KEY (`idFactura`) REFERENCES `tbl_factura` (`idFactura`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idprod_referenced` FOREIGN KEY (`idProducto`) REFERENCES `tblproducto` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD CONSTRAINT `fk_producto_ofered` FOREIGN KEY (`idProducto`) REFERENCES `tblproducto` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prov_referenced` FOREIGN KEY (`idProveedor`) REFERENCES `tblproveedores` (`idProveedor`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tblproveedores`
--
ALTER TABLE `tblproveedores`
  ADD CONSTRAINT `fk_categoria_prov` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD CONSTRAINT `Factura_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`ID_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
