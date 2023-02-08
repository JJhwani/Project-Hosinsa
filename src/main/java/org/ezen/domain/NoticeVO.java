package org.ezen.domain;

import java.util.Date;

/*create table hosinsa_notice(
noticenum number(30),
ntitle varchar2(300) not null,
ncontent varchar2(3000) not null,
id varchar2(30) not null,
nwritedate date default sysdate,
nupdatedate date default sysdate,
nreadcount number(8),
PRIMARY key(noticenum)
);*/
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
