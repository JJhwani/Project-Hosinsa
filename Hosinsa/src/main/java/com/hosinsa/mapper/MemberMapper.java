package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.OrderVO;
import com.hosinsa.domain.PreReviewVO;
import com.hosinsa.domain.ReviewVO;

public interface MemberMapper {

//	@Select("select * from hosinsa_member")
	public List<MemberVO> getList();

	public void insert(MemberVO member);

//	public void insertSelectKey(MemberVO member);

	public MemberVO read(String id);

	public int delete(String id);

	public int update(MemberVO member);

	// 로그인
	public MemberVO memberLogin(MemberVO member);

	// ID 중복체크
	public int idCheck(String memberId);

	// Nickname 중복체크
	public int nickCheck(String memberNickname);

	// Introducer 중복체크
	public int introCheck(String memberIntroducer);
	
	// 주문내역 불러오기
	public List<OrderVO> getOrderList(String id);
	
	//작성가능리뷰 불러오기
	public List<PreReviewVO> getPreList(String id);
	
	//작성한 리뷰 불러오기
	public List<ReviewVO> getAlreadyList(String id);

}
