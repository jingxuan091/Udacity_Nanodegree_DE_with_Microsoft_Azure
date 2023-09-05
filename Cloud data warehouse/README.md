# Building an Azure Data Warehouse for Bike Share Data Analytics

This project aims to create a data warehousing solution using Azure Synapse Analytics for analyzing Divvy bike-sharing data in Chicago. 
The key objectives include designing a star schema to facilitate data analysis, importing and transforming the data within Synapse, and 
generating reports through Analytics. The project's business outcomes revolve around analyzing ride duration and expenditure patterns, 
considering factors like date and time, station locations, rider age, and membership status. Additionally, there is an extra credit 
component for assessing spending patterns based on a member's ride frequency and monthly bike usage minutes. Ultimately, this project 
seeks to provide valuable insights into Divvy's operational efficiency and user behavior.

The dataset looks like this:

<img width="575" alt="截屏2023-08-03 11 22 55" src="https://github.com/jingxuan091/data_warehousing/assets/115550007/27755fd7-c0d9-44f1-aa3e-cdf78614060d">


## Project environment

* Microsoft Azure
* Python to run the script to load data into a PostgreSQL database on Azure to simulate your OLTP data source
* Visual studio code


## Steps

* Step 1: Create Azure resources
  - Create an Azure Database for PostgreSQL.
  - Create an Azure Synapse workspace.
  - Use the built-in serverless SQL pool and database within the Synapse workspace

* Step 2: Design a star schema
  - Create an Azure Database for PostgreSQL.
  - Create an Azure Synapse workspace.
  - Use the built-in serverless SQL pool and database within the Synapse workspace

* Step 3: Create the data in PostgreSQL
  - script: postgreSQL.ipynb

* Step 4: ELT
  - Extract: extract data from PostgreSQL
    - In Azure Synapse workspace, create a one-time pipeline that ingests the data from PostgreSQL into Azure Blob Storage

  - Load: Load the data into external tables in the data warehouse
    - Scripts: Load1.txt, Load2.txt, Load3.txt, Load4.txt

  - Transform: transform the data to the star schema using CETAS
    - Write SQL scripts to transform the data from the staging tables to the final star schema
    - scipts: dimDate.sql, dimRider.sql, dimStation.sql, factPayment.sql, factTrip.sql


## Database schema
<img width="822" alt="截屏2023-09-05 11 37 23" src="https://github.com/jingxuan091/data_warehousing/assets/115550007/139f64d7-4344-49af-aa8d-cb356d516999">

### Staging tables
* staging_trip
* staging_station
* staging_rider
* staging_payment

### Fact tables
* factPayment
* factTrip

### Dimension tables
* dimRider
* dimDate
* dimStation


