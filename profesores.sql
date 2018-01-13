-- phpMyAdmin SQL Dump
-- version 4.0.10.15
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-01-2018 a las 01:14:43
-- Versión del servidor: 5.6.36-log
-- Versión de PHP: 5.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `c0990267_is93`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE IF NOT EXISTS `profesores` (
  `dni` int(8) NOT NULL,
  `legajo` int(4) DEFAULT NULL,
  `apellido` text NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `genero` int(4) NOT NULL,
  `domicilio` varchar(60) NOT NULL,
  `localidad` int(4) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `usuario_id` int(4) NOT NULL,
  `fecha_nac` varchar(30) DEFAULT NULL,
  `fecha_ing_escuela` varchar(30) DEFAULT NULL,
  `fecha_ing_doc` varchar(30) DEFAULT NULL,
  `idcarga` int(4) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `persona_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `dni` (`dni`),
  KEY `genero` (`genero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`dni`, `legajo`, `apellido`, `nombre`, `genero`, `domicilio`, `localidad`, `telefono`, `celular`, `usuario_id`, `fecha_nac`, `fecha_ing_escuela`, `fecha_ing_doc`, `idcarga`, `email`, `persona_tipo`) VALUES
(8385543, 0, 'CICCHITTI', 'MARIO OSCAR', 1, 'CALLE 102 N 447', 12, '02224471256', '', 0, '02/07/1950', '', '', 25, '', NULL),
(8447843, 0, 'SANGUINETTI', 'JUAN CARLOS', 1, 'URUGUAY 583', 18, '', '0222415451576', 0, '11/08/1950', '', '', 25, '', NULL),
(10540805, 0, 'VILLEGAS', 'MARIA CRISTINA', 2, '25 DE MAYO XX', 17, '02225422518', '', 0, '22/03/1952', '', '', 25, '', NULL),
(10871300, 0, 'SAVIZA', 'OSVALDO RUBEN', 1, 'JOSE HERNANDEZ 1481', 13, '', '02223679707', 0, '08/12/1953', '', '', 25, '', NULL),
(12708192, 0, 'GONZALEZ CHAVARRIA', 'MARTA NOEMI', 2, 'MITRE 962', 2, '', '1166407430', 0, '28/08/1956', '', '', 25, '', NULL),
(12962853, 0, 'ARMIROTTI', 'JORGE DARIO', 1, 'GENERAL PAZ 50', 18, '', '1157279185', 0, '23/05/1959', '', '', 25, '', NULL),
(13702023, 0, 'FARIAS', 'JORGE DANIEL', 1, '', 17, '', '2224500987', 0, '23/01/1960', '', '', 2, '', NULL),
(13791475, 0, 'VILCHEZ', 'JORGE ADOLFO', 1, '', 13, '', '0222415549962', 0, '24/02/1960', '', '', 25, '', NULL),
(14675177, 0, 'PALACIOS', 'MIGUEL ANGEL', 1, 'PRIMERA JUNTA 37', 17, '', '0222415498872', 0, '22/05/1961', '', '', 25, '', NULL),
(14675858, 0, 'CONTENTO', 'JOSE EDUARDO', 1, '25 DE MAYO 372', 4, '', '1156619580', 0, '19/09/1962', '', '', 25, '', NULL),
(14675862, 0, 'TORRESAN', 'ANA', 2, 'ALFONSO XIII N 1212', 3, '42331359', '', 0, '19/08/1961', '', '', 25, '', NULL),
(16143608, 0, 'GUTIERREZ', 'SILVANA NORA', 2, 'LAS HERAS 814', 25, '', '1559552331', 0, '29/08/1962', '', '', 25, '', NULL),
(16713869, 0, 'SANDEZ', 'JORGE GUSTAVO', 1, 'AV. PTE. PERON 4173 DTO.4', 17, '', '1159693854', 0, '28/11/1963', '', '', 25, '', NULL),
(16777178, 0, 'LABARTA', 'MARCELO GABRIEL', 1, 'EVA PERON 743', 4, '42387316', '', 0, '', '', '', 25, '', NULL),
(17487067, 0, 'CARMODY', 'SANDRA BEATRIZ', 2, 'RUTA 6 KM 74', 17, '', '1141428486', 0, '21/08/1965', '', '', 25, '', NULL),
(17505835, 0, 'ALBERTINI', 'ROBERTO DANIEL', 1, 'DEAN FUNES 132', 13, '', '1161659645', 0, '12/11/1965', '', '', 25, '', NULL),
(17589694, 0, 'RODRIGUEZ', 'ANA MARIA', 2, 'LUIS MARIA DRAGO 326', 18, '02224422885', '', 0, '31/12/1967', '', '', 25, '', NULL),
(17731780, 0, 'GELSI', 'FABIO ALEJANDRO', 1, '', 13, '', '0222415542498', 0, '21/09/1968', '', '', 25, '', NULL),
(17917901, 0, 'ALOE', 'ANTONIO RAMON', 1, 'ARISTOBULO DEL VALLE 238', 1, '02224424680', '69468045', 0, '11/09/1966', '', '', 2, '', NULL),
(20215050, 0, 'MARQUEZ', 'NORBERTO RUBEN', 1, '', 13, '', '0222415500852', 0, '31/05/1969', '', '', 25, '', NULL),
(21138851, 0, 'CARBONE', 'JAVIER SALVADOR', 1, '20 DE JUNIO 251', 17, '', '1137256960', 0, '11/12/1969', '', '', 25, '', NULL),
(22143273, 0, 'MORE', 'SANDRA', 1, 'ANTARTIDA ARGENTINA 2932', 12, '2224470452', '', 0, '25/05/1971', '', '', 25, '', NULL),
(22433592, 0, 'MERLICCO', 'MARCOS DARIO', 1, 'HONDURAS 267', 18, '', '1133030400', 0, '29/10/1971', '', '', 25, '', NULL),
(22605223, 0, 'BROGGIA', 'LEONARDO', 1, 'RACCONE 652', 18, '02225425600', '0222415466535', 0, '07/07/1972', '', '', 25, '', NULL),
(22718772, 0, 'CAIRO', 'MARIA FERNANDA', 2, 'MIGUEL FAUSTO ROCA 421', 4, '42995708', '1156121135', 0, '20/11/1972', '', '', 25, '', NULL),
(22980123, 0, 'SEGURA', 'EMILIANO', 1, '', 13, '', '1157801377', 0, '', '', '', 25, '', NULL),
(23618812, 0, 'ALOE', 'ADAN FRANCISCO', 1, 'FRENCH 872', 17, '', '1141901523', 0, '17/11/1973', '', '', 25, '', NULL),
(24935808, 0, 'LOPEZ', 'ROBERTO ALEJANDRO', 1, 'REPUBLICA ARGENTINA 853', 12, '', '1162107827', 0, '19/08/1961', '', '', 25, '', NULL),
(24966953, 0, 'VILTE', 'PAMELA DE LOS SANTOS', 2, 'CASTELLI 1653', 17, '', '0222415543270', 0, '16/10/1975', '', '', 25, '', NULL),
(25108642, 0, 'MACHUCA', 'OSCAR', 1, '9 DE JULIO 673', 17, '02225484693', '0222415464510', 0, '04/04/1976', '', '', 25, '', NULL),
(25152732, 0, 'PALMIERI', 'LEONARDO FEDERICO', 1, 'TIEGHI 1459', 3, '20740409', '1140362043', 0, '04/05/1976', '', '', 25, '', NULL),
(25258172, 0, 'OVIEDO', 'MANUEL ARMANDO', 1, '', 13, '', '', 0, '10/06/1976', '', '', 25, '', NULL),
(25535140, 0, 'JACOBSEN', 'BETIANA MARICEL', 2, 'PRIMERA JUNTA 37', 17, '', '022241545001', 0, '28/10/76', '', '', 25, '', NULL),
(26392509, 0, 'DANERI', 'GASTON ALFREDO', 1, 'PUEYRREDON 413', 12, '02225424800', '1141614791', 0, '26/11/1977', '', '', 25, '', NULL),
(26562609, 0, 'SALAZAR', 'VALERIA', 2, 'TENIENTE IBAÃ?EZ 291', 18, '02225422081', '1155943204', 0, '11/09/1968', '', '', 25, '', NULL),
(27144269, 0, 'ALVAREZ', 'CAROLINA SILVANA', 2, 'GABINO EZEIZA 173', 18, '', '0222415462242', 0, '26/12/1978', '', '', 25, '', NULL),
(27193022, 0, 'SANGUINETTI', 'GABRIELA', 2, 'KENEDY 274', 18, '02225425809', '', 0, '27/12/1979', '', '', 25, '', NULL),
(27943599, 0, 'FERNANDEZ', 'LIGIA ERICA', 2, 'LINCOLN 252', 18, '', '0222415465291', 0, '12/04/1980', '', '', 25, '', NULL),
(28054020, 0, 'PINI', 'LEANDRO ALEXIS', 1, '', 18, '', '1136884366', 0, '21/06/1980', '', '', 24, '', NULL),
(28554605, 0, 'IRALA', 'LORENA', 2, 'CALLE 110 N 973', 12, '', '1136601763', 0, '', '', '', 25, '', NULL),
(30238266, 0, 'AMEZTOY', 'EMILIANO JOSE', 1, 'SAENZ PEÃ?A 85', 17, '', '0222415447652', 0, '26/06/1983', '', '', 25, '', NULL),
(30480423, 0, 'TOLEDO', 'RODRIGO EMANUEL', 1, 'ZEBOLLOS 424', 18, '', '1139575485', 0, '15/09/1985', '', '', 25, '', NULL),
(31721353, 0, 'DEL BONO', 'GASTON', 1, 'SEGUI 311', 18, '', '', 0, '21/07/1985', '', '', 25, '', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
