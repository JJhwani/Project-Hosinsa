package com.hosinsa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hosinsa.domain.MemberAddressVO;
import com.hosinsa.service.MemberAddressService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/address/*")
@Log4j
public class MemberAddressController {
	
	@Autowired
	MemberAddressService service;
	
	// 이벤트 게시판
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/list")
	public String addressList(MemberAddressVO vo, Model model) {
		model.addAttribute("address", vo);
		return "/cart/address";		
		
	}
}
