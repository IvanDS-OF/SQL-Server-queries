--Vamos a escribir nuevas sentencias relacionadas m�s a T SQL

--Creamos nuestras consultas bases para comenzar a modificarlas y obtener valores especificos

SELECT TOP 20 *
FROM [Production].[Product]
ORDER BY [ListPrice] DESC

--As� nosotros podemos hacer una ocnsulta de valores determinado un index inicial m�s
--un numero de valores abajo de ese indice inicial. Vamos a obtener 10 registros a partir de
--la fila 4
SELECT *
FROM [Production].[Product]
ORDER BY [ListPrice] DESC
OFFSET 4 ROWS FETCH NEXT 10 ROWS ONLY
















