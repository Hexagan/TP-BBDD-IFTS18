# Trabajo Práctico Administración de Bases de Datos
**Profesor:** Emanuel Alejandro Odstrcil
**Autor:** Federico Salvador

## Objetivo
La compañía aseguradora Prima SRL solicita el desarrollo de una base de datos que gestione de manera eficiente la información relacionada con sus seguros de rodados. La base de datos tiene que permitir mantener registro de los detalles de las pólizas de seguro, los clientes, los vehículos, los proveedores y de los siniestros que vayan surgiendo. 

### Creación de la base de datos
```sql
CREATE DATABASE IF NOT EXISTS `seguros prima` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `Seguros PRIMA`;
```

## Creación de las Tablas

<ins>Restricciones</ins>
- Clientes: Mayor de 18 años y no tener demasiadas infracciones
- Vehiculos: Menor de 10 años de antiguedad y tener la Verificación Técnica Vehicular vigente
- Siniestros: Debe tener la licencia de conducir vigente y tener la póliza paga al momento del siniestro

#### Tabla Dueños
````sql
CREATE TABLE IF NOT EXISTS `duenios` (
  `IDduenio` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` int(10) NOT NULL,
  `DNI` int(8) NOT NULL,
  PRIMARY KEY (`IDduenio`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
````
#### Tabla Vehiculos
````sql
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
````

#### Tabla Polizas
````sql
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
````

#### Tabla Siniestros
````sql
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
````

#### Tabla Proveedores 
````sql
CREATE TABLE IF NOT EXISTS `proveedores` (
  `IDproveedor` int(2) NOT NULL AUTO_INCREMENT,
  `tipo` int(1) NOT NULL,
  `telefono` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`IDproveedor`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`tipo`) REFERENCES `tipos_proveedores` (`IDtipoProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
````

#### Tablas Normalización
````sql
Tabla tipo de Pólizas
CREATE TABLE IF NOT EXISTS `tipos_polizas` (
  `IDtipoPoliza` int(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(5) NOT NULL,
  PRIMARY KEY (`IDtipoPoliza`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
````

#### Tabla tipo de Siniestros
````sql
CREATE TABLE IF NOT EXISTS `tipos_siniestros` (
  `IDtipoSiniestro` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`IDtipoSiniestro`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
````

#### Tabla tipo de Proveedores
````sql
CREATE TABLE IF NOT EXISTS `tipos_proveedores` (
  `IDtipoProveedor` int(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`IDtipoProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
````

## Inserción de datos (los primeros 10 registros)
````sql
Tabla de dueños
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
````

#### Tabla Vehículos
````sql
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
````

### Tabla Pólizas
````sql
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
````

### Tabla Proveedores
````sql
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
````

### Tabla Siniestros
````sql
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
````

## Insercion a Tablas de Normalización
````sql
Tabla estado de pago
CREATE TABLE IF NOT EXISTS `estados_pago` (
  `IDtipoPago` int(1) NOT NULL AUTO_INCREMENT,
  `estado` varchar(7) NOT NULL,
  PRIMARY KEY (`IDtipoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
````

### Tabla Tipos de Pólizas
````sql
INSERT INTO `tipos_polizas` (`IDtipoPoliza`, `nombre`) VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C'),
	(4, 'PRIMA');
````

### Tabla Tipos de Proveedores
````sql
INSERT INTO `tipos_proveedores` (`IDtipoProveedor`, `nombre`) VALUES
	(1, 'Remolque o Gruas'),
	(2, 'Primeros auxilios y transporte sanitario'),
	(3, 'Mecanica y Reparacion'),
	(4, 'Administrativo'),
	(5, 'Consultoría');
````

### Tabla Estados Pago
````sql
INSERT INTO `estados_pago` (`IDtipoPago`, `estado`) VALUES
	(1, 'Pago'),
	(2, 'Vencido');
````

### Tabla Tipos de Siniestro
````sql
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
````

## Ingreso de consultas
 1. Listar todas las pólizas de seguro vigentes
    
    ````sql
    SELECT * FROM polizas WHERE fechaVencimiento > CURRENT_TIMESTAMP();
    ````
    
 1. Calcular el total de reclamaciones por tipo de siniestro
    
    ````sql
    SELECT COUNT(tipo), nombre FROM siniestros INNER JOIN tipos_siniestros ON tipos_siniestros.IDtipoSiniestro = siniestros.tipo GROUP BY tipo;
    ````
    
 1. Listar los proveedores de servicios de grúa
    
    ````sql
    SELECT * FROM proveedores WHERE tipo = 1;
    ````

## Diagrama Entidad Relación (DER)
![Imagen del Diagrama Entidad Relación de la Aseguradora PRIMA](https://myoctocat.com/assets/images/base-octocat.svg)

## Diagrama Tablas
![Imagen del Diagrama de Tablas de la Aseguradora PRIMA](https://myoctocat.com/assets/images/base-octocat.svg)

## Diccionario de datos: 
> [!NOTE]
> El diccionario se encuentra [aquí](https://pages.github.com/)

## Presentación del proyecto
> [!NOTE]
> La presentación se puede ver [aquí](https://pages.github.com/)
 
 
