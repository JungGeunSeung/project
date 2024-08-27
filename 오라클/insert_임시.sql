-- usertable 테이블에 데이터 삽입
INSERT INTO usertable (userid, name, email, phonenumber, birth_date, hiredate, grade, status, empno, deptno)
VALUES ('user001', '홍길동', 'hong@gmail.com', '010-1234-5678', TO_DATE('1980-01-15', 'YYYY-MM-DD'), TO_DATE('2010-03-15', 'YYYY-MM-DD'), 'A', 'Active', 100001, 101);

INSERT INTO usertable (userid, name, email, phonenumber, birth_date, hiredate, grade, status, empno, deptno)
VALUES ('user002', '김영희', 'kimyh@gmail.com', '010-2345-6789', TO_DATE('1985-05-20', 'YYYY-MM-DD'), TO_DATE('2012-07-22', 'YYYY-MM-DD'), 'B', 'Active', 100002, 102);

INSERT INTO usertable (userid, name, email, phonenumber, birth_date, hiredate, grade, status, empno, deptno)
VALUES ('user003', '이철수', 'lee@gmail.com', '010-3456-7890', TO_DATE('1990-10-30', 'YYYY-MM-DD'), TO_DATE('2015-09-01', 'YYYY-MM-DD'), 'C', 'Inactive', 100003, 103);

INSERT INTO usertable (userid, name, email, phonenumber, birth_date, hiredate, grade, status, empno, deptno)
VALUES ('user004', '박민수', 'park@gmail.com', '010-4567-8901', TO_DATE('1995-02-25', 'YYYY-MM-DD'), TO_DATE('2018-11-12', 'YYYY-MM-DD'), 'A', 'Active', 100004, 104);

INSERT INTO usertable (userid, name, email, phonenumber, birth_date, hiredate, grade, status, empno, deptno)
VALUES ('user005', '정현수', 'jung@gmail.com', '010-5678-9012', TO_DATE('2000-07-15', 'YYYY-MM-DD'), TO_DATE('2020-02-20', 'YYYY-MM-DD'), 'B', 'Active', 100005, 105);

-- writetable 테이블에 데이터 삽입
INSERT INTO writetable (write_id, userid, category_id, title, content, create_date, view_count, status)
VALUES ('write001', 'user001', 'cat001', '첫 번째 게시글', '이것은 첫 번째 게시글의 내용입니다.', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 10, 'Active');

INSERT INTO writetable (write_id, userid, category_id, title, content, create_date, view_count, status)
VALUES ('write002', 'user002', 'cat002', '두 번째 게시글', '이것은 두 번째 게시글의 내용입니다.', TO_DATE('2023-08-02', 'YYYY-MM-DD'), 20, 'Active');

INSERT INTO writetable (write_id, userid, category_id, title, content, create_date, view_count, status)
VALUES ('write003', 'user003', 'cat003', '세 번째 게시글', '이것은 세 번째 게시글의 내용입니다.', TO_DATE('2023-08-03', 'YYYY-MM-DD'), 30, 'Inactive');

INSERT INTO writetable (write_id, userid, category_id, title, content, create_date, view_count, status)
VALUES ('write004', 'user004', 'cat004', '네 번째 게시글', '이것은 네 번째 게시글의 내용입니다.', TO_DATE('2023-08-04', 'YYYY-MM-DD'), 40, 'Active');

INSERT INTO writetable (write_id, userid, category_id, title, content, create_date, view_count, status)
VALUES ('write005', 'user005', 'cat005', '다섯 번째 게시글', '이것은 다섯 번째 게시글의 내용입니다.', TO_DATE('2023-08-05', 'YYYY-MM-DD'), 50, 'Active');

-- commtable 테이블에 데이터 삽입
INSERT INTO commtable (comment_id, write_id, category_id, content, create_date, update_date, status)
VALUES ('comm001', 'write001', 'cat001', '첫 번째 댓글입니다.', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'Active');

