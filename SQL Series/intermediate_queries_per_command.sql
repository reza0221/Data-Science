-- Subqueries
SELECT name FROM users WHERE id IN (SELECT user_id FROM orders WHERE amount > 100); -- Subquery in WHERE clause
SELECT name FROM users WHERE id = (SELECT user_id FROM orders ORDER BY amount DESC limit 1): -- Subquery in WHERE clause
SELECT AVG(order_count) FROM (SELECT user_id, COUNT(*) AS order_count FROM orders GROUP BY user_id) AS subquery; -- Subquery in FROM clause
SELECT name, (SELECT COUNT(*) FROM orders WHERE orders.user_id = users.id) AS order_count FROM users; -- Subquery in SELECT clause
SELECT name FROM users u WHERE EXISTS (SELECT 1 FROM orders o WHERE o.user_id = u.id AND o.amount > 200): -- Subquery in WHERE clause
SELECT name FROM users WHERE id IN (SELECT user_id FROM orders WHERE amount > (SELECT AVG(amount) FROM orders)): -- Subquery in WHERE clause
SELECT name FROM users WHERE id = (SELECT user_id FROM orders GROUP BY user_id ORDER BY COUNT(*) DESC LIMIT 1): -- Subquery in WHERE clause

-- Common Table Expressions (CTE)
WITH user_orders AS (SELECT user_id, COUNT(*) AS total_orders FROM orders GROUP BY user_id)
SELECT u.name, uo.total_orders FROM users u JOIN user_orders uo ON u.id = uo.user_id; -- CTE in FROM clause

WITH high_spenders AS (SELECT user_id FROM orders GROUP BY user_id HAVING SUM(amount) > 500)
SELECT name FROM users WHERE id IN (SELECT user_id FROM high_spenders); -- CTE in WHERE clause

WITH RECURSIVE category_path (id, name, parent_id) AS (
    SELECT id, name, parent_id FROM categories WHERE parent_id IS NULL
    UNION ALL
    SELECT c.id, c.name, c.parent_id FROM categories c
    INNER JOIN category_path cp ON c.parent_id = cp.id
)
SELECT * FROM category_path; -- Recursive CTE

WITH avg_amount AS (SELECT AVG(amount) AS avg_amt FROM orders)
SELECT * FROM orders WHERE amount > (SELECT avg_amt FROM avg_amount); -- CTE in WHERE clause

-- Window Functions
SELECT user_id, amount, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY amount DESC) AS row_num FROM orders; -- ROW_NUMBER window function
SELECT user_id, amount, RANK() OVER (ORDER BY amount DESC) AS rank_pos FROM orders; -- RANK window function
SELECT user_id, amount, DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank_pos FROM orders; -- DENSE_RANK window function
SELECT user_id, amount, SUM(amount) OVER (PARTITON BY user_id) AS total_user_amount FROM orders; -- SUM window function
SELECT user_id, amount, AVG(amount) OVER (ORDER BY amount) AS running_avg FROM orders; -- AVG window function
SELECT user_id, amount, LAG(amount, 1) OVER (PARTITION BY user_id ORDER BY order_date) AS previous_amount FROM orders; -- LAG window function
SELECT user_id, amount, LEAD(amount, 1) OVER (PARTITON BY user_id ORDER BY order_date) AS next_amount FROM orders; -- LEAD window function

-- Stored Procedures
DELIMITER //
CREATE PROCEDURE getUserOrders(IN userId INT)
BEGIN
    SELECT * FROM orders WHERE user_id = userId;
END //
DELIMITER ; -- Stored procedure with input parameter

