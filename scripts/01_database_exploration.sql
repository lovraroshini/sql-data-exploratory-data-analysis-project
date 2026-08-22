--Explore All Objects in Database
SELECT * FROM INFORMATION_SCHEMA.TABLES

--Explore All Columns in the Database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'gold' AND TABLE_NAME = 'dim_customers'
