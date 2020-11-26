-- Reto 3
-- Sergio Maldonado Rodriguez
-- Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.
USE tienda;
SELECT *
FROM puesto
ORDER BY salario DESC
LIMIT 5;
