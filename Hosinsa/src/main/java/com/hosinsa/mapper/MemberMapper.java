package com.hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.OrderVO;
import com.hosinsa.domain.PreReviewVO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.domain.ReviewVO;

public interface MemberMapper {

	public List<MemberVO> getList();
	public int insert(MemberVO member);
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
	// 카카오 로그인 
	public void kakaoInsert(MemberVO member);
	// 주문내역 불러오기
	public List<OrderVO> getOrderList(String id);
	//작성가능리뷰 불러오기
	public List<PreReviewVO> getPreList(String id);
	//작성한 리뷰 불러오기
	public List<ReviewVO> getAlreadyList(String id);
	//찜한 목록 불러오기
	public List<ProductVO> getLikesListWithPaging(@Param("id") String id,@Param("page") int page);
	
	//주문 정보 불러오기
	public OrderVO getOrder(int ordernum);

}
