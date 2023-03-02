package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.CartVO;
import com.hosinsa.domain.OrderVO;
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
	public void getOrder_del(List<Integer> chArr) {
		mapper.getOrder_del(chArr);
	}
	
	@Override
	public boolean getProduct_del(int cartnum) {
		System.out.println(cartnum + "서비스 임플까지 들어옴");
		return mapper.Product_del(cartnum)==1? true : false;
	}
	
	@Override
	public void getOrderIn(OrderVO vo, List<Integer> cartnum) {
		mapper.getOrderIn(vo, cartnum);
		
	}
}
