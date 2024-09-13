CREATE TABLE orders (
    order_idx INT PRIMARY KEY AUTO_INCREMENT, -- 주문 고유 ID
    shipping_status VARCHAR(50),            -- 배송 상태 (예: '배송 준비 중', '배송 완료')
    FOREIGN KEY (order_idx) REFERENCES users(user_id) ON DELETE CASCADE, -- 사용자 ID 외래 키
    FOREIGN KEY (order_idx) REFERENCES cos_data(idx) ON DELETE CASCADE -- 사용자 ID 외래 키
);

-- 주문 날짜 자동 생성 쿼리문
ALTER TABLE orders
ADD COLUMN order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

SELECT * FROM orders;
SHOW columns FROM orders;

drop table orders;  