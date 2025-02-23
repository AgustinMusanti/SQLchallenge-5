## 1- INNER JOIN

SELECT 
    c.nombre_cliente  AS cliente,
    p.nombre_producto AS producto
  
FROM ventas v
  
INNER JOIN clientes c  ON v.cliente_id = c.cliente_id
INNER JOIN productos p ON v.producto_id = p.producto_id;


## 2- LEFT JOIN

SELECT 
    c.nombre_cliente  AS cliente,
    p.nombre_producto AS producto
    
FROM clientes c
    
LEFT JOIN ventas v    ON c.cliente_id = v.cliente_id
LEFT JOIN productos p ON v.producto_id = p.producto_id;


## 3- RIGHT JOIN

SELECT 
    p.nombre_producto AS producto,
    c.nombre_cliente  AS cliente
    
FROM ventas v
    
RIGHT JOIN productos p ON v.producto_id = p.producto_id
LEFT JOIN clientes c   ON v.cliente_id = c.cliente_id;


## 4- FULL OUTER JOIN

-- Como MYSQL no soporta directamente a FULL OUTER JOIN, lo simulo usando UNION entre un LEFT JOIN y otro
    
SELECT 
    c.nombre_cliente  AS cliente,
    p.nombre_producto AS producto
    
FROM clientes c
    
LEFT JOIN ventas v    ON c.cliente_id = v.cliente_id
LEFT JOIN productos p ON v.producto_id = p.producto_id

UNION

SELECT 
    c.nombre_cliente  AS cliente,
    p.nombre_producto AS producto
    
FROM productos p
    
LEFT JOIN ventas v   ON p.producto_id = v.producto_id
LEFT JOIN clientes c ON v.cliente_id = c.cliente_id;


## 5- JOIN + FILTRO
    
SELECT 
    c.nombre_cliente  AS cliente,
    p.nombre_producto AS producto,
    v.fecha_venta     AS fecha
    
FROM ventas v
    
INNER JOIN clientes c  ON v.cliente_id = c.cliente_id
INNER JOIN productos p ON v.producto_id = p.producto_id
WHERE c.cliente_pais = 'Argentina';


## 6- JOIN anidado
    
SELECT 
    categoria,
    COUNT(*) AS total_vendidos
    
FROM (
    SELECT 
        p.categoria
    
    FROM ventas v
    
    INNER JOIN productos p ON v.producto_id = p.producto_id
)   AS ventas_por_categoria
    
GROUP BY categoria;


## Bonus

-- 1. INNER JOIN
    
## ¿Cuándo usarlo?

-- *Cuando solo te interesan los registros que tienen coincidencia en ambas tablas.
-- *Ideal para análisis donde los datos incompletos no son relevantes.
    
-- Ejemplo: Mostrar clientes que realmente realizaron compras.

SELECT c.nombre_cliente, p.nombre_producto
FROM clientes c
INNER JOIN ventas v ON c.cliente_id = v.cliente_id
INNER JOIN productos p ON v.producto_id = p.producto_id;

Resultado: Solo verás a los clientes que compraron algo. Los que no realizaron compras quedan afuera.

🔙 2. LEFT JOIN (o LEFT OUTER JOIN)
🔍 ¿Cuándo usarlo?

Cuando querés todos los registros de la tabla principal (izquierda), aunque no tengan coincidencia en la tabla relacionada.
Útil para detectar datos faltantes o inactividad.
🎯 Ejemplo: Mostrar todos los clientes, aunque no hayan comprado.

sql
Copiar
Editar
SELECT c.nombre_cliente, p.nombre_producto
FROM clientes c
LEFT JOIN ventas v ON c.cliente_id = v.cliente_id
LEFT JOIN productos p ON v.producto_id = p.producto_id;
📝 Resultado: Los clientes sin compras aparecen con NULL en la columna del producto.

🔜 3. RIGHT JOIN (o RIGHT OUTER JOIN)
🔍 ¿Cuándo usarlo?

Cuando te interesan todos los registros de la tabla secundaria (derecha) y solo los coincidentes de la principal.
Perfecto para monitorear productos sin vender o servicios sin uso.
🎯 Ejemplo: Mostrar todos los productos, se hayan vendido o no.

sql
Copiar
Editar
SELECT p.nombre_producto, c.nombre_cliente
FROM ventas v
RIGHT JOIN productos p ON v.producto_id = p.producto_id
LEFT JOIN clientes c ON v.cliente_id = c.cliente_id;
📝 Resultado: Los productos no vendidos se mostrarán con NULL en el campo cliente.

🔗 4. FULL OUTER JOIN (Simulado en MySQL con UNION)
🔍 ¿Cuándo usarlo?

Cuando querés obtener todos los registros de ambas tablas, coincidan o no.
Muy útil para análisis completos que incluyan actividad y falta de actividad.
🎯 Ejemplo: Mostrar todos los clientes y todos los productos, hayan participado o no en ventas.

sql
Copiar
Editar
SELECT c.nombre_cliente, p.nombre_producto
FROM clientes c
LEFT JOIN ventas v ON c.cliente_id = v.cliente_id
LEFT JOIN productos p ON v.producto_id = p.producto_id

UNION

SELECT c.nombre_cliente, p.nombre_producto
FROM productos p
LEFT JOIN ventas v ON p.producto_id = v.producto_id
LEFT JOIN clientes c ON v.cliente_id = c.cliente_id;
📝 Resultado:

Clientes sin compras ➡ NULL en producto.
Productos sin ventas ➡ NULL en cliente.
🏗 5. CROSS JOIN
🔍 ¿Cuándo usarlo?

Cuando necesitás todas las combinaciones posibles entre los registros de dos tablas.
Se usa en escenarios como creación de escenarios hipotéticos o testing.
🎯 Ejemplo: Combinar todos los clientes con todos los productos.

sql
Copiar
Editar
SELECT c.nombre_cliente, p.nombre_producto
FROM clientes c
CROSS JOIN productos p;
📝 Resultado: Cada cliente aparece combinado con todos los productos, generando un producto cartesiano.



