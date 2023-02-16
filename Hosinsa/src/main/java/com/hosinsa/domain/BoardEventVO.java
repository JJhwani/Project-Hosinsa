package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardEventVO {
	private Long event_no;
	private String event_img;
	private String title;
	private String subtext;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date end_date;
	private Date regdate;
	private Date update_date;
	private String writer;
	private String event_pw;
}
