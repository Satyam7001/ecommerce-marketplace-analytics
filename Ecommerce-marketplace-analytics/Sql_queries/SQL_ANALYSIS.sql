CREATE TABLE CUSTOMERS(
	customer_id	 VARCHAR(50),
	customer_name	VARCHAR(50),
	gender	VARCHAR(10),
	age	INT,
	state	VARCHAR(50),
	city	VARCHAR(50),
	signup_date DATE

);

CREATE TABLE ORDERS(
	order_id VARCHAR(50),
	customer_id	VARCHAR(50),
	order_date	DATE,
	product_id	VARCHAR(50),
	seller_id	VARCHAR(50),
	quantity INT,	
	list_price	FLOAT,
	discount_pct INT,
	sales_amount	FLOAT,
	cost_amount	FLOAT,
	profit	FLOAT,
	order_status	VARCHAR(50),
	shipping_days FLOAT
);


CREATE TABLE SELLERS(
	seller_id	VARCHAR(50),
	seller_name	VARCHAR(50),
	seller_state	VARCHAR(50),
	seller_rating FLOAT,
	join_date DATE
);

CREATE TABLE PRODUCTS(
	product_id	VARCHAR(50),
	product_name VARCHAR(50),
	category	VARCHAR(50),
	sub_category	VARCHAR(50),
	list_price FLOAT,
	unit_cost	FLOAT,
	seller_id	VARCHAR(50),
	quality_score FLOAT
);

CREATE TABLE PAYMENTS(
	payment_id	VARCHAR(50),
	order_id	VARCHAR(50),
	payment_method	VARCHAR(50),
	payment_amount	FLOAT,
	payment_status VARCHAR(50)
);

CREATE TABLE RETURNS(
	return_id	VARCHAR(50),
	order_id	VARCHAR(50),
	product_id	VARCHAR(50),
	return_date	DATE,
	return_reason	VARCHAR(50),
	refund_amount	FLOAT,
	sales_amount FLOAT
);

CREATE TABLE REVIEWS(
	review_id	VARCHAR(50),
	order_id	VARCHAR(50),
	product_id	VARCHAR(50),
	customer_id	VARCHAR(50),
	rating	INT,
	review_date DATE,	
	review_text VARCHAR(50)
);


SELECT * FROM CUSTOMERS
SELECT * FROM ORDERS
SELECT * FROM SELLERS
SELECT * FROM PRODUCTS
SELECT * FROM PAYMENTS
SELECT * FROM RETURNS
SELECT * FROM REVIEWS

-- DATA VALIDATION:
-- 1. DUPLICATE CHECKING 
SELECT customer_id, COUNT(*) AS total_occurence
FROM CUSTOMERS
GROUP BY customer_id
HAVING COUNT(*)>1;

SELECT order_id , COUNT(*) AS total_occurrence
FROM ORDERS
GROUP BY order_id
HAVING COUNT(*)>1;

SELECT seller_id , COUNT(*) AS total_occurrence
FROM sellers
GROUP BY seller_id
HAVING COUNT(*)>1;

SELECT product_id , COUNT(*) AS total_occurrence
FROM PRODUCTS
GROUP BY product_id
HAVING COUNT(*)>1;

SELECT category, COUNT(*) 
FROM products 
GROUP BY category 
ORDER BY category;

BEGIN;
UPDATE products
SET category = 'Electronics'
WHERE category = 'Electronic';
SELECT category, COUNT(*) FROM products GROUP BY category ORDER BY category;
COMMIT;  

SELECT payment_id , COUNT(*) AS total_occurrence
FROM PAYMENTS
GROUP BY payment_id
HAVING COUNT(*)>1;

SELECT return_id , COUNT(*) AS total_occurrence
FROM RETURNS
GROUP BY return_id
HAVING COUNT(*)>1;

SELECT review_id , COUNT(*) AS total_occurrence 
FROM REVIEWS
GROUP BY review_id
HAVING COUNT(*)>1;
-- WE DON'T HAVE ANY DUPLICATED PRIMARY KEY.✅

