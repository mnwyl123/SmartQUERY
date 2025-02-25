create table COM_BAD_ASSETS_DISP_SUMM
(
  report_id          VARCHAR2(30) not null,
  bad_assets_type    VARCHAR2(5),
  bad_assets_num     VARCHAR2(20),
  bad_assets_balance VARCHAR2(15),
  last_disposal_date VARCHAR2(20),
  settle_status      VARCHAR2(20),
  bad_assets_type2   VARCHAR2(5)
)
;
comment on table COM_BAD_ASSETS_DISP_SUMM
  is 'δ���岻���ʲ�������Ϣ��Ҫ';
comment on column COM_BAD_ASSETS_DISP_SUMM.report_id
  is '������';
comment on column COM_BAD_ASSETS_DISP_SUMM.bad_assets_type
  is '�����ʲ�����(01�����ʲ�����˾���õ�ծ��,02��ǷϢ,03�����,04�����������������������ծ��,05�������ʲ����루������δ����״̬��)';
comment on column COM_BAD_ASSETS_DISP_SUMM.bad_assets_num
  is '����';
comment on column COM_BAD_ASSETS_DISP_SUMM.bad_assets_balance
  is '���';
comment on column COM_BAD_ASSETS_DISP_SUMM.last_disposal_date
  is '���һ�δ�������';
comment on column COM_BAD_ASSETS_DISP_SUMM.settle_status
  is '����״̬(0:δ���壬1���ѽ���)';

