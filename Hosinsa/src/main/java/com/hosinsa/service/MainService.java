package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ProductVO;

public interface MainService {
	public List<ProductVO> getListProview(ProductVO vo);
	public List<ProductVO> getListCategory(ProductVO vo);
	public List<ProductVO> getListBest();
	public List<ProductVO> getListNew();
	public int getTotalCountView(Criteria cri);
	public int getTotalCount(Criteria cri);
	public List<ProductVO> getSortBestMain(ProductVO vo);
	public List<ProductVO> getSortNewMain(ProductVO vo);
	public List<ProductVO> getSortLowPriceMain(ProductVO vo);
	public List<ProductVO> getSortHighPriceMain(ProductVO vo);
	public List<ProductVO> getSortReviewMain(ProductVO vo);
	public List<ProductVO> getSortBest(ProductVO vo);
	public List<ProductVO> getSortNew(ProductVO vo);
	public List<ProductVO> getSortLowPrice(ProductVO vo);
	public List<ProductVO> getSortHighPrice(ProductVO vo);
	public List<ProductVO> getSortReview(ProductVO vo);
	public ProductVO getProductByPronum(int pronum);
	public void setRecentView(int pronum);
}