DELIMITER //
CREATE PROCEDURE getTotalOrders(IN userId INT, OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM orders WHERE user_id = userId;
END //
DELIMITER ; -- Stored procedure with output parameter

DELIMITER //
CREATE PROCEDURE checkHighSpender(IN userId INT)
BEGIN 
    IF (SELECT SUM(amount) FROM orders WHERE user_id = userId) > 500 THEN
        SELECT 'High Spender';
    ELSE
        SELECT 'Regular Spender';
    END IF;
END //
DELIMITER ; -- Stored procedure with conditional logic

DELIMITER //
CREATE PROCEDURE loopExample()
BEGIN
    DECLARE counter INT DEFAULT 1;
    WHILE counter <= DO
        SELECT CONCAT('Iteration ', Counter);
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ; -- Stored procedure with loop

-- Triggers
CREATE TRIGGER before_user_insert
BEFORE TRIGGER ON users
FOR EACH ROW SET New.created_at = NOW(); -- Before insert trigger

CREATE TRIGGER after_order_update
AFTER UPDATE ON orders
FOR EACH ROW INSERT INTO order_audit (order_id, old_amount, new_amount, updated_at) VALUES (OLD.id, OLD. amount, NEW.amount, NOW()); -- After update trigger

CREATE TRIGGER before_user_delete
BEFORE DELETE ON users
FOR EACH ROW INSERT INTO deleted_users (id, name, deleted_at) VALUES (OLD.id, OLD.name, NOW()); -- Before delete trigger

-- User Management & Security
CREATE USER 'report_user'@'localhost' IDENTIFIED BY 'password123'; -- Create user
GRANT SELECT ON sql_documentation.* TO 'report_user'@'localhost'; -- Grant privileges
REVOKE SELECT ON sql_documentation.* FROM 'report_user'@'localhost'; -- Revoke privileges
DROP USER 'report_user'@'localhost'; -- Drop user

-- Set Operations
SELECT name FROM users WHERE id < 5 UNION SELECT name FROM users WHERE id > 10; -- UNION set operation
SELECT name FROM users WHERE id < 5 UNION ALL SELECT name FROM users WHERE id < 5; -- UNION ALL set operation
SELECT name FROM users WHERE id IN (SELECT user_id FROM orders) AND id IN (SELECT user_id FROM feedback); -- INTERSECT set operation
SELECT name FROM users WHERE id NOT IN (SELECT user_id FROM orders); -- EXCEPT set operation


-- Views
CREATE VIEW user_emails AS
SELECT id, name, email
FROM users; -- Create view

CREATE VIEW active_users AS
SELECT id, name FROM users WHERE status = 'active'; -- Create Nested View

CREATE VIEW active_user_emails AS
SELECT au.id, au.name, u.email
FROM active_users au
JOIN users u ON au.id = u.id; -- Create view with JOIN

CREATE VIEW user_order_counts AS
SELECT u.id, u.name, (
    SELECT COUNT(*) FROM orders o WHERE o.user_id = u.ud
) AS order_count
FROM users u; -- Create view with subquery

CREATE VIEW total_spent_per_user AS
SELECT u.id, u.name, SUM(o.amount) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name; -- Create view with aggregation

CREATE VIEW user_names AS
SELECT id, name FROM users;
UPDATE user_names SET name = 'Updated Name' WHERE id = 1; -- Update view

-- Indexes
CREATE INDEX idx_user_email ON users(email); -- Create index

CREATE INDEX idx_user_name_email ON users(name, email); -- Create composite index

CREATE UNIQUE INDEX idx_unique_email ON users(email); -- Create unique index

DROP INDEX idx_user_email ON users; -- Drop index

EXPLAIN SELECT * FROM users WHERE email = 'test@example.com'; -- Explain query

CREATE INDEX idx_user_email ON users(email);
EXPLAIN SELECT * FROM users WHERE email = 'test@example.com'; -- Explain query with index

-- Data & Time Functions
SELECT name, birth_date, FLOOR(DATEDIFF(UCRDATE(), birth_date)/365) AS age
FROM orders; -- Calculate age from birth date

SELECT name, DATE_ADD(order_date, INTERVAL 7 DAY) AS delivery_date
FROM orders; -- Add days to date

SELECT name, DATE_SUB(order_date, INTERVAL 3 DAY) AS preparation_date
FROM orders; -- Subtract days from date

SELECT name, DATE_FORMAT(order_date, '%W, %M %d, %Y') AS formatted_date
FROM orders; -- Format date

SELECT name, YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, DAY(order_date) AS order_day
FROM orders; -- Extract year, month, day

SELECT name, order_date, CONVERT_TZ(order_date, '+00:00', '+05:30') AS local_order_date
FROM orders; -- Convert timezone