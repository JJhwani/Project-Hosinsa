package com.hosinsa.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hosinsa.domain.MemberAddressVO;
import com.hosinsa.mapper.MemberAddressMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberAddressServiceImpl implements MemberAddressService{

	private MemberAddressMapper mapper;
	
	
	@Override
	public MemberAddressVO getListBasic(MemberAddressVO vo) {
		return mapper.getListBasic(vo);
	}
	
	@Override
	public List<MemberAddressVO> getListOrder(MemberAddressVO vo) {
		return mapper.getListOrder(vo);
	}
	@Override
	public List<MemberAddressVO> getListWithPaging(MemberAddressVO vo) {
		return mapper.getListWithPaging(vo);
	}

	@Override
	public boolean registerSelectKey(MemberAddressVO vo) {
		return mapper.registerSelectKey(vo);
	}

	@Override
	public MemberAddressVO read(MemberAddressVO vo) {
		return mapper.read(vo);
	}

	@Override
	public boolean modifyBasic(MemberAddressVO vo) {
		return mapper.modifyBasic(vo) == 1 ? true : false;
	}

	@Override
	public boolean modify(MemberAddressVO vo) {
		return mapper.modify(vo) == 1 ? true : false;
	}

	@Override
	public boolean remove(Long address_no) {
		return mapper.remove(address_no) == 1 ? true : false;
	}

	@Override
	public int getTotalCountAddress(MemberAddressVO vo) {
		return mapper.getTotalCountAddress(vo);
	}


}
