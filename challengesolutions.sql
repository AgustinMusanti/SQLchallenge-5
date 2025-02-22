## 1- INNER JOIN

SELECT 
    c.nombre_cliente  AS cliente,
    p.nombre_producto AS producto
  
FROM ventas v
  
INNER JOIN clientes c  ON v.cliente_id = c.cliente_id
INNER JOIN productos p ON v.producto_id = p.producto_id;


