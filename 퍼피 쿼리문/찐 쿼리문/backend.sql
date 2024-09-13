-- create table result_cart (
-- 	user_id
-- );

select * from result_users;
select * from result_product;
show columns from result_users;
show columns from result_product;



SELECT 
    ra.address_idx,
    ra.user_id,
    ra.user_address,
    ra.phone_num,
    ra.msg,
    ra.default_address,
    ru.user_name,
    ru.user_email
FROM 
    result_address ra
JOIN 
    result_users ru
ON 
    ra.user_id = ru.user_id
where address_idx = 3972;

