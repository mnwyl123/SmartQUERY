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
  is '异常查询参数表';
comment on column CIFM_PARAM_LIST.org_id
  is '机构编号';
comment on column CIFM_PARAM_LIST.fail_zbsx_per
  is '个人失败占比上限';
comment on column CIFM_PARAM_LIST.fail_zbsx_org
  is '企业失败占比上限';
comment on column CIFM_PARAM_LIST.other_reason_zbsx
  is '其他理由占比上限';
comment on column CIFM_PARAM_LIST.cross_region_zbsx
  is '跨地域占比上限';

