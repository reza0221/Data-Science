-- Data Definition Language (DDL) queries
-- Create Commands
CREATE DATABASE my_database; -- Create a database named my_database
CREATE DATABASE IF NOT EXISTS my_database; -- Create a database named my_database if it does not exist
CREATE TABLE users (id INT PRIMARY KEY, name VARCHAR(255)); -- Create a table named users with columns id and name
CREATE INDEX idx_name ON users(name); -- Create an index named idx_name on the name column of the users table
CREATE VIEW active_users AS SELECT * FROM users WHERE active = 1; -- Create a view named active_users that selects all data from the users table where active is 1
CREATE PROCEDURE getUsers() BEGIN SELECT * FROM users; END; -- Create a stored procedure named getUsers that selects all data from the users table

-- Alter Commands
ALTER TABLE users ADD COLUMN age INT; -- Add a new column named age to the users table
ALTER TABLE users MODIFY COLUMN name VARCHAR(100); -- Modify the name column of the users table to have a maximum length of 100 characters
ALTER TABLE users RENAME COLUMN name TO full_name; -- Rename the name column of the users table to full_name
ALTER TABLE users DROP COLUMN email; -- Drop the email column from the users table
ALTER TABLE users RENAME TO customers; -- Rename the users table to customers

-- Drop Commands
DROP DATABASE my_database; -- Drop the database named my_database
DROP TABLE users; -- Drop the users table
DROP INDEX idx_name ON users; -- Drop the index named idx_name on the users table
DROP VIEW active_users; -- Drop the view named active_users
DROP PROCEDURE IF EXISTS getUsers; -- Drop the stored procedure named getUsers if it exists

-- Truncate Command
TRUNCATE TABLE users; -- Truncate all data from the users table

-- Data Manipulation Language (DML) queries
-- Insert Commands
INSERT INTO users (id, name, email) VALUES (1, 'John Doe', 'john.doe@example.com'); -- Insert a row with id 1, name 'John Doe', and email '
INSERT INTO users (id, name, email) VALUES 
(2, 'Jane Smith', 'jane.smith@example.com'),
(3, 'Emily Davis', 'emily.davis@example.com'); -- Insert multiple rows into the users table
INSERT INTO users DEFAULT VALUES;  -- If defaults are defined
INSERT INTO users_archive (id, name, email)
SELECT id, name, email FROM users WHERE id > 5; -- Insert data from a select query into another table

-- Delete Commands
DELETE FROM users WHERE id = 1; -- Delete the user with id 1
DELETE FROM users; -- Delete all data from the users table
DELETE users FROM users 
JOIN inactive_users ON users.id = inactive_users.user_id; -- Delete data from the users table based on a join condition
DELETE FROM users ORDER BY id LIMIT 2; -- Delete the first 2 rows from the users table

-- Update Commands
UPDATE users SET name = 'John Smith' WHERE id = 1; -- Update the name of the user with id
UPDATE users SET name = 'Jane Doe', email = 'jane.doe@example.com' WHERE id = 2; -- Update the name and email of the user with id
UPDATE users SET active = 1; -- Activate all users
UPDATE users
JOIN promotions ON users.id = promotions.user_id
SET users.status = 'Promoted'; -- Update user status based on promotions
UPDATE users SET email = CONCAT(name, '@example.com') WHERE id IN (SELECT id FROM admins); -- Update email based on a subquery

-- Transaction Control Language (TCL) queries
-- Savepoint Commands
SAVEPOINT sp1; -- Create a savepoint named sp1
SAVEPOINT sp1;  
SAVEPOINT sp2;  
SAVEPOINT sp3; -- Create multiple savepoints
ROLLBACK TO sp2; -- Rollback to the savepoint named sp2
RELEASE SAVEPOINT sp1; -- Release the savepoint named sp1

-- Commit Commands
COMMIT; -- Commit the transaction
START TRANSACTION;  
INSERT INTO users VALUES (1, 'John Doe', 'john@example.com');  
UPDATE users SET name = 'Jane Doe' WHERE id = 1;  
COMMIT; -- Commit after Multiple DML Statements
START TRANSACTION;  
SAVEPOINT sp1;  
INSERT INTO users VALUES (2, 'Alice', 'alice@example.com');  
COMMIT;  -- Commits all changes up to this point

