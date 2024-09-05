CREATE TABLE usertable (
	userid	VARCHAR2(50)	NOT NULL,
	name	VARCHAR2(100)	NULL,
	email	VARCHAR2(100)	NULL,
	phonenumber	VARCHAR2(15)	NULL,
	birth_date	DATE	NULL,
	hiredate	DATE	NULL,
	grade	VARCHAR2(10)	NULL,
	status	VARCHAR2(20)	NULL,
	empno	number(6)	NULL,
	deptno	number(3)	NOT NULL
);

CREATE TABLE writetable (
	write_id	VARCHAR2(50)	NOT NULL,
	title	VARCHAR2(100)	NULL,
	content	clob	NULL,
	create_date	DATE	NULL,
	view_count	number(6)	NULL,
	status	VARCHAR2(20)	NULL,
	userid	VARCHAR2(50)	NOT NULL,
	comment_id	VARCHAR2(50)	NOT NULL
);

CREATE TABLE commtable (
	comment_id	VARCHAR2(50)	NOT NULL,
	content	clob	NULL,
	create_date	DATE	NULL,
	update_date	DATE	NULL,
	status	VARCHAR2(20)	NULL,
	userid	VARCHAR2(50)	NOT NULL
);

CREATE TABLE material (
	mid	VARCHAR(50)	NOT NULL,
	mlot	VARCHAR(50)	NULL,
	mname	VARCHAR(100)	NULL,
	mstandard	VARCHAR(100)	NULL,
	munit	VARCHAR(20)	NULL,
	examiner	VARCHAR2(100)	NULL,
	quantity	number(4)	NULL,
	userid	VARCHAR2(50)	NOT NULL
);

CREATE TABLE Product (
	production_id	VARCHAR2(50)	NOT NULL,
	pname	VARCHAR(100)	NULL,
	pdescription	clob	NULL,
	unitprice	number(10)	NULL,
	pquantity	number(6)	NULL,
	mid	VARCHAR(50)	NOT NULL
);

CREATE TABLE bom (
	bom_id	VARCHAR(50)	NOT NULL,
	bom_quantity	number(6)	NULL,
	mid	VARCHAR(50)	NOT NULL,
	production_id	VARCHAR2(50)	NOT NULL,
	userid	VARCHAR2(50)	NOT NULL
);

CREATE TABLE plan (
	planid	VARCHAR(50)	NOT NULL,
	plannedQuan	number(6)	NULL,
	startDate	DATE	NULL,
	EndDate	DATE	NULL,
	status	VARCHAR(20)	NULL,
	userid	VARCHAR2(50)	NOT NULL,
	bom_id	VARCHAR(50)	NOT NULL,
	transaction_id	VARCHAR(50)	NOT NULL
);

CREATE TABLE task (
	taskid	VARCHAR(50)	NOT NULL,
	required	number(6)	NULL,
	used	number(6)	NULL,
	taskstatus	VARCHAR(20)	NULL,
	taskcontent	clob	NULL,
	planid	VARCHAR(50)	NOT NULL,
	userid	VARCHAR2(50)	NOT NULL
);

CREATE TABLE transaction (
	transaction_id	VARCHAR(50)	NOT NULL,
	transType	VARCHAR(255)	NULL,
	TQuantity	number(6)	NULL,
	TDate	DATE	NULL,
	status	varchar2(50)	NULL,
	mid	VARCHAR(50)	NOT NULL,
	production_id	VARCHAR2(50)	NOT NULL
);

CREATE TABLE ProductionResult (
	ResultID	VARCHAR(50)	NOT NULL,
	ProductionDate	DATE	NULL,
	ProducedQuantity	number(6)	NULL,
	DefectiveQuantity	number(4)	NULL,
	Status	VARCHAR(20)	NULL,
	planid	VARCHAR(50)	NOT NULL
);

CREATE TABLE QualityInspection (
	ins_id	VARCHAR2(50)	NOT NULL,
	ins_date	DATE	NULL,
	result	VARCHAR2(20)	NULL,
	defect_count	number(4)	NULL,
	defect_cause	VARCHAR2(100)	NULL,
	userid	VARCHAR2(50)	NOT NULL,
	production_id	VARCHAR2(50)	NOT NULL,
	quality_id	varchar2(50)	NOT NULL,
	type_id	VARCHAR(50)	NOT NULL
);

CREATE TABLE DefectRecord (
	type_id	VARCHAR(50)	NOT NULL,
	type_name	VARCHAR(100)	NULL,
	type_descripton	clob	NULL
);

CREATE TABLE DefectType (
	report_id	VARCHAR2(50)	NOT NULL,
	defect_count	number(4)	NULL,
	userid	VARCHAR2(50)	NOT NULL,
	ins_id	VARCHAR2(50)	NOT NULL,
	type_id	VARCHAR(50)	NOT NULL,
	quality_id	varchar2(50)	NOT NULL
);

CREATE TABLE equipmentUsage (
	resultid	VARCHAR(50)	NOT NULL,
	startdate	date	NOT NULL,
	enddate	date	NOT NULL,
	userid	VARCHAR2(50)	NOT NULL,
	equiID	VARCHAR(50)	NOT NULL
);

CREATE TABLE equipment (
	equiID	VARCHAR(50)	NOT NULL,
	equiname	VARCHAR(100)	NULL,
	equitype	VARCHAR(100)	NULL,
	selldate	date	NULL,
	equiloc	VARCHAR(100)	NULL,
	status	VARCHAR(100)	NULL,
	userid	VARCHAR2(50)	NOT NULL
);

CREATE TABLE maintenance (
	mainID	VARCHAR(50)	NOT NULL,
	maindate	date	NULL,
	maincontent	clob	NULL,
	manager	VARCHAR(100)	NULL,
	equiID	VARCHAR(50)	NOT NULL,
	userid	VARCHAR2(50)	NOT NULL
);

CREATE TABLE Documents (
	document	number(6)	NOT NULL,
	title	varchar2(255)	NULL,
	content	clob	NULL,
	created_date	date	NULL,
	updated_date	date	NULL,
	version	number(6)	NULL,
	userid	VARCHAR2(50)	NOT NULL
);

CREATE TABLE QualityStandards (
	quality_id	varchar2(50)	NOT NULL,
	title	varchar2(255)	NULL,
	mgr	varchar2(255)	NULL,
	insti	varchar2(255)	NULL,
	revision	date	NULL,
	userid	VARCHAR2(50)	NOT NULL
);

CREATE TABLE dept (
	deptno	number(3)	NOT NULL,
	dname	varchar2(50)	NULL,
	location	varchar2(255)	NULL
);