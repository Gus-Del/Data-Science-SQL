# CASE Statements

SELECT *
FROM customers
;

SELECT *,
CASE 
	WHEN units_in_stock < 20 THEN 'Order More Now!'
	WHEN units_in_stock BETWEEN 21 AND 50 THEN 'Check back Friday'
	WHEN units_in_stock > 50 THEN 'ALL good my friend'
END AS Label #this 'AS Label' makes sure it doesn't write all logic above in column
FROM products
;

#above and below give same output

SELECT *,
CASE 
	WHEN units_in_stock < 20 THEN 'Order More Now!'
	WHEN units_in_stock BETWEEN 21 AND 50 THEN 'Check back Friday'
	ELSE 'ALL good my friend'
END AS Label #this "AS Label" makes sure it doesn't write all logic above in column
FROM products
;

SELECT *,
CASE 
	WHEN units_in_stock < 20 THEN 'Order More Now!'
	WHEN units_in_stock > 50 THEN 'Check back Friday'
	WHEN units_in_stock > 100 THEN 'ALL good my friend'
END AS Label #this makes sure it doesn't write all logic above in column
FROM products
;
#Notice how > 50 logic and >100 logic is redundant. So something with 200, would 
#just read "Check back Friday' instead of "All good my friend'. 

#Practice Question
#USing the table customer_orders, if a customer tipped 2 dollars
# or more give them a 10% discount
#Make this a new column called 'discounted total' to compare to the 
#original order amount. 

SELECT *,
CASE 
	WHEN tip >= 2 THEN order_total - order_total*0.10
END AS 'Discounted Total'
FROM customer_orders
;

#both above and below give same output

SELECT *,
CASE 
	WHEN tip >= 2 THEN order_total * 0.9
END AS 'Discounted Total'
FROM customer_orders
;