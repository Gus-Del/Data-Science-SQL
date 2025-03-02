#LIMIT

SELECT *
FROM customers
;

SELECT *
FROM customers
LIMIT 5
;
#shows only top 5 records

SELECT *
FROM customers
WHERE total_money_spent > 8000
LIMIT 5
;
#returns only 1 record, bc there is only 1 record over 8000. If there were 10 records, it would only show the first 5. 

SELECT *
FROM customers
WHERE total_money_spent < 8000
LIMIT 5
;
#filters first values that are less than 8000. 

SELECT *
FROM customers
WHERE total_money_spent < 8000
ORDER BY total_money_spent DESC
LIMIT 5
;

SELECT *
FROM customers
WHERE total_money_spent < 8000
ORDER BY total_money_spent DESC
LIMIT 3,2   # starts at position 3 and returns 2 rows after that. 
;

#Practice Question
#Using the customers table, write a query to show the top 2 customers by money spent

SELECT *
FROM customers
ORDER BY total_money_spent DESC
LIMIT 2 
;
#Common interview question. 