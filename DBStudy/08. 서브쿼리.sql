-- CHAPTER 08. ���� ����  --
/*
- ����������?
- SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���ؼ�
- SQL �������� ����ϴ� SELECT ���� �ǹ�
- ���� ������ ���� ���� �ȿ� ���Ե� �������� �����̴�

- �������� : ���� ������ ��� ���� ����Ͽ� ����� �����ϴ� ����
- �������� : ���� ������ ���ǽĿ� ���� ���� �ǹ�

*/
-- ���� ���̺��� JACK�� �޿����� ���� ������ �̸��� �޿��� ���
-- 1. ������ ������ �Ǵ� JACK�� �޿��� ������ ���� Ȯ��
-- 2. 1��°�� ������� ������ �������� ���ؼ� ������� ���

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Jack';  -- ���� �޿� = 8400

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < 8400;

-- �������� �̿�
SELECT FIRST_NAME
     , SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE FIRST_NAME = 'Jack');
                  

-- ���� ������ �̿��� ���� ���̺��� James�� �޿����� ���� ������ �̸��� �޿� ���� ��ȸ
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <( SELECT SALARY
                 FROM EMPLOYEES
                 WHERE FIRST_NAME = 'James');
                 
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'James';


/*
-- ���� ������ Ư¡
. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸� () �� ��� ����Ѵ�
. ���������� SELECT ���� ����� �÷��� ���� ������ �� ���� ���� �ڷ����� ���� ���� �ʼ�
. ���������� �ִ� SELECT ���� ��� �� ���� �Բ� ����ϴ� ���������� ������ ������
  ȣȯ �����ؾ� �Ѵ�.
  
-- ��, �� �ϳ��� �����ͷθ� ������ ������ �����ڸ� ���������� ��� �� ���� �ϳ����߸� �Ѵ�.
-- �����ڿ� �Բ� ��ȣ �ۿ��ϴ� ��Ŀ� ���� ������ ���������� ������ ���������� ������.

- [ ������ ���� ���� ]
-> ���� ����� �� �ϳ��� ������ ������ ��������
-> = (����), >, >=, <, <= (ũ�ų� ���ų�), !=, <>, ^= (���� �ʴ�)

- [ ������ ���� ���� ]
- ���� ��� ���� ���� ���� ������ ���� ������ ���Ѵ�.
-> ������ �����ڴ� ����� �� ���� ������ �����ڸ� ����ؾ� �Ѵ�.
*/

-- [ ������ ���� ���� �ǽ� ]
-- ���� ���̺��� Nancy���� ���� �Ի��� ������ �̸��� �Ի��� ��ȸ
-- 1. ������ �Ի� ��¥ ���� (���������� ��)
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Nancy';

-- 2. ������ ���� ������ �̿��ؼ� ���
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE < (SELECT HIRE_DATE
                    FROM EMPLOYEES
                    WHERE FIRST_NAME = 'Nancy');
                     
-- ���� ���̺��� ��� �޿����� ���� �޿��� ���� ������ FIRST_NAME�� SALARY ��ȸ
-- 1. ������ ��� �޿� ���� (���������� ��)
SELECT AVG (SALARY)
  FROM EMPLOYEES;

-- 2. 1���� ������� ������ ������ ���������� �̿��� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG (SALARY)
                 FROM EMPLOYEES);
                
--------------------------------------------------------------------------------
        
/*
- [ ������ ���� ���� ]
- ���� ��� ���� ���� ���� ������ ���� ������ ���Ѵ�.
-> ������ �����ڴ� ����� �� ���� ������ �����ڸ� ����ؾ� �Ѵ�.

-- ������ �������� ����
- [IN] : ���� ������ �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� ������ TRUE�� ��ȯ
-> ��� ��� : IN (���� ����)

- [ANY, SOME] : ���� ������ ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE �� ��ȯ
-> ��� ��� : �񱳿����� ANY (���� ����)

- [ALL] : ���� ������ ���ǽ��� ���� ������ ����� ��� �����ؾ߸� TRUE �� ��ȯ
-> ��� ��� : �񱳿����� ALL (���� ����)

- [EXISTS] : ���� ���� ��� ���� �����ϴ��� ���� Ȯ�� (�� ���� 1�� �̻��̸� TRUE)
-> ��� ��� : EXISTS (���� ����)

*/


-- [ ������ ���� ���� �ǽ� ]    
-- �� �μ� �� �ְ� �޿��� ������ �޿��� �޴� ������ �μ�ID, FIRST_NAME, �޿� ���

-- 1. �μ� ��(GROUP BY) �ְ� �޿� (���������� ��)
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 2. 1���� ������� ������ ������ ���������� �̿��ؼ� ���
-- IN ������ Ȱ��
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY)
                 FROM EMPLOYEES
                 GROUP BY DEPARTMENT_ID);
 
