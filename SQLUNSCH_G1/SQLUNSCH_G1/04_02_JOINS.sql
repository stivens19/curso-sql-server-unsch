USE AdventureWorks2022
GO
-- ======================================================
--					EJERCICIOS JOIN
-- ======================================================

-- 1. INNER JOIN - Productos y Subcategorías: Escribe una 
--consulta que devuelva el nombre del producto (Name) 
--de la tabla Production.Product y el nombre de su subcategoría 
--correspondiente de la tabla Production.ProductSubcategory.

SELECT
    [ProductID]
    , PRO.[Name] AS NombreProducto
	, SUB.Name AS NombreSubCategoria
FROM Production.Product AS PRO
INNER JOIN Production.ProductSubcategory SUB
	ON PRO.ProductSubcategoryID=SUB.ProductSubcategoryID


/*
	2. INNER JOIN - Detalles del Empleado: Muestra el título del cargo 
	(JobTitle) de HumanResources.Employee junto con el nombre y apellido 
	(FirstName, LastName) de la tabla Person.Person. Usa la columna 
	BusinessEntityID para unirlos.
*/
SELECT 
     EMP.[BusinessEntityID]
    , EMP.[JobTitle]
	, PER.FirstName
	, PER.LastName
FROM HumanResources.Employee AS EMP
INNER JOIN Person.Person AS PER
	ON EMP.BusinessEntityID=PER.BusinessEntityID

/*
	3. LEFT JOIN - Productos en el historial de ventas: Lista el nombre de todos 
	los productos (Production.Product) y el ID del detalle de la orden 
	(SalesOrderDetailID) de Sales.SalesOrderDetail. Deben aparecer todos 
	los productos del catálogo, sin importar si tienen registros de ventas o no.
*/

SELECT 
     PRO.[ProductID]
    , PRO.[Name]
	, SAL.SalesOrderDetailID
FROM Production.Product AS PRO
LEFT JOIN Sales.SalesOrderDetail SAL
ON PRO.ProductID=SAL.ProductID


/*
	4. LEFT JOIN - Clientes y sus Órdenes: Muestra el ID del cliente (CustomerID) 
	de Sales.Customer y el ID de la orden (SalesOrderID) de Sales.SalesOrderHeader.
	Deben aparecer todos los clientes, incluso si la columna de la orden queda en 
	blanco (NULL).
*/
SELECT 
     CUS.[CustomerID],
	 SAL.SalesOrderID
FROM Sales.Customer AS CUS
LEFT JOIN Sales.SalesOrderHeader SAL
	ON CUS.[CustomerID]=SAL.[CustomerID]

--- AJUSTE PARA PASAR LEFT A RIGHT
SELECT 
     CUS.[CustomerID],
	 SAL.SalesOrderID
FROM Sales.SalesOrderHeader SAL 
RIGHT JOIN Sales.Customer AS CUS
	ON CUS.[CustomerID]=SAL.[CustomerID]


/*
	5- RIGHT JOIN - Ofertas Especiales: Lista el ID del detalle de orden 
	(SalesOrderDetailID) de Sales.SalesOrderDetail y la descripción de 
	la oferta (Description) de Sales.SpecialOffer. Queremos que aparezcan 
	absolutamente todas las ofertas de la tabla SpecialOffer, se hayan 
	aplicado a una orden o no.
*/
SELECT 
   SAL.[SalesOrderDetailID],
   OFE.Description
FROM Sales.SalesOrderDetail SAL
RIGHT JOIN Sales.SpecialOffer AS OFE
	ON OFE.SpecialOfferID=SAL.SpecialOfferID

/*
	6. CROSS JOIN - Matriz Moneda-Territorio: Genera todas las combinaciones 
	posibles cruzando los nombres de los territorios de ventas 
	(Sales.SalesTerritory) con los códigos de las monedas (Sales.Currency).
*/
SELECT 
	STE.[Name],
	CUR.CurrencyCode
FROM Sales.SalesTerritory STE
CROSS JOIN Sales.Currency CUR


-- ======================================================
--					EJERCICIOS JOIN INTERMEDIO
-- ======================================================
/*
	1. Cadena de INNER JOIN - Jerarquía de Producto: Une Production.Product, 
	Production.ProductSubcategory y Production.ProductCategory. 
	Muestra en una sola fila: Nombre del Producto, Nombre de la 
	Subcategoría y Nombre de la Categoría.
*/
SELECT
    PRO.[Name] AS NombreProducto
	, SUB.Name AS NombreSubCategoria
	, CAT.Name AS NombreCategoria
FROM Production.Product AS PRO
INNER JOIN Production.ProductSubcategory SUB
	ON PRO.ProductSubcategoryID=SUB.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS CAT
	ON CAT.ProductCategoryID=SUB.ProductCategoryID

/*
	2. LEFT JOIN con exclusión - Productos no vendidos: Modifica el ejercicio 3. 
	Lista solo los nombres de los productos (Production.Product) que no 
	tienen ningún registro en la tabla Sales.SalesOrderDetail 
	(Filtra donde la llave de la tabla derecha sea NULL).
*/
SELECT 
     PRO.[ProductID]
    , PRO.[Name]
	, SAL.SalesOrderDetailID
FROM Production.Product AS PRO
LEFT JOIN Sales.SalesOrderDetail SAL
	ON PRO.ProductID=SAL.ProductID
WHERE SAL.SalesOrderDetailID IS NULL


/*
	3. Cadena de INNER JOIN extendida - Detalles completos de orden: 
	Une Sales.SalesOrderHeader, Sales.SalesOrderDetail, Production.Product 
	y Sales.SpecialOffer. Muestra el número de orden (SalesOrderNumber), 
	el nombre del producto y la descripción de la oferta especial aplicada.
*/
SELECT 
    SOH.[SalesOrderNumber],
	PRO.Name,
	OFE.Description
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail SOD
	ON SOD.SalesOrderID=SOH.SalesOrderID
INNER JOIN Production.Product AS PRO
	ON SOD.ProductID=PRO.ProductID
INNER JOIN Sales.SpecialOffer OFE
	ON SOD.SpecialOfferID=OFE.SpecialOfferID


