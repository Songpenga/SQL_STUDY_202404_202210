            --1. 사업자등록번호 정규식
            SELECT BRNUM        --사업자번호
                  ,REGEXP_REPLACE(BRNUM, '^([0-9]{3})-?([0-9]{2})-?([0-9]{5})$', '\1-\2-\3') -- 사업자등록번호 정규식
                  ,TO_CHAR(write_day,'YYYY-MM-DD HH24:MI:SS') AS write_day     -- 작성일
              FROM A
          ; 
          
          -- 2. 날짜 to_char
            SELECT TO_CHAR(write_day,'YYYY-MM-DD HH24:MI:SS') AS write_day     -- 작성일
              FROM A;          
              
           --3.    
           SELECT TO_CHAR(TO_NUMBER(NVL(sum, '0')),'FM999,999,999,999,999,999,999')    -- 작성일
              FROM A  
              -- 패턴 값의 길이가 작을 경우 값을 반환하지 못한다.
              -- 대입할 수치 값의 최대 크기만큼 패턴 값을 선언해 놓아야 한다. (미래에 아주 큰 값이 생길 수 있을 경우 대비)
              -- 수치 값 보다 패턴 값이 작으면 값을 반환하지 못하고 ######으로 표시된다.
              -- FM 키워드를 사용하지 않으면 반환된 값의 앞부분에 공백이 추가된다.      