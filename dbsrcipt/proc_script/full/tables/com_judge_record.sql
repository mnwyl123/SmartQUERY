create table COM_JUDGE_RECORD
(
  report_id        VARCHAR2(30) not null,
  court_filing     VARCHAR2(100),
  filing_date      VARCHAR2(20),
  litig_status     VARCHAR2(100),
  case_num         VARCHAR2(50),
  litig_pro        VARCHAR2(100),
  litig_sub        VARCHAR2(200),
  litig_sum        VARCHAR2(15),
  close_style      VARCHAR2(100),
  judge_start_date VARCHAR2(20),
  judge_result     VARCHAR2(300),
  litig_reason     VARCHAR2(50),
  serial           VARCHAR2(100),
  close_style2     VARCHAR2(100)
)
;
comment on table COM_JUDGE_RECORD
  is '�����о���¼��Ϣ��Ԫ';
comment on column COM_JUDGE_RECORD.report_id
  is '������';
comment on column COM_JUDGE_RECORD.court_filing
  is '������Ժ����';
comment on column COM_JUDGE_RECORD.filing_date
  is '��������';
comment on column COM_JUDGE_RECORD.litig_status
  is '���ϵ�λ';
comment on column COM_JUDGE_RECORD.case_num
  is '����';
comment on column COM_JUDGE_RECORD.litig_pro
  is '���г���';
comment on column COM_JUDGE_RECORD.litig_sub
  is '���ϱ��';
comment on column COM_JUDGE_RECORD.litig_sum
  is '���ϱ�Ľ��';
comment on column COM_JUDGE_RECORD.close_style
  is '�᰸��ʽ';
comment on column COM_JUDGE_RECORD.judge_start_date
  is '�о�/������Ч����';
comment on column COM_JUDGE_RECORD.judge_result
  is '�о�/������';
comment on column COM_JUDGE_RECORD.litig_reason
  is '����';
comment on column COM_JUDGE_RECORD.serial
  is '�����о���¼���';
comment on column COM_JUDGE_RECORD.close_style2
  is '�᰸��ʽ2';