-- Rollback Commands
START TRANSACTION;  
DELETE FROM users WHERE id = 1;  
ROLLBACK;  -- Undo the delete
START TRANSACTION;  
SAVEPOINT sp1;  
INSERT INTO users VALUES (3, 'Bob', 'bob@example.com');  
ROLLBACK TO sp1;  -- Undo the insert, but keep previous changes
START TRANSACTION;  
UPDATE users SET name = 'Charlie' WHERE id = 2;  
DELETE FROM users WHERE id = 3;  
ROLLBACK;  -- Undo both changes

-- Data Control Language (DCL) queries
-- Grant Commands
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost'; -- Grant all privileges on a database to a user
GRANT SELECT, INSERT, UPDATE ON database_name.table_name TO 'username'@'localhost'; -- Grant specific privileges on a table to a user
GRANT SELECT ON database_name.* TO 'username'@'localhost' WITH GRANT OPTION; -- Grant select privileges on a database to a user with the ability to grant those privileges to others
GRANT SELECT (name, email) ON database_name.users TO 'username'@'localhost'; -- Grant select privileges on specific columns of a table to a user

-- Revoke Commands
REVOKE SELECT, INSERT ON database_name.table_name FROM 'username'@'localhost'; -- Revoke specific privileges on a table from a user
REVOKE ALL PRIVILEGES ON database_name.* FROM 'username'@'localhost'; -- Revoke all privileges on a database from a user
REVOKE GRANT OPTION ON database_name.* FROM 'username'@'localhost'; -- Revoke the ability to grant privileges from a user
REVOKE SELECT (email) ON database_name.users FROM 'username'@'localhost'; -- Revoke select privileges on specific columns of a table from a user

-- Data Query Language (DQL) queries
-- Select Commands
SELECT * FROM users; -- Select all data from the users table
SELECT name, email FROM users; -- Select specific columns from the users table

SELECT * FROM users WHERE id = 1; -- Select data from the users table where the id is 1
SELECT * FROM users WHERE name = 'John Doe' AND email LIKE '%example.com'; -- Select data from the users table where the name is 'John Doe' and the email contains 'example.com'
SELECT * FROM users WHERE id BETWEEN 1 AND 5;
SELECT * FROM users WHERE name IN ('John Doe', 'Jane Doe'); -- Select data from the users table where the name is 'John Doe' or 'Jane Doe'

SELECT * FROM users ORDER BY name ASC; -- Select all data from the users table and order by name in ascending order
SELECT * FROM users ORDER BY id DESC; -- Select all data from the users table and order by id in descending order

SELECT * FROM users LIMIT 5; -- Select the first 5 rows from the users table
SELECT * FROM users LIMIT 5 OFFSET 10; -- Select 5 rows from the users table starting from the 10th row

SELECT COUNT(*) FROM users;  
SELECT MAX(id) FROM users;  
SELECT MIN(id) FROM users;  
SELECT AVG(id) FROM users;  
SELECT SUM(id) FROM users; -- Aggregate Functions

SELECT email, COUNT(*) FROM users GROUP BY email; -- Group By Clause
SELECT email, COUNT(*) FROM users GROUP BY email HAVING COUNT(*) > 1; -- Having Clause

SELECT users.name, orders.order_date  
FROM users  
INNER JOIN orders ON users.id = orders.user_id; -- Inner Join

SELECT users.name, orders.order_date  
FROM users  
LEFT JOIN orders ON users.id = orders.user_id; -- Left Join

SELECT users.name, orders.order_date  
FROM users  
RIGHT JOIN orders ON users.id = orders.user_id; -- Right Join

SELECT users.name, orders.order_date  
FROM users  
FULL OUTER JOIN orders ON users.id = orders.user_id; -- Full Outer Join

SELECT name FROM users WHERE id IN (SELECT user_id FROM orders); -- Subquery
SELECT AVG(order_count)  
FROM (SELECT user_id, COUNT(*) AS order_count FROM orders GROUP BY user_id) AS sub; -- Derived Table

SELECT name FROM users  
UNION  
SELECT name FROM customers; -- Union

SELECT name FROM users  
INTERSECT  
SELECT name FROM customers; -- Intersect

SELECT name FROM users  
EXCEPT  
SELECT name FROM customers; -- Except

SELECT DISTINCT email FROM users; --

SELECT name,  
       CASE WHEN email LIKE '%example.com' THEN 'Company Email' ELSE 'Personal Email' END AS email_type  
