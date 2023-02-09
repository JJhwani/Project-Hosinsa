package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.ReviewCriteria;
import com.hosinsa.domain.ReviewVO;



public interface ReviewService {
	
	public void regiseter(ReviewVO vo);
	public ReviewVO get(Long bno);
	public boolean modify(ReviewVO vo);
	public boolean remove(Long bno);
	public List<ReviewVO> getList(ReviewCriteria cri);
	public int getTotal(ReviewCriteria cri);

}
