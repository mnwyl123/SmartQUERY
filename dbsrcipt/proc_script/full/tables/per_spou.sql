create table PER_SPOU
(
  report_id              VARCHAR2(30) not null,
  spou_name              VARCHAR2(150),
  spou_credentials_type  VARCHAR2(20),
  spou_credentials_no    VARCHAR2(150),
  spou_company           VARCHAR2(200),
  spou_tel               VARCHAR2(150),
  marital_status         VARCHAR2(100),
  spou_credentials_type2 VARCHAR2(100)
)
;
comment on table PER_SPOU
  is '配偶信息表';
comment on column PER_SPOU.report_id
  is '报告编号';
comment on column PER_SPOU.spou_name
  is '配偶姓名';
comment on column PER_SPOU.spou_credentials_type
  is '配偶证件类型';
comment on column PER_SPOU.spou_credentials_no
  is '配偶证件号码';
comment on column PER_SPOU.spou_company
  is '配偶工作单位';
comment on column PER_SPOU.spou_tel
  is '配偶联系电话';
comment on column PER_SPOU.marital_status
  is '婚姻状况';
comment on column PER_SPOU.spou_credentials_type2
  is '配偶证件类型2';

