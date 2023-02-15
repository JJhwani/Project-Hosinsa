# Project-Hosinsa
<br>
TABLE
<br>
CREATE TABLE HOSINSA_MEMBER(<br>
    &nbsp&nbsp&nbsp&nbsp ID &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(30),<br>
    &nbsp&nbsp&nbsp&nbsp PW &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(30),<br>
    &nbsp&nbsp&nbsp&nbsp NAME &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(15 char),<br>
    &nbsp&nbsp&nbsp&nbsp GENDER &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(6 char),<br>
    &nbsp&nbsp&nbsp&nbsp BIRTHDAY &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp DATE,<br>
    &nbsp&nbsp&nbsp&nbsp EMAIL &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(50),<br>
    &nbsp&nbsp&nbsp&nbsp PHONE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp CHAR(13),<br>
    &nbsp&nbsp&nbsp&nbsp NICKNAME &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(30),<br>
    &nbsp&nbsp&nbsp&nbsp PROFILIMG &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(100),<br>
    &nbsp&nbsp&nbsp&nbsp GRADE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp CHAR(1),<br>
    &nbsp&nbsp&nbsp&nbsp INTRODUCER &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(30),<br>
    &nbsp&nbsp&nbsp&nbsp PRIMARY KEY(ID)<br>
);<br>
<br>
CREATE TABLE HOSINSA_PRODUCT(<br>
    &nbsp&nbsp&nbsp&nbsp CATEGORY &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(20),<br>
    &nbsp&nbsp&nbsp&nbsp PRONAME &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(200),<br>
    &nbsp&nbsp&nbsp&nbsp PROIMG &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(500),<br>
    &nbsp&nbsp&nbsp&nbsp BRAND &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(50),<br>
    &nbsp&nbsp&nbsp&nbsp PRONUM &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp NUMBER(8),<br>
    &nbsp&nbsp&nbsp&nbsp PRICE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp NUMBER(8),<br>
    &nbsp&nbsp&nbsp&nbsp STOCK &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp NUMBER(8),<br>
    &nbsp&nbsp&nbsp&nbsp PROVIEW &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp NUMBER(8) DEFAULT 0,<br>
    &nbsp&nbsp&nbsp&nbsp DETAIL &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp CLOB,<br>
    &nbsp&nbsp&nbsp&nbsp REGDATE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp DATE DEFAULT SYSDATE,<br>
    &nbsp&nbsp&nbsp&nbsp UPDATE_DATE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp DATE DEFAULT SYSDATE,<br>
    &nbsp&nbsp&nbsp&nbsp PRIMARY KEY(PRONUM)<br>
);<br>
<br>
CREATE TABLE HOSINSA_REVIEW (<br>
    &nbsp&nbsp&nbsp&nbsp BNO &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp NUMBER(10),<br>
    &nbsp&nbsp&nbsp&nbsp ID &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(50),<br>
    &nbsp&nbsp&nbsp&nbsp PW &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(50),<br>
    &nbsp&nbsp&nbsp&nbsp NICKNAME &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(100),<br>
    &nbsp&nbsp&nbsp&nbsp TITLE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(1000),<br>
    &nbsp&nbsp&nbsp&nbsp CONTENT &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(2000),<br>
    &nbsp&nbsp&nbsp&nbsp UPLOADDATE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp DATE DEFAULT SYSDATE<br>
);<br>
CREATE SEQUENCE REVIEWS_SEQ INCREMENT BY 1 START WITH 1;<br>
<br>
CREATE TABLE HOSINSA_BOARD_EVENT(<br>
    &nbsp&nbsp&nbsp&nbsp EVENT_NO &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp NUMBER(10,0),<br>
    &nbsp&nbsp&nbsp&nbsp EVENT_IMG &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(500),<br>
    &nbsp&nbsp&nbsp&nbsp TITLE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(200),<br>
    &nbsp&nbsp&nbsp&nbsp SUBTEXT &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(200),<br>
    &nbsp&nbsp&nbsp&nbsp CONTENT &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(2000),<br>
    &nbsp&nbsp&nbsp&nbsp START_DATE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp DATE,<br>
    &nbsp&nbsp&nbsp&nbsp END_DATE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp DATE,<br>
    &nbsp&nbsp&nbsp&nbsp REGDATE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp DATE DEFAULT SYSDATE,<br>
    &nbsp&nbsp&nbsp&nbsp UPDATE_DATE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp DATE DEFAULT SYSDATE,<br>
    &nbsp&nbsp&nbsp&nbsp WRITER &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(50) NOT NULL,<br>
    &nbsp&nbsp&nbsp&nbsp EVENT_PW &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp VARCHAR2(50) NOT NULL,<br>
    &nbsp&nbsp&nbsp&nbsp PRIMARY KEY(EVENT_NO),<br>
    &nbsp&nbsp&nbsp&nbsp FOREIGN KEY (WRITER) REFERENCES HOSINSA_MEMBER (ID)<br>
);<br>
<br>
CREATE SEQUENCE BOARD_EVENT_SEQ INCREMENT BY 1 START WITH 1;<br>
<br>