create table COM_ENTER_QUAL
(
  report_id  VARCHAR2(30) not null,
  qual_type  VARCHAR2(5),
  grant_org  VARCHAR2(200),
  qual_name  VARCHAR2(200),
  grant_date VARCHAR2(20),
  end_date   VARCHAR2(20),
  content    VARCHAR2(200),
  qual_type2 VARCHAR2(5)
)
;
comment on table COM_ENTER_QUAL
  is '企业资质';
comment on column COM_ENTER_QUAL.report_id
  is '报告编号';
comment on column COM_ENTER_QUAL.qual_type
  is '资质类型(01：许可,02：认证,03：资质,04：奖励)';
comment on column COM_ENTER_QUAL.grant_org
  is '发放机关';
comment on column COM_ENTER_QUAL.qual_name
  is '资质名称';
comment on column COM_ENTER_QUAL.grant_date
  is '发放日期';
comment on column COM_ENTER_QUAL.end_date
  is '截止日期';
comment on column COM_ENTER_QUAL.content
  is '内容';

