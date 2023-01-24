select
    /* Primary key */
    stg_users.user_id

    /* Timestamps */
    , stg_users.created_at
    , stg_users.updated_at

    /* Foreign keys */
    , stg_users.address_id

    /* Attributes */
    , stg_users.first_name
    , stg_users.last_name
    , stg_users.first_name + ' ' + stg_users.last_name as full_name
    , stg_users.email
    , stg_users.phone_number
    , addresses.address
    , addresses.zipcode
    , addresses.state
    , addresses.country

    /* Measures */
    , user_orders.order_count
    , user_orders.total_spend_usd
    , user_sessions.sessions
    , user_sessions.products_viewed
    , user_sessions.first_seen_at
    , user_sessions.last_seen_at

from {{ ref('stg_users') }}
left join {{ ref('int_user_orders') }} as user_orders
    on stg_users.user_id = user_orders.user_id
left join {{ ref('stg_addresses') }} as addresses
    on stg_users.address_id = addresses.address_id
left join {{ ref('int_user_sessions') }} as user_sessions
    on stg_users.user_id = user_sessions.user_id