package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.BoardEventVO;
import com.hosinsa.domain.Criteria;
import com.hosinsa.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper mapper;

	@Override
	public List<BoardEventVO> getListEvent(Criteria cri) {
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
	public int getTotalEvent(Criteria cri) {
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
	
	


}
