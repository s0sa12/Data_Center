-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2026 a las 11:30:00
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12
--
-- =============================================================================
-- GUÍA / TAREA 8: MÓDULO 3.8 PROYECTO INNOVADOR DE DESARROLLO DE SOFTWARE
-- SISTEMA DE INFORMACIÓN GERENCIAL (SIG)
-- Base de Datos: sig_gerencial_incb
-- Archivo: sig_gerencial_2026.sql
-- Motor: InnoDB | Caracteres: utf8mb4 | Intercalación: utf8mb4_spanish_ci
-- =============================================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- -----------------------------------------------------------------------------
-- 1. CREACIÓN Y SELECCIÓN DE LA BASE DE DATOS
-- -----------------------------------------------------------------------------
DROP DATABASE IF EXISTS `sig_gerencial_incb`;

CREATE DATABASE `sig_gerencial_incb`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_spanish_ci;

USE `sig_gerencial_incb`;

-- -----------------------------------------------------------------------------
-- 2. CREACIÓN DE TABLAS (ORDEN DE DEPENDENCIAS)
-- -----------------------------------------------------------------------------

-- =============================================================================
-- TABLA 1: categorias
-- Catálogo independiente de categorías de productos
-- =============================================================================
CREATE TABLE `categorias` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(255) NULL,
  -- 3. Clave Primaria
  CONSTRAINT `pk_categorias` PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- =============================================================================
-- TABLA 2: clientes
-- Registro de clientes del sistema gerencial
-- =============================================================================
CREATE TABLE `clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `apellido` VARCHAR(60) NOT NULL,
  `identificacion` VARCHAR(25) NOT NULL UNIQUE,
  `telefono` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  -- 3. Clave Primaria
  CONSTRAINT `pk_clientes` PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- =============================================================================
-- TABLA 3: empleados
-- Registro de empleados y personal de ventas
-- =============================================================================
CREATE TABLE `empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `apellido` VARCHAR(60) NOT NULL,
  `cargo` VARCHAR(60) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `fecha_contratacion` DATE NOT NULL,
  -- 3. Clave Primaria
  CONSTRAINT `pk_empleados` PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- =============================================================================
