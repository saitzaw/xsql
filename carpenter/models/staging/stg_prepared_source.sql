
WITH stg_clean_source AS (
    SELECT
        *
    FROM
        {{ source('dbt_test', 'covid_data') }}
),

cleaned_source AS (
    SELECT
        date,
        name,
        SUM(deaths) AS deaths,
        sum(confirmed) confirmed,
        sum(recovered) recovered,
        sum(new_confirmed) new_confirmed,
        sum(new_recovered) new_recovered,
        sum(new_deaths) new_deaths
    FROM
        stg_clean_source
    GROUP BY
        date,
        name
    ORDER BY
        date ASC,
        name ASC
)

SELECT
    *
FROM
    cleaned_source
