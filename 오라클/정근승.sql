select * from product where product_id = 'MD106M1C';
select * from product order by name;
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
select * from performance;
select * from workOrder;
rollback;

update emp set enabled = 0, name = name || '(탈퇴함)' where user_id='geun1';
alter TABLE emp modify (position varchar2(50) default '인턴');

select * from equipment where status = '사용 가능';
select * from equipment where status = '사용 중';
select * from equipment where status = '고장';
SELECT 
    a.name as product_name,
    SUM(p.actual) AS total_actual,
    SUM(p.defect_quantity) AS total_defect_quantity,
    ROUND(SUM(p.defect_quantity) / SUM(p.actual) * 100, 2) AS defect_rate
FROM 
    performance p
LEFT JOIN 
    workorder w ON w.order_id = p.order_id
LEFT JOIN 
    plan l ON l.plan_id = w.plan_id
LEFT JOIN 
    product a ON a.product_id = l.product_id
GROUP BY 
    a.name
ORDER BY 
    a.name;

select * from product where name like '%서랍%';
select * from plan where product_id like '%GD%';

commit;

alter table emp add (profile_url clob default 'resources/profile/defaultProfile.png');
alter table emp drop column profile_url;
alter table equip_downtime modify (end_time timestamp);


SELECT MAX(TO_NUMBER(SUBSTR(main_id, 6)))
		FROM maintenance;
        

UPDATE equipment SET last = to_date('10/21/2024 00:00:00', 'mm/dd/yyyy hh24:mi:ss') WHERE equip_id 
= 'E002';

update plan set status = '진행' where start_date = sysdate;

SELECT 
    p.start_date,
    MAX(CASE WHEN w.name = '모션데스크 (모터100)' THEN p.quantity || '개 ' || p.status ELSE '-' END) AS 모션데스크,
    MAX(CASE WHEN w.name = '일반데스크' THEN p.quantity || '개 ' || p.status ELSE '-' END) AS 일반데스크,
    MAX(CASE WHEN w.name = '3단서랍장' THEN p.quantity || '개 ' || p.status ELSE '-' END) AS 서랍장3단,
    MAX(CASE WHEN w.name = '4단서랍장' THEN p.quantity || '개 ' || p.status ELSE '-' END) AS 서랍장4단,
    MAX(CASE WHEN w.name = '5단서랍장' THEN p.quantity || '개 ' || p.status ELSE '-' END) AS 서랍장5단
FROM plan p
LEFT JOIN product w ON p.product_id = w.product_id
WHERE p.start_date >= SYSDATE - 7 AND p.start_date <= SYSDATE + 7
GROUP BY p.start_date
ORDER BY p.start_date;
