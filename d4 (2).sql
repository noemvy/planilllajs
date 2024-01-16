-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2023 a las 17:15:04
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `d4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generales`
--

CREATE TABLE `generales` (
  `prefijo` varchar(2) NOT NULL,
  `tomo` varchar(4) NOT NULL,
  `asiento` varchar(5) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `nombre1` varchar(15) NOT NULL,
  `nombre2` varchar(15) DEFAULT NULL,
  `apellido1` varchar(15) NOT NULL,
  `apellido2` varchar(15) DEFAULT NULL,
  `estado_civil` varchar(1) NOT NULL COMMENT '1-Soltero 2-Casado 3-Viudo 4-Divorciado',
  `apellido_casada` varchar(15) DEFAULT NULL,
  `usa_apellido_casada` varchar(1) NOT NULL COMMENT '1-Si 2-No',
  `htrabajadas` double(10,2) NOT NULL,
  `shora` double(10,2) NOT NULL,
  `seguro_social` double(10,2) NOT NULL,
  `seguro_educativo` double(10,2) NOT NULL,
  `impuesto_renta` double(10,2) NOT NULL,
  `descuento1` double(10,2) DEFAULT NULL,
  `descuento2` double(10,2) DEFAULT NULL,
  `descuento3` double(10,2) DEFAULT NULL,
  `ExtraD` double(10,2) DEFAULT NULL,
  `TipoXtraD` varchar(1) DEFAULT NULL COMMENT '1-Extra Diurno 2-Extra Diurno: Mas de  3 horas',
  `ExtraN` double(10,2) DEFAULT NULL,
  `TipoXtraN` varchar(1) DEFAULT NULL COMMENT '1-Extra Nocturno 2-Extra Nocturno: Más de 3 horas',
  `ExtraM` double(10,2) DEFAULT NULL,
  `TipoXtraM` varchar(2) DEFAULT NULL COMMENT '1-Mixta D-N 2-Mixta D-N +3h 3-Mixta N-D 4-Mixta N-D +3h',
  `TrabajoFeriado` varchar(2) DEFAULT NULL COMMENT '1-Si 2-No',
  `TrabajoDomingo` varchar(2) DEFAULT NULL COMMENT '1-Si 2-No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `generales`
--

INSERT INTO `generales` (`prefijo`, `tomo`, `asiento`, `cedula`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `estado_civil`, `apellido_casada`, `usa_apellido_casada`, `htrabajadas`, `shora`, `seguro_social`, `seguro_educativo`, `impuesto_renta`, `descuento1`, `descuento2`, `descuento3`, `ExtraD`, `TipoXtraD`, `ExtraN`, `TipoXtraN`, `ExtraM`, `TipoXtraM`, `TrabajoFeriado`, `TrabajoDomingo`) VALUES
('6', '0611', '2109', '6-0611-2109', 'Jungkook', 'Jeon', 'Jimin', '', '1', '', '2', 9.00, 5.50, 24.03, 3.08, 0.00, 1.00, 1.00, 1.00, 1.00, '1', 5.00, '2', 7.00, '4', '2', '1'),
('6', '9838', '17378', '6-9838-17378', 'Noemi', 'OWO', 'UWU', 'IEII', '1', '', '2', 9.00, 3.49, 7.49, 0.96, 0.00, 1.00, 1.00, 1.00, 2.00, '1', 4.00, '1', 3.00, '1', '1', NULL),
('8', '8284', '48727', '8-8284-48727', 'weijd', 'owowo', 'wooe', 'qjjwe', '1', '', '2', 8.00, 3.20, 8.03, 1.03, 0.00, 1.00, 1.00, 1.00, 1.00, '1', 10.00, '1', 1.00, '1', '2', '2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `generales`
--
ALTER TABLE `generales`
  ADD PRIMARY KEY (`cedula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
