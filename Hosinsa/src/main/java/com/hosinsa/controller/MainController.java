package com.hosinsa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.PageDTO;
import com.hosinsa.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@Autowired
	MainService service;

	@GetMapping("/")
	public String mainPage(Criteria cri, Model model) {
		model.addAttribute("viewList", service.getListProview());
		model.addAttribute("bestList", service.getListBast());
		model.addAttribute("newList", service.getListNew());

		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "main";
	}
	
	@GetMapping("/product/{pronum}")
	public String get(@PathVariable int pronum,Model model) {		
		
		model.addAttribute("product", service.getProductByPronum(pronum));	
		
		return "product";		
	}
	
	

	@GetMapping("/category")
	public String mainCategoryPage(Criteria cri, Model model) {
		model.addAttribute("viewList", service.getListCategory());
		model.addAttribute("bestList", service.getListBast());
		model.addAttribute("newList", service.getListNew());
		
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "main";
}



}
