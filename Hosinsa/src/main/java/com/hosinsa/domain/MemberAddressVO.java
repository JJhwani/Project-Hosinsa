package com.hosinsa.domain;

import lombok.Data;
/*
CREATE TABLE HOSINSA_MEMBER_ADDRESS(
    ADDRESS_NO    NUMBER(10,0) NOT NULL,
    ID            VARCHAR2(30) NOT NULL,
    ZIPCODE       NUMBER(5),
    ADDRESS       VARCHAR2(200),
    PRIMARY KEY(ADDRESS_NO),
    CONSTRAINT FK_HOSINSA_MEMBER_ADDRESS_ID FOREIGN KEY(ID) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL
);
*/

@Data
public class MemberAddressVO {
	private Long address_no;
	private String id;
	private int zipcode;
	private String address;
}
