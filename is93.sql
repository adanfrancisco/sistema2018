-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-01-2018 a las 07:14:32
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `is93`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `dni` int(8) NOT NULL,
  `usuario_id` int(4) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `fech_nac` varchar(10) DEFAULT NULL,
  `Genero` varchar(10) DEFAULT NULL,
  `localidad` int(4) DEFAULT NULL,
  `domicilio` varchar(60) DEFAULT NULL,
  `tel_linea` varchar(30) DEFAULT NULL,
  `tel_celu` varchar(30) DEFAULT NULL,
  `legajo` varchar(10) DEFAULT NULL,
  `idcarga` int(4) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, '114', 'A.1', 120, ' a.1) Licencia Ordinaria por Enfermedad:\r\na.1.1) Personal Titular: hasta ciento veinte (120) días corridos por año calendario en forma continua o alternada en las siguientes condiciones:\r\na.1.1.1) Los primeros veinticinco (25) días con goce íntegro de haberes.\r\na.1.1.2) Los treinta y cinco (35) días siguientes con el cincuenta (50) por ciento de haberes.\r\na.1.1.3) Los sesenta (60) días restantes sin goce de haberes.\r\na.1.2) Personal Docente Provisional: gozará de la Licencia determinada en el presente artículo e incisos, en las condiciones y con los límites allí establecidos, hasta un máximo de veinticinco (25) días corridos, continuos o alternados, en el año calendario. Cuando el Personal Docente Provisional alcance una antigüedad mínima de un año en la docencia, gozará de las Licencias que se determinen en el presente artículo e inciso, en las mismas condiciones que los Docentes Titulares.\r\na.1.3) Personal Suplente: tres (3) días corridos por cada mes de trabajo completo cumplidos en el ciclo lectivo correspondiente hasta un máximo de veinte (20) días corridos por año calendario, computándose el desempeño en el escalafón correspondiente. El Personal Docente Suplente que alcance una antigüedad mínima de un (1) año en la docencia, gozará de las Licencias determinadas en el presente artículo e inciso, en las mismas condiciones que el Personal Titular.'),
