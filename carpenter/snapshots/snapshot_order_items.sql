{% snapshot order_items_snapshot %}
{{

    config (

        target_database = 'dbt_test',
        target_schema = 'snapshots',
        target_table = 'order_items_snapshot',
        unique_key = 'order_item_id',
        strategy = 'check',
        check_cols = ['order_id', 'product_id']
    )

}}

select * from {{ ref ('stg_order_items') }}
{% endsnapshot %}