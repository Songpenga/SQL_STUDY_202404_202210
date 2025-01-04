SELECT TO_CHAR(1234567890, 'FM999,999,999,999') AS val FROM dual
-- 대입할 수치 값의 최대 크기만큼 패턴 값을 선언해 놓아야 한다.
-- 수치값 보다 패턴값이 작으면 ##### 으로 표시된다.
-- FM 키워드를 사용하지 않으면 반환된 값의 앞부분에 공백이 추가된다.

-- >> 정규식 함수를 사용하여 천 단위 콤마, 이 방법은 수치 값의 길이를 미리 지정해 놓지 않아도 된다.
SELECT REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(1234567890)), '(\d{3})','\1,')), '^,','') AS val FROM dual
