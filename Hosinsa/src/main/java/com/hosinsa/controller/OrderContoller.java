package com.hosinsa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.BoardCriteria;
import com.hosinsa.domain.BoardPageDTO;
import com.hosinsa.domain.MemberAddressVO;
import com.hosinsa.domain.MemberVO;
import com.hosinsa.service.MemberAddressService;
import com.hosinsa.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/order/*")
@SessionAttributes("member")
@AllArgsConstructor
public class OrderContoller {

	@Autowired
	private OrderService service;
	
	@Autowired
	MemberAddressService addService;
	
	@PostMapping("/order_form")
	public String order(HttpSession session, @RequestParam("valueArr") List<Integer> valueArr,
			MemberAddressVO address, Model model, @ModelAttribute("member") MemberVO member, String id, BoardCriteria cri) {
		log.info("order________________"); 
		log.info(valueArr); 
		model.addAttribute("order",service.getOrder(valueArr));

		int total = addService.getTotalCountAddress(address);
		model.addAttribute("total", total);
		model.addAttribute("shipping", addService.getListOrder(address));
		model.addAttribute("address", addService.readBasic(address));
		
		return "/order/order_form";
	}
	
	@GetMapping("/order_form")
	public void orderPage(Model model) {
		
	}
	
	@PostMapping("/address")
	public String address(HttpSession session, MemberAddressVO address, BoardCriteria cri,Model model) {
		if(addService.registerSelectKey(address)) {
			model.addAttribute("register","success");
		}		
		
		int total = addService.getTotalCountAddress(address);
		model.addAttribute("shipping", addService.getListOrder(address));
		model.addAttribute("pageMaker_b", new BoardPageDTO(cri, total));
		
		return "/order/address";
	}
	
	@RequestMapping(method= {RequestMethod.GET, RequestMethod.POST}, value="/address/registerForm")
	public String addressRegisterForm(HttpSession session, MemberAddressVO address, Model model) {
		return "/order/addressRegister";
	}
	
	@PostMapping("/address/register")
	public String addressRegister(HttpSession session, MemberAddressVO address, BoardCriteria cri, Model model) {
		if(addService.registerSelectKey(address)) {
			model.addAttribute("register","success");
		}		
		
		int total = addService.getTotalCountAddress(address);
		model.addAttribute("shipping", addService.getListOrder(address));
		model.addAttribute("pageMaker_b", new BoardPageDTO(cri, total));
		
		return "/order/address";
	}
	
	
	@PostMapping("/address/modifyForm")
	public String addressModifyForm(HttpSession session, MemberAddressVO address, Model model) {
		
		
		return "/order/addressModify";
	}
}
