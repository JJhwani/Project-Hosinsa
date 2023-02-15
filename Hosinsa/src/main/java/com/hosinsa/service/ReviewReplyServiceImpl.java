package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.ReviewCriteria;
import com.hosinsa.domain.ReviewReplyPageDTO;
import com.hosinsa.domain.ReviewReplyVO;
import com.hosinsa.mapper.ReviewReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewReplyServiceImpl implements ReviewReplyService {
	
	@Autowired
	private ReviewReplyMapper mapper;

	@Override
	public int register(ReviewReplyVO vo) {
		
		log.info("레지스터=========>" + vo);
		
		return mapper.insert(vo);
	}

	@Override
	public ReviewReplyVO get(Long rno) {
		log.info("get=========>" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReviewReplyVO vo) {
		log.info("modify=========>" + vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove=========>" + rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReviewReplyVO> getList(ReviewCriteria cri, Long bno) {
		log.info("댓글list of 게시판=========>" + bno);
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReviewReplyPageDTO getListPage(ReviewCriteria cri, Long bno) {
		return new ReviewReplyPageDTO (
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
		
	}

}
