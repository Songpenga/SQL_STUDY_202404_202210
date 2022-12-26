/*
	DML
    insert C 	데이터 추가
    select R 	데이터 선택
    update	U 	데이터 수정
    delete	D 	데이터 삭제
*/
set sql_safe_updates = 0;
select * from student_study_mst;
/*====================<insert>===================*/
insert into student_study_mst
(id, name, age)
values
(1, 'peng', 20);
insert into student_study_mst(name, id, age) values('김', 2, 17);
insert into student_study_mst(name, id) values('박', 2);
insert into student_study_mst values(3, '박', 26);

insert into student_study_mst
values
	(5, '윤도영', 25),
	(6, '홍성욱', 25),
	(7, '김경민', 32),
	(8, '장혜민', 26);

/*====================<update>===================*/
select * from student_study_mst;
update student_study_mst
set
	name = '정순동',
    age = 22
where
id = 6;

update student_study_mst
set
	age = age + 1
where
	id = 6;
    
    /*====================<delete>===================*/
    
delete
from 
	student_study_mst
where
	id = 1;
	
    
