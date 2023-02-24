package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
CREATE TABLE HOSINSA_BOARD_NOTICE(
    NNO           NUMBER(10,0),
    TITLE         VARCHAR2(200),
    CONTENT       VARCHAR2(2000),
    ID            VARCHAR2(50) NOT NULL,
    REGDATE       DATE DEFAULT SYSDATE,
    UPDATE_DATE   DATE DEFAULT SYSDATE,
    READCOUNT     NUMBER(10,0) DEFAULT 0,
    PRIMARY KEY(NNO),
    CONSTRAINT FK_BOARD_NOTICE_ID FOREIGN KEY(ID) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_BOARD_NOTICE;
*/

@Data
public class BoardNoticeVO extends BoardCriteria{
	private Long nno;
	private String title;
	private String content;
	private String id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date update_date;
	private int readcount; //추가
}
