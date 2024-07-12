import os
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta

# dag arguments 
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 7, 12),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# dag definitions 
dag = DAG(
    'dbt_daily_dag', 
    default_args=default_args, 
    schedule_interval=timedelta(days=1)
    )

# Define dbt tasks using BashOperator
snapshots = BashOperator(
    task_id='dbt_task2',
    bash_command='$HOME/xsql/dags/includes/snapshots/snapshots.sh ',
    dag=dag
)
