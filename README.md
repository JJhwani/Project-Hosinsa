# Project-Hosinsa
<br>
TABLE
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
    &nbsp&nbsp&nbsp&nbsp BNO &nbsp&nbsp&nbsp        NUMBER(10),<br>
    &nbsp&nbsp&nbsp&nbsp ID &nbsp&nbsp&nbsp         VARCHAR2(50),<br>
    &nbsp&nbsp&nbsp&nbsp PW &nbsp&nbsp&nbsp         VARCHAR2(50),<br>
    &nbsp&nbsp&nbsp&nbsp NICKNAME &nbsp&nbsp&nbsp   VARCHAR2(100),<br>
    &nbsp&nbsp&nbsp&nbsp TITLE &nbsp&nbsp&nbsp      VARCHAR2(1000),<br>
    &nbsp&nbsp&nbsp&nbsp CONTENT &nbsp&nbsp&nbsp    VARCHAR2(2000),<br>
    &nbsp&nbsp&nbsp&nbsp UPLOADDATE  DATE DEFAULT SYSDATE<br>
);<br>

