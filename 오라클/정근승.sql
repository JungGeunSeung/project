select * from product where product_id = 'MD106M1C';
select * from product;
select * from plan;
select * from posts;
select * from emp;
select * from authorities;
select * from dept;

alter TABLE emp modify (position varchar2(50) default '����');
commit;

SELECT p.post_id, p.board_id, b.board_name, p.title, p.author_id, 
       e.name AS author_name, p.created_at
FROM (
    SELECT p.post_id, p.board_id, p.title, p.author_id, p.created_at
    FROM posts p
    ORDER BY p.created_at DESC
) p
LEFT JOIN board b ON p.board_id = b.board_id  
LEFT JOIN emp e ON p.author_id = e.user_id
WHERE ROWNUM <= 10
order by created_at desc;

SELECT 
    EMAIL,
    REGEXP_REPLACE(EMAIL, '^(.{2})([^@]+)', '\1****') AS MASKED_EMAIL
FROM EMP;

SELECT 
    PHONE,
    REGEXP_REPLACE(PHONE, '(^[0-9]{3})([0-9]{4})([0-9]{4})', '\1****\3') AS MASKED_PHONE
FROM EMP;

select
	    m.user_id, m.name, REGEXP_REPLACE(m.email, '^(.{2})([^@]+)', '\1****') AS MASKED_EMAIL,
	    REGEXP_REPLACE(m.phone, '(^[0-9]{3})([0-9]{4})([0-9]{4})', '\1****\3') AS MASKED_PHONE,
	    e.dept_id, d.dept_name, m.position, m.hire_date, m.mgr, m.name AS mgr_name, m.enabled, m.birth_date, m.nationality from emp e
	    left join dept d on e.dept_id = d.dept_id
	    left join emp m on e.mgr = m.user_id;
        
SELECT 
    e.user_id, 
    e.name AS employee_name, 
    REGEXP_REPLACE(e.email, '^(.{2})([^@]+)', '\1****') AS masked_email,
    REGEXP_REPLACE(e.phone, '(^[0-9]{3})([0-9]{4})([0-9]{4})', '\1****\3') AS masked_phone,
    e.dept_id, 
    d.dept_name, 
    e.position, 
    e.hire_date, 
    e.mgr, 
    m.name AS mgr_name,  -- ����� �̸�
    e.enabled, 
    e.birth_date, 
    e.nationality
FROM emp e
LEFT JOIN dept d ON e.dept_id = d.dept_id   -- �μ� ���� ����
LEFT JOIN emp m ON e.mgr = m.user_id;        -- ��� ���� ����
    
insert into dept (dept_id, dept_name, mgr_id) values ('D001', '������', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D002', '���������', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D003', '���� 1��', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D004', '���� 2��', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D005', '���� 3��', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D006', 'ǰ��������', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D007', 'ǰ��������', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D008', 'ǰ���˻���', 'geun');


