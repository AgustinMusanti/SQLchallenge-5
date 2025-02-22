CREATE DATABASE IF NOT EXISTS blue_patagon_joins;
USE blue_patagon_joins;

CREATE TABLE clientes (
    cliente_id      INT PRIMARY KEY,
    nombre_cliente  VARCHAR(50),
    cliente_pais    VARCHAR(50)
);


CREATE TABLE productos (
    producto_id     INT PRIMARY KEY,
    nombre_producto VARCHAR(50),
    categoria       VARCHAR(50)
);


CREATE TABLE ventas (
    venta_id        INT PRIMARY KEY,
    cliente_id      INT,
    producto_id     INT,
    cantidad        INT,
    fecha_venta     DATE,
    FOREIGN KEY (cliente_id)  REFERENCES clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);


INSERT INTO clientes (cliente_id, nombre_cliente, cliente_pais) 
VALUES
(1, 'Juan Pérez', 'Argentina'),
(2, 'Ana Torres', 'Chile'),
(3, 'Carlos Sánchez', 'Perú'),
(4, 'Laura Gómez', 'Argentina');

INSERT INTO productos (producto_id, nombre_producto, categoria) 
VALUES
(101, 'Laptop', 'Tecnología'),
(102, 'Celular', 'Tecnología'),
(103, 'Zapatillas', 'Indumentaria'),
(104, 'Tablet', 'Tecnología');

INSERT INTO ventas (venta_id, cliente_id, producto_id, cantidad, fecha_venta) 
VALUES
(1001, 1, 101, 1, '2023-09-01'),
(1002, 2, 103, 2, '2023-09-05'),
(1003, 3, 102, 1, '2023-09-10'),
(1004, 1, 104, 1, '2023-09-12');

