package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderVO {
	private int o_no; //고유번호
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
}
