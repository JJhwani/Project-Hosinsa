package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.PreReviewVO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.domain.ReviewCriteria;
import com.hosinsa.domain.ReviewVO;
import com.hosinsa.mapper.MainMapper;
import com.hosinsa.mapper.MemberMapper;
import com.hosinsa.mapper.ReviewMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewMapper mapper;
	
	@Autowired
	private MainMapper mainMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Transactional
	@Override
	public void regiseter(ReviewVO vo) { 
		
		MemberVO member = memberMapper.read(vo.getId());
		vo.setNickname(member.getNickname());
		vo.setProfilimg(member.getProfilimg());
		
		ProductVO product = mainMapper.getProductByPronum(vo.getPronum());
		vo.setProname(product.getProname());
		vo.setProimg(product.getProimg());
		
		mapper.updateReviewCount(vo.getPronum(),1);
		
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
	
	@Transactional
	@Override
	public boolean remove(Long bno) {
		
		log.info("삭제===============>" + bno);
		ReviewVO vo = mapper.read(bno);
		mapper.updateReviewCount(vo.getPronum(),-1);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<ReviewVO> getList(Integer pronum, ReviewCriteria cri) { 
		log.info("리스트================" + cri);
		return mapper.getListWithPaging(pronum,cri);
	}

	@Override
	public int getTotal(ReviewCriteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public ProductVO getProduct(int pronum) {
		return mainMapper.getProductByPronum(pronum);
	}

	@Override
	public void deletePre(PreReviewVO vo) {
		mapper.deletePre(vo);		
	}


}
