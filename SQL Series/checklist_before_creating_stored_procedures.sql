-- Checklist before creating stored procedures
-- 1. Primary Keys & Auto-Increment Columns
-- A properly defined PRIMARY KEY.
-- Columns that should be AUTO_INCREMENT (e.g., customer_id, order_id).

SELECT TABLE_NAME, COLUMN_NAME, COLUMN_KEY, EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce' 
AND COLUMN_KEY = 'PRI'; -- Check primary keys and auto-increment for all tables

-- ✅ Primary Keys & Auto-Increment Summary
-- customers: customer_id → ✅ auto_increment
-- orders: order_id → ✅ auto_increment
-- payments: payment_id → ✅ auto_increment
-- order_details: order_detail_id → ❌ No auto_increment
-- products: product_id → ❌ No auto_increment

ALTER TABLE order_details
MODIFY order_detail_id INT AUTO_INCREMENT; -- Set the order_detail_id to auto increment

ALTER TABLE products
MODIFY product_id INT AUTO_INCREMENT; -- Set the product_id to auto increment (will be used in the next case)

-- 2. Foreign Key Constraints
-- Check all foreign key constraints in 'ecommerce'
SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'ecommerce' AND REFERENCED_TABLE_NAME IS NOT NULL; -- Check foreign key constraints for all tables

-- 👉 Action: Confirm relationships like:
-- orders.customer_id → customers.customer_id ✅
-- order_details.order_id → orders.order_id ✅
-- order_details.product_id → products.product_id ✅
-- payments.order_id → orders.order_id ✅
-- transaction_records.payment_id → payments.payment_id ❌

-- For the first, add the foreign key constraint to transaction_records
ALTER TABLE transaction_records
ADD CONSTRAINT transaction_records_ibfk_1
FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Add foreign key constraint to transaction_records

-- And for the rests,
ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Add foreign key constraint to orders

