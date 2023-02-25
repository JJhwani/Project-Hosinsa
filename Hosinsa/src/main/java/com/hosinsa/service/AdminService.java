package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.OrderVO;
import com.hosinsa.domain.ProductVO;

public interface AdminService {
	public boolean modify(ProductVO vo);
	public boolean remove(int pronum);
	public boolean register(ProductVO vo);
	public int checkPronum(int pronum);
	public MemberVO get(String id);
	public boolean memberModify(MemberVO member);
	public List<MemberVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public List<MemberVO> searchMember(Criteria cri);
	public int searchTotal(Criteria cri);
	public List<OrderVO> getOrderList(String process);
	public OrderVO getOrder(int orderNum);
	public boolean updateProcess(OrderVO vo);
}
