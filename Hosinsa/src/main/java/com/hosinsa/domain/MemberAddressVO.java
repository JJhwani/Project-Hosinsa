package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
/*
CREATE TABLE HOSINSA_MEMBER_ADDRESS(
    ADDRESS_NO    NUMBER(10,0) NOT NULL,
    ID            VARCHAR2(30) NOT NULL,
    RECIPIENT     VARCHAR2(50),
    SHIPPING      VARCHAR2(50),
    PHONE         CHAR(13),
    TEL           CHAR(13),
    ZIPCODE       NUMBER(5),
    ADDRESS       VARCHAR2(200),
    BASIC         CHAR(1),
    REGDATE       DATE DEFAULT SYSDATE,
    UPDATE_DATE   DATE DEFAULT SYSDATE,
    PRIMARY KEY(ADDRESS_NO),
    CONSTRAINT FK_HOSINSA_MEMBER_ADDRESS_ID FOREIGN KEY(ID) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_MEMBER_ADDRESS;
*/

@Data
public class MemberAddressVO extends BoardCriteria{
	private Long address_no;
	private String id;
	private String recipient;
	private String shipping;
	private String phone;
	private String tel;
	private int zipcode;
	private String address1;
	private String address2;
	private String basic;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date update_date;
}
