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
	public List<ProductVO> getListProview(ProductVO vo) {
		return mapper.getListWithPagingView(vo);
	}

	@Override
	public List<ProductVO> getListCategory(ProductVO vo) {
		return mapper.getListWithPagingCategory(vo);
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
	public List<ProductVO> getListBestCategory(ProductVO vo) {
		return mapper.getListBestCategory(vo);
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
	public int getTotalCountSearch(Criteria cri) {
		return mapper.getTotalCountSearch(cri);
	}
	
	@Override
	public List<ProductVO> getSortBestMain(ProductVO vo) {
		return mapper.getSortBestMain(vo);
	}

	@Override
	public List<ProductVO> getSortNewMain(ProductVO vo) {
		return mapper.getSortNewMain(vo);
	}

	@Override
	public List<ProductVO> getSortLowPriceMain(ProductVO vo) {
		return mapper.getSortLowPriceMain(vo);
	}

	@Override
	public List<ProductVO> getSortHighPriceMain(ProductVO vo) {
		return mapper.getSortHighPriceMain(vo);
	}

	@Override
	public List<ProductVO> getSortReviewMain(ProductVO vo) {
		return mapper.getSortReviewMain(vo);
	}
	
	@Override
	public List<ProductVO> getSortBest(ProductVO vo) {
		return mapper.getSortBest(vo);
	}

	@Override
	public List<ProductVO> getSortNew(ProductVO vo) {
		return mapper.getSortNew(vo);
	}

	@Override
	public List<ProductVO> getSortLowPrice(ProductVO vo) {
		return mapper.getSortLowPrice(vo);
	}

	@Override
	public List<ProductVO> getSortHighPrice(ProductVO vo) {
		return mapper.getSortHighPrice(vo);
	}

	@Override
	public List<ProductVO> getSortReview(ProductVO vo) {
		return mapper.getSortReview(vo);
	}

	@Override
	public List<ProductVO> getSearchProduct(ProductVO vo) {
		return mapper.getSearchProduct(vo);
	}
	
	@Override
	public List<ProductVO> getSortBestSearch(ProductVO vo) {
		return mapper.getSortBestSearch(vo);
	}

	@Override
	public List<ProductVO> getSortNewSearch(ProductVO vo) {
		return mapper.getSortNewSearch(vo);
	}

	@Override
	public List<ProductVO> getSortLowPriceSearch(ProductVO vo) {
		return mapper.getSortLowPriceSearch(vo);
	}

	@Override
	public List<ProductVO> getSortHighPriceSearch(ProductVO vo) {
		return mapper.getSortHighPriceSearch(vo);
	}

	@Override
	public List<ProductVO> getSortReviewSearch(ProductVO vo) {
		return mapper.getSortReviewSearch(vo);
	}

	@Override
	public ProductVO getProductByPronum(int pronum) {
		return mapper.getProductByPronum(pronum);
	}

	
}
