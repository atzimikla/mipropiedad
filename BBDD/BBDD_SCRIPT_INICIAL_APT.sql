-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-08-2019 a las 10:47:22
-- Versión del servidor: 5.6.41-84.1
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `andresfm_apt`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(11) NOT NULL,
  `contrasena` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ini` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ultima_visita` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `nombre`, `usuario`, `correo`, `tipo`, `contrasena`, `fecha_ini`, `ultima_visita`) VALUES
(10, 'Andres Moreno', 'andresm', 'andres@webafm.com', 1, '5f5bcc2dc23e7edddc5ca36074fb6abb1295ddfe', '12/07/2013', '16/07/2013');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificio`
--

CREATE TABLE `edificio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nit` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `locales` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `admin_val` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `interes` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nom_admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tel_admin` varchar(20) NOT NULL,
  `cel_admin` varchar(20) NOT NULL,
  `area_total` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `val_total` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `consecutivo` int(11) NOT NULL,
  `admin_id` int(6) NOT NULL,
  `liquidacion` int(1) NOT NULL,
  `fecha_mod` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `edificio`
--

INSERT INTO `edificio` (`id`, `nombre`, `direccion`, `logo`, `nit`, `telefono`, `locales`, `admin_val`, `interes`, `nom_admin`, `tel_admin`, `cel_admin`, `area_total`, `val_total`, `consecutivo`, `admin_id`, `liquidacion`, `fecha_mod`) VALUES
(1, 'Casa del exito', 'Calle 48 C # 65 A - 59', 'logo.png', '000000-0', '00000000', '15', '75000', '16', 'xxxxx xxxxx xxxxx', '000-00-00', '000-000-00-00', '0', '0', 53566, 10, 1, '2019-08-22 10:37:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `propietario_id` int(6) NOT NULL,
  `valor` int(10) NOT NULL,
  `vencida` int(1) NOT NULL DEFAULT '0',
  `factura` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`id`, `fecha`, `propietario_id`, `valor`, `vencida`, `factura`) VALUES
(35, '2017-02-20', 1, 75000, 0, '53541'),
(36, '2017-02-20', 2, 75000, 0, '53542'),
(37, '2017-02-20', 5, 75000, 0, '53543'),
(38, '2017-03-20', 1, 75000, 0, '53544'),
(39, '2017-03-20', 2, 75000, 0, '53545'),
(40, '2017-03-20', 5, 75000, 0, '53546'),
(41, '2017-04-20', 1, 75000, 0, '53547'),
(42, '2017-04-20', 2, 75000, 0, '53548'),
(43, '2017-04-20', 5, 75000, 0, '53549'),
(44, '2017-05-20', 1, 75000, 0, '53550'),
(45, '2017-05-20', 2, 75000, 0, '53551'),
(46, '2017-05-20', 5, 75000, 0, '53552'),
(47, '2017-06-20', 1, 75000, 0, '53553'),
(48, '2017-06-20', 2, 75000, 0, '53554'),
(49, '2017-06-20', 5, 75000, 0, '53555'),
(50, '2017-07-20', 1, 75000, 0, '53556'),
(51, '2017-07-20', 2, 75000, 0, '53557'),
(52, '2017-07-20', 5, 75000, 0, '53558'),
(53, '2017-08-20', 1, 75000, 0, '53559'),
(54, '2017-08-20', 2, 75000, 0, '53560'),
(55, '2017-08-20', 5, 75000, 0, '53561'),
(56, '2017-08-20', 6, 75000, 0, '53562'),
(57, '2017-09-20', 1, 75000, 0, '53563'),
(58, '2017-09-20', 2, 75000, 0, '53564'),
(59, '2017-09-20', 5, 75000, 0, '53565'),
(60, '2017-09-20', 6, 75000, 0, '53566');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meses_facturados`
--

CREATE TABLE `meses_facturados` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `indicador` varchar(20) NOT NULL,
  `edificio_id` int(10) NOT NULL,
  `impresa` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `meses_facturados`
--

INSERT INTO `meses_facturados` (`id`, `fecha`, `indicador`, `edificio_id`, `impresa`) VALUES
(1, '2017-01-20', '', 1, 0),
(31, '2017-02-20', '', 1, 0),
(32, '2017-03-20', '', 1, 1),
(33, '2017-04-20', '', 1, 0),
(34, '2017-05-20', '', 1, 1),
(35, '2017-06-20', '', 1, 0),
(36, '2017-07-20', '', 1, 0),
(37, '2017-08-20', '', 1, 0),
(38, '2017-09-20', '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `propietario_id` int(11) NOT NULL,
  `abono` varchar(15) NOT NULL,
  `fecha_ini` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `propietario_id`, `abono`, `fecha_ini`) VALUES
(2, 1, '350000', '2013-04-03 12:00:00'),
(3, 1, '90000', '2013-04-06 01:15:00'),
(4, 4, '45000', '2017-04-19 11:03:00'),
(5, 2, '250000', '0000-00-00 00:00:00'),
(6, 5, '230000', '2019-08-23 15:08:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cedula` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(90) NOT NULL,
  `send` int(1) NOT NULL DEFAULT '0',
  `area` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `indicador` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ini` datetime NOT NULL,
  `fecha_mod` datetime NOT NULL,
  `edificio_id` int(10) NOT NULL,
  `autor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`id`, `nombre`, `apellido`, `cedula`, `direccion`, `telefono`, `celular`, `correo`, `clave`, `send`, `area`, `indicador`, `fecha_ini`, `fecha_mod`, `edificio_id`, `autor`) VALUES
