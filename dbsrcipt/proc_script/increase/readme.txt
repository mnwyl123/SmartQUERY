1、先执行SenseRun.bat

2、手动执行 单独执行的sql\下的文件
	2.1 执行 增加列2字段\下的 alter_sql.sql
	2.2 执行 列2字段赋值\下的 updateSql.sql
	2.3 执行 修改表的字段长度\下的 modify_length.sql
	
3、手动执行 用户下的表结构\下的文件ZXGL_TAB_COLS.sql
	
	--ZXGL_TAB_COLS表是将开发环境的USER_TAB_COLS查询到的数据导入到表中
	
4、为了保证表结构相同，使用生产用户下的USER_TAB_COLS查询的数据，和表ZXGL_TAB_COLS比对
	
	