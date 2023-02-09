package com.hosinsa.controller;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.PageDTO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@Autowired
	MainService service;

	@GetMapping("/")
	public String mainPage(ProductVO vo, Model model) {
		model.addAttribute("viewList", service.getListProview(vo));
		model.addAttribute("bestList", service.getListBest());
		model.addAttribute("newList", service.getListNew());
		model.addAttribute("category", "인기");

		int total = service.getTotalCountView(vo);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "main";
	}
	
	@GetMapping(value="/category")
	public String mainCategoryPage(@RequestParam("category") String category, ProductVO vo, Model model) {
		
		int total = 0;
		if(category.equals("인기")) {
			model.addAttribute("viewList", service.getListProview(vo));
			model.addAttribute("bestList", service.getListBest());
			model.addAttribute("newList", service.getListNew());
			total = service.getTotalCountView(vo);
		}
		else {
			model.addAttribute("viewList", service.getListCategory(vo));
			model.addAttribute("bestList", service.getListBest());
			model.addAttribute("newList", service.getListNew());
			total = service.getTotalCount(vo);
		}

		model.addAttribute("category", category);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		
		return "main";
}



}
