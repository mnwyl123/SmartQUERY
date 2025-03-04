DELETE FROM SYS_MENU_FUN_GROUP;
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME, 
    FUN_GROUP_NAME_EN, 
    FUN_GROUP_DESC
   )
 Values
   ('menuFunGroup', 
    '菜单管理角色组', 
    '55', 
    '333222222');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME, 
    FUN_GROUP_DESC
   )
 Values
   ('orgFunGroup', 
    '机构管理权限组', 
    'aaa');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME
   )
 Values
   ('roleFunGroup', 
    '角色管理权限组');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME
   )
 Values
   ('userFunGroup', 
    '用户管理角色组');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME
   )
 Values
   ('dictFunGroup', 
    '字典管理权限组');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME
   )
 Values
   ('sysToolGroup', 
    '系统工具权限组');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME
   )
 Values
   ('onLineGroup', 
    '在线管理权限组');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME, 
    FUN_GROUP_NAME_EN, 
    FUN_GROUP_DESC
   )
 Values
   ('pictureFunGroup', 
    '图片管理权限组', 
    'pictureFunGroup', 
    'cccc');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME, 
    FUN_GROUP_NAME_EN
   )
 Values
   ('menuGGroupFun', 
    '菜单功能权限组', 
    'ss');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME
   )
 Values
   ('operationFunGroup', 
    '日志管理权限组');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME, 
    FUN_GROUP_NAME_EN
   )
 Values
   ('schParamFunGroup', 
    '调度参数权限组', 
    'schParamFunGroup');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME, 
    FUN_GROUP_NAME_EN
   )
 Values
   ('operateWFGroup', 
    '调度操作作业流权限组', 
    'operateWFGroup');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME, 
    FUN_GROUP_NAME_EN
   )
 Values
   ('operateManualGroup', 
    '调度操作手动执行权限组', 
    'operateManualGroup');
Insert into SYS_MENU_FUN_GROUP
   (FUN_GROUP_ID, 
    FUN_GROUP_NAME, 
    FUN_GROUP_NAME_EN
   )
 Values
   ('operateMonitorGroup', 
    '调度监控权限组', 
    'operateMonitorGroup');
COMMIT;
