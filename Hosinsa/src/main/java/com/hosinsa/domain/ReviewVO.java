package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
CREATE TABLE HOSINSA_REVIEW(
    BNO           NUMBER(10),
    ID            VARCHAR2(50),
    NICKNAME      VARCHAR2(100),
    PROFILIMG     VARCHAR2(200),
    TITLE         VARCHAR2(1000),
    CONTENT       VARCHAR2(2000),
    PHOTO1        VARCHAR2(500),
    PHOTO2        VARCHAR2(500),
    PHOTO3        VARCHAR2(500),
    UPLOADDATE    DATE ,
    PRONUM        NUMBER(10),
    PRONAME       VARCHAR2(200),
    PROIMG        VARCHAR2(500),
    REREPLY       NUMBER(8) DEFAULT 0,
    PRIMARY KEY(BNO),
    CONSTRAINT FK_REVIEW_ID FOREIGN KEY(ID) REFERENCES HOSINSA_MEMBER(ID) ON DELETE SET NULL,
    CONSTRAINT FK_REVIEW_NICKNAME FOREIGN KEY(NICKNAME) REFERENCES HOSINSA_MEMBER(NICKNAME) ON DELETE SET NULL,
    CONSTRAINT FK_REVIEW_PROFILIMG FOREIGN KEY(PROFILIMG) REFERENCES HOSINSA_MEMBER(PROFILIMG) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_REVIEWS;
 */

@Data
public class ReviewVO {
	
	private Long bno; 
	private String id; //아이디
	private String nickname; // 닉네임
	private String title; //제목
	private String content; //내용
	private String photo1;
	private String photo2;
	private String photo3;
	private String proname; //제품명
	private String proimg; //제품이미지
	private String profilimg; //프로필이미지
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date uploadDate; // 작성날짜
	private int pronum; //품번
	private int rereply; //리리플 수

}
