-- ============================================
-- Initial data exploration
-- ============================================

-- Total sales count
SELECT COUNT(*) AS total_sales FROM coffee_shop_sales;

-- Total quantity sold
SELECT SUM(transaction_qty) AS total_quantity_sold
FROM coffee_shop_sales;

-- Total revenue
SELECT SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales;

-- Average price
SELECT AVG(unit_price) AS average_unit_price
FROM coffee_shop_sales;

-- Price range
SELECT 
    MAX(unit_price) AS highest_unit_price,
    MIN(unit_price) AS lowest_unit_price
FROM coffee_shop_sales;

-- Unique categories
SELECT COUNT(DISTINCT product_category) AS unique_categories
FROM coffee_shop_sales;

-- Unique store locations
SELECT COUNT(DISTINCT store_location) AS unique_locations
FROM coffee_shop_sales;