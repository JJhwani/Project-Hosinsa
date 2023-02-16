package com.hosinsa.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class BoardCriteria {
	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
	//private String category;
	
	public BoardCriteria() {
		this(1,15);
	}
	
	public BoardCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
}
