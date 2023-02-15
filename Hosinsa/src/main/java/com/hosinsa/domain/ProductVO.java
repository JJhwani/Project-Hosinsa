package com.hosinsa.domain;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

/*CREATE TABLE HOSINSA_PRODUCT(
	    CATEGORY      VARCHAR2(20),
	    PRONAME       VARCHAR2(200),
	    PROIMG        VARCHAR2(500),
	    BRAND         VARCHAR2(50),
	    PRONUM        NUMBER(8),
	    PRICE         NUMBER(8),
	    STOCK         NUMBER(8),
	    PROVIEW       NUMBER(8) DEFAULT 0,
	    DETAIL        CLOB,
        REGDATE       DATE DEFAULT SYSDATE,
        UPDATE_DATE   DATE DEFAULT SYSDATE,
	    PRIMARY KEY(PRONUM)
);*/

@Data
@EqualsAndHashCode(callSuper=false)
public class ProductVO extends Criteria{
	private String category; //카테고리 
	private String proname; //제품명
	private String proimg; //제품이미지
	private String brand; //브랜드
	private int pronum; //품번
	private int price; //가격
	private int stock; //재고
	private int proview; //조회수
	private String detail; //상품설명
	private Date regdate; //상품등록일
	private Date update_date; //상품수정일
}
