-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2026 a las 18:53:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_web`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `Nombre`, `Correo`, `Telefono`, `Fecha`) VALUES
(1, 'jeffrey', 'jeffrey02beltre@hotmail.com', '8094785054', '2026-03-25 04:00:00'),
(2, 'alberto', 'alberto@hotmail.com', '8094448889', '2026-03-25 04:00:00'),
(3, 'mario', 'mario@hotmail.com', '8095558888', '2026-03-25 04:00:00'),
(5, 'mario', 'assassasasaa@hotmail.com', '8094448889', '2026-03-25 04:00:00'),
(8, 'jeffrey', 'asasas@hotmail.com', '8094448889', '2026-03-25 04:00:00'),
(9, 'antonio', 'antonio@hotmail.com', '56565656565', '2026-03-25 04:00:00'),
(10, 'joel', 'joel@hotmail.com', '56565656565', '2026-03-25 04:00:00'),
(11, 'maria', 'maria@hotmail.com', '564545487', '2026-03-25 04:00:00'),
(12, 'jose', 'jose@hotmail.com', '959595955', '2026-03-25 04:00:00'),
(13, 'joselito', 'joselito@hotmail.com', '4545754189', '2026-03-25 04:00:00'),
(14, 'jeffrey', 'joselitosd@hotmail.com', '48574848', '2026-03-25 04:00:00'),
(15, 'alfredo', 'alfredo@hotmail.com', '48948444', '2026-03-25 04:00:00'),
(16, 'jose', 'jose555@hotmail.com', '5565656556', '2026-03-25 04:00:00'),
(17, 'jeffrey', 'mamamola@hotmail.com', '51515151', '2026-03-25 04:00:00'),
(18, 'alenadro', 'alendro@hotmail.com', '448484848484', '2026-04-01 04:00:00'),
(19, 'marino', 'marino@hotmail.com', '888888888', '2026-03-25 04:00:00'),
(20, 'jeffffff', 'omario@hotmail.com', '565656565', '2026-03-25 04:00:00'),
(21, 'joselitooo', 'jkoseli@hotmail.com', '666666666', '2026-03-25 04:00:00'),
(22, 'ashley', 'ashley@hotmail.com', '56565656565', '2026-03-25 04:00:00'),
(23, 'mario', 'marioss@hotmail.com', '56565656565', '2026-03-25 04:00:00'),
(24, 'jefikjfe', 'jeffffff@hotmail.com', '65959598', '2026-03-25 04:00:00'),
(25, 'jefffff', 'jefefre@hotmail.com', '5659848995', '2026-03-25 04:00:00'),
(26, 'rosario', 'rosario@hotmail.com', '56565656565', '2026-03-25 04:00:00'),
(27, 'edwin', 'edwin@hotmail.com', '565656556', '2026-03-25 04:00:00'),
(28, 'amacio', 'macio@hotmail.com', '565656565656', '2026-03-25 04:00:00'),
(29, 'ewrere', 'ererer@hotmail.com', '454545454545', '2026-03-25 04:00:00'),
(30, 'jeirjeirj', 'ijerijer@hotmail.com', '656565656565', '2026-03-25 04:00:00'),
(31, 'werwewew', 'wewew@hotmail.com', '85459459', '2026-03-25 04:00:00'),
(32, 'sasawas', 'wewdfg@hotmail.com', '9595959595', '2026-03-12 04:00:00'),
(33, 'asas', 'wewewd@hotmail.com', '5959584959', '2026-03-10 04:00:00'),
(34, 'menta', 'mentalistica@hotmail.com', '959848899', '2026-03-03 04:00:00'),
(35, 'mentolsitostico', 'ameroimd@hotmail.com', '959879449', '2026-03-19 04:00:00'),
(36, 'asasasaewef', 'adwffw@hotmail.com', '95989898', '2026-03-24 04:00:00'),
(37, 'analusi', 'anaslisoa@hotmail.com', '9859898988', '2026-03-25 04:00:00'),
(38, 'ROKOW', 'WOEROR@hotmail.com', '95959889', '2026-03-25 04:00:00'),
(39, 'jeffrey', 'owkoek@hotmail.com', '959898959', '2026-03-25 04:00:00'),
(40, 'jeffrey', 'asasasaw@hotmail.com', '894848949', '2026-03-25 04:00:00'),
(41, 'ieirije', 'oermmb@hotmail.com', '959595958', '2026-03-25 04:00:00'),
(42, 'EFRAIN', 'efarain@hotmail.com', '5959595955', '2026-03-24 04:00:00'),
(43, 'jeffrey', 'sdsdsdsddwe@hotmail.com', '95959859', '2026-03-06 04:00:00'),
(44, 'jeovanis', 'jev@hotmail.com', '959858229', '2026-03-29 04:00:00'),
(45, 'marilu', 'mariulu@hotmail.com', '809595959', '2026-03-25 04:00:00'),
(46, 'maunel', 'manuel@hotmail.com', '809595959', '2026-03-22 04:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
