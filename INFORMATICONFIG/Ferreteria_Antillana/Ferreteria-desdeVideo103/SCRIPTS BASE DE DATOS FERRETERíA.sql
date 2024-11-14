create database Produccion;

use Produccion;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    clave varchar(20) not null,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    departamento VARCHAR(50),
    puesto VARCHAR(80) NOT NULL
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    existencia INT NOT NULL,
    id_categoria INT,
    fecha_ingreso DATE,
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE almacen (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    tipo_movimiento ENUM('entrada', 'salida') NOT NULL,
    cantidad INT NOT NULL,
    fecha_movimiento DATE,
    CONSTRAINT fk_producto_almacen FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15)
);
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_venta DATE,
    total_venta DECIMAL(10, 2),
    CONSTRAINT fk_cliente_venta FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detalle_venta (
    id_detalle_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2),
    CONSTRAINT fk_venta FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO usuarios (nombre_usuario, clave, nombre, apellido, departamento, puesto) VALUES
('admin1', 'abc123', 'Carlos', 'Gómez', 'Administración', 'Gerente General'),
('vendedor1', 'venderBien2', 'María', 'Fernández', 'Ventas', 'Vendedor'),
('cajero1', 'cajero1234', 'Luis', 'Pérez', 'Cajas', 'Cajero'),
('almacenista1', 'almacen123', 'Ana', 'Ramírez', 'Almacén', 'Almacenista'),
('contador1', 'contarTodo1', 'Jorge', 'López', 'Contabilidad', 'Contador'),
('vendedor2', 'ventaFeliz2', 'Sofía', 'Hernández', 'Ventas', 'Vendedor'),
('cajero2', 'claveSegura3', 'Diego', 'Torres', 'Cajas', 'Cajero'),
('almacenista2', 'almacenSeguro4', 'Lucía', 'Martínez', 'Almacén', 'Almacenista'),
('gerente1', 'gerente1234', 'Pedro', 'García', 'Administración', 'Gerente'),
('vendedor3', 'vendeRápido5', 'Valentina', 'Sánchez', 'Ventas', 'Vendedor'),
('cajero3', 'cajeroFácil6', 'Fernando', 'Jiménez', 'Cajas', 'Cajero'),
('almacenista3', 'almacenCuidado7', 'Isabel', 'Ramírez', 'Almacén', 'Almacenista'),
('contador2', 'contabilidad8', 'Santiago', 'Mendoza', 'Contabilidad', 'Contador'),
('vendedor4', 'venderSiempre9', 'Catalina', 'Rojas', 'Ventas', 'Vendedor'),
('cajero4', 'cajaCerrada0', 'Andrés', 'Castro', 'Cajas', 'Cajero'),
('almacenista4', 'almacenListo1', 'Natalia', 'Salazar', 'Almacén', 'Almacenista'),
('gerente2', 'gerente2022', 'Roberto', 'Bermúdez', 'Administración', 'Gerente'),
('vendedor5', 'vendedorFácil3', 'Diana', 'Vega', 'Ventas', 'Vendedor'),
('cajero5', 'cajeroRápido4', 'Mauricio', 'Patiño', 'Cajas', 'Cajero'),
('almacenista5', 'almacenSano5', 'Ximena', 'Suárez', 'Almacén', 'Almacenista'),
('contador3', 'contarBien6', 'Camilo', 'Aguilar', 'Contabilidad', 'Contador');



INSERT INTO categorias (nombre_categoria) 
VALUES 
('Herramientas de mano'),
('Herramientas eléctricas'),
('Materiales de construcción'),
('Accesorios y consumibles'),
('Seguridad industrial');

