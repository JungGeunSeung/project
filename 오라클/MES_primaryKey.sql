ALTER TABLE usertable ADD CONSTRAINT PK_USERTABLE PRIMARY KEY (
	userid
);

ALTER TABLE writetable ADD CONSTRAINT PK_WRITETABLE PRIMARY KEY (
	write_id,
	userid,
	category_id
);

ALTER TABLE commtable ADD CONSTRAINT PK_COMMTABLE PRIMARY KEY (
	comment_id,
	write_id,
	category_id
);

ALTER TABLE material ADD CONSTRAINT PK_MATERIAL PRIMARY KEY (
	mid
);

ALTER TABLE Product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	production_id
);

ALTER TABLE bom ADD CONSTRAINT PK_BOM PRIMARY KEY (
	bom_id,
	production_id,
	mid
);

ALTER TABLE category ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
	category_id
);

ALTER TABLE plan ADD CONSTRAINT PK_PLAN PRIMARY KEY (
	planid,
	production_id
);

ALTER TABLE task ADD CONSTRAINT PK_TASK PRIMARY KEY (
	taskid,
	planid,
	production_id
);

ALTER TABLE transaction ADD CONSTRAINT PK_TRANSACTION PRIMARY KEY (
	transaction_id,
	production_id
);

ALTER TABLE ProductionResult ADD CONSTRAINT PK_PRODUCTIONRESULT PRIMARY KEY (
	ResultID,
	production_id,
	taskid,
	planid
);

ALTER TABLE QualityInspection ADD CONSTRAINT PK_QUALITYINSPECTION PRIMARY KEY (
	ins_id,
	production_id,
	planid
);

ALTER TABLE DefectRecord ADD CONSTRAINT PK_DEFECTRECORD PRIMARY KEY (
	type_id,
	report_id,
	ins_id,
	production_id,
	planid
);

ALTER TABLE DefectType ADD CONSTRAINT PK_DEFECTTYPE PRIMARY KEY (
	report_id,
	ins_id,
	production_id,
	planid
);

ALTER TABLE equipmentUsage ADD CONSTRAINT PK_EQUIPMENTUSAGE PRIMARY KEY (
	resultid,
	equiID
);

ALTER TABLE equipment ADD CONSTRAINT PK_EQUIPMENT PRIMARY KEY (
	equiID
);

ALTER TABLE maintenance ADD CONSTRAINT PK_MAINTENANCE PRIMARY KEY (
	mainID,
	equiID
);