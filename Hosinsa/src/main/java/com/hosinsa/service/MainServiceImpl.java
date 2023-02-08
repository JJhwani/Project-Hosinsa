package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	MainMapper mapper;

	@Override
	public List<ProductVO> getListProview() {
		return mapper.getListProview();
	}

	@Override
	public List<ProductVO> getListCategory() {
		return mapper.getListCategory();
	}

	@Override
	public List<ProductVO> getListBast() {
		return mapper.getListBast();
	}

	@Override
	public List<ProductVO> getListNew() {
		return mapper.getListNew();
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

}
