package com.hosinsa.domain;

import lombok.Data;
/*
CREATE TABLE HOSINSA_MEMBER_ADDRESS(
    ID            VARCHAR2(30) NOT NULL,
    ZIPCODE1      VARCHAR2(200),
    ADDRESS1      NUMBER(6),
    ZIPCODE2      VARCHAR2(200),
    ADDRESS2      NUMBER(6),
    ZIPCODE3      VARCHAR2(200),
    ADDRESS3      NUMBER(6),
    PRIMARY KEY(ID),
    CONSTRAINT FK_HOSINSA_MEMBER_ADDRESS_ID FOREIGN KEY(ID) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL
);
*/

@Data
public class MemberAddressVO {
	private String id;
	private int zipcode1;
	private String address1;
	private int zipcode2;
	private String address2;
	private int zipcode3;
	private String address3;
}
