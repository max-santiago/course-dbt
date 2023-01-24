select
    user_id
    , count(distinct session_id) as sessions
    , count(distinct product_id) as products_viewed
    , min(created_at) as first_seen_at
    , max(created_at) as last_seen_at

from {{ref('stg_events')}}
group by 1