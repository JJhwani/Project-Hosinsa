package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.ProductVO;
import com.hosinsa.mapper.CrawlingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CrawlingServiceImpl implements CrawlingService{
	
	@Autowired
	private CrawlingMapper mapper;
	
	@Override
	public void crawling(List<ProductVO> list) {
		int result = mapper.crawling(list);
		log.info(result);	
	}
}
