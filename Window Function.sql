#Window Function
# Performs a calculation across a set of rows that are related to the current row. 
#Similar to an aggregate function, but a window function does not cause rows to group into a single output row. 
#Functions are applies to each row individually, and the result is displayed in a separate column of the output. 

#Window Functions Basics - Over + Partition By

SELECT c.customer_id, first_name, order_total, MAX(order_total)
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
GROUP BY c.customer_id, first_name, order_total
;
    
SELECT c.customer_id, first_name, order_total, 
MAX(order_total) OVER()  #Looking at MAX order total over all order_totals. 
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
; 

   #Above and below give same output. 

SELECT c.customer_id, first_name, order_total, 
		(SELECT MAX(order_total) FROM customer_orders)  
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
; 


SELECT c.customer_id, first_name, order_total, 
MAX(order_total) OVER(PARTITION BY first_name)  #Puts same first_names next to each other in rows(EX. Kevin,Kevin,Kevin) 
FROM customers c								# and then looking at Max order total for each Kevin. 
JOIN customer_orders co
	ON c.customer_id = co.customer_id
; 

#Above and below give same output. 

SELECT c.customer_id, first_name, order_total, 
MAX(order_total) OVER(PARTITION BY customer_id)  
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
; 

SELECT c.customer_id, first_name, order_total, 
MAX(order_total) OVER(PARTITION BY first_name ORDER BY first_name)  
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
; 

SELECT c.customer_id, first_name, order_total, 
AVG(order_total) OVER(PARTITION BY first_name ORDER BY first_name)  
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
; 

#Practice Question
#Given the customer orders table, provide a rolling SUM of purchases each customer has made, 
#from smallest to largest purchase.
#Give the customer ID, order total, and rolling order total called "Rolling_Total"

SELECT *
FROM customer_orders;

SELECT customer_id, order_total,
SUM(order_total) OVER(PARTITION BY customer_id ORDER BY order_total) Rolling_Total
FROM customer_orders
; 

#Write a query to find the running total for each gender for each day.
#A running total is where you take the previous days total and add it to the current days total.
#Output should include the gender, date, points, and running totals.
#Order by gender and day from smallest to largest.
#NOTE: This table is not included in the bakery schema. 

#   TABLE: points
#   Columns: gender, points, dates

SELECT gender, dates, points,
SUM(points) OVER(PARTITION BY gender ORDER BY dates) Running_Total
FROM points
ORDER BY gender
; 
-------------------------------------------------------------------------

## Row_Number
# ROW_NUMBER() is a window function in SQL that assigns a unique row number to each 
# row within the partition of a result set. The first row selected has a row number of 1, 
# the second has 2, and so on.


SELECT c.customer_id, first_name, order_total, 
ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY order_total DESC) as row_num
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

#Below, try to select the highest row_number in each first_name. 

SELECT * 
FROM(
SELECT c.customer_id, first_name, order_total, 
ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY order_total DESC) as row_num
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id) Row_Table    #when using subquery must name that table. 
WHERE row_num = 1
;

#notice above how we created a subquery in order to get to the 1st row of each first_name. 

----------------------------------------------------------------------------------

## Rank and Dense_Rank

#RANK() and DENSE_RANK() are both window functions in SQL that assign a unique rank to each row within a 
#partition of a result set.

#RANK() function assigns a unique rank to each distinct row within a partition but leaves gaps in 
#the ranking for tied rows. If two (or more) rows tie for a rank, each tied rows receives the same rank, 
#and then the next rank in the sequence is skipped. For example, if two rows tie for rank 1, RANK() gives 
#both rows a rank of 1, but the next row receives a rank of 3.

#DENSE_RANK() function also assigns a unique rank to each distinct row within a partition, but unlike RANK(), 
#it does not skip any ranks. If two (or more) rows tie for a rank, each tied rows receives the same rank, 
#and the next row receives the next rank in the sequence. For example, if two rows tie for rank 1, 
#DENSE_RANK() gives both rows a rank of 1, and the next row receives a rank of 2.

SELECT *
FROM employees;

SELECT * , 
RANK() OVER(PARTITION BY department ORDER BY salary)
FROM employees;

SELECT * , 
RANK() OVER(PARTITION BY department ORDER BY salary) AS Rank_col,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary) DENSE_col
FROM employees;

SELECT * , 
RANK() OVER(PARTITION BY department ORDER BY salary) AS Rank_col,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary) DENSE_col,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary) AS row_number_col
FROM employees;
#Note we can't filter on any of the above. 

SELECT * 
FROM
(SELECT * , 
RANK() OVER(PARTITION BY department ORDER BY salary) AS Rank_col,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary) DENSE_col,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary) AS row_number_col
FROM employees) Random_Table
WHERE Rank_col = 3;

#Rank the student's scores in the Grades table from highest to lowest. If two students have the same grade, 
#give them the same ranking. The next rank should be the next number numerically.
#Output should include name, grade, and rank. Order the output by rank and name alphabetically.

Table: Grades    #note this table is not included in the bakery schema. 
Columns: student_name, grade. 

SELECT *
Grades;

SELECT *,
DENSE_RANK() OVER(ORDER BY grade DESC) Rankings  #The grades are ranked 1,2,3,3,4 vs. 1,2,3,3,5 like Rank()
FROM grades 
ORDER BY Rankings, student_name 
;
-----------------------------------------------------------------

# LAG and LEAD

# LAG() and LEAD() are window functions in SQL that provide a way to access data from a different row in 
# the same result set without using a self-join. They are often used in data analysis to compare the current row 
# with the previous or next row.

#LAG() function fetches the value from a row that is a certain number of rows before the current row within the 
#same result set. It's useful when you want to compare a value in a row with a value in a preceding row.

#LEAD() function fetches the value from a row that is a certain number of rows after the current row within the 
# same result set.


SELECT *,
LAG(salary) OVER(PARTITION BY department ORDER BY salary) #shows preceding salary row value
FROM employees;

SELECT *,
LAG(salary) OVER(PARTITION BY department ORDER BY salary) lags,  #shows preceding salary row value
LEAD(salary) OVER(PARTITION BY department ORDER BY salary) leads  #shows row after current salary row
FROM employees;


SELECT *,
CASE
	WHEN salary < lags THEN 'Less'
	ELSE 'More'
END AS label
FROM (
	SELECT *,
	LAG(salary) OVER(PARTITION BY department ORDER BY employee_id) lags  #shows preceding salary row value
	FROM employees) AS temp_table
;
    
    
