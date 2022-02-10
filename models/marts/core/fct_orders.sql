with orders as ( 
    select * from {{ref('stg_orders')}}
),

payments as(
    select * from {{ref('stg_payments')}}
),

order_payments as (
    select order_id,
           sum(case when payment_status = 'success' then amount else 0 end)
    group by order_id
)

final as (
    select  o.order_id,
            o.customer_id,
            p.amount
     from orders o left join order_payments p on o.order_id = p.order_id
)

select * from final
