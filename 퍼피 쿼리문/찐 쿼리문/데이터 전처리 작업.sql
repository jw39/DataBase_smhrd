-- 데이터 전처리

select distinct * from result_review;



DELETE FROM result_review;
ALTER TABLE result_review AUTO_INCREMENT = 0;

ALTER TABLE result_review
DROP COLUMN review_up_dt;

-- 1. result_review 테이블의 모든 데이터 삭제
DELETE FROM result_review;

select count(*) from result_review;
select * from result_review;

-- 2. result_review_30000 테이블의 데이터 삽입
INSERT INTO result_review (cos_name, user_nm, rating, review)
SELECT cos_name, user_nm, rating, review
FROM result_review_180000;

select count(*) from result_review_60000;

select * from result_product;
select count(*) from result_product_;

select * from result_address;
-- 댓글 등록일 컬럼 생성 및 추가

select * from result_review;

ALTER TABLE result_review
MODIFY COLUMN review_reg_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

select * from result_product;


create table result_product (
	idx int AUTO_INCREMENT,
	brand_name text ,
	cos_name text ,
	cos_img_src text ,
	grade text ,
	grade_count int ,
	price text ,
	vol text ,
	ranking text ,
	description text ,
	category text ,
	category_2 text,
    PRIMARY KEY (idx)
);


INSERT INTO result_product (brand_name, cos_name, cos_img_src, grade, grade_count, price, vol, ranking, description, category, category_2)
SELECT brand_name, cos_name, cos_img_src, grade, grade_count, price, vol, ranking, description, category, category_2
FROM result_product_;



-- 외래 키 제약 조건을 비활성화
SET foreign_key_checks = 0;

-- 외래 키 제약 조건을 다시 활성화
SET foreign_key_checks = 1;

select count(*) from result_users_;
select * from result_users;
RENAME TABLE result_users_ TO result_users;
drop table result_users;

create table result_users (
	 user_id VARCHAR(255) PRIMARY KEY,
	user_pw text ,
	user_name text ,
	user_nm text ,
	user_email text ,
	user_age int ,
	user_sex text ,
	skin_type text
   
);


INSERT INTO result_users (user_id, user_pw, user_name, user_nm, user_email, user_age, user_sex, skin_type)
SELECT user_id, user_pw, user_name, user_nm, user_email, user_age, user_sex, skin_type
FROM result_users_;

SELECT 
	ru.user_id, 
	ru.user_nm, 
	ru.user_age, 
	ru.skin_type, 
	ru.user_sex, 
	rr.review_idx, 
	rr.review, 
	rr.rating, 
	rr.review_reg_dt, 
	p.idx
FROM 
	result_product p
JOIN 
	result_review rr ON p.cos_name = rr.cos_name
JOIN 
	result_users ru ON rr.user_nm = ru.user_nm
WHERE 
	p.idx = 4
order by review_reg_dt desc;




UPDATE result_review
SET review_reg_dt = DATE_ADD(
    '2018-01-01',
    INTERVAL FLOOR(RAND() * TIMESTAMPDIFF(DAY, '2018-01-01', '2024-09-02')) DAY
) +
INTERVAL FLOOR(RAND() * 24) HOUR +
INTERVAL FLOOR(RAND() * 60) MINUTE +
INTERVAL FLOOR(RAND() * 60) SECOND;

select * from result_users;
select count(*) from result_users where user_age between 20 and 29;
select * from result_product;
select * from result_review;

-- 외래 키 제약 조건을 비활성화
SET foreign_key_checks = 0;

-- 외래 키 제약 조건을 다시 활성화
SET foreign_key_checks = 1;


-- 데이터 타입 수정
ALTER TABLE result_users MODIFY COLUMN user_id VARCHAR(50);
ALTER TABLE result_users MODIFY COLUMN user_pw VARCHAR(50);
ALTER TABLE result_users MODIFY COLUMN user_name VARCHAR(30);
ALTER TABLE result_product MODIFY COLUMN brand_name VARCHAR(100);

delete from result_ingredient;

INSERT INTO result_ingredient (cos_name, score, kor_name, eng_name, `use`, risk_none, risk_low, risk_medium, risk_high)
SELECT cos_name, score, kor_name, eng_name, `use`, risk_none, risk_low, risk_medium, risk_high
FROM result_ingredient_;

select COUNT(*) from result_review2;

SELECT p.*
FROM result_product p
JOIN result_review r ON p.cos_name = r.cos_name
JOIN result_users u ON r.user_nm = u.user_nm
WHERE u.user_age BETWEEN 20 AND 29
GROUP BY p.idx, p.brand_name, p.cos_name, p.cos_img_src, p.grade, p.grade_count, p.price, p.vol, p.ranking, p.category
ORDER BY COUNT(*) DESC
LIMIT 6;


select * from result_users where user_id = "asdf";

-- 서버 쿼리문 다시 검토 ppdetail.py
explain SELECT 
	ru.user_id, 
	ru.user_nm, 
	ru.user_age, 
	ru.skin_type, 
	ru.user_sex, 
	rr.review_idx, 
	rr.review, 
	rr.rating, 
	rr.review_reg_dt,
	p.idx
FROM 
	result_product p
JOIN 
	result_review rr ON p.cos_name = rr.cos_name
JOIN 
	result_users ru ON rr.user_nm = ru.user_nm
WHERE 
	p.idx = 3
order by review_reg_dt desc;


CREATE INDEX idx_result_product_idx ON result_product (idx);
CREATE INDEX idx_result_review_cos_name ON result_review (cos_name);
CREATE INDEX idx_result_users_user_nm ON result_users (user_nm);
CREATE INDEX idx_result_review_reg_dt ON result_review (review_reg_dt);


SHOW INDEX FROM result_product;
SHOW INDEX FROM result_review;
SHOW INDEX FROM result_users;




select brand_name from result_product where cos_name = "솔리드 볼륨 앰플";






SELECT ROUND(AVG(rr.rating), 2) AS rating_avg
FROM result_review rr
JOIN result_product p ON rr.cos_name = p.cos_name
WHERE p.idx = 895;

SELECT 
	rating,
	COUNT(*) AS count
FROM 
	result_review rr
JOIN 
	result_product rp ON rr.cos_name = rp.cos_name
WHERE 
	rp.idx = 1285
GROUP BY 
	rating
HAVING 
	rating IN (5, 4, 3, 2, 1)
ORDER BY 
	rating DESC;




SELECT COUNT(*) AS review_count
FROM result_review rr
JOIN result_product p ON rr.cos_name = p.cos_name
WHERE p.idx = 1968;

 SELECT 
	*
FROM 
	result_ingredient
WHERE 
	cos_name = "스텝 다운 모이스처라이징 크림";
    
-- main
select idx, brand_name, cos_name, cos_img_src, grade, grade_count, price, vol
from result_product limit 100;


explain SELECT p.*
FROM result_product p
JOIN result_review r ON p.cos_name = r.cos_name
JOIN result_users u ON r.user_nm = u.user_nm
WHERE u.user_age BETWEEN 10 AND 19
GROUP BY p.idx, p.brand_name, p.cos_name, p.cos_img_src, p.grade, p.grade_count, p.price, p.vol, p.ranking, p.category
ORDER BY COUNT(*) DESC
LIMIT 6; 

select * from result_users where user_id = "akdlwb";