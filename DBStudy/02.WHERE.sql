-- CHAPTER 02. WHERE -- 
/*
[WHERE절 기본 사용 방법]
-- 3. SELECT   조회할 컬럼명1,...
-- 1. FROM     조회할 테이블 명
-- 2. WHERE    조죄할 행을 선별하기 위한 조건식
*/

-- [WHERE 실습]
-- 직원 테이블에서 직원 ID가 105인 직원의 FIRST_NAME과 LAST_NAME 출력
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105;

-- 부서 테이블에서 MANAGER_ID가 100인 DEPARTMENT_NAME과 DEPARTMENT_ID 출력
SELECT DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100;
 
 -- 직원 테이블에서 급여가 9000원인 직원의 직원ID, FIRST_NAME, 급여 정보를 출력
 SELECT EMPLOYEE_ID, FIRST_NAME, SALARY 
   FROM EMPLOYEES
  WHERE SALARY = 9000;
 
--------------------------------------------------------------------------------

/*
[연산자]
. 산술 연산자
. 비교 연산자
. 등가 교환 연산자
. 논리 연산자
*/

-- 1.산술 연산자 (+,-,*,/)
SELECT SALARY, SALARY+100
  FROM EMPLOYEES;


-- 2.비교 연산자 (>, >=, <, <=)
-- [비교 연산자 실습]
-- 직원 테이블에서 급여가 5000 이하인 직원의 FIRST_NAME 과 SALARY 정보 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000;

-- 직원 테이블에서 연봉이 50000 이하인 직원들의 이름과 연봉 출력
-- 연봉을 AnnSal 이라고 별칭을 지어주세요
SELECT FIRST_NAME, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE SALARY*12 <= 50000;
-- ※ SELECT절은 마지막에 실행
--> 마지막 실행되는 별칭을 먼저 실행되는 WHERE절에 사용하려면 적용이 안되니 사용 불가능


-- 3.등가 비교 연산자
-- 같다: =
-- 같지 않다: !=, <>, ^= 
-- 같지 않다: NOT A = B (논리 부정)

-- [등가 비교 연산자 실습]
-- 직원 테이블에서 직업 아이디가 IT_PROG가 아닌 직원의 이름과 직업 아이디 출력
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID != 'IT_PROG';

-- 직원 테이블에서 EMAIL 정보가 SKING인 직원의 모든 정보를 출력
SELECT *
FROM EMPLOYEES
WHERE EMAIL = 'SKING';

-- 직원 테이블에서 EMAIL 정보가 SKING이 아닌 직원의 모든 정보를 출력
SELECT *
FROM EMPLOYEES
WHERE EMAIL != 'SKING';


-- 4. 논리 연산자
-- AND -> 조건을 모두 만족하는 경우 TRUE값 반환
-- OR -> 하나의 조건이라도 만족하는 경우 TRUE값 반환

-- [논리연산자 실습]
-- 직원 테이블에서 부서아이디가 90이면서 급여가 5000 이상인 직원ID와 FIRST_NAME 출력
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 
   AND SALARY >= 5000;
 
-- 직원 테이블에서 부서 아이디가 100이거나 입사일이 06년02월02일 이후에 입사한 직원들의
-- FIRST_NAME과 입사일 출력
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 
    OR HIRE_DATE > '06/02/02';
                 -- 문자로 적어야 함 / 안 하고 060202해도 인식
                 
                 
