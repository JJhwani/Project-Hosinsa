package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.ProductVO;
import com.hosinsa.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper mapper;
	
	@Override
	public boolean modify(ProductVO vo) {
		return mapper.update(vo)==1?true:false;
	}

	@Override
	public boolean remove(int pronum) {
		return mapper.delete(pronum)==1?true:false;
	}

	@Override
	public boolean register(ProductVO vo) {
		return mapper.register(vo)==1?true:false;
	}

	@Override
	public int checkPronum(int pronum) {
		return mapper.checkPronum(pronum);
	}	

}
