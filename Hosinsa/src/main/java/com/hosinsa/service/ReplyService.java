package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.BoardNoticeVO;
import com.hosinsa.domain.ReplyPageDTO;
import com.hosinsa.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);

	public ReplyVO get(Long rno);

	public int modify(ReplyVO vo);

	public int remove(Long rno);

	public List<ReplyVO> getList(Criteria cri, Long qno);

	public ReplyPageDTO getListPage(Criteria cri, Long qno);

}
