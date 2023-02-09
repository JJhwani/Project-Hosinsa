package com.hosinsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.NoticeVO;
import com.hosinsa.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public void register(NoticeVO vo) { // 등록
		int result = noticeMapper.insertSelectKey(vo);
		System.out.println("result 값?= " + result);

	}

	@Override
	public NoticeVO get(Long nno) { // 조회
		return noticeMapper.read(nno);
	}

	@Override
	public boolean modify(NoticeVO vo) { // 수정
		return noticeMapper.update(vo) == 1 ? true : false;
	} 

	@Override
	public boolean remove(Long nno) { // 삭제
		return noticeMapper.delete(nno) == 1 ? true : false;
	}

//	@Override
//	public List<NoticeVO> getList() { // 목록
//		return noticeMapper.getList();
//	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {// 목록
		return noticeMapper.getListWithPaging(cri);
	}
	

	@Override
	public int getTotal(Criteria cri) {
		return noticeMapper.getTotalCount(cri);
	}

}
