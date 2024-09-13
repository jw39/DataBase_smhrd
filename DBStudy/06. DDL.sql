-- CHAPTER 06. DDL --
/*
- DDL�̶�?
- ������ ���Ǿ�� ���̺� ���� ����� ��ü�� ����ų� �����մϴ�.

- �� [DDL�� ��ɾ� ����]
- CREATE : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
- ALTER  : ���̺��� ��ü�� �����ϴ� ��ɾ�
- RENAME : ���̺��� �̸��� �����ϴ� ��ɾ�
- TRUNCATE : ���̺��� �����͸� �����ϴ� ��ɾ�
- DROP   : ���̺��� ��ü�� �����ϴ� ��ɾ�

- [���̺� ���� �� ���� ����ϴ� �ڷ���]
- VARCHAR2(N)  : ������ ������, Nũ�⸸ŭ �Է� ����
- NUMBER (P,S) : ������ ���� P�ڸ� ��ŭ �Է¹ް� S�ڸ� ��ŭ �Ҽ��� �Է¹���
 -> NUMBER(3,2) -> 9.99 //�� �� �ڸ��ε� �Ҽ��� ���ڸ�����,,, NUMBER (5,3) -> 99.999
 -> EX) AVG NUMBER(3,1) -> 99.9 ���� �������� �ʴ�!
 -> ����Ŭ �����ͺ��̽������� �Ǽ��� ���� ��� ǥ���� ����.
 -> �Ұ�ȣ ���� �� �ִ밪�� 38ũ�Ⱑ ����
- DATE : ���� ��¥ ���� �Է¹���

*/


-- �� [���̺� �����ϱ�]
-- ���������� ���̺��� �����ؼ� TEST_���������� ���̺� �����ϱ�
-- ���������� �� �巡�� �� �ڿ� SHIFT +F4 -> ���̺��� ����
CREATE TABLE TEST_����������(
    �л�ID VARCHAR2(9) PRIMARY KEY,
    �л��̸� VARCHAR2(50) NOT NULL,
    �Ҽӹ� VARCHAR(5)
);
SELECT * FROM TEST_����������;


-- ����ǥ ���̺��� ������ TEST_����ǥ ���̺� ����
CREATE TABLE TEST_����ǥ(
    �л�ID VARCHAR2(9),
    ���� VARCHAR2 (30),
    ���� NUMBER
);
SELECT * FROM TEST_����ǥ;


/*
- �� [���̺� ���� ��Ģ]
1. ��ҹ��� ���� �� ��
2. �ߺ��Ǵ� ���̺�� ��� ����
3. ���̺� �� �÷��� �ߺ� ����
4. ���ڷ� ����, ����� ��� �Ұ��� -> _ , $ , # �� ����
*/


-- LOGIN ������ ���̺� �ޱ�
CREATE TABLE TEST_LOGIN(
        ID VARCHAR2(20),
        PW VARCHAR2(20),
        EMAIL VARCHAR(20),
        NAME VARCHAR(20)
);
SELECT * FROM TEST_LOGIN;

/*
- [���� ����, CONSTRAINT]
- ���̺� �Է� ������ �����͸� �������� �����ϴ� ��
- �������� ��Ȯ���� �����ϱ� ���� �����
- ���� ���� ���� ��Ŀ� ���� �������� �����̳� ���� ���ο� ������ ����

-- [���� ������ ����]

- ��[PRIMARY KEY]�ڡڡڡ�
1. �����ϰ� �ϳ��� �ִ� ������ �⺻Ű��� �Ѵ�.
2. �ϳ��� ���̺� ������ �ϳ��� PK�� �־�� �Ѵ�.
3. �⺻Ű�� ���� �÷�, ���� ���� �÷����� ���� ����
4. �ĺ��� ��Ģ�� ������ �𵨸� �� ������ NULL�� �Է� �Ұ�, �ߺ� �Ұ��� Ư¡�� ����
-- (PK) ->  �⺻Ű, NOY NULL + UNIQUE -> NULL �Ұ� + �ߺ� �Ұ�

- [UNIQUE KEY]
1. �ߺ����� �ʴ� ������ ����Ű��� �Ѵ�.
2. �������� �ߺ��� ������� �ʰ��� 
-- (UK) ->  ����Ű, NULL�� �Է� ����. �� �ߺ� �Ұ�!!

- [NOT NULL]
- NULL�� �Ұ���, �� �ԷµǾ�� �ϴ� �������� �� ������

- [CHECK]
- T OR F �� ���� �� �ִ� ������ ����, ������ �����͸� �Է� ����

- ��[FOREIGN KEY]�ڡڡڡ�
- �ܷ�Ű, ���̺��� �����ϴ� Ű


--[������ ���Ἲ]
 : �����Ϳ� ������ ���� ���¸� �ǹ�. ��, �����Ͱ� ��Ȯ�ϰ� ��ȿ�ϰ� ������ ����
 
-- ���Ἲ �������� ����
  - ��ü ���Ἲ (PK) : �⺻Ű ����, �ϳ��� ���̺� �ߺ��� ���� �������� �ʵ��� ����
  - ���� ���Ἲ (FK) : ���� �Է�, ����, ������ �� �����Ǵ� �ٸ� ���̺�� �����Ͱ�
                      ��Ȯ�ϰ� �����ǵ��� ����.
                      ���� ���Կ� �ִ� �� ���̺��� �����Ͱ� �׻� �ϰ��� ���� ������ ��.
*/

