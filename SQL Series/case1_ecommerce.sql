CREATE DATABASE ecommerce; -- Create a new database called ecommerce
USE ecommerce; -- Use the ecommerce database
SHOW TABLES; -- Show the tables in the ecommerce database

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); -- Create a customers table

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT
); -- Create a products table

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
); -- Create an orders table

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
); -- Create an order_details table

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
); -- Create a payments table

INSERT INTO customers (customer_id, name, email) VALUES (1, 'Alice Smith', 'alice@example.com'); -- Insert a customer record
INSERT INTO products (product_id, name, price, stock) VALUES (1, 'Laptop', 1000.00, 20); -- Insert a product record
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES (1, 1, '2025-02-23', 1000.00); -- Insert an order record
INSERT INTO order_details (order_detail_id, order_id, product_id, quantity) VALUES (1, 1, 1, 1); -- Insert an order detail record
INSERT INTO payments (payment_id, order_id, payment_date, amount, payment_method) VALUES (1, 1, '2025-02-23', 1000.00, 'Credit Card'); -- Insert a payment record

INSERT INTO customers (customer_id, name, email) VALUES
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com'),
(4, 'Diana Prince', 'diana@example.com'),
(5, 'Evan Rogers', 'evan@example.com'),
(6, 'Fiona Green', 'fiona@example.com'),
(7, 'Gina White', 'gina@example.com'),
(8, 'Henry Black', 'henry@example.com'),
(9, 'Ivy Brown', 'ivy@example.com'),
(10, 'Jack Miller', 'jack@example.com'); -- Insert multiple customer records

INSERT INTO customers (customer_id, name, email) VALUES
(11, 'Kate Wilson', 'kate@example.com'),
(12, 'Liam Davis', 'liam@example.com'),
(13, 'Mia Taylor', 'mia@example.com'),
(14, 'Noah Anderson', 'noah@example.com'),
(15, 'Olivia Martinez', 'olivia@example.com'),
(16, 'Peter Martinez', 'peter@example.com'),
(17, 'Quinn Green', 'quinn@example.com'),
(18, 'Rachel Brown', 'rachel@example.com'),
(19, 'Sam White', 'sam@example.com'),
(20, 'Tina Black', 'tina@example.com'); -- Insert more customer records

INSERT INTO products (product_id, name, price, stock) VALUES
(2, 'Smartphone', 500.00, 30),
(3, 'Tablet', 300.00, 40),
(4, 'Headphones', 50.00, 50),
(5, 'Mouse', 20.00, 100),
(6, 'Keyboard', 30.00, 80),
(7, 'Monitor', 200.00, 20),
(8, 'Printer', 150.00, 10),
(9, 'Scanner', 100.00, 15),
(10, 'External Hard Drive', 80.00, 25); -- Insert multiple product records

INSERT INTO products (product_id, name, price, stock) VALUES
(11, 'Webcam', 40.00, 30),
(12, 'Microphone', 30.00, 40),
(13, 'Speakers', 50.00, 50),
(14, 'USB Flash Drive', 10.00, 100),
(15, 'Ethernet Cable', 5.00, 80),
(16, 'HDMI Cable', 10.00, 20),
(17, 'VGA Cable', 8.00, 10),
(18, 'Power Strip', 15.00, 15),
(19, 'Wireless Router', 50.00, 25),
(20, 'Network Switch', 60.00, 20); -- Insert more product records

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(2, 2, '2025-02-24', 500.00),
(3, 3, '2025-02-25', 300.00),
(4, 4, '2025-02-26', 50.00),
(5, 5, '2025-02-27', 20.00),
(6, 6, '2025-02-28', 30.00),
(7, 7, '2025-03-01', 200.00),
(8, 8, '2025-03-02', 150.00),
(9, 9, '2025-03-03', 100.00),
(10, 10, '2025-03-04', 80.00); -- Insert multiple order records

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(11, 11, '2025-03-05', 40.00),
(12, 12, '2025-03-06', 30.00),
(13, 13, '2025-03-07', 50.00),
(14, 14, '2025-03-08', 10.00),
(15, 15, '2025-03-09', 5.00),
(16, 16, '2025-03-10', 10.00),
(17, 17, '2025-03-11', 8.00),
(18, 18, '2025-03-12', 15.00),
(19, 19, '2025-03-13', 50.00),
(20, 20, '2025-03-14', 60.00); -- Insert more order records

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity) VALUES
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1); -- Insert multiple order detail records

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity) VALUES
(11, 11, 11, 1),
(12, 12, 12, 1),
(13, 13, 13, 1),
(14, 14, 14, 1),
(15, 15, 15, 1),
(16, 16, 16, 1),
(17, 17, 17, 1),
(18, 18, 18, 1),
(19, 19, 19, 1),
(20, 20, 20, 1); -- Insert more order detail records

