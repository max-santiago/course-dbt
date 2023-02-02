# Analytics engineering with dbt

Template repository for the projects and environment of the course: Analytics engineering with dbt

> Please note that this sets some environment variables so if you create some new terminals please load them again.
## Week 3 answers

### Overall conversion rate
Code:

```select count_if(has_checkout = true) / count(*) from dev_db.bdc_maxsantiagobrooklyndataco.fact_sessions```
~62.45%

### Conversion rate by product
Code:

```select product_id, session_purchases / session_views as conv_rate from dev_db.bdc_maxsantiagobrooklyndataco.fact_product_sessions```

### Macro, post-hooks, and package usage

I created the `trueif()` macro and used it in the `fact_sessions` model. I installed the `dbt_utils` package but I didn't have time to come up with a relevant use case from one of its macros in my project. The post-hook grant was configured in the `dbt_project.yml` file.

### DAG for week 3
![image](https://storage.googleapis.com/openscreenshot/K%2FZ%2FQ/RMMTgyQZK.png)

### Orders that changed
Code to obtain them:
```select order_id from dev_db.bdc_maxsantiagobrooklyndataco.orders_snapshot
qualify rank() over (order by dbt_updated_at desc) = 1```

- 29d20dcd-d0c4-4bca-a52d-fc9363b5d7c6
- e2729b7d-e313-4a6f-9444-f7f65ae8db9a
- c0873253-7827-4831-aa92-19c38372e58d

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

select * from dev_db.bdc_maxsantiagobrooklyndataco.orders_snapshot where dbt_valid_to is not null`

- 265f9aae-561a-4232-a78a-7052466e46b7
- e42ba9a9-986a-4f00-8dd2-5cf8462c74ea
- b4eec587-6bca-4b2a-b3d3-ef2db72c4a4f