FROM users; -- Case Statement

SELECT name, ROW_NUMBER() OVER (ORDER BY id) AS row_num FROM users; -- Window Functions

-- Aggregate Functions
-- Count Function
SELECT COUNT(*) FROM users; -- Count the number of rows in the users table
SELECT COUNT(email) FROM users; -- Count the number of non-null values in the email column of the users table
SELECT COUNT(*) FROM users WHERE email LIKE '%example.com'; -- Count the number of rows in the users table where the email contains 'example.com'
SELECT email, COUNT(*) FROM users GROUP BY email; -- Count the number of occurrences of each email in the users table
SELECT email, COUNT(*) FROM users GROUP BY email HAVING COUNT(*) > 1; -- Count the number of occurrences of each email in the users table and filter the results to only show emails with more than one occurrence

-- Sum Function
SELECT SUM(id) FROM users; -- Calculate the sum of the id column in the users table
SELECT SUM(id) FROM users WHERE id > 5; -- Calculate the sum of the id column in the users table where the id is greater than 5
SELECT email, SUM(id) FROM users GROUP BY email; -- Calculate the sum of the id column for each email in the users table
SELECT email, SUM(id) FROM users GROUP BY email HAVING SUM(id) > 10; -- Calculate the sum of the id column for each email in the users table and filter the results to only show emails with a sum greater than 10

-- Avg Function
SELECT AVG(id) FROM users; -- Calculate the average of the id column in the users table
SELECT AVG(id) FROM users WHERE id BETWEEN 2 AND 8; -- Calculate the average of the id column in the users table where the id is between 2 and 8
SELECT email, AVG(id) FROM users GROUP BY email; -- Calculate the average of the id column for each email in the users table
SELECT email, AVG(id) FROM users GROUP BY email HAVING AVG(id) > 5; -- Calculate the average of the id column for each email in the users table and filter the results to only show emails with an average greater than 5

-- Max Function
SELECT MAX(id) FROM users; -- Find the maximum value of the id column in the users table
SELECT MAX(id) FROM users WHERE email LIKE '%example.com'; -- Find the maximum value of the id column in the users table where the email contains 'example.com'
SELECT email, MAX(id) FROM users GROUP BY email; -- Find the maximum value of the id column for each email in the users table

-- Min Function
SELECT MIN(id) FROM users; -- Find the minimum value of the id column in the users table
SELECT MIN(id) FROM users WHERE id > 5; -- Find the minimum value of the id column in the users table where the id is greater than 5
SELECT email, MIN(id) FROM users GROUP BY email; -- Find the minimum value of the id column for each email in the users table

-- Group By Clause
SELECT email, COUNT(*) FROM users GROUP BY email; -- Group the data in the users table by the email column and count the number of occurrences of each email
SELECT name, email, COUNT(*) FROM users GROUP BY name, email; -- Group the data in the users table by the name and email columns and count the number of occurrences of each combination of name and email
SELECT email, AVG(id), MAX(id), MIN(id) FROM users GROUP BY email; -- Group the data in the users table by the email column and calculate the average, maximum, and minimum values of the id column for each email

-- Having Clause
SELECT email, COUNT(*) FROM users GROUP BY email HAVING COUNT(*) > 2; -- Group the data in the users table by the email column and count the number of occurrences of each email, then filter the results to only show emails with more than 2 occurrences
SELECT email, AVG(id), SUM(id), FROM users GROUP BY email HAVING SUM(id) > 10; -- Group the data in the users table by the email column and calculate the average and sum of the id column for each email, then filter the results to only show emails with a sum greater than 10

-- Order By Clause
SELECT email, COUNT(*) FROM users GROUP BY email ORDER BY COUNT(*) ASC; -- Group the data in the users table by the email column and count the number of occurrences of each email, then order the results by the count in ascending order
SELECT email, AVG(id) FROM users GROUP BY email ORDER BY AVG(id) DESC; -- Group the data in the users table by the email column and calculate the average of the id column for each email, then order the results by the average in descending order
SELECT email, SUM(id) FROM users GROUP BY email ORDER BY SUM(id) DESC, email ASC; -- Group the data in the users table by the email column and calculate the sum of the id column for each email, then order the results by the sum in descending order and the email in ascending order

