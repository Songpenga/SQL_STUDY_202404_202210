SELECT TRANSLATE('hello world!!!', 'hw', 'HW')
  FROM dual



--��� : Hello World!!!

;



SELECT TRANSLATE('hello world!!!', '!', '?')
  FROM dual



--��� : hello world???

;



SELECT TRANSLATE('hello world!!!', 'hw!', 'HW')
  FROM dual



--��� : Hello World

;



SELECT TRANSLATE('hello world!!!', 'o', ' ')
  FROM dual



--��� : hell  w rld!!!