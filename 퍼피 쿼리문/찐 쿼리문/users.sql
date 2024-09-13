CREATE TABLE users (						-- 사용자 테이블
    user_id varchar(100) ,	-- ID -- 이게 int면 숫자로만 받는 건데 아이디를 숫자로만 받나?
    user_pw VARCHAR(100) NOT NULL,				-- 비밀번호
    user_name VARCHAR(100) NOT NULL,			-- 이름
    user_nm VARCHAR(255) NOT NULL,			-- 닉네임
	user_email VARCHAR(100) NOT NULL,			-- 이메일
    user_age int NOT NULL,                  -- 연령대 ('20', '30', '40' ...)
    user_sex varchar(20) NOT NULL,
    primary key(user_id)
);

insert into users (user_id, user_pw, user_name, user_nm, user_email, user_age, user_sex) 
values ("test2", "1212", "test2", "test2", "test2@", 10, "남자");

insert into users (user_id, user_pw, user_name, user_nm, user_email, user_age, user_sex) 
values ("test3", "1111", "test3", "test3", "test3@", 30, "남자");

insert into users (user_id, user_pw, user_name, user_nm, user_email, user_age, user_sex) 
values ("test1", "1234", "test1", "test1", "test1@", 20, "여자");

insert into users (user_id, user_pw, user_name, user_nm, user_email, user_age, user_sex) 
values ("test4", "4444", "test4", "test4", "test4@", 10, "여자");

insert into users (user_id, user_pw, user_name, user_nm, user_email, user_age, user_sex) 
values ("test5", "555", "test5", "테스트5", "test5@", 30, "남자");

select * from users;
show columns from users;
delete from users where user_id = "test1";