-- Filterin Data
-- Where Clause
SELECT * FROM users WHERE id = 1; -- Select all data from the users table where the id is 1
SELECT * FROM users WHERE id > 1;
SELECT * FROM users WHERE name = 'John Doe'; -- Select all data from the users table where the name is 'John Doe'
SELECT * FROM users WHERE name =! 'John Doe'; -- Select all data from the users table where the name is not 'John Doe'

-- And Operator
SELECT * FROM users WHERE id > 3 AND name = 'Jane Smith'; -- Select all data from the users table where the id is greater than 3 and the name is 'Jane Smith'
SELECT * FROM users WHERE id BETWEEN 2 AND 5 AND email LIKE '%example.com'; -- Select all data from the users table where the id is between 2 and 5 and the email contains 'example.com'
SELECT * FROM users WHERE email IS NOT NULL AND name = 'John Doe'; -- Select all data from the users table where the email is not null and the name is 'John Doe'

-- Or Operator
SELECT * FROM users WHERE name = 'John Doe' OR name = 'Jane Smith'; -- Select all data from the users table where the name is 'John Doe' or 'Jane Smith'
SELECT * FROM users WHERE ID = 1 OR email LIKE '%example.com'; -- Select all data from the users table where the id is 1 or the email contains 'example.com'
SELECT * FROM users WHERE (id = 2 OR id = 3) AND email IS NOT NULL; -- Select all data from the users table where the id is 2 or 3 and the email is not null

-- Between Operator
SELECT * FROM users WHERE id BETWEEN 2 AND 8; -- Select all data from the users table where the id is between 2 and 8
SELECT * FROM users WHERE created_at BETWEEN '2024-01-21' AND '2024-12-31'; -- Select all data from the users table where the created_at date is between '2024-01-21' and '2024-12-31'
SELECT * FROM users WHERE id BETWEEN 2 AND 5 AND email LIKE '%example.com'; -- Select all data from the users table where the id is between 2 and 5 and the email contains 'example.com'

-- Like Operator
SELECT * FROM users WHERE LIKE '%example.com'; -- Select all data from the users table where the email contains 'example.com'
SELECT * FROM users WHERE name LIKE '%Smith'; -- Select all data from the users table where the name ends with 'Smith'
SELECT * FROM users WHERE name LIKE 'J%'; -- Select all data from the users table where the name starts with 'J'
SELECT * FROM users WHERE name LIKE '%oh%'; -- Select all data from the users table where the name contains 'oh'

-- In Operator
SELECT * FROM users WHERE id IN (1, 3, 5); -- Select all data from the users table where the id is 1, 3, or 5
SELECT * FROM users WHERE name IN ('John Doe', 'Jane Smith'); -- Select all data from the users table where the name is 'John Doe' or 'Jane Smith'
SELECT * FROM users WHERE id IN (2, 4) AND email LIKE '%example.com'; -- Select all data from the users table where the id is 2 or 4 and the email contains 'example.com'

-- Is Null Operator
SELECT * FROM users WHERE email IS NULL; -- Select all data from the users table where the email is null
SELECT * FROM users WHERE email IS NULL AND name = 'John Doe'; -- Select all data from the users table where the email is null and the name is 'John Doe'

-- Is Not Null Operator
SELECT * FROM users WHERE email IS NOT NULL; -- Select all data from the users table where the email is not null
SELECT * FROM users WHERE email IS NOT NULL AND id > 2; -- Select all data from the users table where the email is not null and the id is greater than 2

-- Combining Data
-- Inner Join
SELECT users.id, users.name, orders.amount
FROM users
INNER JOIN orders ON users.id = orders.user_id; -- Select the id, name, and order amount of users who have placed orders

SELECT users.name, orders.amount
FROM users
INNER JOIN orders ON users.id = orders.user_id
WHERE orders.amount > 100; -- Select the name and order amount of users who have placed orders with an amount greater than 100

SELECT users.name, COUNT(orders.id) AS total_orders
FROM users
INNER JOIN orders ON users.id = orders.user_id
GROUP BY users.name; -- Select the name of users and the total number of orders they have placed

-- Left Join
SELECT users.name, orders.amount
FROM users
LEFT JOIN orders ON users.id = orders.user_id; -- Select the name and order amount of all users, including those who have not placed orders

SELECT users.name
FROM users
LEFT JOIN orders ON users.id = orders.user_id
WHERE orders.id IS NULL; -- Select the name of users who have not placed any orders

