package com.hosinsa.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestContextListener;

import com.hosinsa.domain.Criteria;
import com.hosinsa.domain.PageDTO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes({"recentView"})
@Log4j
public class MainController {

	@Autowired
	MainService service;

	@ModelAttribute("recentView")
	public List<ProductVO> setEmptyRecentView() {
	    return new ArrayList<ProductVO>();
	}
	
	@GetMapping("/")
	public String mainPage(@ModelAttribute("recentView")List<ProductVO> recentView,Criteria cri, Model model) {
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
	
	@GetMapping("/product/{pronum}")
	public String get(@PathVariable int pronum,@ModelAttribute("recentView")List<ProductVO> recentView,Model model) {		
		
		model.addAttribute("product", service.getProductByPronum(pronum));
		
		//최근 본 상품 기능
		//pronum을 받아 최근 본 최근 본 상품으로 추가
		ProductVO current = service.getProductByPronum(pronum);
		recentView.add(current);
		Collections.reverse(recentView);
		//과거 4개 중 중복 있으면 제거
		recentView = recentView.stream().distinct().collect(Collectors.toList());
		Collections.reverse(recentView);
		//최근 4개 자르기
		if(recentView.size()>4) {
			recentView = recentView.subList(1,5);
		}
		//세션에 저장
		model.addAttribute("recentView",recentView);
		
		return "product";		
	}
	



}
