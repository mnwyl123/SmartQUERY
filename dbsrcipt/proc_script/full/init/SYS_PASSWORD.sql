
insert into SYS_PASSWORD (initial_password, max_error_logon, effect_days, min_length, max_length, repeat_num, modified_restrict_time, encrypt_type, password_rule, password_rule_desc)
values ('111111', 3, 100, 6, 15, 3, 3, 'MD5', 'number', null);
commit;

