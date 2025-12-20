# walmart_data_engineering_and_analytics_project
A project that incorporates Snowflake, DBT, Python and Tableau manipulate and analyze Walmart data.

This project demonstrates a complete, end-to-end data engineering and business intelligence pipeline for analyzing Walmart's weekly sales data. It showcases the integration of modern data tools to ingest, transform, and visualize data, turning raw numbers into actionable business insights.

**Author:** Janet Mwangi 

## Table of Contents

- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Project Architecture](#project-architecture)
- [Key Business Questions](#key-business-questions)
- [Setup and Installation](#setup-and-installation)
- [Running the Project](#running-the-project)
- [dbt Project Structure](#dbt-project-structure)
- [Key Visualizations](#key-visualizations)
- [Contact](#contact)

---

## Project Overview

This project analyzes historical sales data from 45 Walmart stores across various departments. The goal is to identify key drivers of sales, understand the impact of external factors like economic indicators and weather, and uncover seasonal trends. The implementation follows data engineering best practices, including version-controlled data transformations and automated data modeling.

## Technologies Used

- **Data Warehouse:** [Snowflake](https://www.snowflake.com/en/) (Cloud Data Platform)
- **Data Transformation:** [dbt (data build tool)](https://www.getdbt.com/) for SQL-based data modeling, testing, and documentation.
- **Data Analysis & Visualization:** [Python](https://www.python.org/) in a [Jupyter Notebook](https://jupyter.org/) environment.
- **Python Libraries:**
  - `pandas` for data manipulation.
  - `matplotlib` & `seaborn` for static visualizations.
  - `snowflake-connector-python` for connecting to Snowflake.
  - `python-dotenv` for environment variable management.

## Project Architecture

The project follows a modern ELT (Extract, Load, Transform) architecture:

1.  **Extract/Load:** Raw CSV data is loaded into a `RAW_DATA` schema in Snowflake.
2.  **Transform:** dbt connects to Snowflake to run a series of SQL models that clean, transform, and structure the data. This includes:
    - **Staging Models:** Basic cleaning, casting data types, and renaming columns.
    - **Dimension Models:** Creating dimension tables for stores and dates using SCD1 (Slowly Changing Dimension Type 1) logic.
    - **Fact Model:** Creating a fact table for sales transactions using SCD2 (Slowly Changing Dimension Type 2) logic via dbt snapshots to track historical changes.
3.  **Analyze/Present:** A Python script in a Jupyter Notebook connects to the final transformed tables in Snowflake to perform analysis and generate visualizations.


## Key Business Questions

This analysis aims to answer several key business questions:

1.  How do sales vary across different store types (A, B, C)?
2.  What are the seasonal trends in sales (monthly, quarterly)?
3.  Which departments are the top performers?
4.  Is there a correlation between sales and external factors like fuel price, temperature, and unemployment?
5.  What is the impact of promotional markdowns on sales?

---

## Setup and Installation

Follow these steps to set up and run the project locally.

### Prerequisites

- A [Snowflake](https://signup.snowflake.com/) account.
- A [dbt Cloud](https://www.getdbt.com/signup/) account (Free Developer plan is sufficient).
- [Python 3.8+](https://www.python.org/downloads/) installed on your local machine.
- [Git](https://git-scm.com/downloads) installed on your local machine.

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### 2. Set up Snowflake

- Log in to your Snowflake account.
- Create a new database and schema for the raw data (e.g., `WALMART_ANALYTICS` and `RAW_DATA`).
- Create the `STORES`, `DEPARTMENT`, and `FACT` tables using the SQL commands in the [Technical Report](link-to-your-report.md).
- Load the provided CSV files into these tables.

### 3. Set up dbt Cloud

- Create a new project in dbt Cloud.
- Connect it to your forked GitHub repository.
- Configure the connection to your Snowflake account.
- Set up a Development environment.

### 4. Set up Python Environment

It is recommended to use a virtual environment.

```bash
# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
.\venv\Scripts\activate

# Install required packages
pip install -r requirements.txt
```

*(You will need to create a `requirements.txt` file from the notebook or install packages manually)*

### 5. Configure Environment Variables

Create a `.env` file in the root directory of the project and add your Snowflake credentials. This file is git-ignored for security.

```
SNOWFLAKE_USER="your_snowflake_username"
SNOWFLAKE_PASSWORD="your_snowflake_password"
SNOWFLAKE_ACCOUNT="your_snowflake_account_identifier"
SNOWFLAKE_WAREHOUSE="your_snowflake_warehouse"
SNOWFLAKE_DATABASE="WALMART_ANALYTICS"
SNOWFLAKE_SCHEMA="SNAPSHOTS" # The schema where the final fact table is
```

---

## Running the Project

### 1. Run the dbt Transformations

- In your dbt Cloud IDE, run the following commands:

```bash
# Run all models (staging and dimensions)
dbt run

# Run the snapshot to create the SCD2 fact table
dbt snapshot
```

- This will create the transformed tables and views in your development schema (e.g., `DBT_JMWANGI`) and the snapshot table in the `SNAPSHOTS` schema.

### 2. Run the Jupyter Notebook

- Launch Jupyter Notebook from your terminal:

```bash
jupyter notebook
```

- Open the `walmart_sales_analysis.ipynb` notebook.
- Run all the cells to perform the analysis and generate visualizations.
- The generated PNG images will be saved in the same directory.

---

## dbt Project Structure

- `models/staging/`: Cleans and prepares raw data.
- `models/marts/`: Creates final dimension and fact tables.
- `snapshots/`: Implements SCD2 logic for the fact table.

## Key Visualizations

**Total Sales by Store Type**

![Sales by Store Type](01_sales_by_store_type.png)

**Monthly Sales Trend**
![Monthly Sales Trend](02_monthly_sales_trend.png)

**Correlation Heatmap**
![Correlation Heatmap](05_correlation_heatmap.png)

---

## Contact

Janet Mwangi - https://www.linkedin.com/in/jae-m-9a492636/

Project Link: https://github.com/Jae15/walmart_data_engineering_and_analytics_project
