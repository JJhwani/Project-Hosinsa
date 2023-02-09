package com.hosinsa.domain;

import java.util.Date;
import lombok.Data;

@Data
public class QnaVO {
	private Long qno;
	private String qcategory;
	private String qtitle;
	private String qcontent;
	private String id;
	private Date qwritedate;
}

