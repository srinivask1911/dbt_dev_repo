{% macro get_date() %}
    current_date
{% endmacro %}


-- macro for "for loop"
{% macro uppercase_columns(columns) %}
    select 
    {% for col in columns %}
        upper({{ col }}) AS {{ col }}_upper{% if not loop.last %}, {% endif %}
    {% endfor %}
    from persons
{% endmacro %}

{% macro generate_schema_name(custom_schema_name, node) %}
    {% if custom_schema_name is not none %}
        {{ custom_schema_name }}
    {% else %}
        {{ target.schema }}
    {% endif %}
{% endmacro %}

