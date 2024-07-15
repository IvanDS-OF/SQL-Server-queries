USE [AdventureWorks2019]
GO

SELECT  
	P.BusinessEntityID, 
	P.FirstName, 
	P.LastName, 
	E.[EmailAddress] 
	--- COUNT(*)
	FROM Person.Person as P, [Person].[EmailAddress] AS E
	WHERE P.BusinessEntityID = E.BusinessEntityID ;


SELECT [SubTotal], [TaxAmt], [Freight], [TotalDue],
	[SubTotal]+[TaxAmt]+[Freight] as Total2
	FROM [Sales].[SalesOrderHeader]	
	WHERE SalesOrderID='43661';



SELECT @@SERVERNAME;

SELECT TOP 10 *
	FROM [Sales].[SalesOrderHeader]
	---WHERE TotalDue BETWEEN 3 AND 5
	WHERE TotalDue>=4 AND TotalDue<6
	ORDER BY  TotalDue


/*La sentencia OR se puede sistituir por la sentencia IN 
de la siguiente manera*/
--Mostramos como es la forma del uso de OR



SELECT -- *
	COUNT(*)
	FROM [Sales].[SalesORderHeader]
		WHERE [TerritoryID] = 1 OR
			  [TerritoryID] = 7 OR
			  [TerritoryID] = 9
--Y Esta es la forma en la cual nosotros podemos usar el IN 
SELECT -- *
	COUNT(*)
	FROM [Sales].[SalesORderHeader]
		WHERE [TerritoryID] IN (1, 7, 9)

--Dentro de WHERE, podemos hacer el filtrado de diferentes columnas al mismo tiempo
--Haciendo uso de las clausulas primitivas (AND, OR, NOT)


--Otra clausula interesante es el Between y AND, de la siguiente manera
SELECT TOP 10 *
	FROM [Sales].[SalesOrderHeader]
	WHERE TotalDue BETWEEN 3 AND 5
	--WHERE TotalDue>=4 AND TotalDue<6
	ORDER BY  TotalDue

--HOw can i show the type of the values within my columns ? 
SELECT	COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesOrderHeader'


--The use of LIKE sentence - When we need the vallues that contains some 
--specific information, We just can use this sentence in String Type
SELECT *
FROM [Sales].[SalesOrderHeader]
WHERE AccountNumber LIKE '%021%8'
--The % sign means all the posible values within the query


--How to manage dates, we can Filter the WHERE sentence using the specific date or 
--using ranges of dates using ADNs and the Substraction values process, as follow
SELECT *
FROM [Sales].[SalesOrderHeader]
WHERE YEAR(OrderDate) = 2011 AND
	MONTH(OrderDate) = 12 AND
	DAY(OrderDate) IN (1, 4, 31)



/*Es posible ordenar la informacion que encontramos dentro de una columna
Es posible ordenar de Menos a Mayor y viceversa
ASC / DESC*/

SELECT * 
FROM [Sales].[SalesOrderHeader]
--ORDER BY [SalesOrderID] ASC
ORDER BY [SalesOrderID] DESC
--Es posible agregar o tener + de 2 ordenadores. para eso los separamos con una coma

SELECT * 
FROM [Sales].[SalesOrderHeader]
--ORDER BY [SalesOrderID] ASC
ORDER BY AccountNumber, TotalDue DESC


