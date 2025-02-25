create table OBJ_CHECK_ITEM
(
  id               VARCHAR2(64),
  resultcode       VARCHAR2(100),
  resultdesc       VARCHAR2(1000),
  begindate        VARCHAR2(30),
  enddate          VARCHAR2(30),
  tochecknm        VARCHAR2(100),
  org_id           VARCHAR2(100),
  relative_enddate VARCHAR2(30)
)
;
comment on table OBJ_CHECK_ITEM
  is '获取待核查异议事项';
comment on column OBJ_CHECK_ITEM.id
  is 'ID';
comment on column OBJ_CHECK_ITEM.resultcode
  is '处理结果代码';
comment on column OBJ_CHECK_ITEM.resultdesc
  is '处理结果描述';
comment on column OBJ_CHECK_ITEM.begindate
  is '开始日期';
comment on column OBJ_CHECK_ITEM.enddate
  is '结束日期';
comment on column OBJ_CHECK_ITEM.tochecknm
  is '异议事项单个数';
comment on column OBJ_CHECK_ITEM.org_id
  is '异议处理机构';
comment on column OBJ_CHECK_ITEM.relative_enddate
  is '相对结束日期（=开始日期+5天）';

