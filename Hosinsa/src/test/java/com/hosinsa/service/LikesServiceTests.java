package com.hosinsa.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hosinsa.domain.LikesVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LikesServiceTests {
	
		@Autowired
		LikesService service;
		
		
		@Test
		public void test() {
			log.info("============>" + service);
		}
		
		@Test
		public void testRegister() {
			LikesVO vo = new LikesVO();
			
			vo.setLno(3L);
			vo.setPronum(2711880);
			vo.setId("admin");
			
			service.register(vo);
			
			log.info("생성된 게시물 번호=============>" + vo.getLno());
			
		}
		
		@Test
		public void testDelete() {
			
			log.info("삭제=================>" + service.remove(3L));
		}
	
		@Test
		public void testgetProList() {
			
			//무조건 변수를 선언해서 테스트 진행해야 함
			int pro = 1201415;
			
			log.info("getProList=========" + service.getProList(pro));
		}
		
		@Test
		public void testgetMyList() {
			
			LikesVO vo = new LikesVO();
			vo.setId("admin");
			log.info("getMyList=========" + service.getMyList(vo));
		}
		
		@Test
		public void testgetBylnowithUser() {
			
			long lno =1;
			
			log.info("getProList=========" + service.getBylnowithUser(lno));
		}

}
