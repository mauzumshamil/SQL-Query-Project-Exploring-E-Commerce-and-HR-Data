-- PROJECT DONE ON SQL STORE BY MAUZUM SHAMIL USING EVERY FUNCTIONS AVAILABLE IN SQL
USE sql_store;

SELECT * 
FROM customers
-- WHERE customer_id = 4
order by first_name;

-- using state clauses
SELECT first_name,state,points,points * 10 + 100
FROM CUSTOMERS;

SELECT 
    last_name,
    phone,
    city,
    points,
    ( points + 10 ) * 100
FROM CUSTOMERS;

SELECT
    first_name,
    last_name,
    points,
    points / 5 AS 'discount factor'
FROM CUSTOMERS;

-- problem 1
-- Return all the products 
-- name
-- unit price
-- new price (unit price * 1.1) ?

-- SOLUTION:
SELECT 
    name,
    unit_price,
    ( unit_price * 1.1 ) AS 'new price'
FROM products;

-- uses of where clauses by comparison operators
SELECT *
FROM customers
WHERE points > 3000;

SELECT * 
FROM customers 
WHERE state = 'va'; -- located in virginia 

SELECT * 
FROM customers 
WHERE state != 'va'; -- not located in virginia

SELECT first_name ,birth_date
FROM customers
WHERE birth_date > '1990-01-01' ;

-- PROBLEM 2
-- Get the orders placed this year

-- SOLUTION:

SELECT * 
FROM orders
WHERE order_date >= '2019-01-01';

-- the AND , OR and NOT operators
SELECT *
FROM customers
WHERE birth_date > '1990-01-01' AND points > 1000;

SELECT * 
FROM customers
WHERE birth_date > '1990-01-01' OR points > 1000 AND state = 'va';

SELECT * 
FROM customers
WHERE birth_date > '1990-01-01' OR 
    (points > 1000 AND state = 'va');
    
SELECT * 
FROM customers
WHERE NOT (birth_date > '1990-01-01' OR points >=1000);

-- we can avoid NOT clause by
SELECT *
FROM customers 
WHERE birth_date <= '1990-01-01' AND points <= 1000;
-- PROBLEM 3
-- From the order_items table, get the items
-- for order #6
-- where the total price is greater than 30

-- SOLUTION 
SELECT * 
FROM order_items;

SELECT * 
FROM order_items
WHERE order_id = 6 AND quantity * unit_price > 30;

-- uses of IN operators and with a problem 

SELECT * 
FROM customers
WHERE state = 'VA' OR state='GA' OR state='FL';

-- we can use IN operator and change the code 

SELECT *
FROM customers
WHERE state IN ('va','ga','fl');

-- we can use NOT operator 
SELECT *
FROM customers
WHERE state NOT IN ('va','ga','fl');

-- PROBLEM 
-- return products with
-- quantity of stock is equal to 49,38,72

-- solution 

SELECT * 
FROM products;

SELECT *
FROM products 
WHERE quantity_in_stock IN ('49','38','72');

-- uses of BETWEEN OPERATOR and a problem

SELECT * 
FROM customers
WHERE points >= 1000 AND points <= 3000;

-- we can change above code by BETWEEN operator

SELECT * 
FROM customers
WHERE points BETWEEN 1000 AND 3000;

-- PROBLEM 
-- RETURN THE BIRTH DATE OF CUSTOMERS 
-- IN BETWEEN 1/1/1990 AND 1/1/2000

-- SOLUTION sql_invoicing
SELECT *
FROM customers 
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- LIKE OPERATOR
SELECT *
FROM customers
WHERE first_name LIKE '%b%';

 -- 'b%' for first letter to be b 
SELECT *
FROM customers
WHERE first_name LIKE 'b%';

-- persons with last letter y
SELECT *
FROM customers
WHERE last_name LIKE '%y';

SELECT *
FROM customers 
WHERE city LIKE 'c%';

-- 6 character before ending in 0
SELECT *
FROM customers 
WHERE city LIKE '______o';

-- PRoblem 01 
-- address contain TRAIl OR AVENUE
-- SOLUTION
SELECT *
FROM customers 
WHERE address LIKE '%trail%' OR address LIKE '%ue';

-- problem 02 
-- phone number ends with 9
-- SOLUTION 
SELECT * 
FROM customers 
WHERE phone LIKE '%9';

-- we can use NOT operator here if we want not to end 

SELECT *
FROM customers
WHERE phone NOT LIKE '%9';

-- REGEXP USES AND A problem
-- used for searching string \ element
SELECT*
FROM customers 
WHERE last_name REGEXP 'field';

SELECT * 
FROM customers
WHERE last_name REGEXP 'FIELD|MAC|ROSE';

SELECT * 
FROM customers
WHERE last_name REGEXP 'FIELD|^MAC|ROSE';

SELECT *
FROM customers
WHERE last_name REGEXP '[rics]e';

SELECT *
FROM customers
WHERE last_name REGEXP 'e[ydfg]';

SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';

SELECT *
FROM customers
WHERE last_name REGEXP 'm';

--  get those customers 
-- problem 01
-- firstname are elka or ambur 
-- solution
SELECT * 
FROM customers 
WHERE first_name REGEXP '^elka|^ambur';
-- probelm 02 
-- last name end with ey or on
SELECT * 
FROM customers 
WHERE last_name REGEXP 'ey$|on$';
-- problem 03 
-- last name start with my or contains se
SELECT * 
FROM customers 
WHERE last_name REGEXP '^MY|se';
-- problem 04
-- last name contain B follows by R or U
SELECT * 
FROM customers 
WHERE last_name REGEXP 'b[ru]';

-- checking the null values 
SELECT *
FROM customers
WHERE phone IS NULL;

SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- problem 01
-- get the orders that are not shipped 

SELECT*
FROM orders
WHERE shipped_date IS NULL;

-- THE ORDERBY CLAUSE 
SELECT *,quantity * unit_price AS total_price 
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;

SELECT *
FROM order_items
WHERE order_id=4
ORDER BY unit_price DESC;

-- LIMIT CLAUSE 
SELECT * 
FROM customers
LIMIT 5;

SELECT *
FROM customers
LIMIT 4,4;-- this will emit first 4 and return the next 4 

-- problem 01
-- get the top three loyal customers 
SELECT first_name,last_name,points
FROM customers
ORDER BY points DESC
LIMIT 3;

-- inner join 
SELECT first_name,last_name,order_id
FROM order_items o
JOIN customers c 
     ON orders.customer_id = customers.customer_id;




