package com.hosinsa.mapper;

import java.util.List;

import com.hosinsa.domain.ReviewReplyVO;

public interface ReviewReplyMapper {
	
	public int insert (ReviewReplyVO vo); 
	public ReviewReplyVO read(Long rno);
	public int delete (Long rno);
	public int update (ReviewReplyVO vo); 
	public List<ReviewReplyVO> getList (Long bno);
	public int getCountByBno(Long bno);

}
