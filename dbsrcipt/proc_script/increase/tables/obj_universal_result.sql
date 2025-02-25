create table OBJ_UNIVERSAL_RESULT
(
  id          VARCHAR2(64),
  resultcode  VARCHAR2(100),
  resultdesc  VARCHAR2(1000),
  user_id     VARCHAR2(64),
  report_type VARCHAR2(1),
  objcheckid  VARCHAR2(20)
)
;
comment on table OBJ_UNIVERSAL_RESULT
  is '通用应答报文';
comment on column OBJ_UNIVERSAL_RESULT.id
  is 'ID';
comment on column OBJ_UNIVERSAL_RESULT.resultcode
  is '处理结果代码';
comment on column OBJ_UNIVERSAL_RESULT.resultdesc
  is '处理结果描述';
comment on column OBJ_UNIVERSAL_RESULT.user_id
  is '处理用户名';
comment on column OBJ_UNIVERSAL_RESULT.report_type
  is '报告类型（1-获取个人待核查异议事项 2-获取个人待核查异议事项附件信息 3-反馈个人异议事项核查结果 4-反馈个人异议事项更正结果 5-查询个人异议事项更正结果接受情况 6-添加个人标注 7-删除个人标注）';

