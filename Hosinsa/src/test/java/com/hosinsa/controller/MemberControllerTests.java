package com.hosinsa.controller;

import java.sql.Date;
import java.time.LocalDate;

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

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberControllerTests {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/hosinsa/member/list"))
						.andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testGet() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/hosinsa/member/get")
						.param("id", "member"))
						.andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testModify() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/hosinsa/member/modify")
						.param("id", "member1")
						.param("pw", "1234")
						.param("name", "이은혜")
						.param("gender", "여자")
						.param("birthday", "19990101")	
						.param("email", "1234@hosinsa.com")
						.param("phone", "010-1234-5678")
						.param("nickname", "eeee")
						.param("grade", "C"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testJoin() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/hosinsa/member/join")
				.param("id", "member2")
				.param("pw", "1234")
				.param("name", "정재환")
				.param("gender", "남자")
				.param("birthday", "19880101")	
				.param("email", "1234asd@hosinsa.com")
				.param("phone", "010-1234-5678")
				.param("nickname", "aaaa")
				.param("grade", "C")
				.param("introducer", "Admin"))
		.andReturn().getModelAndView().getViewName();
log.info(resultPage);
	}
}
