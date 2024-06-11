SELECT REGEXP_SUBSTR('2024-03-08', '[^-/.]+')       AS date_year
     , REGEXP_SUBSTR('2024/03/08', '[^-/.]+', 1, 2) AS date_month
     , REGEXP_SUBSTR('2024.03.08', '[^-/.]+', 1, 3) AS date_day
  FROM dual