SELECT users.name, COUNT(orders.id) AS order_count
FROM users
LEFT JOIN orders ON users.id = orders.user_id
GROUP BY users.name; -- Select the name of users and the total number of orders they have placed, including users who have not placed any orders

-- Right Join
SELECT orders.id, users.name
FROM users
RIGHT JOIN users ON users.id = orders.user_id;

SELECT orders.id
FROM orders
RIGHT JOIN users ON users.id = orders.user_id
WHERE users.id IS NULL; -- Select the id of orders that do not have a corresponding user

SELECT orders.user_id, COUNT(orders.id) AS order_caount
FROM orders
RIGHT JOIN users ON users.id = orders.user_id
GROUP BY orders.user_id; -- Select the user_id of orders and the total number of orders placed by each user, including users who have not placed any orders

-- Full Join
SELECT users.id, users.name, orders.amount
FROM users
LEFT JOIN orders ON users.id = orders.user_id
UNION
SELECT users.id, users.name, orders.amount
FROM users
RIGHT JOIN orders ON users.id = orders.user_id; -- Select the id, name, and order amount of all users and orders, including those who have not placed any orders

SELECT users.name, orders.amount
FROM users
LEFT JOIN orders ON users.id = orders.user_id
WHERE orders.id IS NULL
UNION
SELECT users.name, orders.amount
FROM orders
RIGHT JOIN users ON users.id = orders.user_id
WHERE users.id IS NULL; -- Select the name and order amount of users who have not placed any orders and orders that do not have a corresponding user

-- Union
SELECT name FROM users
UNION
SELECT name FROM customers; -- Select the names of users and customers, removing duplicates

SELECT name FROM users WHERE id < 5
UNION
SELECT name FROM customers WHERE id < 5; -- Select the names of users and customers with an id less than 5, removing duplicates

SELECT name FROM users
UNION
SELECT name FROM customers; -- Select the names of users and customers, removing duplicates

SELECT name FROM users
UNION ALL
SELECT name FROM archived_users; -- Select the names of users and archived users, including duplicates

-- Views
CREATE VIEW user_emails AS
SELECT id, name, email
FROM users; -- Create a view named user_emails that selects the id, name, and email columns from the users table

SELECT * FROM user_emails -- Select all data from the user_emails view

UPDATE user_emails
SET email = 'newemail@example.com'
WHERE id = 1; -- Update the email of the user with id 1 in the user_emails view

DROP VIEW IF EXISTS user_emails; -- Drop the user_emails view if it exists

CREATE VIEW user_order_summary AS
SELECT u.id, u.name, COUNT(o.id) AS total_orders
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name; -- Create a view named user_order_summary that selects the id, name, and total number of orders for each user

-- Indexes
CREATE INDEX idx_users_name ON users(name); -- Create an index named idx_users_name on the name column of the users table
CREATE UNIQUE INDEX idx_users_email ON users(email); -- Create a unique index named idx_users_email on the email column of the users table
DROP INDEX idx_users_name ON users; -- Drop the index named idx_users_name on the name column of the users table
EXPLAIN SELECT * FROM users WHERE name = 'John Doe' -- Explain the query plan for selecting all data from the users table where the name is 'John Doe'

-- Date & Time Function
SELECT NOW(), CURDATE(), CURTIME(); -- Get the current date and time, current date, and current time

SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY) AS next_week,
    DATE_SUB(CURDATE(), INTERVAL 7 DAY) AS last_week; -- Add 7 days to the current date and subtract 7 days from the current date

SELECT YEAR(NOW()) AS year, MONTH(NOW()) AS month, DAY(NOW()) AS day; -- Get the year, month, and day of the current date

SELECT DATA_FORMAT(NOW(), '%W, %M &d, %Y') AS formatted_date; -- Format the current date as 'Weekday, Month Day, Year'

SELECT DATEDIFF('2025-03-01', CURDATE() AS days_until_march); -- Calculate the number of days until March 1, 2025

SELECT TIME(NOW()) AS current_time, TIMEDIFF('12:00:00', '10:30:00') AS time_difference; -- Get the current time and calculate the time difference between 12:00:00 and 10:30:00

SELECT STR_TO_DATE('23-02-2025', '%d-%m-%Y') AS converted_date,
    DATA_FORMAT(NOW(), '%Y-%m-%d') AS date_to_string; -- Convert a string to a date and a date to a string

SELECT LAST_DAY(NOW()) AS last_day_of_month; -- Get the last day of the current month