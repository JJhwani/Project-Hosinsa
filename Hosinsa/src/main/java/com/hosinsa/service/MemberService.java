package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.MemberVO;

public interface MemberService {
	
	// insert
	public void join(MemberVO member);
	
	// read
	public MemberVO get(String id);
	
	// update
	public boolean modify(MemberVO member);
	
	// delete
	public boolean remove(String id);
	
	public List<MemberVO> getList();
}
