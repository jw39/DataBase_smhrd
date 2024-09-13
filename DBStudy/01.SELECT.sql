-- CHAPTER 01. SELECT -- 
-- --: 주석 기호
-- /**/: 여러 줄 한 번에 주석 처리 가능
-- 글자 크기 키우기: 도구 > 환경설정 > 코드편집기 > 글꼴
-- 주석 색깔 바꾸기: 도구 > 환경설정 > 코드편집기 > PL/SQL 주석


DESC EMPLOYEES;
-- DESC (DESCRIBE): 묘사하다, 데이터베이스 테이블의 구조를 확인하는데 쓰임


/*
-- [오라클 규칙]
1. SQL 문장에는 대소문자를 구분하지 않는다.
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 꼭 세미클론(;)을 찍어줘야 한다.
4. SQL 실행 단축키: CTRL+ENTER OR F9
*/

--------------------------------------------------------------------------------

/*
[SELECT 절 기본 사용 방법]
2. SELECT   조회할 컬럼 명1,...
1. FROM     조회할 테이블 이름

※ 전체 조회 -> *  (아스타리스크): 전체를 의미

※ 보통 SQL에서 코드 적을 땐
SELECT * 
  FROM EMPLOYEES; <- 이런 식으로 칼각 맞춰 깔끔하게 적는다!

※ 왜 대문자로 적느냐?
-> 컬럼 이름이 대문자로 생성돼서...
*/


-- [SELECT 실습]
-- 직원테이블에서 전체 정보를 출력하기
SELECT * 
  FROM EMPLOYEES;
  
-- 부서테이블의 전체 정보를 출력하기
SELECT *
  FROM DEPARTMENTS;

-- 직원 테이블에서 직원ID, FIRST_NAME, LAST_NAME 출력
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;

-- 부서 테이블에서 부서 ID, 부서명, LOCATION_ID 출력
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID 
  FROM DEPARTMENTS;
  
-- 직원 테이블에서 EMAIL, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID 순으로 출력
SELECT EMAIL, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- 직원 테이블에서 직원의 FIRST_NAME, JOB_ID 출력  
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES;

--------------------------------------------------------------------------------

/*
[데이터 중복 제거 하기]
-> DISTINCT: 데이터 중복 제거

※ 사용 방법
SELECT DISTINCT 조회할 컬럼1,...
  FROM 테이블 이름;
*/

-- [DISTINCT 실습]
-- 직원 테이블에 JOB_ID를 중복을 제거하여 출력
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;

-- 직원 테이블에 부서 ID를 중복을 제거하여 출력
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- 직원 테이블에서 JOB_ID, 부서ID의 중복을 제거해서 출력
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES;
-- ※※JOB 아이디가 먼저 중복체크가 들어가서 부서아이디가 중복체크가 들어감
-- >> 각자의 값으로 인식을 하게 됨
-- => DISTINCT 뒤에 2개 이상의 컬럼을 적으면?
-- >>한 쪽 컬럼에 중복이 있어도 다른 쪽 컬럼의 값이 다르면 다르게 취급

-- 직원 테이블에서 입사일을 출력하는데 중복을 제거하여 출력!
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES;
  
-- 안녕하세요 문자 출력
SELECT '안녕하세요'      -- 문자 출력할 때는 '' 사용
  FROM EMPLOYEES;       -- EMPLOYEES 컬럼에 맞게 107줄의 안녕하세요 출력됨

--------------------------------------------------------------------------------

/*
[별칭 사용하기]
- ALIAS(알리아스): 한 눈에 보기 좋게 설정하는 것
- AS 키워드를 사용하여 별칭을 지정.

※ 사용 방법
1. SELECT 컬럼 별칭
2. SELECT 컬럼 "별칭"
3. SELECT 컬럼 AS 별칭
4. SELECT 컬럼 AS "별칭"

 ※ TIP!!
 컬럼에 숫자 연산이 가능하다! (+, -, *, /)
 띄어쓰기를 할 땐 공백도 포함이 돼서 ""를 찍어줘야 한다!
*/

-- [ALIAS 실습]
-- 직원 테이블에서 직원의 이름(FIRST_NAME)과 급여, 연봉 정보 출력
SELECT FIRST_NAME, SALARY, SALARY*12 AS 연봉
  FROM EMPLOYEES;
   
-- 직원 테이블에서 직원의 이름(FIRST_NAME)과 급여와 입사일을 출력
-- 단 입사일을 "입사 날짜"로 바꿔서 출력 /  4가지 방법

-- 1. SELECT 컬럼 별칭
SELECT FIRST_NAME, SALARY, HIRE_DATE 입사날짜 
  FROM EMPLOYEES;

-- 2. SELECT 컬럼 "별칭"
SELECT FIRST_NAME, SALARY, HIRE_DATE "입사날짜"
  FROM EMPLOYEES;

-- 3. SELECT 컬럼 AS 별칭
SELECT FIRST_NAME, SALARY, HIRE_DATE AS 입사날짜 
  FROM EMPLOYEES;

-- 4. SELECT 컬럼 AS "별칭"
SELECT FIRST_NAME, SALARY, HIRE_DATE AS "입사날짜"
  FROM EMPLOYEES;

-- 직원 테이블에서 입사일, 입사일 다음날 출력
-- 입사일의 별칭을 "입사날짜", 입사일 다음날의 별칭은 "입사일 다음날" 로 출력
SELECT HIRE_DATE AS 입사날짜, HIRE_DATE+1 AS "입사일 다음날"
  FROM EMPLOYEES;

--------------------------------------------------------------------------------

/*
[ORDER BY 절]
- 특정 컬럼을 기준으로 정렬된 상태로 출력하고자 할 때 사용한다.
- SQL 실행순서에서 가장 마지막에 실행된다.
- 별도로 정렬방식을 지정하지 않으면 기본적으로 오름차순(ASC)가 적용된다.

- ASC (ASCENDING): 오름차순 정렬 (1,2,3,4,5...)
- DESC (DESCENDING): 내림차순 정렬 (10,9,8,7,6...)
*/

-- [ORDER BY 실습]
-- 직원 테이블에서 모든 직원의 정보를 출력 단, 급여 기준으로 오름차순으로 정렬
SELECT *
  FROM EMPLOYEES
ORDER BY SALARY ASC;

-- 최근의 입사한 날짜를 기준으로 직원의 이름과(FIRST_NAME), 입사날짜를 출력
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;            -- 최근 입사는 큰 수부터 작은 수, 내림차순 ㄱㄱ

-- 직원 테이블에서 직원 ID, 부서ID, 이름(FIRST_NAME), 급여 순으로 출력
-- 단 부서ID는 오름차순, 급여는 내림차순으로 정렬하여 출력
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;
-- 오름차순 정렬된 부서, 같은 부서에서 근무하고 있는 직원들 중 
-- 급여가 높은 직원 순서대로 출력됨
--> 먼저 부서ID를 오름차순으로 정렬을 하고 급여를 내림차순으로 정렬한 것

--------------------------------------------------------------------------------

/*
[NULL]
- 데이터의 값이 완전히 비어 있는 상태
- 값이 존재하지 않거나 정해지지 않은 것을 의미
- 숫자 0이나 빈 문자열 ' '은 NULL 값이 아님!
- NULL과 연산 또는 비교하면 무조건 NULL 나옴
*/

-- [NULL 실습]
-- 직원 테이블에서 직원ID, 보너스, 보너스 두배의 정보를 출력
-- 단 보너스 두배의 정보를 UP_BONUS로 별칭을 지어주겠습니다.
SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT * 2 AS "UP_BONUS"
  FROM EMPLOYEES;












