CREATE TABLE plan (
	plan_id	VARCHAR2(50)	NULL,
	product_id	VARCHAR2(50)	NULL,
	start_date	DATE	NULL,
	end_date	DATE	NULL,
	quantity	NUMBER(8)	NULL,
	created_by	VARCHAR2(50)	NULL,
	status	VARCHAR2(50)	NULL
);

CREATE TABLE workOrder (
	order_id	VARCHAR2(50)	NULL,
	plan_id	VARCHAR2(50)	NULL,
	mgr_id	VARCHAR2(50)	NULL,
	equip_id	VARCHAR2(50)	NULL,
	start_date	DATE	NULL,
	end_date	DATE	NULL,
	status	VARCHAR2(50)	NULL,
	quantity	number(8)	NULL,
	defect_quantity	number(8)	NULL
);

CREATE TABLE performance (
	per_id	VARCHAR2(50)	NULL,
	order_id	VARCHAR2(50)	NULL,
	actual	NUMBER(8)	NULL,
	defect_quantity	NUMBER(8)	NULL,
	production_date	DATE	NULL
);

CREATE TABLE inspection (
	ins_id	VARCHAR2(50)	NULL,
	product_id	VARCHAR2(50)	NULL,
	inspec_type	VARCHAR2(50)	NULL,
	inspector_id	VARCHAR2(50)	NULL,
	quality_date	DATE	NULL,
	result	VARCHAR2(50)	NULL,
	comments	VARCHAR2(255)	NULL
);

CREATE TABLE defect (
	defect_id	VARCHAR2(50)	NULL,
	product_id	VARCHAR2(50)	NULL,
	detected_by	VARCHAR2(50)	NULL,
	defect_type	VARCHAR2(50)	NULL,
	description	VARCHAR2(255)	NULL,
	defect_date	DATE	NULL,
	corrective	VARCHAR2(255)	NULL
);

CREATE TABLE equipment (
	equip_id	VARCHAR2(50)	NULL,
	name	VARCHAR2(50)	NULL,
	type	VARCHAR2(50)	NULL,
	location	VARCHAR2(255)	NULL,
	status	VARCHAR2(50)	NULL,
	purchase	DATE	NULL,
	last	DATE	NULL
);

CREATE TABLE maintenance (
	main_id	VARCHAR2(50)	NULL,
	equip_id	VARCHAR2(50)	NULL,
	main_date	DATE	NULL,
	performed_by	VARCHAR2(50)	NULL,
	description	VARCHAR2(255)	NULL
);

CREATE TABLE bom (
	bom_id	VARCHAR2(50)	NULL,
	product_id	VARCHAR2(50)	NULL,
	material_id	VARCHAR2(50)	NULL,
	quantity	NUMBER(8)	NULL,
	version	varchar2(50)	NULL,
	create_at	date	NULL
);

CREATE TABLE product (
	product_id	VARCHAR2(50)	NULL,
	name	VARCHAR2(255)	NULL,
	code	VARCHAR2(50)	NULL,
	description	VARCHAR2(255)	NULL
);

CREATE TABLE inventory (
	inventory_id	VARCHAR2(50)	NULL,
	product_id	VARCHAR2(50)	NULL,
	quantity	NUMBER(12)	NULL,
	location	VARCHAR2(255)	NULL
);

CREATE TABLE stockmove (
	move_id	VARCHAR2(50)	NULL,
	product_id	VARCHAR2(50)	NULL,
	type	VARCHAR2(50)	NULL,
	quantity	NUMBER(8)	NULL,
	stock_date	DATE	NULL,
	user_id	VARCHAR2(50)	NULL
);

CREATE TABLE returninventory (
	return_id	VARCHAR2(50)	NULL,
	product_id	VARCHAR2(50)	NULL,
	reason	VARCHAR2(255)	NULL,
	request_date	DATE	NULL,
	approved_by	VARCHAR2(50)	NULL,
	approved_date	DATE	NULL,
	status	VARCHAR2(50)	NULL
);

CREATE TABLE material (
	material_id	VARCHAR2(50)	NULL,
	material_name	VARCHAR2(255)	NULL,
	code	VARCHAR2(50)	NULL,
	description	VARCHAR2(255)	NULL,
	quantity	NUMBER(15)	NULL,
	unit	VARCHAR2(50)	NULL
);

