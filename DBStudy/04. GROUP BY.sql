-- CHAPTER 04. GROUP BY -- 

/*
 [내장함수 종류]
 - 단일 행 함수: 입력된 하나의 행 당 결과가 하나씩 나오는 함수
 - 다중 행 함수: 여러 행을 입력 받아 하나의 결과 값으로 출력이 되는 함수
 -> 다중행 함수를 집계함수라고 부른다.

 [다중행 함수 (집계 함수)의 특징]
 1. 집계 함수는 NULL값을 제외하는 특징을 가지고 있습니다.
 2. 집계 함수는 그룹화(GROUP BY) 가 되어 있는 상태에서만 사용이 가능합니다.

- COUTN: 지정한 데이터의 개수를 반환  
- SUM  : 지정한 데이터의 합 반환
- MAX  : 지정한 데이터 중 최대값 반환
- MIN  : 지정한 데이터 중 최소값 반환
- AVG  : 지정한 데이터의 평균값 반환
*/

-- COUNT(데이터 및 컬럼)
-- 직원 테이블에서 직원ID의 행의 개수를 조회 (총 직원수)
  
-- SELECT EMPLOYEE_ID, COUNT(EMPLOYEE_ID) AS "총 직원 수"
--   FROM EMPLOYEES;
--> 출력하고자 하는 행의 갯수가 맞지 않아서 에러 발생

SELECT COUNT(EMPLOYEE_ID) AS "총 직원 수"
  FROM EMPLOYEES;
GROUP BY(); -- 소괄호 안에 데이터가 없는 그룹 바이라는 키워드가 사실 숨겨져 있는 것
--> 직원 테이블을 하나의 그룹으로 보겠다!!

-- 부서 아이디의 행의 갯수를 조회    //106
SELECT COUNT (DEPARTMENT_ID)
  FROM EMPLOYEES;
  
-- QUIZ 부서 아이디가 NULL인 직원의 FIRST_NAME은?
 SELECT FIRST_NAME, DEPARTMENT_ID
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID IS NULL;
  
  
/*
SELECT 조회할 컬럼 명1, ...
  FROM 조회할 테이블 명
 WHERE 내가 원하는 행을 선별하기 위한 조건식
 
 - 산술 연산자 : +,-,*,/
 - 비교 연산자 : >, >=, <, <=
 - 등가 비교 연산자 : = (같다), !=, <>, ^=, NOT A = B(같지 않다)
 - 논리 연산자 : AND (두 개의 조건이 참이면 참 반환), OR (둘 중에 하나라도 참이면 참 반환)
 - SQL 연산자 : IN, NOT IN, BETWEEN, LIKE
    IN : WHERE 컬럼 IN (컬럼 LIST...)    //조건식에서 사용
    -> =(같다) + OR (논리 연산자)
    -> NULL 값을 무시한다.
    
    NOT IN : WHERE 컬럼 NOT IN (데이터 LIST...)
    -> != 같지 않다 + AND (논리 연산자)
    -> NULL을 포함하면 아예 데이터 값이 안 나온다.
    
    BETWEEN : BETWEEN 최솟값 AND 최대값 ; , WHERE 컬럼 BETWEEN 최솟값 AND 최대값
    
    LIKE : WHERE 컬럼 LIKE '문자(와일드 카드)'
    % : 길이와 상관없이 모든 문자를 의미
    _ : 하나의 문자를 의미
*/
 
 -- 부서 아이디의 행의 갯수를 조회    //106
 SELECT COUNT (DEPARTMENT_ID)
   FROM EMPLOYEES;
   
-- COUNT 함수는 * (아스타리스크) 사용 가능
-- 다른 집계 함수는 * (아스타리스크) 사용 불가능

SELECT COUNT (*)
  FROM EMPLOYEES;
 -- 테이블의 모든 행의 갯수를 파악하고자 할 때 사용하는 SQL 문!
 
 -- 직원 테이블에서 급여의 총 합계를 구하시오
 SELECT SUM (SALARY)
   FROM EMPLOYEES;
 
 -- 직원 테이블에서 직원들의 최대 급여와 최소 급여를 출력
 SELECT MAX (SALARY)
      , MIN (SALARY)
   FROM EMPLOYEES;
 
 -- 직원 테이블에서 부서ID 가 100인 직원의 평균 급여를 출력
 -- 결과값은 소수점 1의 자리까지 반올림
 SELECT ROUND(AVG(SALARY), 1)
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 100;
  

--------------------------------------------------------------------------------
SELECT * FROM 성적표;
SELECT * FROM 수강생정보;

-- GROUP BY : 특정 컬럼을 기준으로 그룹화 (묶음)

-- 수강생 정보 테이블에서 소속반 별 학생의 인원수를 조회.
SELECT 소속반, COUNT (학생이름) AS "소속반 학생 수"
  FROM 수강생정보
GROUP BY 소속반;

-- 성적표 테이블에서 학생 별로 그룹화를 해보자!!
SELECT 학생ID
FROM 성적표
GROUP BY 학생ID;

-- 성적표 테이블에서 과목별로 최고 성적과 최저 성적 출력
SELECT 과목, MAX(성적) AS "최고 성적", MIN(성적) AS "최저 성적"
  FROM 성적표
GROUP BY 과목 ;

-- 성적표 테이블에서 학생별 평균 점수를 출력
-- 단, 소수점 자리를 1자리까지만 출력
SELECT 학생ID, ROUND(AVG(성적),1) AS "학생 별 평균 성적"
  FROM 성적표
GROUP BY 학생ID;

/*
-- [SQL문 작성 순서]
- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY

-- [☆☆☆ SQL 실행 순서 ☆☆☆]
- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
*/

-- 성적표 테이블에서 학생별로 JAVA와 DB 과목에 대한 성적의 합을 구하라
SELECT 학생ID, SUM (성적)
  FROM 성적표
 WHERE 과목 IN ('JAVA', 'DATABASE')
GROUP BY 학생ID;

--------------------------------------------------------------------------------
/*
[SQL 실행 순서]
5. SELECT
1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. ORDER BY


[HAVING절] 
- GROUP BY 절이 존재할 때만 사용이 가능
-> 집계가 완료된 조건을 통해 필터링하는 문법

- 조건이 참인 결과만 출력된다는 점에서는 WHERE절에서 비슷하지만,
- HAVING절은 그룹화 된 대상에서 출력이 된다는 점에서 다르다.

*/

-- 성적표 테이블에서 학생별 평균 성적을 구하고 평균 성적 75이하인 학생들만 출력
SELECT 학생ID, ROUND(AVG(성적), 1)
FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) <= 75;

-- 1. 수강생 정보에서 반별의 인원수가 3명 이상인 반만 출력
SELECT 소속반, COUNT(소속반)
FROM 수강생정보
GROUP BY 소속반
HAVING COUNT(소속반) >= 3;

-- 2. 직원 테이블에서 부서별 최고 연봉이 100,000 이상인 부서만 출력
SELECT DEPARTMENT_ID, MAX(SALARY*12) AS "연봉"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY*12)>= 100000;

-- 3. 성적표 테이블에서 학생 별 평균 성적을 출력하되,
-- NULL이 아닌 값만 출력. 성적은 소수점 1의 자리까지 표시
SELECT 학생ID, ROUND(AVG(성적), 1)
FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) IS NOT NULL;




























 
 
 
 
  