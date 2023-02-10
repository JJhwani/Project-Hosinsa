package com.hosinsa.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hosinsa.domain.ReviewCriteria;
import com.hosinsa.domain.ReviewReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewReplyMapperTests {
	
	private Long[] bnoArr = {110L, 111L, 112L, 113L, 114L, 115L};
	
	@Autowired
	private ReviewReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1,10).forEach(i-> {
			
		ReviewReplyVO vo = new ReviewReplyVO();
			
		vo.setBno(bnoArr[i % 6]);
		vo.setReply("[댓글]배송 언제오나염염염염3333" + i);
		vo.setReplyer("[댓글]" + i);
			
		mapper.insert(vo);
		
		});

	}
	
	@Test
	public void testRead() {
		Long targetRno = 4L;
		
		ReviewReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 3L;
		
		mapper.delete(targetRno);
		
	}
	
	@Test
	public void testUpdate() {
		Long targetRno = 10L;
		
		ReviewReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("업데이트업데이트업데이트");
		
		int count = mapper.update(vo);
		
		log.info("업데이트 확인=========>" + count);
		
		
	}
	
	@Test
	public void testList() {
		
		ReviewCriteria cri = new ReviewCriteria();
		
		List<ReviewReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(n -> log.info(n));
	}
	
	
	
}
