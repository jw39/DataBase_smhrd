-- select * from result_product where idx = 3;

-- select * from result_users;
select * from result_product;
select * from result_review;
select * from result_cart_item;
-- select user_nm from result_review where review_idx = '4'; 

select * from information_schema.table_constraints where table_name = 'result_review';
select * from information_schema.table_constraints where table_name = 'result_product';

-- alter table result_review 
-- add constraint review_cosnm 
-- foreign key (cos_name) REFERENCES result_product(cos_name);

SHOW FULL PROCESSLIST;
kill 14057;

SHOW ENGINE INNODB STATUS;
SHOW STATUS;

kill 11981;
kill 12003;
kill 12063;
kill 12064;
kill 16249;

SELECT p.*
FROM result_product p
JOIN result_review r ON p.cos_name = r.cos_name
JOIN result_users u ON r.user_nm = u.user_nm
WHERE u.user_age BETWEEN 20 AND 29
GROUP BY p.idx, p.brand_name, p.cos_name, p.cos_img_src, p.grade, p.grade_count, p.price, p.vol, p.ranking, p.category
 ORDER BY COUNT(*) DESC
LIMIT 6;

select * from result_review limit 1000;
select distinct count(brand_name) from result_product;
select count(idx) from result_product;
kill 11515;
kill 11537;
kill 11622;
kill 11623;
kill 11748;
kill 11805;
kill 11884;
kill 11885;

kill 11749;
kill 11503;

kill 11519;
kill 2402;
kill 2403;
kill 2407;
kill 2411;
kill 2412;
kill 2417;
kill 2507;
kill 2508;
kill 2518;
kill 2543;
kill 2544;
kill 2547;
kill 2549;
kill 2556;

--
kill 1868;
kill 1903;
kill 1905;
kill 1926;
kill 1960;
kill 1961;
kill 1971;
kill 1973;
kill 1980;
kill 2170;
kill 2173;
kill 2180;
kill 2291;
kill 2294;
kill 2310;
kill 2401;
--
kill 11191;
kill 6904;
kill 7437;
kill 7438;
kill 7793;
kill 7797;
kill 8048;
kill 11095;
kill 11096;
kill 11098;
kill 11099;
kill 11154;
--
kill 3081;
kill  1791;
kill 1794;
kill 1795;
kill 1813;
kill 1817;
kill 1820;
kill 1846;
kill 1848;
kill 1850;
kill 1856;
kill 1858;
kill 1867;
--
kill 42;
kill 61;
kill 395;
kill 1275;
kill 1597;
kill 1646;
kill 1665;
kill 1666;
kill 1679;
kill 1710;
kill 1711;
kill 1733;
kill 1735;
kill 1743;
kill 1777;
kill 1779;
kill 1783;



kill 2547;
kill 2563;
kill 2564;
kill 2565;
kill 2567;
kill 2960;
kill 2962;
kill 2964;
kill 2965;
kill 2988;
kill 2989;
kill 2990;
kill 2992;
kill 2996;
kill 2997;
kill 2999;
kill 3007;
kill 3008;
kill 3009;
kill 3011;
kill 3015;
kill 3016;
kill 3028;
kill 3173;
kill 3176;
kill 3181;
kill 3184;
kill 3188;
kill 3189;
kill 3242;
kill 3245;
kill 3249;
kill 3251;
kill 3266;
kill 3267;
kill 3273;
kill 3282;
kill 3284;
kill 3288;
kill 3289;
kill 3317;
kill 3338;


kill 3339;
kill 3346;
kill 3358;
kill 3361;
kill 3362;
kill 3363
kill 3365
kill 3390
kill 3393
kill 3406
kill 3461
kill 3463
kill 3467
kill 3477
kill 3478
kill 3481
kill 3501
kill 3516
kill 3558
kill 3570
kill 3578
kill 3580
kill 3620
kill 3753
kill 3762
kill 3779
kill 3781
kill 3798
kill 3828
kill 3829
kill 3833
kill 3834
kill 4052
kill 5123
kill 5148
kill 5156
kill 5164
kill 5176
kill 5183
kill 5187
kill 11179
kill 11180
kill 11194
kill 11210
kill 11216
kill 11218
kill 11219
kill 11220
kill 11305
kill 11311

kill 3461;
kill 4052;
kill 11219;
kill 11220;
kill 11305;
kill 11311;
kill 11401;
kill 11402;