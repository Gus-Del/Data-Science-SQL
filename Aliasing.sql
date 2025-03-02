#Aliasing


SELECT *
FROM products
;

SELECT product_name AS 'Goodie_Name'
FROM products
;
#changes column name to "Goodie_Name"

SELECT * ,
product_name AS 'Goodie_Name'
FROM products
;
#shows all columns and also changes column name to "Goodie_Name"

SELECT * , units_in_stock * sale_price AS 'Max_Profits'  # don't need AS if you don't want to. 
FROM products
;
#multiplies units in stock with sales price and renames that column Max Profits. 

SELECT * , units_in_stock * sale_price AS 'Max_Profits'  
FROM products 
;
#shows same output as prior example

SELECT * , p.units_in_stock * p.sale_price 'Max_Profits'  
FROM products p   #using p as an alias. Show same output as prior example.
;

SELECT * , products.units_in_stock * products.sale_price AS 'Max_Profits'  
FROM products     #shows same output as previous example. 
;