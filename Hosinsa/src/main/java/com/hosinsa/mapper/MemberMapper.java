package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hosinsa.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> getList();
	public void insert(MemberVO member);
	public MemberVO read(String id);
	public int delete(MemberVO member);
	public int update(MemberVO member);
	// 로그인
	public MemberVO memberLogin(MemberVO member);
	// ID 중복체크
	public int idCheck(String memberId);
	// Nickname 중복체크
	public int nickCheck(String memberNickname);
	// Introducer 중복체크
	public int introCheck(String memberIntroducer);
	
	/* 카카오 로그인 */
	public void kakaoInsert(MemberVO member);
}
