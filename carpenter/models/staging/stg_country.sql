
WITH stg_country_data AS (
    SELECT
        region,
        {{'"'}}alpha-2{{'"'}} as code,
        {{'"'}}sub-region{{'"'}} as sub_region,
        {{'"'}}intermediate-region{{'"'}} as intermediate_region
    FROM
        {{ source('dbt_test', 'countries') }}
    WHERE
        region IS NOT NULL
)

SELECT
    *
FROM
    stg_country_data
