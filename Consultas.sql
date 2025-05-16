USE productosDB;

-- 1
SELECT nombre FROM producto;

-- 2
SELECT nombre, valor FROM producto;

-- 3
SELECT * FROM producto;

-- 4
SELECT nombre, valor, ROUND(valor * 1.1, 2) AS dolares FROM producto;

-- 5
SELECT nombre AS 'nombre de producto', valor AS euros, ROUND(valor * 1.1, 2) AS dolares FROM producto;

-- 6
SELECT UPPER(nombre) AS nombre_mayuscula, valor AS precio FROM producto;

-- 7
SELECT LOWER(nombre) AS nombre_minuscula, valor AS precio FROM producto;

-- 8
SELECT nombre AS fabricante, UPPER(LEFT(nombre, 2)) AS iniciales FROM fabricante;

-- 9
SELECT nombre, ROUND(valor) AS precio_redondeado FROM producto;

-- 10
SELECT nombre, TRUNCATE(valor, 0) AS precio_truncado FROM producto;

-- 11
SELECT DISTINCT id_fabricante FROM producto;

-- 12 (Distinct ya elimina los duplicados)
SELECT DISTINCT id_fabricante FROM producto;

-- 13
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15
SELECT nombre, valor FROM producto ORDER BY nombre ASC, valor DESC;

-- 16
SELECT * FROM fabricante LIMIT 5;

-- 17
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18
SELECT nombre, valor FROM producto ORDER BY valor ASC LIMIT 1;

-- 19
SELECT nombre, valor FROM producto ORDER BY valor DESC LIMIT 1;

-- 20
SELECT nombre FROM producto WHERE id_fabricante = 2;

-- 21
SELECT nombre FROM producto WHERE valor <= 120;

-- 22
SELECT nombre FROM producto WHERE valor >= 400;

-- 23
SELECT nombre FROM producto WHERE valor < 400;

-- 24
SELECT nombre FROM producto WHERE valor >= 80 AND valor <= 300;

-- 25
SELECT nombre FROM producto WHERE valor BETWEEN 60 AND 200;

-- 26
SELECT nombre FROM producto WHERE valor > 200 AND id_fabricante = 6;

-- 27
SELECT nombre FROM producto WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5;

-- 28
SELECT nombre FROM producto WHERE id_fabricante IN (1, 3, 5);

-- 29
SELECT nombre, valor * 100 AS centimos FROM producto;

-- 30
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';

-- 31
SELECT nombre FROM fabricante WHERE nombre LIKE '%e';

-- 32
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

-- 33
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;

-- 34
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

-- 35 
SELECT nombre FROM producto WHERE nombre LIKE '%Monitor%' AND valor < 215;

-- 36
SELECT nombre, valor FROM producto WHERE valor >= 180 ORDER BY valor DESC, nombre ASC;


-- 1