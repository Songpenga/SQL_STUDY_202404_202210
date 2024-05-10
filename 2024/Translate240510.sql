SELECT TRANSLATE('hello world!!!', 'hw', 'HW')
  FROM dual



--결과 : Hello World!!!

;



SELECT TRANSLATE('hello world!!!', '!', '?')
  FROM dual



--결과 : hello world???

;



SELECT TRANSLATE('hello world!!!', 'hw!', 'HW')
  FROM dual



--결과 : Hello World

;



SELECT TRANSLATE('hello world!!!', 'o', ' ')
  FROM dual



--결과 : hell  w rld!!!