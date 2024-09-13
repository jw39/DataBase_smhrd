-- CHAPTER 05. JOIN --
/*
- ※[JOIN]※
- 여러 테이블에 필요한 데이터를 한 번에 가져오는 기술

- 비등가 조인 (NON EQUI JOIN)
: 두개의 테이블 간의 서로 정확하게 일치하지 않은 경우 활용하는 조인
-> 등가 연산자 (=) 가 아닌 연산자들을 사용한 조인을 의미 (<,<=,>,>=, BETWEEN)

- 등가 조인 (EQUI JOIN)
: 두 개의 테이블 간에 서로 정확하게 일치하는 경우 활용하는 조인
-> 등가 연산자를 사용해서 조인을 의미 (=)
-> 가장 많이 사용되는 조인의 형태

- [등가 조인 사용 방법]
SELECT 테이브1.컬럼, 테이블 2.컬럼 -> 해당 테이블에 있는 컬럼 조회
  FROM 테이블 1, 테이블 2 -> 테이블 1과 테이블 2를 JOIN 하겠다.
 WHERE 테이블1.컬럼값 = 테이블2.컬럼값; -> 같은 값을 가지는 조인 조건 작성
*/

-- 수강생정보 테이블과 성적표 테이블에서 학생ID, 과목, 성적 순으로 출력

-- 1. 조인할 대상 테이블 정보 확인
SELECT * FROM 수강생정보;
SELECT * FROM 성적표;

-- 2. FROM절에 조회할 테이블을 ,(컴마) 기준으로 작성

-- 3. 조인 조건이 되는 특정 컬럼 확인하여, WHERE 조건절에 조인 조건 작성
--> 조인 조건이 되는 특정 컬럼 : 조인할 테이블 간에 같은 값을 가지는 컬럼
--> 조인 조건이 되는 특정 컬럼은 PK와 FK 관계로 대부분 이루어진다.
--> 하지만 다 그런 것은 아님

-- 4. SELECT 절에 출력하고자 하는 컬럼을 .(경로)를 통해서 출력
SELECT 수강생정보.학생ID, 수강생정보.학생이름
     , 성적표.과목, 성적표.성적
  FROM 수강생정보, 성적표
 WHERE 수강생정보.학생ID = 성적표.학생ID;
 
-- 별칭 사용
SELECT A.학생ID, A.학생이름
     , B.과목,   B.성적
  FROM 수강생정보 A, 성적표 B
 WHERE A.학생ID = B.학생ID;

-- 직원의 직원ID, FRIST_NAME, 부서 이름 순으로 조회해보세요
SELECT E.EMPLOYEE_ID, E.FIRST_NAME
     , D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 직원ID가 100인 직원의 FRIST_NAME과 부서 이름을 출력
SELECT E.EMPLOYEE_ID AS "직원ID", E.FIRST_NAME
     , D.DEPARTMENT_NAME AS "부서이름" 
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
   AND E.EMPLOYEE_ID = 100;


--------------------------------------------------------------------------------
/*
- ANSI 조인 문법: 미국 표준협회에서 만든 모든 DBMS에서 사용 가능한 문법

- ※[INNER JOIN]
- 내부 조인이라고도 하며 조인 조건에서 동일한 값이 있는 행만 반환

- [사용 방법]
SELECT 조회할 컬럼명1,...
  FROM 테이블 1 (INNER) JOIN 테이블 2
    ON (테이블1.컬럼) = 테이블2.컬럼) --> 조인 조건
 WHERE 일반 조건절 --> 조인 조건 외 다른 조건
*/

-- 직원 테이블과 직업 테이블에서 직원ID와 직업ID, 직업TITLE 출력
SELECT EMPLOYEES.EMPLOYEE_ID AS "직원ID", JOBS.JOB_ID, JOBS.JOB_TITLE
FROM JOBS JOIN EMPLOYEES 
ON JOBS.JOB_ID = EMPLOYEES.JOB_ID;


-- 위 문제 별칭 사용
SELECT E.EMPLOYEE_ID AS "직원ID", J.JOB_ID, J.JOB_TITLE
FROM JOBS  J INNER JOIN EMPLOYEES E 
ON J.JOB_ID = E.JOB_ID;


-- 직원 테이블에서 직원 아이디와 부서 아이디
-- 부서 테이블에서 부서 이름을 순서대로 출력 (INNER JOIN)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);
    
-- 단독적으로 존재하는 컬럼은 .(경로)를 안적어줘도 상관없다.

