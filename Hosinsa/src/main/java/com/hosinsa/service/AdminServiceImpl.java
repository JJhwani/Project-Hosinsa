package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper mapper;
	
	@Override
	public boolean modify(ProductVO vo) {
		return mapper.update(vo)==1?true:false;
	}

	@Override
	public boolean remove(int pronum) {
		return mapper.delete(pronum)==1?true:false;
	}

	@Override
	public boolean register(ProductVO vo) {
		return mapper.register(vo)==1?true:false;
	}

	@Override
	public int checkPronum(int pronum) {
		return mapper.checkPronum(pronum);
	}

	@Override
	public MemberVO get(String id) {
		return mapper.read(id);
	}

	@Override
	public boolean memberModify(MemberVO member) {
		return mapper.memberUpdate(member) ==1;
	}

	@Override
	public List<MemberVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<MemberVO> searchMember(Criteria cri) {
		return mapper.searchMember(cri);
	}

	@Override
	public int searchTotal(Criteria cri) {
		return mapper.searchTotal(cri)	;
	}	

}
