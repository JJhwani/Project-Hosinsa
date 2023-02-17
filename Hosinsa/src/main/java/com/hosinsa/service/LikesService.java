package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.LikesVO;

public interface LikesService {
	
	public int register(LikesVO vo);
	public int remove (Long lno);
	public List<LikesVO> getProList(int pronum);
	public List<LikesVO> getMyList(LikesVO vo);
	public Integer getBylnowithUser(LikesVO vo); //중복인지 체크 


}
