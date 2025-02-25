-- ----------------------------
-- Table structure for "C##NEWO"."${objectNameUpper}"
-- ----------------------------
-- DROP TABLE "C##NEWO"."${objectNameUpper}";
CREATE TABLE "C##NEWO"."${objectNameUpper}" (
<#list fieldList as var>
	<#if var[1] == 'Integer'>
	"${var[0]}" NUMBER(${var[5]}) NULL ,
	<#else>
	"${var[0]}" VARCHAR2(${var[5]} BYTE) NULL ,
	</#if>
</#list>
)
LOGGING
NOCOMPRESS
NOCACHE
;
<!--根据实际情况设置主键-->
<#list fieldList as var>
COMMENT ON COLUMN "C##NEWO"."${objectNameUpper}"."${var[0]}" IS '${var[2]}';
</#list>
COMMENT ON COLUMN "C##NEWO"."${objectNameUpper}"."${objectNameUpper}_ID" IS 'ID';

-- ----------------------------
-- Indexes structure for table ${objectNameUpper}
-- ----------------------------

-- ----------------------------
-- Checks structure for table "C##NEWO"."${objectNameUpper}"

-- ----------------------------



-- ----------------------------
-- Primary Key structure for table "C##NEWO"."${objectNameUpper}"
-- ----------------------------

