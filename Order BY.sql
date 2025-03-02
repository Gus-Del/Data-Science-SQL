# Order By

SELECT *
FROM customers
ORDER BY first_name
;
#sorts names from lowest to highest. alphabetical 

SELECT *
FROM customers
ORDER BY first_name DESC
;
#sorts from z to a. 

SELECT state, total_money_spent
FROM customers
ORDER BY state, total_money_spent
;

SELECT state, total_money_spent
FROM customers
ORDER BY state DESC, total_money_spent 
;
#orders state from z to a, then each state ordered from lowest to highest
#for total money spent. 

SELECT state, total_money_spent
FROM customers
ORDER BY state DESC, total_money_spent DESC
;
#orders state from z to a, then each state ordered from highest to lowest
#for total money spent.

SELECT state, total_money_spent
FROM customers
ORDER BY total_money_spent DESC, state DESC
;
#will order by total money spent first in desc, and state is secondary/irrelevant.

SELECT *
FROM customers
ORDER BY 8,9
;
#orders by column number. 1,2,3.....8 and 9. Here 8 and 9. 

SELECT *
FROM customers
ORDER BY 8 DESC,9 DESC
;
#best not to do this, b/c if we SELECT by customer_id, last_name, etc
#it won't work properly. Gives error. 

SELECT *
FROM customers
ORDER BY state DESC, total_money_spent DESC
;
#now it works again. Best to write it out and not use 8,9 or column numbers.
