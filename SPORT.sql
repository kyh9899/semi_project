CREATE TABLE "COACH" (
	"CH_CODE"	VARCHAR2 (20 BYTE)		NOT NULL,
	"CH_NAME"	VARCHAR2(15 BYTE)		NOT NULL,
	"CH_PHONE"	VARCHAR2 (15 BYTE)		NOT NULL
);

CREATE TABLE "PROGRAM" (
    "PG_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "PG_TITLE" VARCHAR2(100 BYTE) NOT NULL,
    "PG_TIME" VARCHAR2(50 BYTE),
    "PG_DATE" VARCHAR2(20 BYTE),
    "PG_FEE" NUMBER CHECK (PG_FEE > 0) NOT NULL,
    "PG_MAX" NUMBER CHECK (PG_MAX > 0) NOT NULL,
    "PG_NUM" NUMBER CHECK (PG_NUM > 0) NOT NULL,
    "FC_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "CH_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "MB_ID" VARCHAR2(30 BYTE) NOT NULL
);

CREATE TABLE "PROGRAM_MEMBER_INFO" (
	"MB_CODE"	VARCHAR2 (20 BYTE)		NOT NULL,
	"PG_CODE"	VARCHAR2 (20 BYTE)		NOT NULL,
	"START_DATE"	DATE		NULL,
	"END_DATE"	DATE		NULL,
	"PAYMENT_ID"	VARCHAR2 (20 BYTE)		NOT NULL,
	"MB_ID"	VARCHAR2 (30 BYTE)		NOT NULL
);

CREATE TABLE "FACILITY" (
	"FC_CODE"	VARCHAR2 (20 BYTE)		NOT NULL,
	"FC_NAME"	VARCHAR2 (50 BYTE)		NOT NULL,
	"FC_LOCATION"	VARCHAR2 (100 BYTE)		NOT NULL,
	"FC_CAPACITY"	NUMBER		NOT NULL,
	"FC_AVA"	CHAR (1 BYTE)	DEFAULT 'Y'	NOT NULL
);

CREATE TABLE "PROGRAM_MEMBER_MANAGEMENT" (
	"MB_ID"	VARCHAR2 (30 BYTE)		NOT NULL,
	"PG_CODE2"	VARCHAR2 (20 BYTE)		NOT NULL
);

CREATE TABLE "ENROLLMENT" (
	"ERM_CODE"	VARCHAR2(20BYTE)		NOT NULL,
	"FC_CODE"	VARCHAR2(20BYTE)		NOT NULL,
	"ERM_AVA"	CHAR(1BYTE)		NULL,
	"PG_CODE"	VARCHAR2 (20 BYTE)		NOT NULL,
	"MB_ID"	VARCHAR2 (30 BYTE)		NOT NULL
);

CREATE TABLE "PAYMENT" (
	"PAYMENT_ID"	VARCHAR2 (20 BYTE)		NOT NULL,
	"PG_CODE"	VARCHAR2(20BYTE)		NOT NULL,
	"PATMENT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"AMOUNT"	NUMBER		NOT NULL,
	"MB_ID"	VARCHAR2 (30 BYTE)		NOT NULL
);

CREATE TABLE "BOARD" (
	"B_ID"	VARCHAR2(20BYTE)		NULL,
	"B_CONTENT"	VARCHAR2(300BYTE)		NOT NULL,
	"B_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"B_VALUE"	VARCHAR2(20BYTE)		NULL
);

CREATE TABLE "POST" (
    "P_NO" NUMBER,
    "B_ID" VARCHAR2(20 BYTE),
    "P_WRITER" VARCHAR2(15 BYTE),
    "P_TITLE" VARCHAR2(50 BYTE),
    "P_CONTENT" VARCHAR2(2000 BYTE),
    "P_ORG_FILENAME" VARCHAR2(100 BYTE) NOT NULL,
    "P_RND_FILENAME" VARCHAR2(100 BYTE) NOT NULL,
    "P_RDCOUNT" NUMBER NOT NULL,
    "P_STATUS" CHAR(1 BYTE) DEFAULT 'Y' NOT NULL,
    "P_CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "P_MODIFY_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "MB_ID" VARCHAR2(30 BYTE) NOT NULL
);
CREATE TABLE "MEMBER" (
    "MB_ID" VARCHAR2(30 BYTE) NOT NULL,
    "MB_PWD" VARCHAR2(30 BYTE) NOT NULL,
    "MB_NAME" VARCHAR2(15 BYTE) NOT NULL,
    "MB_SSN" VARCHAR2(15 BYTE) NOT NULL,
    "MB_PHONE" VARCHAR2(15 BYTE) NOT NULL,
    "MB_ADDRESS" VARCHAR2(100 BYTE),
    "MB_EMAIL" VARCHAR2(50 BYTE),
    "MB_STATUS" CHAR(1),
    "JOIN_DATE" DATE,
    "QUIT_DATE" DATE,
    "MG_ONF" CHAR(1) DEFAULT 'Y' NOT NULL
);


ALTER TABLE "COACH" ADD CONSTRAINT "PK_COACH" PRIMARY KEY (
	"CH_CODE"
);

ALTER TABLE "PROGRAM" ADD CONSTRAINT "PK_PROGRAM" PRIMARY KEY (
	"PG_CODE"
);

ALTER TABLE "PROGRAM_MEMBER_INFO" ADD CONSTRAINT "PK_PROGRAM_MEMBER_INFO" PRIMARY KEY (
	"MB_CODE"
);

ALTER TABLE "FACILITY" ADD CONSTRAINT "PK_FACILITY" PRIMARY KEY (
	"FC_CODE"
);

ALTER TABLE "ENROLLMENT" ADD CONSTRAINT "PK_ENROLLMENT" PRIMARY KEY (
	"ERM_CODE",
	"FC_CODE"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY (
	"PAYMENT_ID"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"B_ID"
);

ALTER TABLE "POST" ADD CONSTRAINT "PK_POST" PRIMARY KEY (
	"P_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MB_ID"
);

