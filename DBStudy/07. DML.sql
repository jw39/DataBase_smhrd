-- CHAPTER 07. DML (Data Manipulation Language) --

CREATE TABLE TEST_JOIN(
    ID VARCHAR2(20)   PRIMARY KEY ,
    PW VARCHAR2(20)   NOT NULL,
    NAME VARCHAR2(10) NOT NULL,
    JOIN_DATE DATE,
    AGE NUMBER(3),
    TEL VARCHAR2(20),
    EMAIL VARCHAR2(50) UNIQUE
);


--------------------------------------------------------------------------------
/*
- ※[DML]
- 데이터 조작어로 테이블에 데이터를 조회, 추가, 수정, 삭제할 때 사용하는 질의어
- 테이블에서 원하는 데이터를 입력, 수정, 삭제한다.

- DML 유형
- SELECT : 데이터 조회
- INSERT : 데이터 추가
- UPDATE : 데이터 수정
- DELETE : 데이터 삭제

- 사용 방법
- 1) INSERT INTO 테이블 이름 (컬럼1, 컬럼2,...)
     VALUES (값1, 값2....)
     --> INSERT INTO에 입력한 컬럼과 VALUES에 입력한 값은 순서와 자료형아 맞아야 한다. 
     
- 2) INSERT TNTO 테이블 이름
     VALUEST (값...)
     --> INSERT INTO 에 컬럼 리스트를 생략 시
         VALUES에 입력한 값은 테이블의 컬럼 수의 순서와 맞아야 한다.
*/

-- [사용방법 (1) 컬럼 리스트를 써서 INSERT 하는 방법]
-- 1. TEST_JOIN 테이블에 나의 정보 넣기
INSERT INTO TEST_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD1', '12345', '조준용', SYSDATE, 23, '010-3568-3904', 'rtcho3902@naver.com');

-- 2. 친구의 정보 넣기
INSERT INTO TEST_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD2', '39393', '최지원', SYSDATE, 24, '010-4385-8571', 'akdlwb1212@naver.com');

-- 테이블에 NULL 값 입력하기 (1) -> NULL을 명시적으로 입력해줬다.
INSERT INTO TEST_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD3', '22222', '강규남',SYSDATE, 38, NULL, '');

-- 테이블에 NULL값 입력하기 (2) -> NULL을 암시적으로 입력해줬다.
INSERT INTO TEST_JOIN (ID, PW, NAME, JOIN_DATE, AGE)
VALUES ('SMHRD4', '44444', '박수현',SYSDATE, 25);

SELECT * FROM TEST_JOIN;

-- [사용방법 (2), 컬럼 리스트를 쓰지 않고 INSERT 하는 방법]
INSERT INTO TEST_JOIN
VALUES ('SMHRD5', '55555', '박주헌', SYSDATE, 24, '010-3588-4239', 'ju4239@naver.com');
--> 실제 입력값을 적을 때는 테이블에 명시된 컬럼의 순서와 똑같이 써야 한다.

--------------------------------------------------------------------------------
/*
- ※[UPDATE]
  - 테이블의 데이터를 변경하고 싶을 때 사용

- 사용 방법
  UPDATE 테이블 명
  SET 변경할 컬럼 = 데이터,...
  WHERE 데이터를 변경할 대상의 행을 선별하기 위한 조건식;
  -> ★★WHERE 조건절을 생략할 경우 테이블 내 저장된 모든 컬럼의 데이터가 변경이 된다.
*/

SELECT * FROM TEST_JOIN;

UPDATE TEST_JOIN
   SET EMAIL = 'akdlwb1212@naver.com'
WHERE NAME = '최지원';

-- 조건을 걸 때는 PK로 거는 것이 가장 올바르다

UPDATE TEST_JOIN
   SET TEL = '010-3333-3333', EMAIL = 'KANG@naver.com'
WHERE ID = 'SMHRD3';

--------------------------------------------------------------------------------
/*
- ※[DELETE]
  - 테이블의 데이터를 삭제하고 싶을 때 사용

- 사용 방법
  DLEETE FROM 테이블 명
  WHERE 데이터를 삭제할 대상의 행을 선별하기 위한 조건식;
  -> ★★WHERE 조건절을 생략할 경우 테이블 내 저장된 모든 데이터가 삭제된다.
*/

DELETE FROM TEST_JOIN
WHERE ID = 'SMHRD3';

SELECT * FROM TEST_JOIN;

-- 30살 이하인 회원들의 정보를 삭제
DELETE FROM TEST_JOIN
WHERE AGE <= 30;

ROLLBACK; --> 되돌리는 명령어!!!

DELETE FROM TEST_JOIN;













