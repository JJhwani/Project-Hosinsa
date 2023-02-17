package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hosinsa.domain.ReviewReplyVO;
import com.hosinsa.mapper.ReviewMapper;
import com.hosinsa.mapper.ReviewReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewReplyServiceImpl implements ReviewReplyService {
	
	@Autowired
	private ReviewReplyMapper mapper;
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Transactional
	@Override
	public int register(ReviewReplyVO vo) {
		
		log.info("레지스터=========>" + vo);	
		reviewMapper.updateReplyCount(vo.getBno(), 1);
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
	
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove=========>" + rno);
		reviewMapper.updateReplyCount(mapper.read(rno).getBno(),-1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReviewReplyVO> getList(Long bno) {
		log.info("댓글list of 게시판=========>" + bno);
		return mapper.getList(bno);
	}

}
