/* Reto 1: Subconsultas
Sergio Maldonado Rodriguez */

-- 1 ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT id_puesto
      FROM puesto
      WHERE salario < 10000;
      
SELECT nombre, apellido_paterno
FROM empleado
WHERE id_puesto IN
 (SELECT id_puesto
      FROM puesto
      WHERE salario < 10000);

-- 2 ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total), max(total)
FROM (SELECT clave, id_empleado, count(*) AS 'total'
      FROM venta
      GROUP BY clave, id_empleado) AS subconsulta
GROUP BY id_empleado;

-- 3 ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
-- explain analyze sirve para medir el tiempo y una descripcion del proceso de query
-- Dos posibles Soluciones 
EXPLAIN ANALYZE SELECT DISTINCT clave, id_articulo FROM venta
 WHERE id_articulo IN (SELECT id_articulo FROM
 articulo WHERE precio > 5000);
EXPLAIN ANALYZE SELECT DISTINCT v.clave
FROM venta AS v
WHERE id_articulo IN 
	(SELECT a.id_articulo 
	FROM articulo AS a 
	WHERE precio > 5000);