INSERT INTO payments (payment_id, order_id, payment_date, amount, payment_method) VALUES
(2, 2, '2025-02-24', 500.00, 'Credit Card'),
(3, 3, '2025-02-25', 300.00, 'PayPal'),
(4, 4, '2025-02-26', 50.00, 'Cash'),
(5, 5, '2025-02-27', 20.00, 'Credit Card'),
(6, 6, '2025-02-28', 30.00, 'PayPal'),
(7, 7, '2025-03-01', 200.00, 'Cash'),
(8, 8, '2025-03-02', 150.00, 'Credit Card'),
(9, 9, '2025-03-03', 100.00, 'PayPal'),
(10, 10, '2025-03-04', 80.00, 'Cash'); -- Insert multiple payment records

INSERT INTO payments (payment_id, order_id, payment_date, amount, payment_method) VALUES
(11, 11, '2025-03-05', 40.00, 'Credit Card'),
(12, 12, '2025-03-06', 30.00, 'PayPal'),
(13, 13, '2025-03-07', 50.00, 'Cash'),
(14, 14, '2025-03-08', 10.00, 'Credit Card'),
(15, 15, '2025-03-09', 5.00, 'PayPal'),
(16, 16, '2025-03-10', 10.00, 'Cash'),
(17, 17, '2025-03-11', 8.00, 'Credit Card'),
(18, 18, '2025-03-12', 15.00, 'PayPal'),
(19, 19, '2025-03-13', 50.00, 'Cash'),
(20, 20, '2025-03-14', 60.00, 'Credit Card'); -- Insert more payment records

-- Add columns to the customers table
ALTER TABLE customers 
ADD COLUMN phone VARCHAR(15),
ADD COLUMN address TEXT,
ADD COLUMN loyalty_points INT DEFAULT 0; -- Add columns to the customers table

-- Update customer table for 20 records with phone & address with random values
INSERT INTO customers (phone, address) VALUES
('123-456-7890', '123 Main St, Anytown, USA'),
('234-567-8901', '456 Elm St, Othertown, USA'),
('345-678-9012', '789 Oak St, Anycity, USA'),
('456-789-0123', '012 Pine St, Othercity, USA'),
('567-890-1234', '123 Maple St, Anyvillage, USA'),
('678-901-2345', '234 Birch St, Othervillage, USA'),
('789-012-3456', '345 Cedar St, Anystate, USA'),
('890-123-4567', '456 Walnut St, Otherstate, USA'),
('901-234-5678', '567 Spruce St, Anycountry, USA'),
('012-345-6789', '678 Pineapple St, Othercountry, USA'),
('123-456-7890', '123 Banana St, Anyplanet, USA'),
('234-567-8901', '456 Orange St, Otherplanet, USA'),
('345-678-9012', '789 Apple St, Anystar, USA'),
('456-789-0123', '012 Cherry St, Otherstar, USA'),
('567-890-1234', '123 Grape St, Anysolar, USA'),
('678-901-2345', '234 Lemon St, Othersolar, USA'),
('789-012-3456', '345 Lime St, Anygalaxy, USA'),
('890-123-4567', '456 Strawberry St, Othergalaxy, USA'),
('901-234-5678', '567 Blueberry St, Anyuniverse, USA'),
('012-345-6789', '678 Raspberry St, Otheruniverse, USA'); -- Insert phone & address values
-- Error Code: 1833. Cannot change column 'customer_id': used in a foreign key constraint 'orders_ibfk_1' of table 'ecommerce.orders'

ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1; -- Drop the foreign key constraint

