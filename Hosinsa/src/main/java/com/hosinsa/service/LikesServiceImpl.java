package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hosinsa.domain.LikesVO;
import com.hosinsa.mapper.LikesMapper;
import com.hosinsa.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LikesServiceImpl implements LikesService {
	
	@Autowired
	private LikesMapper mapper;
	
	@Override
	public int register(LikesVO vo) {
		
		log.info("Likes=======>" + vo);
		
		return mapper.insert(vo);
		
	}

	@Override
	public List<LikesVO> getBylnowithUser(Long lno) {
		
		log.info("Likes=======>" + lno);
		
		return mapper.getBylnowithUser(lno);
	}

	@Override
	public int remove(Long lno) {
		
		log.info("prolist=======>" + lno);
		
		return mapper.delete(lno);
	}


	@Override
	public List<LikesVO> getProList(int pronum) {
		log.info("prolist=======>" + pronum);
		
		return mapper.getProList(pronum);
	}


	@Override
	public List<LikesVO> getMyList(LikesVO vo) {
		log.info("prolist=======>" + vo);
		return mapper.getMyList(vo);
	}
}	