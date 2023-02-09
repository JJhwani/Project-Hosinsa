package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ProductVO;

public interface MainMapper {
	public List<ProductVO> getListProview();
	public List<ProductVO> getListCategory();
	public List<ProductVO> getListBest();
	public List<ProductVO> getListNew();
	public List<ProductVO> getListWithPaging(Criteria cri);
	public List<ProductVO> getListWithPagingView(Criteria cri);
	public List<ProductVO> getListWithPagingCategory(ProductVO vo);
	public int getTotalCountView(Criteria cri);
	public int getTotalCount(Criteria cri);
	public List<ProductVO> getSortBest();
	public List<ProductVO> getSortNew();
	public List<ProductVO> getSortLowPrice();
	public List<ProductVO> getSortHighPrice();
	public List<ProductVO> getSortReview();
	public ProductVO getProductByPronum(int pronum);
	
}
