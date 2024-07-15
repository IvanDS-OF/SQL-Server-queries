--Procedimientos almacenados 


CREATE PROCEDURE OPe AS
DECLARE @val1 int=1;
DECLARE @val2 int=3;

SELECT @val1 + @val2 AS Total;


--Para mandar a llamar nuestro procedimiento almacenado, tenemos que ahcerlo mediante
--la sentencia EXEC

EXEC OPe


--La diferencia entre una Funcion de Programación y un Procedimiento en SQL
--Es que Una funcion está para retornar siempre valores, mientras que un procedimiento 
--pUede o no retornar valores mediante el uso de sus parametrs