ALTER TABLE customers MODIFY customer_id INT AUTO_INCREMENT; -- Modify the customer_id column to be auto-increment

INSERT INTO customers (phone, address) VALUES
('123-456-7890', '123 Main St, Anytown, USA'),
('234-567-8901', '456 Elm St, Othertown, USA'),
('345-678-9012', '789 Oak St, Anycity, USA'),
('456-789-0123', '012 Pine St, Othercity, USA'),
('567-890-1234', '123 Maple St, Anyvillage, USA'),
('678-901-2345', '234 Birch St, Othervillage, USA'),
('789-012-3456', '345 Cedar St, Anystate, USA'),
('890-123-4567', '456 Walnut St, Otherstate, USA'),
('901-234-5678', '567 Spruce St, Anycountry, USA'),
('012-345-6789', '678 Pineapple St, Othercountry, USA'),
('123-456-7890', '123 Banana St, Anyplanet, USA'),
('234-567-8901', '456 Orange St, Otherplanet, USA'),
('345-678-9012', '789 Apple St, Anystar, USA'),
('456-789-0123', '012 Cherry St, Otherstar, USA'),
('567-890-1234', '123 Grape St, Anysolar, USA'),
('678-901-2345', '234 Lemon St, Othersolar, USA'),
('789-012-3456', '345 Lime St, Anygalaxy, USA'),
('890-123-4567', '456 Strawberry St, Othergalaxy, USA'),
('901-234-5678', '567 Blueberry St, Anyuniverse, USA'),
('012-345-6789', '678 Raspberry St, Otheruniverse, USA'): -- Reinsert phone & address values

UPDATE customers SET phone = '123-456-7890', address = '123 Main St, Anytown, USA' WHERE customer_id = 1;
UPDATE customers SET phone = '234-567-8901', address = '456 Elm St, Othertown, USA' WHERE customer_id = 2;
UPDATE customers SET phone = '345-678-9012', address = '789 Oak St, Anycity, USA' WHERE customer_id = 3;
UPDATE customers SET phone = '456-789-0123', address = '012 Pine St, Othercity, USA' WHERE customer_id = 4;
UPDATE customers SET phone = '567-890-1234', address = '123 Maple St, Anyvillage, USA' WHERE customer_id = 5;
UPDATE customers SET phone = '678-901-2345', address = '234 Birch St, Othervillage, USA' WHERE customer_id = 6;
UPDATE customers SET phone = '789-012-3456', address = '345 Cedar St, Anystate, USA' WHERE customer_id = 7;
UPDATE customers SET phone = '890-123-4567', address = '456 Walnut St, Otherstate, USA' WHERE customer_id = 8;
UPDATE customers SET phone = '901-234-5678', address = '567 Spruce St, Anycountry, USA' WHERE customer_id = 9;
UPDATE customers SET phone = '012-345-6789', address = '678 Pineapple St, Othercountry, USA' WHERE customer_id = 10;
UPDATE customers SET phone = '123-456-7890', address = '123 Banana St, Anyplanet, USA' WHERE customer_id = 11;
UPDATE customers SET phone = '234-567-8901', address = '456 Orange St, Otherplanet, USA' WHERE customer_id = 12;
UPDATE customers SET phone = '345-678-9012', address = '789 Apple St, Anystar, USA' WHERE customer_id = 13;
UPDATE customers SET phone = '456-789-0123', address = '012 Cherry St, Otherstar, USA' WHERE customer_id = 14;
UPDATE customers SET phone = '567-890-1234', address = '123 Grape St, Anysolar, USA' WHERE customer_id = 15;
UPDATE customers SET phone = '678-901-2345', address = '234 Lemon St, Othersolar, USA' WHERE customer_id = 16;
UPDATE customers SET phone = '789-012-3456', address = '345 Lime St, Anygalaxy, USA' WHERE customer_id = 17;
UPDATE customers SET phone = '890-123-4567', address = '456 Strawberry St, Othergalaxy, USA' WHERE customer_id = 18;
UPDATE customers SET phone = '901-234-5678', address = '567 Blueberry St, Anyuniverse, USA' WHERE customer_id = 19;
UPDATE customers SET phone = '012-345-6789', address = '678 Raspberry St, Otheruniverse, USA' WHERE customer_id = 20; -- Update phone & address values

