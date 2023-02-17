package com.hosinsa.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class BoardCriteria {
	private int b_pageNum;
	private int b_amount;
	private String b_type;
	private String b_keyword;
	//private String category;
	
	public BoardCriteria() {
		this(1,15);
	}
	
	public BoardCriteria(int b_pageNum, int b_amount) {
		this.b_pageNum = b_pageNum;
		this.b_amount = b_amount;
	}
	
	public String[] getTypeArr() {
		return b_type == null ? new String[] {} : b_type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("b_pageNum", this.b_pageNum)
				.queryParam("b_amount", this.getB_amount())
				.queryParam("b_type", this.getB_type())
				.queryParam("b_keyword", this.getB_keyword());
		
		return builder.toUriString();
	}
}
