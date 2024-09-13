
create table skin_type (
	user_id VARCHAR(50),
    type varchar(50),
    matter1 varchar(50),
    matter2 varchar(50),
    matter3 varchar(50),
    preference_type1 varchar(50),
    preference_type2 varchar(50),
    preference_type3 varchar(50),
    preference_type4 varchar(50),
	FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- alter table skin_type change skin_type type varchar(50);
-- delete from skin_type;
select * from skin_type;

insert into skin_type (user_id, type,  matter1, matter2, matter3, preference_type1, preference_type2, preference_type3, preference_type4)
values ("test1", "건성", "미백", "여드름", "아토피", "촉촉한", "물제형", "가벼운", "수분감");

insert into skin_type (user_id, type, matter1, matter2, matter3, preference_type1, preference_type2, preference_type3, preference_type4)
values ("test2", "지성", "주름","블랙헤드", "주근깨","뽀송한", "물제형", "꾸덕한", "수분감");

insert into skin_type (user_id, type, matter1, matter2, matter3, preference_type1, preference_type2, preference_type3, preference_type4)
values ("test3", "복합성", "홍조", "트러블", "민감함", "뽀송한", "콧물 제형", "꾸덕한", "오일감");

insert into skin_type (user_id, type, matter1, matter2, matter3, preference_type1, preference_type2, preference_type3, preference_type4)
values ("test4", "지성", "미백", "주름", "모공", "촉촉한", "물 제형", "가벼운", "수분감");

insert into skin_type (user_id, type, matter1, matter2, matter3, preference_type1, preference_type2, preference_type3, preference_type4)
values ("test5", "모름", "기미", "블랙헤드", "여드름", "뽀송한", "콧물 제형", "꾸덕한", "오일감");