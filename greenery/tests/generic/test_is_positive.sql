{% test is_positive(model, column_name) %}

select coalesce({{ column_name }}, 0) as testing_column
from {{ model }}
where testing_column <= 0.

{% endtest %}