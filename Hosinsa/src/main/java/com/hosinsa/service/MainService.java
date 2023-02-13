package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ProductVO;

public interface MainService {
	public List<ProductVO> getListProview(Criteria cri);
	public List<ProductVO> getListCategory(Criteria cri);
	public List<ProductVO> getListBest();
	public List<ProductVO> getListNew();
	public int getTotalCountView(Criteria cri);
	public int getTotalCount(Criteria cri);
	public List<ProductVO> getSortBest(Criteria cri);
	public List<ProductVO> getSortNew(Criteria cri);
	public List<ProductVO> getSortLowPrice(Criteria cri);
	public List<ProductVO> getSortHighPrice(Criteria cri);
	public List<ProductVO> getSortReview(Criteria cri);
	public ProductVO getProductByPronum(int pronum);
	public void updateView(int pronum);
}
