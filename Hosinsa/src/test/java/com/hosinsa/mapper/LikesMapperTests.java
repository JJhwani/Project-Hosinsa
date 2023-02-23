package com.hosinsa.mapper;

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
public class LikesMapperTests {
	
	@Autowired
	LikesMapper mapper;
	
	@Test
	public void testInsert() {
		LikesVO vo = new LikesVO();
		
		vo.setLno(2L);
		vo.setPronum(1201415);
		vo.setId("admin");
		
		log.info("insert===========" + vo);
		
		mapper.insert(vo);

	}
}
