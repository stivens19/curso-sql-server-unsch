USE AdventureWorks2022
GO
--**Contar cuántos empleados hay registrados en la empresa desglosados por 
--su género.**

--- **Tablas involucradas:** `HumanResources.Employee` (columna: `Gender`)
SELECT 
    [Gender],
    COUNT(*) AS Qty
FROM HumanResources.Employee
GROUP BY Gender


--**6. Encontrar la fecha de contratación más antigua y la más reciente 
--de todo el personal.**

--- **Tablas involucradas:** `HumanResources.Employee` (columna: `HireDate`)
SELECT 
    MIN([HireDate]) AS FechaMinima,
	MAX([HireDate]) AS FechaMaxima
FROM HumanResources.Employee


--**7. Calcular la suma total que ha recaudado la empresa por concepto 
--de impuestos de envío.**

--- **Tablas involucradas:** `Sales.SalesOrderHeader` (columna: `TaxAmt`)

SELECT
	SUM(TaxAmt) AS TotalImpEnvio
FROM Sales.SalesOrderHeader

--8. Contar cuántas órdenes individuales registradas superaron un 
--subtotal de 50,000 dólares.**

--- **Tablas involucradas:** `Sales.SalesOrderHeader` (columna: `SubTotal`)

SELECT 
	COUNT(*) AS QTY--SubTotal
FROM Sales.SalesOrderHeader
WHERE SubTotal>50000


--**Calcular el promedio de horas de enfermedad acumuladas únicamente de 
--los empleados de género masculino.**

--- **Tablas involucradas:** `HumanResources.Employee` 
--(columnas: `SickLeaveHours`, `Gender`)

SELECT
	AVG(SickLeaveHours) AS PromedioHoras
FROM HumanResources.Employee
WHERE Gender='M'



--**11. Cantidad de productos agrupados por su color, excluyendo los 
--registros que no tienen un color asignado.**

--- **Tablas involucradas:** `Production.Product` (columna: `Color`)

SELECT
	Color,
	COUNT(*) AS Qty
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color

-- Menos Eficiente
SELECT
	Color,
	COUNT(*) AS Qty
FROM Production.Product
GROUP BY Color
HAVING Color IS NOT NULL


--**Monto total neto vendido desglosado por el año en que se 
--emitió la orden de venta.**

--- **Tablas involucradas:** `Sales.SalesOrderHeader` 
--(columnas: `SubTotal`, `OrderDate`)

SELECT
	YEAR(OrderDate) AS ANIO,
	SUM(SubTotal)
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY 1


--**Precio unitario promedio para cada ID de producto en los detalles de las órdenes,
--mostrando solo aquellos productos cuyo promedio sea superior a 1,000 dólares.**

--- **Tablas involucradas:** `Sales.SalesOrderDetail` 
--(columnas: `ProductID`, `UnitPrice`)

SELECT
	ProductID,
	AVG(UnitPrice) AS Promedio
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(UnitPrice)>1000
ORDER BY ProductID


--**Suma de la cantidad pedida por producto, considerando solo registros 
--individuales donde el precio unitario sea menor a 10 dólares, y mostrando al 
--final solo productos cuya suma total acumulada supere las 500 unidades.**

--- **Tablas involucradas:** `Sales.SalesOrderDetail` 
--(columnas: `ProductID`, `OrderQty`, `UnitPrice`)

SELECT
	ProductID,
	SUM(OrderQty) SUMACANTIDAD
FROM Sales.SalesOrderDetail
WHERE UnitPrice<10
GROUP BY ProductID
HAVING SUM(OrderQty)>500



--**Obtener el nombre y apellido de cada cliente junto con el monto total 
--neto (`SubTotal`) invertido en sus órdenes, ordenado del cliente que más
--gastó al que menos.**

--- **Tablas involucradas:** * `Sales.SalesOrderHeader` (columna: `SubTotal`)
--    - `Sales.Customer` (llave de unión)
--    - `Person.Person` (columnas: `FirstName`, `LastName`)


SELECT
	CUS.CustomerID,PER.FirstName,PER.LastName,
	SUM(ORD.SubTotal) AS TOTAL
FROM Sales.SalesOrderHeader ORD
INNER JOIN Sales.Customer CUS
	ON CUS.CustomerID=ORD.CustomerID
INNER JOIN Person.Person PER
	ON CUS.PersonID=PER.BusinessEntityID
GROUP BY CUS.CustomerID,PER.FirstName,PER.LastName
ORDER BY SUM(ORD.SubTotal) DESC