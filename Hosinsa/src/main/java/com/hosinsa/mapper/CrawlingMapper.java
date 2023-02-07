package com.hosinsa.mapper;

import java.util.List;

import com.hosinsa.domain.ProductVO;

public interface CrawlingMapper {
	public int crawling(List<ProductVO> list);
}
