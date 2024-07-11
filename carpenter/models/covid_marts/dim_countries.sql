
WITH country_data AS (
    SELECT
        DISTINCT b.name,
        b.code,
        a.region,
        a.sub_region,
        a.intermediate_region,
        b.population
    FROM
        {{ ref('stg_country') }} AS a
    JOIN
        {{ source('dbt_test', 'covid_data') }} AS b
    ON
        a.code = b.code
)

SELECT
    name,
    code,
    region,
    sub_region,
    intermediate_region,
    population
FROM
    country_data
