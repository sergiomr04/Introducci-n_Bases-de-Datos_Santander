/* Reto 3: Definición de vistas
Sergio Maldonado Rodriguez */

-- 1. Obtener el puesto de un empleado.
CREATE VIEW puestos_018 AS -- CREATE OR REPLACE VIEW 
SELECT concat(e.nombre, ' ', e.apellido_paterno) AS 'Nombre', p.nombre Puesto
FROM empleado e
JOIN puesto p
  USING (id_puesto);

SELECT* FROM puestos_018 LIMIT 1; 

-- 2. Saber qué artículos ha vendido cada empleado.
-- vista de los articulos que ha vendido cada empleado
-- Utilizando solo nombre y articulo 
CREATE VIEW empleado_articulos_018 AS
SELECT concat(e.nombre, ' ', e.apellido_paterno) AS 'Nombre', a.nombre AS 'Articulo'
FROM venta AS v
JOIN empleado AS e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo
ORDER BY nombre;
-- Utilizando clave
SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) Nombre, a.nombre Articulo
FROM venta AS v
JOIN empleado AS e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo
ORDER BY v.clave;
-- Consultando la vista
SELECT * FROM  empleado_articulos_018;

-- 3 Saber qué puesto ha tenido más ventas.
CREATE VIEW puesto_ventas_018 AS
SELECT p.nombre Puesto, count(v.id_venta) Total
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN puesto p
  ON e.id_puesto = p.id_puesto
GROUP BY p.nombre
ORDER BY Total DESC;
-- usando clave en lugar de id de venta, produce el mismo resultado.
SELECT p.nombre Puesto, count(v.clave) Total
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN puesto p
  ON e.id_puesto = p.id_puesto
GROUP BY p.nombre
ORDER BY Total DESC;
-- Consultando la vista
SELECT * FROM puesto_ventas_018 LIMIT 1;
