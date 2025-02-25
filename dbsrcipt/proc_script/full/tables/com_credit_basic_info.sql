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
  is '��ػ������λ�����Ϣ��Ԫ';
comment on column COM_CREDIT_BASIC_INFO.report_id
  is '������';
comment on column COM_CREDIT_BASIC_INFO.borr_name
  is '����';
comment on column COM_CREDIT_BASIC_INFO.regi_addr
  is 'ע���ַ';
comment on column COM_CREDIT_BASIC_INFO.regi_type
  is '�Ǽ�ע������';
comment on column COM_CREDIT_BASIC_INFO.regi_no
  is '�Ǽ�ע���';
comment on column COM_CREDIT_BASIC_INFO.regi_date
  is '�Ǽ�ע������';
comment on column COM_CREDIT_BASIC_INFO.license_date
  is '�Ǽ�֤����Ч��ֹ����';
comment on column COM_CREDIT_BASIC_INFO.mech_code
  is '��֯��������/ͳһ������ô���';
comment on column COM_CREDIT_BASIC_INFO.china_credit_code
  is '������';
comment on column COM_CREDIT_BASIC_INFO.country_tax_regi_no
  is '��˰�ǼǺ�';
comment on column COM_CREDIT_BASIC_INFO.land_tex_regi_no
  is '��˰�ǼǺ�';
comment on column COM_CREDIT_BASIC_INFO.num_repay_lia_db
  is '������������������������';
comment on column COM_CREDIT_BASIC_INFO.num_repay_record
  is '������ּ�¼����';
comment on column COM_CREDIT_BASIC_INFO.type_economic
  is '��������';
comment on column COM_CREDIT_BASIC_INFO.addre_buss
  is '�칫/��Ӫ��ַ';
comment on column COM_CREDIT_BASIC_INFO.num_spe_trans
  is '�ض����׸���';
comment on column COM_CREDIT_BASIC_INFO.sub_industry
  is '������ҵ';
comment on column COM_CREDIT_BASIC_INFO.num_repay_lia
  is '����������������(���)';
comment on column COM_CREDIT_BASIC_INFO.type_organ
  is '��֯��������';
comment on column COM_CREDIT_BASIC_INFO.scale_ent
  is '��ҵ��ģ';
comment on column COM_CREDIT_BASIC_INFO.address_edi
  is '�Ǽǵ�ַ';
comment on column COM_CREDIT_BASIC_INFO.year_setup
  is '�������';
comment on column COM_CREDIT_BASIC_INFO.state_cx
  is '����״̬';

