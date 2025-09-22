-- Jiomart Business Queries

-- 1. Top 10 best-selling products by quantity
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 10;

-- 2. Revenue by product category
SELECT p.category, SUM(oi.total_item_amount) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;

-- 3. Monthly order trends
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- 4. Average order value per customer
SELECT c.name, AVG(o.total_amount) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name;

-- 5. Top customers by revenue
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

-- 6. Products with high stock but low sales (demo query with stock_status)
SELECT p.name, p.stock_status, SUM(oi.quantity) AS total_sold
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name, p.stock_status
HAVING total_sold < 5;

-- 7. Discounted vs non-discounted sales
SELECT CASE WHEN p.discount_pct > 0 THEN 'Discounted' ELSE 'Non-Discounted' END AS discount_type,
       SUM(oi.total_item_amount) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY discount_type;

-- 8. City-wise revenue distribution
SELECT c.city, SUM(o.total_amount) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city;

-- 9. Average delivery time
SELECT AVG(DATEDIFF(delivery_date, order_date)) AS avg_delivery_days
FROM orders;

-- 10. Total revenue trend per year
SELECT YEAR(order_date) AS year, SUM(total_amount) AS revenue
FROM orders
GROUP BY year;
