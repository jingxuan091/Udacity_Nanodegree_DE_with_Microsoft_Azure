# Project: Data Modeling with Apache Cassandra


This project models user activity data using Apache Cassandra on a new music streaming app called Sparkify, to understand what songs
users are listening to.

## Steps
### Modeling Apache Cassandra database 
  1. Design tables to answer the queries outlined in the project template
  2. Write Apache Cassandra CREATE KEYSPACE and SET KEYSPACE statements
  3. Develop your CREATE statement for each of the tables to address each question
  4. Load the data with INSERT statement for each of the tables
  5. Include IF NOT EXISTS clauses in your CREATE statements to create tables only if the tables do not already exist. 
  6. Test by running the proper select statements with the correct WHERE clause

### Build ETL Pipeline
  1. Implement the logic in section Part I of the notebook template to iterate through each event file in event_data to process and create a new CSV file in Python
  2. Use Apache Cassandra CREATE and INSERT statements to load processed records into relevant tables in the data model
  3. Test by running SELECT statements after running the queries on the database
