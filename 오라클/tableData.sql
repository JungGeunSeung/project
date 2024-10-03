INSERT ALL
    -- dept ���̺� ������
    INTO dept (dept_id, dept_name, mgr_id)
    VALUES ('DEPT001', '�����', 'EMP001')

    -- emp ���̺� ������
    INTO emp (user_id, name, email, phone, dept_id, position, hire_date, mgr)
    VALUES ('EMP001', '��ö��', 'kimcs@example.com', '010-1234-5678', 'DEPT001', '���� ������', TO_DATE('2015-03-01', 'YYYY-MM-DD'), NULL)
    INTO emp (user_id, name, email, phone, dept_id, position, hire_date, mgr)
    VALUES ('EMP002', '�̿���', 'leeyh@example.com', '010-5678-1234', 'DEPT001', 'ǰ�� ������', TO_DATE('2016-05-01', 'YYYY-MM-DD'), 'EMP001')
    INTO emp (user_id, name, email, phone, dept_id, position, hire_date, mgr)
    VALUES ('EMP003', '��ö��', 'parkcs@example.com', '010-9876-5432', 'DEPT001', '���� ���', TO_DATE('2017-07-15', 'YYYY-MM-DD'), 'EMP001')

    -- product ���̺� ������
    INTO product (product_id, name, code, description)
    VALUES ('PIPE001', '������ƿ�� ������', 'P001', '��� ������ƿ�� ������')
    INTO product (product_id, name, code, description)
    VALUES ('FITTING001', '���������� ������', 'F001', '���������� ���� ������')

    -- plan ���̺� ������
    INTO plan (plan_id, product_id, start_date, end_date, quantity, created_by, status)
    VALUES ('PLAN001', 'PIPE001', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), 1000, 'EMP001', '������')

    -- workOrder ���̺� ������
    INTO workOrder (order_id, plan_id, mgr_id, equip_id, start_date, end_date, status, quantity, defect_quantity)
    VALUES ('ORD001', 'PLAN001', 'EMP001', 'EQUIP001', TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), '������', 1000, 5)

    -- performance ���̺� ������
    INTO performance (per_id, order_id, actual, defect_quantity, production_date)
    VALUES ('PER001', 'ORD001', 995, 5, TO_DATE('2023-09-11', 'YYYY-MM-DD'))

    -- equipment ���̺� ������
    INTO equipment (equip_id, name, type, location, status, purchase, last)
    VALUES ('EQUIP001', '������ A', '����������', '1����', '�����', TO_DATE('2020-01-10', 'YYYY-MM-DD'), TO_DATE('2023-07-01', 'YYYY-MM-DD'))

    -- maintenance ���̺� ������
    INTO maintenance (main_id, equip_id, main_date, performed_by, description)
    VALUES ('MAIN001', 'EQUIP001', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 'EMP001', '���� ���� �Ϸ�')

    -- bom ���̺� ������
    INTO bom (bom_id, product_id, material_id, quantity, version, create_at)
    VALUES ('BOM001', 'PIPE001', 'MAT001', 500, '1.0', TO_DATE('2023-06-01', 'YYYY-MM-DD'))

    -- material ���̺� ������
    INTO material (material_id, material_name, code, description, quantity, unit)
    VALUES ('MAT001', '������ƿ�� ����', 'M001', '����� ������ƿ�� ����', 2000, 'kg')

    -- materialRequest ���̺� ������
    INTO materialRequest (request_id, material_id, request_by, req_date, quantity, status)
    VALUES ('REQ001', 'MAT001', 'EMP003', TO_DATE('2023-09-03', 'YYYY-MM-DD'), 500, '���ε�')

    -- stockmove ���̺� ������
    INTO stockmove (move_id, product_id, type, quantity, stock_date, user_id)
    VALUES ('MOVE001', 'PIPE001', '���', 500, TO_DATE('2023-09-14', 'YYYY-MM-DD'), 'EMP001')

    -- returninventory ���̺� ������
    INTO returninventory (return_id, product_id, reason, request_date, approved_by, approved_date, status)
    VALUES ('RET001', 'FITTING001', '�ҷ� �߰�', TO_DATE('2023-09-05', 'YYYY-MM-DD'), 'EMP002', TO_DATE('2023-09-06', 'YYYY-MM-DD'), 'ó����')

    -- sales_order ���̺� ������
    INTO sales_order (order_id, client_id, order_date, status, total)
    VALUES ('ORDER001', 'CLIENT001', TO_DATE('2023-09-01', 'YYYY-MM-DD'), '�����', 1500000)

    -- sales_order_details ���̺� ������
    INTO sales_order_details (detail_id, order_id, product_id, quantity, price, subtotal)
    VALUES ('DETAIL001', 'ORDER001', 'PIPE001', 500, 3000, 1500000)

    -- cost ���̺� ������
    INTO cost (cost_id, product_id, material_cost, labor_cost, over_cost, total, create_at)
    VALUES ('COST001', 'PIPE001', 1000000, 200000, 50000, 1250000, TO_DATE('2023-09-01', 'YYYY-MM-DD'))

    -- inspection ���̺� ������
    INTO inspection (ins_id, product_id, inspec_type, inspector_id, quality_date, result, comments)
    VALUES ('INS001', 'PIPE001', 'ġ�� �˻�', 'EMP002', TO_DATE('2023-09-03', 'YYYY-MM-DD'), '�հ�', 'ġ�� �̻� ����')

    -- defect ���̺� ������
    INTO defect (defect_id, product_id, detected_by, defect_type, description, defect_date, corrective)
    VALUES ('DEF001', 'PIPE001', 'EMP003', 'ǥ�� ����', 'ǥ�鿡 ���� ��ũ��ġ �߰�', TO_DATE('2023-09-05', 'YYYY-MM-DD'), '���۾� �ʿ�')

    -- client ���̺� ������
    INTO client (client_id, name, location, contact, phone, email, create_at)
    VALUES ('CLIENT001', '�����üA', '�����', '�̴�ǥ', '010-2345-6789', 'lee@example.com', TO_DATE('2023-08-01', 'YYYY-MM-DD'))

    -- quality_standard ���̺� ������
    INTO quality_standard (standard_id, criteria, value, tolerance, unit, effective_date, expiration_date, notice, product_id)
    VALUES ('STD001', '����', '20kg', '��0.5kg', 'kg', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), '���� ���� ��ȭ', 'PIPE001')

    -- material_move ���̺� ������
    INTO material_move (move_id, material_id, user_id, from_location, to_location, quantity, move_type, move_date)
    VALUES ('MOVE001', 'MAT001', 'EMP001', 'â��A', '�������1', 1000, '���', TO_DATE('2023-09-20', 'YYYY-MM-DD'))

SELECT * FROM dual;
