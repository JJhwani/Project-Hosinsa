package com.hosinsa.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hosinsa.domain.CartVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTest {

	@Autowired
	CartMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(cart -> log.info(cart));
	}
	
	
	@Test
	public void testInsert() {
		CartVO vo = new CartVO();
		vo.setPronum(1L);
		vo.setId("sangho");
		vo.setQuantity(43L);
		vo.setPrice(35500L);
		vo.setProname("가죽자켓");
		vo.setSale("0");
		mapper.insert(vo);
		log.info(vo);
	}
	
}
