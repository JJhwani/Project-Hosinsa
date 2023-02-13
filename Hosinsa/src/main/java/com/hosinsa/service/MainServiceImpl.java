package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.mapper.MainMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MainServiceImpl implements MainService{
	
	@Autowired
	MainMapper mapper;

	@Override
	public List<ProductVO> getListProview(Criteria cri) {
		return mapper.getListWithPagingView(cri);
	}

	@Override
	public List<ProductVO> getListCategory(Criteria cri) {
		return mapper.getListWithPagingCategory(cri);
	}

	@Override
	public List<ProductVO> getListBest() {
		return mapper.getListBest();
	}

	@Override
	public List<ProductVO> getListNew() {
		return mapper.getListNew();
	}

	@Override
	public int getTotalCountView(Criteria cri) {
		return mapper.getTotalCountView(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ProductVO> getSortBest(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<ProductVO> getSortNew(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<ProductVO> getSortLowPrice(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<ProductVO> getSortHighPrice(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<ProductVO> getSortReview(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public ProductVO getProductByPronum(int pronum) {
		return mapper.getProductByPronum(pronum);
	}

}
