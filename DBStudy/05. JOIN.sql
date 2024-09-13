-- CHAPTER 05. JOIN --
/*
- ��[JOIN]��
- ���� ���̺� �ʿ��� �����͸� �� ���� �������� ���

- �� ���� (NON EQUI JOIN)
: �ΰ��� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ���� ���� ��� Ȱ���ϴ� ����
-> � ������ (=) �� �ƴ� �����ڵ��� ����� ������ �ǹ� (<,<=,>,>=, BETWEEN)

- � ���� (EQUI JOIN)
: �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ�ϴ� ��� Ȱ���ϴ� ����
-> � �����ڸ� ����ؼ� ������ �ǹ� (=)
-> ���� ���� ���Ǵ� ������ ����

- [� ���� ��� ���]
SELECT ���̺�1.�÷�, ���̺� 2.�÷� -> �ش� ���̺� �ִ� �÷� ��ȸ
  FROM ���̺� 1, ���̺� 2 -> ���̺� 1�� ���̺� 2�� JOIN �ϰڴ�.
 WHERE ���̺�1.�÷��� = ���̺�2.�÷���; -> ���� ���� ������ ���� ���� �ۼ�
*/

-- ���������� ���̺�� ����ǥ ���̺��� �л�ID, ����, ���� ������ ���

-- 1. ������ ��� ���̺� ���� Ȯ��
SELECT * FROM ����������;
SELECT * FROM ����ǥ;

-- 2. FROM���� ��ȸ�� ���̺��� ,(�ĸ�) �������� �ۼ�

-- 3. ���� ������ �Ǵ� Ư�� �÷� Ȯ���Ͽ�, WHERE �������� ���� ���� �ۼ�
--> ���� ������ �Ǵ� Ư�� �÷� : ������ ���̺� ���� ���� ���� ������ �÷�
--> ���� ������ �Ǵ� Ư�� �÷��� PK�� FK ����� ��κ� �̷������.
--> ������ �� �׷� ���� �ƴ�

-- 4. SELECT ���� ����ϰ��� �ϴ� �÷��� .(���)�� ���ؼ� ���
SELECT ����������.�л�ID, ����������.�л��̸�
     , ����ǥ.����, ����ǥ.����
  FROM ����������, ����ǥ
 WHERE ����������.�л�ID = ����ǥ.�л�ID;
 
-- ��Ī ���
SELECT A.�л�ID, A.�л��̸�
     , B.����,   B.����
  FROM ���������� A, ����ǥ B
 WHERE A.�л�ID = B.�л�ID;

-- ������ ����ID, FRIST_NAME, �μ� �̸� ������ ��ȸ�غ�����
SELECT E.EMPLOYEE_ID, E.FIRST_NAME
     , D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- ����ID�� 100�� ������ FRIST_NAME�� �μ� �̸��� ���
SELECT E.EMPLOYEE_ID AS "����ID", E.FIRST_NAME
     , D.DEPARTMENT_NAME AS "�μ��̸�" 
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
   AND E.EMPLOYEE_ID = 100;


--------------------------------------------------------------------------------
/*
- ANSI ���� ����: �̱� ǥ����ȸ���� ���� ��� DBMS���� ��� ������ ����

- ��[INNER JOIN]
- ���� �����̶�� �ϸ� ���� ���ǿ��� ������ ���� �ִ� �ุ ��ȯ

- [��� ���]
SELECT ��ȸ�� �÷���1,...
  FROM ���̺� 1 (INNER) JOIN ���̺� 2
    ON (���̺�1.�÷�) = ���̺�2.�÷�) --> ���� ����
 WHERE �Ϲ� ������ --> ���� ���� �� �ٸ� ����
*/

-- ���� ���̺�� ���� ���̺��� ����ID�� ����ID, ����TITLE ���
SELECT EMPLOYEES.EMPLOYEE_ID AS "����ID", JOBS.JOB_ID, JOBS.JOB_TITLE
FROM JOBS JOIN EMPLOYEES 
ON JOBS.JOB_ID = EMPLOYEES.JOB_ID;


-- �� ���� ��Ī ���
SELECT E.EMPLOYEE_ID AS "����ID", J.JOB_ID, J.JOB_TITLE
FROM JOBS  J INNER JOIN EMPLOYEES E 
ON J.JOB_ID = E.JOB_ID;


-- ���� ���̺��� ���� ���̵�� �μ� ���̵�
-- �μ� ���̺��� �μ� �̸��� ������� ��� (INNER JOIN)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);
    
-- �ܵ������� �����ϴ� �÷��� .(���)�� �������൵ �������.

