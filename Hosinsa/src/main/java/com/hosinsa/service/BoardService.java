package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.BoardEventVO;
import com.hosinsa.domain.Criteria;

public interface BoardService {
	public List<BoardEventVO> getListEvent(Criteria cri);			 // 이벤트 리스트 출력
	public BoardEventVO readEvent(Long event_no);					 // 이벤트 읽기
	public boolean registerEvent(BoardEventVO vo);					 // 이벤트 등록
	public boolean modifyEvent(BoardEventVO vo);					 // 이벤트 수정
	public boolean removeEvent(Long event_no);						 // 이벤트 삭제
	public int getTotalEvent(Criteria cri);							 // 이벤트 전체 개수
	public List<BoardEventVO> getEventList(BoardEventVO vo);	 			// Main 페이지 Banner에 이벤트 5개 출력
	public List<BoardEventVO> getListMainEvent(BoardEventVO vo);	 // Main 페이지 진행중인 이벤트 3개 출력
	
}