SELECT * FROM customers WHERE customer_id BETWEEN 21 AND 40; -- Select customer records
DELETE FROM customers
WHERE customer_id BETWEEN 21 AND 40; -- Delete customer records

ALTER TABLE orders ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (customer_id) REFERENCES customers(customer_id); -- Recreate the foreign key constraint

-- Add date_of_birth, gender, account_status, and updated_at columns to the customers table
ALTER TABLE customers
ADD COLUMN date_of_birth DATE AFTER address,
ADD COLUMN gender ENUM('Male', 'Female', 'Other') AFTER date_of_birth,
ADD COLUMN account_status ENUM('Active', 'Inactive', 'Suspended') DEFAULT 'Active' AFTER loyalty_points,
ADD COLUMN updated_at TIMESTAMP NULL AFTER created_at; -- Add columns to the customers table

ALTER TABLE customers
MODIFY updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP; -- Modify the updated_at column

UPDATE customers
SET date_of_birth = '1990-01-01', gender = 'Female', account_status = 'Active', updated_at = NOW()
WHERE customer_id = 1; -- Update customer record

-- Update the remaining customer records with random date_of_birth
UPDATE customers
SET date_of_birth = '1985-05-12', gender = 'Male'
WHERE customer_id = 2;

UPDATE customers
SET date_of_birth = '1992-08-25', gender = 'Male'
WHERE customer_id = 3;

UPDATE customers
SET date_of_birth = '1988-03-10', gender = 'Female'
WHERE customer_id = 4;

UPDATE customers
SET date_of_birth = '1995-11-02', gender = 'Male'
WHERE customer_id = 5;

UPDATE customers
SET date_of_birth = '1990-07-18', gender = 'Female'
WHERE customer_id = 6;

UPDATE customers
SET date_of_birth = '1987-02-05', gender = 'Female'
WHERE customer_id = 7;

UPDATE customers
SET date_of_birth = '1983-09-22', gender = 'Male'
WHERE customer_id = 8;

UPDATE customers
SET date_of_birth = '1994-06-30', gender = 'Female'
WHERE customer_id = 9;

UPDATE customers
SET date_of_birth = '1991-12-15', gender = 'Male'
WHERE customer_id = 10;

UPDATE customers
SET date_of_birth = '1989-04-28', gender = 'Female'
WHERE customer_id = 11;

UPDATE customers
SET date_of_birth = '1996-01-20', gender = 'Male'
WHERE customer_id = 12;

UPDATE customers
SET date_of_birth = '1993-10-07', gender = 'Female'
WHERE customer_id = 13;

UPDATE customers
SET date_of_birth = '1986-06-11', gender = 'Male'
WHERE customer_id = 14;

UPDATE customers
SET date_of_birth = '1997-09-04', gender = 'Female'
WHERE customer_id = 15;

UPDATE customers
SET date_of_birth = '1984-11-26', gender = 'Male'
WHERE customer_id = 16;

UPDATE customers
SET date_of_birth = '1990-02-14', gender = 'Female'
WHERE customer_id = 17;

UPDATE customers
SET date_of_birth = '1982-08-19', gender = 'Female'
WHERE customer_id = 18;

UPDATE customers
SET date_of_birth = '1998-03-03', gender = 'Male'
WHERE customer_id = 19;

UPDATE customers
SET date_of_birth = '1991-05-23', gender = 'Female'
WHERE customer_id = 20;

-- Add columns to the products table
-- Add description, category, brand, sku, weight, dimensions, discount_percentage, is_active, created_at, and updated_at columns to the products table
ALTER TABLE products
ADD COLUMN description TEXT AFTER name,
ADD COLUMN category VARCHAR(50) AFTER description,
ADD COLUMN brand VARCHAR(50) AFTER category,
ADD COLUMN sku VARCHAR(20) AFTER brand,
ADD COLUMN weight DECIMAL(10, 2) AFTER stock,
ADD COLUMN dimensions VARCHAR(50) AFTER weight,
ADD COLUMN discount_percentage DECIMAL(5, 2) DEFAULT 0 AFTER price,
ADD COLUMN is_active BOOLEAN DEFAULT TRUE AFTER discount_percentage,
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER stock,
ADD COLUMN updated_at TIMESTAMP NULL AFTER created_at; -- Add columns to the products table

