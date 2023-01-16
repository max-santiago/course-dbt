1. How many users do we have? 
- 130

2. On average, how many orders do we receive per hour?
- ~7.5

3. On average, how long does an order take from being placed to being delivered? 
- 3.89 days among already-delivered orders. 
- If we take censored data into account (i.e. orders not yet delivered), then the lower bound for the average is 112.5 days.

4. How many users have only made one purchase? Two purchases? Three+ purchases? 
- 25, 28, 71 (respectively)

5. On average, how many unique sessions do we have per hour? ~10 sessions per hour over the event dataset's timespan.

Code below:

-- How many users do we have?
select count(user_id) from dev_db.bdc_maxsantiagobrooklyndataco.stg_users;

-- On average, how many orders do we receive per hour?
select
    count(order_id) / datediff('minutes', min(created_at), max(created_at)) * 60.0 as answer
from dev_db.bdc_maxsantiagobrooklyndataco.stg_orders;

-- On average, how long does an order take from being placed to being delivered?
select 
    avg(datediff('days', created_at, delivered_at)) as answer
from dev_db.bdc_maxsantiagobrooklyndataco.stg_orders;

-- How many users have only made one purchase? Two purchases? Three+ purchases?
with 
    user_counts as (
        select 
            user_id
            , count(order_id) as cnt
        from dev_db.bdc_maxsantiagobrooklyndataco.stg_orders
        group by 1
    )

select
    count(case when cnt = 1 then 1 end) as answer1
    , count(case when cnt = 2 then 1 end) as answer2
    , count(case when cnt >= 3 then 1 end) as answer3
from user_counts;

-- On average, how many unique sessions do we have per hour?
select
    count(distinct session_id) / datediff('minutes', min(created_at), max(created_at)) * 60.0 as answer
from dev_db.bdc_maxsantiagobrooklyndataco.stg_events;