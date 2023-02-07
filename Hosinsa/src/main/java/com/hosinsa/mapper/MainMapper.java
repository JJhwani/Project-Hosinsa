package com.hosinsa.mapper;

import java.util.List;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ProductVO;

public interface MainMapper {
	public List<ProductVO> getListProview();
	public List<ProductVO> getListCategory();
	public List<ProductVO> getListBast();
	public List<ProductVO> getListNew();
	public List<ProductVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public List<ProductVO> getSortBest();
	public List<ProductVO> getSortNew();
	public List<ProductVO> getSortLowPrice();
	public List<ProductVO> getSortHighPrice();
	public List<ProductVO> getSortReview();

	
}
