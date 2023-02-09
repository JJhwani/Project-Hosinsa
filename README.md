# Project-Hosinsa
<br>
TABLE
<br>
CREATE TABLE HOSINSA_PRODUCT(<br>
    &nbsp&nbsp CATEGORY &nbsp&nbsp&nbsp&nbsp&nbsp       VARCHAR2(20),<br>
    &nbsp&nbsp PRONAME &nbsp&nbsp&nbsp&nbsp&nbsp       VARCHAR2(200),<br>
    &nbsp&nbsp PROIMG &nbsp&nbsp&nbsp&nbsp&nbsp       VARCHAR2(500),<br>
    &nbsp&nbsp BRAND &nbsp&nbsp&nbsp&nbsp&nbsp         VARCHAR2(50),<br>
    &nbsp&nbsp PRONUM &nbsp&nbsp&nbsp&nbsp&nbsp        NUMBER(8),<br>
    &nbsp&nbsp PRICE &nbsp&nbsp&nbsp&nbsp&nbsp        NUMBER(8),<br>
    &nbsp&nbsp STOCK &nbsp&nbsp&nbsp&nbsp&nbsp         NUMBER(8),<br>
    &nbsp&nbsp PROVIEW &nbsp&nbsp&nbsp&nbsp&nbsp       NUMBER(8) DEFAULT 0,<br>
    &nbsp&nbsp DETAIL &nbsp&nbsp&nbsp&nbsp&nbsp        CLOB,<br>
    &nbsp&nbsp REGDATE &nbsp&nbsp&nbsp&nbsp&nbsp       DATE DEFAULT SYSDATE,<br>
    &nbsp&nbsp UPDATE_DATE &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp DATE DEFAULT SYSDATE,<br>
    &nbsp&nbsp PRIMARY KEY(PRONUM)<br>
);<br>
<br>
CREATE TABLE HOSINSA_REVIEW (<br>
    &nbsp&nbsp BNO &nbsp&nbsp&nbsp        NUMBER(10),<br>
    &nbsp&nbsp ID &nbsp&nbsp&nbsp         VARCHAR2(50),<br>
    &nbsp&nbsp PW &nbsp&nbsp&nbsp         VARCHAR2(50),<br>
    &nbsp&nbsp NICKNAME &nbsp&nbsp&nbsp   VARCHAR2(100),<br>
    &nbsp&nbsp TITLE &nbsp&nbsp&nbsp      VARCHAR2(1000),<br>
    &nbsp&nbsp CONTENT &nbsp&nbsp&nbsp    VARCHAR2(2000),<br>
    &nbsp&nbsp UPLOADDATE  DATE DEFAULT SYSDATE<br>
);<br>

