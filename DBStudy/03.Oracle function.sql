-- CHAPTER 03. 오라클 함수 -- 


-- [함수]
-- 입력 값을 넣어서 특정한 기능을 통해서 결과 값을 출력

-- 사용자 정의함수: 사용자가 필요에 의해 직접 정의한 함수
-- 내장 함수: 오라클에서 미리 만들어 놓은 함수, 필요할 때마다 호출해서 사용
-- 내장함수는 문자형, 숫자형, 날짜형, NULL 함수, 조건 함수

-- 함수를 실행할 때 사용하는 값 >> 매개변수, 인자값

--------------------------------------------------------------------------------
/*
※[문자형 함수]
. UPPER
. LOWER
. LENGTH
. SUBSTR
. REPLACE
. TRIM

- ※ UPPER: 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
- ※ LOWER: 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력

- 사용방법
-- UPPER(데이터)
-- LOWER(데이터)
*/

-- DUAL 테이블이란?
--> 오라클 최고 관리자 SYS 소유의 테이블
--> 임시 연산이나 함수의 결과 값 확인 용도로 사용하는 테스트용 테이블

SELECT UPPER('ABCde123@@')
  FROM DUAL;

-- [문자형 함수 실습]
-- 직원 테이블에서 FIRST_NAME과 EMAIL 정보를 출력,
-- FIRST_NAME은 대문자로, EMAIL은 소문자로 출력
SELECT UPPER(FIRST_NAME), LOWER(EMAIL)
  FROM EMPLOYEES;

-- DUAL 테이블을 이용해서 'HELLO WORLD' 문자열을 소문자로 바꿔서 출력
SELECT LOWER('HELLO WORLD')
  FROM DUAL;

--------------------------------------------------------------------------------

-- ※ LENGTH : 괄호 안 문자 데이터의 길이를 구하는 함수
SELECT LENGTH ('HELLO WORLD')
FROM DUAL;

-- [LENGTH 실습]
-- 직원 테이블에서 직원의 FIRST_NAME과 FIRST_NAME의 길이를 출력
SELECT FIRST_NAME, LENGTH (FIRST_NAME)
FROM EMPLOYEES;

