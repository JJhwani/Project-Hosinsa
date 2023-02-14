package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.CartVO;

public interface CartService {
	public List<CartVO> getList(); 
	
	//카트삭제
	public boolean deleteCart(long cartnum);
	
}
