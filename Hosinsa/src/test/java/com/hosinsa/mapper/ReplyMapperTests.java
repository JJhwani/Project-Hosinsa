package com.hosinsa.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private Long[] qnoArr = { 306L, 307L, 280L, 281L, 282L };

	@Autowired
	private ReplyMapper mapper;

	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {

			ReplyVO vo = new ReplyVO();

			vo.setQno(qnoArr[i % 5]);
			vo.setReply("댓글 테스트" + i);
			vo.setReplyer("replyer" + i);

			mapper.insert(vo);
		});
	}

	@Test
	public void testRead() {
		Long targetRno = 5L;
		ReplyVO vo = mapper.read(targetRno);
		log.info(vo);
	}

	@Test
	public void testMapper() {
		log.info(mapper);
	}

	@Test
	public void testDelete() {
		Long targetRno = 10L;
		mapper.delete(targetRno);
	}

	@Test
	public void testUpdate() {
		Long targetRno = 9L;

		ReplyVO vo = mapper.read(targetRno);
		vo.setReply("Update Reply ");
		int count = mapper.update(vo);
		log.info("update count: " + count);
	}

	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, qnoArr[0]);

		replies.forEach(reply -> log.info(reply));
	}
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria(1, 10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 406L);

		replies.forEach(reply -> log.info(reply));
	}

//	@Test
//	public void testInsert() {
//		QnaVO qna = new QnaVO();
//		qna.setQcategory("이벤트문의1");
//		qna.setQtitle("새로 작성하는 글1");
//		qna.setQcontent("새로 작성하는 내용1");
//		qna.setId("new1");
//
//		mapper.insert(qna);
//		log.info(qna);
//	}
//
//	@Test
//	public void testInsertSelectKey() {
//
//		QnaVO qna = new QnaVO();
//		qna.setQcategory("이벤트문의2");
//		qna.setQtitle("새로 작성하는 글2");
//		qna.setQcontent("새로 작성하는 내용2");
//		qna.setId("new2");
//
//		mapper.insertSelectKey(qna);
//		log.info(qna);
//	}
//

//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		cri.setPageNum(3);
//		cri.setAmount(10);
//
//		List<QnaVO> list = mapper.getListWithPaging(cri);
//		list.forEach(qna -> log.info(qna.getQno()));
//	}
//
//	@Test
//	public void testSearch() {
//
//		Criteria cri = new Criteria();
//		cri.setKeyword("재고");
//		cri.setType("TC");
//
//		List<QnaVO> list = mapper.getListWithPaging(cri);
//
//		list.forEach(qna -> log.info(qna));
//	}

}
