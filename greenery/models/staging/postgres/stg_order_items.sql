select
    /* Composite primary key */
    order_id
    , product_id
    
    /* Measures */
    , quantity

from {{ source('postgres', 'order_items') }}