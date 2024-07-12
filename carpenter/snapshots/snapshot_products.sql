{% snapshot products_snapshot %}

{{
    config (

        target_database = 'dbt_test',
        target_schema = 'snapshots',
        target_table = 'products_snapshot',
        unique_key = 'product_id',
        strategy = 'check',
        check_cols = ['product_price', 'product_type']
    )

}}

select * from {{ ref ('stg_products') }}

{% endsnapshot %}