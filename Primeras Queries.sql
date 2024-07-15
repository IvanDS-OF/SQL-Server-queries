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







