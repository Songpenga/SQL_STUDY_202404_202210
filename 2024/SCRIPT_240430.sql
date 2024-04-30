--1. EMP ���̺��� �޿��� �ְ��� ����� �̸�,�޿��� ����ϴ� SCRIPT�� �����Ͽ���. �� SQL*Plus������ �̿��Ͽ� ȭ�鿡 ����Ѵ�.
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
    DBMS_OUTPUT.PUT_LINE("����� : " || V_NAME);
    DBMS_OUTPUT.PUT_LINE("�޿� : " || V_SAL);
END;

SET VERIFY ON
SET SERVEROUTPUT OFF
/

--2. DEPT ���̺� ����ϴ� SCRIPT�� �ۼ��Ͽ���.
SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT P_ENO PROMPT '�μ���ȣ�� �Է��Ͻÿ�. :'
ACCEPT P_ENAME PROMPT '�μ����� �Է��Ͻÿ�.   :'
ACCEPT P_REGO PROMPT '�ٹ����� �Է��Ͻÿ�.   :' 

declare
    V_ENO     P_ENO;
    V_ENAME   P_ENAME;
    V_REGO    P_REGO;
BEGIN
insert into dept ( eno, ename, region)
     values(V_ENO, V_ENAME, V_REGO);
end;

--3. DEPT ���̺� ��ϵǾ� �ִ� �ڷ� �� �ٹ����� �����ϴ� SCRIPT�� �ۼ��Ͽ���. �� �Ʒ��� ǥ�� �����Ͽ���
SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT P_NO PROMPT '�μ���ȣ�� �Է��Ͻÿ� : '
ACCEPT P_REGO PROMPT '�ٹ����� �Է��Ͻÿ�. : '

DECLARE
    V_ENO	P_NO;
    V_REGO  P_REGO;
BEGIN   
    UPDATE EMP SET REGO = V_REGO WHERE ENO = V_ENO;
END;

--4. EMP ���̺��� �����ȣ�� �Է¹޾� �ڷḦ �����ϴ� SCRIPT�� �ۼ��Ͽ���.

SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT P_ENO PROMPT '�����ȣ�� �Է��Ͻÿ� : '
DECLARE
    V_ENO P_ENO;
BEGIN
    DELETE FROM EMP
    WHERE ENO = V_ENO;
END;

-- 5. EMP ���̺��� �ϳ��� �ڷḦ �Է��� �� �ִ� SCRIPT�� �ۼ��Ͽ���. �� �����ȣ�� SEQUENCE�� �����Ͽ� �Է��Ѵ�.


SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT P_ENAME PROMPT '�Է��� �ڷ� : '
DECLARE 
    V_NAME P_NAME;
BEGIN
    INSERT INTO EMP(ENAME, ENO) VALUES (V_NAME, DEPT.NEXTVAL);
END;    