# 🛒 Brazilian E-Commerce SQL Analysis

## 📌 Project Overview

This project focuses on analyzing a Brazilian E-Commerce dataset using SQL to uncover valuable business insights related to:

* Customer behavior
* Sales growth trends
* Delivery performance
* Freight analysis
* Payment methods
* Regional order distribution

The analysis demonstrates practical SQL skills used in real-world data analytics and business intelligence projects.

---

# 🎯 Objectives

The main objectives of this project were:

* Perform exploratory data analysis (EDA)
* Analyze yearly and monthly order trends
* Study customer distribution across Brazil
* Evaluate delivery performance
* Analyze freight and payment behavior
* Generate business insights using SQL

---

# 🗂️ Datasets Used

The project uses multiple relational datasets from a Brazilian E-Commerce platform.

| Dataset       | Description                                     |
| ------------- | ----------------------------------------------- |
| customers     | Customer details including city and state       |
| geolocation   | Geographic coordinates and zip code information |
| orders        | Order timestamps, status, and delivery dates    |
| order_items   | Product price and freight value details         |
| order_reviews | Customer review scores and comments             |
| payments      | Payment types, installments, and payment values |
| products      | Product category information                    |
| sellers       | Seller details and seller locations             |

---

# 🧩 Database Relationships

The datasets are connected using common keys:

* `customer_id` → connects customers and orders
* `order_id` → connects orders, payments, reviews, and order_items
* `product_id` → connects products and order_items
* `seller_id` → connects sellers and order_items

These relationships enable complete end-to-end business analysis.

---

# 🛠️ SQL Concepts Used

This project includes extensive use of SQL concepts such as:

* SELECT Statements
* INNER JOIN
* GROUP BY
* ORDER BY
* Aggregate Functions

  * COUNT()
  * SUM()
  * AVG()
  * ROUND()
* Date Functions

  * EXTRACT()
  * DATE_DIFF()
* CASE Statements
* Common Table Expressions (CTEs)
* Window Functions

  * LEAD()
* UNION ALL
* Filtering & Sorting

---

# 📊 Analysis Performed

## 1️⃣ Exploratory Data Analysis (EDA)

### Tasks Performed

* Explored dataset structure
* Checked sample records from tables
* Identified order date range
* Analyzed customer cities and states

### Key Insights

* Dataset spans multiple years
* Customers belong to various Brazilian states and cities

---

## 2️⃣ Order Trend Analysis

### ✔ Yearly Growth in Orders

Analyzed the growth of orders over the years.

### Insight

* Orders increased significantly since 2016
* Indicates strong growth in e-commerce adoption

---

## 3️⃣ Monthly Seasonality Analysis

### Objective

Identify high and low performing months.

### Insight

* August and May recorded the highest order counts
* October and November showed relatively lower performance

---

## 4️⃣ Time-of-Day Analysis

### Time Categories

* Dawn (0–6 hrs)
* Morning (7–12 hrs)
* Afternoon (13–18 hrs)
* Night (19–23 hrs)

### Insight

* Most orders were placed during Afternoon hours
* Dawn had the lowest ordering activity

---

## 5️⃣ State-wise E-Commerce Analysis

### Analysis Included

* Month-on-month orders by state
* Customer distribution across states

### Insight

* São Paulo (SP) had the highest customer base
* Regional order behavior varied across states

---

## 6️⃣ Economic Impact Analysis

### Analysis Included

* Percentage increase in order cost
* Total & average order value by state
* Freight value analysis

### Key Findings

* Order value increased by over 100% from 2017 to 2018
* Freight charges vary significantly across regions

---

## 7️⃣ Delivery Performance Analysis

### Metrics Calculated

* Delivery time
* Estimated vs actual delivery difference

### Insight

* Helps identify delayed deliveries
* Useful for logistics performance evaluation

---

## 8️⃣ Payment Analysis

### Analysis Included

* Orders by payment type
* Installment-based order analysis

### Insight

* Many customers preferred single-installment payments

---
# ✅ Additional Sections to Add in README

## 📍 Customer Location Analysis

### Objective

Count the number of cities and states from which customers placed orders during the given period.

### Analysis

* Joined `customers` and `orders` tables
* Extracted customer cities and states
* Filtered orders based on required time period

### Insight

* Customers are distributed across multiple Brazilian cities and states
* Indicates wide regional penetration of the e-commerce platform

---

# 🚚 Fast Delivery Performance Analysis

## Objective

Identify the top 5 states where actual deliveries were significantly faster than estimated delivery dates.

### Formula Used

```sql id="qmf9z7"
delivery_difference =
actual_delivery_date - estimated_delivery_date
```

### Analysis

* Calculated the difference between actual and estimated delivery dates
* Computed average delivery difference for each state
* Ranked states with fastest deliveries

### Insight

* Certain states consistently delivered products earlier than expected
* Indicates efficient logistics and fulfillment operations in those regions

---

# 📌 Problem Statement Coverage

This project successfully addresses all the questions mentioned in the assignment, including:

✔ Exploratory Data Analysis (EDA)
✔ Order Trend Analysis
✔ Monthly Seasonality Analysis
✔ Time-of-Day Order Analysis
✔ State-wise E-Commerce Analysis
✔ Economic Impact Analysis
✔ Freight & Delivery Analysis
✔ Fast Delivery State Analysis
✔ Payment & Installment Analysis

---

# 🧠 Business Recommendations

Based on the analysis, the following recommendations can help improve business performance:

* Focus marketing campaigns during high-performing months
* Improve logistics efficiency in slow-delivery regions
* Optimize freight costs for high-expense states
* Encourage preferred payment methods for smoother transactions
* Use customer distribution insights for regional expansion planning


---

# 💻 Tools & Technologies

| Tool                         | Purpose                      |
| ---------------------------- | ---------------------------- |
| SQL                          | Data querying and analysis   |
| Google BigQuery              | Database and query execution |
| Relational Database Concepts | Data modeling and joins      |

---

# 📁 Project Structure

```bash id="ih5pj7"
📦 Brazilian-Ecommerce-SQL-Analysis
 ┣ 📂 datasets
 ┃ ┣ 📜 customers.csv
 ┃ ┣ 📜 geolocation.csv
 ┃ ┣ 📜 order_items.csv
 ┃ ┣ 📜 order_reviews.csv
 ┃ ┣ 📜 orders.csv
 ┃ ┣ 📜 payments.csv
 ┃ ┣ 📜 products.csv
 ┃ ┗ 📜 sellers.csv
 

---

# 🚀 Learning Outcomes

Through this project, I improved my understanding of:

* Writing complex SQL queries
* Business-oriented data analysis
* Time-series analysis
* Window functions and CTEs
* Relational database handling
* Data storytelling using SQL

---

# ⭐ Conclusion

This project demonstrates how SQL can be used to perform comprehensive business analysis on large-scale e-commerce datasets. The insights generated can help businesses improve:

* Customer understanding
* Logistics efficiency
* Payment strategies
* Sales performance
* Regional operations

---

# 🙌 Connect With Me

Meenakshi Rajpurohit