ALTER TABLE products
MODIFY updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP; -- Modify the updated_at column

-- Update columns description, category, brand, and sku for 20 records
UPDATE products
SET description = 'High-performance laptop with fast processing and ample storage.',
    category = 'Computers',
    brand = 'TechBrand',
    sku = 'TB-LAP-001'
WHERE product_id = 1;

UPDATE products
SET description = 'Latest model smartphone with high-resolution camera and long-lasting battery.',
    category = 'Mobile Phones',
    brand = 'SmartTech',
    sku = 'ST-PHN-002'
WHERE product_id = 2;

UPDATE products
SET description = 'Portable tablet perfect for browsing, reading, and entertainment.',
    category = 'Tablets',
    brand = 'TabWorld',
    sku = 'TW-TAB-003'
WHERE product_id = 3;

UPDATE products
SET description = 'Noise-cancelling headphones with superior sound quality.',
    category = 'Audio',
    brand = 'SoundMax',
    sku = 'SM-HPH-004'
WHERE product_id = 4;

UPDATE products
SET description = 'Ergonomic mouse for smooth and precise control.',
    category = 'Accessories',
    brand = 'PeriTech',
    sku = 'PT-MOU-005'
WHERE product_id = 5;

UPDATE products
SET description = 'Comfortable keyboard with quiet keys for better typing experience.',
    category = 'Accessories',
    brand = 'PeriTech',
    sku = 'PT-KBD-006'
WHERE product_id = 6;

UPDATE products
SET description = 'High-definition monitor with vibrant colors and sharp images.',
    category = 'Displays',
    brand = 'ViewPro',
    sku = 'VP-MON-007'
WHERE product_id = 7;

UPDATE products
SET description = 'All-in-one printer for home and office use.',
    category = 'Printers',
    brand = 'PrintEase',
    sku = 'PE-PRT-008'
WHERE product_id = 8;

UPDATE products
SET description = 'Fast and reliable scanner for documents and images.',
    category = 'Scanners',
    brand = 'ScanTech',
    sku = 'ST-SCN-009'
WHERE product_id = 9;

UPDATE products
SET description = 'Portable external hard drive for extra storage and backup.',
    category = 'Storage Devices',
    brand = 'DataSafe',
    sku = 'DS-EHD-010'
WHERE product_id = 10;

UPDATE products
SET description = 'High-quality webcam for video conferencing and streaming.',
    category = 'Cameras',
    brand = 'CamPro',
    sku = 'CP-WEB-011'
WHERE product_id = 11;

UPDATE products
SET description = 'Clear-sounding microphone for recording and communication.',
    category = 'Audio',
    brand = 'SoundMax',
    sku = 'SM-MIC-012'
WHERE product_id = 12;

UPDATE products
SET description = 'Compact speakers with deep bass and clear treble.',
    category = 'Audio',
    brand = 'SoundMax',
    sku = 'SM-SPK-013'
WHERE product_id = 13;

UPDATE products
SET description = 'Convenient USB flash drive for quick data transfer.',
    category = 'Storage Devices',
    brand = 'DataSafe',
    sku = 'DS-UFD-014'
WHERE product_id = 14;

UPDATE products
SET description = 'Durable Ethernet cable for fast network connections.',
    category = 'Networking',
    brand = 'NetConnect',
    sku = 'NC-ETH-015'
WHERE product_id = 15;

UPDATE products
SET description = 'Reliable HDMI cable for high-quality video and audio.',
    category = 'Cables',
    brand = 'CablePro',
    sku = 'CP-HDM-016'
WHERE product_id = 16;

UPDATE products
SET description = 'Versatile VGA cable for legacy devices and displays.',
    category = 'Cables',
    brand = 'CablePro',
    sku = 'CP-VGA-017'
WHERE product_id = 17;

UPDATE products
SET description = 'Multi-outlet power strip with surge protection.',
    category = 'Power Accessories',
    brand = 'PowerSafe',
    sku = 'PS-PWS-018'
