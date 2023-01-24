# Analytics engineering with dbt

Template repository for the projects and environment of the course: Analytics engineering with dbt

> Please note that this sets some environment variables so if you create some new terminals please load them again.

## Week 2 answers

### Repeat rate
```
with 
    user_counts as (
        select 
            user_id
            , count(order_id) as cnt
        from dev_db.bdc_maxsantiagobrooklyndataco.stg_orders
        group by 1
    )

select
    count(case when cnt > 1 then 1 end) / count(*) as answer
from user_counts
```

Answer: ~79.8%

### Indicators of repeat purchase likelihood

- days since last purchase
- cumulative purchases to date
- demographic attributes
- existing NPS survey results by cohorts (aggregates)

### Query to fetch orders that have changed since the first snapshot run

'select * from dev_db.bdc_maxsantiagobrooklyndataco.orders_snapshot where dbt_valid_to is not null`

- 265f9aae-561a-4232-a78a-7052466e46b7
- e42ba9a9-986a-4f00-8dd2-5cf8462c74ea
- b4eec587-6bca-4b2a-b3d3-ef2db72c4a4f

