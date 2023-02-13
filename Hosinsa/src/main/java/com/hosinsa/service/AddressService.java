package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.MemberAddressVO;

public interface AddressService {

	public void register(MemberAddressVO address);
	
	public MemberAddressVO get(Long address_no);
	
	public boolean modify(MemberAddressVO address);
	
	public boolean remove(Long address_no);
	
	public List<MemberAddressVO> getList();
}
