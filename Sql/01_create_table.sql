-- ============================================
-- Table creation and initial data import
-- ============================================

CREATE TABLE coffee_shop_sales (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    transaction_time TIME,
    transaction_qty INT,
    unit_price DECIMAL(10,2),
    store_location VARCHAR(100),
    product_category VARCHAR(100),
    product_type VARCHAR(100),
    product_detail VARCHAR(100)
);

-- Quick check after import
SELECT * FROM coffee_shop_sales LIMIT 10;