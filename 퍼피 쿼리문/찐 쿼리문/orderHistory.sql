select * from result_ingredient;

select * from result_order;
select * from result_address;
select * from result_cart_item;

select * 
from result_ingredient ri
join result_product rp
on ri.cos_name = rp.cos_name
where rp.idx = 1;


SELECT rp.*
FROM result_product rp
JOIN result_order ro ON FIND_IN_SET(rp.idx, ro.idx) > 0
WHERE ro.user_id = 'aa11'
AND ro.order_name = '구독결제';

-- 최종
SELECT ro.order_date, rp.*
FROM result_order ro
LEFT JOIN result_product rp ON FIND_IN_SET(rp.idx, ro.idx) > 0
WHERE ro.user_id = 'aa11'
AND ro.order_name = '구독결제'
order by ro.order_date asc;


-- 최종
SELECT ro.order_date,ro.idx_cnt, rp.*
FROM result_order ro
LEFT JOIN result_product rp ON FIND_IN_SET(rp.idx, ro.idx) > 0
WHERE ro.user_id = 'aa11'
AND ro.order_name = '구독결제'
order by ro.order_date asc;



-- 장바구니 구매 후 삭제 쿼리문
delete from result_cart_item
where user_id = 'akdlwb' 
and is_selected = true;


SELECT ro.*, rp.*
FROM result_order ro
LEFT JOIN result_product rp ON FIND_IN_SET(rp.idx, ro.idx) > 0
WHERE ro.user_id = 'aa11'
AND not ro.order_name = '구독결제'
order by ro.order_date asc;


show columns from result_order;

select * from result_address;

alter table result_order add column idx varchar(255) not null;
alter table result_order add column idx_cnt varchar(255) not null;
alter table result_order add column address_idx int not null;
-- alter table result_order drop column idx;
alter table result_order modify column order_date varchar(200);
delete from result_order;

SELECT 
    ra.phone_num,
    ra.receive_name,
    ra.user_address,
    ro.price
FROM 
    result_order ro
JOIN 
    result_address ra
ON 
    ra.address_idx = ro.address_idx
WHERE 
    ro.payment_key = 'tviva20240829175026BsFZ5'
    AND ra.address_idx = 4096;
    
    
    
    
    select * from result_review;
select * from result_cart_item;
select * from result_address;
select * from result_order;
select * from result_product;
select * from result_product_;
select * from result_users;
select * from result_ingredient_;

show columns from result_cart_item;
show INDEX from result_cart_item;



select * from result_review_30000;

-- alter table result_cart_item drop column created_at;
-- alter table result_cart_item drop column updated_at;



SELECT ro.order_date, ro.order_name, ro.payment_key, ro.idx_cnt, rp.*
FROM result_order ro
LEFT JOIN result_product rp ON FIND_IN_SET(rp.idx, ro.idx) > 0
WHERE ro.user_id = 'aa11'
AND not ro.order_name = '구독결제'
order by ro.order_date asc;

SELECT 
                    ra.phone_num,
                    ra.receive_name,
                    ra.user_address,
                    ro.price
                FROM 
                    result_order ro
                JOIN 
                    result_address ra
                ON 
                    ra.address_idx = ro.address_idx
                WHERE 
                    ro.payment_key = 'tviva20240831171806ko584'
                    AND ra.address_idx = 4124;









