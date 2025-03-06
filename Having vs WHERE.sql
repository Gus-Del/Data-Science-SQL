#HAVING vs WHERE

SELECT *
FROM customer_orders
;

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
;

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
WHERE total_tips > 5      #Gives ERROR
GROUP BY customer_id
;
#ERROR!!!
#Execution order is from, where, group by, and then select. AS total_tips is being created
#at the end so this gives an error. 

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
HAVING total_tips > 5
;
#HAVING used when aggregating columns. Order is from, group by, select, and then having. 

#Practice Question
#Using the customer orders table, write a query to show the products
#that had 2 or more orders. 

SELECT product_id, COUNT(customer_id) AS 2_MORE_Orders 
FROM customer_orders
GROUP BY product_id 
HAVING 2_MORE_Orders >= 2
;
#We could have COUNT(   ) any column b/c each row represents a different order. 