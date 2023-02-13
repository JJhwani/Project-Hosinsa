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
	public void register(CartVO cart) {
	}
	
	@Override
	public CartVO get(Long pronum) {
		return null;
	}

	@Override
	public List<CartVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<CartVO> getOrder() {
		return mapper.getList();
	}
	
	@Override
	public int deleteCart(CartVO cart) {
		return mapper.deleteCart(cart);
	}
}

