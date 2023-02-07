package hosinsa.controller;


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
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	               "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class ReviewControllerTests {
	
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
				mockMvc.perform(MockMvcRequestBuilders.get("/review/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	
	@Test
	public void testRegister() throws Exception {
		String resulitPage = mockMvc.perform(MockMvcRequestBuilders.post("/review/register")
				.param("title", "배송문의")
				.param("content", "언제 배송오나요!!!!!")
				.param("nickname", "예찬")
			).andReturn().getModelAndView().getViewName();
		
			log.info(resulitPage);
				
	}
	
	@Test
	public void testGet() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders
					.get("/review/get")
					.param("bno", "2"))
					.andReturn()
					.getModelAndView().getModelMap()); 
				
	}
	
	@Test
	public void testModify() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/review/modify")
				.param("bno","8")
				.param("title", "배송 취소해주세요")
				.param("content", "배송이 넘 늦네여")
				.param("nickname","예찬"))
				.andReturn().getModelAndView().getViewName();
				
		log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/review/remove")
				.param("bno", "7")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}

}
