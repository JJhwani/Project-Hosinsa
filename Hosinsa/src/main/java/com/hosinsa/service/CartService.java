package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.CartVO;

public interface CartService {
	public void register(CartVO cart);
	
	public CartVO get(Long pronum);
	
	public List<CartVO> getList(); 
	
	public List<CartVO> getOrder();
	
	//카트삭제
	public int deleteCart(CartVO cart);
	
}
