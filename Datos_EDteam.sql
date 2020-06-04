USE DB_ZAPATO_ROTO
GO

/************************************************************************************/
/* Script: producto																	*/
/* Descripción: Llena la tabla de productos											*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

INSERT INTO producto (nombre, presentacion, precio) VALUES
('Cemento', 'El mejor cemento camba!', 42),
('Serrucho', 'Serrucho marca OSTER.', 60),
('Martillo', 'La mejor durabilidad es Tramontina!', 23),
('Clavos', 'Nunca sabes cuando los necesites!', 5),
('Cemento cola', 'Indispensable para tu construcción.', 33),
('Estuco', 'El mejor precio del mercado.', 38),
('Abrazadera', 'No te afanes mas!', 2),
('Llaves', 'Kit de Herramientas al mejor precio.', 15),
('Candados', 'Tu seguridad es primero', 50),
('Teflon', 'Al mejor precio del mercado.', 3)
GO

/************************************************************************************/
/* Script: pais																		*/
/* Descripción: Llena la tabla de pais												*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

INSERT INTO pais (iso, nombre) VALUES
('DE', 'Alemania'),				('AR', 'Argentina'),	('AU', 'Australia'),
('AT', 'Austria'),				('BO', 'Bolivia'),		('BR', 'Brasil'),
('CA', 'Canadá'),				('CL', 'Chile'),		('CO', 'Colombia'),
('DO', 'República Dominicana'),	('EC', 'Ecuador'),		('SV', 'El Salvador'),	
('ES', 'España'),				('FR', 'Francia'),		('GT', 'Guatemala'),
('IT', 'Italia'),				('MX', 'México'),		('NI', 'Nicaragua'),
('PY', 'Paraguay'),				('PE', 'Perú'),			('PT', 'Portugal'),
('PR', 'Puerto Rico'),			('RU', 'Rusia'),		('UY', 'Uruguay'),
('VE', 'Venezuela')
GO

/************************************************************************************/
/* Script: cliente																	*/
/* Descripción: Llena la tabla de clientes											*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

INSERT INTO cliente (codigo_pais, nombre, apellido_paterno, apellido_materno) VALUES
(5, 'Juan', 'Caseres', 'Hurtado'),
(8, 'Andres', 'Chavez', 'Orihuela'),
(12, 'Pedro', 'Mendoza', 'Coronado'),
(18, 'Camilo', 'Rivera', 'Juarez'),
(6, 'Carlos', 'Alvarado', 'Guerrero'),
(9, 'alejandra', 'vallejos', 'quintoro'),
(15, 'Carolina', 'Cespedes', 'Arimosa'),
(14, 'Pablo', 'Mendoza', 'Ortuño'),
(11, 'Cinthia', 'Camargo', 'Ponte'),
(1, 'Ana', 'Condori', 'Guerrero'),
(5, 'Julian', 'Vaca', 'Campos'),
(3, 'Ariel', 'Pedraza', 'Villagran'),
(8, 'Maria', 'Sandoval', 'Conde'),
(1, 'Sebastian', 'Lozada', 'Callau'),
(8, 'Alberto', 'Cuellar', 'Juarez'),
(1, 'Maicol', 'Uztares', 'Payllo'),
(20, 'Enrrique', 'Lopez', 'Nair'),
(1, 'Olga', 'Escamilla', 'Andrade'),
(20, 'Estefani', 'Rivera', 'Perez'),
(1, 'Fernanda', 'Vergara', 'Lino'),
(4, 'Oscar', 'Jaldin', 'Ribera'),
(5, 'Freddy', 'Perez', 'Boorba'),
(20, 'Mirian', 'Castellon', 'Tapia'),
(8, 'Maicol', 'Rojas', 'Torrejon'),
(1, 'Patricia', 'Mendoza', 'Castro')
GO

/************************************************************************************/
/* Script: inventario																*/
/* Descripción: Llena la tabla de inventario										*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

INSERT INTO inventario (codigo_producto, tipo_movimiento, cantidad) VALUES
(1, 'E', 100),	(1, 'E', 50),
(2, 'E', 30),	(2, 'E', 10),
(3, 'E', 50),	(3, 'E', 40),
(4, 'E', 70),	(4, 'E', 80),
(5, 'E', 60),	(5, 'E', 30),
(6, 'E', 150),	(6, 'E', 80),
(7, 'E', 200),	(7, 'E', 100),
(8, 'E', 130),	(8, 'E', 70),
(9, 'E', 80),	(9, 'E', 90),
(10, 'E', 40),	(10, 'E', 30),
(5, 'S', 2),	(3, 'S', 5),	(7, 'S', 2),	(1, 'S', 3),	(8, 'S', 8),	(1, 'S', 10),
(4, 'S', 7),	(6, 'S', 6),	(9, 'S', 2),	(1, 'S', 1),	(2, 'S', 7),	(5, 'S', 6),
(6, 'S', 1),	(8, 'S', 4),	(9, 'S', 6),	(10, 'S', 5)
GO

/************************************************************************************/
/* Script: detalle_facturacion														*/
/* Descripción: Llena la tabla de detalle de inventario								*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

-- Nota: Se deberia realizar primero el insert de factura y luego el de detalle_factura, pero en este caso realizamos el de detalle_factura primero para realizar calculos en la tabla factura
-- Nota 2: El detalle_factura y codigo_pructo  no deben repetirse porque truncarian los datos ya que los ocupamos como llaves primarias
INSERT INTO detalle_factura (codigo_factura, codigo_producto, cantidad)VALUES 
(1, 5, 1),		(1, 3, 3),		(1, 10, 5),
(2, 7, 2),
(3, 9, 3),		(3, 2, 1),		(3, 7, 53),		(3, 5, 4),		(3, 4, 1),		(3, 6, 4),
(4, 1, 5),		(4, 5, 1),
(5, 2, 4),		(5, 1, 1),		(5, 10, 4),		(5, 5, 4),
(6, 5, 2),		(6, 2, 2),		(6, 10, 3),		(6, 7, 2),		(6, 3, 5),
(7, 8, 1),
(8, 10, 2),		(8, 8, 4),		(8, 4, 3),
(9, 7, 2),
(10, 6, 4),		(10, 9, 1),
(11, 2, 2),		(11, 5, 2),		(11, 3, 4),		(11, 6, 5),		(11, 10, 3),	(11, 9, 2),		(11, 7, 1),		(11, 4, 5),		(12, 1, 2),
(12, 3, 1),		(12, 5, 3),
(13, 1, 3),		(13, 5, 3),		(13, 9, 2),		(13, 7, 2),
(14, 8, 4),
(15, 5, 2),		(15, 2, 4),		(15, 10, 2),	(15, 4, 2),		(15, 8, 2),		(15, 1, 2),
(16, 4, 1),		(16, 10, 3),
(17, 3, 3),		(17, 2, 3),		(17, 10, 4),	(17, 5, 2),		(17, 8, 2),
(18, 6, 4),		(18, 9, 1),		(18, 5, 1),	(18, 3, 1),		(18, 7, 2),		(18, 4, 5),	(18, 8, 4),		(18, 2, 3),
(19, 4, 5),
(20, 1, 2),		(20, 2, 2),		(20, 10, 2),	(20, 5, 3),		(20, 9, 3),		(20, 7, 1),	(20, 3, 1),
(21, 8, 3),		(21, 10, 5),
(22, 4, 2),		(22, 5, 5),		(22, 7, 2),	(22, 3, 1),
(23, 2, 4),		(23, 4, 3),		(23, 10, 5),
(24, 3, 2),
(25, 7, 1),	
(26, 2, 2),		(26, 8, 4),		(26, 3, 1),
(27, 1, 1),	
(28, 9, 3),		(28, 7, 2),	
(29, 6, 5),	
(30, 3, 3),		(30, 10, 4),		(30, 5, 2)
GO

/************************************************************************************/
/* Script: factura																	*/
/* Descripción: Llena la tabla de factura											*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

Declare
@IMPUESTO DECIMAL(4,2),
@DES1 DECIMAL(4,2), -- 1er Descuento
@DES2 DECIMAL(4,2), -- 2do Descuento
@DES3 DECIMAL(4,2)  -- 3er Descuento

SET @IMPUESTO = 0.18
SET @DES1=0.03		-- Asignamos el valor para el descuento 1
SET @DES2=0.05		-- Asignamos el valor para el descuento 2
SET @DES3=0.10	-- Asignamos el valor para el descuento 3

-- P= precio
-- C= cantidad
-- D= descuento
--Nota: En este caso para sacar el valor total se realiza un select de los producto del detalle de esta factura y se resta el descuento en % ejemplo descuento del 10%: (P=50 * C=3) - (P=50 * C=3) * D=0.10 = 135
INSERT INTO factura (codigo_cliente, impuesto, descuento, valor_pagar, fch_reg) VALUES
(5 , @IMPUESTO, @DES3, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES3) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=1),  '01-01-2020 08:30:00'),		
(1 , @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=2),  '01-01-2020 09:30:00'),		
(7 , @IMPUESTO, @DES1, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES1) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=3),  '01-01-2020 10:30:00'),		
(8 , @IMPUESTO, @DES3, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES3) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=4),  '02-01-2020 11:30:00'),		
(5 , @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=5),  '02-01-2020 12:30:00'), 
(12, @IMPUESTO, @DES1, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES1) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=6),  '02-01-2020 13:30:00'),		
(10, @IMPUESTO, @DES3, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES3) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=7),  '03-01-2020 13:30:00'),		
(21, @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=8),  '03-01-2020 14:30:00'),		
(11, @IMPUESTO, @DES1, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES1) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=9),  '03-01-2020 15:30:00'),		
(5 , @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=10), '01-02-2020 15:30:00'),	
(6 , @IMPUESTO, @DES3, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES3) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=11), '01-02-2020 15:30:00'),		
(2 , @IMPUESTO, @DES3, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES3) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=12), '02-02-2020 16:30:00'),		
(24, @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=13), '02-02-2020 16:30:00'),		
(14, @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=14), '03-02-2020 17:30:00'),		
(16, @IMPUESTO, @DES1, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES1) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=15), '03-02-2020 17:30:00'),	
(20, @IMPUESTO, @DES3, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES3) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=16), '04-02-2020 17:30:00'),		
(13, @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=17), '04-02-2020 18:30:00'),		
(6 , @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=18), '04-02-2020 18:30:00'),		
(9 , @IMPUESTO, @DES1, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES1) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=19), '01-03-2020 09:30:00'),		
(20, @IMPUESTO, @DES1, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES1) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '01-03-2020 10:30:00'),
(5 , @IMPUESTO, @DES1, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES1) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '01-03-2020 11:30:00'),
(7 , @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '02-03-2020 12:30:00'),
(8 , @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '02-03-2020 13:30:00'),
(21, @IMPUESTO, @DES1, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES1) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '02-03-2020 13:30:00'),
(22, @IMPUESTO, @DES3, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES3) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '02-03-2020 14:30:00'),
(25, @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '04-03-2020 15:30:00'),
(6 , @IMPUESTO, @DES3, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES3) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '04-03-2020 15:30:00'),
(8 , @IMPUESTO, @DES3, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES3) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '04-03-2020 16:30:00'),
(23, @IMPUESTO, @DES2, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES2) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '04-03-2020 16:30:00'),
(25, @IMPUESTO, @DES1, (SELECT CAST(SUM((P.precio * DP.cantidad) - (P.precio * DP.cantidad) * @DES1) AS DECIMAL(8,2)) FROM producto P INNER JOIN detalle_factura DP ON P.codigo_producto=DP.codigo_producto WHERE DP.codigo_factura=20), '04-03-2020 17:30:00')
GO





