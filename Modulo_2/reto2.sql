/* Reto 2: Funciones de agrupamiento 
Sergio Maldonado Rodriguez */
USE tienda;
-- ¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario) FROM puesto;
-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(nombre) FROM articulo WHERE nombre LIKE "%Pasta%";
-- ¿Cuál es el salario mínimo y máximo?
#SELECT min(salario),max(salario) FROM puesto;
SELECT max(salario) AS "salario maximo", min(salario) AS "salario minimo" FROM puesto;

-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT max(id_puesto) - 5 FROM puesto;
SELECT sum(salario) FROM puesto WHERE id_puesto>995;
SELECT sum(salario) FROM puesto WHERE id_puesto >= (SELECT max(id_puesto) - 5); -- No filtra los datos antes de hacer la operacion
#SELECT sum(salario) FROM puesto ORDER BY id_puesto DESC LIMIT 5; 
#SELECT sum(salario) FROM (select * from puesto order by id_puesto desc limit 5) --Solucion alternativa
