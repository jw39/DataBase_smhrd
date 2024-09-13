create table searchlist (
	product varchar(50)
);

select * from searchlist;

select * from cos_data;
select * from list_review;
select * from list_users;
SHOW columns FROM list_review;
SHOW columns FROM list_users;
select * from list_users;
select * from result_review;
select * from result_ingredient;
select * from list_users;
select * from result_product;

alter table result_product change barnd_name brand_name text;

select * from result_product limit 6;


-- 나이대 별 랭킹 쿼리문 ,, 나이 보고 싶어서 나이 컬럼 추가함
SELECT p.*, u.user_age
FROM result_product p
JOIN result_review r ON p.cos_name = r.cos_name
JOIN result_users u ON r.user_nm = u.user_nm
WHERE u.user_age BETWEEN 50 AND 80
GROUP BY p.idx, p.brand_name, p.cos_name, p.cos_img_src, p.grade, p.grade_count, p.price, p.vol, p.ranking, p.category, u.user_age
ORDER BY COUNT(*) DESC ;
-- LIMIT 6;

-- 피부 타입 별 랭킹 쿼리문
SELECT p.*
FROM result_product p
JOIN result_review r ON p.cos_name = r.cos_name
JOIN result_users u ON r.user_nm = u.user_nm
WHERE u.skin_type = '복합성'
  AND (p.category = '스킨케어' OR p.category = '클렌징')
GROUP BY p.idx, p.brand_name, p.cos_name, p.cos_img_src, p.grade, p.grade_count, p.price, p.vol, p.ranking, p.category
ORDER BY COUNT(*) DESC
LIMIT 6;

select category from result_product;

select * from result_product;
select * from result_users;

select * 
from result_product 
where cos_name like "%크림%" 
or brand_name like "%크림%"
or category like "%크림%" 

