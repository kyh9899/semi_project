CREATE TABLE "COACH" (
    "CH_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "CH_NAME" VARCHAR2(15 BYTE) NOT NULL,
    "CH_PHONE" VARCHAR2(15 BYTE) NOT NULL,
    CONSTRAINT "PK_COACH" PRIMARY KEY ("CH_CODE")
);

CREATE TABLE "FACILITY" (
    "FC_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "FC_NAME" VARCHAR2(50 BYTE) NOT NULL,
    "FC_LOCATION" VARCHAR2(100 BYTE) NOT NULL,
    "FC_CAPACITY" NUMBER NOT NULL,
    "FC_AVA" CHAR(1 BYTE) DEFAULT 'Y' NOT NULL,
    CONSTRAINT "PK_FACILITY" PRIMARY KEY ("FC_CODE")
);

CREATE TABLE "MEMBER" (
    "MB_CODE" NUMBER,
    "MB_ID" VARCHAR2(30 BYTE) UNIQUE NOT NULL,
    "MB_PWD" VARCHAR2(100 BYTE) NOT NULL,
    "MB_NAME" VARCHAR2(15 BYTE) NOT NULL,
    "MB_SSN" VARCHAR2(15 BYTE) NOT NULL UNIQUE,
    "MB_PHONE" VARCHAR2(15 BYTE) NOT NULL,
    "MB_ADDRESS1" VARCHAR2(100 BYTE),
    "MB_ADDRESS2" VARCHAR2(100 BYTE),
    "MB_EMAIL" VARCHAR2(50 BYTE),
    "MB_STATUS" VARCHAR2(1) DEFAULT 'Y' CHECK(MB_STATUS IN ('Y', 'N')),
    "JOIN_DATE" DATE,
    "QUIT_DATE" DATE,
    "MG_ONF" VARCHAR2(1) DEFAULT 'N' CHECK(MG_ONF IN ('Y', 'N')),
    CONSTRAINT "PK_MEMBER" PRIMARY KEY ("MB_CODE")
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
    "MB_CODE" NUMBER NOT NULL,
    CONSTRAINT "PK_PROGRAM" PRIMARY KEY ("PG_CODE"),
    CONSTRAINT "FK_PROGRAM_FACILITY" FOREIGN KEY ("FC_CODE") REFERENCES "FACILITY" ("FC_CODE"),
    CONSTRAINT "FK_PROGRAM_COACH" FOREIGN KEY ("CH_CODE") REFERENCES "COACH" ("CH_CODE"),
    CONSTRAINT "FK_PROGRAM_MEMBER" FOREIGN KEY ("MB_CODE") REFERENCES "MEMBER" ("MB_CODE")
);

CREATE TABLE "PROGRAM_MEMBER_INFO" (
    "MB_CODE" NUMBER NOT NULL,
    "PG_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "START_DATE" DATE NULL,
    "END_DATE" DATE NULL,
    "PAYMENT_ID" VARCHAR2(20 BYTE) NOT NULL,
    "MB_ID" VARCHAR2(30 BYTE) NOT NULL,
    CONSTRAINT "PK_PROGRAM_MEMBER_INFO" PRIMARY KEY ("MB_CODE"),
    CONSTRAINT "FK_MEMBER_INFO_PROGRAM" FOREIGN KEY ("PG_CODE") REFERENCES "PROGRAM" ("PG_CODE"),
    CONSTRAINT "FK_MEMBER_INFO_MEMBER" FOREIGN KEY ("MB_CODE") REFERENCES "MEMBER" ("MB_CODE")
);

CREATE TABLE "ENROLLMENT" (
    "ERM_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "FC_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "ERM_AVA" CHAR(1 BYTE) NULL,
    "PG_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "MB_CODE" NUMBER NOT NULL,
    CONSTRAINT "PK_ENROLLMENT" PRIMARY KEY ("ERM_CODE", "FC_CODE"),
    CONSTRAINT "FK_ENROLLMENT_FACILITY" FOREIGN KEY ("FC_CODE") REFERENCES "FACILITY" ("FC_CODE"),
    CONSTRAINT "FK_ENROLLMENT_PROGRAM" FOREIGN KEY ("PG_CODE") REFERENCES "PROGRAM" ("PG_CODE"),
    CONSTRAINT "FK_ENROLLMENT_MEMBER" FOREIGN KEY ("MB_CODE") REFERENCES "MEMBER" ("MB_CODE")
);

