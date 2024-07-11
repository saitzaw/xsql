{% snapshot location_snapshot %}

{{

    config(

        target_database = 'dbt_test',
        target_schema = 'snapshots',
        target_table = 'location_snapshot',
        unique_key = 'location_id',
        strategy = 'timestamp',
        updated_at = 'opened_date'

    )

}}

select * from {{ ref('stg_locations') }}
{% endsnapshot %}