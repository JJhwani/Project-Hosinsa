package com.hosinsa.mapper;

import java.util.List;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.ProductVO;

public interface AdminMapper {
	public int update(ProductVO vo);
	public int delete(int pronum);
	public int register(ProductVO vo);
	public int checkPronum(int pronum);
	public List<MemberVO> getList();
	public MemberVO read(String id);
	public int memberUpdate(MemberVO member);
}
