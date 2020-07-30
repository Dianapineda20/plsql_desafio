CREATE DATABASE prueba;
CREATE TABLE cliente(
 id SERIAL PRIMARY KEY,
 nombre VARCHAR,
 rut INT,
 direccion VARCHAR
);

CREATE TABLE producto(
 id_producto SERIAL PRIMARY KEY,
valor_unitario INT,
producto VARCHAR,
descripcion VARCHAR
 );
