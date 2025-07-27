# 🛒 SmartStore: Enterprise Retail Data Platform (SQL Server Project)

## Overview
SmartStore is a full-scale SQL Server project that simulates the backend of a smart retail e-commerce system. It handles inventory management, sales transactions, employee tracking, and ETL-based data processing using realistic business data.

## 🔧 Tech Stack
- SQL Server (T-SQL)
- SSMS
- ETL (Staging + Transformation)
- Performance Tuning
- Power BI Ready

## 📁 Schemas and Structure

### 1. `inventory` schema
- Tracks over 500+ unique products (iPhone 14, Dell XPS, etc.)
- 8 store locations (e.g., Mumbai, Delhi)
- Stock levels, prices, categories

### 2. `hr` schema
- 200+ employee records with departments, roles, and store assignments
- Tracks regional workforce distribution

### 3. `sales` schema
- 1,00,000+ customer records
- **8,00,000+ rows** in `orderdetails` for transaction-level analysis
- Includes order dates, store-level sales, product IDs

### 4. `stagging` schema (ETL)
- Used to load raw CSV data
- Cleans and transforms using `TRY_CAST`, `TRIM`, `ISDATE`, `XACT_STATE`, and transactional control
- Loads clean data into main tables

## 📈 Key Features
- Complex ETL logic and error handling
- Transaction-safe data loads with `BEGIN TRY...CATCH`
- Data cleaning for malformed scores, emails, and addresses
- Denormalized 1NF-style exports for reporting
- Power BI dashboard-ready with clean schema joins

## 📊 Example KPIs
- 🏆 Best-selling products by region
- 💰 Monthly sales totals by store
- 👥 Top 10 customers by revenue

## 🚀 Performance & Optimization
- Used indexes and execution plan analysis for tuning
- Efficient joins between 8L+ row tables
- Created summary views for quick reporting

## 📂 Sample Data Volumes
| Table             | Rows        |
|------------------|-------------|
| `sales.orderdetails` | 8,00,000     |
| `sales.customers`    | 1,00,000     |
| `inventory.products` | 500+         |
| `hr.employees`       | 200+         |

---

## 👨‍💻 Author
**Prashant Singh**  
SQL Developer | Data Engineering Enthusiast  
[LinkedIn Profile](https://www.linkedin.com/in/YOUR-ID)

