-- CHAPTER 06. DDL --
/*
- DDL이란?
- 데이터 정의어로 테이블 같은 저장소 객체를 만들거나 수정합니다.

- ※ [DDL의 명령어 종류]
- CREATE : 테이블 같은 객체를 생성하는 명령어
- ALTER  : 테이블같은 객체를 변경하는 명령어
- RENAME : 테이블의 이름을 변경하는 명령어
- TRUNCATE : 테이블의 데이터를 삭제하는 명령어
- DROP   : 테이블같은 객체를 삭제하는 명령어

- [테이블 생성 시 자주 사용하는 자료형]
- VARCHAR2(N)  : 가변형 문자형, N크기만큼 입력 받음
- NUMBER (P,S) : 숫자형 값을 P자리 만큼 입력받고 S자리 만큼 소수를 입력받음
 -> NUMBER(3,2) -> 9.99 //총 세 자리인데 소수점 두자리까지,,, NUMBER (5,3) -> 99.999
 -> EX) AVG NUMBER(3,1) -> 99.9 살은 적절하지 않다!
 -> 오라클 데이터베이스에서는 실수와 정수 모두 표현이 가능.
 -> 소괄호 생략 시 최대값인 38크기가 들어간다
- DATE : 현재 날짜 값을 입력받음

*/


-- ※ [테이블 생성하기]
-- 수강생정보 테이블을 참고해서 TEST_수강생정보 테이블 생성하기
-- 수강생정보 만 드래그 한 뒤에 SHIFT +F4 -> 테이블의 정보
CREATE TABLE TEST_수강생정보(
    학생ID VARCHAR2(9) PRIMARY KEY,
    학생이름 VARCHAR2(50) NOT NULL,
    소속반 VARCHAR(5)
);
SELECT * FROM TEST_수강생정보;


-- 성적표 테이블을 가지고 TEST_성적표 테이블 생성
CREATE TABLE TEST_성적표(
    학생ID VARCHAR2(9),
    과목 VARCHAR2 (30),
    성적 NUMBER
);
SELECT * FROM TEST_성적표;


/*
- ※ [테이블 생성 규칙]
1. 대소문자 구분 안 함
2. 중복되는 테이블명 사용 금지
3. 테이블 내 컬럼명 중복 금지
4. 문자로 시작, 예약어 사용 불가능 -> _ , $ , # 는 가능
*/


-- LOGIN 가능한 테이블 받기
CREATE TABLE TEST_LOGIN(
        ID VARCHAR2(20),
        PW VARCHAR2(20),
        EMAIL VARCHAR(20),
        NAME VARCHAR(20)
);
SELECT * FROM TEST_LOGIN;

/*
- [제약 조건, CONSTRAINT]
- 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
- 데이터의 정확성을 유지하기 위해 실행됨
- 제약 조건 지정 방식에 따라 데이터의 수정이나 삭제 여부에 영향을 받음

-- [제약 조건의 종류]

- ※[PRIMARY KEY]★★★★
1. 유일하게 하나만 있는 값으로 기본키라고 한다.
2. 하나의 테이블에 무조건 하나의 PK는 있어야 한다.
3. 기본키는 단일 컬럼, 여러 개의 컬럼으로 구성 가능
4. 식별자 규칙을 물리적 모델링 한 것으로 NULL값 입력 불가, 중복 불가의 특징을 가짐
-- (PK) ->  기본키, NOY NULL + UNIQUE -> NULL 불가 + 중복 불가

- [UNIQUE KEY]
1. 중복되지 않는 값으로 고유키라고 한다.
2. 데이터의 중복을 허용하지 않고자 
-- (UK) ->  고유키, NULL값 입력 가능. 단 중복 불가!!

- [NOT NULL]
- NULL값 불가능, 꼭 입력되어야 하는 데이터일 때 설정함

- [CHECK]
- T OR F 로 평가할 수 있는 논리식을 지정, 지정한 데이터만 입력 가능

- ※[FOREIGN KEY]★★★★
- 외래키, 테이블을 연결하는 키


--[데이터 무결성]
 : 데이터에 결함이 없는 상태를 의미. 즉, 데이터가 정확하고 유효하게 유지된 상테
 
-- 무결성 제약조건 종류
  - 개체 무결성 (PK) : 기본키 제약, 하나의 테이블에 중복된 행이 존재하지 않도록 규정
  - 참조 무결성 (FK) : 행을 입력, 수정, 삭제할 때 연관되는 다른 테이블과 데이터가
                      정확하게 유지되도록 규정.
                      참조 관게에 있는 두 테이블의 데이터가 항상 일관된 값을 가져야 함.
*/

