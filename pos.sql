-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2022 a las 10:02:20
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(1, 'Equipos electromecanicos', '2022-06-25 08:37:31'),
(2, 'Taladros', '2022-06-25 08:37:31'),
(3, 'Andamios', '2022-06-25 08:37:31'),
(4, 'Generadores de energia', '2022-06-25 08:37:31'),
(5, 'Equipos para construccion', '2022-06-25 08:37:31'),
(6, 'Martillos', '2022-06-26 09:52:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `documento` int(11) NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `compras` int(11) NOT NULL,
  `ultima_compra` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
(1, 'Andrea Jimenez', 4445667, 'andrea.Jim@gmail.com', '(311) 245-4567', 'Rio Amazon #21', '1999-06-30', 13, '2022-07-07 02:02:17', '2022-07-07 07:02:17'),
(2, 'Jose Perez', 3546466, 'josePe@hotmail.com', '(324) 100-7112', 'Brasil #12', '2000-06-21', 13, '2022-07-07 23:38:14', '2022-07-08 04:38:14'),
(3, 'Cliente 1', 1111112222, 'cliente1@gmail.com', '(311) 743-1204', 'lopez 23', '1994-01-26', 13, '2022-07-06 00:42:20', '2022-07-06 05:42:20'),
(4, 'cliente2', 35356, 'cliente2@gmail.com', '(111) 111-1111', 'Direccion 2', '1999-12-12', 7, '2022-07-07 23:45:48', '2022-07-08 04:45:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`, `ventas`, `fecha`) VALUES
(1, 1, '101', 'Aspiradora Industrial ', 'vistas/img/productos/101/105.png', 16, 1000, 1200, 4, '2022-07-05 06:12:34'),
(2, 1, '102', 'Plato Flotante para Allanadora', 'vistas/img/productos/102/940.jpg', 16, 350, 472.5, 4, '2022-07-05 06:12:34'),
(3, 1, '103', 'Compresor de Aire para pintura', 'vistas/img/productos/103/763.jpg', 17, 3000, 4200, 3, '2022-07-05 06:12:34'),
(4, 1, '104', 'Cortadora de Adobe sin Disco ', 'vistas/img/productos/104/957.jpg', 0, 4000, 5600, 0, '2022-06-30 05:11:42'),
(6, 1, '106', 'Disco Punta Diamante ', 'vistas/img/productos/106/635.jpg', 14, 1100, 1540, 6, '2022-07-05 06:43:43'),
(7, 1, '107', 'Extractor de Aire ', 'vistas/img/productos/107/848.jpg', 18, 1540, 2156, 2, '2022-07-05 06:43:43'),
(8, 1, '108', 'Cortadora', 'vistas/img/productos/108/163.jpg', 18, 1540, 2156, 2, '2022-07-05 07:45:27'),
(9, 1, '109', 'Hidrolavadora Electrica ', 'vistas/img/productos/109/769.jpg', 18, 2600, 3640, 2, '2022-07-05 06:43:43'),
(10, 1, '110', 'Hidrolavadora Gasolina', 'vistas/img/productos/110/582.jpg', 18, 2210, 3094, 2, '2022-07-06 05:42:20'),
(11, 1, '111', 'Motobomba Diesel', 'vistas/img/productos/111/166.jpg', 20, 3000, 3300, 0, '2022-07-05 06:22:45'),
(12, 1, '112', 'Motobomba Electrica', 'vistas/img/productos/default/anonymous.png', 20, 2400, 3360, 0, '2022-06-27 02:25:35'),
(13, 1, '113', 'Sierra Circular ', 'vistas/img/productos/default/anonymous.png', 20, 1100, 1540, 0, '2017-12-22 03:56:28'),
(14, 1, '114', 'Disco de tugsteno para Sierra circular', 'vistas/img/productos/default/anonymous.png', 20, 4500, 6300, 0, '2017-12-22 03:56:28'),
(15, 1, '115', 'Soldador Electrico ', 'vistas/img/productos/default/anonymous.png', 20, 1980, 2772, 0, '2017-12-22 03:56:28'),
(16, 1, '116', 'Careta para Soldador', 'vistas/img/productos/default/anonymous.png', 20, 4200, 5880, 0, '2017-12-22 03:56:28'),
(17, 1, '117', 'Torre de iluminacion ', 'vistas/img/productos/default/anonymous.png', 20, 1800, 2520, 0, '2017-12-22 03:56:28'),
(18, 2, '201', 'Martillo Demoledor de Piso 110V', 'vistas/img/productos/default/anonymous.png', 20, 5600, 7840, 0, '2017-12-22 03:56:28'),
(19, 2, '202', 'Muela o cincel martillo demoledor piso', 'vistas/img/productos/default/anonymous.png', 20, 9600, 13440, 0, '2017-12-22 03:56:28'),
(20, 2, '203', 'Taladro Demoledor de muro 110V', 'vistas/img/productos/default/anonymous.png', 20, 3850, 5390, 0, '2017-12-22 03:56:28'),
(21, 2, '204', 'Muela o cincel martillo demoledor muro', 'vistas/img/productos/default/anonymous.png', 20, 9600, 13440, 0, '2017-12-22 03:56:28'),
(22, 2, '205', 'Taladro Percutor de 1/2 Madera y Metal', 'vistas/img/productos/default/anonymous.png', 20, 8000, 11200, 0, '2017-12-22 04:28:24'),
(23, 2, '206', 'Taladro Percutor SDS Plus 110V', 'vistas/img/productos/default/anonymous.png', 20, 3900, 5460, 0, '2017-12-22 03:56:28'),
(24, 2, '207', 'Taladro Percutor SDS Max 110V (Mineria)', 'vistas/img/productos/default/anonymous.png', 20, 4600, 6440, 0, '2017-12-22 03:56:28'),
(25, 3, '301', 'Andamio colgante', 'vistas/img/productos/default/anonymous.png', 20, 1440, 2016, 0, '2017-12-22 03:56:28'),
(26, 3, '302', 'Distanciador andamio colgante', 'vistas/img/productos/default/anonymous.png', 20, 1600, 2240, 0, '2017-12-22 03:56:28'),
(27, 3, '303', 'Marco andamio modular ', 'vistas/img/productos/default/anonymous.png', 20, 900, 1260, 0, '2017-12-22 03:56:28'),
(28, 3, '304', 'Marco andamio tijera', 'vistas/img/productos/default/anonymous.png', 20, 100, 140, 0, '2017-12-22 03:56:28'),
(29, 3, '305', 'Tijera para andamio', 'vistas/img/productos/default/anonymous.png', 20, 162, 226, 0, '2017-12-22 03:56:28'),
(30, 3, '306', 'Escalera interna para andamio', 'vistas/img/productos/default/anonymous.png', 20, 270, 378, 0, '2017-12-22 03:56:28'),
(31, 3, '307', 'Pasamanos de seguridad', 'vistas/img/productos/default/anonymous.png', 20, 75, 105, 0, '2017-12-22 03:56:28'),
(32, 3, '308', 'Rueda giratoria para andamio', 'vistas/img/productos/default/anonymous.png', 20, 168, 235, 0, '2017-12-22 03:56:28'),
(33, 3, '309', 'Arnes de seguridad', 'vistas/img/productos/default/anonymous.png', 20, 1750, 2450, 0, '2017-12-22 03:56:28'),
(34, 3, '310', 'Eslinga para arnes', 'vistas/img/productos/default/anonymous.png', 20, 175, 245, 0, '2017-12-22 03:56:28'),
(35, 3, '311', 'Plataforma Met?lica', 'vistas/img/productos/default/anonymous.png', 20, 420, 588, 0, '2017-12-22 03:56:28'),
(36, 4, '401', 'Planta Electrica Diesel 6 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3500, 4900, 0, '2017-12-22 03:56:28'),
(37, 4, '402', 'Planta Electrica Diesel 10 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3550, 4970, 0, '2017-12-22 03:56:28'),
(38, 4, '403', 'Planta Electrica Diesel 20 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3600, 5040, 0, '2017-12-22 03:56:28'),
(39, 4, '404', 'Planta Electrica Diesel 30 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3650, 5110, 0, '2017-12-22 03:56:28'),
(40, 4, '405', 'Planta Electrica Diesel 60 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3700, 5180, 0, '2017-12-22 03:56:28'),
(41, 4, '406', 'Planta Electrica Diesel 75 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3750, 5250, 0, '2017-12-22 03:56:28'),
(42, 4, '407', 'Planta Electrica Diesel 100 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3800, 5320, 0, '2017-12-22 03:56:28'),
(43, 4, '408', 'Planta Electrica Diesel 120 Kva', 'vistas/img/productos/default/anonymous.png', 20, 3850, 5390, 0, '2017-12-22 03:56:28'),
(44, 5, '501', 'Escalera de Tijera Aluminio ', 'vistas/img/productos/default/anonymous.png', 20, 350, 490, 0, '2017-12-22 03:56:28'),
(45, 5, '502', 'Extension Electrica ', 'vistas/img/productos/default/anonymous.png', 20, 370, 518, 0, '2017-12-22 03:56:28'),
(46, 5, '503', 'Gato tensor', 'vistas/img/productos/default/anonymous.png', 20, 380, 532, 0, '2017-12-22 03:56:28'),
(47, 5, '504', 'Lamina Cubre Brecha ', 'vistas/img/productos/default/anonymous.png', 20, 380, 532, 0, '2017-12-22 03:56:28'),
(48, 5, '505', 'Llave de Tubo', 'vistas/img/productos/default/anonymous.png', 20, 480, 672, 0, '2017-12-22 03:56:28'),
(49, 5, '506', 'Manila por Metro', 'vistas/img/productos/default/anonymous.png', 20, 600, 840, 0, '2017-12-22 03:56:28'),
(50, 5, '507', 'Polea 2 canales', 'vistas/img/productos/default/anonymous.png', 20, 900, 1260, 0, '2017-12-22 03:56:28'),
(51, 5, '508', 'Tensor', 'vistas/img/productos/default/anonymous.png', 20, 100, 140, 0, '2017-12-22 03:56:28'),
(52, 5, '509', 'Bascula ', 'vistas/img/productos/default/anonymous.png', 20, 130, 182, 0, '2017-12-22 03:56:28'),
(53, 5, '510', 'Bomba Hidrostatica', 'vistas/img/productos/default/anonymous.png', 20, 770, 1078, 0, '2017-12-22 03:56:28'),
(54, 5, '511', 'Chapeta', 'vistas/img/productos/default/anonymous.png', 20, 660, 924, 0, '2017-12-22 03:56:28'),
(55, 5, '512', 'Cilindro muestra de concreto', 'vistas/img/productos/default/anonymous.png', 20, 400, 560, 0, '2017-12-22 03:56:28'),
(56, 5, '513', 'Cizalla de Palanca', 'vistas/img/productos/default/anonymous.png', 20, 450, 630, 0, '2017-12-22 03:56:28'),
(57, 5, '514', 'Cizalla de Tijera', 'vistas/img/productos/default/anonymous.png', 20, 580, 812, 0, '2017-12-22 03:56:28'),
(58, 5, '515', 'Coche llanta neumatica', 'vistas/img/productos/default/anonymous.png', 19, 420, 588, 1, '2022-07-08 04:45:48'),
(59, 5, '516', 'Cono slump', 'vistas/img/productos/default/anonymous.png', 19, 140, 196, 1, '2022-07-08 04:45:48'),
(60, 5, '517', 'Cortadora de Baldosin', 'vistas/img/productos/default/anonymous.png', 18, 930, 1302, 2, '2022-07-08 04:38:14'),
(61, 6, '601', 'Martillo Mediano', 'vistas/img/productos/default/anonymous.png', 18, 450, 630, 17, '2022-07-08 04:38:13'),
(62, 5, '518', 'Sierra electrica', 'vistas/img/productos/default/anonymous.png', 15, 9.99, 13.986, 0, '2022-06-26 23:34:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
(1, 'usuario administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S', 'Administrador', 'vistas/img/usuarios/admin/990.jpg', 1, '2022-07-07 22:41:42', '2022-07-08 03:41:42'),
(5, 'Ana Gonzalez', 'ana', '$2a$07$asxx54ahjppf45sd87a5auzGfz9GaOjSPJ5jEDpHii9vSQEEqY1Zm', 'Vendedor', 'vistas/img/usuarios/ana/643.png', 1, '2022-07-07 01:50:07', '2022-07-07 06:50:07'),
(7, 'Luis Hernandez', 'Luis', '$2a$07$asxx54ahjppf45sd87a5auwx8lyuZ.kds4dac831wJ6GwzvInb.wG', 'Administrador', 'vistas/img/usuarios/Luis/249.png', 1, '2022-07-03 19:40:53', '2022-07-04 00:40:53'),
(9, 'Laura Rosas', 'Laura', '$2a$07$asxx54ahjppf45sd87a5auKsB1ViuL62616ZD1cAVxGRuO21KFfiy', 'Especial', 'vistas/img/usuarios/Laura/995.jpg', 1, '2022-07-07 04:43:46', '2022-07-07 09:43:46'),
(17, 'Angela Guzman', 'Angela', '$2a$07$asxx54ahjppf45sd87a5aupEWanzXNWwA0/4j9qb2ws25ruWlUff.', 'Especial', 'vistas/img/usuarios/Angela/792.jpg', 1, '2022-07-08 02:37:45', '2022-06-22 05:03:17'),
(18, 'Juan Perez', 'Juan', '$2a$07$asxx54ahjppf45sd87a5au.U/M0caGNRi1j0bgxZqVwBDctNLt11O', 'Vendedor', 'vistas/img/usuarios/Juan/406.png', 0, '0000-00-00 00:00:00', '2022-06-22 05:45:17'),
(19, 'Andrea Martin', 'Andrea', '$2a$07$asxx54ahjppf45sd87a5auss3kYaxusqKJuVexnX6DyVQaAfzpV4e', 'Vendedor', '', 1, '2022-07-07 04:19:03', '2022-07-07 09:19:03'),
(20, 'Ana Paula Renteria', 'Paula', '$2a$07$asxx54ahjppf45sd87a5au9sHgQplrDrKJz7ZQ2ytakW27X9pTpWi', 'Especial', 'vistas/img/usuarios/Paula/867.png', 0, '0000-00-00 00:00:00', '2022-06-23 07:16:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` float NOT NULL,
  `neto` float NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `id_cliente`, `id_vendedor`, `productos`, `impuesto`, `neto`, `total`, `metodo_pago`, `fecha`) VALUES
(15, 10001, 3, 1, '[{\"id\":\"1\",\"descripcion\":\"Aspiradora Industrial \",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"1200\",\"total\":\"1200\"},{\"id\":\"2\",\"descripcion\":\"Plato Flotante para Allanadora\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"472.5\",\"total\":\"472.5\"},{\"id\":\"3\",\"descripcion\":\"Compresor de Aire para pintura\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"4200\",\"total\":\"4200\"}]', 0, 5872.5, 5872.5, 'TC-52552', '2022-06-05 06:02:20'),
(16, 10002, 3, 1, '[{\"id\":\"7\",\"descripcion\":\"Extractor de Aire \",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"2156\",\"total\":\"4312\"},{\"id\":\"6\",\"descripcion\":\"Disco Punta Diamante \",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"1540\",\"total\":\"3080\"},{\"id\":\"9\",\"descripcion\":\"Hidrolavadora Electrica \",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"3640\",\"total\":\"7280\"}]', 0, 14672, 14672, 'TC-5544441', '2022-06-05 06:43:43'),
(18, 10003, 1, 1, '[{\"id\":\"1\",\"descripcion\":\"Aspiradora Industrial \",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"1200\",\"total\":\"1200\"},{\"id\":\"2\",\"descripcion\":\"Plato Flotante para Allanadora\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"472.5\",\"total\":\"472.5\"},{\"id\":\"3\",\"descripcion\":\"Compresor de Aire para pintura\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"4200\",\"total\":\"4200\"}]', 0, 5872.5, 5872.5, 'Efectivo', '2022-07-05 06:07:03'),
(20, 10004, 2, 1, '[{\"id\":\"1\",\"descripcion\":\"Aspiradora Industrial \",\"cantidad\":\"2\",\"stock\":\"16\",\"precio\":\"1200\",\"total\":\"2400\"},{\"id\":\"2\",\"descripcion\":\"Plato Flotante para Allanadora\",\"cantidad\":\"2\",\"stock\":\"16\",\"precio\":\"472.5\",\"total\":\"945\"},{\"id\":\"3\",\"descripcion\":\"Compresor de Aire para pintura\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"4200\",\"total\":\"4200\"}]', 0, 7545, 7545, 'Efectivo', '2022-07-05 06:12:34'),
(21, 10005, 2, 1, '[{\"id\":\"6\",\"descripcion\":\"Disco Punta Diamante \",\"cantidad\":\"4\",\"stock\":\"14\",\"precio\":\"1540\",\"total\":\"6160\"}]', 0, 6160, 6160, 'TC-455550', '2022-07-05 06:13:22'),
(23, 10006, 3, 1, '[{\"id\":\"8\",\"descripcion\":\"Cortadora\",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"2156\",\"total\":\"4312\"}]', 431.2, 4312, 4743.2, 'Efectivo', '2022-07-05 07:45:27'),
(24, 10007, 3, 1, '[{\"id\":\"10\",\"descripcion\":\"Hidrolavadora Gasolina\",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"3094\",\"total\":\"6188\"}]', 0, 6188, 6188, 'Efectivo', '2022-07-06 05:42:21'),
(25, 10008, 4, 5, '[{\"id\":\"61\",\"descripcion\":\"Martillo Mediano\",\"cantidad\":\"5\",\"stock\":\"30\",\"precio\":\"630\",\"total\":\"3150\"}]', 0, 3150, 3150, 'TC-542157', '2022-07-07 07:01:25'),
(26, 10009, 1, 5, '[{\"id\":\"61\",\"descripcion\":\"Martillo Mediano\",\"cantidad\":\"10\",\"stock\":\"20\",\"precio\":\"630\",\"total\":\"6300\"}]', 0, 6300, 6300, 'Efectivo', '2022-07-07 07:02:17'),
(27, 10010, 2, 1, '[{\"id\":\"61\",\"descripcion\":\"Martillo Mediano\",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"630\",\"total\":\"1260\"},{\"id\":\"60\",\"descripcion\":\"Cortadora de Baldosin\",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"1302\",\"total\":\"2604\"}]', 0, 3864, 3864, 'TC-5588999', '2022-07-08 04:38:14'),
(28, 10011, 4, 1, '[{\"id\":\"59\",\"descripcion\":\"Cono slump\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"196\",\"total\":\"196\"},{\"id\":\"58\",\"descripcion\":\"Coche llanta neumatica\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"588\",\"total\":\"588\"}]', 0, 784, 784, 'Efectivo', '2022-07-08 04:45:49');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
