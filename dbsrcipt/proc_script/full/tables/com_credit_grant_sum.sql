create table COM_CREDIT_GRANT_SUM
(
  report_id                  VARCHAR2(30) not null,
  use_total_non_rev_credt    VARCHAR2(100),
  remain_total_non_rev_credt VARCHAR2(100),
  total_rev_credt            VARCHAR2(100),
  remain_total_rev_credt     VARCHAR2(100),
  whet_credit_limt           VARCHAR2(100),
  total_non_rev_credt        VARCHAR2(100),
  use_total_rev_credt        VARCHAR2(100)
)
;
comment on table COM_CREDIT_GRANT_SUM
  is '����Э�������Ϣ��Ԫ';
comment on column COM_CREDIT_GRANT_SUM.report_id
  is '������';
comment on column COM_CREDIT_GRANT_SUM.use_total_non_rev_credt
  is '��ʹ�õķ�ѭ�����ö�Ⱥϼ�';
comment on column COM_CREDIT_GRANT_SUM.remain_total_non_rev_credt
  is 'ʣ����õķ�ѭ����Ⱥϼ�';
comment on column COM_CREDIT_GRANT_SUM.total_rev_credt
  is 'ѭ�����ö�Ⱥϼ�';
comment on column COM_CREDIT_GRANT_SUM.remain_total_rev_credt
  is 'ʣ����õ�ѭ����Ⱥϼ�';
comment on column COM_CREDIT_GRANT_SUM.whet_credit_limt
  is '�Ƿ���������޶�';
comment on column COM_CREDIT_GRANT_SUM.total_non_rev_credt
  is '��ѭ�����ö�Ⱥϼ�';
comment on column COM_CREDIT_GRANT_SUM.use_total_rev_credt
  is '��ʹ�õ�ѭ�����ö�Ⱥϼ�';

