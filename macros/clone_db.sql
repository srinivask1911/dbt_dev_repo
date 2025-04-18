{% macro clone_db_macro(args) %}
    {% set clone_db %}
        create database T03 clone T01;
    {% endset %}
    {% do run_query(clone_db) %}
{% endmacro %}