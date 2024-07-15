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























