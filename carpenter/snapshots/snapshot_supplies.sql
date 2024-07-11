{% snapshot supplies_snapshot %}

{{
    config (

        target_database = 'dbt_test',
        target_schema = 'snapshots',
        target_table = 'supplies_snapshot',
        unique_key = 'supply_uuid',
        strategy = 'check',
        check_cols = ['supply_cost']
    )

}}

select * from {{ ref ('stg_supplies') }}

{% endsnapshot %}