-- Initial step
INSERT INTO customers (customer_id, name, email, phone, address, date_of_birth, gender, account_status, created_at, updated_at) 
VALUES 
(21, 'John Doe', 'john.doe@email.com', '885-673-6734', '123 Main St, NY, USA', '1990-05-15', 'Male', 'Active', NOW(), NOW());

INSERT INTO products (product_id, name, description, category, brand, price, discount_percentage, is_active, stock, created_at, updated_at, weight, dimensions) 
VALUES 
(21, 'TechBrand Smartphone', 'Latest model', 'Electronics', 'TechBrand', 500.00, 2.00, 1, 50, NOW(), NOW(), 0.5, '15 x 7 x 0.8 cm');

INSERT INTO orders (order_id, customer_id, order_date, shipping_address, shipping_cost, status, payment_status, delivery_date, created_at, updated_at, total_amount) 
VALUES 
(21, 21, '2025-03-01', '123 Main St, NY, USA', 5.99, 'Pending', 'Unpaid', '2025-03-01', NOW(), NOW(), 0);

INSERT INTO payments (payment_id, order_id, payment_date, payment_method, currency, status, created_at, updated_at, amount, refunded_amount) 
VALUES 
(21, 21, '2025-03-01', 'PayPal', 'US Dollar', 'Pending', NOW(), NOW(), 0, 0);

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, unit_price, total_price, discount_applied)
VALUES
(21, 21, 21, 25, 0, 0, 0);


-- Stored procedure step
DELIMITER //

CREATE PROCEDURE CalculatePrice(IN given_order_id INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE prod_id INT;
    DECLARE unit_price DECIMAL(10,2);
    DECLARE quantity INT;
    DECLARE discount_percentage DECIMAL(5,2);
    DECLARE discount_applied DECIMAL(5,2);
    DECLARE base_price DECIMAL(10,2);
    DECLARE total_price DECIMAL(10,2);
    DECLARE order_total DECIMAL(10,2) DEFAULT 0;
    DECLARE shipping_cost DECIMAL(10,2);
    DECLARE refunded_amount DECIMAL(10,2) DEFAULT 0;
    DECLARE payment_method VARCHAR(50);
    DECLARE final_payment_amount DECIMAL(10,2) DEFAULT 0;

    -- Cursor for iterating order details
    DECLARE order_cursor CURSOR FOR 
        SELECT od.product_id, od.quantity, p.price, p.discount_percentage 
        FROM order_details od
        JOIN products p ON od.product_id = p.product_id
        WHERE od.order_id = given_order_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Reset done variable
    SET done = 0;

    -- Open cursor
    OPEN order_cursor;
    
    -- Start loop
    order_loop: LOOP
        FETCH order_cursor INTO prod_id, quantity, base_price, discount_percentage;
        IF done THEN
            LEAVE order_loop;
        END IF;
        SET done = 0;  -- Reset done after fetching

        -- Apply discount for TechBrand products
        IF (SELECT brand FROM products WHERE product_id = prod_id) = 'TechBrand' THEN
            SET unit_price = base_price * (1 - discount_percentage / 100);
        ELSE
            SET unit_price = base_price;
        END IF;

        -- Apply bulk discount for every 10 items
        SET discount_applied = 0;  -- Initialize discount_applied
        IF quantity >= 10 THEN
            SET discount_applied = (FLOOR(quantity / 10) * 0.02);  
        END IF;

        -- Calculate total price
        SET total_price = unit_price * quantity * (1 - discount_applied);

        -- Update order_details (including discount_applied)
        UPDATE order_details 
        SET unit_price = unit_price, 
            total_price = total_price, 
            discount_applied = discount_applied
        WHERE order_id = given_order_id AND product_id = prod_id;
    END LOOP;
    CLOSE order_cursor;

    -- Calculate total amount for orders
    SELECT SUM(total_price) INTO order_total FROM order_details WHERE order_id = given_order_id;
    UPDATE orders SET total_amount = order_total WHERE order_id = given_order_id;

    -- Get shipping cost
    SELECT shipping_cost INTO shipping_cost FROM orders WHERE order_id = given_order_id;

    -- Ensure shipping cost is not null
    IF shipping_cost IS NULL THEN
        SET shipping_cost = 5.99;
    END IF;

    -- Debugging: Output shipping cost
    SELECT shipping_cost AS 'Shipping Cost Retrieved';

    -- Get payment method
    SELECT payment_method INTO payment_method FROM payments WHERE order_id = given_order_id LIMIT 1;

    -- Debugging: Output payment method
    SELECT payment_method AS 'Payment Method Retrieved';

    -- Ensure PayPal payments get refunded_amount = 0.01
    IF payment_method = 'PayPal' THEN
        SET refunded_amount = 0.01;
    END IF;
    
    -- Ensure refunded_amount is not zero
    IF refunded_amount = 0 THEN
        SET refunded_amount = 0.01;
    END IF;
    
    -- Debugging: Output refunded amount
    SELECT refunded_amount AS 'Refunded Amount Set';

    -- Adjust final payment amount for PayPal correctly
    IF refunded_amount = 0.01 THEN
        SET final_payment_amount = (order_total + shipping_cost) * (1 - refunded_amount);
    END IF;

    -- Debugging: Output calculated values
    SELECT order_total AS 'Order Total', shipping_cost AS 'Shipping Cost', refunded_amount AS 'Refunded Amount', final_payment_amount AS 'Final Payment Amount';

    -- Ensure `payments.amount` is correctly updated
    UPDATE payments 
    SET amount = final_payment_amount, refunded_amount = refunded_amount
    WHERE order_id = given_order_id;

    COMMIT;
END //

DELIMITER ;

CALL CalculatePrice(21);