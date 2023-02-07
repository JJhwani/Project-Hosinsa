package com.hosinsa.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hosinsa.domain.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CrawlingServiceTests {

	@Autowired
	public CrawlingService service;
	
	List<ProductVO> list = new ArrayList<ProductVO>();
	
	@Test
	public void testCrawling() {
		ProductVO vo = new ProductVO();
		vo.setCategory("아우터");
		vo.setProname("상호점퍼");
		vo.setProimg("img_201050");
		vo.setBrand("상호패션");
		vo.setPronum(201050);
		vo.setPrice(25000);
		vo.setStock(38);
		vo.setProview(50);
		vo.setDetail("src://");
		list.add(vo);
		//log.info(list);
		
		service.crwaling(list);

	}
}
