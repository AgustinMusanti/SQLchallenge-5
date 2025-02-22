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




