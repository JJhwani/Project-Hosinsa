package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.LikesVO;

public interface LikesService {
	
	public int register(LikesVO vo);
	public int remove (LikesVO vo);
	public List<LikesVO> getProList(int pronum);
	public List<LikesVO> getMyList(LikesVO vo);
	public int likesCheck(String id, int pronum);


}
