select
    event_id
    , user_id
    , product_id
    , created_at as viewed_at
    , page_url

from {{ ref('stg_events') }}
where event_type = 'page_view'