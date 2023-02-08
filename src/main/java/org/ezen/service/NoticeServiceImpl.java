package org.ezen.service;

import java.util.List;

import org.ezen.domain.NoticeVO;
import org.ezen.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

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
	} // 정상적으로 처리되면 1이라는 값을 반환

	@Override
	public boolean remove(Long nno) { // 삭제
		return noticeMapper.delete(nno) == 1 ? true : false;
	}// 정상적으로 처리되면 1이라는 값을 반환

	@Override
	public List<NoticeVO> getList() { // 목록
		return noticeMapper.getList();
	}
}
