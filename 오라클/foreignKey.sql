ALTER TABLE plan ADD CONSTRAINT FK_p_plan FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE plan ADD CONSTRAINT FK_e_plan FOREIGN KEY (
    created_by
)
REFERENCES emp (
    user_id
);

ALTER TABLE workOrder ADD CONSTRAINT FK_p_wo FOREIGN KEY (
    plan_id
)
REFERENCES plan (
    plan_id
);

ALTER TABLE workOrder ADD CONSTRAINT FK_e_wo FOREIGN KEY (
    mgr_id
)
REFERENCES emp (
    user_id
);

ALTER TABLE workOrder ADD CONSTRAINT FK_eq_wo FOREIGN KEY (
    equip_id
)
REFERENCES equipment (
    equip_id
);

ALTER TABLE performance ADD CONSTRAINT FK_wo_perf FOREIGN KEY (
    order_id
)
REFERENCES workOrder (
    order_id
);

ALTER TABLE inspection ADD CONSTRAINT FK_p_insp FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE inspection ADD CONSTRAINT FK_e_insp FOREIGN KEY (
    inspector_id
)
REFERENCES emp (
    user_id
);

ALTER TABLE defect ADD CONSTRAINT FK_p_def FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE defect ADD CONSTRAINT FK_e_def FOREIGN KEY (
    detected_by
)
REFERENCES emp (
    user_id
);

ALTER TABLE maintenance ADD CONSTRAINT FK_eq_maint FOREIGN KEY (
    equip_id
)
REFERENCES equipment (
    equip_id
);

ALTER TABLE maintenance ADD CONSTRAINT FK_e_maint FOREIGN KEY (
    performed_by
)
REFERENCES emp (
    user_id
);

ALTER TABLE bom ADD CONSTRAINT FK_p_bom FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE bom ADD CONSTRAINT FK_m_bom FOREIGN KEY (
    material_id
)
REFERENCES material (
    material_id
);

ALTER TABLE inventory ADD CONSTRAINT FK_p_inv FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE stockmove ADD CONSTRAINT FK_p_sm FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE stockmove ADD CONSTRAINT FK_e_sm FOREIGN KEY (
    user_id
)
REFERENCES emp (
    user_id
);

ALTER TABLE returninventory ADD CONSTRAINT FK_p_retinv FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE returninventory ADD CONSTRAINT FK_e_retinv FOREIGN KEY (
    approved_by
)
REFERENCES emp (
    user_id
);

ALTER TABLE materialRequest ADD CONSTRAINT FK_m_req FOREIGN KEY (
    material_id
)
REFERENCES material (
    material_id
);

ALTER TABLE materialRequest ADD CONSTRAINT FK_e_req FOREIGN KEY (
    request_by
)
REFERENCES emp (
    user_id
);

ALTER TABLE emp ADD CONSTRAINT FK_d_emp FOREIGN KEY (
    dept_id
)
REFERENCES dept (
    dept_id
);

ALTER TABLE dept ADD CONSTRAINT FK_e_dept FOREIGN KEY (
    mgr_id
)
REFERENCES emp (
    user_id
);

ALTER TABLE board ADD CONSTRAINT FK_e_board FOREIGN KEY (
    created_by
)
REFERENCES emp (
    user_id
);

ALTER TABLE posts ADD CONSTRAINT FK_b_posts FOREIGN KEY (
    board_id
)
REFERENCES board (
    board_id
);

ALTER TABLE posts ADD CONSTRAINT FK_e_posts FOREIGN KEY (
    author_id
)
REFERENCES emp (
    user_id
);

ALTER TABLE comments ADD CONSTRAINT FK_p_comments FOREIGN KEY (
    post_id
)
REFERENCES posts (
    post_id
);

ALTER TABLE comments ADD CONSTRAINT FK_e_comments FOREIGN KEY (
    employee_id
)
REFERENCES emp (
    user_id
);

ALTER TABLE sales_order ADD CONSTRAINT FK_c_so FOREIGN KEY (
    client_id
)
REFERENCES client (
    client_id
);

ALTER TABLE sales_order_details ADD CONSTRAINT FK_so_sod FOREIGN KEY (
    order_id
)
REFERENCES sales_order (
    order_id
);

ALTER TABLE sales_order_details ADD CONSTRAINT FK_p_sod FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE cost ADD CONSTRAINT FK_p_cost FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE Equip_downtime ADD CONSTRAINT FK_eq_downtime FOREIGN KEY (
    equip_id
)
REFERENCES equipment (
    equip_id
);

ALTER TABLE Equip_downtime ADD CONSTRAINT FK_e_downtime FOREIGN KEY (
    user_id
)
REFERENCES emp (
    user_id
);

ALTER TABLE monitoring ADD CONSTRAINT FK_eq_monitor FOREIGN KEY (
    equip_id
)
REFERENCES equipment (
    equip_id
);

ALTER TABLE quality_standard ADD CONSTRAINT FK_p_qs FOREIGN KEY (
    product_id
)
REFERENCES product (
    product_id
);

ALTER TABLE material_move ADD CONSTRAINT FK_m_move FOREIGN KEY (
    material_id
)
REFERENCES material (
    material_id
);

ALTER TABLE material_move ADD CONSTRAINT FK_e_move FOREIGN KEY (
    user_id
)
REFERENCES emp (
    user_id
);
