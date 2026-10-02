-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generaciÃ³n: 30-09-2026 a las 11:25:00
-- VersiÃ³n del servidor: 10.4.32-MariaDB
-- VersiÃ³n de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sig_gerencial_incb`
--
CREATE DATABASE IF NOT EXISTS `sig_gerencial_incb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `sig_gerencial_incb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion`) VALUES
(1, 'Laptops y PortÃ¡tiles', 'Equipos portÃ¡tiles para oficina, diseÃ±o y gaming'),
(2, 'Computadoras de Escritorio', 'Equipos desktop empresariales y estaciones de trabajo'),
(3, 'Monitores y Pantallas', 'Pantallas IPS, monitores curvos y de alta resoluciÃ³n'),
(4, 'Componentes y Procesadores', 'CPUs para servidores y plataformas de alto rendimiento'),
(5, 'Tarjetas GrÃ¡ficas', 'GPUs dedicadas para procesamiento visual y rendering'),
(6, 'Memorias RAM', 'MÃ³dulos DDR4 y DDR5 para estaciones y portÃ¡tiles'),
(7, 'Almacenamiento SSD y HDD', 'Unidades de estado sÃ³lido NVMe y discos mecÃ¡nicos'),
(8, 'Placas Base', 'Motherboards para plataformas Intel y AMD'),
(9, 'Fuentes de Poder', 'Unidades de alimentaciÃ³n certificadas 80 Plus'),
(10, 'Teclados y MecÃ¡nicos', 'Teclados ergonÃ³micos y mecÃ¡nicos para productividad'),
(11, 'Ratones y Punteros', 'Mouses Ã³pticos y perifÃ©ricos de alta precisiÃ³n'),
(12, 'Audio y Auriculares', 'Dispositivos de sonido y diademas para conferencias'),
(13, 'Redes y Comunicaciones', 'Switches, routers y tarjetas de red empresarial'),
(14, 'Servidores y Gabinetes', 'Infraestructura para centros de cÃ³mputo y racks'),
(15, 'ImpresiÃ³n y DigitalizaciÃ³n', 'Impresoras multifuncionales y escÃ¡neres documentales'),
(16, 'Conectividad y Cables', 'Cables de fibra, HDMI, DisplayPort y adaptadores'),
(17, 'Software y Licencias', 'Sistemas operativos y paquetes de gestiÃ³n de oficina'),
(18, 'Mobiliario ErgonÃ³mico', 'Sillas y escritorios adaptados a jornadas de trabajo'),
(19, 'Seguridad y Videovigilancia', 'CÃ¡maras IP y sistemas de circuito cerrado CCTV'),
(20, 'EnergÃ­a y ProtecciÃ³n UPS', 'Sistemas de alimentaciÃ³n ininterrumpida y reguladores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `identificacion` varchar(25) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `identificacion`, `telefono`, `email`, `direccion`) VALUES
(1, 'Carlos Eduardo', 'Alvarado Melgar', '04581294-1', '7894-1101', 'carlos.alvarado@gmail.com', 'Colonia EscalÃ³n, Calle La Mascota #102, San Salvador'),
(2, 'MarÃ­a Teresa', 'HernÃ¡ndez Paz', '03215689-2', '7894-1102', 'maria.hernandez@outlook.com', 'Final 25 Avenida Norte #45, Santa Ana'),
(3, 'Juan Antonio', 'PÃ©rez Orellana', '01984532-3', '7894-1103', 'juan.perez@hotmail.com', 'Avenida Roosevelt Sur #312, San Miguel'),
(4, 'Ana Patricia', 'RodrÃ­guez Valle', '05432178-4', '7894-1104', 'ana.rodriguez@gmail.com', 'UrbanizaciÃ³n Santa Elena, Bulevar Orden de Malta, La Libertad'),
(5, 'Roberto Carlos', 'GÃ³mez Morales', '02897415-5', '7894-1105', 'roberto.gomez@yahoo.com', 'Barrio El Centro, 3a Calle Poniente #12, Sonsonate'),
(6, 'Laura SofÃ­a', 'MartÃ­nez Rivas', '03984125-6', '7894-1106', 'laura.martinez@gmail.com', 'Colonia Las Delicias, PolÃ­gono B Casa 7, UsulutÃ¡n'),
(7, 'Fernando JosÃ©', 'Castillo Duarte', '01748529-7', '7894-1107', 'fernando.castillo@outlook.com', 'Calle al Calvario #88, AhuachapÃ¡n'),
(8, 'Patricia Elena', 'Morales Quintanilla', '04123987-8', '7894-1108', 'patricia.morales@gmail.com', 'Barrio San JosÃ©, Avenida Central #55, Zacatecoluca, La Paz'),
(9, 'Diego Alejandro', 'Flores Campos', '02983746-9', '7894-1109', 'diego.flores@empresa.com.sv', 'Colonia San Rafael, Pasaje 3 #19, Cojutepeque, CuscatlÃ¡n'),
(10, 'SofÃ­a Beatriz', 'RamÃ­rez Coto', '05671234-0', '7894-1110', 'sofia.ramirez@gmail.com', 'Barrio El Carmen, 1a Avenida Norte, Chalatenango'),
(11, 'Gabriel Ernesto', 'Mendoza Salguero', '04892351-1', '7894-1111', 'gabriel.mendoza@gmail.com', 'Bulevar Los PrÃ³ceres, Condominio Vista Alegre #4B, San Salvador'),
(12, 'Elena Abigail', 'VÃ¡squez Guardado', '03456781-2', '7894-1112', 'elena.vasquez@gmail.com', 'UrbanizaciÃ³n El Palmar, Senda Los Pinos #22, Santa Ana'),
(13, 'Ricardo AndrÃ©s', 'Navarro BeltrÃ¡n', '01678945-3', '7894-1113', 'ricardo.navarro@outlook.com', 'Colonia Ciudad JardÃ­n, 6a Calle Poniente #101, San Miguel'),
(14, 'Carmen Irene', 'Ortiz Miranda', '05123984-4', '7894-1114', 'carmen.ortiz@gmail.com', 'Plaza Zaragoza, Centro HistÃ³rico #14, Santa Tecla, La Libertad'),
(15, 'Javier Alfonso', 'Serrano Lemus', '02345612-5', '7894-1115', 'javier.serrano@tecnologia.sv', 'Parque Industrial Plan de La Laguna, Calle CircunvalaciÃ³n #8'),
(16, 'Andrea Michelle', 'Aguilar Palacios', '04987654-6', '7894-1116', 'andrea.aguilar@gmail.com', 'Colonia Sierra Morena, Pasaje 8 #33, Soyapango'),
(17, 'Mauricio Isaac', 'PeÃ±a Carballo', '03876543-7', '7894-1117', 'mauricio.pena@gmail.com', 'Residencial San Antonio, Calle Real #15, Santa Tecla'),
(18, 'Daniela Nicole', 'Rivas HenrÃ­quez', '01456789-8', '7894-1118', 'daniela.rivas@hotmail.com', 'Colonia San Bartolo, Sector 4 #89, Ilopango'),
(19, 'HÃ©ctor Manuel', 'Campos Portillo', '02678912-9', '7894-1119', 'hector.campos@yahoo.com', 'Residencial Altos de Miramonte, Pasaje 2 #10, San Salvador'),
(20, 'Gabriela MarÃ­a', 'Cruz VelÃ¡squez', '05987123-0', '7894-1120', 'gabriela.cruz@gmail.com', 'Colonia Valle del Sol, Avenida Principal #56, Apopa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `cargo` varchar(60) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_contratacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellido`, `cargo`, `telefono`, `email`, `fecha_contratacion`) VALUES
(1, 'Alejandro Samuel', 'Rivera GÃ³mez', 'Gerente General', '7100-2001', 'arivera@empresa.com.sv', '2021-01-15'),
(2, 'Beatriz Carolina', 'Portillo Fuentes', 'Gerente de Ventas', '7100-2002', 'bportillo@empresa.com.sv', '2021-03-01'),
(3, 'Cristian David', 'Escobar Pineda', 'Ejecutivo de Cuentas Corporativas', '7100-2003', 'cescobar@empresa.com.sv', '2021-06-15'),
(4, 'Diana Marcela', 'Meza Villalta', 'Asesora de Ventas', '7100-2004', 'dmeza@empresa.com.sv', '2022-01-10'),
(5, 'Eduardo Enrique', 'Reyes MenjÃ­var', 'Supervisor de Sucursal', '7100-2005', 'ereyes@empresa.com.sv', '2022-02-20'),
(6, 'FÃ¡tima Ivette', 'Guardado Castillo', 'Asesora de Ventas', '7100-2006', 'fguardado@empresa.com.sv', '2022-04-12'),
(7, 'Gerardo Antonio', 'Paz Zavaleta', 'Especialista de Hardware', '7100-2007', 'gpaz@empresa.com.sv', '2022-07-01'),
(8, 'Hilda Elizabeth', 'MenjÃ­var Serrano', 'Asesora de Ventas', '7100-2008', 'hmenjivar@empresa.com.sv', '2022-09-15'),
(9, 'IvÃ¡n Wilfredo', 'BeltrÃ¡n Flores', 'Asesor de Ventas', '7100-2009', 'ibeltran@empresa.com.sv', '2023-01-08'),
(10, 'Jessica Paola', 'Ayala Cornejo', 'Asesora Corporativa', '7100-2010', 'jayala@empresa.com.sv', '2023-02-14'),
(11, 'Kevin Alexander', 'Orellana Cruz', 'Asesor de Ventas', '7100-2011', 'korellana@empresa.com.sv', '2023-03-22'),
(12, 'Lorena Patricia', 'Quinteros Ramos', 'Coordinadora de Despacho', '7100-2012', 'lquinteros@empresa.com.sv', '2023-05-10'),
(13, 'Manuel Ernesto', 'Coto Figueroa', 'Asesor de Ventas', '7100-2013', 'mcoto@empresa.com.sv', '2023-07-18'),
(14, 'Natalia Estefany', 'Villalobos SolÃ­s', 'Asesora de Ventas', '7100-2014', 'nvillalobos@empresa.com.sv', '2023-09-01'),
(15, 'Oscar Armando', 'MarroquÃ­n UmaÃ±a', 'Encargado de FacturaciÃ³n', '7100-2015', 'omarroquin@empresa.com.sv', '2023-11-05'),
(16, 'Paola Guadalupe', 'Carranza PeÃ±a', 'Asesora de Ventas', '7100-2016', 'pcarranza@empresa.com.sv', '2024-01-15'),
(17, 'RenÃ© Alberto', 'Zelaya MejÃ­a', 'Asesor de Ventas', '7100-2017', 'rzelaya@empresa.com.sv', '2024-02-20'),
(18, 'Silvia Xiomara', 'Miranda HenrÃ­quez', 'Asesora de Ventas', '7100-2018', 'smiranda@empresa.com.sv', '2024-04-10'),
(19, 'TomÃ¡s BenjamÃ­n', 'CalderÃ³n Estrada', 'Asesor TÃ©cnico de Ventas', '7100-2019', 'tcalderon@empresa.com.sv', '2024-06-01'),
(20, 'Wendy Carolina', 'Lemus Morales', 'Asesora de Ventas', '7100-2020', 'wlemus@empresa.com.sv', '2024-08-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre_producto` varchar(120) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `id_categoria`, `nombre_producto`, `descripcion`, `precio`, `stock`, `fecha_ingreso`) VALUES
(1, 1, 'Laptop Lenovo ThinkPad T14', 'Procesador Core i7 16GB RAM 512GB SSD Windows 11 Pro', 1250.00, 15, '2026-01-10'),
(2, 2, 'Computadora Dell OptiPlex 7090', 'Intel Core i5 16GB RAM 1TB SSD Gabinete Compacto', 890.00, 20, '2026-01-12'),
(3, 3, 'Monitor LG UltraGear 27 Pulgadas', 'ResoluciÃ³n QHD 144Hz 1ms IPS HDR10', 320.00, 30, '2026-01-15'),
(4, 4, 'Procesador AMD Ryzen 7 5800X', '8 NÃºcleos 16 Hilos 4.7GHz Max Socket AM4', 280.00, 25, '2026-01-18'),
(5, 5, 'Tarjeta de Video GeForce RTX 4060', '8GB GDDR6 Ray Tracing DLSS 3 PCIe 4.0', 410.00, 18, '2026-01-20'),
(6, 6, 'Memoria RAM Kingston Fury 16GB DDR4', 'Frecuencia 3200MHz CL16 Disipador de Aluminio', 55.00, 50, '2026-01-22'),
(7, 7, 'Unidad SSD Kingston NV2 1TB', 'Formato M.2 NVMe PCIe 4.0 Velocidad 3500MB/s', 75.00, 40, '2026-01-25'),
(8, 8, 'Placa Madre ASUS TUF GAMING B550-PLUS', 'Socket AM4 Dual M.2 USB 3.2 Gen 2 ATX', 165.00, 22, '2026-01-28'),
(9, 9, 'Fuente de Poder EVGA 650W', 'CertificaciÃ³n 80 Plus Bronze Ventilador Silencioso', 85.00, 35, '2026-02-01'),
(10, 10, 'Teclado MecÃ¡nico Logitech G Pro', 'Interruptores GX Blue RGB Lightsync USB', 115.00, 45, '2026-02-03'),
(11, 11, 'RatÃ³n Ã“ptico Razer DeathAdder V2', 'Sensor 20000 DPI Cable Speedflex 8 Botones', 65.00, 60, '2026-02-05'),
(12, 12, 'Auriculares HyperX Cloud II', 'Sonido Envolvente Virtual 7.1 Almohadillas Memory Foam', 95.00, 40, '2026-02-08'),
(13, 13, 'Router WiFi 6 TP-Link Archer AX73', 'Doble Banda AX5400 6 Antenas Puertos Gigabit', 140.00, 25, '2026-02-10'),
(14, 14, 'Servidor Torre HPE ProLiant ML30 Gen10', 'Intel Xeon E-2314 16GB RAM BahÃ­as Hot-Plug', 1850.00, 8, '2026-02-12'),
(15, 15, 'Impresora MultifunciÃ³n Epson L3250', 'Sistema Tanque de Tinta Continuo WiFi Direct', 230.00, 30, '2026-02-15'),
(16, 16, 'Cable HDMI 2.1 Ultra High Speed 2m', 'Soporta 8K a 60Hz y 4K a 120Hz Mallado', 18.00, 100, '2026-02-18'),
(17, 17, 'Licencia Microsoft Windows 11 Pro OEM', 'Clave de activaciÃ³n digital multilenguaje 64 bits', 145.00, 50, '2026-02-20'),
(18, 18, 'Silla ErgonÃ³mica Ejecutiva Cougar Armor', 'Estructura de Acero Reclinable 180 Grados', 260.00, 15, '2026-02-22'),
(19, 19, 'CÃ¡mara de Seguridad TP-Link Tapo C210', 'ResoluciÃ³n 2K 3MP RotaciÃ³n 360 VisiÃ³n Nocturna', 45.00, 40, '2026-02-25'),
(20, 20, 'Sistema UPS APC Back-UPS 1000VA', '6 Tomas con Respaldo y ProtecciÃ³n AVR 120V', 175.00, 20, '2026-02-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `id_empleado`, `fecha_venta`, `metodo_pago`, `total`) VALUES
(1, 1, 4, '2026-03-01', 'Efectivo', 1250.00),
(2, 2, 6, '2026-03-02', 'Tarjeta de CrÃ©dito', 890.00),
(3, 3, 8, '2026-03-03', 'Transferencia Bancaria', 640.00),
(4, 4, 9, '2026-03-04', 'Tarjeta de DÃ©bito', 280.00),
(5, 5, 11, '2026-03-05', 'Tarjeta de CrÃ©dito', 410.00),
(6, 6, 13, '2026-03-06', 'Efectivo', 110.00),
(7, 7, 14, '2026-03-07', 'Transferencia Bancaria', 150.00),
(8, 8, 16, '2026-03-08', 'Tarjeta de DÃ©bito', 165.00),
(9, 9, 17, '2026-03-09', 'Efectivo', 170.00),
(10, 10, 18, '2026-03-10', 'Tarjeta de CrÃ©dito', 115.00),
(11, 11, 4, '2026-03-11', 'Tarjeta de DÃ©bito', 130.00),
(12, 12, 6, '2026-03-12', 'Efectivo', 95.00),
(13, 13, 8, '2026-03-13', 'Transferencia Bancaria', 140.00),
(14, 14, 10, '2026-03-14', 'Transferencia Bancaria', 1850.00),
(15, 15, 11, '2026-03-15', 'Tarjeta de CrÃ©dito', 230.00),
(16, 16, 13, '2026-03-16', 'Efectivo', 54.00),
(17, 17, 14, '2026-03-17', 'Tarjeta de DÃ©bito', 290.00),
(18, 18, 16, '2026-03-18', 'Tarjeta de CrÃ©dito', 260.00),
(19, 19, 19, '2026-03-19', 'Transferencia Bancaria', 180.00),
(20, 20, 20, '2026-03-20', 'Efectivo', 350.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

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

--
-- Ãndices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ventas_empleados` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `fk_detalle_ventas_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_ventas_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- =============================================================================
-- CONSULTAS DE COMPROBACIÃ“N Y VALIDACIÃ“N (REQUISITO GUÃA 8)
-- =============================================================================

-- ComprobaciÃ³n de conteo por tabla (20 registros en cada una)
-- SELECT 'categorias' AS Tabla, COUNT(*) AS Total FROM `categorias`
-- UNION ALL SELECT 'clientes', COUNT(*) FROM `clientes`
-- UNION ALL SELECT 'empleados', COUNT(*) FROM `empleados`
-- UNION ALL SELECT 'productos', COUNT(*) FROM `productos`
-- UNION ALL SELECT 'ventas', COUNT(*) FROM `ventas`
-- UNION ALL SELECT 'detalle_ventas', COUNT(*) FROM `detalle_ventas`;

-- Consulta con INNER JOIN para validar relaciones completas:
-- SELECT v.id_venta AS Venta, CONCAT(c.nombre, ' ', c.apellido) AS Cliente, CONCAT(e.nombre, ' ', e.apellido) AS Empleado, p.nombre_producto AS Producto, dv.cantidad AS Cantidad, dv.precio_unitario AS Precio, dv.subtotal AS Subtotal
-- FROM ventas v
-- INNER JOIN clientes c ON v.id_cliente = c.id_cliente
-- INNER JOIN empleados e ON v.id_empleado = e.id_empleado
-- INNER JOIN detalle_ventas dv ON v.id_venta = dv.id_venta
-- INNER JOIN productos p ON dv.id_producto = p.id_producto;
-- ============================================================
-- TAREA 9
-- CONSULTAS SQL DE AGREGACIÃ“N Y AGRUPAMIENTO
-- MÃ“DULO 3.8 - DESARROLLO DE SISTEMAS DE INFORMACIÃ“N GERENCIAL
-- Estudiante: Edwin Geovani Sosa Sosa
-- Fecha: 01 de octubre de 2026
-- ============================================================

USE `sig_gerencial_incb`;

-- ============================================================
-- CONSULTA 1
-- Indicador: Ingreso total generado por las ventas.
-- Permite conocer el monto monetario total obtenido.
-- ============================================================

SELECT 
    ROUND(SUM(dv.subtotal), 2) AS total_ventas
FROM detalle_ventas AS dv;


-- ============================================================
-- CONSULTA 2
-- Indicador: Ventas agrupadas por categorÃ­a.
-- Permite identificar cuÃ¡nto dinero genera cada categorÃ­a.
-- ============================================================

SELECT 
    c.nombre_categoria AS categoria,
    ROUND(SUM(dv.subtotal), 2) AS total_ventas
FROM categorias AS c
INNER JOIN productos AS p
    ON c.id_categoria = p.id_categoria
INNER JOIN detalle_ventas AS dv
    ON p.id_producto = dv.id_producto
GROUP BY 
    c.id_categoria,
    c.nombre_categoria
ORDER BY 
    total_ventas DESC;


-- ============================================================
-- CONSULTA 3
-- Indicador: Rendimiento de los vendedores.
-- Cuenta las ventas realizadas y suma el importe vendido.
-- ============================================================

SELECT 
    e.id_empleado,
    CONCAT(e.nombre, ' ', e.apellido) AS vendedor,
    COUNT(v.id_venta) AS cantidad_ventas,
    ROUND(SUM(v.total), 2) AS total_vendido
FROM empleados AS e
INNER JOIN ventas AS v
    ON e.id_empleado = v.id_empleado
GROUP BY 
    e.id_empleado,
    e.nombre,
    e.apellido
ORDER BY 
    total_vendido DESC;


-- ============================================================
-- CONSULTA 4
-- Indicador: CategorÃ­as con ventas superiores a $1,000.
-- HAVING permite filtrar despuÃ©s de realizar la agregaciÃ³n.
-- ============================================================

SELECT 
    c.nombre_categoria AS categoria,
    ROUND(SUM(dv.subtotal), 2) AS total_ventas
FROM categorias AS c
INNER JOIN productos AS p
    ON c.id_categoria = p.id_categoria
INNER JOIN detalle_ventas AS dv
    ON p.id_producto = dv.id_producto
GROUP BY 
    c.id_categoria,
    c.nombre_categoria
HAVING 
    SUM(dv.subtotal) > 1000
ORDER BY 
    total_ventas DESC;


-- ============================================================
-- CONSULTA 5
-- Indicador: Precio promedio de los productos.
-- Permite conocer el precio promedio del inventario.
-- ============================================================

SELECT 
    ROUND(AVG(p.precio), 2) AS precio_promedio
FROM productos AS p;


-- ============================================================
-- CONSULTA 6
-- Indicador: Precio mÃ¡ximo registrado.
-- Permite identificar el producto con el precio mÃ¡s alto.
-- ============================================================

SELECT 
    MAX(p.precio) AS precio_maximo
FROM productos AS p;


-- ============================================================
-- CONSULTA 7
-- Indicador: Precio mÃ­nimo registrado.
-- Permite identificar el precio mÃ¡s bajo entre los productos.
-- ============================================================

SELECT 
    MIN(p.precio) AS precio_minimo
FROM productos AS p;


-- ============================================================
-- CONSULTA 8
-- Indicador: Cantidad de unidades vendidas por producto.
-- Permite conocer los productos con mayor movimiento.
-- ============================================================

SELECT 
    p.id_producto,
    p.nombre_producto AS producto,
    SUM(dv.cantidad) AS unidades_vendidas
FROM productos AS p
INNER JOIN detalle_ventas AS dv
    ON p.id_producto = dv.id_producto
GROUP BY 
    p.id_producto,
    p.nombre_producto
ORDER BY 
    unidades_vendidas DESC;
