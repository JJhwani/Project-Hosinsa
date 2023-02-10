package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ProductVO;

public interface MainMapper {
	public List<ProductVO> getListProview();							// 전체 제품 출력
	public List<ProductVO> getListCategory();							// 카테고리별 리스트 출력
	public List<ProductVO> getListBest();								// Main 페이지 Best제품 출력
	public List<ProductVO> getListNew();								// Main 페이지 신규제품 출력
	public List<ProductVO> getListBestCategory(ProductVO vo);			// Category 페이지 Best제품 출력
	
	public List<ProductVO> getListWithPaging(ProductVO vo);				// 페이징
	public List<ProductVO> getListWithPagingView(ProductVO vo);			// 카테고리 인기 페이징
	public List<ProductVO> getListWithPagingCategory(ProductVO vo);		// 카테고리 별 페이징
	public int getTotalCountView(Criteria cri);							// 제품 전체수
	public int getTotalCount(Criteria cri);								// 카테고리 별 제품 전체수
	public int getTotalCountSearch(Criteria cri);						// 검색 제품 전체수
	
	public List<ProductVO> getSortBestMain(ProductVO vo);				// Main 페이지 인기순 소팅
	public List<ProductVO> getSortNewMain(ProductVO vo);				// Main 페이지 신규순 소팅
	public List<ProductVO> getSortLowPriceMain(ProductVO vo);			// Main 페이지 낮은가격순 소팅
	public List<ProductVO> getSortHighPriceMain(ProductVO vo);			// Main 페이지 높은가격순 소팅
	public List<ProductVO> getSortReviewMain(ProductVO vo);				// Main 페이지 리뷰순 소팅
	
	public List<ProductVO> getSortBest(ProductVO vo);					// Category 페이지 인기순 소팅
	public List<ProductVO> getSortNew(ProductVO vo);					// Category 페이지 신규순 소팅
	public List<ProductVO> getSortLowPrice(ProductVO vo);				// Category 페이지 낮은가격순 소팅
	public List<ProductVO> getSortHighPrice(ProductVO vo);				// Category 페이지 높은가격순 소팅
	public List<ProductVO> getSortReview(ProductVO vo);					// Category 페이지 리뷰순 소팅
	
	public List<ProductVO> getSearchProduct(ProductVO vo);				// Header 페이지 제품 검색
	public List<ProductVO> getSortBestSearch(ProductVO vo);				// Category 페이지 인기순 소팅
	public List<ProductVO> getSortNewSearch(ProductVO vo);				// Category 페이지 신규순 소팅
	public List<ProductVO> getSortLowPriceSearch(ProductVO vo);			// Category 페이지 낮은가격순 소팅
	public List<ProductVO> getSortHighPriceSearch(ProductVO vo);		// Category 페이지 높은가격순 소팅
	public List<ProductVO> getSortReviewSearch(ProductVO vo);			// Category 페이지 리뷰순 소팅
	
	public ProductVO getProductByPronum(int pronum);
	
}
