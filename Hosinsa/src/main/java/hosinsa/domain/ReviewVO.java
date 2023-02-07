package hosinsa.domain;

import java.util.Date;

import lombok.Data;

//제품 상세 게시판

@Data
public class ReviewVO {
	
	private Long bno; 
	private String id; //아이디
	private String pw; //비번 
	private String nickname; // 닉네임
	private String title; //제목
	private String content; //내용
	private Date uploadDate; // 작성날짜

}
