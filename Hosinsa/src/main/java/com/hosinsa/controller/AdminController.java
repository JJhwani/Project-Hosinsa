package com.hosinsa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hosinsa.domain.PageDTO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.service.AdminService;
import com.hosinsa.service.MainService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/member")
	public void adminMemberList(Model model) {
		
	}
	
	@GetMapping("/product")
	public void adminProList(Model model,ProductVO vo){
		int total = mainService.getTotalCountView(vo);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		model.addAttribute("product",mainService.getListProview(vo));
	}
	
}
