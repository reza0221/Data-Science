-- Advanced Window Functions
SELECT
    customer_id,
    order_date,
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_sales
FROM orders; -- Cumulative sales for each customer

SELECT
    customer_id,
    order_date,
    AVG(amount) OVER (PARTITION BY customer_id ORDER BY order_date ROWS BETWEEN 2 PRECEEDING AND CURRENT ROW) AS moving_average
FROM orders; -- Moving average for each customer

SELECT
    customer_id,
    SUM(amount) AS total_sales,
    RANK() OVER (ORDER BY SUM(amount) DESC) AS sales_rank
FROM orders
GROUP BY customer_id; -- Sales rank for each customer

SELECT 
    product_id,
    order_date,
    SUM(amount) OVER (ORDER BY order_date RANGE BETWEEN INTERVAL '7' DAY PRECEEDING AND CURRENT ROW) as weekly_sales
FROM orders; -- Weekly sales for each product

SELECT
    customer_id,
    order_date,
    amount,
    RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS order_rank
FROM orders; -- Order rank for each customer

-- Anvanced Common Table Expressions
WITH RECURSIVE employee_cte AS (
    SELECT employee_id, name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.name, e.manager_id, ec.level + 1
    FROM employees e
    JOIN employee_cte ec ON e.manager_id = ec.employee_id
)
SELECT * FROM employee_cte ORDER BY level; -- Employee hierarchy

WITH RECURSIVE fibonacci(n, fib_value) AS (
    SELECT 1, 0
    UNION ALL
    SELECT 2, 1
    UNION ALL
    SELECT n + 1, fib_value + LAG(fib_value, 1) OVER (ORDER BY n)
    FROM fibonacci
    WHERE n < 10
)
SELECT * FROM fibonacci; -- Fibonacci sequence

WITH RECURSIVE category_path AS (
    SELECT category_id, name, parent_id, name AS path
    FROM categories
    WHERE parent_id IS NULL
    
    UNION ALL

    SELECT c.category_id, c.name, c.parent_id, cp.path || ' > ' || c.name
    FROM categories c
    JOIN category_path cp ON c.parent_id = cp.category_id
)
SELECT * FROM category_path; -- Category path

WITH RECURSIVE org_chart AS (
    SELECT employee_id, name, manager_id, 0 AS depth
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e,employee_id, e.name, e.manager_id, oc.depth + 1
    FROM employess e
    JOIN org_chart oc ON e,manager_id = oc.employee_id
)
SELECT * FROM org_chart ORDER BY depth, employee_id; -- Organization chart

-- Complex Subqueries
SELECT
    customer_id,
    order_date,
    amount
FROM orders o
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
    WHERE customer_id = o.customer_id
): -- Orders with amount greater than average amount for the customer

SELECT
    dt.customer_id,
    dt.total_amount
FROM (
    SELECT customer_id, SUM(amount) AS total_amount
    FROM orders
    GROUP BY customer_id
) dt
WHERE dt.total_amount > 500; -- Customers with total amount greater than 500

SELECT 
    product_id,
    product_name,
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM order_details
    WHERE quantity = (
        SELECT MAX(quantity)
        FROM order_details
    )
): -- Products with maximum quantity in order details

SELECT 
    customer_id,
    order_date,
    amount
FROM orders
WHERE amount = (
    SELECT MAX(amount)
    FROM orders
): -- Orders with maximum amount

