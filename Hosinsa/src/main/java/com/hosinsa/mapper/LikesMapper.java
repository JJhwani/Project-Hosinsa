package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hosinsa.domain.LikesVO;


public interface LikesMapper {
	public int insert(LikesVO vo); // 찜하기 추가
	public void insertSelectKey(LikesVO vo);
	public int delete(Long lno); //찜 1개 삭제
	public List<LikesVO> getBylnowithUser(Long lno); //이미 찜한 게시물인지 확인
	public List<LikesVO> getProList(int pronum); //상품페이지 찜목록
	public List<LikesVO> getMyList(LikesVO vo); //마이페이지 찜목록
	

}
