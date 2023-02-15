package com.hosinsa.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hosinsa.domain.MemberAddressVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AddressMapperTests {

	@Autowired
	private AddressMapper addressMapper;
	
	@Test
	public void testGetList() {
		addressMapper.getList().forEach(address -> log.info(address));
	}
	
	@Test
	public void testInsert() {
		MemberAddressVO address = new MemberAddressVO();
		address.setId("member1");
		address.setAddress("경기 수원시 팔달구 덕영대로 899 3F");
		address.setZipcode(15555);
		
		addressMapper.insert(address);
		log.info(address);
	}
	
	@Test
	public void testInsertSelectKey() {
		MemberAddressVO address = new MemberAddressVO();
		address.setId("member2");
		address.setAddress("경기 수원시 팔달구 덕영대로 899 3F");
		address.setZipcode(15555);
		
		addressMapper.insertSelectKey(address);
		log.info(address);
	}
	
	@Test
	public void testRead() {
		MemberAddressVO address = addressMapper.read(9L);
		log.info(address);
	}
	
	@Test
	public void testDelete() {
		log.info("DELTEE COUNT : " + addressMapper.delete(9L));
	}
	
	@Test
	public void testUpdate() {
		MemberAddressVO address = new MemberAddressVO();
		address.setAddress_no(3L);
		address.setId("member1");
		address.setAddress("경기 수원시 팔달구 덕영대로 000 3F");
		address.setZipcode(18888);
		
		int count = addressMapper.update(address);
		log.info("UPDATE COUNT : " + count);
	}
}
