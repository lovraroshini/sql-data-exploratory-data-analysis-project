--First order and last order
SELECT 
DATEDIFF(year,first_orderdate, last_orderdate) 
FROM(
SELECT MIN(order_date) AS first_orderdate,
MAX(order_date) AS last_orderdate
FROM gold.fact_sales --you can use it without subquery aswell
)t

--Youngest and Oldest Customers
SELECT 
	MIN(birthdate) AS oldest_birthdate,
	MAX(birthdate) AS youngest_birthdate,
	DATEDIFF(YEAR,MIN(birthdate), GETDATE()) AS oldest_age,
	DATEDIFF(YEAR,MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers
