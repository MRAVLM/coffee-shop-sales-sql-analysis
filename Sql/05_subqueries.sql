-- ============================================
-- Queries using subqueries
-- ============================================

-- Products priced above average
SELECT 
    product_type,
    unit_price
FROM coffee_shop_sales
WHERE unit_price > (SELECT AVG(unit_price) FROM coffee_shop_sales);

-- Categories with revenue above 10,000
SELECT 
    product_category, 
    SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY product_category
HAVING SUM(transaction_qty * unit_price) > 10000;

-- Products with more than 500 transactions
SELECT 
    product_type, 
    COUNT(product_type) AS total_transactions
FROM coffee_shop_sales
GROUP BY product_type
HAVING COUNT(product_type) > 500;

-- Stores above average revenue
SELECT 
    store_location,
    SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY store_location
HAVING SUM(transaction_qty * unit_price) > (
    SELECT AVG(revenue) 
    FROM (
        SELECT SUM(transaction_qty * unit_price) AS revenue
        FROM coffee_shop_sales
        GROUP BY store_location
    ) AS subquery
);