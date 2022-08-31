-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2022 a las 22:50:38
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `demo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `num_cliente` int(11) NOT NULL,
  `dir_cliente` varchar(20) NOT NULL,
  `barrio_cliente` varchar(20) NOT NULL,
  `tel_cliente` int(11) NOT NULL,
  `nom_cliente` varchar(20) NOT NULL,
  `ape_cliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `método de pago`
--

CREATE TABLE `método de pago` (
  `id_ped_pago` char(10) NOT NULL,
  `tipo_pago` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` char(10) NOT NULL,
  `num_cli_pedido` int(11) NOT NULL,
  `id_usu_pedido` char(10) NOT NULL,
  `costo_pedido` varchar(50) NOT NULL,
  `estado_pedido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillo`
--

CREATE TABLE `platillo` (
  `id_platillo` char(10) NOT NULL,
  `precio_platillo` varchar(20) NOT NULL,
  `nom_platillo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillo x pedido`
--

CREATE TABLE `platillo x pedido` (
  `id_ped_platped` char(10) NOT NULL,
  `id_pla_platped` char(10) NOT NULL,
  `can_platped` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` char(10) NOT NULL,
  `can_producto` varchar(10) NOT NULL,
  `fecha_ent_producto` date NOT NULL,
  `fecha_cad_producto` date NOT NULL,
  `id_prov_producto` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto x platillo`
--

CREATE TABLE `producto x platillo` (
  `id_pla_prodpla` char(10) NOT NULL,
  `id_pro_prodpla` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` char(10) NOT NULL,
  `nom_emp_proveedor` varchar(30) NOT NULL,
  `dir_proveedor` varchar(30) NOT NULL,
  `tel_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` char(10) NOT NULL,
  `rol_rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` char(10) NOT NULL,
  `nom_usuario` varchar(30) NOT NULL,
  `ape_usuario` varchar(30) NOT NULL,
  `tel_usuario` int(11) NOT NULL,
  `correo_usuario` varchar(50) NOT NULL,
  `id_rol_usuario` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`num_cliente`);

--
-- Indices de la tabla `método de pago`
--
ALTER TABLE `método de pago`
  ADD KEY `id_ped_pago` (`id_ped_pago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `num_cli_pedido` (`num_cli_pedido`),
  ADD KEY `id_usu_pedido` (`id_usu_pedido`);

--
-- Indices de la tabla `platillo`
--
ALTER TABLE `platillo`
  ADD PRIMARY KEY (`id_platillo`);

--
-- Indices de la tabla `platillo x pedido`
--
ALTER TABLE `platillo x pedido`
  ADD KEY `id_ped_platped` (`id_ped_platped`),
  ADD KEY `id_pla_platped` (`id_pla_platped`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_prov_producto` (`id_prov_producto`);

--
-- Indices de la tabla `producto x platillo`
--
ALTER TABLE `producto x platillo`
  ADD KEY `id_pla_prodpla` (`id_pla_prodpla`),
  ADD KEY `id_pro_prodpla` (`id_pro_prodpla`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol_usuario` (`id_rol_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `num_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`num_cliente`) REFERENCES `pedido` (`num_cli_pedido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `método de pago`
--
ALTER TABLE `método de pago`
  ADD CONSTRAINT `método de pago_ibfk_1` FOREIGN KEY (`id_ped_pago`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `platillo x pedido`
--
ALTER TABLE `platillo x pedido`
  ADD CONSTRAINT `platillo x pedido_ibfk_1` FOREIGN KEY (`id_ped_platped`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `platillo x pedido_ibfk_2` FOREIGN KEY (`id_pla_platped`) REFERENCES `platillo` (`id_platillo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto x platillo`
--
ALTER TABLE `producto x platillo`
  ADD CONSTRAINT `producto x platillo_ibfk_1` FOREIGN KEY (`id_pro_prodpla`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto x platillo_ibfk_2` FOREIGN KEY (`id_pla_prodpla`) REFERENCES `platillo` (`id_platillo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `producto` (`id_prov_producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol_usuario`) REFERENCES `rol` (`id_rol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `pedido` (`id_usu_pedido`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
