
{% set n = 2 %}

WITH monthly_death_rate AS (
    SELECT
        dc.name,
        dpm.year_month,
        ROUND({{ calc_deate_rate(n) }} * 100.00, 2) AS death_rate
    FROM
        {{ ref('stg_monthly_deaths') }} dpm
    JOIN
        {{ ref('dim_countries') }} dc
    ON
        dpm.name = dc.name
)

SELECT
    name,
    year_month,
    death_rate
FROM
    monthly_death_rate
