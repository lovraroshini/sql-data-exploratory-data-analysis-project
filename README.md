# SQL Data Exploratory Data Analysis Project

This project contains a collection of SQL scripts for performing exploratory data analysis (EDA) and generating business reports on a data warehouse built using the **Gold layer** of a Medallion Architecture (Bronze → Silver → Gold).

The dataset revolves around a sales domain, using the following core tables:
- `gold.dim_customers`
- `gold.dim_products`
- `gold.fact_sales`

## 📂 Project Structure

- `scripts/01_database_exploration.sql` — Explore tables and columns in the database
- `scripts/02_dimensions_exploration.sql` — Explore unique values in dimension tables
- `scripts/03_date_range_exploration.sql` — Understand the range of dates in the data
- `scripts/04_measures_exploration.sql` — Calculate key business metrics (totals, averages)
- `scripts/05_magnitude_analysis.sql` — Compare measures across dimensions
- `scripts/06_ranking_analysis.sql` — Rank top/bottom performers (products, customers)
- `scripts/07_change_over_time_analysis.sql` — Analyze trends over time
- `scripts/08_cumulative_analysis.sql` — Calculate running totals and moving averages
- `scripts/09_performance_analysis.sql` — Compare performance against averages and prior periods
- `scripts/10_data_segmentation.sql` — Segment customers and products into groups
- `scripts/11_part_to_whole_analysis.sql` — Analyze proportions and contribution to total
- `scripts/12_report_customers.sql` — Build a consolidated customer report view
- `scripts/13_report_products.sql` — Build a consolidated product report view


## 🎯 Purpose

The goal of this project is to demonstrate SQL skills used in real-world data analytics work, including:

- Data exploration and profiling
- Aggregations and business metrics
- Window functions (ranking, running totals, year-over-year comparisons)
- CTEs (Common Table Expressions) for building layered queries
- Customer and product segmentation logic
- Building reusable report views (`CREATE VIEW`) that consolidate key KPIs

## 📊 Key Reports

### Customer Report (`gold.report_customers`)
Consolidates customer-level metrics and behaviors, including:
- Age groups and customer segments (VIP, Regular, New)
- Total orders, sales, quantity, products, and lifespan
- Recency, average order value, and average monthly spend

### Product Report (`gold.report_products`)
Consolidates product-level metrics and behaviors, including:
- Product segments (High-Performers, Mid-Range, Low-Performers)
- Total orders, sales, quantity sold, and unique customers
- Recency, average order revenue, and average monthly revenue

## 🛠️ Tools Used
- SQL Server (T-SQL)
- SQL Server Management Studio (SSMS)

## 👩‍💻 About Me
I'm Roshini, a Computer Science and Design graduate from Erode Sengunthar Engineering College, currently building my SQL skills and working toward a role as an SQL Developer. This project is part of my hands-on practice in data analysis, aggregation, and reporting using T-SQL.
