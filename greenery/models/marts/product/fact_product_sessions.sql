with
    product_sessions as (
        select distinct
            product_id
            , session_id
            , boolor_agg(event_type = 'page_view') over (partition by session_id, product_id) as was_viewed
            , boolor_agg(event_type = 'checkout') over (partition by session_id) as was_purchased

        from {{ ref('stg_events') }}
    )

select
    product_id
    , count_if(was_viewed) as session_views
    , count_if(was_purchased) as session_purchases

from product_sessions
where product_id is not null
group by 1