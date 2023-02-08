package org.ezen.controller;

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

@WebAppConfiguration //WebApplicationContext를 이용하기 위해
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ 
"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class NoticeControllerTests {

	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before //모든 테스트 전에 매번 실행되는 메서드
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	} //MockMvc 가짜mvc로 URL과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어서 Controller를 실행할 수 있음

	@Test
	public void testList() throws Exception { //목록
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/notice/list")
        .param("pageNum", "3")
        .param("amount", "15"))
		.andReturn()
        .getModelAndView()
        .getModelMap());
	}

	@Test
	public void testRegister() throws Exception { //등록
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/notice/register")
        .param("ntitle", "테스트 새글 제목") //param을 이용해서 전달해야 하는 파라미터들을 지정할 수 있음
		.param("ncontent", "테스트 새글 내용")
        .param("id", "user00"))
		.andReturn().getModelAndView().getModelMap()); 
	}

	@Test
	public void testGet() throws Exception { //조회
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/notice/get")
        .param("nno", "2")) 
		.andReturn()
        .getModelAndView().getModelMap());
	}

	@Test
	public void testModify() throws Exception { //수정
    	log.info(mockMvc.perform(MockMvcRequestBuilders.post("/notice/modify")
    	.param("nno", "2")
		.param("ntitle", "수정 제목")
    	.param("ncontent", "수정 내용"))
		.andReturn().getModelAndView().getModelMap());
	}

	@Test
	public void testRemove() throws Exception { //삭제
 	//삭제 전 데이터베이스에 게시물번호 확인할 것
 		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/notice/remove")
        .param("nno", "21")
		).andReturn().getModelAndView().getModelMap());
	}
}
