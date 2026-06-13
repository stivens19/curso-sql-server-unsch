USE AdventureWorks2022
GO
--- **Consigna:** Encuentra todos los productos cuyo `ListPrice` 
--sea mayor al precio de lista promedio de toda la tabla.
--- **Tablas involucradas:** `Production.Product`
SELECT 
	Name
FROM Production.Product
WHERE ListPrice>(SELECT AVG(ListPrice) FROM Production.Product)


--- **Consigna:** Lista los nombres (`Name`) de los productos que pertenecen 
--a la subcategoría 'Mountain Bikes'.
--- **Tablas involucradas:** `Production.Product`, `Production.ProductSubcategory`
--ProductSubcategoryID
SELECT
	Name
FROM Production.Product
WHERE ProductSubcategoryID=(
	SELECT 
		ProductSubcategoryID
	FROM Production.ProductSubcategory
	WHERE Name='Mountain Bikes'
)
-- SOLUCION ALTERNA
SELECT 
	PROD.Name
FROM Production.Product PROD
INNER JOIN Production.ProductSubcategory SUB
	ON PROD.ProductSubcategoryID=SUB.ProductSubcategoryID
WHERE SUB.Name='Mountain Bikes'

--- **Consigna:** Usa una subconsulta en el WHERE para encontrar 
--el producto con el `ListPrice` más alto de toda la base de datos.
--- **Tablas involucradas:** `Production.Product`
SELECT
	*
FROM Production.Product
WHERE ListPrice=(
	SELECT
		MAX(ListPrice)
	FROM Production.Product
)


--- **Consigna:** Crea una lista de una sola columna que combine todos 
--los nombres de los productos y todos los nombres de las categorías. 
--No elimines duplicados.
--- **Tablas involucradas:** `Production.Product`, `Production.ProductCategory`
SELECT
	Name
FROM Production.Product
UNION ALL
SELECT
	Name
FROM Production.ProductCategory


--- PRUEBA ELIMINACION DUPLICADOS
SELECT
	TOP 5
	Name
	INTO #TMPDUPLICADOS
FROM Production.Product
--INSERT INTO #TMPDUPLICADOS VALUES ('PRUEBA')

SELECT
	Name
FROM Production.Product
UNION ALL
SELECT Name FROM #TMPDUPLICADOS


--- **Consigna:** Obtén los `BusinessEntityID` de las personas que son 
--empleados y que al mismo tiempo son vendedores.
--- **Tablas involucradas:** `HumanResources.Employee`, `Sales.SalesPerson`
SELECT
	BusinessEntityID
FROM HumanResources.Employee
INTERSECT
SELECT
	BusinessEntityID
FROM Sales.SalesPerson

-- SOLUCION ALTERNA
SELECT
	EMP.BusinessEntityID
FROM HumanResources.Employee EMP
INNER JOIN Sales.SalesPerson SAL
	ON EMP.BusinessEntityID=SAL.BusinessEntityID

--- **Consigna:** Encuentra todos los `ProductID` de la tabla de 
--productos que NUNCA han aparecido en un detalle de venta.
--- **Tablas involucradas:** `Production.Product`, `Sales.SalesOrderDetail`

SELECT 
	ProductID
FROM Production.Product
EXCEPT
SELECT 
	ProductID
FROM Sales.SalesOrderDetail

SELECT 
	PROD.ProductID
FROM Production.Product PROD
LEFT JOIN Sales.SalesOrderDetail SAL
	ON PROD.ProductID=SAL.ProductID
WHERE SAL.ProductID IS NULL

--- **Consigna:** Muestra el `SalesOrderID`, `TotalDue` y una tercera 
--columna calculada con una subconsulta que muestre el `TotalDue` máximo histórico.
--- **Tablas involucradas:** `Sales.SalesOrderHeader`

SELECT
	SalesOrderID,
	TotalDue,
	(SELECT MAX(TotalDue) FROM Sales.SalesOrderHeader) AS MaxHist
FROM Sales.SalesOrderHeader

--- **Consigna:** Crea una tabla virtual en el FROM que devuelva el 
--`ProductID` y el total de cantidad vendida. Llama a esa tabla derivada 
--`VentasPorProducto` y consúltala con un `SELECT *`.
--- **Tablas involucradas:** `Sales.SalesOrderDetail`


SELECT 
	* 
FROM (	
	SELECT
		ProductID,
		SUM(OrderQty) AS Total
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
) AS VentasPorProducto 

-- ALTERNA CON TEMPORALES
SELECT
	ProductID,
	SUM(OrderQty) AS Total
	INTO #TMPVENTAS
FROM Sales.SalesOrderDetail
GROUP BY ProductID

SELECT 
	* 
FROM #TMPVENTAS
DROP TABLE IF EXISTS #TMPVENTAS


--- **Consigna:** Encuentra los `CustomerID` de los clientes que realizaron 
--al menos una compra en el año 2011 Y también en el año 2012.
--- **Tablas involucradas:** `Sales.SalesOrderHeader`

SELECT
	CustomerID
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-01-01' AND '2011-12-31'
INTERSECT
SELECT
	CustomerID
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-12-31'


--- **Consigna:** Encuentra los `CustomerID` de los clientes que 
--compraron en el año 2011, PERO NUNCA volvieron a comprar en el año 2012.
--- **Tablas involucradas:** `Sales.SalesOrderHeader`

SELECT
	CustomerID
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-01-01' AND '2011-12-31'
EXCEPT
SELECT
	CustomerID
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-01-01' AND '2012-12-31'


--- **Consigna:** Muestra los productos cuyo `ListPrice` sea MAYOR al precio 
--promedio de su propia subcategoría.
--- **Tablas involucradas:** `Production.Product`

SELECT
	*
FROM Production.Product P1
WHERE P1.ListPrice>(
	SELECT AVG(ListPrice) FROM Production.Product P2
	WHERE P1.ProductSubcategoryID=P2.ProductSubcategoryID
)


SELECT DISTINCT 
    SAL1.CustomerID
FROM Sales.SalesOrderHeader SAL1
INNER JOIN Sales.SalesOrderHeader SAL2 
    ON SAL1.CustomerID = SAL2.CustomerID
WHERE SAL1.OrderDate BETWEEN '2011-01-01' AND '2011-12-31'
  AND SAL2.OrderDate BETWEEN '2012-01-01' AND '2012-12-31'