WHERE product_id = 18;

UPDATE products
SET description = 'Fast wireless router for seamless internet connectivity.',
    category = 'Networking',
    brand = 'NetConnect',
    sku = 'NC-WRT-019'
WHERE product_id = 19;

UPDATE products
SET description = 'Efficient network switch for stable wired connections.',
    category = 'Networking',
    brand = 'NetConnect',
    sku = 'NC-SWT-020'
WHERE product_id = 20;

-- Update columns weight and dimensions for 20 records
UPDATE products
SET weight = 2.5,
    dimensions = '35 x 25 x 2 cm'
WHERE product_id = 1;

UPDATE products
SET weight = 0.2,
    dimensions = '15 x 7 x 0.8 cm'
WHERE product_id = 2;

UPDATE products
SET weight = 0.5,
    dimensions = '25 x 17 x 0.7 cm'
WHERE product_id = 3;

UPDATE products
SET weight = 0.3,
    dimensions = '18 x 15 x 7 cm'
WHERE product_id = 4;

UPDATE products
SET weight = 0.1,
    dimensions = '10 x 6 x 4 cm'
WHERE product_id = 5;

UPDATE products
SET weight = 0.6,
    dimensions = '45 x 15 x 3 cm'
WHERE product_id = 6;

UPDATE products
SET weight = 3.0,
    dimensions = '50 x 30 x 10 cm'
WHERE product_id = 7;

UPDATE products
SET weight = 6.5,
    dimensions = '48 x 40 x 25 cm'
WHERE product_id = 8;

UPDATE products
SET weight = 4.0,
    dimensions = '40 x 30 x 15 cm'
WHERE product_id = 9;

UPDATE products
SET weight = 0.8,
    dimensions = '12 x 8 x 2 cm'
WHERE product_id = 10;

UPDATE products
SET weight = 0.15,
    dimensions = '10 x 7 x 5 cm'
WHERE product_id = 11;

UPDATE products
SET weight = 0.25,
    dimensions = '20 x 15 x 8 cm'
WHERE product_id = 12;

UPDATE products
SET weight = 0.5,
    dimensions = '25 x 20 x 15 cm'
WHERE product_id = 13;

UPDATE products
SET weight = 0.05,
    dimensions = '6 x 2 x 1 cm'
WHERE product_id = 14;

UPDATE products
SET weight = 0.2,
    dimensions = '20 x 15 x 3 cm'
WHERE product_id = 15;

UPDATE products
SET weight = 0.25,
    dimensions = '25 x 20 x 4 cm'
WHERE product_id = 16;

UPDATE products
SET weight = 0.3,
    dimensions = '30 x 20 x 5 cm'
WHERE product_id = 17;

UPDATE products
SET weight = 0.6,
    dimensions = '40 x 10 x 6 cm'
WHERE product_id = 18;

UPDATE products
SET weight = 0.8,
    dimensions = '25 x 20 x 5 cm'
WHERE product_id = 19;

UPDATE products
SET weight = 1.2,
    dimensions = '30 x 25 x 6 cm'
WHERE product_id = 20;

-- Update columns shipping_address, shipping_cost, tracking_number, and delivery_date for 20 records
UPDATE orders SET 
    shipping_address = '123 Main St, City A', 
    shipping_cost = 20.00, 
    tracking_number = 'TRK1234567890', 
    delivery_date = '2025-02-28'
WHERE order_id = 1;

UPDATE orders SET 
    shipping_address = '456 Oak St, City B', 
    shipping_cost = 15.00, 
    tracking_number = 'TRK1234567891', 
    delivery_date = '2025-03-01'
WHERE order_id = 2;

UPDATE orders SET 
    shipping_address = '789 Pine St, City C', 
    shipping_cost = 12.50, 
    tracking_number = 'TRK1234567892', 
    delivery_date = '2025-03-03'
WHERE order_id = 3;

UPDATE orders SET 
    shipping_address = '101 Maple Ave, City D', 
    shipping_cost = 5.00, 
    tracking_number = 'TRK1234567893', 
    delivery_date = '2025-03-05'
WHERE order_id = 4;

