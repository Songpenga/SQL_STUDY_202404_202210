SELECT job
     , empno
     , ename
     , hiredate
  FROM (
         SELECT empno
              , ename
              , job
              , hiredate
              , ROW_NUMBER() OVER(PARTITION BY job ORDER BY hiredate DESC) AS rn
           FROM emp
       )
 WHERE rn = 1;