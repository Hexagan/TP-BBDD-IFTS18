-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para Seguros PRIMA
CREATE DATABASE IF NOT EXISTS `seguros prima` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `Seguros PRIMA`;

-- Volcando estructura para tabla Seguros PRIMA.duenios
CREATE TABLE IF NOT EXISTS `duenios` (
  `IDduenio` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` int(10) NOT NULL,
  `DNI` int(8) NOT NULL,
  PRIMARY KEY (`IDduenio`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Seguros PRIMA.duenios: ~20 rows (aproximadamente)
DELETE FROM `duenios`;
INSERT INTO `duenios` (`IDduenio`, `nombre`, `correo`, `telefono`, `DNI`) VALUES
	(1, 'Juan Perez', 'juan.perez@example.com', 123456789, 12345678),
	(2, 'María López', 'maria.lopez@example.com', 987654321, 87654321),
	(3, 'Carlos García', 'carlos.garcia@example.com', 234567890, 23456789),
	(4, 'Ana Fernández', 'ana.fernandez@example.com', 345678901, 34567890),
	(5, 'Luis Martínez', 'luis.martinez@example.com', 456789012, 45678901),
	(6, 'Laura González', 'laura.gonzalez@example.com', 567890123, 56789012),
	(7, 'Miguel Rodríguez', 'miguel.rodriguez@example.com', 678901234, 67890123),
	(8, 'Sofía Hernández', 'sofia.hernandez@example.com', 789012345, 78901234),
	(9, 'David Jiménez', 'david.jimenez@example.com', 890123456, 89012345),
	(10, 'Elena Ruiz', 'elena.ruiz@example.com', 901234567, 90123456),
	(11, 'Jorge Díaz', 'jorge.diaz@example.com', 12345678, 1234567),
	(12, 'Marta Morales', 'marta.morales@example.com', 123456781, 12345678),
	(13, 'Sergio Castro', 'sergio.castro@example.com', 234567892, 23456789),
	(14, 'Natalia Ortiz', 'natalia.ortiz@example.com', 345678903, 34567890),
	(15, 'Adrián Torres', 'adrian.torres@example.com', 456789014, 45678901),
	(16, 'Julia Vargas', 'julia.vargas@example.com', 567890125, 56789012),
	(17, 'Iván Castro', 'ivan.castro@example.com', 678901236, 67890123),
	(18, 'Andrea Rojas', 'andrea.rojas@example.com', 789012347, 78901234),
	(19, 'Fernando Ramos', 'fernando.ramos@example.com', 890123458, 89012345),
	(20, 'Claudia Silva', 'claudia.silva@example.com', 901234569, 90123456);

-- Volcando estructura para tabla Seguros PRIMA.estados_pago
CREATE TABLE IF NOT EXISTS `estados_pago` (
  `IDtipoPago` int(1) NOT NULL AUTO_INCREMENT,
  `estado` varchar(7) NOT NULL,
  PRIMARY KEY (`IDtipoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Seguros PRIMA.estados_pago: ~2 rows (aproximadamente)
DELETE FROM `estados_pago`;
INSERT INTO `estados_pago` (`IDtipoPago`, `estado`) VALUES
	(1, 'Pago'),
	(2, 'Vencido');

-- Volcando estructura para tabla Seguros PRIMA.polizas
CREATE TABLE IF NOT EXISTS `polizas` (
  `IDpoliza` int(5) NOT NULL AUTO_INCREMENT,
  `IDvehiculo` int(6) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `estadoPago` int(1) NOT NULL,
  `tipo` int(1) NOT NULL,
  PRIMARY KEY (`IDpoliza`),
  KEY `estadoPago` (`estadoPago`),
  KEY `IDvehiculo` (`IDvehiculo`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `polizas_ibfk_4` FOREIGN KEY (`estadoPago`) REFERENCES `estados_pago` (`IDtipoPago`),
  CONSTRAINT `polizas_ibfk_5` FOREIGN KEY (`IDvehiculo`) REFERENCES `vehiculos` (`IDvehiculo`),
  CONSTRAINT `polizas_ibfk_6` FOREIGN KEY (`tipo`) REFERENCES `tipos_polizas` (`IDtipoPoliza`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Seguros PRIMA.polizas: ~27 rows (aproximadamente)
DELETE FROM `polizas`;
INSERT INTO `polizas` (`IDpoliza`, `IDvehiculo`, `fechaEmision`, `fechaVencimiento`, `estadoPago`, `tipo`) VALUES
	(1, 1, '2022-01-15', '2024-01-15', 2, 1),
	(2, 2, '2016-03-10', '2025-09-10', 1, 1),
	(3, 3, '2015-06-25', '2024-05-25', 2, 4),
	(4, 4, '2013-11-30', '2025-07-30', 1, 4),
	(5, 5, '2022-04-05', '2024-02-05', 2, 1),
	(6, 6, '2024-07-14', '2024-10-14', 1, 4),
	(7, 7, '2022-09-01', '2024-09-01', 1, 3),
	(8, 8, '2018-12-20', '2025-03-20', 1, 4),
	(9, 9, '2027-05-10', '2024-06-10', 2, 3),
	(10, 10, '2019-08-22', '2023-11-22', 1, 2),
	(11, 11, '2021-10-15', '2024-09-15', 1, 2),
	(12, 12, '2023-01-07', '2024-06-07', 2, 4),
	(13, 13, '2018-11-19', '2024-12-19', 1, 1),
	(14, 14, '2021-04-30', '2024-01-30', 2, 2),
	(15, 15, '2020-09-11', '2025-11-11', 1, 3),
	(16, 16, '2023-05-25', '2024-05-25', 2, 4),
	(17, 17, '2019-06-17', '2025-03-17', 2, 1),
	(18, 18, '2022-08-03', '2024-08-03', 1, 2),
	(19, 19, '2021-12-21', '2025-12-21', 1, 3),
	(20, 20, '2020-03-18', '2023-03-18', 2, 4),
	(21, 21, '2023-06-14', '2024-05-14', 2, 2),
	(22, 22, '2021-01-28', '2025-01-28', 1, 2),
	(23, 23, '2018-07-09', '2023-10-09', 2, 2),
	(24, 24, '2022-02-11', '2023-02-11', 2, 4),
	(25, 25, '2020-10-04', '2024-09-04', 1, 1),
	(26, 26, '2024-02-11', '2025-01-11', 1, 4),
	(27, 27, '2024-10-04', '2025-01-11', 1, 4);

-- Volcando estructura para tabla Seguros PRIMA.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `IDproveedor` int(2) NOT NULL AUTO_INCREMENT,
  `tipo` int(1) NOT NULL,
  `telefono` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`IDproveedor`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`tipo`) REFERENCES `tipos_proveedores` (`IDtipoProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Seguros PRIMA.proveedores: ~10 rows (aproximadamente)
DELETE FROM `proveedores`;
INSERT INTO `proveedores` (`IDproveedor`, `tipo`, `telefono`, `nombre`) VALUES
	(1, 3, 1151234567, 'Hermanos Chatarra'),
	(2, 1, 42345078, 'Gruas El Lejano Oeste'),
	(3, 1, 43456789, 'Remolques Mate'),
	(4, 2, 1185678908, 'Auxilio Express'),
	(5, 3, 1158056901, 'La Esperanza'),
	(6, 3, 1150967012, 'El Buen Servicio'),
	(7, 3, 1191784123, 'Oriente Gruas'),
	(8, 5, 458901234, 'La Verdad de Negocio'),
	(9, 4, 499012345, 'Correo Locomotora'),
	(10, 3, 420123456, 'Mecánica Central');

-- Volcando estructura para tabla Seguros PRIMA.siniestros
CREATE TABLE IF NOT EXISTS `siniestros` (
  `IDsiniestro` int(5) NOT NULL AUTO_INCREMENT,
  `IDpoliza` int(5) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `IDproveedor` int(2) DEFAULT NULL,
  PRIMARY KEY (`IDsiniestro`),
  KEY `IDpoliza` (`IDpoliza`),
  KEY `IDproveedor` (`IDproveedor`),
  CONSTRAINT `siniestros_ibfk_1` FOREIGN KEY (`IDproveedor`) REFERENCES `proveedores` (`IDproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Seguros PRIMA.siniestros: ~28 rows (aproximadamente)
DELETE FROM `siniestros`;
INSERT INTO `siniestros` (`IDsiniestro`, `IDpoliza`, `tipo`, `fecha`, `IDproveedor`) VALUES
	(1, 8, '2', '2022-11-10 01:25:47', NULL),
	(2, 15, '7', '2021-06-25 02:36:59', 5),
	(3, 22, '3', '2020-03-30 03:47:21', 7),
	(4, 19, '10', '2023-04-05 16:59:51', 2),
	(5, 10, '4', '2021-09-15 12:15:03', 4),
	(6, 5, '8', '2020-12-20 13:26:15', 6),
	(7, 14, '1', '2022-07-11 10:53:36', 9),
	(8, 25, '11', '2023-01-18 19:12:34', 8),
	(9, 17, '6', '2021-05-22 08:31:12', 10),
	(10, 1, '9', '2023-03-10 04:58:33', 1),
	(11, 2, '12', '2022-10-25 00:42:12', NULL),
	(12, 4, '4', '2021-08-14 09:42:24', 6),
	(13, 7, '5', '2019-12-18 15:48:39', 7),
	(14, 9, '8', '2023-05-07 02:31:54', 2),
	(15, 11, '3', '2021-11-23 14:37:27', 1),
	(16, 12, '7', '2020-07-30 13:22:10', NULL),
	(17, 13, '6', '2022-04-19 20:32:30', NULL),
	(18, 16, '10', '2021-10-12 05:32:18', NULL),
	(19, 18, '11', '2019-09-25 07:20:57', 10),
	(20, 20, '1', '2020-11-10 21:43:42', 5),
	(21, 21, '12', '2022-08-21 09:12:10', 7),
	(22, 23, '4', '2023-06-14 19:21:18', 3),
	(23, 24, '9', '2021-03-05 06:09:45', NULL),
	(24, 3, '5', '2020-01-30 18:10:06', 1),
	(25, 5, '7', '2019-04-22 11:03:48', 2),
	(26, 8, '2', '2022-09-09 15:44:08', 10),
	(27, 10, '6', '2023-02-26 16:32:41', NULL),
	(28, 14, '8', '2021-12-15 17:19:09', 4);

-- Volcando estructura para tabla Seguros PRIMA.tipos_polizas
CREATE TABLE IF NOT EXISTS `tipos_polizas` (
  `IDtipoPoliza` int(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(5) NOT NULL,
  PRIMARY KEY (`IDtipoPoliza`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Seguros PRIMA.tipos_polizas: ~4 rows (aproximadamente)
DELETE FROM `tipos_polizas`;
INSERT INTO `tipos_polizas` (`IDtipoPoliza`, `nombre`) VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C'),
	(4, 'PRIMA');

-- Volcando estructura para tabla Seguros PRIMA.tipos_proveedores
CREATE TABLE IF NOT EXISTS `tipos_proveedores` (
  `IDtipoProveedor` int(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`IDtipoProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Seguros PRIMA.tipos_proveedores: ~5 rows (aproximadamente)
DELETE FROM `tipos_proveedores`;
INSERT INTO `tipos_proveedores` (`IDtipoProveedor`, `nombre`) VALUES
	(1, 'Remolque o Gruas'),
	(2, 'Primeros auxilios y transporte sanitario'),
	(3, 'Mecanica y Reparacion'),
	(4, 'Administrativo'),
	(5, 'Consultoría');

-- Volcando estructura para tabla Seguros PRIMA.tipos_siniestros
CREATE TABLE IF NOT EXISTS `tipos_siniestros` (
  `IDtipoSiniestro` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`IDtipoSiniestro`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Seguros PRIMA.tipos_siniestros: ~12 rows (aproximadamente)
DELETE FROM `tipos_siniestros`;
INSERT INTO `tipos_siniestros` (`IDtipoSiniestro`, `nombre`) VALUES
	(1, 'Daños hacia terceros'),
	(2, 'Daños de cristales'),
	(3, 'Daños de cerraduras'),
	(4, 'Destruccion total'),
	(5, 'Robo total'),
	(6, 'Robo neumaticos'),
	(7, 'Robo consola central'),
	(8, 'Incendio total'),
	(9, 'Incendio parcial'),
	(10, 'Colision'),
	(11, 'Granizo'),
	(12, 'Caida de arbol');

-- Volcando estructura para tabla Seguros PRIMA.vehiculos
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `IDvehiculo` int(6) NOT NULL AUTO_INCREMENT,
  `marca` varchar(12) NOT NULL,
  `modelo` varchar(25) NOT NULL,
  `patente` varchar(7) NOT NULL,
  `anio` int(4) NOT NULL,
  `IDduenio` int(5) NOT NULL,
  PRIMARY KEY (`IDvehiculo`),
  KEY `IDduenio` (`IDduenio`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Seguros PRIMA.vehiculos: ~27 rows (aproximadamente)
DELETE FROM `vehiculos`;
INSERT INTO `vehiculos` (`IDvehiculo`, `marca`, `modelo`, `patente`, `anio`, `IDduenio`) VALUES
	(1, 'Toyota', 'Corolla', 'AB123CD', 2015, 1),
	(2, 'Ford', 'Focus', 'BC234DE', 2016, 2),
	(3, 'Chevrolet', 'Cruze', 'CD345EF', 2017, 3),
	(4, 'Lamborghini', 'Huracan', 'HI456JK', 2020, 3),
	(5, 'Honda', 'Civic', 'DE456FG', 2018, 4),
	(6, 'Nissan', 'Sentra', 'EF567GH', 2019, 5),
	(7, 'Bentley', 'Continental GT', 'NO789PQ', 2022, 5),
	(8, 'Volkswagen', 'Jetta', 'FG678HI', 2020, 6),
	(9, 'Hyundai', 'Elantra', 'GH789IJ', 2021, 7),
	(10, 'Mazda', 'Mazda3', 'HI890JK', 2022, 8),
	(11, 'Kia', 'Forte', 'IJ901KL', 2023, 9),
	(12, 'Maserati', 'Ghibli', 'LM678NO', 2021, 9),
	(13, 'Porsche', '911 Carrera', 'JK567LM', 2019, 9),
	(14, 'Subaru', 'Impreza', 'JK012LM', 2024, 10),
	(15, 'BMW', '3 Series', 'LM123NO', 2014, 11),
	(16, 'MercedesBenz', 'C-Class', 'NO234PQ', 2015, 12),
	(17, 'Audi', 'A4', 'PQ345RS', 2016, 13),
	(18, 'Lexus', 'IS', 'RS456TU', 2017, 14),
	(19, 'Acura', 'TLX', 'TU567VW', 2018, 15),
	(20, 'Tesla', 'Model 3', 'VW678XY', 2019, 16),
	(21, 'Ferrari', '488 GTB', 'FG345HI', 2018, 16),
	(22, 'Volvo', 'S60', 'XY789ZA', 2020, 17),
	(23, 'Infiniti', 'Q50', 'ZA890BC', 2021, 18),
	(24, 'Jaguar', 'XE', 'BC901DE', 2022, 19),
	(25, 'Alfa Romeo', 'Giulia', 'DE012FG', 2023, 20),
	(26, 'Yamaha', 'LW074KL', 'ABC123', 2020, 10),
	(27, 'Honda', 'CB792AR', 'XYZ789', 2021, 10);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
