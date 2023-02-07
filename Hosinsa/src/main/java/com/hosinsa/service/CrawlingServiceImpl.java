package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.ProductVO;
import com.hosinsa.mapper.CrawlingMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CrawlingServiceImpl implements CrawlingService{
	
	@Autowired
	private CrawlingMapper mapper;
	
	@Override
	public void crwaling(List<ProductVO> list) {
		mapper.crwaling(list);
	}
}
