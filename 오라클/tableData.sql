INSERT ALL
    -- dept 테이블 데이터
    INTO dept (dept_id, dept_name, mgr_id)
    VALUES ('DEPT001', '생산부', 'EMP001')

    -- emp 테이블 데이터
    INTO emp (user_id, name, email, phone, dept_id, position, hire_date, mgr)
    VALUES ('EMP001', '김철수', 'kimcs@example.com', '010-1234-5678', 'DEPT001', '생산 관리자', TO_DATE('2015-03-01', 'YYYY-MM-DD'), NULL)
    INTO emp (user_id, name, email, phone, dept_id, position, hire_date, mgr)
    VALUES ('EMP002', '이영희', 'leeyh@example.com', '010-5678-1234', 'DEPT001', '품질 관리자', TO_DATE('2016-05-01', 'YYYY-MM-DD'), 'EMP001')
    INTO emp (user_id, name, email, phone, dept_id, position, hire_date, mgr)
    VALUES ('EMP003', '박철수', 'parkcs@example.com', '010-9876-5432', 'DEPT001', '생산 사원', TO_DATE('2017-07-15', 'YYYY-MM-DD'), 'EMP001')

    -- product 테이블 데이터
    INTO product (product_id, name, code, description)
    VALUES ('PIPE001', '폴리에틸렌 파이프', 'P001', '고압 폴리에틸렌 파이프')
    INTO product (product_id, name, code, description)
    VALUES ('FITTING001', '전기융착식 이음관', 'F001', '전기융착을 위한 이음관')

    -- plan 테이블 데이터
    INTO plan (plan_id, product_id, start_date, end_date, quantity, created_by, status)
    VALUES ('PLAN001', 'PIPE001', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), 1000, 'EMP001', '진행중')

    -- workOrder 테이블 데이터
    INTO workOrder (order_id, plan_id, mgr_id, equip_id, start_date, end_date, status, quantity, defect_quantity)
    VALUES ('ORD001', 'PLAN001', 'EMP001', 'EQUIP001', TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), '진행중', 1000, 5)

    -- performance 테이블 데이터
    INTO performance (per_id, order_id, actual, defect_quantity, production_date)
    VALUES ('PER001', 'ORD001', 995, 5, TO_DATE('2023-09-11', 'YYYY-MM-DD'))

    -- equipment 테이블 데이터
    INTO equipment (equip_id, name, type, location, status, purchase, last)
    VALUES ('EQUIP001', '융착기 A', '전기융착기', '1공장', '사용중', TO_DATE('2020-01-10', 'YYYY-MM-DD'), TO_DATE('2023-07-01', 'YYYY-MM-DD'))

    -- maintenance 테이블 데이터
    INTO maintenance (main_id, equip_id, main_date, performed_by, description)
    VALUES ('MAIN001', 'EQUIP001', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 'EMP001', '설비 점검 완료')

    -- bom 테이블 데이터
    INTO bom (bom_id, product_id, material_id, quantity, version, create_at)
    VALUES ('BOM001', 'PIPE001', 'MAT001', 500, '1.0', TO_DATE('2023-06-01', 'YYYY-MM-DD'))

    -- material 테이블 데이터
    INTO material (material_id, material_name, code, description, quantity, unit)
    VALUES ('MAT001', '폴리에틸렌 원료', 'M001', '고순도 폴리에틸렌 원료', 2000, 'kg')

    -- materialRequest 테이블 데이터
    INTO materialRequest (request_id, material_id, request_by, req_date, quantity, status)
    VALUES ('REQ001', 'MAT001', 'EMP003', TO_DATE('2023-09-03', 'YYYY-MM-DD'), 500, '승인됨')

    -- stockmove 테이블 데이터
    INTO stockmove (move_id, product_id, type, quantity, stock_date, user_id)
    VALUES ('MOVE001', 'PIPE001', '출고', 500, TO_DATE('2023-09-14', 'YYYY-MM-DD'), 'EMP001')

    -- returninventory 테이블 데이터
    INTO returninventory (return_id, product_id, reason, request_date, approved_by, approved_date, status)
    VALUES ('RET001', 'FITTING001', '불량 발견', TO_DATE('2023-09-05', 'YYYY-MM-DD'), 'EMP002', TO_DATE('2023-09-06', 'YYYY-MM-DD'), '처리됨')

    -- sales_order 테이블 데이터
    INTO sales_order (order_id, client_id, order_date, status, total)
    VALUES ('ORDER001', 'CLIENT001', TO_DATE('2023-09-01', 'YYYY-MM-DD'), '배송중', 1500000)

    -- sales_order_details 테이블 데이터
    INTO sales_order_details (detail_id, order_id, product_id, quantity, price, subtotal)
    VALUES ('DETAIL001', 'ORDER001', 'PIPE001', 500, 3000, 1500000)

    -- cost 테이블 데이터
    INTO cost (cost_id, product_id, material_cost, labor_cost, over_cost, total, create_at)
    VALUES ('COST001', 'PIPE001', 1000000, 200000, 50000, 1250000, TO_DATE('2023-09-01', 'YYYY-MM-DD'))

    -- inspection 테이블 데이터
    INTO inspection (ins_id, product_id, inspec_type, inspector_id, quality_date, result, comments)
    VALUES ('INS001', 'PIPE001', '치수 검사', 'EMP002', TO_DATE('2023-09-03', 'YYYY-MM-DD'), '합격', '치수 이상 없음')

    -- defect 테이블 데이터
    INTO defect (defect_id, product_id, detected_by, defect_type, description, defect_date, corrective)
    VALUES ('DEF001', 'PIPE001', 'EMP003', '표면 결함', '표면에 작은 스크래치 발견', TO_DATE('2023-09-05', 'YYYY-MM-DD'), '재작업 필요')

    -- client 테이블 데이터
    INTO client (client_id, name, location, contact, phone, email, create_at)
    VALUES ('CLIENT001', '배관업체A', '서울시', '이대표', '010-2345-6789', 'lee@example.com', TO_DATE('2023-08-01', 'YYYY-MM-DD'))

    -- quality_standard 테이블 데이터
    INTO quality_standard (standard_id, criteria, value, tolerance, unit, effective_date, expiration_date, notice, product_id)
    VALUES ('STD001', '내압', '20kg', '±0.5kg', 'kg', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), '내압 기준 강화', 'PIPE001')

    -- material_move 테이블 데이터
    INTO material_move (move_id, material_id, user_id, from_location, to_location, quantity, move_type, move_date)
    VALUES ('MOVE001', 'MAT001', 'EMP001', '창고A', '생산라인1', 1000, '출고', TO_DATE('2023-09-20', 'YYYY-MM-DD'))

SELECT * FROM dual;
