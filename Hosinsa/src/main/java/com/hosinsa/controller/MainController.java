package com.hosinsa.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String mainPage(Criteria cri, Model model) {
		model.addAttribute("viewList", service.getListProview(cri));
		model.addAttribute("bestList", service.getListBest());
		model.addAttribute("newList", service.getListNew());

		int total = service.getTotalCountView(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "main";
	}
	
	@GetMapping(value="/category")
	public String mainCategoryPage(@Param("category") String category, Criteria cri, Model model) {
		int total = 0;
		if(category.equals("인기")) {
			model.addAttribute("viewList", service.getListProview(cri));
			model.addAttribute("bestList", service.getListBest());
			model.addAttribute("newList", service.getListNew());
			total = service.getTotalCountView(cri);
		}
		else {
			model.addAttribute("viewList", service.getListCategory(cri));
			model.addAttribute("bestList", service.getListBest());
			model.addAttribute("newList", service.getListNew());
			total = service.getTotalCount(cri);
		}
		
		log.info("--------------------------------------dasdfaSDf"+category);
		log.info("--------------------------------------dasdfaSDf"+cri);
		model.addAttribute("category", category);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "main";
}



}
