package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.NoticeVO;

public interface NoticeService {
	public void register(NoticeVO vo);

	public NoticeVO get(Long nno);

	public boolean modify(NoticeVO vo);

	public boolean remove(Long nno);

	public List<NoticeVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
	
	public int readCount(Long nno); //추가
	
}
