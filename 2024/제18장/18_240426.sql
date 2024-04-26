

--����3) �ʱⰪ�� 8000���� 9999���� 1�� �����ϴ� SEQUENCE(EMPNO_SEQUENCE)�� �����Ͽ� EMP ���̺� ����ϴ� SCRIPT�� �ۼ��Ͽ���. �� �̸��� JONG, ������ MANAGER,�μ���ȣ�� 10�̴�.

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

-- ����4) �����ȣ�� 7369�� ����� �޿��� 1000�� ���Ͽ� �����Ͽ���.
-- PL/SQL������ SELECT����� �޸� ������ ���� ������ ������ �߻����� �ʴ´�.
DECLARE
    V_SAL   EMP.SAL%TYPE := 1000;
BEGIN
    UPDATE EMP
       SET SAL = SAL + V_SAL
     WHERE EMPNO = 7369;
END;        


--����5) �����ȣ�� 7654�� ����� ������ �����Ͽ���.

DECLARE
   V_SAL  EMP.SAL%TYPE := 7654;
BEGIN
    DELETE EMP
       WHERE EMPNO = V_SAL;
END;

----      18       ----
--����1) �̸�,�޿�,�μ���ȣ�� �Է¹޾� EMP ���̺� �ڷḦ ����ϴ� SCRIPT�� �ۼ��Ͽ���. �� 10�� �μ��� ��� �Է��� �޿��� 20%�� �߰��ϰ� �ʱⰪ�� 9000���� 9999���� 1�� �����ϴ� SEQUENCE(EMP_EMPNO_SEQ)�ۼ��Ͽ� ����ϰ� �Ʒ��� ǥ�� �����Ͽ���.

SET VERIFY OFF
ACCEPT P_NAME PROMPT '�̸� : '
ACCEPT P_SAL  PROMPT '�޿� : '
ACCEPT P_DEP  PROMPT '�μ���ȣ : '
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
-- �޽��� ������ ������ �����ִ°�?

SET VERIFY OFF
SET SERVEROUTPUT ON   
ACCEPT P_NAME PROMPT '�̸� : '
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
     DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || '���� ���� ���ŵǾ����ϴ�.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(V_NAME || "���� ���� ���ŵǾ����ϴ�.");
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE(V_NAME || "�� ���������Դϴ�.");
    WHEN OTHER THEN
        DBMS_OUTPUT.PUT_LINE('��Ÿ������ �߻��߽��ϴ�.');
END;
/

SET VERIFY ON
SET SERVEROUTPUT OFF