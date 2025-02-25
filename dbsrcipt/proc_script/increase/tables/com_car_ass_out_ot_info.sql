create table COM_CAR_ASS_OUT_OT_INFO
(
  report_id         VARCHAR2(30) not null,
  fina_id           VARCHAR2(100),
  out_car           VARCHAR2(100),
  bala_befor_year   VARCHAR2(100),
  report_year       VARCHAR2(100),
  out_fis_sub       VARCHAR2(100),
  incom_dona        VARCHAR2(100),
  pay_out_top       VARCHAR2(100),
  report_type       VARCHAR2(100),
  bala_fis_sub      VARCHAR2(100),
  bala_bus_iss      VARCHAR2(100),
  smart_type_report VARCHAR2(100),
  income_others     VARCHAR2(100),
  out_aff_pay       VARCHAR2(100),
  pay_bus           VARCHAR2(100),
  bala_in_year      VARCHAR2(100),
  out_dra_fun       VARCHAR2(100),
  in_fis_sub        VARCHAR2(100),
  in_car            VARCHAR2(100),
  in_aff_pay        VARCHAR2(100),
  in_car_clas       VARCHAR2(100),
  top_in_fis        VARCHAR2(100),
  out_car_unfis     VARCHAR2(100),
  bala_unfis        VARCHAR2(100),
  bala_fis_onyear   VARCHAR2(100),
  should_pay_tax    VARCHAR2(100),
  with_dra_fun      VARCHAR2(100),
  num_fina          VARCHAR2(100),
  num_org           VARCHAR2(100),
  bala_car_iss      VARCHAR2(100),
  out_others        VARCHAR2(100),
  income_bus        VARCHAR2(100)
)
;
comment on table COM_CAR_ASS_OUT_OT_INFO
  is '��ҵ��λ����֧����2013 �棩��Ϣ��Ԫ';
comment on column COM_CAR_ASS_OUT_OT_INFO.report_id
  is '������';
comment on column COM_CAR_ASS_OUT_OT_INFO.fina_id
  is '���񱨱���';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_car
  is '��ҵ��֧��';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_befor_year
  is '�ֲ���ǰ��ȿ����ľ�Ӫ����';
comment on column COM_CAR_ASS_OUT_OT_INFO.report_year
  is '�������';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_fis_sub
  is '��ҵ֧������������֧����';
comment on column COM_CAR_ASS_OUT_OT_INFO.incom_dona
  is '�����������Ŀ�£���������';
comment on column COM_CAR_ASS_OUT_OT_INFO.pay_out_top
  is '�Ͻ��ϼ�֧��';
comment on column COM_CAR_ASS_OUT_OT_INFO.report_type
  is '��������';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_fis_sub
  is '���ڲ���������ת����';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_bus_iss
  is '���ھ�Ӫ����';
comment on column COM_CAR_ASS_OUT_OT_INFO.smart_type_report
  is '��������ϸ��';
comment on column COM_CAR_ASS_OUT_OT_INFO.income_others
  is '��������';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_aff_pay
  is '�Ը�����λ����֧��';
comment on column COM_CAR_ASS_OUT_OT_INFO.pay_bus
  is '��Ӫ֧��';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_in_year
  is '����ǲ���������ת����';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_dra_fun
  is 'ת����ҵ����';
comment on column COM_CAR_ASS_OUT_OT_INFO.in_fis_sub
  is '������������';
comment on column COM_CAR_ASS_OUT_OT_INFO.in_car
  is '��ҵ����';
comment on column COM_CAR_ASS_OUT_OT_INFO.in_aff_pay
  is '������λ�Ͻ�����';
comment on column COM_CAR_ASS_OUT_OT_INFO.in_car_clas
  is '��ҵ������';
comment on column COM_CAR_ASS_OUT_OT_INFO.top_in_fis
  is '�ϼ���������';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_car_unfis
  is '��ҵ֧�����ǲ�������֧����';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_unfis
  is '�ǲ���������ת';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_fis_onyear
  is '����ǲ�����������';
comment on column COM_CAR_ASS_OUT_OT_INFO.should_pay_tax
  is 'Ӧ����ҵ����˰';
comment on column COM_CAR_ASS_OUT_OT_INFO.with_dra_fun
  is '��ȡר�û���';
comment on column COM_CAR_ASS_OUT_OT_INFO.num_fina
  is 'ҵ��������';
comment on column COM_CAR_ASS_OUT_OT_INFO.num_org
  is 'ҵ������������';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_car_iss
  is '������ҵ��ת����';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_others
  is '����֧��';
comment on column COM_CAR_ASS_OUT_OT_INFO.income_bus
  is '��Ӫ����';

