-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2021 a las 16:06:17
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
-- Base de datos: `bd_empresas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FONDO` (`a` DOUBLE, `b` DOUBLE)  BEGIN 

         SELECT a+b INTO@suma ;
         if @suma > 0 THEN
             SELECT 'no vacio';
           ELSE
             SELECT 'vacio';
           END if;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `suma` (`a` INT, `B` INT)  BEGIN

	SELECT a + b;

END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `actualizar_datos_empresas` (`a` INT(5), `b` VARCHAR(50), `c` VARCHAR(1000), `d` VARCHAR(14), `e` VARCHAR(50), `f` INT(8), `g` INT(1), `fila` INT(3)) RETURNS TEXT CHARSET utf8mb4 BEGIN 

	UPDATE empresas SET nit_empresa = a, nombre_empresa = b, descripcion_empresa = c, numero_contacto = d, direccion = e, id_tipo_empresa = f, estado_produccion = g WHERE nit_empresa = fila;

	RETURN 'datos han sido actualizados con exito';

END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `eliminar_datos_empresas` (`a` INT(5)) RETURNS TEXT CHARSET utf8mb4 BEGIN

	DELETE FROM empresas WHERE nit_empresa = a;
	RETURN 'empresa eliminada con exito';

END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `insertar_datos` (`a` INT(5), `b` VARCHAR(50), `c` VARCHAR(1000), `d` VARCHAR(14), `e` VARCHAR(50), `f` INT(8), `g` INT(1)) RETURNS TEXT CHARSET utf8mb4 BEGIN 

	INSERT INTO empresas(nit_empresa, nombre_empresa, descripcion_empresa, numero_contacto, direccion, id_tipo_empresa, estado_produccion) VALUES ( a, b, c, d, e, f, g);

	RETURN 'datos insertados con exito';

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `nit_empresa` int(5) NOT NULL,
  `nombre_empresa` varchar(50) NOT NULL,
  `descripcion_empresa` varchar(1000) NOT NULL,
  `numero_contacto` varchar(14) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_tipo_empresa` int(8) DEFAULT NULL,
  `estado_produccion` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`nit_empresa`, `nombre_empresa`, `descripcion_empresa`, `numero_contacto`, `direccion`, `id_tipo_empresa`, `estado_produccion`) VALUES
(9284, 'supermercados el gopes', 'holaaaaaaaaaaaa', '3504695597', 'calle 15 # 30-02, avenida pichula triste', 1, 1),
(9876, 'multimedia mundo', 'holaaaaaaaaaaaa', '3504695597', 'calle 15 # 30-02, avenida pichula triste', 1, 1),
(10398, 'cumpumenos', 'holaaaaaaaaaaaa', '3504695597', 'calle 15 # 30-02, avenida pichula triste', 1, 1),
(10983, 'vhjvv', 'holaaaaaaaaaaaa', '3504695597', 'calle 15 # 30-02, avenida pichula triste', 1, 1),
(12345, 'platanos guaviare', 'holaaaaaaaaaaaa', '3504695597', 'calle 15 # 30-02, avenida pichula triste', 1, 1),
(23894, 'transportadora la tula feliz', 'holaaaaaaaaaaaa', '3504695597', 'calle 15 # 30-02, avenida pichula triste', 1, 1),
(25575, 'dulceria chao mundo', 'holaaaaaaaaaaaa', '3504695597', 'calle 15 # 30-02, avenida pichula triste', 1, 1),
(34561, 'call of pera', 'holaaaaaaaaaaaa', '3504695597', 'calle 15 # 30-02, avenida pichula triste', 1, 1),
(43565, 'hola bye', 'holaaaaaaaaaaaa', '3504695597', 'calle 15 # 30-02, avenida pichula triste', 1, 1);

--
-- Disparadores `empresas`
--
DELIMITER $$
CREATE TRIGGER `historial_acciones` BEFORE DELETE ON `empresas` FOR EACH ROW BEGIN 
	INSERT INTO log_empresas(descripcion, fecha) VALUES ('se elimino un registro', NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estrellas`
--

