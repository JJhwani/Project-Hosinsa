package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.CartVO;
import com.hosinsa.mapper.CartMapper;
import com.hosinsa.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	public OrderMapper mapper;
	
	@Override
	public List<CartVO> getOrder(List<Integer> chArr) {
		return mapper.getOrder(chArr);
	}
	
	@Override
	public List<CartVO> getComplete(List<Integer> chArr) {
		return mapper.getComplete(chArr);
	}
}
