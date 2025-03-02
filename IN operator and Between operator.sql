# IN Operator

SELECT * 
FROM customers
WHERE state IN ('PA', 'TX','CA')
;

#above and below output the same. Bottom syntax is longer though. 

SELECT * 
FROM customers
WHERE state ='PA' OR state = 'TX' OR state = 'CA'
;

SELECT * 
FROM customers
WHERE first_name IN ('Kevin', 'Kelly')
;

#Between Operator

SELECT * 
From customers
WHERE total_money_spent BETWEEN 534 AND 1009
;

#Notice above and below output the same. 

SELECT * 
From customers
WHERE total_money_spent >= 534 AND total_money_spent <=1009
;

SELECT * 
From customers
WHERE total_money_spent BETWEEN 1009 AND 534
;
# nothing returns b/c larger number comes first. 

SELECT * 
From customers
WHERE total_money_spent >= 1009 AND total_money_spent <=534
;
#the above does not return anything. Notice logic. 

SELECT * 
From customers
WHERE birth_date between '1990-01-01' AND '2020-01-01'
;
#remember must be in proper order from smallest to largest to output. 

SELECT * 
From customers
WHERE first_name between 'Charles' AND 'Obi'
;

#Practice Question
#Using the products table, select the name of the product where the sale price
#is between $1.25 and $3. 

SELECT * 
FROM products
;

SELECT product_name
From products
WHERE sale_price BETWEEN 1.25 AND 3.00
;

