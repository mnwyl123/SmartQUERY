create table COM_ENFORCE_RECORD
(
  report_id    VARCHAR2(30) not null,
  court_filing VARCHAR2(200),
  filing_date  VARCHAR2(20),
  exe_case     VARCHAR2(200),
  case_num     VARCHAR2(50),
  app_exe_sub  VARCHAR2(100),
  app_exe_sum  VARCHAR2(15),
  case_status  VARCHAR2(100),
  close_style  VARCHAR2(50),
  exe_sub      VARCHAR2(100),
  exe_sum      VARCHAR2(15),
  exe_type     VARCHAR2(5)
)
;
comment on table COM_ENFORCE_RECORD
  is 'ִ�м�¼';
comment on column COM_ENFORCE_RECORD.report_id
  is '������';
comment on column COM_ENFORCE_RECORD.court_filing
  is '������Ժ';
comment on column COM_ENFORCE_RECORD.filing_date
  is '��������';
comment on column COM_ENFORCE_RECORD.exe_case
  is 'ִ�а���';
comment on column COM_ENFORCE_RECORD.case_num
  is '����';
comment on column COM_ENFORCE_RECORD.app_exe_sub
  is '����ִ�б��';
comment on column COM_ENFORCE_RECORD.app_exe_sum
  is '����ִ�н��';
comment on column COM_ENFORCE_RECORD.case_status
  is '����״̬';
comment on column COM_ENFORCE_RECORD.close_style
  is '�᰸��ʽ';
comment on column COM_ENFORCE_RECORD.exe_sub
  is 'ִ�б��';
comment on column COM_ENFORCE_RECORD.exe_sum
  is 'ִ�н��';
comment on column COM_ENFORCE_RECORD.exe_type
  is 'ִ�����(01:ǿ��ִ�У�02:��������)';

