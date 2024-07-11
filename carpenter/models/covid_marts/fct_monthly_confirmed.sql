
WITH stg_confirmed_cases_per_month AS (
    SELECT
        name,
        to_char(date, 'YYYY-MM') AS year_month,
        SUM(confirmed) AS confirmed_cases
    FROM
        {{ ref('stg_prepared_source') }}
    GROUP BY
        name,
        year_month
)

SELECT
    *
FROM
    stg_confirmed_cases_per_month
