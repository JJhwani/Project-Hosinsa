package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hosinsa.domain.MemberVO;

public interface MemberMapper {

//	@Select("select * from hosinsa_member")
	public List<MemberVO> getList();
	
	public void insert(MemberVO member);
	
//	public void insertSelectKey(MemberVO member);
	
	public MemberVO read(String id);
	
	public int delete(String id);
	
	public int update(MemberVO member);

}
