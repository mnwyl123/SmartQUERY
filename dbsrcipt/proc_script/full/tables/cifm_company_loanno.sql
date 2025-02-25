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
  is '企业中证码存放表';
comment on column CIFM_COMPANY_LOANNO.com_name
  is '企业名称';
comment on column CIFM_COMPANY_LOANNO.creditcode
  is '机构信代码';
comment on column CIFM_COMPANY_LOANNO.loancardno
  is '中证码';
comment on column CIFM_COMPANY_LOANNO.sdeporgcode
  is '组织机构代码';
comment on column CIFM_COMPANY_LOANNO.registertype
  is '登记注册类型';
comment on column CIFM_COMPANY_LOANNO.registercode
  is '登记注册号';
comment on column CIFM_COMPANY_LOANNO.sdepnationaltaxcode
  is '纳税人国税识别号';
comment on column CIFM_COMPANY_LOANNO.sdeplandtaxcode
  is '纳税人地税识别号';
comment on column CIFM_COMPANY_LOANNO.clawer_time
  is '爬取时间';
comment on column CIFM_COMPANY_LOANNO.socialcredit
  is '统一社会信用代码';
comment on column CIFM_COMPANY_LOANNO.businessnum
  is '工商注册号';
comment on column CIFM_COMPANY_LOANNO.socialgroupno
  is '社会团体登记号';
comment on column CIFM_COMPANY_LOANNO.publicnum
  is '机关和事业单位登记号';
comment on column CIFM_COMPANY_LOANNO.civilno
  is '民办非企业登记号';
comment on column CIFM_COMPANY_LOANNO.fundno
  is '基金会登记号';
comment on column CIFM_COMPANY_LOANNO.other
  is '其他';
comment on column CIFM_COMPANY_LOANNO.religionno
  is '宗教证书登记号';

