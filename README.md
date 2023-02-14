# Project-Hosinsa
<br>
TABLE
<br>
CREATE TABLE HOSINSA_PRODUCT(<br>
    CATEGORY &nbsp&nbsp&nbsp      VARCHAR2(20),<br>
    PRONAME &nbsp&nbsp&nbsp      VARCHAR2(200),<br>
    PROIMG &nbsp&nbsp&nbsp      VARCHAR2(500),<br>
    BRAND &nbsp&nbsp&nbsp        VARCHAR2(50),<br>
    PRONUM &nbsp&nbsp&nbsp       NUMBER(8),<br>
    PRICE &nbsp&nbsp&nbsp       NUMBER(8),<br>
    STOCK &nbsp&nbsp&nbsp        NUMBER(8),<br>
    PROVIEW &nbsp&nbsp&nbsp      NUMBER(8) DEFAULT 0,<br>
    DETAIL &nbsp&nbsp&nbsp       CLOB,<br>
    REGDATE &nbsp&nbsp&nbsp      DATE DEFAULT SYSDATE,<br>
    UPDATE_DATE &nbsp&nbsp&nbsp  DATE DEFAULT SYSDATE,<br>
    PRIMARY KEY(PRONUM)<br>
);<br>
<br>
CREATE TABLE HOSINSA_REVIEW (<br>
    BNO &nbsp&nbsp&nbsp        NUMBER(10),<br>
    ID &nbsp&nbsp&nbsp         VARCHAR2(50),<br>
    PW &nbsp&nbsp&nbsp         VARCHAR2(50),<br>
    NICKNAME &nbsp&nbsp&nbsp   VARCHAR2(100),<br>
    TITLE &nbsp&nbsp&nbsp      VARCHAR2(1000),<br>
    CONTENT &nbsp&nbsp&nbsp    VARCHAR2(2000),<br>
    UPLOADDATE  DATE DEFAULT SYSDATE<br>
);<br>



