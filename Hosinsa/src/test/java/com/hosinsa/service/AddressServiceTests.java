package com.hosinsa.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hosinsa.controller.MemberControllerTests;
import com.hosinsa.domain.MemberAddressVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AddressServiceTests {

	@Autowired
	private AddressService addressService;
	
	@Test
	public void testExist() {
		log.info(addressService);
		assertNotNull(addressService);
	}
	
	@Test
	public void testRegister() {
		MemberAddressVO address = new MemberAddressVO();
		address.setId("member2");
		address.setAddress("경기 수원시 팔달구 덕영대로 899 3F");
		address.setZipcode(15555);
		
		addressService.register(address);
		log.info(address.getAddress_no());
	}
	
	@Test
	public void testHetList() {
		addressService.getList().forEach(address -> log.info(address));
	}
	
	@Test
	public void testGet() {
		log.info(addressService.get(1L));
	}
	
	@Test
	public void testRemove() {
		log.info("REMOVE RESULT : " + addressService.remove(10L));
	}
	
	@Test
	public void testModify() {
		MemberAddressVO address = addressService.get(10L);
		
		if (address == null) {
			return;
		}
		address.setId("member2");
		address.setAddress("경기 수원시 팔달구 덕영대로 111 3F");
		address.setZipcode(12345);
		log.info("MODIFY RESULT : " + addressService.modify(address));
	}
}
