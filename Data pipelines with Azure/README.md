## Data Integration Pipelines for NYC Payroll Data Analytics

This project develops a data analytics platform on Azure Synapse Analytics to accomplish two primary objectives:

 1. Analyze how the NYC's financial resources are allocated and how much of the city's budget is being devoted to overtime.
 2. Make the data available to the interested public to show how the city’s budget is being spent on salary and overtime pay for all municipal employees.

The source data resides in Azure Data Lake and needs to be processed in a NYC data warehouse in Azure Synapse Analytics. The source datasets consist of CSV files with Employee master data and monthly payroll data entered by various City agencies.

<img width="622" alt="截屏2023-09-05 14 39 13" src="https://github.com/jingxuan091/Data-Integration-Pipelines-for-NYC-Payroll-Data-Analytics/assets/115550007/9f7a3525-8b56-4151-b598-0bcf8481f5f0">

## Data Pipeline Development
Develop data pipelines that exemplify the following attributes:

* Dynamic
  - The pipelines are designed to adapt seamlessly to changing data sources and formats, ensuring flexibility and longevity as data requirements evolve.
* Automation
  - Implementation of automation mechanisms is essential for streamlining data processing workflows, minimizing manual interventions, and bolstering operational efficiency.
* Monitoring
  - Vigilant monitoring is a cornerstone of pipeline management, with real-time tracking to detect and address issues promptly, ensuring the continued reliability of the data infrastructure.

### Project environment
* Azure Data Lake Gen2
* Azure SQL DB
* Azure Data Factory
* Azure Synapse Analytics

### Steps

* Prepare the Data Infrastructure
* Create Linked Services
* Create Datasets in Azure Data Factory
* Create Data Flows
  <img width="1058" alt="截屏2023-09-04 19 49 00" src="https://github.com/jingxuan091/Data-Integration-Pipelines-for-NYC-Payroll-Data-Analytics/assets/115550007/6e9d8177-b9e0-4e71-8bb1-b75c9ead2d28">
* Data Aggregation and Parameterization
* Connect the project to Github

  


