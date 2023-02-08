# Project-Hosinsa
<br>
TABLE
<br>
CREATE TABLE HOSINSA_PRODUCT(<br>
    CATEGORY      VARCHAR2(20),<br>
    PRONAME       VARCHAR2(200),<br>
    PROIMG        VARCHAR2(500),<br>
    BRAND         VARCHAR2(50),<br>
    PRONUM        NUMBER(8),<br>
    PRICE         NUMBER(8),<br>
    STOCK         NUMBER(8),<br>
    PROVIEW       NUMBER(8) DEFAULT 0,<br>
    DETAIL        CLOB,<br>
    REGDATE       DATE DEFAULT SYSDATE,<br>
    UPDATE_DATE   DATE DEFAULT SYSDATE,<br>
    PRIMARY KEY(PRONUM)<br>
);<br>
<br>
CREATE TABLE HOSINSA_REVIEW (<br>
    BNO         NUMBER(10),<br>
    ID          VARCHAR2(50),<br>
    PW          VARCHAR2(50),<br>
    NICKNAME    VARCHAR2(100),<br>
    TITLE       VARCHAR2(1000),<br>
    CONTENT     VARCHAR2(2000),<br>
    UPLOADDATE  DATE DEFAULT SYSDATE<br>
);<br>

