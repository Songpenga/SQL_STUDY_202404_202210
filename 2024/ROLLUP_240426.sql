
WITH COUNTRY ( country , area , mon1 , mon2 ) AS (
     SELECT '한국' , 'SEOUL' , 100 , 10 FROM DUAL
UNION ALL SELECT '한국' , 'BUSAN' , 100 , 10 FROM DUAL
UNION ALL SELECT '미국' ,'NY' ,50 , 100 FROM DUAL
UNION ALL SELECT '미국' ,'LA' ,50 , 100 FROM DUAL
)
 
 
SELECT country , area , SUM(mon1) , SUM(mon2)  FROM COUNTRY
GROUP BY ROLLUP (( country ,area ));


--전체합만
SELECT country 
   , decode(1, grouping(country), '전체합계', grouping(city), '부분합계', city) city
   , sum(mon1) 
   , sum(mon2) 
 FROM COUNTRY
GROUP BY GROUPING SETS ((country, city),())