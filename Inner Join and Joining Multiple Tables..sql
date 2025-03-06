#Joins are used to combine rows from two or more tables based on a relatd column
#There are several types of JOINs in SQL, 
#including INNER JOIN, OUTER JOIN, CROSS JOIN, and SELF JOIN. 
#ON clause is used to specify which columns to join from each table. 

#Example

#SELECT *
#FROM customers as c
#JOIN customer_orders co
#	ON c.customer_id = co.customer_id;
------------------------------------------------------------------------------
#An INNER JOIN in SQL is a type of join that returns the rows from both tables 
#where there is a match based on the specified condition. If there is no match, 
#no rows will be returned.

#SELECT column_name(s)
#FROM table1
#INNER JOIN table2
#ON table1.column_name = table2.column_name;

SELECT * 
FROM customers;

SELECT *
FROM customer_orders;

SELECT * 
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY co.customer_id
;
#notice 107 and 109 is missing b/c it is not in customer_orders. 

SELECT * 
FROM products;

SELECT * 
FROM customer_orders;

#Below, select the product name, product id, and order_total

SELECT product_name, p.product_id, order_total
FROM products p
INNER JOIN customer_orders co
	ON p.product_id = co.product_id
;
#must use p.product_id in SELECT b/c both tables have product_id
# so it doesn't know which table it is pulling from. 
#notice product_name and order_total are unique so no need to specify from
#which table we are pulling from like p.product_id.

SELECT product_name, p.product_id, SUM(order_total)
FROM products p
INNER JOIN customer_orders co
	ON p.product_id = co.product_id
GROUP BY product_name, p.product_id
;

SELECT *
FROM suppliers;

SELECT *
FROM ordered_items;
#notice both tables do not have a column with matching names. 

SELECT *
FROM suppliers s
JOIN ordered_items oi
	ON s.supplier_id = oi.shipper_id
;
#Here we used the supplier_id in one table with shipper_id in the other. 
---------------------------------------------------------
#Joining Multiple Tables

SELECT *
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id #using joint table to join with customers table
;
#products table doesn't have a customer_id. We do have a customer_id 
#from the customer_orders table. So we use the first joined table to 
# tie to the customers table via customer_id. 

SELECT product_name, order_total, first_name
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id #using joint table to join with customers table
;

SELECT p.product_id,co.product_id, co.customer_id, c.customer_id
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id #using joint table to join with customers table
;

#Practice Question
#Given these 3 tables(suppliers, ordered_items, customer_orders), write a 
#query to return the name of the supplier and the sum of the total order
#amount for each supplier. 

SELECT name, SUM(order_total)   #all unique to their table so no need to use with aliases s, o, c. 
FROM suppliers s
JOIN ordered_items o
	ON s.supplier_id = o.shipper_id #tie supplier_id to shipper_id. 
JOIN customer_orders c
	ON o.order_id = c.order_id   #tie order_id from both tables. 
GROUP BY name     #using aggregate function SUM in SELECT, must use GROUP BY for name. 
;
#Every column in SELECT clause must either be inside an aggregate function like SUM, 
#OR be listed in the GROUP BY clause. 

#If you use a non-aggregated column in the SELECT statement along with an aggregate function, 
#you must use GROUP BY to specify how data is grouped.