CREATE TABLE "PAYMENT" (
    "PAYMENT_ID" VARCHAR2(20 BYTE) NOT NULL,
    "PG_CODE" VARCHAR2(20 BYTE) NOT NULL,
    "PAYMENT_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "AMOUNT" NUMBER NOT NULL,
    "MB_CODE" NUMBER NOT NULL,
    CONSTRAINT "PK_PAYMENT" PRIMARY KEY ("PAYMENT_ID"),
    CONSTRAINT "FK_PAYMENT_PROGRAM" FOREIGN KEY ("PG_CODE") REFERENCES "PROGRAM" ("PG_CODE"),
    CONSTRAINT "FK_PAYMENT_MEMBER" FOREIGN KEY ("MB_CODE") REFERENCES "MEMBER" ("MB_CODE")
);

CREATE TABLE "BOARD" (
    "B_ID" VARCHAR2(20 BYTE),
    "B_CONTENT" VARCHAR2(300 BYTE),
    "B_DATE" DATE DEFAULT SYSDATE,
    "B_VALUE" VARCHAR2(20 BYTE),
    CONSTRAINT "PK_BOARD" PRIMARY KEY ("B_ID")
);

CREATE TABLE "POST" (
    "P_NO" NUMBER,
    "B_ID" VARCHAR2(20 BYTE),
    "MB_CODE" NUMBER,
    "P_TITLE" VARCHAR2(50 BYTE),
    "P_CONTENT" VARCHAR2(2000 BYTE),
    "P_CONTENT2" VARCHAR2(4000 BYTE),
    "P_ORG_FILENAME" VARCHAR2(100 BYTE),
    "P_RND_FILENAME" VARCHAR2(100 BYTE),
    "P_RDCOUNT" NUMBER DEFAULT 0,
    "P_STATUS" CHAR(1 BYTE) DEFAULT 'Y' NOT NULL,
    "P_CREATE_DATE" DATE DEFAULT SYSDATE,
    "P_MODIFY_DATE" DATE DEFAULT SYSDATE,
    CONSTRAINT "PK_POST" PRIMARY KEY ("P_NO"),
    CONSTRAINT "FK_POST_BOARD" FOREIGN KEY ("B_ID") REFERENCES "BOARD" ("B_ID"),
    CONSTRAINT "FK_POST_MEMBER_MB_CODE" FOREIGN KEY ("MB_CODE") REFERENCES "MEMBER" ("MB_CODE")
);

CREATE TABLE REPLY(
  R_NO NUMBER PRIMARY KEY,
  B_ID VARCHAR2(20 BYTE),
  P_NO NUMBER,
  MB_CODE NUMBER,
  R_CONTENT VARCHAR2(2000 BYTE),
  R_STATUS VARCHAR2(1) DEFAULT 'Y',
  R_CREATE_DATE DATE DEFAULT SYSDATE,
  R_MODIFY_DATE DATE DEFAULT SYSDATE,
  CONSTRAINT FK_REPLY_B_ID FOREIGN KEY (B_ID) REFERENCES BOARD (B_ID),
  CONSTRAINT FK_REPLY_MB_CODE FOREIGN KEY (MB_CODE) REFERENCES MEMBER (MB_CODE),
  CONSTRAINT FK_REPLY_P_NO FOREIGN KEY (P_NO) REFERENCES POST (P_NO)
);



CREATE TABLE "PROGRAM_MEMBER_MANAGEMENT" (
    "MB_CODE" NUMBER NOT NULL,
    "PG_CODE2" VARCHAR2(20 BYTE) NOT NULL,
    CONSTRAINT "PK_PROGRAM_MEMBER_MANAGEMENT" PRIMARY KEY ("MB_CODE", "PG_CODE2"),
    CONSTRAINT "FK_MANAGEMENT_MEMBER" FOREIGN KEY ("MB_CODE") REFERENCES "MEMBER" ("MB_CODE"),
    CONSTRAINT "FK_MANAGEMENT_PROGRAM" FOREIGN KEY ("PG_CODE2") REFERENCES "PROGRAM" ("PG_CODE")
);


CREATE SEQUENCE SEQ_MB_NO
START WITH 1
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 100000;

CREATE SEQUENCE SEQ_POST_NO
  START WITH 1
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 100000;

CREATE SEQUENCE SEQ_REPLY_NO
  INCREMENT BY 1
  START WITH 1
  MINVALUE 0
  MAXVALUE 100000;