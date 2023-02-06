package com.hosinsa.service;

import java.util.ArrayList;

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
	public void crwaling(ArrayList<ProductVO> list) {
		ArrayList<ProductVO> list1 = new ArrayList<ProductVO>();
		mapper.crwaling(list1);
	}
}
