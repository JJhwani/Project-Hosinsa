package org.ezen.service;

import java.util.List;

import org.ezen.domain.NoticeVO;

public interface NoticeService {
	public void register(NoticeVO vo);

	public NoticeVO get(Long nno);

	public boolean modify(NoticeVO vo);

	public boolean remove(Long nno);

	public List<NoticeVO> getList();
}
