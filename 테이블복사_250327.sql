--1. 테이블 복사하기 스키마 & 데이터
CREATE TABLE 새로만들테이블명 AS
SELECT * FROM 복사할테이블명;
?
--2. 테이블 구조만 복사하기,데이터 복사 X
--# WHERE절에 '참'이 아닌 조건을 넣어줌
CREATE TABLE 새로만들테이블명 AS
SELECT * FROM 복사할테이블명
WHERE 1=2;
?
--3. 테이블은 이미 생성되어 있고 데이터만 복사 (테이블 구조가?동일할 때)
INSERT INTO 복사할테이블명
SELECT * FROM 테이블명;
?
--4. 테이블은 이미 생성되어 있고 데이터만 복사 (테이블 구조가?다를 때)
INSERT INTO 복사할테이블명(복사할컬럼1, 복사할컬럼2, 복사할컬럼3)
SELECT 컬럼1, 컬럼3, 컬럼3
FROM 테이블명;