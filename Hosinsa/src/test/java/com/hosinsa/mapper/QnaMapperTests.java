package com.hosinsa.mapper;

import java.util.List;

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
public class QnaMapperTests {

	@Autowired
	private QnaMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList().forEach(qna -> log.info(qna));
	}
	
	@Test
	public void testInsert() {
		QnaVO qna = new QnaVO();
		qna.setCategory("이벤트문의1");
		qna.setTitle("새로 작성하는 글1");
		qna.setContent("새로 작성하는 내용1");
		qna.setId("new1");

		mapper.insert(qna);
		log.info(qna);
	}

	@Test
	public void testInsertSelectKey() {

		QnaVO qna = new QnaVO();
		qna.setCategory("이벤트문의2");
		qna.setTitle("새로 작성하는 글2");
		qna.setContent("새로 작성하는 내용2");
		qna.setId("new2");

		mapper.insertSelectKey(qna);
		log.info(qna);
	}

	@Test
	public void testRead() {
		QnaVO qna = mapper.read(5L);
		log.info(qna);
	}

	@Test
	public void testDelete() {
		log.info("result = " + mapper.delete(7L));
	}

	@Test
	public void testUpdate() {
		QnaVO qna = new QnaVO();
		qna.setCategory("수정수정");
		qna.setTitle("수정한 제목");
		qna.setContent("수정한 내용");
		qna.setQno(6L);
		
		int count = mapper.update(qna);
		log.info("result = " + count);
	}

	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);

		List<QnaVO> list = mapper.getListWithPaging(cri);
		list.forEach(qna -> log.info(qna.getQno()));
	}

	@Test
	public void testSearch() {

		Criteria cri = new Criteria();
		cri.setKeyword("재고");
		cri.setType("TC");

		List<QnaVO> list = mapper.getListWithPaging(cri);

		list.forEach(qna -> log.info(qna));
	}


}
