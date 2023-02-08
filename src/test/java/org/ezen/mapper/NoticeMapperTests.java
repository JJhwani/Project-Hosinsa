package org.ezen.mapper;

import java.util.List;

import org.ezen.domain.Criteria;
import org.ezen.domain.NoticeVO;
import org.ezen.mapper.NoticeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {

	@Autowired
	private NoticeMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList().forEach(n -> log.info(n));
	}

	@Test
	public void testInsert() {
		NoticeVO vo = new NoticeVO();
		vo.setNtitle("새로 작성하는 글");
		vo.setNcontent("새로 작성하는 내용");
		vo.setId("new1");

		int result = mapper.insert(vo);
		log.info("result = " + result);
	}

	@Test
	public void testInsertSelectKey() {

		NoticeVO vo = new NoticeVO();
		vo.setNtitle("새로 작성하는 글2");
		vo.setNcontent("새로 작성하는 내용2");
		vo.setId("new2");

		int result = mapper.insertSelectKey(vo);
		log.info("result = " + result);
	}

	@Test
	public void testRead() {
		NoticeVO vo = mapper.read(26L);
		log.info(vo);
	}

	@Test
	public void testDelete() {
		int result = mapper.delete(26L);
		log.info("result = " + result);
	}

	@Test
	public void testUpdate() {
		NoticeVO vo = new NoticeVO();
		vo.setNtitle("수정한 제목");
		vo.setNcontent("수정한 내용");
		vo.setNno(5L);

		int result = mapper.update(vo);
		log.info("result = " + result);
	}

	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<NoticeVO> list = mapper.getListWithPaging(cri);
		list.forEach(notice -> log.info(notice));
	}
}
