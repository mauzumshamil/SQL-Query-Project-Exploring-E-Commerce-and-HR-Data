-- Union 
USE sql_store;
-- with union operator we can join multiple rows from multiple columns
SELECT
     order_id,
     order_date,
     'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT
     order_id,
     order_date,
     'Archive' AS status
FROM orders
WHERE order_date < '2019-01-01';

-- MUltiple table
SELECT first_name 
FROM customers
UNION 
SELECT name 
FROM shippers ;

SELECT 
first_name AS full_name
FROM customers
UNION 
SELECT name 
FROM shippers ;

-- PROBLEM ON UNION 
-- write a query for to produce a report where columns are customer_id and firstname and points and type . in the type colum categorise the piont as type 
-- between bronce ,silver, gold and order by the table by firstnaame

SELECT 
	customer_id,
    first_name,
    points,
    'BRONZE' AS type
FROM customers
WHERE points < 2000
UNION 
SELECT 
	customer_id,
    first_name,
    points,
    'SILVER' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION 
SELECT 
	customer_id,
    first_name,
    points,
    'GOLD' AS type
FROM customers
WHERE points > 3000
ORDER BY first_name;


