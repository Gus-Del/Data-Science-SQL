# LIKE operator
#%   the percent sign represents 0,1, or multiple characters. 
# _  underscore represents how many characters. 

SELECT *
FROM customers
WHERE first_name LIKE 'k%'
;
#above means any first_name that starts with a k and has 0 characters after it, or 1 character after k, or multiple characters after k. 
# the above returns Kevin and Kelly

SELECT *
FROM customers
WHERE first_name LIKE 'k%n'
;
# the above returns Kevin only. So starts with K, any multiple characters in between, and n at the end. 

SELECT *
FROM customers
WHERE first_name LIKE '%n'
;
#above means return any name with an n at the end. 

SELECT *
FROM customers
WHERE first_name LIKE '%k%'
;
# anthing that has a k in it. 

SELECT *
FROM customers
WHERE first_name LIKE 'm_____'
;
#returns first names that start with m and has 5 letters after it, hence 5 underscores.
# returns Maggie. 

SELECT *
FROM customers
WHERE first_name LIKE 'm______'
;
#returns Michael. 

SELECT *
FROM customers
WHERE first_name LIKE 'Do_'
;
#returns Don

SELECT *
FROM customers
WHERE first_name LIKE 'D_'
;
#returns nothing

SELECT *
FROM customers
WHERE last_name LIKE 's_____%'
;
# satisfied argument b/c has 5 characters after s, and also any characters after. 

SELECT *
FROM customers
WHERE phone LIKE '%9%'
;
# returns numbers with a 9 anywhere

SELECT *
FROM customers
WHERE phone LIKE '9%'
;
# returns phones that start with a 9. 
