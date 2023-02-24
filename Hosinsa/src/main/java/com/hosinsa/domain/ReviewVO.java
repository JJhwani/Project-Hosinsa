package com.hosinsa.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

//제품 상세 게시판

@Data
public class ReviewVO {
	
	private Long bno; 
	private String id; //아이디
	private String nickname; // 닉네임
	private String title; //제목
	private String content; //내용
	private String proname; //제품명
	private String proimg; //제품이미지
	private String profilimg; //프로필이미지
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date uploadDate; // 작성날짜
	private int pronum; //품번
	private int rereply; //리리플 수
	private String photo1; //리뷰사진1
	private String photo2; //리뷰사진2
	private String photo3; //리뷰사진3
}
