INSERT INTO note240522 (a, b, c, use, e) VALUES ("10", "$", "test", "1", "0");
--[Error] Execution (5: 104): ORA-00984: ���� ����� �� �����ϴ�

INSERT INTO note240522 (a, b, c, use, e) VALUES ('10', '$', 'test', '1', '0');