{% macro trueif(column_name, column_value) %}
    case when {{ column_name }} = '{{ column_value }}' then true else false end
{% endmacro %}