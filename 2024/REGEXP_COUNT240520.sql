WITH temp AS
(
    SELECT 'MANAGER' job, 'BLAKE,JONES,CLARK' ename_list FROM dual
    UNION ALL
    SELECT 'SALESMAN' job, 'ALLEN,TURNER,MARTIN,WARD' ename FROM dual
)

SELECT a.job
     , REGEXP_SUBSTR(a.ename_list, '[^,]+', 1, b.row_cnt) AS ename
  FROM temp a
     , (SELECT LEVEL row_cnt FROM dual CONNECT BY LEVEL <= 10) b --구분자 최대 개수
 WHERE b.row_cnt <= REGEXP_COUNT(a.ename_list, ',') + 1
 ORDER BY job, ename