-- [제약 조건 실습]
-- [이미 생성된 테이블에 제약 조건을 지정하기]
SELECT * FROM TEST_LOGIN;

-- [테이블에 PK 제약조건 지정하기]
-- ALTER TABLE 테이블 명 ADD CONSTRAINT 제약조건 이름 제약조건 (컬럼)
ALTER TABLE TEST_LOGIN ADD CONSTRAINT TEST_ID_PK PRIMARY KEY(ID);

-- [테이블에 UK 제약조건 지정하기]
-- ALTER TABKE 테이블 명 ADD CONSTRAINT 제약조건 이름 제약조건 (컬럼);
ALTER TABLE TEST_LOGIN ADD CONSTRAINT TEST_EMAIL_UK UNIQUE (EMAIL);

-- [CHECK 제약조건 지정하기]
ALTER TABLE TEST_LOGIN ADD CONSTRAINT TEST_PW_CHECK CHECK(LENGTH(PW) > 3);

-- [이미 생성된 테이블에 FK 제약조건 지정]
-- ALTER TABLE 테이블 명 ADD CONSTRAINT 제약조건 이름 제약조건 (컬럼)
-- REFERENCES 참조 테이블(참조컬럼명);
ALTER TABLE TEST_성적표 ADD CONSTRAINT 학생_ID_FK FOREIGN KEY(학생ID)
REFERENCES 수강생정보(학생ID);

-- [제약조건 변경하기]
-- ALTER TABLE 테이블 이름 MODIFY 컬럼명 바꿀 제약조건;
ALTER TABLE TEST_LOGIN MODIFY NAME NOT NULL;

-- [제약조건 삭제]
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건 이름;
ALTER TABLE TEST_LOGIN DROP CONSTRAINT TEST_PW_CHECK;

--------------------------------------------------------------------------------
-- [테이블 생성 실습]
-- 테이블 생성 방법 1
CREATE TABLE TB_TEST1 (
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(LENGTH(CK테스트) > 5)
);

-- 테이블 생성 방법2
CREATE TABLE TB_TEST2 (
    PK테스트 NUMBER,
    UK테스트 NUMBER,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER,
    FK테스트 NUMBER,
    CONSTRAINT PK테스트_PK PRIMARY KEY(PK테스트),
    CONSTRAINT UK테스트_UK UNIQUE(UK테스트),
    CONSTRAINT CK테스트_CK CHECK(CK테스트 > 0 ),
    CONSTRAINT FK테스트_FK FOREIGN KEY(FK테스트) REFERENCES TB_TEST1(PK테스트)
);



-- [테이블에 컬럼 추가하기]
-- ALTER TABLE 테이블명 ADD 컬럼명 자료형(크기);
ALTER TABLE TEST_LOGIN ADD ADDRESS VARCHAR2(10);
SELECT * FROM TEST_LOGIN;

-- [컬럼의 자료형을 반경하기]
-- ALTER TABLE 테이블명 MODIFY 컬럼명 바꿀 제약조건(길이);
ALTER TABLE TEST_LOGIN MODIFY ADDRESS VARCHAR(20);

-- [컬럼의 이름 변경]
-- ALTER TABLE 테이블명 RENAME COLUMN 기존 컬럼명 TO 변경할 컬럼명;
ALTER TABLE TEST_LOGIN RENAME COLUMN ADDRESS TO ADDR;

-- [기존 컬럼 삭제하기]
-- ALTER TABLE 테이블명 DROP COLUMN 삭제할 컬럼;
ALTER TABLE TEST_LOGIN DROP COLUMN ADDR;




-- [테이블 이름 변경하기]
-- RENAME 원래 테이블 이름 TO 바꿀 테이블 이름;
RENAME TEST_LOGIN TO WON_LOGIN;
SELECT * FROM WON_LOGIN;

-- [테이블 삭제]
-- DROP TABLE 테이블명;
DROP TABLE TEST_수강생정보;
DROP TABLE TEST_성적표;



-- [TRUNCATE]
-- : 테이블의 데이터를 영구 삭제
-- TRUNCATE TABLE 테이블 이름;

-- TRUNCATE 실습을 위한 테이블 복사하기
-- CREATE TABLE 새 테이블 명 AS SELECT * FROM 데이터 복사할 테이블 명;
CREATE TABLE DROP_성적표 AS SELECT * FROM 성적표;
--> 성적표 테이블과 동일한 데이터를 거지는 테이블을 복사하는 쿼리문
--> 제약조건은 복사되지 않음 !! (NOT NULL은 제외)

SELECT * FROM DROP_성적표;
TRUNCATE TABLE DROP_성적표;



--------------------------------------------------------------------------------




































