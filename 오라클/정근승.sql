select * from product where product_id = 'MD106M1C';
select * from product;
select * from material;
select * from plan;
select * from posts;
select * from emp;
select * from authorities;
select * from dept;
select * from bom;
select * from equipment;
select * from maintenance;
select * from equip_downtime;
rollback;

update emp set enabled = 0, name = name || '(Å»ÅðÇÔ)' where user_id='geun1';
alter TABLE emp modify (position varchar2(50) default 'ÀÎÅÏ');

commit;

alter table emp add (profile_url clob default 'resources/profile/defaultProfile.png');
alter table emp drop column profile_url;
alter table equip_downtime modify (end_time timestamp);
    
insert into dept (dept_id, dept_name, mgr_id) values ('D001', '°ü¸®ÆÀ', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D002', '»ý»ê°ü¸®ÆÀ', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D003', '»ý»ê 1ÆÀ', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D004', '»ý»ê 2ÆÀ', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D005', '»ý»ê 3ÆÀ', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D006', 'Ç°Áú°ü¸®ÆÀ', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D007', 'Ç°Áúº¸ÁõÆÀ', 'geun');
insert into dept (dept_id, dept_name, mgr_id) values ('D008', 'Ç°Áú°Ë»çÆÀ', 'geun');

SELECT *
FROM (
    SELECT 
        m.main_id, 
        m.equip_id, 
        e.name AS equip_name, 
        e.type AS equip_type, 
        m.main_date, 
        m.performed_by, 
        p.name AS performer_name, 
        m.description, 
        ROW_NUMBER() OVER (ORDER BY m.main_id) AS rnum
    FROM maintenance m
    LEFT JOIN equipment e ON m.equip_id = e.equip_id
    LEFT JOIN emp p ON m.performed_by = p.user_id
    WHERE 1=1
)
WHERE rnum BETWEEN 1 AND 10;

SELECT MAX(TO_NUMBER(SUBSTR(main_id, 6)))
		FROM maintenance;
        


SELECT equip_id, name AS equip_name, type FROM equipment;

SELECT equip_id, MAX(main_date) AS last_maintenance_date
FROM maintenance
GROUP BY equip_id;

DROP TRIGGER SCOTT2_5.TRG_UPDATE_LAST_MAINTENANCE;

SELECT MAX(main_date) AS last_maintenance_date
FROM maintenance
WHERE equip_id = ?;

UPDATE equipment SET last = to_date('10/21/2024 00:00:00', 'mm/dd/yyyy hh24:mi:ss') WHERE equip_id 
= 'E002';

SELECT *
    FROM (
        SELECT 
            d.downtime_id, 
            d.equip_id, 
            d.start_time, 
            d.end_time, 
            d.reason, 
            d.user_id, 
            d.comments, 
            e.name as equip_name, 
            p.name as emp_name,
            ROW_NUMBER() OVER (ORDER BY d.downtime_id) AS rnum
        FROM equip_downtime d
        LEFT JOIN equipment e ON d.equip_id = e.equip_id
        LEFT JOIN emp p ON d.user_id = p.user_id
        WHERE 1=1
        and e.name LIKE '%' || '°¡±¸'|| '%'
        )
        WHERE rnum BETWEEN 1 AND 10;
