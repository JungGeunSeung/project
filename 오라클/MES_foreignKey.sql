ALTER TABLE writetable ADD CONSTRAINT FK_usr_wr FOREIGN KEY (userid) REFERENCES usertable (userid);

ALTER TABLE writetable ADD CONSTRAINT FK_cat_wr FOREIGN KEY (category_id) REFERENCES category (category_id);

ALTER TABLE commtable ADD CONSTRAINT FK_wr_comm FOREIGN KEY (write_id) REFERENCES writetable (write_id);

ALTER TABLE commtable ADD CONSTRAINT FK_cat_comm FOREIGN KEY (category_id) REFERENCES category (category_id);

ALTER TABLE bom ADD CONSTRAINT FK_prod_bom FOREIGN KEY (production_id) REFERENCES Product (production_id);

ALTER TABLE bom ADD CONSTRAINT FK_mat_bom FOREIGN KEY (mid) REFERENCES material (mid);

ALTER TABLE plan ADD CONSTRAINT FK_prod_plan FOREIGN KEY (production_id) REFERENCES Product (production_id);

ALTER TABLE task ADD CONSTRAINT FK_plan_task1 FOREIGN KEY (planid) REFERENCES plan (planid);

ALTER TABLE task ADD CONSTRAINT FK_prod_task FOREIGN KEY (production_id) REFERENCES Product (production_id);

ALTER TABLE transaction ADD CONSTRAINT FK_prod_trans FOREIGN KEY (production_id) REFERENCES Product (production_id);

ALTER TABLE ProductionResult ADD CONSTRAINT FK_prod_pr FOREIGN KEY (production_id) REFERENCES Product (production_id);

ALTER TABLE ProductionResult ADD CONSTRAINT FK_task_pr1 FOREIGN KEY (taskid) REFERENCES task (taskid);

ALTER TABLE ProductionResult ADD CONSTRAINT FK_plan_pr FOREIGN KEY (planid) REFERENCES plan (planid);

ALTER TABLE QualityInspection ADD CONSTRAINT FK_prod_qi FOREIGN KEY (production_id) REFERENCES Product (production_id);

ALTER TABLE QualityInspection ADD CONSTRAINT FK_plan_qi FOREIGN KEY (planid) REFERENCES plan (planid);

ALTER TABLE DefectRecord ADD CONSTRAINT FK_dt_dr1 FOREIGN KEY (report_id) REFERENCES DefectType (report_id);

ALTER TABLE DefectRecord ADD CONSTRAINT FK_dt_dr2 FOREIGN KEY (ins_id) REFERENCES DefectType (ins_id);

ALTER TABLE DefectRecord ADD CONSTRAINT FK_dt_dr3 FOREIGN KEY (production_id) REFERENCES DefectType (production_id);

ALTER TABLE DefectRecord ADD CONSTRAINT FK_dt_dr4 FOREIGN KEY (planid) REFERENCES DefectType (planid);

ALTER TABLE DefectType ADD CONSTRAINT FK_qi_dt1 FOREIGN KEY (ins_id) REFERENCES QualityInspection (ins_id);

ALTER TABLE DefectType ADD CONSTRAINT FK_qi_dt2 FOREIGN KEY (production_id) REFERENCES QualityInspection (production_id);

ALTER TABLE DefectType ADD CONSTRAINT FK_qi_dt3 FOREIGN KEY (planid) REFERENCES QualityInspection (planid);

ALTER TABLE equipmentUsage ADD CONSTRAINT FK_eq_equsg FOREIGN KEY (equiID) REFERENCES equipment (equiID);

ALTER TABLE maintenance ADD CONSTRAINT FK_eq_main FOREIGN KEY (equiID) REFERENCES equipment (equiID);
