package com.hosinsa.controller;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public String mainPage(ProductVO vo, String sort, Model model) {
		model.addAttribute("viewList", service.getListProview(vo));
		model.addAttribute("bestList", service.getListBest());
		model.addAttribute("newList", service.getListNew());
		model.addAttribute("category", "인기");
		model.addAttribute("sort", "");

		int total = service.getTotalCountView(vo);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "main";
	}
	
	@GetMapping(value="/category")
	public String categoryPage(@RequestParam("category") String category, ProductVO vo, Model model) {
		
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
	
	@GetMapping(value="/category/sorting")
	public String categoryPageSorting(String sort, String category, ProductVO vo, Model model) {
		int total = 0;
		log.info("category : "+category+"sort : "+sort);
		if(category.equals("인기")) {
			switch(sort) {
				case "best" : model.addAttribute("viewList", service.getSortBestMain(vo));
						break;
				case "new" : model.addAttribute("viewList", service.getSortNewMain(vo));
						break;
				case "lowPrice" : model.addAttribute("viewList", service.getSortLowPriceMain(vo));
						break;
				case "highPrice" : model.addAttribute("viewList", service.getSortHighPriceMain(vo));
						break;
				case "review" : model.addAttribute("viewList", service.getSortReviewMain(vo));
						break;
				case "" : model.addAttribute("viewList", service.getListProview(vo));
						break;
			}
			total = service.getTotalCountView(vo);
		}

		else {
			switch(sort) {
				case "best" : model.addAttribute("viewList", service.getSortBest(vo));
					break;
				case "new" : model.addAttribute("viewList", service.getSortNew(vo));
					break;
				case "lowPrice" : model.addAttribute("viewList", service.getSortLowPrice(vo));
					break;
				case "highPrice" : model.addAttribute("viewList", service.getSortHighPrice(vo));
					break;
				case "review" : model.addAttribute("viewList", service.getSortReview(vo));
					break;
				case "" : model.addAttribute("viewList", service.getListCategory(vo));
					break;
			}
			total = service.getTotalCount(vo);
		}

		model.addAttribute("category", category);
		model.addAttribute("sort", sort);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		
		return "main";
	}
	
	@GetMapping("/product/{pronum}")
	public String get(@PathVariable int pronum,Model model) {		
		
		model.addAttribute("product", service.getProductByPronum(pronum));	
		
		return "product";		
	}
	



}
