-- 유지보수 데이터
INSERT ALL
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_001', 'E042', TO_DATE('2024-09-12', 'YYYY-MM-DD'), 'geun1', '조정 패드 마모 검사 및 교체.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_002', 'E021', TO_DATE('2024-01-26', 'YYYY-MM-DD'), 'rudals1022', '목재 조각 보관 상태 점검 및 정리.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_003', 'E018', TO_DATE('2023-12-14', 'YYYY-MM-DD'), 'kuma4075', '타카 기계 오일 보충 및 스프링 교체.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_004', 'E022', TO_DATE('2024-07-30', 'YYYY-MM-DD'), 'sowon0226', '스프레이 접착제 노즐 청소.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_005', 'E016', TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'sowon0226', '안전 안경 렌즈 교체 및 클리닝.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_006', 'E014', TO_DATE('2024-03-03', 'YYYY-MM-DD'), 'geun', '레벨 조정 및 수평 정확도 점검.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_007', 'E012', TO_DATE('2024-02-08', 'YYYY-MM-DD'), 'rudals1022', '목재 스크류 정리 및 재고 보충.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_008', 'E007', TO_DATE('2024-01-19', 'YYYY-MM-DD'), 'rudals1022', '사포 마모로 인한 새 사포 교체.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_009', 'E048', TO_DATE('2024-04-10', 'YYYY-MM-DD'), 'geun', '나무판 보관 상태 점검.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_010', 'E026', TO_DATE('2023-12-25', 'YYYY-MM-DD'), 'kuma4075', '조립 도구 마모 점검 및 조정.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_011', 'E039', TO_DATE('2024-06-24', 'YYYY-MM-DD'), 'kuma4075', '조정 나사 상태 점검 및 정리.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_012', 'E001', TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'geun', '드라이버 손잡이 부분 교체 및 검사.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_013', 'E049', TO_DATE('2024-05-24', 'YYYY-MM-DD'), 'geun', '조정기 부품 교체 및 윤활 작업.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_014', 'E046', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'sowon0226', '스탠드 수평 조정 및 안정성 검사.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_015', 'E017', TO_DATE('2023-11-30', 'YYYY-MM-DD'), 'geun', '목재 샌더 모터 청소 및 점검.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_016', 'E034', TO_DATE('2024-02-08', 'YYYY-MM-DD'), 'rudals1022', '스탠드 조립 상태 및 균형 검사.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_017', 'E033', TO_DATE('2024-08-09', 'YYYY-MM-DD'), 'rudals1022', '조립용 핀 상태 점검 및 교체.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_018', 'E050', TO_DATE('2024-06-22', 'YYYY-MM-DD'), 'sowon0226', '조립기 모터 상태 점검 및 테스트.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_019', 'E044', TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'rudals1022', '조정 스크류드라이버 끝부분 교체.')
INTO maintenance (main_id, equip_id, main_date, performed_by, description) VALUES ('MAIN_020', 'E003', TO_DATE('2024-09-23', 'YYYY-MM-DD'), 'sowon0226', '망치 헤드 고정 및 손잡이 강화.')
SELECT * FROM dual;


-- 비가동 이력 데이터
INSERT ALL
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_001', 'E050', TO_DATE('2024-10-11 12:16:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-10 17:43:29', 'YYYY-MM-DD HH24:MI:SS'), '조립기 모터 수명 만료로 교체 필요.', 'rudals1022', '재고 부족으로 중단')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_002', 'E048', TO_DATE('2024-10-12 19:36:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-09-30 18:35:29', 'YYYY-MM-DD HH24:MI:SS'), '나무판 손상으로 긴급 교체 필요.', 'geun1', '부품 수급 대기 중')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_003', 'E001', TO_DATE('2024-09-23 15:47:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-09-21 20:45:29', 'YYYY-MM-DD HH24:MI:SS'), '드라이버 손잡이 부품 교체로 작업 중단.', 'sowon0226', '재고 부족으로 중단')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_004', 'E012', TO_DATE('2024-09-25 04:40:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-07 16:34:29', 'YYYY-MM-DD HH24:MI:SS'), '목재 스크류 재고 부족으로 작업 지연.', 'geun1', '안전 검사 진행')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_005', 'E027', TO_DATE('2024-10-09 03:42:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-18 22:36:29', 'YYYY-MM-DD HH24:MI:SS'), '조립용 나사 재고 부족으로 지연.', 'rudals1022', '안전 검사 진행')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_006', 'E014', TO_DATE('2024-10-12 03:10:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-09 10:58:29', 'YYYY-MM-DD HH24:MI:SS'), '레벨 조정 오류로 작업 중단.', 'geun1', '점검 중 특별한 문제 없음')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_007', 'E008', TO_DATE('2024-10-07 05:01:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-09-27 02:27:29', 'YYYY-MM-DD HH24:MI:SS'), '클램프 고정 불량으로 조정 작업 필요.', 'geun', '긴급 수리 필요')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_008', 'E013', TO_DATE('2024-10-11 14:43:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-10 08:55:29', 'YYYY-MM-DD HH24:MI:SS'), '톱날 수명 만료로 긴급 교체 필요.', 'geun1', '긴급 수리 필요')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_009', 'E041', TO_DATE('2024-10-03 08:43:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-09-25 22:50:29', 'YYYY-MM-DD HH24:MI:SS'), '조정 너트 호환성 문제로 조정 작업 필요.', 'geun', '재정비 완료 후 보고 예정')
INTO Equip_downtime (downtime_id, equip_id, start_time, end_time, reason, user_id, comments) VALUES ('DT_010', 'E036', TO_DATE('2024-10-01 14:02:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-03 10:18:29', 'YYYY-MM-DD HH24:MI:SS'), '나무판 습기 문제로 보관 조정 필요.', 'geun', '안전 검사 진행')
SELECT * FROM dual;


