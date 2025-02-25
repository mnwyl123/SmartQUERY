create table SYS_ORG
(
  org_id              VARCHAR2(100),
  name                VARCHAR2(30),
  name_en             VARCHAR2(50),
  org_level           INTEGER,
  org_code            VARCHAR2(50),
  parent_id           VARCHAR2(100),
  org_desc            VARCHAR2(255),
  headman             VARCHAR2(30),
  tel                 VARCHAR2(50),
  functions           VARCHAR2(255),
  address             VARCHAR2(255),
  status              VARCHAR2(2),
  org_order           INTEGER,
  company             VARCHAR2(10),
  regionalism_code    VARCHAR2(6),
  simplename          VARCHAR2(30),
  org_id_perbank      VARCHAR2(255),
  org_id_combank      VARCHAR2(100),
  branch_code_perbank VARCHAR2(50),
  branch_code_combank VARCHAR2(50)
)
;
comment on table SYS_ORG
  is '机构表';
comment on column SYS_ORG.org_id
  is '唯一标识';
comment on column SYS_ORG.name
  is '名称';
comment on column SYS_ORG.name_en
  is '英文';
comment on column SYS_ORG.org_level
  is '机构层级';
comment on column SYS_ORG.org_code
  is '机构编码';
comment on column SYS_ORG.parent_id
  is '上级ID';
comment on column SYS_ORG.org_desc
  is '备注';
comment on column SYS_ORG.headman
  is '负责人';
comment on column SYS_ORG.tel
  is '电话';
comment on column SYS_ORG.functions
  is '部门职能';
comment on column SYS_ORG.address
  is '地址';
comment on column SYS_ORG.status
  is '状态';
comment on column SYS_ORG.org_order
  is '机构排序';
comment on column SYS_ORG.company
  is '法人';
comment on column SYS_ORG.regionalism_code
  is '行政区划代码';
comment on column SYS_ORG.simplename
  is '机构简称';
comment on column SYS_ORG.org_id_perbank
  is '上报机构代码(个人总)';
comment on column SYS_ORG.org_id_combank
  is '上报机构代码(企业总)';
comment on column SYS_ORG.branch_code_perbank
  is '查询网点人行代码(个人)';
comment on column SYS_ORG.branch_code_combank
  is '查询网点人行代码(企业)';
create index ORG_ID1 on SYS_ORG (ORG_ID, COMPANY);

