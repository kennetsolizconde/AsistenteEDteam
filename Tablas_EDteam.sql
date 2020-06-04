/*Nota: Normalmente dividiria cada script para un mejor control de los scripts, pero para este caso colocaré todo en un solo scripts*/
/*SQL SERVER 2016*/

USE master
GO

IF DB_ID('DB_ZAPATO_ROTO') IS NOT NULL
	DROP DATABASE DB_ZAPATO_ROTO

CREATE DATABASE DB_ZAPATO_ROTO

USE DB_ZAPATO_ROTO
GO

/************************************************************************************/
/* Tabla: producto																	*/
/* Descripción: Crea la tabla producto												*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

CREATE TABLE producto (
	codigo_producto		INT IDENTITY(1,1)	NOT NULL,							-- Codigo / ID Producto (PK)
	nombre					VARCHAR(50)		NOT NULL,
	presentacion			VARCHAR(600)	NOT NULL,
	precio					DECIMAL(8,2)	NOT NULL,
	fch_reg					DATETIME		NOT NULL	DEFAULT(GETDATE()),		-- Fecha de Registro
	fch_act					DATETIME		NOT NULL	DEFAULT(GETDATE())		-- Fecha de Actualización

	PRIMARY KEY(codigo_producto)
);
GO

/************************************************************************************/
/* Tabla: pais																		*/
/* Descripción: Crea la tabla pais													*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

CREATE TABLE pais (
codigo_pais				INT IDENTITY(1,1)	NOT NULL,							-- Codigo / ID Pais (PK)
iso							CHAR(2)			NOT NULL,
nombre						VARCHAR(100)	NOT NULL

PRIMARY KEY (codigo_pais)
);
GO

/************************************************************************************/
/* Tabla: cliente																	*/
/* Descripción: Crea la tabla cliente												*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

CREATE TABLE cliente (
	codigo_cliente		INT IDENTITY(1,1)	NOT NULL,							-- Codigo / ID cliente (PK)
	codigo_pais				INT				NOT NULL,							-- Codigo / ID pais (PF)
	nombre					VARCHAR(20)		NOT NULL,
	apellido_paterno		VARCHAR(20)		NOT NULL,
	apellido_materno		VARCHAR(20),
	fch_reg					DATETIME		NOT NULL		DEFAULT(GETDATE()),	-- Fecha de Registro
	fch_act					DATETIME		NOT NULL		DEFAULT(GETDATE())	-- Fecha de Actualización

	PRIMARY KEY(codigo_cliente)
);
GO

/************************************************************************************/
/* Tabla: inventario																*/
/* Descripción: Crea la tabla inventario											*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

CREATE TABLE inventario (
	codigo_inventario	INT IDENTITY(1,1)	NOT NULL,							-- Codigo / ID Inentario (PK)
	codigo_producto			INT				NOT NULL,							-- Codigo del Producto (FK)
	tipo_movimiento			CHAR(1)			NOT NULL,							-- Tipo de Movimiento
																					-- E: entrada
																					-- S: Salida
	cantidad				INT				NOT NULL,
	fch_reg					DATETIME		NOT NULL		DEFAULT(GETDATE()),	-- Fecha de Registro
	fch_act					DATETIME		NOT NULL		DEFAULT(GETDATE())	-- Fecha de Actualización

	PRIMARY KEY(codigo_inventario)
);
GO

/************************************************************************************/
/* Tabla: factura																	*/
/* Descripción: Crea la tabla factura												*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

--Nota: Los descuentos estan siendo manejando en porcentajes sobre el valor total a pagar de la factura
CREATE TABLE factura (
	codigo_factura		INT IDENTITY(1,1)	NOT NULL,							-- Codigo / ID facturación (PK)
	codigo_cliente			INT				NOT NULL,							-- Codigo / ID Cliente (FK)
	impuesto				DECIMAL(8,2)	NOT NULL,
	descuento				DECIMAL(8,2)	NOT NULL,
	valor_pagar				DECIMAL(10,2)	NOT NULL,
	fch_reg					DATETIME		NOT NULL		DEFAULT(GETDATE()),	-- Fecha de Registro
	fch_act					DATETIME		NOT NULL		DEFAULT(GETDATE())	-- Fecha de Actualización

	PRIMARY KEY(codigo_factura)
);
GO

/************************************************************************************/
/* Tabla: detalle_facturacion														*/
/* Descripción: Crea la tabla detalle de facturacion								*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

CREATE TABLE detalle_factura (
	codigo_factura			INT 			NOT NULL,							-- Codigo / ID facturación (PK-FK)
	codigo_producto			INT				NOT NULL,							-- Codigo / ID producto (PK-FK)
	cantidad				INT				NOT NULL							-- Cantiad del producto
	PRIMARY KEY(codigo_factura, codigo_producto)
);
GO