select  id, 'name', age from student_study_mst;

select  
	id, 
	'name', 
	age
from 
	student_study_mst
where
	'name' like '%경%'
and 'name' like '김%';
 /* select 순서 */ 
 
 select
	*
from
	student_study_mst
where
	age not between 25 and 30
    -- not age = 25;
    -- age is (not) null
    
