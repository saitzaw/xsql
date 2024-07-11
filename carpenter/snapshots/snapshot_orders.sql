{% snapshot orders_snapshot %}

{{
    config (

        target_database = 'dbt_test',
        target_schema = 'snapshots',
        target_table = 'orders_snapshot',
        unique_key = 'order_id',
        strategy = 'check',
        check_cols = ['subtotal', 'order_total', 'tax_paid']
    )

}}

select * from {{ ref ('stg_orders') }}

{% endsnapshot %}