-- [���� ���� �ǽ�]
-- [�̹� ������ ���̺� ���� ������ �����ϱ�]
SELECT * FROM TEST_LOGIN;

-- [���̺� PK �������� �����ϱ�]
-- ALTER TABLE ���̺� �� ADD CONSTRAINT �������� �̸� �������� (�÷�)
ALTER TABLE TEST_LOGIN ADD CONSTRAINT TEST_ID_PK PRIMARY KEY(ID);

-- [���̺� UK �������� �����ϱ�]
-- ALTER TABKE ���̺� �� ADD CONSTRAINT �������� �̸� �������� (�÷�);
ALTER TABLE TEST_LOGIN ADD CONSTRAINT TEST_EMAIL_UK UNIQUE (EMAIL);

-- [CHECK �������� �����ϱ�]
ALTER TABLE TEST_LOGIN ADD CONSTRAINT TEST_PW_CHECK CHECK(LENGTH(PW) > 3);

-- [�̹� ������ ���̺� FK �������� ����]
-- ALTER TABLE ���̺� �� ADD CONSTRAINT �������� �̸� �������� (�÷�)
-- REFERENCES ���� ���̺�(�����÷���);
ALTER TABLE TEST_����ǥ ADD CONSTRAINT �л�_ID_FK FOREIGN KEY(�л�ID)
REFERENCES ����������(�л�ID);

-- [�������� �����ϱ�]
-- ALTER TABLE ���̺� �̸� MODIFY �÷��� �ٲ� ��������;
ALTER TABLE TEST_LOGIN MODIFY NAME NOT NULL;

-- [�������� ����]
-- ALTER TABLE ���̺�� DROP CONSTRAINT �������� �̸�;
ALTER TABLE TEST_LOGIN DROP CONSTRAINT TEST_PW_CHECK;

--------------------------------------------------------------------------------
-- [���̺� ���� �ǽ�]
-- ���̺� ���� ��� 1
CREATE TABLE TB_TEST1 (
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(LENGTH(CK�׽�Ʈ) > 5)
);

-- ���̺� ���� ���2
CREATE TABLE TB_TEST2 (
    PK�׽�Ʈ NUMBER,
    UK�׽�Ʈ NUMBER,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER,
    FK�׽�Ʈ NUMBER,
    CONSTRAINT PK�׽�Ʈ_PK PRIMARY KEY(PK�׽�Ʈ),
    CONSTRAINT UK�׽�Ʈ_UK UNIQUE(UK�׽�Ʈ),
    CONSTRAINT CK�׽�Ʈ_CK CHECK(CK�׽�Ʈ > 0 ),
    CONSTRAINT FK�׽�Ʈ_FK FOREIGN KEY(FK�׽�Ʈ) REFERENCES TB_TEST1(PK�׽�Ʈ)
);



-- [���̺� �÷� �߰��ϱ�]
-- ALTER TABLE ���̺�� ADD �÷��� �ڷ���(ũ��);
ALTER TABLE TEST_LOGIN ADD ADDRESS VARCHAR2(10);
SELECT * FROM TEST_LOGIN;

-- [�÷��� �ڷ����� �ݰ��ϱ�]
-- ALTER TABLE ���̺�� MODIFY �÷��� �ٲ� ��������(����);
ALTER TABLE TEST_LOGIN MODIFY ADDRESS VARCHAR(20);

-- [�÷��� �̸� ����]
-- ALTER TABLE ���̺�� RENAME COLUMN ���� �÷��� TO ������ �÷���;
ALTER TABLE TEST_LOGIN RENAME COLUMN ADDRESS TO ADDR;

-- [���� �÷� �����ϱ�]
-- ALTER TABLE ���̺�� DROP COLUMN ������ �÷�;
ALTER TABLE TEST_LOGIN DROP COLUMN ADDR;




-- [���̺� �̸� �����ϱ�]
-- RENAME ���� ���̺� �̸� TO �ٲ� ���̺� �̸�;
RENAME TEST_LOGIN TO WON_LOGIN;
SELECT * FROM WON_LOGIN;

-- [���̺� ����]
-- DROP TABLE ���̺��;
DROP TABLE TEST_����������;
DROP TABLE TEST_����ǥ;



-- [TRUNCATE]
-- : ���̺��� �����͸� ���� ����
-- TRUNCATE TABLE ���̺� �̸�;

-- TRUNCATE �ǽ��� ���� ���̺� �����ϱ�
-- CREATE TABLE �� ���̺� �� AS SELECT * FROM ������ ������ ���̺� ��;
CREATE TABLE DROP_����ǥ AS SELECT * FROM ����ǥ;
--> ����ǥ ���̺�� ������ �����͸� ������ ���̺��� �����ϴ� ������
--> ���������� ������� ���� !! (NOT NULL�� ����)

SELECT * FROM DROP_����ǥ;
TRUNCATE TABLE DROP_����ǥ;



--------------------------------------------------------------------------------




































