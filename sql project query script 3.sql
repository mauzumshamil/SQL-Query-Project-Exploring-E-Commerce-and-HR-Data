USE sql_hr;

-- use of self outer join
-- retrieve all the employees and their manager from sqlhr schema 

SELECT * 
FROM employees e 
LEFT JOIN employees m
     ON e.reports_to = m.employee_id;
     
-- more simplified version 
SELECT 
      e.employee_id,
      e.first_name,
      m.first_name AS manager
FROM employees e 
LEFT JOIN employees m
     ON e.reports_to = m.employee_id;
     
-- USING CLAUSE 
USE sql_store;

SELECT
     o.order_id,
     c.first_name,
     sh.name AS shipper
FROM orders o
JOIN customers c 
	USING (customer_id)
LEFT JOIN shippers sh 
    USING (shipper_id); -- here we get all the orders even it shipped or not

-- when we have composite table 
SELECT 
      oi.order_id,
      oi.product_id,
      oin.note AS note
FROM order_items oi
LEFT JOIN order_item_notes oin 
	USING (order_id,product_id);
        
-- problem on USING  CLAUSE
-- on sql_incoicing database rerieve from payment 
-- and payment method tables the columns date,client,amount,method of payments

USE sql_invoicing;

SELECT
      p.date,
      c.name,
      p.amount,
      pm.name AS Payment_method
FROM payments p
JOIN clients c 
     USING (client_id)
LEFT JOIN payment_methods pm 
     ON p.payment_method = pm.payment_method_id; 
     
USE sql_store;

-- use of cross join 
SELECT 
     c.first_name,
     p.name AS product_name
FROM customers c
CROSS JOIN products p 
ORDER BY first_name ;

-- probelm;  do a cross join between shippers and products 
-- using an implicit syntax and after using the explict syntax

-- implicit syntax of cross join 

SELECT 
     p.name as product_name,
     s.name as shippers_name
FROM products p ,shippers s 
ORDER BY p.name ;

-- EXOLICIT SYNTAX FOR THE CROSS JOIN 
SELECT 
s.name AS shipper_name,
    p.name AS product_name
FROM products p
CROSS JOIN shippers s 
ORDER BY p.name ;
     
-- opp way
SELECT 
    p.name AS product_name, 
    s.name AS shipper_name
FROM shippers s 
CROSS JOIN products p
ORDER BY p.name ;

USE sql_store;
SELECT * 
FROM customers
