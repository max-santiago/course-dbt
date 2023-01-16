select
    /*  Primary key */
    promo_id
    
    /* Attributes */
    , discount
    , status

from {{ source('postgres', 'promos') }}