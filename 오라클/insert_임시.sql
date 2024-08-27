-- usertable ���̺� ������ ����
-- ȸ�� id, �̸�, �̸���, ����ȣ, �������, �Ի���, ���, ����, �����ȣ, �μ���ȣ
INSERT INTO usertable (userid, name, email, phonenumber, birth_date, hiredate, grade, status, empno, deptno)
VALUES 
('user001', 'ȫ�浿', 'hong@gmail.com', '010-1234-5678', TO_DATE('1980-01-15', 'YYYY-MM-DD'), TO_DATE('2010-03-15', 'YYYY-MM-DD'), 'A', 'Active', 100001, 101),
('user002', '�迵��', 'kimyh@gmail.com', '010-2345-6789', TO_DATE('1985-05-20', 'YYYY-MM-DD'), TO_DATE('2012-07-22', 'YYYY-MM-DD'), 'B', 'Active', 100002, 102),
('user003', '��ö��', 'lee@gmail.com', '010-3456-7890', TO_DATE('1990-10-30', 'YYYY-MM-DD'), TO_DATE('2015-09-01', 'YYYY-MM-DD'), 'C', 'Inactive', 100003, 103),
('user004', '�ڹμ�', 'park@gmail.com', '010-4567-8901', TO_DATE('1995-02-25', 'YYYY-MM-DD'), TO_DATE('2018-11-12', 'YYYY-MM-DD'), 'A', 'Active', 100004, 104),
('user005', '������', 'jung@gmail.com', '010-5678-9012', TO_DATE('2000-07-15', 'YYYY-MM-DD'), TO_DATE('2020-02-20', 'YYYY-MM-DD'), 'B', 'Active', 100005, 105);

-- writetable ���̺� ������ ����
-- �Խñ�id, ȸ��id, ī�װ�id, ����, ����, ������, ��ȸ��, ����
INSERT INTO writetable (write_id, userid, category_id, title, content, create_date, view_count, status)
VALUES 
('write001', 'user001', 'cat001', 'ù ��° �Խñ�', '�̰��� ù ��° �Խñ��� �����Դϴ�.', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 10, 'Active'),
('write002', 'user002', 'cat002', '�� ��° �Խñ�', '�̰��� �� ��° �Խñ��� �����Դϴ�.', TO_DATE('2023-08-02', 'YYYY-MM-DD'), 20, 'Active'),
('write003', 'user003', 'cat003', '�� ��° �Խñ�', '�̰��� �� ��° �Խñ��� �����Դϴ�.', TO_DATE('2023-08-03', 'YYYY-MM-DD'), 30, 'Inactive'),
('write004', 'user004', 'cat004', '�� ��° �Խñ�', '�̰��� �� ��° �Խñ��� �����Դϴ�.', TO_DATE('2023-08-04', 'YYYY-MM-DD'), 40, 'Active'),
('write005', 'user005', 'cat005', '�ټ� ��° �Խñ�', '�̰��� �ټ� ��° �Խñ��� �����Դϴ�.', TO_DATE('2023-08-05', 'YYYY-MM-DD'), 50, 'Active');

-- commtable ���̺� ������ ����
-- ���id, �Խñ�id, ī�װ�id, ��۳���, �ۼ���, ������, ����
INSERT INTO commtable (comment_id, write_id, category_id, content, create_date, update_date, status)
VALUES 
('comm001', 'write001', 'cat001', 'ù ��° ����Դϴ�.', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'Active'),
('comm002', 'write002', 'cat002', '�� ��° ����Դϴ�.', TO_DATE('2023-08-02', 'YYYY-MM-DD'), TO_DATE('2023-08-03', 'YYYY-MM-DD'), 'Active'),
('comm003', 'write003', 'cat003', '�� ��° ����Դϴ�.', TO_DATE('2023-08-03', 'YYYY-MM-DD'), TO_DATE('2023-08-04', 'YYYY-MM-DD'), 'Inactive'),
('comm004', 'write004', 'cat004', '�� ��° ����Դϴ�.', TO_DATE('2023-08-04', 'YYYY-MM-DD'), TO_DATE('2023-08-05', 'YYYY-MM-DD'), 'Active'),
('comm005', 'write005', 'cat005', '�ټ� ��° ����Դϴ�.', TO_DATE('2023-08-05', 'YYYY-MM-DD'), TO_DATE('2023-08-06', 'YYYY-MM-DD'), 'Active');

