package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PreReviewVO {
	private String id;
	private int ordernum;
	private int pronum;
	private String proimg;
	private String brand;
	private String proname;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date expiredate;
}
