package com.hosinsa.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)
	public void favicon( HttpServletRequest request, HttpServletResponse reponse ) {
	try {
	  reponse.sendRedirect("/resources/favicon.ico");
	} catch (IOException e) {
	  e.printStackTrace();
	}
	}
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list.............");
		model.addAttribute("list", service.getList());
	
	}
	
	@PostMapping(value = "/deleteCart")
	public String deleteCart(int[] cartnum, HttpServletRequest request) {
		log.info("delete Cart =============");
		
		int size = cartnum.length;
		
		for(int i=0; i<size;i++) {
			service.deleteCart(cartnum[i]);
		}
		
		return "redirect:/cart/list";
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