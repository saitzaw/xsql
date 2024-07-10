
WITH stg_deaths_per_month AS (
    SELECT
        name,
        to_char(date, 'YYYY-MM') AS year_month,
        SUM(new_deaths) AS deaths
    FROM
        {{ ref('stg_prepared_source') }}
    GROUP BY
        name,
        year_month
)

SELECT
    *
FROM
    stg_deaths_per_month
