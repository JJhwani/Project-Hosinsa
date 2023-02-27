package com.hosinsa.service;

import java.util.List;

import javax.xml.stream.events.Namespace;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.CartVO;
import com.hosinsa.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	public CartMapper mapper;
	
	@Override
	public boolean deleteCart(long cartnum) {
		return mapper.deleteCart(cartnum)==1? true : false;
	}

	@Override
	public List<CartVO> getList(String id) {
		return mapper.getList(id);
	}
	
	@Override
	public boolean cartIn(CartVO vo) {
		return mapper.cartIn(vo)==1?true:false;
	}
	
	@Override
	public boolean plusQuantity(CartVO vo) {
		return mapper.plusQuantity(vo)==1?true:false;
	}
	
	@Override
	public boolean minusQuantity(CartVO vo) {
		return mapper.minusQuantity(vo)==1?true:false;
	}
	public boolean cartUpdate(CartVO vo) {
		return mapper.cartUpdate(vo)==1?true:false;
	}

	@Override
	public int checkCart(CartVO vo) {
		return mapper.checkCart(vo);
	}

	
}

