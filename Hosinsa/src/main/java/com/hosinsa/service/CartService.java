package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.CartVO;

public interface CartService {
	public List<CartVO> getList(String id); 
	
	//카트삭제
	public boolean deleteCart(long cartnum);
	public boolean cartIn(CartVO vo);
	public boolean cartUpdate(CartVO vo);
	public int checkCart(CartVO vo);
	public boolean plusQuantity(CartVO vo);
	public boolean minusQuantity(CartVO vo);
	
}
