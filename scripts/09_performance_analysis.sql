/* Analyze the yearly performance of products by comparing each product sales to both
its average sales performane and previous year's sales */
WITH yearly_product_sales AS
(
SELECT 
	p.product_name,
	YEAR(s.order_date) AS order_year,
	SUM(s.sales_amount) AS current_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key
WHERE p.product_name IS NOT NULL
GROUP BY
	YEAR(s.order_date),
	P.product_name
)

SELECT 
	order_year,
	product_name,
	current_sales,
	AVG(current_sales) OVER(PARTITION BY product_name) AS avg_sales,
	current_sales - AVG(current_sales) OVER(PARTITION BY product_name) AS diff_avg,
	CASE WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name) <0 THEN 'Below Avg'
		 WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name) >0 THEN 'Above Avg'
		 ELSE 'Avg'
	END AS avg_change,
	--year-over-year Analysis
	LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) AS py_sales,
	AVG(current_sales) OVER(PARTITION BY product_name) - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) AS dif_py,
	CASE WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) <0 THEN 'Decrease'
		 WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) >0 THEN 'Increase'
		 ELSE 'No Change'
	END AS py_change
FROM yearly_product_sales
ORDER BY
	product_name,
	order_year
