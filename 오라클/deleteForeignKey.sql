-- plan 테이블
ALTER TABLE plan DROP CONSTRAINT FK_p_plan;
ALTER TABLE plan DROP CONSTRAINT FK_e_plan;

-- workOrder 테이블
ALTER TABLE workOrder DROP CONSTRAINT FK_p_wo;
ALTER TABLE workOrder DROP CONSTRAINT FK_e_wo;
ALTER TABLE workOrder DROP CONSTRAINT FK_eq_wo;

-- performance 테이블
ALTER TABLE performance DROP CONSTRAINT FK_wo_perf;

-- inspection 테이블
ALTER TABLE inspection DROP CONSTRAINT FK_p_insp;
ALTER TABLE inspection DROP CONSTRAINT FK_e_insp;

-- defect 테이블
ALTER TABLE defect DROP CONSTRAINT FK_p_def;
ALTER TABLE defect DROP CONSTRAINT FK_e_def;

-- maintenance 테이블
ALTER TABLE maintenance DROP CONSTRAINT FK_eq_maint;
ALTER TABLE maintenance DROP CONSTRAINT FK_e_maint;

-- bom 테이블
ALTER TABLE bom DROP CONSTRAINT FK_p_bom;
ALTER TABLE bom DROP CONSTRAINT FK_m_bom;

-- inventory 테이블
ALTER TABLE inventory DROP CONSTRAINT FK_p_inv;

-- stockmove 테이블
ALTER TABLE stockmove DROP CONSTRAINT FK_p_sm;
ALTER TABLE stockmove DROP CONSTRAINT FK_e_sm;

-- returninventory 테이블
ALTER TABLE returninventory DROP CONSTRAINT FK_p_retinv;
ALTER TABLE returninventory DROP CONSTRAINT FK_e_retinv;

-- materialRequest 테이블
ALTER TABLE materialRequest DROP CONSTRAINT FK_m_req;
ALTER TABLE materialRequest DROP CONSTRAINT FK_e_req;

-- emp 테이블
ALTER TABLE emp DROP CONSTRAINT FK_d_emp;

-- dept 테이블
ALTER TABLE dept DROP CONSTRAINT FK_e_dept;

-- board 테이블
ALTER TABLE board DROP CONSTRAINT FK_e_board;

-- posts 테이블
ALTER TABLE posts DROP CONSTRAINT FK_b_posts;
ALTER TABLE posts DROP CONSTRAINT FK_e_posts;

-- comments 테이블
ALTER TABLE comments DROP CONSTRAINT FK_p_comments;
ALTER TABLE comments DROP CONSTRAINT FK_e_comments;

-- sales_order 테이블
ALTER TABLE sales_order DROP CONSTRAINT FK_c_so;

-- sales_order_details 테이블
ALTER TABLE sales_order_details DROP CONSTRAINT FK_so_sod;
ALTER TABLE sales_order_details DROP CONSTRAINT FK_p_sod;

-- cost 테이블
ALTER TABLE cost DROP CONSTRAINT FK_p_cost;

-- Equip_downtime 테이블
ALTER TABLE Equip_downtime DROP CONSTRAINT FK_eq_downtime;
ALTER TABLE Equip_downtime DROP CONSTRAINT FK_e_downtime;

-- monitoring 테이블
ALTER TABLE monitoring DROP CONSTRAINT FK_eq_monitor;

-- quality_standard 테이블
ALTER TABLE quality_standard DROP CONSTRAINT FK_p_qs;

-- material_move 테이블
ALTER TABLE material_move DROP CONSTRAINT FK_m_move;
ALTER TABLE material_move DROP CONSTRAINT FK_e_move;
