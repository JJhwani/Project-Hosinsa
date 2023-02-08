package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.CartVO;

public interface CartService {
	public void register(CartVO cart);
	
	public CartVO get(Long bno);
	
	public List<CartVO> getList(); 
}
