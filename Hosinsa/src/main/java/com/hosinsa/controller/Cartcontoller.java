package com.hosinsa.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hosinsa.domain.CartVO;
import com.hosinsa.domain.MemberVO;
import com.hosinsa.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*")
@AllArgsConstructor
public class Cartcontoller {
	
	@Autowired
	private CartService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list.............");
		model.addAttribute("list", service.getList());
	
	}
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
	 log.info("delete cart");
        
		MemberVO member = (MemberVO)session.getAttribute("member");
		 String userId = member.getId();
		 
		 int result = 0;
		 int cartNum = 0;
		 
		 
		 if(member != null) {
		  cart.setId(userId);
		  
		  for(String i : chArr) {   
		   long cartNumber = Long.valueOf(i);
		   cart.setCartnum(cartNumber);
		   service.deleteCart(cart);
		  }
		  result = 1;
		 }  
		 return result;  
		}
	
	@GetMapping("/get")
	public void get(@RequestParam("pronum") long pronum, Model model) {
		log.info("get.............");
		model.addAttribute("get", service.get(pronum));
	}
	
	@GetMapping("/order")
	public void order(Model model) {
		log.info("order.............");
		model.addAttribute("order", service.getList());
	}
	
    
	
}