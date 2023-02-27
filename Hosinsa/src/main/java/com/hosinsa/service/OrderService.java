package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.CartVO;
import com.hosinsa.domain.OrderVO;

public interface OrderService {
	public List<CartVO> getOrder(List<Integer> chArr);
	public void getOrder_del(List<Integer> chArr);
	
	public void getOrderIn(OrderVO vo, List<Integer> cartnum);
}
