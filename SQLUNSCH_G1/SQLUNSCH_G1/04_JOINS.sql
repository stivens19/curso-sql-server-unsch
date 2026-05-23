USE AdventureWorks2022
GO
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