create table COM_FINANCIAL_REPORT_FORM
(
  report_id         VARCHAR2(30) not null,
  report_type       VARCHAR2(20),
  date_range        VARCHAR2(20),
  report_year       VARCHAR2(20),
  enterprise_range  VARCHAR2(20),
  sub_no            VARCHAR2(20),
  gegin_balance     VARCHAR2(20),
  end_balance       VARCHAR2(20),
  date_range2       VARCHAR2(20),
  enterprise_range2 VARCHAR2(20),
  report_type2      VARCHAR2(20)
)
;
comment on table COM_FINANCIAL_REPORT_FORM
  is '���񱨱�';
comment on column COM_FINANCIAL_REPORT_FORM.report_id
  is '������';
comment on column COM_FINANCIAL_REPORT_FORM.report_type
  is '��������(01���ʲ���ծ��,02����������,03���ֽ�������)';
comment on column COM_FINANCIAL_REPORT_FORM.date_range
  is 'ʱ�䷶Χ(01���걨,02���ϰ���,03���°���,04��һ����,05��������,06��������,07���ļ���)';
comment on column COM_FINANCIAL_REPORT_FORM.report_year
  is '���';
comment on column COM_FINANCIAL_REPORT_FORM.enterprise_range
  is '��ҵ��Χ(01���ϲ�,02������)';
comment on column COM_FINANCIAL_REPORT_FORM.sub_no
  is '��Ŀ��';
comment on column COM_FINANCIAL_REPORT_FORM.gegin_balance
  is '�ڳ����';
comment on column COM_FINANCIAL_REPORT_FORM.end_balance
  is '��ĩ���';

