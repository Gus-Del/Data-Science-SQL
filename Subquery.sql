# Subqueries
#A subquery is a SELECT statement that is nested within another query
#A subquery returns an output that is used by the "outer" query. 

SELECT *
FROM customers
WHERE customer_id IN    #Where customer_id from customers table is also in customer_orders table. 
	(SELECT DISTINCT customer_id
     FROM customer_orders)
;
#tells us which customers have orders. 

SELECT *
FROM customers
WHERE customer_id IN
	(SELECT DISTINCT customer_id  
     FROM customer_orders
     WHERE tip > 2)
; 

SELECT *
FROM customers
WHERE customer_id IN
	(SELECT DISTINCT customer_id   #will give ERROR bc you can only return 1 column in subquery. 
     FROM customer_orders
     WHERE tip > 2)
; 

SELECT *
FROM customers
WHERE total_money_spent > (
	SELECT AVG(total_money_spent)
    FROM customers)
;

#Practice Question
#Using customers, customers orders, and products table - write a subquery to return 
#the first name and last name of customers who ordered something with chocolate in it. 

SELECT *
FROM customers;
SELECT *
FROM customer_orders;
SELECT *
FROM products;

SELECT DISTINCT c.first_name, c.last_name
FROM customers c
JOIN customer_orders cor
	ON c.customer_id = cor.customer_id
JOIN products p
	ON cor.product_id = p.product_id
WHERE cor.product_id IN
	(SELECT product_id     #notice how we don't use Aliases inside the subquery. 
     FROM products
     WHERE product_name LIKE '%Chocolate%')
;

#The above and below solutions give the same output. 

SELECT DISTINCT c.first_name, c.last_name
FROM customers c
JOIN customer_orders cor
	ON c.customer_id = cor.customer_id
WHERE product_id IN
	(SELECT product_id
     FROM products
     WHERE product_name LIKE '%Chocolate%')
;

#Practice Question
#Using the employees table, use a subquery to select the 2nd highest paid employee. 

SELECT *
FROM employees;

SELECT *
FROM employees
WHERE salary = (
	 SELECT salary
     FROM employees
     ORDER BY salary DESC
     LIMIT 1,1)      
; 

#LIMIT 1, 1 : The first number (1) is the offset (skip the highest salary)
# The second number (1) is the number of rows to return. 
#LIMIT 3,2 would start at position 3 and output 2 rows after that. 
#The below example is another solution that gives the same output as above. 

SELECT *
FROM employees
WHERE salary NOT IN
	(SELECT MAX(salary)
     FROM employees)
ORDER BY salary DESC
LIMIT 1;
---------------------------------------------------
# Write a query to find the people who spent a higher than average amount of time on social media.
# Order names alphabetically.
#Note we have a tables called: 
#user_time(columns: user_id , media_time_minutes)
#users (columns; user_id, first_name)

SELECT first_name
FROM users
WHERE user_id IN 
  (SELECT user_id
   FROM user_time
   WHERE media_time_minutes >
     (SELECT AVG(media_time_minutes)
      FROM user_time))
ORDER BY first_name
;
#The subquery SELECT AVG(Media_Time_Minutes) FROM user_time correctly calculates the average without ORDER BY.
#Then, it filters user_time for users whose media_time_minutes is greater than the average.
#Finally, it selects those users from users, ordering by First_Name.
---------------------------------------------------------------------------------------------
# ANY and ALL in Subqueries

SELECT *
FROM ordered_items;

SELECT MAX(quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE shipper_id = 1;

SELECT *
FROM ordered_items
WHERE (quantity * unit_price) >
	(SELECT MAX(quantity * unit_price) AS total_order_price
	FROM ordered_items
	WHERE shipper_id = 1);
#A.  Will show we have two orders that are larger than MAX total_order_price of shipper_id = 1. 
# Gives outputs of 332.64 and 824.64


SELECT ALL (quantity * unit_price) AS total_order_price
	FROM ordered_items
	WHERE shipper_id = 1;
    
SELECT * , (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > 
			ALL (SELECT (quantity * unit_price) AS total_order_price
			FROM ordered_items
			WHERE shipper_id = 1);
# shows the same as A. above. 
# Gives outputs of 332.64 and 824.64
#Note with All it is not possible to use = operator b/c of so many different values. 

SELECT * , (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > 
			ANY (SELECT (quantity * unit_price) AS total_order_price
			FROM ordered_items
			WHERE shipper_id = 1);
#condition satisfied if greater than ANY quantity * unit price of shipper id = 1. 
#With ANY, we can use a comparison operator such as =. 
-------------------------------------------------------------------------------------------

#Suqueries in SELECT and FROM 

SELECT product_id, quantity, AVG(quantity)
FROM ordered_items
GROUP BY product_id,quantity
;
#Notice we had to use a GROUP BY. 
#But what if we didn't want it to be grouped? see below. 

SELECT product_id, quantity, 
		(SELECT AVG(quantity) FROM ordered_items)  #use a subquery in SELECT statement. 
FROM ordered_items
;
#Now it gives you avg for all the quantites for each product_id whereas before it was grouping

SELECT product_id, quantity, 
		(SELECT SUM(quantity) FROM ordered_items) AS Sum_of_total,
(quantity / (SELECT SUM(quantity) FROM ordered_items) * 100) AS Percentage_of_all_orders
FROM ordered_items; 


#Now see how we can use Subquery in FROM statement#

SELECT *
FROM (SELECT product_id, quantity, 
	  (SELECT AVG(quantity) FROM ordered_items) 
	   FROM ordered_items) AS avg_quantity #gave eror "derived table must have its own alias". We had to give it an Alias of avg_quantity. 
;

SELECT new_column
FROM (SELECT product_id, quantity, 
	  (SELECT AVG(quantity) FROM ordered_items) AS new_column  # Need Alias to select that column in line 1. 
	   FROM ordered_items) AS avg_quantity #gave eror "derived table must have its own alias". We had to give it an Alias of avg_quantity. 
;

#Practice Question
#Given the customer_orders table, use a subquery to determine the customers who have made a purchase that was higher than the avg total purchase
#of all the orders. Have the customer ID, order_total, and average of order totals in your output. 

SELECT *
FROM customer_orders;

SELECT customer_id, order_total,
       (SELECT AVG(order_total) FROM customer_orders)
FROM customer_orders
WHERE order_total > (SELECT AVG(order_total) FROM customer_orders);

 


