package com.hosinsa.domain;

import lombok.Data;

/*CREATE TABLE HOSINSA_PRODUCT(
	    CATEGORY      VARCHAR2(20),
	    PRONAME       VARCHAR2(200),
	    PROIMG        VARCHAR2(500),
	    BRAND         VARCHAR2(50),
	    PRONUM        NUMBER(8),
	    PRICE         NUMBER(8),
	    STOCK         NUMBER(8),
	    PROVIEW       NUMBER(8) DEFAULT 0,
	    DETAIL        VARCHAR2(1000),
	    PRIMARY KEY(PRONUM)
);*/

@Data
public class ProductVO {
	private String category; //카테고리 
	private String proname; //제품명
	private String proimg; //제품이미지
	private String brand; //브랜드
	private int pronum; //품번
	private int price; //가격
	private int stock; //재고
	private int proview; //조회수
	private String detail; //상품설명
}
