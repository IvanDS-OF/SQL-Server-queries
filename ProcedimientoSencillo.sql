

EXEC ProductoProcedure 1, 9;


--Creamos nuestro procedimiento sencillo con nuestra vista anterior

CREATE OR ALTER PROCEDURE ProductoProcedure(
	@mes1 int = 1, 
	@mes2 int = 2
)

--Los valores dentro de los parentesis van a ser los argumetnos que le vamos a pasar a nuestro
--Procedimeintoa  ala hroa de ahcer uso de el, a la hora de llamarlo mediante la sentencia EXEC


AS 

--Recordar que siempre le tenemos que pasar la sentencia que queremos mostrar, como si fuera VISTA

SELECT P.Name, P.ProductNumber, 
O.OrderQty, O.UnitPrice, 
'Comida' as Tipo
FROM Production.Product as P
INNER JOIN Sales.SalesOrderDetail as O
ON P.ProductID = O.ProductID
INNER JOIN Sales.SalesOrderHeader as E
ON E.SalesOrderID = O.SalesOrderID
WHERE MONTH(E.OrderDate) = @mes1

UNION ALL

SELECT P.Name, P.ProductNumber, 
O.OrderQty, O.UnitPrice, 
'Carro' as Tipo
FROM Production.Product as P
INNER JOIN Sales.SalesOrderDetail as O
ON P.ProductID = O.ProductID
INNER JOIN Sales.SalesOrderHeader as E
ON E.SalesOrderID = O.SalesOrderID
WHERE MONTH(E.OrderDate) = @mes2


--RECORDAR - Es necesario hacer la adicion de los argumentos dentro de nuestra consulta






