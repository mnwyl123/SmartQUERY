create table COM_INFO_SUMMARY
(
  report_id          VARCHAR2(30) not null,
  first_trade_year   VARCHAR2(30),
  relation_org       VARCHAR2(30),
  unclear_org        VARCHAR2(30),
  current_debt       VARCHAR2(200),
  over_debt          VARCHAR2(200),
  org_num            VARCHAR2(20),
  credit_flag_num    VARCHAR2(20),
  info_statement_num VARCHAR2(20)
)
;
comment on table COM_INFO_SUMMARY
  is '��Ϣ��Ҫ';
comment on column COM_INFO_SUMMARY.report_id
  is '������';
comment on column COM_INFO_SUMMARY.first_trade_year
  is '�״ν�����';
comment on column COM_INFO_SUMMARY.relation_org
  is '������Ŵ�ҵ��Ľ��ڻ�������';
comment on column COM_INFO_SUMMARY.unclear_org
  is 'δ����Ľ��ڻ�������';
comment on column COM_INFO_SUMMARY.current_debt
  is '�������';
comment on column COM_INFO_SUMMARY.over_debt
  is '������ΥԼ��ծ���';
comment on column COM_INFO_SUMMARY.org_num
  is '��������˵������';
comment on column COM_INFO_SUMMARY.credit_flag_num
  is '�������ı�ע����';
comment on column COM_INFO_SUMMARY.info_statement_num
  is '��Ϣ������������';

