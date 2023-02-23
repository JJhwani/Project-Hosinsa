package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.MemberAddressVO;

public interface MemberAddressService {
	public List<MemberAddressVO> getList(MemberAddressVO address);		// 주소 리스트 출력
	public boolean register(MemberAddressVO address);					// 주소 등록 
	public MemberAddressVO read(MemberAddressVO address);				// 주소 읽기
	public boolean modify(MemberAddressVO address);						// 주소 수정
	public boolean remove(MemberAddressVO address);						// 주소 삭제
}
