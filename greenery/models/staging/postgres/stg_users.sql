select
    /* Primary key */
    user_id

    /* Timestamps */
    , created_at
    , updated_at

    /* Foreign keys */
    , address_id

    /* Attributes */
    , first_name
    , last_name
    , email
    , phone_number

from {{ source('postgres', 'users') }}