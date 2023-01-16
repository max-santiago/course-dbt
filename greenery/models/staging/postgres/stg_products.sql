select
    /* Primary key */
    product_id

    /* Attributes */
    , name
    , price

    /* Measures */
    , inventory

from {{ source('postgres', 'products') }}