-- [ANY �ǽ�]                
-- ANY ������ Ȱ��
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = ANY (SELECT MAX(SALARY)
                 FROM EMPLOYEES
                 GROUP BY DEPARTMENT_ID);
--> IN �����ڿ� ���� ����� ���


-- �� �������� �μ� �� �ְ� �޿��� ���� �޿��� ������ ��� �������� ��µ� ��
-- ANY�� ALL �����ڿ� ��� �� �����ڸ� ����ϰ� �Ǹ� ������ ���� �ؾ��Ѵ�.
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= ANY (SELECT MAX(SALARY)
                 FROM EMPLOYEES
                 GROUP BY DEPARTMENT_ID);
-- �μ��� �ּ� �޿��� �ְ� �޿��� ������ �� �߿��� ���� ���� �� ����� �ȴ�

-- �μ� �� �ְ� �޿��� �ϳ��� ���̸� ���� ��ȯ�Ǵ� ���� ANY ������
-- ���� �� � �ϳ��� ������ ���� ������ ���� ū ���� ������ ��� ���� ��µȴ�.
--> �μ� �� �ּ� �޿����� ���� ���� �� ����� �� ��!!!


-- [ALL �ǽ�]
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= ALL (SELECT MAX(SALARY)
                 FROM EMPLOYEES
                 GROUP BY DEPARTMENT_ID);
-- ALL: ���� ������ ����� �����ϴ� ��� ���鿡 ���� ������ �����ؾ� �Ѵ�.
-- ���� ������ ���� ������ ��� ��� ���� ���� �ؾ��Ѵ�.
-- ���������� ��� �� �߿� ���� ū ���� 24000�� ���ؼ� ũ�ų� ���� ���� ���� �����͸� ���
--> ��������� �ִ� ������ ū ���� ����� �ȴ�.


-- [EXIST �ǽ�]
-- EXIST �����ڴ� ���� ���θ� Ȯ���� �Ѵ�!!

SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 110;

SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EXISTS (SELECT DEPARTMENT_ID
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 110);


--------------------------------------------------------------------------------

/*
- [���� �÷� ���� ����]
-> ���� ������ ����� ���� �÷��� ��ȯ �� ���� ������ ���ǰ� ���ÿ� �񱳵Ǵ� ���� �ǹ�
-> �ַ� IN �����ڿ� �Բ� ���
*/

-- �� �μ� �� �ְ� �޿��� ������ �޿��� �޴� ������ ������ ���
-- �μ� ID, FIRST_NAME, SALARY
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                     FROM EMPLOYEES
                                 GROUP BY DEPARTMENT_ID);
                                 
-- 2���� �÷��� ���ؼ� �ش� �μ� ���� �ְ� �޿��� �޴� ������ ��� (������ �Ǵ� ���� Ȯ��)

--------------------------------------------------------------------------------
/*
- [�ζ��� �� (Inline View)]
- FROM ������ ���� ���̺�ó�� ����ϴ� ���� �����̴�.
- �ζ��� �並 ����ϸ� ���� ������ ����� ��ġ ���̺�ó�� ��� �����ϴ�.
- �ζ��� ��� ���� ������ ��� ó�� �����ϴ�
*/

-- �μ� ���� �ְ� �޿��� �޴� ������ FIRST_NAME �� �μ�IDM �μ� �� �ְ� �޿� ���
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- �ζ��� �� Ȱ��
SELECT A.FIRST_NAME, A.DEPARTMENT_ID, B."MAX_SALARY"
  FROM EMPLOYEES A , (SELECT DEPARTMENT_ID, MAX(SALARY) AS "MAX_SALARY"
                 FROM EMPLOYEES
                 GROUP BY DEPARTMENT_ID) B
 WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND A.SALARY = "MAX_SALARY";
-- �ζ��� ��� ��Ī�� �� �ָ� ���� �÷��� ������ ���� ����!!
-- ��Ī�� ��߸� ���ϴ� �÷��� �����ؼ� �� ���� �ֽ��ϴ�.

--------------------------------------------------------------------------------
/*
- [��Į�� ���� ���� (Sacalar Subquery)]
- SELECT ���� ���Ǵ� ���� ����
- �ϳ��� �÷��� ���� �ϳ��� �ุ ��ȯ�ϴ� Ư¡�� ������ �ִ�.
- JOIN ���� JOINó�� ����ϰ��� �� �� ���
*/

-- ���� �̸�, �޿�, �μ� ���̵�, �μ� �̸� ���
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

SELECT * FROM DEPARTMENTS;


-- ��Į�� �������� �̿�
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, (SELECT DEPARTMENT_NAME
                                            FROM DEPARTMENTS
                                            WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) AS �μ��̸�
FROM EMPLOYEES E;


