-- CHAPTER 10. DCL (데이터 조작어) --

/* 
-- DCL (Data Control Language)
--> 데이터베이스에 접근하거나 객체에 권한을 주는 등의 역할을 하는 언어

- [ DCL의 명령어 종류 ]
- GRANT  : 권한을 부여하는 명령어
- REVOKE : 권한을 회수하는 명령어
- ROLE   : 권한을 묶어서 부여할 때 사용하는 명령어

- 사용자란?
-> 데이터베이스에 접속하여 데이터를 관리하는 '계정'을 사용자 (USER) 라고 합니다

- 사용자 생성방법
- CREATE USER    사용자 이름
- INDENTIFIED BY 패스워드

- 권한 부여
- GRANT     시스템 권한 (필수)
- TO        사용자 (USER) (필수)
- WITH ADMIN OPTION (선택) --> GRANT문을 통해 부여받는 권한을 다른 사람에게 부여할 수 있는 권한도 함께 부여 받는 것

-- GRANT CREATE SESSION TO DCL_TEST;

- 권한 회수
- REVOKE    시스템 권한
- FROM      사용자 (USER)

*/



CREATE TABLE 테스트(
    TEST NUMBER
);

-- ORA-01031: insufficient privileges --> 권한이 충분하지 않다!


/*
- 스키마란?
-> 데이터베이스에서 저장되는 데이터 구조와 제약 조건 등을 정의한 구조
-> 테이블, 뷰, 인덱스, 시퀀스 등의 HR 계정의 모든 객체는 HR의 스키마
-> 스키마는 각 계정마다 존재하며, 이름이 계정과 같다.
-> 오라클에서는 스키마와 사용자를 구분하지 않고 사용한다.

- 스키마.테이블.테이블컬럼
*/
SELECT * FROM HR.EMPLOYEES;
--> '테이블이 존재하지 않는다' 라는 에러가 뜨는 이유는 SELECT 권한이 없기 때문!
--> 테이블이 존재는 하지만 보안상의 이유로 없다 라고 표현을 하는 것 뿐
--> 테이블이 있다 라는 것을 드러내지 않기 위해서,, 경우의 수를 아예 주지 않는 것