INSERT INTO commtable (comment_id, write_id, category_id, content, create_date, update_date, status)
VALUES ('comm002', 'write002', 'cat002', '두 번째 댓글입니다.', TO_DATE('2023-08-02', 'YYYY-MM-DD'), TO_DATE('2023-08-03', 'YYYY-MM-DD'), 'Active');

INSERT INTO commtable (comment_id, write_id, category_id, content, create_date, update_date, status)
VALUES ('comm003', 'write003', 'cat003', '세 번째 댓글입니다.', TO_DATE('2023-08-03', 'YYYY-MM-DD'), TO_DATE('2023-08-04', 'YYYY-MM-DD'), 'Inactive');

INSERT INTO commtable (comment_id, write_id, category_id, content, create_date, update_date, status)
VALUES ('comm004', 'write004', 'cat004', '네 번째 댓글입니다.', TO_DATE('2023-08-04', 'YYYY-MM-DD'), TO_DATE('2023-08-05', 'YYYY-MM-DD'), 'Active');

INSERT INTO commtable (comment_id, write_id, category_id, content, create_date, update_date, status)
VALUES ('comm005', 'write005', 'cat005', '다섯 번째 댓글입니다.', TO_DATE('2023-08-05', 'YYYY-MM-DD'), TO_DATE('2023-08-06', 'YYYY-MM-DD'), 'Active');

-- Product 테이블에 데이터 삽입
INSERT INTO Product (production_id, pname, pdescription, unitprice, pquantity)
VALUES ('prod001', '스마트폰', '최신 스마트폰입니다.', 800000, 100);

INSERT INTO Product (production_id, pname, pdescription, unitprice, pquantity)
VALUES ('prod002', '노트북', '고성능 노트북입니다.', 1500000, 50);

INSERT INTO Product (production_id, pname, pdescription, unitprice, pquantity)
VALUES ('prod003', '태블릿', '휴대용 태블릿입니다.', 600000, 200);

INSERT INTO Product (production_id, pname, pdescription, unitprice, pquantity)
VALUES ('prod004', '스마트워치', '스마트 기능을 가진 시계입니다.', 300000, 150);

INSERT INTO Product (production_id, pname, pdescription, unitprice, pquantity)
VALUES ('prod005', '무선 이어폰', '블루투스 무선 이어폰입니다.', 200000, 300);

-- bom 테이블에 데이터 삽입
INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom001', 'prod001', 'mat001', 50);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom006', 'prod001', 'mat002', 30);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom007', 'prod001', 'mat003', 20);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom002', 'prod002', 'mat002', 30);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom008', 'prod002', 'mat004', 40);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom009', 'prod002', 'mat005', 20);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom003', 'prod003', 'mat003', 20);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom010', 'prod003', 'mat006', 15);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom004', 'prod004', 'mat004', 10);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom011', 'prod004', 'mat001', 25);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom012', 'prod004', 'mat005', 35);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom005', 'prod005', 'mat005', 60);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom013', 'prod005', 'mat006', 30);

INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES ('bom014', 'prod005', 'mat003', 40);

-- category 테이블에 데이터 삽입
INSERT INTO category (category_id, cname, cdescription)
VALUES ('cat001', '전자제품', '모든 전자제품을 포함합니다.');

INSERT INTO category (category_id, cname, cdescription)
VALUES ('cat002', '가전제품', '주방 및 생활 가전 제품을 포함합니다.');

INSERT INTO category (category_id, cname, cdescription)
VALUES ('cat003', '가구', '다양한 가구를 포함합니다.');

INSERT INTO category (category_id, cname, cdescription)
VALUES ('cat004', '의류', '남성 및 여성 의류를 포함합니다.');

INSERT INTO category (category_id, cname, cdescription)
VALUES ('cat005', '도서', '다양한 도서를 포함합니다.');

-- plan 테이블에 데이터 삽입
INSERT INTO plan (planid, production_id, plannedQuan, startDate, EndDate, status, userid)
VALUES ('plan001', 'prod001', 100, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), 'Active', 'user001');

