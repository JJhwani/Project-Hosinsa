package com.hosinsa.mapper;

import java.util.List;

import com.hosinsa.domain.BoardCriteria;
import com.hosinsa.domain.MemberAddressVO;

public interface MemberAddressMapper {
	public List<MemberAddressVO> getListWithPaging(BoardCriteria cri);	// 주소 리스트 출력
	public boolean registerSelectKey(MemberAddressVO vo);				// 주소 등록
	public MemberAddressVO read(MemberAddressVO vo);					// 주소 읽기
	public int modifyBasic(MemberAddressVO vo);							// 기본배송지 수정
	public int modify(MemberAddressVO vo);								// 주소 수정
	public int remove(Long address_no);									// 주소 삭제
	public int getTotalCountAddress(BoardCriteria cri);					// 주소 전체 개수
}
