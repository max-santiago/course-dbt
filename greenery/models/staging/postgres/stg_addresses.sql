select
    /* Primary key */
    address_id

    /* Attributes */
    , address
    , zipcode
    , state
    , country

from {{ source('postgres', 'addresses') }}