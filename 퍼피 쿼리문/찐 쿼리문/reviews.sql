CREATE TABLE reviews (
    review_idx INT PRIMARY KEY AUTO_INCREMENT, -- 리뷰 고유 ID
    user_id VARCHAR(50),                            -- 리뷰를 작성한 사용자 ID
    cos_idx INT,                        -- 리뷰가 작성된 제품 ID
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE, -- 사용자 ID 외래 키
    FOREIGN KEY (cos_idx) REFERENCES cos_data(idx) ON DELETE CASCADE -- 제품 ID 외래 키
);

ALTER TABLE reviews
ADD COLUMN review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE reviews
ADD COLUMN score INT;

ALTER TABLE reviews
ADD COLUMN good_review text;

ALTER TABLE reviews
ADD COLUMN bad_review text;


ALTER TABLE reviews DROP COLUMN SCORE;
ALTER TABLE reviews DROP COLUMN review_text;

select * from reviews;
SHOW columns FROM reviews;
-- drop table reviews;

delete from reviews;

---------------------------------------------------------------------

insert into reviews (user_id, cos_idx, good_review, bad_review, score)
values ("test2", 1, "촉촉하네요","냄새가 심해요", 3);

insert into reviews (user_id, cos_idx, good_review, bad_review, score)
values ("test1", 1, "초록초록 좋아", "연두색이면 더 좋을 듯", 5);

insert into reviews (user_id, cos_idx, good_review, bad_review, score)
values ("test3", 1, "알로에같다", "알로에 냄새 시러융", 4);

insert into reviews (user_id, cos_idx, good_review, bad_review, score)
values ("test4", 1, "시카가 좋긴 하다", "비싸당 힝", 4);

insert into reviews (user_id, cos_idx, good_review, bad_review, score)
values ("test5", 1, "수분감이 좋고 마무리가 산뜻함", "별다른 단점은 없는데 .. 맘에 들어요", 5);




-- 프론트에 필요한 리뷰 데이터 보내는 쿼리문
SELECT 
    u.user_nm,                  -- 닉네임
    u.user_age,                 -- 연령대
	r.good_review,              -- 리뷰 내용
    r.bad_review,              -- 리뷰 내용
    r.review_idx,               -- 리뷰 고유 ID
    r.user_id,                  -- 리뷰 작성자 ID
    r.score,					-- 리뷰 평점
    r.cos_idx,                   -- 제품 ID
    r.review_date,				-- 리뷰 등록 날짜
    s.type,                -- 피부 타입
    s.matter1, 				-- 피부 고민1
    s.matter2, 				-- 피부 고민2
    s.matter3 				-- 피부 고민3
FROM 
    users u
JOIN 
    skin_type s ON u.user_id = s.user_id
JOIN 
    reviews r ON u.user_id = r.user_id
WHERE 
    cos_idx = 1  -- 특정 사용자의 정보만 조회
limit 2;
    
select * from reviews;
select * from cos_data_skin;
  
-- 별점 평균
select round(avg(score), 2) as score_avg
from reviews
where cos_idx = 1;

-- 별점 각 점수마다 count
select score, count(score) as score_cnt
from reviews
where cos_idx = 1
group by score;

select * from reviews;
-- 리뷰 갯수 count
select count(good_review) as review_cnt
from reviews
where cos_idx = 1
group by cos_idx;


select * from result_review;
select * FROM result_users;


-- 댓글 등록일과 수정일 컬럼 추가 
ALTER TABLE result_review
ADD COLUMN review_reg_dt DATE;

-- 랜덤 날짜와 시간을 생성하여 review_reg_dt 및 review_up_dt에 적용
UPDATE result_review
SET
    review_reg_dt = DATE_ADD('2022-01-01', INTERVAL FLOOR(RAND() * TIMESTAMPDIFF(DAY, '2022-01-01', '2024-08-22')) DAY) +
                     INTERVAL FLOOR(RAND() * 24) HOUR +
                     INTERVAL FLOOR(RAND() * 60) MINUTE +
                     INTERVAL FLOOR(RAND() * 60) SECOND,
    review_up_dt = review_reg_dt;

    
-- review_reg_dt와 review_up_dt 컬럼의 형식을 DATE에서 TIMESTAMP로 변경하고 기본값 및 업데이트 설정 추가
ALTER TABLE result_review
MODIFY COLUMN review_reg_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
MODIFY COLUMN review_up_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

SHOW columns FROM result_review;

-- ALTER TABLE result_review
-- CHANGE COLUMN `review.idx` review_idx INT;



select * from result_users;
select * from result_review;
select * from result_product;


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
    rr.review_up_dt, 
    p.idx
FROM 
    result_product p
JOIN 
    result_review rr ON p.cos_name = rr.cos_name
JOIN 
    result_users ru ON rr.user_nm = ru.user_nm
WHERE 
    p.idx = 3; 

SELECT COUNT(*) AS review_count
FROM result_review rr
JOIN result_product p ON rr.cos_name = p.cos_name
WHERE p.idx = 4;  -- 여기에 제공받은 상품 idx 값이 들어가야 합니다.

