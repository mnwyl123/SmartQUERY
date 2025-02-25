create table CIFM_COMPANY_LOANNO
(
  com_name            VARCHAR2(200),
  creditcode          VARCHAR2(100),
  loancardno          VARCHAR2(100),
  sdeporgcode         VARCHAR2(100),
  registertype        VARCHAR2(30),
  registercode        VARCHAR2(100),
  sdepnationaltaxcode VARCHAR2(100),
  sdeplandtaxcode     VARCHAR2(100),
  clawer_time         VARCHAR2(50),
  socialcredit        VARCHAR2(100),
  businessnum         VARCHAR2(100),
  socialgroupno       VARCHAR2(100),
  publicnum           VARCHAR2(100),
  civilno             VARCHAR2(100),
  fundno              VARCHAR2(100),
  other               VARCHAR2(100),
  religionno          VARCHAR2(100)
)
;
comment on table CIFM_COMPANY_LOANNO
  is '��ҵ��֤���ű�';
comment on column CIFM_COMPANY_LOANNO.com_name
  is '��ҵ����';
comment on column CIFM_COMPANY_LOANNO.creditcode
  is '�����Ŵ���';
comment on column CIFM_COMPANY_LOANNO.loancardno
  is '��֤��';
comment on column CIFM_COMPANY_LOANNO.sdeporgcode
  is '��֯��������';
comment on column CIFM_COMPANY_LOANNO.registertype
  is '�Ǽ�ע������';
comment on column CIFM_COMPANY_LOANNO.registercode
  is '�Ǽ�ע���';
comment on column CIFM_COMPANY_LOANNO.sdepnationaltaxcode
  is '��˰�˹�˰ʶ���';
comment on column CIFM_COMPANY_LOANNO.sdeplandtaxcode
  is '��˰�˵�˰ʶ���';
comment on column CIFM_COMPANY_LOANNO.clawer_time
  is '��ȡʱ��';
comment on column CIFM_COMPANY_LOANNO.socialcredit
  is 'ͳһ������ô���';
comment on column CIFM_COMPANY_LOANNO.businessnum
  is '����ע���';
comment on column CIFM_COMPANY_LOANNO.socialgroupno
  is '�������ǼǺ�';
comment on column CIFM_COMPANY_LOANNO.publicnum
  is '���غ���ҵ��λ�ǼǺ�';
comment on column CIFM_COMPANY_LOANNO.civilno
  is '������ҵ�ǼǺ�';
comment on column CIFM_COMPANY_LOANNO.fundno
  is '�����ǼǺ�';
comment on column CIFM_COMPANY_LOANNO.other
  is '����';
comment on column CIFM_COMPANY_LOANNO.religionno
  is '�ڽ�֤��ǼǺ�';

