--------------------------------------------------------
-- SUNRISE SUPERMARKET ANALYTICAL QUERIES
-- Target Database: Oracle 11g Express Edition / APEX
--------------------------------------------------------

--------------------------------------------------------
-- SECTION 1: JOIN QUERIES
--------------------------------------------------------

-- Query 1.1: List every order with customer name, city, and order date (INNER JOIN)
SELECT 
    o.order_id, 
    c.customer_name, 
    c.city, 
    o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_id;


-- Query 1.2: List every order item with product name, category, unit price, and quantity (JOIN)
SELECT 
    oi.order_item_id, 
    oi.order_id, 
    p.product_name, 
    p.category, 
    p.price, 
    oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
ORDER BY oi.order_item_id;


-- Query 1.3: List all customers and their orders, including customers with no orders (LEFT JOIN)
SELECT 
    c.customer_id, 
    c.customer_name, 
    o.order_id, 
    o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_id;


--------------------------------------------------------
-- SECTION 2: COMMON TABLE EXPRESSION (CTE) QUERY
--------------------------------------------------------

-- Query 2.1: Find high-value customers who spend strictly above the overall average spend
WITH customer_spend AS (
    SELECT 
        c.customer_id, 
        c.customer_name, 
        SUM(oi.quantity * p.price) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT 
    customer_id, 
    customer_name, 
    total_spent
FROM customer_spend
WHERE total_spent > (SELECT AVG(total_spent) FROM customer_spend)
ORDER BY total_spent DESC;


--------------------------------------------------------
-- SECTION 3: WINDOW FUNCTION QUERIES
--------------------------------------------------------

-- Query 3.1: Rank customers by total spend using DENSE_RANK()
WITH customer_spend AS (
    SELECT 
        c.customer_id, 
        c.customer_name, 
        SUM(oi.quantity * p.price) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT 
    customer_id, 
    customer_name, 
    total_spent,
    DENSE_RANK() OVER (ORDER BY total_spent DESC) AS spend_rank
FROM customer_spend;


-- Query 3.2: Number each customer's orders sequentially using ROW_NUMBER()
SELECT 
    customer_id, 
    order_id, 
    order_date,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_number
FROM orders;


-- Query 3.3: Calculate daily revenue and running cumulative total over time
WITH daily_revenue AS (
    SELECT 
        o.order_date, 
        SUM(oi.quantity * p.price) AS daily_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_date
)
SELECT 
    order_date, 
    daily_total,
    SUM(daily_total) OVER (ORDER BY order_date) AS running_total_revenue
FROM daily_revenue;


-- Query 3.4: Compute days between consecutive orders using LAG() (Only for customers with >1 order)
WITH customer_orders AS (
    SELECT 
        customer_id, 
        order_id, 
        order_date,
        LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_order_date,
        COUNT(*) OVER (PARTITION BY customer_id) AS total_orders
    FROM orders
)
SELECT 
    customer_id, 
    order_id, 
    order_date, 
    prev_order_date,
    (order_date - prev_order_date) AS days_between_orders
FROM customer_orders
WHERE total_orders > 1;