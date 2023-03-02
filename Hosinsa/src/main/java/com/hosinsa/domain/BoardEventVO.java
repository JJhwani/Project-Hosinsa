package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
CREATE TABLE HOSINSA_BOARD_EVENT(
    EVENT_NO      NUMBER(10,0),
    EVENT_IMG     VARCHAR2(500),
    TITLE         VARCHAR2(200),
    SUBTEXT       VARCHAR2(200),
    CONTENT       VARCHAR2(2000),    
    START_DATE    DATE,
    END_DATE      DATE,
    REGDATE       DATE DEFAULT SYSDATE,
    UPDATE_DATE   DATE DEFAULT SYSDATE,
    WRITER        VARCHAR2(50) NOT NULL,
    EVENT_PW      VARCHAR2(50) NOT NULL,
    PRIMARY KEY(EVENT_NO),
    CONSTRAINT FK_BOARD_EVENT_ID FOREIGN KEY(WRITER) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_BOARD_EVENT;
*/

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
