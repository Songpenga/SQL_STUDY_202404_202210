CREATE TABLESPACE 테이블스페이스명
        DATAFILE '/경로/테이블스페이스파일명.dbf'
        SIZE 초기용량(100m,1g 등)
        AUTOEXTEND ON NEXT 자동증가용량(10M 등)
        MAXSIZE UNLIMITED

 ALTER USER [유저명] DEFAULT TABLESPACE [테이블 스페이스명]; 

;