CREATE TABLE materialRequest (
	request_id	VARCHAR2(50)	NULL,
	material_id	VARCHAR2(50)	NULL,
	request_by	VARCHAR2(50)	NULL,
	req_date	DATE	NULL,
	quantity	NUMBER(8)	NULL,
	status	VARCHAR2(50)	NULL
);

CREATE TABLE emp (
	user_id	VARCHAR2(50)	NULL,
	name	VARCHAR2(255)	NULL,
	email	VARCHAR2(255)	NULL,
	phone	VARCHAR2(255)	NULL,
	dept_id	VARCHAR2(50)	NULL,
	position	VARCHAR2(100)	NULL,
	hire_date	DATE	NULL,
	mgr	VARCHAR2(255)	NULL
);

CREATE TABLE dept (
	dept_id	VARCHAR2(50)	NULL,
	dept_name	VARCHAR2(255)	NULL,
	mgr_id	VARCHAR2(50)	NULL
);

CREATE TABLE board (
	board_id	VARCHAR2(50)	NULL,
	board_name	VARCHAR2(255)	NULL,
	created_by	VARCHAR2(50)	NULL,
	created_at	DATE	NULL
);

CREATE TABLE posts (
	post_id	VARCHAR2(50)	NULL,
	board_id	VARCHAR2(50)	NULL,
	title	VARCHAR2(255)	NULL,
	content	VARCHAR2(255)	NULL,
	author_id	VARCHAR2(50)	NULL,
	created_at	DATE	NULL,
	updated_at	DATE	NULL,
	pinned	char(1)	NULL,
	view_cnt	NUMBER(4)	NULL
);

CREATE TABLE comments (
	comment_id	VARCHAR2(50)	NULL,
	post_id	VARCHAR2(50)	NULL,
	employee_id	VARCHAR2(50)	NULL,
	content	VARCHAR2(255)	NULL,
	created_at	DATE	NULL
);

CREATE TABLE client (
	client_id	varchar2(50)	NOT NULL,
	name	varchar2(255)	NULL,
	location	varchar2(255)	NULL,
	contact	varchar2(50)	NULL,
	phone	varchar2(255)	NULL,
	email	varchar2(255)	NULL,
	create_at	date	NULL
);

CREATE TABLE sales_order (
	order_id	varchar2(50)	NOT NULL,
	client_id	varchar2(50)	NOT NULL,
	order_date	date	NULL,
	status	varchar2(50)	NULL,
	total	number(12,2)	NULL
);

CREATE TABLE sales_order_details (
	detail_id	varchar2(50)	NOT NULL,
	order_id	varchar2(50)	NOT NULL,
	product_id	VARCHAR2(50)	NULL,
	quantity	number(8)	NULL,
	price	number(12,2)	NULL,
	subtotal	number(12,2)	NULL
);

CREATE TABLE cost (
	cost_id	varchar2(50)	NOT NULL,
	product_id	VARCHAR2(50)	NULL,
	material_cost	number(12,2)	NULL,
	labor_cost	number(12,2)	NULL,
	over_cost	number(12,2)	NULL,
	total	number(12,2)	NULL,
	create_at	date	NULL
);

CREATE TABLE Equip_downtime (
	downtime_id	varchar2(50)	NOT NULL,
	equip_id	VARCHAR2(50)	NULL,
	start_time	date	NULL,
	end_time	date	NULL,
	reason	varchar2(255)	NULL,
	user_id	VARCHAR2(50)	NULL,
	comments	varchar2(255)	NULL
);

CREATE TABLE monitoring (
	monitoring_id	varchar2(50)	NOT NULL,
	equip_id	VARCHAR2(50)	NULL,
	status	varchar2(50)	NULL,
	check_date	date	NULL,
	comments	varchar2(255)	NULL
);

CREATE TABLE quality_standard (
	standard_id	varchar2(50)	NOT NULL,
	criteria	varchar2(255)	NULL,
	value	varchar2(50)	NULL,
	tolerance	varchar2(50)	NULL,
	unit	varchar2(50)	NULL,
	effective_date	date	NULL,
	expiration_date	date	NULL,
	notice	varchar2(255)	NULL,
	product_id	VARCHAR2(50)	NULL
);

CREATE TABLE material_move (
	move_id	varchar2(50)	NOT NULL,
	material_id	VARCHAR2(50)	NULL,
	user_id	VARCHAR2(50)	NULL,
	from_location	varchar2(255)	NULL,
	to_location	varchar2(255)	NULL,
	quantity	number(12,2)	NULL,
	move_type	varchar2(50)	NULL,
	move_date	date	NULL
);