package com.hosinsa.domain;

import lombok.Data;
import lombok.Getter;

/*
 CREATE TABLE HOSINSA_LIKES(
    LNO           NUMBER(10),
    PRONUM        NUMBER(8),
    ID            VARCHAR2(30),
    PRIMARY KEY(LNO),
    CONSTRAINT FK_LIKES_ID FOREIGN KEY(ID) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL,
    CONSTRAINT FK_LIKES_PRONUM FOREIGN KEY(PRONUM) REFERENCES HOSINSA_PRODUCT(PRONUM) ON DELETE SET NULL
);
 */

@Data
public class LikesVO {	
	private Long lno;
	private int pronum;
	private String id;

}
