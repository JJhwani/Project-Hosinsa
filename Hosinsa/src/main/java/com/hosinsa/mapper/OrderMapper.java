package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hosinsa.domain.CartVO;
import com.hosinsa.domain.OrderVO;

public interface OrderMapper {
	
	public List<CartVO> getOrder(List<Integer> chArr);
	public void getOrder_del(List<Integer> chArr);
	public int Product_del(int cartnum);
	
	public void getOrderIn(@Param("vo")OrderVO vo, @Param("cartnum")List<Integer> cartnum);
}

