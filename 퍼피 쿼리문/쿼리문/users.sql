CREATE TABLE users (						-- 사용자 테이블
    user_id INT PRIMARY KEY AUTO_INCREMENT,	-- ID -- 이게 int면 숫자로만 받는 건데 아이디를 숫자로만 받나?
    user_pw VARCHAR(50) NOT NULL,				-- 비밀번호
    user_name VARCHAR(50) NOT NULL,			-- 이름
    user_nm VARCHAR(255) NOT NULL,			-- 닉네임
	user_email VARCHAR(100) NOT NULL,			-- 이메일
    user_age int,                  -- 연령대 ('20', '30', '40' ...)
    user_sex varchar(20)
);

alter table users change user_id user_id VARCHAR(50); -- 일련번호

SELECT * FROM users;
SHOW columns FROM users;

insert into users (user_id, user_pw, user_name, user_nm, user_email, user_age, user_sex) 
values ("test2", "test1", "테스트원", "테원", "test@1", 10, "남자");




