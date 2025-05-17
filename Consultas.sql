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

	-- 1.1.4 Consultas multitabla (Composición interna)
-- 1
-- sql 1
SELECT p.nombre, p.valor, f.nombre FROM producto p, fabricante f WHERE p.id_fabricante = f.id;
-- sql 2
SELECT p.nombre, p.valor, f.nombre FROM producto p JOIN fabricante f ON p.id_fabricante = f.id;

-- 2
-- sql 1
SELECT p.nombre, p.valor, f.nombre FROM producto p, fabricante f WHERE p.id_fabricante = f.id ORDER BY f.nombre ASC;
-- sql 2
SELECT p.nombre, p.valor, f.nombre FROM producto p JOIN fabricante f ON p.id_fabricante = f.id ORDER BY f.nombre ASC;

-- 3
-- sql 1
SELECT p.id, p.nombre, f.id, f.nombre FROM producto p, fabricante f WHERE p.id_fabricante = f.id;
-- sql 2
SELECT p.id, p.nombre, f.id, f.nombre FROM producto p JOIN fabricante f ON p.id_fabricante = f.id;

-- 4
-- sql 1
SELECT p.nombre, p.valor, f.nombre FROM producto p, fabricante f WHERE p.id_fabricante = f.id ORDER BY p.valor ASC LIMIT 1;
-- sql 2
SELECT p.nombre, p.valor, f.nombre FROM producto p JOIN fabricante f ON p.id_fabricante = f.id ORDER BY p.valor ASC LIMIT 1;

-- 5
-- sql 1
SELECT p.nombre, p.valor, f.nombre FROM producto p, fabricante f WHERE p.id_fabricante = f.id ORDER BY p.valor DESC LIMIT 1;
-- sql 2
SELECT p.nombre, p.valor, f.nombre FROM producto p JOIN fabricante f ON p.id_fabricante = f.id ORDER BY p.valor DESC LIMIT 1;

-- 6
-- sql 1
SELECT p.* FROM producto p, fabricante f WHERE p.id_fabricante = f.id AND f.nombre = 'Lenovo';
-- sql 2
SELECT p.* FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Lenovo';

-- 7
-- sql 1
SELECT p.* FROM producto p, fabricante f WHERE p.id_fabricante = f.id AND f.nombre = 'Crucial' AND p.valor > 200;
-- sql 2
SELECT p.* FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Crucial' AND p.valor > 200;

