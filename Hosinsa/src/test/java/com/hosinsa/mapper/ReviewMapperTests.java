package com.hosinsa.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hosinsa.domain.ReviewCriteria;
import com.hosinsa.domain.ReviewVO;
import com.hosinsa.mapper.ReviewMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {
	
	@Autowired
	private ReviewMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(n-> log.info(n));
	}
	
	@Test
	public void testInsert() {
		ReviewVO vo = new ReviewVO();
		vo.setTitle("바지가 너무 길어요!");
		vo.setContent("줄이는 돈이 더 들어씀 상세페이지 잘 보세요!");
		vo.setNickname("으네");
		
		mapper.insert(vo);
		
		log.info(vo); //toString()을 이용해서 bno 멤버 변수의 값을 확인
	}
	
	@Test
	public void testInsertSelectKey() {
		ReviewVO vo = new ReviewVO();
		vo.setTitle("바지가 너무 길어요! SelectKey");
		vo.setContent("줄이는 돈이 더 들어씀 상세페이지 잘 보세요! SelectKey");
		vo.setNickname("으네");
		
		mapper.insertSelectKey(vo);
		
		log.info("===================>" + vo); 
	}
	
	@Test
	public void testRead() {
		ReviewVO vo = mapper.read(1L);
		
		log.info("===================>" + vo); 
		
	}
	
	@Test
	public void testDelete() {
		log.info("삭제삭제삭제!=========>" + mapper.delete(4L));
	}
	
	@Test
	public void testUpdate() {
		ReviewVO vo = mapper.read(3L);
		//실행전 존재하는 번호 확인
		
		vo.setBno(3L);
		vo.setTitle("이뻐용~~~~~~~~~~");
		vo.setContent("킹왕짱OTL이쁨!");
		vo.setNickname("으네넹");
		
		int count = mapper.update(vo);
		
		log.info("업데이뚜=======>" + count);
	}
	
	@Test
	public void testPaging() {
		
		ReviewCriteria cri = new ReviewCriteria();
		
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<ReviewVO> list = mapper.getListWithPaging(cri);
		
		list.forEach( review -> log.info(review.getBno()));
	}
	
	@Test
	public void testSearch() {
		ReviewCriteria cri = new ReviewCriteria();
		
		cri.setKeyword("사이즈");
		cri.setType("TC");
		
		List<ReviewVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(n -> log.info(n));
	}
	
}
