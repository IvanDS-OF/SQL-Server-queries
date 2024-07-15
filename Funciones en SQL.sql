
--Es posible crear FUNCIONES dentro de SQL, en donde tenemos que definir el nombre
--Los argumentos que puede o no tener a la hora de ejecutar la funcion, la sntencia consulta
--Y el tipo de dato que va a retornar al final. 



CREATE OR ALTER FUNCTION ProductFunction(
	@mes1 int = 1, 
	@mes2 int = 2
)
--A continuación se tiene que seguir la siguiente estructura para que la funcion sepa qué tipo
--de dato va a retornar y qué es lo que va a retornar
RETURNS TABLE
AS 
RETURN
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


--Para la funcion, Podemos tener enconsideración que el alor que retorna puede ser un valor 
--primitivo o un valor complejo, un valor primitivo de ejmplo podria ser el nombre de un atributo
--siendo este un string, o la fecha, siendo este una variable de tipo DATE. 
--Pero igualmetne es posible retornar valores complejos que en este caso seria una tabla, como 
--es el ejemplo de este archivo


--Finalmente para hacer uso de la funcion creada. La tenemos que mandar a llamar de la siguiente manera

SELECT *
FROM ProductFunction(5, 8)
WHERE UnitPrice<1000

--Es necesario colocar los argumentos entre los parentesis en este caso, solo cuando usamos funciones
--La podemos mandar a llamar como su fuera una tabla, despues de nuestra sentencia FROM
´--Y al resultado aun poder aplicarle filtros mediante la sentencia WHERE