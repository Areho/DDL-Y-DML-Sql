USE productosDB;

DELIMITER //

CREATE PROCEDURE insertar_fabricante(IN _id INT, IN _nombre VARCHAR(100))
BEGIN
    INSERT INTO fabricante (id, nombre) VALUES (_id, _nombre);
END //

CREATE PROCEDURE insertar_producto(IN _nombre VARCHAR(100), IN _valor DECIMAL(10,2), IN _id_fabricante INT)
BEGIN
    INSERT INTO producto (nombre, valor, id_fabricante)
    VALUES (_nombre, _valor, _id_fabricante);
END //

DELIMITER ;

CALL insertar_fabricante(1, 'Asus');
CALL insertar_fabricante(2, 'Lenovo');
CALL insertar_fabricante(3, 'Hewlett-Packard');
CALL insertar_fabricante(4, 'Samsung');
CALL insertar_fabricante(5, 'Seagate');
CALL insertar_fabricante(6, 'Crucial');
CALL insertar_fabricante(7, 'Gigabyte');
CALL insertar_fabricante(8, 'Huawei');
CALL insertar_fabricante(9, 'Xiaomi');

CALL insertar_producto('Disco duro SATA3 1TB', 86.99, 5);
CALL insertar_producto('Memoria RAM DDR4 8GB', 120.00, 6);
CALL insertar_producto('Disco SSD 1 TB', 150.99, 4);
CALL insertar_producto('GeForce GTX 1050Ti', 185.00, 7);
CALL insertar_producto('GeForce GTX 1080 Xtreme', 755.00, 6);
CALL insertar_producto('Monitor 24 LED Full HD', 202.00, 1);
CALL insertar_producto('Monitor 27 LED Full HD', 245.99, 1);
CALL insertar_producto('Portátil Yoga 520', 559.00, 2);
CALL insertar_producto('Portátil Ideapd 320', 444.00, 2);
CALL insertar_producto('Impresora HP Deskjet 3720', 59.99, 3);
CALL insertar_producto('Impresora HP Laserjet Pro M26nw', 180.00, 3);
