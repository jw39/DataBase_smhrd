-- CHAPTER 01. SELECT -- 
-- --: �ּ� ��ȣ
-- /**/: ���� �� �� ���� �ּ� ó�� ����
-- ���� ũ�� Ű���: ���� > ȯ�漳�� > �ڵ������� > �۲�
-- �ּ� ���� �ٲٱ�: ���� > ȯ�漳�� > �ڵ������� > PL/SQL �ּ�


DESC EMPLOYEES;
-- DESC (DESCRIBE): �����ϴ�, �����ͺ��̽� ���̺��� ������ Ȯ���ϴµ� ����


/*
-- [����Ŭ ��Ģ]
1. SQL ���忡�� ��ҹ��ڸ� �������� �ʴ´�.
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �� ����Ŭ��(;)�� ������ �Ѵ�.
4. SQL ���� ����Ű: CTRL+ENTER OR F9
*/

--------------------------------------------------------------------------------

/*
[SELECT �� �⺻ ��� ���]
2. SELECT   ��ȸ�� �÷� ��1,...
1. FROM     ��ȸ�� ���̺� �̸�

�� ��ü ��ȸ -> *  (�ƽ�Ÿ����ũ): ��ü�� �ǹ�

�� ���� SQL���� �ڵ� ���� ��
SELECT * 
  FROM EMPLOYEES; <- �̷� ������ Į�� ���� ����ϰ� ���´�!

�� �� �빮�ڷ� ������?
-> �÷� �̸��� �빮�ڷ� �����ż�...
*/


-- [SELECT �ǽ�]
-- �������̺��� ��ü ������ ����ϱ�
SELECT * 
  FROM EMPLOYEES;
  
-- �μ����̺��� ��ü ������ ����ϱ�
SELECT *
  FROM DEPARTMENTS;

-- ���� ���̺��� ����ID, FIRST_NAME, LAST_NAME ���
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;

-- �μ� ���̺��� �μ� ID, �μ���, LOCATION_ID ���
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID 
  FROM DEPARTMENTS;
  
-- ���� ���̺��� EMAIL, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID ������ ���
SELECT EMAIL, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- ���� ���̺��� ������ FIRST_NAME, JOB_ID ���  
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES;

--------------------------------------------------------------------------------

/*
[������ �ߺ� ���� �ϱ�]
-> DISTINCT: ������ �ߺ� ����

�� ��� ���
SELECT DISTINCT ��ȸ�� �÷�1,...
  FROM ���̺� �̸�;
*/

-- [DISTINCT �ǽ�]
-- ���� ���̺� JOB_ID�� �ߺ��� �����Ͽ� ���
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;

-- ���� ���̺� �μ� ID�� �ߺ��� �����Ͽ� ���
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- ���� ���̺��� JOB_ID, �μ�ID�� �ߺ��� �����ؼ� ���
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES;
-- �ء�JOB ���̵� ���� �ߺ�üũ�� ���� �μ����̵� �ߺ�üũ�� ��
-- >> ������ ������ �ν��� �ϰ� ��
-- => DISTINCT �ڿ� 2�� �̻��� �÷��� ������?
-- >>�� �� �÷��� �ߺ��� �־ �ٸ� �� �÷��� ���� �ٸ��� �ٸ��� ���

-- ���� ���̺��� �Ի����� ����ϴµ� �ߺ��� �����Ͽ� ���!
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES;
  
-- �ȳ��ϼ��� ���� ���
SELECT '�ȳ��ϼ���'      -- ���� ����� ���� '' ���
  FROM EMPLOYEES;       -- EMPLOYEES �÷��� �°� 107���� �ȳ��ϼ��� ��µ�

--------------------------------------------------------------------------------

