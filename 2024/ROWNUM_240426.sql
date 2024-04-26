-- "ORA-00907: ������ ���ȣ" ����
-- �������������� order by�� ����� �� ����.(�ζ��κ� ���������� ����)
-- rownum�� order by�� ����Ǳ� ���� ���� ����Ǳ� ������ �Ʒ� ���� ��ü�� ������.
select a.a,
        a.b,
        a.c,
        (select b.a
            from table_a b
           where rownum = 1
           order by b.a desc) as max_a
 from table_a a 
 ;