UPDATE orders SET 
    shipping_address = '202 Birch Blvd, City E', 
    shipping_cost = 3.00, 
    tracking_number = 'TRK1234567894', 
    delivery_date = '2025-03-06'
WHERE order_id = 5;

UPDATE orders SET 
    shipping_address = '303 Cedar Ln, City F', 
    shipping_cost = 4.50, 
    tracking_number = 'TRK1234567895', 
    delivery_date = '2025-03-08'
WHERE order_id = 6;

UPDATE orders SET 
    shipping_address = '404 Spruce Ct, City G', 
    shipping_cost = 10.00, 
    tracking_number = 'TRK1234567896', 
    delivery_date = '2025-03-09'
WHERE order_id = 7;

UPDATE orders SET 
    shipping_address = '505 Willow Rd, City H', 
    shipping_cost = 8.00, 
    tracking_number = 'TRK1234567897', 
    delivery_date = '2025-03-10'
WHERE order_id = 8;

UPDATE orders SET 
    shipping_address = '606 Poplar St, City I', 
    shipping_cost = 7.00, 
    tracking_number = 'TRK1234567898', 
    delivery_date = '2025-03-12'
WHERE order_id = 9;

UPDATE orders SET 
    shipping_address = '707 Elm St, City J', 
    shipping_cost = 6.50, 
    tracking_number = 'TRK1234567899', 
    delivery_date = '2025-03-13'
WHERE order_id = 10;

UPDATE orders SET 
    shipping_address = '808 Ash Dr, City K', 
    shipping_cost = 5.75, 
    tracking_number = 'TRK1234567900', 
    delivery_date = '2025-03-14'
WHERE order_id = 11;

UPDATE orders SET 
    shipping_address = '909 Chestnut Ave, City L', 
    shipping_cost = 6.25, 
    tracking_number = 'TRK1234567901', 
    delivery_date = '2025-03-15'
WHERE order_id = 12;

UPDATE orders SET 
    shipping_address = '111 Beech Blvd, City M', 
    shipping_cost = 4.00, 
    tracking_number = 'TRK1234567902', 
    delivery_date = '2025-03-17'
WHERE order_id = 13;

UPDATE orders SET 
    shipping_address = '222 Walnut Ct, City N', 
    shipping_cost = 2.50, 
    tracking_number = 'TRK1234567903', 
    delivery_date = '2025-03-18'
WHERE order_id = 14;

UPDATE orders SET 
    shipping_address = '333 Redwood Rd, City O', 
    shipping_cost = 2.00, 
    tracking_number = 'TRK1234567904', 
    delivery_date = '2025-03-19'
WHERE order_id = 15;

UPDATE orders SET 
    shipping_address = '444 Fir Ln, City P', 
    shipping_cost = 3.75, 
    tracking_number = 'TRK1234567905', 
    delivery_date = '2025-03-20'
WHERE order_id = 16;

UPDATE orders SET 
    shipping_address = '555 Cypress St, City Q', 
    shipping_cost = 3.25, 
    tracking_number = 'TRK1234567906', 
    delivery_date = '2025-03-21'
WHERE order_id = 17;

UPDATE orders SET 
    shipping_address = '666 Magnolia Blvd, City R', 
    shipping_cost = 4.25, 
    tracking_number = 'TRK1234567907', 
    delivery_date = '2025-03-22'
WHERE order_id = 18;

UPDATE orders SET 
    shipping_address = '777 Dogwood Ct, City S', 
    shipping_cost = 5.00, 
    tracking_number = 'TRK1234567908', 
    delivery_date = '2025-03-23'
WHERE order_id = 19;

UPDATE orders SET 
    shipping_address = '888 Alder Ave, City T', 
    shipping_cost = 6.00, 
    tracking_number = 'TRK1234567909', 
    delivery_date = '2025-03-24'
WHERE order_id = 20;

UPDATE order_details
SET quantity = FLOOR(1 + (RAND() * 30)); -- Update order detail records with random quantities

UPDATE order_details
SET unit_price = ROUND(10 + (RAND() * 490), 2); -- Update order detail records with random unit prices

UPDATE order_details
SET discount_applied = (FLOOR(quantity / 10) * 0.02); -- Update order detail records with discount applied

