package com.hosinsa.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewReplyVO {
		private Long rno;
		private Long bno;
		
		private String reply;
		private String replyer;
		private Date replyDate;
		private Date updateDate;
}
