package hosinsa.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import hosinsa.domain.ReviewVO;
import hosinsa.mapper.ReviewMapperTests;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewServiceTests {
		
		@Autowired
		private ReviewService service;
		
		@Test
		public void testExist() {
			
			log.info("============>" + service);
			
		}
		
		@Test //새로 작성하는 글 테스트
		public void testRegister() {
			ReviewVO vo = new ReviewVO();
			
			vo.setTitle("사이즈 문의");
			vo.setContent("M사이즈 재고 언제 들어오나요?");
			vo.setNickname("재환");
			
			service.regiseter(vo);
			
			log.info("생성된 게시물 번호=============>" + vo.getBno());
		}
		
		@Test
		public void testGetlist() {
			service.getList().forEach( n -> log.info(n));
		}
		
		@Test
		public void testGet() { //리턴된 ReviewVO 확인
			log.info(service.get(7L));
		}
		
		@Test
		public void testUpdate() {
			ReviewVO vo = service.get(3L);
			
			if (vo == null) {
				return;
			}
			
			vo.setTitle("게시물 수정요청");
			log.info("수정============>" + service.modify(vo));
			
		}
		
		@Test
		public void testDelete() {
			
			log.info("삭제=================>" + service.remove(3L));
		}

}
