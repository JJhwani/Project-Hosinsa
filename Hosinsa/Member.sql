CREATE TABLE HOSINSA_MEMBER(
    ID          VARCHAR2(30),
    PW          VARCHAR2(30),
    NAME        VARCHAR2(15),
    GENDER      VARCHAR2(6),
    BIRTHDAY    DATE,
    EMAIL       VARCHAR2(50),
    PHONE       CHAR(13),
    NICKNAME    VARCHAR2(30),
    PROFILIMG   VARCHAR2(100),
    GRADE       CHAR(1),
    INTRODUCER  VARCHAR2(30),
    PRIMARY KEY(ID)
);

CREATE TABLE MEMBER_ADDRESS(
    ADDRESS_NO      NUMBER(30),
    ID              VARCHAR2(30),
    ADDRESS         VARCHAR2(100),
    ZIPCODE         NUMBER(5)
);
alter table MEMBER_ADDRESS add constraint pk_address primary key(address_no);

CREATE SEQUENCE ADDRESS_SEQ INCREMENT BY 1 START WITH 1;

insert into HOSINSA_MEMBER VALUES
('admin','1234','이상호','남자','1995/12/25','sangho@hosinsa.com','010-1111-1111',
'Admin','','S','');
insert into HOSINSA_MEMBER VALUES
('member','1234','이예찬','남자','1998/05/10','pkk65@naver.com','010-5745-7737',
'Chan','','C','');

SELECT * FROM hosinsa_member;
SELECT * FROM member_address;
COMMIT;