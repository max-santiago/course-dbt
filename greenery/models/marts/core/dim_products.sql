select
    /* Primary key */
    products.product_id

    /* Attributes */
    , products.name
    , products.price

    /* Measures */
    , products.inventory as units_on_hand
    , coalesce(product_sales.units_sold, 0) as units_sold
    , coalesce(product_sales.units_sold * products.price, 0.) as gross_sales_usd


from {{ ref('stg_products') }} as products
left join {{ ref('int_product_sales') }} as product_sales on products.product_id = product_sales.product_id