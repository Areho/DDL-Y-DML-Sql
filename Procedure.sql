DELIMITER //

CREATE PROCEDURE insertar_fabricante(IN _nombre VARCHAR(100))
BEGIN
    INSERT INTO fabricante (nombre) VALUES (_nombre);
END //

CREATE PROCEDURE insertar_producto(IN _nombre VARCHAR(100), IN _valor DECIMAL(10,2), IN _id_fabricante INT)
BEGIN
    INSERT INTO producto (nombre, valor, id_fabricante)
    VALUES (_nombre, _valor, _id_fabricante);
END //

DELIMITER ;