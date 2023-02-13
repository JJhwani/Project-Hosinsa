package com.hosinsa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hosinsa.domain.Criteria;
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
	public void adminProList(Model model,Criteria cri){
		int total = mainService.getTotalCountView(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		cri.setAmount(10);
		model.addAttribute("product",mainService.getListProview(cri));
	}
	
	@GetMapping("/category")
	public String adminCategory(Model model,Criteria cri,@RequestParam("category") String category) {
		model.addAttribute("category",category);
		cri.setAmount(10);
		int total = mainService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("product",mainService.getListCategory(cri));
		
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
	
	@GetMapping("/register")
	public void adminRegisterForm() {
		
	}
	
}