CREATE TABLE `estrellas` (
  `valorizacion_numerica` int(1) DEFAULT NULL,
  `nit_empresa` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria_empresa`
--

CREATE TABLE `galeria_empresa` (
  `id_imagen_empresa` int(8) NOT NULL,
  `imagen` longblob DEFAULT NULL,
  `nit_empresa` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria_producto`
--

CREATE TABLE `galeria_producto` (
  `id_imagen_producto` int(8) NOT NULL,
  `imagen` longblob DEFAULT NULL,
  `id_producto` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `hola_mundo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `hola_mundo` (
`nit_empresa` int(5)
,`nombre_empresa` varchar(50)
,`descripcion_empresa` varchar(1000)
,`numero_contacto` varchar(14)
,`direccion` varchar(50)
,`id_tipo_empresa` int(8)
,`estado_produccion` int(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_empresas`
--

CREATE TABLE `log_empresas` (
  `id` int(3) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_empresas`
--

INSERT INTO `log_empresas` (`id`, `descripcion`, `fecha`) VALUES
(1, 'se elimino un registro', '2021-06-30 07:42:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(8) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `id_tipo_producto` int(8) NOT NULL,
  `nit_empresa` int(5) NOT NULL,
  `id_imagen` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `id_tipo_producto`, `nit_empresa`, `id_imagen`) VALUES
(1, 'platano', 1, 12345, 1),
(2, 'snacks', 2, 34561, 2),
(3, 'yuca', 1, 10983, 3),
(4, 'pantalla led', 3, 10398, 4),
(5, 'libro de auto ayuda', 4, 43565, 5),
(12345, 'auriculares redragon pandora', 1, 10983, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empresa`
--

CREATE TABLE `tipo_empresa` (
  `id_tipo_empresa` int(8) NOT NULL,
  `tipo_empresa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_empresa`
--

INSERT INTO `tipo_empresa` (`id_tipo_empresa`, `tipo_empresa`) VALUES
(1, 'tecnologica'),
(2, 'agropecuaria'),
(3, 'audiovisual'),
(4, 'programacion'),
(5, 'empaquetados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tipo_producto` int(8) NOT NULL,
  `Tipo_producto` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id_tipo_producto`, `Tipo_producto`) VALUES
(1, 'agricola'),
(2, 'empaquetado'),
(3, 'tecnologico'),
(4, 'libros'),
(5, 'cuidado del cabello');

-- --------------------------------------------------------

--
-- Estructura para la vista `hola_mundo`
--
DROP TABLE IF EXISTS `hola_mundo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hola_mundo`  AS SELECT `empresas`.`nit_empresa` AS `nit_empresa`, `empresas`.`nombre_empresa` AS `nombre_empresa`, `empresas`.`descripcion_empresa` AS `descripcion_empresa`, `empresas`.`numero_contacto` AS `numero_contacto`, `empresas`.`direccion` AS `direccion`, `empresas`.`id_tipo_empresa` AS `id_tipo_empresa`, `empresas`.`estado_produccion` AS `estado_produccion` FROM `empresas` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`nit_empresa`),
  ADD KEY `id_tipo_empresa` (`id_tipo_empresa`);

--
-- Indices de la tabla `estrellas`
--
ALTER TABLE `estrellas`
  ADD KEY `nit_empresa` (`nit_empresa`);

--
-- Indices de la tabla `galeria_empresa`
--
ALTER TABLE `galeria_empresa`
  ADD PRIMARY KEY (`id_imagen_empresa`),
  ADD KEY `nit_empresa` (`nit_empresa`);

--
-- Indices de la tabla `galeria_producto`
--
ALTER TABLE `galeria_producto`
  ADD PRIMARY KEY (`id_imagen_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `log_empresas`
--
ALTER TABLE `log_empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `nit_empresa` (`nit_empresa`),
  ADD KEY `id_tipo_producto` (`id_tipo_producto`);

--
-- Indices de la tabla `tipo_empresa`
--
ALTER TABLE `tipo_empresa`
  ADD PRIMARY KEY (`id_tipo_empresa`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tipo_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `galeria_empresa`
--
ALTER TABLE `galeria_empresa`
  MODIFY `id_imagen_empresa` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `galeria_producto`
--
ALTER TABLE `galeria_producto`
  MODIFY `id_imagen_producto` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `log_empresas`
--
ALTER TABLE `log_empresas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`id_tipo_empresa`) REFERENCES `tipo_empresa` (`id_tipo_empresa`);

--
-- Filtros para la tabla `estrellas`
--
ALTER TABLE `estrellas`
  ADD CONSTRAINT `estrellas_ibfk_1` FOREIGN KEY (`nit_empresa`) REFERENCES `empresas` (`nit_empresa`);

--
-- Filtros para la tabla `galeria_empresa`
--
ALTER TABLE `galeria_empresa`
  ADD CONSTRAINT `galeria_empresa_ibfk_1` FOREIGN KEY (`nit_empresa`) REFERENCES `empresas` (`nit_empresa`);

--
-- Filtros para la tabla `galeria_producto`
--
ALTER TABLE `galeria_producto`
  ADD CONSTRAINT `galeria_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`nit_empresa`) REFERENCES `empresas` (`nit_empresa`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_producto` (`id_tipo_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
