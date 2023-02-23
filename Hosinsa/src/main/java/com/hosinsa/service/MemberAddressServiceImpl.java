package com.hosinsa.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hosinsa.domain.MemberAddressVO;
import com.hosinsa.mapper.MemberAddressMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberAddressServiceImpl implements MemberAddressService{

	private MemberAddressMapper mapper;

	@Override
	public List<MemberAddressVO> getList(MemberAddressVO address) {
		return mapper.getList(address);
	}

	@Override
	public boolean register(MemberAddressVO address) {
		return mapper.register(address) == 1 ? true : false;
	}

	@Override
	public MemberAddressVO read(MemberAddressVO address) {
		return mapper.read(address);
	}

	@Override
	public boolean modify(MemberAddressVO address) {
		return mapper.modify(address) == 1 ? true : false;
	}

	@Override
	public boolean remove(MemberAddressVO address) {
		return mapper.remove(address) == 1 ? true : false;
	}

}