-- 부서 ID가 100이거나 90인 직원 중에서 직원ID가 101인 직원의 정보 출력
-- ID, FIRST_NAME, 연봉 출력, 연봉은 "AnnSal"로 별칭 지정
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS "AnnSal", DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE(DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101;

-- 연산자의 우선 순위에 따라 결과값이 완전히 달라진다.
-- AND > OR  우선 순위가 AND가 높다. 때에 따라 () 사용하기
 
--------------------------------------------------------------------------------
 
/*
[NULL] 관련 연산자
- IS NULL     : 데이터 값이 NULL인 값을 조회
- IS NOT NULL : 데이터 값이 NULL이 아닌 값을 조회
- WHERE 절에서 원하는 컬럼 뒤에 사용
*/

-- 직원 테이블에서 보너스가 있는 직원만 출력 (이름과 보너스 정보만 출력)
SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;

--------------------------------------------------------------------------------

/*
[SQL 연산자]
- SQL 에서만 사용 가능한 연산자
 . IN
 . NOT IN
 . BETWEENM 
 . LIKE
*/

-- 1. IN 
-- 연산자 특정 컬럼에 포함된 데이터를 여러개 조회할 때 사용
-- = + OR 와 같은 값을 출력 
-- NULL 값은 무시하는 특성을 거지고 있다.

-- 직원 테이블에서 부서 아이디가 30이거나 
-- 50이거나 90인 직원의 모든 정보 출력
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90
   AND DEPARTMENT_ID = NULL ;
-- 연산 순위가 높은 AND 문을 먼저 실행, NULL문은 FALSE라 값이 안 뜨고 (오류 발생 안 함)
-- 그 다음 OR문을 실행 후 출력

-- IN 연산자 활용
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90, NULL);
 
 
 -- 2. NOT IN 연산자
 -- IN 뒤에 조건에 해당하지 않는 데이터를 출력
 -- != + AND 와 같은 값을 출력
 -- NOT IN에 NULL 값을 넣으면 아예 값이 출력이 안된다. 이유는 != + AND의 특징때문에!!
 
 -- 직원 테이블에서 매니저 아이디가 
 -- 100, 120, 121이 아닌 직원들의 이름과 
 -- 매니저아이디 출력
 SELECT FIRST_NAME, MANAGER_ID
   FROM EMPLOYEES 
  WHERE MANAGER_ID != 100
    AND MANAGER_ID != 120
    AND MANAGER_ID != 121;

-- NOT IN 활용
 SELECT FIRST_NAME, MANAGER_ID
   FROM EMPLOYEES 
  WHERE MANAGER_ID NOT IN (100,120,121);
  
  
-- 3. BETWEEN A AND B 연산자
-- 일정 범위 내의 데이터를 조회할 때 사용

-- BETWEEN 최소값 AND 최대값
--> 특정 열 값의 최소, 최대 범위를 지정하여 해당 범위 내의 데이터만 조회하는 것

-- 직원 테이블에서 급여가 10000 이상이고 20000 이하인 직원의 FIRST_NAME과 급여 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000;
 
 -- 직원 테이블에서 05년에 입사한 직원의 이름과 입사일을 출력
 SELECT FIRST_NAME, HIRE_DATE
   FROM EMPLOYEES
  WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31'
  ORDER BY HIRE_DATE ASC;


/*
-- 4. LIKE 연산자
 - 일부 문자열이 포함된 데이터를 조회할 때 사용
 - _ 나 % 같은 와일드 카드를 이용해 매칭 연산 진행
 - 와일드 카드란 문자열 데이터의 패턴을 표기하는 특수 문자

 % : 길이와 상관없이 모든 문자 데이터를 의미
 - 컬럼 LIKE '문자%'  : 해당 문자로 시작하는 모든 데이터 검색
 - 컬럼 LIKE '%문자'  : 해당 문자로 끝나는 모든 데이터 검색
 - 컬럼 LIKE '%문자%' : 해당 문자를 포함하는 모든 데이터 검색
 
 _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미
 - 컬럼 LIKE 'S _ _' :  S로 시작하는 3글자로 이루어진 데이터 검색
 - 컬럼 LIKE '_ _ S' :  S로 끝나는 3글자로 이루어진 데이터 검색
*/

-- [LIKE 실습]
-- 직원 테이블에서 650으로 시작하는 핸드폰 번호 찾기
SELECT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '650%';
 
-- 직원 테이블에서 이름이 S로 시작하고 n으로 끝나는 데이터 찾기
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
 
 -- 직원 테이블에서 이름이 it으로 끝나고 총 4글자인 직원 찾기
 SELECT FIRST_NAME
   FROM EMPLOYEES
  WHERE FIRST_NAME LIKE '__it';
 
 -- 직원 테이블에서 FIRST_NAME 두번째 글자가 e인 직원 찾기
 SELECT FIRST_NAME
   FROM EMPLOYEES
  WHERE FIRST_NAME LIKE '_e%';
 
 
 -- 직원 테이블에서 01월에 입사한 직원 찾기
 SELECT FIRST_NAME, HIRE_DATE
   FROM EMPLOYEES
  WHERE HIRE_DATE LIKE '__/01/__';
  -- WHERE HIRE_DATE LIKE '___01___';
  -- WHERE HIRE_DATE LIKE '___01%';
  


    