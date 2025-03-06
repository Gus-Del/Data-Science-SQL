#Group By
#Will see this a lot in job interviews. 
#Groups a set of rows into a set of summary rows based on the values in one or more columns. 
#Most often used in conjunction with aggregate functions like SUM, COUNT, MAX, MIN, and AVG, which allow you to 
#perform calculations on the grouped data. 

#SELECT column1, AVG(column2)
#FROM table1
#GROUP BY column1
#This is going to group similar rows from column1 while looking at the Average of column 2.
SELECT *
FROM customer_orders
;


SELECT customer_id, SUM(tip)
FROM customer_orders
GROUP BY customer_id
;
# groups the customer id and sums up the tips for each customer id. SUM was 12 dollars for customer_id 100101. 

SELECT customer_id, COUNT(tip), SUM(tip)
FROM customer_orders
GROUP BY customer_id
;
#shows customer_id 100101 gave 3 separate tips (COUNT) for a total of 12 dollars(SUM). 

SELECT customer_id, COUNT(tip) AS count_tips, SUM(tip) AS total_tip
FROM customer_orders
GROUP BY customer_id
;
# renames the columns as count_tips and total_tips. 

SELECT customer_id, COUNT(tip) AS count_tips, SUM(tip) AS total_tip
FROM customer_orders
GROUP BY customer_id
ORDER BY total_tip
;
#You will see total_tip column ordered by 1 to 12 in ascending order. 

SELECT customer_id, COUNT(tip) AS count_tips, SUM(tip) AS total_tip
FROM customer_orders
GROUP BY customer_id
ORDER BY total_tip DESC
;
#now total_tip column is in descending order, i.e., 12, 11, 6, 3, 3, etc. 

#Practice Question
#Using the employees table, write a query to show the avg salary for each department

SELECT *
FROM employees
;

SELECT department, AVG(salary)
FROM employees
GROUP BY department
;


