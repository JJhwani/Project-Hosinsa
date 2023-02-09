package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ProductVO;

public interface MainService {
	public List<ProductVO> getListProview();
	public List<ProductVO> getListCategory();
	public List<ProductVO> getListBast();
	public List<ProductVO> getListNew();
	public int getTotalCount(Criteria cri);
	public List<ProductVO> getSortBest(Criteria cri);
	public List<ProductVO> getSortNew(Criteria cri);
	public List<ProductVO> getSortLowPrice(Criteria cri);
	public List<ProductVO> getSortHighPrice(Criteria cri);
	public List<ProductVO> getSortReview(Criteria cri);
}
