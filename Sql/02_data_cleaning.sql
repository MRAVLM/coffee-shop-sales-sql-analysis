-- ============================================
-- Data quality checks
-- ============================================

-- Total record count
SELECT COUNT(*) AS total_sales FROM coffee_shop_sales;

-- Checking for NULL values
SELECT
    COUNT(*) FILTER (WHERE transaction_id IS NULL) AS transaction_id_null,
    COUNT(*) FILTER (WHERE transaction_date IS NULL) AS transaction_date_null,
    COUNT(*) FILTER (WHERE transaction_time IS NULL) AS transaction_time_null,
    COUNT(*) FILTER (WHERE transaction_qty IS NULL) AS transaction_qty_null,
    COUNT(*) FILTER (WHERE unit_price IS NULL) AS unit_price_null,
    COUNT(*) FILTER (WHERE store_location IS NULL) AS store_location_null,
    COUNT(*) FILTER (WHERE product_category IS NULL) AS product_category_null,
    COUNT(*) FILTER (WHERE product_type IS NULL) AS product_type_null
FROM coffee_shop_sales;

-- Duplicate transaction check
SELECT transaction_id, COUNT(*)
FROM coffee_shop_sales
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- Invalid prices
SELECT * FROM coffee_shop_sales WHERE unit_price <= 0;

-- Invalid quantities
SELECT * FROM coffee_shop_sales WHERE transaction_qty <= 0;

-- Date range coverage
SELECT 
    MAX(transaction_date) AS latest_transaction,
    MIN(transaction_date) AS earliest_transaction
FROM coffee_shop_sales;