--------------------------------------------------------------------------------
/*
- ※[CROSS JOIN]
- 조인 조건절을 적지 않고 테이블의 모든 데이터를 가지고 오는 방법
--> 조인 조건이 없는 경우 생길 수 있는 모든 데이터의 조합을 조회
--> 카티션 곱이라고도 부른다. -> 모든 경우의 수가 출력

- [CROSS JOIN의 사용 방법]
SELECT 조회할 테이블 명1,...
FROM 테이블 1 CROSS JOIN 테이블 2

*/

-- 직원 테이블에서 직원 아이디와 부서 아이디
-- 부서 테이블에서 부서 이름을 순서대로 출력 (CROSS JOIN 활용)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;
  
  
-- 문제 1. 각 부서의 매니저 직원들의 부서 이름, 매니저 아이디, FIRST_NAME 출력
SELECT  D.DEPARTMENT_NAME AS "부서 이름"
      , D.MANAGER_ID AS "매니저  ID"
      , E.FIRST_NAME 
  FROM  DEPARTMENTS D JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID); 
-- 직원 아이디와 매니저 아이디가 같으니까,, 그 중 같은 값을 가지는 녀석을 출력하겠다
-- 무조건 같은 값을 조인 조건에 기술하는 것이 아니라 
-- 구하려는 값에 맞는 조인 조건을 걸어줘야 된다!
-- 부서 테이블에서 매니저 아이디와 직원 테이블의 매니저 아이디가 
-- 같은 걸로 조인하면 올바른 값이 나오나? 노오오 스티븐은 매니저 없어서 NULL임
    
SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;


--------------------------------------------------------------------------------
/*
[OUTET JOIN]
- 외부 조인이라고도 하며, 두 개의 테이블 간의 교집합을 조회하고
- 한쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을 때 사용하는 조인 문법
--> 한쪽 데이터의 NULL 값도 출력하고 싶을 때 사용

[LEFT OUTER JOIN]
- 왼쪽 테이블을 기준으로 NULL값도 포함하여 출력
--> 오라클 문법 조인 시 : 조인 조건절에 반대인 오른쪽 컬럼에 (+) 기호 작성

[RIGHT OUTER JOIN]
- 오른쪽 테이블을 기준으로 NULL값도 포함하여 출력
--> 오라클 문법 조인 시 : 조인 조건절에 반대인 왼쪽 컬럼에 (+) 기호 작성

[FULL OUTER JOIN]
- 양쪽의 NULL값도 포함하여 출력
--> 오라클 문법에서는 지원 안함, UNION 연산자로 같은 값을 출력하는 방법이 있다.
*/

-- 문제 1. 각 부서의 매니저 직원들의 부서 이름, 매니저 아이디, FIRST_NAME 출력
--> 부서 테이블의 각 매니저 이름의 정보가 출력이 됐다.
SELECT * FROM DEPARTMENTS;
  
-- (ANSI문법) LEFT OUTER JOIN 활용해 모든 부서 출력
SELECT  D.DEPARTMENT_NAME AS "부서 이름"
      , D.MANAGER_ID AS "매니저  ID"
      , E.FIRST_NAME 
  FROM  DEPARTMENTS D LEFT JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);
    
-- (오라클 문법) LEFT OUTER JOIN
SELECT D.DEPARTMENT_NAME,  D.MANAGER_ID , E.FIRST_NAME
  FROM  DEPARTMENTS D,  EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID (+);

-- (ANSI문법) RIGHT OUTER JOIN
SELECT  D.DEPARTMENT_NAME AS "부서 이름"
      , D.MANAGER_ID AS "매니저  ID"
      , E.FIRST_NAME 
  FROM  DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);
    
-- 오라클 문법
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID (+) = E.EMPLOYEE_ID;
  
-- FULL OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM  DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID;
-- 16개의 행 (LEFT JOIN) + 107개의 행 (RIGHT JOIN)= 123개의 행이 나온다.

--------------------------------------------------------------------------------

-- [3개 테이블 조인]
-- 부서 테이블, 위치 테이블, 나라 테이블을 INNER JOIN 해서
-- 부서 이름, 도시와 나라 이름을 출력
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM DEPARTMENTS D JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
  JOIN COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID);
  
-- 오라클 문법
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM DEPARTMENTS D , LOCATIONS L, COUNTRIES C
 WHERE D.LOCATION_ID = L.LOCATION_ID
   AND L.COUNTRY_ID = C.COUNTRY_ID;

  

  


  
  
  
  
  
  
  
  
  
  
  
  

