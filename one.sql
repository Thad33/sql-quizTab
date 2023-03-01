CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20)
);
INSERT INTO customers (customer_id, first_name, last_name, email, phone_number) VALUES
  (1, 'Alice', 'Smith', 'alice@example.com', '555-1234'),
  (2, 'Bob', 'Jones', 'bob@example.com', '555-5678'),
  (3, 'Charlie', 'Brown', 'charlie@example.com', '555-9012')
  (4, 'David', 'Lee', 'david@example.com', '555-2345'),
  (5, 'Emily', 'Chen', 'emily@example.com', '555-6789');


CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
  (1, 1, '2022-01-01', 100.00),
  (2, 1, '2022-02-01', 50.00),
  (3, 2, '2022-01-15', 75.00),
  (4, 3, '2022-02-15', 200.00),
  (5, 2, '2022-03-01', 25.00);
  
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;









































































































--+-------------+------------+-----------+
--| customer_id | first_name | last_name |
--+-------------+------------+-----------+
--| 4           | David      | Lee       |
--| 5           | Emily      | Chen      |
--+-------------+------------