-- Stored Procedures & Functions
DELIMITER //
CREATE PROCEDURE insert_user(
    IN p_name VARCHAR(100)
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO users(name, email) VALUES (p_name, p_email);
END //
DELIMITER ; -- Insert user stored procedure
CALL insert_user('Alice Smith', 'alice.smith@example.com'); -- Call stored procedure

DELIMITER //
CREATE FUNCTION calculate_discount(amount DECIMAL(10, 2))
RETURN DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN amount * 0.90;
END //
DELIMITER ;
SELECT calculate_discount(100.00); -- Calculate discount function

DELIMITER //
CREATE PROCEDURE check_stock(IN p_product_id INT)
BEGIN
    DECLARE stock INT;

    SELECT quantity INTO stock
    FROM inventory
    WHERE product_id = p_product_id;

    IF stock > 10 THEN
        SELECT 'In Stock';
    ELSE
        SELECT 'Low Stock';
    END IF;
END //
DELIMITER ;
CALL check_stock(101); -- Check stock stored procedure

DELIMITER //
CREATE PROCEDURE count_down(IN start_value INT)
BEGIN 
    DECLARE counter INT;
    SET counter = start_value;

    WHILE counter > 0 DO
        SELECT counter;
        SET counter = counter - 1;
    END WHILE;
END //
DELIMITER ;
CALL count_down(5); -- Count down stored procedure

DELIMITER //
CREATE PROCEDURE divide_numbers(IN numerator INT, IN denominator INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error: Divsion by zero or invalid input!';
    END;

    SELECT numerator / denominator AS result;
END //
DELIMITER ;
CALL divide_numbers(10, 2); -- Divide numbers stored procedure


-- Triggers
DELIMITER $$
CREATE TRIGGER before_insert_users
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM users WHERE email = NEW.email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email already exists!';
    END IF;
END $$
DELIMITER ; -- Before insert trigger

DELIMITER $$
CREATE TRIGGER after_insert_users
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_logs(user_id, action, created_at)
    VALUES (NEW.id, 'User Created', NOW());
END $$
DELIMITER ; -- After insert trigger

DELIMITER $$
CREATE TRIGGER before_update_users
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.email = OLD.email THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No changes detected in email.';
    END IF;
END $$
DELIMITER ; -- Before update trigger

-- Transactions & Isolation Levels
START TRANSACTION;
INSERT INTO users (id, name, email) VALUES (11, 'Alice Smith', 'alice.smith@example.com');
UPDATE accounts SET balance = balance - 100 WHERE user_id = 11; -- Deduct 100 from user's account
IF (SELECT balance FROM accounts WHERE user_id = 11) >= 0 THEN
    COMMIT;
ELSE
    ROLLBACK;
END IF; -- Commit or rollback transaction based on account balance

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT * FROM orders WHERE user_id = 11; -- Read committed data

START TRANSACTION;
UPDATE accounts SET balance = balance - 50 WHERE user_id = 1; -- Deduct 50 from user's account
START TRANSACTION;
UPDATE accounts SET balance = balance + 50 WHERE user_id = 2; -- Add 50 to user's account

-- JSON Functions
INSERT INTO products(id, name, details) VALUES (1, 'Laptop', '{"brand": "Dell", "spec": {"ram": "16GB", "cpu": "i7"}}'); -- Insert product with JSON details

SELECT JSON_EXTRACT(details, '$.specs.ram') AS ram_spec FROM products WHERE id = 1; -- Extract RAM spec from JSON details

UPDATE products
SET details = JSON_SET(details, '$.specs.ram', '32GB')
WHERE id = 1; -- Update RAM spec in JSON details

SELECT * FROM products
WHERE JSON_UNQUOTE(JSON_EXTRACT(details, '$.brand')) = 'Dell'; -- Filter products by brand in JSON details

-- Advanced User Management
SELECT user, host, Select_priv, Insert_priv, Update_priv
FROM mysql.user
WHERE user = 'app_user'; -- Check privileges for app_user

CREATE USER 'limited_user'@'localhost' IDENTIFIED BY 'password'; -- Create limited user
GRANT SELECT ON database_name.* TO 'limited_user'@'localhost'; -- Create limited user with select privilege
ALTER USER 'limited_user'@'localhost'
WITH MAX_QUERIES_PER_HOUR 100
    MAX_CONNECTIONS_PER_HOUR 10
    MAX_UPDATES_PER_HOUR 5; -- Create limited user with restrictions