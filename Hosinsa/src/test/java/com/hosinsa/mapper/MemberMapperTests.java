package com.hosinsa.mapper;

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
public class MemberMapperTests {

	@Autowired
	private MemberMapper memberMapper;
	
	// 리스트 불러오기
	@Test
	public void testGetLIst() {
		memberMapper.getList().forEach(member -> log.info(member));
	}
	
	// Create
	@Test
	public void testInsert() {
		LocalDate localdate = LocalDate.of(1999, 01, 01);
		Date birthday = Date.valueOf(localdate);
		
		MemberVO member = new MemberVO();
		member.setId("member2");
		member.setPw("1234");
		member.setName("정재환");
		member.setGender("남자");
		member.setBirthday(birthday);
		member.setEmail("abc@hosinsa.com");
		member.setPhone("010-1111-1111");
		member.setNickname("kikkk");
		member.setProfilimg("");
		member.setGrade("C");
		member.setIntroducer("");
		
		memberMapper.insert(member);
		log.info(member);
	}
	
	// Read
	@Test
	public void testRead() {
		MemberVO member = memberMapper.read("admin");
		log.info(member);
	}
	
	// Delete
	@Test
	public void testDelete() {
		log.info("DELETE COUNT : " + memberMapper.delete("member2"));
	}
	
	//Update
	@Test
	public void testUpdate() {
		LocalDate localdate = LocalDate.of(1997, 01, 01);
		Date birthday = Date.valueOf(localdate);
		
		MemberVO member = new MemberVO();
		member.setId("member1");
		member.setPw("1234");
		member.setName("이은혜");
		member.setGender("여자");
		member.setBirthday(birthday);
		member.setEmail("abcd@hosinsa.com");
		member.setPhone("010-2222-1111");
		member.setNickname("eeee");
		member.setProfilimg("");
		member.setGrade("C");
		member.setIntroducer("");
		
		int count = memberMapper.update(member);
		log.info("UPDATE COUNT : " + count);
	}
}