ALTER TABLE order_details
ADD CONSTRAINT order_details_ibfk_1
FOREIGN KEY (order_id) REFERENCES orders(order_id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Add foreign key constraint to order_details

ALTER TABLE order_details
ADD CONSTRAINT order_details_ibfk_2
FOREIGN KEY (product_id) REFERENCES products(product_id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Add foreign key constraint to order_details

ALTER TABLE payments
ADD CONSTRAINT payments_ibfk_1
FOREIGN KEY (order_id) REFERENCES orders(order_id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Add foreign key constraint to payments
-- Error Code: 1826. Duplicate foreign key constraint name 'orders_ibfk_1'

-- We need to drop the four foreign keys first
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;
ALTER TABLE order_details DROP FOREIGN KEY order_details_ibfk_1;
ALTER TABLE order_details DROP FOREIGN KEY order_details_ibfk_2;
ALTER TABLE payments DROP FOREIGN KEY payments_ibfk_1;

-- Then, add the foreign keys again
ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Add foreign key constraint to orders

ALTER TABLE order_details
ADD CONSTRAINT order_details_ibfk_1
FOREIGN KEY (order_id) REFERENCES orders(order_id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Add foreign key constraint to order_details

ALTER TABLE order_details
ADD CONSTRAINT order_details_ibfk_2
FOREIGN KEY (product_id) REFERENCES products(product_id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Add foreign key constraint to order_details

ALTER TABLE payments
ADD CONSTRAINT payments_ibfk_1
FOREIGN KEY (order_id) REFERENCES orders(order_id)
ON DELETE CASCADE ON UPDATE CASCADE; -- Add foreign key constraint to payments

-- Check all key constraints in 'ecommerce'
SELECT CONSTRAINT_NAME, TABLE_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'ecommerce';

-- 3. NOT NULL Constraints
SELECT TABLE_NAME, COLUMN_NAME, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce' AND IS_NULLABLE = 'NO'; -- Check NOT NULL constraints for all tables

-- TABLE_NAME           COLUMN_NAME         IS_NULLABLE
-- customers	        customer_id	        NO
-- order_details	    order_detail_id	    NO
-- order_details	    total_price	        NO
-- order_details	    unit_price	        NO
-- orders	            created_at	        NO
-- orders	            order_id	        NO
-- orders	            payment_status	    NO
-- orders	            shipping_address	NO
-- orders	            shipping_cost	    NO
-- orders	            status	            NO
-- orders	            updated_at	        NO
-- payments	            payment_id	        NO
-- products	            product_id	        NO
-- transaction_records	created_at	        NO
-- transaction_records	customer_id	        NO
-- transaction_records	order_detail_id	    NO
-- transaction_records	order_id	        NO
-- transaction_records	payment_id	        NO
-- transaction_records	product_id	        NO

-- Values must be provided when inserting records.
-- SET NULL actions in foreign key constraints won’t work unless you modify columns to allow NULL.
-- Ensures data completeness but can cause insertion/update issues if required data isn’t provided.

-- Use ON DELETE CASCADE if removing related data is acceptable.
-- Use ON DELETE RESTRICT if you want to prevent accidental deletions.

-- 4. Default Values & Data Types
-- Check default values and data types
SELECT TABLE_NAME, COLUMN_NAME, COLUMN_TYPE, COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce';

-- TABLE_NAME           COLUMN_NAME         COLUMN_TYPE                             COLUMN_DEFAULT
-- customers	        account_status	    enum('Active','Inactive','Suspended')	Active
-- customers	        address	            text	
-- customers	        created_at	        timestamp	                            CURRENT_TIMESTAMP
-- customers	        customer_id	        int	
-- customers	        date_of_birth	    date	
-- customers	        email	            varchar(100)	
-- customers	        gender	            enum('Male','Female','Other')	
-- customers	        loyalty_points	    int	                                    0
-- customers	        name	            varchar(100)	
-- customers	        phone	            varchar(15)	
-- customers	        updated_at	        timestamp	                            CURRENT_TIMESTAMP
-- order_details	    created_at	        datetime	                            CURRENT_TIMESTAMP
-- order_details	    discount_applied	decimal(5,2)	                        0.00
-- order_details	    order_detail_id	    int	
-- order_details	    order_id	        int	
-- order_details	    product_id	        int	
-- order_details	    quantity	        int	
-- order_details	    total_price	        decimal(10,2)	
-- order_details	    unit_price	        decimal(10,2)	
-- orders	            created_at	        datetime	                            CURRENT_TIMESTAMP
-- orders	            customer_id	        int	
-- orders	            delivery_date	    date	
-- orders	            order_date	        date	
-- orders	            order_id	        int	
-- orders	            payment_status	    varchar(50)	                            Unpaid
-- orders	            shipping_address	text	
-- orders	            shipping_cost	    decimal(10,2)	                        0.00
-- orders	            status	            varchar(50)	                            Pending
-- orders	            total_amount	    decimal(10,2)	
-- orders	            tracking_number	    varchar(100)	
-- orders	            updated_at	        datetime	                            CURRENT_TIMESTAMP
-- payments	            amount	            decimal(10,2)	
-- payments	            created_at	        datetime	                            CURRENT_TIMESTAMP
-- payments	            currency	        varchar(20)	
-- payments	            order_id	        int	
-- payments	            payment_date	    date	
-- payments	            payment_id	        int	
-- payments	            payment_method	    varchar(50)	
-- payments	            refunded_amount	    decimal(10,2)	
-- payments	            status	            varchar(20)	
-- payments	            transaction_id	    varchar(100)	
-- payments	            updated_at	        datetime	                            CURRENT_TIMESTAMP
-- products	            brand	            varchar(50)	
-- products	            category	        varchar(50)	
-- products	            created_at	        timestamp	                            CURRENT_TIMESTAMP
-- products	            description	        text	
-- products	            dimensions	        varchar(50)	
-- products	            discount_percentage	decimal(5,2)	                        0.00
-- products	            is_active	        tinyint(1)	1
-- products	            name	            varchar(100)	
-- products	            price	            decimal(10,2)	
-- products	            product_id	        int	
-- products	            sku	                varchar(20)	
-- products	            stock	            int	
-- products	            updated_at	        timestamp	                            CURRENT_TIMESTAMP
-- products	            weight	            decimal(10,2)	
-- transaction_records	created_at	        datetime	
-- transaction_records	customer_id	        int	                                    0
-- transaction_records	order_detail_id	    int	
-- transaction_records	order_id	        int	
-- transaction_records	payment_id	        int	
-- transaction_records	product_id	        int	
-- transaction_records	transaction_id	    varchar(48)	

-- Adjust transaction_records.customer_id to NOT NULL without a default value
ALTER TABLE transaction_records
MODIFY COLUMN customer_id INT NOT NULL;

-- Set default values for other foreign keys in transaction_records (if needed)
ALTER TABLE transaction_records
MODIFY COLUMN order_id INT NOT NULL,
MODIFY COLUMN payment_id INT NOT NULL,
MODIFY COLUMN product_id INT NOT NULL;

-- Set default value for products.stock to 0
ALTER TABLE products
MODIFY COLUMN stock INT NOT NULL DEFAULT 0;

-- Update transaction_records.transaction_id to VARCHAR(100)
ALTER TABLE transaction_records
MODIFY transaction_id VARCHAR(100);

-- Update customers.gender ENUM
ALTER TABLE customers
MODIFY gender ENUM('Male', 'Female');

-- Modify the colum types to be Timestamp uniformly
ALTER TABLE order_details
MODIFY created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE orders
MODIFY created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE orders
MODIFY updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE payments
MODIFY created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE payments
MODIFY updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Set nullable text fields without default values (TEXT columns cannot have defaults)
ALTER TABLE customers
MODIFY COLUMN address TEXT;
ALTER TABLE orders
MODIFY COLUMN shipping_address TEXT;
ALTER TABLE products
MODIFY COLUMN description TEXT;

-- Change the existing records before applying the default value
UPDATE payments
SET status = 'Completed';
UPDATE orders
SET payment_status = 'Paid';

-- Adjust orders.payment_status to ENUM with default 'Unpaid'
ALTER TABLE orders
MODIFY COLUMN payment_status ENUM('Unpaid', 'Paid', 'Refunded') DEFAULT 'Unpaid';

-- Adjust orders.status to ENUM with default 'Pending'
ALTER TABLE orders
MODIFY COLUMN status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending';

-- Adjust payments.status to ENUM with default 'Pending'
ALTER TABLE payments
MODIFY COLUMN status ENUM('Pending', 'Completed', 'Failed', 'Refunded') DEFAULT 'Pending';

-- 5. Indexes
-- Check indexes
SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME, NON_UNIQUE
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = 'ecommerce';

-- TABLE_NAME           INDEX_NAME                  COLUMN_NAME     NON_UNIQUE
-- customers	        PRIMARY	                    customer_id	    0
-- order_details	    order_details_ibfk_1	    order_id	    1
-- order_details	    order_details_ibfk_2	    product_id	    1
-- order_details	    PRIMARY	                    order_detail_id	0
-- orders	            orders_ibfk_1	            customer_id	    1
-- orders	            PRIMARY	                    order_id	    0
-- payments	            payments_ibfk_1	            order_id	    1
-- payments	            PRIMARY	                    payment_id	    0
-- products	            PRIMARY	                    product_id	    0
-- transaction_records	transaction_records_ibfk_1	payment_id	    1

-- Add index on customer_id
CREATE INDEX idx_transaction_records_customer_id
ON transaction_records (customer_id);

-- Add index on order_id
CREATE INDEX idx_transaction_records_order_id
ON transaction_records (order_id);

-- Add index on product_id
CREATE INDEX idx_transaction_records_product_id
ON transaction_records (product_id);

-- 6. Existing Records & Data Integrity
-- Orphaned transaction_records.customer_id (no matching customer)
SELECT tr.transaction_id
FROM transaction_records tr
LEFT JOIN customers c ON tr.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Orphaned transaction_records.order_id (no matching order)
SELECT tr.transaction_id
FROM transaction_records tr
LEFT JOIN orders o ON tr.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Orphaned transaction_records.payment_id (no matching payment)
SELECT tr.transaction_id
FROM transaction_records tr
LEFT JOIN payments p ON tr.payment_id = p.payment_id
WHERE p.payment_id IS NULL;

-- Orphaned transaction_records.product_id (no matching product)
SELECT tr.transaction_id
FROM transaction_records tr
LEFT JOIN products pr ON tr.product_id = pr.product_id
WHERE pr.product_id IS NULL;

-- SELECT od.order_detail_id
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Orphaned order_details.product_id (no matching product)
SELECT od.order_detail_id
FROM order_details od
LEFT JOIN products pr ON od.product_id = pr.product_id
WHERE pr.product_id IS NULL;

-- Duplicate transaction_id
SELECT transaction_id, COUNT(*)
FROM transaction_records
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- Duplicate order_detail_id
SELECT order_detail_id, COUNT(*)
FROM order_details
GROUP BY order_detail_id
HAVING COUNT(*) > 1;

-- 7. Triggers & Existing Procedures
-- Check triggers
SELECT TRIGGER_NAME, EVENT_OBJECT_TABLE, EVENT_MANIPULATION
FROM INFORMATION_SCHEMA.TRIGGERS
WHERE TRIGGER_SCHEMA = 'ecommerce';

-- Check existing procedures
SELECT ROUTINE_NAME
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_SCHEMA = 'ecommerce' AND ROUTINE_TYPE = 'PROCEDURE';
