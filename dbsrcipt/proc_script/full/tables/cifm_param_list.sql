create table CIFM_PARAM_LIST
(
  org_id            VARCHAR2(100),
  fail_zbsx_per     NUMBER(5,2),
  fail_zbsx_org     NUMBER(5,2),
  other_reason_zbsx NUMBER(5,2),
  cross_region_zbsx NUMBER(5,2),
  company           VARCHAR2(10)
)
;
comment on table CIFM_PARAM_LIST
  is '�쳣��ѯ������';
comment on column CIFM_PARAM_LIST.org_id
  is '�������';
comment on column CIFM_PARAM_LIST.fail_zbsx_per
  is '����ʧ��ռ������';
comment on column CIFM_PARAM_LIST.fail_zbsx_org
  is '��ҵʧ��ռ������';
comment on column CIFM_PARAM_LIST.other_reason_zbsx
  is '��������ռ������';
comment on column CIFM_PARAM_LIST.cross_region_zbsx
  is '�����ռ������';

