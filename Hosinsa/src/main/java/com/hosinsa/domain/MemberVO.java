package com.hosinsa.domain;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
CREATE TABLE HOSINSA_MEMBER(
    ID            VARCHAR2(30) NOT NULL,
    PW            VARCHAR2(30),
    NAME          VARCHAR2(15 CHAR),
    GENDER        VARCHAR2(6 CHAR),
    BIRTHDAY      DATE,
    EMAIL         VARCHAR2(50),
    PHONE         CHAR(13),
    NICKNAME      VARCHAR2(15 CHAR),
    PROFILIMG     VARCHAR2(200),
    GRADE         CHAR(1),
    INTRODUCER    VARCHAR2(30),
    POINT         NUMBER(10),
    PRIMARY KEY(ID),
    CONSTRAINT UQ_MEMBER_PROFILIMG UNIQUE(PROFILIMG),
    CONSTRAINT UQ_MEMBER_NICKNAME UNIQUE(NICKNAME)
);
*/

@Data
public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String gender;	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;	
	private String email;
	private String phone;
	private String nickname;
	private String profilimg;
	private String grade;
	private String introducer;
	private int point;
	
//	private String snsid;
}
