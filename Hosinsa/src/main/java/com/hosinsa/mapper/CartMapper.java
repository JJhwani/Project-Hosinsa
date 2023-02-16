package com.hosinsa.mapper;

import java.util.List;


import com.hosinsa.domain.CartVO;

public interface CartMapper {
	
	public List<CartVO> getList(String id);
	
	public List<CartVO> getOrder(long cartnum);
	
	public void insert(CartVO cart);
	
	//카트삭제
	public int deleteCart(long cartnum);
	public int cartIn(CartVO cart);
	public int updateQuantity(CartVO vo);
}
