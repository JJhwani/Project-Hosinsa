package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
CREATE TABLE HOSINSA_ORDER(
    ORDERNUM      NUMBER(20), 
    PRONUM        NUMBER(8),
    QUANTITY      NUMBER(8),
    PRICE         NUMBER(8),
    PRONAME       VARCHAR2(200),
    SALE          VARCHAR2(50),
    NAME          VARCHAR2(15),
    ADDRESS       VARCHAR2(100),
    REQUEST       VARCHAR2(100),
    PHONE         CHAR(13),
    ID            VARCHAR2(30),
    ORDER_DATE    DATE DEFAULT SYSDATE,
    DELIVERY      VARCHAR2(100),
    TRACKINGNUM   VARCHAR(50),
    REASON        VARCHAR2(100),
    PRIMARY KEY(O_NO),
    CONSTRAINT FK_ORDER_ID FOREIGN KEY(ID) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL,
    CONSTRAINT FK_ORDER_PRONUM FOREIGN KEY(PRONUM) REFERENCES HOSINSA_PRODUCT(PRONUM) ON DELETE SET NULL    
);

CREATE SEQUENCE SEQ_ORDER;
 */

@Data
public class OrderVO {
	private long ordernum; //주문번호
	private int pronum; //상품번호
	private int quantity; //상품개수
	private int price; //가격
	private String proname; //상품이름
	private String sale; //할인
	private String name; //이름
	private String address; //주소
	private String request; //배송요청사항
	private String phone; //연락처
	private String id; //아이디
	private String process; //배송상태
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date order_date; //주문날짜
	private String delivery; //택배사
	private String trackingNum; //운송장번호
	private String reason; //주문취소사유
}
