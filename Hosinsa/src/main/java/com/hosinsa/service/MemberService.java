package com.hosinsa.service;

import java.util.List;

import javax.servlet.http.HttpSession;

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

	// 로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;

	// ID 중복체크
	public int idCheck(String memberId);

	// Nickname 중복체크
	public int nickCheck(String memberNickname);

	// Introducer 중복체크
	public int introCheck(String memberIntroducer);
	
	//주문내역 불러오기
	//public List<OrderVO> getOrderList(String id);
	
	//작성가능리뷰 불러오기
	//public List<>

}
