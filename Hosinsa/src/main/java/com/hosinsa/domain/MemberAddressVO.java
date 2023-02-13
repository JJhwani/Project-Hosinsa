package com.hosinsa.domain;

import lombok.Data;
/*
CREATE TABLE MEMBER_ADDRESS (
    ADDRESS_NO      NUMBER(30),
    ID              VARCHAR2(30),
    ADDRESS         VARCHAR2(100),
    ZIPCODE         NUMBER(5)
); 
*/

@Data
public class MemberAddressVO {
	private long address_no;
	private String id;
	private String address;
	private int zipcode;
}
