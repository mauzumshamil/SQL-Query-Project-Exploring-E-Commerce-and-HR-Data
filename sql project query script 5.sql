-- COLUMN ATTRIBUTES

USE sql_store;
INSERT INTO customers
VALUES (DEFAULT,
      'MAUZUM',
      'SHAMIL',
      '2002-12-24',
      NULL,
      'INDIA',
      'PKD',
      'KL',
      DEFAULT);
      
SELECT *
FROM customers;

-- inserting multiple rows
INSERT INTO shippers (name)
VALUES ('shipper 1'),
	   ('shipper 2'),
       ('shipper 3');
       
-- problem 01
-- Insert three rows in the product table 
INSERT INTO products (name,
quantity_in_stock,
unit_price)
VALUES ('apple',20,30),
('orange',49,12),
('banana',50,10);

-- INSERTING HEIRARCHIAL ROWS

INSERT INTO orders (customer_id,
order_date,
status)
VALUES (1,'2019-01-02',1);

INSERT INTO order_items
VALUES 
	(LAST_INSERT_ID(),1,4,4.5),
    (LAST_INSERT_ID(),3,2,3.56);
    

-- creating a copy of a table 

CREATE TABLE order_archievd AS 
SELECT *
FROM orders;

INSERT INTO order_archievd
SELECT *
FROM orders
WHERE order_date < '2019-01-01';

USE sql_invoicing;

-- CREATE A TABLE WITH THE COLUMNS IN THE INVOICE TABLE BUT IN THE CLIENT_ID FETCH IT WITH THE CLIENT NAME FROM THE TABLE CLIENTS 
-- AND ALSO ONLY FETCH THE INVOICES WHERE THE PAYMENT HAS BEEN DONE

CREATE TABLE invoice_archive AS 
SELECT
	i.invoice_id,
    i.number,
    c.name AS 'clients',
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.due_date,
    i.payment_date
FROM invoices i
JOIN clients c 
		USING (client_id)
WHERE payment_date IS NOT NULL 








