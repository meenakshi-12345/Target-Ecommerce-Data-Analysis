# 🛒 Target E-Commerce SQL Analysis Project

## 📌 Project Overview

This project analyzes a Brazilian E-Commerce dataset using SQL to uncover valuable business insights related to:

* Customer behavior
* Sales trends
* Order growth
* Delivery performance
* Freight costs
* Payment analysis
* Regional customer distribution

The project simulates a real-world business case where a Data Analyst at Target is tasked with extracting actionable insights from e-commerce data.

---

# 🎯 Problem Statement

Assuming the role of a Data Analyst/Data Scientist at Target, the objective was to analyze the provided e-commerce dataset and answer important business questions regarding:

* Customer distribution
* Order trends
* Seasonal sales behavior
* Delivery efficiency
* Freight performance
* Payment methods
* Economic impact of e-commerce

---

# 🗂️ Datasets Used

The project uses multiple relational datasets.

| Dataset       | Description                                     |
| ------------- | ----------------------------------------------- |
| customers     | Customer details including city and state       |
| geolocation   | Geographic coordinates and zip code information |
| orders        | Order timestamps, status, and delivery dates    |
| order_items   | Product prices and freight values               |
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

These relationships enable complete end-to-end e-commerce analysis.

---

# 🛠️ SQL Concepts Used

This project demonstrates practical usage of:

* SELECT Statements
* INNER JOIN
* GROUP BY & ORDER BY
* Aggregate Functions
* Date Functions
* CASE Statements
* Common Table Expressions (CTEs)
* Window Functions
* UNION ALL
* Filtering & Sorting

---

# 📊 Analysis Performed

---

## 1️⃣ Exploratory Data Analysis (EDA)

### Tasks Performed

* Checked dataset structure
* Previewed records from tables
* Identified order time range
* Analyzed customer cities and states

### Key Insights

* Orders span across multiple years
* Customers belong to several Brazilian states and cities

---

## 2️⃣ Order Trend Analysis

### ✔ Yearly Order Growth

Analyzed whether orders increased over time.

### Insight

* Orders grew significantly since 2016
* Indicates strong e-commerce growth

---

## 3️⃣ Monthly Seasonality Analysis

### Objective

Identify high and low performing months.

### Insight

* August and May had the highest order volumes
* October and November performed relatively lower

---

## 4️⃣ Time-of-Day Order Analysis

### Time Categories

* Dawn (0–6 hrs)
* Morning (7–12 hrs)
* Afternoon (13–18 hrs)
* Night (19–23 hrs)

### Insight

* Most orders were placed during Afternoon hours
* Dawn had the least activity

---

## 5️⃣ State-wise E-Commerce Analysis

### Analysis Included

* Month-on-month orders by state
* Customer distribution across states

### Insight

* São Paulo (SP) had the highest customer count
* Regional ordering behavior varies significantly

---

## 6️⃣ Economic Impact Analysis

### Analysis Included

* Percentage increase in order value
* Total & average order price by state
* Freight value analysis

### Key Findings

* Order payments increased by over 100% from 2017 to 2018
* Freight charges differ significantly across regions

---

## 7️⃣ Delivery Performance Analysis

### Metrics Calculated

* Delivery time
* Estimated vs actual delivery difference

### Insight

* Helps identify delayed deliveries
* Useful for logistics optimization

---

## 8️⃣ Fast Delivery State Analysis

### Objective

Identify states where deliveries were faster than estimated dates.

### Insight

* Some states consistently delivered earlier than expected
* Reflects strong logistics efficiency in those regions

---

## 9️⃣ Payment Analysis

### Analysis Included

* Orders by payment type
* Installment-based order analysis

### Insight

* Most customers preferred single-installment payments

---

# 📈 Key Business Insights

* Brazilian e-commerce experienced strong growth over the years
* Afternoon is the peak ordering period
* São Paulo dominates in customer base and sales
* Delivery and freight performance vary across states
* Seasonal trends can support strategic marketing campaigns
* Logistics efficiency differs regionally

---

# 💻 Tools & Technologies

| Tool                 | Purpose                    |
| -------------------- | -------------------------- |
| SQL                  | Data querying and analysis |
| Google BigQuery      | Database querying          |
| Relational Databases | Data modeling and joins    |

---

# 📁 Project Structure

```bash id="s2p3g1"
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
 ┃
 ┣ 📜 ecommerce_analysis.sql
 ┣ 📜 README.md
 ┣ 📜 LICENSE
 ┗ 📜 insights_and_findings.md
```

---

# 🚀 Learning Outcomes

Through this project, I improved my understanding of:

* Complex SQL querying
* Business-focused analytics
* Window functions and CTEs
* Time-series analysis
* Relational database handling
* Data storytelling using SQL

---

# ⭐ Conclusion

This project demonstrates how SQL can be used to analyze large-scale e-commerce datasets and generate meaningful business insights related to:

* Sales performance
* Customer behavior
* Delivery efficiency
* Freight optimization
* Payment trends

The insights can support better business decision-making and operational improvements.

---

# 🙌 Connect With Me

Meenakshi Rajpurohit 

Gmail : imeenakshii28@gmail.com

<p align="center">
  ⭐ If you found this project interesting, consider giving it a star!
</p>