-- Product ���̺� ������ ����
-- ��ǰid, ��ǰ��, ��ǰ����, �ܰ�, ���
INSERT INTO Product (production_id, pname, pdescription, unitprice, pquantity)
VALUES 
('prod001', '����Ʈ��', '�ֽ� ����Ʈ���Դϴ�.', 800000, 100),
('prod002', '��Ʈ��', '���� ��Ʈ���Դϴ�.', 1500000, 50),
('prod003', '�º�', '�޴�� �º��Դϴ�.', 600000, 200),
('prod004', '����Ʈ��ġ', '����Ʈ ����� ���� �ð��Դϴ�.', 300000, 150),
('prod005', '���� �̾���', '������� ���� �̾����Դϴ�.', 200000, 300);

-- bom ���̺� ������ ����
-- BOMid, ��ǰid, ����id, ���������
INSERT INTO bom (bom_id, production_id, mid, bom_quantity)
VALUES 
('bom001', 'prod001', 'mat001', 50),
('bom006', 'prod001', 'mat002', 30),
('bom007', 'prod001', 'mat003', 20),
('bom002', 'prod002', 'mat002', 30),
('bom008', 'prod002', 'mat004', 40),
('bom009', 'prod002', 'mat005', 20),
('bom003', 'prod003', 'mat003', 20),
('bom010', 'prod003', 'mat006', 15),
('bom004', 'prod004', 'mat004', 10),
('bom011', 'prod004', 'mat001', 25),
('bom012', 'prod004', 'mat005', 35),
('bom005', 'prod005', 'mat005', 60),
('bom013', 'prod005', 'mat006', 30),
('bom014', 'prod005', 'mat003', 40);

-- category ���̺� ������ ����
-- ī�װ�id, ī�װ��̸�, ī�װ�����
INSERT INTO category (category_id, cname, cdescription)
VALUES 
('cat001', '������ǰ', '��� ������ǰ�� �����մϴ�.'),
('cat002', '������ǰ', '�ֹ� �� ��Ȱ ���� ��ǰ�� �����մϴ�.'),
('cat003', '����', '�پ��� ������ �����մϴ�.'),
('cat004', '�Ƿ�', '���� �� ���� �Ƿ��� �����մϴ�.'),
('cat005', '����', '�پ��� ������ �����մϴ�.');