-- 직원의 FIRST_NAME의 길이가 5인 이상의 직원들의 직원ID, FIRST_NAME 출력
SELECT EMPLOYEE_ID, FIRST_NAME, LENGTH (FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH (FIRST_NAME) >= 5;

--------------------------------------------------------------------------------
/*
-- ※ SUBSTR : 문자열을 호출하는 함수

- 사용 방법
-- 1) SUBSTR(컬럼, 시작위치, 추출길이)
    --> 문자열의 데이터의 시작 위치부터 추출 길이만큼 출력
-- 2) SUBSTR(컬럼, 시작위치)
    --> 추출길이 생략 시 문자열 데이터의 시작 위치부터 끝까지 출력
*/

-- [SUBSTR 실습]
SELECT '스마트인재개발원'
        , SUBSTR('스마트인재개발원', 1, 3) AS "스마트"
        , SUBSTR('스마트인재개발원', 4) AS "인재개발원"
  FROM DUAL;

-- 직원 테이블에서 입사 날짜와 연도, 월, 일 별로 출력
-- 각 컬럼에는 연도, 월, 일 별로 별칭을 사용해서 출력
SELECT HIRE_DATE
        , SUBSTR(HIRE_DATE, 1, 2) AS 연도
        , SUBSTR(HIRE_DATE, 4, 2) AS 월
        , SUBSTR(HIRE_DATE, 7, 2) AS 일
  FROM EMPLOYEES;


--------------------------------------------------------------------------------
/*
-- ※ REPALCE :특정 문자를 다른 문자로 바꾸어 주는 함수

- 사용 방법
-- 1) REPALCE(문자열 데이터 및 컬럼, 바꾸고 싶은 문자, 바꾸어 주는 함수)
-- 2) REPALCE(문자열 데이터 및 컬럼, 바꾸고 싶은 문자)
    --> 바꿔야 할 문자를 생략 시 바꾸고 싶은 문자는 데이터에서 삭제가 됨!
*/

-- [REPLACE 실습]
SELECT '스마트##인재개발원'
     , REPLACE ('스마트##인재개발원', '#', '-') AS "하이픈으로 바꿈"
     , REPLACE ('스마트##인재개발원', '#') AS "삭제가 됨"
  FROM DUAL;

-- 직원 테이블에서 입사 날짜를 출력하되
-- / 를 - 로 바꿔서 출력
-- / 를 삭제하고 출력
SELECT HIRE_DATE
     , REPLACE (HIRE_DATE, '/', '-') AS "/대신-"
     , REPLACE (HIRE_DATE, '/') AS "/삭제"
  FROM EMPLOYEES;
  
--------------------------------------------------------------------------------
-- ※ CONCAT : 두 문자열 데이터를 합치는 함수
-- CONCAT (문자열 1, 문자열 2)
-- || -> 합성 연산자, 이 합성 연산자를 이용하면 무한대로 문자열 연결이 가능.

-- 두 문자 합치기
SELECT CONCAT('스마트', '인재개발원')
  FROM DUAL;

-- 두 문자 이상 합치기
SELECT CONCAT('스마트', ' 인재개발원')||' 최고예용' || ' 맞나용?'
  FROM DUAL;


--------------------------------------------------------------------------------
/*
-- ※ TRIM : 입력 받은 문자형 데이터의 양 끝의 공백을 제거해주는 함수

- 사용 방법
-- 1) TRIM('데이터')
*/

-- [TRIM 실습]
SELECT TRIM( '    여러분은 최고예요       ')
     , REPLACE (TRIM( '    여 러 분 은  최 고 예 요       '), ' ')
     , REPLACE ( '    여 러 분 은  최 고 예 요       ', ' ')
FROM DUAL;

--------------------------------------------------------------------------------
/*
[숫자형 함수]

-- ROUND: 특정 위치에서 반올림 하는 함수
1) ROUND(반올림 할 숫자, 반올림 위치)
2) ROUND(반올림 할 숫자)
--> 반올림 위치 생략 시 소수점 첫번째 자리에서 강제로 반올림이 된다.

-- TRUNC: 특정 위치에서 버리는 함수
1) TRUNC(버림할 숫자, 버림위치)
2) TRUNC(버림할 숫자)
--> 버림 위치 생략 시 소수점 첫번째 자리에서 강제로 버림이 된다.
*/

SELECT ROUND (1234.56789, 2)
     , ROUND (1234.56111, 2)
     , ROUND (1234.56789)
FROM DUAL;


SELECT TRUNC (1234.56789, 1)
     , TRUNC (1234.56789, 2)
  FROM DUAL;


-- MOD : 숫자를 나눈 나머지 값을 구하는 함수
-- 홀수, 짝수를 구분할 때 사용
-- MOD (나눗셈 될 숫자, 나눌 숫자)

SELECT MOD (10,2)
     , MOD (10, 3)
     , MOD (15,6)
  FROM DUAL;

--------------------------------------------------------------------------------

-- [날짜형 함수]

-- SYSDATE : 현재 날짜와 시간을 출력해주는 함수
--> 입력 시 바로 출력이 되며, 현재 시간을 초 단위까지 출력 가능
-- 날짜형 데이터는 연산이 가능
--> 날짜 데이터끼리는 연산이 불가능

SELECT SYSDATE
  FROM DUAL;

-- 날짜 형식 세팅
-- 도구 -> 환경 설정 -> 데이터베이스 -> NLS -> 날짜 형식 -> YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS 오늘
     , SYSDATE - 1 AS "어제"
     , SYSDATE + 1 AS "내일"
 --    , SYSDATE + SYSDATE -> 날짜 데이터끼리는 연산이 불가
  FROM DUAL;
  
-- 날짜 데이터 활용
SELECT SYSDATE AS "현재"
     , SYSDATE +1 AS "하루 더함"
     , SYSDATE +1 /24 AS "한시간 더함"
     , SYSDATE +1 /24 /60 AS "일분 더함"
     , SYSDATE +1 /24 /60 /60 AS "일초 더함"
FROM DUAL;


-- ADD_MONTHS: 몇 개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜 데이터, 더하거나 뺄 개월 수)

