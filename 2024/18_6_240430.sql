SET SERVEROUTPUT ON
DECLARE
    v_cnt number := 1;
    v_str varchar(20) := null;
BEGIN
    LOOP
        V_STR := VSTR || '*';
        DMBS_OUTPUT.PUT_LINE(v_str);
        
        V_CNT := VCNT + 1;
        IF V_CNT >= 20 THEN
            EXIT;
        END IF;
    END LOOP;        
END;
/        
