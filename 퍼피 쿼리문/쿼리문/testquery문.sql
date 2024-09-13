select * from cos_data;
show columns from cos_data;
select * from test1;

update cos_data
set cos_img_src = "https://img.hwahae.co.kr/products/1897092/1897092_20220801000000.jpg?format=webp&size=600x600"
where idx = 5;

update cos_data
set brand_name = "코스노리"
where idx = 2;

update cos_data
set cos_img_src = "https://img.hwahae.co.kr/products/1942105/1942105_20230216173808.jpg?format=webp&size=600x600"
where idx = 2;

select * from cos_data;
select * from cos_data where cos_name like "% %" limit 9;

select * from searchlist;

create table searchlist(
	product varchar(100)
);

insert into searchlist value ("수분");

delete from searchlist;
delete FROM searchlist WHERE product LIKE "크림";



