/*
	서브쿼리(하위커리)
    select 안에서 select 하는 방법
*/

select 
	*
from
	student_mst;
    
    -- 서울대를 다니는 학생을 찾으세요
    

select
	*
from
	student_mst
where school_id = 2;

select
	*
from
	student_mst as sm
    inner join school_mst as scm on (sm.school_id = scm.school_id)
where
	scm.school_name like '서울대%';

-- 

                
select 
	*	
from
	student_mst
where
	school_id in(1, 3);
    
select
	*,
    (select school_name from school_mst scm where scm.school_id = stm.school_id) as 번호
from
	student_mst stm; 

set profiling = 1;
show profiles;

select
	*
from
	student_mst sm
    left outer join(select count(*) as 총원 from student_mst) sc on ( 1 = 1);
    
    
select 
	* 
from
	student_mst
where
	school_id = (select
					school_id
				from
					school_mst
				where 
					school_name like '서울대%'
				or  school_name like '부산대%');
                
                
