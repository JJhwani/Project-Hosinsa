package com.hosinsa.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ 
"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class QnaControllerTests {

	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before 
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	} 
	
	@Test
	public void testList() throws Exception { 
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/qna/list"))
		.andReturn()
        .getModelAndView()
        .getModelMap());
	}

	@Test
	public void testRegister() throws Exception { 
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/qna/register")
		.param("qcategory", "상품문의") 
        .param("qtitle", "사이즈 문의합니다.") 
		.param("qcontent", "프리 사이즈인가요?")
        .param("id", "홍길동")
		).andReturn().getModelAndView().getViewName(); 
		
		log.info(resultPage);
	}

	@Test
	public void testGet() throws Exception { 
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/qna/get")
        .param("qno", "2")) 
		.andReturn()
        .getModelAndView().getModelMap());
	}

	@Test
	public void testModify() throws Exception { 
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/qna/modify")
    	.param("qno", "2")
    	.param("qcategory","상품문의")
		.param("qtitle", "상품문의 합니다.")
    	.param("qcontent", "화이트 컬러 재입고 언제되나요?"))
		.andReturn().getModelAndView().getViewName(); 
		
		log.info(resultPage);
	}

	@Test
	public void testRemove() throws Exception {
 		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/qna/remove")
        .param("qno", "6")
		).andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testListPaging() throws Exception { 
 		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/qna/list")
 		        .param("pageNum", "2")
 		        .param("amount", "50"))
 				.andReturn().getModelAndView().getModelMap());
	}
}
