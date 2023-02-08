package com.hosinsa.domain;

import lombok.Data;

//CREATE TABLE HOSINSA_Cart(  
//		 CARTNUM NUMBER(20) PRIMARY KEY,    
//		 PRONUM NUMBER(8),
//		 ID VARCHAR(30),    
//		 QUANTITY NUMBER(8),    
//		 PRICE NUMBER(8),    
//		 PRONAME VARCHAR(100),    
//		 SALE VARCHAR(50)    
//		);

@Data
public class CartVO {
	private Long cartnum;
	private Long pronum;
	private String id;
	private Long quantity;
	private Long price;
	private String proname;
	private String sale;
}
