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


