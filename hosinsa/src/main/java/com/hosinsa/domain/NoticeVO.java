package com.hosinsa.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private Long nno;
	private String ntitle;
	private String ncontent;
	private String id;
	private Date nwritedate;
	private Date nupdatedate;
}