-- 8
-- sql 1
SELECT p.* FROM producto p, fabricante f WHERE p.id_fabricante = f.id AND (f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate');
-- sql 2
SELECT p.* FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 9
-- sql 1
SELECT p.* FROM producto p, fabricante f WHERE p.id_fabricante = f.id AND f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
-- sql 2
SELECT p.* FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10
-- sql 1
SELECT p.nombre, p.valor FROM producto p, fabricante f WHERE p.id_fabricante = f.id AND f.nombre LIKE '%e';
-- sql 2
SELECT p.nombre, p.valor FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE '%e';

-- 11
-- sql 1
SELECT p.nombre, p.valor FROM producto p, fabricante f WHERE p.id_fabricante = f.id AND f.nombre LIKE '%w%';
-- sql 2
SELECT p.nombre, p.valor FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE '%w%';

-- 12
-- sql 1
SELECT p.nombre, p.valor, f.nombre FROM producto p, fabricante f WHERE p.id_fabricante = f.id AND p.valor >= 180 ORDER BY p.valor DESC, p.nombre ASC;
-- sql 2
SELECT p.nombre, p.valor, f.nombre FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE p.valor >= 180 ORDER BY p.valor DESC, p.nombre ASC;

-- 13
-- sql 1
SELECT DISTINCT f.id, f.nombre FROM fabricante f, producto p WHERE p.id_fabricante = f.id;
-- sql 2
SELECT DISTINCT f.id, f.nombre FROM fabricante f JOIN producto p ON p.id_fabricante = f.id;

	-- 1.1.5 Consultas multitabla (Composición externa)
-- 1
SELECT f.nombre AS fabricante, p.nombre AS producto FROM fabricante f LEFT JOIN producto p ON f.id = p.id_fabricante;

-- 2
SELECT f.nombre AS fabricante FROM fabricante f LEFT JOIN producto p ON f.id = p.id_fabricante WHERE p.id IS NULL;

-- 3 (Verificación práctica)
SELECT * FROM producto p RIGHT JOIN fabricante f ON p.id_fabricante = f.id WHERE f.id IS NULL;


  -- 1.1.6 Consultas resumen
-- 1
SELECT COUNT(*) AS total_productos FROM producto;

-- 2
SELECT COUNT(*) AS total_fabricantes FROM fabricante;

-- 3
SELECT COUNT(DISTINCT id_fabricante) AS fabricantes_diferentes FROM producto;

-- 4
SELECT AVG(valor) AS precio_promedio FROM producto;

-- 5
SELECT MIN(valor) AS precio_minimo FROM producto;

-- 6
SELECT MAX(valor) AS precio_maximo FROM producto;

-- 7
SELECT nombre, valor FROM producto ORDER BY valor ASC LIMIT 1;

-- 8
SELECT nombre, valor FROM producto ORDER BY valor DESC LIMIT 1;

-- 9
SELECT SUM(valor) AS suma_total FROM producto;

-- 10
SELECT COUNT(*) AS total FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 11
SELECT AVG(p.valor) AS promedio FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 12
SELECT MIN(p.valor) AS precio_minimo FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 13
SELECT MAX(p.valor) AS precio_maximo FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 14
SELECT SUM(p.valor) AS suma FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 15
SELECT 
  MAX(p.valor) AS maximo,
  MIN(p.valor) AS minimo,
  AVG(p.valor) AS promedio,
  COUNT(*) AS total
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE f.nombre = 'Crucial';

-- 16
SELECT f.nombre, COUNT(p.id) AS total FROM fabricante f LEFT JOIN producto p ON f.id = p.id_fabricante GROUP BY f.nombre ORDER BY total DESC;

-- 17
SELECT f.nombre, MAX(p.valor) AS maximo, MIN(p.valor) AS minimo, AVG(p.valor) AS promedio FROM fabricante f JOIN producto p ON f.id = p.id_fabricante GROUP BY f.nombre;

-- 18
SELECT p.id_fabricante FROM producto p GROUP BY p.id_fabricante HAVING AVG(p.valor) > 200;

-- 19
SELECT f.nombre, MAX(p.valor) AS maximo, MIN(p.valor) AS minimo, AVG(p.valor) AS promedio, COUNT(*) AS total FROM fabricante f JOIN producto p ON f.id = p.id_fabricante GROUP BY f.nombre HAVING AVG(p.valor) > 200;

-- 20
SELECT COUNT(*) AS total FROM producto WHERE valor >= 180;

-- 21
SELECT f.nombre, COUNT(p.id) AS total FROM fabricante f JOIN producto p ON f.id = p.id_fabricante WHERE p.valor >= 180 GROUP BY f.nombre;

-- 22
SELECT id_fabricante, AVG(valor) AS promedio FROM producto GROUP BY id_fabricante;

-- 23
SELECT f.nombre, AVG(p.valor) AS promedio FROM fabricante f JOIN producto p ON f.id = p.id_fabricante GROUP BY f.nombre;

-- 24
SELECT f.nombre FROM fabricante f JOIN producto p ON f.id = p.id_fabricante GROUP BY f.nombre HAVING AVG(p.valor) >= 150;

-- 25
SELECT f.nombre FROM fabricante f JOIN producto p ON f.id = p.id_fabricante GROUP BY f.nombre HAVING COUNT(p.id) >= 2;

-- 26
SELECT f.nombre, COUNT(p.id) AS total FROM fabricante f JOIN producto p ON f.id = p.id_fabricante WHERE p.valor >= 220 GROUP BY f.nombre;

-- 27
SELECT f.nombre, COUNT(p.id) AS total FROM fabricante f LEFT JOIN producto p ON f.id = p.id_fabricante AND p.valor >= 220 GROUP BY f.nombre;

-- 28
SELECT f.nombre FROM fabricante f JOIN producto p ON f.id = p.id_fabricante GROUP BY f.nombre HAVING SUM(p.valor) > 1000;

-- 29
SELECT p.nombre, p.valor, f.nombre
FROM producto p
JOIN fabricante f ON p.id_fabricante = f.id
WHERE (p.id, p.valor) IN (
    SELECT p2.id, MAX(p2.valor)
    FROM producto p2
    GROUP BY p2.id_fabricante
)
ORDER BY f.nombre ASC;

		-- 1.1.7 Subconsultas (En la cláusula WHERE)
	-- 1.1.7.1 Con operadores básicos de comparación
-- 1
SELECT * FROM producto WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Lenovo');

-- 2
SELECT * FROM producto WHERE valor = (SELECT MAX(valor) FROM producto WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Lenovo'));

-- 3
SELECT nombre
FROM producto
WHERE valor = (
    SELECT MAX(valor)
    FROM producto
    WHERE id_fabricante = (
        SELECT id FROM fabricante WHERE nombre = 'Lenovo'
    )
)
AND id_fabricante = (
    SELECT id FROM fabricante WHERE nombre = 'Lenovo'
);

-- 4
SELECT nombre
FROM producto
WHERE valor = (
    SELECT MIN(valor)
    FROM producto
    WHERE id_fabricante = (
        SELECT id FROM fabricante WHERE nombre = 'Hewlett-Packard'
    )
)
AND id_fabricante = (
    SELECT id FROM fabricante WHERE nombre = 'Hewlett-Packard'
);

-- 5
SELECT *
FROM producto
WHERE valor >= (
    SELECT MAX(valor)
    FROM producto
    WHERE id_fabricante = (
        SELECT id FROM fabricante WHERE nombre = 'Lenovo'
    )
);

-- 6
SELECT *
FROM producto
WHERE id_fabricante = (
    SELECT id FROM fabricante WHERE nombre = 'Asus'
)
AND valor > (
    SELECT AVG(valor)
    FROM producto
    WHERE id_fabricante = (
        SELECT id FROM fabricante WHERE nombre = 'Asus'
    )
);

	-- 1.1.7.2 Subconsultas con ALL y ANY
-- 7
SELECT * FROM producto WHERE valor >= ALL (SELECT valor FROM producto);

-- 8
SELECT * FROM producto WHERE valor <= ALL (SELECT valor FROM producto);

-- 9
SELECT nombre FROM fabricante WHERE id = ANY (SELECT id_fabricante FROM producto);

-- 10
SELECT nombre FROM fabricante WHERE id <> ALL (SELECT id_fabricante FROM producto);

	-- 1.1.7.3 Subconsultas con IN y NOT IN
-- 11
SELECT nombre FROM fabricante WHERE id IN (SELECT id_fabricante FROM producto);

-- 12
SELECT nombre FROM fabricante WHERE id NOT IN (SELECT id_fabricante FROM producto);

	-- 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
-- 13
SELECT nombre FROM fabricante f WHERE EXISTS (SELECT 1 FROM producto p WHERE p.id_fabricante = f.id);

-- 14
SELECT nombre FROM fabricante f WHERE NOT EXISTS (SELECT 1 FROM producto p WHERE p.id_fabricante = f.id);

	-- 1.1.7.5 Subconsultas correlacionadas
-- 15
SELECT f.nombre AS fabricante, p.nombre AS producto, p.valor
FROM fabricante f
JOIN producto p ON f.id = p.id_fabricante
WHERE p.valor = (
    SELECT MAX(p2.valor)
    FROM producto p2
    WHERE p2.id_fabricante = f.id
);

-- 16
SELECT p.*
FROM producto p
WHERE p.valor >= (
    SELECT AVG(p2.valor)
    FROM producto p2
    WHERE p2.id_fabricante = p.id_fabricante
);

-- 17
SELECT nombre
FROM producto
WHERE valor = (
    SELECT MAX(valor)
    FROM producto
    WHERE id_fabricante = (
        SELECT id FROM fabricante WHERE nombre = 'Lenovo'
    )
)
AND id_fabricante = (
    SELECT id FROM fabricante WHERE nombre = 'Lenovo'
);

	-- 1.1.8 Subconsultas (En la cláusula HAVING)
-- 18
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.id = p.id_fabricante
GROUP BY f.id, f.nombre
HAVING COUNT(p.id) = (
    SELECT COUNT(*)
    FROM producto
    WHERE id_fabricante = (
        SELECT id FROM fabricante WHERE nombre = 'Lenovo'
    )
);

