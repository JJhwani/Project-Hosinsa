package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.CartVO;

public interface CartService {
	public void register(CartVO cart);
	
	public CartVO get(Long pronum);
	
	public List<CartVO> getList(String id); 
	
	public List<CartVO> getOrder(long cartnum); 
	
	//카트삭제
	public boolean deleteCart(long cartnum);
	public boolean cartIn(CartVO vo);
	
	public boolean updateQuantity(CartVO vo);
	
}
