package com.hosinsa.mapper;

import com.hosinsa.domain.ProductVO;

public interface AdminMapper {
	public int update(ProductVO vo);
	public int delete(int pronum);
	public int register(ProductVO vo);
	public int checkPronum(int pronum);
}
