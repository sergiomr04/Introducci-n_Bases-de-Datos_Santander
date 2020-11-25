-- Reto 1
-- Sergio MAldonado Rodriguez
-- Definir los campos y tipos de datos para la tabla movies haciendo uso de los archivos movies.dat y README.
-- Crear la tabla movies (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos).
-- Definir los campos y tipos de datos para la tabla ratings haciendo uso de los archivos ratings.dat y README.
-- Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)

CREATE DATABASE IF NOT EXISTS bedu_test_2;
USE bedu_test_2;
CREATE TABLE users(
id INT PRIMARY KEY,
genero CHAR(1),
edad INT,
ocupacion INT,
cp VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS moviratingses (
   id INT PRIMARY KEY, 
   titulo VARCHAR(70), 
   generos VARCHAR(100)
); 


CREATE TABLE IF NOT EXISTS ratings (
   userid INT,
   movieid INT, 
   rating INT, 
   time_stamp BIGINT,
   FOREIGN KEY (userid) REFERENCES users(id),
   FOREIGN KEY (movieid) REFERENCES movies(id)
);

SELECT* FROM ratings;
