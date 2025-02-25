create table COM_CUSTORM_FAST_TRACK
(
  report_id       VARCHAR2(30) not null,
  exem_type       VARCHAR2(5),
  approval_org    VARCHAR2(100),
  exem_merch_name VARCHAR2(200),
  exem_no         VARCHAR2(30),
  end_date        VARCHAR2(20)
)
;
comment on table COM_CUSTORM_FAST_TRACK
  is '海关快速通道';
comment on column COM_CUSTORM_FAST_TRACK.report_id
  is '报告编号';
comment on column COM_CUSTORM_FAST_TRACK.exem_type
  is '免检类型(01：绿色通道,02：免检)';
comment on column COM_CUSTORM_FAST_TRACK.approval_org
  is '批准部门';
comment on column COM_CUSTORM_FAST_TRACK.exem_merch_name
  is '免检商品名称';
comment on column COM_CUSTORM_FAST_TRACK.exem_no
  is '免检号';
comment on column COM_CUSTORM_FAST_TRACK.end_date
  is '截止日期';

