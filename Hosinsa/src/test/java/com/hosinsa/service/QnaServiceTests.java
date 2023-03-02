package com.hosinsa.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.QnaVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaServiceTests {

	@Autowired
	private QnaService qnaService;
	
	
	@Test
	public void testExist() {
		assertNotNull(qnaService);
	}
	

	@Test
	public void testRegister() {
		QnaVO qna = new QnaVO();
		qna.setCategory("배송문의");
		qna.setTitle("배송 문의합니다.");
		qna.setContent("배송 언제되나요?");
		qna.setId("박선화");
		
		qnaService.register(qna);
		log.info("생성된 문의 번호: " + qna.getQno());
	}
	
	@Test
	public void testGetList() { 
		qnaService.getList(new Criteria(2, 10)).forEach(qna -> log.info(qna));
	}

	@Test
	public void testGet() {
		QnaVO qna = qnaService.get(3L);
	}

	@Test
	public void testModify() {
		QnaVO qna = new QnaVO();
		qna.setQno(1L);
		qna.setCategory("기타문의");
		qna.setTitle("문의합니다.");
		qna.setContent("비밀번호가 생각나지 않아요.");
		boolean bool = qnaService.modify(qna);
		log.info("bool====>" + bool);
	}

	@Test
	public void testDelete() { 
		qnaService.remove(8L);
	}

}