-- 2 . NULLS CHECKING 
SELECT * FROM CUSTOMERS
SELECT 
	SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_ids,
	SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS null_customer_name,
	SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
	SUM(CASE WHEN  age IS NULL THEN 1 ELSE 0 END) AS null_age,
	SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS null_state,
	SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_cities,
	SUM(CASE WHEN signup_date IS NULL THEN 1 ELSE 0 END) AS null_signup_date
FROM CUSTOMERS

SELECT * FROM ORDERS

SELECT 
	COUNT(*) AS total_rows, 
	COUNT(order_id) AS NON_NULLS, 
	COUNT(*) - COUNT(order_id) AS NULLS__
FROM ORDERS

SELECT 
	SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_ids, --886 NULLS
	SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
	SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
	SUM(CASE WHEN  product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
	SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS null_seller_id,
	SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS null_quantities,
	SUM(CASE WHEN list_price IS NULL THEN 1 ELSE 0 END) AS null_list_price,
	SUM(CASE WHEN discount_pct IS NULL THEN 1 ELSE 0 END) AS null_discount_pct,
	SUM(CASE WHEN sales_amount IS NULL THEN 1 ELSE 0 END) AS null_sales_amount,
	SUM(CASE WHEN cost_amount IS NULL THEN 1 ELSE 0 END) AS null_cost_amount,
	SUM(CASE WHEN  profit IS NULL THEN 1 ELSE 0 END) AS null_profit,
	SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS null_order_status,
	SUM(CASE WHEN shipping_days IS NULL THEN 1 ELSE 0 END) AS null_shipping_days
FROM ORDERS;

SELECT  * FROM PAYMENTS
SELECT 
	SUM(CASE WHEN payment_id IS NULL THEN 1 ELSE 0 END) AS null_payment_id,
	SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_is,
	SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END) AS null_payment_method,
	SUM(CASE WHEN payment_amount IS NULL THEN 1 ELSE 0 END) AS null_payment_amount,
	SUM(CASE WHEN payment_status IS NULL THEN 1 ELSE 0 END) AS  null_payment_status
FROM PAYMENTS;

SELECT * FROM PRODUCTS

SELECT 
	SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
	SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS null_products_name,
	SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS null_category,
	SUM(CASE WHEN sub_categOry IS NULL THEN 1 ELSE 0 END) AS null_category,
	SUM(CASE WHEN list_price IS NULL THEN 1 ELSE 0 END) AS null_list_price,
	SUM(CASE WHEN unit_cost IS NULL THEN 1 ELSE 0 END) AS null_unit_cost,
	SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS  null_seller_id,
	SUM(CASE WHEN quality_score IS NULL THEN 1 ELSE 0 END) AS  null_quality_score
FROM PRODUCTS;

SELECT 
	SUM(CASE WHEN return_id IS NULL THEN 1 ELSE 0 END) AS null_return_id,
	SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
	SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id,
	SUM(CASE WHEN return_date IS NULL THEN 1 ELSE 0 END) AS null_return_date,
	SUM(CASE WHEN return_reason IS NULL THEN 1 ELSE 0 END) AS null_return_reason,
	SUM(CASE WHEN refund_amount IS NULL THEN 1 ELSE 0 END) AS  null_refund_amount,
	SUM(CASE WHEN sales_amount IS NULL THEN 1 ELSE 0 END) AS  null_sales_amount
FROM RETURNS;

SELECT 
	SUM(CASE WHEN review_id IS NULL THEN 1 ELSE 0 END) AS null_reviw_id,
	SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
	SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id,
	SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
	SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_rating,
	SUM(CASE WHEN review_date IS NULL THEN 1 ELSE 0 END) AS  null_review_date,
	SUM(CASE WHEN review_text IS NULL THEN 1 ELSE 0 END) AS  null_review_text
FROM REVIEWS;

SELECT 
	SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS null_seller_id,
	SUM(CASE WHEN seller_name IS NULL THEN 1 ELSE 0 END) AS null_seller_name,
	SUM(CASE WHEN seller_rating IS NULL THEN 1 ELSE 0 END) AS null_seller_rating,
	SUM(CASE WHEN join_date IS NULL THEN 1 ELSE 0 END) AS  null_join_date,
	SUM(CASE WHEN seller_state IS NULL THEN 1 ELSE 0 END) AS  null_seller_state
