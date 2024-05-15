SELECT * FROM sql_store.orders;

-- inner join 
SELECT first_name,last_name,order_id,c.customer_id
FROM orders o
JOIN customers c 
     ON o.customer_id = c.customer_id;
     
-- problem 01 on join
-- write a query that join-- orderitems table join in it with products table for each order 
-- return product id and its name followed by quantity 
-- and unit price from order items table (use alias functions to simplify the code) ?

SELECT order_id,o.product_id,name,quantity,o.unit_price
FROM order_items o
JOIN products p ON p.product_id = o.product_id;

-- we can join columns of tables across the database 

SELECT *
FROM order_items o
JOIN sql_inventory.products p ON o.product_id = p.product_id;

SELECT p.product_id,o.unit_price,quantity,name
FROM order_items o
JOIN sql_inventory.products p ON o.product_id = p.product_id;

-- SELF JOINS 

-- from sql hr 
USE sql_hr;

SELECT*
FROM employees e 
JOIN employees m ON e.reports_to = m.employee_id;

SELECT e.employee_id,
       e.first_name AS 'employee name',
       m.first_name AS 'manager'
FROM employees e
JOIN employees m ON e.reports_to = m.employee_id;

USE sql_store;
-- joining multiple tables together 

SELECT *
FROM orders o
JOIN customers c 
     ON o.customer_id = c.customer_id
JOIN order_statuses os
     ON o.status = os.order_status_id; 

-- to simplifying to understand 

SELECT
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    c.address,
    os.name
FROM orders o
JOIN customers c 
     ON o.customer_id = c.customer_id
JOIN order_statuses os
     ON o.status = os.order_status_id; 
     
-- problem 01 
-- write a query that join the payements table with clients table and along with payment method make a detail 
-- and clean report with name and payment method and everything

USE sql_invoicing;

SELECT *
FROM payments p 
JOIN clients c 
     ON p.client_id = c.client_id
JOIN payment_methods pm 
     ON p.payment_method = pm.payment_method_id;
     
-- more understanding 

SELECT 
	p.client_id,
    p.date,
    p.invoice_id,
    c.name,
    p.amount, 
    pm.name AS 'pay method'
FROM payments p 
JOIN clients c 
     ON p.client_id = c.client_id
JOIN payment_methods pm 
     ON p.payment_method = pm.payment_method_id;
     
-- 
-- implicit join syntax 
-- without using the join syntax 
USE sql_store;
SELECT *
FROM customers c , orders o 
WHERE c.customer_id = o.customer_id;

USE sql_store;
-- OUTER JOINS

-- eg of inner join 
SELECT 
	c.customer_id,
    o.order_id,
	c.first_name
FROM customers c
JOIN orders o 
     ON c.customer_id=o.customer_id
ORDER BY order_id;

-- LEFT JOIN 

SELECT 
      c.customer_id,
      c.first_name,
      o.order_id
FROM customers c
LEFT JOIN orders o 
	ON c.customer_id = o.customer_id
ORDER BY customer_id;
-- now we got the all the customers in the customer section 

-- RIGHT JOIN 
SELECT 
      c.customer_id,
      c.first_name,
      c.last_name,
      o.order_id
FROM customers c
RIGHT JOIN orders o 
      ON c.customer_id = o.customer_id
ORDER BY customer_id;

-- problem on outer join
-- write a query to join order_items table with product id but
-- all the product_id should be listed even there is no quantity
SELECT 
     p.product_id,
     p.name,
     o.quantity
FROM products p
LEFT JOIN order_items o 
	ON p.product_id = o.product_id
ORDER BY product_id;

-- joining multiple tables \ alternative join 

SELECT 
     c.customer_id,
     c.first_name,
     o.order_id,
     s.name AS 'shipper name'
FROM customers c
LEFT JOIN orders o
     ON c.customer_id = o.customer_id
LEFT JOIN shippers s
	 ON s.shipper_id = o.shipper_id;
 
 -- problem on outer join in multiple data
 -- write a  query to joins tables the resulted tables columns should be
 -- order_date,order_id,first_name,shipper,status from across tables
 
 -- solution 
 SELECT 
     o.order_date,
     o.order_id,
     c.first_name AS customer,
     s.name AS shipper,
     o.status,
     os.name AS status
FROM orders o 
LEFT JOIN customers c 
     ON c.customer_id = o.customer_id
LEFT JOIN shippers s
     ON s.shipper_id = o.shipper_id
JOIN order_statuses os
	 ON o.status = os.order_status_id;

 



