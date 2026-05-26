## Inverter Performance Analysis – SQL Project

## Overview

This project focuses on analyzing inverter performance data from a 100 MW solar power plant using SQL queries. The analysis includes KPI monitoring, inverter ranking, block-wise performance comparison, deviation analysis, and identification of best/worst performing inverters.

The project demonstrates practical SQL skills used in solar plant operations and performance monitoring.

---

# Objectives

* Analyze inverter-specific performance
* Identify top and underperforming inverters
* Compare block-wise generation trends
* Calculate plant average specific yield
* Rank inverters based on performance
* Categorize inverter performance dynamically
* Perform deviation analysis from plant average

---

# Technologies Used

* SQL
* MySQL
* Window Functions
* CTEs (Common Table Expressions)
* Aggregate Functions
* CASE Statements
* Joins

---

# Database Tables Used

| Table Name           | Description                                             |
| -------------------- | ------------------------------------------------------- |
| inverter_performance | Stores inverter-wise generation and specific yield data |
| blocks               | Contains block information                              |
| block_kpi            | Stores block-level KPI details                          |
| v_block_summary      | Summary view for block analysis                         |

---

# Key SQL Concepts Implemented

## 1. Aggregate Functions

Used:

* AVG()
* ROUND()
* COUNT()

Purpose:

* Plant average calculation
* Block-wise performance analysis

---

## 2. Window Functions

Used:

* RANK() OVER()

Purpose:

* Overall inverter ranking
* Performance comparison

---

## 3. Common Table Expressions (CTEs)

Used for:

* Top performing block analysis
* Simplifying complex queries

---

## 4. CASE Statements

Used for:

* Dynamic performance grading
* Categorizing inverters as:

  * Excellent
  * Good
  * Poor

---

## 5. Joins

Used:

* INNER JOIN

Purpose:

* Combine block and KPI data
* Fetch meaningful operational insights

---

# Features Implemented

## Top 5 Best Performing Inverters

Fetches highest specific yield inverters.

## Worst Performing Inverters

Identifies lowest yielding inverters.

## Plant Average Yield

Calculates overall plant specific yield.

## Block-wise Average Yield

Compares block performance.

## Above Average Inverters

Finds inverters performing above plant average.

## Performance Categorization

Classifies inverter performance dynamically.

## Deviation Analysis

Calculates percentage deviation from plant average.

## Overall Inverter Ranking

Ranks all inverters using SQL window functions.

---

# Sample Query

```sql
SELECT inverter_id,
       block_no,
       specific_yield,
       RANK() OVER(ORDER BY specific_yield DESC) AS overall_rank
FROM inverter_performance;
```

---

# Learning Outcomes

Through this project:

* Improved SQL query writing skills
* Learned practical industrial KPI analysis
* Understood solar plant performance monitoring
* Applied SQL window functions in real datasets
* Built analytical thinking for O&M operations

---

# Practical Industrial Use Cases

This project can be used for:

* Solar plant monitoring
* O&M performance analysis
* Daily generation reporting
* SCADA performance tracking
* Fault identification
* Management dashboard support

---

# Future Improvements

Potential enhancements:

* Power BI dashboard integration
* Real-time SCADA connectivity
* Automated alert generation
* Predictive maintenance analytics
* Python-based anomaly detection

---

# Author

Dheeraj Choudhary

Graduate Engineer Trainee (GET)
Avaada Energy – 100 MW Solar Plant
