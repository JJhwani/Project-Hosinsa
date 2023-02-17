package com.hosinsa.domain;

import lombok.Data;

/*CREATE TABLE HOSINSA_CART(
	    CARTNUM       NUMBER(20),
	    PROIMG        VARCHAR2(500),
	    PRONUM        NUMBER(8),
	    ID            VARCHAR2(30),
	    QUANTITY      NUMBER(8),
	    PRICE         NUMBER(8),
	    PRONAME       VARCHAR2(200),
	    PRIMARY KEY(CARTNUM),
	    CONSTRAINT FK_CART_ID FOREIGN KEY(ID) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL,
	    CONSTRAINT FK_CART_PRONUM FOREIGN KEY(PRONUM) REFERENCES HOSINSA_PRODUCT(PRONUM) ON DELETE SET NULL
	);

	CREATE SEQUENCE SEQ_CART INCREMENT BY 1 START WITH 1;*/

@Data
public class CartVO {
	private Long cartnum;
	private String proimg;
	private Long pronum;
	private String id;
	private Long quantity;
	private Long price;
	private String proname;
}
