-- 테이블 생성
-- 테이블 이름 : DataMember
-- id varchar2(50) pk, pw varchar2(50), name varchar2(50), age number

CREATE TABLE DataMember(
        ID varchar2(50) PRIMARY KEY,
        PW varchar2(50)NOT NULL,
        NAME varchar2(50) NOT NULL,
        AGE number
    );
    
SELECT name from datamember;
SELECT * FROM DATAMEMBER;