UPDATE order_details
SET total_price = ROUND(quantity * unit_price * (1 - discount_applied), 2); -- Update order detail records with total prices

ALTER TABLE payments 
ADD COLUMN transaction_id VARCHAR(20),
ADD COLUMN status VARCHAR(20); -- Add columns to the payments table

UPDATE orders 
SET payment_status = 'successful'; -- Update order records with payment status

UPDATE payments p
JOIN orders o ON p.order_id = o.order_id 
SET p.status = o.payment_status; -- Update payment records with payment status

ALTER TABLE payments 
ADD COLUMN refunded_amount DECIMAL(10,2); -- Add column to the payments table

UPDATE payments 
SET refunded_amount = ROUND(amount * 0.01, 2) 
WHERE payment_method = 'Paypal'; -- Update payment records with refunded amount

ALTER TABLE payments 
ADD COLUMN currency VARCHAR(20); -- Add column to the payments table
UPDATE payments 
SET currency = 'US Dollars'; -- Update payment records with currency

UPDATE payments p
JOIN order_details od ON p.order_id = od.order_id 
SET p.amount = od.total_price; -- Update payment records with total price

ALTER TABLE payments 
ADD COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP; -- Add columns to the payments table

UPDATE products
SET discount_percentage = 2.00
WHERE brand = 'TechBrand'; -- Update product records with discount percentage

UPDATE orders
SET status = 'delivered'
WHERE status = 'pending'; -- Update order records with status

-- Update and Verification
UPDATE order_details od
JOIN products p ON od.product_id = p.product_id
SET od.unit_price = 
    CASE 
        WHEN p.discount_percentage > 0 THEN p.price * (1 - p.discount_percentage / 100)
        ELSE p.price
    END; -- Update order detail records with unit prices

UPDATE order_details
SET total_price = unit_price * (1 - discount_applied); -- Update order detail records with total prices

UPDATE orders o
JOIN (
    SELECT order_id, SUM(total_price) AS total_order_price
    FROM order_details
    GROUP BY order_id
) od_sum ON o.order_id = od_sum.order_id
SET o.total_amount = od_sum.total_order_price; -- Update order records with total amounts

UPDATE payments p
JOIN (
    SELECT od.order_id, SUM(od.total_price) + o.shipping_cost AS calculated_amount
    FROM order_details od
    JOIN orders o ON od.order_id = o.order_id
    GROUP BY od.order_id
) calc ON p.order_id = calc.order_id
SET p.amount = calc.calculated_amount; -- Update payment records with calculated amounts

UPDATE payments
SET refunded_amount = 0
WHERE refunded_amount IS NULL; -- Update payment records with refunded amount

-- Create a sperate table for formulating trnsaction_id
CREATE TABLE transaction_records AS
SELECT 
    p.payment_id,
    c.customer_id,
    o.order_id,
    od.order_detail_id,
    pr.product_id,
    CONCAT('TXN-', c.customer_id, '-', o.order_id, '-', p.payment_id, '-', DATE_FORMAT(o.order_date, '%Y%m%d')) AS transaction_id,
    NOW() AS created_at
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products pr ON od.product_id = pr.product_id; -- Create a transaction_records table

UPDATE payments p
JOIN transaction_records tr ON p.payment_id = tr.payment_id
SET p.transaction_id = tr.transaction_id; -- Update payment records with transaction_id
-- Error Code: 1265. Data truncated for column 'transaction_id' at row 10
-- VARCHAR length for both tables should be same

-- therefore
ALTER TABLE payments MODIFY COLUMN transaction_id VARCHAR(100);  -- Adjust length as needed

UPDATE payments p
JOIN transaction_records tr ON p.payment_id = tr.payment_id
SET p.transaction_id = tr.transaction_id; -- re-run then update payment records with transaction_id

-- Define customer loyalty based on buying a discount product and payment method
UPDATE customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
SET c.loyalty_points = c.loyalty_points + 1
WHERE p.brand = 'TechBrand'; -- Update customer records with loyalty points

UPDATE customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments pay ON o.order_id = pay.order_id
SET c.loyalty_points = c.loyalty_points + 1
WHERE pay.payment_method = 'PayPal'; -- Update customer records with loyalty points