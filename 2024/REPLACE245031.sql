            
            V_SDATE := REPLACE(JSON_VALUE(P_DATAS, '$.P_SDATE'), '-');
            V_EDATE := REPLACE(JSON_VALUE(P_DATAS, '$.P_EDATE'), '-');
            
          
            UPDATE TB_TEST
            SET TEST_FROM = V_SDATE
               ,TEST_TO = V_EDATE
          WHERE TEST = JSON_VALUE(P_DATAS, '$.P_TEST');