create table COM_FORE_GUAR_SUMM
(
  report_id          VARCHAR2(30) not null,
  guar_type          VARCHAR2(10),
  guar_num           VARCHAR2(20),
  guar_sum           VARCHAR2(15),
  nor_guar_balance   VARCHAR2(15),
  atten_guar_balance VARCHAR2(15),
  bad_guar_balance   VARCHAR2(15)
)
;
comment on table COM_FORE_GUAR_SUMM
  is '���ⵣ����Ҫ';
comment on column COM_FORE_GUAR_SUMM.report_id
  is '������';
comment on column COM_FORE_GUAR_SUMM.guar_type
  is '��������(01����֤,02����Ѻ,03����Ѻ)';
comment on column COM_FORE_GUAR_SUMM.guar_num
  is '����';
comment on column COM_FORE_GUAR_SUMM.guar_sum
  is '�������';
comment on column COM_FORE_GUAR_SUMM.nor_guar_balance
  is '��������ҵ����������';
comment on column COM_FORE_GUAR_SUMM.atten_guar_balance
  is '��������ҵ������ע��';
comment on column COM_FORE_GUAR_SUMM.bad_guar_balance
  is '��������ҵ����������';

