
# 📊 **Walmart Sales Data Analysis**

This project is an **end-to-end data analysis case study** built using **Python**, **SQL**, and **Power BI**, focusing on **Walmart sales data**. The project aims to **extract valuable business insights**, **identify sales patterns**, and **visualize key metrics** through an interactive dashboard.

---

## 🛠️ **Tools & Technologies Used**

- **Python (Pandas)** – For data cleaning and transformation
- **MySQL** – For advanced data analysis using SQL
- **Power BI** – For creating interactive visual dashboards
- **Jupyter Notebook** – For running and documenting the Python script

---

## 📂 **Project Files**

```
├── walmart_sales_data_cleaning.py       # Python script for cleaning and MySQL export
├── walmart_sql_analysis.sql             # SQL queries for insights and analysis
├── Walmart_sales_analysis_powerbi_report.pbix  # Power BI dashboard
├── Walmart_Cleaned_Data.csv             # Cleaned dataset output
└── README.md                            # Project documentation
```

---

## 📊 **Project Workflow**

### **1. Data Cleaning with Python**
- **Removed duplicates** and **null values**
- **Converted** `unit_price` **from string to float**
- **Converted date and time columns** to appropriate data types
- **Created new metric**: `total_price = unit_price * quantity`
- **Exported cleaned dataset** to **MySQL database**

### **2. SQL-Based Business Analysis**
**Key business problems solved:**

1. **What is the total revenue generated?**
2. **How many unique branches are there?**
3. **What are the most commonly used payment methods?**
4. **What is the average customer rating?**
5. **How many transactions and total items were sold per payment method?**
6. **Which product category has the highest average rating in each branch?**
7. **What is the busiest day of the week for each branch?**
8. **Which branch has the highest and lowest total sales?**
9. **Which product category generates the highest profit in each city?**
10. **What are the off-peak shopping hours?**
11. **How does weekday vs weekend sales performance compare?**
12. **Which day of the week generates the most revenue across all branches?**
13. **How have customer ratings changed over time (monthly or yearly)?**

### **3. Visualization with Power BI**
Created an **interactive dashboard** that includes:
- **KPI Cards for Important Insights** – Display Total Revenue, Average Rating, and Total Transactions
- **Sales comparison** between **weekdays and weekends**
- **Top 5 Branches by Average Revenue** – Highlights the top-performing branches based on average revenue per transactioN
- **Average Rating by Category** – Shows customer satisfaction trends across categories using average ratings
- **Average Revenue by Month** – Displays monthly revenue trends to identify seasonal performance patterns
  
- **Dynamic filters and slicers** for enhanced exploration

---

## 🔍 **Key Insights**

- **WALM003** had the **highest total revenue**
- **E-wallets** were the **most preferred payment method**
- **Weekdays** showed **higher sales** than weekends
- **Yangon** was the **city with the most profitable category**
- **Off-peak hours** were between **8 AM – 10 AM**

---

## 🌟 **Business Value**

- **Enabled identification** of **high/low-performing branches and products**
- **Helped pinpoint customer preferences** and **sales behavior**
- **Delivered data-driven recommendations** for **staffing and inventory planning**
## 📷 Dashboard Preview

![Power BI Dashboard](dashboard.png)

