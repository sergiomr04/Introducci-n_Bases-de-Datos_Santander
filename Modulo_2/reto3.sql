/* Reto 3: Agrupamientos 
Sergio Maldonado Rodriguez */
-- ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) AS registros FROM puesto GROUP BY nombre;
-- ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) AS salario_puesto FROM puesto GROUP BY nombre;
#SELECT id_puesto,nombre, sum(salario) AS salario_puesto FROM puesto GROUP BY id_puesto; -- id puede agrupar doferentes puestos
-- ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(clave) AS total_ventas FROM venta GROUP BY id_empleado;
-- ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) AS Total_ventas FROM venta GROUP BY id_articulo;