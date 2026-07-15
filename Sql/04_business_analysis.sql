-- ============================================
-- Business analysis queries
-- ============================================

-- Revenue by store
SELECT 
    store_location, 
    SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY store_location
ORDER BY total_revenue DESC;

-- Revenue by category
SELECT 
    product_category, 
    SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

-- Transactions by category
SELECT 
    product_category, 
    SUM(transaction_qty) AS total_transactions
FROM coffee_shop_sales
GROUP BY product_category
ORDER BY total_transactions DESC;

-- Top 10 products by transaction count
SELECT 
    product_type, 
    SUM(transaction_qty) AS total_transactions
FROM coffee_shop_sales
GROUP BY product_type
ORDER BY total_transactions DESC
LIMIT 10;

-- Top 10 products by revenue
SELECT 
    product_type, 
    SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY product_type
ORDER BY total_revenue DESC
LIMIT 10;

-- Monthly revenue
SELECT 
    EXTRACT(MONTH FROM transaction_date) AS transaction_month, 
    SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY transaction_month
ORDER BY total_revenue DESC;

-- Best day of week for revenue
SELECT 
    EXTRACT(DOW FROM transaction_date) AS transaction_day, 
    SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY transaction_day
ORDER BY total_revenue DESC
LIMIT 1;

-- Peak hour for transactions
SELECT 
    EXTRACT(HOUR FROM transaction_time) AS transaction_hour, 
    COUNT(transaction_id) AS total_transactions
FROM coffee_shop_sales
GROUP BY transaction_hour
ORDER BY total_transactions DESC
LIMIT 1;

-- Time of day analysis
SELECT 
    CASE
        WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 18 AND 21 THEN 'Evening'
        ELSE 'Night'
    END AS time_of_day,
    SUM(transaction_qty * unit_price) AS total_revenue,
    COUNT(transaction_id) AS total_transactions,
    SUM(transaction_qty * unit_price) / COUNT(transaction_id) AS avg_revenue_per_transaction
FROM coffee_shop_sales
GROUP BY time_of_day
ORDER BY total_revenue DESC;

-- High/Medium/Low value transactions
SELECT 
    CASE
        WHEN transaction_qty * unit_price >= 20 THEN 'High Value'
        WHEN transaction_qty * unit_price >= 10 THEN 'Medium Value'
        WHEN transaction_qty * unit_price >= 5 THEN 'Low Value'
        ELSE 'Very Low Value'
    END AS payment_value,
    SUM(transaction_qty * unit_price) AS total_revenue,
    COUNT(transaction_id) AS total_transactions,
    SUM(transaction_qty * unit_price) / COUNT(transaction_id) AS avg_revenue_per_transaction
FROM coffee_shop_sales
GROUP BY payment_value
ORDER BY total_revenue DESC;