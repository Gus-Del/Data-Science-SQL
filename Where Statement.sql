# Where Statement


SELECT * FROM customers
WHERE first_name ='Kevin';

SELECT * FROM customers
WHERE first_name <> 'Kevin';  #where first_name does NOT = Kevin.

SELECT * FROM customers
WHERE total_money_spent > 1000;

SELECT * FROM customers
WHERE total_money_spent >= 1009;  #greater than and equal 1009

SELECT * FROM customers
WHERE total_money_spent < 1009; #less than 1009. 

#AND, OR, NOT
SELECT * 
FROM customers
WHERE total_money_spent < 1000 AND state = 'TX'
;

SELECT * 
FROM customers
WHERE total_money_spent < 1000 or state = 'TX'
;

SELECT * 
FROM customers
WHERE birth_date < '1995-01-01' AND state = 'PA' OR state = 'NY'
;

SELECT * 
FROM customers
WHERE birth_date < '1995-01-01' OR state = 'PA' AND state = 'NY'
;
#notice AND 'NY" statement was irrelevant. 

SELECT * 
FROM customers
WHERE birth_date < '1995-01-01' OR state = 'PA' AND state = 'NY'
;

SELECT * 
FROM customers
WHERE (birth_date < '1995-01-01' OR state = 'PA') AND state = 'NY'
;
#first it filters the parentheses AND state = 'NY'

SELECT * 
FROM customers
WHERE NOT birth_date < '1995-01-01'
;
#Notice birth dates greater than 1995-01-01, not less than. 

#same as below. 

SELECT * 
FROM customers 
Where birth_date > '1995-01-01'
;
#8:32

SELECT * 
FROM customers 
Where first_name = 'Frodo'
;

SELECT * 
FROM customers 
Where NOT first_name = 'Frodo'
;
#above and below are same thing. 
SELECT * 
FROM customers 
Where first_name != 'Frodo'
;

#Practice Question
#Using the employees table, write a query to show the employee Id,
#first name, and last name, and salary
# of employees that make more than 45k in the bakery dept. 

SELECT * 
FROM employees
;

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > '45000' AND department = 'Bakery'
;

SELECT * FROM employees
WHERE salary > 45000 AND department = 'Bakery'
;
