--In this query we will review the Join s 
USE AdventureWorks2019 
GO

/*Primero vamos a ver los productos en concepto de ventas
Y luego vasmoa ver los productos en concepto de Producto
Para al final tener una nueva tabla con esta información conbinada*/


SELECT TOP 10 *
FROM [Production].[Product]

SELECT TOP 10 *
FROM [Sales].[SalesOrderDetail]

--Vamos a hacer uso de INNER jOINT - esto para saber la información que
--un producto de la lista Productos, ha sido vendido, esto en base a la
--base de datos de las ventas. O sea. Solamente vamos a hacer 
--La correspondencia de las veces que A aparece en B, los puntos de contacto
--Entre las dos bases de datos. 
--RECORDAR QUE TENEMOS QUE HACER LA RELACION ENTRE TABLAS MEDIANTE SUS LLAVES
--TANTO PRIMARIAS COMO FORANEAS

SELECT *--COUNT(*)
FROM [Production].[Product] AS P 
INNER JOIN [Sales].[SalesOrderDetail] AS S
ON P.ProductID = S.ProductID

--De la anterior consulta base, podemos ahora mostra la informacion que necesitamos

SELECT P.Name,
		P.ProductNumber,
		S.OrderQty, 
		S.UnitPrice, 
		S.OrderQty * S.UnitPrice AS Total
FROM [Production].[Product] AS P 
INNER JOIN [Sales].[SalesOrderDetail] AS S
ON P.ProductID = S.ProductID

--La anterior informacion ahora es una tabla nueva con la información de ambas tablas
--Pero que ahora la información está relacionada entre sí mediante un valor que no se muestra. 

--Posterioemente, a esta consulta como base, le podemos comenzar a aplicar filtros
--Ya pueden ser por tiempo, por cantidad e venta, por ganancia, o por algún otro valor que 
--el negocio propiamente necesite conocer. 

SELECT P.Name,
		P.ProductNumber,
		S.OrderQty, 
		S.UnitPrice, 
		S.OrderQty * S.UnitPrice AS Total
FROM [Production].[Product] AS P 
INNER JOIN [Sales].[SalesOrderDetail] AS S
ON P.ProductID = S.ProductID
WHERE S.OrderQty * S.UnitPrice  > 10000

--Aparte de que es posible agregar los filtros usando la sentencia WHERE, tambien podemos hacer
--uso de una nueva sentencia Inner Join, lo que nos ayudaría a relacionar la table nueva generada
--con otra tabla, para ayudar a las necesidades del negocio (requerimientos)

SELECT P.Name,
		P.ProductNumber,
		S.OrderQty, 
		S.UnitPrice, 
		S.OrderQty * S.UnitPrice AS Total
FROM [Production].[Product] AS P 
INNER JOIN [Sales].[SalesOrderDetail] AS S
ON P.ProductID = S.ProductID
INNER JOIN [Sales].[SalesOrderHeader] AS E
ON E.SalesOrderID = S.SalesOrderID
--Recordar que la relacion entra las tablas siempre va a ser posible solamente mediante sus 
--llaves primarias y foraneas de cada una de las tablas. 


--Finalizando nuestro analisis, podemos comenzar los filtros usando la sentencia WHERE
SELECT P.Name,
		P.ProductNumber,
		S.OrderQty, 
		S.UnitPrice, 
		S.OrderQty * S.UnitPrice AS Total,
		E.OrderDate
FROM [Production].[Product] AS P 
INNER JOIN [Sales].[SalesOrderDetail] AS S
ON P.ProductID = S.ProductID
INNER JOIN [Sales].[SalesOrderHeader] AS E
ON E.SalesOrderID = S.SalesOrderID
WHERE MONTH(E.OrderDate) = 1




