INSERT INTO plan (planid, production_id, plannedQuan, startDate, EndDate, status, userid)
VALUES ('plan002', 'prod002', 50, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'), 'Active', 'user002');

INSERT INTO plan (planid, production_id, plannedQuan, startDate, EndDate, status, userid)
VALUES ('plan003', 'prod003', 200, TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 'Planned', 'user003');

INSERT INTO plan (planid, production_id, plannedQuan, startDate, EndDate, status, userid)
VALUES ('plan004', 'prod004', 150, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'Active', 'user004');

INSERT INTO plan (planid, production_id, plannedQuan, startDate, EndDate, status, userid)
VALUES ('plan005', 'prod005', 300, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-31', 'YYYY-MM-DD'), 'Planned', 'user005');

-- task 테이블에 데이터 삽입
INSERT INTO task (taskid, planid, production_id, required, used, taskstatus, taskcontent)
VALUES ('task001', 'plan001', 'prod001', 100, 95, 'Completed', '스마트폰 생산 완료');

INSERT INTO task (taskid, planid, production_id, required, used, taskstatus, taskcontent)
VALUES ('task002', 'plan002', 'prod002', 50, 50, 'Completed', '노트북 생산 완료');

INSERT INTO task (taskid, planid, production_id, required, used, taskstatus, taskcontent)
VALUES ('task003', 'plan003', 'prod003', 200, 180, 'In Progress', '태블릿 생산 진행 중');

INSERT INTO task (taskid, planid, production_id, required, used, taskstatus, taskcontent)
VALUES ('task004', 'plan004', 'prod004', 150, 150, 'Completed', '스마트워치 생산 완료');

INSERT INTO task (taskid, planid, production_id, required, used, taskstatus, taskcontent)
VALUES ('task005', 'plan005', 'prod005', 300, 280, 'In Progress', '무선 이어폰 생산 진행 중');

-- transaction 테이블에 데이터 삽입
INSERT INTO transaction (transaction_id, production_id, transType, TQuantity, TDate, status)
VALUES ('trans001', 'prod001', '출고', 100, TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'Completed');

INSERT INTO transaction (transaction_id, production_id, transType, TQuantity, TDate, status)
VALUES ('trans002', 'prod002', '입고', 50, TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'Completed');

INSERT INTO transaction (transaction_id, production_id, transType, TQuantity, TDate, status)
VALUES ('trans003', 'prod003', '출고', 200, TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'Pending');

INSERT INTO transaction (transaction_id, production_id, transType, TQuantity, TDate, status)
VALUES ('trans004', 'prod004', '입고', 150, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 'Completed');

INSERT INTO transaction (transaction_id, production_id, transType, TQuantity, TDate, status)
VALUES ('trans005', 'prod005', '출고', 300, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 'Pending');

-- ProductionResult 테이블에 데이터 삽입
INSERT INTO ProductionResult (ResultID, production_id, taskid, planid, ProductionDate, ProducedQuantity, DefectiveQuantity, Status)
VALUES ('res001', 'prod001', 'task001', 'plan001', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 100, 5, 'Completed');

INSERT INTO ProductionResult (ResultID, production_id, taskid, planid, ProductionDate, ProducedQuantity, DefectiveQuantity, Status)
VALUES ('res002', 'prod002', 'task002', 'plan002', TO_DATE('2023-10-31', 'YYYY-MM-DD'), 50, 0, 'Completed');

INSERT INTO ProductionResult (ResultID, production_id, taskid, planid, ProductionDate, ProducedQuantity, DefectiveQuantity, Status)
VALUES ('res003', 'prod003', 'task003', 'plan003', TO_DATE('2023-11-30', 'YYYY-MM-DD'), 200, 20, 'In Progress');

INSERT INTO ProductionResult (ResultID, production_id, taskid, planid, ProductionDate, ProducedQuantity, DefectiveQuantity, Status)
VALUES ('res004', 'prod004', 'task004', 'plan004', TO_DATE('2023-12-31', 'YYYY-MM-DD'), 150, 10, 'Completed');

INSERT INTO ProductionResult (ResultID, production_id, taskid, planid, ProductionDate, ProducedQuantity, DefectiveQuantity, Status)
VALUES ('res005', 'prod005', 'task005', 'plan005', TO_DATE('2024-01-31', 'YYYY-MM-DD'), 300, 20, 'In Progress');

-- QualityInspection 테이블에 데이터 삽입
INSERT INTO QualityInspection (ins_id, production_id, planid, ins_date, result, defect_count, defect_cause, ResultID, taskid)
VALUES ('ins001', 'prod001', 'plan001', TO_DATE('2023-09-29', 'YYYY-MM-DD'), 'Pass', 5, '미세한 스크래치', 'res001', 'task001');

INSERT INTO QualityInspection (ins_id, production_id, planid, ins_date, result, defect_count, defect_cause, ResultID, taskid)
VALUES ('ins002', 'prod002', 'plan002', TO_DATE('2023-10-30', 'YYYY-MM-DD'), 'Pass', 0, 'None', 'res002', 'task002');

INSERT INTO QualityInspection (ins_id, production_id, planid, ins_date, result, defect_count, defect_cause, ResultID, taskid)
VALUES ('ins003', 'prod003', 'plan003', TO_DATE('2023-11-29', 'YYYY-MM-DD'), 'Fail', 20, '제작 결함', 'res003', 'task003');

INSERT INTO QualityInspection (ins_id, production_id, planid, ins_date, result, defect_count, defect_cause, ResultID, taskid)
VALUES ('ins004', 'prod004', 'plan004', TO_DATE('2023-12-30', 'YYYY-MM-DD'), 'Pass', 10, '조립 문제', 'res004', 'task004');

INSERT INTO QualityInspection (ins_id, production_id, planid, ins_date, result, defect_count, defect_cause, ResultID, taskid)
VALUES ('ins005', 'prod005', 'plan005', TO_DATE('2024-01-30', 'YYYY-MM-DD'), 'Pass', 20, '마감 불량', 'res005', 'task005');

-- DefectRecord 테이블에 데이터 삽입
INSERT INTO DefectRecord (type_id, report_id, ins_id, production_id, planid, type_name, type_descripton)
VALUES ('def001', 'rep001', 'ins001', 'prod001', 'plan001', '스크래치', '제품 표면에 미세한 스크래치가 발생했습니다.');

INSERT INTO DefectRecord (type_id, report_id, ins_id, production_id, planid, type_name, type_descripton)
VALUES ('def002', 'rep002', 'ins003', 'prod003', 'plan003', '제작 결함', '제작 과정에서 발생한 결함입니다.');

INSERT INTO DefectRecord (type_id, report_id, ins_id, production_id, planid, type_name, type_descripton)
VALUES ('def003', 'rep003', 'ins004', 'prod004', 'plan004', '조립 문제', '조립 과정에서 문제가 발생했습니다.');

INSERT INTO DefectRecord (type_id, report_id, ins_id, production_id, planid, type_name, type_descripton)
VALUES ('def004', 'rep004', 'ins005', 'prod005', 'plan005', '마감 불량', '제품 마감 처리에 문제가 있었습니다.');

INSERT INTO DefectRecord (type_id, report_id, ins_id, production_id, planid, type_name, type_descripton)
VALUES ('def005', 'rep005', 'ins002', 'prod002', 'plan002', '없음', '결함이 발견되지 않았습니다.');

-- DefectType 테이블에 데이터 삽입
INSERT INTO DefectType (report_id, ins_id, production_id, planid, defect_count)
VALUES ('rep001', 'ins001', 'prod001', 'plan001', 5);

INSERT INTO DefectType (report_id, ins_id, production_id, planid, defect_count)
VALUES ('rep002', 'ins003', 'prod003', 'plan003', 20);

INSERT INTO DefectType (report_id, ins_id, production_id, planid, defect_count)
VALUES ('rep003', 'ins004', 'prod004', 'plan004', 10);

INSERT INTO DefectType (report_id, ins_id, production_id, planid, defect_count)
VALUES ('rep004', 'ins005', 'prod005', 'plan005', 20);

INSERT INTO DefectType (report_id, ins_id, production_id, planid, defect_count)
VALUES ('rep005', 'ins002', 'prod002', 'plan002', 0);

-- equipmentUsage 테이블에 데이터 삽입
INSERT INTO equipmentUsage (resultid, equiID, startdate, enddate)
VALUES ('res001', 'equi001', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'));

INSERT INTO equipmentUsage (resultid, equiID, startdate, enddate)
VALUES ('res002', 'equi002', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'));

INSERT INTO equipmentUsage (resultid, equiID, startdate, enddate)
VALUES ('res003', 'equi003', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'));

INSERT INTO equipmentUsage (resultid, equiID, startdate, enddate)
VALUES ('res004', 'equi004', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));

INSERT INTO equipmentUsage (resultid, equiID, startdate, enddate)
VALUES ('res005', 'equi005', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-31', 'YYYY-MM-DD'));

-- equipment 테이블에 데이터 삽입
INSERT INTO equipment (equiID, equiname, equitype, selldate, equiloc, status)
VALUES ('equi001', '프레스 기계', '제조', TO_DATE('2015-03-15', 'YYYY-MM-DD'), '공장 1', '운영 중');

INSERT INTO equipment (equiID, equiname, equitype, selldate, equiloc, status)
VALUES ('equi002', '레이저 절단기', '절단', TO_DATE('2016-05-20', 'YYYY-MM-DD'), '공장 2', '운영 중');

INSERT INTO equipment (equiID, equiname, equitype, selldate, equiloc, status)
VALUES ('equi003', '조립 로봇', '조립', TO_DATE('2017-07-25', 'YYYY-MM-DD'), '공장 3', '점검 중');

INSERT INTO equipment (equiID, equiname, equitype, selldate, equiloc, status)
VALUES ('equi004', '포장 기계', '포장', TO_DATE('2018-09-30', 'YYYY-MM-DD'), '공장 4', '운영 중');

INSERT INTO equipment (equiID, equiname, equitype, selldate, equiloc, status)
VALUES ('equi005', '테스트 장비', '검사', TO_DATE('2019-12-10', 'YYYY-MM-DD'), '공장 5', '점검 중');

-- maintenance 테이블에 데이터 삽입
INSERT INTO maintenance (mainID, equiID, maindate, maincontent, manager)
VALUES ('main001', 'equi001', TO_DATE('2023-09-15', 'YYYY-MM-DD'), '프레스 기계 정기 점검', '홍길동');

INSERT INTO maintenance (mainID, equiID, maindate, maincontent, manager)
VALUES ('main002', 'equi002', TO_DATE('2023-10-20', 'YYYY-MM-DD'), '레이저 절단기 정기 점검', '김영희');

INSERT INTO maintenance (mainID, equiID, maindate, maincontent, manager)
VALUES ('main003', 'equi003', TO_DATE('2023-11-25', 'YYYY-MM-DD'), '조립 로봇 수리', '이철수');

INSERT INTO maintenance (mainID, equiID, maindate, maincontent, manager)
VALUES ('main004', 'equi004', TO_DATE('2023-12-30', 'YYYY-MM-DD'), '포장 기계 점검', '박민수');

INSERT INTO maintenance (mainID, equiID, maindate, maincontent, manager)
VALUES ('main005', 'equi005', TO_DATE('2024-01-10', 'YYYY-MM-DD'), '테스트 장비 교체', '정현수');


--material 테이블에 데이터 삽입
-- 자재id, 자재lot, 자재명, 규격, 단위, 검수자, 수량
INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00123', 'LOT12345', '폴리에틸렌 수지', 'PE100', 'kg', '홍길동', 100);

INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00234', 'LOT23456', '동 접합선', 'C11000', 'm', '김영희', 200);

INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00345', 'LOT34567', '고밀도 폴리에틸렌', 'HDPE', 'kg', '이철수', 150);

INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00456', 'LOT45678', '폴리프로필렌', 'PP-R', 'kg', '박민수', 250);

INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00567', 'LOT56789', '스테인리스 스틸', '304', 'kg', '정현수', 300);

