package com.hosinsa.mapper;

import java.util.List;

import com.hosinsa.domain.MemberAddressVO;

public interface AddressMapper {

	public List<MemberAddressVO> getList();
	
	public void insert(MemberAddressVO address);
	
	public void insertSelectKey(MemberAddressVO address);
	
	public MemberAddressVO read(Long address_no);
	
	public int delete(Long address_no);
	
	public int update(MemberAddressVO address);
}