--------------------------------------------------------------------------------
/*
- ��[CROSS JOIN]
- ���� �������� ���� �ʰ� ���̺��� ��� �����͸� ������ ���� ���
--> ���� ������ ���� ��� ���� �� �ִ� ��� �������� ������ ��ȸ
--> īƼ�� ���̶�� �θ���. -> ��� ����� ���� ���

- [CROSS JOIN�� ��� ���]
SELECT ��ȸ�� ���̺� ��1,...
FROM ���̺� 1 CROSS JOIN ���̺� 2

*/

-- ���� ���̺��� ���� ���̵�� �μ� ���̵�
-- �μ� ���̺��� �μ� �̸��� ������� ��� (CROSS JOIN Ȱ��)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;
  
  
-- ���� 1. �� �μ��� �Ŵ��� �������� �μ� �̸�, �Ŵ��� ���̵�, FIRST_NAME ���
SELECT  D.DEPARTMENT_NAME AS "�μ� �̸�"
      , D.MANAGER_ID AS "�Ŵ���  ID"
      , E.FIRST_NAME 
  FROM  DEPARTMENTS D JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID); 
-- ���� ���̵�� �Ŵ��� ���̵� �����ϱ�,, �� �� ���� ���� ������ �༮�� ����ϰڴ�
-- ������ ���� ���� ���� ���ǿ� ����ϴ� ���� �ƴ϶� 
-- ���Ϸ��� ���� �´� ���� ������ �ɾ���� �ȴ�!
-- �μ� ���̺��� �Ŵ��� ���̵�� ���� ���̺��� �Ŵ��� ���̵� 
-- ���� �ɷ� �����ϸ� �ùٸ� ���� ������? ����� ��Ƽ���� �Ŵ��� ��� NULL��
    
SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;


--------------------------------------------------------------------------------
/*
[OUTET JOIN]
- �ܺ� �����̶�� �ϸ�, �� ���� ���̺� ���� �������� ��ȸ�ϰ�
- ���� ���̺��� �ִ� �����͵� ���Խ��Ѽ� ��ȸ�ϰ� ���� �� ����ϴ� ���� ����
--> ���� �������� NULL ���� ����ϰ� ���� �� ���

[LEFT OUTER JOIN]
- ���� ���̺��� �������� NULL���� �����Ͽ� ���
--> ����Ŭ ���� ���� �� : ���� �������� �ݴ��� ������ �÷��� (+) ��ȣ �ۼ�

[RIGHT OUTER JOIN]
- ������ ���̺��� �������� NULL���� �����Ͽ� ���
--> ����Ŭ ���� ���� �� : ���� �������� �ݴ��� ���� �÷��� (+) ��ȣ �ۼ�

[FULL OUTER JOIN]
- ������ NULL���� �����Ͽ� ���
--> ����Ŭ ���������� ���� ����, UNION �����ڷ� ���� ���� ����ϴ� ����� �ִ�.
*/

-- ���� 1. �� �μ��� �Ŵ��� �������� �μ� �̸�, �Ŵ��� ���̵�, FIRST_NAME ���
--> �μ� ���̺��� �� �Ŵ��� �̸��� ������ ����� �ƴ�.
SELECT * FROM DEPARTMENTS;
  
-- (ANSI����) LEFT OUTER JOIN Ȱ���� ��� �μ� ���
SELECT  D.DEPARTMENT_NAME AS "�μ� �̸�"
      , D.MANAGER_ID AS "�Ŵ���  ID"
      , E.FIRST_NAME 
  FROM  DEPARTMENTS D LEFT JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);
    
-- (����Ŭ ����) LEFT OUTER JOIN
SELECT D.DEPARTMENT_NAME,  D.MANAGER_ID , E.FIRST_NAME
  FROM  DEPARTMENTS D,  EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID (+);

-- (ANSI����) RIGHT OUTER JOIN
SELECT  D.DEPARTMENT_NAME AS "�μ� �̸�"
      , D.MANAGER_ID AS "�Ŵ���  ID"
      , E.FIRST_NAME 
  FROM  DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);
    
-- ����Ŭ ����
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID (+) = E.EMPLOYEE_ID;
  
-- FULL OUTER JOIN
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM  DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID;
-- 16���� �� (LEFT JOIN) + 107���� �� (RIGHT JOIN)= 123���� ���� ���´�.

--------------------------------------------------------------------------------

-- [3�� ���̺� ����]
-- �μ� ���̺�, ��ġ ���̺�, ���� ���̺��� INNER JOIN �ؼ�
-- �μ� �̸�, ���ÿ� ���� �̸��� ���
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM DEPARTMENTS D JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
  JOIN COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID);
  
-- ����Ŭ ����
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM DEPARTMENTS D , LOCATIONS L, COUNTRIES C
 WHERE D.LOCATION_ID = L.LOCATION_ID
   AND L.COUNTRY_ID = C.COUNTRY_ID;

  

  


  
  
  
  
  
  
  
  
  
  
  
  

