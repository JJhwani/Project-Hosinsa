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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hosinsa.domain.MemberVO;
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
	
	@PostMapping("/order_form")
	public String order(HttpSession session, @RequestParam("valueArr") List<Integer> valueArr,
		Model model, @ModelAttribute("member") MemberVO member) {
		log.info("order________________"); 
		log.info(valueArr); 
		
		model.addAttribute("order",service.getOrder(valueArr));
		
		return "/order/order_form";
	}
	
	@GetMapping("/order_form")
	public void orderPage(Model model) {
		
	}
}