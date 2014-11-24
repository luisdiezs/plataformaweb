-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-11-2014 a las 15:29:24
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_boleto`
--

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

CREATE TABLE IF NOT EXISTS `tbl_config` (
  `param` varchar(64) NOT NULL,
  `value` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_destino`
--

CREATE TABLE IF NOT EXISTS `tbl_destino` (
  `destino_id` int(11) NOT NULL AUTO_INCREMENT,
  `destino` varchar(128) NOT NULL,
  PRIMARY KEY (`destino_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `tbl_destino`
--

INSERT INTO `tbl_destino` (`destino_id`, `destino`) VALUES
(1, 'Plaza de Armas de San Ramón'),
(2, 'Plaza de Armas de San Ramón'),
(3, 'Catarata Tirol'),
(4, 'Mariposario y mini Zoológico “Zhaveta Yard”'),
(5, 'Comunidad Nativa Asháninka Pampa Michi'),
(6, 'Planta lechera “La Floralp”'),
(7, 'Tunki Cueva'),
(8, 'Planta Artesanal “El Wharapo”'),
(9, 'City tour Oxapampa'),
(10, 'Puente Kimiri'),
(11, 'Cataratas de Bayoz'),
(12, 'Catarata Velo de la Novia'),
(13, 'Cañon de Yurinaki'),
(14, 'Planta Procesadora de Café');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_paqtur`
--

CREATE TABLE IF NOT EXISTS `tbl_paqtur` (
  `paqtour_id` int(11) NOT NULL AUTO_INCREMENT,
  `destino_id` varchar(128) NOT NULL,
  `nombre` varchar(512) NOT NULL,
  `descripcion` varchar(1024) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`paqtour_id`),
  KEY `paqtour_id` (`paqtour_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1004 ;

--
-- Volcado de datos para la tabla `tbl_paqtur`
--

INSERT INTO `tbl_paqtur` (`paqtour_id`, `destino_id`, `nombre`, `descripcion`, `hora_inicio`, `hora_fin`, `precio`) VALUES
(1001, '1,2,3,4', 'San Ramón – Catarata de Tirol - Comunidad Nativa Ashaninka', 'Iniciamos nuestro recorrido visitando la plaza de Armas de San Ramón, caminata hacia la Catarata Tirol,  donde observaremos la flora y fauna de la zona y donde disfrutaremos de un refrescante baño. Visita al Mariposario y mini Zoológico “Zhaveta Yard”, Comunidad Nativa Asháninka Pampa Michi', '10:30:00', '19:30:00', 150),
(1002, '5,6,7,8', 'Oxapampa – Tunki Cueva – El Wharapo', 'En el trayecto a la ciudad de Oxapampa atravesaremos el Distrito de San Luis de Shuaro. Puente Paucartambo (límite entre Junín y Pasco). Mirador de Mesapata desde todo se tendrá una vista panorámica del Valle de Paucartambo. Monumento de Bienvenida a la ciudad Geocéntrica del Perú. Visitaremos la Planta lechera “La Floralp”, después conoceremos la   Tunki Cueva en este lugar observaremos la formación de estalagmitas y estalactitas. Criadero de truchas, seguiremos nuestro recorrido hacia la Planta Artesanal   “El Wharapo” (degustación y compra). Para culminar nuestro día haremos un city tour conociendo la Iglesia de Oxapampa, principales casas típicas y el Paseo de los Colonos.', '07:30:00', '20:30:00', 220),
(1003, '9,10,11,12,13', 'Puente Kimiri - Catarat de Bayoz – Velo de la Novia', 'Iniciamos nuestro recorrido, apreciando el Perfil del Nativo Dormido. puente colgante Victoria. Cataratas de Bayoz, Catarata Velo de la Novia, Cañon de Yurinaki, Puerto paseo en bote. Planta Procesadora de Café (degustación y compra).', '09:30:00', '20:30:00', 250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reserva`
--

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
