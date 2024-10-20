-- �������� ������
INSERT ALL
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_001', 'E042', TO_DATE('2024-09-12', 'YYYY-MM-DD'), 'geun1', '���� �е� ���� �˻� �� ��ü.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_002', 'E021', TO_DATE('2024-01-26', 'YYYY-MM-DD'), 'rudals1022', '���� ���� ���� ���� ���� �� ����.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_003', 'E018', TO_DATE('2023-12-14', 'YYYY-MM-DD'), 'kuma4075', 'Ÿī ��� ���� ���� �� ������ ��ü.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_004', 'E022', TO_DATE('2024-07-30', 'YYYY-MM-DD'), 'sowon0226', '�������� ������ ���� û��.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_005', 'E016', TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'sowon0226', '���� �Ȱ� ���� ��ü �� Ŭ����.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_006', 'E014', TO_DATE('2024-03-03', 'YYYY-MM-DD'), 'geun', '���� ���� �� ���� ��Ȯ�� ����.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_007', 'E012', TO_DATE('2024-02-08', 'YYYY-MM-DD'), 'rudals1022', '���� ��ũ�� ���� �� ��� ����.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_008', 'E007', TO_DATE('2024-01-19', 'YYYY-MM-DD'), 'rudals1022', '���� ����� ���� �� ���� ��ü.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_009', 'E048', TO_DATE('2024-04-10', 'YYYY-MM-DD'), 'geun', '������ ���� ���� ����.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_010', 'E026', TO_DATE('2023-12-25', 'YYYY-MM-DD'), 'kuma4075', '���� ���� ���� ���� �� ����.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_011', 'E039', TO_DATE('2024-06-24', 'YYYY-MM-DD'), 'kuma4075', '���� ���� ���� ���� �� ����.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_012', 'E001', TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'geun', '����̹� ������ �κ� ��ü �� �˻�.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_013', 'E049', TO_DATE('2024-05-24', 'YYYY-MM-DD'), 'geun', '������ ��ǰ ��ü �� ��Ȱ �۾�.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_014', 'E046', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'sowon0226', '���ĵ� ���� ���� �� ������ �˻�.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_015', 'E017', TO_DATE('2023-11-30', 'YYYY-MM-DD'), 'geun', '���� ���� ���� û�� �� ����.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_016', 'E034', TO_DATE('2024-02-08', 'YYYY-MM-DD'), 'rudals1022', '���ĵ� ���� ���� �� ���� �˻�.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_017', 'E033', TO_DATE('2024-08-09', 'YYYY-MM-DD'), 'rudals1022', '������ �� ���� ���� �� ��ü.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_018', 'E050', TO_DATE('2024-06-22', 'YYYY-MM-DD'), 'sowon0226', '������ ���� ���� ���� �� �׽�Ʈ.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_019', 'E044', TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'rudals1022', '���� ��ũ������̹� ���κ� ��ü.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_020', 'E003', TO_DATE('2024-09-23', 'YYYY-MM-DD'), 'sowon0226', '��ġ ��� ���� �� ������ ��ȭ.')
SELECT * FROM dual;


-- �񰡵� �̷� ������
INSERT ALL
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_001', 'E050', TO_DATE('2024-10-11 12:16:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-10 17:43:29', 'YYYY-MM-DD HH24:MI:SS'), '������ ���� ���� ����� ��ü �ʿ�.', 'rudals1022', '��� �������� �ߴ�')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_002', 'E048', TO_DATE('2024-10-12 19:36:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-09-30 18:35:29', 'YYYY-MM-DD HH24:MI:SS'), '������ �ջ����� ��� ��ü �ʿ�.', 'geun1', '��ǰ ���� ��� ��')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_003', 'E001', TO_DATE('2024-09-23 15:47:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-09-21 20:45:29', 'YYYY-MM-DD HH24:MI:SS'), '����̹� ������ ��ǰ ��ü�� �۾� �ߴ�.', 'sowon0226', '��� �������� �ߴ�')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_004', 'E012', TO_DATE('2024-09-25 04:40:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-07 16:34:29', 'YYYY-MM-DD HH24:MI:SS'), '���� ��ũ�� ��� �������� �۾� ����.', 'geun1', '���� �˻� ����')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_005', 'E027', TO_DATE('2024-10-09 03:42:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-18 22:36:29', 'YYYY-MM-DD HH24:MI:SS'), '������ ���� ��� �������� ����.', 'rudals1022', '���� �˻� ����')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_006', 'E014', TO_DATE('2024-10-12 03:10:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-09 10:58:29', 'YYYY-MM-DD HH24:MI:SS'), '���� ���� ������ �۾� �ߴ�.', 'geun1', '���� �� Ư���� ���� ����')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_007', 'E008', TO_DATE('2024-10-07 05:01:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-09-27 02:27:29', 'YYYY-MM-DD HH24:MI:SS'), 'Ŭ���� ���� �ҷ����� ���� �۾� �ʿ�.', 'geun', '��� ���� �ʿ�')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_008', 'E013', TO_DATE('2024-10-11 14:43:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-10 08:55:29', 'YYYY-MM-DD HH24:MI:SS'), '�鳯 ���� ����� ��� ��ü �ʿ�.', 'geun1', '��� ���� �ʿ�')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_009', 'E041', TO_DATE('2024-10-03 08:43:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-09-25 22:50:29', 'YYYY-MM-DD HH24:MI:SS'), '���� ��Ʈ ȣȯ�� ������ ���� �۾� �ʿ�.', 'geun', '������ �Ϸ� �� ���� ����')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_010', 'E036', TO_DATE('2024-10-01 14:02:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-03 10:18:29', 'YYYY-MM-DD HH24:MI:SS'), '������ ���� ������ ���� ���� �ʿ�.', 'geun', '���� �˻� ����')
SELECT * FROM dual;


