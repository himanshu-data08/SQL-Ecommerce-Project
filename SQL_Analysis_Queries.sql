-- Que1. Total Revenue

SELECT SUM(amount) AS total_revenue
FROM payments;

-- Que2. Revenue by Product

SELECT p.product_name,
       SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Que3. Top Customers by Spend

SELECT c.name,
       SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Que4. Best Selling Products

SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Que5. Best Selling Products

SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Que6. Cancelled Orders Count

SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE order_status = 'Cancelled';

-- Que7. Most Expensive Product

SELECT product_name,price
FROM products
ORDER BY price DESC
LIMIT 1;

-- Que8. Cheapest Product

SELECT product_name,price
FROM products
ORDER BY price
LIMIT 1;

-- Que9. Customers from Each City

SELECT city,
COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Que10. Revenue by Payment Mode

SELECT payment_mode,
SUM(amount) AS revenue
FROM payments
GROUP BY payment_mode;

-- Que11. Average Order Value

SELECT AVG(amount) AS average_order_value
FROM payments;

-- Que12. Pending Orders

SELECT COUNT(*)
FROM orders
WHERE order_status='Pending';

-- Que13. Low Stock Products

SELECT product_name,stock
FROM products
WHERE stock<50;

-- Que14. Products More Expensive Than Average Price

SELECT product_name, price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- Que15. Products Never Ordered

SELECT product_name
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM order_items
);