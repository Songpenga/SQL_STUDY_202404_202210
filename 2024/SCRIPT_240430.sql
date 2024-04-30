--1. EMP 테이블에서 급여가 최고인 사원의 이름,급여를 출력하는 SCRIPT를 생성하여라. 단 SQL*Plus변수를 이용하여 화면에 출력한다.
SET VERIFY OFF
SET SERVEROUTPUT ON
DECLARE
    V_NAME  EMP.ename%type;
    V_SAL   EMP.sal%type;
BEGIN
    SELECT SAL, ENAME
      INTO V_SAL, V_NAME
      FROM EMP
      WHERE SAL = (SELECT MAX(SAL)
                     FROM EMP);
    DBMS_OUTPUT.PUT_LINE("사원명 : " || V_NAME);
    DBMS_OUTPUT.PUT_LINE("급여 : " || V_SAL);
END;

SET VERIFY ON
SET SERVEROUTPUT OFF
/

--2. DEPT 테이블에 등록하는 SCRIPT를 작성하여라.
SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT P_ENO PROMPT '부서번호를 입력하시오. :'
ACCEPT P_ENAME PROMPT '부서명을 입력하시오.   :'
ACCEPT P_REGO PROMPT '근무지를 입력하시오.   :' 

declare
    V_ENO     P_ENO;
    V_ENAME   P_ENAME;
    V_REGO    P_REGO;
BEGIN
insert into dept ( eno, ename, region)
     values(V_ENO, V_ENAME, V_REGO);
end;

--3. DEPT 테이블에 등록되어 있는 자료 중 근무지를 변경하는 SCRIPT를 작성하여라. 단 아래의 표를 참고하여라
SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT P_NO PROMPT '부서번호를 입력하시요 : '
ACCEPT P_REGO PROMPT '근무지를 입력하시오. : '

DECLARE
    V_ENO	P_NO;
    V_REGO  P_REGO;
BEGIN   
    UPDATE EMP SET REGO = V_REGO WHERE ENO = V_ENO;
END;

--4. EMP 테이블에서 사원번호를 입력받아 자료를 삭제하는 SCRIPT를 작성하여라.

SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT P_ENO PROMPT '사원번호를 입력하시오 : '
DECLARE
    V_ENO P_ENO;
BEGIN
    DELETE FROM EMP
    WHERE ENO = V_ENO;
END;

-- 5. EMP 테이블에서 하나의 자료를 입력할 수 있는 SCRIPT를 작성하여라. 단 사원번호는 SEQUENCE를 생성하여 입력한다.


SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT P_ENAME PROMPT '입력할 자료 : '
DECLARE 
    V_NAME P_NAME;
BEGIN
    INSERT INTO EMP(ENAME, ENO) VALUES (V_NAME, DEPT.NEXTVAL);
END;    