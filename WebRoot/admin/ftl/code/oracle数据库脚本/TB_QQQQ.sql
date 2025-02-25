-- ----------------------------
-- Table structure for "C##NEWO"."TB_QQQQ"
-- ----------------------------
-- DROP TABLE "C##NEWO"."TB_QQQQ";
CREATE TABLE "C##NEWO"."TB_QQQQ" (
	"STR_NAME" VARCHAR2(255 BYTE) NULL ,
	"QQ_ID" VARCHAR2(100 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;

COMMENT ON COLUMN "C##NEWO"."TB_QQQQ"."STR_NAME" IS '匿名';
COMMENT ON COLUMN "C##NEWO"."TB_QQQQ"."QQ_ID" IS 'ID';

-- ----------------------------
-- Indexes structure for table TB_QQQQ
-- ----------------------------

-- ----------------------------
-- Checks structure for table "C##NEWO"."TB_QQQQ"

-- ----------------------------

ALTER TABLE "C##NEWO"."TB_QQQQ" ADD CHECK ("QQ_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "C##NEWO"."TB_QQQQ"
-- ----------------------------
ALTER TABLE "C##NEWO"."TB_QQQQ" ADD PRIMARY KEY ("QQ_ID");