FROM SELLERS;

-- ALL ROWS HAVE 0 NULLS EXCEPT CUSTOMER_ID IN ORDER TABLE THAT HAS ALMOST 886 ROWS NULLS.


-- EXCLUDE CANCELLED ORDERS.

ALTER TABLE orders ALTER COLUMN sales_amount TYPE numeric(12,2);
ALTER TABLE orders ALTER COLUMN profit TYPE numeric(12,2);

CREATE VIEW valid_orders AS
SELECT O.*, P.category, P.product_name
FROM ORDERS O
JOIN PRODUCTS P USING (product_id)
WHERE O.order_status <> 'Cancelled';

SELECT * FROM valid_orders ;

-- REVENUE, PROFIT, ORDERS, AOV, MARGIN:

SELECT ROUND(SUM(sales_amount)) AS REVENUE,
	ROUND(SUM(profit)) AS PROFIT,
	COUNT(*) AS ORDERS,
	ROUND(SUM(sales_amount)/COUNT(*)) AS AOV,
	ROUND(100 * SUM(profit)/ SUM(sales_amount),1) AS MARGIN_PCT
FROM valid_orders;


-- CUSTOMER RETENTION (REPEAT CUSTOMERS):

WITH c AS(
	SELECT customer_id, COUNT(*) AS n
	FROM valid_orders
	WHERE customer_id IS NOT NULL
	GROUP BY customer_id
)
SELECT COUNT(*) AS customers,
	   SUM(CASE WHEN n>1 THEN 1 ELSE 0 END) AS repeat_customers,
	   ROUND(100.0 * SUM(CASE WHEN n>1 THEN 1 ELSE 0 END)/ COUNT(*), 1) AS repeat_pct
FROM c;

-- CATEGORY PERFORMANCE (WHICH CATEGORY EARNS MOST REVENUE?)

SELECT category,
  ROUND(SUM(sales_amount)) AS revenue,
  ROUND(SUM(profit)) AS profit,
  ROUND(100.0 * SUM(sales_amount) / SUM(SUM(sales_amount)) OVER(), 1) AS revenue_share_pct,
  ROUND(100.0 * SUM(profit) / SUM(sales_amount), 1) AS margin_pct
FROM valid_orders
GROUP BY category
ORDER BY revenue DESC;

-- TOP 10 PRODUCTS BY REVENUE 

SELECT product_id, product_name, category,
	   SUM(quantity) AS units_sold, ROUND(SUM(sales_amount)) AS revenue
FROM valid_orders
GROUP BY product_id, product_name, category
ORDER BY revenue DESC
LIMIT 10;

-- SELLER PERFORMANCE WITH RETURN RATE

SELECT O.seller_id,
	   ROUND(SUM(O.sales_amount)) AS Revenue,
	   COUNT(*) AS Orders_SOLD,
	   COUNT(R.return_id) AS Returns,
	   ROUND(100.0 * COUNT(R.return_id) / COUNT(*), 1) AS Return_pct
FROM ORDERS O
LEFT JOIN RETURNS R ON R.order_id = O.order_id
WHERE O.order_status <> 'Cancelled'
GROUP BY O.seller_id
ORDER BY Revenue DESC
LIMIT 10;

-- RETURN RATE BY CATEGORY

SELECT P.category,
	COUNT(R.return_id) AS returns,
	COUNT(*) AS delivered,
	ROUND(100.0 * COUNT(R.return_id) / COUNT(*), 1) AS return_pct
FROM ORDERS O
JOIN PRODUCTS P USING (product_id)
LEFT JOIN RETURNS R ON R.order_id = O.order_id
WHERE O.order_status = 'Delivered'
GROUP BY P.category
ORDER BY return_pct DESC;

-- REVENUE LOST TO RETURN 

SELECT P.category,
       ROUND(SUM(O.sales_amount)) AS returned_revenue
