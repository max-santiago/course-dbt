select
    user_id
    , count(order_id) as order_count
    , sum(order_total) as total_spend_usd

from {{ ref('stg_orders') }}
group by 1