package org.ezen.service;

import static org.junit.Assert.assertNotNull;

import org.ezen.domain.NoticeVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTests {

	@Autowired
	private NoticeService noticeService;

	@Test
	public void testRegister() { // 등록
		NoticeVO vo = new NoticeVO();
		vo.setNtitle("서비스테스트 제목1");
		vo.setNcontent("서비스테스트 내용1");
		vo.setId("new1");
		noticeService.register(vo);
	}

	@Test
	public void testGet() { // 조회
		NoticeVO vo = noticeService.get(3L);
		log.info("vo = " + vo);
	}

	@Test
	public void testModify() { // 수정
		NoticeVO vo = new NoticeVO();
		vo.setNno(1L);
		vo.setNtitle("서비스 수정1");
		vo.setNcontent("서비스 수정 내용1");
		boolean bool = noticeService.modify(vo);
		log.info("bool====>" + bool);
	}

	@Test
	public void testDelete() { // 삭제
		noticeService.remove(23L);
	}

	@Test
	public void testgetList() { // 목록
//		List<BoardVO> boardVO=boardService.getList();
//		boardVO.forEach(n->log.info(n));
//		boardVO.forEach(n->log.info(n.getTitle()));
//		Criterial cri = new Criterial(3, 15);
		noticeService.getList().forEach(n -> log.info(n));
	}
}