FROM orders O
JOIN products P USING (product_id)
JOIN (SELECT DISTINCT order_id FROM returns) R ON R.order_id = O.order_id
WHERE O.order_status = 'Delivered'
GROUP BY P.category
ORDER BY returned_revenue DESC;

-- RETURNED REVENUE AS % OF CATEGORY REVENUE

SELECT P.category,
       ROUND(SUM(O.sales_amount)) AS delivered_revenue,
       ROUND(SUM(CASE WHEN R.order_id IS NOT NULL THEN O.sales_amount ELSE 0 END)) AS returned_revenue,
       ROUND((100.0 * SUM(CASE WHEN R.order_id IS NOT NULL THEN O.sales_amount ELSE 0 END)
              / SUM(O.sales_amount)), 1) AS returned_rev_pct
FROM orders O
JOIN products P USING (product_id)
LEFT JOIN (SELECT DISTINCT order_id FROM returns) R ON R.order_id = O.order_id
WHERE O.order_status = 'Delivered'
GROUP BY P.category
ORDER BY returned_rev_pct DESC;


-- CUSTOMER RATING (OVERALL AND BY CATEGORY)

SELECT rating, COUNT(*) AS reviews,
	ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(),1) AS pct
FROM REVIEWS GROUP BY rating ORDER BY rating;

SELECT p.category, ROUND(AVG(r.rating), 2) AS avg_rating, COUNT(*) AS reviews
FROM reviews r JOIN products p USING (product_id)
GROUP BY p.category ORDER BY avg_rating DESC;

-- MONTHLY TREND WITH MONTH-OVER-MONTH GROWTH

WITH monthly AS (
  SELECT DATE_TRUNC('month', order_date) AS month_start,
         SUM(sales_amount)  AS revenue,
         SUM(profit) AS profit,
         COUNT(*)  AS orders
  FROM valid_orders
  GROUP BY 1
)
SELECT TO_CHAR(month_start, 'YYYY-MM') AS order_month,
       ROUND(revenue) AS total_revenue,
       ROUND(profit)  AS total_profit,
       orders  AS total_orders,
       ROUND(100.0 * profit / NULLIF(revenue, 0), 1)  AS profit_margin_pct,
       ROUND(revenue / NULLIF(orders, 0)) AS avg_order_value,
       ROUND(100.0 * (revenue - LAG(revenue) OVER w) / NULLIF(LAG(revenue) OVER w, 0), 1) AS revenue_mom_pct,
       ROUND(100.0 * (orders  - LAG(orders)  OVER w) / NULLIF(LAG(orders)  OVER w, 0), 1) AS orders_mom_pct,
       ROUND(SUM(revenue) OVER W) AS cumulative_revenue
FROM monthly
WINDOW w AS (ORDER BY month_start)
ORDER BY month_start;

-- HIGH SALES BY POOR RATINGS (WHICH PRODUTC?)

WITH prod AS (
 SELECT product_id, product_name, category,
 COUNT(*) AS orders, ROUND(SUM(sales_amount)) AS revenue
 FROM valid_orders GROUP BY product_id, product_name, category
), rt AS (
 SELECT product_id, ROUND(AVG(rating), 2) AS avg_rating, COUNT(*) AS n_reviews
 FROM reviews GROUP BY product_id HAVING COUNT(*) >= 15
), ranked AS (
 SELECT prod.*, rt.avg_rating, rt.n_reviews,
 NTILE(4) OVER (ORDER BY prod.orders DESC) AS sales_quartile
 FROM prod JOIN rt USING (product_id)
)
SELECT product_id, product_name, category, orders, revenue, avg_rating, n_reviews
FROM ranked
WHERE sales_quartile = 1 AND avg_rating < 3.5
ORDER BY orders DESC;

-- PAYMENT METHOD

SELECT pay.payment_method,
	 COUNT(*) AS orders,
	 ROUND(SUM(pay.payment_amount)) AS amount,
	 ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct
FROM payments pay
JOIN orders o USING (order_id)
WHERE o.order_status <> 'Cancelled'
GROUP BY pay.payment_method
ORDER BY orders DESC;
