package com.hosinsa.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hosinsa.domain.BoardCriteria;
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
	public List<MemberAddressVO> getListWithPaging(BoardCriteria cri) {
		return mapper.getListWithPaging(cri);
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
	public int getTotalCountAddress(BoardCriteria cri) {
		return 0;
	}

}
