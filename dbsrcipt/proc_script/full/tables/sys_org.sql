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
  is '������';
comment on column SYS_ORG.org_id
  is 'Ψһ��ʶ';
comment on column SYS_ORG.name
  is '����';
comment on column SYS_ORG.name_en
  is 'Ӣ��';
comment on column SYS_ORG.org_level
  is '�����㼶';
comment on column SYS_ORG.org_code
  is '��������';
comment on column SYS_ORG.parent_id
  is '�ϼ�ID';
comment on column SYS_ORG.org_desc
  is '��ע';
comment on column SYS_ORG.headman
  is '������';
comment on column SYS_ORG.tel
  is '�绰';
comment on column SYS_ORG.functions
  is '����ְ��';
comment on column SYS_ORG.address
  is '��ַ';
comment on column SYS_ORG.status
  is '״̬';
comment on column SYS_ORG.org_order
  is '��������';
comment on column SYS_ORG.company
  is '����';
comment on column SYS_ORG.regionalism_code
  is '������������';
comment on column SYS_ORG.simplename
  is '�������';
comment on column SYS_ORG.org_id_perbank
  is '�ϱ���������(������)';
comment on column SYS_ORG.org_id_combank
  is '�ϱ���������(��ҵ��)';
comment on column SYS_ORG.branch_code_perbank
  is '��ѯ�������д���(����)';
comment on column SYS_ORG.branch_code_combank
  is '��ѯ�������д���(��ҵ)';
create index ORG_ID1 on SYS_ORG (ORG_ID, COMPANY);

