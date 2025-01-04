-- 특정 테이블 코멘트 조회
select * from ALL_TAB_COMMENTS WHERE TABLE_NAME='테이블 이름';

-- 특정 테이블 컬럼 코멘트 조회
SELECT * FROM ALL_COL_COMMENTS WHERE TABLE_NAME='테이블 이름';
