with payments as
(
    select id as payment_id,
           orderid order_id,
           paymentmethod payment_method,
           status payment_status,
           amount payment_amount,
           created created_at,
           _batched_at batched_at
    from {{source('stripe','payment')}}
)

select * from payments;