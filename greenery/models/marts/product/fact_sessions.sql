

{% set actions = ["add_to_cart", "checkout", "package_shipped"] %}

select
    /* Primary key */
    session_id

    /* Foreign key */
    , user_id

    /*Timestamps */
    , min(created_at) as started_at

    /* Attributes */
    {% for action in actions %}
    , boolor_agg( {{ trueif('event_type', action) }} ) as has_{{action}}
    {% endfor %}
    

from {{ ref('stg_events') }}
group by 1, 2