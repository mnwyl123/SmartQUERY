create table COM_CREDIT_BASIC_INFO
(
  report_id           VARCHAR2(30) not null,
  borr_name           VARCHAR2(400),
  regi_addr           VARCHAR2(500),
  regi_type           VARCHAR2(200),
  regi_no             VARCHAR2(200),
  regi_date           VARCHAR2(200),
  license_date        VARCHAR2(200),
  mech_code           VARCHAR2(200),
  china_credit_code   VARCHAR2(200),
  country_tax_regi_no VARCHAR2(200),
  land_tex_regi_no    VARCHAR2(200),
  num_repay_lia_db    VARCHAR2(100),
  num_repay_record    VARCHAR2(100),
  type_economic       VARCHAR2(100),
  addre_buss          VARCHAR2(300),
  num_spe_trans       VARCHAR2(100),
  sub_industry        VARCHAR2(100),
  num_repay_lia       VARCHAR2(100),
  type_organ          VARCHAR2(100),
  scale_ent           VARCHAR2(100),
  address_edi         VARCHAR2(300),
  year_setup          VARCHAR2(100),
  state_cx            VARCHAR2(100)
)
;
comment on table COM_CREDIT_BASIC_INFO
  is '相关还款责任汇总信息单元';
comment on column COM_CREDIT_BASIC_INFO.report_id
  is '报告编号';
comment on column COM_CREDIT_BASIC_INFO.borr_name
  is '名称';
comment on column COM_CREDIT_BASIC_INFO.regi_addr
  is '注册地址';
comment on column COM_CREDIT_BASIC_INFO.regi_type
  is '登记注册类型';
comment on column COM_CREDIT_BASIC_INFO.regi_no
  is '登记注册号';
comment on column COM_CREDIT_BASIC_INFO.regi_date
  is '登记注册日期';
comment on column COM_CREDIT_BASIC_INFO.license_date
  is '登记证书有效截止日期';
comment on column COM_CREDIT_BASIC_INFO.mech_code
  is '组织机构代码/统一社会信用代码';
comment on column COM_CREDIT_BASIC_INFO.china_credit_code
  is '中征码';
comment on column COM_CREDIT_BASIC_INFO.country_tax_regi_no
  is '国税登记号';
comment on column COM_CREDIT_BASIC_INFO.land_tex_regi_no
  is '地税登记号';
comment on column COM_CREDIT_BASIC_INFO.num_repay_lia_db
  is '还款责任类型数量（担保）';
comment on column COM_CREDIT_BASIC_INFO.num_repay_record
  is '还款表现记录条数';
comment on column COM_CREDIT_BASIC_INFO.type_economic
  is '经济类型';
comment on column COM_CREDIT_BASIC_INFO.addre_buss
  is '办公/经营地址';
comment on column COM_CREDIT_BASIC_INFO.num_spe_trans
  is '特定交易个数';
comment on column COM_CREDIT_BASIC_INFO.sub_industry
  is '所属行业';
comment on column COM_CREDIT_BASIC_INFO.num_repay_lia
  is '还款责任类型数量(借贷)';
comment on column COM_CREDIT_BASIC_INFO.type_organ
  is '组织机构类型';
comment on column COM_CREDIT_BASIC_INFO.scale_ent
  is '企业规模';
comment on column COM_CREDIT_BASIC_INFO.address_edi
  is '登记地址';
comment on column COM_CREDIT_BASIC_INFO.year_setup
  is '成立年份';
comment on column COM_CREDIT_BASIC_INFO.state_cx
  is '存续状态';

