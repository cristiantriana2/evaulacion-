-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2021 a las 16:06:11
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_admin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso_administrador`
--

CREATE TABLE `acceso_administrador` (
  `id_admin` int(3) NOT NULL,
  `nombre_admin` varchar(50) DEFAULT NULL,
  `correo_administrador` varchar(50) NOT NULL,
  `contrasena_administrador` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acceso_administrador`
--

INSERT INTO `acceso_administrador` (`id_admin`, `nombre_admin`, `correo_administrador`, `contrasena_administrador`) VALUES
(21, 'f', 'f@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperar_cuenta`
--

CREATE TABLE `recuperar_cuenta` (
  `id_admin` int(3) NOT NULL,
  `contrasena_administrador` varchar(32) NOT NULL,
  `nueva_contrasena_adminitrador` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso_administrador`
--
ALTER TABLE `acceso_administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `recuperar_cuenta`
--
ALTER TABLE `recuperar_cuenta`
  ADD KEY `id_admin` (`id_admin`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `recuperar_cuenta`
--
ALTER TABLE `recuperar_cuenta`
  ADD CONSTRAINT `recuperar_cuenta_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `acceso_administrador` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
