package com.hosinsa.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardEventVO {
	private Long event_no;
	private String event_img;
	private String title;
	private String content;
	private String subtext;
	private Date start_date;
	private Date end_date;
	private Date regdate;
	private Date update_date;
	private String writer;
	private String event_pw;
}
