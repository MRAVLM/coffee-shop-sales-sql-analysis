-- ============================================
-- Queries using Common Table Expressions (CTEs)
-- ============================================

-- Top 10 products by revenue
WITH total_revenue AS (
    SELECT 
        product_type, 
        SUM(transaction_qty * unit_price) AS revenue
    FROM coffee_shop_sales
    GROUP BY product_type
)
SELECT product_type, revenue
FROM total_revenue
ORDER BY revenue DESC
LIMIT 10;

-- Best month for revenue
WITH total_revenue AS (
    SELECT 
        EXTRACT(YEAR FROM transaction_date) AS transaction_year, 
        EXTRACT(MONTH FROM transaction_date) AS transaction_month, 
        SUM(transaction_qty * unit_price) AS revenue
    FROM coffee_shop_sales
    GROUP BY transaction_year, transaction_month
)
SELECT transaction_year, transaction_month, revenue
FROM total_revenue 
ORDER BY revenue DESC
LIMIT 1;