INSERT INTO productos (id_producto,nombre, descripcion, precio, existencia, id_categoria, fecha_ingreso) 
VALUES 
(1,'Martillo', 'Martillo de acero con mango de madera', 15.00, 100, 1, '2024-10-10'),
(2,'Destornillador', 'Set de destornilladores de diferentes tamaños', 10.50, 150, 1, '2024-10-12'),
(3,'Taladro', 'Taladro eléctrico con batería recargable', 120.00, 50, 2, '2024-10-08'),
(4,'Sierra de mano', 'Sierra de mano de 20 pulgadas', 25.00, 75, 1, '2024-09-15'),
(5,'Cinta métrica', 'Cinta métrica de 5 metros', 5.00, 200, 3, '2024-10-01'),
(6,'Llave inglesa', 'Llave ajustable de acero al carbono', 12.00, 80, 1, '2024-10-01'),
(7,'Alicates', 'Alicates de agarre fuerte, 8"', 9.50, 90, 1, '2024-09-20'),
(8,'Cortador de tubería', 'Cortador de tubería de 3 a 50 mm', 25.00, 40, 2, '2024-09-15'),
(9,'Batería de taladro', 'Batería recargable de 18V', 30.00, 60, 2, '2024-09-10'),
(10,'Guantes de trabajo', 'Guantes resistentes al corte', 7.00, 150, 4, '2024-09-05'),
(11,'Lija', 'Lija de papel, grano 120', 2.00, 200, 4, '2024-08-30'),
(12,'Escuadra', 'Escuadra de aluminio, 12"', 15.00, 75, 1, '2024-08-25'),
(13,'Brocas de acero', 'Set de brocas de 10 piezas', 20.00, 45, 2, '2024-08-20'),
(14,'Tijeras para jardín', 'Tijeras para poda de 8"', 18.00, 60, 3, '2024-08-15'),
(15,'Cinta aislante', 'Cinta aislante de 19 mm x 20 m', 3.00, 100, 4, '2024-08-10'),
(16,'Pintura en spray', 'Pintura en spray, color rojo', 8.00, 50, 3, '2024-08-05'),
(17,'Cemento', 'Cemento Portland, 50 kg', 7.00, 80, 3, '2024-07-30'),
(18,'Cal', 'Cal hidratada, 25 kg', 5.00, 100, 3, '2024-07-25'),
(19,'Varilla de acero', 'Varilla de acero de 1/2"', 1.50, 120, 3, '2024-07-20'),
(20,'Tablero de MDF', 'Tablero de MDF, 1.22 x 2.44 m', 45.00, 30, 3, '2024-07-15'),
(21,'Clavos', 'Clavos de acero, 1 kg', 3.50, 200, 4, '2024-07-10'),
(22,'Tornillos', 'Set de tornillos de diferentes tamaños', 4.00, 180, 4, '2024-07-05'),
(23,'Esmeriladora', 'Esmeriladora de banco, 8"', 150.00, 25, 2, '2024-06-30'),
(24,'Compresor de aire', 'Compresor de aire portátil', 300.00, 15, 2, '2024-06-25'),
(25,'Escalera de aluminio', 'Escalera de aluminio de 3 escalones', 75.00, 40, 1, '2024-06-20'),
(26,'Cubo de pintura', 'Cubo de pintura de 20 litros', 10.00, 50, 3, '2024-06-15'),
(27,'Manguera de jardín', 'Manguera de jardín de 30 metros', 20.00, 70, 4, '2024-06-10'),
(28,'Placas de yeso', 'Placas de yeso para construcción', 12.00, 60, 3, '2024-06-05'),
(29,'Ferrocemento', 'Ferrocemento, 1 kg', 1.20, 150, 3, '2024-06-01'),
(30,'Cinta métrica', 'Cinta métrica de 10 metros', 4.00, 80, 4, '2024-05-30'),
(31,'Nivel de burbuja', 'Nivel de burbuja de 24"', 10.00, 50, 1, '2024-05-25'),
(32,'Martillo de goma', 'Martillo de goma, 16 oz', 15.00, 90, 1, '2024-05-20'),
(33,'Bolsas de escombro', 'Bolsas de escombro, paquete de 10', 5.00, 120, 4, '2024-05-15'),
(34,'Fijaciones para techo', 'Fijaciones para techo de yeso, paquete de 100', 7.00, 200, 4, '2024-05-10'),
(35,'Kit de herramientas', 'Kit completo de herramientas, 100 piezas', 250.00, 30, 2, '2024-05-05');

