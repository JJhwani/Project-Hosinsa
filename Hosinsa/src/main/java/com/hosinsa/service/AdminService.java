package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.ProductVO;

public interface AdminService {
	public boolean modify(ProductVO vo);
	public boolean remove(int pronum);
}
