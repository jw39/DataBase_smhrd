-- Question 1
/*
a - 데이터 베이스
b - DBMS
c - SQL
*/

-- Question 2
/*
a - COMMIT
b - ROLLBACK
*/

-- Question 3
/*
FROM >> WHERE >> GROUP BY >> HAVING >> SELECT >> ORDER BY
*/

-- Question 4
/*
DML: SELECT, DELETE
DDL: CREATE, ALTER
DCL: GRANT, REVOKE
*/

-- Question 5
/*
오류 원인: GROUP BY를 사용하면 조건절을 WHERE 말고 HAVING을 사용해야 한다.
수정한 조치사항: WHERE절을 삭제하고 GROUP BY 다음 줄에 HAVING AVG(SALARY) > 13000 을 작성하고
ORDER BY JOB_ID ASC;를 사용해 출력하고자 하는 결과를 출력하면 된다.
----------------------------
SELECT JOB_ID, AVG(SALARY)
  FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > 13000
ORDER BY JOB_ID ASC;
*/


-- Question 6-1
/*
SELECT E.EMPLOYEE_ID, E.EMAIL, E.SALARY, D.DEPARTMENT_NAME, D.LOCATION_ID
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
 WHERE SALARY >=  14000;

*/


-- Question 6-2
/*
 SELECT A.DEPARTMENT_ID 
 , A.DEPARTMENT_NAME 
 , A.MANAGER_ID 
 , B.FIRST_NAME 
 , B.LAST_NAME 
 FROM DEPARTMENTS A JOIN EMPLOYEES B 
   ON A.MANAGER_ID = B.EMPLOYEE_ID(+)
WHERE A.LOCATION_ID = 1700 ;
*/



-- Question 7-1
/*
 SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES);
*/



-- Question 8-1
/*
CREATE TABLE EMP(
        EMPNO    NUMBER(4) ,
        ENAME    VARCHAR2 (10 BYTE),
        JOB      VARCHAR2 (9 BYTE),
        MGR      NUMBER(4),
        HIREDATE DATE,
        SAL      NUMBER(7,2),
        COMM     NUMBER (7,2),
        DEPTNO   NUMBER(2),
        CONSTRAINT EMP_NMPNO_PK PRIMARY KEY (EMPNO),
        CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);
*/


-- Question 8-2
/*
CREATE TABLE DEPT (
        DEPTNO NUMBER(2),
        DNAME VARCHAR2(14 BYTE) NOT NULL,
        LOC VARCHAR2 (13 BYTE),
        CONSTRAINT DEPT_DEPTNO_PK PRIMARY KEY (DEPTNO)
);
*/







