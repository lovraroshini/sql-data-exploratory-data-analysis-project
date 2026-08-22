--Calculate the total sales per mounth 
-- and running total of sales over time
SELECT 
	order_date,
	total_sales,
	SUM(total_sales) OVER(PARTITION BY order_date ORDER BY order_date) AS running_total 
FROM(
SELECT 
	DATETRUNC(MONTH, order_date) AS order_date,
	SUM(sales_amount) AS total_sales 
FROM gold.fact_sales
WHERE DATETRUNC(MONTH, order_date) IS NOT NULL
GROUP BY DATETRUNC(MONTH, order_date)
)t;
