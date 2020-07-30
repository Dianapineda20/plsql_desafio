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

CREATE TABLE categoria(
 id_categoria SERIAL PRIMARY KEY,
 nombre VARCHAR,
 descripcion VARCHAR
);

CREATE TABLE factura(
id_factura SERIAL PRIMARY KEY,
fecha TIMESTAMP,
subtotal INT,
id SERIAL REFERENCES cliente(id)
);

CREATE TABLE factura_producto(
id_factura INT,
id_producto INT,
cantidad INT,
FOREIGN KEY (id_factura) REFERENCES factura(id_factura),
FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);


