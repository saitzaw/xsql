# xsql
## Project description 
- For low cost end to end data pipeline 
- Using Open source technology to compute data 
- Easy to modified report based on business team request
- Save hisotrical data for business user and analystic team
- Support Data analytical support using Jupyter notebook 
- To improve Data Goverence
- Use open source solution [highly depend on the Apache Software foundation]
- To get high available (HA)
- For medium size company, I would suggest cloud solution
- This repo is not for production 

## Operation system 
- GNU/Linux [Ubuntu 22.04]

## Setup time 
- setup time 
- setup GNU/Linux VM or on-premise it will take around 30 mins 
- setup on AWS EC2 it will take around 5 mins
- setup pyenv [best case -> 30 mins, worst case -> whole day]
- setup poetry [best case -> 30 mins, worst case -> whole day]


# Tools list for xsql
- modeling: DBT tool
- scheduling: Apache Airflow
- orchestration: Apache Airflow
- Analytical queires: Apache Spark
- data versions: Delta table 
- Dashboard: Apache superset

## Data pipeline 
- ETL for archived data and traditional report data
- ELT for urget and ad-hoc report

## Warehouse 
- Lakehouse
- Data mart

## Database system 
- MySQL
- PostgreSQL
- MongoDB

## report and Data marts
- PostgreSQL

## Programming language 
- Python [3.9.15]

# Installation process 
- python
- dbt 
- airflow

## Python version and package manager
- install pyenv 
- install poetry 

## dbt installation  
- poetry add dbt-core dbt-postgres

# airflow installation 
- poetry add apache-airflow
Note: change python version "^3.9" to "~3.9"

# folder strucutre 
- Perfer DBT run in Carpenter directory 
- Perfer Airflow run in airflow folder 

## quick installation 
- git clone git@github.com:saitzaw/xsql.git
- poetry install 

## create a postgresql user for airflow
- sudo -u postgres psql
- CREATE DATABASE airflow;
- CREATE USER airflow_user WITH ENCRYPTED PASSWORD 'airflow123';
- GRANT ALL PRIVILEGES ON DATABASE airflow TO airflow_user;

## Change airflow configuration 
- change the airflow database connector in airflow.cfg
- sql_alchemy_conn = postgresql+psycopg2://airflow_user:airflow123@localhost:5432/airflow

# First time Run
## init the project 
- poetry shell 
- airflow db init 
- airflow users list

## create user
airflow users create \
    --username airflowAdmin \
    --firstname Airflow \
    --lastname Admin \
    --role Admin \
    --email airflow.admin@gmail.com

create-password -> airflow123 

## RUN AIRFLOW SERVER 
airflow webserver --port 8090 -D
airflow scheduler -D

## Airflow 
- run in default path /home/user/airflow
- create a soft link in dev environment for dags 
- ln -s $HOME/xsql/dags $HOME/airflow/


# carpenter
## DBT 
- change directory to carpenter 
- cd carpenter 
## DBT setup 
- dbt init 
- dbt run 

## DBT for seeding 
- dbt seed 

##  DBT seed for specific directory 
- dbt seed --select product_codes
Note: product_codes should save in the dbt_project.yml 


## install required model 
- create a packages.yml same level as dbt_project.yml
- dbt deps

## DBT for specific model run 
- dbt run --models covid_staging.*

## Testing model 
- dbt test

## Snapshot data [using scd type 2]
- create a new schema for historical data
- get data from staging stage
- dbt snapshot

 ## Apache Superset 
 - git clone https://github.com/apache/superset
 - cd superset
 - docker compose -f docker-compose-image-tag.yml up
 - Note: use <host.docker.internal> instead  of localhost




