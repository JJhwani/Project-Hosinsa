package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.ReviewCriteria;
import com.hosinsa.domain.ReviewVO;
import com.hosinsa.mapper.ReviewMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public void regiseter(ReviewVO vo) { 
		
		log.info("등록==============>"+ vo);
		
		mapper.insertSelectKey(vo); 
		
	}

	@Override
	public ReviewVO get(Long bno) { //게시물의 번호는 파라미터이고, ReviewVO의 인스턴스가 리턴됨
		
		log.info("get==================>" + bno);
		
		return mapper.read(bno);
	}
	
	
	@Override
	public boolean modify(ReviewVO vo) { 
		
		log.info("수정===============>" + vo);
		
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		
		log.info("삭제===============>" + bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<ReviewVO> getList(ReviewCriteria cri) { 
		log.info("리스트================" + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(ReviewCriteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}


}
