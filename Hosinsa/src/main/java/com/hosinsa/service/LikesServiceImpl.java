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
		
		return mapper.insertSelectKey(vo);
		
	}

	@Override
	public int remove(LikesVO vo) {
		
		log.info("prolist=======>" + vo);
		
		return mapper.delete(vo);
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

	@Override
	public int likesCheck(String id, int pronum) {
		//1이면 true 0이면 false
		return mapper.getLikesCheck(id, pronum);
	}

}	