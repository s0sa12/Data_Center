-- ============================================================
-- TAREA 9
-- CONSULTAS SQL DE AGREGACIÓN Y AGRUPAMIENTO
-- MÓDULO 3.8 - DESARROLLO DE SISTEMAS DE INFORMACIÓN GERENCIAL
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
-- Indicador: Ventas agrupadas por categoría.
-- Permite identificar cuánto dinero genera cada categoría.
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
-- Indicador: Categorías con ventas superiores a $1,000.
-- HAVING permite filtrar después de realizar la agregación.
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
-- Indicador: Precio máximo registrado.
-- Permite identificar el producto con el precio más alto.
-- ============================================================

SELECT 
    MAX(p.precio) AS precio_maximo
FROM productos AS p;


-- ============================================================
-- CONSULTA 7
-- Indicador: Precio mínimo registrado.
-- Permite identificar el precio más bajo entre los productos.
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
