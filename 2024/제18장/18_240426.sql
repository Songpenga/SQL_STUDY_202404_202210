

--문제3) 초기값이 8000부터 9999까지 1씩 증가하는 SEQUENCE(EMPNO_SEQUENCE)를 생성하여 EMP 테이블에 등록하는 SCRIPT를 작성하여라. 단 이름은 JONG, 업무는 MANAGER,부서번호는 10이다.

CREATE SEQUENCE EMPNO_SEQUENCE
INCREMENT BY 1
START WITH 8000
MAXVALUE 9999
NOCYCLE
NOCACHE;

DECLARE
    V_EMPNO     EMP.EMPNO%TYPE;
BEGIN
        SELECT EMP_SEQUENCE.NEXTVAL
          INTO V_EMP_NO
          FROM DUAL;
          
        INSERT INTO EMP(EMPNO, ENAME, JOB, DEPTNO)
        VALUES ( V_EMPNO, 'jong', 'manager', '10');
END;
/
------------------------------------------------------------------

-- 문제4) 사원번호가 7369인 사원의 급여에 1000을 더하여 갱신하여라.
-- PL/SQL에서의 SELECT문장과 달리 수정된 행이 없으면 에러가 발생하지 않는다.
DECLARE
    V_SAL   EMP.SAL%TYPE := 1000;
BEGIN
    UPDATE EMP
       SET SAL = SAL + V_SAL
     WHERE EMPNO = 7369;
END;        


--문제5) 사원번호가 7654인 사원의 정보를 삭제하여라.

DECLARE
   V_SAL  EMP.SAL%TYPE := 7654;
BEGIN
    DELETE EMP
       WHERE EMPNO = V_SAL;
END;

----      18       ----
--문제1) 이름,급여,부서번호를 입력받아 EMP 테이블에 자료를 등록하는 SCRIPT를 작성하여라. 단 10번 부서일 경우 입력한 급여의 20%를 추가하고 초기값이 9000부터 9999까지 1씩 증가하는 SEQUENCE(EMP_EMPNO_SEQ)작성하여 사용하고 아래의 표를 참고하여라.

SET VERIFY OFF
ACCEPT P_NAME PROMPT '이름 : '
ACCEPT P_SAL  PROMPT '급여 : '
ACCEPT P_DEP  PROMPT '부서번호 : '
DECLARE
    V_NAME VARCHARE2(10) := UPPER('&P_NAME');
    V_SAL  NUMBER(7,2) := &P_SAL;
    V_DEP  NUMBER(2) := &P_DEP;
    
BEGIN

    IF V_DEP = 10 THEN
        V_SAL := V_SAL + 1.2;
    END IF;
    
    INSERT INTO EMP(EMPNO,ENAME,SAL,DEPTNO)
         VALUES (EMPNO_SEQUENCE.NEXTVAL, V_NAME, V_SAL, V_DEP);
       
END;
/
-- 메시지 버퍼의 츌력을 보여주는가?

SET VERIFY OFF
SET SERVEROUTPUT ON   
ACCEPT P_NAME PROMPT '이름 : '
DECLARE
    V_EMPNO EMP.EMPNO%TYPE;
    V_NAME  EMP.ENAME%TYPE;
    V_SAL   EMP.SAL%TYPE;        
    V_JOB   EMP.JOB%TYPE;
    
BEGIN
    SELECT EMP, NO
      INTO V_EMPNO, V_JOB
      FROM EMP
     WHERE ENAME = V_NAME;
     
     IF V_JOB IN ('MANAGER', 'ANALYST') THEN
        V_SAL := V_SAL * 1.5;
     ELSE
        V_SAL := V_SAL * 1.2;
     END IF; 

    UPDATE EMP
       SET SAL = V_SAL
     WHERE EMPNO = V_EMPNO;
     DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || '개의 행이 갱신되었습니다.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(V_NAME || "개의 행이 갱신되었습니다.");
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE(V_NAME || "는 동명이인입니다.");
    WHEN OTHER THEN
        DBMS_OUTPUT.PUT_LINE('기타에러가 발생했습니다.');
END;
/

SET VERIFY ON
SET SERVEROUTPUT OFF