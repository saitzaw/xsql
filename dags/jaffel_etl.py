import os
from airflow import DAG
from airflow.utils.task_group import TaskGroup
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta

# DEFAULT PATH 
PROJECT_STG_PATH = '$HOME/xsql/dags/includes/staging'
PROJECT_MART_PATH = '$HOME/xsql/dags/includes/marts'

# dag arguments 
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 7, 12),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# dag definitions 
with DAG(
    'dbt_etl_dags', 
    default_args=default_args, 
    schedule_interval=timedelta(days=1)
    ) as dag:

    # Define dbt tasks using BashOperator

    with TaskGroup(group_id='staging_jaffel_group') as sjg:

        stg_customer_dag = BashOperator(
            task_id='dbt_customer_dag',
            bash_command=f'{PROJECT_STG_PATH}/staging/customers.sh '
        )

        stg_location_dag = BashOperator(
            task_id='dbt_location_dag',
            bash_command=f'{PROJECT_STG_PATH}/locations.sh '
        )

        stg_order_items_dag = BashOperator(
            task_id='dbt_order_items_dag',
            bash_command=f'{PROJECT_STG_PATH}/order_items.sh '
        )

        stg_order_dag = BashOperator(
            task_id='dbt_orders_dag',
            bash_command=f'{PROJECT_STG_PATH}/orders.sh '
        )

        stg_product_dag = BashOperator(
            task_id='dbt_products_dag',
            bash_command=f'{PROJECT_STG_PATH}/products.sh '
        )

        stg_supplies_dag = BashOperator(
            task_id='dbt_supplies_dag',
            bash_command=f'{PROJECT_STG_PATH}/supplies.sh '
        )

        (
        stg_customer_dag 
        >> stg_location_dag 
        >> stg_order_items_dag 
        >> stg_order_dag 
        >> stg_product_dag
        >> stg_supplies_dag
        )
        
    with TaskGroup(group_id='marts_jaffel_group') as mjg:
        mart_customer_dag = BashOperator(
                task_id='marts_customer_dag',
                bash_command=f'{PROJECT_MART_PATH}/customers.sh '
            )
        
        mart_order_items_dag = BashOperator(
                task_id='marts_order_items_dag',
                bash_command=f'{PROJECT_MART_PATH}/order_items.sh '
            )
        
        mart_orders_dag = BashOperator(
                task_id='marts_orders_dag',
                bash_command=f'{PROJECT_MART_PATH}/orders.sh '
            )
        
        mart_products_dag = BashOperator(
                task_id='marts_products_dag',
                bash_command=f'{PROJECT_MART_PATH}/products.sh '
            )
        
        mart_supplies_dag = BashOperator(
                task_id='marts_supplies_dag',
                bash_command=f'{PROJECT_MART_PATH}/supplies.sh '
            )
        
        (
            mart_order_items_dag
            >> mart_orders_dag
            >> mart_customer_dag
            >> mart_products_dag
            >> mart_supplies_dag
        )
    
    sjg >> mjg