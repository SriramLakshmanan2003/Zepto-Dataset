# Zepto-Dataset
SQL project on Zepto dataset covering database creation, schema design, data cleaning, and analysis. Includes queries for stock status, revenue, discounts, and product insights — showcasing practical MySQL for data cleaning and business analysis.
# 🛒 Zepto SQL Project

This project demonstrates how to create, clean and analyze a Zepto retail dataset using MySQL.  
It includes schema design, data cleaning and analytical queries to generate insights from product and sales data.

---

📂 Project Overview
The SQL file covers:
  - Creating a database and table with proper schema
  - Renaming columns and correcting datatypes
  - Handling missing values
  - Adding new columns
  - Cleaning data (e.g., normalizing MRP, fixing discounts)
- Analytical queries for:
  - Stock vs Out-of-Stock products
  - Unique categories
  - Revenue by category
  - Top discounted products
  - Weight-based categorization
  - Price per gram analysis

---

📖 Key Learnings
From this project, I learned:

🔹 Python + Pandas
  - Converting CSV file encoding from **Latin-1 → UTF-8**  
  - Replacing `TRUE` & `FALSE` with **tinyint (1/0)** using Pandas `replace()`  
  - Inserting cleaned data into MySQL using Python automation  

🔹 MySQL
- Different ways to import CSV into MySQL tables:
    1. `LOAD DATA INFILE` (fastest for bulk load)  
    2. Workbench Import Wizard (GUI-based)  
    3. Python automation (`executemany`, `to_sql`)
      
- Why **`DISTINCT` with `ORDER BY`** throws error **3065** if the column is not in the `SELECT` list  
  👉 Without including that column in `DISTINCT`, ambiguity happens  

---

📌 Insights Example

1.Top 10 Discounted Products

2.Out-of-Stock Products with Highest MRP

3.Revenue by Category

4.Price per Gram Calculation

5.Weight-based Category Segmentation

✨ Conclusion
This project strengthened my skills in:

-Data cleaning and transformation with SQL

-Writing analytical queries for business insights

-Integrating Python (ETL) with MySQL for automation