(1, 'Marta Cecilia', 'Betancur Z', '32528468', 'cr 83 15 - 38', '2304522', '311-386', 'marta@webafm.com', '', 0, '30', '203', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 10),
(2, 'Estella', 'Betancur', '000 00 00', 'Calle 00 # 00 - 00', '000 00 00', '000 000 00 00', 'xxxx@xxxx.xx', '', 0, '105', '403', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 10),
(4, 'Andres', 'Moreno', '1039446353', 'Cr 83 ', '3412282', '3013358414', 'andres@webafm.com', '123', 0, '67', '209', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 10),
(5, 'Karen a', 'Ramirez ', '52198', '91 a 2', '30155', '312058', 'karen@correo.com', '52198', 0, '89', '209', '2017-04-19 22:04:30', '2017-04-19 22:04:52', 1, 10),
(6, 'DIEGO ALEJANDRO', 'ORREGO', '00000000', 'SABANETA', '3010000', '30100000', 'diego@gmail.com', '70352f41061eda4ff3c322094af068ba70c3b38b', 0, '70', '2803', '2019-08-22 10:08:37', '2019-08-22 10:08:42', 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldo`
--

CREATE TABLE `saldo` (
  `id` int(11) NOT NULL,
  `propietario_id` int(10) NOT NULL,
  `valor` varchar(10) NOT NULL,
  `interes` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saldo`
--

INSERT INTO `saldo` (`id`, `propietario_id`, `valor`, `interes`) VALUES
(3, 5, '350000', '35000'),
(4, 6, '20000', '10000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `perfil` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `categoria` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ref` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `razon_social` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre_comercial` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `num_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre_contacto` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `movil` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `skype` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dir_facturacion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dir_envio` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `departamento` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `pais` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ini` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_mod` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `perfil`, `categoria`, `ref`, `tipo`, `razon_social`, `nombre_comercial`, `num_id`, `tipo_id`, `observaciones`, `correo`, `foto`, `url`, `nombre_contacto`, `tel`, `movil`, `fax`, `skype`, `dir_facturacion`, `dir_envio`, `ciudad`, `departamento`, `pais`, `zip`, `fecha_ini`, `fecha_mod`) VALUES
(1, 'cliente', '', 'CI-0001', 'Persona Juridica', 'AFM ', 'AFM Tecnología a su medida-', '32528468', 'Nit', '       cualquiera       ', 'webafm@gmail.com', '91tg+N301sL._SL1500_.jpg', 'webafm.com', 'Andrés Felipe Moreno', '3412282', '3013358414', '', '', 'Calle 48C # 65A - 59', 'Cr 83 # 15 - 38', 'Medellín', 'Antioquia+', '', '574', '18/09/2013', '19/09/2013'),
(2, 'proveedor', '', 'RE220', 'Persona Juridica', 'Aristgom', 'Aristgom', '1111', 'NIT', '', 'marta@webafm.com', '', 'aristgom.com', 'Andrés Giraldo', '555 55 55', '301 555 55 55', '', '', '', '', 'Medellín', 'Antioquia', '', '', '22/09/2013', '22/09/2013');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `edificio`
--
ALTER TABLE `edificio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `meses_facturados`
--
ALTER TABLE `meses_facturados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `edificio`
--
ALTER TABLE `edificio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `meses_facturados`
--
ALTER TABLE `meses_facturados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `saldo`
--
ALTER TABLE `saldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
