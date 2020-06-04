USE DB_ZAPATO_ROTO
GO


/************************************************************************************/
/* Descripci�n: Consulta la facturaci�n de un cliente en espec�fico					*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

SELECT  RTRIM(F.codigo_factura) 'Codigo factura',
		RTRIM(F.codigo_cliente) 'Codigo cliente',
		RTRIM(C.nombre) + ' ' + RTRIM(C.apellido_materno) 'Nombre',
		RTRIM(F.impuesto) 'Impuesto',
		RTRIM(F.descuento) 'Descuento',
		RTRIM(F.valor_pagar) 'Valor a pagar',
		RTRIM(FORMAT(F.fch_reg, 'dd/MM/yyyy')) 'Fecha de registro',
		RTRIM(F.fch_act) 'Fecha de actualizaci�n'
	FROM factura F 
					INNER JOIN cliente C	ON F.codigo_cliente=C.codigo_cliente
	WHERE C.codigo_cliente=5


/************************************************************************************/
/* Descripci�n: Consulta la facturaci�n de un producto en espec�fico				*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

SELECT  RTRIM(F.codigo_factura) 'Codigo factura',
		RTRIM(F.codigo_cliente) 'Codigo factura',
		RTRIM(P.codigo_producto) 'Codigo producto',
		RTRIM(P.nombre) 'Producto',
		RTRIM(F.impuesto) 'Impuesto',
		RTRIM(F.descuento) 'Descuento',
		RTRIM(F.valor_pagar) 'Valor a pagar',
		RTRIM(FORMAT(F.fch_reg, 'dd/MM/yyyy')) 'Fecha de registro',
		RTRIM(F.fch_act) 'Fecha de actualizaci�n'
	FROM factura F 
					INNER JOIN detalle_factura DF	ON F.codigo_factura=DF.codigo_factura
					INNER JOIN producto P			ON DF.codigo_producto=P.codigo_producto
	WHERE P.codigo_producto=7


/************************************************************************************/
/* Descripci�n: Consulta la facturaci�n de un rango de fechas						*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

SELECT  RTRIM(codigo_factura) 'Codigo factura',
		RTRIM(codigo_cliente) 'Codigo factura',
		RTRIM(impuesto) 'Impuesto',
		RTRIM(descuento) 'Descuento',
		RTRIM(valor_pagar) 'Valor a pagar',
		RTRIM(FORMAT(fch_reg, 'dd/MM/yyyy')) 'Fecha de registro',
		RTRIM(fch_act) 'Fecha de actualizaci�n'
	FROM factura
	WHERE fch_reg BETWEEN '01-01-2020' AND '02-02-2020'		--Formato para el filtro: dd-MM-yyyy


/************************************************************************************/
/* Descripci�n: Consulta los clientes �nicos										*/
/* Autor: Kennet Soliz Conde														*/
/************************************************************************************/

--Obtenemos �nicamente el listado de clientes que hayan comprado almenos una vez
SELECT	RTRIM(C.codigo_cliente) 'Codigo Cliente', 
		RTRIM(C.nombre) + ' ' + RTRIM(C.apellido_materno) 'Nombre'
		FROM factura F 
						INNER JOIN cliente C	ON F.codigo_cliente=C.codigo_cliente
		GROUP BY C.codigo_cliente, C.nombre, C.apellido_materno
		ORDER BY C.nombre


-- Obtenemos la lista de cliente y su detalle respectivo
SELECT A.* FROM (
    -- Obtenemos todas las ventas y le asignamos una atributo que incrementa cada vez que se repite el codigo de cliente
	SELECT  Row_number() OVER(partition BY F.codigo_cliente ORDER BY F.codigo_factura) Cnt,		--Incrementa 1 cada vez que se repite el codigo de cliente
			RTRIM(F.codigo_factura) 'Codigo factura',
			RTRIM(F.codigo_cliente) 'Codigo cliente',
			RTRIM(C.nombre) + ' ' + RTRIM(C.apellido_materno) 'Nombre',
			RTRIM(F.impuesto) 'Impuesto',
			RTRIM(F.descuento) 'Descuento',
			RTRIM(F.valor_pagar) 'Valor a pagar',
			RTRIM(FORMAT(F.fch_reg, 'dd/MM/yyyy')) 'Fecha de registro',
			RTRIM(F.fch_act) 'Fecha de actualizaci�n'
		FROM factura F 
						INNER JOIN cliente C	ON F.codigo_cliente=C.codigo_cliente
) A
WHERE Cnt=1		--Elegimos �nicamente la primer compra de cada cliente para asi no duplicarlo




