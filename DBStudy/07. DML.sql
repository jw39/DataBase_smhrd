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
- ��[DML]
- ������ ���۾�� ���̺� �����͸� ��ȸ, �߰�, ����, ������ �� ����ϴ� ���Ǿ�
- ���̺��� ���ϴ� �����͸� �Է�, ����, �����Ѵ�.

- DML ����
- SELECT : ������ ��ȸ
- INSERT : ������ �߰�
- UPDATE : ������ ����
- DELETE : ������ ����

- ��� ���
- 1) INSERT INTO ���̺� �̸� (�÷�1, �÷�2,...)
     VALUES (��1, ��2....)
     --> INSERT INTO�� �Է��� �÷��� VALUES�� �Է��� ���� ������ �ڷ����� �¾ƾ� �Ѵ�. 
     
- 2) INSERT TNTO ���̺� �̸�
     VALUEST (��...)
     --> INSERT INTO �� �÷� ����Ʈ�� ���� ��
         VALUES�� �Է��� ���� ���̺��� �÷� ���� ������ �¾ƾ� �Ѵ�.
*/

-- [����� (1) �÷� ����Ʈ�� �Ἥ INSERT �ϴ� ���]
-- 1. TEST_JOIN ���̺� ���� ���� �ֱ�
INSERT INTO TEST_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD1', '12345', '���ؿ�', SYSDATE, 23, '010-3568-3904', 'rtcho3902@naver.com');

-- 2. ģ���� ���� �ֱ�
INSERT INTO TEST_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD2', '39393', '������', SYSDATE, 24, '010-4385-8571', 'akdlwb1212@naver.com');

-- ���̺� NULL �� �Է��ϱ� (1) -> NULL�� ��������� �Է������.
INSERT INTO TEST_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD3', '22222', '���Գ�',SYSDATE, 38, NULL, '');

-- ���̺� NULL�� �Է��ϱ� (2) -> NULL�� �Ͻ������� �Է������.
INSERT INTO TEST_JOIN (ID, PW, NAME, JOIN_DATE, AGE)
VALUES ('SMHRD4', '44444', '�ڼ���',SYSDATE, 25);

SELECT * FROM TEST_JOIN;

-- [����� (2), �÷� ����Ʈ�� ���� �ʰ� INSERT �ϴ� ���]
INSERT INTO TEST_JOIN
VALUES ('SMHRD5', '55555', '������', SYSDATE, 24, '010-3588-4239', 'ju4239@naver.com');
--> ���� �Է°��� ���� ���� ���̺� ��õ� �÷��� ������ �Ȱ��� ��� �Ѵ�.

--------------------------------------------------------------------------------
/*
- ��[UPDATE]
  - ���̺��� �����͸� �����ϰ� ���� �� ���

- ��� ���
  UPDATE ���̺� ��
  SET ������ �÷� = ������,...
  WHERE �����͸� ������ ����� ���� �����ϱ� ���� ���ǽ�;
  -> �ڡ�WHERE �������� ������ ��� ���̺� �� ����� ��� �÷��� �����Ͱ� ������ �ȴ�.
*/

SELECT * FROM TEST_JOIN;

UPDATE TEST_JOIN
   SET EMAIL = 'akdlwb1212@naver.com'
WHERE NAME = '������';

-- ������ �� ���� PK�� �Ŵ� ���� ���� �ùٸ���

UPDATE TEST_JOIN
   SET TEL = '010-3333-3333', EMAIL = 'KANG@naver.com'
WHERE ID = 'SMHRD3';

--------------------------------------------------------------------------------
/*
- ��[DELETE]
  - ���̺��� �����͸� �����ϰ� ���� �� ���

- ��� ���
  DLEETE FROM ���̺� ��
  WHERE �����͸� ������ ����� ���� �����ϱ� ���� ���ǽ�;
  -> �ڡ�WHERE �������� ������ ��� ���̺� �� ����� ��� �����Ͱ� �����ȴ�.
*/

DELETE FROM TEST_JOIN
WHERE ID = 'SMHRD3';

SELECT * FROM TEST_JOIN;

-- 30�� ������ ȸ������ ������ ����
DELETE FROM TEST_JOIN
WHERE AGE <= 30;

ROLLBACK; --> �ǵ����� ��ɾ�!!!

DELETE FROM TEST_JOIN;













