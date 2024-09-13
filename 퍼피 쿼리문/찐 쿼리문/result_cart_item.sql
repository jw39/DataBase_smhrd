CREATE TABLE result_cart_item (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,      -- 장바구니 ID (자동 증가, 고유 식별자)
    user_id VARCHAR(255) NOT NULL,               -- 사용자 ID (VARCHAR로 변경)
    idx INT NOT NULL,                          -- 상품 ID
    cos_name VARCHAR(255) NOT NULL,            -- 상품 이름 (VARCHAR로 변경)
    price INT NOT NULL,                        -- 상품 가격
    buy_cnt INT NOT NULL,                      -- 수량
    total_price INT NOT NULL,                  -- 총 금액 (가격 * 수량)
    cos_img_src TEXT NOT NULL,                 -- 상품 이미지 URL
    is_selected BOOLEAN DEFAULT TRUE,          -- 상품 선택 여부 (기본값: TRUE)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 항목 추가 시간
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 항목 업데이트 시간
    FOREIGN KEY (user_id) REFERENCES result_users(user_id), -- 사용자 테이블과의 외래 키 제약조건
    FOREIGN KEY (idx) REFERENCES result_product(idx),       -- 상품 테이블과의 외래 키 제약조건
    INDEX (user_id, idx)  -- 사용자와 상품 ID에 대한 인덱스
);
-- 인덱스 지정때문에 user_id 타입을 text에서 varchar(255)로 변경한 후 인덱스 지정함


ALTER TABLE result_users MODIFY user_id VARCHAR(255);
ALTER TABLE result_users ADD INDEX (user_id);
ALTER TABLE result_product ADD INDEX (idx);


select * from result_cart_item;
select buy_cnt from result_cart_item where user_id = 'aa11' and idx = 1;

select * from result_address;

INSERT INTO result_cart_item (user_id, idx, cos_name, price, buy_cnt, total_price, cos_img_src, is_selected)
SELECT 'aa11', 1 , p.cos_name, 15000 , 5, 75000, p.cos_img_src, TRUE
FROM result_product p
WHERE p.idx = 1;

UPDATE result_cart_item
SET buy_cnt = 4, total_price = 15000
WHERE user_id = 'aa11' AND idx = 1;

-- delete  from result_cart_item;
select * from result_cart_item;
select * from result_address;
show columns from result_address;

select cos_name, cos_img_src from result_product where idx = 1;
-- INSERT INTO result_cart_item (user_id, idx, cos_name, price, buy_cnt, total_price, cos_img_src, is_selected)
-- SELECT 'aa11', 1 , p.cos_name, 15000 , 5, 75000, p.cos_img_src, TRUE
-- FROM result_product p
-- WHERE p.idx = 1
-- ON DUPLICATE KEY UPDATE
-- 	buy_cnt = buy_cnt + VALUES(buy_cnt),  -- 기존 수량에 새로운 수량을 더함
-- 	total_price = total_price + VALUES(total_price);  -- 총 금액 업데이트
     
select * from result_product;
ALTER TABLE result_cart_item ADD UNIQUE (user_id, idx);


 SELECT
                rci.user_id,
                rci.idx,
                rci.cos_name,
                rci.price,
                rci.buy_cnt,
                rci.total_price,
                rci.cos_img_src,
                rci.is_selected,
                rp.brand_name,
                rp.vol
            FROM
                result_cart_item rci
            JOIN
                result_product rp
            ON
                rci.idx = rp.idx
            WHERE
                rci.user_id = 'aa11';
                
			
select * from result_cart_item;

select * from result_order;
 UPDATE result_cart_item
            SET is_selected = 0
            WHERE user_id = 'aa11' AND idx NOT IN (
                SELECT idx FROM result_cart_item
                WHERE user_id = 'aa11' AND is_selected = 1
            );
            
UPDATE result_cart_item
            SET is_selected = 0
            WHERE user_id = 'aa11'
            AND idx NOT IN (
                SELECT idx
                FROM result_cart_item
                WHERE user_id = 'aa11' AND is_selected = 1);

select * from result_cart_item
where is_selected = 1 and user_id = 'test1';

select * from result_address where user_id = 'aa11';
select * from result_address where address_idx = 1;

update result_address 
set default_address = 0
where address_idx = 1;

delete from result_address where address_idx = 4099;

select * from result_address where receive_name = "이상현";
select * from result_address;

-- alter table result_address add column receive_name varchar(50) NOT NULL;


-- insert into result_address (user_id

show columns from result_address;

select * from result_cart_item where user_id = 'aa11';
SELECT buy_cnt, price FROM result_cart_item WHERE user_id = 'aa11' AND idx = 1;

delete from result_cart_item where user_id = 'aa11' and idx in (116, 112);
select * from result_cart_item;







SELECT
                rci.user_id,
                rci.idx,
                rci.cos_name,
                rci.price,
                rci.buy_cnt,
                rci.total_price,
                rci.cos_img_src,
                rci.is_selected,
                rp.brand_name,
                rp.vol
            FROM
                result_cart_item rci
            JOIN
                result_product rp
            ON
                rci.idx = rp.idx
            WHERE
                rci.user_id = 'aa11' and is_selected = 1;