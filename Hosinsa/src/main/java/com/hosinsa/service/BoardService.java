package com.hosinsa.service;

import java.util.List;

import com.hosinsa.domain.BoardCriteria;
import com.hosinsa.domain.BoardEventVO;
import com.hosinsa.domain.BoardNoticeVO;

public interface BoardService {
	public List<BoardEventVO> getListEvent(BoardCriteria cri);			 	// 이벤트 리스트 출력
	public BoardEventVO readEvent(Long event_no);							// 이벤트 읽기
	public boolean registerEvent(BoardEventVO vo);							// 이벤트 등록
	public boolean modifyEvent(BoardEventVO vo);							// 이벤트 수정
	public boolean removeEvent(Long event_no);								// 이벤트 삭제
	public int getTotalEvent(BoardCriteria cri);							// 이벤트 전체 개수
	public List<BoardEventVO> getEventList(BoardEventVO vo);	 			// Main 페이지 Banner에 이벤트 5개 출력
	public List<BoardEventVO> getListMainEvent(BoardEventVO vo);	 		// Main 페이지 진행중인 이벤트 3개 출력
	
	public List<BoardNoticeVO> getListNotice(BoardCriteria cri);    		// 공지사항 리스트 출력
	public BoardNoticeVO readNotice(Long nno);								// 공지사항 읽기
	public boolean registerNotice(BoardNoticeVO bnvo);						// 공지사항 등록
	public boolean modifyNotice(BoardNoticeVO bnvo);						// 공지사항 수정
	public boolean removeNotice(Long nno);									// 공지사항 삭제
	public int getTotalNotice(BoardCriteria cri);							// 공지사항 전체 개수
	public List<BoardNoticeVO> getListMainNotice(BoardNoticeVO bnvo);		// Main 페이지 공지사항 3개 출력
	public int readCountNotice(Long nno);									// 공지사항 조회수
	public int getTotalCountSearch(BoardCriteria cri);						// 공지사항 검색 전체수
	public List<BoardNoticeVO> getSearchNotice(BoardNoticeVO bnvo);			// 공지사항 검색
	

	
}
