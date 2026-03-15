-- =========================================
-- ZOMATO DATA ANALYSIS PROJECT
-- Author: Mohit Parashar
-- Tools Used: Oracle SQL, Excel, Power BI
-- =========================================


-- 1. CREATE TABLE

CREATE TABLE zomato_sales (
    restaurant_id NUMBER PRIMARY KEY,
    restaurant_name VARCHAR2(100),
    city VARCHAR2(50),
    locality VARCHAR2(50),
    cuisine VARCHAR2(100),
    year NUMBER,
    average_cost_for_two NUMBER,
    total_orders NUMBER,
    sales_amount NUMBER,
    rating NUMBER(2,1),
    votes NUMBER,
    online_order VARCHAR2(3),
    table_booking VARCHAR2(3),
    delivery_status VARCHAR2(20),
    price_range NUMBER,
    restaurant_type VARCHAR2(30)
);


-- =========================================
-- ANALYSIS QUERIES
-- =========================================


-- 2. YEAR-WISE SALES TREND

SELECT year,
SUM(sales_amount) AS total_sales
FROM zomato_sales
GROUP BY year
ORDER BY year;


-- 3. TOP 5 RESTAURANTS BY SALES

SELECT restaurant_name,
SUM(sales_amount) AS sales
FROM zomato_sales
GROUP BY restaurant_name
ORDER BY sales DESC
FETCH FIRST 5 ROWS ONLY;


-- 4. DELIVERY SUCCESS RATE

SELECT
ROUND(
COUNT(CASE WHEN delivery_status='Delivered' THEN 1 END) * 100 / COUNT(*),
2
) AS delivery_success_pct
FROM zomato_sales;


-- 5. CUISINE SALES ANALYSIS

SELECT cuisine,
SUM(sales_amount) AS total_sales
FROM zomato_sales
GROUP BY cuisine
ORDER BY total_sales DESC;


-- 6. AVERAGE RESTAURANT RATING

SELECT
ROUND(AVG(rating),2) AS average_rating
FROM zomato_sales;


-- 7. PRICE RANGE DISTRIBUTION

SELECT price_range,
COUNT(*) AS restaurant_count
FROM zomato_sales
GROUP BY price_range
ORDER BY price_range;