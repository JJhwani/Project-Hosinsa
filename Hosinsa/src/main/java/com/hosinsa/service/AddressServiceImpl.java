package com.hosinsa.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hosinsa.domain.MemberAddressVO;
import com.hosinsa.mapper.AddressMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AddressServiceImpl implements AddressService{

	private AddressMapper addressMapper;
	
	@Override
	public void register(MemberAddressVO address) {
		log.info("register====" + address);
		addressMapper.insertSelectKey(address);
	}

	@Override
	public MemberAddressVO get(Long address_no) {
		log.info("get====" + address_no);
		return addressMapper.read(address_no);
	}

	@Override
	public boolean modify(MemberAddressVO address) {
		log.info("modify====" + address);
		return addressMapper.update(address) == 1;
	}

	@Override
	public boolean remove(Long address_no) {
		log.info("remove====" + address_no);
		return addressMapper.delete(address_no) == 1;
	}

	@Override
	public List<MemberAddressVO> getList() {
		log.info("getList====");
		return addressMapper.getList();
	}


}
