package com.hosinsa.mapper;

import java.util.List;

import com.hosinsa.domain.MemberAddressVO;

public interface MemberAddressMapper {
	public List<MemberAddressVO> getList(MemberAddressVO address);		// 주소 리스트 출력
	public int register(MemberAddressVO address);						// 주소 등록 
	public MemberAddressVO read(MemberAddressVO address);				// 주소 읽기
	public int modify(MemberAddressVO address);							// 주소 수정
	public int remove(MemberAddressVO address);							// 주소 삭제
}
