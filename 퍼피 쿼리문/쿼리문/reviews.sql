CREATE TABLE reviews (
    review_idx INT PRIMARY KEY AUTO_INCREMENT, -- 리뷰 고유 ID
    user_id VARCHAR(50),                            -- 리뷰를 작성한 사용자 ID
    cos_idx INT,                        -- 리뷰가 작성된 제품 ID
    review_text TEXT,                      -- 리뷰 내용
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE, -- 사용자 ID 외래 키
    FOREIGN KEY (cos_idx) REFERENCES cos_data(idx) ON DELETE CASCADE -- 제품 ID 외래 키
);

ALTER TABLE reviews
ADD COLUMN review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

select * from reviews;
SHOW columns FROM reviews;
-- drop table reviews;

insert into reviews (user_id, cos_idx, review_text)
values ("test1", 1, "촉촉하네요")