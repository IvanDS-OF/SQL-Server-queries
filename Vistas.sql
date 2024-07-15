/*Vistas, La capacidad e poder en capsulas la logica de consultas que se van a
reutilizar. Como funciones*/ 
--Comenzamos con una base simple per funcional


CREATE VIEW SuperProducto AS

SELECT P.Name, P.ProductNumber, 
O.OrderQty, O.UnitPrice, 
'Comida' as Tipo
FROM Production.Product as P
INNER JOIN Sales.SalesOrderDetail as O
ON P.ProductID = O.ProductID
INNER JOIN Sales.SalesOrderHeader as E
ON E.SalesOrderID = O.SalesOrderID
WHERE MONTH(E.OrderDate) = 1

UNION ALL

SELECT P.Name, P.ProductNumber, 
O.OrderQty, O.UnitPrice, 
'Carro' as Tipo
FROM Production.Product as P
INNER JOIN Sales.SalesOrderDetail as O
ON P.ProductID = O.ProductID
INNER JOIN Sales.SalesOrderHeader as E
ON E.SalesOrderID = O.SalesOrderID
WHERE MONTH(E.OrderDate) = 2

--Una vez que hayamos validaddo nuestro consulta de Vista, es momento de crearla formalmente
--Para ello tenemos que ahcer uso de CREATE VIEW, al inicio de nuestra consulta de validación
--CREATE VIEW NombreDeLaQuery AS ConultaFinalValidadaDeLaVista










