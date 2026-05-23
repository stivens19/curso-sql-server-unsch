USE AdventureWorks2022
GO
--=================================================================
--						1RA PARTE
--=================================================================
SELECT TOP 100 
	PRO.Name AS Producto,
    PROSU.Name AS Subcategoria,
	CATEGORIA.Name AS Categoria
FROM Production.Product AS PRO
INNER JOIN Production.ProductSubcategory AS PROSU
	ON PRO.ProductSubcategoryID=PROSU.ProductSubcategoryID
INNER JOIN [Production].[ProductCategory] AS CATEGORIA
	ON PROSU.ProductCategoryID=CATEGORIA.ProductCategoryID




SELECT DISTINCT ProductSubcategoryID FROM Production.Product
select*from [Production].[ProductSubcategory]

SELECT
    PRO.Name AS Producto,
    PROSU.Name AS Subcategoria,
	PROCAT.Name AS Categoria
FROM Production.Product AS PRO
INNER JOIN Production.ProductSubcategory AS PROSU
    ON PRO.ProductSubcategoryID = PROSU.ProductSubcategoryID
INNER JOIN [Production].[ProductCategory] AS PROCAT
	ON PROSU.ProductCategoryID=PROCAT.ProductCategoryID

--=================================================================
--						2DA PARTE
--=================================================================
SELECT
	DISTINCT ProductSubcategoryID
FROM [Production].[Product]

SELECT 
    PRO.Name as Producto
    , PRO.ProductNumber
	, SUB.Name as Subcategoria
	, CAT.Name as Categoria
FROM [Production].[Product] AS PRO
INNER JOIN [Production].[ProductSubcategory] AS SUB
	ON PRO.ProductSubcategoryID=SUB.ProductSubcategoryID
INNER JOIN [Production].[ProductCategory] AS CAT
	ON CAT.ProductCategoryID=SUB.ProductCategoryID
--WHERE ProductSubcategoryID IS NOT NULL


--select*from [Production].[ProductSubcategory]
--SELECT*FROM [Production].[ProductCategory]


-- [Production].[Product] - [Production].[ProductListPriceHistory]
--SELECT
--	PRO.ProductID AS ProductKey,
--	PRO.Name AS Producto,
--	PRO.ListPrice AS PrecioFinal,
--	HIST.ListPrice AS PrecioHistorico,
--	HIST.StartDate,HIST.EndDate
--FROM [Production].[Product] AS PRO
--INNER JOIN [Production].[ProductListPriceHistory] AS HIST
--	ON PRO.ProductID=HIST.ProductID

--=================================================================
--						LEFT/RIGHT
--=================================================================


--SELECT 
--    PRO.Name as Producto
--    , PRO.ProductNumber
--	, SUB.Name as Subcategoria
--FROM  [Production].[ProductSubcategory] AS SUB 
--RIGHT JOIN [Production].[Product] AS PRO
--	ON PRO.ProductSubcategoryID=SUB.ProductSubcategoryID

--SELECT*FROM [Production].[ProductSubcategory]

--=================================================================
--						FULL OUTER JOIN
--=================================================================


SELECT 
    PRO.Name as Producto
    , PRO.ProductNumber
	, SUB.Name as Subcategoria
FROM  [Production].[ProductSubcategory] AS SUB 
CROSS JOIN [Production].[Product] AS PRO
	--ON PRO.ProductSubcategoryID=SUB.ProductSubcategoryID

-- FULL OUTER JOIN
-- jugando con cross join
SELECT 
     [ProductID]
    , [Name]    
    , [ProductSubcategoryID]
	INTO #TEMPORALPRODUCTO
FROM [Production].[Product] 
WHERE [ProductSubcategoryID] IN (17,14,12)


SELECT 
     [ProductSubcategoryID]
    , [Name]
	INTO #TEMPORALSUBCATEGORIA
FROM [Production].[ProductSubcategory]
WHERE [ProductSubcategoryID] IN (17,14,12)



SELECT*FROM #TEMPORALPRODUCTO
SELECT*FROM #TEMPORALSUBCATEGORIA
SELECT 
	PRO.ProductID,
	PRO.ProductSubcategoryID,
	SUB.ProductSubcategoryID,
	PRO.Name
FROM  #TEMPORALPRODUCTO AS PRO 
CROSS JOIN #TEMPORALSUBCATEGORIA AS SUB



-- EJERCICIO 
SELECT * FROM [Person].[Person]
SELECT * FROM [Sales].[PersonCreditCard]
SELECT * FROM [Sales].[CreditCard]

SELECT 
	PER.BusinessEntityID,
	PER.FirstName AS Nombre,
	PER.LastName AS Apellidos,
	CRD.CardType AS TipoTarjeta,
	CRD.CardNumber AS NumTarjeta,
	CRD.ExpMonth,
	CRD.ExpYear
FROM [Person].[Person] AS PER
INNER JOIN [Sales].[PersonCreditCard] PTE
	ON PER.BusinessEntityID=PTE.BusinessEntityID
INNER JOIN [Sales].[CreditCard] CRD
	ON PTE.CreditCardID=CRD.CreditCardID