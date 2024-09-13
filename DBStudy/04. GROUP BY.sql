-- CHAPTER 04. GROUP BY -- 

/*
 [�����Լ� ����]
 - ���� �� �Լ�: �Էµ� �ϳ��� �� �� ����� �ϳ��� ������ �Լ�
 - ���� �� �Լ�: ���� ���� �Է� �޾� �ϳ��� ��� ������ ����� �Ǵ� �Լ�
 -> ������ �Լ��� �����Լ���� �θ���.

 [������ �Լ� (���� �Լ�)�� Ư¡]
 1. ���� �Լ��� NULL���� �����ϴ� Ư¡�� ������ �ֽ��ϴ�.
 2. ���� �Լ��� �׷�ȭ(GROUP BY) �� �Ǿ� �ִ� ���¿����� ����� �����մϴ�.

- COUTN: ������ �������� ������ ��ȯ  
- SUM  : ������ �������� �� ��ȯ
- MAX  : ������ ������ �� �ִ밪 ��ȯ
- MIN  : ������ ������ �� �ּҰ� ��ȯ
- AVG  : ������ �������� ��հ� ��ȯ
*/

-- COUNT(������ �� �÷�)
-- ���� ���̺��� ����ID�� ���� ������ ��ȸ (�� ������)
  
-- SELECT EMPLOYEE_ID, COUNT(EMPLOYEE_ID) AS "�� ���� ��"
--   FROM EMPLOYEES;
--> ����ϰ��� �ϴ� ���� ������ ���� �ʾƼ� ���� �߻�

SELECT COUNT(EMPLOYEE_ID) AS "�� ���� ��"
  FROM EMPLOYEES;
GROUP BY(); -- �Ұ�ȣ �ȿ� �����Ͱ� ���� �׷� ���̶�� Ű���尡 ��� ������ �ִ� ��
--> ���� ���̺��� �ϳ��� �׷����� ���ڴ�!!

-- �μ� ���̵��� ���� ������ ��ȸ    //106
SELECT COUNT (DEPARTMENT_ID)
  FROM EMPLOYEES;
  
-- QUIZ �μ� ���̵� NULL�� ������ FIRST_NAME��?
 SELECT FIRST_NAME, DEPARTMENT_ID
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID IS NULL;
  
  
/*
SELECT ��ȸ�� �÷� ��1, ...
  FROM ��ȸ�� ���̺� ��
 WHERE ���� ���ϴ� ���� �����ϱ� ���� ���ǽ�
 
 - ��� ������ : +,-,*,/
 - �� ������ : >, >=, <, <=
 - � �� ������ : = (����), !=, <>, ^=, NOT A = B(���� �ʴ�)
 - �� ������ : AND (�� ���� ������ ���̸� �� ��ȯ), OR (�� �߿� �ϳ��� ���̸� �� ��ȯ)
 - SQL ������ : IN, NOT IN, BETWEEN, LIKE
    IN : WHERE �÷� IN (�÷� LIST...)    //���ǽĿ��� ���
    -> =(����) + OR (�� ������)
    -> NULL ���� �����Ѵ�.
    
    NOT IN : WHERE �÷� NOT IN (������ LIST...)
    -> != ���� �ʴ� + AND (�� ������)
    -> NULL�� �����ϸ� �ƿ� ������ ���� �� ���´�.
    
    BETWEEN : BETWEEN �ּڰ� AND �ִ밪 ; , WHERE �÷� BETWEEN �ּڰ� AND �ִ밪
    
    LIKE : WHERE �÷� LIKE '����(���ϵ� ī��)'
    % : ���̿� ������� ��� ���ڸ� �ǹ�
    _ : �ϳ��� ���ڸ� �ǹ�
*/
 
 -- �μ� ���̵��� ���� ������ ��ȸ    //106
 SELECT COUNT (DEPARTMENT_ID)
   FROM EMPLOYEES;
   
-- COUNT �Լ��� * (�ƽ�Ÿ����ũ) ��� ����
-- �ٸ� ���� �Լ��� * (�ƽ�Ÿ����ũ) ��� �Ұ���

