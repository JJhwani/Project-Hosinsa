package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.CartVO;

public interface OrderService {
	public List<CartVO> getOrder(List<Integer> chArr);
}
