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


