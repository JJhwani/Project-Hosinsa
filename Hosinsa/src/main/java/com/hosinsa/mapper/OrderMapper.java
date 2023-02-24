package com.hosinsa.mapper;

import java.util.List;


import com.hosinsa.domain.CartVO;

public interface OrderMapper {
	
	public List<CartVO> getOrder(List<Integer> chArr);
	public List<CartVO> getComplete(List<Integer> chArr);
}

