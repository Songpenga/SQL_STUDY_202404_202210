CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY A."TEST"
AS
    PROCEDURE SP_GET_CODE (
                                  A IN  VARCHAR2
                                , AB   OUT T_REF_CURSOR
    )
    IS BEGIN    
   
          OPEN P_CURSOR FOR
        SELECT *
          FROM TEST
         WHERE 1=1;

    END;