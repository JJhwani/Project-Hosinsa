package com.hosinsa.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

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
		
		return "category";
	}
	
	//@PostMapping(value="/searchProduct")
	@GetMapping(value="/search/sorting")
	public String searchProduct(String sort, String keyword, ProductVO vo, Model model) {
		int total = 0;
		switch(sort) {
			case "best" : model.addAttribute("viewList", service.getSortBestSearch(vo));
				break;
			case "new" : model.addAttribute("viewList", service.getSortNewSearch(vo));
				break;
			case "lowPrice" : model.addAttribute("viewList", service.getSortLowPriceSearch(vo));
				break;
			case "highPrice" : model.addAttribute("viewList", service.getSortHighPriceSearch(vo));
				break;
			case "review" : model.addAttribute("viewList", service.getSortReviewSearch(vo));
				break;
			case "" : model.addAttribute("viewList", service.getSortBestSearch(vo));
				break;
		}

		total = service.getTotalCountSearch(vo);
		
		model.addAttribute("sort", sort);
		model.addAttribute("pageMaker", new PageDTO(vo, total));	
		
		return "search";
	}
	
	@GetMapping("/product/{pronum}")
	public String get(@PathVariable int pronum,@ModelAttribute("recentView")List<ProductVO> recentView,  Model model) {		
		
		//조회수 up+1
		service.updateView(pronum);		
		model.addAttribute("product", service.getProductByPronum(pronum));	
		
		//최근 본 상품 기능
		//pronum을 받아 최근 본 최근 본 상품으로 추가
		ProductVO current = service.getProductByPronum(pronum);
		//중복제거
		int index = 0;
		for(ProductVO item : recentView){
			if(item.getPronum()==current.getPronum()) {
				recentView.remove(index);
				break;
			}
			index++;
	    }
		recentView.add(current);
				
		//최근 4개 자르기
		if(recentView.size()>4) {
			recentView = recentView.subList(1,5);
		}
		//세션에 저장
		model.addAttribute("recentView",recentView);	
		
		return "product";		
	}
}
