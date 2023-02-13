package com.hosinsa.service;

import static org.junit.Assert.assertNotNull;

import java.sql.Date;
import java.time.LocalDate;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hosinsa.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {

	@Autowired
	private MemberService memberService;
	
	@Test
	public void testExist() {
		log.info(memberService);
		assertNotNull(memberService);
	}
	
	@Test
	public void testJoin() {
//		LocalDate localdate = LocalDate.of(1999, 01, 01);
//		Date birthday = Date.valueOf(localdate);
		
		MemberVO member = new MemberVO();
		member.setId("member111");
		member.setPw("1234");
		member.setName("정재환");
		member.setGender("남자");
		member.setBirthday("19990101");
		member.setEmail("abc@hosinsa.com");
		member.setPhone("010-1111-1111");
		member.setNickname("kikkk");
		member.setProfilimg("");
		member.setGrade("C");
		member.setIntroducer("");

		memberService.join(member);
		log.info(member);
	}
	
	@Test
	public void testGetList() {
		memberService.getList().forEach(member -> log.info(member));
	}
	
	@Test
	public void testRead() {
		log.info(memberService.get("member"));
	}
	
	
	@Test
	public void testModify() {
		MemberVO member = memberService.get("member1");
		
		if(member == null) {
			return;
		}
		
		member.setEmail("sdfsdfd@naver.com");
		log.info("MODIFY RESULT : " + memberService.modify(member));
		log.info("나여기 까지 옴");
	}
	
	
	@Test
	public void testRemove() {
		log.info("REMOVE RESULT : " + memberService.remove("member2"));
	}
}
