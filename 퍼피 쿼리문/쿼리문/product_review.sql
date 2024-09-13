CREATE TABLE product_reviews (
    review_idx INT PRIMARY KEY AUTO_INCREMENT, -- 리뷰 고유 ID
    user_id INT,                            -- 리뷰를 작성한 사용자 ID
    product_id INT,                        -- 리뷰가 작성된 제품 ID
    review_text TEXT,                      -- 리뷰 내용
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE, -- 사용자 ID 외래 키
    FOREIGN KEY (cos_idx) REFERENCES cos_data(idx) ON DELETE CASCADE -- 제품 ID 외래 키
);

-- ALTER TABLE reviews
-- ADD COLUMN review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- drop table product_reviews; 