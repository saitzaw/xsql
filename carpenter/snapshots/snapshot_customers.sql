{% snapshot customers_snapshot %}

{{

    config(

        target_database = 'dbt_test',
        target_schema = 'snapshots',
        target_table = 'customer_snapshot',
        unique_key = 'customer_id',
        strategy = 'check',
        check_cols = ['customer_id', 'customer_name']

    )
    
}}

select * from {{ ref('stg_customers') }}

{% endsnapshot %}