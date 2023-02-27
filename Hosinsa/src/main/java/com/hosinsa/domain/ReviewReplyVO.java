package com.hosinsa.domain;

import java.util.Date;

import lombok.Data;

/*
CREATE TABLE HOSINSA_REVIEWREPLY(
    RNO           NUMBER(10),
    BNO           NUMBER(10),
    REPLY         VARCHAR2(1000) NOT NULL,
    REPLYER       VARCHAR2(50) NOT NULL,
    ID            VARCHAR2(30),
    REPLYDATE     DATE,
    UPDATEDATE    DATE,
    PRIMARY KEY(RNO),
    CONSTRAINT FK_REVIEWREPLY_ID FOREIGN KEY(ID) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL,
    CONSTRAINT FK_REVIEWREPLY_BNO FOREIGN KEY(BNO) REFERENCES HOSINSA_REVIEW(BNO) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_REVIEWREPLY;
 */

@Data
public class ReviewReplyVO {
		private Long rno;
		private Long bno;		
		private String reply;
		private String replyer;
		private String id;
		private Date replyDate;
		private Date updateDate;
}
