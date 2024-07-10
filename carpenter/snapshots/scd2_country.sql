{% snapshot scd2_country %}
{{
    config(
        target_database = 'dbt_test',
        target_schema = 'covid',
        target_table = 'scd2_country',
        unique_key = 'code',
        strategy = 'check',
        check_cols = ['intermediate_region']
    )
}}
select * from {{ref ('stg_country')}}
{% endsnapshot %}