SELECT ROUND(AVG(rr.rating), 2) AS rating_avg
FROM result_review rr
JOIN result_product p ON rr.cos_name = p.cos_name
WHERE p.idx = 3;  -- 여기에 제공받은 상품 idx 값이 들어가야 합니다.


SELECT 
    rating,
    COUNT(*) AS count
FROM 
    result_review rr
JOIN 
    result_product rp ON rr.cos_name = rp.cos_name
WHERE 
    rp.idx = 3
GROUP BY 
    rating
HAVING 
    rating IN (5, 4, 3, 2, 1)
ORDER BY 
    rating DESC;

select user_age 
from result_users
group by user_age 
having user_age
order by user_age desc;


select * from result_address where user_id = 'test1';
select * from result_users where user_id = 'test1';
select * from result_users;

select * from result_review where user_nm = '가나다';
select * from result_review;
show columns from result_review;
-- 사용자 이름, 화장품 이름

INSERT INTO result_review_new1 (cos_name, user_nm,  rating, review)
            VALUES ('순행클렌징폼', '가나다', 3, '촉촉');

ALTER TABLE result_review
MODIFY review_idx INT AUTO_INCREMENT PRIMARY KEY;

delete from result_review where user_nm = '가나다';

select * from result_order;

-- SELECT review_idx, COUNT(*)
-- FROM result_review
-- GROUP BY review_idx
-- HAVING COUNT(*) > 1;
SELECT review_idx, COUNT(*)
FROM result_review
GROUP BY review_idx
HAVING COUNT(*) > 1;

SELECT MAX(review_idx) FROM result_review;

ALTER TABLE result_review AUTO_INCREMENT = 6701;
ALTER TABLE result_review
MODIFY review_idx INT AUTO_INCREMENT PRIMARY KEY;

SHOW CREATE TABLE result_review;
SHOW INDEX FROM result_review;
ALTER TABLE result_review DROP PRIMARY KEY;

ALTER TABLE result_review AUTO_INCREMENT = 6700;
ALTER TABLE result_review MODIFY review_idx INT AUTO_INCREMENT PRIMARY KEY;
SHOW KEYS FROM result_review WHERE Key_name = 'PRIMARY';
SHOW TABLE STATUS LIKE 'result_review';
ALTER TABLE result_review AUTO_INCREMENT = 6700;
SHOW CREATE TABLE result_review;

select * from result_review_temp;
-- 기본키와 AUTO_INCREMENT 설정을 위해 임시 테이블을 생성합니다.
CREATE TABLE result_review_temp LIKE result_review;

-- `review_idx`를 AUTO_INCREMENT로 설정하여 임시 테이블을 생성합니다.
ALTER TABLE result_review_temp
    MODIFY review_idx INT AUTO_INCREMENT PRIMARY KEY;
    
SELECT review_idx, COUNT(*)
FROM result_review
GROUP BY review_idx
HAVING COUNT(*) > 1;

-- 기존 데이터를 임시 테이블로 복사합니다.
INSERT INTO result_review_temp (review_idx, cos_name, user_nm, rating, review, review_reg_dt, review_up_dt)
SELECT review_idx, cos_name, user_nm, rating, review, review_reg_dt, review_up_dt
FROM result_review;

-- 기존 테이블을 삭제합니다.
-- DROP TABLE result_review;

select * from result_review;
-- 임시 테이블을 원래 이름으로 변경합니다.
ALTER TABLE result_review_temp RENAME TO result_review;


CREATE TABLE result_review_new2(
    review_idx INT ,
    cos_name TEXT,
    user_nm TEXT,
    rating INT,
    review TEXT,
    review_reg_dt TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    review_up_dt TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (review_idx) 
    
);

select * from result_review_new1;
INSERT INTO result_review_new1 (review_idx, cos_name, user_nm, rating, review, review_reg_dt, review_up_dt)
SELECT review_idx, cos_name, user_nm, rating, review, review_reg_dt, review_up_dt
FROM result_review;

DROP TABLE result_review;

ALTER TABLE result_review_new RENAME TO result_review;

ALTER TABLE result_review
MODIFY review_idx INT AUTO_INCREMENT PRIMARY KEY;

alter table recipe_board modify COLUMN RCP_SNO INT AUTO_INCREMENT ;
ALTER TABLE RECIPE_BOARD AUTO_INCREMENT = 6949576;

SHOW CREATE TABLE result_review;

ALTER TABLE result_review MODIFY review_idx INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE result_review_new1 AUTO_INCREMENT = 6699;
select * from result_review;

INSERT INTO result_review_new1 (cos_name, user_nm,  rating, review)
            VALUES ('순행클렌징폼', '가나다', 3, '촉촉');
            
            
            
CREATE TABLE new_result_review (
  review_idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cos_name TEXT,
  user_nm TEXT,
  rating INT DEFAULT NULL,
  review TEXT,
  review_reg_dt TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  review_up_dt TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE result_review DROP PRIMARY KEY;

INSERT INTO new_result_review (cos_name, user_nm, rating, review, review_reg_dt, review_up_dt)
SELECT cos_name, user_nm, rating, review, review_reg_dt, review_up_dt
FROM result_review;

select * from new_result_review;