-- TABLA 4: productos
-- Catálogo de productos asociados a categorías
-- =============================================================================
CREATE TABLE `productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NOT NULL,
  `nombre_producto` VARCHAR(120) NOT NULL,
  `descripcion` VARCHAR(255) NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `stock` INT NOT NULL,
  `fecha_ingreso` DATE NOT NULL,
  -- 3. Clave Primaria
  CONSTRAINT `pk_productos` PRIMARY KEY (`id_producto`),
  -- 4. Clave Foránea y 5. Restricciones
  CONSTRAINT `fk_productos_categorias`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `categorias` (`id_categoria`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- =============================================================================
-- TABLA 5: ventas
-- Cabecera de ventas relacionadas a clientes y empleados
-- =============================================================================
CREATE TABLE `ventas` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `id_empleado` INT NOT NULL,
  `fecha_venta` DATE NOT NULL,
  `metodo_pago` VARCHAR(50) NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  -- 3. Clave Primaria
  CONSTRAINT `pk_ventas` PRIMARY KEY (`id_venta`),
  -- 4. Claves Foráneas y 5. Restricciones
  CONSTRAINT `fk_ventas_clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `clientes` (`id_cliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ventas_empleados`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `empleados` (`id_empleado`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- =============================================================================
-- TABLA 6: detalle_ventas
-- Líneas de detalle vinculadas a cada venta y producto
-- =============================================================================
CREATE TABLE `detalle_ventas` (
  `id_detalle` INT NOT NULL AUTO_INCREMENT,
  `id_venta` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_unitario` DECIMAL(10,2) NOT NULL,
  `subtotal` DECIMAL(10,2) NOT NULL,
  -- 3. Clave Primaria
  CONSTRAINT `pk_detalle_ventas` PRIMARY KEY (`id_detalle`),
  -- 4. Claves Foráneas y 5. Restricciones
  CONSTRAINT `fk_detalle_ventas_venta`
    FOREIGN KEY (`id_venta`)
    REFERENCES `ventas` (`id_venta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_ventas_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `productos` (`id_producto`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- -----------------------------------------------------------------------------
-- 6. INSERCIÓN DE DATOS (POBLACIÓN DE 120 REGISTROS EN TOTAL)
-- -----------------------------------------------------------------------------

-- =============================================================================
-- INSERCIÓN EN TABLA 1: categorias (20 registros)
-- =============================================================================
INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion`) VALUES
(1, 'Laptops y Portátiles', 'Equipos portátiles para oficina, diseño y gaming'),
(2, 'Computadoras de Escritorio', 'Equipos desktop empresariales y estaciones de trabajo'),
(3, 'Monitores y Pantallas', 'Pantallas IPS, monitores curvos y de alta resolución'),
(4, 'Componentes y Procesadores', 'CPUs para servidores y plataformas de alto rendimiento'),
(5, 'Tarjetas Gráficas', 'GPUs dedicadas para procesamiento visual y rendering'),
(6, 'Memorias RAM', 'Módulos DDR4 y DDR5 para estaciones y portátiles'),
(7, 'Almacenamiento SSD y HDD', 'Unidades de estado sólido NVMe y discos mecánicos'),
(8, 'Placas Base', 'Motherboards para plataformas Intel y AMD'),
(9, 'Fuentes de Poder', 'Unidades de alimentación certificadas 80 Plus'),
(10, 'Teclados y Mecánicos', 'Teclados ergonómicos y mecánicos para productividad'),
(11, 'Ratones y Punteros', 'Mouses ópticos y periféricos de alta precisión'),
(12, 'Audio y Auriculares', 'Dispositivos de sonido y diademas para conferencias'),
(13, 'Redes y Comunicaciones', 'Switches, routers y tarjetas de red empresarial'),
(14, 'Servidores y Gabinetes', 'Infraestructura para centros de cómputo y racks'),
(15, 'Impresión y Digitalización', 'Impresoras multifuncionales y escáneres documentales'),
(16, 'Conectividad y Cables', 'Cables de fibra, HDMI, DisplayPort y adaptadores'),
(17, 'Software y Licencias', 'Sistemas operativos y paquetes de gestión de oficina'),
(18, 'Mobiliario Ergonómico', 'Sillas y escritorios adaptados a jornadas de trabajo'),
(19, 'Seguridad y Videovigilancia', 'Cámaras IP y sistemas de circuito cerrado CCTV'),
(20, 'Energía y Protección UPS', 'Sistemas de alimentación ininterrumpida y reguladores');

-- =============================================================================
-- INSERCIÓN EN TABLA 2: clientes (20 registros)
-- =============================================================================
INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `identificacion`, `telefono`, `email`, `direccion`) VALUES
(1, 'Carlos Eduardo', 'Alvarado Melgar', '04581294-1', '7894-1101', 'carlos.alvarado@gmail.com', 'Colonia Escalón, Calle La Mascota #102, San Salvador'),
(2, 'María Teresa', 'Hernández Paz', '03215689-2', '7894-1102', 'maria.hernandez@outlook.com', 'Final 25 Avenida Norte #45, Santa Ana'),
(3, 'Juan Antonio', 'Pérez Orellana', '01984532-3', '7894-1103', 'juan.perez@hotmail.com', 'Avenida Roosevelt Sur #312, San Miguel'),
(4, 'Ana Patricia', 'Rodríguez Valle', '05432178-4', '7894-1104', 'ana.rodriguez@gmail.com', 'Urbanización Santa Elena, Bulevar Orden de Malta, La Libertad'),
(5, 'Roberto Carlos', 'Gómez Morales', '02897415-5', '7894-1105', 'roberto.gomez@yahoo.com', 'Barrio El Centro, 3a Calle Poniente #12, Sonsonate'),
(6, 'Laura Sofía', 'Martínez Rivas', '03984125-6', '7894-1106', 'laura.martinez@gmail.com', 'Colonia Las Delicias, Polígono B Casa 7, Usulután'),
(7, 'Fernando José', 'Castillo Duarte', '01748529-7', '7894-1107', 'fernando.castillo@outlook.com', 'Calle al Calvario #88, Ahuachapán'),
(8, 'Patricia Elena', 'Morales Quintanilla', '04123987-8', '7894-1108', 'patricia.morales@gmail.com', 'Barrio San José, Avenida Central #55, Zacatecoluca, La Paz'),
(9, 'Diego Alejandro', 'Flores Campos', '02983746-9', '7894-1109', 'diego.flores@empresa.com.sv', 'Colonia San Rafael, Pasaje 3 #19, Cojutepeque, Cuscatlán'),
(10, 'Sofía Beatriz', 'Ramírez Coto', '05671234-0', '7894-1110', 'sofia.ramirez@gmail.com', 'Barrio El Carmen, 1a Avenida Norte, Chalatenango'),
(11, 'Gabriel Ernesto', 'Mendoza Salguero', '04892351-1', '7894-1111', 'gabriel.mendoza@gmail.com', 'Bulevar Los Próceres, Condominio Vista Alegre #4B, San Salvador'),
(12, 'Elena Abigail', 'Vásquez Guardado', '03456781-2', '7894-1112', 'elena.vasquez@gmail.com', 'Urbanización El Palmar, Senda Los Pinos #22, Santa Ana'),
(13, 'Ricardo Andrés', 'Navarro Beltrán', '01678945-3', '7894-1113', 'ricardo.navarro@outlook.com', 'Colonia Ciudad Jardín, 6a Calle Poniente #101, San Miguel'),
(14, 'Carmen Irene', 'Ortiz Miranda', '05123984-4', '7894-1114', 'carmen.ortiz@gmail.com', 'Plaza Zaragoza, Centro Histórico #14, Santa Tecla, La Libertad'),
(15, 'Javier Alfonso', 'Serrano Lemus', '02345612-5', '7894-1115', 'javier.serrano@tecnologia.sv', 'Parque Industrial Plan de La Laguna, Calle Circunvalación #8'),
(16, 'Andrea Michelle', 'Aguilar Palacios', '04987654-6', '7894-1116', 'andrea.aguilar@gmail.com', 'Colonia Sierra Morena, Pasaje 8 #33, Soyapango'),
(17, 'Mauricio Isaac', 'Peña Carballo', '03876543-7', '7894-1117', 'mauricio.pena@gmail.com', 'Residencial San Antonio, Calle Real #15, Santa Tecla'),
(18, 'Daniela Nicole', 'Rivas Henríquez', '01456789-8', '7894-1118', 'daniela.rivas@hotmail.com', 'Colonia San Bartolo, Sector 4 #89, Ilopango'),
(19, 'Héctor Manuel', 'Campos Portillo', '02678912-9', '7894-1119', 'hector.campos@yahoo.com', 'Residencial Altos de Miramonte, Pasaje 2 #10, San Salvador'),
(20, 'Gabriela María', 'Cruz Velásquez', '05987123-0', '7894-1120', 'gabriela.cruz@gmail.com', 'Colonia Valle del Sol, Avenida Principal #56, Apopa');

-- =============================================================================
-- INSERCIÓN EN TABLA 3: empleados (20 registros)
-- =============================================================================
INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellido`, `cargo`, `telefono`, `email`, `fecha_contratacion`) VALUES
(1, 'Alejandro Samuel', 'Rivera Gómez', 'Gerente General', '7100-2001', 'arivera@empresa.com.sv', '2021-01-15'),
(2, 'Beatriz Carolina', 'Portillo Fuentes', 'Gerente de Ventas', '7100-2002', 'bportillo@empresa.com.sv', '2021-03-01'),
(3, 'Cristian David', 'Escobar Pineda', 'Ejecutivo de Cuentas Corporativas', '7100-2003', 'cescobar@empresa.com.sv', '2021-06-15'),
(4, 'Diana Marcela', 'Meza Villalta', 'Asesora de Ventas', '7100-2004', 'dmeza@empresa.com.sv', '2022-01-10'),
(5, 'Eduardo Enrique', 'Reyes Menjívar', 'Supervisor de Sucursal', '7100-2005', 'ereyes@empresa.com.sv', '2022-02-20'),
(6, 'Fátima Ivette', 'Guardado Castillo', 'Asesora de Ventas', '7100-2006', 'fguardado@empresa.com.sv', '2022-04-12'),
(7, 'Gerardo Antonio', 'Paz Zavaleta', 'Especialista de Hardware', '7100-2007', 'gpaz@empresa.com.sv', '2022-07-01'),
(8, 'Hilda Elizabeth', 'Menjívar Serrano', 'Asesora de Ventas', '7100-2008', 'hmenjivar@empresa.com.sv', '2022-09-15'),
(9, 'Iván Wilfredo', 'Beltrán Flores', 'Asesor de Ventas', '7100-2009', 'ibeltran@empresa.com.sv', '2023-01-08'),
(10, 'Jessica Paola', 'Ayala Cornejo', 'Asesora Corporativa', '7100-2010', 'jayala@empresa.com.sv', '2023-02-14'),
(11, 'Kevin Alexander', 'Orellana Cruz', 'Asesor de Ventas', '7100-2011', 'korellana@empresa.com.sv', '2023-03-22'),
(12, 'Lorena Patricia', 'Quinteros Ramos', 'Coordinadora de Despacho', '7100-2012', 'lquinteros@empresa.com.sv', '2023-05-10'),
(13, 'Manuel Ernesto', 'Coto Figueroa', 'Asesor de Ventas', '7100-2013', 'mcoto@empresa.com.sv', '2023-07-18'),
(14, 'Natalia Estefany', 'Villalobos Solís', 'Asesora de Ventas', '7100-2014', 'nvillalobos@empresa.com.sv', '2023-09-01'),
(15, 'Oscar Armando', 'Marroquín Umaña', 'Encargado de Facturación', '7100-2015', 'omarroquin@empresa.com.sv', '2023-11-05'),
(16, 'Paola Guadalupe', 'Carranza Peña', 'Asesora de Ventas', '7100-2016', 'pcarranza@empresa.com.sv', '2024-01-15'),
(17, 'René Alberto', 'Zelaya Mejía', 'Asesor de Ventas', '7100-2017', 'rzelaya@empresa.com.sv', '2024-02-20'),
(18, 'Silvia Xiomara', 'Miranda Henríquez', 'Asesora de Ventas', '7100-2018', 'smiranda@empresa.com.sv', '2024-04-10'),
(19, 'Tomás Benjamín', 'Calderón Estrada', 'Asesor Técnico de Ventas', '7100-2019', 'tcalderon@empresa.com.sv', '2024-06-01'),
(20, 'Wendy Carolina', 'Lemus Morales', 'Asesora de Ventas', '7100-2020', 'wlemus@empresa.com.sv', '2024-08-15');

-- =============================================================================
-- INSERCIÓN EN TABLA 4: productos (20 registros)
-- =============================================================================
INSERT INTO `productos` (`id_producto`, `id_categoria`, `nombre_producto`, `descripcion`, `precio`, `stock`, `fecha_ingreso`) VALUES
(1, 1, 'Laptop Lenovo ThinkPad T14', 'Procesador Core i7 16GB RAM 512GB SSD Windows 11 Pro', 1250.00, 15, '2026-01-10'),
(2, 2, 'Computadora Dell OptiPlex 7090', 'Intel Core i5 16GB RAM 1TB SSD Gabinete Compacto', 890.00, 20, '2026-01-12'),
(3, 3, 'Monitor LG UltraGear 27 Pulgadas', 'Resolución QHD 144Hz 1ms IPS HDR10', 320.00, 30, '2026-01-15'),
(4, 4, 'Procesador AMD Ryzen 7 5800X', '8 Núcleos 16 Hilos 4.7GHz Max Socket AM4', 280.00, 25, '2026-01-18'),
(5, 5, 'Tarjeta de Video GeForce RTX 4060', '8GB GDDR6 Ray Tracing DLSS 3 PCIe 4.0', 410.00, 18, '2026-01-20'),
(6, 6, 'Memoria RAM Kingston Fury 16GB DDR4', 'Frecuencia 3200MHz CL16 Disipador de Aluminio', 55.00, 50, '2026-01-22'),
(7, 7, 'Unidad SSD Kingston NV2 1TB', 'Formato M.2 NVMe PCIe 4.0 Velocidad 3500MB/s', 75.00, 40, '2026-01-25'),
(8, 8, 'Placa Madre ASUS TUF GAMING B550-PLUS', 'Socket AM4 Dual M.2 USB 3.2 Gen 2 ATX', 165.00, 22, '2026-01-28'),
(9, 9, 'Fuente de Poder EVGA 650W', 'Certificación 80 Plus Bronze Ventilador Silencioso', 85.00, 35, '2026-02-01'),
(10, 10, 'Teclado Mecánico Logitech G Pro', 'Interruptores GX Blue RGB Lightsync USB', 115.00, 45, '2026-02-03'),
(11, 11, 'Ratón Óptico Razer DeathAdder V2', 'Sensor 20000 DPI Cable Speedflex 8 Botones', 65.00, 60, '2026-02-05'),
(12, 12, 'Auriculares HyperX Cloud II', 'Sonido Envolvente Virtual 7.1 Almohadillas Memory Foam', 95.00, 40, '2026-02-08'),
(13, 13, 'Router WiFi 6 TP-Link Archer AX73', 'Doble Banda AX5400 6 Antenas Puertos Gigabit', 140.00, 25, '2026-02-10'),
(14, 14, 'Servidor Torre HPE ProLiant ML30 Gen10', 'Intel Xeon E-2314 16GB RAM Bahías Hot-Plug', 1850.00, 8, '2026-02-12'),
(15, 15, 'Impresora Multifunción Epson L3250', 'Sistema Tanque de Tinta Continuo WiFi Direct', 230.00, 30, '2026-02-15'),
(16, 16, 'Cable HDMI 2.1 Ultra High Speed 2m', 'Soporta 8K a 60Hz y 4K a 120Hz Mallado', 18.00, 100, '2026-02-18'),
(17, 17, 'Licencia Microsoft Windows 11 Pro OEM', 'Clave de activación digital multilenguaje 64 bits', 145.00, 50, '2026-02-20'),
(18, 18, 'Silla Ergonómica Ejecutiva Cougar Armor', 'Estructura de Acero Reclinable 180 Grados', 260.00, 15, '2026-02-22'),
(19, 19, 'Cámara de Seguridad TP-Link Tapo C210', 'Resolución 2K 3MP Rotación 360 Visión Nocturna', 45.00, 40, '2026-02-25'),
(20, 20, 'Sistema UPS APC Back-UPS 1000VA', '6 Tomas con Respaldo y Protección AVR 120V', 175.00, 20, '2026-02-28');

-- =============================================================================
-- INSERCIÓN EN TABLA 5: ventas (20 registros)
-- =============================================================================
INSERT INTO `ventas` (`id_venta`, `id_cliente`, `id_empleado`, `fecha_venta`, `metodo_pago`, `total`) VALUES
(1, 1, 4, '2026-03-01', 'Efectivo', 1250.00),
(2, 2, 6, '2026-03-02', 'Tarjeta de Crédito', 890.00),
(3, 3, 8, '2026-03-03', 'Transferencia Bancaria', 640.00),
(4, 4, 9, '2026-03-04', 'Tarjeta de Débito', 280.00),
(5, 5, 11, '2026-03-05', 'Tarjeta de Crédito', 410.00),
(6, 6, 13, '2026-03-06', 'Efectivo', 110.00),
(7, 7, 14, '2026-03-07', 'Transferencia Bancaria', 150.00),
(8, 8, 16, '2026-03-08', 'Tarjeta de Débito', 165.00),
(9, 9, 17, '2026-03-09', 'Efectivo', 170.00),
(10, 10, 18, '2026-03-10', 'Tarjeta de Crédito', 115.00),
(11, 11, 4, '2026-03-11', 'Tarjeta de Débito', 130.00),
(12, 12, 6, '2026-03-12', 'Efectivo', 95.00),
(13, 13, 8, '2026-03-13', 'Transferencia Bancaria', 140.00),
(14, 14, 10, '2026-03-14', 'Transferencia Bancaria', 1850.00),
(15, 15, 11, '2026-03-15', 'Tarjeta de Crédito', 230.00),
(16, 16, 13, '2026-03-16', 'Efectivo', 54.00),
(17, 17, 14, '2026-03-17', 'Tarjeta de Débito', 290.00),
(18, 18, 16, '2026-03-18', 'Tarjeta de Crédito', 260.00),
(19, 19, 19, '2026-03-19', 'Transferencia Bancaria', 180.00),
(20, 20, 20, '2026-03-20', 'Efectivo', 350.00);

-- =============================================================================
-- INSERCIÓN EN TABLA 6: detalle_ventas (20 registros)
-- =============================================================================
INSERT INTO `detalle_ventas` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 1, 1, 1, 1250.00, 1250.00),
(2, 2, 2, 1, 890.00, 890.00),
(3, 3, 3, 2, 320.00, 640.00),
(4, 4, 4, 1, 280.00, 280.00),
(5, 5, 5, 1, 410.00, 410.00),
(6, 6, 6, 2, 55.00, 110.00),
(7, 7, 7, 2, 75.00, 150.00),
(8, 8, 8, 1, 165.00, 165.00),
(9, 9, 9, 2, 85.00, 170.00),
(10, 10, 10, 1, 115.00, 115.00),
(11, 11, 11, 2, 65.00, 130.00),
(12, 12, 12, 1, 95.00, 95.00),
(13, 13, 13, 1, 140.00, 140.00),
(14, 14, 14, 1, 1850.00, 1850.00),
(15, 15, 15, 1, 230.00, 230.00),
(16, 16, 16, 3, 18.00, 54.00),
(17, 17, 17, 2, 145.00, 290.00),
(18, 18, 18, 1, 260.00, 260.00),
(19, 19, 19, 4, 45.00, 180.00),
(20, 20, 20, 2, 175.00, 350.00);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- -----------------------------------------------------------------------------
-- 7. CONSULTAS DE COMPROBACIÓN Y VALIDACIÓN DEL SISTEMA
-- -----------------------------------------------------------------------------

-- 7.1 Comprobación de conteo de registros por tabla (debe dar exactamente 20 en cada una)
SELECT 'categorias' AS Tabla, COUNT(*) AS Total_Registros FROM `categorias`
UNION ALL
SELECT 'clientes', COUNT(*) FROM `clientes`
UNION ALL
SELECT 'empleados', COUNT(*) FROM `empleados`
UNION ALL
SELECT 'productos', COUNT(*) FROM `productos`
UNION ALL
SELECT 'ventas', COUNT(*) FROM `ventas`
UNION ALL
SELECT 'detalle_ventas', COUNT(*) FROM `detalle_ventas`;

-- 7.2 Consulta con INNER JOIN para validar relaciones completas:
-- Cliente, Empleado, Venta, Producto, Cantidad, Precio y Subtotal
SELECT 
    v.id_venta AS `No_Venta`,
    v.fecha_venta AS `Fecha`,
    CONCAT(c.nombre, ' ', c.apellido) AS `Cliente`,
    c.identificacion AS `DUI_NIT`,
    CONCAT(e.nombre, ' ', e.apellido) AS `Empleado_Vendedor`,
    e.cargo AS `Cargo_Empleado`,
    p.nombre_producto AS `Producto`,
    cat.nombre_categoria AS `Categoria`,
    dv.cantidad AS `Cantidad`,
    dv.precio_unitario AS `Precio_Unitario`,
    dv.subtotal AS `Subtotal_Detalle`,
    v.total AS `Total_Venta`,
    v.metodo_pago AS `Metodo_Pago`
FROM `ventas` v
INNER JOIN `clientes` c ON v.id_cliente = c.id_cliente
INNER JOIN `empleados` e ON v.id_empleado = e.id_empleado
INNER JOIN `detalle_ventas` dv ON v.id_venta = dv.id_venta
INNER JOIN `productos` p ON dv.id_producto = p.id_producto
INNER JOIN `categorias` cat ON p.id_categoria = cat.id_categoria
ORDER BY v.id_venta ASC;

-- 7.3 Consulta SIG Gerencial: Resumen de ventas acumuladas por categoría
SELECT 
    cat.id_categoria AS `ID_Categoria`,
    cat.nombre_categoria AS `Categoria`,
    COUNT(DISTINCT v.id_venta) AS `Transacciones`,
    SUM(dv.cantidad) AS `Unidades_Vendidas`,
    SUM(dv.subtotal) AS `Ingreso_Total`
FROM `detalle_ventas` dv
INNER JOIN `productos` p ON dv.id_producto = p.id_producto
INNER JOIN `categorias` cat ON p.id_categoria = cat.id_categoria
INNER JOIN `ventas` v ON dv.id_venta = v.id_venta
GROUP BY cat.id_categoria, cat.nombre_categoria
ORDER BY `Ingreso_Total` DESC;
