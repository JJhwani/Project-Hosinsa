package com.hosinsa.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hosinsa.domain.Criteria;
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
	
	// 페이징처리
//	public List<MemberVO> getList();
	public List<MemberVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	// 로그인
	public MemberVO memberLogin(MemberVO member);
	
	// ID 중복체크
	public int idCheck(String memberId);
	
	// Nickname 중복체크
	public int nickCheck(String memberNickname);
	
	// Introducer 중복체크
	public int introCheck(String memberIntroducer);
	
}
