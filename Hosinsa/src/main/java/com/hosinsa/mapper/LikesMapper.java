package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hosinsa.domain.LikesVO;


public interface LikesMapper {
	int getLikesCheck
			(@Param(value = "id") String id,
			@Param(value = "pronum") int pronum); 
	public int insert(LikesVO vo); // 찜하기 추가
	public int insertSelectKey(LikesVO vo);
	public int delete(LikesVO vo); //찜 1개 삭제
	public int getBylnowithUser(LikesVO vo); //이미 찜한 게시물인지 확인
	public List<LikesVO> getProList(int pronum); //상품페이지 찜목록
	public List<LikesVO> getMyList(LikesVO vo); //마이페이지 찜목록
	public int getLikesTotal(String id); //찜 총 갯수 세기

}
