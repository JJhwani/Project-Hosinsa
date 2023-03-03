package com.hosinsa.mapper;

import java.util.List;

import com.hosinsa.domain.MemberAddressVO;

public interface MemberAddressMapper {
	public MemberAddressVO getListBasic(MemberAddressVO vo);			// 오더 페이지에 기본배송지 출력
	public List<MemberAddressVO> getListOrder(MemberAddressVO vo);		// 오더 페이지에 배송지명 출력
	public List<MemberAddressVO> getListWithPaging(MemberAddressVO vo);	// 주소 리스트 출력
	public boolean registerSelectKey(MemberAddressVO vo);				// 주소 등록
	public MemberAddressVO read(MemberAddressVO vo);					// 주소 읽기
	public int modifyBasic(MemberAddressVO vo);							// 기본배송지 수정
	public int modify(MemberAddressVO vo);								// 주소 수정
	public int remove(Long address_no);									// 주소 삭제
	public int getTotalCountAddress(MemberAddressVO vo);				// 주소 전체 개수
}
