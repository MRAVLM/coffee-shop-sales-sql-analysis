-- ============================================
-- Advanced window functions
-- ============================================

-- RANK() - Ranking with gaps
WITH total_revenue AS (
    SELECT 
        product_type, 
        SUM(transaction_qty * unit_price) AS revenue
    FROM coffee_shop_sales
    GROUP BY product_type
)
SELECT 
    product_type, 
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM total_revenue;

-- ROW_NUMBER() - Simple row numbering
WITH total_revenue AS (
    SELECT 
        product_type, 
        SUM(transaction_qty * unit_price) AS revenue
    FROM coffee_shop_sales
    GROUP BY product_type
)
SELECT 
    product_type, 
    revenue,
    ROW_NUMBER() OVER (ORDER BY revenue DESC) AS row_num
FROM total_revenue;

-- DENSE_RANK() - Ranking without gaps
WITH total_revenue AS (
    SELECT 
        product_category, 
        SUM(transaction_qty * unit_price) AS total_revenue
    FROM coffee_shop_sales
    GROUP BY product_category
)
SELECT 
    product_category, 
    total_revenue,
    DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS dense_rank
FROM total_revenue;

-- PARTITION BY - Top 3 products in each category
WITH ranked_products AS (
    SELECT 
        product_category,
        product_type,
        SUM(transaction_qty * unit_price) AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY product_category
            ORDER BY SUM(transaction_qty * unit_price) DESC 
        ) AS rank_in_category
    FROM coffee_shop_sales
    GROUP BY product_category, product_type
)
SELECT * FROM ranked_products WHERE rank_in_category <= 3;

-- LAG() - Month over month comparison
WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', transaction_date) AS month,
        SUM(transaction_qty * unit_price) AS revenue
    FROM coffee_shop_sales
    GROUP BY month
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month,
    revenue - LAG(revenue) OVER (ORDER BY month) AS change
FROM monthly_revenue;

-- LEAD() - Looking ahead
WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', transaction_date) AS month,
        SUM(transaction_qty * unit_price) AS revenue
    FROM coffee_shop_sales
    GROUP BY month
)
SELECT 
    month,
    revenue,
    LEAD(revenue) OVER (ORDER BY month) AS next_month,
    LAG(revenue) OVER (ORDER BY month) - revenue AS projected_change
FROM monthly_revenue;

-- FIRST_VALUE() - First product sold
SELECT DISTINCT
    FIRST_VALUE(product_type) OVER (
        ORDER BY transaction_date, transaction_time
    ) AS first_product_sold
FROM coffee_shop_sales;

-- LAST_VALUE() - Last product sold
WITH ranked_sales AS (
    SELECT 
        product_type,
        ROW_NUMBER() OVER ( 
            ORDER BY transaction_date DESC, transaction_time DESC
        ) AS reverse_order
    FROM coffee_shop_sales
)
SELECT 
    product_type AS last_product_sold
FROM ranked_sales
WHERE reverse_order = 1;

-- Running Total (Cumulative Revenue)
WITH daily_revenue AS (
    SELECT 
        transaction_date,
        SUM(transaction_qty * unit_price) AS daily_total
    FROM coffee_shop_sales
    GROUP BY transaction_date
)
SELECT 
    transaction_date,
    daily_total,
    SUM(daily_total) OVER (ORDER BY transaction_date) AS cumulative_revenue
FROM daily_revenue
ORDER BY transaction_date;