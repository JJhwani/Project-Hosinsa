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
	public void registerEvent(BoardEventVO vo) {
		mapper.registerSelectKeyEvent(vo);
		
	}

	@Override
	public boolean modifyEvent(BoardEventVO vo) {
		return mapper.modifyEvent(vo) == 1 ? true : false;
	}

	@Override
	public boolean removeEvent(Long event_no) {
		return mapper.removeEvent(event_no) == 1 ? true : false;
	}

	@Override
	public int getTotalEvent(Criteria cri) {
		return mapper.getTotalCountEvent(cri);	}

	@Override
	public List<BoardEventVO> getListMainEvent(BoardEventVO vo) {
		return mapper.getListMainEvent(vo);
	} 
	


}
