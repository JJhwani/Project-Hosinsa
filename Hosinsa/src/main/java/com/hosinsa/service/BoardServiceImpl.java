package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.BoardCriteria;
import com.hosinsa.domain.BoardEventVO;
import com.hosinsa.domain.BoardNoticeVO;
import com.hosinsa.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper mapper;

	@Override
	public List<BoardEventVO> getListEvent(BoardCriteria cri) {
		return mapper.getListWithPagingEvent(cri);
	}

	@Override
	public BoardEventVO readEvent(Long event_no) {
		return mapper.readEvent(event_no);
	}

	@Override
	public boolean registerEvent(BoardEventVO bevo) {
		return mapper.registerSelectKeyEvent(bevo);
		
	}

	@Override
	public boolean modifyEvent(BoardEventVO bevo) {
		return mapper.modifyEvent(bevo) == 1 ? true : false;
	}

	@Override
	public boolean removeEvent(Long event_no) {
		return mapper.removeEvent(event_no) == 1 ? true : false;
	}

	@Override
	public int getTotalEvent(BoardCriteria cri) {
		return mapper.getTotalCountEvent(cri);
	}
	
	@Override
	public List<BoardEventVO> getEventList(BoardEventVO bevo) {
		return mapper.getEventList(bevo);
	} 
	
	@Override
	public List<BoardEventVO> getListMainEvent(BoardEventVO bevo) {
		return mapper.getListMainEvent(bevo);
	}

	@Override
	public List<BoardNoticeVO> getListNotice(BoardCriteria cri) {
		return mapper.getListWithPagingNotice(cri);
	}

	@Override
	public BoardNoticeVO readNotice(Long nno) {
		return mapper.readNotice(nno);
	}

	@Override
	public boolean registerNotice(BoardNoticeVO bnvo) {
		return mapper.registerSelectKeyNotice(bnvo);
	}

	@Override
	public boolean modifyNotice(BoardNoticeVO bnvo) {
		return mapper.modifyNotice(bnvo) == 1 ? true : false;
	}

	@Override
	public boolean removeNotice(Long nno) {
		return mapper.removeNotice(nno) == 1 ? true : false;
	}

	@Override
	public int getTotalNotice(BoardCriteria cri) {
		return mapper.getTotalCountNotice(cri);
	}

	@Override
	public List<BoardNoticeVO> getListMainNotice(BoardNoticeVO bnvo) {
		return mapper.getListMainNotice(bnvo);
	}

	@Override
	public int readCountNotice(Long nno) {
		return mapper.readCountNotice(nno);
	}

	@Override
	public int getTotalCountSearch(BoardCriteria cri) {
		return mapper.getTotalCountSearch(cri);
	}
	
	


}
