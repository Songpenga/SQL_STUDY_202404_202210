SELECT MIN(TO_CHAR(WORKDATE,'YYYY-MM-DD')) AS SDATE
      ,MAX(TO_CHAR(WORKDATE,'YYYY-MM-DD')) AS EDATE
      ,MIN(TO_CHAR(WORKDATE,'YYYY-MM-DD'))||' ~ '||MAX(TO_CHAR(WORKDATE,'YYYY-MM-DD')) AS SE_DATE
 FROM [TABLE]