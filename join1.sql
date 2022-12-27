SELECT * FROM db_study_202210_01.school_mst;

insert into school_mst
values
	(0, '서울대학교'),
	(0, '부산대학교'),
	(0, '부경대학교'),
	(0, '부산고등학교');
    
insert into student_mst
values
	(0, '김준일', 20, 1),
	(0, '김준일', 25, 2),
	(0, '김준이', 30, 1),
	(0, '김준이', 27, 3),
	(0, '김준삼', 18, 4);

select
	*
from
	student_mst;
    
select
	*
from
	school_mst
where
	19 = age;
	
select
	*
from
	score_mst as sm 
    left outer join subject_mst as sjb on(sjb.subject_id = sm.subject_id)
    left outer join student_mst as stm on(stm.student_id = sm.student_id)
    left outer join school_mst as scm on(scm.school_id = stm.school_id);
    
insert into score_mst
values
	(0, 5, 4, 100);
    
select
	*
from
	score_mst sm
    inner join subject_mst sjm on(sjm.subject_id = sm.subject_id);
    
select
	*
from
	subject_mst sjm
    right outer join score_mst sm on(sm.subject_id = sjm.subject_id);   