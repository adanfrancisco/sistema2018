-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-09-2018 a las 12:41:21
-- Versión del servidor: 5.6.40-log
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `c0990267_is93`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `dni` int(8) NOT NULL,
  `usuario_id` int(4) DEFAULT NULL,
  `apellido` varchar(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `fecha_nac` varchar(10) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `localidad` int(4) DEFAULT NULL,
  `domicilio` varchar(60) DEFAULT NULL,
  `tel_fijo` varchar(30) DEFAULT NULL,
  `tel_celu` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `libro` varchar(10) DEFAULT NULL,
  `folio` int(10) NOT NULL,
  `idcarga` int(4) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`dni`, `usuario_id`, `apellido`, `nombre`, `fecha_nac`, `genero`, `localidad`, `domicilio`, `tel_fijo`, `tel_celu`, `email`, `libro`, `folio`, `idcarga`, `activo`) VALUES
(11222333, 0, 'GONZALEZ', 'JUAN', '17/11/1988', '1', 17, 'FRENCH 872', '999', '888', 'mimail@gmail.com', '7', 132, 24, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_retiro`
--

CREATE TABLE `alumno_retiro` (
  `idAsistencia` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `hora` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_alumno`
--

CREATE TABLE `asistencia_alumno` (
  `idAsistencia` int(4) NOT NULL,
  `dni` int(8) NOT NULL,
  `fecha` datetime NOT NULL,
  `hora` varchar(10) NOT NULL,
  `profe` int(8) DEFAULT NULL,
  `confirmada` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL,
  `carrera_nombre` varchar(40) NOT NULL DEFAULT '',
  `escuela` int(8) DEFAULT NULL,
  `resolucion` varchar(30) DEFAULT NULL,
  `carrera_nombre_largo` varchar(160) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id_carrera`, `carrera_nombre`, `escuela`, `resolucion`, `carrera_nombre_largo`) VALUES
(5, 'ADM. CONTABLE', 60563100, '273/03', NULL),
(6, 'PROGRAMADOR', 60563100, '6175/03', NULL),
(7, 'ADM. PUBLICA', 60563100, '2407/03', NULL),
(8, 'ADM. MARKETING', 60563100, '5834/03', NULL),
(9, 'GUIA DE TURISMO', 60563100, '279/03', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `idcurso` int(3) NOT NULL,
  `curso` varchar(10) NOT NULL,
  `carrera_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idcurso`, `curso`, `carrera_id`) VALUES
(16, '1CONT', 5),
(17, '2CONT', 5),
(18, '3CONT', 5),
(19, '1SIS', 6),
(20, '2SIS', 6),
(21, '3SIS', 6),
(22, '1PUB', 7),
(23, '2PUB', 7),
(24, '3PUB', 7),
(25, '1MKT', 8),
(26, '2MKT', 8),
(27, '3MKT', 8),
(28, '1TUR', 9),
(29, '2TUR', 9),
(30, '3TUR', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_lectivo`
--

CREATE TABLE `curso_lectivo` (
  `idcursolectivo` int(3) NOT NULL,
  `curso` int(3) NOT NULL,
  `anio` int(4) NOT NULL,
  `division` int(4) NOT NULL,
  `descripcion` varchar(12) NOT NULL DEFAULT '',
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_cese` datetime DEFAULT NULL,
  `turno` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso_lectivo`
--

INSERT INTO `curso_lectivo` (`idcursolectivo`, `curso`, `anio`, `division`, `descripcion`, `fecha_alta`, `fecha_cese`, `turno`) VALUES
(1, 16, 2018, 1, '1-contable', NULL, NULL, NULL),
(2, 17, 2018, 1, '2-contable', NULL, NULL, NULL),
(3, 118, 2018, 1, '2-contable', NULL, NULL, NULL),
(4, 19, 2018, 1, '1-sistema(a)', NULL, NULL, NULL),
(5, 20, 2018, 1, '2-sistema', NULL, NULL, NULL),
(6, 21, 2018, 1, '3-sistema', NULL, NULL, NULL),
(7, 22, 2018, 1, '1-publica', NULL, NULL, NULL),
(8, 23, 2018, 1, '2-publica', NULL, NULL, NULL),
(9, 24, 2018, 1, '3-publica', NULL, NULL, NULL),
(10, 25, 2018, 1, '1-marketing', NULL, NULL, NULL),
(11, 26, 2018, 1, '2-marketing', NULL, NULL, NULL),
(12, 27, 2018, 1, '3-marketing', NULL, NULL, NULL),
(13, 28, 2018, 1, '1-turismo', NULL, NULL, NULL),
(14, 29, 2018, 1, '2-turismo', NULL, NULL, NULL),
(15, 30, 2018, 1, '3-turismo', NULL, NULL, NULL),
(16, 19, 2018, 2, '1-sistema(b)', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `division`
--

CREATE TABLE `division` (
  `id_division` int(4) NOT NULL,
  `descripcion_curso` varchar(10) NOT NULL DEFAULT '',
  `curso_lectivo_id` int(3) NOT NULL,
  `alumno` int(8) NOT NULL,
  `anio_lectivo` int(4) NOT NULL,
  `grupo` int(4) DEFAULT NULL,
  `fecha_alta` varchar(10) DEFAULT NULL,
  `repetidor` varchar(1) DEFAULT NULL,
  `idcarga` int(4) DEFAULT NULL,
  `turno` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela`
--

CREATE TABLE `escuela` (
  `cue` int(8) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `localidad` int(4) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `escuela`
--

INSERT INTO `escuela` (`cue`, `nombre`, `localidad`, `direccion`, `telefono`) VALUES
(60563100, 'INSTITUTO SUPERIOR 93', 17, 'SAN MARTIN 101', '02225481175');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nro` int(4) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nro`, `nombre`) VALUES
(1, 'UNICO'),
(2, 'UNO'),
(3, 'DOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencia_encuadre`
--

CREATE TABLE `licencia_encuadre` (
  `idencuadre` int(11) NOT NULL,
  `articulo` varchar(30) NOT NULL DEFAULT '',
  `inciso` varchar(30) NOT NULL DEFAULT '',
  `max_dias` int(11) DEFAULT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `licencia_encuadre`
--

INSERT INTO `licencia_encuadre` (`idencuadre`, `articulo`, `inciso`, `max_dias`, `descripcion`) VALUES
(1, '114', 'A.1', 120, ' a.1) Licencia Ordinaria por Enfermedad:\r\na.1.1) Personal Titular: hasta ciento veinte (120) dÃ­as corridos por aÃ±o calendario en forma continua o alternada en las siguientes condiciones:\r\na.1.1.1) Los primeros veinticinco (25) dÃ­as con goce Ã­ntegro de haberes.\r\na.1.1.2) Los treinta y cinco (35) dÃ­as siguientes con el cincuenta (50) por ciento de haberes.\r\na.1.1.3) Los sesenta (60) dÃ­as restantes sin goce de haberes.\r\na.1.2) Personal Docente Provisional: gozarÃ¡ de la Licencia determinada en el presente artÃ­culo e incisos, en las condiciones y con los lÃ­mites allÃ­ establecidos, hasta un mÃ¡ximo de veinticinco (25) dÃ­as corridos, continuos o alternados, en el aÃ±o calendario. Cuando el Personal Docente Provisional alcance una antigÃ¼edad mÃ­nima de un aÃ±o en la docencia, gozarÃ¡ de las Licencias que se determinen en el presente artÃ­culo e inciso, en las mismas condiciones que los Docentes Titulares.\r\na.1.3) Personal Suplente: tres (3) dÃ­as corridos por cada mes de trabajo completo cumplidos en el ciclo lectivo correspondiente hasta un mÃ¡ximo de veinte (20) dÃ­as corridos por aÃ±o calendario, computÃ¡ndose el desempeÃ±o en el escalafÃ³n correspondiente. El Personal Docente Suplente que alcance una antigÃ¼edad mÃ­nima de un (1) aÃ±o en la docencia, gozarÃ¡ de las Licencias determinadas en el presente artÃ­culo e inciso, en las mismas condiciones que el Personal Titular.'),
(2, '114', 'A.2', 725, 'a.2 Licencia Extraordinaria por Enfermedad: en caso de intervenciones quirÃºrgicas y/o enfermedades que produzcan incapacidad laboral invalidante por tiempo prolongado, de conformidad con lo determinado por la Junta MÃ©dica correspondiente. Esta Licencia se otorgarÃ¡ independientemente de los plazos establecidos en a.1.\r\na.2.1) Personal Titular con menos de cinco (5) aÃ±os de AntigÃ¼edad: hasta setecientos veinticinco (725) dÃ­as corridos en forma continua o alternada en las siguientes condiciones:\r\na.2.1.1) Los primeros trescientos sesenta y cinco (365) dÃ­as con goce Ã­ntegro de haberes.\r\na.2.1.2) Los ciento ochenta (180) dÃ­as siguientes con el cincuenta (50) por ciento de haberes.\r\na.2.1.3) Los ciento ochenta (180) dÃ­as restantes sin goce de haberes.\r\na.2.2) Personal Titular con cinco (5) o mÃ¡s aÃ±os de AntigÃ¼edad: hasta mil noventa y cinco (1095) dÃ­as corridos en forma continua o alternada en las siguientes condiciones:\r\na.2.2.1) Los primeros trescientos sesenta y cinco (365) dÃ­as con goce Ã­ntegro de haberes.\r\na.2.2.2) Los trescientos sesenta y cinco (365) dÃ­as siguientes con el cincuenta (50) por ciento de haberes.\r\na.2.2.3) Los trescientos sesenta y cinco (365) dÃ­as restantes sin goce de haberes.\r\na.2.3) Por el  perÃ­odo completo, sÃ³lo se podrÃ¡ utilizar esta Licencia una vez en la carrera Docente.\r\na.2.4) El personal que antes de cumplir cinco (5) aÃ±os de antigÃ¼edad hubiere agotado el perÃ­odo de setecientos veinticinco (725) dÃ­as en forma completa, sÃ³lo podrÃ¡ tener acceso a una diferencia de trescientos sesenta (360) dÃ­as, luego de haber adquirido la antigÃ¼edad mÃ­nima de los citados cinco aÃ±os. A dicha cantidad de dÃ­as se accederÃ¡ en las siguientes condiciones:\r\na.2.4.1) Los primeros ciento ochenta (180) dÃ­as con el cincuenta (50) por ciento de haberes.\r\na.2.4.2) Los ciento ochenta (180) dÃ­as restantes sin goce de haberes.\r\na.2.5)  En caso de que el Personal Docente arribe a la antigÃ¼edad de cinco (5) aÃ±os, mientras se encuentra utilizando la Licencia, podrÃ¡ continuar y acceder a utilizar un perÃ­odo completo de mil noventa y cinco (1095) dÃ­as, con la siguiente aclaraciÃ³n para el computo de los dÃ­as:\r\na.2.5.1) Si se encuentra gozando de los primeros trescientos sesenta y cinco (365) dÃ­as con goce Ã­ntegro, el computo hasta agotar los mil noventa y cinco (1095) dÃ­as continuarÃ¡ normalmente.\r\na.2.5.2) Si se encuentra gozando de cualquiera de las fracciones de ciento ochenta (180) dÃ­as (con el 50% o sin goce de haberes) se realizarÃ¡ la siguiente operaciÃ³n:\r\nDG = DÃ­as ya utilizados correspondientes a las fracciones de 180 dÃ­as con el 50% o sin goce de haberes.\r\nTDG = Total de dÃ­as utilizados con la conversiÃ³n incluida por la diferencia de perÃ­odos.\r\nDEG = DÃ­as de Licencia que efectivamente le quedan para utilizar, a partir del dÃ­a en que adquiera la antigÃ¼edad de cinco aÃ±os.\r\n365 + (DG x 2) = TDG\r\ny luego:  1.095 ? TDG = DEG\r\na.2.6) Personal Provisional: en iguales condiciones que el Personal Titular siempre que su duraciÃ³n no exceda de la dÃ©cima parte de la antigÃ¼edad registrada en la DirecciÃ³n General de Escuelas y Cultura a la fecha de interposiciÃ³n del pedido.\r\na.2.7) Personal Suplente: no gozarÃ¡ de este beneficio, excepto en los casos en que el Agente sufriera contagio en el lugar de trabajo de enfermedades infecto-contagiosas (sarampiÃ³n, rubÃ©ola, hepatitis, etc.) situaciÃ³n que siempre deberÃ¡ ser certificada y/o avalada por la DirecciÃ³n de Reconocimientos MÃ©dicos, sus Delegaciones, o Delegaciones de la DirecciÃ³n General de Escuelas y Cultura.\r\nCada uno de los perÃ­odos de esta Licencia serÃ¡ acumulable durante toda la carrera docente a la fecha del cÃ³mputo total de la misma, cualquiera sea la situaciÃ³n de revista en que haya sido otorgada. '),
(3, '114', 'A.3', 1095, '  a.3) Licencia por Enfermedad Profesional y Accidente de Trabajo:\r\na.3.1) Personal Titular: toda vez que el Agente adquiera una incapacidad total o parcial, temporaria o permanente por alguna de estas causales, tendrÃ¡ derecho a Licencia hasta un mÃ¡ximo de mil noventa y cinco (1095) dÃ­as en forma continua o alternada con goce Ã­ntegro de haberes.\r\na.3.2) Personal Provisional o Suplente: en iguales condiciones que el Personal Titular. Si durante el perÃ­odo de Licencia acordado por esta causal se produjere el cese del Agente, este permanecerÃ¡ percibiendo una compensaciÃ³n equivalente al haber normal que debiera percibir hasta la finalizaciÃ³n de dicho perÃ­odo.\r\na.3.3) El Superior JerÃ¡rquico del Agente que sufriera un accidente de trabajo deberÃ¡ realizar la denuncia del mismo ante la Autoridad Policial correspondiente y ante el Consejo Escolar del Distrito, para ser elevada de inmediato con el correspondiente perÃ­odo de Licencia a la DirecciÃ³n de Personal de la DirecciÃ³n General de Escuelas y Cultura de la Provincia de Buenos Aires, dentro de los dos (2) dÃ­as hÃ¡biles; ademÃ¡s deberÃ¡ labrar un Acta haciendo constar como ocurrieron los hechos, la que deberÃ¡ ser firmada por dos (2) testigos, si los hubiere. Con todos estos antecedentes deberÃ¡ presentarse en la DelegaciÃ³n correspondiente de la SubsecretarÃ­a de Trabajo de la Provincia de Buenos Aires, donde se harÃ¡ el expediente respectivo.\r\na.3.4) Si el accidente ocurriere en el trayecto entre el lugar de trabajo y el domicilio del Agente, el Superior JerÃ¡rquico deberÃ¡ certificar que el mismo tuvo lugar en la ruta usual, sin que esta hubiere sido alterada por interÃ©s particular del Docente o por cualquier razÃ³n extraÃ±a al trabajo.\r\nSi sucediere en el trayecto en un lugar de trabajo a otro, la denuncia deberÃ¡ ser formulada en el lugar al que se dirija.\r\na.3.5) El Agente que sufre un accidente de trabajo deberÃ¡ comunicarlo a los Establecimientos a los que presta servicios dentro de los dos (2) dÃ­as de sucedido.'),
(5, '114', 'B', 2, 'b)      Por Examen MÃ©dico Pre-Matrimonial:\r\nb.1) Personal Titular, Provisional y Suplente: se le concederÃ¡n dos (2) dÃ­as hÃ¡biles con goce de haberes. El Agente que invoque esta causal deberÃ¡ presentar ante su Superior JerÃ¡rquico, el certificado del Organismo Oficial interviniente.'),
(6, '114', 'C', 12, 'c)      Licencia por Matrimonio:\r\n                          c.1) Personal Titular y Provisional: este Ãºltimo mientras dure su situaciÃ³n de revista como tal: Se le concederÃ¡n doce (12) dÃ­as hÃ¡biles con goce de haberes, a partir de la fecha de celebrado el matrimonio.\r\n                             c.2) Personal Suplente: mientras dure su situaciÃ³n de revista como tal: se le concederÃ¡n seis (6) dÃ­as hÃ¡biles con goce de haberes a partir de la fecha de celebraciÃ³n del matrimonio.\r\nLa justificaciÃ³n de estas inasistencias, se realizarÃ¡ con la presentaciÃ³n del certificado de matrimonio expedido por Autoridad Competente.'),
(7, '114', 'D.1', 135, '                             d.1) Por Maternidad:\r\nd.1.1) Personal Titular, Provisional y Suplente: El Personal femenino gozarÃ¡ de Licencia por Embarazo y Maternidad, con goce Ã­ntegro de haberes, por el tÃ©rmino de ciento treinta y cinco (135) dÃ­as corridos, a partir del sÃ©ptimo y medio (7Â½) mes de embarazo lo que se acreditarÃ¡ mediante la presentaciÃ³n del certificado mÃ©dico. \r\nd.1.2) En los de nacimientos mÃºltiples, y/o prematuros (2,300 Kg. o menos) a partir del sÃ©ptimo y medio (7Â½) mes de gestaciÃ³n, se ampliarÃ¡ hasta completar ciento cincuenta (150) dÃ­as corridos de Licencia.\r\nd.1.3) Cuando se produzcan nacimientos mÃºltiples y/o prematuros entre el sexto (6) mes y el sÃ©ptimo y medio (7Â½) mes de gestaciÃ³n, se adicionarÃ¡n a los ciento cincuenta (150) dÃ­as de Licencia por Maternidad, tantos dÃ­as corridos como correspondan al perÃ­odo comprendido entre la fecha de nacimiento y la de cumplimiento del sÃ©ptimo y medio (7Â½) mes de gestaciÃ³n.\r\nd.1.4) Si durante el transcurso de la Licencia ocurriere el fallecimiento del hijo, la misma se limitarÃ¡ de la siguiente forma:\r\nd.1.4.1) A cuarenta y cinco (45) dÃ­as corridos desde la fecha de nacimiento del hijo, cuando el fallecimiento se produjera dentro de ese tÃ©rmino.\r\nd.1.4.2) A la fecha de fallecimiento cuando este tenga lugar despuÃ©s de los cuarenta y cinco (45) dÃ­as corridos del nacimiento.\r\nd.1.4.3) A treinta (30) dÃ­as corridos cuando se produzca defunciÃ³n fetal.\r\nd.1.5) Si se produjera DefunciÃ³n fetal entre el cuarto (4) y sÃ©ptimo y medio (7Â½) mes de embarazo, se otorgarÃ¡n quince (15) dÃ­as corridos de Licencia, a partir de la fecha de interrupciÃ³n del embarazo.\r\nd.1.6) Si en el Ã¡mbito de trabajo se declararÃ¡n casos de conocida probabilidad teratogÃ©nica (verb. rubÃ©ola, hepatitis, sarampiÃ³n, etc.), existiendo posibilidad de contagio, las Agentes que cursen el primer cuatrimestre de embarazo, se hallarÃ¡n eximidas de prestar servicios hasta que se disponga con carÃ¡cter transitorio, su cambio de destino a otro Ã¡mbito en el cual no existe dicha situaciÃ³n y mientras persistan los mismos en el lugar de trabajo de origen.\r\nEl Inspector de EnseÃ±anza correspondiente, arbitrarÃ¡ los medios para que el cambio de destino transitorio se opere dentro de los tres (3) dÃ­as de relevada la Docente.\r\nd.1.7) Las Licencias por Maternidad son obligatorias y la Docente interesada deberÃ¡ solicitarla o en su defecto serÃ¡n dispuestas de oficio por la Autoridad MÃ©dica, o a pedido del Superior JerÃ¡rquico inmediato. En caso de omisiÃ³n de la solicitud, y siendo Ã©sta de oficio, se le otorgarÃ¡n los dÃ­as que restan hasta completar el perÃ­odo pre-parto y luego los noventa (90) dÃ­as contados a partir del mismo.\r\nd.1.8) Los haberes de la Docente licenciada por Maternidad serÃ¡n liquidados Ã­ntegramente sin interrupciÃ³n debiÃ©ndose presentar la partida de nacimiento dentro de los tres (3) dÃ­as de expedida la misma.\r\nLas Docentes Provisionales y Suplentes que en uso de Licencia cesen su desempeÃ±o continuaran percibiendo sus haberes hasta la finalizaciÃ³n del perÃ­odo concedido, con todos sus efectos previsionales y de antigÃ¼edad bonificante.\r\nd.1.9) Las Docentes de EducaciÃ³n FÃ­sica, Danzas y ExpresiÃ³n Corporal y de EducaciÃ³n Especial en estado de gravidez, que deban realizar esfuerzos con los alumnos y que se desempeÃ±en como Titulares Provisionales y/o Suplentes, podrÃ¡n solicitar un cambio transitorio de funciÃ³n que se extenderÃ¡ hasta la iniciaciÃ³n de la Licencia reglamentaria por Maternidad, manteniendo la misma obligaciÃ³n horaria de su cargo de origen. Dichas Docentes deberÃ¡n completar el formulario en uso y adjuntar las certificaciones mÃ©dica oficial o particular.\r\nEl Superior JerÃ¡rquico autorizarÃ¡ en forma inmediata, con intervenciÃ³n de la InspecciÃ³n de Ãrea, el cambio transitorio de funciÃ³n, ad-referÃ©ndum del Acto Administrativo correspondiente. Este cambio se efectivizarÃ¡ conforme lo determinado en el artÃ­culo 121 Apartado 3, de esta ReglamentaciÃ³n.\r\nSi se produjere la interrupciÃ³n del embarazo, durante el cambio transitorio de funciÃ³n, la docente deberÃ¡ comunicar dentro del plazo de dos (2) dÃ­as tal situaciÃ³n al Superior JerÃ¡rquico, a efectos de que se disponga el reintegro a su destino de origen una vez finalizada la licencia correspondiente.\r\nd.1.10) El Personal Titular, Provisional y Suplente gozarÃ¡ de Licencia por Trastorno de Embarazo o Amenaza de Aborto, por el plazo que determine la Junta MÃ©dica dispuesta por la DirecciÃ³n de Reconocimientos MÃ©dicos y/o sus Delegaciones Regionales y/o DelegaciÃ³n de la DirecciÃ³n General de Escuelas y Cultura, con goce Ã­ntegro de haberes.\r\nd.1.11) Una vez finalizada la Licencia por Maternidad, la Docente podrÃ¡ optar por no reintegrarse a sus tareas durante un perÃ­odo no superior a seis (6) meses, sin percepciÃ³n de haberes.\r\nd.1.12) En caso de que el hijo fuera discapacitado, la Licencia prevista en el inciso d.1.11) serÃ¡ con goce Ã­ntegro de haberes.\r\nd.1.13) Las dos Licencias previstas en los incisos d.1.11) y d.1.12) serÃ¡n aplicables, en las mismas condiciones, a los casos de AdopciÃ³n.'),
(8, '114', 'D.2', 90, ' d.2) Por AdopciÃ³n:\r\nd.2.1) Personal Titular, Provisional y Suplente: Se le otorgarÃ¡ Licencia con goce Ã­ntegro de haberes, en caso de adopciÃ³n de hijos de hasta siete (7) aÃ±os de edad, al personal femenino durante noventa (90) dÃ­as corridos, y al masculino durante cinco (5) dÃ­as, a partir de la fecha de guarda o tenencia con fines de  adopciÃ³n, otorgada por Autoridad Judicial o Administrativa competente. Si se trata de adopciÃ³n mÃºltiple, el tÃ©rmino para el personal femenino se extenderÃ¡ a ciento cinco (105) dÃ­as corridos.\r\nd.2.2) Si durante el transcurso de la Licencia ocurriere el fallecimiento del niÃ±o, la misma caducarÃ¡ a la fecha del Deceso.\r\n                        d.3) Personal Titular, Provisional o Suplente: Toda Docente cuya jornada de tareas tenga una duraciÃ³n no menor de seis (6) horas dispondrÃ¡ de un lapso de una (1) hora diaria, a su elecciÃ³n, para el cuidado y alimentaciÃ³n de su hijo, hasta un mÃ¡ximo de ciento ochenta (180) dÃ­as corridos a contar desde la fecha del nacimiento.'),
(9, '114', 'E', 5, 'e)      Por Nacimiento de Hijo:\r\n                        e.1) Personal Masculino, Titular, Provisional y Suplente: estos Ãºltimos mientras dure su situaciÃ³n de revista como tales: se le concederÃ¡ cinco (5) dÃ­as hÃ¡biles con goce Ã­ntegro de haberes a partir del dÃ­a del nacimiento.\r\nEl Agente deberÃ¡ presentar ante su Superior JerÃ¡rquico, el Certificado de Nacimiento expedido por Autoridad competente.'),
(10, '114', 'F', 20, 'f)        Por AtenciÃ³n de Familiar Enfermo:\r\nf.1) Personal Titular: se le concederÃ¡ al Agente hasta un mÃ¡ximo de veinte (20) dÃ­as corridos, continuos o alternados, por aÃ±o calendario con goce Ã­ntegro de haberes. Esta Licencia podrÃ¡ ampliarse en treinta (30) dÃ­as corridos mÃ¡s, sin goce de haberes.\r\nA la solicitud de Licencia se adjuntarÃ¡ una DeclaraciÃ³n Jurada del Agente, en la que se especificarÃ¡:\r\nf.1.1) Que el Agente es el Ãºnico familiar que puede llenar ese cometido\r\nf.1.2) Que el familiar enfermo no puede valerse por sus propios medios para desarrollar las actividades elementales.\r\nSi el familiar enfermo se hallare internado en un establecimiento asistencial, el Agente tendrÃ¡ derecho a esta Licencia cuando se haga imprescindible su presencia. Esta situaciÃ³n serÃ¡ constatada por la Autoridad MÃ©dica correspondiente.\r\n                        f.2) Personal Provisional: en iguales condiciones que al Personal Titular, siempre que su duraciÃ³n no exceda la dÃ©cima parte de los servicios prestados en la provisionalidad durante el aÃ±o calendario en que solicite la Licencia.\r\n                       f.3) Personal Suplente: GozarÃ¡ de dos (2) dÃ­as hÃ¡biles por aÃ±o calendario con goce Ã­ntegro de haberes.\r\n                       f.4) Para el otorgamiento de estas Licencias, el Agente deberÃ¡ expresar con carÃ¡cter de DeclaraciÃ³n Jurada, la constituciÃ³n de su grupo familiar, al tomar posesiÃ³n del cargo, debiendo hacer saber las modificaciones que se produjeren. Se concederÃ¡ Licencia al Docente, cuando la solicitud se realice para la atenciÃ³n del cÃ³nyuge o cÃ³nyuge aparente, y de los padres, hermanos o hijos, convivan o no con Ã©l, siempre que no haya otro familiar que pueda atenderlo.\r\nEsta Licencia serÃ¡ certificada por la DirecciÃ³n de Reconocimientos MÃ©dicos, y/o sus Delegaciones Regionales y/o Delegaciones de la DirecciÃ³n General de Escuelas y Cultura.\r\nEn caso de producirse dos (2) inasistencias consecutivas por esa causal, se computarÃ¡ el perÃ­odo de dÃ­as hÃ¡biles e inhÃ¡biles que medie entre ambas.'),
(11, '114', 'G', 1, 'g)      Por DonaciÃ³n de Sangre:\r\n                             g.1) Personal Titular, Provisional o Suplente: se concederÃ¡ al Agente Licencia con goce Ã­ntegro de haberes por DonaciÃ³n de Sangre, el dÃ­a de la extracciÃ³n. La justificaciÃ³n de esta inasistencia se realizarÃ¡ con la presentaciÃ³n del Certificado expedido por Autoridad Competente.'),
(12, '114', 'H', 0, 'h)      Por Razones de Profilaxis:\r\n                             h.1) Personal Titular, Provisional y Suplente: La presunciÃ³n de una enfermedad que por su naturaleza haga procedente el alejamiento del Agente por razones de profilaxis o de seguridad en beneficio propio, de los alumnos, o de las personas con las que comparte sus tareas, facultarÃ¡ a la Autoridad Escolar correspondiente, a disponer el inmediato alejamiento del medio en que desempeÃ±a sus funciones, con percepciÃ³n de haberes.\r\nEl Agente serÃ¡ de inmediato sometido al examen mÃ©dico y si el dictamen asÃ­ lo aconsejare, le serÃ¡ impuesta la Licencia que encuadre en esta ReglamentaciÃ³n.\r\nEn caso contrario, serÃ¡ reintegrado de inmediato a sus funciones, no computÃ¡ndosele inasistencias.'),
(13, '114', 'I.1', 1095, '                             i.1) Unidad familiar:\r\ni.1.1) Personal Titular y Provisional, este Ãºltimo mientras dure su situaciÃ³n de revista como tal: Se le otorgarÃ¡ Licencia por razones de unidad familiar, sin goce de haberes por un perÃ­odo de hasta tres (3) aÃ±os, renovable anualmente, en circunstancias debidamente justificadas, cuando por motivos laborales, algunos de los miembros del nÃºcleo familiar, deba trasladarse a otro Distrito de la Provincia de Buenos Aires, a  la Capital Federal, a la AntÃ¡rtida e Islas del AtlÃ¡ntico Sur, a otras Provincias o al extranjero. EntiÃ©ndese por nÃºcleo familiar el constituido por cÃ³nyuge y/o conviviente, padres e hijos que convivan habitualmente en hogar comÃºn.\r\nEn el caso de que con la JurisdicciÃ³n a la que se traslade el Personal, exista Convenio Interjurisdiccional, no podrÃ¡ solicitarse la presente Licencia, otorgÃ¡ndose el pase correspondiente.\r\ni.1.2) Cuando el motivo del traslado del Personal Docente sea el cumplimiento por parte del miembro del nÃºcleo familiar, de una MisiÃ³n Oficial, del Estado Nacional, Provincial o Municipal, el perÃ­odo de la Licencia no tendrÃ¡ lÃ­mites.\r\ni.1.3) Personal Suplente: no gozarÃ¡ de este beneficio.'),
(14, '114', 'I.2', 730, 'i.2) Familiar a Cargo:\r\ni.2.1) Personal Titular y Provisional, este Ãºltimo mientras dure su situaciÃ³n de revista como tal: Cuando el Docente tenga a su cargo al cÃ³nyuge, cÃ³nyuge aparente o a parientes directos, que sufran enfermedad que provoquen disminuciÃ³n o impedimento fÃ­sico y/o psÃ­quico que limite o anule su capacidad para obrar por si mismo, constituyendo el Docente su Ãºnica compaÃ±Ã­a, y pudiendo este probar que por dicha situaciÃ³n no puede prestar sus servicios, se otorgarÃ¡ Licencia por cuidado de Familiar a Cargo, sin goce de haberes, hasta un mÃ¡ximo de dos (2) aÃ±os en toda la carrera docente. Dicha situaciÃ³n deberÃ¡ ser constatada por Asistente Social, quien ademÃ¡s verificarÃ¡ la situaciÃ³n econÃ³mica del grupo familiar.\r\nEn casos en que las circunstancias lo aconsejen, podrÃ¡ excepcionalmente concederse esta Licencia, con goce de haberes por el mÃ¡ximo de un (1) aÃ±o.\r\nCuando la Licencia se otorgara con sueldo y por un lapso superior a dos (2) meses, el Asistente Social deberÃ¡ verificar mensualmente el mantenimiento de la causal, que origina la Licencia.\r\nLa SubsecretarÃ­a de EducaciÃ³n, sobre la base de este informe aconsejarÃ¡ el otorgamiento de la Licencia. En dicho dictamen, se expedirÃ¡ en los casos en que se planteen, acerca de la posibilidad de la concesiÃ³n de la misma en las condiciones de excepciÃ³n previstas.\r\ni.2.2) Personal Suplente: no gozarÃ¡ de este beneficio.\r\n'),
(15, '114', 'J.2', 5, 'j.2) Personal Provisional y Suplente: gozarÃ¡ de la Licencia en las mismas condiciones que el Personal Titular.'),
(16, '114', 'J.1', 5, 'j.1) Personal Titular: Se concederÃ¡ Licencia con goce de haberes, a partir de la fecha de fallecimiento o del sepelio a criterio del Agente.\r\nj.1.1) Madre, Padre, CÃ³nyuge o Conviviente en aparente Matrimonio, Hijo, Hermano, Nieto: cinco (5) dÃ­as corridos.\r\nj.1.2) Abuelo, Padrastro, Madrastra, Hijastra, Padres, Hermanos e Hijos PolÃ­ticos, Bisabuelos y Primos-Hermanos: tres (3) dÃ­as corridos.\r\nEsta Licencia serÃ¡ ampliada en dos (2) dÃ­as corridos mÃ¡s cuando a raÃ­z del duelo que afecte al Agente, Ã©ste deba trasladarse a un lugar distante, a mas de doscientos (200) kilÃ³metros de su lugar de residencia habitual.\r\nLa justificaciÃ³n de la Licencia se realizarÃ¡ con la presentaciÃ³n del Certificado de DefunciÃ³n o Aviso FÃºnebre.\r\n                                    '),
(17, '114', 'K', 0, 'k)Por Examen MÃ©dico por incorporaciÃ³n al Servicio Militar Obligatorio:\r\n                             k.1) Personal Titular, Provisional y Suplente: Estos dos Ãºltimos mientras dure su situaciÃ³n de revista como tales: Se concederÃ¡ esta Licencia con goce Ã­ntegro de haberes por el tiempo que sea necesario. La justificaciÃ³n de las inasistencias se realizarÃ¡ con la presentaciÃ³n del certificado mÃ©dico de las F.F.A.A., el que deberÃ¡ especificar el lapso que requiriÃ³ el examen.'),
(18, '114', 'L', 0, 'l)        Por Servicio Militar Obligatorio o incorporaciÃ³n a la reserva de las F.F.A.A.:\r\n                             l.1) Personal Titular, Provisional y Suplente: Estos dos Ãºltimos, mientras dure su situaciÃ³n de revista como tales: Se acordarÃ¡ esta Licencia por el tÃ©rmino que dure su convocatoria, con goce del cincuenta por ciento (50%) de los haberes.\r\nEl Agente deberÃ¡ presentar el certificado de la Autoridad Militar correspondiente.\r\n                             l.2) Por incorporaciÃ³n a la reserva de las F.F.A.A.\r\nl.2.1) Personal Titular, Provisional o Suplente: Estos dos Ãºltimos mientras dure su situaciÃ³n de revista como tales: Cuando el Agente no perciba haberes, con goce Ã­ntegro de haberes; cuando el Agente perciba una suma inferior a la que le corresponde: la diferencia hasta alcanzar ese monto; cuando la suma que perciba el Agente sea superior a la que le corresponde, sin goce de haberes.\r\n                             l.3) Producida la baja, el Agente deberÃ¡ reanudar sus tareas dentro de los treinta (30) dÃ­as corridos. Esta circunstancia serÃ¡ probada mediante la presentaciÃ³n del DNI ante la autoridad escolar correspondiente, la que efectuarÃ¡ la respectiva comunicaciÃ³n a la DirecciÃ³n General de Escuelas y Cultura, a los efectos pertinentes. Si la baja tuviere lugar en perÃ­odos de vacaciones, el acto de toma de posesiÃ³n se realizarÃ¡ ante las Autoridades del Consejo Escolar del Distrito en que se desempeÃ±a.'),
(19, '114', 'LL.1.1', 15, 'll) Por Pre-Examen y Examen:\r\n                             ll.1) Personal Titular y Provisional: Este Ãºltimo mientras dure su situaciÃ³n de revista como tal:\r\nll.1.1) Cuando se cursen carreras universitarias o terciarias, de grado o de post-grado, o se realicen cursos en los Institutos Superiores de FormaciÃ³n Docente, se concederÃ¡n hasta un total de doce (12) dÃ­as hÃ¡biles por aÃ±o calendario para la preparaciÃ³n de exÃ¡menes. No podrÃ¡n ser utilizados en bloques de mÃ¡s de tres (3) dÃ­as por examen, y deberÃ¡n ser acordados en los dÃ­as inmediatos anteriores a la fecha fijada para los mismos.\r\nAdemÃ¡s se concederÃ¡ un (1) dÃ­a de Licencia por cada dÃ­a de examen, la que serÃ¡ prorrogada automÃ¡ticamente cuando la mesa examinadora no se reÃºna o postergue su cometido.\r\nll.1.2) Cuando se trate de enseÃ±anza secundaria o especializada no comprendida en el punto anterior, hasta un total de seis (6) dÃ­as hÃ¡biles por aÃ±o calendario, en los dÃ­as inmediatos anteriores, incluido el dÃ­a del examen.\r\nll.1.3) Cuando se trate de prÃ¡cticas docentes obligatorias previstas en los planes de estudios de las Universidades, Institutos Superiores de FormaciÃ³n Docente dependientes de la DirecciÃ³n General de Escuelas y Cultura, de establecimientos nacionales y privados reconocidos por la DirecciÃ³n General de Escuelas y Cultura, por todo el perÃ­odo que duren las mismas, siempre que medie superposiciÃ³n horaria en el desempeÃ±o en el cargo y/u horas cÃ¡tedras en que se solicitara la Licencia. El Superior JerÃ¡rquico deberÃ¡ controlar la existencia de la superposiciÃ³n horaria.\r\nll.1.4) En caso de intervenciÃ³n en los Concursos que prescribe el Estatuto del Docente, hasta un total de cinco (5) dÃ­as hÃ¡biles por aÃ±o calendario para capacitaciÃ³n previa. En caso que el Docente no se presentara a todas las pruebas, las inasistencias en que incurriere serÃ¡n consideradas injustificadas. El Director del Servicio deberÃ¡ requerir la presentaciÃ³n del certificado correspondiente.\r\nAsimismo gozarÃ¡ de Licencia el dÃ­a de cada una de las pruebas.\r\nll.1.5) Cuando se realicen cursos en los Institutos Superiores de FormaciÃ³n Docente dependientes de la DirecciÃ³n General de Escuelas y Cultura, bajo la modalidad ?no residentes?, se otorgarÃ¡ una Licencia hasta un total de quince (15) dÃ­as hÃ¡biles por aÃ±o calendario. Este beneficio serÃ¡ acordado en perÃ­odos de hasta cinco (5) dÃ­as hÃ¡biles por mes y no mÃ¡s de tres (3) veces en el aÃ±o calendario.\r\n                             ll.2) Personal Suplente: Se le acordarÃ¡ el dÃ­a de el examen en los supuestos de los casos ll.1.1) y ll.1.2), y el dÃ­a de las pruebas de oposiciÃ³n en el supuesto del caso ll.1.4), cuando su desempeÃ±o en el ciclo lectivo no sea menor de tres (3) meses.\r\nEn el supuesto del inciso ll.1.3), en iguales condiciones que el Personal Titular y Provisional, siempre que su desempeÃ±o en el ciclo lectivo no sea menor de tres (3) meses.\r\n                             ll.3) La justificaciÃ³n de las inasistencias por el inciso ll), se realizarÃ¡ con la presentaciÃ³n del certificado extendido por la autoridad competente, dentro de los quince (15) dÃ­as posteriores al mismo. Cuando razones justificadas no permitan al Agente rendir examen, y haga hecho uso de la Licencia por pre-examen, esta quedarÃ¡ pendiente de justificaciÃ³n por un plazo de hasta ciento ochenta (180) dÃ­as corridos, y si en dicho perÃ­odo no acredita haber rendido examen que justifique la Licencia utilizada, se dispondrÃ¡ el descuento de sus haberes, como si se tratara de inasistencias injustificadas. Para hacerse acreedor de este beneficio, el Agente deberÃ¡ comunicar tal circunstancia, por nota, al Director del Servicio, quien lo elevarÃ¡ al Consejo Escolar, con las certificaciones que correspondieren.'),
(20, '114', 'M.1', 1, 'm)    Por CitaciÃ³n de Autoridad competente:\r\n                             m.1) Personal Titular, Provisional y Suplente: Estos Ãºltimos mientras dure su situaciÃ³n de revista como tal:\r\nm.1.1) En caso que la Autoridad competente de la DirecciÃ³n General de Escuelas y  Cultura, cite al Agente por asuntos de cualquier naturaleza que lo obliguen a alejarse de su funciÃ³n, se le otorgarÃ¡ Licencia especial con goce Ã­ntegro de haberes por el tiempo que sea necesario, teniendo en cuenta la distancia que medie entre el lugar de prestaciÃ³n de servicios y el fijado para su comparencia.'),
(21, '114', 'M.1.1', 0, 'Licencia por citacion gremial a comision de Mad o POF, por el tiempo que indique la licencia con goce integro de haberes.'),
(22, '114', 'M.1.2', 1, 'm.1.2) Por citaciÃ³n de Autoridad Judicial o Administrativa, se le justificarÃ¡n las inasistencias con goce Ã­ntegro de haberes, cuando coincidan con el horario de labor, teniÃ©ndose en cuenta la distancia que medie entre el lugar de prestaciÃ³n de servicios y el fijado para su comparecencia.'),
(23, '114', 'A.3', 40, 'n)      Por Vacaciones:\r\n                             n.1) La Licencia anual obligatoria o vacaciones, serÃ¡ remunerada y no acumulable ni compensable por falta de uso. A sus efectos el cÃ³mputo de la antigÃ¼edad del Agente, se realizarÃ¡ teniendo en cuenta, lo establecido en el artÃ­culo 34 del Estatuto del Docente.\r\n                             n.2) El Personal Docente gozarÃ¡ del siguiente rÃ©gimen de vacaciones: Personal con veinte (20) o mÃ¡s aÃ±os de antigÃ¼edad: cuarenta (40) dÃ­as corridos.\r\nPersonal con menos de veinte (20) aÃ±os de antigÃ¼edad: treinta (30) dÃ­as corridos.\r\n                             n.3) Los lapsos comprendidos entre el dÃ­a de finalizaciÃ³n del ciclo lectivo en cada servicio, y, el de iniciaciÃ³n de las correspondientes al siguiente, y el perÃ­odo de vacaciones escolares en la Ã©poca invernal, se denominarÃ¡n para el personal docente ?perÃ­odo de receso de la actividad escolar?.\r\n                             n.4) El personal de base de los distintos servicios educativos exceptuado el que se desempeÃ±e en aquellos servicios con continuidad en la prestaciÃ³n efectiva durante el perÃ­odo de receso y vacaciones, gozarÃ¡ de la Licencia anual obligatoria desde el 2 al 31 de enero de cada aÃ±o, o desde el 2 de enero al 10 de febrero de cada aÃ±o, de acuerdo con lo establecido en el inciso n.2).\r\nDurante el resto del perÃ­odo de receso de la actividad escolar, el personal de base podrÃ¡ ser convocado de acuerdo a las necesidades del servicio educativo.\r\n                             n.5) El Personal JerÃ¡rquico de los servicios mencionados en el inciso anterior, gozarÃ¡ de su Licencia anual obligatoria durante el perÃ­odo comprendido entre el 2 y el 31 de enero de cada aÃ±o. El personal con veinte (20) o mÃ¡s aÃ±os de antigÃ¼edad, podrÃ¡ completar por turnos los cuarenta (40) dÃ­as, durante el resto del perÃ­odo del receso escolar. Todo el Personal deberÃ¡ estar en funciones al comenzar las tareas de cada ciclo lectivo.\r\nEn caso de necesidades del servicio educativo, durante el mes de enero, el personal jerÃ¡rquico deberÃ¡ atender las mismas, disponiÃ©ndose por el Director o responsable del servicio, los turnos correspondientes para completar los perÃ­odos de Licencia durante el resto del perÃ­odo del receso escolar.\r\n                             n.6) El Personal Docente no comprendido en los incisos n.4) y n.5), deberÃ¡ usufructuar su Licencia anual obligatoria, total o parcialmente, durante el perÃ­odo de receso escolar de verano.\r\nEn caso de fraccionarse la misma, el resto del perÃ­odo, que no podrÃ¡ exceder de diez (10) dÃ­as corridos, se concederÃ¡ de conformidad con el Superior JerÃ¡rquico, cuidando de no entorpecer la normal prestaciÃ³n del servicio educativo, ni las tareas del organismo en el que el Agente preste servicios.\r\n                             n.7) Para aquellos docentes, cualquiera sea su situaciÃ³n de revista, cuya actividad fuera mayor de tres (3) meses y menor de doce (12) meses, la determinaciÃ³n de los haberes por el perÃ­odo de vacaciones se efectuarÃ¡ de conformidad con la siguiente escala, considerÃ¡ndose en el cÃ³mputo total de la actividad, como mes completo, la fracciÃ³n de quince (15) o mÃ¡s dÃ­as, y desestimÃ¡ndose si fuera menor:\r\n \r\nPersonal hasta 19 AÃ±os de AntigÃ¼edad:\r\nActividad al 31 de Diciembre                                      CompensaciÃ³n\r\n  3 meses                                                                                              6 dÃ­as\r\n  4 meses                                                                                              9 dÃ­as\r\n  5 meses                                                                                            12 dÃ­as\r\n  6 meses                                                                                            15 dÃ­as\r\n  7 meses                                                                                            18 dÃ­as\r\n  8 meses                                                                                            21 dÃ­as\r\n  9 meses                                                                                            24 dÃ­as\r\n10 meses                                                                                            27 dÃ­as\r\n11 meses                                                                                            30 dÃ­as\r\n \r\nPersonal con 20 o mÃ¡s AÃ±os de AntigÃ¼edad:\r\nActividad al 31 de Diciembre                                      CompensaciÃ³n\r\n  3 meses                                                                                              8 dÃ­as\r\n  4 meses                                                                                            12 dÃ­as\r\n  5 meses                                                                                            16 dÃ­as\r\n  6 meses                                                                                            20 dÃ­as\r\n  7 meses                                                                                            24 dÃ­as\r\n  8 meses                                                                                            28 dÃ­as\r\n  9 meses                                                                                            32 dÃ­as\r\n10 meses                                                                                            36 dÃ­as\r\n11 meses                                                                                            40 dÃ­as\r\n \r\nLos expuesto en el presente inciso, es sin perjuicio de lo previsto en el artÃ­culo 113 del Reglamento en referencia a la liquidaciÃ³n del perÃ­odo de vacaciones y receso para el Personal Provisional y Suplente que hubiere cesado antes de la finalizaciÃ³n del ciclo escolar.'),
(24, '114', 'Ã‘', 180, ' Ã±) Por DonaciÃ³n de Ã“rganos o Piel:\r\nPersonal Titular, Provisional o Suplente: Estos dos Ãºltimos mientras dure su situaciÃ³n de revista como tales:\r\n                             Ã±.1) Se les concederÃ¡ de dos (2) a ciento ochenta (180) dÃ­a corridos, con goce Ã­ntegro de haberes, segÃºn lo prescripto por la Junta MÃ©dica interviniente.\r\n                             Ã±.2) Para el uso de esta Licencia el Agente deberÃ¡ adjuntar a la solicitud:\r\nÃ±.2.1) Por DonaciÃ³n de Piel: La certificaciÃ³n mÃ©dica donde se indique la necesidad del acto.\r\nÃ±.2.2) Por DonaciÃ³n de Ã“rganos: La certificaciÃ³n de la Autoridad Nacional, Provincial o Internacional respectiva.\r\n '),
(25, '114', 'O.1', 0, 'o)      Por Causas Particulares:\r\n                             o.1) Personal Titular y Provisional: El Docente tendrÃ¡ derecho a una Licencia sin sueldo, cuya duraciÃ³n no podrÃ¡ exceder de veinticuatro (24) meses, que se graduarÃ¡ segÃºn la antigÃ¼edad total, conforme a lo establecido en el artÃ­culo 34 del Estatuto del Docente; de acuerdo con la siguiente escala:\r\n \r\nAÃ±os de antigÃ¼edad cumplidos                                                Hasta\r\n5                                                                                                        6 meses\r\n10                                                                                                      12 meses\r\n15                                                                                                      18 meses\r\n20                                                                                                      24 meses\r\n                            \r\n                             o.2) El Personal Suplente no gozarÃ¡ de este beneficio.\r\n                             o.3) La Licencia prevista en el inciso o.1) no podrÃ¡ fraccionarse para su uso.\r\nPodrÃ¡ ser solicitada parcialmente o en la totalidad de cargos u horas cÃ¡tedra.\r\nSÃ³lo podrÃ¡ ser utilizada una vez en la carrera docente.\r\nEsta Licencia incidirÃ¡ proporcionalmente en la percepciÃ³n de los haberes de las vacaciones.\r\nCuando el Agente hubiere faltado al desempeÃ±o de sus funciones hasta finalizar el ciclo escolar, por esta causal, y continuÃ© inasistiendo por la misma al iniciarse el inmediato posterior, la Licencia se considerarÃ¡ interrumpida a los efectos de los tÃ©rminos y sueldos que determine esta ReglamentaciÃ³n.'),
(26, '114', 'O.4', 1, ' o.4) Por Motivos de Ãndole Particular: Personal Titular y Provisional, gozarÃ¡n de un (1) dÃ­a de Licencia por mes calendario y hasta un mÃ¡ximo de seis (6) por aÃ±o, sin goce de haberes.'),
(27, '114', 'P', 0, 'p)      Disposiciones Comunes:\r\n                             p.1) En el caso de las Licencias establecidas en los incisos a) con exclusiÃ³n de lo previsto en el sub-inciso a.3.2), b), c), f), g) y ll), el Personal Docente Provisional gozarÃ¡ de dichas Licencias, en las condiciones y con los lÃ­mites allÃ­ establecidos, hasta un mÃ¡ximo acumulado de treinta (30) dÃ­as corridos, continuos o alternados en el aÃ±o calendario, salvo que hayan alcanzado una antigÃ¼edad mÃ­nima de un (1) aÃ±o en la docencia, en cuyo caso no se aplicarÃ¡ dicho tope, estÃ¡ndose a lo previsto particularmente en cada inciso.\r\nEn el caso del Personal Docente Suplente, y con referencia a los incisos a.1), b), c), f), g), y ll), gozarÃ¡ de dichas Licencias en las condiciones y con los lÃ­mites allÃ­ establecidos, hasta un mÃ¡ximo acumulado de tres (3) dÃ­as hÃ¡biles por mes de servicio efectivamente prestado en el aÃ±o calendario, salvo que hayan alcanzado una antigÃ¼edad mÃ­nima de un (1) aÃ±o en la docencia, en cuyo caso gozarÃ¡ de las Licencias citadas en dichos incisos en las mismas condiciones que el personal titular.\r\n                             p.2) Todas las Licencias que el Agente hubiere usufructuado con anterioridad a esta ReglamentaciÃ³n, serÃ¡n computadas a los efectos de los tÃ©rminos establecidos.'),
(28, '114', 'A.1', 0, 'a)      Por Estudio o Perfeccionamiento Docente:\r\na.1) Cuando el Agente deba realizar estudios especiales o investigaciones que resulten de interÃ©s para la DirecciÃ³n General de Escuelas y Cultura, en el paÃ­s o en el extranjero, podrÃ¡ solicitar Licencia sin goce de haberes por el tÃ©rmino que duren los mismos.\r\nPrevio al dictamen del Consejo General de EducaciÃ³n  y Cultura, el pedido de Licencia podrÃ¡ ser concedido por el Director General de Escuelas y Cultura.\r\nPara que esta Licencia pueda ser acordada, el solicitante deberÃ¡ acreditar una antigÃ¼edad mÃ­nima de tres (3) aÃ±os en la docencia oficial de la Provincia de Buenos Aires.\r\nAl finalizar la Licencia, el Agente deberÃ¡ presentar un informe acerca de los estudios  e investigaciones realizadas.'),
(29, '115', 'A.2', 0, 'a)      Por Estudio o Perfeccionamiento Docente:\r\n                            \r\n                             a.2) Por interÃ©s particular, cuando el Agente concurra a Congresos, cursos, jornadas de perfeccionamiento docente, se le concederÃ¡ Licencia sin goce de haberes hasta seis (6) dÃ­as hÃ¡biles por aÃ±o. Para justificar la Licencia, deberÃ¡ presentar la constancia de asistencia.'),
(30, '115', 'B.1', 0, 'b)      Por RepresentaciÃ³n Gremial:\r\n                        b.1) La Licencia Gremial serÃ¡ concedida de acuerdo a lo que determinen las Leyes Nacionales vigentes.'),
(31, '115', 'B.2', 1, '  b.2) A los Docentes Delegados en el Establecimiento de Organizaciones Gremiales con PersonerÃ­a Gremial, se les otorgarÃ¡ un (1) dÃ­a de Licencia por mes calendario en el establecimiento en que presten servicios, con goce de haberes, para asistir a reuniones de carÃ¡cter gremial. A tal efecto, la OrganizaciÃ³n Gremial comunicarÃ¡ a la DirecciÃ³n del Establecimiento la nÃ³mina de los delegados.'),
(32, '115', 'B.3', 0, 'b.3) Cuando las Organizaciones Gremiales mencionadas en el pÃ¡rrafo anterior, convoquen a Asambleas y/o Congresos de carÃ¡cter ordinario o extraordinario, los delegados a esos organismos podrÃ¡n solicitar Licencia por los dÃ­as que dure el mismo, la que se concederÃ¡ en su caso, con goce de haberes.'),
(33, '115', 'B.4', 0, 'b.4) Las organizaciones mencionadas en el inciso anterior, deberÃ¡n presentar ante la DirecciÃ³n General de Escuelas y Cultura, la nÃ³mina completa de los miembros de la conducciÃ³n del Gremio y de los delegados docentes, una vez celebrados los Actos Eleccionarios respectivos, mediante documentaciÃ³n que acredite las designaciones, de acuerdo a las normas fijadas por la autoridad con competencia laboral. Asimismo, comunicarÃ¡ toda modificaciÃ³n que se produzca  en dicha nÃ³mina.\r\n '),
(34, '115', 'C', 0, ' c)Por Actividad de InterÃ©s PÃºblico o del Estado:\r\nSe concederÃ¡ Licencia cuando el Docente deba cumplir actividades culturales, acadÃ©micas o diplomÃ¡ticas, o realizar estudios, investigaciones, trabajos cientÃ­ficos, tÃ©cnicos o participar en conferencias o congresos en el paÃ­s o en el extranjero, declarados de interÃ©s pÃºblico o del Estado, o cuando concurra a los mismos investido de la representaciÃ³n oficial del Organismo.\r\nEsta Licencia podrÃ¡ ser concedida con o sin sueldo, de acuerdo a las particularidades del caso.\r\nAl efecto de la concesiÃ³n, dictaminarÃ¡ la Sub-SecretarÃ­a de EducaciÃ³n, la que se expedirÃ¡ sobre sÃ­ la actividad a realizar puede ser considerada de interÃ©s pÃºblico o del Estado.\r\nAl tÃ©rmino de las actividades y de la Licencia, el Agente deberÃ¡ presentar ante dicha Sub-SecretarÃ­a, un informe acerca delos trabajos realizados.'),
(35, '115', 'D.1', 0, 'd.1) Por DesempeÃ±o de Cargos de Mayor JerarquÃ­a.Se concederÃ¡ Licencia sin goce de haberes para desempeÃ±ar cargos de mayor jerarquÃ­a escalafonaria, en el sistema educativo de la Provincia de Buenos Aires o en otras jurisdicciones y mientras dure tal desempeÃ±o, siempre que las mismas no gocen de estabilidad.\r\nSe considerarÃ¡ Cargo de Mayor JerarquÃ­a en relaciÃ³n al que se desempeÃ±a, el correspondiente a un Ã­tem de superior grado jerÃ¡rquico en el mismo escalafÃ³n o en escalafones diferentes.\r\nEn caso de que se trate de cargos en otras jurisdicciones, serÃ¡ facultad de la DirecciÃ³n General de Escuelas y Cultura, interpretar y resolver en cada caso concreto a efectos de determinar si se trata de mayor jerarquÃ­a.'),
(36, '115', 'E.1', 0, 'e.1) Por el desempeÃ±o de cargos electivos, con excepciÃ³n del cargo de Consejero Escolar conforme a lo previsto por el artÃ­culo 10 de la Ley 10589, se concederÃ¡ Licencia sin goce de haberes por el tÃ©rmino del mandato.'),
(37, '115', 'E.2', 0, '  e.2) Se concederÃ¡ Licencia sin goce de haberes a quienes resulten electos para ocupar cargos de conducciÃ³n en los partidos polÃ­ticos reconocidos en jurisdicciÃ³n Nacional o Provincial.'),
(38, '115', 'E.3', 0, 'e.3) Se concederÃ¡ Licencia sin goce de haberes por el tÃ©rmino del desempeÃ±o y siempre que se trate de cargos sin estabilidad, cuya designaciÃ³n dependa de un funcionario polÃ­tico.'),
(39, '114', 'LL.1', 15, 'Dia de examen final'),
(40, '0', '', NULL, 'NO ASIGNADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencia_profe`
--

CREATE TABLE `licencia_profe` (
  `idinasistencia` int(11) NOT NULL,
  `dni` int(8) NOT NULL,
  `fecha_desde` varchar(10) NOT NULL DEFAULT '',
  `fecha_hasta` varchar(10) NOT NULL DEFAULT '',
  `articulo_encuadre` int(11) NOT NULL,
  `responsable` int(4) NOT NULL,
  `confirmada` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `licencia_profe`
--

INSERT INTO `licencia_profe` (`idinasistencia`, `dni`, `fecha_desde`, `fecha_hasta`, `articulo_encuadre`, `responsable`, `confirmada`) VALUES
(3, 23618812, '0000-00-00', '0000-00-00', 39, 24, 0),
(4, 23618812, '-1997', '0', 39, 24, 0),
(5, 23618812, '22-01-2018', '0', 39, 24, 0),
(6, 23618812, '30-01-2018', '0', 39, 24, 0),
(7, 23618812, '02-02-2018', '0', 39, 24, 0),
(8, 17917901, '01-01-2018', '0', 39, 24, 0),
(9, 25108642, '12-01-2018', '0', 39, 25, 0),
(10, 23618812, '31-01-2018', '0', 39, 24, 0),
(11, 23618812, '03-02-2018', '0', 39, 24, 0),
(12, 28054020, '23-02-2018', '0', 39, 24, 0),
(13, 24434152, '16-05-2018', '0', 39, 24, 0),
(14, 24434152, '16-05-2018', '0', 39, 24, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `idlocalidad` int(4) NOT NULL,
  `localidad` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`idlocalidad`, `localidad`) VALUES
(1, 'GLEW'),
(2, 'ADROGUE'),
(3, 'LONGCHAMPS\r\n                                              '),
(4, 'BURZACO'),
(5, 'CLAYPOLE'),
(6, 'TURDERA'),
(7, 'JOSE MARMOL'),
(8, 'RAFAEL CALZADA'),
(9, 'BANFIELD'),
(10, 'CAPITAL FEDERAL'),
(11, 'REMEDIOS DE ESCALADA'),
(12, 'PRESIDENTE PERON GUERNICA'),
(13, 'no registrada'),
(14, 'LOMAS DE ZAMORA'),
(15, 'SAN JOSE'),
(16, 'EL JAGÃœEL'),
(17, 'SAN VICENTE'),
(18, 'ALEJANDRO KORN'),
(19, 'CAPITAL FEDERAL'),
(20, 'LAVALLOL'),
(21, 'MINISTRO RIVADAVIA'),
(22, 'DON ORIONE'),
(23, 'TEMPERLEY'),
(24, 'FLORENCIO VARELA'),
(25, 'BRANDSEN'),
(26, 'GUERNICA'),
(27, 'DOMSELAAR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id_materia` int(3) NOT NULL,
  `cupof` int(12) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `materia_nombre` varchar(66) NOT NULL DEFAULT '',
  `materia_curso` int(3) NOT NULL,
  `materia_modulo` int(4) DEFAULT NULL,
  `materia_tipo` varchar(1) DEFAULT NULL,
  `materia_correlativa` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id_materia`, `cupof`, `sigla`, `materia_nombre`, `materia_curso`, `materia_modulo`, `materia_tipo`, `materia_correlativa`) VALUES
(189, 2178343, 'MATE', 'MATEMATICA 1', 16, 2, 'C', NULL),
(190, 563916, 'COMPU', 'COMPUTACION 1', 16, 2, 'C', NULL),
(191, 563905, 'DER', 'DERECHO', 16, 2, 'C', NULL),
(192, 563893, 'CONTA', 'CONTABILIDAD 1', 16, 2, 'C', NULL),
(193, 563963, 'SOOR', 'SOCIOLOGIA DE LA ORGANIZACION', 16, 1, 'C', NULL),
(194, 563967, 'PRIAD', 'PRINCIPIOS DE ADMINISTRACION', 16, 2, 'C', NULL),
(195, 563925, 'METIN', 'METODOLOGIA DE LA ADMINISTRACION', 16, 1, 'C', NULL),
(196, 563894, 'GESAC', 'GESTION ADMINISTRATIVO CONTABLE', 16, 2, 'C', NULL),
(197, 563902, 'EDI', '(edi)SISTEMAS DE ADMINISTRACION', 16, 2, 'C', NULL),
(198, 563919, 'MATE', 'MATEMATICA 2', 17, 1, 'C', NULL),
(199, 563920, 'ESTA', 'ESTADISTICA', 17, 1, 'C', NULL),
(200, 563972, 'IN', 'INGLES 1', 17, 2, 'C', NULL),
(201, 563951, 'COMPU', 'COMPUTACION 2', 17, 2, 'C', NULL),
(202, 563895, 'CONTA', 'CONTABILIDAD 2', 17, 2, 'C', NULL),
(203, 563954, 'MATEF', 'MATEMATICA FINANACIERA', 17, 2, 'C', NULL),
(204, 563921, 'DELA', 'DERECHO LABORAL', 17, 2, 'C', NULL),
(205, 563918, 'PRPRO', 'PRACTICA PROFESIONAL 1', 17, 2, 'C', NULL),
(206, 563906, 'DECO', 'DERECHO COMERCIAL', 17, 2, 'C', NULL),
(207, 563904, 'EDI', '(edi)COMERCIALIZACION DE BIENES Y SERVICIOS', 17, 3, 'C', NULL),
(208, NULL, NULL, 'INGLES 2', 18, 2, 'C', NULL),
(209, NULL, NULL, 'TECNICA IMPOSITIVA Y LABORAL', 18, 2, 'C', NULL),
(210, NULL, NULL, 'REGIMEN TRIBUTARIO', 18, 2, 'C', NULL),
(211, NULL, NULL, 'CONTABILIDAD 3', 18, 2, 'C', NULL),
(212, NULL, NULL, 'COSTOS Y PRESUPUESTOS', 18, 2, 'C', NULL),
(213, NULL, NULL, 'ADMINISTRACION FINANCIERA', 18, 2, 'C', NULL),
(214, NULL, NULL, 'ADMINISTRACION ESTRATEGICA', 18, 2, 'C', NULL),
(215, NULL, NULL, 'PRACTICA PROFESIONAL 2', 18, 2, 'C', NULL),
(216, NULL, NULL, '(edi)RELACIONES HUMANAS Y TECNICAS DE SUPERVISION', 18, 3, 'C', NULL),
(217, NULL, NULL, 'ALGEBRA', 19, 2, 'C', NULL),
(218, NULL, NULL, 'ANALISIS MATEMATICO 1', 19, 2, 'C', NULL),
(219, NULL, NULL, 'INGLES TECNICO 1', 19, 2, 'C', NULL),
(220, NULL, NULL, 'ADMINISTRCION DE LAS ORGANIZACIONES', 19, 2, 'C', NULL),
(221, NULL, NULL, 'METODOLOGIA DE LA INVESTIGACION', 19, 2, 'C', NULL),
(222, NULL, NULL, 'PROGRAMACION 1', 19, 4, 'C', NULL),
(223, NULL, NULL, 'SISTEMAS DE COMPUTACION', 19, 4, 'C', NULL),
(224, NULL, NULL, '(edi)ALGORITMOS', 19, 2, 'C', NULL),
(225, NULL, NULL, 'PROBABILIDAD Y ESTADISTICA', 20, 2, 'C', NULL),
(226, NULL, NULL, 'ANALISIS MATEMATICO 2', 20, 2, 'C', NULL),
(227, NULL, NULL, 'INGLES TECNICO 2', 20, 2, 'C', NULL),
(228, NULL, NULL, 'ANALISIS DE SISTEMAS', 20, 3, 'C', NULL),
(229, NULL, NULL, 'PROGRAMACION ORIENTADA A OBJETOS', 20, 4, 'C', NULL),
(230, NULL, NULL, 'SEMINARIO DE PROGRAMACION', 20, 2, 'L', NULL),
(231, NULL, NULL, 'SISTEMAS OPERATIVOS', 20, 2, 'C', NULL),
(232, NULL, NULL, 'BASE DE DATOS', 20, 2, 'C', NULL),
(233, NULL, NULL, '(edi)METODOLOGIA DEL SOFTWARE APLICADO A LOS SIST DE INFORMACION', 20, 1, 'C', NULL),
(234, NULL, NULL, 'INVESTIGACION OPERATIVA', 21, 2, 'C', NULL),
(235, NULL, NULL, 'ECONOMIA EMPRESARIAL', 21, 2, 'C', NULL),
(236, NULL, NULL, 'TELEINFORMATICA', 21, 2, 'C', NULL),
(237, NULL, NULL, 'PRACTICA PROFESIONAL', 21, 4, 'L', NULL),
(238, NULL, NULL, 'DISENIO E IMPLEMENTACION DE SISTEMAS', 21, 2, 'C', NULL),
(239, NULL, NULL, 'GESTION DE BASES DE DATOS', 21, 2, 'C', NULL),
(240, NULL, NULL, '(edi)PROGRAMACION DE SITIOS WEB', 21, 2, 'C', NULL),
(241, NULL, NULL, 'ESTADO Y SOCIEDAD', 22, 2, 'C', NULL),
(242, NULL, NULL, 'MATEMATICA FINANCIERA', 22, 2, 'C', NULL),
(243, NULL, NULL, 'ECONOMIA', 22, 2, 'C', NULL),
(244, NULL, NULL, 'PRODUCCION ORAL Y ESCRITA', 22, 2, 'C', NULL),
(245, NULL, NULL, 'INFORMATICA', 22, 2, 'C', NULL),
(246, NULL, NULL, 'METODOLOGIA DE LA INVESTIGACION', 22, 2, 'C', NULL),
(247, NULL, NULL, 'DERECHO Y DERECHO CONSTITUCIONAL', 22, 2, 'C', NULL),
(248, NULL, NULL, 'CONTABILIDAD PUBLICA', 22, 2, 'C', NULL),
(249, NULL, NULL, 'PRINCIPIOS DE LA ADMINISTRACION', 22, 2, 'C', NULL),
(250, NULL, NULL, '(edi)DISEÃ‘O Y GESTION DE PROYECTOS', 22, 1, 'C', NULL),
(251, NULL, NULL, 'ESTADISTICA', 23, 2, 'C', NULL),
(252, NULL, NULL, 'TICS EN LA GESTION PUBLICA', 23, 2, 'C', NULL),
(253, NULL, NULL, 'INGLES', 23, 2, 'C', NULL),
(254, NULL, NULL, 'COMUNICACION', 23, 2, 'C', NULL),
(255, NULL, NULL, 'PROCESOS POLITICOS ECONOMICOS', 23, 2, 'C', NULL),
(256, NULL, NULL, 'DERECHO LABORAL Y RELACIONES LABORALES', 23, 2, 'C', NULL),
(257, NULL, NULL, 'DERECHO PUBLICO', 23, 2, 'C', NULL),
(258, NULL, NULL, 'POLITICAS PUBLICAS Y DESARROLLO LOCAL', 23, 2, 'C', NULL),
(259, NULL, NULL, 'ADMINISTRACION PUBLICA', 23, 2, 'C', NULL),
(260, NULL, NULL, '(edi) CULTURA', 23, 1, 'C', NULL),
(261, NULL, NULL, 'FINANZAS PUBLICAS', 24, 2, 'C', NULL),
(262, NULL, NULL, 'DERECHO ADMINISTRATIVO', 24, 2, 'C', NULL),
(263, NULL, NULL, 'DESARROLLO LOCAL Y PLANIFICACION ESTRATEGICA', 24, 2, 'C', NULL),
(264, NULL, NULL, 'EVALUACION DE PROYECTOS DE INVERSION', 24, 2, 'C', NULL),
(265, NULL, NULL, 'ADMINISTRACION ECONOMICA FINANCIERA', 24, 2, 'C', NULL),
(266, NULL, NULL, 'RECURSOS HUMANOS', 24, 2, 'C', NULL),
(267, NULL, NULL, 'PRACTICA PROFESIONAL', 24, 4, 'C', NULL),
(268, NULL, NULL, '(edi)PROYECTO COMUNICACIONAL', 24, 2, 'C', NULL),
(269, NULL, NULL, 'MATEMATICA 1', 25, 2, 'C', NULL),
(270, NULL, NULL, 'COMPUTACION 1', 25, 2, 'C', NULL),
(271, NULL, NULL, 'DERECHO', 25, 2, 'C', NULL),
(272, NULL, NULL, 'ECONOMIA', 25, 2, 'C', NULL),
(273, NULL, NULL, 'CONTABILIDAD', 25, 2, 'C', NULL),
(274, NULL, NULL, 'SOCIOLOGIA DE LA ORGANIZACION', 25, 1, 'C', NULL),
(275, NULL, NULL, 'PRINCIPIOS DE LA ADMINISTRACION', 25, 2, 'C', NULL),
(276, NULL, NULL, 'METODOLOGIA DE LA INVESTIGACION', 25, 1, 'C', NULL),
(277, NULL, NULL, 'MARKETING', 25, 2, 'C', NULL),
(278, NULL, NULL, '(edi) MARKETING INSTITUCIONAL', 25, 2, 'C', NULL),
(279, NULL, NULL, 'MATEMATICA 2', 26, 1, 'C', NULL),
(280, NULL, NULL, 'ESTADISTICA', 26, 1, 'C', NULL),
(281, NULL, NULL, 'INGLES 1', 26, 2, 'C', NULL),
(282, NULL, NULL, 'COMPUTACION 2', 26, 2, 'C', NULL),
(283, NULL, NULL, 'CANALES DE DISTRIBUCION', 26, 1, 'C', NULL),
(284, NULL, NULL, 'FUNDAMENTOS DE PSICOLOGIA Y COMPORTAMIENTO DEL COMSUMIDOR', 26, 2, 'C', NULL),
(285, NULL, NULL, 'DERECHO COMERCIAL', 26, 2, 'C', NULL),
(286, NULL, NULL, 'PUBLICIDAD', 26, 1, 'C', NULL),
(287, NULL, NULL, 'PRACTICA PROFESIONAL 1', 26, 2, 'C', NULL),
(288, NULL, NULL, '(edi) TALLER RETAIL MARKETING', 26, 2, 'C', NULL),
(289, NULL, NULL, 'INGLES 2', 27, 2, 'C', NULL),
(290, NULL, NULL, 'COSTOS Y PRESUPUESTOS', 27, 2, 'C', NULL),
(291, NULL, NULL, 'ADMINISTRACION ESTRATEGICA', 27, 2, 'C', NULL),
(292, NULL, NULL, 'POLITICA Y DESARROLLO DE PRODUCTOS', 27, 2, 'C', NULL),
(293, NULL, NULL, 'COMERCIO INTERNACIONAL', 27, 2, 'C', NULL),
(294, NULL, NULL, 'POLITICA DE PRECIOS', 27, 1, 'C', NULL),
(295, NULL, NULL, 'INVESTIGACION DE MERCADO', 27, 2, 'C', NULL),
(296, NULL, NULL, 'PRACTICA PROFESIONAL 2', 27, 2, 'C', NULL),
(297, NULL, NULL, '(edi) DIRECCION DE VENTAS', 27, 2, 'C', NULL),
(298, NULL, NULL, '(edi) PROCESOS COMUNICACIONALES', 27, 2, 'C', NULL),
(299, NULL, NULL, 'INGLES 1', 28, 2, 'C', NULL),
(300, NULL, NULL, 'PSICOLOGIA SOCIAL', 28, 1, 'C', NULL),
(301, NULL, NULL, 'METODOLOGIA DE LA INVESTIGACION', 28, 1, 'C', NULL),
(302, NULL, NULL, 'INTRODUCCION AL TURISMO', 28, 2, 'C', NULL),
(303, NULL, NULL, 'SERVICIOS TURISTICOS', 28, 1, 'C', NULL),
(304, NULL, NULL, 'HISTORIA ARGENTINA', 28, 2, 'C', NULL),
(305, NULL, NULL, 'HISTORIA DEL ARTE UNIVERSAL', 28, 2, 'C', NULL),
(306, NULL, NULL, 'ESTUDIO DEL ESPACIO TURISTICO DE ARGENTINA Y AMERICA', 28, 2, 'C', NULL),
(307, NULL, NULL, 'PATRIMONIO TURISTICO DE ARGENTINA Y AMERICA', 28, 2, 'C', NULL),
(308, NULL, NULL, 'PRACTICA PROFESIONAL 1', 28, 2, 'C', NULL),
(309, NULL, NULL, '(edi) TURISMO Y DESARROLLO LOCAL', 28, 1, 'C', NULL),
(310, NULL, NULL, 'INGLES 2', 29, 2, 'C', NULL),
(311, NULL, NULL, 'PROGRAMACION DE CIRCUITOS TURISTICOS', 29, 3, 'C', NULL),
(312, NULL, NULL, 'HISTORIA DE LAS CULTURAS', 29, 2, 'C', NULL),
(313, NULL, NULL, 'ESTUDIO DEL ESPACIO TURISTICO DE EUROPA, AFRICA, ASIA Y OCEANIA', 29, 2, 'C', NULL),
(314, NULL, NULL, 'PATRIMONIO TURISTICO DE EUROPA, AFRICA ASIA Y OCEANIA', 29, 2, 'C', NULL),
(315, NULL, NULL, 'RECREACION Y ANIMACION SOCIO CULTURAL', 29, 1, 'C', NULL),
(316, NULL, NULL, 'PRACTICA PROFESIONAL 2', 29, 2, 'C', NULL),
(317, NULL, NULL, '(edi) HERRAMIENTAS PARA LA PRACTICA PROFESIONAL', 29, 2, 'C', NULL),
(318, NULL, NULL, 'INGLES 3', 30, 2, 'C', NULL),
(319, NULL, NULL, 'CONSERVACION DEL MEDIO AMBIENTE', 30, 1, 'C', NULL),
(320, NULL, NULL, 'LEGISLACION', 30, 2, 'C', NULL),
(321, NULL, NULL, 'HISTORIA DEL ARTE ARGENTINO Y LATINOAMERICANO', 30, 2, 'C', NULL),
(322, NULL, NULL, 'FOLKLORE', 30, 1, 'C', NULL),
(323, NULL, NULL, 'INFORMATICA', 30, 1, 'C', NULL),
(324, NULL, NULL, 'PRACTICA PROFESIONAL 3', 30, 3, 'C', NULL),
(325, NULL, NULL, '(edi) RECURSOS RECREATIVOS', 30, 2, 'C', NULL),
(326, NULL, NULL, '', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mat_pro`
--

CREATE TABLE `mat_pro` (
  `id_matpro` int(4) NOT NULL,
  `materia` int(3) NOT NULL,
  `profesor` int(8) NOT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `curso_lectivo_id` int(3) NOT NULL,
  `cupof` int(10) DEFAULT NULL,
  `reemplazo` int(8) DEFAULT NULL,
  `activo` int(1) DEFAULT NULL,
  `idcarga` int(4) DEFAULT NULL,
  `grupo` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mat_pro`
--

INSERT INTO `mat_pro` (`id_matpro`, `materia`, `profesor`, `tipo`, `curso_lectivo_id`, `cupof`, `reemplazo`, `activo`, `idcarga`, `grupo`) VALUES
(52, 236, 13702023, NULL, 6, 0, 0, 0, 2, 1),
(53, 236, 17917901, NULL, 6, 0, 13702023, 1, 2, 1),
(60, 191, 26392509, NULL, 1, 0, 0, 1, 24, 1),
(61, 189, 12708192, NULL, 1, 0, 0, 1, 24, 1),
(63, 197, 17488557, NULL, 1, 0, 0, 0, 24, 1),
(67, 197, 31022299, NULL, 1, 0, 17488557, 1, 24, 1),
(68, 219, 24966953, NULL, 4, 0, 0, 1, 24, 1),
(69, 219, 24966953, NULL, 16, 0, 0, 1, 24, 1),
(70, 220, 17731780, NULL, 4, 0, 0, 1, 24, 1),
(71, 220, 17731780, NULL, 16, 0, 0, 1, 24, 1),
(72, 221, 16713869, NULL, 4, 0, 0, 1, 24, 1),
(73, 221, 16713869, NULL, 16, 0, 0, 1, 24, 1),
(74, 223, 22605223, NULL, 4, 0, 0, 0, 24, 1),
(75, 223, 22605223, NULL, 16, 0, 0, 0, 24, 1),
(76, 217, 25152732, NULL, 16, 0, 0, 1, 24, 1),
(77, 222, 20215050, NULL, 4, 0, 0, 1, 24, 1),
(78, 222, 20215050, NULL, 16, 0, 0, 1, 24, 1),
(79, 218, 25152732, NULL, 4, 0, 0, 1, 24, 1),
(80, 218, 25152732, NULL, 16, 0, 0, 1, 24, 1),
(81, 224, 22605223, NULL, 4, 0, 0, 1, 24, 1),
(82, 224, 22605223, NULL, 16, 0, 0, 1, 24, 1),
(83, 228, 22433592, NULL, 5, 0, 0, 1, 24, 1),
(84, 233, 22605223, NULL, 5, 0, 0, 1, 24, 1),
(85, 231, 25535140, NULL, 5, 0, 0, 1, 24, 1),
(86, 225, 16777178, NULL, 5, 0, 0, 1, 24, 1),
(87, 229, 28054020, NULL, 5, 0, 0, 1, 24, 1),
(88, 227, 24966953, NULL, 5, 0, 0, 1, 24, 1),
(89, 230, 22605223, NULL, 5, 0, 0, 1, 24, 2),
(90, 230, 30480423, NULL, 5, 0, 0, 1, 24, 3),
(91, 226, 25152732, NULL, 5, 0, 0, 1, 24, 1),
(92, 232, 23924800, NULL, 5, 0, 0, 0, 24, 1),
(93, 237, 8447313, NULL, 6, 0, 0, 1, 24, 3),
(94, 234, 14675858, NULL, 6, 0, 0, 1, 24, 1),
(95, 235, 17731780, NULL, 6, 0, 0, 1, 24, 1),
(96, 240, 23618812, NULL, 6, 0, 0, 0, 24, 1),
(97, 240, 28054020, NULL, 6, 0, 23618812, 1, 24, 1),
(98, 238, 30480423, NULL, 6, 0, 0, 1, 24, 1),
(99, 239, 25401466, NULL, 6, 0, 0, 1, 24, 1),
(100, 193, 17731780, NULL, 1, 0, 0, 1, 24, 1),
(101, 195, 16713869, NULL, 1, 0, 0, 1, 24, 1),
(102, 190, 28054020, NULL, 1, 0, 0, 1, 24, 1),
(103, 192, 17731780, NULL, 1, 0, 0, 1, 24, 1),
(104, 223, 30480423, NULL, 4, 0, 22605223, 1, 24, 1),
(105, 327, 22143273, NULL, 1, 0, 0, 1, 24, 1),
(106, 196, 25258172, NULL, 1, 0, 0, 1, 24, 1),
(107, 194, 8385543, NULL, 1, 0, 0, 1, 24, 1),
(108, 203, 12708192, NULL, 2, 0, 0, 1, 24, 1),
(109, 198, 16777178, NULL, 2, 0, 0, 1, 24, 1),
(110, 199, 16777178, NULL, 2, 0, 0, 1, 24, 1),
(111, 206, 26392509, NULL, 2, 0, 0, 1, 24, 1),
(112, 205, 12962853, NULL, 2, 0, 0, 1, 24, 1),
(113, 200, 24966953, NULL, 2, 0, 0, 1, 24, 1),
(114, 207, 17731780, NULL, 2, 0, 0, 1, 24, 1),
(115, 201, 25535140, NULL, 2, 0, 0, 1, 24, 1),
(116, 202, 17731780, NULL, 2, 0, 0, 1, 24, 1),
(117, 204, 27193022, NULL, 2, 0, 0, 1, 24, 1),
(118, 214, 14675858, NULL, 3, 0, 0, 1, 24, 1),
(119, 215, 25535140, NULL, 3, 0, 0, 1, 24, 1),
(120, 216, 12962853, NULL, 3, 0, 0, 1, 24, 1),
(121, 212, 17731780, NULL, 3, 0, 0, 1, 24, 1),
(122, 211, 17731780, NULL, 3, 0, 0, 1, 24, 1),
(123, 209, 30238266, NULL, 3, 0, 0, 1, 24, 1),
(124, 208, 24966953, NULL, 3, 0, 0, 1, 24, 1),
(125, 213, 8385543, NULL, 3, 0, 0, 1, 24, 1),
(126, 210, 25258172, NULL, 3, 0, 0, 1, 24, 1),
(127, 223, 34661219, NULL, 16, 0, 22605223, 1, 24, 1),
(128, 217, 25152732, NULL, 4, 0, 0, 1, 24, 1),
(129, 232, 30480423, NULL, 5, 0, 23924800, 1, 24, 1),
(130, 242, 14675177, NULL, 7, 0, 0, 1, 24, 1),
(131, 248, 31022299, NULL, 7, 0, 0, 1, 24, 1),
(132, 249, 22143273, NULL, 7, 0, 0, 1, 24, 1),
(133, 241, 20036964, NULL, 7, 0, 0, 1, 24, 1),
(134, 243, 22143273, NULL, 7, 0, 0, 1, 24, 1),
(135, 250, 16713869, NULL, 7, 0, 0, 1, 24, 1),
(136, 244, 28554605, NULL, 7, 0, 0, 1, 24, 1),
(137, 247, 27193022, NULL, 7, 0, 0, 1, 24, 1),
(138, 245, 30480423, NULL, 7, 0, 0, 1, 24, 1),
(139, 246, 31721353, NULL, 7, 0, 0, 0, 24, 1),
(140, 246, 33465642, NULL, 7, 0, 31721353, 1, 24, 1),
(141, 252, 30480423, NULL, 8, 0, 0, 1, 24, 1),
(142, 251, 14675177, NULL, 8, 0, 0, 1, 24, 1),
(143, 255, 20036964, NULL, 8, 0, 0, 1, 24, 1),
(144, 259, 22143273, NULL, 8, 0, 0, 1, 24, 1),
(145, 254, 27943599, NULL, 8, 0, 0, 1, 24, 1),
(146, 256, 27193022, NULL, 8, 0, 0, 1, 24, 1),
(147, 258, 10540805, NULL, 8, 0, 0, 1, 24, 1),
(148, 260, 21138851, NULL, 8, 0, 0, 1, 24, 1),
(149, 253, 24966953, NULL, 8, 0, 0, 1, 24, 1),
(150, 257, 20471061, NULL, 8, 0, 0, 1, 24, 1),
(151, 261, 25535140, NULL, 8, 0, 0, 1, 24, 1),
(152, 267, 21138851, NULL, 8, 0, 0, 1, 24, 1),
(153, 264, 30238266, NULL, 8, 0, 0, 1, 24, 1),
(154, 265, 25535140, NULL, 8, 0, 0, 1, 24, 1),
(155, 266, 14452384, NULL, 8, 0, 0, 1, 24, 1),
(156, 268, 27943599, NULL, 8, 0, 0, 1, 24, 1),
(157, 263, 10540805, NULL, 8, 0, 0, 1, 24, 1),
(158, 262, 20471061, NULL, 8, 0, 0, 1, 24, 1),
(159, 1, 26392509, NULL, 10, 0, 0, 1, 24, 1),
(160, 269, 12708192, NULL, 10, 0, 0, 1, 24, 1),
(161, 274, 17731780, NULL, 10, 0, 0, 1, 24, 1),
(162, 273, 17731780, NULL, 10, 0, 0, 1, 24, 1),
(163, 277, 10871300, NULL, 10, 0, 0, 1, 24, 1),
(164, 276, 16713869, NULL, 10, 0, 0, 1, 24, 1),
(165, 272, 22143273, NULL, 10, 0, 0, 1, 24, 1),
(166, 270, 28054020, NULL, 10, 0, 0, 1, 24, 1),
(167, 278, 17505835, NULL, 10, 0, 0, 1, 24, 1),
(168, 275, 8385543, NULL, 10, 0, 0, 1, 24, 1),
(169, 287, 17505835, NULL, 10, 0, 0, 1, 24, 1),
(170, 285, 26392509, NULL, 10, 0, 0, 1, 24, 1),
(171, 279, 16777178, NULL, 10, 0, 0, 1, 24, 1),
(172, 280, 16777178, NULL, 10, 0, 0, 1, 24, 1),
(173, 284, 26562609, NULL, 11, 0, 0, 1, 24, 1),
(174, 281, 24966953, NULL, 11, 0, 0, 1, 24, 1),
(175, 326, 17487067, NULL, 11, 0, 0, 1, 24, 1),
(176, 282, 25535140, NULL, 11, 0, 0, 1, 24, 1),
(177, 283, 10871300, NULL, 11, 0, 0, 1, 24, 1),
(178, 286, 16713869, NULL, 11, 0, 0, 1, 24, 1),
(179, 288, 16713869, NULL, 11, 0, 0, 1, 24, 1),
(180, 291, 14675858, NULL, 12, 0, 0, 1, 24, 1),
(181, 296, 17505835, NULL, 12, 0, 0, 1, 24, 1),
(182, 292, 10871300, NULL, 12, 0, 0, 1, 24, 1),
(183, 297, 30238266, NULL, 12, 0, 0, 1, 24, 1),
(184, 290, 17731780, NULL, 12, 0, 0, 1, 24, 1),
(185, 293, 10871300, NULL, 12, 0, 0, 1, 24, 1),
(186, 294, 25535140, NULL, 12, 0, 0, 1, 24, 1),
(187, 289, 24966953, NULL, 12, 0, 0, 1, 24, 1),
(188, 298, 14452384, NULL, 12, 0, 0, 1, 24, 1),
(189, 295, 16713869, NULL, 12, 0, 0, 1, 24, 1),
(190, 304, 20036964, NULL, 13, 0, 0, 1, 24, 1),
(191, 308, 16143608, NULL, 13, 0, 0, 1, 24, 1),
(192, 302, 34776827, NULL, 13, 0, 0, 1, 24, 1),
(193, 299, 24966953, NULL, 13, 0, 0, 1, 24, 1),
(194, 303, 22718772, NULL, 13, 0, 0, 1, 24, 1),
(195, 300, 26562609, NULL, 13, 0, 0, 1, 24, 1),
(196, 301, 14452384, NULL, 13, 0, 0, 1, 24, 1),
(197, 305, 13791475, NULL, 13, 0, 0, 1, 24, 1),
(198, 307, 21594951, NULL, 13, 0, 0, 1, 24, 1),
(199, 316, 16143608, NULL, 14, 0, 0, 1, 24, 1),
(200, 315, 22980123, NULL, 14, 0, 0, 1, 24, 1),
(201, 317, 22980123, NULL, 14, 0, 0, 1, 24, 1),
(202, 310, 24966953, NULL, 14, 0, 0, 1, 24, 1),
(203, 314, 14675862, NULL, 14, 0, 0, 1, 24, 1),
(204, 313, 14675862, NULL, 14, 0, 0, 1, 24, 1),
(205, 312, 13791475, NULL, 14, 0, 0, 1, 24, 1),
(206, 311, 27144269, NULL, 14, 0, 0, 1, 24, 1),
(207, 325, 22980123, NULL, 14, 0, 0, 1, 24, 1),
(208, 321, 20036964, NULL, 14, 0, 0, 1, 24, 1),
(209, 324, 16143608, NULL, 14, 0, 0, 1, 24, 1),
(210, 318, 24966953, NULL, 14, 0, 0, 1, 24, 1),
(211, 323, 25535140, NULL, 14, 0, 0, 1, 24, 1),
(212, 322, 27193022, NULL, 14, 0, 0, 1, 24, 1),
(213, 320, 27193022, NULL, 14, 0, 0, 1, 24, 1),
(214, 319, 14675862, NULL, 14, 0, 0, 1, 24, 1),
(215, 237, 23618812, NULL, 6, 0, 0, 0, 24, 2),
(216, 237, 23618812, NULL, 6, 0, 23618812, 0, 24, 2),
(217, 237, 23618812, NULL, 6, 0, 23618812, 0, 24, 2),
(218, 237, 28054020, NULL, 6, 0, 23618812, 1, 24, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mat_pro_novedades`
--

CREATE TABLE `mat_pro_novedades` (
  `id_matpro_novedades` int(3) NOT NULL,
  `matpro_id` int(4) NOT NULL,
  `profe` int(8) NOT NULL,
  `fecha_alta` varchar(19) NOT NULL DEFAULT '',
  `fecha_cese` varchar(19) DEFAULT '',
  `revista` int(3) NOT NULL,
  `licencia_inasistencia` int(11) DEFAULT NULL,
  `freg` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mat_pro_novedades`
--

INSERT INTO `mat_pro_novedades` (`id_matpro_novedades`, `matpro_id`, `profe`, `fecha_alta`, `fecha_cese`, `revista`, `licencia_inasistencia`, `freg`) VALUES
(56, 52, 13702023, '4/12/2017', '', 1, 0, '04-12-2017 05:22:37am'),
(57, 53, 17917901, '4/12/2017', '', 3, 0, '04-12-2017 05:23:30am'),
(64, 60, 26392509, '6/12/2017', '', 2, 0, '06-12-2017 08:44:54am'),
(65, 61, 12708192, '6/12/2017', '', 2, 0, '06-12-2017 08:46:11am'),
(67, 63, 17488557, '6/12/2017', '', 1, 0, '06-12-2017 09:20:50am'),
(68, 68, 24966953, '13/12/2017', '', 1, 0, '13-12-2017 08:37:36pm'),
(69, 69, 24966953, '13/12/2017', '', 1, 0, '13-12-2017 08:38:17pm'),
(70, 70, 17731780, '13/12/2017', '', 1, 0, '13-12-2017 08:38:40pm'),
(71, 71, 17731780, '13/12/2017', '', 1, 0, '13-12-2017 08:38:57pm'),
(72, 72, 16713869, '13/12/2017', '', 1, 0, '13-12-2017 08:39:28pm'),
(73, 73, 16713869, '13/12/2017', '', 1, 0, '13-12-2017 08:40:20pm'),
(74, 74, 22605223, '13/12/2017', '', 1, 0, '13-12-2017 08:40:51pm'),
(75, 75, 22605223, '13/12/2017', '', 1, 0, '13-12-2017 08:41:04pm'),
(76, 76, 25152732, '13/12/2017', '', 1, 0, '13-12-2017 08:41:39pm'),
(77, 77, 20215050, '13/12/2017', '', 1, 0, '13-12-2017 08:41:55pm'),
(78, 78, 20215050, '13/12/2017', '', 1, 0, '13-12-2017 08:42:07pm'),
(79, 79, 25152732, '13/12/2017', '', 1, 0, '13-12-2017 08:42:21pm'),
(80, 80, 25152732, '13/12/2017', '', 1, 0, '13-12-2017 08:42:35pm'),
(81, 81, 22605223, '13/12/2017', '', 1, 0, '13-12-2017 08:43:12pm'),
(82, 82, 22605223, '13/12/2017', '', 1, 0, '13-12-2017 08:43:36pm'),
(83, 83, 22433592, '13/12/2017', '', 1, 0, '13-12-2017 08:45:41pm'),
(84, 84, 22605223, '13/12/2017', '', 1, 0, '13-12-2017 08:45:59pm'),
(85, 85, 25535140, '13/12/2017', '', 1, 0, '13-12-2017 08:46:15pm'),
(86, 86, 16777178, '13/12/2017', '', 1, 0, '13-12-2017 08:46:29pm'),
(87, 87, 28054020, '13/12/2017', '', 1, 0, '13-12-2017 08:46:42pm'),
(88, 88, 24966953, '13/12/2017', '', 1, 0, '13-12-2017 08:47:02pm'),
(89, 89, 22605223, '13/12/2017', '', 1, 0, '13-12-2017 08:47:21pm'),
(90, 90, 30480423, '13/12/2017', '', 1, 0, '13-12-2017 08:49:50pm'),
(91, 91, 25152732, '13/12/2017', '', 1, 0, '13-12-2017 08:52:23pm'),
(92, 92, 23924800, '13/12/2017', '', 1, 0, '13-12-2017 08:52:36pm'),
(93, 93, 8447313, '13/12/2017', '', 2, 0, '13-12-2017 08:55:47pm'),
(94, 94, 14675858, '13/12/2017', '', 2, 0, '13-12-2017 08:56:42pm'),
(95, 95, 17731780, '13/12/2017', '', 2, 0, '13-12-2017 08:56:54pm'),
(96, 96, 23618812, '13/12/2017', '', 2, 0, '13-12-2017 08:57:29pm'),
(97, 97, 28054020, '01/09/2017', '', 3, 0, '13-12-2017 08:58:09pm'),
(98, 98, 30480423, '13/12/2017', '', 2, 0, '13-12-2017 08:58:48pm'),
(99, 99, 25401466, '13/12/2017', '', 2, 0, '13-12-2017 09:01:10pm'),
(100, 100, 17731780, '13/12/2017', '', 2, 0, '13-12-2017 09:02:48pm'),
(101, 101, 16713869, '13/12/2017', '', 2, 0, '13-12-2017 09:03:14pm'),
(102, 102, 28054020, '18/1/2018', '', 1, 0, '18-01-2018 08:17:08pm'),
(103, 103, 17731780, '18/1/2018', '', 2, 0, '18-01-2018 08:18:34pm'),
(104, 104, 30480423, '12/3/2018', '.28/2/2019.', 3, 0, '24-03-2018 11:57:10pm'),
(105, 105, 22143273, '12/4/2018', '', 2, 0, '12-04-2018 08:24:05pm'),
(106, 106, 25258172, '12/4/2018', '', 2, 0, '12-04-2018 08:25:25pm'),
(107, 107, 8385543, '12/4/2018', '', 2, 0, '12-04-2018 08:25:58pm'),
(108, 108, 12708192, '12/4/2018', '', 2, 0, '12-04-2018 08:26:45pm'),
(109, 109, 16777178, '12/4/2018', '', 2, 0, '12-04-2018 08:27:20pm'),
(110, 110, 16777178, '12/4/2018', '', 2, 0, '12-04-2018 08:27:31pm'),
(111, 111, 26392509, '12/4/2018', '', 2, 0, '12-04-2018 08:28:46pm'),
(112, 112, 12962853, '12/4/2018', '', 2, 0, '12-04-2018 08:29:08pm'),
(113, 113, 24966953, '12/4/2018', '', 2, 0, '12-04-2018 08:29:22pm'),
(114, 114, 17731780, '12/4/2018', '', 2, 0, '12-04-2018 08:42:37pm'),
(115, 115, 25535140, '12/4/2018', '', 2, 0, '12-04-2018 08:44:39pm'),
(116, 116, 17731780, '12/4/2018', '', 2, 0, '12-04-2018 08:44:52pm'),
(117, 117, 27193022, '12/4/2018', '', 2, 0, '12-04-2018 08:45:22pm'),
(118, 118, 14675858, '12/4/2018', '', 2, 0, '12-04-2018 08:49:27pm'),
(119, 119, 25535140, '12/4/2018', '', 2, 0, '12-04-2018 08:49:40pm'),
(120, 120, 12962853, '12/4/2018', '', 2, 0, '12-04-2018 08:49:55pm'),
(121, 121, 17731780, '12/4/2018', '', 2, 0, '12-04-2018 08:50:07pm'),
(122, 122, 17731780, '12/4/2018', '', 2, 0, '12-04-2018 08:50:20pm'),
(123, 123, 30238266, '12/4/2018', '', 2, 0, '12-04-2018 08:50:33pm'),
(124, 124, 24966953, '12/4/2018', '', 2, 0, '12-04-2018 08:50:45pm'),
(125, 125, 8385543, '12/4/2018', '', 2, 0, '12-04-2018 08:51:07pm'),
(126, 126, 25258172, '12/4/2018', '', 2, 0, '12-04-2018 08:51:34pm'),
(127, 127, 34661219, '01/04/2018', '.28/02/2018.', 3, 0, '12-04-2018 09:20:47pm'),
(128, 128, 25152732, '12/4/2018', '', 2, 0, '12-04-2018 09:22:40pm'),
(129, 129, 30480423, '1/3/2018', '.28/02/2019.', 3, 0, '12-04-2018 09:29:31pm'),
(130, 130, 14675177, '12/4/2018', '', 2, 0, '12-04-2018 09:35:02pm'),
(131, 131, 31022299, '12/4/2018', '', 2, 0, '12-04-2018 09:35:37pm'),
(132, 132, 22143273, '12/4/2018', '', 2, 0, '12-04-2018 09:35:50pm'),
(133, 133, 20036964, '12/4/2018', '', 2, 0, '12-04-2018 09:40:51pm'),
(134, 134, 22143273, '12/4/2018', '', 2, 0, '12-04-2018 09:41:05pm'),
(135, 135, 16713869, '12/4/2018', '', 2, 0, '12-04-2018 09:41:20pm'),
(136, 136, 28554605, '12/4/2018', '', 2, 0, '12-04-2018 09:41:34pm'),
(137, 137, 27193022, '12/4/2018', '', 2, 0, '12-04-2018 09:41:52pm'),
(138, 138, 30480423, '12/4/2018', '', 2, 0, '12-04-2018 09:42:00pm'),
(139, 139, 31721353, '12/4/2018', '', 2, 0, '12-04-2018 09:42:15pm'),
(140, 140, 33465642, '01/03/2018', '.28/02/2019.', 3, 0, '12-04-2018 09:43:43pm'),
(141, 141, 30480423, '12/4/2018', '', 2, 0, '12-04-2018 09:44:18pm'),
(142, 142, 14675177, '12/4/2018', '', 2, 0, '12-04-2018 09:44:32pm'),
(143, 143, 20036964, '12/4/2018', '', 2, 0, '12-04-2018 09:44:41pm'),
(144, 144, 22143273, '12/4/2018', '', 2, 0, '12-04-2018 09:44:50pm'),
(145, 145, 27943599, '12/4/2018', '', 2, 0, '12-04-2018 09:45:03pm'),
(146, 146, 27193022, '12/4/2018', '', 2, 0, '12-04-2018 09:45:15pm'),
(147, 147, 10540805, '12/4/2018', '', 2, 0, '12-04-2018 09:45:28pm'),
(148, 148, 21138851, '12/4/2018', '', 2, 0, '12-04-2018 09:45:38pm'),
(149, 149, 24966953, '12/4/2018', '', 2, 0, '12-04-2018 09:45:53pm'),
(150, 150, 20471061, '12/4/2018', '', 2, 0, '12-04-2018 09:49:25pm'),
(151, 151, 25535140, '12/4/2018', '', 2, 0, '12-04-2018 09:52:37pm'),
(152, 152, 21138851, '12/4/2018', '', 2, 0, '12-04-2018 09:52:48pm'),
(153, 153, 30238266, '12/4/2018', '', 2, 0, '12-04-2018 09:52:59pm'),
(154, 154, 25535140, '12/4/2018', '', 2, 0, '12-04-2018 09:53:10pm'),
(155, 155, 14452384, '12/4/2018', '', 2, 0, '12-04-2018 09:53:19pm'),
(156, 156, 27943599, '12/4/2018', '', 2, 0, '12-04-2018 09:53:37pm'),
(157, 157, 10540805, '12/4/2018', '', 2, 0, '12-04-2018 09:53:48pm'),
(158, 158, 20471061, '12/4/2018', '', 2, 0, '12-04-2018 09:53:57pm'),
(159, 159, 26392509, '12/4/2018', '', 2, 0, '12-04-2018 09:54:48pm'),
(160, 160, 12708192, '12/4/2018', '', 2, 0, '12-04-2018 09:55:00pm'),
(161, 161, 17731780, '12/4/2018', '', 2, 0, '12-04-2018 09:55:09pm'),
(162, 162, 17731780, '12/4/2018', '', 2, 0, '12-04-2018 09:55:52pm'),
(163, 163, 10871300, '12/4/2018', '', 2, 0, '12-04-2018 09:56:01pm'),
(164, 164, 16713869, '12/4/2018', '', 2, 0, '12-04-2018 09:56:11pm'),
(165, 165, 22143273, '12/4/2018', '', 2, 0, '12-04-2018 09:56:22pm'),
(166, 166, 28054020, '12/4/2018', '', 2, 0, '12-04-2018 09:56:32pm'),
(167, 167, 17505835, '12/4/2018', '', 2, 0, '12-04-2018 09:56:41pm'),
(168, 168, 8385543, '12/4/2018', '', 2, 0, '12-04-2018 09:56:50pm'),
(169, 169, 17505835, '12/4/2018', '', 2, 0, '12-04-2018 09:57:07pm'),
(170, 170, 26392509, '12/4/2018', '', 2, 0, '12-04-2018 09:57:15pm'),
(171, 171, 16777178, '12/4/2018', '', 2, 0, '12-04-2018 09:57:26pm'),
(172, 172, 16777178, '12/4/2018', '', 2, 0, '12-04-2018 09:58:06pm'),
(173, 173, 26562609, '12/4/2018', '', 2, 0, '12-04-2018 09:58:21pm'),
(174, 174, 24966953, '12/4/2018', '', 2, 0, '12-04-2018 09:58:29pm'),
(175, 175, 17487067, '12/4/2018', '', 2, 0, '12-04-2018 10:00:11pm'),
(176, 176, 25535140, '12/4/2018', '', 2, 0, '12-04-2018 10:00:23pm'),
(177, 177, 10871300, '12/4/2018', '', 2, 0, '12-04-2018 10:00:31pm'),
(178, 178, 16713869, '12/4/2018', '', 2, 0, '12-04-2018 10:00:38pm'),
(179, 179, 16713869, '12/4/2018', '', 2, 0, '12-04-2018 10:00:50pm'),
(180, 180, 14675858, '12/4/2018', '', 2, 0, '12-04-2018 10:01:34pm'),
(181, 181, 17505835, '12/4/2018', '', 2, 0, '12-04-2018 10:01:42pm'),
(182, 182, 10871300, '12/4/2018', '', 2, 0, '12-04-2018 10:01:51pm'),
(183, 183, 30238266, '12/4/2018', '', 2, 0, '12-04-2018 10:02:00pm'),
(184, 184, 17731780, '12/4/2018', '', 2, 0, '12-04-2018 10:02:15pm'),
(185, 185, 10871300, '12/4/2018', '', 2, 0, '12-04-2018 10:02:26pm'),
(186, 186, 25535140, '12/4/2018', '', 2, 0, '12-04-2018 10:02:43pm'),
(187, 187, 24966953, '12/4/2018', '', 2, 0, '12-04-2018 10:02:53pm'),
(188, 188, 14452384, '12/4/2018', '', 2, 0, '12-04-2018 10:03:03pm'),
(189, 189, 16713869, '12/4/2018', '', 2, 0, '12-04-2018 10:03:13pm'),
(190, 190, 20036964, '12/4/2018', '', 2, 0, '12-04-2018 10:03:44pm'),
(191, 191, 16143608, '12/4/2018', '', 2, 0, '12-04-2018 10:03:53pm'),
(192, 192, 34776827, '12/4/2018', '', 2, 0, '12-04-2018 10:04:02pm'),
(193, 193, 24966953, '12/4/2018', '', 2, 0, '12-04-2018 10:04:10pm'),
(194, 194, 22718772, '12/4/2018', '', 2, 0, '12-04-2018 10:04:20pm'),
(195, 195, 26562609, '12/4/2018', '', 2, 0, '12-04-2018 10:04:29pm'),
(196, 196, 14452384, '12/4/2018', '', 2, 0, '12-04-2018 10:04:37pm'),
(197, 197, 13791475, '12/4/2018', '', 2, 0, '12-04-2018 10:04:47pm'),
(198, 198, 21594951, '12/4/2018', '', 2, 0, '12-04-2018 10:05:16pm'),
(199, 199, 16143608, '12/4/2018', '', 2, 0, '12-04-2018 10:05:33pm'),
(200, 200, 22980123, '12/4/2018', '', 2, 0, '12-04-2018 10:05:41pm'),
(201, 201, 22980123, '12/4/2018', '', 2, 0, '12-04-2018 10:05:52pm'),
(202, 202, 24966953, '12/4/2018', '', 2, 0, '12-04-2018 10:06:01pm'),
(203, 203, 14675862, '12/4/2018', '', 2, 0, '12-04-2018 10:06:52pm'),
(204, 204, 14675862, '12/4/2018', '', 2, 0, '12-04-2018 10:07:00pm'),
(205, 205, 13791475, '12/4/2018', '', 2, 0, '12-04-2018 10:07:09pm'),
(206, 206, 27144269, '12/4/2018', '', 2, 0, '12-04-2018 10:07:19pm'),
(207, 207, 22980123, '12/4/2018', '', 2, 0, '12-04-2018 10:07:33pm'),
(208, 208, 20036964, '12/4/2018', '', 2, 0, '12-04-2018 10:07:48pm'),
(209, 209, 16143608, '12/4/2018', '', 2, 0, '12-04-2018 10:07:56pm'),
(210, 210, 24966953, '12/4/2018', '', 2, 0, '12-04-2018 10:08:03pm'),
(211, 211, 25535140, '12/4/2018', '', 2, 0, '12-04-2018 10:08:17pm'),
(212, 212, 27193022, '12/4/2018', '', 2, 0, '12-04-2018 10:08:27pm'),
(213, 213, 27193022, '12/4/2018', '', 2, 0, '12-04-2018 10:08:36pm'),
(214, 214, 14675862, '12/4/2018', '', 2, 0, '12-04-2018 10:09:15pm'),
(215, 215, 23618812, '24/4/2018', '', 1, 0, '24-04-2018 12:08:42am'),
(216, 216, 23618812, '24/4/2018', '.24/4/2018.', 3, 0, '24-04-2018 12:09:41am'),
(217, 217, 23618812, '24/4/2018', '.24/4/2018.', 3, 0, '24-04-2018 12:09:46am'),
(218, 218, 28054020, '01/03/2018', '.28/02/2019.', 3, 0, '24-04-2018 12:11:35am');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `idParam` int(10) NOT NULL,
  `Presente` varchar(255) NOT NULL,
  `Tarde` varchar(255) NOT NULL,
  `Ausente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `dni` int(8) NOT NULL,
  `legajo` int(4) DEFAULT NULL,
  `apellido` text NOT NULL,
  `nombre` varchar(40) NOT NULL,
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
  `persona_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`dni`, `legajo`, `apellido`, `nombre`, `genero`, `domicilio`, `localidad`, `telefono`, `celular`, `usuario_id`, `fecha_nac`, `fecha_ing_escuela`, `fecha_ing_doc`, `idcarga`, `email`, `persona_tipo`) VALUES
(8385543, 0, 'CICCHITTI', 'MARIO OSCAR', 1, 'CALLE 102 N 447', 12, '02224471256', '0', 0, '02/07/1950', '', '', 24, 'mario_ci02@yahoo.com.ar', NULL),
(8447313, 0, 'BOUCHE', 'CARLOS', 1, '', 13, '', '1140884388', 0, '25/07/1950', '', '', 24, 'carlos.bouche@yahoo.com.ar', NULL),
(8447843, 0, 'SANGUINETTI', 'JUAN CARLOS', 1, 'URUGUAY 583', 18, '0222542163', '0222415451576', 0, '11/08/1950', '', '', 24, 'juancarlossanguinetti@yahoo.com.ar', NULL),
(10540805, 0, 'VILLEGAS', 'MARIA CRISTINA', 1, '25 DE MAYO XX', 17, '02225422518', '1159654095', 0, '22/03/1952', '', '', 24, 'prof_villegascris@hotmail.com', NULL),
(10871300, 0, 'SAVIZA', 'OSVALDO RUBEN', 1, 'JOSE HERNANDEZ 1481', 13, '', '02223679707', 0, '08/12/1953', '', '', 24, 'licsaviza@hotmail.com', NULL),
(11222333, 0, 'SIN', 'PROFE', 1, '-', 13, '-', '-', 0, '01/01/1980', '\n       ', '', 24, '', 1),
(12708192, 0, 'GONZALEZ CHAVARRIA', 'MARTA NOEMI', 1, 'MITRE 962', 2, '', '1166407430', 0, '28/08/1956', '', '', 24, 'martangonzalezchavarria@gmail.com', NULL),
(12962853, 0, 'ARMIROTTI', 'DARIO JORGE', 1, 'GENERAL PAZ 50', 18, '', '1157279185', 0, '23/05/1959', '', '', 24, 'darioarmirotti@yahoo.com', NULL),
(13702023, 0, 'FARIAS', 'JORGE DANIEL', 1, 'HORACIO QUIROGA 2364', 1, '0', '1165378677', 0, '23/01/1960', '', '', 24, 'yabuair@gmail.com', NULL),
(13791475, 0, 'VILCHEZ', 'JORGE ADOLFO', 1, '', 13, '', '0222415549962', 0, '24/02/1960', '', '', 24, 'jorgevilchez24@hotmail.com', NULL),
(14452384, 0, 'VELA', 'NESTOR ORLANDO', 1, 'BULRICH 347', 18, '', '1168856180', 0, '14/06/1961', '\n       ', '', 24, 'vela.nestor609@gmail.com', 1),
(14675177, 0, 'PALACIOS', 'MIGUEL ANGEL', 1, 'PRIMERA JUNTA 37', 17, '', '0222415498872', 0, '22/05/1961', '', '', 24, 'mapalacios07@gmail.com', NULL),
(14675858, 0, 'CONTENTO', 'JOSE EDUARDO', 1, '25 DE MAYO 372', 4, '', '1156619580', 0, '19/09/1962', '', '', 24, 'jcontento@uade.edu.ar', NULL),
(14675862, 0, 'TORRESAN', 'ANA ESTELA', 1, 'ALFONSO XIII N 1212', 3, '42331359', '1165136067', 0, '19/08/1961', '', '', 24, 'aetorresan@gmail.com', NULL),
(16036034, 0, 'DUTTO', 'NORMA BEATRIZ', 2, 'TRIUNVIRATO 963', 15, '', '11111111', 0, '21/09/1962', '\n       ', '', 24, '', 1),
(16143608, 0, 'GUTIERREZ', 'SILVANA NORA', 1, 'LAS HERAS 814', 25, '', '1559552331', 0, '29/08/1962', '', '', 24, 'silvygut@gmail.com', NULL),
(16182022, 0, 'SPANDRE', 'OMAR JOSE', 1, 'FRENCH 972', 15, '0', '0222455028', 0, '02/03/1963', '\n       ', '', 24, 'spandreomar@gmail.com', 1),
(16675692, 0, 'ALE', 'ELISA', 1, 'FERRERE 96', 17, '', '2224542829', 0, '02/01/1964', '\n       ', '', 24, 'elis_ale@hotmail.com', 1),
(16713869, 0, 'SANDEZ', 'JORGE GUSTAVO', 1, 'AV. PTE. PERON 4173 DTO.4', 17, '', '1159693854', 0, '28/11/1963', '', '', 24, 'jgustavosandez@gmail.com', NULL),
(16777178, 0, 'LABARTA', 'MARCELO GABRIEL', 1, 'EVA PERON 743', 4, '42387316', '1166762308', 0, '10/01/1964', '', '', 24, 'saberes_matematicos@yahoo.com.ar', NULL),
(17014390, 0, 'BENITEZ', 'EDID MABEL', 2, 'ARAUJO 122', 4, '0', '1161226387', 0, '13/11/1964', '21/08/2018\n       ', '08/04/1994', 24, 'edid_lilu@hotmail.com', 1),
(17487067, 0, 'CARMODY', 'SANDRA BEATRIZ', 1, 'RUTA 6 KM 74', 17, '', '1141428486', 0, '21/08/1965', '', '', 24, 'sandra.carmody@gmail.com', NULL),
(17488557, 0, 'FERNANDEZ', 'CLARA ANTONIA', 1, '', 13, '', '2224497735', 0, '13/07/1965', '', '', 24, '', NULL),
(17505835, 0, 'ALBERTINI', 'ROBERTO DANIEL', 1, 'DEAN FUNES 132', 17, '0', '1126985658', 0, '12/11/1965', '', '', 36, 'rodalbertini@yahoo.com.ar', NULL),
(17589694, 0, 'RODRIGUEZ', 'ANA MARIA', 1, 'LUIS MARIA DRAGO 326', 18, '02224422885', '222551005', 0, '31/12/1967', '', '', 24, 'anamanico@yahoo.com.ar', NULL),
(17731780, 0, 'GELSI', 'FABIO ALEJANDRO', 1, 'SAN MARTIN 302', 27, '', '0222415542498', 0, '21/09/1966', '', '', 24, 'contadorfag@hotmail.com', NULL),
(17917901, 0, 'ALOE', 'ANTONIO RAMON', 1, 'ARISTOBULO DEL VALLE 238', 1, '02224424680', '1169468045', 0, '11/09/1966', '', '', 24, 'elprofea@gmail.com', NULL),
(18051117, 0, 'OYARZUM', 'REGINA MARIA', 2, 'PEÃ‘A 293', 17, '', '2224444991', 0, '09/08/1965', '07/09/2016\n       ', '', 24, '', 1),
(18454972, 0, 'MARTINEZ', 'MARIA ELENA', 1, 'RACCONE 634', 18, '0', '2224496040', 0, '17/12/1965', '       ', '', 24, 'brengide40@hotmail.com', 1),
(19042649, 0, 'GALEANO', 'LILIANA BEATRIZ', 1, 'O HIGGINS 1862', 17, '0', '1157677609', 0, '20/06/1986', '       ', '', 24, 'liliana.beatriz.galeano@gmail.com', 1),
(20036964, 0, 'ORTIZ', 'GUILLERMO JOSE', 1, '0', 13, '', '222456262', 0, '26/06/1968', '       ', '', 24, 'guillermo.orx@gmail.com', 1),
(20076643, 0, 'PAZ', 'NANCY DEL VALLE', 2, 'LORENZO MIGUEL 1428', 17, '0', '2224533789', 0, '01/03/1968', '03/09/2018\n       ', '06/05/2011', 24, 'yonachi@hotmail.es', 1),
(20215050, 0, 'MARQUEZ', 'NORBERTO RUBEN', 1, 'LOS PLATANOA 1353', 17, '', '0222415500852', 0, '31/05/1969', '', '', 24, 'cyberalpha@gmail.com', NULL),
(20328776, 0, 'RIOS', 'MIRTA ALEJANDRA', 2, 'JUSTO 782', 18, '', '2224493387', 0, '09/07/1968', '\n       ', '', 24, 'mirtarios09072@hotmail.com', 1),
(20471061, 0, 'CENTRON', 'FLORENCIA GABRIELA', 1, '0', 13, '0', '2224504828', 0, '25/10/1968', '       ', '', 24, 'fgcentron@yahoo.com.ar', 1),
(21138851, 0, 'CARBONE', 'JAVIER SALVADOR', 1, '20 DE JUNIO 251', 17, '', '1137256960', 0, '11/12/1969', '', '', 24, 'locutorcarbone@gmail.com', NULL),
(21485379, 0, 'VALENZUELA', 'MARIA ISABEL', 2, 'MORENO 81', 18, '', '2224536532', 0, '28/01/1970', '\n       ', '', 24, '', 1),
(21594951, 0, 'BAHL', 'VERONICA LINA', 2, 'QUILMES 202', 17, '0', '1164181676', 0, '28/05/1970', '\n       ', '', 24, 'veronicalina269@yahoo.com.ar', 1),
(22143273, 0, 'MORE', 'SANDRA LEONOR', 1, 'ANTARTIDA ARGENTINA 2932', 12, '2224470452', '1163368288', 0, '27/05/1971', '', '', 24, 'susanagalaxi9080@gmail.com', NULL),
(22217832, 0, 'OJEDA', 'GUSTAVO GABRIEL', 1, 'BAEZ 753', 18, '', '2224443319', 0, '29/06/1971', '\n       ', '', 24, '', 1),
(22433592, 0, 'MERLICCO', 'MARCOS DARIO', 1, 'HONDURAS 267', 18, '', '1133030400', 0, '26/10/1971', '', '', 24, 'mdm_informatica@yahoo.com.ar', NULL),
(22605223, 0, 'BROGGIA', 'LEONARDO', 1, 'RACCONE 652', 18, '02225425600', '0222415466535', 0, '07/07/1972', '', '', 24, 'leobroggia@gmail.com', NULL),
(22718772, 0, 'CAIRO', 'MARIA FERNANDA', 1, 'MIGUEL FAUSTO ROCA 421', 4, '42995708', '1156121135', 0, '20/11/1972', '', '', 24, 'cairomf@yahoo.com.ar', NULL),
(22980123, 0, 'SEGURA', 'EMILIANO', 1, '', 13, '', '1157801377', 0, '19/09/1972', '', '', 24, 'barracuda19@hotmail.com', NULL),
(23391543, 0, 'MANDRILE', 'GUILLERMO JOSE', 1, 'SALTA 123', 18, '', '2224497697', 0, '23/06/1973', '07/09/2016\n       ', '', 24, '', 1),
(23618812, 0, 'ALOE', 'ADAN FRANCISCO', 1, 'FRENCH 872', 17, '', '1141901523', 24, '17/11/1973', '01/03/2004', '', 37, 'adanfrancisco@gmail.com', NULL),
(23924800, 0, 'SANTOS', 'PAULINA LUISA', 2, '9 DE JULIO 1453', 17, '', '2224608670', 0, '17/08/1974', '\n       ', '', 24, 'pfplsantos@hotmail.com', 1),
(24434152, 0, 'NAVARRO', 'LUIS SEBA', 1, 'GENERAL RODRIGUEZ 197', 17, '', '2224456174', 37, '24/01/1975', '\n       ', '', 24, 'navarroseba@yahoo.com.ar', 1),
(24935808, 0, 'LOPEZ', 'ROBERTO ALEJANDRO', 1, 'REPUBLICA ARGENTINA 853', 12, '', '1162107827', 0, '19/08/1961', '', '', 25, '', NULL),
(24966953, 0, 'VILTE', 'PAMELA DE LOS SANTOS', 1, 'CASTELLI 1653', 17, '', '0222415543270', 0, '16/10/1975', '', '', 24, 'profesoraviltepamela@hotmail.com', NULL),
(25108642, 0, 'MACHUCA', 'OSCAR ', 1, '9 DE JULIO 673', 17, '02225484693', '0222415464510', 30, '04/04/1976', '', '', 35, 'cachohard@gmail.com', NULL),
(25152732, 0, 'PALMIERI', 'LEONARDO FEDERICO', 1, 'TIEGHI 1459', 3, '20740409', '1140362043', 0, '04/05/1976', '', '', 24, 'buenaracha@gmail.com', NULL),
(25258172, 0, 'OVIEDO', 'MANUEL ARMANDO', 1, '', 13, '', '1158682461', 0, '10/06/1976', '', '', 24, 'manarovi@hotmail.com', NULL),
(25401466, 0, 'CARDENAS', 'JAVIER', 1, '', 13, '', '1136875319', 0, '10/07/1971', '', '', 24, 'cardenas_j_@hotmail.com', NULL),
(25535140, 0, 'JACOBSEN', 'BETIANA MARICEL', 1, 'PRIMERA JUNTA 37', 17, '', '022241545001', 0, '28/10/76', '', '', 24, 'betiana_jacobsen@hotmail.com', NULL),
(26392509, 0, 'DANERI', 'GASTON ALFREDO', 1, 'PUEYRREDON 413', 12, '02225424800', '1141614791', 0, '26/11/1977', '', '', 24, 'estudiodaneri@yahoo.com.ar', NULL),
(26562609, 0, 'SALAZAR', 'VALERIA', 1, 'TENIENTE IBAÃ‘EZ 291', 18, '02225422081', '1155943204', 0, '11/09/1968', '', '', 24, 'salazarvs@hotmail.com', NULL),
(27144269, 0, 'ALVAREZ', 'CAROLINA SILVANA', 1, 'GABINO EZEIZA 173', 18, '', '0222415462242', 0, '26/12/1978', '', '', 24, 'pampamiasv@gmail.com', NULL),
(27193022, 0, 'SANGUINETTI', 'GABRIELA', 1, 'KENEDY 274', 18, '02225425809', '1155114154', 0, '27/01/1979', '', '', 24, 'gmsanguinetti@yahoo.com.ar', NULL),
(27943599, 0, 'FERNANDEZ', 'LIGIA ERICA', 1, 'LINCOLN 252', 18, '', '0222415465291', 0, '12/04/1980', '', '', 24, 'ligiaarg@yahoo.com.ar', NULL),
(28054020, 0, 'PINI', 'LEANDRO ALEXIS', 1, 'GRAL PAZ 290', 18, '', '1136884366', 0, '21/06/1980', '', '', 36, 'ing_leandropini@hotmail.com', NULL),
(28136064, 0, 'ENRIQUE', 'ELIZABETH NATALIA', 2, '', 18, '0', '1132477588', 0, '22/06/1980', '\n       ', '', 24, '', 1),
(28554605, 0, 'IRALA', 'LORENA', 1, 'CALLE 110 N 973', 12, '00', '1136601763', 0, '18/11/1980', '', '', 24, 'iralafilo@hotmail.com', NULL),
(30238266, 0, 'AMEZTOY', 'EMILIANO JOSE', 1, 'SAENZ PEÃƒ?A 85', 17, '', '0222415447652', 0, '26/06/1983', '', '', 24, 'emilianoameztoy@hotmail.com', NULL),
(30480423, 0, 'TOLEDO', 'RODRIGO EMANUEL', 1, 'ZEBALLOS 424', 18, '', '1139575485', 0, '17/09/1983', '', '', 24, 'rodrigoetoledo@hotmail.com', NULL),
(31022299, 0, 'ESPINOLA', 'ALEJANDRA NOEMI', 1, 'RACONE 226', 18, '0', '2224493295', 0, '23/07/1985', '', '', 24, 'alejandraespinola84@hotmail.com', NULL),
(31721353, 0, 'DEL BONO', 'GASTON', 1, 'SEGUI 311', 18, '', '', 0, '21/07/1985', '', '', 25, '', NULL),
(33465642, 0, 'MANUEL', 'ALUMINE ANAHI', 2, 'QUIROGA 354', 18, '0', '1166628695', 0, '10/11/88', '', '', 24, 'alumine.a.manuel@gmail.com', 1),
(34490891, 0, 'IRRASAVA', 'SANDRA NOEMI', 2, 'ANDRADE 3286', 5, '', '1168856090', 0, '04/03/1978', '\n       ', '', 24, 'sandrairrasava@yahoo.com.ar', 1),
(34661219, 0, 'TORRES RAMOS', 'JULIO MAURICIO', 1, 'SAN JUAN 1524', 26, '0', '1130493389', 0, '03/03/1989', '       ', '', 24, 'mauricio3389@gmail.com', 1),
(34662333, 0, 'ARMIROTTI', 'FEDERICO RAUL', 1, 'JUSTO 50', 18, '0', '1164385500', 0, '26/07/1989', '\n       ', '', 24, 'farmirotti@gmail.com', 1),
(34776827, 0, 'ALVAREZ', 'GONZALO', 1, 'FRECH 998', 17, '', '1187789283', 0, '18/03/2010', '\r\n       ', '', 24, 'fachoalvarez@gmail.com', 1),
(34797453, 0, 'PACIFICO', 'EZEQUIEL ', 1, 'SANTA FE 62', 17, '0', '1123495225', 36, '29/10/1989', '14/05/2018\n       ', '', 24, 'epacifico@abc.gob.ar', 1),
(35162516, 0, 'LANDINI', 'SILVANA ERICA', 2, 'ALSINA 530', 17, '0', '2224496636', 0, '20/06/1990', '\n       ', '', 24, 'silvanaericalandini@gmail.com', 1),
(36924082, 0, 'PITRELLI', 'NAHIR ANDREA', 2, 'RODRIGUEZ PEÃ‘A 340', 17, '483092', '2224462659', 0, '03/07/1992', '\n       ', '', 24, 'nahir.pitrelli@hotmail.com.ar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profe_notas`
--

CREATE TABLE `profe_notas` (
  `id_nota` int(4) NOT NULL,
  `alumno_id` int(8) NOT NULL,
  `divi_mat_pro_id` int(4) NOT NULL,
  `nota` int(4) NOT NULL,
  `argumento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profe_novedad`
--

CREATE TABLE `profe_novedad` (
  `idnovedad` int(3) NOT NULL,
  `profe` int(8) NOT NULL,
  `novedad` text,
  `fecha` varchar(10) NOT NULL DEFAULT '',
  `responsable` int(3) DEFAULT NULL,
  `fechaingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profe_novedad`
--

INSERT INTO `profe_novedad` (`idnovedad`, `profe`, `novedad`, `fecha`, `responsable`, `fechaingreso`) VALUES
(9, 23618812, 'DIJO QUE LLEGA TARDE', '09-01-2018', 24, '2018-01-10 02:52:13'),
(10, 23618812, 'ALGO 1', '09-01-2018', 24, '2018-01-10 07:03:31'),
(11, 23618812, 'ALGO 2', '09-01-2018', 24, '2018-01-10 07:03:37'),
(12, 23618812, 'HOY LLEGA A LAS 19', '10-01-2018', 24, '2018-01-11 07:01:02'),
(13, 23618812, '', '10-01-2018', 24, '2018-01-11 08:18:21'),
(14, 23618812, '', '10-01-2018', 24, '2018-01-11 08:23:06'),
(15, 23618812, '', '10-01-2018', 24, '2018-01-11 08:25:01'),
(16, 23618812, '', '10-01-2018', 24, '2018-01-11 08:25:25'),
(17, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 09:18:49'),
(18, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 09:20:01'),
(19, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 09:20:43'),
(20, 23618812, 'D', '11-01-2018', 24, '2018-01-11 09:23:18'),
(21, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 09:24:04'),
(22, 23618812, 'S', '11-01-2018', 24, '2018-01-11 09:25:34'),
(23, 23618812, 'D', '11-01-2018', 24, '2018-01-11 09:28:00'),
(24, 23618812, 'S', '11-01-2018', 24, '2018-01-11 09:29:06'),
(25, 23618812, 'AFGAG', '11-01-2018', 24, '2018-01-11 09:33:13'),
(26, 23618812, 'POP', '11-01-2018', 24, '2018-01-11 22:26:45'),
(27, 23618812, 'POP', '11-01-2018', 24, '2018-01-11 22:26:45'),
(28, 23618812, 'POP', '11-01-2018', 24, '2018-01-11 22:26:45'),
(29, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 22:28:20'),
(30, 23618812, 'S', '11-01-2018', 24, '2018-01-11 22:31:30'),
(31, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 22:32:24'),
(32, 23618812, 'SSS', '11-01-2018', 24, '2018-01-11 22:43:50'),
(33, 23618812, 'K;HFKHFSJ', '11-01-2018', 24, '2018-01-11 22:45:50'),
(34, 25108642, 'LLEGA A LAS 19', '13-01-2018', 25, '2018-01-13 05:24:58'),
(35, 25108642, 'LLEGA A LAS 19', '13-01-2018', 25, '2018-01-13 05:25:34'),
(36, 23618812, 'D', '13-01-2018', 24, '2018-01-14 02:52:39'),
(37, 23618812, 'DD', '15-01-2018', 24, '2018-01-15 19:58:17'),
(38, 23618812, 'DD', '15-01-2018', 24, '2018-01-15 19:59:38'),
(39, 23618812, 'AVISOOO', '31-01-2018', 24, '2018-02-01 01:45:17'),
(40, 23618812, 'AVISEEE', '03-02-2018', 24, '2018-02-03 05:26:11'),
(41, 23618812, 'PEPEPE', '03-02-2018', 24, '2018-02-03 05:26:41'),
(42, 23618812, 'LLEGANDO TARDE POR RETRASO DEL BONDI', '19-02-2018', 30, '2018-02-19 23:39:02'),
(43, 8447313, 'UOUOUOUOU', '23-03-2018', 24, '2018-03-23 17:05:19'),
(44, 23618812, 'LLEGA TARDE', '28-06-2018', 36, '2018-06-28 23:58:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profe_tipo`
--

CREATE TABLE `profe_tipo` (
  `idpersona_tipo` int(4) NOT NULL,
  `persona_tipo_descripcion` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revista`
--

CREATE TABLE `revista` (
  `id_revista` int(3) NOT NULL,
  `revista_nombre` varchar(50) NOT NULL DEFAULT '',
  `revista_sigla` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `revista`
--

INSERT INTO `revista` (`id_revista`, `revista_nombre`, `revista_sigla`) VALUES
(1, 'TITULAR', 'T'),
(2, 'PROVISIONAL', 'P'),
(3, 'SUPLENTE', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_nombre` varchar(8) NOT NULL,
  `usuario_clave` varchar(256) NOT NULL,
  `usuario_id` int(4) NOT NULL,
  `usuario_nivel` int(2) NOT NULL,
  `usuario_freg` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_nombre`, `usuario_clave`, `usuario_id`, `usuario_nivel`, `usuario_freg`) VALUES
('adanaloe', '6dcea6e17f24236d7d0579c5871fd5d2', 24, 1, '17-01-2018'),
('cacho', '6dcea6e17f24236d7d0579c5871fd5d2', 30, 4, '18-01-2018 '),
('pini', '6dcea6e17f24236d7d0579c5871fd5d2', 31, 2, '20-01-2018 '),
('juanca', '6dcea6e17f24236d7d0579c5871fd5d2', 33, 2, '03-02-2018 '),
('16713869', '57260ec2609bcb4f48012806e445cb25', 34, 2, '19-02-2018 '),
('machuca', '6dcea6e17f24236d7d0579c5871fd5d2', 35, 2, '25-04-2018 '),
('pacifico', '6b9ff05b0abf972012b569212f3dbbe2', 36, 4, '28-06-2018 '),
('seba', '1165b05ff34126296e4c3aab150ffdcb', 37, 4, '13-07-2018 ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno_retiro`
--
ALTER TABLE `alumno_retiro`
  ADD PRIMARY KEY (`idAsistencia`);

--
-- Indices de la tabla `asistencia_alumno`
--
ALTER TABLE `asistencia_alumno`
  ADD PRIMARY KEY (`idAsistencia`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id_carrera`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idcurso`);

--
-- Indices de la tabla `curso_lectivo`
--
ALTER TABLE `curso_lectivo`
  ADD PRIMARY KEY (`idcursolectivo`);

--
-- Indices de la tabla `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id_division`);

--
-- Indices de la tabla `escuela`
--
ALTER TABLE `escuela`
  ADD PRIMARY KEY (`cue`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nro`);

--
-- Indices de la tabla `licencia_encuadre`
--
ALTER TABLE `licencia_encuadre`
  ADD PRIMARY KEY (`idencuadre`);

--
-- Indices de la tabla `licencia_profe`
--
ALTER TABLE `licencia_profe`
  ADD PRIMARY KEY (`idinasistencia`),
  ADD KEY `lic_encuadre_profe` (`articulo_encuadre`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`idlocalidad`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `mat_pro`
--
ALTER TABLE `mat_pro`
  ADD PRIMARY KEY (`id_matpro`);

--
-- Indices de la tabla `mat_pro_novedades`
--
ALTER TABLE `mat_pro_novedades`
  ADD PRIMARY KEY (`id_matpro_novedades`),
  ADD KEY `matpro_id` (`matpro_id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`idParam`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `dni` (`dni`),
  ADD KEY `genero` (`genero`);

--
-- Indices de la tabla `profe_notas`
--
ALTER TABLE `profe_notas`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indices de la tabla `profe_novedad`
--
ALTER TABLE `profe_novedad`
  ADD PRIMARY KEY (`idnovedad`),
  ADD KEY `idnovedad` (`idnovedad`);

--
-- Indices de la tabla `profe_tipo`
--
ALTER TABLE `profe_tipo`
  ADD PRIMARY KEY (`idpersona_tipo`);

--
-- Indices de la tabla `revista`
--
ALTER TABLE `revista`
  ADD PRIMARY KEY (`id_revista`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno_retiro`
--
ALTER TABLE `alumno_retiro`
  MODIFY `idAsistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asistencia_alumno`
--
ALTER TABLE `asistencia_alumno`
  MODIFY `idAsistencia` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `idcurso` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `curso_lectivo`
--
ALTER TABLE `curso_lectivo`
  MODIFY `idcursolectivo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `division`
--
ALTER TABLE `division`
  MODIFY `id_division` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `licencia_encuadre`
--
ALTER TABLE `licencia_encuadre`
  MODIFY `idencuadre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `licencia_profe`
--
ALTER TABLE `licencia_profe`
  MODIFY `idinasistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `idlocalidad` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_materia` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT de la tabla `mat_pro`
--
ALTER TABLE `mat_pro`
  MODIFY `id_matpro` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT de la tabla `mat_pro_novedades`
--
ALTER TABLE `mat_pro_novedades`
  MODIFY `id_matpro_novedades` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `idParam` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profe_notas`
--
ALTER TABLE `profe_notas`
  MODIFY `id_nota` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profe_novedad`
--
ALTER TABLE `profe_novedad`
  MODIFY `idnovedad` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `profe_tipo`
--
ALTER TABLE `profe_tipo`
  MODIFY `idpersona_tipo` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revista`
--
ALTER TABLE `revista`
  MODIFY `id_revista` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `licencia_profe`
--
ALTER TABLE `licencia_profe`
  ADD CONSTRAINT `lic_encuadre_profe` FOREIGN KEY (`articulo_encuadre`) REFERENCES `licencia_encuadre` (`idencuadre`);

--
-- Filtros para la tabla `mat_pro_novedades`
--
ALTER TABLE `mat_pro_novedades`
  ADD CONSTRAINT `mat_pro_novedades_ibfk_1` FOREIGN KEY (`matpro_id`) REFERENCES `mat_pro` (`id_matpro`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