SELECT SYSDATE AS 현재
     , ADD_MONTHS(SYSDATE, 1) AS "1개월 후"
     , ADD_MONTHS(SYSDATE, -3) AS "3개월 전"
  FROM DUAL;


--------------------------------------------------------------------------------

-- [변환형 함수]

-- 암시적 형 변환: 데이터베이스가 자동으로 형 변환을 해주는 것
-- 명시적 형 변환: 데이터 변환 형 함수를 사용해서 사용자가 직접 자료형을 지정해주는 것


-- 1. TO_CHAR : 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수
-- TO_CHAR(변환 할 데이터, 출력 형태)

SELECT SALARY
     , TO_CHAR(SALARY, 'L999,999')
  FROM EMPLOYEES;
  
-- DUAL 테이블을 이용해서 현재 날짜 형태를 'YY/MM/DD/DAY' 형태로 변환
SELECT SYSDATE
     , TO_CHAR (SYSDATE, 'YY/MM/DD/DAY')
  FROM DUAL;



-- 2.TO_NUMBER : 문자 데이터를 숫자 데이터로 변환하는 함수
-- TO_NUMBER(문자열 데이터, 인식될 숫자 형태)

SELECT TO_NUMBER('1,000' , '999,999') + 500
  FROM DUAL;
-- 문자형을 숫자 형태로 바뀌어서 연산이 가능해짐



-- 3. TO_DATE : 문자 데이터를 날짜 데이터로 변환하는 함수
-- TO_DATE(문자열 데이터, 인식될 날짜 형태)

SELECT TO_DATE('20240329', 'YYYY/MM/DD')
  FROM DUAL;


--------------------------------------------------------------------------------

/*
[NULL 처리 함수]
- NVL / NVL2 : NULL 값을 대체할 수 있는 함수

1) NVL (NULL인지 여부를 검사할 데이터, NULL일 경우 반환할 데이터)
2) NVL2 (NULL인지 여부를 검사할 데이터, NULL이 아닐 경우 반환할 데이터, NULL일 경우 반환할 데이터)

*/

-- 직원 테이블에서 보너스(COMMISSION_PCT가 NULL인 경우 숫자 0으로 대체해서 출력
SELECT FIRST_NAME, COMMISSION_PCT
     , NVL (COMMISSION_PCT, 0)
  FROM EMPLOYEES;
  
-- 직원 테이블에서 직원 ID, FIRST_NAME, MANAGER_ID를 출력
-- 매니저가 있는 직원은 '직원'으로 출력, 매니저가 없는 직원은 '대표' 로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
      , NVL2 (MANAGER_ID, '직원', '대표') AS 직급
  FROM EMPLOYEES;


--------------------------------------------------------------------------------

/*
[조건 함수]
- DECODE: 상황에 따라 다른 데이터를 변환하는 함수
  -> 검사 대상과 비교해서 지정한 값을 반환

- DECODE (검사 대상이 될 컬럼 또는 데이터 <1>, 비교값 <2>
         , 일치 시 반환 할 값 <3>, 일치하지 않을 때 반환 값 <마지막>)
*/

-- 직원 테이블에서 직원 ID, FIRST_NAME, MANAGER_ID를 출력
-- 매니저가 있는 직원은 '직원'으로 출력, 매니저가 없는 직원은 '대표' 로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE (MANAGER_ID, NULL, '대표', '직원')
  FROM EMPLOYEES;
  
  
  -- 매니저가 있는 직원은 '직원'으로 출력, 매니저가 없는 직원은 '대표' 로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE (MANAGER_ID, NULL, '대표', 102
     , '이사', 103, '감사', '직원')
  FROM EMPLOYEES;




