-- plan ���̺� ������ ����
-- �����ȹid, ��ǰid, �����ȹ����, ��ȹ����, ��������, ����, ȸ��id
INSERT INTO plan (planid, production_id, plannedQuan, startDate, EndDate, status, userid)
VALUES 
('plan001', 'prod001', 100, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), 'Active', 'user001'),
('plan002', 'prod002', 50, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'), 'Active', 'user002'),
('plan003', 'prod003', 200, TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 'Planned', 'user003'),
('plan004', 'prod004', 150, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'Active', 'user004'),
('plan005', 'prod005', 300, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-31', 'YYYY-MM-DD'), 'Planned', 'user005');

-- task ���̺� ������ ����
-- �۾�����id, �����ȹid, ��ǰid, ���갳��, ���������, �������, ���곻��
INSERT INTO task (taskid, planid, production_id, required, used, taskstatus, taskcontent)
VALUES 
('task001', 'plan001', 'prod001', 100, 95, 'Completed', '����Ʈ�� ���� �Ϸ�'),
('task002', 'plan002', 'prod002', 50, 50, 'Completed', '��Ʈ�� ���� �Ϸ�'),
('task003', 'plan003', 'prod003', 200, 180, 'In Progress', '�º� ���� ���� ��'),
('task004', 'plan004', 'prod004', 150, 150, 'Completed', '����Ʈ��ġ ���� �Ϸ�'),
('task005', 'plan005', 'prod005', 300, 280, 'In Progress', '���� �̾��� ���� ���� ��');

-- transaction ���̺� ������ ����
-- ���id, ��ǰid, �������, ������, ��������, ����
INSERT INTO transaction (transaction_id, production_id, transType, TQuantity, TDate, status)
VALUES 
('trans001', 'prod001', '���', 100, TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'Completed'),
('trans002', 'prod002', '�԰�', 50, TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'Completed'),
('trans003', 'prod003', '���', 200, TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'Pending'),
('trans004', 'prod004', '�԰�', 150, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 'Completed'),
('trans005', 'prod005', '���', 300, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 'Pending');

-- ProductionResult ���̺� ������ ����
-- �������id, ��ǰid, �۾�����id, ��ȹid, ��������, ���갳��, �ҷ�����, ����
INSERT INTO ProductionResult (ResultID, production_id, taskid, planid, ProductionDate, ProducedQuantity, DefectiveQuantity, Status)
VALUES 
('res001', 'prod001', 'task001', 'plan001', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 100, 5, 'Completed'),
('res002', 'prod002', 'task002', 'plan002', TO_DATE('2023-10-31', 'YYYY-MM-DD'), 50, 0, 'Completed'),
('res003', 'prod003', 'task003', 'plan003', TO_DATE('2023-11-30', 'YYYY-MM-DD'), 200, 20, 'In Progress'),
('res004', 'prod004', 'task004', 'plan004', TO_DATE('2023-12-31', 'YYYY-MM-DD'), 150, 10, 'Completed'),
('res005', 'prod005', 'task005', 'plan005', TO_DATE('2024-01-31', 'YYYY-MM-DD'), 300, 20, 'In Progress');

-- QualityInspection ���̺� ������ ����
-- ǰ���˻�id, ��ǰid, ��ȹid, �˻糯¥, �˻���, �ҷ�����, �ҷ�����, ���id, �۾�����id
INSERT INTO QualityInspection (ins_id, production_id, planid, ins_date, result, defect_count, defect_cause, ResultID, taskid)
VALUES 
('ins001', 'prod001', 'plan001', TO_DATE('2023-09-29', 'YYYY-MM-DD'), 'Pass', 5, '�̼��� ��ũ��ġ', 'res001', 'task001'),
('ins002', 'prod002', 'plan002', TO_DATE('2023-10-30', 'YYYY-MM-DD'), 'Pass', 0, 'None', 'res002', 'task002'),
('ins003', 'prod003', 'plan003', TO_DATE('2023-11-29', 'YYYY-MM-DD'), 'Fail', 20, '���� ����', 'res003', 'task003'),
('ins004', 'prod004', 'plan004', TO_DATE('2023-12-30', 'YYYY-MM-DD'), 'Pass', 10, '���� ����', 'res004', 'task004'),
('ins005', 'prod005', 'plan005', TO_DATE('2024-01-30', 'YYYY-MM-DD'), 'Pass', 20, '���� �ҷ�', 'res005', 'task005');

-- DefectRecord ���̺� ������ ����
-- �ҷ�����id, �ҷ�Ÿ��id, ǰ���˻�id, ��ǰid, �����ȹid, �ҷ��̸�, �ҷ�����
INSERT INTO DefectRecord (type_id, report_id, ins_id, production_id, planid, type_name, type_descripton)
VALUES 
('def001', 'rep001', 'ins001', 'prod001', 'plan001', '��ũ��ġ', '��ǰ ǥ�鿡 �̼��� ��ũ��ġ�� �߻��߽��ϴ�.'),
('def002', 'rep002', 'ins003', 'prod003', 'plan003', '���� ����', '���� �������� �߻��� �����Դϴ�.'),
('def003', 'rep003', 'ins004', 'prod004', 'plan004', '���� ����', '���� �������� ������ �߻��߽��ϴ�.'),
('def004', 'rep004', 'ins005', 'prod005', 'plan005', '���� �ҷ�', '��ǰ ���� ó���� ������ �־����ϴ�.'),
('def005', 'rep005', 'ins002', 'prod002', 'plan002', '����', '������ �߰ߵ��� �ʾҽ��ϴ�.');

-- DefectType ���̺� ������ ����
-- �ҷ�Ÿ��id, ǰ���˻�id, ��ǰid, �����ȹid, �ҷ�����
INSERT INTO DefectType (report_id, ins_id, production_id, planid, defect_count)
VALUES 
('rep001', 'ins001', 'prod001', 'plan001', 5),
('rep002', 'ins003', 'prod003', 'plan003', 20),
('rep003', 'ins004', 'prod004', 'plan004', 10),
('rep004', 'ins005', 'prod005', 'plan005', 20),
('rep005', 'ins002', 'prod002', 'plan002', 0);

-- equipmentUsage ���̺� ������ ����
--
INSERT INTO equipmentUsage (resultid, equiID, startdate, enddate)
VALUES 
('res001', 'equi001', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD')),
('res002', 'equi002', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD')),
('res003', 'equi003', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD')),
('res004', 'equi004', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD')),
('res005', 'equi005', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-31', 'YYYY-MM-DD'));

-- equipment ���̺� ������ ����
-- �����ڵ�id, �����, ��������, ��������, ��ġ, ����
INSERT INTO equipment (equiID, equiname, equitype, selldate, equiloc, status)
VALUES 
('equi001', '������ ���', '����', TO_DATE('2015-03-15', 'YYYY-MM-DD'), '���� 1', '� ��'),
('equi002', '������ ���ܱ�', '����', TO_DATE('2016-05-20', 'YYYY-MM-DD'), '���� 2', '� ��'),
('equi003', '���� �κ�', '����', TO_DATE('2017-07-25', 'YYYY-MM-DD'), '���� 3', '���� ��'),
('equi004', '���� ���', '����', TO_DATE('2018-09-30', 'YYYY-MM-DD'), '���� 4', '� ��'),
('equi005', '�׽�Ʈ ���', '�˻�', TO_DATE('2019-12-10', 'YYYY-MM-DD'), '���� 5', '���� ��');

-- maintenance ���̺� ������ ����
-- ����id, �����ڵ�id, ����¥, ���񳻿�, �����
INSERT INTO maintenance (mainID, equiID, maindate, maincontent, manager)
VALUES 
('main001', 'equi001', TO_DATE('2023-09-15', 'YYYY-MM-DD'), '������ ��� ���� ����', 'ȫ�浿'),
('main002', 'equi002', TO_DATE('2023-10-20', 'YYYY-MM-DD'), '������ ���ܱ� ���� ����', '�迵��'),
('main003', 'equi003', TO_DATE('2023-11-25', 'YYYY-MM-DD'), '���� �κ� ����', '��ö��'),
('main004', 'equi004', TO_DATE('2023-12-30', 'YYYY-MM-DD'), '���� ��� ����', '�ڹμ�'),
('main005', 'equi005', TO_DATE('2024-01-10', 'YYYY-MM-DD'), '�׽�Ʈ ��� ��ü', '������');

--material ���̺� ������ ����
-- ����id, ����lot, �����, �԰�, ����, �˼���, ����
INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00123', 'LOT12345', '������ƿ�� ����', 'PE100', 'kg', 'ȫ�浿', 100);

INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00234', 'LOT23456', '�� ���ռ�', 'C11000', 'm', '�迵��', 200);

INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00345', 'LOT34567', '��е� ������ƿ��', 'HDPE', 'kg', '��ö��', 150);

INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00456', 'LOT45678', '���������ʷ�', 'PP-R', 'kg', '�ڹμ�', 250);

INSERT INTO material (mid, mlot, mname, mstandard, munit, examiner, quantity)
VALUES 
('MAT00567', 'LOT56789', '�����θ��� ��ƿ', '304', 'kg', '������', 300);

