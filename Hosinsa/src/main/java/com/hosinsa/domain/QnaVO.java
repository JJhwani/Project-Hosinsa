package com.hosinsa.domain;

import java.util.Date;
import lombok.Data;

@Data
public class QnaVO {
	private Long qno;
	private String category;
	private String title;
	private String content;
	private String id;
	private Date regdate;
	private int replyCnt;
}

