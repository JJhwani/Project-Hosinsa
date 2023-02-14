package com.hosinsa.mapper;

import java.util.List;


import com.hosinsa.domain.CartVO;

public interface CartMapper {
	
	public List<CartVO> getList();
	
	//카트삭제
	public int deleteCart(long cartnum);
	
}
