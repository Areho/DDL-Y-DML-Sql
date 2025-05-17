DROP DATABASE IF EXISTS productosDB;
CREATE DATABASE IF NOT EXISTS productosDB;
USE productosDB;

CREATE TABLE fabricante (
    id INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100)
);

CREATE TABLE producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    valor DECIMAL(10,2),
    id_fabricante INT,
    FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);