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


/*Ahora, vamos a ver cómo se usan los LEFT and RIGHT JOIN para la resolución de un problema
de negocio. Se quiere saber de los productos existentes, cuánta ha sido su correspondencia en dinero 
ganado por las ventas. Por lo que es necesario primero tener en consideraci´n todos y cada uno de los 
elementos existentes dentro de nuestra base de datos de Productos, y hacer la relación con las ventas
Sin importanr si un producto ha sido vendido o no. Para ello podemos comenzar usando la sentencia LEFT JOIN
Siendo el valor A nuestra base de datos de los productos, */
SELECT COUNT(*)
FROM [Production].[Product] AS P

SELECT P.Name, P.ProductNumber, SUM(S.OrderQty * S.UnitPrice) AS TOTAL
FROM [Production].[Product] AS P 
LEFT JOIN [Sales].[SalesOrderDetail] AS S
ON P.ProductID = S.ProductID
--CONSIDERER: Cuando usamos neustro LEFT JOIN o nuestro RIGHT JOIN  - SIEMPRE es necesario colocar 
--Una sentencia GROUP BY, ya que nos dará errores y no podremos continuar con la consulta
GROUP BY P.Name, P.ProductNumber
--Lo que indica este sentencia final es que la agrupación solamente será a partir de los valores
--encontrados dentro de nuestra Tabla P, o dentro de nuestra tabla a la izquierda


--Teniendo la base anterior, podemos ahora si comenzar a plicar filtros. RECORDAR
--Es importante tener ecn consideracion la jerarquia entre las sentencias. Para hacer el filtro se
--Va a tener que hacer uso de un WHERE, pero esta sentencia siempre va antes de GROUP BY, por lo que
--lpara que funcione el filtro y no de errores, la tendremos que colocar en su lugar correspondiente
SELECT P.Name, P.ProductNumber, SUM(S.OrderQty * S.UnitPrice) AS TOTAL
FROM [Production].[Product] AS P 
LEFT JOIN [Sales].[SalesOrderDetail] AS S
ON P.ProductID = S.ProductID
WHERE S.ProductID IS NULL
GROUP BY P.Name, P.ProductNumber

























