SELECT a.empno
     , a.ename
     , a.job
     , a.deptno
     , b.dname
  FROM emp a
  LEFT OUTER JOIN dept b
    ON a.deptno = b.deptno
 WHERE a.job IN ('PRESIDENT', 'MANAGER')

-- 조인되지 않은 데이터는 조인 테이블의 데이터를 끌어와서 표시할 수 없다( null로 표시)