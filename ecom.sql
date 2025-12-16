DELIMITER $$

CREATE PROCEDURE place_order(
    IN p_user_id INT,
    IN p_total DECIMAL(10,2)
)
BEGIN
    INSERT INTO orders(user_id, total_amount, status)
    VALUES (p_user_id, p_total, 'PLACED');
END $$

DELIMITER ;

CREATE TRIGGER reduce_stock
AFTER INSERT ON order_items
FOR EACH ROW
UPDATE inventory
SET stock = stock - NEW.quantity
WHERE product_id = NEW.product_id;

-- Top 5 selling products
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 5;

CREATE VIEW active_orders AS
SELECT o.order_id, u.name, o.total_amount
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE o.status = 'PLACED';

