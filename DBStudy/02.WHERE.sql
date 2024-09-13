-- CHAPTER 02. WHERE -- 
/*
[WHERE�� �⺻ ��� ���]
-- 3. SELECT   ��ȸ�� �÷���1,...
-- 1. FROM     ��ȸ�� ���̺� ��
-- 2. WHERE    ������ ���� �����ϱ� ���� ���ǽ�
*/

-- [WHERE �ǽ�]
-- ���� ���̺��� ���� ID�� 105�� ������ FIRST_NAME�� LAST_NAME ���
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105;

-- �μ� ���̺��� MANAGER_ID�� 100�� DEPARTMENT_NAME�� DEPARTMENT_ID ���
SELECT DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100;
 
 -- ���� ���̺��� �޿��� 9000���� ������ ����ID, FIRST_NAME, �޿� ������ ���
 SELECT EMPLOYEE_ID, FIRST_NAME, SALARY 
   FROM EMPLOYEES
  WHERE SALARY = 9000;
 
--------------------------------------------------------------------------------

/*
[������]
. ��� ������
. �� ������
. � ��ȯ ������
. �� ������
*/

-- 1.��� ������ (+,-,*,/)
SELECT SALARY, SALARY+100
  FROM EMPLOYEES;


-- 2.�� ������ (>, >=, <, <=)
-- [�� ������ �ǽ�]
-- ���� ���̺��� �޿��� 5000 ������ ������ FIRST_NAME �� SALARY ���� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000;

-- ���� ���̺��� ������ 50000 ������ �������� �̸��� ���� ���
-- ������ AnnSal �̶�� ��Ī�� �����ּ���
SELECT FIRST_NAME, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE SALARY*12 <= 50000;
-- �� SELECT���� �������� ����
--> ������ ����Ǵ� ��Ī�� ���� ����Ǵ� WHERE���� ����Ϸ��� ������ �ȵǴ� ��� �Ұ���


-- 3.� �� ������
-- ����: =
-- ���� �ʴ�: !=, <>, ^= 
-- ���� �ʴ�: NOT A = B (�� ����)

-- [� �� ������ �ǽ�]
-- ���� ���̺��� ���� ���̵� IT_PROG�� �ƴ� ������ �̸��� ���� ���̵� ���
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID != 'IT_PROG';

-- ���� ���̺��� EMAIL ������ SKING�� ������ ��� ������ ���
SELECT *
FROM EMPLOYEES
WHERE EMAIL = 'SKING';

-- ���� ���̺��� EMAIL ������ SKING�� �ƴ� ������ ��� ������ ���
SELECT *
FROM EMPLOYEES
WHERE EMAIL != 'SKING';


-- 4. �� ������
-- AND -> ������ ��� �����ϴ� ��� TRUE�� ��ȯ
-- OR -> �ϳ��� �����̶� �����ϴ� ��� TRUE�� ��ȯ

-- [�������� �ǽ�]
-- ���� ���̺��� �μ����̵� 90�̸鼭 �޿��� 5000 �̻��� ����ID�� FIRST_NAME ���
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 
   AND SALARY >= 5000;
 
-- ���� ���̺��� �μ� ���̵� 100�̰ų� �Ի����� 06��02��02�� ���Ŀ� �Ի��� ��������
-- FIRST_NAME�� �Ի��� ���
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 
    OR HIRE_DATE > '06/02/02';
                 -- ���ڷ� ����� �� / �� �ϰ� 060202�ص� �ν�
                 
                 
