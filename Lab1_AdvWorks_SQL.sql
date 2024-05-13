/* 1- Listar los códigos y descripciones de todos los productos
(Ayuda: Production.Product)
*/

use AdventureWorks2014;

SELECT ProductID, Name 
FROM Production.Product;

/*2- Listar los datos de la subcategoría número 17 (Ayuda:
Production.ProductSubCategory) 
*/

SELECT *
FROM Production.ProductSubCategory
WHERE ProductSubcategoryID = 17;

/*3- Listar los productos cuya descripción comience con D (Ayuda:
like ‘D%’) 
*/

SELECT * 
FROM Production.Product
WHERE Name LIKE 'D%';

/*4- Listar las descripciones de los productos cuyo número finalice
con 8 (Ayuda: ProductNumber like ‘%8’) 
*/

SELECT Name
FROM Production.Product
WHERE ProductNumber LIKE '%8';

/*5- Listar aquellos productos que posean un color asignado. Se
deberán excluir todos aquellos que no posean ningún valor
(Ayuda: is not null) 
*/

SELECT *
FROM Production.Product
wHERE Color is not null;

/*6- Listar el código y descripción de los productos de color Black
(Negro) y que posean el nivel de stock en 500. (Ayuda:
SafetyStockLevel = 500) */

SELECT ProductID, ProductNumber, Name, Color, SafetyStockLevel
FROM Production.Product
WHERE Color = 'Black' AND SafetyStockLevel = 500;

/*7- Listar los productos que sean de color Black (Negro) ó Silver
(Plateado). */

SELECT ProductID, ProductNumber, Name, Color, SafetyStockLevel
FROM Production.Product
WHERE Color = 'Black' OR Color = 'Silver';

/*8- Listar los diferentes colores que posean asignados los
productos. Sólo se deben listar los colores. (Ayuda: distinct)*/

SELECT DISTINCT Color
FROM Production.Product
wHERE Color is not null;

/*9- Contar la cantidad de categorías que se encuentren cargadas
en la base. (Ayuda: count)*/

SELECT COUNT(*)
FROM information_schema.tables
WHERE table_type = 'BASE TABLE';

SELECT COUNT(*)
FROM Production.ProductCategory;

/*10- Contar la cantidad de subcategorías que posee asignada la
categoría 2.*/

SELECT COUNT(*)
FROM Production.Product
WHERE ProductSubcategoryID = 2;

/*11- Listar la cantidad de productos que existan por cada uno de los
colores. */

SELECT Color, COUNT(*) AS cantidad_de_productos
FROM Production.Product
WHERE Color is not null
GROUP BY Color;

/*12- Sumar todos los niveles de stocks aceptables que deben existir
para los productos con color Black. (Ayuda: sum) */

SELECT sum(SafetyStockLevel)
FROM Production.Product
WHERE Color = 'Black';

/*13- Calcular el promedio de stock que se debe tener de todos los
productos cuyo código se encuentre entre el 316 y 320.
(Ayuda: avg) */

SELECT AVG(SafetyStockLevel) AS promedio_stock
FROM Production.Product
WHERE ProductID BETWEEN 316 AND 320;

/*14- Listar el nombre del producto y descripción de la subcategoría
que posea asignada. (Ayuda: inner join)*/

SELECT Product.Name AS Nombre_Producto, Production.ProductCategory.Name AS Descripcion_Subcategoria
FROM Production.Product
INNER JOIN Production.ProductCategory ON Product.ProductSubcategoryID = ProductCategory.ProductCategoryID;

/*15- Listar todas las categorías que poseen asignado al menos una
subcategoría. Se deberán excluir aquellas que no posean
ninguna.*/

SELECT Production.ProductCategory.Name AS Categoria
FROM Production.ProductCategory
INNER JOIN Production.Product ON ProductCategory.ProductCategoryID = Product.ProductSubcategoryID
GROUP BY ProductCategory.Name;

/*16- Listar el código y descripción de los productos que posean fotos
asignadas. (Ayuda: Production.ProductPhoto)*/

SELECT Product.ProductID AS codigo, Product.Name AS descripcion
FROM Production.Product
INNER JOIN Production.ProductProductPhoto ON Product.ProductID = ProductProductPhoto.ProductID;

/*17- Listar la cantidad de productos que existan por cada una de las
Clases (Ayuda: campo Class) */

SELECT COUNT(*) AS cantidad_de_productos, Class
FROM Production.Product
GROUP BY Class;

/*18- Listar la descripción de los productos y su respectivo color. Sólo
nos interesa caracterizar al color con los valores: Black, Silver
u Otro. Por lo cual si no es ni silver ni black se debe indicar
Otro. (Ayuda: utilizar case).*/

SELECT Product.Name AS descripcion,
	CASE
		WHEN Color = 'Black' THEN 'Black'
		WHEN Color = 'Silver' THEN 'Silver'
		ELSE 'Otro'
	END AS Color_Caracterizado
FROM Production.Product;

/*19- Listar el nombre de la categoría, el nombre de la subcategoría
y la descripción del producto. (Ayuda: join)*/

SELECT pc.Name AS nombre_categoria, ps.Name AS nombre_subcategoria, p.Name AS descripcion_producto
FROM Production.ProductCategory pc
JOIN Production.ProductSubcategory ps ON ps.ProductCategoryID = pc.ProductCategoryID
JOIN Production.Product p ON p.ProductSubcategoryID = ps.ProductSubcategoryID;

/*20- Listar la cantidad de subcategorías que posean asignado los
productos. (Ayuda: distinct). */

SELECT p.ProductSubcategoryID, ps.Name, COUNT(*) AS cantidad_de_productos
FROM Production.Product p
INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY p.ProductSubcategoryID, ps.Name;

SELECT COUNT(DISTINCT P.ProductSubcategoryID) AS cantidad_de_subcategorias
FROM Production.Product p;


