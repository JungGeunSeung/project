-- plan ���̺�
ALTER TABLE plan DROP CONSTRAINT FK_p_plan;
ALTER TABLE plan DROP CONSTRAINT FK_e_plan;

-- workOrder ���̺�
ALTER TABLE workOrder DROP CONSTRAINT FK_p_wo;
ALTER TABLE workOrder DROP CONSTRAINT FK_e_wo;
ALTER TABLE workOrder DROP CONSTRAINT FK_eq_wo;

-- performance ���̺�
ALTER TABLE performance DROP CONSTRAINT FK_wo_perf;

-- inspection ���̺�
ALTER TABLE inspection DROP CONSTRAINT FK_p_insp;
ALTER TABLE inspection DROP CONSTRAINT FK_e_insp;

-- defect ���̺�
ALTER TABLE defect DROP CONSTRAINT FK_p_def;
ALTER TABLE defect DROP CONSTRAINT FK_e_def;

-- maintenance ���̺�
ALTER TABLE maintenance DROP CONSTRAINT FK_eq_maint;
ALTER TABLE maintenance DROP CONSTRAINT FK_e_maint;

-- bom ���̺�
ALTER TABLE bom DROP CONSTRAINT FK_p_bom;
ALTER TABLE bom DROP CONSTRAINT FK_m_bom;

-- inventory ���̺�
ALTER TABLE inventory DROP CONSTRAINT FK_p_inv;

-- stockmove ���̺�
ALTER TABLE stockmove DROP CONSTRAINT FK_p_sm;
ALTER TABLE stockmove DROP CONSTRAINT FK_e_sm;

-- returninventory ���̺�
ALTER TABLE returninventory DROP CONSTRAINT FK_p_retinv;
ALTER TABLE returninventory DROP CONSTRAINT FK_e_retinv;

-- materialRequest ���̺�
ALTER TABLE materialRequest DROP CONSTRAINT FK_m_req;
ALTER TABLE materialRequest DROP CONSTRAINT FK_e_req;

-- emp ���̺�
ALTER TABLE emp DROP CONSTRAINT FK_d_emp;

-- dept ���̺�
ALTER TABLE dept DROP CONSTRAINT FK_e_dept;

-- board ���̺�
ALTER TABLE board DROP CONSTRAINT FK_e_board;

-- posts ���̺�
ALTER TABLE posts DROP CONSTRAINT FK_b_posts;
ALTER TABLE posts DROP CONSTRAINT FK_e_posts;

-- comments ���̺�
ALTER TABLE comments DROP CONSTRAINT FK_p_comments;
ALTER TABLE comments DROP CONSTRAINT FK_e_comments;

-- sales_order ���̺�
ALTER TABLE sales_order DROP CONSTRAINT FK_c_so;

-- sales_order_details ���̺�
ALTER TABLE sales_order_details DROP CONSTRAINT FK_so_sod;
ALTER TABLE sales_order_details DROP CONSTRAINT FK_p_sod;

-- cost ���̺�
ALTER TABLE cost DROP CONSTRAINT FK_p_cost;

-- Equip_downtime ���̺�
ALTER TABLE Equip_downtime DROP CONSTRAINT FK_eq_downtime;
ALTER TABLE Equip_downtime DROP CONSTRAINT FK_e_downtime;

-- monitoring ���̺�
ALTER TABLE monitoring DROP CONSTRAINT FK_eq_monitor;

-- quality_standard ���̺�
ALTER TABLE quality_standard DROP CONSTRAINT FK_p_qs;

-- material_move ���̺�
ALTER TABLE material_move DROP CONSTRAINT FK_m_move;
ALTER TABLE material_move DROP CONSTRAINT FK_e_move;
