select
    product_id
    , sum(quantity) as units_sold

from {{ ref('stg_order_items') }}
group by 1