
{% macro calc_deate_rate(n=4) %}
    (
        dpm.deaths / dc.population
    ) * {{ 10 ** n }}

{% endmacro %}