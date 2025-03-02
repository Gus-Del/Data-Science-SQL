#Select Statement

SELECT * FROM customers;



SELECT first_name, 
last_name, 
phone,
address,
total_money_spent,
total_money_spent + 100 * 10   #FOLLOWS PEMDAS. 
FROM customers
WHERE first_name = 'Kelly'
;

SELECT state
FROM customers;

SELECT DISTINCT state
FROM customers;

#Practice Question: 
#Using the customers table, write a query to show the phone numbers of all
# customer who live in Texas(TX)

SELECT *
From customers;


SELECT phone
FROM customers
Where state = 'TX';

