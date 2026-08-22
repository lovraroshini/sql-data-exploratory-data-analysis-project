--which 5 products generate the highest revenue
SELECT TOP 5
	p.product_name,
	SUM(s.sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_sales DESC

--what are the 5 worst-performing products in term of sales
SELECT TOP 5
	p.product_name,
	SUM(s.sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_sales 

--If you are generating more complex reports use 'Window Functions'
SELECT *
FROM(
SELECT 
	p.product_name,
	SUM(s.sales_amount) AS total_revenue,
	ROW_NUMBER() OVER(ORDER BY SUM(s.sales_amount) DESC) AS rank_products
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key
GROUP BY p.product_name
)t
WHERE rank_products <=5;

--Find top 10 customers who have generated the highest revenue
SELECT * FROM(
SELECT 
	c.customer_key,
	c.first_name,
	c.last_name,
	SUM(s.sales_amount) AS total_revenue,
	ROW_NUMBER() OVER(ORDER BY SUM(s.sales_amount) DESC) AS rank_sales
FROM gold.fact_sales AS s
LEFT JOIN gold.dim_customers AS c
ON c.customer_key = s.customer_key
GROUP BY
	c.customer_key,
	c.first_name,
	c.last_name
)t
WHERE rank_sales <= 10

--and 3 customers with the fewest orders placed
SELECT * FROM(
SELECT 
	c.customer_key,
	c.first_name,
	c.last_name,
	COUNT(DISTINCT s.order_number) AS total_orders,
	ROW_NUMBER() OVER(ORDER BY COUNT(s.order_number)) AS rank_products
FROM gold.fact_sales AS s
LEFT JOIN gold.dim_customers AS c
ON s.customer_key = c.customer_key
GROUP BY
	c.customer_key,
	c.first_name,
	c.last_name
)t
WHERE rank_products<= 3
