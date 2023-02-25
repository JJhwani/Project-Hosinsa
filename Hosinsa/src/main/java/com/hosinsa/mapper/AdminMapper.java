package com.hosinsa.mapper;

import java.util.List;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.OrderVO;
import com.hosinsa.domain.ProductVO;

public interface AdminMapper {
	public int update(ProductVO vo);
	public int delete(int pronum);
	public int register(ProductVO vo);
	public int checkPronum(int pronum);
	public int memberUpdate(MemberVO member);
	public int getTotalCount(Criteria cri);
	public MemberVO read(String id);
	public List<MemberVO> getList();
	public List<MemberVO> getListWithPaging(Criteria cri);
	public List<MemberVO> searchMember(Criteria cri);
	public int searchTotal(Criteria cri);
	public List<OrderVO> getOrderList(String process);
	public OrderVO getOrder(int orderNum);
	public int updateProcess(OrderVO vo);
}