-- �μ� ID�� 100�̰ų� 90�� ���� �߿��� ����ID�� 101�� ������ ���� ���
-- ID, FIRST_NAME, ���� ���, ������ "AnnSal"�� ��Ī ����
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS "AnnSal", DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE(DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101;

-- �������� �켱 ������ ���� ������� ������ �޶�����.
-- AND > OR  �켱 ������ AND�� ����. ���� ���� () ����ϱ�
 
--------------------------------------------------------------------------------
 
/*
[NULL] ���� ������
- IS NULL     : ������ ���� NULL�� ���� ��ȸ
- IS NOT NULL : ������ ���� NULL�� �ƴ� ���� ��ȸ
- WHERE ������ ���ϴ� �÷� �ڿ� ���
*/

-- ���� ���̺��� ���ʽ��� �ִ� ������ ��� (�̸��� ���ʽ� ������ ���)
SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;

--------------------------------------------------------------------------------

/*
[SQL ������]
- SQL ������ ��� ������ ������
 . IN
 . NOT IN
 . BETWEENM 
 . LIKE
*/

-- 1. IN 
-- ������ Ư�� �÷��� ���Ե� �����͸� ������ ��ȸ�� �� ���
-- = + OR �� ���� ���� ��� 
-- NULL ���� �����ϴ� Ư���� ������ �ִ�.

-- ���� ���̺��� �μ� ���̵� 30�̰ų� 
-- 50�̰ų� 90�� ������ ��� ���� ���
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90
   AND DEPARTMENT_ID = NULL ;
-- ���� ������ ���� AND ���� ���� ����, NULL���� FALSE�� ���� �� �߰� (���� �߻� �� ��)
-- �� ���� OR���� ���� �� ���

-- IN ������ Ȱ��
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90, NULL);
 
 
 -- 2. NOT IN ������
 -- IN �ڿ� ���ǿ� �ش����� �ʴ� �����͸� ���
 -- != + AND �� ���� ���� ���
 -- NOT IN�� NULL ���� ������ �ƿ� ���� ����� �ȵȴ�. ������ != + AND�� Ư¡������!!
 
 -- ���� ���̺��� �Ŵ��� ���̵� 
 -- 100, 120, 121�� �ƴ� �������� �̸��� 
 -- �Ŵ������̵� ���
 SELECT FIRST_NAME, MANAGER_ID
   FROM EMPLOYEES 
  WHERE MANAGER_ID != 100
    AND MANAGER_ID != 120
    AND MANAGER_ID != 121;

-- NOT IN Ȱ��
 SELECT FIRST_NAME, MANAGER_ID
   FROM EMPLOYEES 
  WHERE MANAGER_ID NOT IN (100,120,121);
  
  
-- 3. BETWEEN A AND B ������
-- ���� ���� ���� �����͸� ��ȸ�� �� ���

-- BETWEEN �ּҰ� AND �ִ밪
--> Ư�� �� ���� �ּ�, �ִ� ������ �����Ͽ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��

-- ���� ���̺��� �޿��� 10000 �̻��̰� 20000 ������ ������ FIRST_NAME�� �޿� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000;
 
 -- ���� ���̺��� 05�⿡ �Ի��� ������ �̸��� �Ի����� ���
 SELECT FIRST_NAME, HIRE_DATE
   FROM EMPLOYEES
  WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31'
  ORDER BY HIRE_DATE ASC;


/*
-- 4. LIKE ������
 - �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�� �� ���
 - _ �� % ���� ���ϵ� ī�带 �̿��� ��Ī ���� ����
 - ���ϵ� ī��� ���ڿ� �������� ������ ǥ���ϴ� Ư�� ����

 % : ���̿� ������� ��� ���� �����͸� �ǹ�
 - �÷� LIKE '����%'  : �ش� ���ڷ� �����ϴ� ��� ������ �˻�
 - �÷� LIKE '%����'  : �ش� ���ڷ� ������ ��� ������ �˻�
 - �÷� LIKE '%����%' : �ش� ���ڸ� �����ϴ� ��� ������ �˻�
 
 _ : � ���̵� ������� �� ���� ���� �����͸� �ǹ�
 - �÷� LIKE 'S _ _' :  S�� �����ϴ� 3���ڷ� �̷���� ������ �˻�
 - �÷� LIKE '_ _ S' :  S�� ������ 3���ڷ� �̷���� ������ �˻�
*/

-- [LIKE �ǽ�]
-- ���� ���̺��� 650���� �����ϴ� �ڵ��� ��ȣ ã��
SELECT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '650%';
 
-- ���� ���̺��� �̸��� S�� �����ϰ� n���� ������ ������ ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
 
 -- ���� ���̺��� �̸��� it���� ������ �� 4������ ���� ã��
 SELECT FIRST_NAME
   FROM EMPLOYEES
  WHERE FIRST_NAME LIKE '__it';
 
 -- ���� ���̺��� FIRST_NAME �ι�° ���ڰ� e�� ���� ã��
 SELECT FIRST_NAME
   FROM EMPLOYEES
  WHERE FIRST_NAME LIKE '_e%';
 
 
 -- ���� ���̺��� 01���� �Ի��� ���� ã��
 SELECT FIRST_NAME, HIRE_DATE
   FROM EMPLOYEES
  WHERE HIRE_DATE LIKE '__/01/__';
  -- WHERE HIRE_DATE LIKE '___01___';
  -- WHERE HIRE_DATE LIKE '___01%';
  


    