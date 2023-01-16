select
    /* Primary key */
    event_id

     /* Foreign keys */
    , session_id
    , user_id
    , order_id
    , product_id

    /* Timestamps */
    , created_at

    /* Attributes */
    , event_type
    , page_url

from {{ source('postgres', 'events') }}