INSERT INTO almacen (id_producto, tipo_movimiento, cantidad, fecha_movimiento) 
VALUES 
(1, 'entrada', 10, '2024-10-11'),
(2, 'entrada', 50, '2024-09-26'),
(3, 'entrada', 30, '2024-08-21'),
(4, 'salida', 5, '2022-08-21'),
(5, 'entrada', 30, '2023-08-21');

INSERT INTO clientes (nombre, direccion, telefono) 
VALUES 
('Juan Martínez', 'Calle de la Herramienta 123', '1234567890'),
('Ana López', 'Avenida del Taller 456', '0987654321'),
('Luis Torres', 'Plaza del Ferretero 789', '1122334455'),
('Juan Martínez', 'Calle de la Herramienta 123', '1234567890'),
('Ana López', 'Avenida del Taller 456', '0987654321'),
('Luis Torres', 'Plaza del Ferretero 789', '1122334455'),
('Carla Mendoza', 'Calle Principal 101', '2233445566'),
('Fernando Ruiz', 'Calle de la Madera 202', '3344556677'),
('Sofía Ramírez', 'Av. de la Construcción 303', '4455667788'),
('Ricardo Gómez', 'Calle del Suministro 404', '5566778899'),
('María Pérez', 'Avenida de los Ferreteros 505', '6677889900'),
('Diego Castro', 'Calle de la Seguridad 606', '7788990011'),
('Lucía Fernández', 'Plaza del Hardware 707', '8899001122'),
('Javier Ortega', 'Calle de los Accesorios 808', '9900112233'),
('Valeria Sánchez', 'Calle del Proveedor 909', '1011121314'),
('Alberto Herrera', 'Av. del Taller 111', '1213141516'),
('Claudia Morales', 'Calle de la Reparación 222', '1314151617'),
('Gustavo Álvarez', 'Plaza de la Herramienta 333', '1415161718'),
('Natalia Soto', 'Calle del Servicio 444', '1516171819'),
('Roberto Castro', 'Avenida del Ferretero 555', '1617181920'),
('Patricia Vargas', 'Calle del Almacenaje 666', '1718192021'),
('Samuel Lima', 'Calle del Taller 777', '1819202122'),
('Teresa Córdova', 'Avenida de la Ferretería 888', '1920212223');

INSERT INTO ventas (id_cliente, fecha_venta, total_venta) 
VALUES 
(1, '2024-10-15', 125.50),
(2, '2024-10-13', 25.00),
(3, '2024-10-14', 15.00),
(4, '2024-10-13', 25.00),
(5, '2024-10-13', 36.00),
(6, '2024-10-13', 120.00),
(7, '2024-10-13', 500.00),
(8, '2024-10-13', 253.00),
(9, '2024-10-13', 5.00),
(10, '2024-10-13', 85.00),
(11, '2024-10-13', 95.00),
(12,'2024-10-13', 625.00),
(13, '2024-10-13', 115.00),
(14, '2024-10-13', 159.00),
(15, '2024-10-13', 645.00),
(16, '2024-10-13', 200.00);

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) 
VALUES 
(1, 1, 2, 15.00),  
(1, 3, 1, 120.00), 
(2, 2, 2, 10.50),  
(3, 5, 3, 5.00),
(1, 1, 3, 12.00),  
(1, 3, 2, 120.00),
(1, 5, 5, 7.00),  
(2, 2, 4, 10.50), 
(2, 4, 1, 25.00), 
(3, 6, 6, 2.00),   
(3, 8, 3, 20.00), 
(4, 7, 2, 15.00), 
(4, 10, 10, 8.00), 
(5, 9, 1, 18.00),  
(5, 12, 2, 5.00),  
(6, 13, 50, 3.50); 

commit;













