package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.ProductVO;

public interface CrawlingService {
	public void crawling(List<ProductVO> list);
	public List<ProductVO> getList();
}
