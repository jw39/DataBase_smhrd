CREATE TABLE cos_data(
   idx INT AUTO_INCREMENT,
   brand_name      varchar(50),
    brand_img_src   varchar(100),
    cos_name      varchar(50),
    cos_img_src      varchar(100),
    grade         FLOAT,
    grade_count      INT,
    price         INT,
    vol            INT,
    ranking         varchar(50),
    PRIMARY KEY (idx)
);

INSERT INTO cos_data (brand_name, brand_img_src, cos_name, cos_img_src, grade, grade_count, price, vol, ranking)
VALUES(
    '리브엠',
    'https://img.hwahae.co.kr/brands/14080/14080_20230405140512.png?format=webp&size=32x32',
    '시카좀 카밍 워터 젤크림',
    'https://img.hwahae.co.kr/products/2107141/2107141_20240715175717.jpg?format=webp&size=600x600',
    4.92,
    36,
    26000,
    100,
    '크림 , 진정 100위'
),(
    '코스토리',
    'https://img.hwahae.co.kr/brands/1768/1768_20230405140512.png?format=webp&size=32x32',
    '아보카도 아이크림',
    'https://img.hwahae.co.kr/products/1993475/1993475_20240312112855.jpg?format=webp&size=600x600',
    4.58,
    2290,
    16000,
    15,
    '아이케어 3위'
),(
    '더랩바이블랑두',
    'https://img.hwahae.co.kr/brands/8983/8983_20240226111037.png?format=webp&size=32x32',
    '그린 플라보노이드 3.0 크림',
    'https://img.hwahae.co.kr/products/1993475/1993475_20240312112855.jpg?format=webp&size=600x600',
    4.43,
    516,
    25000,
    50,
    '크림 , 진정 38위'
),(
    '스킨1004',
    'https://img.hwahae.co.kr/brands/1176/1176_20230831171529.png?format=webp&size=32x32',
    '마다가스카르 센텔라 앰플 폼',
    'https://img.hwahae.co.kr/products/1832892/1832892_20220801000000.jpg?format=webp&size=600x600',
    4.46,
   1187,
    14000,
    125,
    '클렌징 폼 , 진정 7위'
),(
    '듀이트리',
    'https://img.hwahae.co.kr/brands/493/493_20230405140512.png?format=webp&size=32x32',
    '픽앤퀵 뽑아쓰는 마스크 [화장발]',
    'https://img.hwahae.co.kr/brands/977/977_20230405140512.png?format=webp&size=32x32',
    4.24,
   750,
    23000,
    380,
    '시트마스크 , 수분 17위'
),(
    '어바웃미',
    'https://img.hwahae.co.kr/brands/977/977_20230405140512.png?format=webp&size=32x32',
    '숲 진정 수분 세럼',
   'https://img.hwahae.co.kr/products/2058047/2058047_20230808102719.jpg?format=webp&size=600x600',
    4.66,
   502,
    28000,
    502,
    '에센스/앰플/세럼 , 진정 14위'
),(
    'VDL',
    'https://img.hwahae.co.kr/brands/277/277_20230405140512.png?format=webp&size=32x32',
    '톤스테인 컬러 코렉팅 프라이머 [SPF20/PA++] [03 세레니티]',
   'https://img.hwahae.co.kr/products/2097817/2097817_20240516145701.jpg?format=webp&size=600x600',
    3.73,
   15,
    26000,
    30,
    '프라이머 , 새틴 5위'
),(
    '구달',
    'https://img.hwahae.co.kr/brands/268/268_20230405140512.png?format=webp&size=32x32',
    '청귤 비타C 잡티케어 크림',
   'https://img.hwahae.co.kr/products/1996467/1996467_20220801000000.jpg?format=webp&size=600x600',
    3.99,
   240,
    28000,
    75,
    '크림 , 브라이트닝 3위'
),(
    '코스토리',
    'https://img.hwahae.co.kr/brands/1768/1768_20230405140512.png?format=webp&size=32x32',
    '마이크로 액티브 클렌징 오일',
   'https://img.hwahae.co.kr/products/2001561/2001561_20220801000000.jpg?format=webp&size=600x600',
    4.60,
   1365,
    16000,
    200,
    '클렌징 오일 11위'
),(
    '프리메라',
    'https://img.hwahae.co.kr/brands/3/3_20230405140512.png?format=webp&size=32x32',
    '유스 래디언스 비타티놀 세럼',
   'https://img.hwahae.co.kr/products/2010170/2010170_20240328093231.jpg?format=webp&size=600x600',
    4.56,
   354,
    40000,
    21,
    '에센스/앰플/세럼 , 안티에이징 16위'
);

select * from cos_data;
show columns from cos_data;

select brand_name, cos_name, cos_img_src, grade, grade_count, price, vol
from cos_data;
select * from test;

update cos_data
set cos_img_src = "https://img.hwahae.co.kr/products/1897092/1897092_20220801000000.jpg?format=webp&size=600x600"
where idx = 5;

delete from cos_data where idx = 5;


select * from cos_data where idx = 5;

update cos_data
set brand_img_src = "https://img.hwahae.co.kr/brands/493/493_20230405140512.png?format=webp&size=32x32",
cos_img_src = "https://img.hwahae.co.kr/products/1897092/1897092_20220801000000.jpg?format=webp&size=600x600"
where idx = 5;

