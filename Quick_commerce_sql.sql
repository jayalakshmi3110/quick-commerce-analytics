-- Q1: Monthly revenue + month-over-month growth
WITH monthly AS (
 SELECT DATE_FORMAT(order_date,'%Y-%m') AS ym, SUM(revenue) AS revenue
 FROM vw_sales GROUP BY ym
)
SELECT ym, ROUND(revenue) AS revenue,
 ROUND((revenue - LAG(revenue) OVER (ORDER BY ym))
 / LAG(revenue) OVER (ORDER BY ym) * 100, 1) AS mom_growth_pct
FROM monthly ORDER BY ym;

-- Q2: Category revenue share
SELECT category, ROUND(SUM(revenue)) AS revenue,
 ROUND(SUM(revenue) / SUM(SUM(revenue)) OVER () * 100, 1) AS share_pct
FROM vw_sales GROUP BY category ORDER BY revenue DESC;

-- Q3: City scorecard
SELECT city, COUNT(*) AS orders, ROUND(SUM(revenue)) AS revenue,
 ROUND(AVG(delivery_minutes),1) AS avg_delivery_min,
 ROUND(AVG(rating),2) AS avg_rating
FROM vw_sales GROUP BY city ORDER BY revenue DESC;

-- Q4: Does delivery speed affect customer rating?
SELECT delivery_bucket, COUNT(*) AS orders, ROUND(AVG(rating),2) AS avg_rating
FROM vw_sales GROUP BY delivery_bucket ORDER BY delivery_bucket;

-- Q5: Top 10 customers (window function RANK)
SELECT * FROM (
 SELECT customer_id, city, ROUND(SUM(revenue)) AS spend,
 RANK() OVER (ORDER BY SUM(revenue) DESC) AS rnk
 FROM vw_sales GROUP BY customer_id, city
) t WHERE rnk <= 10;

-- Q6: Do discounts increase basket size?
SELECT discount_pct, COUNT(*) AS orders,
 ROUND(AVG(quantity),2) AS avg_qty, ROUND(AVG(revenue),1) AS avg_order_value
FROM vw_sales GROUP BY discount_pct ORDER BY discount_pct;
