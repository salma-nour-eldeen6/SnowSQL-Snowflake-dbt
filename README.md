# SnowSQL-Snowflake-dbt

## Overview
This project demonstrates an end-to-end data engineering workflow using Snowflake and dbt. It covers data ingestion, transformation, and modeling into a data warehouse with a star schema.

---

## Source Data
The dataset used in this project is a **synthetic e-commerce relational dataset**, available on Kaggle:  
[Dataset Link](https://www.kaggle.com/datasets/naelaqel/synthetic-e-commerce-relational-dataset/data)

---

## ERD – Source Tables
The following diagram shows the **structure of the source tables**:

<img width="1484" height="714" alt="Source ERD" src="https://github.com/user-attachments/assets/e817efd3-d922-49b3-9f58-45e662742b6e" />

---

## ERD – Data Warehouse (DWH)
The following diagram shows the **star schema in the data warehouse** with fact and dimension tables:

<img width="1405" height="702" alt="DWH ERD" src="https://github.com/user-attachments/assets/2e2d583b-00ce-49c9-836f-b5628a43a098" />

---

## Tools & Workflow
- **Snowflake**: Data storage and query engine  
- **dbt**: Data transformation and modeling  
- **SnowSQL**: Used for loading and manipulating source data  
- **dbt Models**:
  - Staging Models (`stg_`)  
  - Fact and Dimension Models (`fact_`, `dim_`)  
- **Tests & Snapshots**: Implemented to ensure data quality

---

## Project Steps
1. Explore and understand the source data  
2. Build the data pipeline from ingestion to transformations  
3. Connect dbt with Snowflake and configure profiles  
4. Create staging models to clean and standardize source tables  
5. Build final fact and dimension tables for the data warehouse  
6. Implement tests and snapshots to ensure data integrity

