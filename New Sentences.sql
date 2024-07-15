--Vamos a escribir nuevas sentencias relacionadas más a T SQL

--Creamos nuestras consultas bases para comenzar a modificarlas y obtener valores especificos

SELECT TOP 20 *
FROM [Production].[Product]
ORDER BY [ListPrice] DESC

--Así nosotros podemos hacer una ocnsulta de valores determinado un index inicial más
--un numero de valores abajo de ese indice inicial. Vamos a obtener 10 registros a partir de
--la fila 4
SELECT *
FROM [Production].[Product]
ORDER BY [ListPrice] DESC
OFFSET 4 ROWS FETCH NEXT 10 ROWS ONLY


--Es posible que el negocio requiera un dato y que no baste solamente con enerar una consulta
--Para ello es necesario hacer sub consultas que nos van a ayudar a solucionar este priblema
--Vamos a gener nuestra consulta base
SELECT *
FROM Production.Product

--Un ejemplo para los que se utilizarian los SubQueries es cuendo querenos generar un valor
--de comparación. Por ejemplo, queremos saber cual es el valor AVERAGE de la lista de precios
--Para posteriormente utilizarlo como un compparativo dentro de la consulta principal

SELECT *
FROM Production.Product
WHERE ListPrice = (SELECT MAX(ListPrice)
					FROM Production.Product)

--La subconsulta se pued ¿e hacer on un simple sentencia SELECT. Pero requiere todas la propiedades
--que una query requiere para funcionar correctamene

--Como ejemplo vamos a comenzar queriendo saber cuales clientes han tenido alguna compra
SELECT *
FROM Sales.Customer as C
WHERE EXISTS (
	SELECT *
	FROM Sales.SalesOrderHeader AS S
	WHERE C.CustomerID =S.CustomerID --RECORDAR HACER LA RELACION ENTRE LAS LLAVES
	--Dentro de esta subconsultas, podemos tener consultas complejas ue nos pueden ayudar con 
	--a obtener la informacion que mejor se acomodan con nuestras necesidades de negocio.
	AND S.CustomerID Not IN (11004, 11010)
)





--Otro ejeplo
SELECT (
	SELECT SUM(LineTotal)
	FROM Sales.SalesOrderDetail as S
	where S.ProductID = P.ProductID ) AS TOTAL,  * 
FROM Production.Product AS P
ORDER BY 1 DESC




/*Caso de estudio: Tenemos nuestra tabla de clientes, y nuestra tabla de ventas. Queremos saber
CUALES SON LOS 3 PRINCIPALES PRODUCTOS QUE CADA CLIENTE CONSUME. RETORNASR 3 VALORES POR CADA CLIENTE
Es posible hacer uso de los cursores, pero son lentos- Realmente es mala porque funcionana en BUCLES-
Y las sentenisa de extraccion simples de datos son procesos por bloques
Dada esta situacion y la limitante, Vamos a tener que hacer uso de APPLY
APPLY - Genera iteraciones de subconsultas, para genersar un subconjunto de datos para usarlo en 
la consulta principal*/

--Comenzamos con nustra consulta basse
SELECT P.FirstName, P.LastName, P.BusinessEntityID
, PR.Name, R.Total
FROM Sales.Customer AS C
INNER JOIN Person.Person AS P
--Ahora tenemos que obtener la informacion de los producto que cada cliente ha comprado más
--Para ello vamos a usar CROSS APPLY, Que me va a retornar la iteracion entre lo valores de B
ON C.PersonID = P.BusinessEntityID
CROSS APPLY (
	SELECT TOP 3 D.ProductID, SUM(D.LineTotal) as Total
	FROM Sales.SalesOrderHeader as H
	INNER JOIN Sales.SalesOrderDetail as D
	ON H.SalesOrderID = D.SalesOrderID
	--Es necesario recordar que se tiene que acer una iteración por cliente
	--Por ello usamos nuestro WHERE para hace el filtro por cliente
	WHERE C.CustomerID = H.CustomerID
	GROUP BY D.ProductID
	ORDER BY 2 DESC
) AS R
INNER JOIN Production.Product as PR
ON PR.ProductID = R.ProductID
ORDER BY P.BusinessEntityID
















