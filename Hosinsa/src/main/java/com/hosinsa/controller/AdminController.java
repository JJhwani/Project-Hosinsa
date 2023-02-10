package com.hosinsa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		vo.setAmount(10);
		model.addAttribute("product",mainService.getListProview(vo));
	}
	
	@GetMapping("/category")
	public String adminCategory(Model model,ProductVO vo,@RequestParam("category") String category) {
		model.addAttribute("category",category);
		vo.setAmount(10);
		int total = mainService.getTotalCount(vo);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		model.addAttribute("product",mainService.getListCategory(vo));
		
		return "admin/product";
	}
	
	@GetMapping("/modify")
	public void adminModifyForm(Model model,int pronum) {
		model.addAttribute("product",mainService.getProductByPronum(pronum));		
	}
	
	@PostMapping("/modify")
	public String adminModify(ProductVO vo,RedirectAttributes rttr) {
		if(adminService.modify(vo)) {
			rttr.addFlashAttribute("modify","success");
		}		
		return "redirect:/admin/product"; 
	}
	
	@GetMapping("/delete")
	public String adminRemove(int pronum,RedirectAttributes rttr) {
		if(adminService.remove(pronum)) {
			rttr.addFlashAttribute("remove","success");
		}	
		return "redirect:/admin/product";
	}
	
}
