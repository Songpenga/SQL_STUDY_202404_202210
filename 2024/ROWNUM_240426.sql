-- "ORA-00907: 누락된 우괄호" 오류
-- 서브쿼리에서는 order by를 사용할 수 없다.(인라인뷰 서브쿼리는 예외)
-- rownum은 order by가 실행되기 전에 먼저 실행되기 떄문에 아래 로직 자체가 문제다.
select a.a,
        a.b,
        a.c,
        (select b.a
            from table_a b
           where rownum = 1
           order by b.a desc) as max_a
 from table_a a 
 ;