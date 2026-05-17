USE AdventureWorks2022
GO
--================================================================================
--                            BASICO
--================================================================================
--1- [DISTINCT] Obtén una lista con los diferentes tipos de personas (PersonType) 
--que existen en la tabla Person.Person sin que se repitan.

--SELECT DISTINCT PersonType FROM Person.Person


--2- [TOP] Selecciona únicamente las 15 filas con los costos de envío (Freight) más 
--altos de la tabla Purchasing.PurchaseOrderHeader.

--SELECT TOP 15 * FROM Purchasing.PurchaseOrderHeader
--ORDER BY Freight DESC

--3- [BETWEEN] Encuentra el nombre, número de producto y costo estándar de todos los productos 
--en Production.Product cuyo costo estándar esté entre $10 y $50.

--SELECT 
--     [ProductID]
--    , [Name]
--    , [ProductNumber]
--    , [StandardCost]
--FROM Production.Product
--WHERE [StandardCost]>=10 AND [StandardCost]<=50

--SELECT 
--     [ProductID]
--    , [Name]
--    , [ProductNumber]
--    , [StandardCost]
--FROM Production.Product
--WHERE [StandardCost] BETWEEN 10 AND 50


--4- [LIKE] Muestra el nombre y apellido de todas las personas 
--en Person.Person cuyo apellido comience con la letra 'S'.

--SELECT 
--     [BusinessEntityID]
--    , [PersonType]
--    , [NameStyle]
--    , [Title]
--    , [FirstName]
--    , [MiddleName]
--    , [LastName]
--    , [Suffix]
--    , [EmailPromotion]
--    , [AdditionalContactInfo]
--    , [Demographics]
--    , [rowguid]
--    , [ModifiedDate]
--FROM Person.Person
--WHERE LastName LIKE 'S%'

--5-[LIKE] Busca todos los productos en Production.Product cuyo nombre contenga la palabra 'Bike' en cualquier parte.
--SELECT*FROM Production.Product
--WHERE Name LIKE '%Bike%'

--================================================================================
--                            INTERMEDIO
--================================================================================

--1-[IN] Selecciona el ID de negocio y el nombre de las tiendas (Sales.Store) cuyo nombre 
--sea 'Best o' Bikes', 'Rambling Tours' o 'Action Bicycle Specialists'.

--SELECT 
--     [BusinessEntityID]
--    , [Name]
--FROM Sales.Store
--WHERE [Name]='Best o'' Bikes'
--OR [Name]='Rambling Tours'
--OR [Name]='Action Bicycle Specialists'

--SELECT 
--     [BusinessEntityID]
--    , [Name]
--FROM Sales.Store
--WHERE [Name] IN ('Best o'' Bikes','Rambling Tours','Action Bicycle Specialists')


--2-[NOT IN] Encuentra los nombres de los productos que no pertenezcan a las subcategorías 1, 2, 3, 4 ni 5.

--SELECT 
--	DISTINCT [ProductSubcategoryID]
--FROM [Production].[Product]

--SELECT 
--     [ProductID]
--    , [Name]
--    , [ProductNumber]
--    , [ProductSubcategoryID]
--FROM [Production].[Product]
--WHERE [ProductSubcategoryID] NOT IN (1,2,3,4,5)


--3-[IS NULL] Identifica todos los clientes en Sales.Customer que no tienen una tienda asociada (StoreID es nulo).

--SELECT DISTINCT StoreID FROM Sales.Customer

--SELECT 
--     [CustomerID]
--    , [PersonID]
--    , [StoreID]
--    , [TerritoryID]
--    , [AccountNumber]
--    , [rowguid]
--    , [ModifiedDate]
--FROM Sales.Customer
--WHERE StoreID IS NULL


--4- [IS NOT NULL] Muestra las órdenes de venta en Sales.SalesOrderHeader que ya han sido enviadas (es decir, que el número 
--de guía de envío ShipMethodID o el código de moneda CurrencyRateID no sea nulo).

--SELECT ShipMethodID,CurrencyRateID 
--FROM Sales.SalesOrderHeader
--WHERE ShipMethodID IS NOT NULL AND CurrencyRateID IS NOT NULL


--5-[BETWEEN + DISTINCT] Obtén los diferentes IDs de territorio (TerritoryID) únicos en los que se han realizado ventas
--cuyos montos totales (TotalDue) se encuentren entre $5,000 y $10,000.

SELECT
	DISTINCT TerritoryID
FROM Sales.SalesOrderHeader
WHERE TotalDue BETWEEN 5000 AND 5500