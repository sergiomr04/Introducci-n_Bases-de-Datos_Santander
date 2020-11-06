/* Reto 2: Joins
Sergio Maldonado Rodriguez */

-- 1. ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT v.clave, e.nombre, e.apellido_paterno
FROM venta AS v
JOIN empleado AS e
  ON v.id_empleado = e.id_empleado
ORDER BY clave;
-- otra opcion evitando nombre repetidos
SELECT DISTINCT e.nombre, e.apellido_paterno
FROM venta AS v
JOIN empleado AS e
  USING (id_empleado)
ORDER BY nombre;
-- una opcion con formato
SELECT concat(e.nombre," " ,e.apellido_paterno," ", e.apellido_materno), venta.clave 
FROM empleado AS e 
INNER JOIN venta 
ON e.id_empleado=venta.id_empleado;
-- sin formato
SELECT e.nombre, e.apellido_paterno, e.apellido_materno, venta.clave 
FROM empleado AS e 
INNER JOIN venta 
ON e.id_empleado=venta.id_empleado;

-- 2. ¿Cuál es el nombre de los artículos que se han vendido?
SELECT clave, nombre
FROM venta 
JOIN articulo 
  ON venta.id_articulo = articulo.id_articulo
ORDER BY nombre;
-- Quitando duplicados
SELECT DISTINCT nombre
FROM venta 
JOIN articulo 
  ON venta.id_articulo = articulo.id_articulo
ORDER BY nombre;
-- otra opcion
SELECT v.id_venta, a.nombre
FROM venta AS v
JOIN articulo AS a
ON v.id_articulo = a.id_articulo
ORDER BY v.id_venta;
-- tercera idea
SELECT DISTINCT articulo.nombre 
FROM articulo 
INNER JOIN venta 
ON articulo.id_articulo=venta=id_articulo;

-- 3 ¿Cuál es el total de cada venta?
SELECT clave, round(sum(precio),2) AS total
FROM venta AS venta
JOIN articulo AS articulo
  ON venta.id_articulo = articulo.id_articulo -- USING (id_articulo) si en ambas tablas se llaman igual lo podemos sustituir 
GROUP BY clave
ORDER BY clave;
-- agrupando en base al id de la venta
SELECT id_venta, round(sum(precio),2) AS total
FROM venta AS venta
JOIN articulo AS articulo
  ON venta.id_articulo = articulo.id_articulo -- USING (id_articulo) si en ambas tablas se llaman igual lo podemos sustituir 
GROUP BY id_venta
ORDER BY id_venta;
-- Where option ya no es comun por su ambiguedad 
SELECT venta.clave, sum(articulo.precio) as totalVenta
FROM venta ,articulo where
venta.id_articulo=articulo.id_articulo
group by clave
order by clave;




