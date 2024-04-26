-----------------------------------
-- 抗力 1
-----------------------------------
WITH emp AS (
    SELECT '7698' empno, 'BLAKE' ename, 'MANAGER' job, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, 'CLARK' ename, 'MANAGER' job, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, 'JONES' ename, 'MANAGER' job, '20' deptno FROM dual
),
dept_history as (
    SELECT '7566' empno, '1981-04-02' sdate, '1991-04-01' edate, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, '1991-04-02' sdate, '2001-04-01' edate, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, '1981-06-09' sdate, '1991-06-08' edate, '40' deptno FROM dual
)

SELECT a.empno
     , a.ename
     , a.deptno
  FROM emp a
 WHERE a.job = 'MANAGER'
   AND EXISTS (SELECT 1
                 FROM dept_history aa
                WHERE aa.empno = a.empno)
;

-----------------------------------
-- 抗力 2
-----------------------------------
WITH emp AS (
    SELECT '7698' empno, 'BLAKE' ename, 'MANAGER' job, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, 'CLARK' ename, 'MANAGER' job, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, 'JONES' ename, 'MANAGER' job, '20' deptno FROM dual
),
dept_history as (
    SELECT '7566' empno, '1981-04-02' sdate, '1991-04-01' edate, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, '1991-04-02' sdate, '2001-04-01' edate, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, '1981-06-09' sdate, '1991-06-08' edate, '40' deptno FROM dual
)

SELECT a.empno
     , a.ename
     , a.deptno
  FROM emp a
 WHERE a.job = 'MANAGER'
   AND NOT EXISTS (SELECT 1
                     FROM dept_history aa
                    WHERE aa.empno = a.empno)
;

-----------------------------------
-- 抗力 3
-----------------------------------
WITH emp AS (
    SELECT '7698' empno, 'BLAKE' ename, 'MANAGER' job, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, 'CLARK' ename, 'MANAGER' job, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, 'JONES' ename, 'MANAGER' job, '20' deptno FROM dual
),
dept_history as (
    SELECT '7566' empno, '1981-04-02' sdate, '1991-04-01' edate, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, '1991-04-02' sdate, '2001-04-01' edate, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, '1981-06-09' sdate, '1991-06-08' edate, '40' deptno FROM dual
)

SELECT a.empno
     , a.ename
     , a.job
     , a.deptno
     , CASE WHEN EXISTS (SELECT 1
                           FROM dept_history aa
                          WHERE aa.empno = a.empno) THEN 'Y'
       END dept_history_yn
  FROM emp a
 WHERE a.job = 'MANAGER'
;

-----------------------------------
-- 抗力 4
-----------------------------------
WITH emp AS (
    SELECT '7698' empno, 'BLAKE' ename, 'MANAGER' job, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, 'CLARK' ename, 'MANAGER' job, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, 'JONES' ename, 'MANAGER' job, '20' deptno FROM dual
),
dept_history as (
    SELECT '7566' empno, '1981-04-02' sdate, '1991-04-01' edate, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, '1991-04-02' sdate, '2001-04-01' edate, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, '1981-06-09' sdate, '1991-06-08' edate, '40' deptno FROM dual
)

SELECT a.empno
     , a.ename
     , a.deptno
  FROM emp a
 WHERE a.job = 'MANAGER'
   AND a.empno IN (SELECT aa.empno
                     FROM dept_history aa
                    WHERE aa.empno = a.empno)
;

-----------------------------------
-- 抗力 5
-----------------------------------
WITH emp AS (
    SELECT '7698' empno, 'BLAKE' ename, 'MANAGER' job, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, 'CLARK' ename, 'MANAGER' job, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, 'JONES' ename, 'MANAGER' job, '20' deptno FROM dual
),
dept_history as (
    SELECT '7566' empno, '1981-04-02' sdate, '1991-04-01' edate, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, '1991-04-02' sdate, '2001-04-01' edate, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, '1981-06-09' sdate, '1991-06-08' edate, '40' deptno FROM dual
)

SELECT a.empno
     , a.ename
     , a.deptno
  FROM emp a
     , dept_history b
 WHERE a.job = 'MANAGER'
   AND a.empno = b.empno