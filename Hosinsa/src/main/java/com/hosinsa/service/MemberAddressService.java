package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.BoardCriteria;
import com.hosinsa.domain.MemberAddressVO;

public interface MemberAddressService {
	public List<MemberAddressVO> getListWithPaging(BoardCriteria cri);	// 주소 리스트 출력
	public boolean registerSelectKey(MemberAddressVO vo);				// 주소 등록
	public MemberAddressVO read(MemberAddressVO vo);					// 주소 읽기
	public boolean modifyBasic(MemberAddressVO vo);						// 기본배송지 수정
	public boolean modify(MemberAddressVO vo);							// 주소 수정
	public boolean remove(Long address_no);								// 주소 삭제
	public int getTotalCountAddress(BoardCriteria cri);					// 주소 전체 개수
}