(2, '114', 'A.2', 725, 'a.2 Licencia Extraordinaria por Enfermedad: en caso de intervenciones quirúrgicas y/o enfermedades que produzcan incapacidad laboral invalidante por tiempo prolongado, de conformidad con lo determinado por la Junta Médica correspondiente. Esta Licencia se otorgará independientemente de los plazos establecidos en a.1.\r\na.2.1) Personal Titular con menos de cinco (5) años de Antigüedad: hasta setecientos veinticinco (725) días corridos en forma continua o alternada en las siguientes condiciones:\r\na.2.1.1) Los primeros trescientos sesenta y cinco (365) días con goce íntegro de haberes.\r\na.2.1.2) Los ciento ochenta (180) días siguientes con el cincuenta (50) por ciento de haberes.\r\na.2.1.3) Los ciento ochenta (180) días restantes sin goce de haberes.\r\na.2.2) Personal Titular con cinco (5) o más años de Antigüedad: hasta mil noventa y cinco (1095) días corridos en forma continua o alternada en las siguientes condiciones:\r\na.2.2.1) Los primeros trescientos sesenta y cinco (365) días con goce íntegro de haberes.\r\na.2.2.2) Los trescientos sesenta y cinco (365) días siguientes con el cincuenta (50) por ciento de haberes.\r\na.2.2.3) Los trescientos sesenta y cinco (365) días restantes sin goce de haberes.\r\na.2.3) Por el  período completo, sólo se podrá utilizar esta Licencia una vez en la carrera Docente.\r\na.2.4) El personal que antes de cumplir cinco (5) años de antigüedad hubiere agotado el período de setecientos veinticinco (725) días en forma completa, sólo podrá tener acceso a una diferencia de trescientos sesenta (360) días, luego de haber adquirido la antigüedad mínima de los citados cinco años. A dicha cantidad de días se accederá en las siguientes condiciones:\r\na.2.4.1) Los primeros ciento ochenta (180) días con el cincuenta (50) por ciento de haberes.\r\na.2.4.2) Los ciento ochenta (180) días restantes sin goce de haberes.\r\na.2.5)  En caso de que el Personal Docente arribe a la antigüedad de cinco (5) años, mientras se encuentra utilizando la Licencia, podrá continuar y acceder a utilizar un período completo de mil noventa y cinco (1095) días, con la siguiente aclaración para el computo de los días:\r\na.2.5.1) Si se encuentra gozando de los primeros trescientos sesenta y cinco (365) días con goce íntegro, el computo hasta agotar los mil noventa y cinco (1095) días continuará normalmente.\r\na.2.5.2) Si se encuentra gozando de cualquiera de las fracciones de ciento ochenta (180) días (con el 50% o sin goce de haberes) se realizará la siguiente operación:\r\nDG = Días ya utilizados correspondientes a las fracciones de 180 días con el 50% o sin goce de haberes.\r\nTDG = Total de días utilizados con la conversión incluida por la diferencia de períodos.\r\nDEG = Días de Licencia que efectivamente le quedan para utilizar, a partir del día en que adquiera la antigüedad de cinco años.\r\n365 + (DG x 2) = TDG\r\ny luego:  1.095 ? TDG = DEG\r\na.2.6) Personal Provisional: en iguales condiciones que el Personal Titular siempre que su duración no exceda de la décima parte de la antigüedad registrada en la Dirección General de Escuelas y Cultura a la fecha de interposición del pedido.\r\na.2.7) Personal Suplente: no gozará de este beneficio, excepto en los casos en que el Agente sufriera contagio en el lugar de trabajo de enfermedades infecto-contagiosas (sarampión, rubéola, hepatitis, etc.) situación que siempre deberá ser certificada y/o avalada por la Dirección de Reconocimientos Médicos, sus Delegaciones, o Delegaciones de la Dirección General de Escuelas y Cultura.\r\nCada uno de los períodos de esta Licencia será acumulable durante toda la carrera docente a la fecha del cómputo total de la misma, cualquiera sea la situación de revista en que haya sido otorgada. '),
(3, '114', 'A.3', 1095, '  a.3) Licencia por Enfermedad Profesional y Accidente de Trabajo:\r\na.3.1) Personal Titular: toda vez que el Agente adquiera una incapacidad total o parcial, temporaria o permanente por alguna de estas causales, tendrá derecho a Licencia hasta un máximo de mil noventa y cinco (1095) días en forma continua o alternada con goce íntegro de haberes.\r\na.3.2) Personal Provisional o Suplente: en iguales condiciones que el Personal Titular. Si durante el período de Licencia acordado por esta causal se produjere el cese del Agente, este permanecerá percibiendo una compensación equivalente al haber normal que debiera percibir hasta la finalización de dicho período.\r\na.3.3) El Superior Jerárquico del Agente que sufriera un accidente de trabajo deberá realizar la denuncia del mismo ante la Autoridad Policial correspondiente y ante el Consejo Escolar del Distrito, para ser elevada de inmediato con el correspondiente período de Licencia a la Dirección de Personal de la Dirección General de Escuelas y Cultura de la Provincia de Buenos Aires, dentro de los dos (2) días hábiles; además deberá labrar un Acta haciendo constar como ocurrieron los hechos, la que deberá ser firmada por dos (2) testigos, si los hubiere. Con todos estos antecedentes deberá presentarse en la Delegación correspondiente de la Subsecretaría de Trabajo de la Provincia de Buenos Aires, donde se hará el expediente respectivo.\r\na.3.4) Si el accidente ocurriere en el trayecto entre el lugar de trabajo y el domicilio del Agente, el Superior Jerárquico deberá certificar que el mismo tuvo lugar en la ruta usual, sin que esta hubiere sido alterada por interés particular del Docente o por cualquier razón extraña al trabajo.\r\nSi sucediere en el trayecto en un lugar de trabajo a otro, la denuncia deberá ser formulada en el lugar al que se dirija.\r\na.3.5) El Agente que sufre un accidente de trabajo deberá comunicarlo a los Establecimientos a los que presta servicios dentro de los dos (2) días de sucedido.'),
(5, '114', 'B', 2, 'b)      Por Examen Médico Pre-Matrimonial:\r\nb.1) Personal Titular, Provisional y Suplente: se le concederán dos (2) días hábiles con goce de haberes. El Agente que invoque esta causal deberá presentar ante su Superior Jerárquico, el certificado del Organismo Oficial interviniente.'),
(6, '114', 'C', 12, 'c)      Licencia por Matrimonio:\r\n                          c.1) Personal Titular y Provisional: este último mientras dure su situación de revista como tal: Se le concederán doce (12) días hábiles con goce de haberes, a partir de la fecha de celebrado el matrimonio.\r\n                             c.2) Personal Suplente: mientras dure su situación de revista como tal: se le concederán seis (6) días hábiles con goce de haberes a partir de la fecha de celebración del matrimonio.\r\nLa justificación de estas inasistencias, se realizará con la presentación del certificado de matrimonio expedido por Autoridad Competente.'),
(7, '114', 'D.1', 135, '                             d.1) Por Maternidad:\r\nd.1.1) Personal Titular, Provisional y Suplente: El Personal femenino gozará de Licencia por Embarazo y Maternidad, con goce íntegro de haberes, por el término de ciento treinta y cinco (135) días corridos, a partir del séptimo y medio (7½) mes de embarazo lo que se acreditará mediante la presentación del certificado médico. \r\nd.1.2) En los de nacimientos múltiples, y/o prematuros (2,300 Kg. o menos) a partir del séptimo y medio (7½) mes de gestación, se ampliará hasta completar ciento cincuenta (150) días corridos de Licencia.\r\nd.1.3) Cuando se produzcan nacimientos múltiples y/o prematuros entre el sexto (6) mes y el séptimo y medio (7½) mes de gestación, se adicionarán a los ciento cincuenta (150) días de Licencia por Maternidad, tantos días corridos como correspondan al período comprendido entre la fecha de nacimiento y la de cumplimiento del séptimo y medio (7½) mes de gestación.\r\nd.1.4) Si durante el transcurso de la Licencia ocurriere el fallecimiento del hijo, la misma se limitará de la siguiente forma:\r\nd.1.4.1) A cuarenta y cinco (45) días corridos desde la fecha de nacimiento del hijo, cuando el fallecimiento se produjera dentro de ese término.\r\nd.1.4.2) A la fecha de fallecimiento cuando este tenga lugar después de los cuarenta y cinco (45) días corridos del nacimiento.\r\nd.1.4.3) A treinta (30) días corridos cuando se produzca defunción fetal.\r\nd.1.5) Si se produjera Defunción fetal entre el cuarto (4) y séptimo y medio (7½) mes de embarazo, se otorgarán quince (15) días corridos de Licencia, a partir de la fecha de interrupción del embarazo.\r\nd.1.6) Si en el ámbito de trabajo se declararán casos de conocida probabilidad teratogénica (verb. rubéola, hepatitis, sarampión, etc.), existiendo posibilidad de contagio, las Agentes que cursen el primer cuatrimestre de embarazo, se hallarán eximidas de prestar servicios hasta que se disponga con carácter transitorio, su cambio de destino a otro ámbito en el cual no existe dicha situación y mientras persistan los mismos en el lugar de trabajo de origen.\r\nEl Inspector de Enseñanza correspondiente, arbitrará los medios para que el cambio de destino transitorio se opere dentro de los tres (3) días de relevada la Docente.\r\nd.1.7) Las Licencias por Maternidad son obligatorias y la Docente interesada deberá solicitarla o en su defecto serán dispuestas de oficio por la Autoridad Médica, o a pedido del Superior Jerárquico inmediato. En caso de omisión de la solicitud, y siendo ésta de oficio, se le otorgarán los días que restan hasta completar el período pre-parto y luego los noventa (90) días contados a partir del mismo.\r\nd.1.8) Los haberes de la Docente licenciada por Maternidad serán liquidados íntegramente sin interrupción debiéndose presentar la partida de nacimiento dentro de los tres (3) días de expedida la misma.\r\nLas Docentes Provisionales y Suplentes que en uso de Licencia cesen su desempeño continuaran percibiendo sus haberes hasta la finalización del período concedido, con todos sus efectos previsionales y de antigüedad bonificante.\r\nd.1.9) Las Docentes de Educación Física, Danzas y Expresión Corporal y de Educación Especial en estado de gravidez, que deban realizar esfuerzos con los alumnos y que se desempeñen como Titulares Provisionales y/o Suplentes, podrán solicitar un cambio transitorio de función que se extenderá hasta la iniciación de la Licencia reglamentaria por Maternidad, manteniendo la misma obligación horaria de su cargo de origen. Dichas Docentes deberán completar el formulario en uso y adjuntar las certificaciones médica oficial o particular.\r\nEl Superior Jerárquico autorizará en forma inmediata, con intervención de la Inspección de Área, el cambio transitorio de función, ad-referéndum del Acto Administrativo correspondiente. Este cambio se efectivizará conforme lo determinado en el artículo 121 Apartado 3, de esta Reglamentación.\r\nSi se produjere la interrupción del embarazo, durante el cambio transitorio de función, la docente deberá comunicar dentro del plazo de dos (2) días tal situación al Superior Jerárquico, a efectos de que se disponga el reintegro a su destino de origen una vez finalizada la licencia correspondiente.\r\nd.1.10) El Personal Titular, Provisional y Suplente gozará de Licencia por Trastorno de Embarazo o Amenaza de Aborto, por el plazo que determine la Junta Médica dispuesta por la Dirección de Reconocimientos Médicos y/o sus Delegaciones Regionales y/o Delegación de la Dirección General de Escuelas y Cultura, con goce íntegro de haberes.\r\nd.1.11) Una vez finalizada la Licencia por Maternidad, la Docente podrá optar por no reintegrarse a sus tareas durante un período no superior a seis (6) meses, sin percepción de haberes.\r\nd.1.12) En caso de que el hijo fuera discapacitado, la Licencia prevista en el inciso d.1.11) será con goce íntegro de haberes.\r\nd.1.13) Las dos Licencias previstas en los incisos d.1.11) y d.1.12) serán aplicables, en las mismas condiciones, a los casos de Adopción.'),
(8, '114', 'D.2', 90, ' d.2) Por Adopción:\r\nd.2.1) Personal Titular, Provisional y Suplente: Se le otorgará Licencia con goce íntegro de haberes, en caso de adopción de hijos de hasta siete (7) años de edad, al personal femenino durante noventa (90) días corridos, y al masculino durante cinco (5) días, a partir de la fecha de guarda o tenencia con fines de  adopción, otorgada por Autoridad Judicial o Administrativa competente. Si se trata de adopción múltiple, el término para el personal femenino se extenderá a ciento cinco (105) días corridos.\r\nd.2.2) Si durante el transcurso de la Licencia ocurriere el fallecimiento del niño, la misma caducará a la fecha del Deceso.\r\n                        d.3) Personal Titular, Provisional o Suplente: Toda Docente cuya jornada de tareas tenga una duración no menor de seis (6) horas dispondrá de un lapso de una (1) hora diaria, a su elección, para el cuidado y alimentación de su hijo, hasta un máximo de ciento ochenta (180) días corridos a contar desde la fecha del nacimiento.'),
(9, '114', 'E', 5, 'e)      Por Nacimiento de Hijo:\r\n                        e.1) Personal Masculino, Titular, Provisional y Suplente: estos últimos mientras dure su situación de revista como tales: se le concederá cinco (5) días hábiles con goce íntegro de haberes a partir del día del nacimiento.\r\nEl Agente deberá presentar ante su Superior Jerárquico, el Certificado de Nacimiento expedido por Autoridad competente.'),
(10, '114', 'F', 20, 'f)        Por Atención de Familiar Enfermo:\r\nf.1) Personal Titular: se le concederá al Agente hasta un máximo de veinte (20) días corridos, continuos o alternados, por año calendario con goce íntegro de haberes. Esta Licencia podrá ampliarse en treinta (30) días corridos más, sin goce de haberes.\r\nA la solicitud de Licencia se adjuntará una Declaración Jurada del Agente, en la que se especificará:\r\nf.1.1) Que el Agente es el único familiar que puede llenar ese cometido\r\nf.1.2) Que el familiar enfermo no puede valerse por sus propios medios para desarrollar las actividades elementales.\r\nSi el familiar enfermo se hallare internado en un establecimiento asistencial, el Agente tendrá derecho a esta Licencia cuando se haga imprescindible su presencia. Esta situación será constatada por la Autoridad Médica correspondiente.\r\n                        f.2) Personal Provisional: en iguales condiciones que al Personal Titular, siempre que su duración no exceda la décima parte de los servicios prestados en la provisionalidad durante el año calendario en que solicite la Licencia.\r\n                       f.3) Personal Suplente: Gozará de dos (2) días hábiles por año calendario con goce íntegro de haberes.\r\n                       f.4) Para el otorgamiento de estas Licencias, el Agente deberá expresar con carácter de Declaración Jurada, la constitución de su grupo familiar, al tomar posesión del cargo, debiendo hacer saber las modificaciones que se produjeren. Se concederá Licencia al Docente, cuando la solicitud se realice para la atención del cónyuge o cónyuge aparente, y de los padres, hermanos o hijos, convivan o no con él, siempre que no haya otro familiar que pueda atenderlo.\r\nEsta Licencia será certificada por la Dirección de Reconocimientos Médicos, y/o sus Delegaciones Regionales y/o Delegaciones de la Dirección General de Escuelas y Cultura.\r\nEn caso de producirse dos (2) inasistencias consecutivas por esa causal, se computará el período de días hábiles e inhábiles que medie entre ambas.'),
(11, '114', 'G', 1, 'g)      Por Donación de Sangre:\r\n                             g.1) Personal Titular, Provisional o Suplente: se concederá al Agente Licencia con goce íntegro de haberes por Donación de Sangre, el día de la extracción. La justificación de esta inasistencia se realizará con la presentación del Certificado expedido por Autoridad Competente.'),
(12, '114', 'H', 0, 'h)      Por Razones de Profilaxis:\r\n                             h.1) Personal Titular, Provisional y Suplente: La presunción de una enfermedad que por su naturaleza haga procedente el alejamiento del Agente por razones de profilaxis o de seguridad en beneficio propio, de los alumnos, o de las personas con las que comparte sus tareas, facultará a la Autoridad Escolar correspondiente, a disponer el inmediato alejamiento del medio en que desempeña sus funciones, con percepción de haberes.\r\nEl Agente será de inmediato sometido al examen médico y si el dictamen así lo aconsejare, le será impuesta la Licencia que encuadre en esta Reglamentación.\r\nEn caso contrario, será reintegrado de inmediato a sus funciones, no computándosele inasistencias.'),
(13, '114', 'I.1', 1095, '                             i.1) Unidad familiar:\r\ni.1.1) Personal Titular y Provisional, este último mientras dure su situación de revista como tal: Se le otorgará Licencia por razones de unidad familiar, sin goce de haberes por un período de hasta tres (3) años, renovable anualmente, en circunstancias debidamente justificadas, cuando por motivos laborales, algunos de los miembros del núcleo familiar, deba trasladarse a otro Distrito de la Provincia de Buenos Aires, a  la Capital Federal, a la Antártida e Islas del Atlántico Sur, a otras Provincias o al extranjero. Entiéndese por núcleo familiar el constituido por cónyuge y/o conviviente, padres e hijos que convivan habitualmente en hogar común.\r\nEn el caso de que con la Jurisdicción a la que se traslade el Personal, exista Convenio Interjurisdiccional, no podrá solicitarse la presente Licencia, otorgándose el pase correspondiente.\r\ni.1.2) Cuando el motivo del traslado del Personal Docente sea el cumplimiento por parte del miembro del núcleo familiar, de una Misión Oficial, del Estado Nacional, Provincial o Municipal, el período de la Licencia no tendrá límites.\r\ni.1.3) Personal Suplente: no gozará de este beneficio.'),
(14, '114', 'I.2', 730, 'i.2) Familiar a Cargo:\r\ni.2.1) Personal Titular y Provisional, este último mientras dure su situación de revista como tal: Cuando el Docente tenga a su cargo al cónyuge, cónyuge aparente o a parientes directos, que sufran enfermedad que provoquen disminución o impedimento físico y/o psíquico que limite o anule su capacidad para obrar por si mismo, constituyendo el Docente su única compañía, y pudiendo este probar que por dicha situación no puede prestar sus servicios, se otorgará Licencia por cuidado de Familiar a Cargo, sin goce de haberes, hasta un máximo de dos (2) años en toda la carrera docente. Dicha situación deberá ser constatada por Asistente Social, quien además verificará la situación económica del grupo familiar.\r\nEn casos en que las circunstancias lo aconsejen, podrá excepcionalmente concederse esta Licencia, con goce de haberes por el máximo de un (1) año.\r\nCuando la Licencia se otorgara con sueldo y por un lapso superior a dos (2) meses, el Asistente Social deberá verificar mensualmente el mantenimiento de la causal, que origina la Licencia.\r\nLa Subsecretaría de Educación, sobre la base de este informe aconsejará el otorgamiento de la Licencia. En dicho dictamen, se expedirá en los casos en que se planteen, acerca de la posibilidad de la concesión de la misma en las condiciones de excepción previstas.\r\ni.2.2) Personal Suplente: no gozará de este beneficio.\r\n'),
(15, '114', 'J.2', 5, 'j.2) Personal Provisional y Suplente: gozará de la Licencia en las mismas condiciones que el Personal Titular.'),
(16, '114', 'J.1', 5, 'j.1) Personal Titular: Se concederá Licencia con goce de haberes, a partir de la fecha de fallecimiento o del sepelio a criterio del Agente.\r\nj.1.1) Madre, Padre, Cónyuge o Conviviente en aparente Matrimonio, Hijo, Hermano, Nieto: cinco (5) días corridos.\r\nj.1.2) Abuelo, Padrastro, Madrastra, Hijastra, Padres, Hermanos e Hijos Políticos, Bisabuelos y Primos-Hermanos: tres (3) días corridos.\r\nEsta Licencia será ampliada en dos (2) días corridos más cuando a raíz del duelo que afecte al Agente, éste deba trasladarse a un lugar distante, a mas de doscientos (200) kilómetros de su lugar de residencia habitual.\r\nLa justificación de la Licencia se realizará con la presentación del Certificado de Defunción o Aviso Fúnebre.\r\n                                    '),
(17, '114', 'K', 0, 'k)Por Examen Médico por incorporación al Servicio Militar Obligatorio:\r\n                             k.1) Personal Titular, Provisional y Suplente: Estos dos últimos mientras dure su situación de revista como tales: Se concederá esta Licencia con goce íntegro de haberes por el tiempo que sea necesario. La justificación de las inasistencias se realizará con la presentación del certificado médico de las F.F.A.A., el que deberá especificar el lapso que requirió el examen.'),
(18, '114', 'L', 0, 'l)        Por Servicio Militar Obligatorio o incorporación a la reserva de las F.F.A.A.:\r\n                             l.1) Personal Titular, Provisional y Suplente: Estos dos últimos, mientras dure su situación de revista como tales: Se acordará esta Licencia por el término que dure su convocatoria, con goce del cincuenta por ciento (50%) de los haberes.\r\nEl Agente deberá presentar el certificado de la Autoridad Militar correspondiente.\r\n                             l.2) Por incorporación a la reserva de las F.F.A.A.\r\nl.2.1) Personal Titular, Provisional o Suplente: Estos dos últimos mientras dure su situación de revista como tales: Cuando el Agente no perciba haberes, con goce íntegro de haberes; cuando el Agente perciba una suma inferior a la que le corresponde: la diferencia hasta alcanzar ese monto; cuando la suma que perciba el Agente sea superior a la que le corresponde, sin goce de haberes.\r\n                             l.3) Producida la baja, el Agente deberá reanudar sus tareas dentro de los treinta (30) días corridos. Esta circunstancia será probada mediante la presentación del DNI ante la autoridad escolar correspondiente, la que efectuará la respectiva comunicación a la Dirección General de Escuelas y Cultura, a los efectos pertinentes. Si la baja tuviere lugar en períodos de vacaciones, el acto de toma de posesión se realizará ante las Autoridades del Consejo Escolar del Distrito en que se desempeña.'),
(19, '114', 'LL.1.1', 15, 'll) Por Pre-Examen y Examen:\r\n                             ll.1) Personal Titular y Provisional: Este último mientras dure su situación de revista como tal:\r\nll.1.1) Cuando se cursen carreras universitarias o terciarias, de grado o de post-grado, o se realicen cursos en los Institutos Superiores de Formación Docente, se concederán hasta un total de doce (12) días hábiles por año calendario para la preparación de exámenes. No podrán ser utilizados en bloques de más de tres (3) días por examen, y deberán ser acordados en los días inmediatos anteriores a la fecha fijada para los mismos.\r\nAdemás se concederá un (1) día de Licencia por cada día de examen, la que será prorrogada automáticamente cuando la mesa examinadora no se reúna o postergue su cometido.\r\nll.1.2) Cuando se trate de enseñanza secundaria o especializada no comprendida en el punto anterior, hasta un total de seis (6) días hábiles por año calendario, en los días inmediatos anteriores, incluido el día del examen.\r\nll.1.3) Cuando se trate de prácticas docentes obligatorias previstas en los planes de estudios de las Universidades, Institutos Superiores de Formación Docente dependientes de la Dirección General de Escuelas y Cultura, de establecimientos nacionales y privados reconocidos por la Dirección General de Escuelas y Cultura, por todo el período que duren las mismas, siempre que medie superposición horaria en el desempeño en el cargo y/u horas cátedras en que se solicitara la Licencia. El Superior Jerárquico deberá controlar la existencia de la superposición horaria.\r\nll.1.4) En caso de intervención en los Concursos que prescribe el Estatuto del Docente, hasta un total de cinco (5) días hábiles por año calendario para capacitación previa. En caso que el Docente no se presentara a todas las pruebas, las inasistencias en que incurriere serán consideradas injustificadas. El Director del Servicio deberá requerir la presentación del certificado correspondiente.\r\nAsimismo gozará de Licencia el día de cada una de las pruebas.\r\nll.1.5) Cuando se realicen cursos en los Institutos Superiores de Formación Docente dependientes de la Dirección General de Escuelas y Cultura, bajo la modalidad ?no residentes?, se otorgará una Licencia hasta un total de quince (15) días hábiles por año calendario. Este beneficio será acordado en períodos de hasta cinco (5) días hábiles por mes y no más de tres (3) veces en el año calendario.\r\n                             ll.2) Personal Suplente: Se le acordará el día de el examen en los supuestos de los casos ll.1.1) y ll.1.2), y el día de las pruebas de oposición en el supuesto del caso ll.1.4), cuando su desempeño en el ciclo lectivo no sea menor de tres (3) meses.\r\nEn el supuesto del inciso ll.1.3), en iguales condiciones que el Personal Titular y Provisional, siempre que su desempeño en el ciclo lectivo no sea menor de tres (3) meses.\r\n                             ll.3) La justificación de las inasistencias por el inciso ll), se realizará con la presentación del certificado extendido por la autoridad competente, dentro de los quince (15) días posteriores al mismo. Cuando razones justificadas no permitan al Agente rendir examen, y haga hecho uso de la Licencia por pre-examen, esta quedará pendiente de justificación por un plazo de hasta ciento ochenta (180) días corridos, y si en dicho período no acredita haber rendido examen que justifique la Licencia utilizada, se dispondrá el descuento de sus haberes, como si se tratara de inasistencias injustificadas. Para hacerse acreedor de este beneficio, el Agente deberá comunicar tal circunstancia, por nota, al Director del Servicio, quien lo elevará al Consejo Escolar, con las certificaciones que correspondieren.'),
(20, '114', 'M.1', 1, 'm)    Por Citación de Autoridad competente:\r\n                             m.1) Personal Titular, Provisional y Suplente: Estos últimos mientras dure su situación de revista como tal:\r\nm.1.1) En caso que la Autoridad competente de la Dirección General de Escuelas y  Cultura, cite al Agente por asuntos de cualquier naturaleza que lo obliguen a alejarse de su función, se le otorgará Licencia especial con goce íntegro de haberes por el tiempo que sea necesario, teniendo en cuenta la distancia que medie entre el lugar de prestación de servicios y el fijado para su comparencia.'),
(21, '114', 'M.1.1', 0, 'Licencia por citacion gremial a comision de Mad o POF, por el tiempo que indique la licencia con goce integro de haberes.'),
(22, '114', 'M.1.2', 1, 'm.1.2) Por citación de Autoridad Judicial o Administrativa, se le justificarán las inasistencias con goce íntegro de haberes, cuando coincidan con el horario de labor, teniéndose en cuenta la distancia que medie entre el lugar de prestación de servicios y el fijado para su comparecencia.'),
(23, '114', 'A.3', 40, 'n)      Por Vacaciones:\r\n                             n.1) La Licencia anual obligatoria o vacaciones, será remunerada y no acumulable ni compensable por falta de uso. A sus efectos el cómputo de la antigüedad del Agente, se realizará teniendo en cuenta, lo establecido en el artículo 34 del Estatuto del Docente.\r\n                             n.2) El Personal Docente gozará del siguiente régimen de vacaciones: Personal con veinte (20) o más años de antigüedad: cuarenta (40) días corridos.\r\nPersonal con menos de veinte (20) años de antigüedad: treinta (30) días corridos.\r\n                             n.3) Los lapsos comprendidos entre el día de finalización del ciclo lectivo en cada servicio, y, el de iniciación de las correspondientes al siguiente, y el período de vacaciones escolares en la época invernal, se denominarán para el personal docente ?período de receso de la actividad escolar?.\r\n                             n.4) El personal de base de los distintos servicios educativos exceptuado el que se desempeñe en aquellos servicios con continuidad en la prestación efectiva durante el período de receso y vacaciones, gozará de la Licencia anual obligatoria desde el 2 al 31 de enero de cada año, o desde el 2 de enero al 10 de febrero de cada año, de acuerdo con lo establecido en el inciso n.2).\r\nDurante el resto del período de receso de la actividad escolar, el personal de base podrá ser convocado de acuerdo a las necesidades del servicio educativo.\r\n                             n.5) El Personal Jerárquico de los servicios mencionados en el inciso anterior, gozará de su Licencia anual obligatoria durante el período comprendido entre el 2 y el 31 de enero de cada año. El personal con veinte (20) o más años de antigüedad, podrá completar por turnos los cuarenta (40) días, durante el resto del período del receso escolar. Todo el Personal deberá estar en funciones al comenzar las tareas de cada ciclo lectivo.\r\nEn caso de necesidades del servicio educativo, durante el mes de enero, el personal jerárquico deberá atender las mismas, disponiéndose por el Director o responsable del servicio, los turnos correspondientes para completar los períodos de Licencia durante el resto del período del receso escolar.\r\n                             n.6) El Personal Docente no comprendido en los incisos n.4) y n.5), deberá usufructuar su Licencia anual obligatoria, total o parcialmente, durante el período de receso escolar de verano.\r\nEn caso de fraccionarse la misma, el resto del período, que no podrá exceder de diez (10) días corridos, se concederá de conformidad con el Superior Jerárquico, cuidando de no entorpecer la normal prestación del servicio educativo, ni las tareas del organismo en el que el Agente preste servicios.\r\n                             n.7) Para aquellos docentes, cualquiera sea su situación de revista, cuya actividad fuera mayor de tres (3) meses y menor de doce (12) meses, la determinación de los haberes por el período de vacaciones se efectuará de conformidad con la siguiente escala, considerándose en el cómputo total de la actividad, como mes completo, la fracción de quince (15) o más días, y desestimándose si fuera menor:\r\n \r\nPersonal hasta 19 Años de Antigüedad:\r\nActividad al 31 de Diciembre                                      Compensación\r\n  3 meses                                                                                              6 días\r\n  4 meses                                                                                              9 días\r\n  5 meses                                                                                            12 días\r\n  6 meses                                                                                            15 días\r\n  7 meses                                                                                            18 días\r\n  8 meses                                                                                            21 días\r\n  9 meses                                                                                            24 días\r\n10 meses                                                                                            27 días\r\n11 meses                                                                                            30 días\r\n \r\nPersonal con 20 o más Años de Antigüedad:\r\nActividad al 31 de Diciembre                                      Compensación\r\n  3 meses                                                                                              8 días\r\n  4 meses                                                                                            12 días\r\n  5 meses                                                                                            16 días\r\n  6 meses                                                                                            20 días\r\n  7 meses                                                                                            24 días\r\n  8 meses                                                                                            28 días\r\n  9 meses                                                                                            32 días\r\n10 meses                                                                                            36 días\r\n11 meses                                                                                            40 días\r\n \r\nLos expuesto en el presente inciso, es sin perjuicio de lo previsto en el artículo 113 del Reglamento en referencia a la liquidación del período de vacaciones y receso para el Personal Provisional y Suplente que hubiere cesado antes de la finalización del ciclo escolar.'),
(24, '114', 'Ñ', 180, ' ñ) Por Donación de Órganos o Piel:\r\nPersonal Titular, Provisional o Suplente: Estos dos últimos mientras dure su situación de revista como tales:\r\n                             ñ.1) Se les concederá de dos (2) a ciento ochenta (180) día corridos, con goce íntegro de haberes, según lo prescripto por la Junta Médica interviniente.\r\n                             ñ.2) Para el uso de esta Licencia el Agente deberá adjuntar a la solicitud:\r\nñ.2.1) Por Donación de Piel: La certificación médica donde se indique la necesidad del acto.\r\nñ.2.2) Por Donación de Órganos: La certificación de la Autoridad Nacional, Provincial o Internacional respectiva.\r\n '),
(25, '114', 'O.1', 0, 'o)      Por Causas Particulares:\r\n                             o.1) Personal Titular y Provisional: El Docente tendrá derecho a una Licencia sin sueldo, cuya duración no podrá exceder de veinticuatro (24) meses, que se graduará según la antigüedad total, conforme a lo establecido en el artículo 34 del Estatuto del Docente; de acuerdo con la siguiente escala:\r\n \r\nAños de antigüedad cumplidos                                                Hasta\r\n5                                                                                                        6 meses\r\n10                                                                                                      12 meses\r\n15                                                                                                      18 meses\r\n20                                                                                                      24 meses\r\n                            \r\n                             o.2) El Personal Suplente no gozará de este beneficio.\r\n                             o.3) La Licencia prevista en el inciso o.1) no podrá fraccionarse para su uso.\r\nPodrá ser solicitada parcialmente o en la totalidad de cargos u horas cátedra.\r\nSólo podrá ser utilizada una vez en la carrera docente.\r\nEsta Licencia incidirá proporcionalmente en la percepción de los haberes de las vacaciones.\r\nCuando el Agente hubiere faltado al desempeño de sus funciones hasta finalizar el ciclo escolar, por esta causal, y continué inasistiendo por la misma al iniciarse el inmediato posterior, la Licencia se considerará interrumpida a los efectos de los términos y sueldos que determine esta Reglamentación.'),
(26, '114', 'O.4', 1, ' o.4) Por Motivos de Índole Particular: Personal Titular y Provisional, gozarán de un (1) día de Licencia por mes calendario y hasta un máximo de seis (6) por año, sin goce de haberes.'),
(27, '114', 'P', 0, 'p)      Disposiciones Comunes:\r\n                             p.1) En el caso de las Licencias establecidas en los incisos a) con exclusión de lo previsto en el sub-inciso a.3.2), b), c), f), g) y ll), el Personal Docente Provisional gozará de dichas Licencias, en las condiciones y con los límites allí establecidos, hasta un máximo acumulado de treinta (30) días corridos, continuos o alternados en el año calendario, salvo que hayan alcanzado una antigüedad mínima de un (1) año en la docencia, en cuyo caso no se aplicará dicho tope, estándose a lo previsto particularmente en cada inciso.\r\nEn el caso del Personal Docente Suplente, y con referencia a los incisos a.1), b), c), f), g), y ll), gozará de dichas Licencias en las condiciones y con los límites allí establecidos, hasta un máximo acumulado de tres (3) días hábiles por mes de servicio efectivamente prestado en el año calendario, salvo que hayan alcanzado una antigüedad mínima de un (1) año en la docencia, en cuyo caso gozará de las Licencias citadas en dichos incisos en las mismas condiciones que el personal titular.\r\n                             p.2) Todas las Licencias que el Agente hubiere usufructuado con anterioridad a esta Reglamentación, serán computadas a los efectos de los términos establecidos.'),
(28, '114', 'A.1', 0, 'a)      Por Estudio o Perfeccionamiento Docente:\r\na.1) Cuando el Agente deba realizar estudios especiales o investigaciones que resulten de interés para la Dirección General de Escuelas y Cultura, en el país o en el extranjero, podrá solicitar Licencia sin goce de haberes por el término que duren los mismos.\r\nPrevio al dictamen del Consejo General de Educación  y Cultura, el pedido de Licencia podrá ser concedido por el Director General de Escuelas y Cultura.\r\nPara que esta Licencia pueda ser acordada, el solicitante deberá acreditar una antigüedad mínima de tres (3) años en la docencia oficial de la Provincia de Buenos Aires.\r\nAl finalizar la Licencia, el Agente deberá presentar un informe acerca de los estudios  e investigaciones realizadas.'),
(29, '115', 'A.2', 0, 'a)      Por Estudio o Perfeccionamiento Docente:\r\n                            \r\n                             a.2) Por interés particular, cuando el Agente concurra a Congresos, cursos, jornadas de perfeccionamiento docente, se le concederá Licencia sin goce de haberes hasta seis (6) días hábiles por año. Para justificar la Licencia, deberá presentar la constancia de asistencia.'),
(30, '115', 'B.1', 0, 'b)      Por Representación Gremial:\r\n                        b.1) La Licencia Gremial será concedida de acuerdo a lo que determinen las Leyes Nacionales vigentes.'),
(31, '115', 'B.2', 1, '  b.2) A los Docentes Delegados en el Establecimiento de Organizaciones Gremiales con Personería Gremial, se les otorgará un (1) día de Licencia por mes calendario en el establecimiento en que presten servicios, con goce de haberes, para asistir a reuniones de carácter gremial. A tal efecto, la Organización Gremial comunicará a la Dirección del Establecimiento la nómina de los delegados.'),
(32, '115', 'B.3', 0, 'b.3) Cuando las Organizaciones Gremiales mencionadas en el párrafo anterior, convoquen a Asambleas y/o Congresos de carácter ordinario o extraordinario, los delegados a esos organismos podrán solicitar Licencia por los días que dure el mismo, la que se concederá en su caso, con goce de haberes.'),
(33, '115', 'B.4', 0, 'b.4) Las organizaciones mencionadas en el inciso anterior, deberán presentar ante la Dirección General de Escuelas y Cultura, la nómina completa de los miembros de la conducción del Gremio y de los delegados docentes, una vez celebrados los Actos Eleccionarios respectivos, mediante documentación que acredite las designaciones, de acuerdo a las normas fijadas por la autoridad con competencia laboral. Asimismo, comunicará toda modificación que se produzca  en dicha nómina.\r\n '),
(34, '115', 'C', 0, ' c)Por Actividad de Interés Público o del Estado:\r\nSe concederá Licencia cuando el Docente deba cumplir actividades culturales, académicas o diplomáticas, o realizar estudios, investigaciones, trabajos científicos, técnicos o participar en conferencias o congresos en el país o en el extranjero, declarados de interés público o del Estado, o cuando concurra a los mismos investido de la representación oficial del Organismo.\r\nEsta Licencia podrá ser concedida con o sin sueldo, de acuerdo a las particularidades del caso.\r\nAl efecto de la concesión, dictaminará la Sub-Secretaría de Educación, la que se expedirá sobre sí la actividad a realizar puede ser considerada de interés público o del Estado.\r\nAl término de las actividades y de la Licencia, el Agente deberá presentar ante dicha Sub-Secretaría, un informe acerca delos trabajos realizados.'),
(35, '115', 'D.1', 0, 'd.1) Por Desempeño de Cargos de Mayor Jerarquía.Se concederá Licencia sin goce de haberes para desempeñar cargos de mayor jerarquía escalafonaria, en el sistema educativo de la Provincia de Buenos Aires o en otras jurisdicciones y mientras dure tal desempeño, siempre que las mismas no gocen de estabilidad.\r\nSe considerará Cargo de Mayor Jerarquía en relación al que se desempeña, el correspondiente a un ítem de superior grado jerárquico en el mismo escalafón o en escalafones diferentes.\r\nEn caso de que se trate de cargos en otras jurisdicciones, será facultad de la Dirección General de Escuelas y Cultura, interpretar y resolver en cada caso concreto a efectos de determinar si se trata de mayor jerarquía.'),
(36, '115', 'E.1', 0, 'e.1) Por el desempeño de cargos electivos, con excepción del cargo de Consejero Escolar conforme a lo previsto por el artículo 10 de la Ley 10589, se concederá Licencia sin goce de haberes por el término del mandato.'),
(37, '115', 'E.2', 0, '  e.2) Se concederá Licencia sin goce de haberes a quienes resulten electos para ocupar cargos de conducción en los partidos políticos reconocidos en jurisdicción Nacional o Provincial.'),
(38, '115', 'E.3', 0, 'e.3) Se concederá Licencia sin goce de haberes por el término del desempeño y siempre que se trate de cargos sin estabilidad, cuya designación dependa de un funcionario político.'),
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
(9, 25108642, '12-01-2018', '0', 39, 25, 0);

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
(16, 'EL JAGÜEL'),
(17, 'SAN VICENTE'),
(18, 'ALEJANDRO KORN'),
(19, 'CAPITAL FEDERAL'),
(20, 'LAVALLOL'),
(21, 'MINISTRO RIVADAVIA'),
(22, 'DON ORIONE'),
(23, 'TEMPERLEY'),
(24, 'FLORENCIO VARELA'),
(25, 'BRANDSEN');

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
(250, NULL, NULL, '(edi)DISEÑO Y GESTION DE PROYECTOS', 22, 1, 'C', NULL),
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
(57, 237, 23618812, NULL, 6, 0, 0, 0, 2, 2),
(58, 237, 23618812, NULL, 6, 0, 23618812, 0, 2, 2),
(59, 237, 28054020, NULL, 6, 0, 23618812, 1, 2, 2),
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
(74, 223, 22605223, NULL, 4, 0, 0, 1, 24, 1),
(75, 223, 22605223, NULL, 16, 0, 0, 1, 24, 1),
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
(92, 232, 30480423, NULL, 5, 0, 0, 1, 24, 1),
(93, 237, 8447313, NULL, 6, 0, 0, 1, 24, 3),
(94, 234, 14675858, NULL, 6, 0, 0, 1, 24, 1),
(95, 235, 17731780, NULL, 6, 0, 0, 1, 24, 1),
(96, 240, 23618812, NULL, 6, 0, 0, 0, 24, 1),
(97, 240, 28054020, NULL, 6, 0, 23618812, 1, 24, 1),
(98, 238, 30480423, NULL, 6, 0, 0, 1, 24, 1),
(99, 239, 25401466, NULL, 6, 0, 0, 1, 24, 1),
(100, 193, 17731780, NULL, 1, 0, 0, 1, 24, 1),
(101, 195, 16713869, NULL, 1, 0, 0, 1, 24, 1);

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
(61, 57, 23618812, '4/12/2017', '', 1, 0, '04-12-2017 05:42:28am'),
(62, 58, 23618812, '4/12/2017', '', 3, 0, '04-12-2017 05:42:52am'),
(63, 59, 28054020, '4/12/2017', '', 3, 0, '04-12-2017 05:43:22am'),
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
(92, 92, 30480423, '13/12/2017', '', 1, 0, '13-12-2017 08:52:36pm'),
(93, 93, 8447313, '13/12/2017', '', 1, 0, '13-12-2017 08:55:47pm'),
(94, 94, 14675858, '13/12/2017', '', 2, 0, '13-12-2017 08:56:42pm'),
(95, 95, 17731780, '13/12/2017', '', 2, 0, '13-12-2017 08:56:54pm'),
(96, 96, 23618812, '13/12/2017', '', 2, 0, '13-12-2017 08:57:29pm'),
(97, 97, 28054020, '01/09/2017', '.28/02/2018.', 3, 0, '13-12-2017 08:58:09pm'),
(98, 98, 30480423, '13/12/2017', '', 2, 0, '13-12-2017 08:58:48pm'),
(99, 99, 25401466, '13/12/2017', '', 2, 0, '13-12-2017 09:01:10pm'),
(100, 100, 17731780, '13/12/2017', '', 2, 0, '13-12-2017 09:02:48pm'),
(101, 101, 16713869, '13/12/2017', '', 2, 0, '13-12-2017 09:03:14pm');

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
  `persona_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`dni`, `legajo`, `apellido`, `nombre`, `genero`, `domicilio`, `localidad`, `telefono`, `celular`, `usuario_id`, `fecha_nac`, `fecha_ing_escuela`, `fecha_ing_doc`, `idcarga`, `email`, `persona_tipo`) VALUES
(8385543, 0, 'CICCHITTI', 'MARIO OSCAR', 1, 'CALLE 102 N 447', 12, '02224471256', '', 0, '02/07/1950', '', '', 25, '', NULL),
(8447313, 0, 'BOUCHE', 'CARLOS', 1, '', 13, '', '1140884388', 0, '25/07/1950', '', '', 24, '', NULL),
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
(17488557, 0, 'FERNANDEZ', 'CLARA', 1, '', 13, '', '2224497735', 0, '13/07/1965', '', '', 24, '', NULL),
(17505835, 0, 'ALBERTINI', 'ROBERTO DANIEL', 1, 'DEAN FUNES 132', 13, '', '1161659645', 0, '12/11/1965', '', '', 25, '', NULL),
(17589694, 0, 'RODRIGUEZ', 'ANA MARIA', 2, 'LUIS MARIA DRAGO 326', 18, '02224422885', '', 0, '31/12/1967', '', '', 25, '', NULL),
(17731780, 0, 'GELSI', 'FABIO ALEJANDRO', 1, '', 13, '', '0222415542498', 0, '21/09/1968', '', '', 25, '', NULL),
(17917901, 0, 'ALOE', 'ANTONIO RAMON', 1, 'ARISTOBULO DEL VALLE 238', 1, '02224424680', '1169468045', 0, '11/09/1966', '', '', 24, 'elprofea@gmail.com', NULL),
(20215050, 0, 'MARQUEZ', 'NORBERTO RUBEN', 1, '', 13, '', '0222415500852', 0, '31/05/1969', '', '', 25, '', NULL),
(21138851, 0, 'CARBONE', 'JAVIER SALVADOR', 1, '20 DE JUNIO 251', 17, '', '1137256960', 0, '11/12/1969', '', '', 25, '', NULL),
(22143273, 0, 'MORE', 'SANDRA', 1, 'ANTARTIDA ARGENTINA 2932', 12, '2224470452', '', 0, '25/05/1971', '', '', 25, '', NULL),
(22433592, 0, 'MERLICCO', 'MARCOS DARIO', 1, 'HONDURAS 267', 18, '', '1133030400', 0, '29/10/1971', '', '', 25, '', NULL),
(22605223, 0, 'BROGGIA', 'LEONARDO', 1, 'RACCONE 652', 18, '02225425600', '0222415466535', 0, '07/07/1972', '', '', 25, '', NULL),
(22718772, 0, 'CAIRO', 'MARIA FERNANDA', 2, 'MIGUEL FAUSTO ROCA 421', 4, '42995708', '1156121135', 0, '20/11/1972', '', '', 25, '', NULL),
(22980123, 0, 'SEGURA', 'EMILIANO', 1, '', 13, '', '1157801377', 0, '', '', '', 25, '', NULL),
(23618812, 0, 'ALOE', 'ADAN FRANCISCO', 1, 'FRENCH 872', 17, '', '1141901523', 24, '17/11/1973', '01/03/2004', '', 24, 'adanfrancisco@gmail.com', NULL),
(24935808, 0, 'LOPEZ', 'ROBERTO ALEJANDRO', 1, 'REPUBLICA ARGENTINA 853', 12, '', '1162107827', 0, '19/08/1961', '', '', 25, '', NULL),
(24966953, 0, 'VILTE', 'PAMELA DE LOS SANTOS', 2, 'CASTELLI 1653', 17, '', '0222415543270', 0, '16/10/1975', '', '', 25, '', NULL),
(25108642, 0, 'MACHUCA', 'OSCAR', 1, '9 DE JULIO 673', 17, '02225484693', '0222415464510', 0, '04/04/1976', '', '', 25, '', NULL),
(25152732, 0, 'PALMIERI', 'LEONARDO FEDERICO', 1, 'TIEGHI 1459', 3, '20740409', '1140362043', 0, '04/05/1976', '', '', 25, '', NULL),
(25258172, 0, 'OVIEDO', 'MANUEL ARMANDO', 1, '', 13, '', '', 0, '10/06/1976', '', '', 25, '', NULL),
(25401466, 0, 'CARDENAS', 'JAVIER', 1, '', 13, '', '1136875319', 0, '10/07/1971', '', '', 24, '', NULL),
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
(31022299, 0, 'ESPINOLA', 'ALEJANDRA NOEMI', 2, '', 13, '', '2224493295', 0, '23/07/1985', '', '', 24, '', NULL),
(31721353, 0, 'DEL BONO', 'GASTON', 1, 'SEGUI 311', 18, '', '', 0, '21/07/1985', '', '', 25, '', NULL);

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
(9, 23618812, 'DIJO QUE LLEGA TARDE', '09-01-2018', 24, '2018-01-09 23:52:13'),
(10, 23618812, 'ALGO 1', '09-01-2018', 24, '2018-01-10 04:03:31'),
(11, 23618812, 'ALGO 2', '09-01-2018', 24, '2018-01-10 04:03:37'),
(12, 23618812, 'HOY LLEGA A LAS 19', '10-01-2018', 24, '2018-01-11 04:01:02'),
(13, 23618812, '', '10-01-2018', 24, '2018-01-11 05:18:21'),
(14, 23618812, '', '10-01-2018', 24, '2018-01-11 05:23:06'),
(15, 23618812, '', '10-01-2018', 24, '2018-01-11 05:25:01'),
(16, 23618812, '', '10-01-2018', 24, '2018-01-11 05:25:25'),
(17, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 06:18:49'),
(18, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 06:20:01'),
(19, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 06:20:43'),
(20, 23618812, 'D', '11-01-2018', 24, '2018-01-11 06:23:18'),
(21, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 06:24:04'),
(22, 23618812, 'S', '11-01-2018', 24, '2018-01-11 06:25:34'),
(23, 23618812, 'D', '11-01-2018', 24, '2018-01-11 06:28:00'),
(24, 23618812, 'S', '11-01-2018', 24, '2018-01-11 06:29:06'),
(25, 23618812, 'AFGAG', '11-01-2018', 24, '2018-01-11 06:33:13'),
(26, 23618812, 'POP', '11-01-2018', 24, '2018-01-11 19:26:45'),
(27, 23618812, 'POP', '11-01-2018', 24, '2018-01-11 19:26:45'),
(28, 23618812, 'POP', '11-01-2018', 24, '2018-01-11 19:26:45'),
(29, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 19:28:20'),
(30, 23618812, 'S', '11-01-2018', 24, '2018-01-11 19:31:30'),
(31, 23618812, 'DD', '11-01-2018', 24, '2018-01-11 19:32:24'),
(32, 23618812, 'SSS', '11-01-2018', 24, '2018-01-11 19:43:50'),
(33, 23618812, 'K;HFKHFSJ', '11-01-2018', 24, '2018-01-11 19:45:50'),
(34, 25108642, 'LLEGA A LAS 19', '13-01-2018', 25, '2018-01-13 02:24:58'),
(35, 25108642, 'LLEGA A LAS 19', '13-01-2018', 25, '2018-01-13 02:25:34');

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
('adanaloe', '6dcea6e17f24236d7d0579c5871fd5d2', 24, 1, ''),
('cacho', '6dcea6e17f24236d7d0579c5871fd5d2', 25, 4, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`dni`);

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
  ADD PRIMARY KEY (`idnovedad`);

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
  MODIFY `idinasistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `idlocalidad` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_materia` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;
--
-- AUTO_INCREMENT de la tabla `mat_pro`
--
ALTER TABLE `mat_pro`
  MODIFY `id_matpro` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT de la tabla `mat_pro_novedades`
--
ALTER TABLE `mat_pro_novedades`
  MODIFY `id_matpro_novedades` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
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
  MODIFY `idnovedad` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
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
  MODIFY `usuario_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
