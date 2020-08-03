NOTA:  Mirson  perdoname la vida, el ID del cliente me quedo solo ID,
 estoy conciente que es poco descriptivo pero se me paso... ojala no sea tan malo :(
     

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

INSERT INTO cliente ("nombre", "rut", "direccion") VALUES ('tania', '234556720', 'valles345');
INSERT INTO cliente ("nombre", "rut", "direccion") VALUES ('raul', '224556720', 'molina 30');
INSERT INTO cliente ("nombre", "rut", "direccion") VALUES ('juan', '198734730', 'los rios 245');
INSERT INTO cliente ("nombre", "rut", "direccion") VALUES ('flor', '123455732', 'montaña 1245');
INSERT INTO cliente ("nombre", "rut", "direccion") VALUES ('marcos', '123456789', 'horizonte 123');


INSERT INTO producto  ("valor_unitario", "producto", "descripcion") VALUES ('50', 'tornillo', 'tornillo estrella');
INSERT INTO producto  ("valor_unitario", "producto", "descripcion") VALUES ('25', 'broca', 'para tornillo estrella');
INSERT INTO producto  ("valor_unitario", "producto", "descripcion") VALUES ('100', 'cemento', 'gris y blanco');
INSERT INTO producto  ("valor_unitario", "producto", "descripcion") VALUES ('80', 'teja', 'tamaño grande');
INSERT INTO producto  ("valor_unitario", "producto", "descripcion") VALUES ('40', 'teja', 'tamaño chico');
INSERT INTO producto  ("valor_unitario", "producto", "descripcion") VALUES ('60', 'pintura blanca', 'tipo esmalte');
INSERT INTO producto  ("valor_unitario", "producto", "descripcion") VALUES ('15', 'brocha', 'tamaño grande');
INSERT INTO producto  ("valor_unitario", "producto", "descripcion") VALUES ('150', 'silla', 'reclinable');


INSERT INTO categoria("nombre", "descripcion") VALUES ('construccion', 'material para construccion');
INSERT INTO categoria("nombre", "descripcion") VALUES ('pintura', 'insumos pintura');
INSERT INTO categoria("nombre", "descripcion") VALUES ('tornillos', 'insumos y tornillos');


INSERT INTO factura("fecha", "id") VALUES ( '05 05 2020', '1');
INSERT INTO factura("fecha", "id") VALUES ( '02 05 2020', '1');
INSERT INTO factura("fecha", "id") VALUES ( '03 04 2020', '2');
INSERT INTO factura("fecha", "id") VALUES ( '04 02 2020', '2');
INSERT INTO factura("fecha", "id") VALUES ( '04 04 2020', '2');
INSERT INTO factura("fecha", "id") VALUES ( '04 05 2020', '3');
INSERT INTO factura("fecha", "id") VALUES ( '04 05 2020', '3');
INSERT INTO factura("fecha", "id") VALUES ( '10 05 2020', '4');
INSERT INTO factura("fecha", "id") VALUES ( '15 05 2020', '4');
INSERT INTO factura("fecha", "id") VALUES ( '20 05 2020', '4');
INSERT INTO factura("fecha", "id") VALUES ( '20 06 2020', '4');


INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '1', '3', '1')
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '1', '5', '1');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '2', '2', '3');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '3', '3', '2');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '3', '4', '1');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '4', '6', '2');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '5', '7', '2');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '5', '4', '1');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '6', '8', '1');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '7', '1', '2');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '8', '6', '2');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '8', '4', '1');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '9', '7', '2');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '9', '3', '2');
INSERT INTO factura_producto("id_factura", "id_producto", "cantidad") VALUES ( '10', '4', '1');

UPDATE factura SET subtotal=140 WHERE id=1 and id_factura=1;
UPDATE factura SET subtotal=75 WHERE id=1 and id_factura=2;
UPDATE factura SET subtotal=280 WHERE id=1 and id_factura=3;
UPDATE factura SET subtotal=280 WHERE id=2 and id_factura=3;
UPDATE factura SET subtotal=60 WHERE id=2 and id_factura=4;
UPDATE factura SET subtotal=110 WHERE id=2 and id_factura=5;
UPDATE factura SET subtotal=150 WHERE id=3 and id_factura=6;
UPDATE factura SET subtotal=100 WHERE id=4 and id_factura=7;
UPDATE factura SET subtotal=200 WHERE id=4 and id_factura=8;
UPDATE factura SET subtotal=330 WHERE id=4 and id_factura=9;
UPDATE factura SET subtotal=80 WHERE id=4 and id_factura=10;

SELECT id, SUM(subtotal) AS total FROM factura GROUP BY id ORDER BY total DESC LIMIT 1;
SELECT * FROM (SELECT id, SUM(subtotal) AS total FROM factura GROUP BY id) AS subquery WHERE total > 200;
SELECT COUNT(id) FROM factura AS f INNER JOIN factura_producto AS fp ON f.id_factura=fp.id_factura WHERE fp.id_producto=6;
