package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class QnaVO {
	private Long qno;
	private String category;
	private String title;
	private String content;
	private String id;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private int replyCnt;
	private String photo1; //리뷰사진1
	private String photo2; //리뷰사진2
	private String photo3; //리뷰사진3
	
}
