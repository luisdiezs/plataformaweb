-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-11-2014 a las 18:27:36
-- Versión del servidor: 5.5.40-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `plataformawebdb`
--
CREATE DATABASE IF NOT EXISTS `plataformawebdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `plataformawebdb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_boleto`
--

DROP TABLE IF EXISTS `tbl_boleto`;
CREATE TABLE IF NOT EXISTS `tbl_boleto` (
  `boleto_id` int(11) NOT NULL AUTO_INCREMENT,
  `reserva_id` int(11) NOT NULL,
  `turista_id` int(11) NOT NULL,
  `descripcion` varchar(2048) NOT NULL,
  `precio_total` double NOT NULL,
  `adelanto` double NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`boleto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cargo`
--

DROP TABLE IF EXISTS `tbl_cargo`;
CREATE TABLE IF NOT EXISTS `tbl_cargo` (
  `cargo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(128) NOT NULL,
  PRIMARY KEY (`cargo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tbl_cargo`
--

INSERT INTO `tbl_cargo` (`cargo_id`, `nombre_cargo`) VALUES
(1, 'supervisor'),
(2, 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_config`
--

DROP TABLE IF EXISTS `tbl_config`;
CREATE TABLE IF NOT EXISTS `tbl_config` (
  `param` varchar(64) NOT NULL,
  `value` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_destino`
--

DROP TABLE IF EXISTS `tbl_destino`;
CREATE TABLE IF NOT EXISTS `tbl_destino` (
  `destino_id` int(11) NOT NULL AUTO_INCREMENT,
  `destino` varchar(128) NOT NULL,
  `descripcion` varchar(2048) NOT NULL,
  `imagen` varchar(128) NOT NULL,
  PRIMARY KEY (`destino_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_paqtour`
--

DROP TABLE IF EXISTS `tbl_paqtour`;
CREATE TABLE IF NOT EXISTS `tbl_paqtour` (
  `paqtour_id` int(11) NOT NULL AUTO_INCREMENT,
  `destino_id` varchar(128) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`paqtour_id`),
  KEY `paqtour_id` (`paqtour_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1001 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reserva`
--

DROP TABLE IF EXISTS `tbl_reserva`;
CREATE TABLE IF NOT EXISTS `tbl_reserva` (
  `reserva_id` int(11) NOT NULL AUTO_INCREMENT,
  `paqtour_id` int(11) NOT NULL,
  `turista_id` int(11) NOT NULL,
  `fecha_reserva` datetime NOT NULL,
  PRIMARY KEY (`reserva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_turista`
--

DROP TABLE IF EXISTS `tbl_turista`;
CREATE TABLE IF NOT EXISTS `tbl_turista` (
  `turista_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(64) NOT NULL,
  `nro_documento` varchar(64) NOT NULL,
  `nombre` varchar(128) NOT NULL,
  `apellido` varchar(128) NOT NULL,
  `edad` int(11) NOT NULL,
  `nacionalidad` varchar(128) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`turista_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_id` int(11) NOT NULL,
  `usuario` varchar(32) NOT NULL,
  `clave` varchar(32) NOT NULL,
  `nombre` varchar(128) NOT NULL,
  `apellido` varchar(128) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`usuario_id`, `cargo_id`, `usuario`, `clave`, `nombre`, `apellido`, `fecha_registro`) VALUES
(1, 1, 'ldiez', 'ldiez123', 'Luis', 'Diez', '2014-11-04 00:00:00'),
(2, 2, 'ellerena', 'ellerena321', 'Estela', 'Llerena', '2014-11-04 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
