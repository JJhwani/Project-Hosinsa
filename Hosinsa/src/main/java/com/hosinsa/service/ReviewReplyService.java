package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.ReviewReplyVO;

public interface ReviewReplyService {
	
	public int register(ReviewReplyVO vo);
	public ReviewReplyVO get(Long rno);
	public int modify(ReviewReplyVO vo);
	public int remove(Long rno);
	public List<ReviewReplyVO> getList (Long bno);

}