/*
[��Ī ����ϱ�]
- ALIAS(�˸��ƽ�): �� ���� ���� ���� �����ϴ� ��
- AS Ű���带 ����Ͽ� ��Ī�� ����.

�� ��� ���
1. SELECT �÷� ��Ī
2. SELECT �÷� "��Ī"
3. SELECT �÷� AS ��Ī
4. SELECT �÷� AS "��Ī"

 �� TIP!!
 �÷��� ���� ������ �����ϴ�! (+, -, *, /)
 ���⸦ �� �� ���鵵 ������ �ż� ""�� ������ �Ѵ�!
*/

-- [ALIAS �ǽ�]
-- ���� ���̺��� ������ �̸�(FIRST_NAME)�� �޿�, ���� ���� ���
SELECT FIRST_NAME, SALARY, SALARY*12 AS ����
  FROM EMPLOYEES;
   
-- ���� ���̺��� ������ �̸�(FIRST_NAME)�� �޿��� �Ի����� ���
-- �� �Ի����� "�Ի� ��¥"�� �ٲ㼭 ��� /  4���� ���

-- 1. SELECT �÷� ��Ī
SELECT FIRST_NAME, SALARY, HIRE_DATE �Ի糯¥ 
  FROM EMPLOYEES;

-- 2. SELECT �÷� "��Ī"
SELECT FIRST_NAME, SALARY, HIRE_DATE "�Ի糯¥"
  FROM EMPLOYEES;

-- 3. SELECT �÷� AS ��Ī
SELECT FIRST_NAME, SALARY, HIRE_DATE AS �Ի糯¥ 
  FROM EMPLOYEES;

-- 4. SELECT �÷� AS "��Ī"
SELECT FIRST_NAME, SALARY, HIRE_DATE AS "�Ի糯¥"
  FROM EMPLOYEES;

-- ���� ���̺��� �Ի���, �Ի��� ������ ���
-- �Ի����� ��Ī�� "�Ի糯¥", �Ի��� �������� ��Ī�� "�Ի��� ������" �� ���
SELECT HIRE_DATE AS �Ի糯¥, HIRE_DATE+1 AS "�Ի��� ������"
  FROM EMPLOYEES;

--------------------------------------------------------------------------------

/*
[ORDER BY ��]
- Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ��� �� �� ����Ѵ�.
- SQL ����������� ���� �������� ����ȴ�.
- ������ ���Ĺ���� �������� ������ �⺻������ ��������(ASC)�� ����ȴ�.

- ASC (ASCENDING): �������� ���� (1,2,3,4,5...)
- DESC (DESCENDING): �������� ���� (10,9,8,7,6...)
*/

-- [ORDER BY �ǽ�]
-- ���� ���̺��� ��� ������ ������ ��� ��, �޿� �������� ������������ ����
SELECT *
  FROM EMPLOYEES
ORDER BY SALARY ASC;

-- �ֱ��� �Ի��� ��¥�� �������� ������ �̸���(FIRST_NAME), �Ի糯¥�� ���
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;            -- �ֱ� �Ի�� ū ������ ���� ��, �������� ����

-- ���� ���̺��� ���� ID, �μ�ID, �̸�(FIRST_NAME), �޿� ������ ���
-- �� �μ�ID�� ��������, �޿��� ������������ �����Ͽ� ���
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;
-- �������� ���ĵ� �μ�, ���� �μ����� �ٹ��ϰ� �ִ� ������ �� 
-- �޿��� ���� ���� ������� ��µ�
--> ���� �μ�ID�� ������������ ������ �ϰ� �޿��� ������������ ������ ��

--------------------------------------------------------------------------------

/*
[NULL]
- �������� ���� ������ ��� �ִ� ����
- ���� �������� �ʰų� �������� ���� ���� �ǹ�
- ���� 0�̳� �� ���ڿ� ' '�� NULL ���� �ƴ�!
- NULL�� ���� �Ǵ� ���ϸ� ������ NULL ����
*/

-- [NULL �ǽ�]
-- ���� ���̺��� ����ID, ���ʽ�, ���ʽ� �ι��� ������ ���
-- �� ���ʽ� �ι��� ������ UP_BONUS�� ��Ī�� �����ְڽ��ϴ�.
SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT * 2 AS "UP_BONUS"
  FROM EMPLOYEES;