SELECT COUNT (*)
  FROM EMPLOYEES;
 -- ���̺��� ��� ���� ������ �ľ��ϰ��� �� �� ����ϴ� SQL ��!
 
 -- ���� ���̺��� �޿��� �� �հ踦 ���Ͻÿ�
 SELECT SUM (SALARY)
   FROM EMPLOYEES;
 
 -- ���� ���̺��� �������� �ִ� �޿��� �ּ� �޿��� ���
 SELECT MAX (SALARY)
      , MIN (SALARY)
   FROM EMPLOYEES;
 
 -- ���� ���̺��� �μ�ID �� 100�� ������ ��� �޿��� ���
 -- ������� �Ҽ��� 1�� �ڸ����� �ݿø�
 SELECT ROUND(AVG(SALARY), 1)
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 100;
  

--------------------------------------------------------------------------------
SELECT * FROM ����ǥ;
SELECT * FROM ����������;

-- GROUP BY : Ư�� �÷��� �������� �׷�ȭ (����)

-- ������ ���� ���̺��� �Ҽӹ� �� �л��� �ο����� ��ȸ.
SELECT �Ҽӹ�, COUNT (�л��̸�) AS "�Ҽӹ� �л� ��"
  FROM ����������
GROUP BY �Ҽӹ�;

-- ����ǥ ���̺��� �л� ���� �׷�ȭ�� �غ���!!
SELECT �л�ID
FROM ����ǥ
GROUP BY �л�ID;

-- ����ǥ ���̺��� ���񺰷� �ְ� ������ ���� ���� ���
SELECT ����, MAX(����) AS "�ְ� ����", MIN(����) AS "���� ����"
  FROM ����ǥ
GROUP BY ���� ;

-- ����ǥ ���̺��� �л��� ��� ������ ���
-- ��, �Ҽ��� �ڸ��� 1�ڸ������� ���
SELECT �л�ID, ROUND(AVG(����),1) AS "�л� �� ��� ����"
  FROM ����ǥ
GROUP BY �л�ID;

/*
-- [SQL�� �ۼ� ����]
- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY

-- [�١١� SQL ���� ���� �١١�]
- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
*/

-- ����ǥ ���̺��� �л����� JAVA�� DB ���� ���� ������ ���� ���϶�
SELECT �л�ID, SUM (����)
  FROM ����ǥ
 WHERE ���� IN ('JAVA', 'DATABASE')
GROUP BY �л�ID;

--------------------------------------------------------------------------------
/*
[SQL ���� ����]
5. SELECT
1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. ORDER BY


[HAVING��] 
- GROUP BY ���� ������ ���� ����� ����
-> ���谡 �Ϸ�� ������ ���� ���͸��ϴ� ����

- ������ ���� ����� ��µȴٴ� �������� WHERE������ ���������,
- HAVING���� �׷�ȭ �� ��󿡼� ����� �ȴٴ� ������ �ٸ���.

*/

-- ����ǥ ���̺��� �л��� ��� ������ ���ϰ� ��� ���� 75������ �л��鸸 ���
SELECT �л�ID, ROUND(AVG(����), 1)
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) <= 75;

-- 1. ������ �������� �ݺ��� �ο����� 3�� �̻��� �ݸ� ���
SELECT �Ҽӹ�, COUNT(�Ҽӹ�)
FROM ����������
GROUP BY �Ҽӹ�
HAVING COUNT(�Ҽӹ�) >= 3;

-- 2. ���� ���̺��� �μ��� �ְ� ������ 100,000 �̻��� �μ��� ���
SELECT DEPARTMENT_ID, MAX(SALARY*12) AS "����"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY*12)>= 100000;

-- 3. ����ǥ ���̺��� �л� �� ��� ������ ����ϵ�,
-- NULL�� �ƴ� ���� ���. ������ �Ҽ��� 1�� �ڸ����� ǥ��
SELECT �л�ID, ROUND(AVG(����), 1)
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) IS NOT NULL;




























 
 
 
 
  