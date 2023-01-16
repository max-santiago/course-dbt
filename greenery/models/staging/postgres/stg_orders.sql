select
    /* Primary key */
    order_id

    /* Foreign keys */
    , address_id
    , promo_id
    , tracking_id
    , user_id

    /* Timestamps */
    , created_at
    , estimated_delivery_at
    , delivered_at

    /* Attributes */
    , shipping_service
    , status

    /* Measures */
    , order_cost
    , shipping_cost
    , order_total

from {{ source('postgres', 'orders') }}