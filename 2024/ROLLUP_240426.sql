
WITH COUNTRY ( country , area , mon1 , mon2 ) AS (
     SELECT '�ѱ�' , 'SEOUL' , 100 , 10 FROM DUAL
UNION ALL SELECT '�ѱ�' , 'BUSAN' , 100 , 10 FROM DUAL
UNION ALL SELECT '�̱�' ,'NY' ,50 , 100 FROM DUAL
UNION ALL SELECT '�̱�' ,'LA' ,50 , 100 FROM DUAL
)
 
 
SELECT country , area , SUM(mon1) , SUM(mon2)  FROM COUNTRY
GROUP BY ROLLUP (( country ,area ));


--��ü�ո�
SELECT country 
   , decode(1, grouping(country), '��ü�հ�', grouping(city), '�κ��հ�', city) city
   , sum(mon1) 
   , sum(mon2) 
 FROM COUNTRY
GROUP BY GROUPING SETS ((country, city),())